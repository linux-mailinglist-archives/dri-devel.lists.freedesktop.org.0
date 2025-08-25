Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6595AB34996
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 20:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A450010E52E;
	Mon, 25 Aug 2025 18:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f80.google.com (mail-oo1-f80.google.com
 [209.85.161.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EAF210E52E
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 18:01:47 +0000 (UTC)
Received: by mail-oo1-f80.google.com with SMTP id
 006d021491bc7-61dbd36adcfso3706164eaf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 11:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756144906; x=1756749706;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N/WnMLtGtmmgPsDpXycUG6fldUeZi2a4Hq7BGvKVu0s=;
 b=hTp2fZPFhEhW4S87P9DQIW4mB2ip+M7zHS/+XAPa7608E9LyFfUos1qFFdzVKschrB
 zUV1Qm4HJDs8J423c0ZO5/e1LBUTmDm9xYeMBnaLIz6Js63XENEPduMBEdsnbay5Lhg/
 aBNePT2xkCAodvUtIXFWKXZIHan5FxTFRDcVql+PDf3o0bffAnfpBPWKGc5YmuU7l9Su
 ogLkssa366QD4jcSUwLGjsvGNvA1wZmFDE5xZHVbq7abM92tJYtYbetAcrHGMuyYUGS+
 sbOgkwefHAkkaahgsb23RT3QNCQBCRRKaRji8Tmw5pThYW/C63ZbiPiK68STgUHx4pJf
 eYjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9HfEbuhQWve+05Twj3YDa4AJVoijZ/FRQ8zUV7asgYGLLwbnq7UhaKGfkSRxoUIpE3jGlQGBjEH8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBwvuXdzye0vhb+fOT27YXazkZRbFNFH58GuT9NmymNlyVp9FH
 amay/z/mt1zEKjTp5rJJiu4CQIAtvndxYdYktwMTEfKdlYAy4E5cKbxu1BJqB11AN4hyja4l0+I
 Dy1wyJQpLJ4BB7k53OxA70j4q7QZRFeIGIHBifYrsndF2SJ7KuBD4HUxzy6c=
X-Google-Smtp-Source: AGHT+IGtpRWHiX5t5TbZwUBtB2IIqhTAyMGgtViN9mjDqHgdQKqnkXIoG+ydp9tf5rMwru5lt0vMtW7TEHYbmBCz+oBm1m1y5+RV
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1826:b0:434:13f6:d386 with SMTP id
 5614622812f47-437be0c5f3cmr227837b6e.16.1756144906566; Mon, 25 Aug 2025
 11:01:46 -0700 (PDT)
Date: Mon, 25 Aug 2025 11:01:46 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68aca50a.a00a0220.33401d.0441.GAE@google.com>
Subject: [syzbot] [dri?] possible deadlock in drm_vblank_disable_and_save
From: syzbot <syzbot+e0930cb581675ca1c2e5@syzkaller.appspotmail.com>
To: airlied@gmail.com, dri-devel@lists.freedesktop.org, 
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org, 
 louis.chauvet@bootlin.com, maarten.lankhorst@linux.intel.com, 
 melissa.srw@gmail.com, mripard@kernel.org, simona@ffwll.ch, 
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

HEAD commit:    c330cb607721 Merge tag 'i2c-for-6.17-rc3' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15069862580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e1e1566c7726877e
dashboard link: https://syzkaller.appspot.com/bug?extid=e0930cb581675ca1c2e5
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1660ec42580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11f8aef0580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e3c902f92d1e/disk-c330cb60.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/bb0ab44f7737/vmlinux-c330cb60.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6c8baacf629b/bzImage-c330cb60.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e0930cb581675ca1c2e5@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
syz.0.184/6534 is trying to acquire lock:
ffff8880b8923d90 ((softirq_ctrl.lock)){+.+.}-{3:3}, at: spin_lock include/linux/spinlock_rt.h:44 [inline]
ffff8880b8923d90 ((softirq_ctrl.lock)){+.+.}-{3:3}, at: __local_bh_disable_ip+0x264/0x400 kernel/softirq.c:168

but task is already holding lock:
ffff8880242183a0 (&dev->vblank_time_lock){+.+.}-{3:3}, at: spin_lock include/linux/spinlock_rt.h:44 [inline]
ffff8880242183a0 (&dev->vblank_time_lock){+.+.}-{3:3}, at: drm_vblank_disable_and_save+0x7f/0x380 drivers/gpu/drm/drm_vblank.c:463

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #4 (&dev->vblank_time_lock){+.+.}-{3:3}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
       rt_spin_lock+0x88/0x2c0 kernel/locking/spinlock_rt.c:56
       spin_lock include/linux/spinlock_rt.h:44 [inline]
       drm_reset_vblank_timestamp drivers/gpu/drm/drm_vblank.c:246 [inline]
       drm_crtc_vblank_on_config+0x2cd/0x860 drivers/gpu/drm/drm_vblank.c:1504
       drm_crtc_vblank_on+0x88/0xc0 drivers/gpu/drm/drm_vblank.c:1535
       crtc_enable drivers/gpu/drm/drm_atomic_helper.c:1610 [inline]
       drm_atomic_helper_commit_modeset_enables+0x602/0xe10 drivers/gpu/drm/drm_atomic_helper.c:1680
       vkms_atomic_commit_tail+0x69/0x210 drivers/gpu/drm/vkms/vkms_drv.c:65
       commit_tail+0x281/0x3a0 drivers/gpu/drm/drm_atomic_helper.c:1986
       drm_atomic_helper_commit+0xa6b/0xb10 drivers/gpu/drm/drm_atomic_helper.c:2226
       drm_atomic_commit+0x262/0x2c0 drivers/gpu/drm/drm_atomic.c:1577
       drm_client_modeset_commit_atomic+0x620/0x760 drivers/gpu/drm/drm_client_modeset.c:1103
       drm_client_modeset_commit_locked+0xce/0x4d0 drivers/gpu/drm/drm_client_modeset.c:1206
       drm_client_modeset_commit+0x4a/0x70 drivers/gpu/drm/drm_client_modeset.c:1232
       __drm_fb_helper_restore_fbdev_mode_unlocked+0x9d/0x1b0 drivers/gpu/drm/drm_fb_helper.c:238
       drm_fb_helper_set_par+0xaf/0x100 drivers/gpu/drm/drm_fb_helper.c:1360
       fbcon_init+0x1255/0x2370 drivers/video/fbdev/core/fbcon.c:1130
       visual_init+0x2ef/0x650 drivers/tty/vt/vt.c:1019
       do_bind_con_driver+0x890/0xf70 drivers/tty/vt/vt.c:3915
       do_take_over_console+0x899/0xa10 drivers/tty/vt/vt.c:4481
       do_fbcon_takeover+0x118/0x200 drivers/video/fbdev/core/fbcon.c:565
       do_fb_registered drivers/video/fbdev/core/fbcon.c:3008 [inline]
       fbcon_fb_registered+0x35e/0x610 drivers/video/fbdev/core/fbcon.c:3028
       do_register_framebuffer drivers/video/fbdev/core/fbmem.c:512 [inline]
       register_framebuffer+0x70f/0x890 drivers/video/fbdev/core/fbmem.c:578
       __drm_fb_helper_initial_config_and_unlock+0x130a/0x18a0 drivers/gpu/drm/drm_fb_helper.c:1852
       drm_fbdev_client_hotplug+0x16f/0x230 drivers/gpu/drm/clients/drm_fbdev_client.c:52
       drm_client_register+0x16f/0x210 drivers/gpu/drm/drm_client.c:141
       drm_fbdev_client_setup+0x19f/0x3f0 drivers/gpu/drm/clients/drm_fbdev_client.c:159
       drm_client_setup+0x10a/0x230 drivers/gpu/drm/clients/drm_client_setup.c:46
       vkms_create drivers/gpu/drm/vkms/vkms_drv.c:201 [inline]
       vkms_init+0x3e0/0x4b0 drivers/gpu/drm/vkms/vkms_drv.c:221
       do_one_initcall+0x233/0x820 init/main.c:1269
       do_initcall_level+0x104/0x190 init/main.c:1331
       do_initcalls+0x59/0xa0 init/main.c:1347
       kernel_init_freeable+0x334/0x4b0 init/main.c:1579
       kernel_init+0x1d/0x1d0 init/main.c:1469
       ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #3 (&dev->vbl_lock){+.+.}-{3:3}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
       rt_spin_lock+0x88/0x2c0 kernel/locking/spinlock_rt.c:56
       spin_lock include/linux/spinlock_rt.h:44 [inline]
       vblank_disable_fn+0x72/0x190 drivers/gpu/drm/drm_vblank.c:496
       call_timer_fn+0x17b/0x5f0 kernel/time/timer.c:1747
       expire_timers kernel/time/timer.c:1798 [inline]
       __run_timers kernel/time/timer.c:2372 [inline]
       __run_timer_base+0x648/0x970 kernel/time/timer.c:2384
       run_timer_base kernel/time/timer.c:2393 [inline]
       run_timer_softirq+0xb7/0x180 kernel/time/timer.c:2403
       handle_softirqs+0x22c/0x710 kernel/softirq.c:579
       __do_softirq kernel/softirq.c:613 [inline]
       run_ktimerd+0xcf/0x190 kernel/softirq.c:1043
       smpboot_thread_fn+0x542/0xa60 kernel/smpboot.c:160
       kthread+0x711/0x8a0 kernel/kthread.c:463
       ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #2 ((&vblank->disable_timer)){+...}-{0:0}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
       call_timer_fn+0xdb/0x5f0 kernel/time/timer.c:1744
       expire_timers kernel/time/timer.c:1798 [inline]
       __run_timers kernel/time/timer.c:2372 [inline]
       __run_timer_base+0x648/0x970 kernel/time/timer.c:2384
       run_timer_base kernel/time/timer.c:2393 [inline]
       run_timer_softirq+0xb7/0x180 kernel/time/timer.c:2403
       handle_softirqs+0x22c/0x710 kernel/softirq.c:579
       __do_softirq kernel/softirq.c:613 [inline]
       run_ktimerd+0xcf/0x190 kernel/softirq.c:1043
       smpboot_thread_fn+0x542/0xa60 kernel/smpboot.c:160
       kthread+0x711/0x8a0 kernel/kthread.c:463
       ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #1 (&base->expiry_lock){+...}-{3:3}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
       rt_spin_lock+0x88/0x2c0 kernel/locking/spinlock_rt.c:56
       spin_lock include/linux/spinlock_rt.h:44 [inline]
       timer_base_lock_expiry kernel/time/timer.c:1501 [inline]
       __run_timer_base+0x114/0x970 kernel/time/timer.c:2382
       run_timer_base kernel/time/timer.c:2393 [inline]
       run_timer_softirq+0x67/0x180 kernel/time/timer.c:2401
       handle_softirqs+0x22c/0x710 kernel/softirq.c:579
       __do_softirq kernel/softirq.c:613 [inline]
       run_ktimerd+0xcf/0x190 kernel/softirq.c:1043
       smpboot_thread_fn+0x542/0xa60 kernel/smpboot.c:160
       kthread+0x711/0x8a0 kernel/kthread.c:463
       ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #0 ((softirq_ctrl.lock)){+.+.}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3165 [inline]
       check_prevs_add kernel/locking/lockdep.c:3284 [inline]
       validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3908
       __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5237
       reacquire_held_locks+0x127/0x1d0 kernel/locking/lockdep.c:5385
       __lock_release kernel/locking/lockdep.c:5574 [inline]
       lock_release+0x1b4/0x3e0 kernel/locking/lockdep.c:5889
       __local_bh_enable_ip+0x10c/0x270 kernel/softirq.c:228
       hrtimer_cancel+0x39/0x60 kernel/time/hrtimer.c:1491
       __disable_vblank drivers/gpu/drm/drm_vblank.c:442 [inline]
       drm_vblank_disable_and_save+0x1bc/0x380 drivers/gpu/drm/drm_vblank.c:481
       drm_crtc_vblank_off+0x22e/0x820 drivers/gpu/drm/drm_vblank.c:1364
       crtc_disable drivers/gpu/drm/drm_atomic_helper.c:1258 [inline]
       disable_outputs drivers/gpu/drm/drm_atomic_helper.c:1340 [inline]
       drm_atomic_helper_commit_modeset_disables+0xc89/0x2010 drivers/gpu/drm/drm_atomic_helper.c:1524
       vkms_atomic_commit_tail+0x51/0x210 drivers/gpu/drm/vkms/vkms_drv.c:61
       commit_tail+0x281/0x3a0 drivers/gpu/drm/drm_atomic_helper.c:1986
       drm_atomic_helper_commit+0xa6b/0xb10 drivers/gpu/drm/drm_atomic_helper.c:2226
       drm_atomic_commit+0x262/0x2c0 drivers/gpu/drm/drm_atomic.c:1577
       drm_atomic_helper_set_config+0xe2/0x160 drivers/gpu/drm/drm_atomic_helper.c:3426
       drm_mode_setcrtc+0x9a4/0x1c50 drivers/gpu/drm/drm_crtc.c:869
       drm_ioctl_kernel+0x2d2/0x3a0 drivers/gpu/drm/drm_ioctl.c:796
       drm_ioctl+0x685/0xb20 drivers/gpu/drm/drm_ioctl.c:893
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:598 [inline]
       __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:584
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  (softirq_ctrl.lock) --> &dev->vbl_lock --> &dev->vblank_time_lock

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&dev->vblank_time_lock);
                               lock(&dev->vbl_lock);
                               lock(&dev->vblank_time_lock);
  lock((softirq_ctrl.lock));

 *** DEADLOCK ***

8 locks held by syz.0.184/6534:
 #0: ffffc900052d7b20 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_mode_setcrtc+0x555/0x1c50 drivers/gpu/drm/drm_crtc.c:730
 #1: ffffc900052d7b48 (crtc_ww_class_mutex){+.+.}-{4:4}, at: drm_mode_setcrtc+0x555/0x1c50 drivers/gpu/drm/drm_crtc.c:730
 #2: ffff8880242184b8 (&dev->event_lock){+.+.}-{3:3}, at: spin_lock_irq include/linux/spinlock_rt.h:93 [inline]
 #2: ffff8880242184b8 (&dev->event_lock){+.+.}-{3:3}, at: drm_crtc_vblank_off+0xe4/0x820 drivers/gpu/drm/drm_vblank.c:1355
 #3: ffffffff8d9a8b80 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #3: ffffffff8d9a8b80 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #3: ffffffff8d9a8b80 (rcu_read_lock){....}-{1:3}, at: __rt_spin_lock kernel/locking/spinlock_rt.c:50 [inline]
 #3: ffffffff8d9a8b80 (rcu_read_lock){....}-{1:3}, at: rt_spin_lock+0x1bb/0x2c0 kernel/locking/spinlock_rt.c:57
 #4: ffff888024218420 (&dev->vbl_lock){+.+.}-{3:3}, at: spin_lock include/linux/spinlock_rt.h:44 [inline]
 #4: ffff888024218420 (&dev->vbl_lock){+.+.}-{3:3}, at: drm_crtc_vblank_off+0xf5/0x820 drivers/gpu/drm/drm_vblank.c:1357
 #5: ffffffff8d9a8b80 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #5: ffffffff8d9a8b80 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #5: ffffffff8d9a8b80 (rcu_read_lock){....}-{1:3}, at: __rt_spin_lock kernel/locking/spinlock_rt.c:50 [inline]
 #5: ffffffff8d9a8b80 (rcu_read_lock){....}-{1:3}, at: rt_spin_lock+0x1bb/0x2c0 kernel/locking/spinlock_rt.c:57
 #6: ffff8880242183a0 (&dev->vblank_time_lock){+.+.}-{3:3}, at: spin_lock include/linux/spinlock_rt.h:44 [inline]
 #6: ffff8880242183a0 (&dev->vblank_time_lock){+.+.}-{3:3}, at: drm_vblank_disable_and_save+0x7f/0x380 drivers/gpu/drm/drm_vblank.c:463
 #7: ffffffff8d9a8b80 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #7: ffffffff8d9a8b80 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #7: ffffffff8d9a8b80 (rcu_read_lock){....}-{1:3}, at: __rt_spin_lock kernel/locking/spinlock_rt.c:50 [inline]
 #7: ffffffff8d9a8b80 (rcu_read_lock){....}-{1:3}, at: rt_spin_lock+0x1bb/0x2c0 kernel/locking/spinlock_rt.c:57

stack backtrace:
CPU: 1 UID: 0 PID: 6534 Comm: syz.0.184 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/12/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_circular_bug+0x2ee/0x310 kernel/locking/lockdep.c:2043
 check_noncircular+0x134/0x160 kernel/locking/lockdep.c:2175
 check_prev_add kernel/locking/lockdep.c:3165 [inline]
 check_prevs_add kernel/locking/lockdep.c:3284 [inline]
 validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3908
 __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5237
 reacquire_held_locks+0x127/0x1d0 kernel/locking/lockdep.c:5385
 __lock_release kernel/locking/lockdep.c:5574 [inline]
 lock_release+0x1b4/0x3e0 kernel/locking/lockdep.c:5889
 __local_bh_enable_ip+0x10c/0x270 kernel/softirq.c:228
 hrtimer_cancel+0x39/0x60 kernel/time/hrtimer.c:1491
 __disable_vblank drivers/gpu/drm/drm_vblank.c:442 [inline]
 drm_vblank_disable_and_save+0x1bc/0x380 drivers/gpu/drm/drm_vblank.c:481
 drm_crtc_vblank_off+0x22e/0x820 drivers/gpu/drm/drm_vblank.c:1364
 crtc_disable drivers/gpu/drm/drm_atomic_helper.c:1258 [inline]
 disable_outputs drivers/gpu/drm/drm_atomic_helper.c:1340 [inline]
 drm_atomic_helper_commit_modeset_disables+0xc89/0x2010 drivers/gpu/drm/drm_atomic_helper.c:1524
 vkms_atomic_commit_tail+0x51/0x210 drivers/gpu/drm/vkms/vkms_drv.c:61
 commit_tail+0x281/0x3a0 drivers/gpu/drm/drm_atomic_helper.c:1986
 drm_atomic_helper_commit+0xa6b/0xb10 drivers/gpu/drm/drm_atomic_helper.c:2226
 drm_atomic_commit+0x262/0x2c0 drivers/gpu/drm/drm_atomic.c:1577
 drm_atomic_helper_set_config+0xe2/0x160 drivers/gpu/drm/drm_atomic_helper.c:3426
 drm_mode_setcrtc+0x9a4/0x1c50 drivers/gpu/drm/drm_crtc.c:869
 drm_ioctl_kernel+0x2d2/0x3a0 drivers/gpu/drm/drm_ioctl.c:796
 drm_ioctl+0x685/0xb20 drivers/gpu/drm/drm_ioctl.c:893
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:598 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:584
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcd2143ebe9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fcd20a85038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fcd21666090 RCX: 00007fcd2143ebe9
RDX: 0000200000000740 RSI: 00000000c06864a2 RDI: 0000000000000003
RBP: 00007fcd214c1e19 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fcd21666128 R14: 00007fcd21666090 R15: 00007ffd85f10678
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
