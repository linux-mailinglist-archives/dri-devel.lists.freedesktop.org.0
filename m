Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E93D54A5
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2019 07:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54D26E0FB;
	Sun, 13 Oct 2019 05:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3737D6E0FB
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2019 05:03:14 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 32A187296E; Sun, 13 Oct 2019 05:03:14 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111987] Unstable performance (periodic and repeating patterns
 of fps change) and changing VDDGFX
Date: Sun, 13 Oct 2019 05:03:14 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: witold.baryluk+freedesktop@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111987-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0003163889=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0003163889==
Content-Type: multipart/alternative; boundary="15709429941.CC8F4daC1.27486"
Content-Transfer-Encoding: 7bit


--15709429941.CC8F4daC1.27486
Date: Sun, 13 Oct 2019 05:03:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111987

            Bug ID: 111987
           Summary: Unstable performance (periodic and repeating patterns
                    of fps change) and changing VDDGFX
           Product: DRI
           Version: XOrg git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: not set
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: witold.baryluk+freedesktop@gmail.com

AMD Radeon Fury X.

Linux debian 5.2.0-3-amd64 #1 SMP Debian 5.2.17-1 (2019-09-26) x86_64 GNU/L=
inux

ii  xserver-xorg-video-radeon                                   1:19.0.1-1=
=20=20=20=20=20
                      amd64        X.Org X server -- AMD/ATI Radeon display
driver
ii  xserver-xorg-video-amdgpu                                   19.0.1-1=20=
=20=20=20=20=20=20
                      amd64        X.Org X server -- AMDGPU display driver
ii  xserver-xorg-video-radeon                                   1:19.0.1-1=
=20=20=20=20=20
                      amd64        X.Org X server -- AMD/ATI Radeon display
driver
ii  libdrm-radeon1:amd64                                        2.4.99-1=20=
=20=20=20=20=20=20=20
amd64        Userspace interface to radeon-specific kernel DRM services --
runtime
ii  libdrm-amdgpu1:amd64                                        2.4.99-1=20=
=20=20=20=20=20=20
                      amd64        Userspace interface to amdgpu-specific
kernel DRM services -- runtime


I was able to reproduce the issue in few titles:

Overwatch (64-bit Windows game) with various Wine and DXVK versions, as well
when using Wine OpenGL renderer.
Talos (native 64 bit Linux game) with Vulkan renderer.

Tested with both Mesa 19.2.1-1 with LLVM 9 from Debian, and custom compiled
Mesa 19.3.0-devel with LLVM 10 and ACO backend compilers.

If I setup the game to render constantly same things on screen (I do that by
simply going to a corner of the map, and looking at the ground or a corner,
where there is minimal amount of geometry and variability), I initially get
very high and stable frame rate, of lets say 105 FPS (plus minus 1 FPS).
However, if I wait long enough there are periodic (not sporadic, but actual=
ly
periodic, and exactly repeatable) situations where FPS drops. During that
period the GPU load increases from 30% to 100%, sometimes with one or two
intermediate steps (depends on the game and setup).

I also notice that the GPU VDD is changing during these period.

I eliminated all other sources of variability. Nothing running in backgroun=
d.

Reported GPU temperature is stable at <32 deg C, and during testing is stab=
le
and flat.

Sometimes, if I keep the game running long enough, it will stabilize and st=
op
doing that. But sometimes if I wait long enough it will reenter this behavi=
our
back. Most of the time the behaviour is extremaly repetitive and predictabl=
e.
Not random.

Please see attached frametime graph (captured with modified Mesa vulkan
overlay) for Talos and Overatch.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15709429941.CC8F4daC1.27486
Date: Sun, 13 Oct 2019 05:03:14 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Unstable performance (periodic and repeating patterns of =
fps change) and changing VDDGFX"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111987">111987</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Unstable performance (periodic and repeating patterns of fps =
change) and changing VDDGFX
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>XOrg git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>witold.baryluk+freedesktop&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>AMD Radeon Fury X.

Linux debian 5.2.0-3-amd64 #1 SMP Debian 5.2.17-1 (2019-09-26) x86_64 GNU/L=
inux

ii  xserver-xorg-video-radeon                                   1:19.0.1-1=
=20=20=20=20=20
                      amd64        X.Org X server -- AMD/ATI Radeon display
driver
ii  xserver-xorg-video-amdgpu                                   19.0.1-1=20=
=20=20=20=20=20=20
                      amd64        X.Org X server -- AMDGPU display driver
ii  xserver-xorg-video-radeon                                   1:19.0.1-1=
=20=20=20=20=20
                      amd64        X.Org X server -- AMD/ATI Radeon display
driver
ii  libdrm-radeon1:amd64                                        2.4.99-1=20=
=20=20=20=20=20=20=20
amd64        Userspace interface to radeon-specific kernel DRM services --
runtime
ii  libdrm-amdgpu1:amd64                                        2.4.99-1=20=
=20=20=20=20=20=20
                      amd64        Userspace interface to amdgpu-specific
kernel DRM services -- runtime


I was able to reproduce the issue in few titles:

Overwatch (64-bit Windows game) with various Wine and DXVK versions, as well
when using Wine OpenGL renderer.
Talos (native 64 bit Linux game) with Vulkan renderer.

Tested with both Mesa 19.2.1-1 with LLVM 9 from Debian, and custom compiled
Mesa 19.3.0-devel with LLVM 10 and ACO backend compilers.

If I setup the game to render constantly same things on screen (I do that by
simply going to a corner of the map, and looking at the ground or a corner,
where there is minimal amount of geometry and variability), I initially get
very high and stable frame rate, of lets say 105 FPS (plus minus 1 FPS).
However, if I wait long enough there are periodic (not sporadic, but actual=
ly
periodic, and exactly repeatable) situations where FPS drops. During that
period the GPU load increases from 30% to 100%, sometimes with one or two
intermediate steps (depends on the game and setup).

I also notice that the GPU VDD is changing during these period.

I eliminated all other sources of variability. Nothing running in backgroun=
d.

Reported GPU temperature is stable at &lt;32 deg C, and during testing is s=
table
and flat.

Sometimes, if I keep the game running long enough, it will stabilize and st=
op
doing that. But sometimes if I wait long enough it will reenter this behavi=
our
back. Most of the time the behaviour is extremaly repetitive and predictabl=
e.
Not random.

Please see attached frametime graph (captured with modified Mesa vulkan
overlay) for Talos and Overatch.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15709429941.CC8F4daC1.27486--

--===============0003163889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0003163889==--
