Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C109972C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 16:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1CD6EB69;
	Thu, 22 Aug 2019 14:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7722E6EB69
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 14:44:04 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6F1A172161; Thu, 22 Aug 2019 14:44:04 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110659] pageflipping seems to cause jittering on mouse input
 when running Hitman 2 in Wine/DXVK with amdgpu.dc=1
Date: Thu, 22 Aug 2019 14:44:04 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nicholas.kazlauskas@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110659-502-hsw2EeP6Me@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110659-502@http.bugs.freedesktop.org/>
References: <bug-110659-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1047984226=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1047984226==
Content-Type: multipart/alternative; boundary="15664850440.b77d7bec.22297"
Content-Transfer-Encoding: 7bit


--15664850440.b77d7bec.22297
Date: Thu, 22 Aug 2019 14:44:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110659

--- Comment #39 from Nicholas Kazlauskas <nicholas.kazlauskas@amd.com> ---
Disabling the compositor doesn't make a difference as far as stuttering goes
for Hitman 2's DXVK - I don't see any commits in the log that are lock the
connector and all the planes.

I don't have Oblivion on my machine to test, but I tried running the DX9
version of Heaven under proton and I don't see stuttering or any gamma/color
adjustment commits under that either. No issues with FreeSync when running =
it
either from what I can tell with vsync both on/off.

Those commits are definitely what's causing your stuttering, but I'm not su=
re
what's actually creating them. My initial guess was something in the
compatibility layer for DX9 games, but I don't see that on my setup.

Is it only Oblivion that has this issue for you?

I'm not sure how much of this can be a kernel level fix - I think we need to
lock all the planes whenever gamma or color adjustments have been made and =
that
probably includes the cursor plane as well. If the cursor plane is included
that will block asynchronous cursor updates from occurring until the color
adjustments have been done. This is why the cursor causes stuttering.

A check could potentially be made to not lock all the planes for redundant
color management commits, but I'm not sure if the color adjustments request=
ed
are redundant or not. It could be the case that the application is requesti=
ng
different color adjustments every single time.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15664850440.b77d7bec.22297
Date: Thu, 22 Aug 2019 14:44:04 +0000
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
   title=3D"NEW - pageflipping seems to cause jittering on mouse input when=
 running Hitman 2 in Wine/DXVK with amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659#c39">Comme=
nt # 39</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - pageflipping seems to cause jittering on mouse input when=
 running Hitman 2 in Wine/DXVK with amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659">bug 11065=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nicholas.kazlauskas&#64;amd.com" title=3D"Nicholas Kazlauskas &lt;nicholas.=
kazlauskas&#64;amd.com&gt;"> <span class=3D"fn">Nicholas Kazlauskas</span><=
/a>
</span></b>
        <pre>Disabling the compositor doesn't make a difference as far as s=
tuttering goes
for Hitman 2's DXVK - I don't see any commits in the log that are lock the
connector and all the planes.

I don't have Oblivion on my machine to test, but I tried running the DX9
version of Heaven under proton and I don't see stuttering or any gamma/color
adjustment commits under that either. No issues with FreeSync when running =
it
either from what I can tell with vsync both on/off.

Those commits are definitely what's causing your stuttering, but I'm not su=
re
what's actually creating them. My initial guess was something in the
compatibility layer for DX9 games, but I don't see that on my setup.

Is it only Oblivion that has this issue for you?

I'm not sure how much of this can be a kernel level fix - I think we need to
lock all the planes whenever gamma or color adjustments have been made and =
that
probably includes the cursor plane as well. If the cursor plane is included
that will block asynchronous cursor updates from occurring until the color
adjustments have been done. This is why the cursor causes stuttering.

A check could potentially be made to not lock all the planes for redundant
color management commits, but I'm not sure if the color adjustments request=
ed
are redundant or not. It could be the case that the application is requesti=
ng
different color adjustments every single time.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15664850440.b77d7bec.22297--

--===============1047984226==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1047984226==--
