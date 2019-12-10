Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F87118293
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6846E854;
	Tue, 10 Dec 2019 08:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A136E7D2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 04:35:08 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id i8so12394464ioi.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 20:35:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=ojUsEZmdHCxS3AxxhdmlegdxZox/znL15KjV4PQzpWY=;
 b=sMCjfc7NPLLdZd25SqmfAdQmucae/WaKCrPVQNeifmCFRR7gVb6M1t02gvnAXnzfJW
 25/VQZCTlNE0VUm01klkNLk71/szopyDW7uh5zxvdDtUjA4BTyNNtnZZ5C3kCFviOFmB
 L7d/4FnmIHB8bC1DDDO8IUXIaeNvMzG897/ElDwXtvL67eBAK+zo1PWi8EdPSDKUd/Yx
 LJyTLNJ0bfKHVThHYPTfU4qs0GgM5nmHCiNxf4AyjY+stYnfJss/JcDpQAO4ftowPt8e
 vXof1ntgplBXf1hLW5kCFiV9Gl+pKwWznfElmgLfPWbb7w3RMb9HIVMmprTaXLWoi+Az
 4GaA==
X-Gm-Message-State: APjAAAVoJUxhvbpjLrf01M1wD166wiHWrj8Mjs5TR8egq6WfhHy9piAF
 QrivI0VWjYgpIZ650KVPB9M+GL9uRIt6oA3JOaGNA8ldv9iq
X-Google-Smtp-Source: APXvYqxtY4ucMI2e+tz8tCQDhxmqZLWTzAv+U0BPSTC6krA/zKqyEzVTXXPPyX9XbROjO707XOsxABLM7n78xjcpZIous7+eq2US
MIME-Version: 1.0
X-Received: by 2002:a92:9f9c:: with SMTP id z28mr32065504ilk.239.1575952507966; 
 Mon, 09 Dec 2019 20:35:07 -0800 (PST)
Date: Mon, 09 Dec 2019 20:35:07 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006b9e8d059952095e@google.com>
Subject: KASAN: global-out-of-bounds Read in fbcon_get_font
From: syzbot <syzbot+29d4ed7f3bdedf2aa2fd@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, daniel.vetter@ffwll.ch, 
 dri-devel@lists.freedesktop.org, ghalat@redhat.com, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, sam@ravnborg.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Tue, 10 Dec 2019 08:40:04 +0000
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

Hello,

syzbot found the following crash on:

HEAD commit:    6cf8298d Add linux-next specific files for 20191209
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=168bbb7ae00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=682fc0ce6c86e3c7
dashboard link: https://syzkaller.appspot.com/bug?extid=29d4ed7f3bdedf2aa2fd
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12fff061e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+29d4ed7f3bdedf2aa2fd@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: global-out-of-bounds in memcpy include/linux/string.h:425  
[inline]
BUG: KASAN: global-out-of-bounds in fbcon_get_font+0x2b2/0x5e0  
drivers/video/fbdev/core/fbcon.c:2465
Read of size 32 at addr ffffffff88729d80 by task syz-executor.3/9100

CPU: 1 PID: 9100 Comm: syz-executor.3 Not tainted  
5.5.0-rc1-next-20191209-syzkaller #0
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
  memcpy include/linux/string.h:425 [inline]
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
RIP: 0033:0x45a6f9
Code: ad b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 7b b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f30314dcc78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 000000000045a6f9
RDX: 0000000000713000 RSI: 0000000000004b60 RDI: 0000000000000004
RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f30314dd6d4
R13: 00000000004c6d87 R14: 00000000004dd3e0 R15: 00000000ffffffff

The buggy address belongs to the variable:
  fontdata_8x16+0x1000/0x1120

Memory state around the buggy address:
  ffffffff88729c80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  ffffffff88729d00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> ffffffff88729d80: fa fa fa fa 06 fa fa fa fa fa fa fa 05 fa fa fa
                    ^
  ffffffff88729e00: fa fa fa fa 06 fa fa fa fa fa fa fa 00 00 03 fa
  ffffffff88729e80: fa fa fa fa 00 00 00 00 00 00 00 00 00 00 00 00
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
