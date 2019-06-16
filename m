Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6C647598
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 17:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6351A891B7;
	Sun, 16 Jun 2019 15:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5460A891C1
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 15:44:14 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5063472167; Sun, 16 Jun 2019 15:44:14 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110897] HyperZ is broken for r300 (bad z for some micro and
 macrotiles?)
Date: Sun, 16 Jun 2019 15:44:14 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: u9vata@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110897-502-kR7wGmcXwp@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110897-502@http.bugs.freedesktop.org/>
References: <bug-110897-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0278786465=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0278786465==
Content-Type: multipart/alternative; boundary="15606998543.b9ADAC.15250"
Content-Transfer-Encoding: 7bit


--15606998543.b9ADAC.15250
Date: Sun, 16 Jun 2019 15:44:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110897

--- Comment #58 from Richard Thier <u9vata@gmail.com> ---
I still have some dmesg logs around from my other debugging session and in
every one of those I get 3 pipes despite different kernel versions from 4.4=
 to
latest 5.x

Also looking at git blame I can see that relevant code paths were last touc=
hed
10 years ago with a big drm related commit. So nothing has changed in the c=
ode
it seems. Ok... I didn't check if the register number in the header is chan=
ged
or not, just hoped not, but the code itself is doing the same 10 year old
things here. Even the FIXME saying if this is good or not (when calling
r420_pipes_init in rs400_init) is that old.

[drm] initializing kernel modesetting (RS400 0x1002:0x5A62 0x1043:0x1392)

^^You seem to be also 5A62 here. In the code of r420_pipes_init, there are =
some
hardcoded cases for some other similar values that force a single-pipe inst=
ead
of reading from the register but you do not fall into those. The last two
numbers are different in your case, but that does not count for that code p=
ath
that decides the pipe number - except if the small variance in the last two
means that your card gives back proper values in the register from which you
can read the pipe num.

Btw running with r300_init call instead of the r420 pipe initializaion is g=
oing
good so far: performance is the same, the glitches are the same (I know abo=
ut
some already), everything works that worked before...

One possible solution might be to just use r300_init for r400, but I have no
idea if that breaks some r400 cards. I only have my RC410 but no other... An
other appoach is to add one more special cases for the r420_pipes_init that
specifically checks for 5A62 and forces a single pipeline despite what is r=
ead
from the register.

Also there was one time where things were working for me before changes but=
 I
do not know what the pipe value was back then. So yes, there is SOME chance
that this register can also return 1 in my case too, but it seems most of t=
he
time (99% at least if not 100%) it returns 3.

I will prepare both patches and then let others decide which direction to t=
ake.
I think taking the r300_init direction is maybe better because of hopeful
backwards compatibility in general.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15606998543.b9ADAC.15250
Date: Sun, 16 Jun 2019 15:44:14 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897#c58">Comme=
nt # 58</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897">bug 11089=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
u9vata&#64;gmail.com" title=3D"Richard Thier &lt;u9vata&#64;gmail.com&gt;">=
 <span class=3D"fn">Richard Thier</span></a>
</span></b>
        <pre>I still have some dmesg logs around from my other debugging se=
ssion and in
every one of those I get 3 pipes despite different kernel versions from 4.4=
 to
latest 5.x

Also looking at git blame I can see that relevant code paths were last touc=
hed
10 years ago with a big drm related commit. So nothing has changed in the c=
ode
it seems. Ok... I didn't check if the register number in the header is chan=
ged
or not, just hoped not, but the code itself is doing the same 10 year old
things here. Even the FIXME saying if this is good or not (when calling
r420_pipes_init in rs400_init) is that old.

[drm] initializing kernel modesetting (RS400 0x1002:0x5A62 0x1043:0x1392)

^^You seem to be also 5A62 here. In the code of r420_pipes_init, there are =
some
hardcoded cases for some other similar values that force a single-pipe inst=
ead
of reading from the register but you do not fall into those. The last two
numbers are different in your case, but that does not count for that code p=
ath
that decides the pipe number - except if the small variance in the last two
means that your card gives back proper values in the register from which you
can read the pipe num.

Btw running with r300_init call instead of the r420 pipe initializaion is g=
oing
good so far: performance is the same, the glitches are the same (I know abo=
ut
some already), everything works that worked before...

One possible solution might be to just use r300_init for r400, but I have no
idea if that breaks some r400 cards. I only have my RC410 but no other... An
other appoach is to add one more special cases for the r420_pipes_init that
specifically checks for 5A62 and forces a single pipeline despite what is r=
ead
from the register.

Also there was one time where things were working for me before changes but=
 I
do not know what the pipe value was back then. So yes, there is SOME chance
that this register can also return 1 in my case too, but it seems most of t=
he
time (99% at least if not 100%) it returns 3.

I will prepare both patches and then let others decide which direction to t=
ake.
I think taking the r300_init direction is maybe better because of hopeful
backwards compatibility in general.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15606998543.b9ADAC.15250--

--===============0278786465==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0278786465==--
