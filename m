Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4FFB3B13E
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 04:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D221910EB45;
	Fri, 29 Aug 2025 02:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kEWwES9b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB7F10EB40
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 02:56:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EFC2F43649
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 02:56:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D128DC4CEED
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 02:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756436166;
 bh=2Foe64bRE3OBjBad4ufhn52nnce2BLkMZuBM3a5+Q7o=;
 h=From:To:Subject:Date:From;
 b=kEWwES9buFjRrJsdUKevzdnqGKhkjaTiGggV+Fp7e8/Z3oyWt0sQHLThYVJwg8r4d
 Jd200FcPZARk4XklJBQfj2dmOiDYTYR93PZGScx6nwvZuzPS0vfVJl+s+XkGv/79cw
 ud74ie2d6KEt9sP9KQLcEPbkxEmANtfQqoJMQwsetQ8mwp0R1hlEJbE4fAYA4WVlpT
 1KnuVrFwBNVg4dW6tziSD9Bl0gzMxWlk71oHFQcG+yooCAoZ573G1qVCjILtfXA+bx
 u8SoBBxmoI0OlA48Kgn93o1UE59PXxyH8agWjf0Z71JOcCNVi67Gnu7/20OdAL+XCp
 lG/Pzgi81UXvg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BC8B8C41613; Fri, 29 Aug 2025 02:56:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220512] New: The amdgpu driver fails to initialize my dedicated
 Navi33 GPU at boot,
 logging a "Fatal error during GPU init" and "gmc_v11_0
 failed" despite using the most recent kernels.
Date: Fri, 29 Aug 2025 02:56:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: ricardo1529@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220512-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220512

            Bug ID: 220512
           Summary: The amdgpu driver fails to initialize my dedicated
                    Navi33 GPU at boot, logging a "Fatal error during GPU
                    init" and "gmc_v11_0 failed" despite using the most
                    recent kernels.
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: ricardo1529@gmail.com
        Regression: No

Created attachment 308574
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308574&action=3Dedit
various logs combined into one file because i can't upload more than one or
don't know any other way to upload more than one log

My system, which has an AMD APU and a dedicated AMD GPU (Navi33), fails to
initialize the dedicated GPU. The system boots successfully and uses the
integrated GPU, but the dedicated card is not functional. This issue persis=
ts
even on the latest linux-image-liquorix kernel.

Steps to Reproduce:

    Boot the system with the dedicated AMD GPU installed.

    Start the Linux kernel (the issue persists across recent kernels, inclu=
ding
the latest from the Liquorix repository).

Expected Behavior:
The amdgpu kernel driver should initialize the Navi33 dGPU, enabling it for
graphical output and compute tasks. The dGPU should be listed by lspci and
appear in the X.Org log and other system tools as a functional device.

Actual Behavior:
The kernel logs show a fatal error during the amdgpu driver's initializatio=
n of
the dGPU. The boot process continues, but the dGPU remains inactive, and the
system relies on the integrated graphics. The dmesg output shows the follow=
ing
key errors:

[drm:amdgpu_bo_init [amdgpu]] *ERROR* Unable to set WC memtype for the aper=
ture
base
[drm:amdgpu_device_init.cold [amdgpu]] *ERROR* sw_init of IP block <gmc_v11=
_0>
failed -22
amdgpu 0000:03:00.0: amdgpu: Fatal error during GPU init
amdgpu 0000:03:00.0: amdgpu: amdgpu: finishing device.
amdgpu 0000:03:00.0: probe with driver amdgpu failed with error -22

The error appears to be a low-level initialization failure related to the
gmc_v11_0 IP block, which is the Graphics Memory Controller. The "Unable to=
 set
WC memtype" error suggests a problem with setting up the write-combining me=
mory
aperture for the GPU.

System Details:

    CPU: ryzen  7 7700x

    Motherboard: ASUS TUF GAMING B850-PLUS WIFI

    BIOS Version: 1079

    Integrated GPU (iGPU): AMD AMD Radeon=E2=84=A2 Graphics, which is worki=
ng
correctly.

    Dedicated GPU (dGPU): AMD rx 7600xt (Navi33)

    Kernel Version: Linux debian 6.16.3-1-liquorix-amd64 #1 ZEN SMP
PREEMPT_DYNAMIC liquorix 6.16-2.1~sid (2025-08-24) x86_64 GNU/Linux

    Distribution: Debian Trixie

    Boot Parameters: audit=3D0 intel_pstate=3Ddisable amd_pstate=3Ddisable=
=20
BOOT_IMAGE=3D/boot/vmlinuz-6.16.3-1-liquorix-amd64
root=3DUUID=3Dacec125d-fb52-4e62-a417-7d8e976e34f7 ro quiet
usbcore.quirks=3D1-6:hub_port_remap,13d3:3602:no-auto-suspend


Additional Notes:

    I have confirmed this behavior on both the standard Debian kernel and a
newer Liquorix kernel, suggesting the issue is not specific to a single ker=
nel
package version.

    The system functions normally when using the iGPU

attached various bug report logs combined into one

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
