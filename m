Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C608599198
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 02:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0AC10E002;
	Fri, 19 Aug 2022 00:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A6C10E002
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 00:09:24 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id
 l15-20020a0566022dcf00b00688e70a26deso1756852iow.12
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 17:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc;
 bh=Cgqnygv45IvmE/0nA636AfgKPr1Y9HZ7ogG80q4bafI=;
 b=rEOSWa+94lr41JSagHGEPeii5KWipC7XJsaZeJSACXgf6ab3b0UhH3Kb87v84bVTbX
 MfJpWTO5AfVRqECnfy2kiOPX1izc6PRWXlto3ruyjKqfHoMYG5jXqXG0I+hdYFp4DssN
 LmpiWPBttBQrR28ti20HOnTE07f2pl9r9MdOqDQaom+TZw9PwFW4q/GDn5YIq0+RZi6c
 3x9MQKPyjk9dGi86YiLu9YYcfq+aViHus0WaNLMn1WFhAjSKEWGhmwNOkou/+jBAncI2
 2gbwVYbD/PQJi9m6qyxNDGkGgW+RJx2T2+B3eBAj4Kr7VaYUuGquo9DDInRs07XD4C9D
 Dcnw==
X-Gm-Message-State: ACgBeo2dyj1P0xWpxMG7QXW7TnlLPQyZc3IX0vw3qwc22gzNnqyXriVd
 eE2o54bGevgQoJhrYYADW1CqWNs05/6BoRxjuCOsw1XMjIw3
X-Google-Smtp-Source: AA6agR5Th/47m9oDxR6e09YyIyM4u883zYiv57Xptl+BEAqccJCssp1yY4RYeXlYdcyQ/z/03m3XavyH1f3JkfswClq+JWxRywbt
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b4c:b0:2de:de3e:6c5a with SMTP id
 f12-20020a056e020b4c00b002dede3e6c5amr2568816ilu.6.1660867764236; Thu, 18 Aug
 2022 17:09:24 -0700 (PDT)
Date: Thu, 18 Aug 2022 17:09:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001b37dc05e68ce911@google.com>
Subject: [syzbot] general protection fault in release_udmabuf
From: syzbot <syzbot+c80e9ef5d8bb45894db0@syzkaller.appspotmail.com>
To: christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
 kraxel@redhat.com, linaro-mm-sig@lists.linaro.org, 
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

HEAD commit:    7ebfc85e2cd7 Merge tag 'net-6.0-rc1' of git://git.kernel.o..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1331f447080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=924833c12349a8c0
dashboard link: https://syzkaller.appspot.com/bug?extid=c80e9ef5d8bb45894db0
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1601336b080000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16d3292d080000

Bisection is inconclusive: the issue happens on the oldest tested release.

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16e01a3d080000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=15e01a3d080000
console output: https://syzkaller.appspot.com/x/log.txt?x=11e01a3d080000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c80e9ef5d8bb45894db0@syzkaller.appspotmail.com

general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 0 PID: 3609 Comm: syz-executor487 Not tainted 5.19.0-syzkaller-13930-g7ebfc85e2cd7 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/22/2022
RIP: 0010:dma_unmap_sgtable include/linux/dma-mapping.h:378 [inline]
RIP: 0010:put_sg_table drivers/dma-buf/udmabuf.c:89 [inline]
RIP: 0010:release_udmabuf+0xcb/0x4f0 drivers/dma-buf/udmabuf.c:114
Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 2b 04 00 00 48 8d 7d 0c 4c 8b 63 30 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <0f> b6 14 02 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 e2
RSP: 0018:ffffc900037efd30 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: ffffffff8cb67800 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff84ad27e0 RDI: 0000000000000000
RBP: fffffffffffffff4 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 000000000008c07c R12: ffff88801fa05000
R13: ffff888073db07e8 R14: ffff888025c25440 R15: 0000000000000000
FS:  0000555555fc4300(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fc1c0ce06e4 CR3: 00000000715e6000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 dma_buf_release+0x157/0x2d0 drivers/dma-buf/dma-buf.c:78
 __dentry_kill+0x42b/0x640 fs/dcache.c:612
 dentry_kill fs/dcache.c:733 [inline]
 dput+0x806/0xdb0 fs/dcache.c:913
 __fput+0x39c/0x9d0 fs/file_table.c:333
 task_work_run+0xdd/0x1a0 kernel/task_work.c:177
 ptrace_notify+0x114/0x140 kernel/signal.c:2353
 ptrace_report_syscall include/linux/ptrace.h:420 [inline]
 ptrace_report_syscall_exit include/linux/ptrace.h:482 [inline]
 syscall_exit_work kernel/entry/common.c:249 [inline]
 syscall_exit_to_user_mode_prepare+0x129/0x280 kernel/entry/common.c:276
 __syscall_exit_to_user_mode_work kernel/entry/common.c:281 [inline]
 syscall_exit_to_user_mode+0x9/0x50 kernel/entry/common.c:294
 do_syscall_64+0x42/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fc1c0c35b6b
Code: 0f 05 48 3d 00 f0 ff ff 77 45 c3 0f 1f 40 00 48 83 ec 18 89 7c 24 0c e8 63 fc ff ff 8b 7c 24 0c 41 89 c0 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 35 44 89 c7 89 44 24 0c e8 a1 fc ff ff 8b 44
RSP: 002b:00007ffd78a06090 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000007 RCX: 00007fc1c0c35b6b
RDX: 0000000020000280 RSI: 0000000040086200 RDI: 0000000000000006
RBP: 0000000000000007 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000293 R12: 000000000000000c
R13: 0000000000000003 R14: 00007fc1c0cfe4a0 R15: 00007ffd78a06140
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:dma_unmap_sgtable include/linux/dma-mapping.h:378 [inline]
RIP: 0010:put_sg_table drivers/dma-buf/udmabuf.c:89 [inline]
RIP: 0010:release_udmabuf+0xcb/0x4f0 drivers/dma-buf/udmabuf.c:114
Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 2b 04 00 00 48 8d 7d 0c 4c 8b 63 30 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <0f> b6 14 02 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 e2
RSP: 0018:ffffc900037efd30 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: ffffffff8cb67800 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff84ad27e0 RDI: 0000000000000000
RBP: fffffffffffffff4 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 000000000008c07c R12: ffff88801fa05000
R13: ffff888073db07e8 R14: ffff888025c25440 R15: 0000000000000000
FS:  0000555555fc4300(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000564b46eeb2c8 CR3: 00000000715e6000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	48 89 fa             	mov    %rdi,%rdx
   3:	48 c1 ea 03          	shr    $0x3,%rdx
   7:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   b:	0f 85 2b 04 00 00    	jne    0x43c
  11:	48 8d 7d 0c          	lea    0xc(%rbp),%rdi
  15:	4c 8b 63 30          	mov    0x30(%rbx),%r12
  19:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  20:	fc ff df
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx <-- trapping instruction
  2e:	48 89 f8             	mov    %rdi,%rax
  31:	83 e0 07             	and    $0x7,%eax
  34:	83 c0 03             	add    $0x3,%eax
  37:	38 d0                	cmp    %dl,%al
  39:	7c 08                	jl     0x43
  3b:	84 d2                	test   %dl,%dl
  3d:	0f                   	.byte 0xf
  3e:	85 e2                	test   %esp,%edx


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
