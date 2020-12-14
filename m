Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A752DA8E5
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 09:07:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6809489B33;
	Tue, 15 Dec 2020 08:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4A86E112
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 09:13:12 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id q2so12952952ilt.20
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 01:13:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=Xwq+h39/FNGcyxtgEq8iwiPV6bbaAoQGXtrZlx1lkEA=;
 b=L7feVYq2dSYb6sZSUMWCmSG1AjYWSzkw3vr4u+X/T4qsEutx6w8q7sX2bfSgKnDcJA
 jZzWQCdUPuAc/R6twBs5rBW2nO5SpMRYzgHqzw+YGlLZ7LqfNXA0kKVIt25s1UKT3cOP
 isN7SWmX3A6KWHq5urBLGP+rgFxJx0Vw0GTLWN6xwh7NJ4fJtl+dheEiiBbCLky+8AdE
 +hLl3mKuzG2OtmtoANe8i93ZORGN/xSdElGhuDzCT0YcUeiVSTLS9BLeWVpJAkJabiMg
 rnmnllJrEXTNWL0mh0O/HSX/lh5OQj5v/EBHYK1DItw21n6aTv5r2B+AdF1PK4anXbXz
 RnjQ==
X-Gm-Message-State: AOAM5315XZTsHbdGMZpGlw5xrTUDbFnG/jwU4Mv/jfypSSJo3x4KYwYo
 R0dYD5OQrthb5BdN3w25rGPHJB4CcD46ah/zYWzESW2AhRQE
X-Google-Smtp-Source: ABdhPJw8ZFAjwxvmwvqPi0SPPyyv9Z+QTUIXnzL62HLv85D0ycwzfSH4pN+2ewuQ8JhjdX086viZYubBgKBUbuHzI2tIbDYzaqrl
MIME-Version: 1.0
X-Received: by 2002:a92:998c:: with SMTP id t12mr10118400ilk.140.1607937191228; 
 Mon, 14 Dec 2020 01:13:11 -0800 (PST)
Date: Mon, 14 Dec 2020 01:13:11 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001aba8205b6690d78@google.com>
Subject: memory leak in dlfb_usb_probe
From: syzbot <syzbot+c9e365d7f450e8aa615d@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, bernie@plugable.com, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Tue, 15 Dec 2020 08:06:55 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

syzbot found the following issue on:

HEAD commit:    a68a0262 mm/madvise: remove racy mm ownership check
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1538046b500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4305fa9ea70c7a9f
dashboard link: https://syzkaller.appspot.com/bug?extid=c9e365d7f450e8aa615d
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1779cc13500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1173d00f500000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c9e365d7f450e8aa615d@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff88810adde100 (size 32):
  comm "kworker/1:0", pid 17, jiffies 4294947788 (age 19.520s)
  hex dump (first 32 bytes):
    10 30 c3 0d 81 88 ff ff c0 fa 63 12 81 88 ff ff  .0........c.....
    00 30 c3 0d 81 88 ff ff 80 d1 3a 08 81 88 ff ff  .0........:.....
  backtrace:
    [<0000000019512953>] kmalloc include/linux/slab.h:552 [inline]
    [<0000000019512953>] kzalloc include/linux/slab.h:664 [inline]
    [<0000000019512953>] dlfb_alloc_urb_list drivers/video/fbdev/udlfb.c:1892 [inline]
    [<0000000019512953>] dlfb_usb_probe.cold+0x289/0x988 drivers/video/fbdev/udlfb.c:1704
    [<0000000072160152>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
    [<00000000a8d6726f>] really_probe+0x159/0x480 drivers/base/dd.c:554
    [<00000000c3ce4b0e>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
    [<00000000e942e01c>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
    [<00000000de0a5a5c>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<00000000463fbcb4>] __device_attach+0x122/0x250 drivers/base/dd.c:912
    [<00000000b881a711>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<00000000364bbda5>] device_add+0x5ac/0xc30 drivers/base/core.c:2936
    [<00000000eecca418>] usb_set_configuration+0x9de/0xb90 drivers/usb/core/message.c:2159
    [<00000000edfeca2d>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<000000001830872b>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<00000000a8d6726f>] really_probe+0x159/0x480 drivers/base/dd.c:554
    [<00000000c3ce4b0e>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
    [<00000000e942e01c>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
    [<00000000de0a5a5c>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431

BUG: memory leak
unreferenced object 0xffff8881083ad180 (size 192):
  comm "kworker/1:0", pid 17, jiffies 4294947788 (age 19.520s)
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 98 d1 3a 08 81 88 ff ff  ..........:.....
  backtrace:
    [<00000000a7783a78>] kmalloc include/linux/slab.h:557 [inline]
    [<00000000a7783a78>] usb_alloc_urb+0x66/0xe0 drivers/usb/core/urb.c:74
    [<0000000082822843>] dlfb_alloc_urb_list drivers/video/fbdev/udlfb.c:1897 [inline]
    [<0000000082822843>] dlfb_usb_probe.cold+0x2aa/0x988 drivers/video/fbdev/udlfb.c:1704
    [<0000000072160152>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
    [<00000000a8d6726f>] really_probe+0x159/0x480 drivers/base/dd.c:554
    [<00000000c3ce4b0e>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
    [<00000000e942e01c>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
    [<00000000de0a5a5c>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<00000000463fbcb4>] __device_attach+0x122/0x250 drivers/base/dd.c:912
    [<00000000b881a711>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<00000000364bbda5>] device_add+0x5ac/0xc30 drivers/base/core.c:2936
    [<00000000eecca418>] usb_set_configuration+0x9de/0xb90 drivers/usb/core/message.c:2159
    [<00000000edfeca2d>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<000000001830872b>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<00000000a8d6726f>] really_probe+0x159/0x480 drivers/base/dd.c:554
    [<00000000c3ce4b0e>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
    [<00000000e942e01c>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844

BUG: memory leak
unreferenced object 0xffff88811263fb20 (size 32):
  comm "kworker/1:0", pid 17, jiffies 4294947788 (age 19.530s)
  hex dump (first 32 bytes):
    00 fb 63 12 81 88 ff ff 10 30 c3 0d 81 88 ff ff  ..c......0......
    00 30 c3 0d 81 88 ff ff c0 53 c8 0b 81 88 ff ff  .0.......S......
  backtrace:
    [<0000000019512953>] kmalloc include/linux/slab.h:552 [inline]
    [<0000000019512953>] kzalloc include/linux/slab.h:664 [inline]
    [<0000000019512953>] dlfb_alloc_urb_list drivers/video/fbdev/udlfb.c:1892 [inline]
    [<0000000019512953>] dlfb_usb_probe.cold+0x289/0x988 drivers/video/fbdev/udlfb.c:1704
    [<0000000072160152>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
    [<00000000a8d6726f>] really_probe+0x159/0x480 drivers/base/dd.c:554
    [<00000000c3ce4b0e>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
    [<00000000e942e01c>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
    [<00000000de0a5a5c>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<00000000463fbcb4>] __device_attach+0x122/0x250 drivers/base/dd.c:912
    [<00000000b881a711>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<00000000364bbda5>] device_add+0x5ac/0xc30 drivers/base/core.c:2936
    [<00000000eecca418>] usb_set_configuration+0x9de/0xb90 drivers/usb/core/message.c:2159
    [<00000000edfeca2d>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<000000001830872b>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<00000000a8d6726f>] really_probe+0x159/0x480 drivers/base/dd.c:554
    [<00000000c3ce4b0e>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
    [<00000000e942e01c>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
    [<00000000de0a5a5c>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431



---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
