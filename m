Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B69379CD2
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 04:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2541B6E9A1;
	Tue, 11 May 2021 02:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECCCB6E9A1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 02:17:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BE6AC616E9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 02:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620699449;
 bh=JdUnylCj9N0KFccrqiDvk7AJYPKWPEsJGA9wCGZkX44=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MuBsey4c4RHb8P7VUqyPicLQeZhZcmZhnToZqUXhR4zgwGIR0vM5M+rlAMzR+fr2P
 CsZHEHIRYFHSFcSIf+Da1xsJqcICBXuHs8KSvYKu8Boo7MN2OSJbwov1zKjcT4TEp3
 xaeuBhufShy3AFz0bu3wayCIidiBf1K/tm2Qb00ZtuG+cwAECT4HZgqe/LzvPhiJUU
 2NS4+aH0mpjcmv5iQ5505FPzZXWT8balhsdySdoaTgmAJwOBbE8a5BlnosOXEXHAbV
 ovJbhicFiH1i2XzzxN5xqBRwCUXJ73hF1Ece1xmtNd71USd0rf62e58ReOK0Kd9HQu
 UcnH6TxTCFoEw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B7AF26121E; Tue, 11 May 2021 02:17:29 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211875] CPU frequency scaling lost after "WARNING: CPU: 2 PID:
 2358578 at smu8_send_msg_to_smc_with_parameter+0xfe/0x140 [amdgpu]"
Date: Tue, 11 May 2021 02:17:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-211875-2300-0TYSa1gZAy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211875-2300@https.bugzilla.kernel.org/>
References: <bug-211875-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211875

--- Comment #10 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 296715
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296715&action=3Dedit
dmesg (kernel 5.13-rc1, A10-9700E)

Some locking stacktrace on kernel v5.13-rc1 before the usual
"smu8_send_msg_to_smc_with_parameter" messages:

[...]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
WARNING: inconsistent lock state
5.13.0-rc1-bdver4 #9 Not tainted
--------------------------------
inconsistent {HARDIRQ-ON-W} -> {IN-HARDIRQ-W} usage.
X/591 [HC1[1]:SC0[0]:HE0:SE1] takes:
ffffffffbe37d160 (fs_reclaim){?.+.}-{0:0}, at: fs_reclaim_acquire+0xf7/0x160
{HARDIRQ-ON-W} state was registered at:
  lock_acquire+0x1a0/0x6e0
  fs_reclaim_acquire+0x117/0x160
  kmem_cache_alloc_trace+0x3b/0x320
  init_rescuer+0x80/0x330
  workqueue_init+0x12f/0x2fd
  kernel_init_freeable+0x305/0x584
  kernel_init+0x8/0x116
  ret_from_fork+0x22/0x30
irq event stamp: 68143332
hardirqs last  enabled at (68143331): [<ffffffffbd800baf>]
asm_sysvec_apic_timer_interrupt+0xf/0x20
hardirqs last disabled at (68143332): [<ffffffffbd774184>]
common_interrupt+0x14/0xa0
softirqs last  enabled at (68143304): [<ffffffffbc0d0cd9>]
irq_exit_rcu+0x119/0x1a0
softirqs last disabled at (68143299): [<ffffffffbc0d0cd9>]
irq_exit_rcu+0x119/0x1a0

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(fs_reclaim);
  <Interrupt>
    lock(fs_reclaim);

 *** DEADLOCK ***

5 locks held by X/591:
 #0: ffff88810397fa20 (crtc_ww_class_acquire){+.+.}-{0:0}, at:
set_property_atomic+0xb2/0x2f0 [drm]
 #1: ffff88812bc00538 (crtc_ww_class_mutex){+.+.}-{3:3}, at:
modeset_lock+0x364/0x500 [drm]
 #2: ffff88812bc1cb58 (&adev->dm.dc_lock){+.+.}-{3:3}, at:
amdgpu_dm_atomic_commit_tail+0xa12/0x9870 [amdgpu]
 #3: ffff8881538d6880 (&hwmgr->smu_lock){+.+.}-{3:3}, at:
pp_dpm_dispatch_tasks+0x50/0x90 [amdgpu]
 #4: ffff8881538d6910 (&hwmgr->msg_lock){+.+.}-{3:3}, at:
smum_send_msg_to_smc_with_parameter+0x1bf/0x300 [amdgpu]

stack backtrace:
CPU: 1 PID: 591 Comm: X Not tainted 5.13.0-rc1-bdver4 #9
Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./A320M-HDV R3.0,
BIOS P3.10 06/26/2019
Call Trace:
 <IRQ>
 dump_stack+0xa5/0xe6
 mark_lock.cold+0x145/0x14f
 ? lock_chain_count+0x20/0x20
 ? mark_lock+0xee/0x2fd0
 ? lock_chain_count+0x20/0x20
 ? lock_chain_count+0x20/0x20
 ? lock_chain_count+0x20/0x20
 ? rcu_read_lock_sched_held+0x3a/0x70
 __lock_acquire+0x146a/0x5d40
 ? debug_check_no_locks_held+0xa0/0xa0
 ? mark_lock+0xee/0x2fd0
 ? debug_check_no_locks_held+0xa0/0xa0
 lock_acquire+0x1a0/0x6e0
 ? fs_reclaim_acquire+0xf7/0x160
 ? lock_release+0x730/0x730
 ? amdgpu_dm_irq_handler+0x1ad/0x780 [amdgpu]
 ? lock_downgrade+0x6e0/0x6e0
 fs_reclaim_acquire+0x117/0x160
 ? fs_reclaim_acquire+0xf7/0x160
 ? amdgpu_dm_irq_handler+0x2d1/0x780 [amdgpu]
 kmem_cache_alloc_trace+0x3b/0x320
 amdgpu_dm_irq_handler+0x2d1/0x780 [amdgpu]
 amdgpu_irq_dispatch+0x280/0x590 [amdgpu]
 ? amdgpu_irq_add_id+0x2c0/0x2c0 [amdgpu]
 ? drm_print_bits+0x190/0x190 [drm]
 ? __lock_acquire+0xd5b/0x5d40
 amdgpu_ih_process+0x1c4/0x390 [amdgpu]
 ? amdgpu_irq_disable_all+0x300/0x300 [amdgpu]
 amdgpu_irq_handler+0x22/0x210 [amdgpu]
 ? amdgpu_irq_disable_all+0x300/0x300 [amdgpu]
 __handle_irq_event_percpu+0x248/0x600
 handle_irq_event+0xfa/0x260
 ? handle_irq_event_percpu+0x140/0x140
 ? lapic_next_event+0x53/0x80
 ? clockevents_program_event+0x1c7/0x280
 handle_edge_irq+0x1f8/0xa90
 __common_interrupt+0x70/0x150
 common_interrupt+0x76/0xa0
 </IRQ>
 asm_common_interrupt+0x1b/0x40
RIP: 0010:delay_halt_mwaitx+0x31/0x40
Code: 00 65 48 03 05 a8 83 22 43 31 d2 48 89 d1 0f 01 fa bb ff ff ff ff b8 =
f0
00 00 00 b9 02 00 00 00 48 39 de 48 0f 46 de 0f 01 fb <5b> c3 66 66 2e 0f 1=
f 84
00 00 00 00 00 66 90 48 83 ec 08 48 89 f8
RSP: 0018:ffff88810397ec38 EFLAGS: 00000297
RAX: 00000000000000f0 RBX: 0000000000000bb3 RCX: 0000000000000002
RDX: 0000000000000000 RSI: 0000000000000bb3 RDI: 00002c4339a8e963
RBP: 0000000000000bb3 R08: 0000000000000000 R09: ffffffffbe61f63f
R10: 0000000000000001 R11: 0000000000000001 R12: ffff8881538d6800
R13: 00000000000001d0 R14: 0000000000000000 R15: ffffed102a71ad3e
 delay_halt+0x36/0x60
 phm_wait_for_register_unequal+0xd5/0x240 [amdgpu]
 ? amdgpu_device_wreg.part.0+0x2ae/0x350 [amdgpu]
 smu8_send_msg_to_smc_with_parameter+0x1e9/0x380 [amdgpu]
 smum_send_msg_to_smc_with_parameter+0x215/0x300 [amdgpu]
 smu8_set_power_state_tasks+0x691/0xe10 [amdgpu]
 ? debug_check_no_locks_held+0xa0/0xa0
 phm_set_power_state+0xcc/0x130 [amdgpu]
 ? phm_power_down_asic+0x90/0x90 [amdgpu]
 psm_adjust_power_state_dynamic+0x172/0x570 [amdgpu]
 ? psm_set_user_performance_state+0x1c0/0x1c0 [amdgpu]
 ? mutex_lock_io_nested+0xfd0/0xfe0
 ? memcpy+0x39/0x60
 ? psm_set_states+0x109/0x190 [amdgpu]
 hwmgr_handle_task+0x10a/0x1f0 [amdgpu]
 ? hwmgr_resume+0xc0/0xc0 [amdgpu]
 ? amdgpu_debugfs_fence_info_show+0x450/0x450 [amdgpu]
 pp_dpm_dispatch_tasks+0x5e/0x90 [amdgpu]
 ? pp_get_power_limit+0x250/0x250 [amdgpu]
 amdgpu_pm_compute_clocks.part.0+0x245/0x1500 [amdgpu]
 ? wait_for_completion_killable_timeout+0x2c0/0x2c0
 ? amdgpu_dpm_get_vrefresh+0x1c0/0x1c0 [amdgpu]
 ? phm_store_dal_configuration_data+0x2d0/0x3f0 [amdgpu]
 ? pp_get_current_clocks+0x6e0/0x6e0 [amdgpu]
 ? pp_get_current_clocks+0x6e0/0x6e0 [amdgpu]
 dm_pp_apply_display_requirements+0x92c/0xc60 [amdgpu]
 dce11_update_clocks+0x27f/0x3d0 [amdgpu]
 ? dce11_pplib_apply_display_requirements+0xbb0/0xbb0 [amdgpu]
 dc_commit_state+0x422/0x27a0 [amdgpu]
 ? amdgpu_dm_atomic_commit_tail+0xa12/0x9870 [amdgpu]
 ? unwind_next_frame+0x15a6/0x1cf0
 ? dc_allow_idle_optimizations+0x1c0/0x1c0 [amdgpu]
 ? drm_atomic_helper_calc_timestamping_constants+0x15a/0x1f0 [drm_kms_helpe=
r]
 amdgpu_dm_atomic_commit_tail+0xa47/0x9870 [amdgpu]
 ? mark_lock+0xee/0x2fd0
 ? dm_crtc_helper_atomic_check+0x960/0x960 [amdgpu]
 ? mark_lock+0xee/0x2fd0
 ? lock_chain_count+0x20/0x20
 ? lock_chain_count+0x20/0x20
 ? __lock_acquire+0xd5b/0x5d40
 ? check_chain_key+0x24a/0x580
 ? __lock_acquire+0xd5b/0x5d40
 ? mark_lock+0xee/0x2fd0
 ? debug_check_no_locks_held+0xa0/0xa0
 ? mark_lock+0xee/0x2fd0
 ? lock_chain_count+0x20/0x20
 ? __lock_acquire+0xd5b/0x5d40
 ? check_chain_key+0x24a/0x580
 ? wait_for_completion_timeout+0x19d/0x220
 ? mark_held_locks+0x9e/0xe0
 ? rwlock_bug.part.0+0x90/0x90
 ? lockdep_hardirqs_on_prepare+0x273/0x3f0
 ? _raw_spin_unlock_irq+0x1f/0x30
 ? trace_hardirqs_on+0x1c/0x110
 ? _raw_spin_unlock_irq+0x1f/0x30
 ? wait_for_completion_timeout+0x19d/0x220
 ? wait_for_completion_io+0x210/0x210
 ? hpet_msi_interrupt_handler+0x50/0x50
 ? mark_held_locks+0x9e/0xe0
 ? drm_crtc_commit_wait+0x29/0x60 [drm]
 ? drm_atomic_helper_wait_for_dependencies+0x429/0x670 [drm_kms_helper]
 commit_tail+0x1a9/0x300 [drm_kms_helper]
 drm_atomic_helper_commit+0x216/0x290 [drm_kms_helper]
 drm_atomic_connector_commit_dpms+0x2d7/0x4f0 [drm]
 ? drm_modeset_acquire_init+0x1e9/0x390 [drm]
 ? set_property_atomic+0xb2/0x2f0 [drm]
 set_property_atomic+0x1be/0x2f0 [drm]
 ? drm_mode_object_get+0x110/0x110 [drm]
 ? lock_acquire+0x1a0/0x6e0
 drm_mode_obj_set_property_ioctl+0x339/0x4c0 [drm]
 ? drm_connector_set_obj_prop+0x160/0x160 [drm]
 drm_connector_property_set_ioctl+0xee/0x180 [drm]
 ? drm_connector_set_obj_prop+0x160/0x160 [drm]
 ? drm_is_current_master+0x65/0x120 [drm]
 ? drm_connector_set_obj_prop+0x160/0x160 [drm]
 ? drm_ioctl_permit+0x132/0x160 [drm]
 drm_ioctl_kernel+0x1c8/0x260 [drm]
 ? drm_ioctl_permit+0x160/0x160 [drm]
 ? debug_check_no_locks_held+0xa0/0xa0
 drm_ioctl+0x419/0x890 [drm]
 ? drm_connector_set_obj_prop+0x160/0x160 [drm]
 ? drm_ioctl_kernel+0x260/0x260 [drm]
 ? lock_downgrade+0x6e0/0x6e0
 ? lockdep_hardirqs_on_prepare+0x273/0x3f0
 ? _raw_spin_unlock_irqrestore+0x42/0x50
 ? trace_hardirqs_on+0x1c/0x110
 amdgpu_drm_ioctl+0xc9/0x1a0 [amdgpu]
 __x64_sys_ioctl+0x11b/0x170
 do_syscall_64+0x61/0x80
 ? lockdep_hardirqs_on_prepare+0x273/0x3f0
 ? do_syscall_64+0x6e/0x80
 ? do_syscall_64+0x6e/0x80
 ? lockdep_hardirqs_on_prepare+0x273/0x3f0
 ? do_syscall_64+0x6e/0x80
 ? do_syscall_64+0x6e/0x80
 ? do_syscall_64+0x6e/0x80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f7acfa36937
Code: 3c 1c 48 f7 d8 4c 39 e0 77 b9 e8 24 ff ff ff 85 c0 78 be 5b 4c 89 e0 =
5d
41 5c c3 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 7=
3 01
c3 48 8b 0d 01 45 0c 00 f7 d8 64 89 01 48
RSP: 002b:00007ffcba76bd48 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 000000000000000c RCX: 00007f7acfa36937
RDX: 00007ffcba76bd98 RSI: 00000000c01064ab RDI: 000000000000000c
RBP: 00000000c01064ab R08: 0000562d03ee9cf8 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000562d040468b0
R13: 00007ffcba76bd98 R14: 0000000000000000 R15: 0000562d027ab540
------------[ cut here ]------------

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
