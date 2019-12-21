\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{WoDTeX}[2018/07/06 World of Darkness LaTeX]
\LoadClass[a4paper,twocolumns,oneside]{book}

\usepackage{xcolor}
\definecolor{coverGold}{RGB}{235,186,118}
\DeclareOption{ngerman}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{german}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{english}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{LQ}{\providecommand{\isLQ}{_LQ}}
\DeclareOption{HQ}{\providecommand{\isLQ}{}}
\DeclareOption{Vampire}{
	\providecommand{\genrePath}{Vampire}
	\providecommand{\genreFont}{Delavan}
	\providecommand{\genreFrontTextColor}{black!10}
	\providecommand{\genreGeometryTop}{2.5cm}
	\providecommand{\genreGeometryBottom}{3.5cm}
	\providecommand{\genreGeometryInner}{2.5cm}
	\providecommand{\genreGeometryOuter}{2.5cm}
	\providecommand{\genreChapterSpacing}{6cm}
	\providecommand{\genreChapTitlePos}{.38\paperwidth,-.31\paperheight}
	\providecommand{\genreCreditsPos}{.352\paperwidth,-.404\paperheight}
}%end of Vampire Specifics
\DeclareOption{Werewolf}{
	\providecommand{\genrePath}{Werewolf}
	\providecommand{\genreFont}{Balthazar}
	\providecommand{\genreFrontTextColor}{coverGold}	
	\providecommand{\genreGeometryTop}{2cm}
	\providecommand{\genreGeometryBottom}{3cm}
	\providecommand{\genreGeometryInner}{2cm}
	\providecommand{\genreGeometryOuter}{2cm}
	\providecommand{\genreChapterSpacing}{5cm}
	\providecommand{\genreChapTitlePos}{.405\paperwidth,-.325\paperheight}
	\providecommand{\genreCreditsPos}{.38\paperwidth,-.42\paperheight}
}%end of WerewolfSpecifics



\ProcessOptions\relax
\ExecuteOptions{ngerman,LQ,Werewolf}%setting Default
\usepackage{babel}
\usepackage{wodGlyphs}
\usepackage{eso-pic}
\usepackage[a4paper,top=\genreGeometryTop, bottom=\genreGeometryBottom, outer=\genreGeometryOuter, inner=\genreGeometryInner]{geometry}
\usepackage{hyperref}
\usepackage{graphicx}
\usepackage{wrapfig}
\usepackage{ amssymb }
\usepackage{amsmath}
\usepackage{mwe,tikz}
\usetikzlibrary{calc}
\usepackage{fontspec}
\usepackage{sectsty}
\usepackage[outline]{contour}% http://ctan.org/pkg/contour
\defaultfontfeatures{Mapping=tex-text,Scale=MatchLowercase}
\usepackage{textcomp}
\usepackage{blindtext} %only needed for testing
\usepackage{background}
\usepackage{intcalc}
\usepackage{calc}
\usepackage{fmtcount}
\usepackage{titlesec}
%\usepackage{enumerate}
\usepackage{enumitem}
\usepackage[percent]{overpic}
\usepackage{relsize}
\usepackage[most]{tcolorbox}
\usepackage{shapepar}
\usepackage{microtype}
\usepackage{wasysym}
\usepackage{xstring}
\usetikzlibrary{calc,fit,intersections}
\usetikzlibrary{fadings,shadings,decorations.text}
\usetikzlibrary{patterns}
\backgroundsetup{
scale=1,
color=black,
opacity=1,
angle=0,
contents={%
  \AddToShipoutPictureBG*{\includegraphics[width=\paperwidth,height=\paperheight]{Backgrounds/\genrePath BG\isLQ}}
  }%
}

\providecommand{\FrontCover}[2]{
\thispagestyle{plain}
\begin{tikzpicture}[overlay]
	\node [anchor=center] at (.38\paperwidth,-.422\paperheight) {\includegraphics[width=1.05\paperwidth,height=1.1\paperheight]{Backgrounds/\genrePath CoverFront\isLQ}};
	\node [anchor=center] at (.47\textwidth,-.422\paperheight) {#2};
	\node [text=\genreFrontTextColor,
	    text width = 1.5\textwidth,
	    align=center,
	    anchor=north] at (.47\textwidth,0) 
	    {\fontsize{90pt}{90pt}\fontspec{\genreFont}{#1}};	    
	\node at (.2\paperwidth,-.8\paperheight) {\includegraphics[width=.4\textwidth]{Backgrounds/\genrePath Logo}};
	\node at (.6\paperwidth,-.8\paperheight) {\includegraphics[width=.4\textwidth]{Backgrounds/SVWoDLogo}};
\end{tikzpicture}
}
\providecommand{\CreditsPage}[4]{
\thispagestyle{plain}
\begin{tikzpicture}[overlay]
	\node[anchor=center] at (\genreCreditsPos){\includegraphics[width=1.0\paperwidth,height=1.0\paperheight]{Backgrounds/\genrePath BGFull\isLQ}};
	\node  at (2cm,-.73\paperheight) {\includegraphics[width=.25\textwidth]{Backgrounds/WhiteWolfLogo}};
	\node at (.47\textwidth,-.5\paperheight) {\includegraphics[width=.5\textwidth]{Backgrounds/SVWoDLogo}};
	\node at (.47\textwidth,-.82\paperheight){\includegraphics[width=.95\textwidth,angle=180]{Backgrounds/\genrePath Sidebar\isLQ}};
	\node at (.47\textwidth,-.65\paperheight) {\includegraphics[width=.95\textwidth]{Backgrounds/\genrePath Sidebar\isLQ}};
	\node [anchor=north west, text=darkred] at (-.6cm,.15cm) {\fontsize{18pt}{18pt}\fontspec{\theFontSection}
\iflanguage{english}{\textbf{Credits}}{}
\iflanguage{ngerman}{\textbf{Impressum}}{}
\iflanguage{german}{\textbf{Impressum}}{}};
	\node [anchor=north west] at (.48\textwidth,.3cm) {\fontsize{18pt}{18pt}\fontspec{\theFontSubSection}
\iflanguage{english}{\textbf{Special Thanks}}{}
\iflanguage{ngerman}{\textbf{Danksagung}}{}
\iflanguage{german}{\textbf{Danksagung}}{}};
	\node [anchor=north west, text width=.47\textwidth,align=justify] at (-0.6cm,-0.5cm) {%
\iflanguage{english}{\textbf{Written by:}}{}
\iflanguage{ngerman}{\textbf{Geschrieben von:}}{}
\iflanguage{german}{\textbf{Geschrieben von:}}{}\\#1\\
\iflanguage{english}{\textbf{Developed by:}}{}
\iflanguage{ngerman}{\textbf{Entwickelt von:}}{}
\iflanguage{german}{\textbf{Entwickelt von:}}{}\\#2\\
\iflanguage{english}{\textbf{Edited by:}}{}
\iflanguage{ngerman}{\textbf{Editiert von:}}{}
\iflanguage{german}{\textbf{Editiert von:}}{}\\#3};
	\node [anchor=north west, text width=.47\textwidth,align=justify] at (.48\textwidth,-0.5cm) {#4};	
	\node [text width=.7\textwidth,align=justify] at (.62\textwidth,-.735\paperheight){\textcircled{c}  2017  White  Wolf  Entertainment  AB.  All  rights  reserved.  Vampire:  The Masquerade\textcircled{R}, World of Darkness\textcircled{R}, Storytelling System$^{TM}$, and Storytellers Vault$^{TM}$ are trademarks and/or registered trademarks of White Wolf Entertainment AB. All rights reserved.\\ For additional information on White Wolf and the World of Darkness, please, visit: www.white-wolf.com, www.worldofdarkness.com and www.storytellersvault.com.\\ Created with \WoDTeX};	
\end{tikzpicture}
}


\providecommand{\WoDTeX}{\smash{\raisebox{-0.26\height}{\includegraphics[width=1.2cm]{Backgrounds/WoDTeXLogo}}}}


\providecommand{\WoDFrame}[1]{
\includegraphics[width=.49\textwidth]{Backgrounds/\genrePath SidebarSmall\isLQ}\\
#1\\
\includegraphics[width=.49\textwidth,angle=180]{Backgrounds/\genrePath SidebarSmall\isLQ}\\
}

\providecommand{\charSheetTable}{p{.16\textwidth} p{.14\textwidth} p{.16\textwidth} p{.14\textwidth} p{.16\textwidth} p{.14\textwidth}}

\providecommand{\BigWoDFrame}[1]{
{\center\includegraphics[width=.95\textwidth]{Backgrounds/\genrePath Sidebar\isLQ}}\\
#1\\
{\center\includegraphics[width=.95\textwidth,angle=180]{Backgrounds/\genrePath Sidebar\isLQ}}\\
}

\providecommand{\BigWoDSeperator}[1]{
{\center
\begin{tikzpicture}
\node {\includegraphics[width=.95\textwidth]{Backgrounds/\genrePath SidebarBroken\isLQ}};
\node [anchor=center, align=center]at (0,-.5mm){ \textbf{\fontspec{\theFont}\fontsize{23}{20}\selectfont #1}};
\end{tikzpicture}
}
}

\providecommand{\textGenreAndSize}[2]{
{\fontspec{\theFont}\fontsize{#2}{#2}\selectfont #1}
}

\newcommand{\chapTitle}[2]{
\stepcounter{chapter}
\noindent \begin{tikzpicture}[overlay]
	\node[anchor=center] at (\genreChapTitlePos){\includegraphics[width=1.0\paperwidth,height=1.0\paperheight]{Backgrounds/\genrePath Chapter\isLQ}};	
	\node [align=center,text width=.8\textwidth, opacity=0.9]at (.5\textwidth,-1) {#1\\#2};
\end{tikzpicture}
\vspace*{\genreChapterSpacing}
\addcontentsline{toc}{chapter}{#1\ #2}
}
\setmainfont{Goudy Old Style}

\newcommand{\theFont             }{\genreFont}
\newcommand{\theFontSection      }{\genreFont}
\newcommand{\theFontSubSection   }{\genreFont}
\newcommand{\theFontSubSubSection}{\genreFont}
\definecolor{darkred}{HTML}{5D2428}
\definecolor{lightwhite}{HTML}{EBF0EE}

\newcommand{\translatedChapter}{Sprache nicht gefunden}
\iflanguage{english}{\renewcommand{\translatedChapter}{Chapter\ }}{}
\iflanguage{german}{\renewcommand{\translatedChapter}{Kapitel\ }}{}
\iflanguage{ngerman}{\renewcommand{\translatedChapter}{Kapitel\ }}{} 

\titleformat{\chapter}%Kapitel
  {\fontspec{\theFont}\fontsize{60pt}{60pt}\bfseries\color{lightwhite}}
  {}{-.29em}{\chapTitle{\translatedChapter \numberstringnum{\thechapter}:}} 
   
\titleformat{\section}%Abschnitt
  {\color{darkred}\titlerule[1.5pt]\fontsize{30pt}{30pt}\fontspec{\theFontSection}\bfseries}
  {\thesection}{1em}{}
  
\titleformat{\subsection}%Unterkapitel
  {\fontsize{18pt}{18pt}\fontspec{\theFontSubSection}\bfseries}
  {\thesubsection}{1em}{} 
  
\titleformat{\subsubsection}%Abschnitt
  {\fontsize{14pt}{14pt}\fontspec{\theFontSubSubSection}\bfseries}
  {\thesubsubsection}{1em}{} 
  
\newcommand{\inTextPicture}[3][R]{
\begin{wrapfigure}{#1}{#2}
\centering
\includegraphics[width=#2]{#3}
\end{wrapfigure}
}

\newcommand{\chapterCiting}[2]{
\begin{tikzpicture}[overlay]
	\node [align=center,text width=.7\textwidth] at (.492\textwidth,1.5cm) {"\textit{#1}"\\-\textbf{#2}};	
\end{tikzpicture}
}

\newcommand{\SkillDots}[1]{%
    \par\noindent%
    \IfEqCase*{#1}{%
    {0}{$X$}%
	{1}{$\CIRCLE$}%
	{2}{$\CIRCLE\CIRCLE$}%
	{3}{$\CIRCLE\CIRCLE\CIRCLE$}%
	{4}{$\CIRCLE\CIRCLE\CIRCLE\CIRCLE$}%
	{5}{$\CIRCLE\CIRCLE\CIRCLE\CIRCLE\CIRCLE$}%
	{6}{$\CIRCLE\CIRCLE\CIRCLE\CIRCLE\CIRCLE\ \CIRCLE$}%
	{7}{$\CIRCLE\CIRCLE\CIRCLE\CIRCLE\CIRCLE\ \CIRCLE\CIRCLE$}%
	{8}{$\CIRCLE\CIRCLE\CIRCLE\CIRCLE\CIRCLE\ \CIRCLE\CIRCLE\CIRCLE$}%
	{9}{$\CIRCLE\CIRCLE\CIRCLE\CIRCLE\CIRCLE\ \CIRCLE\CIRCLE\CIRCLE\CIRCLE$}%
	{10}{$\CIRCLE\CIRCLE\CIRCLE\CIRCLE\CIRCLE\ \CIRCLE\CIRCLE\CIRCLE\CIRCLE\CIRCLE$}%
    }[(Unreasonable Skill Level)]%
}%

\newcommand{\EmptyDots}[1]{%
    \par\noindent%
    \IfEqCase*{#1}{%
    {0}{}%
	{1}{$\ocircle$}%
	{2}{$\ocircle\ocircle$}%
	{3}{$\ocircle\ocircle\ocircle$}%
	{4}{$\ocircle\ocircle\ocircle\ocircle$}%
	{5}{$\ocircle\ocircle\ocircle\ocircle\ocircle$}%
	{6}{$\ocircle\ocircle\ocircle\ocircle\ocircle\ \ocircle$}%
	{7}{$\ocircle\ocircle\ocircle\ocircle\ocircle\ \ocircle\ocircle$}%
	{8}{$\ocircle\ocircle\ocircle\ocircle\ocircle\ \ocircle\ocircle\ocircle$}%
	{9}{$\ocircle\ocircle\ocircle\ocircle\ocircle\ \ocircle\ocircle\ocircle\ocircle$}%
	{10}{$\ocircle\ocircle\ocircle\ocircle\ocircle\ \ocircle\ocircle\ocircle\ocircle\ocircle$}%
    }[(Unreasonable Skill Level)]%
}%

\newcommand{\dottedSkill}[2]{%
    \IfEqCase*{#2}{%
    {0}{#1 & $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$}%
	{1}{#1 & $\CIRCLE$  $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$}%
	{2}{#1 & $\CIRCLE$  $\CIRCLE$  $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$}%
	{3}{#1 & $\CIRCLE$  $\CIRCLE$  $\CIRCLE$  $\ocircle$ $\ocircle$ $\ocircle$}%
	{4}{#1 & $\CIRCLE$  $\CIRCLE$  $\CIRCLE$  $\CIRCLE$  $\ocircle$ $\ocircle$}%
	{5}{#1 & $\CIRCLE$  $\CIRCLE$  $\CIRCLE$  $\CIRCLE$  $\CIRCLE$  $\ocircle$}%
	{6}{#1 & $\CIRCLE$  $\CIRCLE$  $\CIRCLE$  $\CIRCLE$  $\CIRCLE$  $\CIRCLE$}%
	{7}{#1 & $\CIRCLE$  $\CIRCLE$  $\CIRCLE$  $\CIRCLE$  $\CIRCLE$  $\CIRCLE$ $\CIRCLE$}%
	{8}{#1 & $\CIRCLE$  $\CIRCLE$  $\CIRCLE$  $\CIRCLE$  $\CIRCLE$  $\CIRCLE$ $\CIRCLE$ $\CIRCLE$}%
	{9}{#1 & $\CIRCLE$  $\CIRCLE$  $\CIRCLE$  $\CIRCLE$  $\CIRCLE$  $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$}%
	{10}{#1 &$\CIRCLE$  $\CIRCLE$  $\CIRCLE$  $\CIRCLE$  $\CIRCLE$  $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$}%
    }[(Unreasonable Skill Level)]%
}%

\newcommand{\RageGnosisWill}[1]{%
    \IfEqCase*{#1}{%
    {0}{$\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ }%
    {1}{$\CIRCLE$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ }%
    {2}{$\CIRCLE$ $\CIRCLE$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ }%
    {3}{$\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ }%
    {4}{$\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ }%
    {5}{$\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ }%
    {6}{$\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\ocircle$ $\ocircle$ $\ocircle$ $\ocircle$ }%
    {7}{$\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\ocircle$ $\ocircle$ $\ocircle$ }%
    {8}{$\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\ocircle$ $\ocircle$ }%
    {9}{$\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\ocircle$ }%
    {10}{$\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$ $\CIRCLE$}%
    }[(Unreasonable Skill Level)]%
}%

\newcommand{\Boxes}{$\square$ $\square$ $\square$ $\square$ $\square$ $\square$ $\square$ $\square$ $\square$ $\square$ }

\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{} % clear all footer fields
\renewcommand{\headrulewidth}{0.0pt} %no rule for header
\renewcommand{\footrulewidth}{0.0pt} %no rule for footer
\fancyfoot[LE,RO]{
  {\fontsize{14}{14}\fontspec{\theFontSubSection} \thepage}
}
\fancyfoot[C]{
  {\fontsize{14}{14}\fontspec{\theFontSubSection} \chaptername{}\ \thechapter}
}
\endinput