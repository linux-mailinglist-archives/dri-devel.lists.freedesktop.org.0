Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BAF7A2D02
	for <lists+dri-devel@lfdr.de>; Sat, 16 Sep 2023 03:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F3410E6BE;
	Sat, 16 Sep 2023 01:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f77.google.com (mail-ot1-f77.google.com
 [209.85.210.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E048110E6BE
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Sep 2023 01:22:08 +0000 (UTC)
Received: by mail-ot1-f77.google.com with SMTP id
 46e09a7af769-6bc7afd0498so3508125a34.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 18:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694827328; x=1695432128;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M/Or17Flbww0J850VcncFpV3Fsrp6uiNhx9j7RzszSc=;
 b=ZLjEEFWMk1zkmiKlRlSB+3DBuDLQmin6qTWZuffM0yz5qDM9OMlpRIt0sqBz8qD/yy
 A/gjvigAg+8YPmWWsjmZHXpQEpK52kUOI6rHmdZ0HRlcOUDJRX/PHXcyq+ePizGxeNas
 S1b2gkHV/tIRPTcI15Fnu1aduOUYZ+1ZLg31B3KH/gSzDM0FBrWKc5bKx7+VFlPbM9sp
 SZPmI0Wued+G0EsdgbLLV9huJreNGNVzaJRwEgk2fvk6SKcKyieWUG4mumnhR+bsFxMg
 sNvbMMa746Ww5hHZ7grg7e6Kvf71khsqOa5fJK7+xSzwAhcUjtJuh3YaQyABBG7LUCsh
 cVwQ==
X-Gm-Message-State: AOJu0YwaQKGRuV+SLhZGw0kT/51ci33lG5jroUz5zTd6K7bK4O1d7aps
 bSqgDrViI+ferVwzuWC5BzR8nQ9sNsEH89oCnBSa1P1xcNT6
X-Google-Smtp-Source: AGHT+IF7058y1jehsUMZxBzb298llpz98s99IIVfGF8a2JYv7XWxrtU97dgqMTRab9leMlgD/BstJmGv7wgxjNXLcFiMriSt0/Xg
MIME-Version: 1.0
X-Received: by 2002:a9d:6d92:0:b0:6c0:a3e0:f9e3 with SMTP id
 x18-20020a9d6d92000000b006c0a3e0f9e3mr895784otp.5.1694827328228; Fri, 15 Sep
 2023 18:22:08 -0700 (PDT)
Date: Fri, 15 Sep 2023 18:22:08 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000dad29506056fbc93@google.com>
Subject: [syzbot] [dri?] WARNING in drm_gem_object_handle_put_unlocked
From: syzbot <syzbot+ef3256a360c02207a4cb@syzkaller.appspotmail.com>
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

HEAD commit:    0bb80ecc33a8 Linux 6.6-rc1
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1002530c680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f4894cf58531f
dashboard link: https://syzkaller.appspot.com/bug?extid=ef3256a360c02207a4cb
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14a79ca0680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16900402680000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/eeb0cac260c7/disk-0bb80ecc.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a3c360110254/vmlinux-0bb80ecc.xz
kernel image: https://storage.googleapis.com/syzbot-assets/22b81065ba5f/bzImage-0bb80ecc.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ef3256a360c02207a4cb@syzkaller.appspotmail.com

R10: 0000000000000000 R11: 0000000000000246 R12: 00007fda971e917c
R13: 00007fda97153210 R14: 0023647261632f69 R15: 6972642f7665642f
 </TASK>
------------[ cut here ]------------
WARNING: CPU: 1 PID: 5043 at drivers/gpu/drm/drm_gem.c:225 drm_gem_object_handle_put_unlocked+0x299/0x390 drivers/gpu/drm/drm_gem.c:225
Modules linked in:
CPU: 1 PID: 5043 Comm: syz-executor141 Not tainted 6.6.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/04/2023
RIP: 0010:drm_gem_object_handle_put_unlocked+0x299/0x390 drivers/gpu/drm/drm_gem.c:225
Code: ea 03 0f b6 04 02 84 c0 74 0c 3c 03 7f 08 4c 89 f7 e8 2b 06 2a fd c7 83 20 01 00 00 00 00 00 00 e9 98 fe ff ff e8 57 44 d4 fc <0f> 0b 5b 5d 41 5c 41 5d 41 5e e9 48 44 d4 fc e8 43 44 d4 fc 48 8d
RSP: 0018:ffffc90003d5fbb8 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff888027b61000 RCX: 0000000000000000
RDX: ffff888014fcbb80 RSI: ffffffff84b38a29 RDI: 0000000000000005
RBP: ffff888027b61004 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000001 R12: ffff88801d140000
R13: ffff888027b61008 R14: 0000000000000000 R15: ffff888027b61018
FS:  00007fda971536c0(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fda971fe794 CR3: 0000000072975000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 drm_gem_handle_create_tail+0x32f/0x540 drivers/gpu/drm/drm_gem.c:407
 drm_gem_shmem_create_with_handle drivers/gpu/drm/drm_gem_shmem_helper.c:417 [inline]
 drm_gem_shmem_dumb_create+0x21a/0x310 drivers/gpu/drm/drm_gem_shmem_helper.c:505
 drm_mode_create_dumb drivers/gpu/drm/drm_dumb_buffers.c:96 [inline]
 drm_mode_create_dumb_ioctl+0x268/0x2f0 drivers/gpu/drm/drm_dumb_buffers.c:102
 drm_ioctl_kernel+0x280/0x4c0 drivers/gpu/drm/drm_ioctl.c:789
 drm_ioctl+0x5cb/0xbf0 drivers/gpu/drm/drm_ioctl.c:892
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:871 [inline]
 __se_sys_ioctl fs/ioctl.c:857 [inline]
 __x64_sys_ioctl+0x18f/0x210 fs/ioctl.c:857
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fda971954e9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 51 18 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fda971531f8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fda9721c3e8 RCX: 00007fda971954e9
RDX: 0000000020000080 RSI: 00000000c02064b2 RDI: 0000000000000003
RBP: 00007fda9721c3e0 R08: 00007fda97152f96 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fda971e917c
R13: 00007fda97153210 R14: 0023647261632f69 R15: 6972642f7665642f
 </TASK>


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
