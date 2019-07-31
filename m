Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF487CB94
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 20:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210A06E2B2;
	Wed, 31 Jul 2019 18:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4BBD16E2B2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 18:11:39 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 42D9572167; Wed, 31 Jul 2019 18:11:39 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111272] [DRI_PRIME] Error on multi GPU with only one enabled
Date: Wed, 31 Jul 2019 18:11:39 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: parker.l.reed@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111272-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1169973359=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1169973359==
Content-Type: multipart/alternative; boundary="15645966990.17e3E.14388"
Content-Transfer-Encoding: 7bit


--15645966990.17e3E.14388
Date: Wed, 31 Jul 2019 18:11:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111272

            Bug ID: 111272
           Summary: [DRI_PRIME] Error on multi GPU with only one enabled
           Product: DRI
           Version: XOrg git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: parker.l.reed@gmail.com

Created attachment 144921
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144921&action=3Dedit
DRI PRIME 0

I have a Razer Blade Stealth late 2016 with a Razer Core V1 and an RX 560.

Arch Linux

Linux stealth 5.2.1-arch1-1-fsync #1 SMP PREEMPT Mon Jul 22 17:40:06 PDT 20=
19
x86_64 GNU/Linux

mesa-aco-git 19.2.0_devel.114720.5c6077221dd-1 (Also happens on normal mesa=
-git
and mesa stable)

With only the AMDGPU enabled for Xorg, DRI_PRIME=3D1 attempts to use Intel,=
 falls
back to AMD as expected, but has the weird behavior of completely bypassing
vsync. DRI_PRIME=3D0 works as expected

Expected behavior is to ignore the Intel card since it's not currently load=
ed
in Xorg. I can obviously set DRI_PRIME=3D0 and be fine, but the DRI_PRIME=
=3D1
behavior seems to be a bug.

Xorg conf

Section "Device"
 Identifier "AMD"
 Driver "amdgpu"
 BusID "PCI:07:0:0"
EndSection

xrandr corroborates this in the listproviders output

Providers: number : 1
Provider 0: id: 0x57 cap: 0xf, Source Output, Sink Output, Source Offload, =
Sink
Offload crtcs: 5 outputs: 3 associated providers: 0 name:AMD Radeon (TM) RX=
 460
Graphics @ pci:0000:07:00.0

DRI_PRIME=3D1 glxinfo reports the same info aside from an error at the top =
of the
output

libGL error: Different GPU, but blitImage not implemented for this driver
libGL error: failed to load driver: i965

Full glxinfo attached for DRI_PRIME=3D0, DRI_PRIME=3D1, and DRI_PRIME=3D1 w=
ith
vblank_mode=3D1

glxgears for FPS example

$ DRI_PRIME=3D0 glxgears
Running synchronized to the vertical refresh.  The framerate should be
approximately the same as the monitor refresh rate.
333 frames in 5.0 seconds =3D 66.549 FPS
300 frames in 5.0 seconds =3D 59.999 FPS
300 frames in 5.0 seconds =3D 59.997 FPS
301 frames in 5.0 seconds =3D 60.001 FPS

$ DRI_PRIME=3D1 glxgears
libGL error: Different GPU, but blitImage not implemented for this driver
libGL error: failed to load driver: i965
Running synchronized to the vertical refresh.  The framerate should be
approximately the same as the monitor refresh rate.
42158 frames in 5.0 seconds =3D 8431.391 FPS
42406 frames in 5.0 seconds =3D 8481.144 FPS
42266 frames in 5.0 seconds =3D 8453.060 FPS
42444 frames in 5.0 seconds =3D 8488.649 FPS

$ vblank_mode=3D1 DRI_PRIME=3D1 glxgears
libGL error: Different GPU, but blitImage not implemented for this driver
libGL error: failed to load driver: i965
ATTENTION: default value of option vblank_mode overridden by environment.
42081 frames in 5.0 seconds =3D 8415.999 FPS
42527 frames in 5.0 seconds =3D 8505.298 FPS
42591 frames in 5.0 seconds =3D 8518.191 FPS
42508 frames in 5.0 seconds =3D 8501.433 FPS

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15645966990.17e3E.14388
Date: Wed, 31 Jul 2019 18:11:39 +0000
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
   title=3D"NEW - [DRI_PRIME] Error on multi GPU with only one enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111272">111272</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[DRI_PRIME] Error on multi GPU with only one enabled
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
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
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
          <td>parker.l.reed&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144921=
" name=3D"attach_144921" title=3D"DRI PRIME 0">attachment 144921</a> <a hre=
f=3D"attachment.cgi?id=3D144921&amp;action=3Dedit" title=3D"DRI PRIME 0">[d=
etails]</a></span>
DRI PRIME 0

I have a Razer Blade Stealth late 2016 with a Razer Core V1 and an RX 560.

Arch Linux

Linux stealth 5.2.1-arch1-1-fsync #1 SMP PREEMPT Mon Jul 22 17:40:06 PDT 20=
19
x86_64 GNU/Linux

mesa-aco-git 19.2.0_devel.114720.5c6077221dd-1 (Also happens on normal mesa=
-git
and mesa stable)

With only the AMDGPU enabled for Xorg, DRI_PRIME=3D1 attempts to use Intel,=
 falls
back to AMD as expected, but has the weird behavior of completely bypassing
vsync. DRI_PRIME=3D0 works as expected

Expected behavior is to ignore the Intel card since it's not currently load=
ed
in Xorg. I can obviously set DRI_PRIME=3D0 and be fine, but the DRI_PRIME=
=3D1
behavior seems to be a bug.

Xorg conf

Section &quot;Device&quot;
 Identifier &quot;AMD&quot;
 Driver &quot;amdgpu&quot;
 BusID &quot;PCI:07:0:0&quot;
EndSection

xrandr corroborates this in the listproviders output

Providers: number : 1
Provider 0: id: 0x57 cap: 0xf, Source Output, Sink Output, Source Offload, =
Sink
Offload crtcs: 5 outputs: 3 associated providers: 0 name:AMD Radeon (TM) RX=
 460
Graphics &#64; pci:0000:07:00.0

DRI_PRIME=3D1 glxinfo reports the same info aside from an error at the top =
of the
output

libGL error: Different GPU, but blitImage not implemented for this driver
libGL error: failed to load driver: i965

Full glxinfo attached for DRI_PRIME=3D0, DRI_PRIME=3D1, and DRI_PRIME=3D1 w=
ith
vblank_mode=3D1

glxgears for FPS example

$ DRI_PRIME=3D0 glxgears
Running synchronized to the vertical refresh.  The framerate should be
approximately the same as the monitor refresh rate.
333 frames in 5.0 seconds =3D 66.549 FPS
300 frames in 5.0 seconds =3D 59.999 FPS
300 frames in 5.0 seconds =3D 59.997 FPS
301 frames in 5.0 seconds =3D 60.001 FPS

$ DRI_PRIME=3D1 glxgears
libGL error: Different GPU, but blitImage not implemented for this driver
libGL error: failed to load driver: i965
Running synchronized to the vertical refresh.  The framerate should be
approximately the same as the monitor refresh rate.
42158 frames in 5.0 seconds =3D 8431.391 FPS
42406 frames in 5.0 seconds =3D 8481.144 FPS
42266 frames in 5.0 seconds =3D 8453.060 FPS
42444 frames in 5.0 seconds =3D 8488.649 FPS

$ vblank_mode=3D1 DRI_PRIME=3D1 glxgears
libGL error: Different GPU, but blitImage not implemented for this driver
libGL error: failed to load driver: i965
ATTENTION: default value of option vblank_mode overridden by environment.
42081 frames in 5.0 seconds =3D 8415.999 FPS
42527 frames in 5.0 seconds =3D 8505.298 FPS
42591 frames in 5.0 seconds =3D 8518.191 FPS
42508 frames in 5.0 seconds =3D 8501.433 FPS</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15645966990.17e3E.14388--

--===============1169973359==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1169973359==--
