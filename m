Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AC81382CE
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jan 2020 19:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F7A6E237;
	Sat, 11 Jan 2020 18:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481CD6E237;
 Sat, 11 Jan 2020 18:08:13 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id x1so5459748iop.7;
 Sat, 11 Jan 2020 10:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=lCUs85T+kf03RxOYLQdO0jJiEfxEZYs+7VX2oOMh9bs=;
 b=frxghsW7gzu5V60RJFbSIUDkMQ++Vi4w78hu/DBjtx4PD3c4A7V/7EJe4RKyE1ex3v
 /ookrg3+hbY1osfv7vSqvYDKJlI2K95LljjC9KqIu9U0NAOWrXMoii+IsrmJyJlHhxOE
 iAmhNixHSQPmHh1hRmtdWhLpY1j614485daykBHXjYPYgYukzBXYlLFzHse3RNEaJXgF
 OrQvbLqXA2aEpOCi+7SsXxM2sI0l0f+RIqE3IY6EC8CW+A8ZSof5Sp3e03OwkUV6KmKE
 X+5zU1HTBGhHpLc1qMrCuBWhOuoxTkTQjrqRVlZS9Rhhsio9qZWexnvvMERYB7VsNzuw
 i6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=lCUs85T+kf03RxOYLQdO0jJiEfxEZYs+7VX2oOMh9bs=;
 b=LZ7j5YrCzYKdscHxE1259FDT/gNCwqQOVqnyzfPk0QYyjl1TNjpUBxwjBu61V1E3K/
 MWjV5LUzFaIXw4tgUsGbISJy8fWbr3edYNawayJ0xyNQLa92q5m2fcGl0BzO6KHVuxTZ
 LgOTGAwwjhlBtm7GDZhxTRGsRcOw0/Rrl6TWM8UIh42cSIHL3AXZGpuV7mXDLmWpH8ce
 IlkxrpwBIAtUeWbcHnbp89PyOvD0fiUlqh0KmPoGrzuXobB5UViBYPbc4tjyjV+Q+Xzy
 X23ujITAcZhUD3ddVmI4Z5yUgX3zuREsM0EJGRSxy2SBw9sXq3V8ndIAXr9GMShx97Tq
 OvYA==
X-Gm-Message-State: APjAAAWvpjei96S5Mzllj8GCQbEMMJup5zr4iJ75EWp30+G7/7Qq+sLn
 DtaGDueMuA5qR4cMDALZ2s96MuEfM7uzZThuW4Q=
X-Google-Smtp-Source: APXvYqzHLFsTcaMoSYBxdv7k3oNxaqC6Ugq6676kVqdlwZKGqHQprk9V0wqoqp/Lk1mXeX5q+6EL58VSxzZw0i07NWc=
X-Received: by 2002:a6b:8b01:: with SMTP id n1mr7269099iod.111.1578766092223; 
 Sat, 11 Jan 2020 10:08:12 -0800 (PST)
MIME-Version: 1.0
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Sat, 11 Jan 2020 23:08:01 +0500
Message-ID: <CABXGCsM0=6Mh2FG-s9-HPaWjemJOiQZdHfO7RkSRt3dRHs7n6g@mail.gmail.com>
Subject: BUG: workqueue lockup - pool cpus=2 node=0 flags=0x0 nice=0 stuck for
 60s!
To: Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi folks, I just wanted to share my logs via paste but didn't look at
what size they are.
I opened the file in Geany and press Ctrl + A, Ctrl + C, and then go
to Chrome in tab with opened pastebin.com and pressed Ctrl + V. I did
not expect that after such action the GUI of the system hangs.
I connected via ssh and saw follow messages:

[  317.662558] nf_conntrack: default automatic helper assignment has
been turned off for security reasons and CT-based  firewall rule not
found. Use the iptables CT target to attach helpers instead.
[ 2003.644286] GpuWatchdog[4339]: segfault at 0 ip 0000562357dfa40c sp
00007fbc6bdc3500 error 6 in chrome[562353e82000+731f000]
[ 2003.644341] Code: 3d bd 02 47 fb be 01 00 00 00 ba 07 00 00 00 e8
3a 9f a6 fe 48 8d 3d 0f 41 48 fb be 01 00 00 00 ba 03 00 00 00 e8 24
9f a6 fe <c7> 04 25 00 00 00 00 37 13 00 00 c6 05 82 a8 bd 03 01 80 7d
87 00
[ 2032.449702] GpuWatchdog[10475]: segfault at 0 ip 000055ad62b7240c
sp 00007f81bc7ff500 error 6 in chrome[55ad5ebfa000+731f000]
[ 2032.449719] Code: 3d bd 02 47 fb be 01 00 00 00 ba 07 00 00 00 e8
3a 9f a6 fe 48 8d 3d 0f 41 48 fb be 01 00 00 00 ba 03 00 00 00 e8 24
9f a6 fe <c7> 04 25 00 00 00 00 37 13 00 00 c6 05 82 a8 bd 03 01 80 7d
87 00
[ 2060.726076] GpuWatchdog[10663]: segfault at 0 ip 0000558ea234c40c
sp 00007f26a3d3e500 error 6 in chrome[558e9e3d4000+731f000]
[ 2060.726093] Code: 3d bd 02 47 fb be 01 00 00 00 ba 07 00 00 00 e8
3a 9f a6 fe 48 8d 3d 0f 41 48 fb be 01 00 00 00 ba 03 00 00 00 e8 24
9f a6 fe <c7> 04 25 00 00 00 00 37 13 00 00 c6 05 82 a8 bd 03 01 80 7d
87 00
[ 2253.777053] BUG: workqueue lockup - pool cpus=2 node=0 flags=0x0
nice=0 stuck for 60s!
[ 2253.777144] Showing busy workqueues and worker pools:
[ 2253.777149] workqueue events: flags=0x0
[ 2253.777313]   pwq 22: cpus=11 node=0 flags=0x0 nice=0 active=1/256 refcnt=2
[ 2253.777849]     in-flight: 10359:key_garbage_collector

[ 2253.777856] ======================================================
[ 2253.777856] WARNING: possible circular locking dependency detected
[ 2253.777857] 5.5.0-0.rc5.git3.2.fc32.x86_64 #1 Not tainted
[ 2253.777857] ------------------------------------------------------
[ 2253.777858] WRRende~ckend#1/6583 is trying to acquire lock:
[ 2253.777858] ffffffffb866aa40 (console_owner){-.-.}, at:
console_unlock+0x197/0x5c0

[ 2253.777860] but task is already holding lock:
[ 2253.777861] ffff9a5a3b9ee798 (&(&pool->lock)->rlock){-.-.}, at:
show_workqueue_state.cold+0x7c/0x2d1

[ 2253.777863] which lock already depends on the new lock.


[ 2253.777864] the existing dependency chain (in reverse order) is:

[ 2253.777864] -> #1 (&(&pool->lock)->rlock){-.-.}:
[ 2253.777866]        _raw_spin_lock+0x31/0x80
[ 2253.777866]        __queue_work+0x36b/0x610
[ 2253.777866]        queue_work_on+0x85/0x90
[ 2253.777867]        soft_cursor+0x19f/0x220
[ 2253.777867]        bit_cursor+0x3d4/0x5f0
[ 2253.777868]        hide_cursor+0x2a/0x90
[ 2253.777868]        vt_console_print+0x3ef/0x400
[ 2253.777868]        console_unlock+0x41a/0x5c0
[ 2253.777869]        register_framebuffer+0x28f/0x300
[ 2253.777870]
__drm_fb_helper_initial_config_and_unlock+0x32e/0x4e0 [drm_kms_helper]
[ 2253.777870]        amdgpu_fbdev_init+0xbc/0xf0 [amdgpu]
[ 2253.777870]        amdgpu_device_init.cold+0x1674/0x1acc [amdgpu]
[ 2253.777871]        amdgpu_driver_load_kms+0x53/0x1a0 [amdgpu]
[ 2253.777871]        drm_dev_register+0x113/0x150 [drm]
[ 2253.777872]        amdgpu_pci_probe+0xec/0x150 [amdgpu]
[ 2253.777872]        local_pci_probe+0x42/0x80
[ 2253.777872]        pci_device_probe+0x107/0x1a0
[ 2253.777873]        really_probe+0x147/0x3c0
[ 2253.777873]        driver_probe_device+0xb6/0x100
[ 2253.777874]        device_driver_attach+0x53/0x60
[ 2253.777874]        __driver_attach+0x8c/0x150
[ 2253.777874]        bus_for_each_dev+0x7b/0xc0
[ 2253.777875]        bus_add_driver+0x150/0x1f0
[ 2253.777875]        driver_register+0x6c/0xc0
[ 2253.777875]        do_one_initcall+0x5d/0x2f0
[ 2253.777876]        do_init_module+0x5c/0x230
[ 2253.777876]        load_module+0x2400/0x2650
[ 2253.777877]        __do_sys_init_module+0x181/0x1b0
[ 2253.777877]        do_syscall_64+0x5c/0xa0
[ 2253.777877]        entry_SYSCALL_64_after_hwframe+0x49/0xbe

[ 2253.777878] -> #0 (console_owner){-.-.}:
[ 2253.777879]        __lock_acquire+0xe13/0x1a30
[ 2253.777880]        lock_acquire+0xa2/0x1b0
[ 2253.777880]        console_unlock+0x1f0/0x5c0
[ 2253.777880]        vprintk_emit+0x180/0x350
[ 2253.777881]        printk+0x58/0x6f
[ 2253.777881]        show_pwq+0x6c/0x298
[ 2253.777882]        show_workqueue_state.cold+0x91/0x2d1
[ 2253.777882]        wq_watchdog_timer_fn+0x1ba/0x240
[ 2253.777882]        call_timer_fn+0xaf/0x2c0
[ 2253.777883]        run_timer_softirq+0x3a0/0x5e0
[ 2253.777883]        __do_softirq+0xe1/0x45d
[ 2253.777884]        irq_exit+0xf7/0x100
[ 2253.777884]        smp_apic_timer_interrupt+0xa4/0x230
[ 2253.777884]        apic_timer_interrupt+0xf/0x20

[ 2253.777885] other info that might help us debug this:

[ 2253.777886]  Possible unsafe locking scenario:

[ 2253.777886]        CPU0                    CPU1
[ 2253.777887]        ----                    ----
[ 2253.777887]   lock(&(&pool->lock)->rlock);
[ 2253.777888]                                lock(console_owner);
[ 2253.777889]                                lock(&(&pool->lock)->rlock);
[ 2253.777890]   lock(console_owner);

[ 2253.777891]  *** DEADLOCK ***

[ 2253.777892] 4 locks held by WRRende~ckend#1/6583:
[ 2253.777892]  #0: ffffb53080003e68 ((&wq_watchdog_timer)){+.-.}, at:
call_timer_fn+0x5/0x2c0
[ 2253.777893]  #1: ffffffffb86959e0 (rcu_read_lock){....}, at:
show_workqueue_state+0x5/0xa0
[ 2253.777895]  #2: ffff9a5a3b9ee798 (&(&pool->lock)->rlock){-.-.},
at: show_workqueue_state.cold+0x7c/0x2d1
[ 2253.777897]  #3: ffffffffb866ad20 (console_lock){+.+.}, at:
vprintk_emit+0x177/0x350

[ 2253.777899] stack backtrace:
[ 2253.777899] CPU: 0 PID: 6583 Comm: WRRende~ckend#1 Not tainted
5.5.0-0.rc5.git3.2.fc32.x86_64 #1
[ 2253.777900] Hardware name: System manufacturer System Product
Name/ROG STRIX X570-I GAMING, BIOS 1405 11/19/2019
[ 2253.777900] Call Trace:
[ 2253.777901]  <IRQ>
[ 2253.777901]  dump_stack+0x8f/0xd0
[ 2253.777901]  check_noncircular+0x176/0x190
[ 2253.777902]  ? save_trace+0x39/0x2e0
[ 2253.777902]  __lock_acquire+0xe13/0x1a30
[ 2253.777902]  lock_acquire+0xa2/0x1b0
[ 2253.777903]  ? console_unlock+0x197/0x5c0
[ 2253.777903]  console_unlock+0x1f0/0x5c0
[ 2253.777903]  ? console_unlock+0x197/0x5c0
[ 2253.777904]  vprintk_emit+0x180/0x350
[ 2253.777904]  printk+0x58/0x6f
[ 2253.777904]  show_pwq+0x6c/0x298
[ 2253.777905]  show_workqueue_state.cold+0x91/0x2d1
[ 2253.777905]  wq_watchdog_timer_fn+0x1ba/0x240
[ 2253.777906]  ? show_workqueue_state+0xa0/0xa0
[ 2253.777906]  ? show_workqueue_state+0xa0/0xa0
[ 2253.777906]  call_timer_fn+0xaf/0x2c0
[ 2253.777907]  run_timer_softirq+0x3a0/0x5e0
[ 2253.777907]  ? sched_clock_cpu+0xc/0xc0
[ 2253.777907]  __do_softirq+0xe1/0x45d
[ 2253.777908]  irq_exit+0xf7/0x100
[ 2253.777908]  smp_apic_timer_interrupt+0xa4/0x230
[ 2253.777908]  apic_timer_interrupt+0xf/0x20
[ 2253.777909]  </IRQ>
[ 2253.777909] RIP: 0033:0x559252e02b10
[ 2253.777910] Code: 48 39 c1 72 14 48 8d b5 d0 f7 ff ff 48 89 df ba
01 00 00 00 e8 41 94 f8 ff 48 81 c4 18 08 00 00 5b 41 5e 41 5f 5d c3
0f 1f 00 <55> 4
[ 2253.777911] Lost 7 message(s)!
[ 2253.777983]   pwq 4: cpus=2 node=0 flags=0x0 nice=0 active=21/256 refcnt=22
[ 2253.777986]     pending: dbs_work_handler, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, free_obj_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work
[ 2253.778029] workqueue mm_percpu_wq: flags=0x8
[ 2253.778037]   pwq 4: cpus=2 node=0 flags=0x0 nice=0 active=1/256 refcnt=2
[ 2253.778040]     pending: vmstat_update
[ 2253.778126] pool 22: cpus=11 node=0 flags=0x0 nice=0 hung=0s
workers=4 idle: 7882 9625 9557
[ 2283.982347] BUG: workqueue lockup - pool cpus=2 node=0 flags=0x0
nice=0 stuck for 90s!
[ 2283.982361] Showing busy workqueues and worker pools:
[ 2283.982364] workqueue events: flags=0x0
[ 2283.982368]   pwq 44: cpus=22 node=0 flags=0x0 nice=0 active=1/256 refcnt=2
[ 2283.982373]     pending: dbs_work_handler
[ 2283.982382]   pwq 4: cpus=2 node=0 flags=0x0 nice=0 active=26/256 refcnt=27
[ 2283.982386]     pending: dbs_work_handler, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, free_obj_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work
[ 2283.982430] workqueue mm_percpu_wq: flags=0x8
[ 2283.982433]   pwq 44: cpus=22 node=0 flags=0x0 nice=0 active=1/256 refcnt=2
[ 2283.982437]     pending: vmstat_update
[ 2283.982445]   pwq 4: cpus=2 node=0 flags=0x0 nice=0 active=1/256 refcnt=2
[ 2283.982448]     pending: vmstat_update
[ 2314.191651] BUG: workqueue lockup - pool cpus=2 node=0 flags=0x0
nice=0 stuck for 120s!
[ 2314.191665] Showing busy workqueues and worker pools:
[ 2314.191670] workqueue events: flags=0x0
[ 2314.191678]   pwq 4: cpus=2 node=0 flags=0x0 nice=0 active=26/256 refcnt=27
[ 2314.191683]     pending: dbs_work_handler, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, free_obj_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work
[ 2314.191730] workqueue mm_percpu_wq: flags=0x8
[ 2314.191738]   pwq 4: cpus=2 node=0 flags=0x0 nice=0 active=1/256 refcnt=2
[ 2314.191742]     pending: vmstat_update
[ 2374.605265] BUG: workqueue lockup - pool cpus=2 node=0 flags=0x0
nice=0 stuck for 31s!
[ 2374.605278] Showing busy workqueues and worker pools:
[ 2374.605283] workqueue events: flags=0x0
[ 2374.605291]   pwq 4: cpus=2 node=0 flags=0x0 nice=0 active=28/256 refcnt=29
[ 2374.605295]     in-flight: 298:dbs_work_handler
[ 2374.605301]     pending: psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, free_obj_work,
psi_avgs_work
[ 2374.605343] workqueue mm_percpu_wq: flags=0x8
[ 2374.605350]   pwq 4: cpus=2 node=0 flags=0x0 nice=0 active=1/256 refcnt=2
[ 2374.605354]     pending: vmstat_update
[ 2374.605436] pool 4: cpus=2 node=0 flags=0x0 nice=0 hung=31s
workers=2 idle: 9755
[ 2435.023875] BUG: workqueue lockup - pool cpus=2 node=0 flags=0x0
nice=0 stuck for 51s!
[ 2435.023886] Showing busy workqueues and worker pools:
[ 2435.023891] workqueue events: flags=0x0
[ 2435.023898]   pwq 6: cpus=3 node=0 flags=0x0 nice=0 active=1/256 refcnt=2
[ 2435.023901]     in-flight: 10765:dbs_work_handler
[ 2435.023907]   pwq 4: cpus=2 node=0 flags=0x0 nice=0 active=37/256 refcnt=38
[ 2435.023910]     pending: dbs_work_handler, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, free_obj_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work
[ 2435.023953] workqueue mm_percpu_wq: flags=0x8
[ 2435.023960]   pwq 4: cpus=2 node=0 flags=0x0 nice=0 active=1/256 refcnt=2
[ 2435.023963]     pending: vmstat_update
[ 2465.238181] BUG: workqueue lockup - pool cpus=2 node=0 flags=0x0
nice=0 stuck for 81s!
[ 2465.238195] Showing busy workqueues and worker pools:
[ 2465.238200] workqueue events: flags=0x0
[ 2465.238209]   pwq 4: cpus=2 node=0 flags=0x0 nice=0 active=40/256 refcnt=41
[ 2465.238213]     pending: dbs_work_handler, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, free_obj_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work
[ 2465.238265] workqueue mm_percpu_wq: flags=0x8
[ 2465.238273]   pwq 4: cpus=2 node=0 flags=0x0 nice=0 active=1/256 refcnt=2
[ 2465.238276]     pending: vmstat_update
[ 2494.148975] sysrq: Emergency Sync
[ 2494.157232] Emergency Sync complete
[ 2495.439516] BUG: workqueue lockup - pool cpus=2 node=0 flags=0x0
nice=0 stuck for 111s!
[ 2495.439524] Showing busy workqueues and worker pools:
[ 2495.439528] workqueue events: flags=0x0
[ 2495.439534]   pwq 4: cpus=2 node=0 flags=0x0 nice=0 active=40/256 refcnt=41
[ 2495.439536]     pending: dbs_work_handler, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, free_obj_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work, psi_avgs_work, psi_avgs_work,
psi_avgs_work, psi_avgs_work
[ 2495.439573] workqueue mm_percpu_wq: flags=0x8
[ 2495.439578]   pwq 4: cpus=2 node=0 flags=0x0 nice=0 active=1/256 refcnt=2
[ 2495.439580]     pending: vmstat_update
[ 2497.564944] sysrq: Show Blocked State
[ 2497.564949]   task                        PC stack   pid father
[ 2517.692797] sysrq: Emergency Sync
[ 2517.700952] Emergency Sync complete


I know WARNING messages about "possible circular locking dependency
detected" usually ignored by the kernel developers.
But today is not a usual case, because I  got the reproducible hang on
my system. After reboot, I repeated the copy-paste action with the
large text block again and reproduce the hang.

From the trace, I see that here is culprit the amdgpu driver, please
correct me if I am wrong.

Full kernel log is here: https://pastebin.com/7Qvm6qDm

--
Best Regards,
Mike Gavrilov.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
