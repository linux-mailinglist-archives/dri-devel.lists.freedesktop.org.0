Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E818F62FAEB
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 17:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E607A10E782;
	Fri, 18 Nov 2022 16:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360F210E782
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 16:59:35 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id
 r197-20020a6b8fce000000b006c3fc33424dso2891958iod.5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 08:59:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nAIdMdH6463NYNaPvuJ0GXj9BIsXOzOnZz/otTIkUpI=;
 b=hk5yIhMCorQg+RsvIaBvpi3NT/KDQa9DI528YIcRRucn+l9isQ8cpiRcI7HnR5WP8o
 1G/bMeqoIaoB+c4qBu13RoEqLDygv3RlZ85J7oKvvrNTEETAhmS0vKHOqU0sKk8+14Wb
 iui60JtLR02xr8I9queZeyXOOvF00je5GkDLbEh8x+nYVaQ/0apQH7sUaWrC+rZ9ZKz0
 BX2pjREad59IY1e22d9nv6qDziGmocq8CXjAa50d5/c9MGQFCtZnCmRv5lcBlVoXk1ZV
 iFMqQQC5QFq3Qb1M1JQt4q1gzIZmfjgrCGTFwG833FvVAhhGgo8KUpIUNjpK88Ro+QTZ
 i+pA==
X-Gm-Message-State: ANoB5plXoF4j1cOFaSG1cLDymqFyOxT0MvFtUlyPLtJroBM0uCeouiQM
 I7SAkvyUikgPTpvmX2973Yie1PvLtexJ+3wxUeK5TLrkv/ot
X-Google-Smtp-Source: AA0mqf4eMGC4h077PAYfrXpiQAO7bkeIqqllFOnuyEGCosBdaZUnTPahU6GN6NI4i6l/1SOnOTRVEgt3wi0uht3EIKTHOD04/7e6
MIME-Version: 1.0
X-Received: by 2002:a02:c6d1:0:b0:375:5b8d:e565 with SMTP id
 r17-20020a02c6d1000000b003755b8de565mr3564635jan.121.1668790774497; Fri, 18
 Nov 2022 08:59:34 -0800 (PST)
Date: Fri, 18 Nov 2022 08:59:34 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000518bf005edc1a1c2@google.com>
Subject: [syzbot] inconsistent lock state in mark_held_locks
From: syzbot <syzbot+65422ff0767f378aacfb@syzkaller.appspotmail.com>
To: christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
 gustavo@padovan.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com
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

HEAD commit:    e01d50cbd6ee Merge tag 'vfio-v6.1-rc6' of https://github.c..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=145f6401880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e9039cbe1d7613aa
dashboard link: https://syzkaller.appspot.com/bug?extid=65422ff0767f378aacfb
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/43fe73693a6c/disk-e01d50cb.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/35e1240adbc1/vmlinux-e01d50cb.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3b532cce5d0b/bzImage-e01d50cb.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+65422ff0767f378aacfb@syzkaller.appspotmail.com

================================
WARNING: inconsistent lock state
6.1.0-rc5-syzkaller-00008-ge01d50cbd6ee #0 Not tainted
--------------------------------
inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
syz-executor.4/7818 [HC0[0]:SC0[0]:HE0:SE1] takes:
ffffffff8cb76bb8 (sync_timeline_list_lock){?...}-{2:2}, at: spin_lock_irq include/linux/spinlock.h:375 [inline]
ffffffff8cb76bb8 (sync_timeline_list_lock){?...}-{2:2}, at: sync_info_debugfs_show+0x2d/0x200 drivers/dma-buf/sync_debug.c:147
{IN-HARDIRQ-W} state was registered at:
  lock_acquire kernel/locking/lockdep.c:5668 [inline]
  lock_acquire+0x1df/0x630 kernel/locking/lockdep.c:5633
  __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
  _raw_spin_lock_irqsave+0x39/0x50 kernel/locking/spinlock.c:162
  sync_timeline_debug_remove+0x25/0x190 drivers/dma-buf/sync_debug.c:31
  sync_timeline_free drivers/dma-buf/sw_sync.c:104 [inline]
  kref_put include/linux/kref.h:65 [inline]
  sync_timeline_put drivers/dma-buf/sw_sync.c:116 [inline]
  timeline_fence_release+0x263/0x340 drivers/dma-buf/sw_sync.c:144
  dma_fence_release+0x147/0x680 drivers/dma-buf/dma-fence.c:559
  kref_put include/linux/kref.h:65 [inline]
  dma_fence_put include/linux/dma-fence.h:276 [inline]
  dma_fence_array_release+0x1f6/0x2d0 drivers/dma-buf/dma-fence-array.c:120
  dma_fence_release+0x147/0x680 drivers/dma-buf/dma-fence.c:559
  kref_put include/linux/kref.h:65 [inline]
  dma_fence_put include/linux/dma-fence.h:276 [inline]
  irq_dma_fence_array_work+0xa5/0xd0 drivers/dma-buf/dma-fence-array.c:52
  irq_work_single+0x120/0x250 kernel/irq_work.c:211
  irq_work_run_list kernel/irq_work.c:242 [inline]
  irq_work_run_list+0x91/0xc0 kernel/irq_work.c:225
  irq_work_run+0x54/0xd0 kernel/irq_work.c:251
  __sysvec_irq_work+0xca/0x4d0 arch/x86/kernel/irq_work.c:22
  sysvec_irq_work+0x8e/0xc0 arch/x86/kernel/irq_work.c:17
  asm_sysvec_irq_work+0x16/0x20 arch/x86/include/asm/idtentry.h:675
  __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:160 [inline]
  _raw_spin_unlock_irq+0x25/0x40 kernel/locking/spinlock.c:202
  spin_unlock_irq include/linux/spinlock.h:400 [inline]
  sw_sync_debugfs_release+0x15e/0x230 drivers/dma-buf/sw_sync.c:321
  __fput+0x27c/0xa90 fs/file_table.c:320
  task_work_run+0x16b/0x270 kernel/task_work.c:179
  exit_task_work include/linux/task_work.h:38 [inline]
  do_exit+0xb35/0x2a20 kernel/exit.c:820
  do_group_exit+0xd0/0x2a0 kernel/exit.c:950
  get_signal+0x21a1/0x2430 kernel/signal.c:2858
  arch_do_signal_or_restart+0x82/0x2300 arch/x86/kernel/signal.c:869
  exit_to_user_mode_loop kernel/entry/common.c:168 [inline]
  exit_to_user_mode_prepare+0x15f/0x250 kernel/entry/common.c:203
  __syscall_exit_to_user_mode_work kernel/entry/common.c:285 [inline]
  syscall_exit_to_user_mode+0x19/0x50 kernel/entry/common.c:296
  ret_from_fork+0x15/0x30 arch/x86/entry/entry_64.S:299
irq event stamp: 288
hardirqs last  enabled at (287): [<ffffffff81d0a451>] mod_objcg_state+0x591/0xa50 mm/memcontrol.c:3213
hardirqs last disabled at (288): [<ffffffff89922691>] __raw_spin_lock_irq include/linux/spinlock_api_smp.h:117 [inline]
hardirqs last disabled at (288): [<ffffffff89922691>] _raw_spin_lock_irq+0x41/0x50 kernel/locking/spinlock.c:170
softirqs last  enabled at (0): [<ffffffff8146e349>] copy_process+0x2129/0x7190 kernel/fork.c:2198
softirqs last disabled at (0): [<0000000000000000>] 0x0

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(sync_timeline_list_lock);
  <Interrupt>
    lock(sync_timeline_list_lock);

 *** DEADLOCK ***

3 locks held by syz-executor.4/7818:
 #0: ffff8880412b59e8 (&f->f_pos_lock){+.+.}-{3:3}, at: __fdget_pos+0xe3/0x100 fs/file.c:1037
 #1: ffff888017a97418 (&p->lock){+.+.}-{3:3}, at: seq_read_iter+0xdf/0x1280 fs/seq_file.c:182
 #2: ffffffff8cb76bb8 (sync_timeline_list_lock){?...}-{2:2}, at: spin_lock_irq include/linux/spinlock.h:375 [inline]
 #2: ffffffff8cb76bb8 (sync_timeline_list_lock){?...}-{2:2}, at: sync_info_debugfs_show+0x2d/0x200 drivers/dma-buf/sync_debug.c:147

stack backtrace:
CPU: 0 PID: 7818 Comm: syz-executor.4 Not tainted 6.1.0-rc5-syzkaller-00008-ge01d50cbd6ee #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_usage_bug kernel/locking/lockdep.c:3963 [inline]
 valid_state kernel/locking/lockdep.c:3975 [inline]
 mark_lock_irq kernel/locking/lockdep.c:4178 [inline]
 mark_lock.part.0.cold+0x18/0xd8 kernel/locking/lockdep.c:4634
 mark_lock kernel/locking/lockdep.c:4598 [inline]
 mark_held_locks+0x9f/0xe0 kernel/locking/lockdep.c:4236
 __trace_hardirqs_on_caller kernel/locking/lockdep.c:4254 [inline]
 lockdep_hardirqs_on_prepare kernel/locking/lockdep.c:4321 [inline]
 lockdep_hardirqs_on_prepare+0x135/0x400 kernel/locking/lockdep.c:4273
 trace_hardirqs_on+0x2d/0x160 kernel/trace/trace_preemptirq.c:49
 __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:159 [inline]
 _raw_spin_unlock_irq+0x1f/0x40 kernel/locking/spinlock.c:202
 spin_unlock_irq include/linux/spinlock.h:400 [inline]
 sync_print_obj drivers/dma-buf/sync_debug.c:118 [inline]
 sync_info_debugfs_show+0xeb/0x200 drivers/dma-buf/sync_debug.c:153
 seq_read_iter+0x4f5/0x1280 fs/seq_file.c:230
 seq_read+0x16d/0x210 fs/seq_file.c:162
 vfs_read+0x257/0x930 fs/read_write.c:468
 ksys_read+0x127/0x250 fs/read_write.c:613
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f8c5028b639
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f8c4f5ff168 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 00007f8c503ac1f0 RCX: 00007f8c5028b639
RDX: 0000000000002020 RSI: 0000000020001a00 RDI: 000000000000000b
RBP: 00007f8c502e6ae9 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f8c504cfb1f R14: 00007f8c4f5ff300 R15: 0000000000022000
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
