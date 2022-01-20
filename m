Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E43F7495BC4
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 09:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D6610E944;
	Fri, 21 Jan 2022 08:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A8A10E5B0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 22:58:28 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id
 p65-20020a6bbf44000000b00604c0757591so4951027iof.6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 14:58:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=E/oY8dcRhQcRe59iLrebfgHUOTZmi9pnmFWRS2GH3Nc=;
 b=Y/TWp/s8XBEUHj+g+MJinzkx64RMkLbTcyMnGYJJG2i2yBXMJGmVMV9z6hIPFwhHQa
 Va5pJuV06670vapkI056mkb7NJJx/17TYWdsun0b+Gxy2WYZSQyv3UL8ICqdOETuO/21
 WitudKiF6bAJ1DZHg60jY1W7O+Sd3jxetxWqV/ONA3X94jhSuvBNHpu0C/CGIIrnLsmC
 IdTiUbBhnoktdw9j5gx4G20XJVLFg9ZSdFkMNFAJvONpOePHkddfijOt64h1oX/ergOg
 GP12aX28OzIwW4iCcBu8e030q6q8CKrDsS/DAgWWhuptHzn6jEPv9jOpKMXQ8Mwlp90q
 IWSg==
X-Gm-Message-State: AOAM533Pth96u7pFjydf6755C3nFM4eEfWuEn9YhqsUYPZ9dJY77LkGt
 VaN+aHvaCQCDMJtFXIux2hehzL0TLccUXccYmziB68GNKQAA
X-Google-Smtp-Source: ABdhPJzq0T7SYoftdhczmsPM+Di8xpRuGlLyrSQ54z+TCXgzXKnZ2lZMy/v7Wy7N4Q4OALji5iXr+27LMG9WLEC1KJ4pfKSby0N+
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:160d:: with SMTP id
 t13mr640152ilu.231.1642719508334; 
 Thu, 20 Jan 2022 14:58:28 -0800 (PST)
Date: Thu, 20 Jan 2022 14:58:28 -0800
In-Reply-To: <000000000000bbdd0405d120c155@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c2906805d60b707c@google.com>
Subject: Re: [syzbot] KASAN: vmalloc-out-of-bounds Write in imageblit (2)
From: syzbot <syzbot+14b0e8f3fd1612e35350@syzkaller.appspotmail.com>
To: deller@gmx.de, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 21 Jan 2022 08:20:39 +0000
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    7fc5253f5a13 Add linux-next specific files for 20220120
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=16385270700000
kernel config:  https://syzkaller.appspot.com/x/.config?x=94e8da4df9ab6319
dashboard link: https://syzkaller.appspot.com/bug?extid=14b0e8f3fd1612e35350
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=155dde3db00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=125298e0700000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+14b0e8f3fd1612e35350@syzkaller.appspotmail.com

BUG: unable to handle page fault for address: fffff520008b2208
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 23ffed067 P4D 23ffed067 PUD 10db4067 PMD 1470c4067 PTE 0
Oops: 0000 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 3595 Comm: syz-executor362 Not tainted 5.16.0-next-20220120-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:fast_imageblit drivers/video/fbdev/core/sysimgblt.c:229 [inline]
RIP: 0010:sys_imageblit+0x656/0x1430 drivers/video/fbdev/core/sysimgblt.c:275
Code: 14 38 48 89 d8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 b6 0c 00 00 8b 44 24 20 23 03 8b 5c 24 18 31 c3 48 89 e8 48 c1 e8 03 <42> 0f b6 14 38 48 89 e8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85
RSP: 0018:ffffc90002a1f368 EFLAGS: 00010a02
RAX: 1ffff920008b2208 RBX: 0000000000000000 RCX: 0000000000000007
RDX: 0000000000000000 RSI: ffffffff84257bf0 RDI: 0000000000000003
RBP: ffffc90004591040 R08: 000000000000001f R09: ffffffff84257a74
R10: ffffffff84257be1 R11: 0000000000000020 R12: 0000000000000007
R13: 00000000000003ef R14: ffff888146efc7e0 R15: dffffc0000000000
FS:  0000555555c5d300(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: fffff520008b2208 CR3: 0000000023b12000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 drm_fb_helper_sys_imageblit drivers/gpu/drm/drm_fb_helper.c:794 [inline]
 drm_fbdev_fb_imageblit+0x15c/0x350 drivers/gpu/drm/drm_fb_helper.c:2288
 bit_putcs_unaligned drivers/video/fbdev/core/bitblit.c:124 [inline]
 bit_putcs+0x6e1/0xd20 drivers/video/fbdev/core/bitblit.c:173
 fbcon_putcs+0x353/0x440 drivers/video/fbdev/core/fbcon.c:1277
 do_update_region+0x399/0x630 drivers/tty/vt/vt.c:676
 invert_screen+0x1d4/0x600 drivers/tty/vt/vt.c:800
 highlight drivers/tty/vt/selection.c:57 [inline]
 clear_selection drivers/tty/vt/selection.c:84 [inline]
 clear_selection+0x55/0x70 drivers/tty/vt/selection.c:80
 vc_do_resize+0xe6e/0x1180 drivers/tty/vt/vt.c:1257
 fbcon_do_set_font+0x47a/0x760 drivers/video/fbdev/core/fbcon.c:1928
 fbcon_set_font+0x817/0xa00 drivers/video/fbdev/core/fbcon.c:2014
 con_font_set drivers/tty/vt/vt.c:4666 [inline]
 con_font_op+0x73a/0xc90 drivers/tty/vt/vt.c:4710
 vt_k_ioctl drivers/tty/vt/vt_ioctl.c:474 [inline]
 vt_ioctl+0x1e26/0x2b10 drivers/tty/vt/vt_ioctl.c:752
 tty_ioctl+0xbbd/0x1660 drivers/tty/tty_io.c:2778
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:874 [inline]
 __se_sys_ioctl fs/ioctl.c:860 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:860
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f3bac0e1349
Code: 28 c3 e8 2a 14 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffff160a718 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f3bac0e1349
RDX: 0000000020000000 RSI: 0000000000004b72 RDI: 0000000000000004
RBP: 00007f3bac0a51d0 R08: 000000000000000d R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f3bac0a5260
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
Modules linked in:
CR2: fffff520008b2208
---[ end trace 0000000000000000 ]---
RIP: 0010:fast_imageblit drivers/video/fbdev/core/sysimgblt.c:229 [inline]
RIP: 0010:sys_imageblit+0x656/0x1430 drivers/video/fbdev/core/sysimgblt.c:275
Code: 14 38 48 89 d8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 b6 0c 00 00 8b 44 24 20 23 03 8b 5c 24 18 31 c3 48 89 e8 48 c1 e8 03 <42> 0f b6 14 38 48 89 e8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85
RSP: 0018:ffffc90002a1f368 EFLAGS: 00010a02
RAX: 1ffff920008b2208 RBX: 0000000000000000 RCX: 0000000000000007
RDX: 0000000000000000 RSI: ffffffff84257bf0 RDI: 0000000000000003
RBP: ffffc90004591040 R08: 000000000000001f R09: ffffffff84257a74
R10: ffffffff84257be1 R11: 0000000000000020 R12: 0000000000000007
R13: 00000000000003ef R14: ffff888146efc7e0 R15: dffffc0000000000
FS:  0000555555c5d300(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: fffff520008b2208 CR3: 0000000023b12000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	14 38                	adc    $0x38,%al
   2:	48 89 d8             	mov    %rbx,%rax
   5:	83 e0 07             	and    $0x7,%eax
   8:	83 c0 03             	add    $0x3,%eax
   b:	38 d0                	cmp    %dl,%al
   d:	7c 08                	jl     0x17
   f:	84 d2                	test   %dl,%dl
  11:	0f 85 b6 0c 00 00    	jne    0xccd
  17:	8b 44 24 20          	mov    0x20(%rsp),%eax
  1b:	23 03                	and    (%rbx),%eax
  1d:	8b 5c 24 18          	mov    0x18(%rsp),%ebx
  21:	31 c3                	xor    %eax,%ebx
  23:	48 89 e8             	mov    %rbp,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 0f b6 14 38       	movzbl (%rax,%r15,1),%edx <-- trapping instruction
  2f:	48 89 e8             	mov    %rbp,%rax
  32:	83 e0 07             	and    $0x7,%eax
  35:	83 c0 03             	add    $0x3,%eax
  38:	38 d0                	cmp    %dl,%al
  3a:	7c 08                	jl     0x44
  3c:	84 d2                	test   %dl,%dl
  3e:	0f                   	.byte 0xf
  3f:	85                   	.byte 0x85

