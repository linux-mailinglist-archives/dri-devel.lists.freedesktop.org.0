Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B51B786802
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 09:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C8710E00A;
	Thu, 24 Aug 2023 07:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f207.google.com (mail-pf1-f207.google.com
 [209.85.210.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C131310E00A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 07:01:13 +0000 (UTC)
Received: by mail-pf1-f207.google.com with SMTP id
 d2e1a72fcca58-68a48df712bso6102706b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 00:01:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692860473; x=1693465273;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g8QLJ93H/zrO//rMAevhu8RWkecEt3CkKbeVnQwZKcc=;
 b=kXKRPXs3d2NZ0ciL+o30bSKEn0DUQMF7Tkeg24x/0k49GX2Qq7CC9YtmxTfvOvGMF8
 +dl059+zR20Fd7z/XpE/f39GHnKY0/2TRLNlEeaW5ulK/rT2O7Y7yXfEtnuExBJVrusP
 k9UxNq0Txo6wW7Wc1hnnFeT00VqNrOK2TBi70/RXbkW3pRJHilf915v/8jl+Gpgm3cRv
 Q1a2eC5LepYIN4KZ/wDxXwJd6LKhw5ZE2lNHDmC9CLdNO5nHbaE7Ofwq/wTm8JFYq5SP
 0UFjUOhYffDYPQ9Y4djP8Wh5d7tn13ONq77CQdLzWvsQ0rAKGRTPzXQLSKNVPb9KZp9+
 5tmw==
X-Gm-Message-State: AOJu0Yz2Srux/J/pLQCiUnJflbhj1qPuUZyUZBlcrwuv+HJOmUBZW0qD
 sdO5rpf1Ugx35QotfmwtUZxLmfj3gL4Gmzd99JzrIEgc6Ryw
X-Google-Smtp-Source: AGHT+IF5s8TGinkAiQnXtWBdxCLtRr8vJbFKfzTX0KZYjlH1RVf3WytudqydgLn/voM2m7jKbRBavCab/QbB0lVdRkzNY8/HWR1+
MIME-Version: 1.0
X-Received: by 2002:a05:6a00:180c:b0:686:2ad5:d132 with SMTP id
 y12-20020a056a00180c00b006862ad5d132mr7930789pfa.5.1692860473296; Thu, 24 Aug
 2023 00:01:13 -0700 (PDT)
Date: Thu, 24 Aug 2023 00:01:13 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002a4da90603a5cbbf@google.com>
Subject: [syzbot] [dri?] kernel BUG in vmf_insert_pfn_prot (2)
From: syzbot <syzbot+398e17b61dab22cc56bc@syzkaller.appspotmail.com>
To: airlied@gmail.com, christian.koenig@amd.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
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

HEAD commit:    9e6c269de404 Merge tag 'i2c-for-6.5-rc7' of git://git.kern..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=110b32d3a80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=aa796b6080b04102
dashboard link: https://syzkaller.appspot.com/bug?extid=398e17b61dab22cc56bc
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14284307a80000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/481d8421bfb2/disk-9e6c269d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5ec626f94634/vmlinux-9e6c269d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ab1e59619bd6/bzImage-9e6c269d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+398e17b61dab22cc56bc@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at mm/memory.c:2214!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 5157 Comm: syz-executor.3 Not tainted 6.5.0-rc6-syzkaller-00253-g9e6c269de404 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/26/2023
RIP: 0010:vmf_insert_pfn_prot+0x247/0x430 mm/memory.c:2214
Code: 0f 0b e8 0c 4f c0 ff 49 89 ef bf 20 00 00 00 41 83 e7 28 4c 89 fe e8 88 4a c0 ff 49 83 ff 20 0f 85 aa fe ff ff e8 e9 4e c0 ff <0f> 0b 48 bd ff ff ff ff ff ff 0f 00 e8 d8 4e c0 ff 4c 89 f6 48 89
RSP: 0018:ffffc9000415f750 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff8880275a0d00 RCX: 0000000000000000
RDX: ffff888018379dc0 RSI: ffffffff81c5b9b7 RDI: 0000000000000007
RBP: 000000000c140477 R08: 0000000000000007 R09: 0000000000000020
R10: 0000000000000020 R11: 000000000000001f R12: 0000000020ffc000
R13: 1ffff9200082beeb R14: 000000000007e79e R15: 0000000000000020
FS:  00007f235bd9a6c0(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020ffc000 CR3: 0000000022a32000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 drm_gem_shmem_fault+0x1ea/0x3a0 drivers/gpu/drm/drm_gem_shmem_helper.c:563
 __do_fault+0x107/0x5f0 mm/memory.c:4198
 do_read_fault mm/memory.c:4547 [inline]
 do_fault mm/memory.c:4670 [inline]
 do_pte_missing mm/memory.c:3664 [inline]
 handle_pte_fault mm/memory.c:4939 [inline]
 __handle_mm_fault+0x27e0/0x3b80 mm/memory.c:5079
 handle_mm_fault+0x2ab/0x9d0 mm/memory.c:5233
 do_user_addr_fault+0x446/0xfc0 arch/x86/mm/fault.c:1392
 handle_page_fault arch/x86/mm/fault.c:1486 [inline]
 exc_page_fault+0x5c/0xd0 arch/x86/mm/fault.c:1542
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:570
RIP: 0010:rep_movs_alternative+0x4a/0xb0 arch/x86/lib/copy_user_64.S:71
Code: 75 f1 c3 66 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 8b 06 48 89 07 48 83 c6 08 48 83 c7 08 83 e9 08 74 df 83 f9 08 73 e8 eb c9 <f3> a4 c3 0f 1f 00 4c 8b 06 4c 8b 4e 08 4c 8b 56 10 4c 8b 5e 18 4c
RSP: 0018:ffffc9000415fb50 EFLAGS: 00050206
RAX: 0000000000000001 RBX: 0000000020ffc000 RCX: 0000000000001000
RDX: 0000000000000000 RSI: 0000000020ffc000 RDI: ffff88807b764000
RBP: 0000000000001000 R08: 0000000000000001 R09: ffffed100f6ec9ff
R10: ffff88807b764fff R11: 0000000000000000 R12: 0000000020ffd000
R13: ffff88807b764000 R14: 0000000000000000 R15: 0000000020ffc000
 copy_user_generic arch/x86/include/asm/uaccess_64.h:112 [inline]
 raw_copy_from_user arch/x86/include/asm/uaccess_64.h:127 [inline]
 _copy_from_user+0xc2/0xf0 lib/usercopy.c:23
 copy_from_user include/linux/uaccess.h:183 [inline]
 snd_rawmidi_kernel_write1+0x360/0x860 sound/core/rawmidi.c:1618
 snd_rawmidi_write+0x278/0xc10 sound/core/rawmidi.c:1687
 vfs_write+0x2a4/0xe40 fs/read_write.c:582
 ksys_write+0x1f0/0x250 fs/read_write.c:637
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f235b07cae9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 e1 20 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f235bd9a0c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f235b19bf80 RCX: 00007f235b07cae9
RDX: 00000000fffffd2c RSI: 0000000020000000 RDI: 0000000000000005
RBP: 00007f235b0c847a R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 000000000000000b R14: 00007f235b19bf80 R15: 00007ffd9cdf0fe8
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:vmf_insert_pfn_prot+0x247/0x430 mm/memory.c:2214
Code: 0f 0b e8 0c 4f c0 ff 49 89 ef bf 20 00 00 00 41 83 e7 28 4c 89 fe e8 88 4a c0 ff 49 83 ff 20 0f 85 aa fe ff ff e8 e9 4e c0 ff <0f> 0b 48 bd ff ff ff ff ff ff 0f 00 e8 d8 4e c0 ff 4c 89 f6 48 89
RSP: 0018:ffffc9000415f750 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff8880275a0d00 RCX: 0000000000000000
RDX: ffff888018379dc0 RSI: ffffffff81c5b9b7 RDI: 0000000000000007
RBP: 000000000c140477 R08: 0000000000000007 R09: 0000000000000020
R10: 0000000000000020 R11: 000000000000001f R12: 0000000020ffc000
R13: 1ffff9200082beeb R14: 000000000007e79e R15: 0000000000000020
FS:  00007f235bd9a6c0(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f93c20ffac1 CR3: 0000000022a32000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	75 f1                	jne    0xfffffff3
   2:	c3                   	ret
   3:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   a:	00 00 00 00
   e:	66 90                	xchg   %ax,%ax
  10:	48 8b 06             	mov    (%rsi),%rax
  13:	48 89 07             	mov    %rax,(%rdi)
  16:	48 83 c6 08          	add    $0x8,%rsi
  1a:	48 83 c7 08          	add    $0x8,%rdi
  1e:	83 e9 08             	sub    $0x8,%ecx
  21:	74 df                	je     0x2
  23:	83 f9 08             	cmp    $0x8,%ecx
  26:	73 e8                	jae    0x10
  28:	eb c9                	jmp    0xfffffff3
* 2a:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi) <-- trapping instruction
  2c:	c3                   	ret
  2d:	0f 1f 00             	nopl   (%rax)
  30:	4c 8b 06             	mov    (%rsi),%r8
  33:	4c 8b 4e 08          	mov    0x8(%rsi),%r9
  37:	4c 8b 56 10          	mov    0x10(%rsi),%r10
  3b:	4c 8b 5e 18          	mov    0x18(%rsi),%r11
  3f:	4c                   	rex.WR


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
