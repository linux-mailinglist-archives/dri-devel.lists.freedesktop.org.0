Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BD132ED3D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 15:36:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B566EBA6;
	Fri,  5 Mar 2021 14:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D21E6EBA0
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 14:35:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4780E64FD4
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 14:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614954955;
 bh=B6Wz8mHk4b2Vb9vz1c/zhw/N5NItVuvmntHs4JVs8nU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=CUuRiiyPfOh2elmUIzj9RH58UtSr1/Srd7vyQ320+VsL+VO38upDcgPqUs6T2MOxv
 5FKyo+/mdoRBv4DrbwJvYp3xmAkG+wyyKjvVVvM1Y+qcIl7WsV/XKuDU82oetXldcd
 NOdStL9sty4vYy/q89D6cB85Pos19akJPG/wd2vGtYYKswweUk9zBIR2UyvxaUr+Mf
 2Y1PAMgHR0OpDzOhOCZjXS5XrzxxW8zc8HdzkLYizs0frQaSNy/AFS/agMXloMC1SU
 oPyXR82E7aV8jUsUfsDKUODLqNWBV8CZkh0j/XS28BRfLUwXA1J9Ibjl9UqkB6YoEG
 ny4MvW1cYn2Cw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 446DF6530C; Fri,  5 Mar 2021 14:35:55 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209457] AMDGPU resume fail with RX 580 GPU
Date: Fri, 05 Mar 2021 14:35:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernel@svenfoo.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-209457-2300-ynfKJtnuqr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209457-2300@https.bugzilla.kernel.org/>
References: <bug-209457-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=209457

Sven Neumann (kernel@svenfoo.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kernel@svenfoo.org

--- Comment #20 from Sven Neumann (kernel@svenfoo.org) ---
I am experiencing what appears to be the same problem. My hardware is a Lenovo
Thinkpad 14s with AMD Ryzen 4750u. The notebook quite frequently doesn't come
out of suspend. Or rather it seems to come out of suspend, but can not
initialize the graphics hardware, resulting in a black screen:

Mar 05 13:31:23 zapp systemd[1]: Starting Suspend...
Mar 05 13:31:23 zapp systemd-sleep[4072]: Suspending system...
Mar 05 13:31:23 zapp kernel: PM: suspend entry (s2idle)
Mar 05 13:31:23 zapp kernel: Filesystems sync: 0.009 seconds
Mar 05 13:31:38 zapp kernel: rfkill: input handler enabled
Mar 05 13:31:38 zapp kernel: Freezing user space processes ... (elapsed 0.003
seconds) done.
Mar 05 13:31:38 zapp kernel: OOM killer disabled.
Mar 05 13:31:38 zapp kernel: Freezing remaining freezable tasks ... (elapsed
0.001 seconds) done.
Mar 05 13:31:38 zapp kernel: [drm] free PSP TMR buffer
Mar 05 13:31:38 zapp kernel: ACPI: EC: interrupt blocked
Mar 05 13:31:38 zapp kernel: ACPI: button: The lid device is not compliant to
SW_LID.
Mar 05 13:31:38 zapp kernel: ACPI: EC: interrupt unblocked
Mar 05 13:31:38 zapp kernel: pci 0000:00:00.2: can't derive routing for PCI INT
A
Mar 05 13:31:38 zapp kernel: pci 0000:00:00.2: PCI INT A: no GSI
Mar 05 13:31:38 zapp kernel: usb usb2: root hub lost power or was reset
Mar 05 13:31:38 zapp kernel: usb usb3: root hub lost power or was reset
Mar 05 13:31:38 zapp kernel: xhci_hcd 0000:05:00.0: Zeroing 64bit base
registers, expecting fault
Mar 05 13:31:38 zapp kernel: [drm] PCIE GART of 1024M enabled (table at
0x000000F400900000).
Mar 05 13:31:38 zapp kernel: [drm] PSP is resuming...
Mar 05 13:31:38 zapp kernel: [drm] reserve 0x400000 from 0xf41f800000 for PSP
TMR
Mar 05 13:31:38 zapp kernel: amdgpu 0000:06:00.0: amdgpu: SMU is resuming...
Mar 05 13:31:38 zapp kernel: amdgpu 0000:06:00.0: amdgpu: dpm has been disabled
Mar 05 13:31:38 zapp kernel: amdgpu 0000:06:00.0: amdgpu: SMU is resumed
successfully!
Mar 05 13:31:38 zapp kernel: usb 2-2: reset high-speed USB device number 2
using xhci_hcd
Mar 05 13:31:38 zapp kernel: [drm] kiq ring mec 2 pipe 1 q 0
Mar 05 13:31:38 zapp kernel: [drm] DMUB hardware initialized:
version=0x00000001
Mar 05 13:31:38 zapp kernel: [drm] VCN decode and encode initialized
successfully(under DPG Mode).
Mar 05 13:31:38 zapp kernel: [drm] JPEG decode initialized successfully.
Mar 05 13:31:38 zapp kernel: amdgpu 0000:06:00.0: amdgpu: ring gfx uses VM inv
eng 0 on hub 0
Mar 05 13:31:38 zapp kernel: amdgpu 0000:06:00.0: amdgpu: ring comp_1.0.0 uses
VM inv eng 1 on hub 0
Mar 05 13:31:38 zapp kernel: amdgpu 0000:06:00.0: amdgpu: ring comp_1.1.0 uses
VM inv eng 4 on hub 0
Mar 05 13:31:38 zapp kernel: amdgpu 0000:06:00.0: amdgpu: ring comp_1.2.0 uses
VM inv eng 5 on hub 0
Mar 05 13:31:38 zapp kernel: amdgpu 0000:06:00.0: amdgpu: ring comp_1.3.0 uses
VM inv eng 6 on hub 0
Mar 05 13:31:38 zapp kernel: amdgpu 0000:06:00.0: amdgpu: ring comp_1.0.1 uses
VM inv eng 7 on hub 0
Mar 05 13:31:38 zapp kernel: amdgpu 0000:06:00.0: amdgpu: ring comp_1.1.1 uses
VM inv eng 8 on hub 0
Mar 05 13:31:38 zapp kernel: amdgpu 0000:06:00.0: amdgpu: ring comp_1.2.1 uses
VM inv eng 9 on hub 0
Mar 05 13:31:38 zapp kernel: amdgpu 0000:06:00.0: amdgpu: ring comp_1.3.1 uses
VM inv eng 10 on hub 0
Mar 05 13:31:38 zapp kernel: amdgpu 0000:06:00.0: amdgpu: ring kiq_2.1.0 uses
VM inv eng 11 on hub 0
Mar 05 13:31:38 zapp kernel: amdgpu 0000:06:00.0: amdgpu: ring sdma0 uses VM
inv eng 0 on hub 1
Mar 05 13:31:38 zapp kernel: amdgpu 0000:06:00.0: amdgpu: ring vcn_dec uses VM
inv eng 1 on hub 1
Mar 05 13:31:38 zapp kernel: amdgpu 0000:06:00.0: amdgpu: ring vcn_enc0 uses VM
inv eng 4 on hub 1
Mar 05 13:31:38 zapp kernel: amdgpu 0000:06:00.0: amdgpu: ring vcn_enc1 uses VM
inv eng 5 on hub 1
Mar 05 13:31:38 zapp kernel: amdgpu 0000:06:00.0: amdgpu: ring jpeg_dec uses VM
inv eng 6 on hub 1
Mar 05 13:31:38 zapp kernel: amdgpu 0000:06:00.0: [drm:amdgpu_ib_ring_tests
[amdgpu]] *ERROR* IB test failed on gfx (-110).
Mar 05 13:31:38 zapp kernel: fbcon: Taking over console
Mar 05 13:31:38 zapp kernel: [drm:amdgpu_device_delayed_init_work_handler
[amdgpu]] *ERROR* ib ring test failed (-110).
Mar 05 13:31:38 zapp kernel: [drm] Failed to add display topology, DTM TA is
not initialized.


The most relevant part seems to be

[drm:amdgpu_ib_ring_tests [amdgpu]] *ERROR* IB test failed on gfx (-110).

This is on 5.12-rc1+, compiled from master this morning. But I have seen this
problem with Ubuntu mainline kernels 5.10.17, 5.10.20 and 5.11.3 as well.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
