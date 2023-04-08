Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 474C46DBA79
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 13:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E29410E143;
	Sat,  8 Apr 2023 11:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB6F10E13C;
 Sat,  8 Apr 2023 11:46:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A975B60A25;
 Sat,  8 Apr 2023 11:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C47C433D2;
 Sat,  8 Apr 2023 11:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680954387;
 bh=CU9zC5N7CshRtPMy5r5KysPZz2ppwbhQKcAycllefRE=;
 h=Subject:From:To:Date:From;
 b=dtcRn+V69LzY5c1vJOD+JbnTK0XhSdMQJX7Ltfu93qu4EKcE+B5xFyY/6l1QTvMtH
 yzT+uZcfsG/PhEPNrJYFauRuGghGv3p+pbK3ywlsgHC3G9u8M5I7rKTHgDeyCn/KBW
 ril5YrQKSL6+KmvPkxRFkSYU7ScnNJ9zRJgyNubsH13s1hxTgOlsY9Ak23FsYM1grQ
 czXkigkQCtDVHvlMWwaxRaCQM9i3RNYByGCAxeiCsrC/yavwEwumac3WFFMGLn/r0z
 KsZT8/lepcb9ms0uuutxhceM9EDZ7bNH4mS5jjoM3aH/gZ1aKEEwM/5J/v+DRGAVZm
 wMwM2Y/SONiYg==
Message-ID: <fed2a3f9111713cc619cbd54d7c1be0987c7da7b.camel@kernel.org>
Subject: NULL pointer dereference in drm_dp_add_payload_part2+0xca/0x100
From: Jeff Layton <jlayton@kernel.org>
To: amd-gfx <amd-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Date: Sat, 08 Apr 2023 07:46:25 -0400
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
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

I've hit some repeated crashes in drm_dp_add_payload_part2. Here's one
from this morning that occurred not long after booting the machine. I
hadn't even logged in yet -- it was still at a gdm prompt:

Apr 08 05:34:20 tleilax kernel: amdgpu 0000:30:00.0: [drm] Failed to create=
 MST payload for port 0000000074d1d8eb: -5
Apr 08 05:34:20 tleilax kernel: BUG: kernel NULL pointer dereference, addre=
ss: 0000000000000008
Apr 08 05:34:20 tleilax kernel: #PF: supervisor read access in kernel mode
Apr 08 05:34:20 tleilax kernel: #PF: error_code(0x0000) - not-present page
Apr 08 05:34:20 tleilax kernel: PGD 0 P4D 0=20
Apr 08 05:34:20 tleilax kernel: Oops: 0000 [#1] PREEMPT SMP NOPTI
Apr 08 05:34:20 tleilax kernel: CPU: 8 PID: 2278 Comm: gnome-shell Kdump: l=
oaded Not tainted 6.2.9-200.fc37.x86_64 #1
Apr 08 05:34:20 tleilax kernel: Hardware name: Micro-Star International Co.=
, Ltd. MS-7A33/X370 SLI PLUS (MS-7A33), BIOS 3.JR 11/29/2019
Apr 08 05:34:20 tleilax kernel: RIP: 0010:drm_dp_add_payload_part2+0xca/0x1=
00 [drm_display_helper]
Apr 08 05:34:20 tleilax kernel: Code: 8b 7e 08 44 89 e9 4c 89 c2 48 c7 c6 6=
0 d2 55 c0 e8 ab 69 54 c5 44 89 e8 5b 5d 41 5c 41 5d e9 2d 73 a2 c5 48 8b 8=
0 60 05 00 00 <48> 8b 76 08 4c 8b 40 60 48 85 f6 74 04 48 8b 76 08 4>
Apr 08 05:34:20 tleilax kernel: RSP: 0018:ffffa4238a2db590 EFLAGS: 00010246
Apr 08 05:34:20 tleilax kernel: RAX: ffff961550cac000 RBX: ffff961550cac000=
 RCX: ffffffffc055ca98
Apr 08 05:34:20 tleilax kernel: RDX: ffff9615a6326140 RSI: 0000000000000000=
 RDI: ffff9615578a4568
Apr 08 05:34:20 tleilax kernel: RBP: 0000000000000001 R08: 00000000fffffffb=
 R09: 0000000000000000
Apr 08 05:34:20 tleilax kernel: R10: 0000000000000002 R11: 0000000000000100=
 R12: ffff9615578a4000
Apr 08 05:34:20 tleilax kernel: R13: ffff96154a5b8de0 R14: ffffffffc0d9d980=
 R15: ffff9615589c1f90
Apr 08 05:34:20 tleilax kernel: FS:  00007f1c8ad775c0(0000) GS:ffff96241f00=
0000(0000) knlGS:0000000000000000
Apr 08 05:34:20 tleilax kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080=
050033
Apr 08 05:34:20 tleilax kernel: CR2: 0000000000000008 CR3: 000000012f908000=
 CR4: 00000000003506e0
Apr 08 05:34:20 tleilax kernel: Call Trace:
Apr 08 05:34:20 tleilax kernel:  <TASK>
Apr 08 05:34:20 tleilax kernel:  dm_helpers_dp_mst_send_payload_allocation+=
0x83/0xb0 [amdgpu]
Apr 08 05:34:20 tleilax kernel:  dc_link_allocate_mst_payload+0x16d/0x280 [=
amdgpu]
Apr 08 05:34:20 tleilax kernel:  core_link_enable_stream+0x8ec/0xa10 [amdgp=
u]
Apr 08 05:34:20 tleilax kernel:  ? optc1_set_drr+0x136/0x1e0 [amdgpu]
Apr 08 05:34:20 tleilax kernel:  dce110_apply_ctx_to_hw+0x61b/0x670 [amdgpu=
]
Apr 08 05:34:20 tleilax kernel:  dc_commit_state_no_check+0x39b/0xcd0 [amdg=
pu]
Apr 08 05:34:20 tleilax kernel:  dc_commit_state+0x107/0x120 [amdgpu]
Apr 08 05:34:20 tleilax kernel:  amdgpu_dm_atomic_commit_tail+0x5bf/0x2d20 =
[amdgpu]
Apr 08 05:34:20 tleilax kernel:  ? cpufreq_this_cpu_can_update+0x12/0x60
Apr 08 05:34:20 tleilax kernel:  ? sugov_get_util+0x7e/0x90
Apr 08 05:34:20 tleilax kernel:  ? sugov_update_single_freq+0xb7/0x180
Apr 08 05:34:20 tleilax kernel:  ? _raw_spin_lock+0x13/0x40
Apr 08 05:34:20 tleilax kernel:  ? raw_spin_rq_lock_nested+0x1e/0x70
Apr 08 05:34:20 tleilax kernel:  ? psi_group_change+0x168/0x400
Apr 08 05:34:20 tleilax kernel:  ? _raw_spin_unlock+0x15/0x30
Apr 08 05:34:20 tleilax kernel:  ? finish_task_switch.isra.0+0x9b/0x300
Apr 08 05:34:20 tleilax kernel:  ? __switch_to+0x106/0x410
Apr 08 05:34:20 tleilax kernel:  ? __schedule+0x3d4/0x13c0
Apr 08 05:34:20 tleilax kernel:  ? dma_resv_get_fences+0x11b/0x220
Apr 08 05:34:20 tleilax kernel:  ? get_nohz_timer_target+0x18/0x190
Apr 08 05:34:20 tleilax kernel:  ? lock_timer_base+0x61/0x80
Apr 08 05:34:20 tleilax kernel:  ? _raw_spin_unlock_irqrestore+0x23/0x40
Apr 08 05:34:20 tleilax kernel:  ? __mod_timer+0x29e/0x3d0
Apr 08 05:34:20 tleilax kernel:  ? preempt_count_add+0x6a/0xa0
Apr 08 05:34:20 tleilax kernel:  ? _raw_spin_lock_irq+0x19/0x40
Apr 08 05:34:20 tleilax kernel:  ? _raw_spin_unlock_irq+0x1b/0x40
Apr 08 05:34:20 tleilax kernel:  ? wait_for_completion_timeout+0x13a/0x170
Apr 08 05:34:20 tleilax kernel:  ? wait_for_completion_interruptible+0x135/=
0x1e0
Apr 08 05:34:20 tleilax kernel:  ? __pfx_dma_fence_default_wait_cb+0x10/0x1=
0
Apr 08 05:34:20 tleilax kernel:  commit_tail+0x94/0x130
Apr 08 05:34:20 tleilax kernel:  drm_atomic_helper_commit+0x112/0x140
Apr 08 05:34:20 tleilax kernel:  drm_atomic_commit+0x96/0xc0
Apr 08 05:34:20 tleilax kernel:  ? __pfx___drm_printfn_info+0x10/0x10
Apr 08 05:34:20 tleilax kernel:  drm_mode_atomic_ioctl+0x959/0xb50
Apr 08 05:34:20 tleilax kernel:  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
Apr 08 05:34:20 tleilax kernel:  drm_ioctl_kernel+0xc9/0x170
Apr 08 05:34:20 tleilax kernel:  drm_ioctl+0x22f/0x410
Apr 08 05:34:20 tleilax kernel:  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
Apr 08 05:34:20 tleilax kernel:  amdgpu_drm_ioctl+0x4a/0x80 [amdgpu]
Apr 08 05:34:20 tleilax kernel:  __x64_sys_ioctl+0x90/0xd0
Apr 08 05:34:20 tleilax kernel:  do_syscall_64+0x5b/0x80
Apr 08 05:34:20 tleilax kernel:  ? __x64_sys_ioctl+0xa8/0xd0
Apr 08 05:34:20 tleilax kernel:  ? syscall_exit_to_user_mode+0x17/0x40
Apr 08 05:34:20 tleilax kernel:  ? do_syscall_64+0x67/0x80
Apr 08 05:34:20 tleilax kernel:  ? sched_clock_cpu+0xb/0xc0
Apr 08 05:34:20 tleilax kernel:  ? __irq_exit_rcu+0x3d/0x140
Apr 08 05:34:20 tleilax kernel:  entry_SYSCALL_64_after_hwframe+0x72/0xdc
Apr 08 05:34:20 tleilax kernel: RIP: 0033:0x7f1c8e723d6f
Apr 08 05:34:20 tleilax kernel: Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 6=
0 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 0=
0 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 0>
Apr 08 05:34:20 tleilax kernel: RSP: 002b:00007ffea61067d0 EFLAGS: 00000246=
 ORIG_RAX: 0000000000000010
Apr 08 05:34:20 tleilax kernel: RAX: ffffffffffffffda RBX: 00005571af410fb0=
 RCX: 00007f1c8e723d6f
Apr 08 05:34:20 tleilax kernel: RDX: 00007ffea6106870 RSI: 00000000c03864bc=
 RDI: 000000000000000a
Apr 08 05:34:20 tleilax kernel: RBP: 00007ffea6106870 R08: 0000000000000011=
 R09: 0000000000000011
Apr 08 05:34:20 tleilax kernel: R10: 00005571ae320010 R11: 0000000000000246=
 R12: 00000000c03864bc
Apr 08 05:34:20 tleilax kernel: R13: 000000000000000a R14: 00005571ae6ff140=
 R15: 00005571b0261950
Apr 08 05:34:20 tleilax kernel:  </TASK>
Apr 08 05:34:20 tleilax kernel: Modules linked in: rfcomm snd_seq_dummy snd=
_hrtimer rpcrdma rdma_cm iw_cm ib_cm ib_core xt_CHECKSUM xt_MASQUERADE xt_c=
onntrack ipt_REJECT nf_nat_tftp nf_conntrack_tftp nf_conntrack_netbi>
Apr 08 05:34:20 tleilax kernel:  videobuf2_memops rapl mxm_wmi videobuf2_v4=
l2 wmi_bmof snd_pcm k10temp rfkill pcspkr videobuf2_common i2c_piix4 snd_ti=
mer joydev videodev snd mc parport_pc soundcore parport gpio_amdpt g>
Apr 08 05:34:20 tleilax kernel: CR2: 0000000000000008
Apr 08 05:34:20 tleilax kernel: ---[ end trace 0000000000000000 ]---

$ ./scripts/faddr2line --list /usr/lib/debug/lib/modules/6.2.9-200.fc37.x86=
_64/kernel/drivers/gpu/drm/display/drm_display_helper.ko.debug drm_dp_add_p=
ayload_part2+0xca/0x100
drm_dp_add_payload_part2+0xca/0x100:

drm_dp_add_payload_part2 at /usr/src/debug/kernel-6.2.9/linux-6.2.9-200.fc3=
7.x86_64/drivers/gpu/drm/display/drm_dp_mst_topology.c:3407
 3402 	{
 3403 		int ret =3D 0;
 3404 =09
 3405 		/* Skip failed payloads */
 3406 		if (payload->vc_start_slot =3D=3D -1) {
>3407<			drm_dbg_kms(state->dev, "Part 1 of payload creation for %s failed,=
 skipping part 2\n",
 3408 				    payload->port->connector->name);
 3409 			return -EIO;
 3410 		}
 3411 =09
 3412 		ret =3D drm_dp_create_payload_step2(mgr, payload);

Since %rsi is NULL and the ->dev field is 8 bytes into the struct, I'm
guessing that means that "state" was NULL here.

I'm assuming that the real bug is in the caller (and I'm happy to help
track that down), but would it make sense to allow this function to
gracefully handle a NULL state pointer? IOW something like this?

     drm_dbg_kms(state ? state->dev : NULL, "Part 1 of payload creation for=
 %s failed, skipping part 2\n",

I think that would at least prevent this problem from crashing the machine.

Thanks,
--=20
Jeff Layton <jlayton@kernel.org>
