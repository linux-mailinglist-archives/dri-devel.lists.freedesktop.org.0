Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE42648234
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 13:11:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F3B10E528;
	Fri,  9 Dec 2022 12:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D839010E528
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 12:11:23 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id
 s22-20020a6bdc16000000b006e2d7c78010so1164897ioc.21
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 04:11:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=27pxGUhnzYicBxjH03IaVIFoOWTqXBEXA2qSGC27VXw=;
 b=QadZfvump8WqLVeDVLYAA/A6MsJMJAwuP6YkJTq33RCW9eAn/hT9RzBBn1XUdzaHb7
 kXjHEEDMCQIIfuFvnQIFCz/tAMaKvBDKqbuSNL1E0tJffJSRQdi/QoZB62T0hMIW7XJa
 msHsXmynj7xPhf6jSOps6gZ7DZcNmgF9XR62BnVHVT1tNTvw4+qvnUIsIHRyZDuZeHTq
 EcqVy+QCgXNprXYungDHxry9pMzio99Q91zGdKNv4X/1Hwlb5k76EFBR2Z9K7NmeIxBt
 2nu05+ZbhUnmughBIwqGEUnC1rTdgbHEr00G7PnQzEsuK1gPKHJHy7O+oE0g8Lt89FnE
 BH6A==
X-Gm-Message-State: ANoB5plJMaCx1w3s8/sJXPh5VS99RTmK0A3UZEFp+xj3l67kZNrvh6xZ
 V2Ifn7voGGOgu82dbJO23sDlFA0I6641JJk4HU5pbISKD/ov
X-Google-Smtp-Source: AA0mqf5p/icoGOhwns+OGvGmDW9LW4/7fO7ruCrhnKtuNfURdT8SNEJXbdlgdaM56uFIXwe2iHIfN8BtSiCG1hLCy8wvL6j3ZAjM
MIME-Version: 1.0
X-Received: by 2002:a92:c98e:0:b0:303:5425:fc00 with SMTP id
 y14-20020a92c98e000000b003035425fc00mr10012564iln.76.1670587883145; Fri, 09
 Dec 2022 04:11:23 -0800 (PST)
Date: Fri, 09 Dec 2022 04:11:23 -0800
In-Reply-To: <524d919d-0197-2a81-9165-d0d6feb607fe@siddh.me>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005752c105ef640d84@google.com>
Subject: Re: [syzbot] WARNING in drm_wait_one_vblank
From: syzbot <syzbot+6f7fe2dbc479dca0ed17@syzkaller.appspotmail.com>
To: code@siddh.me, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
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

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in drm_wait_one_vblank

platform vkms: vblank wait timed out on crtc 0
WARNING: CPU: 1 PID: 4329 at drivers/gpu/drm/drm_vblank.c:1269 drm_wait_one_vblank+0x2bc/0x500 drivers/gpu/drm/drm_vblank.c:1269
Modules linked in:

CPU: 1 PID: 4329 Comm: syz-executor.5 Not tainted 6.1.0-rc8-syzkaller-00148-g0d1409e4ff08 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
RIP: 0010:drm_wait_one_vblank+0x2bc/0x500 drivers/gpu/drm/drm_vblank.c:1269
Code: 85 f6 0f 84 a3 01 00 00 e8 a1 82 03 fd 4c 89 ef e8 19 34 1b 00 44 89 e1 4c 89 f2 48 c7 c7 80 67 5d 8a 48 89 c6 e8 1b 54 d1 04 <0f> 0b e9 87 fe ff ff e8 78 82 03 fd 31 ff 4c 89 ee e8 5e 7f 03 fd
RSP: 0018:ffffc90003887b40 EFLAGS: 00010282

RAX: 0000000000000000 RBX: 000000000000187a RCX: 0000000000000000
RDX: ffff888077e56080 RSI: ffffffff81615618 RDI: fffff52000710f5a
RBP: ffff888146b6c000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000080000000 R11: 0000000000000000 R12: 0000000000000000
R13: ffff88801e146010 R14: ffff888146fb2dc0 R15: ffff888146ffe030
FS:  00007fd446839700(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055d58fce0300 CR3: 0000000066c1d000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 drm_fb_helper_ioctl+0x159/0x1a0 drivers/gpu/drm/drm_fb_helper.c:1259
 do_fb_ioctl+0x1d5/0x6e0 drivers/video/fbdev/core/fbmem.c:1188
 fb_ioctl+0xe7/0x150 drivers/video/fbdev/core/fbmem.c:1202
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl fs/ioctl.c:856 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fd445689409
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fd446839168 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fd44579bf80 RCX: 00007fd445689409
RDX: 0000000000000000 RSI: 0000000040044620 RDI: 0000000000000003
RBP: 00007fd4468391d0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 00007ffff493021f R14: 00007fd446839300 R15: 0000000000022000
 </TASK>


Tested on:

commit:         0d1409e4 Merge tag 'drm-fixes-2022-12-09' of git://ano..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=10bf8cb7880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f99d4932d068617a
dashboard link: https://syzkaller.appspot.com/bug?extid=6f7fe2dbc479dca0ed17
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Note: no patches were applied.
