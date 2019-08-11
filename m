Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD7B88EF5
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 03:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253216E2B2;
	Sun, 11 Aug 2019 01:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 64D426E478
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 01:15:48 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6127F72167; Sun, 11 Aug 2019 01:15:48 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Sun, 11 Aug 2019 01:15:48 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: reddestdream@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-YNnHrER2N7@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110674-502@http.bugs.freedesktop.org/>
References: <bug-110674-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0464967178=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0464967178==
Content-Type: multipart/alternative; boundary="15654861483.3575Afd.22325"
Content-Transfer-Encoding: 7bit


--15654861483.3575Afd.22325
Date: Sun, 11 Aug 2019 01:15:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #69 from ReddestDream <reddestdream@gmail.com> ---
>The inconsistent nature of this bug and the fact that it sometimes doesn't=
 appear suggests a race condition. I'd assume something else on the system =
happens before or after amdgpu is expecting.

>Is there any way to delay loading the amdgpu driver and manually loading i=
t after everything else?

Based on all the data you (Tom B) and others have provided as well as my own
tests, my current suspicion is that there is a bug in the display mode/type
detection and enumeration, leading to the driver losing state consistency a=
nd
eventually contact entirely with the hardware.

I think the clock dysregulation and excessive voltage/wattage are symptoms =
of
the underlying disease rather than the cause. If something is wrong between
what the driver thinks the hardware state is and what the hardware state
actually is, it's only a matter of time before this inconsistency leads to
dysregulation, instability, and crashing. For this reason, I'm not convinced
there is any better workaround than "just use one monitor." Pushing up the
clocks only seems to at best prolong the inevitable. :(

I'm also not convinced there is one commit in particular to point to here.
Rather it was probably in the restructuring of something between 5.0 and 5.1
that it became fundamentally broken while it was always somewhat flawed bef=
ore.

Unfortunately, Radeon VII probably isn't really being tested by kernel
developers anymore and it's likely that multimonitor with this card on Linux
was never fully tested at all. It also seems like AMD's kernel development =
has
moved on to Navi and that the upcoming new Vega card, Arcturus, won't have
display outs at all, so work on that can't fix this issue.

As this card is fairly uncommon and expensive, the only real hope for a fix
seems to be to get the card into the hands of someone who has the skill to =
fix
graphics drivers and a willingness/need to test multimonitor.

Perhaps someone like gnif who has been able to solve the infamous Vega Reset
Bug on Vega 10 cards might be able to fix it. It's likely he will encounter=
 our
issue while testing Radeon VII with Looking Glass and such. Someone has alr=
eady
offered to lend him a Radeon VII as he states in the video, so there's some
hope that his work will lead to a solution.

https://www.youtube.com/watch?v=3D1ShkjXoG0O0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15654861483.3575Afd.22325
Date: Sun, 11 Aug 2019 01:15:48 +0000
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
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c69">Comme=
nt # 69</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
reddestdream&#64;gmail.com" title=3D"ReddestDream &lt;reddestdream&#64;gmai=
l.com&gt;"> <span class=3D"fn">ReddestDream</span></a>
</span></b>
        <pre><span class=3D"quote">&gt;The inconsistent nature of this bug =
and the fact that it sometimes doesn't appear suggests a race condition. I'=
d assume something else on the system happens before or after amdgpu is exp=
ecting.</span >

<span class=3D"quote">&gt;Is there any way to delay loading the amdgpu driv=
er and manually loading it after everything else?</span >

Based on all the data you (Tom B) and others have provided as well as my own
tests, my current suspicion is that there is a bug in the display mode/type
detection and enumeration, leading to the driver losing state consistency a=
nd
eventually contact entirely with the hardware.

I think the clock dysregulation and excessive voltage/wattage are symptoms =
of
the underlying disease rather than the cause. If something is wrong between
what the driver thinks the hardware state is and what the hardware state
actually is, it's only a matter of time before this inconsistency leads to
dysregulation, instability, and crashing. For this reason, I'm not convinced
there is any better workaround than &quot;just use one monitor.&quot; Pushi=
ng up the
clocks only seems to at best prolong the inevitable. :(

I'm also not convinced there is one commit in particular to point to here.
Rather it was probably in the restructuring of something between 5.0 and 5.1
that it became fundamentally broken while it was always somewhat flawed bef=
ore.

Unfortunately, Radeon VII probably isn't really being tested by kernel
developers anymore and it's likely that multimonitor with this card on Linux
was never fully tested at all. It also seems like AMD's kernel development =
has
moved on to Navi and that the upcoming new Vega card, Arcturus, won't have
display outs at all, so work on that can't fix this issue.

As this card is fairly uncommon and expensive, the only real hope for a fix
seems to be to get the card into the hands of someone who has the skill to =
fix
graphics drivers and a willingness/need to test multimonitor.

Perhaps someone like gnif who has been able to solve the infamous Vega Reset
Bug on Vega 10 cards might be able to fix it. It's likely he will encounter=
 our
issue while testing Radeon VII with Looking Glass and such. Someone has alr=
eady
offered to lend him a Radeon VII as he states in the video, so there's some
hope that his work will lead to a solution.

<a href=3D"https://www.youtube.com/watch?v=3D1ShkjXoG0O0">https://www.youtu=
be.com/watch?v=3D1ShkjXoG0O0</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15654861483.3575Afd.22325--

--===============0464967178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0464967178==--
