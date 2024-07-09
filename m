Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CF492C2E1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 19:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F0610E620;
	Tue,  9 Jul 2024 17:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A526410E620
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 17:53:19 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-7fb19ed628aso468779339f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 10:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720547599; x=1721152399;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6TIGhLVmRlg26rbCSI7tbtmcY0lL8RHptPvUcCP+4rw=;
 b=l7l/y+WUhUBcMxFCaj7MlOX/3M74qfpQmZpDl9WsuwqBrjjPHn+NEMF11iptkEqA8/
 6bxCL6eMzCbnQQ0ubGG/7tIztOvc7B6S3w5ilyol5D806XJKMGgh3l+Ullg92W1WIHg7
 LhQzkAOxnwQXYhdaVI/hGeQEvSzx9wdZGU1PZML5xVVlng2MQ9zIUsZyFyTjYpvlmOX7
 jfp9O3BCn+PBJb+Ccghn7I7FQB1RK4+agctpxafH6Q7pwB3tFWppukFgE3zn7TTDCzXL
 b9GWRh3QEGGaucimBCuzs4jnXcnlk78XNNbHkNiyITlWe7P6kwEOrYo5qSaNPBAtUUvF
 kT8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUoptrc9MsFkDKfKcf/SWGDYM7UhMIWEf7AdgVri/UpFvgY+bOM5Fru8rJ18QTeAIAB0oENVWJzbjCr+hHICpa1WDA2+Vithws/4ND4Q6k
X-Gm-Message-State: AOJu0YxJ/zY3Tf9KqXAQC3ZOHOq+7JAYHZXk0lqQmsIVDJitLQ/B/m89
 /mxw4B6PtXZys3GEN9D9wdtIFOmfyIHx96PGvg5m+Maro0oF0N/lYW05a+iC2jfDvQkPRGIof/9
 mV8v1mTbY8qdymW8zFsbw+uhj2ywnNpruxWcpdPoI3HG5xuMOowAh194=
X-Google-Smtp-Source: AGHT+IGReVhNZ4/SJXiul52x6r7pUsWxM7LUjztg3ZWuQ2033XdM24tBOXKvYcSbu8fb1m8AnoL6Z0x8RcfrUWbkG53rJcs1qb+m
MIME-Version: 1.0
X-Received: by 2002:a05:6602:6403:b0:7f8:c159:fec2 with SMTP id
 ca18e2360f4ac-800050cc601mr18527039f.4.1720547598912; Tue, 09 Jul 2024
 10:53:18 -0700 (PDT)
Date: Tue, 09 Jul 2024 10:53:18 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000073db8b061cd43496@google.com>
Subject: [syzbot] [dri?] possible deadlock in drm_modeset_lock
From: syzbot <syzbot+2e171785a12db2e2bd5d@syzkaller.appspotmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net, 
 melissa.srw@gmail.com, mripard@kernel.org, rodrigosiqueiramelo@gmail.com, 
 syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
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

HEAD commit:    8e2f4becf4fa Merge remote-tracking branch 'tglx/devmsi-arm..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=10676a9e980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=15349546db652fd3
dashboard link: https://syzkaller.appspot.com/bug?extid=2e171785a12db2e2bd5d
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ee71a34a1c26/disk-8e2f4bec.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f8a6bf3c4b1c/vmlinux-8e2f4bec.xz
kernel image: https://storage.googleapis.com/syzbot-assets/236760504de5/Image-8e2f4bec.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2e171785a12db2e2bd5d@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.10.0-rc6-syzkaller-g8e2f4becf4fa #0 Not tainted
------------------------------------------------------
syz.4.1912/14164 is trying to acquire lock:
ffff0000ccd2e988 (&mm->mmap_lock){++++}-{3:3}, at: __might_fault+0x9c/0x124 mm/memory.c:6233

but task is already holding lock:
ffff0000c8f64518 (crtc_ww_class_mutex){+.+.}-{3:3}, at: drm_modeset_lock+0x78/0xa4 drivers/gpu/drm/drm_modeset_lock.c:398

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #8 (crtc_ww_class_mutex){+.+.}-{3:3}:
       __mutex_lock_common+0x190/0x21a0 kernel/locking/mutex.c:608
       __ww_mutex_lock kernel/locking/mutex.c:759 [inline]
       ww_mutex_lock+0x64/0x3a4 kernel/locking/mutex.c:876
       modeset_lock+0x278/0x59c drivers/gpu/drm/drm_modeset_lock.c:314
       drm_modeset_lock+0x64/0xa4 drivers/gpu/drm/drm_modeset_lock.c:396
       drmm_mode_config_init+0xba0/0x1280 drivers/gpu/drm/drm_mode_config.c:454
       vkms_modeset_init drivers/gpu/drm/vkms/vkms_drv.c:156 [inline]
       vkms_create drivers/gpu/drm/vkms/vkms_drv.c:215 [inline]
       vkms_init+0x2fc/0x600 drivers/gpu/drm/vkms/vkms_drv.c:252
       do_one_initcall+0x24c/0x9c0 init/main.c:1267
       do_initcall_level+0x154/0x214 init/main.c:1329
       do_initcalls+0x58/0xac init/main.c:1345
       do_basic_setup+0x8c/0xa0 init/main.c:1364
       kernel_init_freeable+0x324/0x478 init/main.c:1578
       kernel_init+0x24/0x2a0 init/main.c:1467
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:860

-> #7 (crtc_ww_class_acquire){+.+.}-{0:0}:
       ww_acquire_init include/linux/ww_mutex.h:149 [inline]
       drm_modeset_acquire_init+0x194/0x330 drivers/gpu/drm/drm_modeset_lock.c:250
       drm_client_modeset_commit_atomic+0xe0/0x730 drivers/gpu/drm/drm_client_modeset.c:1002
       drm_client_modeset_commit_locked+0xd0/0x4a8 drivers/gpu/drm/drm_client_modeset.c:1166
       drm_client_modeset_commit+0x50/0x7c drivers/gpu/drm/drm_client_modeset.c:1192
       __drm_fb_helper_restore_fbdev_mode_unlocked+0xd4/0x178 drivers/gpu/drm/drm_fb_helper.c:251
       drm_fb_helper_set_par+0xc4/0x110 drivers/gpu/drm/drm_fb_helper.c:1347
       fbcon_init+0xf34/0x1eb8 drivers/video/fbdev/core/fbcon.c:1093
       visual_init+0x27c/0x548 drivers/tty/vt/vt.c:1011
       do_bind_con_driver+0x7dc/0xe04 drivers/tty/vt/vt.c:3833
       do_take_over_console+0x4ac/0x5f0 drivers/tty/vt/vt.c:4399
       do_fbcon_takeover+0x158/0x260 drivers/video/fbdev/core/fbcon.c:531
       do_fb_registered drivers/video/fbdev/core/fbcon.c:2968 [inline]
       fbcon_fb_registered+0x370/0x4ec drivers/video/fbdev/core/fbcon.c:2988
       do_register_framebuffer drivers/video/fbdev/core/fbmem.c:449 [inline]
       register_framebuffer+0x470/0x610 drivers/video/fbdev/core/fbmem.c:515
       __drm_fb_helper_initial_config_and_unlock+0x13b0/0x19a4 drivers/gpu/drm/drm_fb_helper.c:1871
       drm_fb_helper_initial_config+0x48/0x64 drivers/gpu/drm/drm_fb_helper.c:1936
       drm_fbdev_generic_client_hotplug+0x158/0x22c drivers/gpu/drm/drm_fbdev_generic.c:278
       drm_client_register+0x144/0x1e0 drivers/gpu/drm/drm_client.c:141
       drm_fbdev_generic_setup+0x11c/0x2cc drivers/gpu/drm/drm_fbdev_generic.c:340
       vkms_create drivers/gpu/drm/vkms/vkms_drv.c:226 [inline]
       vkms_init+0x4f0/0x600 drivers/gpu/drm/vkms/vkms_drv.c:252
       do_one_initcall+0x24c/0x9c0 init/main.c:1267
       do_initcall_level+0x154/0x214 init/main.c:1329
       do_initcalls+0x58/0xac init/main.c:1345
       do_basic_setup+0x8c/0xa0 init/main.c:1364
       kernel_init_freeable+0x324/0x478 init/main.c:1578
       kernel_init+0x24/0x2a0 init/main.c:1467
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:860

-> #6 (&client->modeset_mutex){+.+.}-{3:3}:
       __mutex_lock_common+0x190/0x21a0 kernel/locking/mutex.c:608
       __mutex_lock kernel/locking/mutex.c:752 [inline]
       mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:804
       drm_client_modeset_probe+0x318/0x3f68 drivers/gpu/drm/drm_client_modeset.c:832
       __drm_fb_helper_initial_config_and_unlock+0xf0/0x19a4 drivers/gpu/drm/drm_fb_helper.c:1848
       drm_fb_helper_initial_config+0x48/0x64 drivers/gpu/drm/drm_fb_helper.c:1936
       drm_fbdev_generic_client_hotplug+0x158/0x22c drivers/gpu/drm/drm_fbdev_generic.c:278
       drm_client_register+0x144/0x1e0 drivers/gpu/drm/drm_client.c:141
       drm_fbdev_generic_setup+0x11c/0x2cc drivers/gpu/drm/drm_fbdev_generic.c:340
       vkms_create drivers/gpu/drm/vkms/vkms_drv.c:226 [inline]
       vkms_init+0x4f0/0x600 drivers/gpu/drm/vkms/vkms_drv.c:252
       do_one_initcall+0x24c/0x9c0 init/main.c:1267
       do_initcall_level+0x154/0x214 init/main.c:1329
       do_initcalls+0x58/0xac init/main.c:1345
       do_basic_setup+0x8c/0xa0 init/main.c:1364
       kernel_init_freeable+0x324/0x478 init/main.c:1578
       kernel_init+0x24/0x2a0 init/main.c:1467
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:860

-> #5 (&helper->lock){+.+.}-{3:3}:
       __mutex_lock_common+0x190/0x21a0 kernel/locking/mutex.c:608
       __mutex_lock kernel/locking/mutex.c:752 [inline]
       mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:804
       __drm_fb_helper_restore_fbdev_mode_unlocked+0xb4/0x178 drivers/gpu/drm/drm_fb_helper.c:242
       drm_fb_helper_set_par+0xc4/0x110 drivers/gpu/drm/drm_fb_helper.c:1347
       fbcon_init+0xf34/0x1eb8 drivers/video/fbdev/core/fbcon.c:1093
       visual_init+0x27c/0x548 drivers/tty/vt/vt.c:1011
       do_bind_con_driver+0x7dc/0xe04 drivers/tty/vt/vt.c:3833
       do_take_over_console+0x4ac/0x5f0 drivers/tty/vt/vt.c:4399
       do_fbcon_takeover+0x158/0x260 drivers/video/fbdev/core/fbcon.c:531
       do_fb_registered drivers/video/fbdev/core/fbcon.c:2968 [inline]
       fbcon_fb_registered+0x370/0x4ec drivers/video/fbdev/core/fbcon.c:2988
       do_register_framebuffer drivers/video/fbdev/core/fbmem.c:449 [inline]
       register_framebuffer+0x470/0x610 drivers/video/fbdev/core/fbmem.c:515
       __drm_fb_helper_initial_config_and_unlock+0x13b0/0x19a4 drivers/gpu/drm/drm_fb_helper.c:1871
       drm_fb_helper_initial_config+0x48/0x64 drivers/gpu/drm/drm_fb_helper.c:1936
       drm_fbdev_generic_client_hotplug+0x158/0x22c drivers/gpu/drm/drm_fbdev_generic.c:278
       drm_client_register+0x144/0x1e0 drivers/gpu/drm/drm_client.c:141
       drm_fbdev_generic_setup+0x11c/0x2cc drivers/gpu/drm/drm_fbdev_generic.c:340
       vkms_create drivers/gpu/drm/vkms/vkms_drv.c:226 [inline]
       vkms_init+0x4f0/0x600 drivers/gpu/drm/vkms/vkms_drv.c:252
       do_one_initcall+0x24c/0x9c0 init/main.c:1267
       do_initcall_level+0x154/0x214 init/main.c:1329
       do_initcalls+0x58/0xac init/main.c:1345
       do_basic_setup+0x8c/0xa0 init/main.c:1364
       kernel_init_freeable+0x324/0x478 init/main.c:1578
       kernel_init+0x24/0x2a0 init/main.c:1467
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:860

-> #4 (console_lock){+.+.}-{0:0}:
       console_lock+0x19c/0x1f4 kernel/printk/printk.c:2665
       bch2_print_string_as_lines+0x2c/0xd4 fs/bcachefs/util.c:264
       bch2_fsck_err+0x1d84/0x3300 fs/bcachefs/error.c:352
       bch2_check_fix_ptr fs/bcachefs/buckets.c:504 [inline]
       bch2_check_fix_ptrs+0x14b4/0x4ae8 fs/bcachefs/buckets.c:631
       bch2_trigger_extent+0x634/0x734 fs/bcachefs/buckets.c:1238
       bch2_key_trigger fs/bcachefs/bkey_methods.h:88 [inline]
       bch2_gc_mark_key+0x474/0xb3c fs/bcachefs/btree_gc.c:613
       bch2_gc_btree fs/bcachefs/btree_gc.c:664 [inline]
       bch2_gc_btrees fs/bcachefs/btree_gc.c:697 [inline]
       bch2_check_allocations+0x2128/0x80d8 fs/bcachefs/btree_gc.c:1224
       bch2_run_recovery_pass+0xe4/0x1d4 fs/bcachefs/recovery_passes.c:182
       bch2_run_recovery_passes+0x258/0x6e0 fs/bcachefs/recovery_passes.c:225
       bch2_fs_recovery+0x31f0/0x5488 fs/bcachefs/recovery.c:813
       bch2_fs_start+0x30c/0x53c fs/bcachefs/super.c:1035
       bch2_fs_open+0x8b4/0xb64 fs/bcachefs/super.c:2132
       bch2_mount+0x4fc/0xe68 fs/bcachefs/fs.c:1926
       legacy_get_tree+0xd4/0x16c fs/fs_context.c:662
       vfs_get_tree+0x90/0x288 fs/super.c:1780
       do_new_mount+0x278/0x900 fs/namespace.c:3352
       path_mount+0x590/0xe04 fs/namespace.c:3679
       do_mount fs/namespace.c:3692 [inline]
       __do_sys_mount fs/namespace.c:3898 [inline]
       __se_sys_mount fs/namespace.c:3875 [inline]
       __arm64_sys_mount+0x45c/0x594 fs/namespace.c:3875
       __invoke_syscall arch/arm64/kernel/syscall.c:34 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:48
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:131
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:150
       el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:712
       el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598

-> #3 (&c->fsck_error_msgs_lock){+.+.}-{3:3}:
       __mutex_lock_common+0x190/0x21a0 kernel/locking/mutex.c:608
       __mutex_lock kernel/locking/mutex.c:752 [inline]
       mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:804
       bch2_fsck_err+0x2d4/0x3300 fs/bcachefs/error.c:239
       bch2_check_fix_ptr fs/bcachefs/buckets.c:504 [inline]
       bch2_check_fix_ptrs+0x14b4/0x4ae8 fs/bcachefs/buckets.c:631
       bch2_trigger_extent+0x634/0x734 fs/bcachefs/buckets.c:1238
       bch2_key_trigger fs/bcachefs/bkey_methods.h:88 [inline]
       bch2_gc_mark_key+0x474/0xb3c fs/bcachefs/btree_gc.c:613
       bch2_gc_btree fs/bcachefs/btree_gc.c:664 [inline]
       bch2_gc_btrees fs/bcachefs/btree_gc.c:697 [inline]
       bch2_check_allocations+0x2128/0x80d8 fs/bcachefs/btree_gc.c:1224
       bch2_run_recovery_pass+0xe4/0x1d4 fs/bcachefs/recovery_passes.c:182
       bch2_run_recovery_passes+0x258/0x6e0 fs/bcachefs/recovery_passes.c:225
       bch2_fs_recovery+0x31f0/0x5488 fs/bcachefs/recovery.c:813
       bch2_fs_start+0x30c/0x53c fs/bcachefs/super.c:1035
       bch2_fs_open+0x8b4/0xb64 fs/bcachefs/super.c:2132
       bch2_mount+0x4fc/0xe68 fs/bcachefs/fs.c:1926
       legacy_get_tree+0xd4/0x16c fs/fs_context.c:662
       vfs_get_tree+0x90/0x288 fs/super.c:1780
       do_new_mount+0x278/0x900 fs/namespace.c:3352
       path_mount+0x590/0xe04 fs/namespace.c:3679
       do_mount fs/namespace.c:3692 [inline]
       __do_sys_mount fs/namespace.c:3898 [inline]
       __se_sys_mount fs/namespace.c:3875 [inline]
       __arm64_sys_mount+0x45c/0x594 fs/namespace.c:3875
       __invoke_syscall arch/arm64/kernel/syscall.c:34 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:48
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:131
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:150
       el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:712
       el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598

-> #2 (&c->mark_lock){++++}-{0:0}:
       percpu_down_read+0x5c/0x2e8 include/linux/percpu-rwsem.h:51
       __bch2_disk_reservation_add+0x98/0x904 fs/bcachefs/buckets.c:1530
       bch2_disk_reservation_add+0x2f0/0x45c fs/bcachefs/buckets.h:430
       bch2_folio_reservation_get+0x4b0/0x7a0 fs/bcachefs/fs-io-pagecache.c:446
       bch2_page_mkwrite+0xa08/0xddc fs/bcachefs/fs-io-pagecache.c:616
       do_page_mkwrite+0x140/0x2dc mm/memory.c:3093
       do_shared_fault mm/memory.c:4993 [inline]
       do_fault mm/memory.c:5055 [inline]
       do_pte_missing mm/memory.c:3897 [inline]
       handle_pte_fault+0x11e4/0x5714 mm/memory.c:5381
       __handle_mm_fault mm/memory.c:5524 [inline]
       handle_mm_fault+0xe84/0x15cc mm/memory.c:5689
       do_page_fault+0x428/0xb1c arch/arm64/mm/fault.c:613
       do_translation_fault+0xc4/0x114 arch/arm64/mm/fault.c:690
       do_mem_abort+0x74/0x200 arch/arm64/mm/fault.c:826
       el0_da+0x60/0x178 arch/arm64/kernel/entry-common.c:580
       el0t_64_sync_handler+0xcc/0xfc arch/arm64/kernel/entry-common.c:733
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598

-> #1 (sb_pagefaults#2){.+.+}-{0:0}:
       percpu_down_read include/linux/percpu-rwsem.h:51 [inline]
       __sb_start_write include/linux/fs.h:1655 [inline]
       sb_start_pagefault include/linux/fs.h:1820 [inline]
       bch2_page_mkwrite+0x260/0xddc fs/bcachefs/fs-io-pagecache.c:593
       do_page_mkwrite+0x140/0x2dc mm/memory.c:3093
       do_shared_fault mm/memory.c:4993 [inline]
       do_fault mm/memory.c:5055 [inline]
       do_pte_missing mm/memory.c:3897 [inline]
       handle_pte_fault+0x11e4/0x5714 mm/memory.c:5381
       __handle_mm_fault mm/memory.c:5524 [inline]
       handle_mm_fault+0xe84/0x15cc mm/memory.c:5689
       do_page_fault+0x428/0xb1c arch/arm64/mm/fault.c:613
       do_translation_fault+0xc4/0x114 arch/arm64/mm/fault.c:690
       do_mem_abort+0x74/0x200 arch/arm64/mm/fault.c:826
       el0_da+0x60/0x178 arch/arm64/kernel/entry-common.c:580
       el0t_64_sync_handler+0xcc/0xfc arch/arm64/kernel/entry-common.c:733
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598

-> #0 (&mm->mmap_lock){++++}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3134 [inline]
       check_prevs_add kernel/locking/lockdep.c:3253 [inline]
       validate_chain kernel/locking/lockdep.c:3869 [inline]
       __lock_acquire+0x3384/0x763c kernel/locking/lockdep.c:5137
       lock_acquire+0x240/0x728 kernel/locking/lockdep.c:5754
       __might_fault+0xc4/0x124 mm/memory.c:6234
       drm_mode_object_get_properties+0x208/0x560 drivers/gpu/drm/drm_mode_object.c:406
       drm_mode_getconnector+0xde4/0x1224 drivers/gpu/drm/drm_connector.c:3020
       drm_ioctl_kernel+0x26c/0x368 drivers/gpu/drm/drm_ioctl.c:744
       drm_ioctl+0x5e4/0xae4 drivers/gpu/drm/drm_ioctl.c:841
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:907 [inline]
       __se_sys_ioctl fs/ioctl.c:893 [inline]
       __arm64_sys_ioctl+0x14c/0x1c8 fs/ioctl.c:893
       __invoke_syscall arch/arm64/kernel/syscall.c:34 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:48
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:131
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:150
       el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:712
       el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598

other info that might help us debug this:

Chain exists of:
  &mm->mmap_lock --> crtc_ww_class_acquire --> crtc_ww_class_mutex

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(crtc_ww_class_mutex);
                               lock(crtc_ww_class_acquire);
                               lock(crtc_ww_class_mutex);
  rlock(&mm->mmap_lock);

 *** DEADLOCK ***

1 lock held by syz.4.1912/14164:
 #0: ffff0000c8f64518 (crtc_ww_class_mutex){+.+.}-{3:3}, at: drm_modeset_lock+0x78/0xa4 drivers/gpu/drm/drm_modeset_lock.c:398

stack backtrace:
CPU: 0 PID: 14164 Comm: syz.4.1912 Not tainted 6.10.0-rc6-syzkaller-g8e2f4becf4fa #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/07/2024
Call trace:
 dump_backtrace+0x1b8/0x1e4 arch/arm64/kernel/stacktrace.c:317
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:324
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xe4/0x150 lib/dump_stack.c:114
 dump_stack+0x1c/0x28 lib/dump_stack.c:123
 print_circular_bug+0x150/0x1b8 kernel/locking/lockdep.c:2060
 check_noncircular+0x310/0x404 kernel/locking/lockdep.c:2187
 check_prev_add kernel/locking/lockdep.c:3134 [inline]
 check_prevs_add kernel/locking/lockdep.c:3253 [inline]
 validate_chain kernel/locking/lockdep.c:3869 [inline]
 __lock_acquire+0x3384/0x763c kernel/locking/lockdep.c:5137
 lock_acquire+0x240/0x728 kernel/locking/lockdep.c:5754
 __might_fault+0xc4/0x124 mm/memory.c:6234
 drm_mode_object_get_properties+0x208/0x560 drivers/gpu/drm/drm_mode_object.c:406
 drm_mode_getconnector+0xde4/0x1224 drivers/gpu/drm/drm_connector.c:3020
 drm_ioctl_kernel+0x26c/0x368 drivers/gpu/drm/drm_ioctl.c:744
 drm_ioctl+0x5e4/0xae4 drivers/gpu/drm/drm_ioctl.c:841
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl fs/ioctl.c:893 [inline]
 __arm64_sys_ioctl+0x14c/0x1c8 fs/ioctl.c:893
 __invoke_syscall arch/arm64/kernel/syscall.c:34 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:48
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:131
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:150
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:712
 el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:730
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598


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
