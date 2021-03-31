Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDC834FC38
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 11:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CA86EA02;
	Wed, 31 Mar 2021 09:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CC06EA02
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 09:10:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id ECD41619AB
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 09:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617181814;
 bh=2aOfiHu4Z0ZQ94y6vCszpkzIDDeZivTtf0LyFelZbIA=;
 h=From:To:Subject:Date:From;
 b=ffaFVkQ1ErUsuIlsLW2u18N/9j72GB+NxSx1bnvNz3UkOCxAG7e9BcFgCPcRmYIAz
 mYCNSEU1DncuV4cxhm+VmLmr8p7Ka8yY1nIWnqNUE0azngyHaPfdjK13NTyP5fLrWm
 4nv2og6xtxAl7XONMjHOi59Jk+vOWQYVcm/Triv+kPuWdDbg33njLiWY+dqjoPMfP1
 FkF4+m69PIQP9R8srqswqBpUAC5/Fn0jDC2+wDCov5FLuY+3q3vfZ+Rz+DL6PGZps1
 4Mbrz3n+55QM5WRk3bTxbp/S3t067pyzpDrLMSvZ+/pzk6bis27QIArsCFqClCwuwS
 lW0vEVYUWeQAQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E464362ABE; Wed, 31 Mar 2021 09:10:13 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212499] New: nouveau locking issue - WARNING: possible circular
 locking dependency detected
Date: Wed, 31 Mar 2021 09:10:13 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cc cf_regression attachments.created
Message-ID: <bug-212499-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212499

            Bug ID: 212499
           Summary: nouveau locking issue - WARNING: possible circular
                    locking dependency detected
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.12-rc5
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
                CC: dri-devel@lists.freedesktop.org
        Regression: No

Created attachment 296155
  --> https://bugzilla.kernel.org/attachment.cgi?id=296155&action=edit
dmesg (kernel 5.12-rc5, A10-9700E)

[...]
======================================================
WARNING: possible circular locking dependency detected
5.12.0-rc5-Excavator #4 Not tainted
------------------------------------------------------
X/593 is trying to acquire lock:
ffff95f9110ec518 (&cli->mutex){+.+.}-{3:3}, at: nouveau_bo_move+0x167/0x990
[nouveau]

 but task is already holding lock:
ffff95f8e70281a0 (reservation_ww_class_mutex){+.+.}-{3:3}, at:
nouveau_bo_pin+0x3b/0x3c0 [nouveau]

 which lock already depends on the new lock.

 the existing dependency chain (in reverse order) is:

 -> #1 (reservation_ww_class_mutex){+.+.}-{3:3}:
       __ww_mutex_lock.constprop.0+0x99/0xf20
       nouveau_bo_pin+0x3b/0x3c0 [nouveau]
       nouveau_channel_prep+0x126/0x2f0 [nouveau]
       nouveau_channel_new+0x5d/0x6b0 [nouveau]
       nouveau_abi16_ioctl_channel_alloc+0x10d/0x3a0 [nouveau]
       drm_ioctl_kernel+0xa8/0xf0 [drm]
       drm_ioctl+0x20a/0x3a0 [drm]
       nouveau_drm_ioctl+0x50/0xa0 [nouveau]
       __x64_sys_ioctl+0x81/0xa0
       do_syscall_64+0x33/0x40
       entry_SYSCALL_64_after_hwframe+0x44/0xae

 -> #0 (&cli->mutex){+.+.}-{3:3}:
       __lock_acquire+0x1480/0x2610
       lock_acquire+0xc4/0x390
       __mutex_lock+0x78/0x870
       nouveau_bo_move+0x167/0x990 [nouveau]
       ttm_bo_handle_move_mem+0x8b/0x170 [ttm]
       ttm_bo_validate+0x193/0x1f0 [ttm]
       nouveau_bo_pin+0x177/0x3c0 [nouveau]
       nv50_wndw_prepare_fb+0x5a/0x4c0 [nouveau]
       drm_atomic_helper_prepare_planes+0x85/0x110 [drm_kms_helper]
       nv50_disp_atomic_commit+0xa6/0x1d0 [nouveau]
       drm_atomic_helper_update_plane+0xe4/0x140 [drm_kms_helper]
       drm_mode_cursor_universal+0x126/0x230 [drm]
       drm_mode_cursor_common+0xfc/0x230 [drm]
       drm_mode_cursor_ioctl+0x46/0x60 [drm]
       drm_ioctl_kernel+0xa8/0xf0 [drm]
       drm_ioctl+0x20a/0x3a0 [drm]
       nouveau_drm_ioctl+0x50/0xa0 [nouveau]
       __x64_sys_ioctl+0x81/0xa0
       do_syscall_64+0x33/0x40
       entry_SYSCALL_64_after_hwframe+0x44/0xae

 other info that might help us debug this:
 Possible unsafe locking scenario:
       CPU0                    CPU1
       ----                    ----
  lock(reservation_ww_class_mutex);
                               lock(&cli->mutex);
                               lock(reservation_ww_class_mutex);
  lock(&cli->mutex);

  *** DEADLOCK ***
3 locks held by X/593:
 #0: ffffaae9888e7ce0 (crtc_ww_class_acquire){+.+.}-{0:0}, at:
drm_mode_cursor_common+0xbb/0x230 [drm]
 #1: ffff95f9113b0098 (crtc_ww_class_mutex){+.+.}-{3:3}, at:
modeset_lock+0x5f/0x1c0 [drm]
 #2: ffff95f8e70281a0 (reservation_ww_class_mutex){+.+.}-{3:3}, at:
nouveau_bo_pin+0x3b/0x3c0 [nouveau]

 stack backtrace:
CPU: 3 PID: 593 Comm: X Not tainted 5.12.0-rc5-Excavator #4
Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./A320M-HDV R3.0,
BIOS P3.10 06/26/2019
Call Trace:
 dump_stack+0x7f/0xad
 check_noncircular+0x104/0x120
 ? nvkm_uvmm_mthd+0x778/0x7b0 [nouveau]
 __lock_acquire+0x1480/0x2610
 lock_acquire+0xc4/0x390
 ? nouveau_bo_move+0x167/0x990 [nouveau]
 ? nvif_object_mthd+0x112/0x130 [nouveau]
 __mutex_lock+0x78/0x870
 ? nouveau_bo_move+0x167/0x990 [nouveau]
 ? nouveau_bo_move+0x167/0x990 [nouveau]
 nouveau_bo_move+0x167/0x990 [nouveau]
 ? unmap_mapping_pages+0x59/0x120
 ttm_bo_handle_move_mem+0x8b/0x170 [ttm]
 ttm_bo_validate+0x193/0x1f0 [ttm]
 ? nouveau_bo_sync_for_device+0x9b/0xe0 [nouveau]
 nouveau_bo_pin+0x177/0x3c0 [nouveau]
 nv50_wndw_prepare_fb+0x5a/0x4c0 [nouveau]
 ? _raw_spin_unlock_irqrestore+0x42/0x50
 drm_atomic_helper_prepare_planes+0x85/0x110 [drm_kms_helper]
 ? lockdep_init_map_type+0x47/0x220
 nv50_disp_atomic_commit+0xa6/0x1d0 [nouveau]
 drm_atomic_helper_update_plane+0xe4/0x140 [drm_kms_helper]
 drm_mode_cursor_universal+0x126/0x230 [drm]
 drm_mode_cursor_common+0xfc/0x230 [drm]
 ? drm_mode_setplane+0x1a0/0x1a0 [drm]
 drm_mode_cursor_ioctl+0x46/0x60 [drm]
 drm_ioctl_kernel+0xa8/0xf0 [drm]
 drm_ioctl+0x20a/0x3a0 [drm]
 ? drm_mode_setplane+0x1a0/0x1a0 [drm]
 ? lockdep_hardirqs_on_prepare+0xd4/0x180
 ? _raw_spin_unlock_irqrestore+0x42/0x50
 nouveau_drm_ioctl+0x50/0xa0 [nouveau]
 __x64_sys_ioctl+0x81/0xa0
 do_syscall_64+0x33/0x40
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f0621dbecc7
Code: 3c 1c 48 f7 d8 49 39 c4 72 b9 e8 24 ff ff ff 85 c0 78 be 5b 4c 89 e0 5d
41 5c c3 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01
c3 48 8b 0d 71 41 0c 00 f7 d8 64 89 01 48
RSP: 002b:00007ffd8eb88dc8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 000000000000000c RCX: 00007f0621dbecc7
RDX: 00007ffd8eb88e1c RSI: 00000000c01c64a3 RDI: 000000000000000c
RBP: 00000000c01c64a3 R08: 0000000000000040 R09: 0000000000000001
R10: 00007f0622505bc0 R11: 0000000000000246 R12: 000055fbec3f5ec0
R13: 00007ffd8eb88e1c R14: 00000000000003bc R15: 0000000000000218


 # lspci -s 04:00.0 -v
04:00.0 VGA compatible controller: NVIDIA Corporation GK208B [GeForce GT 710]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: ASUSTeK Computer Inc. GT710-4H-SL-2GD5
        Flags: bus master, fast devsel, latency 0, IRQ 51, IOMMU group 0
        Memory at fd000000 (32-bit, non-prefetchable) [size=16M]
        Memory at e8000000 (64-bit, prefetchable) [size=128M]
        Memory at f0000000 (64-bit, prefetchable) [size=32M]
        I/O ports at e000 [size=128]
        Expansion ROM at 000c0000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Legacy Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024
<?>
        Capabilities: [900] Secondary PCI Express
        Kernel driver in use: nouveau
        Kernel modules: nouveau

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
