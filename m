Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED815423A81
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 11:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D5A6ED72;
	Wed,  6 Oct 2021 09:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F9E6ED72
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 09:25:05 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id m26so1847748pff.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 02:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=YoKNEf2WSYB/PwAMSXP3Pm+YEc1WB69hZKGup8EMISM=;
 b=PdugfPRBmSgMLJz8TSMOmqaPuf0HSj2jFh24P+eXMctQ6KVC9AKc6JjRNci5ing4kp
 l47z0IiVYX/HP1tJRvWVXpfBUekNdCGbBKy3gx1GAd2ihOXbw3iCUtYpk0QRALk+aVBZ
 4syQ6n4sDriORW/ViLi++ivIbItNmNL8zP1LMrDFlnuo8jLiXDPCTtNpffLqrvFw55o1
 /Lfgf0brYcB3znqt1Nc+3NiNzfGkKD8uv9tdnwV8m4XL78H8kUKTODl4eDUv/mA7e+Qg
 EfsMDjfoCJvsluZzbiVPgfO89egX2AP3mbYZ3W13d6YAgfIr7IvijDi4P0WmW7rHUhuw
 0yTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YoKNEf2WSYB/PwAMSXP3Pm+YEc1WB69hZKGup8EMISM=;
 b=GEaO0z4OsATZyjG65dssvsAU7F+YNvdM4CXP72TrtmO5bcln8Zy9bHW/rqrin3Yyom
 sUoh3KfGoW2AnEskTGJJTLdEeLCd+H4xA9dAdXvYSK/C73nRdb1NaLFRo/DrfVmj9q8Y
 kXU7XfFmz399ytta4OwJK9kSGaWXGstbfT1KledE//szv/ygaU7JK9Niapl0FcCN6t0N
 i4NJTvYXlGpvJkpDcG8+JNguKctOouy2thY8DeqbFa1l/JjR0eLeb4ie0SEE5KQpwV2n
 XOOm/CIfPkk12giGPo1eSx5Q9xZfO/VmecrII2Fxu64Cx7SmaOsHTdn/+Eb0n/youKjL
 HTWw==
X-Gm-Message-State: AOAM533zmTcB6Ona1rc+nmpuJd2lpmE0xjVW3ey3sZndR+dpYoI9KaQD
 3uvwagbtULTKJ9XJk6GpH4GgoNN4H0hTdIB/wbZM6tqHewU7WKU=
X-Google-Smtp-Source: ABdhPJyCLQAb2aAMg7RpDcBBkAmHwbKxxU4/PLFxw+OhVQ9LWQoIpn86p+YJ9IanwZgaMo+CN7L0bGx+4ZYscUc998c=
X-Received: by 2002:a63:594a:: with SMTP id j10mr19701173pgm.205.1633512304644; 
 Wed, 06 Oct 2021 02:25:04 -0700 (PDT)
MIME-Version: 1.0
From: Hao Sun <sunhao.th@gmail.com>
Date: Wed, 6 Oct 2021 17:24:53 +0800
Message-ID: <CACkBjsaAFR4Jx3+pxM5zM09jFL1Th2pi-XNfn4CoSrjePmxSKQ@mail.gmail.com>
Subject: KASAN: vmalloc-out-of-bounds Write in imageblit
To: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

When using Healer to fuzz the latest Linux kernel, the following crash
was triggered.

HEAD commit: 42d43c92fc57  Merge branch 'for-linus'
git tree: upstream
console output:
https://drive.google.com/file/d/1fV8jSOKPspCPI-4i7Ee_FJIPIvz24MYu/view?usp=sharing
kernel config: https://drive.google.com/file/d/15vWoQRbJuuMu4ovWhUm1h4SrHyNwK8im/view?usp=sharing

Sorry, I don't have a reproducer for this crash, hope the symbolized
report can help.
If you fix this issue, please add the following tag to the commit:
Reported-by: Hao Sun <sunhao.th@gmail.com>

==================================================================
BUG: KASAN: vmalloc-out-of-bounds in fast_imageblit
drivers/video/fbdev/core/sysimgblt.c:229 [inline]
BUG: KASAN: vmalloc-out-of-bounds in sys_imageblit+0x1372/0x13f0
drivers/video/fbdev/core/sysimgblt.c:275
Write of size 4 at addr ffffc90005741000 by task syz-executor/15849

CPU: 0 PID: 15849 Comm: syz-executor Not tainted 5.15.0-rc3+ #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.13.0-1ubuntu1.1 04/01/2014
Call Trace:
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_address_description.constprop.0.cold+0xf/0x334 mm/kasan/report.c:256
 __kasan_report mm/kasan/report.c:442 [inline]
 kasan_report.cold+0x83/0xdf mm/kasan/report.c:459
 fast_imageblit drivers/video/fbdev/core/sysimgblt.c:229 [inline]
 sys_imageblit+0x1372/0x13f0 drivers/video/fbdev/core/sysimgblt.c:275
 drm_fb_helper_sys_imageblit+0x1c/0x180 drivers/gpu/drm/drm_fb_helper.c:794
 drm_fbdev_fb_imageblit+0x179/0x260 drivers/gpu/drm/drm_fb_helper.c:2276
 bit_putcs_unaligned drivers/video/fbdev/core/bitblit.c:139 [inline]
 bit_putcs+0x8ed/0xd80 drivers/video/fbdev/core/bitblit.c:188
 fbcon_putcs+0x362/0x450 drivers/video/fbdev/core/fbcon.c:1296
 do_update_region+0x399/0x630 drivers/tty/vt/vt.c:676
 invert_screen+0x2a7/0x610 drivers/tty/vt/vt.c:800
 highlight drivers/tty/vt/selection.c:57 [inline]
 clear_selection drivers/tty/vt/selection.c:84 [inline]
 clear_selection+0x55/0x70 drivers/tty/vt/selection.c:80
 vc_do_resize+0xda8/0x10a0 drivers/tty/vt/vt.c:1257
 fbcon_do_set_font+0x47e/0x780 drivers/video/fbdev/core/fbcon.c:2397
 fbcon_set_font+0x81e/0xa10 drivers/video/fbdev/core/fbcon.c:2483
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
RIP: 0033:0x7fbb0c85cc4d
Code: 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48
89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d
01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fbb09dc4c58 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fbb0c9830a0 RCX: 00007fbb0c85cc4d
RDX: 0000000020000080 RSI: 0000000000004b72 RDI: 0000000000000006
RBP: 00007fbb0c8d5d80 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fbb0c9830a0
R13: 00007ffdbece6b9f R14: 00007ffdbece6d40 R15: 00007fbb09dc4dc0


Memory state around the buggy address:
 ffffc90005740f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc90005740f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffffc90005741000: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
                   ^
 ffffc90005741080: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc90005741100: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
==================================================================
