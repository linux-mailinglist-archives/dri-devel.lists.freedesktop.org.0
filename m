Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE45491A3C3
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 12:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F184C10E049;
	Thu, 27 Jun 2024 10:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l17nsMvX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C319E10E049
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 10:30:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D07B4CE2D68
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 10:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04A50C32789
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 10:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719484224;
 bh=DOWsij1RoSAVbnVVvXpK9AWKClxS0XYPzX75wu/fQ+k=;
 h=From:To:Subject:Date:From;
 b=l17nsMvXUZurswqGqW8qd58CrGeHRayg29hpavuKchXbkADAt/Zsia3tAoZI7II7h
 PxqrFMeUej5TMnx5JVefCv8kPxwQhbHb5WDd2rZykIswMItGxgfVS2PpxDUYYD3spI
 L0HxgDJ9JY5+zYQSKUS+ctwJGebafMZHGywt+5p3+ip+V2JlkDpzqoViRjzbOEBZv+
 WxqCn6AAL0XuW32wa8YrteWCgm4OjiKW2+v+AFvupmonaZgHhDKgfSRNhpn2QiHJxX
 1I76CWomRpPjGRkWsOJZH/55/RXK3l+BptxBKZB46KIsZkjgNFX8m6E0l8zXUZ2B4Q
 Ciqrzt400pxaA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E7DC2C53B50; Thu, 27 Jun 2024 10:30:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218993] New: SIGBUS with amdgpu on multi-GPU system on X server
 with DRI3/GBM
Date: Thu, 27 Jun 2024 10:30:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: adaha@cendio.se
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-218993-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D218993

            Bug ID: 218993
           Summary: SIGBUS with amdgpu on multi-GPU system on X server
                    with DRI3/GBM
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: adaha@cendio.se
        Regression: No

Created attachment 306503
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306503&action=3Dedit
trace before crash, Xvnc on Ryzen 5 7600, vkcube on Arc A380

I ran into a SIGBUS when using multiple GPUs and DRI with an X server that =
has
GPU acceleration (TigerVNC's Xvnc). This happened on a machine with:
OS: Fedora 40 running 6.9.5-200.fc40.x86_64
iGPU: Ryzen 5 7600
dGPU: RTX 4060 | Arc A380 | RX 7600

The issue occurs when the X server is configured to use an AMD rendernode, =
and
an application wants to use a non-AMD rendernode.

When opening the AMD rendernode using gbm_create_device(), a SIGBUS will oc=
cur
when gbm_bo_map() is called, if the application wants to use another render=
node
that is not an AMD GPU.

In my setup, /dev/dri/renderD128 is the AMD iGPU, and /dev/dri/renderD129 i=
s an
RTX 4060.

If I run the X server with
$ Xvnc :50 -rendernode /dev/dri/renderD128

and vkcube with renderD129 on the X server
$ DISPLAY=3D:50 vkcube --gpu_number 1

I get the sigbus:
(EE)=20
(EE) Backtrace:
(EE) 0: Xvnc (xorg_backtrace+0x82) [0x560c52b47d42]
(EE) 1: Xvnc (0x560c52991000+0x1b7f4c) [0x560c52b48f4c]
(EE) 2: /lib64/libc.so.6 (0x7f0c99613000+0x40710) [0x7f0c99653710]
(EE) 3: /lib64/libpixman-1.so.0 (0x7f0c99ed0000+0x8a2d0) [0x7f0c99f5a2d0]
(EE) 4: /lib64/libpixman-1.so.0 (pixman_blt+0x81) [0x7f0c99ede8d1]
(EE) 5: Xvnc (vncDRI3SyncPixmapFromGPU+0x10e) [0x560c529f303e]
(EE) 6: Xvnc (0x560c52991000+0x622c3) [0x560c529f32c3]
(EE) 7: Xvnc (dri3_pixmap_from_fds+0xcf) [0x560c52a7fdaf]
(EE) 8: Xvnc (0x560c52991000+0xf1309) [0x560c52a82309]
(EE) 9: Xvnc (Dispatch+0x426) [0x560c52ae3f56]
(EE) 10: Xvnc (dix_main+0x46a) [0x560c52af2d4a]
(EE) 11: /lib64/libc.so.6 (0x7f0c99613000+0x2a088) [0x7f0c9963d088]
(EE) 12: /lib64/libc.so.6 (__libc_start_main+0x8b) [0x7f0c9963d14b]
(EE) 13: Xvnc (_start+0x25) [0x560c529eed75]
(EE)=20
(EE) Bus error at address 0x7f0c8e211000
(EE)=20
Fatal server error:
(EE) Caught signal 7 (Bus error). Server aborting
(EE)=20
Aborted (core dumped)

The same crash occurs when running vkcube on an Arc GPU (A380).

However, running the X server on an Arc or Nvidia GPU, and vkcube on the AMD
GPU, does not cause a crash. Neither does running the X server on AMD, and
vkcube on a different AMD GPU (iGPU & RX 7600 for example).

I've attached a stacktrace with the last call to mmap() before the crash.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
