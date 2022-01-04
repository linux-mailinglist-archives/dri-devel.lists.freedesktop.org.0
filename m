Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F7A484F44
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 09:25:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D1210E74C;
	Wed,  5 Jan 2022 08:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E133810E22B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 11:56:36 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id i3so92882895ybh.11
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 03:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=upNf2N+sZesjCGqw0UVX9CdOdW/DyupehC36BgvdZNU=;
 b=lZ364rzyvOSX9lsSkPjr/PZozlUhwtAyEsWP8XkPCPKltuP5o8RrR85NN4Tn6sPEk7
 ZLaWSIM9bh/8f9lxYxGdyMv0nud3HtEpFwMrkguD7wE3ePrE+KrkdmOALg1lru8bBMvh
 /IktAjB2rEJtqQKgAkThl6+8npvZW27FiCg3yKea8Yj1LYY+IcKsGtWehLsN4FnKuq5Z
 aWS9aX2nEFFKsjeI8nss1KGsDNMURIQ+QGgiU8QXqCBdRLeEewkbThduMn+3CdWb1ia7
 bNKj9TE/HbzPTWXNM2bJutk1LuZWGdvnRhzQaNZrIJmiuWMheux6K99C5G4OaRKDGP8f
 yD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=upNf2N+sZesjCGqw0UVX9CdOdW/DyupehC36BgvdZNU=;
 b=oaXDRumIpCrqHRD2HgiKGNhyQkvc7c2+p7XoqLrne/RFco4//xHY+l4omvpyBCCLS3
 KdxYLplyUOn9FENlfsErsKULXbYL5o8/7cGc4f5diBOlIgzXN2TbOPzb9MQR11ApnVyh
 RwKLD7fxu2pfWroHwa8si85XQ6V5Lgfd3CqRj68foPzkLquyra13CSLYVZ5zsiXFScjw
 mF/0aRAaTEce7ivi/2UAx352xFOre0/0DLjlcF7UckeiYLF8+dAgHDNVPEZGZCcdA45Z
 3ZroE0iwo+OYPQFBMWbGIIJpH7Ij2WCK+qix978WLtcP22FIrwJRr7RRofxDfb8t3fk6
 t7+A==
X-Gm-Message-State: AOAM5302DN63YJvTeX2JwvoOqkqr7HgtgiacVayHMBrZ5JtaxIhMS3le
 bb7RkYWtAJ3sMQhcuFxjZIDm1aEncW0DSScuzXcjH0Vc4kJ6fg==
X-Google-Smtp-Source: ABdhPJyf+ysqovT+2BI1DGA/j5lHpCNGdJ42tn+ff3WDExvhwrpfSV1Jw7lbe4IK8fCevphCssZTq3lybJd0SdJEiKE=
X-Received: by 2002:a25:3417:: with SMTP id b23mr53262086yba.91.1641297395888; 
 Tue, 04 Jan 2022 03:56:35 -0800 (PST)
MIME-Version: 1.0
From: kvartet <xyru1999@gmail.com>
Date: Tue, 4 Jan 2022 19:56:25 +0800
Message-ID: <CAFkrUsi+DzxLrMNQ=ztz-NbTPyV4zaHdwC5DrZMnr_GR8388vw@mail.gmail.com>
Subject: BUG: unable to handle kernel paging request in imageblit
To: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 05 Jan 2022 08:24:54 +0000
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
Cc: sunhao.th@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

When using Syzkaller to fuzz the latest Linux kernel, the following
crash was triggered.

HEAD commit: a7904a538933 Linux 5.16-rc6
git tree: upstream
console output: https://paste.ubuntu.com/p/Rvt9f7wByG/plain/
kernel config: https://paste.ubuntu.com/p/FDDNHDxtwz/plain/
C reproducer: https://paste.ubuntu.com/p/KzH8Wx9H9R/plain/
Syzlang reproducer: https://paste.ubuntu.com/p/cDfk6NK4S4/plain/

If you fix this issue, please add the following tag to the commit:
Reported-by: Yiru Xu <xyru1999@gmail.com>


BUG: unable to handle page fault for address: fffff520009cf200
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 13ffed067 P4D 13ffed067 PUD 10dba067 PMD 18fd2067 PTE 0
Oops: 0000 [#1] PREEMPT SMP KASAN
CPU: 1 PID: 19972 Comm: syz-executor.5 Not tainted 5.16.0-rc6 #9
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.13.0-1ubuntu1.1 04/01/2014
RIP: 0010:fast_imageblit drivers/video/fbdev/core/sysimgblt.c:229 [inline]
RIP: 0010:sys_imageblit+0x650/0x13f0 drivers/video/fbdev/core/sysimgblt.c:275
Code: 03 38 d0 7c 08 84 d2 0f 85 44 0d 00 00 48 bf 00 00 00 00 00 fc
ff df 8b 44 24 30 23 03 8b 5c 24 20 31 c3 4c 89 f0 48 c1 e8 03 <0f> b6
14 38 4c 89 f0 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 01
RSP: 0018:ffffc9000324f330 EFLAGS: 00010216
RAX: 1ffff920009cf200 RBX: 0000000000000000 RCX: 0000000000000007
RDX: 0000000000000000 RSI: dffffc0000000000 RDI: dffffc0000000000
RBP: ffff8880198c4000 R08: ffffffff841fac07 R09: 000000000000001f
R10: 0000000000000005 R11: fffffbfff1b20a42 R12: 0000000000000007
R13: 000000000000094b R14: ffffc90004e79000 R15: ffffc90004e79004
FS:  00007f59ce6a3700(0000) GS:ffff888135c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: fffff520009cf200 CR3: 000000010d39f000 CR4: 0000000000350ee0
Call Trace:
 <TASK>
 drm_fb_helper_sys_imageblit+0x1c/0x180 drivers/gpu/drm/drm_fb_helper.c:794
 drm_fbdev_fb_imageblit+0x179/0x260 drivers/gpu/drm/drm_fb_helper.c:2288
 bit_putcs_unaligned drivers/video/fbdev/core/bitblit.c:124 [inline]
 bit_putcs+0x8ed/0xd80 drivers/video/fbdev/core/bitblit.c:173
 fbcon_putcs+0x367/0x450 drivers/video/fbdev/core/fbcon.c:1277
 do_update_region+0x399/0x630 drivers/tty/vt/vt.c:676
 invert_screen+0x2a7/0x610 drivers/tty/vt/vt.c:800
 highlight drivers/tty/vt/selection.c:57 [inline]
 clear_selection drivers/tty/vt/selection.c:84 [inline]
 clear_selection+0x55/0x70 drivers/tty/vt/selection.c:80
 vc_do_resize+0xda8/0x10a0 drivers/tty/vt/vt.c:1257
 fbcon_do_set_font+0x472/0x770 drivers/video/fbdev/core/fbcon.c:1928
 fbcon_set_font+0x80f/0xa00 drivers/video/fbdev/core/fbcon.c:2014
 con_font_set drivers/tty/vt/vt.c:4666 [inline]
 con_font_op+0x73a/0xca0 drivers/tty/vt/vt.c:4710
 vt_k_ioctl drivers/tty/vt/vt_ioctl.c:474 [inline]
 vt_ioctl+0x1de9/0x2af0 drivers/tty/vt/vt_ioctl.c:752
 tty_ioctl+0xc80/0x1450 drivers/tty/tty_io.c:2805
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:874 [inline]
 __se_sys_ioctl fs/ioctl.c:860 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:860
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f59cfd3189d
Code: 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48
89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d
01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f59ce6a2c28 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f59cfe50f60 RCX: 00007f59cfd3189d
RDX: 0000000020000080 RSI: 0000000000004b72 RDI: 0000000000000005
RBP: 00007f59cfd9e00d R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffd4f88b4ff R14: 00007f59cfe50f60 R15: 00007f59ce6a2dc0
 </TASK>
Modules linked in:
CR2: fffff520009cf200
---[ end trace 4fd686b04a4d7413 ]---
RIP: 0010:fast_imageblit drivers/video/fbdev/core/sysimgblt.c:229 [inline]
RIP: 0010:sys_imageblit+0x650/0x13f0 drivers/video/fbdev/core/sysimgblt.c:275
Code: 03 38 d0 7c 08 84 d2 0f 85 44 0d 00 00 48 bf 00 00 00 00 00 fc
ff df 8b 44 24 30 23 03 8b 5c 24 20 31 c3 4c 89 f0 48 c1 e8 03 <0f> b6
14 38 4c 89 f0 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 01
RSP: 0018:ffffc9000324f330 EFLAGS: 00010216
RAX: 1ffff920009cf200 RBX: 0000000000000000 RCX: 0000000000000007
RDX: 0000000000000000 RSI: dffffc0000000000 RDI: dffffc0000000000
RBP: ffff8880198c4000 R08: ffffffff841fac07 R09: 000000000000001f
R10: 0000000000000005 R11: fffffbfff1b20a42 R12: 0000000000000007
R13: 000000000000094b R14: ffffc90004e79000 R15: ffffc90004e79004
FS:  00007f59ce6a3700(0000) GS:ffff888135c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: fffff520009cf200 CR3: 000000010d39f000 CR4: 0000000000350ee0
----------------
Code disassembly (best guess), 1 bytes skipped:
   0: 38 d0                cmp    %dl,%al
   2: 7c 08                jl     0xc
   4: 84 d2                test   %dl,%dl
   6: 0f 85 44 0d 00 00    jne    0xd50
   c: 48 bf 00 00 00 00 00 movabs $0xdffffc0000000000,%rdi
  13: fc ff df
  16: 8b 44 24 30          mov    0x30(%rsp),%eax
  1a: 23 03                and    (%rbx),%eax
  1c: 8b 5c 24 20          mov    0x20(%rsp),%ebx
  20: 31 c3                xor    %eax,%ebx
  22: 4c 89 f0              mov    %r14,%rax
  25: 48 c1 e8 03          shr    $0x3,%rax
* 29: 0f b6 14 38          movzbl (%rax,%rdi,1),%edx <-- trapping instruction
  2d: 4c 89 f0              mov    %r14,%rax
  30: 83 e0 07              and    $0x7,%eax
  33: 83 c0 03              add    $0x3,%eax
  36: 38 d0                cmp    %dl,%al
  38: 7c 08                jl     0x42
  3a: 84 d2                test   %dl,%dl
  3c: 0f                    .byte 0xf
  3d: 85 01                test   %eax,(%rcx)

Best Regards,
Yiru
