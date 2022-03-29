Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C1F4EBBC4
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 09:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9A710F5AB;
	Wed, 30 Mar 2022 07:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76E010EED9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 21:23:17 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id
 t3-20020a92cc43000000b002c8854c7a7cso6906330ilq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 14:23:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to
 :content-transfer-encoding;
 bh=q7Kx15br1wxLJCSsS15G2U3/E2FOKlFlLwE852dBTj0=;
 b=XlS61W/rt51aAzqNrFJpCOyK/b9VDgFmsYRe4Jpn9iG79zlrIK3yt+2kD4hYeP6V/Y
 Dm/cJZWw8RZ1hQrSJVlp+nYQ5SmDFLADY/Vu7XMgZBT0oJYwUFnc01xKkFiRRwwFfFWr
 +zOB35rx65i21XLZScPB1FivgzdjPe+7KFSudtGCVxCDE9sHoh10bYeu1Ih8rrGftrQJ
 cX7bcuOIpJmkY3zBV1rsT6mwnBeAIy6hQKcQq/bnWvsDy+Xl1JKox3wuR9NIo3AhkaU0
 NDPAqbWyBeqTBylrs4DrzmNjimA0rxEi0NJ6/jtluk3wmUYEBjKDxwBL29BldvVvzKr3
 3+7A==
X-Gm-Message-State: AOAM532FXv+m4NWlHIqdZykvxGTXVpt1SRmKyUk4SavHbv5j8/rEZGvw
 PMIp3du0iJG4Ak93BfaQGKVY9MlXaiVCV1BT+RUqyXERDbY+
X-Google-Smtp-Source: ABdhPJz0wqsZ4E3fDzRBIIJ4W7fIoEwoFJulSIIwf7uH0MNcZYHTuBirkA0uiGlDFhS3H1U1XawGMuTpfMhu5X+B9OiySrnO6gjR
MIME-Version: 1.0
X-Received: by 2002:a05:6638:2410:b0:323:8ca8:1621 with SMTP id
 z16-20020a056638241000b003238ca81621mr2149569jat.295.1648588997190; Tue, 29
 Mar 2022 14:23:17 -0700 (PDT)
Date: Tue, 29 Mar 2022 14:23:17 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008eedfe05db620952@google.com>
Subject: [syzbot] general protection fault in dma_fence_array_first
From: syzbot <syzbot+5c943fe38e86d615cac2@syzkaller.appspotmail.com>
To: christian.koenig@amd.com, daniel.vetter@ffwll.ch, 
 dri-devel@lists.freedesktop.org, gustavo@padovan.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
 syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 30 Mar 2022 07:32:47 +0000
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

HEAD commit:    8515d05bf6bc Add linux-next specific files for 20220328
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=3D1694e21b700000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D530c68bef4e2b8a=
8
dashboard link: https://syzkaller.appspot.com/bug?extid=3D5c943fe38e86d615c=
ac2
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils=
 for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D1467313b70000=
0
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D121b7cb9700000

The issue was bisected to:

commit 519f490db07e1a539490612f376487f61e48e39c
Author: Christian K=C3=B6nig <christian.koenig@amd.com>
Date:   Fri Mar 11 09:32:26 2022 +0000

    dma-buf/sync-file: fix warning about fence containers

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D1058277d7000=
00
final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D1258277d7000=
00
console output: https://syzkaller.appspot.com/x/log.txt?x=3D1458277d700000

IMPORTANT: if you fix the issue, please add the following tag to the commit=
:
Reported-by: syzbot+5c943fe38e86d615cac2@syzkaller.appspotmail.com
Fixes: 519f490db07e ("dma-buf/sync-file: fix warning about fence containers=
")

general protection fault, probably for non-canonical address 0xdffffc000000=
0002: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
CPU: 1 PID: 3595 Comm: syz-executor814 Not tainted 5.17.0-next-20220328-syz=
kaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Goo=
gle 01/01/2011
RIP: 0010:dma_fence_array_first+0x78/0xb0 drivers/dma-buf/dma-fence-array.c=
:234
Code: 00 00 fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 75 43 48 8b 9b 88 00 =
00 00 48 b8 00 00 00 00 00 fc ff df 48 89 da 48 c1 ea 03 <80> 3c 02 00 75 1=
b 4c 8b 23 e8 fa a9 e0 fc 4c 89 e0 5b 41 5c c3 45
RSP: 0018:ffffc90003a4fd48 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: 0000000000000010 RCX: 0000000000000000
RDX: 0000000000000002 RSI: ffffffff84980052 RDI: ffff888015c76388
RBP: ffff888015c76300 R08: 0000000000000000 R09: ffff888015c7633b
R10: ffffffff8498f6ba R11: 0000000000000000 R12: ffff888015c76300
R13: ffff888015c76690 R14: 00000000c0383e04 R15: 0000000020001840
FS:  0000555556872300(0000) GS:ffff8880b9d00000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020001528 CR3: 000000001e82f000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __dma_fence_unwrap_array include/linux/dma-fence-unwrap.h:42 [inline]
 dma_fence_unwrap_first include/linux/dma-fence-unwrap.h:57 [inline]
 sync_file_ioctl_fence_info drivers/dma-buf/sync_file.c:414 [inline]
 sync_file_ioctl+0x248/0x22c0 drivers/dma-buf/sync_file.c:477
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl fs/ioctl.c:856 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0x80 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f6aae8951b9
Code: 28 c3 e8 2a 14 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 89 f8 48 89 f7 =
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff f=
f 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffedd290238 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f6aae8951b9
RDX: 0000000020001840 RSI: 00000000c0383e04 RDI: 0000000000000007
RBP: 00007f6aae8591a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f6aae859230
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:dma_fence_array_first+0x78/0xb0 drivers/dma-buf/dma-fence-array.c=
:234
Code: 00 00 fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 75 43 48 8b 9b 88 00 =
00 00 48 b8 00 00 00 00 00 fc ff df 48 89 da 48 c1 ea 03 <80> 3c 02 00 75 1=
b 4c 8b 23 e8 fa a9 e0 fc 4c 89 e0 5b 41 5c c3 45
RSP: 0018:ffffc90003a4fd48 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: 0000000000000010 RCX: 0000000000000000
RDX: 0000000000000002 RSI: ffffffff84980052 RDI: ffff888015c76388
RBP: ffff888015c76300 R08: 0000000000000000 R09: ffff888015c7633b
R10: ffffffff8498f6ba R11: 0000000000000000 R12: ffff888015c76300
R13: ffff888015c76690 R14: 00000000c0383e04 R15: 0000000020001840
FS:  0000555556872300(0000) GS:ffff8880b9d00000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020001528 CR3: 000000001e82f000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess), 4 bytes skipped:
   0:	df 48 89             	fisttps -0x77(%rax)
   3:	fa                   	cli
   4:	48 c1 ea 03          	shr    $0x3,%rdx
   8:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   c:	75 43                	jne    0x51
   e:	48 8b 9b 88 00 00 00 	mov    0x88(%rbx),%rbx
  15:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  1c:	fc ff df
  1f:	48 89 da             	mov    %rbx,%rdx
  22:	48 c1 ea 03          	shr    $0x3,%rdx
* 26:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruct=
ion
  2a:	75 1b                	jne    0x47
  2c:	4c 8b 23             	mov    (%rbx),%r12
  2f:	e8 fa a9 e0 fc       	callq  0xfce0aa2e
  34:	4c 89 e0             	mov    %r12,%rax
  37:	5b                   	pop    %rbx
  38:	41 5c                	pop    %r12
  3a:	c3                   	retq
  3b:	45                   	rex.RB


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisectio=
n
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
