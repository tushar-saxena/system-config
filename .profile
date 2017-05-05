# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/intelligrape/.sdkman"
[[ -s "/home/intelligrape/.sdkman/bin/sdkman-init.sh" ]] && source "/home/intelligrape/.sdkman/bin/sdkman-init.sh"



# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#paths

#export JAVA_HOME=/opt/java-library
export JAVA_HOME=/opt/jdk1.8.0_92
export JAVA_OPTS="-XX:MaxPermSize=512m -Xms712m -Xmx1700m -server"
export GROOVY_HOME=/opt/groovy-library
export GRAILS_HOME=/opt/grails-library
export SCALA_HOME=/opt/scala-library
export M3_HOME=/home/intelligrape/.sdkman/candidates/maven/current
export IDEA_HOME=/opt/idea-IU
export NODE_HOME=/opt/nodejs
export ANDROID_STUDIO_HOME=/opt/android-studio
export CATALINA_HOME=/opt/apache-tomcat-7.0.69
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules

export PATH=$JAVA_HOME/bin:$PATH
export PATH=$PATH:$GROOVY_HOME/bin
export PATH=$PATH:$GRAILS_HOME/bin
export PATH=$PATH:$SCALA_HOME/bin
export PATH=$PATH:$IDEA_HOME/bin
export PATH=$PATH:$NODE_HOME/bin
export PATH=$PATH:$ANDROID_STUDIO_HOME/bin
export PATH=$PATH:~/bin

#alias

#alias idea="sh /opt/idea-IU/bin/idea.sh"
alias go="gnome-open"
alias install="sudo apt-get install"
alias unmount="sudo udisks --unmount"
alias detach="sudo udisks --detach"
alias cclip='xclip -selection clipboard'
alias clipp='xclip -selection clipboard -o'
alias ymp3='youtube-dl --extract-audio --audio-format mp3'
alias networkrestart='sudo /etc/init.d/network-manager restart'
alias convertCamelCase="sed -e 's/\([A-Z]\)/_\L\1/g' -e 's/^_//'  <<< "

#grails
#alias gcrap="grails clean;grails run-app"
#alias grap="grails run-app"
#alias gsap="grails stop-app"
#alias gdebug="grails -reloading run-app --debug-fork"
#alias killgrails="pgrep -f  grails | xargs kill -9"
alias gkill="pkill -9 -f grails"

#git
#alias gb="git branch"
#alias gchk="git checkout"
#alias gm="git merge"
#alias gs="git status"
#alias gl="git pull"
#alias gp="git push"
#alias gc="git commit"
#alias gst="git stash"

#gradle
alias run="./gradlew bootRun"
alias runc="./gradlew clean bootRun"

#create-drop-database
function createDrop() {
	EXPECTED_ARGS=1
	E_BADARGS=65
	if [ $# -ne $EXPECTED_ARGS ]
	then
		echo "Usage: createDrop [DATABASE_NAME]"
	else
		echo drop database $1";" > /tmp/createDropDB.sql
		mysql --user=root --password=igdefault < /tmp/createDropDB.sql
		echo create database $1";" > /tmp/createDropDB.sql
		mysql --user=root --password=igdefault < /tmp/createDropDB.sql
		rm -rf /tmp/createDropDB.sql
	fi
}

#sql
alias sql="mysql -u root -pigdefault"
alias sqldump="mysqldump -u root -pigdefault micar_dev > database.sql"
alias sqlrestore="mysql -u root -pigdefault micar_dev < database.sql"


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export MONGO_OPLOG_URL=mongodb://localhost:27017/local


