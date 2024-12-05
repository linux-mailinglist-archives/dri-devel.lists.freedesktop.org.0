Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9847B9E5944
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 16:03:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1974710EEBB;
	Thu,  5 Dec 2024 15:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com
 [209.85.166.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3262E10EEBB
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 15:03:29 +0000 (UTC)
Received: by mail-il1-f207.google.com with SMTP id
 e9e14a558f8ab-3a71bdd158aso9782185ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 07:03:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733411008; x=1734015808;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6c8XaONRkPGqYTKRQm8q/2us+OksQOQ2xPceUuhFWeA=;
 b=n7GvoiTmGktnaQP8e3dvXBpsn4JO9u+vjXpDWqSoijpoq9cp7ER6b9mVTCDaI88lNy
 ZjvZu4OjprhhjRlbqgIKCcrKUx1qnLO2ugcp15kQ2HGB7nGegu95zHHzmyZjoc3BCCq4
 rmLUrOBmn+ceuKXgYQKXzeg8Suq0e22lK79Jw6iGcbKpUKHEhqCfNotwYr3xviRwo1/3
 ELQo7q7v4pqoX27XQZ3UrGgD9ku2tIvPVUQa87yAMQvbASMaKujU/ZJmV7WLo0u31nrp
 ALgmrLMvJr2cuqIsK5TIPClE6I6xzKHggbQZvHHb7//VnaiJ0n3BuuE6zRwRHqlz/K7y
 HtMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAqRz76LgGOmLVRGnOWp/5Rc0ZgOuYAeQKal1N6BKwDn8ZZ6aleZQwvrxVny3UszQnMiIbRlGJ/x4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWxwoDE0TuIpaEHWIDZ7VQkRrLc5C2L1D2b/n6j3M2S13R6ruD
 HsVW9OUMDRJwfyUHTrUnYTVDJDNjPyKmFOXZVarUjSPjDHXeC6pchu/vmwx6wfHkDA40dI5EzOV
 HcpCIv2gqkJcb174d3sZeiuhKS25CubGYFTi/pqeBfn9ssjTfChsXMgE=
X-Google-Smtp-Source: AGHT+IHAeykY8Mbx1zblSkqPC3ftGj8movigmcUClttBr1Y1Uk6SLIsgsN9idx6WfyIgevFDfx6lMgMqmVG4W/306EOoeUe38/e/
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fce:b0:3a7:e8e1:cbcd with SMTP id
 e9e14a558f8ab-3a7f9ab0ffcmr124963845ab.22.1733411008168; Thu, 05 Dec 2024
 07:03:28 -0800 (PST)
Date: Thu, 05 Dec 2024 07:03:28 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6751c0c0.050a0220.b4160.01d6.GAE@google.com>
Subject: [syzbot] [dri?] possible deadlock in drm_mode_get_lease_ioctl
From: syzbot <syzbot+969eb4c3dd28b1dc507a@syzkaller.appspotmail.com>
To: airlied@gmail.com, dri-devel@lists.freedesktop.org, 
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net, 
 melissa.srw@gmail.com, mripard@kernel.org, rodrigosiqueiramelo@gmail.com, 
 simona@ffwll.ch, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
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

Hello,

syzbot found the following issue on:

HEAD commit:    7b1d1d4cfac0 Merge remote-tracking branch 'iommu/arm/smmu'..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=1186dd30580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9bc44a6de1ceb5d6
dashboard link: https://syzkaller.appspot.com/bug?extid=969eb4c3dd28b1dc507a
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4d4a0162c7c3/disk-7b1d1d4c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a8c47a4be472/vmlinux-7b1d1d4c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0e173b91f83e/Image-7b1d1d4c.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+969eb4c3dd28b1dc507a@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.12.0-syzkaller-g7b1d1d4cfac0 #0 Not tainted
------------------------------------------------------
syz.3.235/8073 is trying to acquire lock:
ffff0000dba0e188 (&mm->mmap_lock){++++}-{3:3}, at: __might_fault+0x9c/0x124 mm/memory.c:6715

but task is already holding lock:
ffff0000c9c4c5d0 (&dev->mode_config.idr_mutex){+.+.}-{3:3}, at: drm_mode_get_lease_ioctl+0x1ec/0x63c drivers/gpu/drm/drm_lease.c:660

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #6 (&dev->mode_config.idr_mutex){+.+.}-{3:3}:
       __mutex_lock_common+0x190/0x21a0 kernel/locking/mutex.c:608
       __mutex_lock kernel/locking/mutex.c:752 [inline]
       mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:804
       __drm_mode_object_add+0xb8/0x204 drivers/gpu/drm/drm_mode_object.c:47
       drm_framebuffer_init+0x104/0x24c drivers/gpu/drm/drm_framebuffer.c:873
       drm_gem_fb_init drivers/gpu/drm/drm_gem_framebuffer_helper.c:82 [inline]
       drm_gem_fb_init_with_funcs+0x9bc/0xd64 drivers/gpu/drm/drm_gem_framebuffer_helper.c:202
       drm_gem_fb_create_with_funcs drivers/gpu/drm/drm_gem_framebuffer_helper.c:245 [inline]
       drm_gem_fb_create+0x84/0xd4 drivers/gpu/drm/drm_gem_framebuffer_helper.c:286
       drm_internal_framebuffer_create+0x100c/0x1408 drivers/gpu/drm/drm_framebuffer.c:303
       drm_mode_addfb2+0xb4/0x2a8 drivers/gpu/drm/drm_framebuffer.c:337
       drm_client_buffer_addfb drivers/gpu/drm/drm_client.c:480 [inline]
       drm_client_framebuffer_create+0x38c/0x6cc drivers/gpu/drm/drm_client.c:522
       drm_fbdev_shmem_helper_fb_probe+0x1a4/0x728 drivers/gpu/drm/drm_fbdev_shmem.c:126
       drm_fb_helper_single_fb_probe drivers/gpu/drm/drm_fb_helper.c:1669 [inline]
       __drm_fb_helper_initial_config_and_unlock+0x12e8/0x19a4 drivers/gpu/drm/drm_fb_helper.c:1847
       drm_fb_helper_initial_config+0x48/0x64 drivers/gpu/drm/drm_fb_helper.c:1934
       drm_fbdev_shmem_client_hotplug+0x158/0x22c drivers/gpu/drm/drm_fbdev_shmem.c:250
       drm_client_register+0x144/0x1e0 drivers/gpu/drm/drm_client.c:141
       drm_fbdev_shmem_setup+0x11c/0x2cc drivers/gpu/drm/drm_fbdev_shmem.c:309
       vkms_create drivers/gpu/drm/vkms/vkms_drv.c:228 [inline]
       vkms_init+0x4f0/0x600 drivers/gpu/drm/vkms/vkms_drv.c:254
       do_one_initcall+0x24c/0x9c0 init/main.c:1269
       do_initcall_level+0x154/0x214 init/main.c:1331
       do_initcalls+0x58/0xac init/main.c:1347
       do_basic_setup+0x8c/0xa0 init/main.c:1366
       kernel_init_freeable+0x324/0x478 init/main.c:1580
       kernel_init+0x24/0x2a0 init/main.c:1469
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862

-> #5 (&helper->lock){+.+.}-{3:3}:
       __mutex_lock_common+0x190/0x21a0 kernel/locking/mutex.c:608
       __mutex_lock kernel/locking/mutex.c:752 [inline]
       mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:804
       __drm_fb_helper_restore_fbdev_mode_unlocked+0xb4/0x178 drivers/gpu/drm/drm_fb_helper.c:228
       drm_fb_helper_set_par+0xc4/0x110 drivers/gpu/drm/drm_fb_helper.c:1345
       fbcon_init+0xf34/0x1eb8 drivers/video/fbdev/core/fbcon.c:1113
       visual_init+0x27c/0x548 drivers/tty/vt/vt.c:1011
       do_bind_con_driver+0x7dc/0xe04 drivers/tty/vt/vt.c:3833
       do_take_over_console+0x4ac/0x5f0 drivers/tty/vt/vt.c:4399
       do_fbcon_takeover+0x158/0x260 drivers/video/fbdev/core/fbcon.c:549
       do_fb_registered drivers/video/fbdev/core/fbcon.c:2988 [inline]
       fbcon_fb_registered+0x370/0x4ec drivers/video/fbdev/core/fbcon.c:3008
       do_register_framebuffer drivers/video/fbdev/core/fbmem.c:449 [inline]
       register_framebuffer+0x470/0x610 drivers/video/fbdev/core/fbmem.c:515
       __drm_fb_helper_initial_config_and_unlock+0x13b0/0x19a4 drivers/gpu/drm/drm_fb_helper.c:1869
       drm_fb_helper_initial_config+0x48/0x64 drivers/gpu/drm/drm_fb_helper.c:1934
       drm_fbdev_shmem_client_hotplug+0x158/0x22c drivers/gpu/drm/drm_fbdev_shmem.c:250
       drm_client_register+0x144/0x1e0 drivers/gpu/drm/drm_client.c:141
       drm_fbdev_shmem_setup+0x11c/0x2cc drivers/gpu/drm/drm_fbdev_shmem.c:309
       vkms_create drivers/gpu/drm/vkms/vkms_drv.c:228 [inline]
       vkms_init+0x4f0/0x600 drivers/gpu/drm/vkms/vkms_drv.c:254
       do_one_initcall+0x24c/0x9c0 init/main.c:1269
       do_initcall_level+0x154/0x214 init/main.c:1331
       do_initcalls+0x58/0xac init/main.c:1347
       do_basic_setup+0x8c/0xa0 init/main.c:1366
       kernel_init_freeable+0x324/0x478 init/main.c:1580
       kernel_init+0x24/0x2a0 init/main.c:1469
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:862

-> #4 (console_lock){+.+.}-{0:0}:
       console_lock+0x19c/0x1f4 kernel/printk/printk.c:2808
       __bch2_print_string_as_lines fs/bcachefs/util.c:267 [inline]
       bch2_print_string_as_lines+0x2c/0xd4 fs/bcachefs/util.c:286
       __bch2_fsck_err+0x1864/0x2544 fs/bcachefs/error.c:411
       bch2_check_fix_ptr fs/bcachefs/buckets.c:112 [inline]
       bch2_check_fix_ptrs+0x15b8/0x515c fs/bcachefs/buckets.c:266
       bch2_trigger_extent+0x71c/0x814 fs/bcachefs/buckets.c:856
       bch2_key_trigger fs/bcachefs/bkey_methods.h:87 [inline]
       bch2_gc_mark_key+0x4b4/0xb70 fs/bcachefs/btree_gc.c:634
       bch2_gc_btree fs/bcachefs/btree_gc.c:670 [inline]
       bch2_gc_btrees fs/bcachefs/btree_gc.c:729 [inline]
       bch2_check_allocations+0x1018/0x48f4 fs/bcachefs/btree_gc.c:1133
       bch2_run_recovery_pass+0xe4/0x1d4 fs/bcachefs/recovery_passes.c:191
       bch2_run_recovery_passes+0x30c/0x73c fs/bcachefs/recovery_passes.c:244
       bch2_fs_recovery+0x32d8/0x55dc fs/bcachefs/recovery.c:861
       bch2_fs_start+0x30c/0x53c fs/bcachefs/super.c:1037
       bch2_fs_get_tree+0x938/0x1030 fs/bcachefs/fs.c:2170
       vfs_get_tree+0x90/0x28c fs/super.c:1814
       do_new_mount+0x278/0x900 fs/namespace.c:3507
       path_mount+0x590/0xe04 fs/namespace.c:3834
       do_mount fs/namespace.c:3847 [inline]
       __do_sys_mount fs/namespace.c:4057 [inline]
       __se_sys_mount fs/namespace.c:4034 [inline]
       __arm64_sys_mount+0x4d4/0x5ac fs/namespace.c:4034
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
       el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
       el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

-> #3 (&c->fsck_error_msgs_lock){+.+.}-{3:3}:
       __mutex_lock_common+0x190/0x21a0 kernel/locking/mutex.c:608
       __mutex_lock kernel/locking/mutex.c:752 [inline]
       mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:804
       __bch2_fsck_err+0x344/0x2544 fs/bcachefs/error.c:282
       bch2_check_fix_ptr fs/bcachefs/buckets.c:112 [inline]
       bch2_check_fix_ptrs+0x15b8/0x515c fs/bcachefs/buckets.c:266
       bch2_trigger_extent+0x71c/0x814 fs/bcachefs/buckets.c:856
       bch2_key_trigger fs/bcachefs/bkey_methods.h:87 [inline]
       bch2_gc_mark_key+0x4b4/0xb70 fs/bcachefs/btree_gc.c:634
       bch2_gc_btree fs/bcachefs/btree_gc.c:670 [inline]
       bch2_gc_btrees fs/bcachefs/btree_gc.c:729 [inline]
       bch2_check_allocations+0x1018/0x48f4 fs/bcachefs/btree_gc.c:1133
       bch2_run_recovery_pass+0xe4/0x1d4 fs/bcachefs/recovery_passes.c:191
       bch2_run_recovery_passes+0x30c/0x73c fs/bcachefs/recovery_passes.c:244
       bch2_fs_recovery+0x32d8/0x55dc fs/bcachefs/recovery.c:861
       bch2_fs_start+0x30c/0x53c fs/bcachefs/super.c:1037
       bch2_fs_get_tree+0x938/0x1030 fs/bcachefs/fs.c:2170
       vfs_get_tree+0x90/0x28c fs/super.c:1814
       do_new_mount+0x278/0x900 fs/namespace.c:3507
       path_mount+0x590/0xe04 fs/namespace.c:3834
       do_mount fs/namespace.c:3847 [inline]
       __do_sys_mount fs/namespace.c:4057 [inline]
       __se_sys_mount fs/namespace.c:4034 [inline]
       __arm64_sys_mount+0x4d4/0x5ac fs/namespace.c:4034
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
       el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
       el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

-> #2 (&c->mark_lock){++++}-{0:0}:
       percpu_down_read+0x5c/0x2e8 include/linux/percpu-rwsem.h:51
       __bch2_disk_reservation_add+0xc4/0x9f4 fs/bcachefs/buckets.c:1170
       bch2_disk_reservation_add+0x29c/0x4f4 fs/bcachefs/buckets.h:367
       __bch2_folio_reservation_get+0x2dc/0x798 fs/bcachefs/fs-io-pagecache.c:428
       bch2_folio_reservation_get fs/bcachefs/fs-io-pagecache.c:477 [inline]
       bch2_page_mkwrite+0xa70/0xe44 fs/bcachefs/fs-io-pagecache.c:637
       do_page_mkwrite+0x140/0x2dc mm/memory.c:3162
       do_shared_fault mm/memory.c:5373 [inline]
       do_fault mm/memory.c:5435 [inline]
       do_pte_missing mm/memory.c:3965 [inline]
       handle_pte_fault mm/memory.c:5766 [inline]
       __handle_mm_fault+0x1e1c/0x66e8 mm/memory.c:5909
       handle_mm_fault+0x29c/0x8b4 mm/memory.c:6077
       do_page_fault+0x570/0x10a8 arch/arm64/mm/fault.c:690
       do_translation_fault+0xc4/0x114 arch/arm64/mm/fault.c:783
       do_mem_abort+0x74/0x200 arch/arm64/mm/fault.c:919
       el0_da+0x60/0x178 arch/arm64/kernel/entry-common.c:604
       el0t_64_sync_handler+0xcc/0x108 arch/arm64/kernel/entry-common.c:765
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

-> #1 (sb_pagefaults#2){.+.+}-{0:0}:
       percpu_down_read include/linux/percpu-rwsem.h:51 [inline]
       __sb_start_write include/linux/fs.h:1716 [inline]
       sb_start_pagefault include/linux/fs.h:1881 [inline]
       bch2_page_mkwrite+0x280/0xe44 fs/bcachefs/fs-io-pagecache.c:614
       do_page_mkwrite+0x140/0x2dc mm/memory.c:3162
       do_shared_fault mm/memory.c:5373 [inline]
       do_fault mm/memory.c:5435 [inline]
       do_pte_missing mm/memory.c:3965 [inline]
       handle_pte_fault mm/memory.c:5766 [inline]
       __handle_mm_fault+0x1e1c/0x66e8 mm/memory.c:5909
       handle_mm_fault+0x29c/0x8b4 mm/memory.c:6077
       do_page_fault+0x570/0x10a8 arch/arm64/mm/fault.c:690
       do_translation_fault+0xc4/0x114 arch/arm64/mm/fault.c:783
       do_mem_abort+0x74/0x200 arch/arm64/mm/fault.c:919
       el0_da+0x60/0x178 arch/arm64/kernel/entry-common.c:604
       el0t_64_sync_handler+0xcc/0x108 arch/arm64/kernel/entry-common.c:765
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

-> #0 (&mm->mmap_lock){++++}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3161 [inline]
       check_prevs_add kernel/locking/lockdep.c:3280 [inline]
       validate_chain kernel/locking/lockdep.c:3904 [inline]
       __lock_acquire+0x33f8/0x77c8 kernel/locking/lockdep.c:5202
       lock_acquire+0x240/0x728 kernel/locking/lockdep.c:5825
       __might_fault+0xc4/0x124 mm/memory.c:6716
       drm_mode_get_lease_ioctl+0x318/0x63c drivers/gpu/drm/drm_lease.c:673
       drm_ioctl_kernel+0x26c/0x368 drivers/gpu/drm/drm_ioctl.c:745
       drm_ioctl+0x624/0xb14 drivers/gpu/drm/drm_ioctl.c:842
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:907 [inline]
       __se_sys_ioctl fs/ioctl.c:893 [inline]
       __arm64_sys_ioctl+0x14c/0x1c8 fs/ioctl.c:893
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
       el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
       el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

other info that might help us debug this:

Chain exists of:
  &mm->mmap_lock --> &helper->lock --> &dev->mode_config.idr_mutex

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&dev->mode_config.idr_mutex);
                               lock(&helper->lock);
                               lock(&dev->mode_config.idr_mutex);
  rlock(&mm->mmap_lock);

 *** DEADLOCK ***

1 lock held by syz.3.235/8073:
 #0: ffff0000c9c4c5d0 (&dev->mode_config.idr_mutex){+.+.}-{3:3}, at: drm_mode_get_lease_ioctl+0x1ec/0x63c drivers/gpu/drm/drm_lease.c:660

stack backtrace:
CPU: 1 UID: 0 PID: 8073 Comm: syz.3.235 Not tainted 6.12.0-syzkaller-g7b1d1d4cfac0 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:484 (C)
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0xe4/0x150 lib/dump_stack.c:120
 dump_stack+0x1c/0x28 lib/dump_stack.c:129
 print_circular_bug+0x154/0x1c0 kernel/locking/lockdep.c:2074
 check_noncircular+0x310/0x404 kernel/locking/lockdep.c:2206
 check_prev_add kernel/locking/lockdep.c:3161 [inline]
 check_prevs_add kernel/locking/lockdep.c:3280 [inline]
 validate_chain kernel/locking/lockdep.c:3904 [inline]
 __lock_acquire+0x33f8/0x77c8 kernel/locking/lockdep.c:5202
 lock_acquire+0x240/0x728 kernel/locking/lockdep.c:5825
 __might_fault+0xc4/0x124 mm/memory.c:6716
 drm_mode_get_lease_ioctl+0x318/0x63c drivers/gpu/drm/drm_lease.c:673
 drm_ioctl_kernel+0x26c/0x368 drivers/gpu/drm/drm_ioctl.c:745
 drm_ioctl+0x624/0xb14 drivers/gpu/drm/drm_ioctl.c:842
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl fs/ioctl.c:893 [inline]
 __arm64_sys_ioctl+0x14c/0x1c8 fs/ioctl.c:893
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
