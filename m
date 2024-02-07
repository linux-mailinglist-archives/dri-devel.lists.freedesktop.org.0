Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7A084C12C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 01:07:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED32C112F9D;
	Wed,  7 Feb 2024 00:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E034112F9C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 00:07:34 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-7c3dc0c28aeso4754539f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 16:07:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707264449; x=1707869249;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OEF1tKQoR2J3woTag73sOwwH7baxXxEr34WqP9038pg=;
 b=nqCGkpAyNHlz4tY+SAmK5hPnMvpJ1mVtlk4Z+tCff96fOnQlC4JSUA3h8iI2JWawEf
 mcpghaSFCdQfSjp40IGNE///7H1vM1TazHa9cUKXygLEYh2Gdl073A+7fGRpSzqYhpxc
 W0/bgNpnBpsLMiogDFuG38WT0PZkSJNBHpB2/3klm17BRxQ7ZxPqIVU5Wbpvfp33mgdX
 xMC6I1g6CFoW3oNynAfxusNjKSWI6PGu7lkIT6gSCFHXQJ2kfmT4TuKbBwg0kufnK7IC
 d6YcfWGkTzJU/+GS5DtHrH/hhAGKO8OBGq1hA37pDgFw2OOqzps/AAdbt3OLf7+jw1Yk
 xxGQ==
X-Gm-Message-State: AOJu0YyJf7fYTg7B+BiPoJxf5vyHLbbtVjoKVplzmk3HXlUb/chppyHB
 lNqBC+JmhPFF9Dv8dNZ4MK7l8W1EteVv3m9gHpUJaGDpbp2jbMjiPbCTuEmWCP1DYNVI9rS1/cN
 fcJdw1sauKBQSe3lYFFiosZLzzbEO3ndltQqRg1CxChRHF9EsZn/eMv8=
X-Google-Smtp-Source: AGHT+IFG5NSDC+h42rp1GTbwW/E6K5b3F2dv0r7w0pkLfSL+5ZlsjoFnWtxwdMjaBhcrohwkoPjYFWEfTOMWyHaK4e9ZY8sx5o/e
MIME-Version: 1.0
X-Received: by 2002:a05:6638:35ac:b0:471:cde:78e with SMTP id
 v44-20020a05663835ac00b004710cde078emr75269jal.3.1707264449265; Tue, 06 Feb
 2024 16:07:29 -0800 (PST)
Date: Tue, 06 Feb 2024 16:07:29 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000946190610bf7bd5@google.com>
Subject: [syzbot] [dri?] [media?] inconsistent lock state in valid_state (2)
From: syzbot <syzbot+a225ee3df7e7f9372dbe@syzkaller.appspotmail.com>
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

HEAD commit:    021533194476 Kconfig: Disable -Wstringop-overflow for GCC ..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10a82db0180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=457249c250b93697
dashboard link: https://syzkaller.appspot.com/bug?extid=a225ee3df7e7f9372dbe
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/da8c6426660d/disk-02153319.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a866aaa09be9/vmlinux-02153319.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4a5680d805d7/bzImage-02153319.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a225ee3df7e7f9372dbe@syzkaller.appspotmail.com

================================
WARNING: inconsistent lock state
6.8.0-rc2-syzkaller-00199-g021533194476 #0 Not tainted
--------------------------------
inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
syz-executor.4/9508 [HC0[0]:SC0[0]:HE0:SE1] takes:
ffffffff8ea8c5d8 (sync_timeline_list_lock){?...}-{2:2}, at: spin_lock_irq include/linux/spinlock.h:376 [inline]
ffffffff8ea8c5d8 (sync_timeline_list_lock){?...}-{2:2}, at: sync_info_debugfs_show+0x94/0x4d0 drivers/dma-buf/sync_debug.c:147
{IN-HARDIRQ-W} state was registered at:
  lock_acquire+0x1e3/0x530 kernel/locking/lockdep.c:5754
  __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
  _raw_spin_lock_irqsave+0xd5/0x120 kernel/locking/spinlock.c:162
  sync_timeline_debug_remove+0x2c/0x150 drivers/dma-buf/sync_debug.c:31
  sync_timeline_free drivers/dma-buf/sw_sync.c:125 [inline]
  kref_put include/linux/kref.h:65 [inline]
  sync_timeline_put drivers/dma-buf/sw_sync.c:137 [inline]
  timeline_fence_release+0x204/0x250 drivers/dma-buf/sw_sync.c:165
  kref_put include/linux/kref.h:65 [inline]
  dma_fence_put include/linux/dma-fence.h:297 [inline]
  dma_fence_array_release+0x13e/0x240 drivers/dma-buf/dma-fence-array.c:120
  irq_work_single+0xe1/0x240 kernel/irq_work.c:221
  irq_work_run_list kernel/irq_work.c:252 [inline]
  irq_work_run+0x18b/0x350 kernel/irq_work.c:261
  __sysvec_irq_work+0xa8/0x3e0 arch/x86/kernel/irq_work.c:22
  sysvec_irq_work+0x8f/0xb0 arch/x86/kernel/irq_work.c:17
  asm_sysvec_irq_work+0x1a/0x20 arch/x86/include/asm/idtentry.h:674
  __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:160 [inline]
  _raw_spin_unlock_irq+0x29/0x50 kernel/locking/spinlock.c:202
  spin_unlock_irq include/linux/spinlock.h:401 [inline]
  sw_sync_debugfs_release+0x14b/0x1d0 drivers/dma-buf/sw_sync.c:359
  __fput+0x429/0x8a0 fs/file_table.c:376
  task_work_run+0x24e/0x310 kernel/task_work.c:180
  exit_task_work include/linux/task_work.h:38 [inline]
  do_exit+0xa2c/0x2740 kernel/exit.c:871
  do_group_exit+0x206/0x2c0 kernel/exit.c:1020
  __do_sys_exit_group kernel/exit.c:1031 [inline]
  __se_sys_exit_group kernel/exit.c:1029 [inline]
  __x64_sys_exit_group+0x3f/0x40 kernel/exit.c:1029
  do_syscall_64+0xf9/0x240
  entry_SYSCALL_64_after_hwframe+0x6f/0x77
irq event stamp: 364
hardirqs last  enabled at (363): [<ffffffff8b710daf>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
hardirqs last  enabled at (363): [<ffffffff8b710daf>] _raw_spin_unlock_irqrestore+0x8f/0x140 kernel/locking/spinlock.c:194
hardirqs last disabled at (364): [<ffffffff8b710bdd>] __raw_spin_lock_irq include/linux/spinlock_api_smp.h:117 [inline]
hardirqs last disabled at (364): [<ffffffff8b710bdd>] _raw_spin_lock_irq+0xad/0x120 kernel/locking/spinlock.c:170
softirqs last  enabled at (0): [<ffffffff8156a0f3>] rcu_lock_acquire include/linux/rcupdate.h:298 [inline]
softirqs last  enabled at (0): [<ffffffff8156a0f3>] rcu_read_lock include/linux/rcupdate.h:750 [inline]
softirqs last  enabled at (0): [<ffffffff8156a0f3>] copy_process+0x9c3/0x3fc0 kernel/fork.c:2366
softirqs last disabled at (0): [<0000000000000000>] 0x0

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(sync_timeline_list_lock);
  <Interrupt>
    lock(sync_timeline_list_lock);

 *** DEADLOCK ***

3 locks held by syz-executor.4/9508:
 #0: ffff888086cd7748 (&f->f_pos_lock){+.+.}-{3:3}, at: __fdget_pos+0x258/0x320 fs/file.c:1191
 #1: ffff88801f9c8448 (&p->lock){+.+.}-{3:3}, at: seq_read_iter+0xb7/0xd60 fs/seq_file.c:182
 #2: ffffffff8ea8c5d8 (sync_timeline_list_lock){?...}-{2:2}, at: spin_lock_irq include/linux/spinlock.h:376 [inline]
 #2: ffffffff8ea8c5d8 (sync_timeline_list_lock){?...}-{2:2}, at: sync_info_debugfs_show+0x94/0x4d0 drivers/dma-buf/sync_debug.c:147

stack backtrace:
CPU: 0 PID: 9508 Comm: syz-executor.4 Not tainted 6.8.0-rc2-syzkaller-00199-g021533194476 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/25/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1e7/0x2e0 lib/dump_stack.c:106
 valid_state+0x13a/0x1c0 kernel/locking/lockdep.c:4013
 mark_lock_irq+0xbb/0xc20 kernel/locking/lockdep.c:4216
 mark_lock+0x223/0x350 kernel/locking/lockdep.c:4678
 mark_held_locks kernel/locking/lockdep.c:4274 [inline]
 __trace_hardirqs_on_caller kernel/locking/lockdep.c:4292 [inline]
 lockdep_hardirqs_on_prepare+0x281/0x780 kernel/locking/lockdep.c:4359
 trace_hardirqs_on+0x28/0x40 kernel/trace/trace_preemptirq.c:61
 __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:159 [inline]
 _raw_spin_unlock_irq+0x23/0x50 kernel/locking/spinlock.c:202
 spin_unlock_irq include/linux/spinlock.h:401 [inline]
 sync_print_obj drivers/dma-buf/sync_debug.c:118 [inline]
 sync_info_debugfs_show+0x158/0x4d0 drivers/dma-buf/sync_debug.c:153
 seq_read_iter+0x445/0xd60 fs/seq_file.c:230
 seq_read+0x3a3/0x4f0 fs/seq_file.c:162
 vfs_read+0x204/0xb70 fs/read_write.c:474
 ksys_read+0x1a0/0x2c0 fs/read_write.c:619
 do_syscall_64+0xf9/0x240
 entry_SYSCALL_64_after_hwframe+0x6f/0x77
RIP: 0033:0x7fc881e7dda9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 e1 20 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fc882b390c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 00007fc881fabf80 RCX: 00007fc881e7dda9
RDX: 0000000000002020 RSI: 0000000020001b00 RDI: 0000000000000006
RBP: 00007fc881eca47a R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 000000000000000b R14: 00007fc881fabf80 R15: 00007fc8820cfa48
 </TASK>


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
