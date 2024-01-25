Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D5E83B8CF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 05:58:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A6110E9D4;
	Thu, 25 Jan 2024 04:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail115-95.sinamail.sina.com.cn
 (mail115-95.sinamail.sina.com.cn [218.30.115.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF6B10EE54
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 04:58:34 +0000 (UTC)
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([113.118.66.48])
 by sina.com (172.16.235.24) with ESMTP
 id 65B1EA6C00003FA1; Thu, 25 Jan 2024 12:58:23 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=hdanton@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 43463945089360
X-SMAIL-UIID: 0DDC04B7824E45D88F8B3AF93CBD6B6B-20240125-125823-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+22e2c28c99235275f109@syzkaller.appspotmail.com>
Subject: Re: [syzbot] [dri?] [virtualization?] upstream boot error: INFO: task
 hung in virtio_gpu_queue_fenced_ctrl_buffer
Date: Thu, 25 Jan 2024 12:58:13 +0800
Message-Id: <20240125045813.1564-1-hdanton@sina.com>
In-Reply-To: <0000000000002fff4a060fae5751@google.com>
References: <0000000000002fff4a060fae5751@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 daniel@ffwll.ch, airlied@redhat.com,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 24 Jan 2024 02:15:21 -0800
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    615d30064886 Merge tag 'trace-v6.8-rc1' of git://git.kerne..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=167456f7e80000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=e6c3b3d5f71246cb
> dashboard link: https://syzkaller.appspot.com/bug?extid=22e2c28c99235275f109
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7bc7510fe41f/non_bootable_disk-615d3006.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/4bf0b27acaa4/vmlinux-615d3006.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/3133809ff35d/bzImage-615d3006.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+22e2c28c99235275f109@syzkaller.appspotmail.com
> 
> INFO: task swapper/0:1 blocked for more than 143 seconds.
>       Not tainted 6.8.0-rc1-syzkaller-00029-g615d30064886 #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:swapper/0       state:D stack:22288 pid:1     tgid:1     ppid:0      flags:0x00004000
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5400 [inline]
>  __schedule+0xf12/0x5c00 kernel/sched/core.c:6727
>  __schedule_loop kernel/sched/core.c:6802 [inline]
>  schedule+0xe9/0x270 kernel/sched/core.c:6817
>  virtio_gpu_queue_ctrl_sgs drivers/gpu/drm/virtio/virtgpu_vq.c:341 [inline]
>  virtio_gpu_queue_fenced_ctrl_buffer+0x497/0xff0 drivers/gpu/drm/virtio/virtgpu_vq.c:415
>  virtio_gpu_resource_flush drivers/gpu/drm/virtio/virtgpu_plane.c:162 [inline]
>  virtio_gpu_primary_plane_update+0x1059/0x1590 drivers/gpu/drm/virtio/virtgpu_plane.c:237
>  drm_atomic_helper_commit_planes+0x92f/0xfe0 drivers/gpu/drm/drm_atomic_helper.c:2800
>  drm_atomic_helper_commit_tail+0x69/0xf0 drivers/gpu/drm/drm_atomic_helper.c:1749
>  commit_tail+0x353/0x410 drivers/gpu/drm/drm_atomic_helper.c:1834
>  drm_atomic_helper_commit+0x2f9/0x380 drivers/gpu/drm/drm_atomic_helper.c:2072
>  drm_atomic_commit+0x20b/0x2d0 drivers/gpu/drm/drm_atomic.c:1514
>  drm_client_modeset_commit_atomic+0x6c2/0x810 drivers/gpu/drm/drm_client_modeset.c:1051
>  drm_client_modeset_commit_locked+0x14d/0x580 drivers/gpu/drm/drm_client_modeset.c:1154
>  pan_display_atomic drivers/gpu/drm/drm_fb_helper.c:1370 [inline]
>  drm_fb_helper_pan_display+0x2a5/0x990 drivers/gpu/drm/drm_fb_helper.c:1430
>  fb_pan_display+0x477/0x7c0 drivers/video/fbdev/core/fbmem.c:191
>  bit_update_start+0x49/0x1f0 drivers/video/fbdev/core/bitblit.c:390
>  fbcon_switch+0xbb3/0x12e0 drivers/video/fbdev/core/fbcon.c:2170
>  redraw_screen+0x2bd/0x750 drivers/tty/vt/vt.c:969
>  fbcon_prepare_logo+0x9f8/0xc80 drivers/video/fbdev/core/fbcon.c:616
>  con2fb_init_display drivers/video/fbdev/core/fbcon.c:803 [inline]
>  set_con2fb_map+0xcea/0x1050 drivers/video/fbdev/core/fbcon.c:867
>  do_fb_registered drivers/video/fbdev/core/fbcon.c:3007 [inline]
>  fbcon_fb_registered+0x21d/0x660 drivers/video/fbdev/core/fbcon.c:3023
>  do_register_framebuffer drivers/video/fbdev/core/fbmem.c:449 [inline]
>  register_framebuffer+0x4b2/0x860 drivers/video/fbdev/core/fbmem.c:515
>  __drm_fb_helper_initial_config_and_unlock+0xd7c/0x1650 drivers/gpu/drm/drm_fb_helper.c:1871
>  drm_fb_helper_initial_config drivers/gpu/drm/drm_fb_helper.c:1936 [inline]
>  drm_fb_helper_initial_config+0x44/0x60 drivers/gpu/drm/drm_fb_helper.c:1928
>  drm_fbdev_generic_client_hotplug+0x19e/0x270 drivers/gpu/drm/drm_fbdev_generic.c:279
>  drm_client_register+0x195/0x280 drivers/gpu/drm/drm_client.c:141
>  drm_fbdev_generic_setup+0x184/0x340 drivers/gpu/drm/drm_fbdev_generic.c:341
>  virtio_gpu_probe+0x1be/0x3c0 drivers/gpu/drm/virtio/virtgpu_drv.c:105
>  virtio_dev_probe+0x5e4/0x980 drivers/virtio/virtio.c:311
>  call_driver_probe drivers/base/dd.c:579 [inline]
>  really_probe+0x234/0xc90 drivers/base/dd.c:658
>  __driver_probe_device+0x1de/0x4b0 drivers/base/dd.c:800
>  driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:830
>  __driver_attach+0x274/0x570 drivers/base/dd.c:1216
>  bus_for_each_dev+0x13c/0x1d0 drivers/base/bus.c:368
>  bus_add_driver+0x2e9/0x630 drivers/base/bus.c:673
>  driver_register+0x15c/0x4a0 drivers/base/driver.c:246
>  do_one_initcall+0x11c/0x650 init/main.c:1236
>  do_initcall_level init/main.c:1298 [inline]
>  do_initcalls init/main.c:1314 [inline]
>  do_basic_setup init/main.c:1333 [inline]
>  kernel_init_freeable+0x687/0xc10 init/main.c:1551
>  kernel_init+0x1c/0x2a0 init/main.c:1441
>  ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
>  ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:242
>  </TASK>
> INFO: task kworker/0:0:8 blocked for more than 143 seconds.
>       Not tainted 6.8.0-rc1-syzkaller-00029-g615d30064886 #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:kworker/0:0     state:D stack:28208 pid:8     tgid:8     ppid:2      flags:0x00004000
> Workqueue: events virtio_gpu_dequeue_ctrl_func
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5400 [inline]
>  __schedule+0xf12/0x5c00 kernel/sched/core.c:6727
>  __schedule_loop kernel/sched/core.c:6802 [inline]
>  schedule+0xe9/0x270 kernel/sched/core.c:6817
>  schedule_preempt_disabled+0x13/0x20 kernel/sched/core.c:6874
>  __mutex_lock_common kernel/locking/mutex.c:684 [inline]
>  __mutex_lock+0x5b9/0x9d0 kernel/locking/mutex.c:752
>  drm_client_dev_hotplug drivers/gpu/drm/drm_client.c:217 [inline]
>  drm_client_dev_hotplug+0x169/0x3c0 drivers/gpu/drm/drm_client.c:204
>  virtio_gpu_cmd_get_display_info_cb+0x3e1/0x550 drivers/gpu/drm/virtio/virtgpu_vq.c:674
>  virtio_gpu_dequeue_ctrl_func+0x21b/0x9a0 drivers/gpu/drm/virtio/virtgpu_vq.c:235
>  process_one_work+0x886/0x15d0 kernel/workqueue.c:2633
>  process_scheduled_works kernel/workqueue.c:2706 [inline]
>  worker_thread+0x8b9/0x1290 kernel/workqueue.c:2787
>  kthread+0x2c6/0x3a0 kernel/kthread.c:388
>  ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
>  ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:242
>  </TASK>
> INFO: task kworker/1:1:55 blocked for more than 143 seconds.
>       Not tainted 6.8.0-rc1-syzkaller-00029-g615d30064886 #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:kworker/1:1     state:D stack:27648 pid:55    tgid:55    ppid:2      flags:0x00004000
> Workqueue: events drm_fb_helper_damage_work
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5400 [inline]
>  __schedule+0xf12/0x5c00 kernel/sched/core.c:6727
>  __schedule_loop kernel/sched/core.c:6802 [inline]
>  schedule+0xe9/0x270 kernel/sched/core.c:6817
>  schedule_preempt_disabled+0x13/0x20 kernel/sched/core.c:6874
>  __mutex_lock_common kernel/locking/mutex.c:684 [inline]
>  __mutex_lock+0x5b9/0x9d0 kernel/locking/mutex.c:752
>  drm_fbdev_generic_damage_blit drivers/gpu/drm/drm_fbdev_generic.c:198 [inline]
>  drm_fbdev_generic_helper_fb_dirty+0x255/0xbb0 drivers/gpu/drm/drm_fbdev_generic.c:225
>  drm_fb_helper_fb_dirty drivers/gpu/drm/drm_fb_helper.c:390 [inline]
>  drm_fb_helper_damage_work+0x283/0x5e0 drivers/gpu/drm/drm_fb_helper.c:413
>  process_one_work+0x886/0x15d0 kernel/workqueue.c:2633
>  process_scheduled_works kernel/workqueue.c:2706 [inline]
>  worker_thread+0x8b9/0x1290 kernel/workqueue.c:2787
>  kthread+0x2c6/0x3a0 kernel/kthread.c:388
>  ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
>  ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:242
>  </TASK>
> 
> Showing all locks held in the system:
> 10 locks held by swapper/0/1:
>  #0: ffff88801bcf8170 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:990 [inline]
>  #0: ffff88801bcf8170 (&dev->mutex){....}-{3:3}, at: __device_driver_lock drivers/base/dd.c:1095 [inline]
>  #0: ffff88801bcf8170 (&dev->mutex){....}-{3:3}, at: __driver_attach+0x269/0x570 drivers/base/dd.c:1215
>  #1: ffff88801d7b42f8 (&dev->clientlist_mutex){+.+.}-{3:3}, at: drm_client_register+0x54/0x280 drivers/gpu/drm/drm_client.c:127
>  #2: ffffffff8dcbfe88 (registration_lock){+.+.}-{3:3}, at: register_framebuffer+0x7a/0x860 drivers/video/fbdev/core/fbmem.c:514
>  #3: ffffffff8d196720 (console_lock){+.+.}-{0:0}, at: fbcon_fb_registered+0x3c/0x660 drivers/video/fbdev/core/fbcon.c:3019
>  #4: ffff8880198f4280 (&helper->lock){+.+.}-{3:3}, at: drm_fb_helper_pan_display+0xd5/0x990 drivers/gpu/drm/drm_fb_helper.c:1423
>  #5: ffff88801d7b41b0 (&dev->master_mutex){+.+.}-{3:3}, at: drm_master_internal_acquire+0x21/0x70 drivers/gpu/drm/drm_auth.c:452
>  #6: ffff8880198f4098 (&client->modeset_mutex){+.+.}-{3:3}, at: drm_client_modeset_commit_locked+0x4c/0x580 drivers/gpu/drm/drm_client_modeset.c:1152
>  #7: ffffc90000047278 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_client_modeset_commit_atomic+0xd0/0x810 drivers/gpu/drm/drm_client_modeset.c:990
>  #8: ffff88801d9cb0b0 (crtc_ww_class_mutex){+.+.}-{3:3}, at: modeset_lock+0x484/0x6c0 drivers/gpu/drm/drm_modeset_lock.c:314
>  #9: ffffffff8ddf96d0 (drm_unplug_srcu){.+.+}-{0:0}, at: srcu_lock_acquire include/linux/srcu.h:116 [inline]
>  #9: ffffffff8ddf96d0 (drm_unplug_srcu){.+.+}-{0:0}, at: srcu_read_lock include/linux/srcu.h:215 [inline]
>  #9: ffffffff8ddf96d0 (drm_unplug_srcu){.+.+}-{0:0}, at: drm_dev_enter+0x49/0x160 drivers/gpu/drm/drm_drv.c:449
> 3 locks held by kworker/0:0/8:
>  #0: ffff888013088d38 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x789/0x15d0 kernel/workqueue.c:2608
>  #1: ffffc900000b7d80 ((work_completion)(&vgvq->dequeue_work)){+.+.}-{0:0}, at: process_one_work+0x7eb/0x15d0 kernel/workqueue.c:2609
>  #2: ffff88801d7b42f8 (&dev->clientlist_mutex){+.+.}-{3:3}, at: drm_client_dev_hotplug drivers/gpu/drm/drm_client.c:217 [inline]
>  #2: ffff88801d7b42f8 (&dev->clientlist_mutex){+.+.}-{3:3}, at: drm_client_dev_hotplug+0x169/0x3c0 drivers/gpu/drm/drm_client.c:204


	swapper/0/1			kworker/0:0/8
	===				===
	lock &dev->clientlist_mutex
	wait_event(vgdev->ctrlq.ack_queue, vq->num_free >= elemcnt);

					lock   &dev->clientlist_mutex
					unlock &dev->clientlist_mutex
					wake_up(&vgdev->ctrlq.ack_queue);
	deadlock

> 2 locks held by kworker/u16:0/11:
>  #0: ffff888013089938 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x789/0x15d0 kernel/workqueue.c:2608
>  #1: ffffc900000e7d80 ((work_completion)(&(&kfence_timer)->work)){+.+.}-{0:0}, at: process_one_work+0x7eb/0x15d0 kernel/workqueue.c:2609
> 1 lock held by khungtaskd/39:
>  #0: ffffffff8d1a9120 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire include/linux/rcupdate.h:298 [inline]
>  #0: ffffffff8d1a9120 (rcu_read_lock){....}-{1:2}, at: rcu_read_lock include/linux/rcupdate.h:750 [inline]
>  #0: ffffffff8d1a9120 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x75/0x340 kernel/locking/lockdep.c:6614
> 3 locks held by kworker/1:1/55:
>  #0: ffff888013088d38 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x789/0x15d0 kernel/workqueue.c:2608
>  #1: ffffc90000a77d80 ((work_completion)(&helper->damage_work)){+.+.}-{0:0}, at: process_one_work+0x7eb/0x15d0 kernel/workqueue.c:2609
>  #2: ffff8880198f4280 (&helper->lock){+.+.}-{3:3}, at: drm_fbdev_generic_damage_blit drivers/gpu/drm/drm_fbdev_generic.c:198 [inline]
>  #2: ffff8880198f4280 (&helper->lock){+.+.}-{3:3}, at: drm_fbdev_generic_helper_fb_dirty+0x255/0xbb0 drivers/gpu/drm/drm_fbdev_generic.c:225
> 
> =============================================
> 
