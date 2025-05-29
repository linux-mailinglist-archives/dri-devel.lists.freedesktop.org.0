Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C674AC831F
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 22:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF22910E0A5;
	Thu, 29 May 2025 20:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com
 [209.85.166.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F02110E1F4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 20:15:35 +0000 (UTC)
Received: by mail-il1-f207.google.com with SMTP id
 e9e14a558f8ab-3dd770a7424so14995825ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 13:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748549734; x=1749154534;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HrRJGsn63w01bDekqTAtZlhnPOVEpZ6sNmTssiBfG+4=;
 b=gdeto6sZmUCWvgvc9krWerBXYeqWA77KL5xB0c3WtYkx3mdN+K2XsFdDbQxiOD85zu
 OV003p4RdHAP5SrdCrKpyk9Sc9F0thlF3v4sSvlP2q3IEMHK3g615165ttEe3hFuYQZx
 xLuJbcleePtgCnv5m2h6PLA4RbSMsb6Pks8E8gnJlqtsFVLFmqEelalOpdZ6mXEIcNIr
 HvIK9YmZ/wkNROTL2EsgioaMi1JvFuOG8nGpgrRfAFoLGaGbfYIPVyrpAwFoGawVP1bn
 AsqY2i7hYM1TsJ2TEJKel6lsu1BFcujaT12xJOm/WOju9ttYNUFJbek+g3D6vFJUHoxU
 g7Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSqaX6/j297YT4cO6gW2OFkMzR4xAzm9RAEtNCQBdwGvgpmTG+IizRdA4WEFpil1ctPl2N4qP8jjY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnnuwIJX4aXOWZWb1xcMBZmnaMnOccRLhxUvX2NrUoBYtS7Y33
 lV63GfFM24LTqMJXu3QBBD9UOlxKk49Bvx/1xkoqOIupd2MQVKOMt9hSuERvQLVQWqpbgwnuO4U
 Xi84gpvzpDylT1/EBBou9LX21bEjbRgENIkXoetcMcepjcY4ZUzVvkNZ2l6U=
X-Google-Smtp-Source: AGHT+IFcqDwgrUMm0lF0xkNDRYJykHxQjZkm2QBU2kjCkceQoSYNp0X6N86jfXGVG5clwKuh5x+kkFNbNWSIXDdKxx86/jVpl9H7
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1785:b0:3dc:757b:3fb3 with SMTP id
 e9e14a558f8ab-3dd99c5889dmr14448555ab.20.1748549734146; Thu, 29 May 2025
 13:15:34 -0700 (PDT)
Date: Thu, 29 May 2025 13:15:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6838c066.a70a0220.1765ec.018b.GAE@google.com>
Subject: [syzbot] [dri?] possible deadlock in drm_mode_get_lease_ioctl (2)
From: syzbot <syzbot+4784e928cc299a6dd040@syzkaller.appspotmail.com>
To: airlied@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, simona@ffwll.ch, syzkaller-bugs@googlegroups.com, 
 tzimmermann@suse.de
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

HEAD commit:    d7fa1af5b33e Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=125f1170580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=89c13de706fbf07a
dashboard link: https://syzkaller.appspot.com/bug?extid=4784e928cc299a6dd040
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/da97ad659b2c/disk-d7fa1af5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/659e123552a8/vmlinux-d7fa1af5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6ec5dbf4643e/Image-d7fa1af5.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4784e928cc299a6dd040@syzkaller.appspotmail.com

XFS (loop4): Ending clean mount
======================================================
WARNING: possible circular locking dependency detected
6.15.0-rc7-syzkaller-gd7fa1af5b33e #0 Not tainted
------------------------------------------------------
syz.4.374/8650 is trying to acquire lock:
ffff0000d13456d0 (&mm->mmap_lock){++++}-{4:4}, at: __might_fault+0x9c/0x124 mm/memory.c:7150

but task is already holding lock:
ffff0000c9ae65d0 (&dev->mode_config.idr_mutex){+.+.}-{4:4}, at: drm_mode_get_lease_ioctl+0x1c8/0x53c drivers/gpu/drm/drm_lease.c:660

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #5 (&dev->mode_config.idr_mutex){+.+.}-{4:4}:
       __mutex_lock_common+0x1d0/0x2190 kernel/locking/mutex.c:601
       __mutex_lock kernel/locking/mutex.c:746 [inline]
       mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:798
       __drm_mode_object_add+0xa8/0x1f0 drivers/gpu/drm/drm_mode_object.c:47
       drm_framebuffer_init+0x14c/0x2bc drivers/gpu/drm/drm_framebuffer.c:875
       drm_gem_fb_init drivers/gpu/drm/drm_gem_framebuffer_helper.c:82 [inline]
       drm_gem_fb_init_with_funcs+0xa60/0xda4 drivers/gpu/drm/drm_gem_framebuffer_helper.c:202
       drm_gem_fb_create_with_funcs drivers/gpu/drm/drm_gem_framebuffer_helper.c:245 [inline]
       drm_gem_fb_create+0x84/0xd4 drivers/gpu/drm/drm_gem_framebuffer_helper.c:286
       drm_internal_framebuffer_create+0xfcc/0x19dc drivers/gpu/drm/drm_framebuffer.c:304
       drm_mode_addfb2+0xac/0x2a0 drivers/gpu/drm/drm_framebuffer.c:338
       drm_client_buffer_addfb drivers/gpu/drm/drm_client.c:386 [inline]
       drm_client_framebuffer_create+0x2d0/0x55c drivers/gpu/drm/drm_client.c:428
       drm_fbdev_shmem_driver_fbdev_probe+0x180/0x70c drivers/gpu/drm/drm_fbdev_shmem.c:151
       drm_fb_helper_single_fb_probe drivers/gpu/drm/drm_fb_helper.c:1649 [inline]
       __drm_fb_helper_initial_config_and_unlock+0xf94/0x159c drivers/gpu/drm/drm_fb_helper.c:1829
       drm_fb_helper_initial_config+0x3c/0x58 drivers/gpu/drm/drm_fb_helper.c:1916
       drm_fbdev_client_hotplug+0x154/0x22c drivers/gpu/drm/clients/drm_fbdev_client.c:52
       drm_client_register+0x13c/0x1d4 drivers/gpu/drm/drm_client.c:140
       drm_fbdev_client_setup+0x194/0x3d0 drivers/gpu/drm/clients/drm_fbdev_client.c:159
       drm_client_setup+0x78/0x140 drivers/gpu/drm/clients/drm_client_setup.c:39
       vkms_create drivers/gpu/drm/vkms/vkms_drv.c:218 [inline]
       vkms_init+0x4b8/0x5ac drivers/gpu/drm/vkms/vkms_drv.c:242
       do_one_initcall+0x250/0x990 init/main.c:1257
       do_initcall_level+0x154/0x214 init/main.c:1319
       do_initcalls+0x84/0xf4 init/main.c:1335
       do_basic_setup+0x8c/0xa0 init/main.c:1354
       kernel_init_freeable+0x2dc/0x444 init/main.c:1567
       kernel_init+0x24/0x1dc init/main.c:1457
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:847

-> #4 (&helper->lock){+.+.}-{4:4}:
       __mutex_lock_common+0x1d0/0x2190 kernel/locking/mutex.c:601
       __mutex_lock kernel/locking/mutex.c:746 [inline]
       mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:798
       __drm_fb_helper_restore_fbdev_mode_unlocked+0x74/0x198 drivers/gpu/drm/drm_fb_helper.c:228
       drm_fb_helper_set_par+0xa4/0x108 drivers/gpu/drm/drm_fb_helper.c:1359
       fbcon_init+0xe4c/0x1d18 drivers/video/fbdev/core/fbcon.c:1112
       visual_init+0x27c/0x540 drivers/tty/vt/vt.c:1011
       do_bind_con_driver+0x7b8/0xdd8 drivers/tty/vt/vt.c:3831
       do_take_over_console+0x824/0x97c drivers/tty/vt/vt.c:4397
       do_fbcon_takeover+0x158/0x25c drivers/video/fbdev/core/fbcon.c:548
       do_fb_registered drivers/video/fbdev/core/fbcon.c:2989 [inline]
       fbcon_fb_registered+0x354/0x4c8 drivers/video/fbdev/core/fbcon.c:3009
       do_register_framebuffer drivers/video/fbdev/core/fbmem.c:449 [inline]
       register_framebuffer+0x44c/0x5ec drivers/video/fbdev/core/fbmem.c:515
       __drm_fb_helper_initial_config_and_unlock+0x103c/0x159c drivers/gpu/drm/drm_fb_helper.c:1851
       drm_fb_helper_initial_config+0x3c/0x58 drivers/gpu/drm/drm_fb_helper.c:1916
       drm_fbdev_client_hotplug+0x154/0x22c drivers/gpu/drm/clients/drm_fbdev_client.c:52
       drm_client_register+0x13c/0x1d4 drivers/gpu/drm/drm_client.c:140
       drm_fbdev_client_setup+0x194/0x3d0 drivers/gpu/drm/clients/drm_fbdev_client.c:159
       drm_client_setup+0x78/0x140 drivers/gpu/drm/clients/drm_client_setup.c:39
       vkms_create drivers/gpu/drm/vkms/vkms_drv.c:218 [inline]
       vkms_init+0x4b8/0x5ac drivers/gpu/drm/vkms/vkms_drv.c:242
       do_one_initcall+0x250/0x990 init/main.c:1257
       do_initcall_level+0x154/0x214 init/main.c:1319
       do_initcalls+0x84/0xf4 init/main.c:1335
       do_basic_setup+0x8c/0xa0 init/main.c:1354
       kernel_init_freeable+0x2dc/0x444 init/main.c:1567
       kernel_init+0x24/0x1dc init/main.c:1457
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:847

-> #3 (console_lock){+.+.}-{0:0}:
       console_lock+0x194/0x1ec kernel/printk/printk.c:2849
       __bch2_print_string_as_lines fs/bcachefs/util.c:267 [inline]
       bch2_print_string_as_lines+0x34/0x150 fs/bcachefs/util.c:286
       bucket_ref_update_err+0x1c8/0x21c fs/bcachefs/buckets.c:417
       bch2_bucket_ref_update+0x3d8/0x888 fs/bcachefs/buckets.c:-1
       __mark_pointer fs/bcachefs/buckets.c:572 [inline]
       bch2_trigger_pointer fs/bcachefs/buckets.c:618 [inline]
       __trigger_extent+0xd90/0x35fc fs/bcachefs/buckets.c:763
       bch2_trigger_extent+0x3e4/0x78c fs/bcachefs/buckets.c:881
       run_one_trans_trigger fs/bcachefs/btree_trans_commit.c:-1 [inline]
       bch2_trans_commit_run_triggers fs/bcachefs/btree_trans_commit.c:550 [inline]
       __bch2_trans_commit+0x7e8/0x62d0 fs/bcachefs/btree_trans_commit.c:990
       bch2_trans_commit fs/bcachefs/btree_update.h:195 [inline]
       bch2_extent_update+0x2d8/0x7e8 fs/bcachefs/io_write.c:353
       bch2_fpunch_at+0x4dc/0x98c fs/bcachefs/io_misc.c:187
       __bch2_resume_logged_op_truncate+0x340/0x4b4 fs/bcachefs/io_misc.c:265
       bch2_truncate+0x144/0x1e4 fs/bcachefs/io_misc.c:300
       bchfs_truncate+0x648/0xa70 fs/bcachefs/fs-io.c:509
       bch2_setattr+0x198/0x20c fs/bcachefs/fs.c:1245
       notify_change+0x9a4/0xc50 fs/attr.c:552
       do_truncate+0x178/0x1f0 fs/open.c:65
       handle_truncate fs/namei.c:3501 [inline]
       do_open fs/namei.c:3884 [inline]
       path_openat+0x25a0/0x2c40 fs/namei.c:4039
       do_filp_open+0x18c/0x36c fs/namei.c:4066
       do_sys_openat2+0x11c/0x1b4 fs/open.c:1429
       do_sys_open fs/open.c:1444 [inline]
       __do_sys_openat fs/open.c:1460 [inline]
       __se_sys_openat fs/open.c:1455 [inline]
       __arm64_sys_openat+0x120/0x158 fs/open.c:1455
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
       el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
       el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

-> #2 (bcachefs_btree){+.+.}-{0:0}:
       trans_set_locked+0x94/0x200 fs/bcachefs/btree_locking.h:198
       bch2_trans_begin+0x6f8/0xa40 fs/bcachefs/btree_iter.c:3288
       bch2_read_err_msg_trans+0x64/0x298 fs/bcachefs/io_read.c:346
       __bch2_read_extent+0x21fc/0x3694 fs/bcachefs/io_read.c:975
       bch2_read_extent fs/bcachefs/io_read.h:140 [inline]
       bchfs_read+0x1178/0x17dc fs/bcachefs/fs-io-buffered.c:226
       bch2_readahead+0xa18/0xd88 fs/bcachefs/fs-io-buffered.c:316
       read_pages+0x13c/0x4c8 mm/readahead.c:160
       page_cache_ra_order+0x7b8/0xb34 mm/readahead.c:515
       do_sync_mmap_readahead+0x2f0/0x660 mm/filemap.c:-1
       filemap_fault+0x600/0x1278 mm/filemap.c:3403
       bch2_page_fault+0x2cc/0x700 fs/bcachefs/fs-io-pagecache.c:594
       __do_fault+0xf8/0x498 mm/memory.c:5098
       do_read_fault mm/memory.c:5518 [inline]
       do_fault mm/memory.c:5652 [inline]
       do_pte_missing mm/memory.c:4160 [inline]
       handle_pte_fault mm/memory.c:5997 [inline]
       __handle_mm_fault mm/memory.c:6140 [inline]
       handle_mm_fault+0x2cb0/0x4d18 mm/memory.c:6309
       faultin_page mm/gup.c:1193 [inline]
       __get_user_pages+0x1dd4/0x30d8 mm/gup.c:1491
       populate_vma_page_range+0x218/0x2e8 mm/gup.c:1929
       __mm_populate+0x208/0x330 mm/gup.c:2032
       mm_populate include/linux/mm.h:3487 [inline]
       vm_mmap_pgoff+0x378/0x43c mm/util.c:584
       ksys_mmap_pgoff+0x394/0x5b8 mm/mmap.c:607
       __do_sys_mmap arch/arm64/kernel/sys.c:28 [inline]
       __se_sys_mmap arch/arm64/kernel/sys.c:21 [inline]
       __arm64_sys_mmap+0xf8/0x110 arch/arm64/kernel/sys.c:21
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
       el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
       el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

-> #1 (mapping.invalidate_lock#4){.+.+}-{4:4}:
       down_read+0x58/0x2f8 kernel/locking/rwsem.c:1524
       filemap_invalidate_lock_shared include/linux/fs.h:922 [inline]
       filemap_fault+0x564/0x1278 mm/filemap.c:3391
       bch2_page_fault+0x2cc/0x700 fs/bcachefs/fs-io-pagecache.c:594
       __do_fault+0xf8/0x498 mm/memory.c:5098
       do_read_fault mm/memory.c:5518 [inline]
       do_fault mm/memory.c:5652 [inline]
       do_pte_missing mm/memory.c:4160 [inline]
       handle_pte_fault mm/memory.c:5997 [inline]
       __handle_mm_fault mm/memory.c:6140 [inline]
       handle_mm_fault+0x2cb0/0x4d18 mm/memory.c:6309
       faultin_page mm/gup.c:1193 [inline]
       __get_user_pages+0x1dd4/0x30d8 mm/gup.c:1491
       populate_vma_page_range+0x218/0x2e8 mm/gup.c:1929
       __mm_populate+0x208/0x330 mm/gup.c:2032
       mm_populate include/linux/mm.h:3487 [inline]
       vm_mmap_pgoff+0x378/0x43c mm/util.c:584
       ksys_mmap_pgoff+0x394/0x5b8 mm/mmap.c:607
       __do_sys_mmap arch/arm64/kernel/sys.c:28 [inline]
       __se_sys_mmap arch/arm64/kernel/sys.c:21 [inline]
       __arm64_sys_mmap+0xf8/0x110 arch/arm64/kernel/sys.c:21
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
       el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
       el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

-> #0 (&mm->mmap_lock){++++}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3166 [inline]
       check_prevs_add kernel/locking/lockdep.c:3285 [inline]
       validate_chain kernel/locking/lockdep.c:3909 [inline]
       __lock_acquire+0x1728/0x3058 kernel/locking/lockdep.c:5235
       lock_acquire+0x14c/0x2e0 kernel/locking/lockdep.c:5866
       __might_fault+0xc4/0x124 mm/memory.c:7151
       drm_mode_get_lease_ioctl+0x2bc/0x53c drivers/gpu/drm/drm_lease.c:673
       drm_ioctl_kernel+0x238/0x310 drivers/gpu/drm/drm_ioctl.c:796
       drm_ioctl+0x65c/0xa5c drivers/gpu/drm/drm_ioctl.c:893
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:906 [inline]
       __se_sys_ioctl fs/ioctl.c:892 [inline]
       __arm64_sys_ioctl+0x14c/0x1c4 fs/ioctl.c:892
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
       el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
       el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
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

1 lock held by syz.4.374/8650:
 #0: ffff0000c9ae65d0 (&dev->mode_config.idr_mutex){+.+.}-{4:4}, at: drm_mode_get_lease_ioctl+0x1c8/0x53c drivers/gpu/drm/drm_lease.c:660

stack backtrace:
CPU: 0 UID: 0 PID: 8650 Comm: syz.4.374 Not tainted 6.15.0-rc7-syzkaller-gd7fa1af5b33e #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:466 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
 dump_stack+0x1c/0x28 lib/dump_stack.c:129
 print_circular_bug+0x324/0x32c kernel/locking/lockdep.c:2079
 check_noncircular+0x154/0x174 kernel/locking/lockdep.c:2211
 check_prev_add kernel/locking/lockdep.c:3166 [inline]
 check_prevs_add kernel/locking/lockdep.c:3285 [inline]
 validate_chain kernel/locking/lockdep.c:3909 [inline]
 __lock_acquire+0x1728/0x3058 kernel/locking/lockdep.c:5235
 lock_acquire+0x14c/0x2e0 kernel/locking/lockdep.c:5866
 __might_fault+0xc4/0x124 mm/memory.c:7151
 drm_mode_get_lease_ioctl+0x2bc/0x53c drivers/gpu/drm/drm_lease.c:673
 drm_ioctl_kernel+0x238/0x310 drivers/gpu/drm/drm_ioctl.c:796
 drm_ioctl+0x65c/0xa5c drivers/gpu/drm/drm_ioctl.c:893
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __arm64_sys_ioctl+0x14c/0x1c4 fs/ioctl.c:892
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
 el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
netlink: 60 bytes leftover after parsing attributes in process `syz.4.374'.
netlink: 72 bytes leftover after parsing attributes in process `syz.4.374'.


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
