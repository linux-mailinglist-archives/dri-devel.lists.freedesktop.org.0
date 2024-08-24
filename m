Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1018C95E2D7
	for <lists+dri-devel@lfdr.de>; Sun, 25 Aug 2024 11:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483F810E02E;
	Sun, 25 Aug 2024 09:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ucr.edu header.i=@ucr.edu header.b="hOUp4wYp";
	dkim=pass (1024-bit key; unprotected) header.d=ucr.edu header.i=@ucr.edu header.b="GP4puNsi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Sat, 24 Aug 2024 22:45:24 UTC
Received: from mx-lax3-1.ucr.edu (mx-lax3-1.ucr.edu [169.235.156.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF0210E1A3
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2024 22:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1724539524; x=1756075524;
 h=dkim-signature:x-google-dkim-signature:
 x-forwarded-encrypted:x-gm-message-state:
 x-google-smtp-source:mime-version:from:date:message-id:
 subject:to:content-type:x-cse-connectionguid: x-cse-msgguid;
 bh=aku1BGyPnFkzwCBLHItvSnqqXATipQbCvNjkisu2eTA=;
 b=hOUp4wYpVudv/70a65FkoBakbuZKdLz9iLfpxni+xHvrbfZDLJoCOY0t
 LSev+50hAZ+p+USNSo6cDDR2QxZ2O9tJ5JtEhNfcdm973u2bw3vnr9CN9
 ytA2FKCSHWPE1cBLUvBgH6Y1nvvcK8v9OWtpz55kdlZbbaVMG/F1JKEwC
 wZn6WVjmv0wRQbX4tFltjD+wj8oDTBTjaURp60lnz0ZUQAmjuw5SzuBH2
 hL4sD0x8fOBeVOObbF7W1eucJvm26rgzcJ3YFUjctemr0lTrZlmyAL9Hy
 gkHFyNJuQOwGsnpCYPmb7lDTl9Gck37P9+tsdfP2cx5DxEF6MQdgMC72u A==;
X-CSE-ConnectionGUID: ctMKxZaYTcOjYJEj1K1cWw==
X-CSE-MsgGUID: xCJB3dReQ+e+zRFZoDnroA==
Received: from mail-io1-f72.google.com ([209.85.166.72])
 by smtp-lax3-1.ucr.edu with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 24 Aug 2024 15:38:16 -0700
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-81f93601444so343471939f.2
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2024 15:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ucr.edu; s=rmail; t=1724539096; x=1725143896; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=XsiAD2fFCNgCPGwb7KVHK4effqndVE8zSBZgK6lYH2s=;
 b=GP4puNsiOkbO0og8Z7f60+ydQlf0zKHP2QC+Br/AbyqWTTFAlNNH8TbUGG2YBDmY7o
 cJbtsXBMP4nfk/2BZdzrSnyxhQpxehaeMT282XooW3ERDlH0Sp1eDwegaSXbQeJJZEkK
 vEJPQB7Vnwr2zZLnrU+6fR77L5HH573s3xSOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724539096; x=1725143896;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XsiAD2fFCNgCPGwb7KVHK4effqndVE8zSBZgK6lYH2s=;
 b=ddk4rRgUvO5iaZFuRIHrUO/UZiiCLkM+qrPtcxdPfk608bA81dNzrcdoaS26L4sLUx
 s1zb0A1TfPljbxvKJPghiHT9UkWhJibETHuwmsS6tAc1bd++g83OE/dNlDpujqHhWTqW
 63Q4487rRQzp489mu3Ep44Xe0WPQmRItoRz3Z2eMqpPVlAsp146/0+tHDKNY61kEEuDT
 HaJgP4MudsG9hXcwQxeaLmT38Uhn0vgb8fDWL2aQqF/0nMx6XdvByzYhbzOgsnRUIgfn
 7uyd4NIawlX1p0pn5iW3FGui7KQ1hJ/zeZ9/zDwwuFqvcGcmQ4x7fypdHum4XJZRJh8d
 bLtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkCJszsQLLgLsYhWYjtrnkrCSrQloT/52HI/WxVhqnD1GYnZW1Y5HjXH4sWxdF2CRxwMjfToycdgY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmHcVXN051BnRoe+ZMndMx70e+0v434wtIaam+av4DUpviPJ9S
 DOIhH5Jkby74PDAI5ZUSTYJl72cjC1n5vDswkCSAcaVDT0gXDdDRWp7OcokSHJaci49uYzKyMqG
 oH4mG9RZQAXRKzXjOGwZV1TXm4blqLLnu+YQPLUxSQxQYXUjWa3bhL9Rxeq68HK+idohwkpCPP2
 3eO1eWNvtsV43dn0YyvAGO7cjENxL88cz3Sc+LPOHvZA==
X-Received: by 2002:a05:6602:2c87:b0:824:d7b5:45e with SMTP id
 ca18e2360f4ac-82787323b43mr745863239f.3.1724539095701; 
 Sat, 24 Aug 2024 15:38:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGxRcU/vOsaC2nI2v7TINLpWQIGNtj/+p/YES/rNZzZJPEnEirmzlZsGv/ueCxgr72bCGOAQ0rFCWZfuydb2g=
X-Received: by 2002:a05:6602:2c87:b0:824:d7b5:45e with SMTP id
 ca18e2360f4ac-82787323b43mr745861939f.3.1724539095334; Sat, 24 Aug 2024
 15:38:15 -0700 (PDT)
MIME-Version: 1.0
From: Juefei Pu <juefei.pu@email.ucr.edu>
Date: Sat, 24 Aug 2024 15:38:03 -0700
Message-ID: <CANikGpcJF23qVPYMkjFG084kTP8oo4-9Jkp=JFO+SxB3BMJuKQ@mail.gmail.com>
Subject: BUG: KASAN: vmalloc-out-of-bounds Write in imageblit
To: daniel@ffwll.ch, deller@gmx.de, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 25 Aug 2024 09:07:42 +0000
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
We found the following issue using syzkaller on Linux v6.10.
In `fast_imageblit`, there is an out-of-bounds memory access when
executing `*dst++ = colortab[(*src >> 7) & bit_mask];`

Although Syzbot has found a similar bug
(https://syzkaller.appspot.com/bug?extid=3d3864c27a5e770e7654), the
bug we discovered can be triggered on Linux v6.10. Meanwhile, Syzbot
failed to trigger the crash for 396 days. Thus, it looks like this is
a new bug.

Unfortunately, the syzkaller failed to generate a reproducer.
But at least we have the report:

==================================================================
BUG: KASAN: vmalloc-out-of-bounds in fast_imageblit
drivers/video/fbdev/core/sysimgblt.c:257 [inline]
BUG: KASAN: vmalloc-out-of-bounds in sys_imageblit+0x1c22/0x2600
drivers/video/fbdev/core/sysimgblt.c:326
Write of size 4 at addr ffffc90002ad9190 by task syz.0.802/17876

CPU: 0 PID: 17876 Comm: syz.0.802 Not tainted 6.10.0 #13
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x23d/0x360 lib/dump_stack.c:114
 print_address_description+0x77/0x360 mm/kasan/report.c:377
 print_report+0xfd/0x210 mm/kasan/report.c:488
 kasan_report+0x13f/0x170 mm/kasan/report.c:601
 fast_imageblit drivers/video/fbdev/core/sysimgblt.c:257 [inline]
 sys_imageblit+0x1c22/0x2600 drivers/video/fbdev/core/sysimgblt.c:326
 drm_fbdev_generic_defio_imageblit+0x2a/0xf0
drivers/gpu/drm/drm_fbdev_generic.c:37
 bit_putcs+0x18a3/0x1d90
 fbcon_putcs+0x34f/0x520 drivers/video/fbdev/core/fbcon.c:1288
 con_putc drivers/tty/vt/vt.c:302 [inline]
 complement_pos+0x3f4/0xa70 drivers/tty/vt/vt.c:757
 highlight_pointer drivers/tty/vt/selection.c:63 [inline]
 clear_selection+0x17/0x70 drivers/tty/vt/selection.c:85
 hide_cursor+0x80/0x480 drivers/tty/vt/vt.c:844
 redraw_screen+0x1d7/0xe70 drivers/tty/vt/vt.c:948
 fbcon_blank+0x61f/0xae0 drivers/video/fbdev/core/fbcon.c:2231
 do_unblank_screen+0x294/0x760 drivers/tty/vt/vt.c:4563
 unblank_screen drivers/tty/vt/vt.c:4582 [inline]
 tioclinux+0x186/0x4c0 drivers/tty/vt/vt.c:3357
 vt_ioctl+0x9d4/0x2060 drivers/tty/vt/vt_ioctl.c:761
 tty_ioctl+0x906/0xdb0 drivers/tty/tty_io.c:2803
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0xfe/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0x7e/0x150 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x67/0x6f
RIP: 0033:0x7f77eff809b9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48
89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d
01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f77f0e57038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f77f0145f80 RCX: 00007f77eff809b9
RDX: 0000000020000580 RSI: 000000000000541c RDI: 0000000000000018
RBP: 00007f77efff4f70 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f77f0145f80 R15: 00007ffd3ddd4628
 </TASK>

Memory state around the buggy address:
 ffffc90002ad9080: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc90002ad9100: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
>ffffc90002ad9180: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
                         ^
 ffffc90002ad9200: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc90002ad9280: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
==================================================================
