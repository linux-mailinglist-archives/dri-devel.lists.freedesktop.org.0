Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 786471F604D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 05:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD0789F03;
	Thu, 11 Jun 2020 03:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F4789F03
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 03:08:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208135] New: AMDGPU sleep with preemption disabled
Date: Thu, 11 Jun 2020 03:08:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yshuiv7@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-208135-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=208135

            Bug ID: 208135
           Summary: AMDGPU sleep with preemption disabled
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.7.2
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: yshuiv7@gmail.com
        Regression: No

Discovered by lockdep:

[   39.797936] BUG: sleeping function called from invalid context at
mm/slab.h:567
[   39.799669] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1894,
name: Xorg.wrap
[   39.801379] INFO: lockdep is turned off.
[   39.803079] Preemption disabled at:
[   39.803084] [<ffffffffad67ff2e>] kernel_fpu_begin+0xe/0x70
[   39.806304] CPU: 22 PID: 1894 Comm: Xorg.wrap Tainted: P        W  O    T
5.7.2-local+ #15
[   39.807849] Hardware name: System manufacturer System Product Name/ROG STRIX
X470-F GAMING, BIOS 5406 11/13/2019
[   39.809341] Call Trace:
[   39.810828]  show_stack+0x3e/0x40
[   39.812311]  dump_stack+0x7a/0xaa
[   39.813802]  ___might_sleep.cold+0xfa/0x10b
[   39.815280]  __might_sleep+0x50/0x90
[   39.816775]  __kmalloc+0x1d6/0x230
[   39.818249]  ? dcn20_validate_bandwidth_internal+0x6d/0x260
[   39.819722]  dcn20_validate_bandwidth_internal+0x6d/0x260
[   39.821217]  dcn20_validate_bandwidth_fp+0x37/0xc0
[   39.822698]  dcn20_validate_bandwidth+0x2f/0x50
[   39.824172]  dc_validate_global_state+0x293/0x320
[   39.825654]  amdgpu_dm_atomic_check+0x475/0x7a0
[   39.827130]  drm_atomic_check_only+0x1e3/0x370
[   39.828595]  drm_atomic_commit+0x1c/0x60
[   39.830052]  drm_client_modeset_commit_atomic+0x1e4/0x250
[   39.831538]  drm_client_modeset_commit_locked+0x58/0x90
[   39.832989]  drm_client_modeset_commit+0x2a/0x50
[   39.834455]  drm_fb_helper_lastclose+0x56/0xa0
[   39.835913]  amdgpu_driver_lastclose_kms+0x9/0x10
[   39.837372]  drm_release+0xd7/0x110
[   39.838821]  __fput+0xf2/0x280
[   39.840255]  ____fput+0x10/0x20
[   39.841667]  task_work_run+0x62/0xa0
[   39.843027]  exit_to_usermode_loop+0xa7/0xb0
[   39.844343]  prepare_exit_to_usermode+0xd6/0x100
[   39.845586]  do_syscall_64+0x99/0x180
[   39.846794]  entry_SYSCALL_64_after_hwframe+0x49/0xb3
[   39.847994] RIP: 0033:0x7fcaa32852f7
[   39.849169] Code: ff e8 6d e5 01 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00
f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 03 00 00 00 0f 05 <48> 3d 00
f0 ff ff 77 41 c3 48 83 ec 18 89 7c 24 0c e8 13 4d f9 ff
[   39.850483] RSP: 002b:00007ffc0988ac68 EFLAGS: 00000246 ORIG_RAX:
0000000000000003
[   39.851802] RAX: 0000000000000000 RBX: 0000000000000001 RCX:
00007fcaa32852f7
[   39.853111] RDX: 00007ffc0988ac80 RSI: 00000000c04064a0 RDI:
0000000000000003
[   39.854431] RBP: 00007ffc0988acd0 R08: 0000000000000000 R09:
00007ffc0988aaf0
[   39.855737] R10: 000055c3f212f64b R11: 0000000000000246 R12:
0000000000000003
[   39.857039] R13: 0000000000000001 R14: 0000000000000000 R15:
00007ffc0988ac80
[   47.693575] BUG: sleeping function called from invalid context at
mm/slab.h:567
[   47.693581] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1894,
name: Xorg
[   47.693584] INFO: lockdep is turned off.
[   47.693585] Preemption disabled at:
[   47.693590] [<ffffffffad67ff2e>] kernel_fpu_begin+0xe/0x70
[   47.693595] CPU: 23 PID: 1894 Comm: Xorg Tainted: P        W  O    T
5.7.2-local+ #15
[   47.693598] Hardware name: System manufacturer System Product Name/ROG STRIX
X470-F GAMING, BIOS 5406 11/13/2019
[   47.693600] Call Trace:
[   47.693606]  show_stack+0x3e/0x40
[   47.693611]  dump_stack+0x7a/0xaa
[   47.693615]  ___might_sleep.cold+0xfa/0x10b
[   47.693619]  __might_sleep+0x50/0x90
[   47.693624]  __kmalloc+0x1d6/0x230
[   47.693628]  ? dcn20_validate_bandwidth_internal+0x6d/0x260
[   47.693632]  dcn20_validate_bandwidth_internal+0x6d/0x260
[   47.693636]  dcn20_validate_bandwidth_fp+0x37/0xc0
[   47.693640]  dcn20_validate_bandwidth+0x2f/0x50
[   47.693644]  dc_validate_global_state+0x293/0x320
[   47.693649]  amdgpu_dm_atomic_check+0x475/0x7a0
[   47.693654]  drm_atomic_check_only+0x1e3/0x370
[   47.693658]  drm_atomic_commit+0x1c/0x60
[   47.693662]  drm_atomic_helper_set_config+0x80/0xd0
[   47.693666]  drm_mode_setcrtc+0x1fa/0x7d0
[   47.693675]  ? drm_mode_getcrtc+0x1b0/0x1b0
[   47.693679]  drm_ioctl_kernel+0x96/0xe0
[   47.693684]  drm_ioctl+0x22f/0x3c8
[   47.693686]  ? drm_mode_getcrtc+0x1b0/0x1b0
[   47.693694]  ? _raw_spin_unlock_irqrestore+0x38/0x60
[   47.693698]  amdgpu_drm_ioctl+0x55/0x90
[   47.693703]  ksys_ioctl+0x97/0xb0
[   47.693707]  __x64_sys_ioctl+0x15/0x20
[   47.693710]  do_syscall_64+0x5e/0x180
[   47.693714]  entry_SYSCALL_64_after_hwframe+0x49/0xb3
[   47.693717] RIP: 0033:0x7fcc6ea748eb
[   47.693720] Code: 0f 1e fa 48 8b 05 a5 95 0c 00 64 c7 00 26 00 00 00 48 c7
c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d 75 95 0c 00 f7 d8 64 89 01 48
[   47.693722] RSP: 002b:00007ffddc4aa4f8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[   47.693725] RAX: ffffffffffffffda RBX: 00007ffddc4aa530 RCX:
00007fcc6ea748eb
[   47.693727] RDX: 00007ffddc4aa530 RSI: 00000000c06864a2 RDI:
000000000000000f
[   47.693729] RBP: 00000000c06864a2 R08: 0000000000000000 R09:
000055fa7b8ba8f0
[   47.693731] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000000
[   47.693733] R13: 000000000000000f R14: 000055fa7acbcac0 R15:
0000000000000000

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
