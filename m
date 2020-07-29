Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8812319E8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 08:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00CDE6E456;
	Wed, 29 Jul 2020 06:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88E06E416
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 02:24:52 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 68114B1E453C3116F82C;
 Wed, 29 Jul 2020 10:24:45 +0800 (CST)
Received: from huawei.com (10.175.112.208) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Wed, 29 Jul 2020
 10:24:38 +0800
From: Xu Qiang <xuqiang36@huawei.com>
To: <rodrigosiqueiramelo@gmail.com>, <hamohammed.sa@gmail.com>,
 <daniel@ffwll.ch>, <airlied@linux.ie>
Subject: [PATCH] drm/vkms: Fix soft lockup.
Date: Wed, 29 Jul 2020 02:23:15 +0000
Message-ID: <20200729022315.18716-1-xuqiang36@huawei.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Originating-IP: [10.175.112.208]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 29 Jul 2020 06:58:35 +0000
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
Cc: rui.xiang@huawei.com, lizefan@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A soft deadlock occurs when call hrtimer_cancel in softirq context:

	a) The main frequency of the machine is very slow
	b) output->period_ns is very small, even only 1 ns

The problem can be solved in the following way: Setting a hrtimer exit flag
in the vkms_disable_vblank function and checking the flag in the
vkms_vblank_simulate function. If the flag is set, the hrtimer is not added
to hrtimer queue again,the hrtimer_cancel function can exit quickly
without deadlock.

watchdog: BUG: soft lockup - CPU#2 stuck for 134s! [syz-executor.2:18027]
Modules linked in:
CPU: 2 PID: 18027 Comm: syz-executor.2 Tainted: G        W         5.8.0-rc2-csan #2
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Ubuntu-1.8.2-1ubuntu1 04/01/2014
RIP: 0010:csd_lock_wait kernel/smp.c:108 [inline]
RIP: 0010:smp_call_function_many_cond+0x40c/0x470 kernel/smp.c:555
RSP: 0018:ffffc900028d3a88 EFLAGS: 00000297
RAX: 0000000000000002 RBX: ffff888237cacc80 RCX: ffffffff813240fc
RDX: 0000000000000001 RSI: 0000000000000000 RDI: 0000000000000005
RBP: 0000000000000001 R08: ffff8881f497d000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000100 R12: ffff888237cf6fc0
R13: 0000000000000003 R14: ffff888237cacc88 R15: 0000000000000001
FS:  00007fa6314a9700(0000) GS:ffff888237c80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000513c80 CR3: 00000001e3df3002 CR4: 00000000000626e0
Call Trace:
 smp_call_function_many kernel/smp.c:577 [inline]
 smp_call_function+0x40/0x80 kernel/smp.c:599
 on_each_cpu+0x2a/0xc0 kernel/smp.c:717
 __purge_vmap_area_lazy+0x7c/0xbc0 mm/vmalloc.c:1367
 _vm_unmap_aliases.part.0+0x126/0x180 mm/vmalloc.c:1800
 _vm_unmap_aliases mm/vmalloc.c:1769 [inline]
 vm_unmap_aliases+0x2f/0x40 mm/vmalloc.c:1823
 change_page_attr_set_clr+0x10a/0x4a0 arch/x86/mm/pat/set_memory.c:1732
 change_page_attr_clear arch/x86/mm/pat/set_memory.c:1789 [inline]
 set_memory_ro+0x2b/0x40 arch/x86/mm/pat/set_memory.c:1935
 bpf_jit_binary_lock_ro include/linux/filter.h:815 [inline]
 bpf_int_jit_compile+0x54f/0x663 arch/x86/net/bpf_jit_comp.c:1929
 bpf_prog_select_runtime+0x1cc/0x2c0 kernel/bpf/core.c:1807
 bpf_migrate_filter net/core/filter.c:1264 [inline]
 bpf_prepare_filter net/core/filter.c:1312 [inline]
 bpf_prepare_filter+0x518/0x620 net/core/filter.c:1278
 __get_filter+0x107/0x160 net/core/filter.c:1481
 sk_attach_filter+0x19/0xa0 net/core/filter.c:1496
 sock_setsockopt+0x1208/0x1230 net/core/sock.c:1080
 __sys_setsockopt+0x248/0x270 net/socket.c:2123
 __do_sys_setsockopt net/socket.c:2143 [inline]
 __se_sys_setsockopt net/socket.c:2140 [inline]
 __x64_sys_setsockopt+0x22/0x30 net/socket.c:2140
 do_syscall_64+0x48/0xb0 arch/x86/entry/common.c:359
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
Sending NMI from CPU 2 to CPUs 0-1,3-5:
NMI backtrace for cpu 4 skipped: idling at native_safe_halt+0xe/0x10 arch/x86/include/asm/irqflags.h:60
NMI backtrace for cpu 0 skipped: idling at native_safe_halt+0xe/0x10 arch/x86/include/asm/irqflags.h:60
NMI backtrace for cpu 1
NMI backtrace for cpu 3
CPU: 3 PID: 0 Comm: swapper/3 Tainted: G        W         5.8.0-rc2-csan #2
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Ubuntu-1.8.2-1ubuntu1 04/01/2014
RIP: 0010:preempt_count arch/x86/include/asm/preempt.h:26 [inline]
RIP: 0010:preempt_count_sub+0xa/0x90 kernel/sched/core.c:3874
RSP: 0018:ffffc9000012cdd0 EFLAGS: 00000046
RAX: 0000000000000001 RBX: ffff88822ecb8fb0 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000086 RDI: 0000000000000001
RBP: ffff888237d5edc0 R08: ffff888236ddc000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 00000000ffffffff
R13: 0000000000000086 R14: ffff888237d5edc0 R15: ffffffff85bc6d60
FS:  0000000000000000(0000) GS:ffff888237cc0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f35cc47adb8 CR3: 0000000005a23006 CR4: 00000000000626e0
Call Trace:
 <IRQ>
 __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:161 [inline]
 _raw_spin_unlock_irqrestore+0x2f/0x50 kernel/locking/spinlock.c:191
 unlock_hrtimer_base kernel/time/hrtimer.c:898 [inline]
 hrtimer_try_to_cancel kernel/time/hrtimer.c:1171 [inline]
 hrtimer_try_to_cancel+0xbd/0x1b0 kernel/time/hrtimer.c:1151
 hrtimer_cancel+0x13/0x40 kernel/time/hrtimer.c:1278
 __disable_vblank drivers/gpu/drm/drm_vblank.c:429 [inline]
 drm_vblank_disable_and_save+0x122/0x140 drivers/gpu/drm/drm_vblank.c:470
 vblank_disable_fn+0x96/0xa0 drivers/gpu/drm/drm_vblank.c:487
 call_timer_fn+0x3a/0x230 kernel/time/timer.c:1404
 expire_timers kernel/time/timer.c:1449 [inline]
 __run_timers kernel/time/timer.c:1773 [inline]
 __run_timers kernel/time/timer.c:1740 [inline]
 run_timer_softirq+0x2b8/0x840 kernel/time/timer.c:1786
 __do_softirq+0x118/0x344 kernel/softirq.c:292
 asm_call_on_stack+0xf/0x20 arch/x86/entry/entry_64.S:711
 </IRQ>
 __run_on_irqstack arch/x86/include/asm/irq_stack.h:22 [inline]
 run_on_irqstack_cond arch/x86/include/asm/irq_stack.h:48 [inline]
 do_softirq_own_stack+0x5a/0x70 arch/x86/kernel/irq_64.c:77
 invoke_softirq kernel/softirq.c:387 [inline]
 __irq_exit_rcu kernel/softirq.c:417 [inline]
 irq_exit_rcu+0xb1/0xd0 kernel/softirq.c:429
 sysvec_apic_timer_interrupt+0x42/0xd0 arch/x86/kernel/apic/apic.c:1091
 asm_sysvec_apic_timer_interrupt+0x12/0x20 arch/x86/include/asm/idtentry.h:596
------------[ cut here ]------------
WARNING: CPU: 5 PID: 8121 at drivers/gpu/drm/vkms/vkms_crtc.c:21 vkms_vblank_simulate+0x19a/0x1b0 drivers/gpu/drm/vkms/vkms_crtc.c:21
Modules linked in:
CPU: 5 PID: 8121 Comm: syslog-ng Tainted: G        W         5.8.0-rc2-csan #2
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Ubuntu-1.8.2-1ubuntu1 04/01/2014
RIP: 0010:vkms_vblank_simulate+0x19a/0x1b0 drivers/gpu/drm/vkms/vkms_crtc.c:21
RSP: 0018:ffffc90000184ee8 EFLAGS: 00010046
RAX: ffff88822864a080 RBX: ffff88822ecb8fb0 RCX: ffffffff826cd2b0
RDX: 0000000080010000 RSI: ffffffff826cd40a RDI: 0000000000000007
RBP: 00000000001f058d R08: ffff88822864a080 R09: 7fffffffffffffff
R10: 0000000000000000 R11: 0000000000000000 R12: ffff88822ecb8630
R13: 0000000000000000 R14: 0000017998a35917 R15: ffff888237d5ed80
FS:  00007f8dcbde0700(0000) GS:ffff888237d40000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffff600400 CR3: 000000022575f002 CR4: 00000000000626e0
Call Trace:
 <IRQ>
 __run_hrtimer kernel/time/hrtimer.c:1520 [inline]
 __hrtimer_run_queues+0x14c/0x410 kernel/time/hrtimer.c:1584
 hrtimer_interrupt+0x141/0x2c0 kernel/time/hrtimer.c:1646
 local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1080 [inline]
 __sysvec_apic_timer_interrupt+0x6e/0x170 arch/x86/kernel/apic/apic.c:1097
 asm_call_on_stack+0xf/0x20 arch/x86/entry/entry_64.S:711
 </IRQ>
 __run_on_irqstack arch/x86/include/asm/irq_stack.h:22 [inline]
 run_on_irqstack_cond arch/x86/include/asm/irq_stack.h:48 [inline]
 sysvec_apic_timer_interrupt+0xa9/0xd0 arch/x86/kernel/apic/apic.c:1091
 asm_sysvec_apic_timer_interrupt+0x12/0x20 arch/x86/include/asm/idtentry.h:596
RIP: 0010:con_should_update drivers/tty/vt/vt.c:291 [inline]
RIP: 0010:do_con_write.part.0+0xad6/0xfa0 drivers/tty/vt/vt.c:2790
---[ end trace d6a6c6a9ecb73597 ]---
NMI backtrace for cpu 5 skipped: idling at native_halt+0xd/0x10 arch/x86/include/asm/irqflags.h:66

Cc: stable@vger.kernel.org
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Xu Qiang <xuqiang36@huawei.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 5 ++++-
 drivers/gpu/drm/vkms/vkms_drv.h  | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index ac85e17428f8..655294f11bb8 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -49,7 +49,7 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 			DRM_DEBUG_DRIVER("Composer worker already queued\n");
 	}
 
-	return HRTIMER_RESTART;
+	return output->hrtimer_exit ? HRTIMER_NORESTART : HRTIMER_RESTART;
 }
 
 static int vkms_enable_vblank(struct drm_crtc *crtc)
@@ -66,6 +66,8 @@ static int vkms_enable_vblank(struct drm_crtc *crtc)
 	out->period_ns = ktime_set(0, vblank->framedur_ns);
 	hrtimer_start(&out->vblank_hrtimer, out->period_ns, HRTIMER_MODE_REL);
 
+	out->hrtimer_exit = false;
+
 	return 0;
 }
 
@@ -73,6 +75,7 @@ static void vkms_disable_vblank(struct drm_crtc *crtc)
 {
 	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
 
+	out->hrtimer_exit = true;
 	hrtimer_cancel(&out->vblank_hrtimer);
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index f4036bb0b9a8..4d4323dc2cfd 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -65,6 +65,7 @@ struct vkms_output {
 	struct drm_connector connector;
 	struct hrtimer vblank_hrtimer;
 	ktime_t period_ns;
+	bool	hrtimer_exit;
 	struct drm_pending_vblank_event *event;
 	/* ordered wq for composer_work */
 	struct workqueue_struct *composer_workq;
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
