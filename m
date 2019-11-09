Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C760F60C5
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2019 18:58:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86076E3F4;
	Sat,  9 Nov 2019 17:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id E51B86E3E3
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2019 17:57:57 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E22E3720E2; Sat,  9 Nov 2019 17:57:57 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Sat, 09 Nov 2019 17:57:57 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: lptech1024@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-cF4w5gI8jO@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111481-502@http.bugs.freedesktop.org/>
References: <bug-111481-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1565400032=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1565400032==
Content-Type: multipart/alternative; boundary="157332227711.E9AbEF1C3.27320"
Content-Transfer-Encoding: 7bit


--157332227711.E9AbEF1C3.27320
Date: Sat, 9 Nov 2019 17:57:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #223 from lptech1024@gmail.com ---
Followup to #216:

Fedora 31: Kernel 5.3.9, GNOME 3.34, Mesa 19.2.2, linux-firmware 20190923, =
LLVM
9.0.0

The hang is 100% reproducible.

It occurs running the Linux-native (Vulkan) version of Shadow of the Tomb
Raider (SotTR). I have never run SotTR under Proton/Wine, so that isn't a
confounding variable.

The (unskippable) cutscene is for the Amazon River in Peru and occurs anywh=
ere
between 15 seconds before the pilot is struck and the pilot is struck. Even
when the video hangs, you can usually hear fragments (sound effects) of the
game for a few seconds afterwords.

I ran SotTR with vktrace and activated the Gnome (Wayland) overview to see =
if
there I could catch any relevant terminal output (none that I saw). The game
still had focus, so it continued playing. After the hang (when I rebooted),
there wasn't a vktrace file. I would assume this would be either it didn't
write it out due to the hang or it didn't have content to write.

However, with it running visible in the overview (and a manual kernel updat=
e),
I got both ring gfx and sdma errors:

Nov 07 [SNIP]:24 [SNIP] kernel: [drm] GPU recovery disabled.
Nov 07 [SNIP]:24 [SNIP] kernel: [drm] GPU recovery disabled.
Nov 07 [SNIP]:24 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process  pid 0 thread  pid 0
Nov 07 [SNIP]:24 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process gnome-shell pid 1722 thread gnome-shel:cs0 pid
1768
Nov 07 [SNIP]:24 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* =
ring
sdma1 timeout, signaled seq=3D1049, emitted seq=3D1053
Nov 07 [SNIP]:24 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* =
ring
sdma0 timeout, signaled seq=3D30017, emitted seq=3D30020
Nov 07 [SNIP]:19 [SNIP] kernel: [drm] GPU recovery disabled.
Nov 07 [SNIP]:19 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process ShadowOfTheTomb pid 3890 thread WebViewRenderer
pid 4981
Nov 07 [SNIP]:19 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* =
ring
gfx_0.0.0 timeout, signaled seq=3D75610, emitted seq=3D75612
Nov 07 [SNIP]:19 [SNIP] kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]]
*ERROR* Waiting for fences timed out or interrupted!

As a workaround to proceed in the game, I downloaded the AMDVLD 2019.Q4.2 .=
deb,
extracted the contents, modified the JSON file (to point to the local
amdvlk64.so), and ran SotTR with the VK_ICD_FILENAMES variable set to the
AMDVLK JSON file.

The AMDVLK graphics were terrible (significant percentage of random pixels
turning random colors, bad rendering of elements, etc), but I did not
experience any hangs during the cutscene. After reaching a known save point=
, I
switched back to mesa/RADV-llvm and haven't experienced a hang since (haven=
't
progressed that much further yet, but that's the only hang so far - about 1=
3%
of the game has been completed).

This would seem to point to a bug at least partially due to mesa/RADV-llvm.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--157332227711.E9AbEF1C3.27320
Date: Sat, 9 Nov 2019 17:57:57 +0000
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
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c223">Comm=
ent # 223</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lptech1024&#64;gmail.com" title=3D"lptech1024&#64;gmail.com">lptech1024&#64=
;gmail.com</a>
</span></b>
        <pre>Followup to #216:

Fedora 31: Kernel 5.3.9, GNOME 3.34, Mesa 19.2.2, linux-firmware 20190923, =
LLVM
9.0.0

The hang is 100% reproducible.

It occurs running the Linux-native (Vulkan) version of Shadow of the Tomb
Raider (SotTR). I have never run SotTR under Proton/Wine, so that isn't a
confounding variable.

The (unskippable) cutscene is for the Amazon River in Peru and occurs anywh=
ere
between 15 seconds before the pilot is struck and the pilot is struck. Even
when the video hangs, you can usually hear fragments (sound effects) of the
game for a few seconds afterwords.

I ran SotTR with vktrace and activated the Gnome (Wayland) overview to see =
if
there I could catch any relevant terminal output (none that I saw). The game
still had focus, so it continued playing. After the hang (when I rebooted),
there wasn't a vktrace file. I would assume this would be either it didn't
write it out due to the hang or it didn't have content to write.

However, with it running visible in the overview (and a manual kernel updat=
e),
I got both ring gfx and sdma errors:

Nov 07 [SNIP]:24 [SNIP] kernel: [drm] GPU recovery disabled.
Nov 07 [SNIP]:24 [SNIP] kernel: [drm] GPU recovery disabled.
Nov 07 [SNIP]:24 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process  pid 0 thread  pid 0
Nov 07 [SNIP]:24 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process gnome-shell pid 1722 thread gnome-shel:cs0 pid
1768
Nov 07 [SNIP]:24 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* =
ring
sdma1 timeout, signaled seq=3D1049, emitted seq=3D1053
Nov 07 [SNIP]:24 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* =
ring
sdma0 timeout, signaled seq=3D30017, emitted seq=3D30020
Nov 07 [SNIP]:19 [SNIP] kernel: [drm] GPU recovery disabled.
Nov 07 [SNIP]:19 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process ShadowOfTheTomb pid 3890 thread WebViewRenderer
pid 4981
Nov 07 [SNIP]:19 [SNIP] kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* =
ring
gfx_0.0.0 timeout, signaled seq=3D75610, emitted seq=3D75612
Nov 07 [SNIP]:19 [SNIP] kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]]
*ERROR* Waiting for fences timed out or interrupted!

As a workaround to proceed in the game, I downloaded the AMDVLD 2019.Q4.2 .=
deb,
extracted the contents, modified the JSON file (to point to the local
amdvlk64.so), and ran SotTR with the VK_ICD_FILENAMES variable set to the
AMDVLK JSON file.

The AMDVLK graphics were terrible (significant percentage of random pixels
turning random colors, bad rendering of elements, etc), but I did not
experience any hangs during the cutscene. After reaching a known save point=
, I
switched back to mesa/RADV-llvm and haven't experienced a hang since (haven=
't
progressed that much further yet, but that's the only hang so far - about 1=
3%
of the game has been completed).

This would seem to point to a bug at least partially due to mesa/RADV-llvm.=
</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--157332227711.E9AbEF1C3.27320--

--===============1565400032==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1565400032==--
