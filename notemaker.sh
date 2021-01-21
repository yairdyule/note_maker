#! /bin/sh
clear

#take input for whichever class we're in
echo "what class are we taking notes for? (1-4)"
echo "1) Software Dev"
echo "2) Mountain Geography"
echo "3) Fundamentals of Human Computer Interaction"
echo "4) Database Systems"
echo "5) miscellaneous"
read NUM

#switch statement to switch to appropriate directory based on input
case $NUM in 
    "1") 
        CLASS="3308"
        cd "/Users/jaredjewell/Desktop/Spring 2021/3308 - Software Dev/notes"
    ;;

    "2") 
        CLASS="Mtn_Geo"
        cd "/Users/jaredjewell/Desktop/Spring 2021/Mtn. Geo/notes"
    ;;

    "3") 
        CLASS="3002"
        cd "/Users/jaredjewell/Desktop/Spring 2021/3002 - HCI/notes"
    ;;

    "4") 
        CLASS="3287"
        cd "/Users/jaredjewell/Desktop/Spring 2021/3287 - Database Systems/notes"
    ;;
    "5")
        cd "/Users/jaredjewell/Desktop/Spring 2021/misc"
    ;;
    *) ;;
esac

DATE=`date +_%m_%d_%y` #date for naming the file
DATER=`date '+%A, %B %d %Y'` #date to include in the file

sleep 1

echo "And what will you be taking notes on?"
read TOPIC
NOTE_NAME="$TOPIC$DATE" #create name in the format of TOPIC_m_d

#if a directory for today's notes already exists
if [ ! -d "$notes$DATE" ]; then
    mkdir "notes$DATE" > nul 2> nul #redirect errors & warnings to nul
fi



cd "notes$DATE" #change to today's notes directory


#if today's .tex file doesn't exist, make one
#otherwise, let the user know one already exists
if [ ! -f "$NOTE_NAME.tex" ]; then
cat <<EOF > $NOTE_NAME.tex
\documentclass[12pt]{article}
\usepackage[top=.25in, bottom=1.25in, left=.25in, right=.5in]{geometry}


\begin{document}
    \title{$TOPIC notes <3}
    \author{Jared Jewell}
    \date{$DATER}
    \maketitle
    
\subsection*{This Section}
Here's a list with aesthetically-spaced items.

\vspace{-2mm}
\begin{itemize} \setlength\itemsep{-0.2em}
    \item Enjoy
    \item Taking
    \item Notes
\end{itemize}


\end{document}
EOF

else
    printf 'Already takin'"'"' notes today.. add on to those!'
fi

code . #open VScode in today's notes directory & enjoy!
