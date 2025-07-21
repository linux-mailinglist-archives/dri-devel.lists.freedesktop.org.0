Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB38B0BE1A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 09:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478A410E25D;
	Mon, 21 Jul 2025 07:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="cxAGRAs6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A8B10E25D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 07:52:21 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4blt0L2jcBz9skk;
 Mon, 21 Jul 2025 09:52:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1753084338; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xw5OmaAPwo/vTfDOAeEeF5EDA2z4Zfe5mKnBn2q6SjE=;
 b=cxAGRAs6Y8WKCTvIQyi+WKbrRE+8Lv5GFNFn4Qku5RGAyzliSi/SxRMFZw89B7TGdDgbkE
 qjOkPDmYhK4Dk2WECkFboEpm7K7q2rbQLDkaZYMWJw6YlVUjZoSWOJbaFiPHfGhPonbjHG
 mlZDuiHJWsfFZCVtSwjfBsFdqqgLkB+E7PmdFkQ67sC0ZEyE7Zy273y4NBnpOGSnIbkrB9
 UER1+FtAltNrRrRbBk6OxmHMIAg4v8QH86Do+yd6hMn/8KbtPaVB+EBQiQ5iU80JJ+Waoh
 KpJHB62vPhEJYRvpkrZ8pc1MpqyE0HjDIEhCCB512/hl5Kt/8ObFAxZgb6mCnw==
Message-ID: <66a14b005fa3dc874f4f3261b93901af1292bde9.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Prevent stopped entities from being added to
 the run queue.
From: Philipp Stanner <phasta@mailbox.org>
To: James Flowers <bold.zone2373@fastmail.com>, matthew.brost@intel.com, 
 dakr@kernel.org, phasta@kernel.org, ckoenig.leichtzumerken@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, skhan@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linux.dev, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>
Date: Mon, 21 Jul 2025 09:52:11 +0200
In-Reply-To: <20250720235748.2798-1-bold.zone2373@fastmail.com>
References: <20250720235748.2798-1-bold.zone2373@fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: fptcfw7yitwupm5xto7i6uk33af4n6i8
X-MBO-RS-ID: f099a502199caa7137a
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Cc Tvrtko, who's currently reworking FIFO and RR.

On Sun, 2025-07-20 at 16:56 -0700, James Flowers wrote:
> Fixes an issue where entities are added to the run queue in
> drm_sched_rq_update_fifo_locked after being killed, causing a
> slab-use-after-free error.
>=20
> Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
> ---
> This issue was detected by syzkaller running on a Steam Deck OLED.
> Unfortunately I don't have a reproducer for it. I've

Well, now that's kind of an issue =E2=80=93 if you don't have a reproducer,=
 how
can you know that your patch is correct? How can we?

It would certainly be good to know what the fuzz testing framework
does.

> included the KASAN reports below:


Anyways, KASAN reports look interesting. But those might be many
different issues. Again, would be good to know what the fuzzer has been
testing. Can you maybe split this fuzz test into sub-tests? I suspsect
those might be different faults.


Anyways, taking a first look=E2=80=A6


>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KASAN: slab-use-after-free in rb_next+0xda/0x160 lib/rbtree.c:505
> Read of size 8 at addr ffff8881805085e0 by task kworker/u32:12/192
> CPU: 3 UID: 0 PID: 192 Comm: kworker/u32:12 Not tainted 6.14.0-flowejam-+=
 #1
> Hardware name: Valve Galileo/Galileo, BIOS F7G0112 08/01/2024
> Workqueue: sdma0 drm_sched_run_job_work [gpu_sched]
> Call Trace:
> =C2=A0<TASK>
> =C2=A0__dump_stack lib/dump_stack.c:94 [inline]
> =C2=A0dump_stack_lvl+0xd2/0x130 lib/dump_stack.c:120
> =C2=A0print_address_description.constprop.0+0x88/0x380 mm/kasan/report.c:=
408
> =C2=A0print_report+0xfc/0x1ff mm/kasan/report.c:521
> =C2=A0kasan_report+0xdd/0x1b0 mm/kasan/report.c:634
> =C2=A0rb_next+0xda/0x160 lib/rbtree.c:505
> =C2=A0drm_sched_rq_select_entity_fifo drivers/gpu/drm/scheduler/sched_mai=
n.c:332 [inline] [gpu_sched]
> =C2=A0drm_sched_select_entity+0x497/0x720 drivers/gpu/drm/scheduler/sched=
_main.c:1081 [gpu_sched]
> =C2=A0drm_sched_run_job_work+0x2e/0x710 drivers/gpu/drm/scheduler/sched_m=
ain.c:1206 [gpu_sched]
> =C2=A0process_one_work+0x9c0/0x17e0 kernel/workqueue.c:3238
> =C2=A0process_scheduled_works kernel/workqueue.c:3319 [inline]
> =C2=A0worker_thread+0x734/0x1060 kernel/workqueue.c:3400
> =C2=A0kthread+0x3fd/0x810 kernel/kthread.c:464
> =C2=A0ret_from_fork+0x53/0x80 arch/x86/kernel/process.c:148
> =C2=A0ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
> =C2=A0</TASK>
> Allocated by task 73472:
> =C2=A0kasan_save_stack+0x30/0x50 mm/kasan/common.c:47
> =C2=A0kasan_save_track+0x14/0x30 mm/kasan/common.c:68
> =C2=A0poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
> =C2=A0__kasan_kmalloc+0x9a/0xb0 mm/kasan/common.c:394
> =C2=A0kmalloc_noprof include/linux/slab.h:901 [inline] [amdgpu]
> =C2=A0kzalloc_noprof include/linux/slab.h:1037 [inline] [amdgpu]
> =C2=A0amdgpu_driver_open_kms+0x151/0x660 drivers/gpu/drm/amd/amdgpu/amdgp=
u_kms.c:1402 [amdgpu]
> =C2=A0drm_file_alloc+0x5d0/0xa00 drivers/gpu/drm/drm_file.c:171
> =C2=A0drm_open_helper+0x1fe/0x540 drivers/gpu/drm/drm_file.c:323
> =C2=A0drm_open+0x1a7/0x400 drivers/gpu/drm/drm_file.c:376
> =C2=A0drm_stub_open+0x21a/0x390 drivers/gpu/drm/drm_drv.c:1149
> =C2=A0chrdev_open+0x23b/0x6b0 fs/char_dev.c:414
> =C2=A0do_dentry_open+0x743/0x1bf0 fs/open.c:956
> =C2=A0vfs_open+0x87/0x3f0 fs/open.c:1086
> =C2=A0do_open+0x72f/0xf80 fs/namei.c:3830
> =C2=A0path_openat+0x2ec/0x770 fs/namei.c:3989
> =C2=A0do_filp_open+0x1ff/0x420 fs/namei.c:4016
> =C2=A0do_sys_openat2+0x181/0x1e0 fs/open.c:1428
> =C2=A0do_sys_open fs/open.c:1443 [inline]
> =C2=A0__do_sys_openat fs/open.c:1459 [inline]
> =C2=A0__se_sys_openat fs/open.c:1454 [inline]
> =C2=A0__x64_sys_openat+0x149/0x210 fs/open.c:1454
> =C2=A0do_syscall_x64 arch/x86/entry/common.c:52 [inline]
> =C2=A0do_syscall_64+0x92/0x180 arch/x86/entry/common.c:83
> =C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x7e
> Freed by task 73472:
> =C2=A0kasan_save_stack+0x30/0x50 mm/kasan/common.c:47
> =C2=A0kasan_save_track+0x14/0x30 mm/kasan/common.c:68
> =C2=A0kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:576
> =C2=A0poison_slab_object mm/kasan/common.c:247 [inline]
> =C2=A0__kasan_slab_free+0x52/0x70 mm/kasan/common.c:264
> =C2=A0kasan_slab_free include/linux/kasan.h:233 [inline]
> =C2=A0slab_free_hook mm/slub.c:2353 [inline]
> =C2=A0slab_free mm/slub.c:4609 [inline]
> =C2=A0kfree+0x14f/0x4d0 mm/slub.c:4757
> =C2=A0amdgpu_driver_postclose_kms+0x43d/0x6b0 drivers/gpu/drm/amd/amdgpu/=
amdgpu_kms.c:1538 [amdgpu]
> =C2=A0drm_file_free.part.0+0x72d/0xbc0 drivers/gpu/drm/drm_file.c:255
> =C2=A0drm_file_free drivers/gpu/drm/drm_file.c:228 [inline]
> =C2=A0drm_close_helper.isra.0+0x197/0x230 drivers/gpu/drm/drm_file.c:278
> =C2=A0drm_release+0x1b0/0x3d0 drivers/gpu/drm/drm_file.c:426
> =C2=A0__fput+0x402/0xb50 fs/file_table.c:464
> =C2=A0task_work_run+0x155/0x250 kernel/task_work.c:227
> =C2=A0get_signal+0x1be/0x19d0 kernel/signal.c:2809
> =C2=A0arch_do_signal_or_restart+0x96/0x3a0 arch/x86/kernel/signal.c:337
> =C2=A0exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
> =C2=A0exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
> =C2=A0__syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
> =C2=A0syscall_exit_to_user_mode+0x1fc/0x290 kernel/entry/common.c:218
> =C2=A0do_syscall_64+0x9f/0x180 arch/x86/entry/common.c:89
> =C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x7e
> The buggy address belongs to the object at ffff888180508000
> The buggy address is located 1504 bytes inside of
> The buggy address belongs to the physical page:
> page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1805=
08
> head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> flags: 0x17ffffc0000040(head|node=3D0|zone=3D2|lastcpupid=3D0x1fffff)
> page_type: f5(slab)
> raw: 0017ffffc0000040 ffff888100043180 dead000000000100 dead000000000122
> raw: 0000000000000000 0000000080020002 00000000f5000000 0000000000000000
> head: 0017ffffc0000040 ffff888100043180 dead000000000100 dead000000000122
> head: 0000000000000000 0000000080020002 00000000f5000000 0000000000000000
> head: 0017ffffc0000003 ffffea0006014201 ffffffffffffffff 0000000000000000
> head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
> Memory state around the buggy address:
> =C2=A0ffff888180508480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> =C2=A0ffff888180508500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > ffff888180508580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
> =C2=A0ffff888180508600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> =C2=A0ffff888180508680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KASAN: slab-use-after-free in rb_set_parent_color include/linux/rbtr=
ee_augmented.h:191 [inline]
> BUG: KASAN: slab-use-after-free in __rb_erase_augmented include/linux/rbt=
ree_augmented.h:312 [inline]
> BUG: KASAN: slab-use-after-free in rb_erase+0x157c/0x1b10 lib/rbtree.c:44=
3
> Write of size 8 at addr ffff88816414c5d0 by task syz.2.3004/12376
> CPU: 7 UID: 65534 PID: 12376 Comm: syz.2.3004 Not tainted 6.14.0-flowejam=
-+ #1
> Hardware name: Valve Galileo/Galileo, BIOS F7G0112 08/01/2024
> Call Trace:
> =C2=A0<TASK>
> =C2=A0__dump_stack lib/dump_stack.c:94 [inline]
> =C2=A0dump_stack_lvl+0xd2/0x130 lib/dump_stack.c:120
> =C2=A0print_address_description.constprop.0+0x88/0x380 mm/kasan/report.c:=
408
> =C2=A0print_report+0xfc/0x1ff mm/kasan/report.c:521
> =C2=A0kasan_report+0xdd/0x1b0 mm/kasan/report.c:634
> =C2=A0rb_set_parent_color include/linux/rbtree_augmented.h:191 [inline]
> =C2=A0__rb_erase_augmented include/linux/rbtree_augmented.h:312 [inline]
> =C2=A0rb_erase+0x157c/0x1b10 lib/rbtree.c:443
> =C2=A0rb_erase_cached include/linux/rbtree.h:126 [inline] [gpu_sched]
> =C2=A0drm_sched_rq_remove_fifo_locked drivers/gpu/drm/scheduler/sched_mai=
n.c:154 [inline] [gpu_sched]
> =C2=A0drm_sched_rq_remove_entity+0x2d3/0x480 drivers/gpu/drm/scheduler/sc=
hed_main.c:243 [gpu_sched]
> =C2=A0drm_sched_entity_kill.part.0+0x82/0x5e0 drivers/gpu/drm/scheduler/s=
ched_entity.c:237 [gpu_sched]
> =C2=A0drm_sched_entity_kill drivers/gpu/drm/scheduler/sched_entity.c:232 =
[inline] [gpu_sched]
> =C2=A0drm_sched_entity_fini+0x4c/0x290 drivers/gpu/drm/scheduler/sched_en=
tity.c:331 [gpu_sched]
> =C2=A0amdgpu_vm_fini_entities drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:529 =
[inline] [amdgpu]
> =C2=A0amdgpu_vm_fini+0x862/0x1180 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:=
2752 [amdgpu]
> =C2=A0amdgpu_driver_postclose_kms+0x3db/0x6b0 drivers/gpu/drm/amd/amdgpu/=
amdgpu_kms.c:1526 [amdgpu]
> =C2=A0drm_file_free.part.0+0x72d/0xbc0 drivers/gpu/drm/drm_file.c:255
> =C2=A0drm_file_free drivers/gpu/drm/drm_file.c:228 [inline]
> =C2=A0drm_close_helper.isra.0+0x197/0x230 drivers/gpu/drm/drm_file.c:278
> =C2=A0drm_release+0x1b0/0x3d0 drivers/gpu/drm/drm_file.c:426
> =C2=A0__fput+0x402/0xb50 fs/file_table.c:464
> =C2=A0task_work_run+0x155/0x250 kernel/task_work.c:227
> =C2=A0exit_task_work include/linux/task_work.h:40 [inline]
> =C2=A0do_exit+0x841/0xf60 kernel/exit.c:938
> =C2=A0do_group_exit+0xda/0x2b0 kernel/exit.c:1087
> =C2=A0get_signal+0x171f/0x19d0 kernel/signal.c:3036
> =C2=A0arch_do_signal_or_restart+0x96/0x3a0 arch/x86/kernel/signal.c:337
> =C2=A0exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
> =C2=A0exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
> =C2=A0__syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
> =C2=A0syscall_exit_to_user_mode+0x1fc/0x290 kernel/entry/common.c:218
> =C2=A0do_syscall_64+0x9f/0x180 arch/x86/entry/common.c:89
> =C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x7e
> RIP: 0033:0x7f2d90da36ed
> Code: Unable to access opcode bytes at 0x7f2d90da36c3.
> RSP: 002b:00007f2d91b710d8 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
> RAX: 0000000000000000 RBX: 00007f2d90fe6088 RCX: 00007f2d90da36ed
> RDX: 0000000000000000 RSI: 0000000000000080 RDI: 00007f2d90fe6088
> RBP: 00007f2d90fe6080 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007f2d90fe608c
> R13: 0000000000000000 R14: 0000000000000002 R15: 00007ffc34a67bd0
> =C2=A0</TASK>
> Allocated by task 12381:
> =C2=A0kasan_save_stack+0x30/0x50 mm/kasan/common.c:47
> =C2=A0kasan_save_track+0x14/0x30 mm/kasan/common.c:68
> =C2=A0poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
> =C2=A0__kasan_kmalloc+0x9a/0xb0 mm/kasan/common.c:394
> =C2=A0kmalloc_noprof include/linux/slab.h:901 [inline] [amdgpu]
> =C2=A0kzalloc_noprof include/linux/slab.h:1037 [inline] [amdgpu]
> =C2=A0amdgpu_driver_open_kms+0x151/0x660 drivers/gpu/drm/amd/amdgpu/amdgp=
u_kms.c:1402 [amdgpu]
> =C2=A0drm_file_alloc+0x5d0/0xa00 drivers/gpu/drm/drm_file.c:171
> =C2=A0drm_open_helper+0x1fe/0x540 drivers/gpu/drm/drm_file.c:323
> =C2=A0drm_open+0x1a7/0x400 drivers/gpu/drm/drm_file.c:376
> =C2=A0drm_stub_open+0x21a/0x390 drivers/gpu/drm/drm_drv.c:1149
> =C2=A0chrdev_open+0x23b/0x6b0 fs/char_dev.c:414
> =C2=A0do_dentry_open+0x743/0x1bf0 fs/open.c:956
> =C2=A0vfs_open+0x87/0x3f0 fs/open.c:1086
> =C2=A0do_open+0x72f/0xf80 fs/namei.c:3830
> =C2=A0path_openat+0x2ec/0x770 fs/namei.c:3989
> =C2=A0do_filp_open+0x1ff/0x420 fs/namei.c:4016
> =C2=A0do_sys_openat2+0x181/0x1e0 fs/open.c:1428
> =C2=A0do_sys_open fs/open.c:1443 [inline]
> =C2=A0__do_sys_openat fs/open.c:1459 [inline]
> =C2=A0__se_sys_openat fs/open.c:1454 [inline]
> =C2=A0__x64_sys_openat+0x149/0x210 fs/open.c:1454
> =C2=A0do_syscall_x64 arch/x86/entry/common.c:52 [inline]
> =C2=A0do_syscall_64+0x92/0x180 arch/x86/entry/common.c:83
> =C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x7e
> Freed by task 12381:
> =C2=A0kasan_save_stack+0x30/0x50 mm/kasan/common.c:47
> =C2=A0kasan_save_track+0x14/0x30 mm/kasan/common.c:68
> =C2=A0kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:576
> =C2=A0poison_slab_object mm/kasan/common.c:247 [inline]
> =C2=A0__kasan_slab_free+0x52/0x70 mm/kasan/common.c:264
> =C2=A0kasan_slab_free include/linux/kasan.h:233 [inline]
> =C2=A0slab_free_hook mm/slub.c:2353 [inline]
> =C2=A0slab_free mm/slub.c:4609 [inline]
> =C2=A0kfree+0x14f/0x4d0 mm/slub.c:4757
> =C2=A0amdgpu_driver_postclose_kms+0x43d/0x6b0 drivers/gpu/drm/amd/amdgpu/=
amdgpu_kms.c:1538 [amdgpu]
> =C2=A0drm_file_free.part.0+0x72d/0xbc0 drivers/gpu/drm/drm_file.c:255
> =C2=A0drm_file_free drivers/gpu/drm/drm_file.c:228 [inline]
> =C2=A0drm_close_helper.isra.0+0x197/0x230 drivers/gpu/drm/drm_file.c:278
> =C2=A0drm_release+0x1b0/0x3d0 drivers/gpu/drm/drm_file.c:426
> =C2=A0__fput+0x402/0xb50 fs/file_table.c:464
> =C2=A0task_work_run+0x155/0x250 kernel/task_work.c:227
> =C2=A0get_signal+0x1be/0x19d0 kernel/signal.c:2809
> =C2=A0arch_do_signal_or_restart+0x96/0x3a0 arch/x86/kernel/signal.c:337
> =C2=A0exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
> =C2=A0exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
> =C2=A0__syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
> =C2=A0syscall_exit_to_user_mode+0x1fc/0x290 kernel/entry/common.c:218
> =C2=A0do_syscall_64+0x9f/0x180 arch/x86/entry/common.c:89
> =C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x7e
> The buggy address belongs to the object at ffff88816414c000
> The buggy address is located 1488 bytes inside of
> The buggy address belongs to the physical page:
> page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1641=
48
> head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> flags: 0x17ffffc0000040(head|node=3D0|zone=3D2|lastcpupid=3D0x1fffff)
> page_type: f5(slab)
> raw: 0017ffffc0000040 ffff88810005c8c0 dead000000000122 0000000000000000
> raw: 0000000000000000 0000000080020002 00000000f5000000 0000000000000000
> head: 0017ffffc0000040 ffff88810005c8c0 dead000000000122 0000000000000000
> head: 0000000000000000 0000000080020002 00000000f5000000 0000000000000000
> head: 0017ffffc0000003 ffffea0005905201 ffffffffffffffff 0000000000000000
> head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
> Memory state around the buggy address:
> =C2=A0ffff88816414c480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> =C2=A0ffff88816414c500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > ffff88816414c580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
> =C2=A0ffff88816414c600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> =C2=A0ffff88816414c680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KASAN: slab-use-after-free in __rb_erase_augmented include/linux/rbt=
ree_augmented.h:259 [inline]
> BUG: KASAN: slab-use-after-free in rb_erase+0xf5d/0x1b10 lib/rbtree.c:443
> Read of size 8 at addr ffff88812ebcc5e0 by task syz.1.814/6553
> CPU: 0 UID: 65534 PID: 6553 Comm: syz.1.814 Not tainted 6.14.0-flowejam-+=
 #1
> Hardware name: Valve Galileo/Galileo, BIOS F7G0112 08/01/2024
> Call Trace:
> =C2=A0<TASK>
> =C2=A0__dump_stack lib/dump_stack.c:94 [inline]
> =C2=A0dump_stack_lvl+0xd2/0x130 lib/dump_stack.c:120
> =C2=A0print_address_description.constprop.0+0x88/0x380 mm/kasan/report.c:=
408
> =C2=A0print_report+0xfc/0x1ff mm/kasan/report.c:521
> =C2=A0kasan_report+0xdd/0x1b0 mm/kasan/report.c:634
> =C2=A0__rb_erase_augmented include/linux/rbtree_augmented.h:259 [inline]
> =C2=A0rb_erase+0xf5d/0x1b10 lib/rbtree.c:443
> =C2=A0rb_erase_cached include/linux/rbtree.h:126 [inline] [gpu_sched]
> =C2=A0drm_sched_rq_remove_fifo_locked drivers/gpu/drm/scheduler/sched_mai=
n.c:154 [inline] [gpu_sched]
> =C2=A0drm_sched_rq_remove_entity+0x2d3/0x480 drivers/gpu/drm/scheduler/sc=
hed_main.c:243 [gpu_sched]
> =C2=A0drm_sched_entity_kill.part.0+0x82/0x5e0 drivers/gpu/drm/scheduler/s=
ched_entity.c:237 [gpu_sched]
> =C2=A0drm_sched_entity_kill drivers/gpu/drm/scheduler/sched_entity.c:232 =
[inline] [gpu_sched]
> =C2=A0drm_sched_entity_fini+0x4c/0x290 drivers/gpu/drm/scheduler/sched_en=
tity.c:331 [gpu_sched]
> =C2=A0amdgpu_vm_fini_entities drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:529 =
[inline] [amdgpu]
> =C2=A0amdgpu_vm_fini+0x862/0x1180 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:=
2752 [amdgpu]
> =C2=A0amdgpu_driver_postclose_kms+0x3db/0x6b0 drivers/gpu/drm/amd/amdgpu/=
amdgpu_kms.c:1526 [amdgpu]
> =C2=A0drm_file_free.part.0+0x72d/0xbc0 drivers/gpu/drm/drm_file.c:255
> =C2=A0drm_file_free drivers/gpu/drm/drm_file.c:228 [inline]
> =C2=A0drm_close_helper.isra.0+0x197/0x230 drivers/gpu/drm/drm_file.c:278
> =C2=A0drm_release+0x1b0/0x3d0 drivers/gpu/drm/drm_file.c:426
> =C2=A0__fput+0x402/0xb50 fs/file_table.c:464
> =C2=A0task_work_run+0x155/0x250 kernel/task_work.c:227
> =C2=A0resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
> =C2=A0exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
> =C2=A0exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
> =C2=A0__syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
> =C2=A0syscall_exit_to_user_mode+0x26b/0x290 kernel/entry/common.c:218
> =C2=A0do_syscall_64+0x9f/0x180 arch/x86/entry/common.c:89
> =C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x7e
> RIP: 0033:0x7fd23eba36ed
> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f=
7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff=
 ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007ffc2943a358 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
> RAX: 0000000000000000 RBX: 00007ffc2943a428 RCX: 00007fd23eba36ed
> RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
> RBP: 00007fd23ede7ba0 R08: 0000000000000001 R09: 0000000c00000000
> R10: 00007fd23ea00000 R11: 0000000000000246 R12: 00007fd23ede5fac
> R13: 00007fd23ede5fa0 R14: 0000000000059ad1 R15: 0000000000059a8e
> =C2=A0</TASK>
> Allocated by task 6559:
> =C2=A0kasan_save_stack+0x30/0x50 mm/kasan/common.c:47
> =C2=A0kasan_save_track+0x14/0x30 mm/kasan/common.c:68
> =C2=A0poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
> =C2=A0__kasan_kmalloc+0x9a/0xb0 mm/kasan/common.c:394
> =C2=A0kmalloc_noprof include/linux/slab.h:901 [inline] [amdgpu]
> =C2=A0kzalloc_noprof include/linux/slab.h:1037 [inline] [amdgpu]
> =C2=A0amdgpu_driver_open_kms+0x151/0x660 drivers/gpu/drm/amd/amdgpu/amdgp=
u_kms.c:1402 [amdgpu]
> =C2=A0drm_file_alloc+0x5d0/0xa00 drivers/gpu/drm/drm_file.c:171
> =C2=A0drm_open_helper+0x1fe/0x540 drivers/gpu/drm/drm_file.c:323
> =C2=A0drm_open+0x1a7/0x400 drivers/gpu/drm/drm_file.c:376
> =C2=A0drm_stub_open+0x21a/0x390 drivers/gpu/drm/drm_drv.c:1149
> =C2=A0chrdev_open+0x23b/0x6b0 fs/char_dev.c:414
> =C2=A0do_dentry_open+0x743/0x1bf0 fs/open.c:956
> =C2=A0vfs_open+0x87/0x3f0 fs/open.c:1086
> =C2=A0do_open+0x72f/0xf80 fs/namei.c:3830
> =C2=A0path_openat+0x2ec/0x770 fs/namei.c:3989
> =C2=A0do_filp_open+0x1ff/0x420 fs/namei.c:4016
> =C2=A0do_sys_openat2+0x181/0x1e0 fs/open.c:1428
> =C2=A0do_sys_open fs/open.c:1443 [inline]
> =C2=A0__do_sys_openat fs/open.c:1459 [inline]
> =C2=A0__se_sys_openat fs/open.c:1454 [inline]
> =C2=A0__x64_sys_openat+0x149/0x210 fs/open.c:1454
> =C2=A0do_syscall_x64 arch/x86/entry/common.c:52 [inline]
> =C2=A0do_syscall_64+0x92/0x180 arch/x86/entry/common.c:83
> =C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x7e
> Freed by task 6559:
> =C2=A0kasan_save_stack+0x30/0x50 mm/kasan/common.c:47
> =C2=A0kasan_save_track+0x14/0x30 mm/kasan/common.c:68
> =C2=A0kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:576
> =C2=A0poison_slab_object mm/kasan/common.c:247 [inline]
> =C2=A0__kasan_slab_free+0x52/0x70 mm/kasan/common.c:264
> =C2=A0kasan_slab_free include/linux/kasan.h:233 [inline]
> =C2=A0slab_free_hook mm/slub.c:2353 [inline]
> =C2=A0slab_free mm/slub.c:4609 [inline]
> =C2=A0kfree+0x14f/0x4d0 mm/slub.c:4757
> =C2=A0amdgpu_driver_postclose_kms+0x43d/0x6b0 drivers/gpu/drm/amd/amdgpu/=
amdgpu_kms.c:1538 [amdgpu]
> =C2=A0drm_file_free.part.0+0x72d/0xbc0 drivers/gpu/drm/drm_file.c:255
> =C2=A0drm_file_free drivers/gpu/drm/drm_file.c:228 [inline]
> =C2=A0drm_close_helper.isra.0+0x197/0x230 drivers/gpu/drm/drm_file.c:278
> =C2=A0drm_release+0x1b0/0x3d0 drivers/gpu/drm/drm_file.c:426
> =C2=A0__fput+0x402/0xb50 fs/file_table.c:464
> =C2=A0task_work_run+0x155/0x250 kernel/task_work.c:227
> =C2=A0get_signal+0x1be/0x19d0 kernel/signal.c:2809
> =C2=A0arch_do_signal_or_restart+0x96/0x3a0 arch/x86/kernel/signal.c:337
> =C2=A0exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
> =C2=A0exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
> =C2=A0__syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
> =C2=A0syscall_exit_to_user_mode+0x1fc/0x290 kernel/entry/common.c:218
> =C2=A0do_syscall_64+0x9f/0x180 arch/x86/entry/common.c:89
> =C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x7e
> The buggy address belongs to the object at ffff88812ebcc000
> The buggy address is located 1504 bytes inside of
> The buggy address belongs to the physical page:
> page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x12eb=
c8
> head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> flags: 0x17ffffc0000040(head|node=3D0|zone=3D2|lastcpupid=3D0x1fffff)
> page_type: f5(slab)
> raw: 0017ffffc0000040 ffff888100058780 dead000000000122 0000000000000000
> raw: 0000000000000000 0000000000020002 00000000f5000000 0000000000000000
> head: 0017ffffc0000040 ffff888100058780 dead000000000122 0000000000000000
> head: 0000000000000000 0000000000020002 00000000f5000000 0000000000000000
> head: 0017ffffc0000003 ffffea0004baf201 ffffffffffffffff 0000000000000000
> head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
> Memory state around the buggy address:
> =C2=A0ffff88812ebcc480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> =C2=A0ffff88812ebcc500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > ffff88812ebcc580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
> =C2=A0ffff88812ebcc600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> =C2=A0ffff88812ebcc680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KASAN: slab-use-after-free in drm_sched_entity_compare_before driver=
s/gpu/drm/scheduler/sched_main.c:147 [inline] [gpu_sched]
> BUG: KASAN: slab-use-after-free in rb_add_cached include/linux/rbtree.h:1=
74 [inline] [gpu_sched]
> BUG: KASAN: slab-use-after-free in drm_sched_rq_update_fifo_locked+0x47b/=
0x540 drivers/gpu/drm/scheduler/sched_main.c:175 [gpu_sched]
> Read of size 8 at addr ffff8881208445c8 by task syz.1.49115/146644
> CPU: 7 UID: 65534 PID: 146644 Comm: syz.1.49115 Not tainted 6.14.0-flowej=
am-+ #1
> Hardware name: Valve Galileo/Galileo, BIOS F7G0112 08/01/2024
> Call Trace:
> =C2=A0<TASK>
> =C2=A0__dump_stack lib/dump_stack.c:94 [inline]
> =C2=A0dump_stack_lvl+0xd2/0x130 lib/dump_stack.c:120
> =C2=A0print_address_description.constprop.0+0x88/0x380 mm/kasan/report.c:=
408
> =C2=A0print_report+0xfc/0x1ff mm/kasan/report.c:521
> =C2=A0kasan_report+0xdd/0x1b0 mm/kasan/report.c:634
> =C2=A0drm_sched_entity_compare_before drivers/gpu/drm/scheduler/sched_mai=
n.c:147 [inline] [gpu_sched]
> =C2=A0rb_add_cached include/linux/rbtree.h:174 [inline] [gpu_sched]
> =C2=A0drm_sched_rq_update_fifo_locked+0x47b/0x540 drivers/gpu/drm/schedul=
er/sched_main.c:175 [gpu_sched]
> =C2=A0drm_sched_entity_push_job+0x509/0x5d0 drivers/gpu/drm/scheduler/sch=
ed_entity.c:623 [gpu_sched]

This might be a race between entity killing and the push_job. Let's
look at your patch below=E2=80=A6

> =C2=A0amdgpu_job_submit+0x1a4/0x270 drivers/gpu/drm/amd/amdgpu/amdgpu_job=
.c:314 [amdgpu]
> =C2=A0amdgpu_vm_sdma_commit+0x1f9/0x7d0 drivers/gpu/drm/amd/amdgpu/amdgpu=
_vm_sdma.c:122 [amdgpu]
> =C2=A0amdgpu_vm_pt_clear+0x540/0x6b0 drivers/gpu/drm/amd/amdgpu/amdgpu_vm=
_pt.c:422 [amdgpu]
> =C2=A0amdgpu_vm_init+0x9c2/0x12f0 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:=
2609 [amdgpu]
> =C2=A0amdgpu_driver_open_kms+0x274/0x660 drivers/gpu/drm/amd/amdgpu/amdgp=
u_kms.c:1418 [amdgpu]
> =C2=A0drm_file_alloc+0x5d0/0xa00 drivers/gpu/drm/drm_file.c:171
> =C2=A0drm_open_helper+0x1fe/0x540 drivers/gpu/drm/drm_file.c:323
> =C2=A0drm_open+0x1a7/0x400 drivers/gpu/drm/drm_file.c:376
> =C2=A0drm_stub_open+0x21a/0x390 drivers/gpu/drm/drm_drv.c:1149
> =C2=A0chrdev_open+0x23b/0x6b0 fs/char_dev.c:414
> =C2=A0do_dentry_open+0x743/0x1bf0 fs/open.c:956
> =C2=A0vfs_open+0x87/0x3f0 fs/open.c:1086
> =C2=A0do_open+0x72f/0xf80 fs/namei.c:3830
> =C2=A0path_openat+0x2ec/0x770 fs/namei.c:3989
> =C2=A0do_filp_open+0x1ff/0x420 fs/namei.c:4016
> =C2=A0do_sys_openat2+0x181/0x1e0 fs/open.c:1428
> =C2=A0do_sys_open fs/open.c:1443 [inline]
> =C2=A0__do_sys_openat fs/open.c:1459 [inline]
> =C2=A0__se_sys_openat fs/open.c:1454 [inline]
> =C2=A0__x64_sys_openat+0x149/0x210 fs/open.c:1454
> =C2=A0do_syscall_x64 arch/x86/entry/common.c:52 [inline]
> =C2=A0do_syscall_64+0x92/0x180 arch/x86/entry/common.c:83
> =C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x7e
> RIP: 0033:0x7feb303a36ed
> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f=
7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff=
 ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007feb3123c018 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
> RAX: ffffffffffffffda RBX: 00007feb305e5fa0 RCX: 00007feb303a36ed
> RDX: 0000000000000002 RSI: 0000200000000140 RDI: ffffffffffffff9c
> RBP: 00007feb30447722 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007feb305e5fa0 R15: 00007ffcfd0a3460
> =C2=A0</TASK>
> Allocated by task 146638:
> =C2=A0kasan_save_stack+0x30/0x50 mm/kasan/common.c:47
> =C2=A0kasan_save_track+0x14/0x30 mm/kasan/common.c:68
> =C2=A0poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
> =C2=A0__kasan_kmalloc+0x9a/0xb0 mm/kasan/common.c:394
> =C2=A0kmalloc_noprof include/linux/slab.h:901 [inline] [amdgpu]
> =C2=A0kzalloc_noprof include/linux/slab.h:1037 [inline] [amdgpu]
> =C2=A0amdgpu_driver_open_kms+0x151/0x660 drivers/gpu/drm/amd/amdgpu/amdgp=
u_kms.c:1402 [amdgpu]
> =C2=A0drm_file_alloc+0x5d0/0xa00 drivers/gpu/drm/drm_file.c:171
> =C2=A0drm_open_helper+0x1fe/0x540 drivers/gpu/drm/drm_file.c:323
> =C2=A0drm_open+0x1a7/0x400 drivers/gpu/drm/drm_file.c:376
> =C2=A0drm_stub_open+0x21a/0x390 drivers/gpu/drm/drm_drv.c:1149
> =C2=A0chrdev_open+0x23b/0x6b0 fs/char_dev.c:414
> =C2=A0do_dentry_open+0x743/0x1bf0 fs/open.c:956
> =C2=A0vfs_open+0x87/0x3f0 fs/open.c:1086
> =C2=A0do_open+0x72f/0xf80 fs/namei.c:3830
> =C2=A0path_openat+0x2ec/0x770 fs/namei.c:3989
> =C2=A0do_filp_open+0x1ff/0x420 fs/namei.c:4016
> =C2=A0do_sys_openat2+0x181/0x1e0 fs/open.c:1428
> =C2=A0do_sys_open fs/open.c:1443 [inline]
> =C2=A0__do_sys_openat fs/open.c:1459 [inline]
> =C2=A0__se_sys_openat fs/open.c:1454 [inline]
> =C2=A0__x64_sys_openat+0x149/0x210 fs/open.c:1454
> =C2=A0do_syscall_x64 arch/x86/entry/common.c:52 [inline]
> =C2=A0do_syscall_64+0x92/0x180 arch/x86/entry/common.c:83
> =C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x7e
> Freed by task 146638:
> =C2=A0kasan_save_stack+0x30/0x50 mm/kasan/common.c:47
> =C2=A0kasan_save_track+0x14/0x30 mm/kasan/common.c:68
> =C2=A0kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:576
> =C2=A0poison_slab_object mm/kasan/common.c:247 [inline]
> =C2=A0__kasan_slab_free+0x52/0x70 mm/kasan/common.c:264
> =C2=A0kasan_slab_free include/linux/kasan.h:233 [inline]
> =C2=A0slab_free_hook mm/slub.c:2353 [inline]
> =C2=A0slab_free mm/slub.c:4609 [inline]
> =C2=A0kfree+0x14f/0x4d0 mm/slub.c:4757
> =C2=A0amdgpu_driver_postclose_kms+0x43d/0x6b0 drivers/gpu/drm/amd/amdgpu/=
amdgpu_kms.c:1538 [amdgpu]
> =C2=A0drm_file_free.part.0+0x72d/0xbc0 drivers/gpu/drm/drm_file.c:255
> =C2=A0drm_file_free drivers/gpu/drm/drm_file.c:228 [inline]
> =C2=A0drm_close_helper.isra.0+0x197/0x230 drivers/gpu/drm/drm_file.c:278
> =C2=A0drm_release+0x1b0/0x3d0 drivers/gpu/drm/drm_file.c:426
> =C2=A0__fput+0x402/0xb50 fs/file_table.c:464
> =C2=A0task_work_run+0x155/0x250 kernel/task_work.c:227
> =C2=A0resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
> =C2=A0exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
> =C2=A0exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
> =C2=A0__syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
> =C2=A0syscall_exit_to_user_mode+0x26b/0x290 kernel/entry/common.c:218
> =C2=A0do_syscall_64+0x9f/0x180 arch/x86/entry/common.c:89
> =C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x7e
> The buggy address belongs to the object at ffff888120844000
> The buggy address is located 1480 bytes inside of
> The buggy address belongs to the physical page:
> page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1208=
40
> head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> flags: 0x17ffffc0000040(head|node=3D0|zone=3D2|lastcpupid=3D0x1fffff)
> page_type: f5(slab)
> raw: 0017ffffc0000040 ffff88810005c8c0 ffffea0005744c00 dead000000000002
> raw: 0000000000000000 0000000000020002 00000000f5000000 0000000000000000
> head: 0017ffffc0000040 ffff88810005c8c0 ffffea0005744c00 dead000000000002
> head: 0000000000000000 0000000000020002 00000000f5000000 0000000000000000
> head: 0017ffffc0000003 ffffea0004821001 ffffffffffffffff 0000000000000000
> head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
> Memory state around the buggy address:
> =C2=A0ffff888120844480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> =C2=A0ffff888120844500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > ffff888120844580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
> =C2=A0ffff888120844600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> =C2=A0ffff888120844680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 6 ++++--
> =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index bfea608a7106..997a2cc1a635 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -172,8 +172,10 @@ void drm_sched_rq_update_fifo_locked(struct drm_sche=
d_entity *entity,
> =C2=A0
> =C2=A0	entity->oldest_job_waiting =3D ts;
> =C2=A0
> -	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_entity_compare_before);
> +	if (!entity->stopped) {
> +		rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_entity_compare_before);
> +	}

If this is a race, then this patch here is broken, too, because you're
checking the 'stopped' boolean as the callers of that function do, too
=E2=80=93 just later. :O

Could still race, just less likely.

The proper way to fix it would then be to address the issue where the
locking is supposed to happen. Let's look at, for example,
drm_sched_entity_push_job():


void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
{
	(Bla bla bla)

 	=E2=80=A6=E2=80=A6=E2=80=A6=E2=80=A6

	/* first job wakes up scheduler */
	if (first) {
		struct drm_gpu_scheduler *sched;
		struct drm_sched_rq *rq;

		/* Add the entity to the run queue */
		spin_lock(&entity->lock);
		if (entity->stopped) {                  <---- Aha!
			spin_unlock(&entity->lock);

			DRM_ERROR("Trying to push to a killed entity\n");
			return;
		}

		rq =3D entity->rq;
		sched =3D rq->sched;

		spin_lock(&rq->lock);
		drm_sched_rq_add_entity(rq, entity);

		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
			drm_sched_rq_update_fifo_locked(entity, rq, submit_ts); <---- bumm!

		spin_unlock(&rq->lock);
		spin_unlock(&entity->lock);

But the locks are still being hold. So that "shouldn't be happening"(tm).

Interesting. AFAICS only drm_sched_entity_kill() and drm_sched_fini()
stop entities. The former holds appropriate locks, but drm_sched_fini()
doesn't. So that looks like a hot candidate to me. Opinions?

On the other hand, aren't drivers prohibited from calling
drm_sched_entity_push_job() after calling drm_sched_fini()? If the
fuzzer does that, then it's not the scheduler's fault.

Could you test adding spin_lock(&entity->lock) to drm_sched_fini()?

Would be cool if Tvrtko and Christian take a look. Maybe we even have a
fundamental design issue.


Regards
P.


> =C2=A0}
> =C2=A0
> =C2=A0/**

