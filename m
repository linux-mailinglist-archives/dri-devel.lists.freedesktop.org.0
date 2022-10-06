Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3D15F6E7D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 21:55:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5CE10E499;
	Thu,  6 Oct 2022 19:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580F810E499
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 19:55:39 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id
 e8-20020a056e020b2800b002f8fd643f78so2304785ilu.18
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 12:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CI+uai2QDkCju301rOk87BT0Y+GssDsqYlX2eODpnME=;
 b=zExb7R0tKQ/KCW7PR6cE3FkYKgk+WbNIqrDIGBEisOQMW3q1Z0DSE+47BoTaCHrms7
 OyrvuZPurXk4NqmvsWLMpYubk+tIvG1ro7MPtrj8OZLbh3kNr5QpPQ68PhKAF9FjuoF5
 iF9WiakFTTzZUOCmaqc1MqWE/8+TjY3Pa5a4s2W8TwUzHsxpBAfCx59tz0hWLdgCpcu8
 cYS6S8yki9k++FLboafBYleLkdD9cowHUp+QZpW5fV2meskmSKwV6+AbzpxIhSUURP6m
 gkgPMoUauITISCHzKBj0UbHlhPH37z/8crycoxD7DOLdtNi5q3bWSotTsU8mAvrzG/fe
 qQow==
X-Gm-Message-State: ACrzQf3OmKV9yZQjtYZ1xwfUL60J79oVYeH6uhrXrrZxXwnbZ8D+nRDi
 xzTkhRfZr7aCy5NUT9373IQF2cjk0rY3nPVbxglxPlH2+SZt
X-Google-Smtp-Source: AMsMyM73mcvYbJjn58gHRIKYKf+0CeYztbHiRTF2Oz53eXRBmm8LZY8T3y1zHsbVvM2YgLH1226qPI6sk2BT9dm/SPihVi0Fbin9
MIME-Version: 1.0
X-Received: by 2002:a5e:c80f:0:b0:6a5:481a:6219 with SMTP id
 y15-20020a5ec80f000000b006a5481a6219mr705547iol.36.1665086138422; Thu, 06 Oct
 2022 12:55:38 -0700 (PDT)
Date: Thu, 06 Oct 2022 12:55:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000cd1c5b05ea63135f@google.com>
Subject: [syzbot] WARNING: locking bug in complete_all (2)
From: syzbot <syzbot+89f4560b096bdbf2cd4b@syzkaller.appspotmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org, melissa.srw@gmail.com, 
 rodrigosiqueiramelo@gmail.com, syzkaller-bugs@googlegroups.com
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

HEAD commit:    bbed346d5a96 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=13b7a1b8880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=aae2d21e7dd80684
dashboard link: https://syzkaller.appspot.com/bug?extid=89f4560b096bdbf2cd4b
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/11078f50b80b/disk-bbed346d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/398e5f1e6c84/vmlinux-bbed346d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+89f4560b096bdbf2cd4b@syzkaller.appspotmail.com

------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(1)
WARNING: CPU: 1 PID: 976 at kernel/locking/lockdep.c:231 check_wait_context kernel/locking/lockdep.c:4727 [inline]
WARNING: CPU: 1 PID: 976 at kernel/locking/lockdep.c:231 __lock_acquire+0x2b0/0x30a4 kernel/locking/lockdep.c:5003
Modules linked in:
CPU: 1 PID: 976 Comm: kworker/u4:3 Not tainted 6.0.0-rc7-syzkaller-18095-gbbed346d5a96 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/26/2022
Workqueue: bat_events batadv_nc_worker
pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : check_wait_context kernel/locking/lockdep.c:4727 [inline]
pc : __lock_acquire+0x2b0/0x30a4 kernel/locking/lockdep.c:5003
lr : hlock_class kernel/locking/lockdep.c:231 [inline]
lr : check_wait_context kernel/locking/lockdep.c:4727 [inline]
lr : __lock_acquire+0x298/0x30a4 kernel/locking/lockdep.c:5003
sp : ffff80000800ba20
x29: ffff80000800bb00 x28: 0000000000000004 x27: ffff0000c6431b20
x26: ffff0000fc9faa30 x25: ffff0000c6432550 x24: 0000000000000080
x23: 0000000000000000 x22: 0000000000000001 x21: 0000000000000000
x20: 0000000000000000 x19: aaab27e894723d1c x18: 000000000000ba7e
x17: ffff8001f1d7d000 x16: ffff80000db49158 x15: ffff0000c6431a80
x14: 0000000000000000 x13: 0000000000000012 x12: ffff80000d5ef920
x11: ff808000081c0d5c x10: ffff80000dd0b198 x9 : 68ac72b3ffb08100
x8 : 0000000000000000 x7 : 4e5241575f534b43 x6 : ffff80000819545c
x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
x2 : 0000000000000000 x1 : 0000000100010003 x0 : 0000000000000016
Call trace:
 check_wait_context kernel/locking/lockdep.c:4727 [inline]
 __lock_acquire+0x2b0/0x30a4 kernel/locking/lockdep.c:5003
 lock_acquire+0x100/0x1f8 kernel/locking/lockdep.c:5666
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
 _raw_spin_lock_irqsave+0x6c/0xb4 kernel/locking/spinlock.c:162
 complete_all+0x24/0xa0 kernel/sched/completion.c:63
 drm_send_event_helper+0x50/0x228 drivers/gpu/drm/drm_file.c:783
 drm_send_event_timestamp_locked+0x34/0x48 drivers/gpu/drm/drm_file.c:827
 send_vblank_event drivers/gpu/drm/drm_vblank.c:1016 [inline]
 drm_handle_vblank_events+0x258/0x334 drivers/gpu/drm/drm_vblank.c:1914
 drm_handle_vblank+0x188/0x310 drivers/gpu/drm/drm_vblank.c:1975
 drm_crtc_handle_vblank+0x24/0x38 drivers/gpu/drm/drm_vblank.c:2009
 vkms_vblank_simulate+0x84/0x1b4 drivers/gpu/drm/vkms/vkms_crtc.c:29
 __run_hrtimer kernel/time/hrtimer.c:1685 [inline]
 __hrtimer_run_queues+0x210/0x390 kernel/time/hrtimer.c:1749
 hrtimer_interrupt+0x12c/0x510 kernel/time/hrtimer.c:1811
 timer_handler drivers/clocksource/arm_arch_timer.c:653 [inline]
 arch_timer_handler_virt+0x58/0x6c drivers/clocksource/arm_arch_timer.c:664
 handle_percpu_devid_irq+0xb0/0x1c8 kernel/irq/chip.c:930
 generic_handle_irq_desc include/linux/irqdesc.h:158 [inline]
 handle_irq_desc kernel/irq/irqdesc.c:648 [inline]
 generic_handle_domain_irq+0x4c/0x6c kernel/irq/irqdesc.c:704
 gic_handle_irq+0x78/0x1b4 drivers/irqchip/irq-gic.c:359
 call_on_irq_stack+0x2c/0x54 arch/arm64/kernel/entry.S:889
 do_interrupt_handler+0x7c/0xc0 arch/arm64/kernel/entry-common.c:274
 __el1_irq arch/arm64/kernel/entry-common.c:470 [inline]
 el1_interrupt+0x34/0x68 arch/arm64/kernel/entry-common.c:485
 el1h_64_irq_handler+0x18/0x24 arch/arm64/kernel/entry-common.c:490
 el1h_64_irq+0x64/0x68 arch/arm64/kernel/entry.S:577
 arch_local_irq_enable arch/arm64/include/asm/irqflags.h:35 [inline]
 __local_bh_enable_ip+0x144/0x1a4 kernel/softirq.c:401
 __raw_spin_unlock_bh include/linux/spinlock_api_smp.h:167 [inline]
 _raw_spin_unlock_bh+0x48/0x58 kernel/locking/spinlock.c:210
 spin_unlock_bh include/linux/spinlock.h:394 [inline]
 batadv_nc_purge_paths+0x1d0/0x214 net/batman-adv/network-coding.c:471
 batadv_nc_worker+0x394/0x484 net/batman-adv/network-coding.c:720
 process_one_work+0x2d8/0x504 kernel/workqueue.c:2289
 worker_thread+0x340/0x610 kernel/workqueue.c:2436
 kthread+0x12c/0x158 kernel/kthread.c:376
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:860
irq event stamp: 2991678
hardirqs last  enabled at (2991677): [<ffff800008102154>] __local_bh_enable_ip+0x13c/0x1a4 kernel/softirq.c:401
hardirqs last disabled at (2991678): [<ffff80000bfb6088>] __el1_irq arch/arm64/kernel/entry-common.c:467 [inline]
hardirqs last disabled at (2991678): [<ffff80000bfb6088>] el1_interrupt+0x24/0x68 arch/arm64/kernel/entry-common.c:485
softirqs last  enabled at (2991676): [<ffff80000becc320>] spin_unlock_bh include/linux/spinlock.h:394 [inline]
softirqs last  enabled at (2991676): [<ffff80000becc320>] batadv_nc_purge_paths+0x1d0/0x214 net/batman-adv/network-coding.c:471
softirqs last disabled at (2991674): [<ffff80000becc1b0>] spin_lock_bh include/linux/spinlock.h:354 [inline]
softirqs last disabled at (2991674): [<ffff80000becc1b0>] batadv_nc_purge_paths+0x60/0x214 net/batman-adv/network-coding.c:442
---[ end trace 0000000000000000 ]---
Unable to handle kernel NULL pointer dereference at virtual address 00000000000000b8
Mem abort info:
  ESR = 0x0000000096000007
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x07: level 3 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000007
  CM = 0, WnR = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=000000010affc000
[00000000000000b8] pgd=080000010a948003, p4d=080000010a948003, pud=080000010ad99003, pmd=080000010ada3003, pte=0000000000000000
Internal error: Oops: 0000000096000007 [#1] PREEMPT SMP
Modules linked in:
CPU: 1 PID: 976 Comm: kworker/u4:3 Tainted: G        W          6.0.0-rc7-syzkaller-18095-gbbed346d5a96 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/26/2022
Workqueue: bat_events batadv_nc_worker
pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : check_wait_context kernel/locking/lockdep.c:4727 [inline]
pc : __lock_acquire+0x2d0/0x30a4 kernel/locking/lockdep.c:5003
lr : hlock_class kernel/locking/lockdep.c:231 [inline]
lr : check_wait_context kernel/locking/lockdep.c:4727 [inline]
lr : __lock_acquire+0x298/0x30a4 kernel/locking/lockdep.c:5003
sp : ffff80000800ba20
x29: ffff80000800bb00 x28: 0000000000000004 x27: ffff0000c6431b20
x26: ffff0000fc9faa30 x25: ffff0000c6432550 x24: 0000000000000080
x23: 0000000000000000 x22: 0000000000000001 x21: 0000000000000000
x20: 0000000000000000 x19: aaab27e894723d1c x18: 000000000000ba7e
x17: ffff8001f1d7d000 x16: ffff80000db49158 x15: ffff0000c6431a80
x14: 0000000000000000 x13: 0000000000000012 x12: ffff80000d5ef920
x11: ff808000081c0d5c x10: ffff80000dd0b198 x9 : 00000000000c5d1c
x8 : 0000000000000000 x7 : 4e5241575f534b43 x6 : ffff80000819545c
x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
x2 : 0000000000000000 x1 : 0000000100010003 x0 : 0000000000000016
Call trace:
 hlock_class kernel/locking/lockdep.c:222 [inline]
 check_wait_context kernel/locking/lockdep.c:4728 [inline]
 __lock_acquire+0x2d0/0x30a4 kernel/locking/lockdep.c:5003
 lock_acquire+0x100/0x1f8 kernel/locking/lockdep.c:5666
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
 _raw_spin_lock_irqsave+0x6c/0xb4 kernel/locking/spinlock.c:162
 complete_all+0x24/0xa0 kernel/sched/completion.c:63
 drm_send_event_helper+0x50/0x228 drivers/gpu/drm/drm_file.c:783
 drm_send_event_timestamp_locked+0x34/0x48 drivers/gpu/drm/drm_file.c:827
 send_vblank_event drivers/gpu/drm/drm_vblank.c:1016 [inline]
 drm_handle_vblank_events+0x258/0x334 drivers/gpu/drm/drm_vblank.c:1914
 drm_handle_vblank+0x188/0x310 drivers/gpu/drm/drm_vblank.c:1975
 drm_crtc_handle_vblank+0x24/0x38 drivers/gpu/drm/drm_vblank.c:2009
 vkms_vblank_simulate+0x84/0x1b4 drivers/gpu/drm/vkms/vkms_crtc.c:29
 __run_hrtimer kernel/time/hrtimer.c:1685 [inline]
 __hrtimer_run_queues+0x210/0x390 kernel/time/hrtimer.c:1749
 hrtimer_interrupt+0x12c/0x510 kernel/time/hrtimer.c:1811
 timer_handler drivers/clocksource/arm_arch_timer.c:653 [inline]
 arch_timer_handler_virt+0x58/0x6c drivers/clocksource/arm_arch_timer.c:664
 handle_percpu_devid_irq+0xb0/0x1c8 kernel/irq/chip.c:930
 generic_handle_irq_desc include/linux/irqdesc.h:158 [inline]
 handle_irq_desc kernel/irq/irqdesc.c:648 [inline]
 generic_handle_domain_irq+0x4c/0x6c kernel/irq/irqdesc.c:704
 gic_handle_irq+0x78/0x1b4 drivers/irqchip/irq-gic.c:359
 call_on_irq_stack+0x2c/0x54 arch/arm64/kernel/entry.S:889
 do_interrupt_handler+0x7c/0xc0 arch/arm64/kernel/entry-common.c:274
 __el1_irq arch/arm64/kernel/entry-common.c:470 [inline]
 el1_interrupt+0x34/0x68 arch/arm64/kernel/entry-common.c:485
 el1h_64_irq_handler+0x18/0x24 arch/arm64/kernel/entry-common.c:490
 el1h_64_irq+0x64/0x68 arch/arm64/kernel/entry.S:577
 arch_local_irq_enable arch/arm64/include/asm/irqflags.h:35 [inline]
 __local_bh_enable_ip+0x144/0x1a4 kernel/softirq.c:401
 __raw_spin_unlock_bh include/linux/spinlock_api_smp.h:167 [inline]
 _raw_spin_unlock_bh+0x48/0x58 kernel/locking/spinlock.c:210
 spin_unlock_bh include/linux/spinlock.h:394 [inline]
 batadv_nc_purge_paths+0x1d0/0x214 net/batman-adv/network-coding.c:471
 batadv_nc_worker+0x394/0x484 net/batman-adv/network-coding.c:720
 process_one_work+0x2d8/0x504 kernel/workqueue.c:2289
 worker_thread+0x340/0x610 kernel/workqueue.c:2436
 kthread+0x12c/0x158 kernel/kthread.c:376
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:860
Code: b002db8a 91056210 9106614a b9400329 (3942e114) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	b002db8a 	adrp	x10, 0x5b71000
   4:	91056210 	add	x16, x16, #0x158
   8:	9106614a 	add	x10, x10, #0x198
   c:	b9400329 	ldr	w9, [x25]
* 10:	3942e114 	ldrb	w20, [x8, #184] <-- trapping instruction


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
