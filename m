Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6715579EC3B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 17:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B0F10E24C;
	Wed, 13 Sep 2023 15:13:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3084 seconds by postgrey-1.36 at gabe;
 Wed, 13 Sep 2023 15:13:12 UTC
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580F210E24C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 15:13:12 +0000 (UTC)
Received: from fsav114.sakura.ne.jp (fsav114.sakura.ne.jp [27.133.134.241])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 38DEL2r2066265;
 Wed, 13 Sep 2023 23:21:02 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav114.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav114.sakura.ne.jp);
 Wed, 13 Sep 2023 23:21:02 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav114.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 38DEL2pD066261
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 13 Sep 2023 23:21:02 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <99d99007-8385-31df-a659-665bf50193bc@I-love.SAKURA.ne.jp>
Date: Wed, 13 Sep 2023 23:21:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: drm/vkms: deadlock between dev->event_lock and timer
Content-Language: en-US
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, Maira Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 DRI <dri-devel@lists.freedesktop.org>
References: <20230913110709.6684-1-hdanton@sina.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20230913110709.6684-1-hdanton@sina.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Hillf Danton <hdanton@sina.com>, syzkaller@googlegroups.com,
 LKML <linux-kernel@vger.kernel.org>, Sanan Hasanov <Sanan.Hasanov@ucf.edu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello. A deadlock was reported in drivers/gpu/drm/vkms/ .
It looks like this locking pattern remains as of 6.6-rc1. Please fix.

void drm_crtc_vblank_off(struct drm_crtc *crtc) {
  spin_lock_irq(&dev->event_lock);
  drm_vblank_disable_and_save(dev, pipe) {
    __disable_vblank(dev, pipe) {
      crtc->funcs->disable_vblank(crtc) == vkms_disable_vblank {
        hrtimer_cancel(&out->vblank_hrtimer) { // Retries with dev->event_lock held until lock_hrtimer_base() succeeds.
          ret = hrtimer_try_to_cancel(timer) {
            base = lock_hrtimer_base(timer, &flags); // Fails forever because vkms_vblank_simulate() is in progress.
          }
        }
      }
    }
  }
  spin_unlock_irq(&dev->event_lock);
}

static void __run_hrtimer(...) {
  restart = fn(timer) == vkms_vblank_simulate {
    drm_crtc_handle_vblank(crtc) {
      drm_handle_vblank(struct drm_device *dev, unsigned int pipe) {
        spin_lock_irqsave(&dev->event_lock, irqflags); // Trying to hold dev->event_lock inside timer interrupt handler. => Deadlock was reported as a soft lockup.
        spin_unlock_irqrestore(&dev->event_lock, irqflags);
      }
    }
  }
}

On 2023/09/13 20:07, Hillf Danton wrote:
> On Tue, 12 Sep 2023 23:02:56 +0000 Sanan Hasanov <Sanan.Hasanov@ucf.edu>
>> Good day, dear maintainers,
>>
>> We found a bug using a modified kernel configuration file used by syzbot.
>>
> Thanks for your report.
> 
>> We enhanced the coverage of the configuration file using our tool, klocalizer.
>>
>> Kernel Branch: 6.3.0-next-20230426
>> Kernel Config: https://drive.google.com/file/d/1WSUEWrith9-539qo6xRqmwy4LfDtmKpp/view?usp=sharing
>> Reproducer: https://drive.google.com/file/d/1pN6FfcjuUs6Wx94g1gufuYGjRbMMgiZ4/view?usp=sharing
>> Thank you!
>>
>> Best regards,
>> Sanan Hasanov
>>
>> watchdog: BUG: soft lockup - CPU#5 stuck for 26s! [kworker/u16:1:12]
>> Modules linked in:
>> irq event stamp: 192794
>> hardirqs last  enabled at (192793): [<ffffffff89a0140a>] asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:645
>> hardirqs last disabled at (192794): [<ffffffff89975d4f>] sysvec_apic_timer_interrupt+0xf/0xc0 arch/x86/kernel/apic/apic.c:1106
>> softirqs last  enabled at (187764): [<ffffffff814b94bd>] invoke_softirq kernel/softirq.c:445 [inline]
>> softirqs last  enabled at (187764): [<ffffffff814b94bd>] __irq_exit_rcu+0x11d/0x190 kernel/softirq.c:650
>> softirqs last disabled at (187671): [<ffffffff814b94bd>] invoke_softirq kernel/softirq.c:445 [inline]
>> softirqs last disabled at (187671): [<ffffffff814b94bd>] __irq_exit_rcu+0x11d/0x190 kernel/softirq.c:650
>> CPU: 5 PID: 12 Comm: kworker/u16:1 Not tainted 6.3.0-next-20230426 #1
>> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
>> Workqueue: events_unbound toggle_allocation_gate
>> RIP: 0010:csd_lock_wait kernel/smp.c:294 [inline]
>> RIP: 0010:smp_call_function_many_cond+0x5bd/0x1020 kernel/smp.c:828
>> Code: 0b 00 85 ed 74 4d 48 b8 00 00 00 00 00 fc ff df 4d 89 f4 4c 89 f5 49 c1 ec 03 83 e5 07 49 01 c4 83 c5 03 e8 b5 07 0b 00 f3 90 <41> 0f b6 04 24 40 38 c5 7c 08 84 c0 0f 85 46 08 00 00 8b 43 08 31
>> RSP: 0018:ffffc900000cf9e8 EFLAGS: 00000293
>> RAX: 0000000000000000 RBX: ffff888119cc4d80 RCX: 0000000000000000
>> RDX: ffff888100325940 RSI: ffffffff8176807b RDI: 0000000000000005
>> RBP: 0000000000000003 R08: 0000000000000005 R09: 0000000000000000
>> R10: 0000000000000001 R11: 0000000000000001 R12: ffffed10233989b1
>> R13: 0000000000000001 R14: ffff888119cc4d88 R15: 0000000000000001
>> FS:  0000000000000000(0000) GS:ffff888119e80000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 0000555556a6cc88 CR3: 000000000bb73000 CR4: 0000000000350ee0
>> Call Trace:
>>  <TASK>
>>  on_each_cpu_cond_mask+0x40/0x90 kernel/smp.c:996
>>  on_each_cpu include/linux/smp.h:71 [inline]
>>  text_poke_sync arch/x86/kernel/alternative.c:1770 [inline]
>>  text_poke_bp_batch+0x237/0x770 arch/x86/kernel/alternative.c:1970
>>  text_poke_flush arch/x86/kernel/alternative.c:2161 [inline]
>>  text_poke_flush arch/x86/kernel/alternative.c:2158 [inline]
>>  text_poke_finish+0x1a/0x30 arch/x86/kernel/alternative.c:2168
>>  arch_jump_label_transform_apply+0x17/0x30 arch/x86/kernel/jump_label.c:146
>>  jump_label_update+0x321/0x400 kernel/jump_label.c:829
>>  static_key_enable_cpuslocked+0x1b5/0x270 kernel/jump_label.c:205
>>  static_key_enable+0x1a/0x20 kernel/jump_label.c:218
>>  toggle_allocation_gate mm/kfence/core.c:831 [inline]
>>  toggle_allocation_gate+0xf4/0x220 mm/kfence/core.c:823
>>  process_one_work+0x993/0x15e0 kernel/workqueue.c:2405
>>  worker_thread+0x67d/0x10c0 kernel/workqueue.c:2552
>>  kthread+0x33e/0x440 kernel/kthread.c:379
>>  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308
>>  </TASK>
>> Sending NMI from CPU 5 to CPUs 0-4,6-7:
>> NMI backtrace for cpu 1
>> CPU: 1 PID: 20602 Comm: syz-executor.3 Not tainted 6.3.0-next-20230426 #1
>> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
>> RIP: 0010:hlock_class kernel/locking/lockdep.c:228 [inline]
>> RIP: 0010:check_wait_context kernel/locking/lockdep.c:4747 [inline]
>> RIP: 0010:__lock_acquire+0x489/0x5d00 kernel/locking/lockdep.c:5024
>> Code: 41 81 e5 ff 1f 45 0f b7 ed be 08 00 00 00 4c 89 e8 48 c1 e8 06 48 8d 3c c5 00 6b 2c 90 e8 5f 90 6e 00 4c 0f a3 2d d7 35 c9 0e <0f> 83 5c 0c 00 00 4f 8d 6c 6d 00 49 c1 e5 06 49 81 c5 20 6f 2c 90
>> RSP: 0018:ffffc90002aa7350 EFLAGS: 00000047
>> RAX: 0000000000000001 RBX: 0000000000000001 RCX: ffffffff81633521
>> RDX: fffffbfff2058d62 RSI: 0000000000000008 RDI: ffffffff902c6b08
>> RBP: ffff888042995940 R08: 0000000000000000 R09: ffffffff902c6b0f
>> R10: fffffbfff2058d61 R11: 0000000000000001 R12: ffff888119e2b818
>> R13: 0000000000000063 R14: 0000000000000002 R15: ffff888042996598
>> FS:  00007fdaad065700(0000) GS:ffff888119c80000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 0000001b30623000 CR3: 0000000101969000 CR4: 0000000000350ee0
>> Call Trace:
>>  <TASK>
>>  lock_acquire kernel/locking/lockdep.c:5691 [inline]
>>  lock_acquire+0x1b1/0x520 kernel/locking/lockdep.c:5656
>>  __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
>>  _raw_spin_lock_irqsave+0x3d/0x60 kernel/locking/spinlock.c:162
>>  lock_hrtimer_base kernel/time/hrtimer.c:173 [inline]
>>  hrtimer_try_to_cancel kernel/time/hrtimer.c:1331 [inline]
>>  hrtimer_try_to_cancel+0xa9/0x2e0 kernel/time/hrtimer.c:1316
>>  hrtimer_cancel+0x17/0x40 kernel/time/hrtimer.c:1443
>>  __disable_vblank drivers/gpu/drm/drm_vblank.c:434 [inline]
>>  drm_vblank_disable_and_save+0x282/0x3d0 drivers/gpu/drm/drm_vblank.c:478
>>  drm_crtc_vblank_off+0x312/0x970 drivers/gpu/drm/drm_vblank.c:1366
> 
> 	cpu1			cpu4 (see below)
> 	====			====
> 	drm_crtc_vblank_off	__run_hrtimer
> 	spin_lock_irq(&dev->event_lock);
> 	...
> 				drm_handle_vblank
> 	hrtimer_cancel		spin_lock_irqsave(&dev->event_lock, irqflags);
> 
> 
> Deadlock should have been reported instead provided the lockdep_map in
> struct timer_list were added also to hrtimer, so it is highly appreciated
> if Tetsuo or Thomas adds it before 6.8 or 6.10.
> 
> Hillf
> 
>>  disable_outputs+0x7c7/0xbb0 drivers/gpu/drm/drm_atomic_helper.c:1202
>>  drm_atomic_helper_commit_modeset_disables+0x1d/0x40 drivers/gpu/drm/drm_atomic_helper.c:1397
>>  vkms_atomic_commit_tail+0x51/0x240 drivers/gpu/drm/vkms/vkms_drv.c:71
>>  commit_tail+0x288/0x420 drivers/gpu/drm/drm_atomic_helper.c:1812
>>  drm_atomic_helper_commit drivers/gpu/drm/drm_atomic_helper.c:2052 [inline]
>>  drm_atomic_helper_commit+0x306/0x390 drivers/gpu/drm/drm_atomic_helper.c:1985
>>  drm_atomic_commit+0x20a/0x2d0 drivers/gpu/drm/drm_atomic.c:1503
>>  drm_client_modeset_commit_atomic+0x698/0x7e0 drivers/gpu/drm/drm_client_modeset.c:1045
>>  drm_client_modeset_dpms+0x174/0x200 drivers/gpu/drm/drm_client_modeset.c:1226
>>  drm_fb_helper_dpms drivers/gpu/drm/drm_fb_helper.c:323 [inline]
>>  drm_fb_helper_blank+0xd1/0x260 drivers/gpu/drm/drm_fb_helper.c:356
>>  fb_blank+0x105/0x190 drivers/video/fbdev/core/fbmem.c:1088
>>  do_fb_ioctl+0x390/0x760 drivers/video/fbdev/core/fbmem.c:1180
>>  fb_ioctl+0xeb/0x150 drivers/video/fbdev/core/fbmem.c:1204
>>  vfs_ioctl fs/ioctl.c:51 [inline]
>>  __do_sys_ioctl fs/ioctl.c:870 [inline]
>>  __se_sys_ioctl fs/ioctl.c:856 [inline]
>>  __x64_sys_ioctl+0x197/0x210 fs/ioctl.c:856
>>  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>>  do_syscall_64+0x39/0x80 arch/x86/entry/common.c:80
>>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
>> RIP: 0033:0x7fdaabe8edcd
>> Code: 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
>> RSP: 002b:00007fdaad064bf8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>> RAX: ffffffffffffffda RBX: 00007fdaabfbbf80 RCX: 00007fdaabe8edcd
>> RDX: 0000000000000004 RSI: 0000000000004611 RDI: 0000000000000003
>> RBP: 00007fdaabefc59c R08: 0000000000000000 R09: 0000000000000000
>> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
>> R13: 00007ffdadeffe9f R14: 00007ffdadf00040 R15: 00007fdaad064d80
>>  </TASK>
>> NMI backtrace for cpu 0 skipped: idling at native_safe_halt arch/x86/include/asm/irqflags.h:48 [inline]
>> NMI backtrace for cpu 0 skipped: idling at arch_safe_halt arch/x86/include/asm/irqflags.h:86 [inline]
>> NMI backtrace for cpu 0 skipped: idling at default_idle+0xf/0x20 arch/x86/kernel/process.c:729
>> NMI backtrace for cpu 3 skipped: idling at native_safe_halt arch/x86/include/asm/irqflags.h:48 [inline]
>> NMI backtrace for cpu 3 skipped: idling at arch_safe_halt arch/x86/include/asm/irqflags.h:86 [inline]
>> NMI backtrace for cpu 3 skipped: idling at default_idle+0xf/0x20 arch/x86/kernel/process.c:729
>> NMI backtrace for cpu 6 skipped: idling at native_safe_halt arch/x86/include/asm/irqflags.h:48 [inline]
>> NMI backtrace for cpu 6 skipped: idling at arch_safe_halt arch/x86/include/asm/irqflags.h:86 [inline]
>> NMI backtrace for cpu 6 skipped: idling at default_idle+0xf/0x20 arch/x86/kernel/process.c:729
>> NMI backtrace for cpu 7 skipped: idling at native_safe_halt arch/x86/include/asm/irqflags.h:48 [inline]
>> NMI backtrace for cpu 7 skipped: idling at arch_safe_halt arch/x86/include/asm/irqflags.h:86 [inline]
>> NMI backtrace for cpu 7 skipped: idling at default_idle+0xf/0x20 arch/x86/kernel/process.c:729
>> NMI backtrace for cpu 4
>> CPU: 4 PID: 20623 Comm: syz-executor.6 Not tainted 6.3.0-next-20230426 #1
>> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
>> RIP: 0010:kvm_wait+0xb7/0x110 arch/x86/kernel/kvm.c:1064
>> Code: 40 38 c6 74 1b 48 83 c4 10 c3 c3 e8 93 d3 50 00 eb 07 0f 00 2d 4a 04 92 08 fb f4 48 83 c4 10 c3 eb 07 0f 00 2d 3a 04 92 08 f4 <48> 83 c4 10 c3 89 74 24 0c 48 89 3c 24 e8 d7 d4 50 00 8b 74 24 0c
>> RSP: 0018:ffffc90000300b50 EFLAGS: 00000046
>> RAX: 0000000000000003 RBX: 0000000000000000 RCX: dffffc0000000000
>> RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff88810b0803d8
>> RBP: ffff88810b0803d8 R08: 0000000000000001 R09: ffff88810b0803d8
>> R10: ffffed102161007b R11: ffffc90000300ff8 R12: 0000000000000000
>> R13: ffffed102161007b R14: 0000000000000001 R15: ffff888119e3d3c0
>> FS:  0000000000000000(0000) GS:ffff888119e00000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 00007f28183bd0b0 CR3: 000000000bb73000 CR4: 0000000000350ee0
>> Call Trace:
>>  <IRQ>
>>  pv_wait arch/x86/include/asm/paravirt.h:598 [inline]
>>  pv_wait_head_or_lock kernel/locking/qspinlock_paravirt.h:470 [inline]
>>  __pv_queued_spin_lock_slowpath+0x8e4/0xb80 kernel/locking/qspinlock.c:511
>>  pv_queued_spin_lock_slowpath arch/x86/include/asm/paravirt.h:586 [inline]
>>  queued_spin_lock_slowpath arch/x86/include/asm/qspinlock.h:51 [inline]
>>  queued_spin_lock include/asm-generic/qspinlock.h:114 [inline]
>>  do_raw_spin_lock+0x20d/0x2b0 kernel/locking/spinlock_debug.c:115
>>  __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:111 [inline]
>>  _raw_spin_lock_irqsave+0x45/0x60 kernel/locking/spinlock.c:162
>>  drm_handle_vblank+0x11e/0xb80 drivers/gpu/drm/drm_vblank.c:1986
>>  vkms_vblank_simulate+0xe8/0x3e0 drivers/gpu/drm/vkms/vkms_crtc.c:29
>>  __run_hrtimer kernel/time/hrtimer.c:1685 [inline]
>>  __hrtimer_run_queues+0x599/0xa30 kernel/time/hrtimer.c:1749
>>  hrtimer_interrupt+0x320/0x7b0 kernel/time/hrtimer.c:1811
>>  local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1095 [inline]
>>  __sysvec_apic_timer_interrupt+0x14a/0x430 arch/x86/kernel/apic/apic.c:1112
>>  sysvec_apic_timer_interrupt+0x92/0xc0 arch/x86/kernel/apic/apic.c:1106
>>  </IRQ>
>>  <TASK>
>>  asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:645
>> RIP: 0010:check_kcov_mode kernel/kcov.c:173 [inline]
>> RIP: 0010:__sanitizer_cov_trace_pc+0x11/0x70 kernel/kcov.c:207
>> Code: a8 01 00 00 e8 b0 ff ff ff 31 c0 c3 66 66 2e 0f 1f 84 00 00 00 00 00 66 90 f3 0f 1e fa 65 8b 05 0d 33 82 7e 89 c1 48 8b 34 24 <81> e1 00 01 00 00 65 48 8b 14 25 40 bb 03 00 a9 00 01 ff 00 74 0e
>> RSP: 0018:ffffc90002be76d8 EFLAGS: 00000286
>> RAX: 0000000080000001 RBX: 0000000000000001 RCX: 0000000080000001
>> RDX: 00007f2817c77000 RSI: ffffffff81bcd756 RDI: ffffc90002be7ad8
>> RBP: 0000000000000001 R08: 0000000000000001 R09: 0000000000000000
>> R10: 0000000000000001 R11: 0000000000000001 R12: ffffea00014fc480
>> R13: 0000000000000000 R14: dffffc0000000000 R15: 8000000053f12007
>>  zap_drop_file_uffd_wp mm/memory.c:1352 [inline]
>>  zap_install_uffd_wp_if_needed mm/memory.c:1371 [inline]
>>  zap_pte_range mm/memory.c:1417 [inline]
>>  zap_pmd_range mm/memory.c:1564 [inline]
>>  zap_pud_range mm/memory.c:1593 [inline]
>>  zap_p4d_range mm/memory.c:1614 [inline]
>>  unmap_page_range+0x1046/0x4470 mm/memory.c:1635
>>  unmap_single_vma+0x19a/0x2b0 mm/memory.c:1681
>>  unmap_vmas+0x234/0x380 mm/memory.c:1720
>>  exit_mmap+0x190/0x930 mm/mmap.c:3111
>>  __mmput+0x128/0x4c0 kernel/fork.c:1351
>>  mmput+0x60/0x70 kernel/fork.c:1373
>>  exit_mm kernel/exit.c:564 [inline]
>>  do_exit+0x9d1/0x29f0 kernel/exit.c:858
>>  do_group_exit+0xd4/0x2a0 kernel/exit.c:1021
>>  get_signal+0x2311/0x25c0 kernel/signal.c:2874
>>  arch_do_signal_or_restart+0x79/0x5a0 arch/x86/kernel/signal.c:307
>>  exit_to_user_mode_loop kernel/entry/common.c:168 [inline]
>>  exit_to_user_mode_prepare+0x11f/0x240 kernel/entry/common.c:204
>>  __syscall_exit_to_user_mode_work kernel/entry/common.c:286 [inline]
>>  syscall_exit_to_user_mode+0x1d/0x50 kernel/entry/common.c:297
>>  do_syscall_64+0x46/0x80 arch/x86/entry/common.c:86
>>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
>> RIP: 0033:0x7f281828edcd
>> Code: Unable to access opcode bytes at 0x7f281828eda3.
>> RSP: 002b:00007f28194c0c98 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
>> RAX: fffffffffffffe00 RBX: 00007f28183bbf80 RCX: 00007f281828edcd
>> RDX: 0000000000000000 RSI: 0000000000000080 RDI: 00007f28183bbf88
>> RBP: 00007f28183bbf88 R08: 0000000000000000 R09: 0000000000000000
>> R10: 0000000000000000 R11: 0000000000000246 R12: 00007f28183bbf8c
>> R13: 00007ffd5038e1ef R14: 00007ffd5038e390 R15: 00007f28194c0d80
>>  </TASK>
>> NMI backtrace for cpu 2 skipped: idling at native_safe_halt arch/x86/include/asm/irqflags.h:48 [inline]
>> NMI backtrace for cpu 2 skipped: idling at arch_safe_halt arch/x86/include/asm/irqflags.h:86 [inline]
>> NMI backtrace for cpu 2 skipped: idling at default_idle+0xf/0x20 arch/x86/kernel/process.c:729

