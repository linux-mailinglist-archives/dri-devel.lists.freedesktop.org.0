Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 775732DA37
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 12:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F77089467;
	Wed, 29 May 2019 10:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id F310C89467
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 10:16:58 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E9B1E72167; Wed, 29 May 2019 10:16:58 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110781] Radeon: heavy r300 performance drop regression between
 11.x and 19.x
Date: Wed, 29 May 2019 10:16:59 +0000
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
Message-ID: <bug-110781-502-ntcNmRJ0VJ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110781-502@http.bugs.freedesktop.org/>
References: <bug-110781-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1875506379=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1875506379==
Content-Type: multipart/alternative; boundary="15591250180.D33c2d4B.5525"
Content-Transfer-Encoding: 7bit


--15591250180.D33c2d4B.5525
Date: Wed, 29 May 2019 10:16:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110781

--- Comment #3 from Richard Thier <u9vata@gmail.com> ---
When doing an strace this is what I am getting:

  ...
  ioctl(6, DRM_IOCTL_RADEON_GEM_CREATE, 0xbfafd880) =3D 0 <0.000068>
   > [vdso]() [0x891]
  ioctl(6, DRM_IOCTL_RADEON_CS, 0xafe2404c) =3D 0 <0.000102>
   > [vdso]() [0x891]
  ioctl(6, DRM_IOCTL_RADEON_GEM_WAIT_IDLE, 0xbfafd9c4) =3D 0 <0.000030>
   > [vdso]() [0x891]
  ioctl(6, DRM_IOCTL_GEM_CLOSE, 0xbfafd99c) =3D 0 <0.000043>
   > [vdso]() [0x891]
  ioctl(6, DRM_IOCTL_RADEON_GEM_CREATE, 0xbfafd880) =3D 0 <0.000070>
   > [vdso]() [0x891]
  ioctl(6, DRM_IOCTL_RADEON_CS, 0xafe380e0) =3D 0 <0.000088>
   > [vdso]() [0x891]
  ioctl(6, DRM_IOCTL_RADEON_GEM_WAIT_IDLE, 0xbfafd9c4) =3D 0 <0.000029>
   > [vdso]() [0x891]
  ioctl(6, DRM_IOCTL_GEM_CLOSE, 0xbfafd99c) =3D 0 <0.000047>
   > [vdso]() [0x891]
  ...

These continously appear in the mesa+xorg combination that is slow. I have =
no
idea if the same is happening in the old 11.x version where speed is still =
good
(sadly I could not try a later mesa between 11.x and 19.x so far, but I que=
ss
some of them works fast still).

I have tried reverting the following changes manually in my mesa.git versio=
n:

1.
https://github.com/mesa3d/mesa/commit/9ac5504df5c31e60801d9d37c1f3d547c486b=
f0a
2.
https://github.com/mesa3d/mesa/commit/a1e391e39df2b1d8169e773a30153167ab8e1=
3e8
3.
https://github.com/mesa3d/mesa/commit/0e40c6a7b70673734dfecf5957c086b30f11b=
efe

Actually after reverting the latter things got 1FPS slower than with unchan=
ged
19.x, but the first two have helped a very small amount.

In my journey to find the slowdown I started to look around "radeon_create_=
bo"
and "radeon_winsys_bo_create" so that is how I was trying to revert exactly
these changes because these seemed to be maybe relevant using git blame loo=
kup.

If anyone knows where to look further or have any idea about my problem (ma=
ybe
on the level of X or other parts of mesa making a lot of "bo"s?) please tel=
l me
:-)

What is "bo" in this sense btw? Is there any documentation I should read to
understand these acronyms in the code? It takes considerable amount of time=
 to
understand that cs is some kind of "command stream" (still unsure) and bo is
some kind of "buffer object" while I have no idea about "pb_" and a lot of
other things and not even knowing if a bo is a general buffer for anything
(vertex buffers, constant buffers, backbuffers, zbuffers,
who-knows-what-else-stuff) or just for one specific thing here. Is there a =
list
for advised reading before touching the code as a noob like me?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15591250180.D33c2d4B.5525
Date: Wed, 29 May 2019 10:16:58 +0000
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
   title=3D"NEW - Radeon: heavy r300 performance drop regression between 11=
.x and 19.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Radeon: heavy r300 performance drop regression between 11=
.x and 19.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781">bug 11078=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
u9vata&#64;gmail.com" title=3D"Richard Thier &lt;u9vata&#64;gmail.com&gt;">=
 <span class=3D"fn">Richard Thier</span></a>
</span></b>
        <pre>When doing an strace this is what I am getting:

  ...
  ioctl(6, DRM_IOCTL_RADEON_GEM_CREATE, 0xbfafd880) =3D 0 &lt;0.000068&gt;
   &gt; [vdso]() [0x891]
  ioctl(6, DRM_IOCTL_RADEON_CS, 0xafe2404c) =3D 0 &lt;0.000102&gt;
   &gt; [vdso]() [0x891]
  ioctl(6, DRM_IOCTL_RADEON_GEM_WAIT_IDLE, 0xbfafd9c4) =3D 0 &lt;0.000030&g=
t;
   &gt; [vdso]() [0x891]
  ioctl(6, DRM_IOCTL_GEM_CLOSE, 0xbfafd99c) =3D 0 &lt;0.000043&gt;
   &gt; [vdso]() [0x891]
  ioctl(6, DRM_IOCTL_RADEON_GEM_CREATE, 0xbfafd880) =3D 0 &lt;0.000070&gt;
   &gt; [vdso]() [0x891]
  ioctl(6, DRM_IOCTL_RADEON_CS, 0xafe380e0) =3D 0 &lt;0.000088&gt;
   &gt; [vdso]() [0x891]
  ioctl(6, DRM_IOCTL_RADEON_GEM_WAIT_IDLE, 0xbfafd9c4) =3D 0 &lt;0.000029&g=
t;
   &gt; [vdso]() [0x891]
  ioctl(6, DRM_IOCTL_GEM_CLOSE, 0xbfafd99c) =3D 0 &lt;0.000047&gt;
   &gt; [vdso]() [0x891]
  ...

These continously appear in the mesa+xorg combination that is slow. I have =
no
idea if the same is happening in the old 11.x version where speed is still =
good
(sadly I could not try a later mesa between 11.x and 19.x so far, but I que=
ss
some of them works fast still).

I have tried reverting the following changes manually in my mesa.git versio=
n:

1.
<a href=3D"https://github.com/mesa3d/mesa/commit/9ac5504df5c31e60801d9d37c1=
f3d547c486bf0a">https://github.com/mesa3d/mesa/commit/9ac5504df5c31e60801d9=
d37c1f3d547c486bf0a</a>
2.
<a href=3D"https://github.com/mesa3d/mesa/commit/a1e391e39df2b1d8169e773a30=
153167ab8e13e8">https://github.com/mesa3d/mesa/commit/a1e391e39df2b1d8169e7=
73a30153167ab8e13e8</a>
3.
<a href=3D"https://github.com/mesa3d/mesa/commit/0e40c6a7b70673734dfecf5957=
c086b30f11befe">https://github.com/mesa3d/mesa/commit/0e40c6a7b70673734dfec=
f5957c086b30f11befe</a>

Actually after reverting the latter things got 1FPS slower than with unchan=
ged
19.x, but the first two have helped a very small amount.

In my journey to find the slowdown I started to look around &quot;radeon_cr=
eate_bo&quot;
and &quot;radeon_winsys_bo_create&quot; so that is how I was trying to reve=
rt exactly
these changes because these seemed to be maybe relevant using git blame loo=
kup.

If anyone knows where to look further or have any idea about my problem (ma=
ybe
on the level of X or other parts of mesa making a lot of &quot;bo&quot;s?) =
please tell me
:-)

What is &quot;bo&quot; in this sense btw? Is there any documentation I shou=
ld read to
understand these acronyms in the code? It takes considerable amount of time=
 to
understand that cs is some kind of &quot;command stream&quot; (still unsure=
) and bo is
some kind of &quot;buffer object&quot; while I have no idea about &quot;pb_=
&quot; and a lot of
other things and not even knowing if a bo is a general buffer for anything
(vertex buffers, constant buffers, backbuffers, zbuffers,
who-knows-what-else-stuff) or just for one specific thing here. Is there a =
list
for advised reading before touching the code as a noob like me?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15591250180.D33c2d4B.5525--

--===============1875506379==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1875506379==--
