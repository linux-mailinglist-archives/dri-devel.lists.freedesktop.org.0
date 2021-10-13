Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9115442C7BC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 19:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5173E6EA66;
	Wed, 13 Oct 2021 17:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367186EA68
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 16:51:24 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id
 k20-20020a5d97d4000000b005da6f3b7dc7so288138ios.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 09:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=aljqd/llVrGPRpRCQdaAFVs7OepeuWm3WekPI8dhI8Y=;
 b=oAwNj/F/1vTo9tnQu9mdIQbYT/0dnxGmmEREvgMhwWvbb9VBXijkyT4/P7GKDYjWrY
 7bayNrSyeSyn+bF1rNOA5A1kU51jA/mKIsaaGuvZ9QUjN5R/WnPQkpd3FakCvYQEs8/p
 +rCrhVHEGgV/SR2nD+s8XXsDLcZSOp12PjMn7A+eb9SsbucUSe0L03XqpL7LKkDihOor
 p/IeUM4Zu9I1jCTcWa66LRa9MjTyWyxPFAyEAJCrahqPJhk+zTTY1TnnhiPTRRvNKmD2
 8hZDOTQH66ADWNAMgShF515lGpWt8XY9J5+06Y0D6VB6+dbOak+kE9diYHx//xJo6Xcj
 b//g==
X-Gm-Message-State: AOAM530qBa/baE1FXCa9bg05wN5PwI9xljHKnv8esqx0l8L6MA3cF/Pb
 a7AXkOEG8iyA8O1u+5FzE89CoxJ8Hl1joAU3lV3sLxPWD6qb
X-Google-Smtp-Source: ABdhPJxK2KFKjAUHFgSXAhmFiYJC2f/9W0MLsXX82FztEyiueTmy96qj/Ze4lmTd/2beJheUsOmQmDP8owN7SvhJ1WakVv8Xxkgs
MIME-Version: 1.0
X-Received: by 2002:a6b:b48b:: with SMTP id d133mr331015iof.12.1634143883531; 
 Wed, 13 Oct 2021 09:51:23 -0700 (PDT)
Date: Wed, 13 Oct 2021 09:51:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b0a1a605ce3ec5ad@google.com>
Subject: [syzbot] general protection fault in sg_alloc_append_table_from_pages
From: syzbot <syzbot+2c56b725ec547fa9cb29@syzkaller.appspotmail.com>
To: christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
 gurchetansingh@chromium.org, kraxel@redhat.com, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
 syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 13 Oct 2021 17:35:42 +0000
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

HEAD commit:    717478d89fe2 Merge tag 'riscv-for-linus-5.15-rc5' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12489abf300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=32e6048063923b7b
dashboard link: https://syzkaller.appspot.com/bug?extid=2c56b725ec547fa9cb29
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=167b9e4f300000

The issue was bisected to:

commit 284562e1f34874e267d4f499362c3816f8f6bc3f
Author: Gurchetan Singh <gurchetansingh@chromium.org>
Date:   Tue Dec 3 01:36:27 2019 +0000

    udmabuf: implement begin_cpu_access/end_cpu_access hooks

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12d68447300000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=11d68447300000
console output: https://syzkaller.appspot.com/x/log.txt?x=16d68447300000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2c56b725ec547fa9cb29@syzkaller.appspotmail.com
Fixes: 284562e1f348 ("udmabuf: implement begin_cpu_access/end_cpu_access hooks")

general protection fault, probably for non-canonical address 0xdffffc0000000002: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
CPU: 1 PID: 7990 Comm: syz-executor.0 Not tainted 5.15.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:sg_alloc_append_table_from_pages+0x821/0xdb0 lib/scatterlist.c:525
Code: 0c 24 48 8b 4c 24 48 48 39 c8 48 0f 46 c8 89 f0 4c 8d 3c c7 48 89 4c 24 30 48 b9 00 00 00 00 00 fc ff df 4c 89 f8 48 c1 e8 03 <80> 3c 08 00 0f 85 24 05 00 00 4d 8b 3f 4c 89 e0 31 ff 83 e0 03 48
RSP: 0018:ffffc90006087c48 EFLAGS: 00010212
RAX: 0000000000000002 RBX: 0000000000000001 RCX: dffffc0000000000
RDX: ffff888074588000 RSI: 0000000000000000 RDI: 0000000000000010
RBP: 00000000fffff000 R08: fffffffffffff000 R09: ffff88801afe1940
R10: ffffffff83d737d0 R11: 0000000000000000 R12: 0000000000000002
R13: ffff88801afe1940 R14: 0000000000000000 R15: 0000000000000010
FS:  00007fd273545700(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd273545718 CR3: 000000001a51c000 CR4: 0000000000350ee0
Call Trace:
 sg_alloc_table_from_pages_segment+0xc9/0x260 lib/scatterlist.c:573
 sg_alloc_table_from_pages include/linux/scatterlist.h:331 [inline]
 get_sg_table.isra.0+0xbb/0x160 drivers/dma-buf/udmabuf.c:67
 begin_cpu_udmabuf+0x130/0x1d0 drivers/dma-buf/udmabuf.c:126
 dma_buf_begin_cpu_access+0xfd/0x1d0 drivers/dma-buf/dma-buf.c:1204
 dma_buf_ioctl+0x29a/0x380 drivers/dma-buf/dma-buf.c:403
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:874 [inline]
 __se_sys_ioctl fs/ioctl.c:860 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:860
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7fd273e108d9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fd273545188 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fd273f150e0 RCX: 00007fd273e108d9
RDX: 0000000020000000 RSI: 0000000040086200 RDI: 0000000000000004
RBP: 00007fd273e6acb4 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffd358e3ccf R14: 00007fd273545300 R15: 0000000000022000
Modules linked in:
---[ end trace 225c119d3f055d42 ]---
RIP: 0010:sg_alloc_append_table_from_pages+0x821/0xdb0 lib/scatterlist.c:525
Code: 0c 24 48 8b 4c 24 48 48 39 c8 48 0f 46 c8 89 f0 4c 8d 3c c7 48 89 4c 24 30 48 b9 00 00 00 00 00 fc ff df 4c 89 f8 48 c1 e8 03 <80> 3c 08 00 0f 85 24 05 00 00 4d 8b 3f 4c 89 e0 31 ff 83 e0 03 48
RSP: 0018:ffffc90006087c48 EFLAGS: 00010212
RAX: 0000000000000002 RBX: 0000000000000001 RCX: dffffc0000000000
RDX: ffff888074588000 RSI: 0000000000000000 RDI: 0000000000000010
RBP: 00000000fffff000 R08: fffffffffffff000 R09: ffff88801afe1940
R10: ffffffff83d737d0 R11: 0000000000000000 R12: 0000000000000002
R13: ffff88801afe1940 R14: 0000000000000000 R15: 0000000000000010
FS:  00007fd273545700(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd273545718 CR3: 000000001a51c000 CR4: 0000000000350ee0
----------------
Code disassembly (best guess):
   0:	0c 24                	or     $0x24,%al
   2:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   7:	48 39 c8             	cmp    %rcx,%rax
   a:	48 0f 46 c8          	cmovbe %rax,%rcx
   e:	89 f0                	mov    %esi,%eax
  10:	4c 8d 3c c7          	lea    (%rdi,%rax,8),%r15
  14:	48 89 4c 24 30       	mov    %rcx,0x30(%rsp)
  19:	48 b9 00 00 00 00 00 	movabs $0xdffffc0000000000,%rcx
  20:	fc ff df
  23:	4c 89 f8             	mov    %r15,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1) <-- trapping instruction
  2e:	0f 85 24 05 00 00    	jne    0x558
  34:	4d 8b 3f             	mov    (%r15),%r15
  37:	4c 89 e0             	mov    %r12,%rax
  3a:	31 ff                	xor    %edi,%edi
  3c:	83 e0 03             	and    $0x3,%eax
  3f:	48                   	rex.W


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
