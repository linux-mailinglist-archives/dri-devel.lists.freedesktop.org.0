Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 641E512E52F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 11:58:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2B26E05A;
	Thu,  2 Jan 2020 10:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53A089819
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jan 2020 17:40:09 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id c5so26843721ilo.9
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jan 2020 09:40:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=dlDUquUSid34wTs0EaeCvi3g5BVDKJEYFR2h2rGAZUY=;
 b=tepEbZO73FctiDFvLwWiMucByJVSyBu4skGwz0eIT4McntzR3Q9nper2BHBSzLTPUe
 V5CRNQhKOS03AyoRmTQRrYeN471rBz42fvt2UC2diBAX7mD4CiB6JuMoxEjSU1ya/IX5
 7AMr7lJAMKtGFffUDO6tdlnaNtiD0Aub6lCdocx/RBiVIlM5TMRpIMimWQ2Bug8/zqa0
 N//9y/TTHf7b7JtmCk5tAzvZNMRF+JRDRgblE0LNKjSy6rvnOfw9IhIIS+NCrGg7qERn
 mF9j5sWYHXCuYcpq+ybPz2AnVGadM04QrjX3mARS5fjo96m89QxgxjoHwPqcTxcPOpn4
 SYrA==
X-Gm-Message-State: APjAAAXK2vQH3hgP5c3QWkdyVoFTW/KakA4YX7pOeBQ0MN8peIyBfpso
 eGcyTVukswfq9+d9FTafo3ApYNTaMzH+0V40oBB3BjaVxl1S
X-Google-Smtp-Source: APXvYqwjLWzQhtldHSIvSoxEpIFmm1yMqfa38TDZsfdOnP8uZ5u4pwDFKG45bWIvUtPnXFYz7ab9KhYx9kGXOaFNxaUHqKuN+GAf
MIME-Version: 1.0
X-Received: by 2002:a6b:6d0f:: with SMTP id a15mr11076772iod.86.1577900408977; 
 Wed, 01 Jan 2020 09:40:08 -0800 (PST)
Date: Wed, 01 Jan 2020 09:40:08 -0800
In-Reply-To: <0000000000006b9e8d059952095e@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005e40e3059b17917c@google.com>
Subject: Re: KASAN: global-out-of-bounds Read in fbcon_get_font
From: syzbot <syzbot+29d4ed7f3bdedf2aa2fd@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, daniel.vetter@ffwll.ch, 
 dri-devel@lists.freedesktop.org, ghalat@redhat.com, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, sam@ravnborg.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Thu, 02 Jan 2020 10:58:15 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

syzbot has found a reproducer for the following crash on:

HEAD commit:    738d2902 Merge git://git.kernel.org/pub/scm/linux/kernel/g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14e396c1e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=874bac2ff63646fa
dashboard link: https://syzkaller.appspot.com/bug?extid=29d4ed7f3bdedf2aa2fd
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17a0b866e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15fc963ee00000

Bisection is inconclusive: the bug happens on the oldest tested release.

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15b75532e00000
final crash:    https://syzkaller.appspot.com/x/report.txt?x=17b75532e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=13b75532e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+29d4ed7f3bdedf2aa2fd@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: global-out-of-bounds in memcpy include/linux/string.h:380  
[inline]
BUG: KASAN: global-out-of-bounds in fbcon_get_font+0x2b2/0x5e0  
drivers/video/fbdev/core/fbcon.c:2465
Read of size 32 at addr ffffffff88729e80 by task syz-executor334/10190

CPU: 0 PID: 10190 Comm: syz-executor334 Not tainted 5.5.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x197/0x210 lib/dump_stack.c:118
  print_address_description.constprop.0.cold+0x5/0x30b mm/kasan/report.c:374
  __kasan_report.cold+0x1b/0x41 mm/kasan/report.c:506
  kasan_report+0x12/0x20 mm/kasan/common.c:639
  check_memory_region_inline mm/kasan/generic.c:185 [inline]
  check_memory_region+0x134/0x1a0 mm/kasan/generic.c:192
  memcpy+0x24/0x50 mm/kasan/common.c:125
  memcpy include/linux/string.h:380 [inline]
  fbcon_get_font+0x2b2/0x5e0 drivers/video/fbdev/core/fbcon.c:2465
  con_font_get drivers/tty/vt/vt.c:4446 [inline]
  con_font_op+0x20b/0x1270 drivers/tty/vt/vt.c:4605
  vt_ioctl+0xd2e/0x26d0 drivers/tty/vt/vt_ioctl.c:913
  tty_ioctl+0xa37/0x14f0 drivers/tty/tty_io.c:2660
  vfs_ioctl fs/ioctl.c:47 [inline]
  file_ioctl fs/ioctl.c:545 [inline]
  do_vfs_ioctl+0x977/0x14e0 fs/ioctl.c:732
  ksys_ioctl+0xab/0xd0 fs/ioctl.c:749
  __do_sys_ioctl fs/ioctl.c:756 [inline]
  __se_sys_ioctl fs/ioctl.c:754 [inline]
  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:754
  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x4412d9
Code: e8 3c ad 02 00 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 9b 09 fc ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ffc49b97f18 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00000000004a2487 RCX: 00000000004412d9
RDX: 0000000020000200 RSI: 0000000000004b60 RDI: 0000000000000004
RBP: 0000000000018ac7 R08: 000000000000000d R09: 00000000004002c8
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000402100
R13: 0000000000402190 R14: 0000000000000000 R15: 0000000000000000

The buggy address belongs to the variable:
  fontdata_8x16+0x1000/0x1120

Memory state around the buggy address:
  ffffffff88729d80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  ffffffff88729e00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> ffffffff88729e80: fa fa fa fa 06 fa fa fa fa fa fa fa 05 fa fa fa
                    ^
  ffffffff88729f00: fa fa fa fa 06 fa fa fa fa fa fa fa 00 00 03 fa
  ffffffff88729f80: fa fa fa fa 00 00 00 00 00 00 00 00 00 00 00 00
==================================================================

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
