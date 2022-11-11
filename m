Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61877625936
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 12:19:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC51610E087;
	Fri, 11 Nov 2022 11:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD26910E087
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 11:18:56 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id
 f2-20020a5ec602000000b006dc67829888so2925609iok.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 03:18:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ydVooePxmDrHayJC7VSqE+6bvJCgNaAZis4ZNWJBQpI=;
 b=BhUCGkk2avrwxbnBezuPQ6T8ypFfdVVq+sig+LuSA729mpTB1kJb5Q3RWHTAktnfwR
 grA54j4+C8BxMhVRvecXKY6ElZeQ8E4ZkBsbesYcDBODTrBiGfmd79ZPahdXF3lS7P7V
 3m5t5Lkg0TeGI1CRrLpdJ/fwj0zGJiNIYDf//QAk7NMwjrdHFGh65hN1dOB+spANwVr5
 NaXVTzfk5nYK4dnQyyhw5oIKoJMW5iDxNyv/jgTMY5pudJi0pU0d2CKtmP+2vLP2hI+C
 noNvM/nGeCAKmXlBi3cD8w2Pn6NTiQr0N7TEoL8HkNQ3UtWfAthn6Miz9VwWaQEn1jHB
 vedQ==
X-Gm-Message-State: ANoB5plNdiaXMliYim+RLU3tBUqzdf23uHAVrbWc6CeRnfDS5riM5sYz
 I0iLxiJn9hqv+6wX8HClqnLQteMSsmWkm2Zk2oG34xGJy1RU
X-Google-Smtp-Source: AA0mqf7OzarPms6yOizs00yfd8/BLnWlraeFLHqq5NrrCa+o9KN2bB3b/Jv0GPVBWwYvPrkNaOqwNEmy0qpKCiOz4sOCKpk5v1Ux
MIME-Version: 1.0
X-Received: by 2002:a02:8792:0:b0:363:bb1f:7a03 with SMTP id
 t18-20020a028792000000b00363bb1f7a03mr540230jai.16.1668165536040; Fri, 11 Nov
 2022 03:18:56 -0800 (PST)
Date: Fri, 11 Nov 2022 03:18:56 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000033d0f205ed300e3b@google.com>
Subject: [syzbot] inconsistent lock state in trace_hardirqs_on
From: syzbot <syzbot+6d6c13e35721fb4393fd@syzkaller.appspotmail.com>
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

HEAD commit:    bbed346d5a96 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=14c82f39880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3a4a45d2d827c1e
dashboard link: https://syzkaller.appspot.com/bug?extid=6d6c13e35721fb4393fd
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e8e91bc79312/disk-bbed346d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c1cb3fb3b77e/vmlinux-bbed346d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6d6c13e35721fb4393fd@syzkaller.appspotmail.com

================================
WARNING: inconsistent lock state
6.0.0-rc7-syzkaller-18095-gbbed346d5a96 #0 Not tainted
--------------------------------
inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
syz-executor.4/21937 [HC0[0]:SC0[0]:HE0:SE1] takes:
ffff80000d6384c8 (sync_timeline_list_lock){?...}-{2:2}, at: spin_lock_irq include/linux/spinlock.h:374 [inline]
ffff80000d6384c8 (sync_timeline_list_lock){?...}-{2:2}, at: sync_info_debugfs_show+0x54/0x2dc drivers/dma-buf/sync_debug.c:147
{IN-HARDIRQ-W} state was registered at:
  lock_acquire+0x100/0x1f8 kernel/locking/lockdep.c:5666
  __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
  _raw_spin_lock_irqsave+0x6c/0xb4 kernel/locking/spinlock.c:162
  sync_timeline_debug_remove+0x24/0x80 drivers/dma-buf/sync_debug.c:31
  sync_timeline_free drivers/dma-buf/sw_sync.c:104 [inline]
  kref_put include/linux/kref.h:65 [inline]
  sync_timeline_put drivers/dma-buf/sw_sync.c:116 [inline]
  timeline_fence_release+0xe0/0x15c drivers/dma-buf/sw_sync.c:144
  dma_fence_release+0x70/0x11c drivers/dma-buf/dma-fence.c:549
  kref_put include/linux/kref.h:65 [inline]
  dma_fence_put include/linux/dma-fence.h:276 [inline]
  dma_fence_array_release+0xac/0x154 drivers/dma-buf/dma-fence-array.c:120
  dma_fence_release+0x70/0x11c drivers/dma-buf/dma-fence.c:549
  kref_put include/linux/kref.h:65 [inline]
  dma_fence_put include/linux/dma-fence.h:276 [inline]
  irq_dma_fence_array_work+0x84/0x11c drivers/dma-buf/dma-fence-array.c:52
  irq_work_single kernel/irq_work.c:211 [inline]
  irq_work_run_list kernel/irq_work.c:242 [inline]
  irq_work_run+0xc4/0x29c kernel/irq_work.c:251
  do_handle_IPI arch/arm64/kernel/smp.c:899 [inline]
  ipi_handler+0x120/0x1a8 arch/arm64/kernel/smp.c:922
  handle_percpu_devid_irq+0xb0/0x1c8 kernel/irq/chip.c:930
  generic_handle_irq_desc include/linux/irqdesc.h:158 [inline]
  handle_irq_desc kernel/irq/irqdesc.c:648 [inline]
  generic_handle_domain_irq+0x4c/0x6c kernel/irq/irqdesc.c:704
  __gic_handle_irq drivers/irqchip/irq-gic-v3.c:695 [inline]
  __gic_handle_irq_from_irqson drivers/irqchip/irq-gic-v3.c:746 [inline]
  gic_handle_irq+0x78/0x1b4 drivers/irqchip/irq-gic-v3.c:790
  call_on_irq_stack+0x2c/0x54 arch/arm64/kernel/entry.S:889
  do_interrupt_handler+0x7c/0xc0 arch/arm64/kernel/entry-common.c:274
  __el1_irq arch/arm64/kernel/entry-common.c:470 [inline]
  el1_interrupt+0x34/0x68 arch/arm64/kernel/entry-common.c:485
  el1h_64_irq_handler+0x18/0x24 arch/arm64/kernel/entry-common.c:490
  el1h_64_irq+0x64/0x68 arch/arm64/kernel/entry.S:577
  arch_local_irq_enable arch/arm64/include/asm/irqflags.h:35 [inline]
  __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:159 [inline]
  _raw_spin_unlock_irq+0x44/0x70 kernel/locking/spinlock.c:202
  spin_unlock_irq include/linux/spinlock.h:399 [inline]
  sw_sync_debugfs_release+0xa8/0x158 drivers/dma-buf/sw_sync.c:321
  __fput+0x198/0x3dc fs/file_table.c:320
  ____fput+0x20/0x30 fs/file_table.c:353
  task_work_run+0xc4/0x14c kernel/task_work.c:177
  exit_task_work include/linux/task_work.h:38 [inline]
  do_exit+0x26c/0xbe0 kernel/exit.c:795
  __arm64_sys_exit_group+0x0/0x18 kernel/exit.c:925
  __do_sys_exit_group kernel/exit.c:936 [inline]
  __se_sys_exit_group kernel/exit.c:934 [inline]
  __wake_up_parent+0x0/0x40 kernel/exit.c:934
  __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
  invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
  el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
  do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
  el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:636
  el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:654
  el0t_64_sync+0x18c/0x190 arch/arm64/kernel/entry.S:581
irq event stamp: 872
hardirqs last  enabled at (871): [<ffff8000085633bc>] mod_objcg_state+0x19c/0x204 mm/memcontrol.c:3158
hardirqs last disabled at (872): [<ffff80000bfc8834>] __raw_spin_lock_irq include/linux/spinlock_api_smp.h:117 [inline]
hardirqs last disabled at (872): [<ffff80000bfc8834>] _raw_spin_lock_irq+0x34/0x9c kernel/locking/spinlock.c:170
softirqs last  enabled at (856): [<ffff80000801c33c>] local_bh_enable+0x10/0x34 include/linux/bottom_half.h:32
softirqs last disabled at (854): [<ffff80000801c308>] local_bh_disable+0x10/0x34 include/linux/bottom_half.h:19

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(sync_timeline_list_lock);
  <Interrupt>
    lock(sync_timeline_list_lock);

 *** DEADLOCK ***

3 locks held by syz-executor.4/21937:
 #0: ffff000128868ee8 (&f->f_pos_lock){+.+.}-{3:3}, at: __fdget_pos+0x12c/0x154 fs/file.c:1036
 #1: ffff000126e66d50 (&p->lock){+.+.}-{3:3}, at: seq_read_iter+0x5c/0x5e0 fs/seq_file.c:182
 #2: ffff80000d6384c8 (sync_timeline_list_lock){?...}-{2:2}, at: spin_lock_irq include/linux/spinlock.h:374 [inline]
 #2: ffff80000d6384c8 (sync_timeline_list_lock){?...}-{2:2}, at: sync_info_debugfs_show+0x54/0x2dc drivers/dma-buf/sync_debug.c:147

stack backtrace:
CPU: 0 PID: 21937 Comm: syz-executor.4 Not tainted 6.0.0-rc7-syzkaller-18095-gbbed346d5a96 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/30/2022
Call trace:
 dump_backtrace+0x1c4/0x1f0 arch/arm64/kernel/stacktrace.c:156
 show_stack+0x2c/0x54 arch/arm64/kernel/stacktrace.c:163
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x104/0x16c lib/dump_stack.c:106
 dump_stack+0x1c/0x58 lib/dump_stack.c:113
 print_usage_bug+0x39c/0x3cc kernel/locking/lockdep.c:3961
 mark_lock_irq+0x4a8/0x4b4
 mark_lock+0x154/0x1b4 kernel/locking/lockdep.c:4632
 mark_held_locks kernel/locking/lockdep.c:4234 [inline]
 __trace_hardirqs_on_caller kernel/locking/lockdep.c:4252 [inline]
 lockdep_hardirqs_on_prepare+0x158/0x2b0 kernel/locking/lockdep.c:4319
 trace_hardirqs_on+0xc4/0x108 kernel/trace/trace_preemptirq.c:49
 __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:159 [inline]
 _raw_spin_unlock_irq+0x3c/0x70 kernel/locking/spinlock.c:202
 spin_unlock_irq include/linux/spinlock.h:399 [inline]
 sync_print_obj drivers/dma-buf/sync_debug.c:118 [inline]
 sync_info_debugfs_show+0xd8/0x2dc drivers/dma-buf/sync_debug.c:153
 seq_read_iter+0x220/0x5e0 fs/seq_file.c:230
 seq_read+0x98/0xd0 fs/seq_file.c:162
 vfs_read+0x19c/0x448 fs/read_write.c:468
 ksys_read+0xb4/0x160 fs/read_write.c:607
 __do_sys_read fs/read_write.c:617 [inline]
 __se_sys_read fs/read_write.c:615 [inline]
 __arm64_sys_read+0x24/0x34 fs/read_write.c:615
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
 el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:636
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:654
 el0t_64_sync+0x18c/0x190 arch/arm64/kernel/entry.S:581


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
