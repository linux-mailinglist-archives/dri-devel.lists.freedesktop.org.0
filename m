Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5472B851107
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 11:36:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C0F10E744;
	Mon, 12 Feb 2024 10:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4780310E744
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 10:36:24 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-363c88eff5aso26558855ab.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 02:36:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707734183; x=1708338983;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HcAZJy4DlbXdryo7e17UK1Z9B9l9LAm7zSOtqPj6VWI=;
 b=tWmQ+nEgCCOuHVN+KywiHSTEP7YPAkV6pncq9hfgS49/mX4C8dH0gyNfTyw9ZIcN+j
 qqloav42/HlQxMexLQKbVw4m8UgIKbPJgsOk0SmmY578l82bU5LcuYI3V0yAfSqVaUsn
 ql8jjd3zGUoGkTm2uEYfdsG4yVbjWNTV03UZs/pZ80Wx0Nv94DRH+dIrWz3al7sB/Fof
 1S0Nki843yq1QydR6++jpHf906nBqDk/4jc2xR/bUs4mSIdntHS3ShhCy3g7DZHhoeSL
 Fam5jQM5lNf2vOG85UTYUEcROkSDlONXmSkhWgytYmg2aAdeRQ/YQL0eUfuBCAc+tXab
 XGEw==
X-Gm-Message-State: AOJu0YzjLb1LIatIwmRMrzUfqRcWDBBeRbjUS8P+ZYI/N6BAVinK20dq
 aL/2UxNXdx/VWdv7223ERVgmzaPZj0wT2KDWw0SPy+Fzgbo6mQ6XoJp0+TJUElbBMhqtaju/eat
 xNri9/P27HTVlJpMbxcHGu04yadvPMNdbuey0jIHp5tjWMlwEJv9Hx9o=
X-Google-Smtp-Source: AGHT+IFgUu1kKNz+kizPomTdh//ehK7fDS3zmiYjhrrX2+PxpWm/qB6rlGdmysbiOYRLhvVXOYUWzAxFCxVZSuqc5a+dg0/9gX3y
MIME-Version: 1.0
X-Received: by 2002:a05:6638:4707:b0:471:6214:bc1e with SMTP id
 cs7-20020a056638470700b004716214bc1emr53988jab.1.1707734182950; Mon, 12 Feb
 2024 02:36:22 -0800 (PST)
Date: Mon, 12 Feb 2024 02:36:22 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000587e0f06112cd973@google.com>
Subject: [syzbot] [dri?] divide error in drm_mode_convert_to_umode
From: syzbot <syzbot+0d7a3627fb6a42cf0863@syzkaller.appspotmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
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

HEAD commit:    445a555e0623 Add linux-next specific files for 20240209
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=175fa6ec180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85aa3388229f9ea9
dashboard link: https://syzkaller.appspot.com/bug?extid=0d7a3627fb6a42cf0863
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17d4bd48180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=106ae642180000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/9188bb84c998/disk-445a555e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3ce0c98eabb2/vmlinux-445a555e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ab801b1c1d6d/bzImage-445a555e.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0d7a3627fb6a42cf0863@syzkaller.appspotmail.com

divide error: 0000 [#1] PREEMPT SMP KASAN PTI
CPU: 0 PID: 5068 Comm: syz-executor201 Not tainted 6.8.0-rc3-next-20240209-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/25/2024
RIP: 0010:drm_mode_vrefresh drivers/gpu/drm/drm_modes.c:1303 [inline]
RIP: 0010:drm_mode_convert_to_umode+0x36a/0xc30 drivers/gpu/drm/drm_modes.c:2594
Code: 0f b7 03 66 83 f8 02 b9 01 00 00 00 0f 43 c8 0f b7 c1 44 0f af f8 44 89 f0 48 69 c8 e8 03 00 00 44 89 f8 d1 e8 48 01 c8 31 d2 <49> f7 f7 48 89 c3 eb 1a e8 19 a2 47 fc eb 05 e8 12 a2 47 fc 48 8b
RSP: 0018:ffffc900034ff660 EFLAGS: 00010246
RAX: 0000000000001f40 RBX: ffff8880176d9016 RCX: 0000000000001f40
RDX: 0000000000000000 RSI: ffffc900034ff720 RDI: dffffc0000000000
RBP: 0000000000000200 R08: ffffffff854c389a R09: ffff8880176d900a
R10: dffffc0000000000 R11: ffffed100366d143 R12: 1ffff11002edb202
R13: ffff8880176d9000 R14: 0000000000000008 R15: 0000000000000000
FS:  0000555555c18380(0000) GS:ffff8880b9400000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000005fdeb8 CR3: 0000000011012000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 drm_atomic_set_mode_for_crtc+0x14a/0x4a0 drivers/gpu/drm/drm_atomic_uapi.c:82
 __drm_atomic_helper_set_config+0x255/0xf80 drivers/gpu/drm/drm_atomic.c:1679
 drm_atomic_helper_set_config+0x8b/0x150 drivers/gpu/drm/drm_atomic_helper.c:3263
 drm_mode_setcrtc+0xbae/0x17c0 drivers/gpu/drm/drm_crtc.c:886
 drm_ioctl_kernel+0x33a/0x440 drivers/gpu/drm/drm_ioctl.c:744
 drm_ioctl+0x63a/0xb10 drivers/gpu/drm/drm_ioctl.c:841
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:871 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:857
 do_syscall_64+0xfb/0x240
 entry_SYSCALL_64_after_hwframe+0x6d/0x75
RIP: 0033:0x7fd888e1b7e9
Code: 48 83 c4 28 c3 e8 37 17 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd99378a68 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007ffd99378c38 RCX: 00007fd888e1b7e9
RDX: 0000000020000400 RSI: 00000000c06864a2 RDI: 0000000000000003
RBP: 00007fd888e8e610 R08: 0000000000000005 R09: 00007ffd99378c38
R10: 0000000000000001 R11: 0000000000000246 R12: 0000000000000001
R13: 00007ffd99378c28 R14: 0000000000000001 R15: 0000000000000001
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:drm_mode_vrefresh drivers/gpu/drm/drm_modes.c:1303 [inline]
RIP: 0010:drm_mode_convert_to_umode+0x36a/0xc30 drivers/gpu/drm/drm_modes.c:2594
Code: 0f b7 03 66 83 f8 02 b9 01 00 00 00 0f 43 c8 0f b7 c1 44 0f af f8 44 89 f0 48 69 c8 e8 03 00 00 44 89 f8 d1 e8 48 01 c8 31 d2 <49> f7 f7 48 89 c3 eb 1a e8 19 a2 47 fc eb 05 e8 12 a2 47 fc 48 8b
RSP: 0018:ffffc900034ff660 EFLAGS: 00010246
RAX: 0000000000001f40 RBX: ffff8880176d9016 RCX: 0000000000001f40
RDX: 0000000000000000 RSI: ffffc900034ff720 RDI: dffffc0000000000
RBP: 0000000000000200 R08: ffffffff854c389a R09: ffff8880176d900a
R10: dffffc0000000000 R11: ffffed100366d143 R12: 1ffff11002edb202
R13: ffff8880176d9000 R14: 0000000000000008 R15: 0000000000000000
FS:  0000555555c18380(0000) GS:ffff8880b9500000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd888e95270 CR3: 0000000011012000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	0f b7 03             	movzwl (%rbx),%eax
   3:	66 83 f8 02          	cmp    $0x2,%ax
   7:	b9 01 00 00 00       	mov    $0x1,%ecx
   c:	0f 43 c8             	cmovae %eax,%ecx
   f:	0f b7 c1             	movzwl %cx,%eax
  12:	44 0f af f8          	imul   %eax,%r15d
  16:	44 89 f0             	mov    %r14d,%eax
  19:	48 69 c8 e8 03 00 00 	imul   $0x3e8,%rax,%rcx
  20:	44 89 f8             	mov    %r15d,%eax
  23:	d1 e8                	shr    %eax
  25:	48 01 c8             	add    %rcx,%rax
  28:	31 d2                	xor    %edx,%edx
* 2a:	49 f7 f7             	div    %r15 <-- trapping instruction
  2d:	48 89 c3             	mov    %rax,%rbx
  30:	eb 1a                	jmp    0x4c
  32:	e8 19 a2 47 fc       	call   0xfc47a250
  37:	eb 05                	jmp    0x3e
  39:	e8 12 a2 47 fc       	call   0xfc47a250
  3e:	48                   	rex.W
  3f:	8b                   	.byte 0x8b


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
