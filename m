Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8F11CD267
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 09:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7736E6E26F;
	Mon, 11 May 2020 07:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DECE6E1BA
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 06:28:14 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id h17so8439367ior.16
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 23:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=SdfFMw5QKTbp52YZLfDLUPr8EGNvzpaeFUzU/UMWBC0=;
 b=jCYJ16kZsUSOvl/35YVw0eOH/loAw/gLwFuoNQ2cBAwlE8EMv5Zz7ZJujjfW7rkpWQ
 yOi70m1+mmEwtruWRNBUmRtQSO7XdJoOf9Jp0aXTqBVcA9YtIAyc9V5awOtFLGZ3N5th
 5naicmphVKLEH/2SZQwBxKklkI1UqQFivKKV4uQYG3gcYBnvpBM5t4pSbvZwlHBb9brQ
 T/lEGincSxYtRb7lkmbv1d3Lwz1fGhISp7OzAkWz3z/OL58P25OviYvfd86ceYdy1OHL
 rBySRZWziw5qRJOfQOVMpZ5X6t7POdeJXy6oHnE4z8q/kzQxtL/YcDyiEBV6okaPrdl0
 RJZA==
X-Gm-Message-State: AGi0Pua1yHK3FCmI0+5hpRTToFYzKJEenPml0ryffgS8vIrbnj3eKtNy
 Lf4tyYtFesIGuYqL1zjQS1WiLyFJNJb0wEkmjm7GJxgznbbQ
X-Google-Smtp-Source: APiQypLnnjc/3dhr0Q5a3fswFKEcUcTz5qP78a+YlI7XE6RnjODj+LmKxoJntZm/lCawPwk9fB9sIV9RcwKfW7XRKxPWXqr+1hce
MIME-Version: 1.0
X-Received: by 2002:a5d:91c6:: with SMTP id k6mr13800452ior.13.1589178493472; 
 Sun, 10 May 2020 23:28:13 -0700 (PDT)
Date: Sun, 10 May 2020 23:28:13 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000096951505a55973f9@google.com>
Subject: KASAN: vmalloc-out-of-bounds Write in drm_fb_helper_dirty_work (2)
From: syzbot <syzbot+839b7dbe276bd3648b70@syzkaller.appspotmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
X-Mailman-Approved-At: Mon, 11 May 2020 07:17:28 +0000
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

syzbot found the following crash on:

HEAD commit:    e99332e7 gcc-10: mark more functions __init to avoid secti..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13de23a2100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a45301b663dae85a
dashboard link: https://syzkaller.appspot.com/bug?extid=839b7dbe276bd3648b70
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+839b7dbe276bd3648b70@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: vmalloc-out-of-bounds in memcpy include/linux/string.h:381 [inline]
BUG: KASAN: vmalloc-out-of-bounds in drm_fb_helper_dirty_blit_real drivers/gpu/drm/drm_fb_helper.c:386 [inline]
BUG: KASAN: vmalloc-out-of-bounds in drm_fb_helper_dirty_work+0x3f5/0x6b0 drivers/gpu/drm/drm_fb_helper.c:415
Write of size 32 at addr ffffc900290e5fe0 by task kworker/3:3/10902

CPU: 3 PID: 10902 Comm: kworker/3:3 Not tainted 5.7.0-rc4-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
Workqueue: events drm_fb_helper_dirty_work
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x188/0x20d lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0x5/0x315 mm/kasan/report.c:382
 __kasan_report.cold+0x35/0x4d mm/kasan/report.c:511
 kasan_report+0x33/0x50 mm/kasan/common.c:625
 check_memory_region_inline mm/kasan/generic.c:187 [inline]
 check_memory_region+0x141/0x190 mm/kasan/generic.c:193
 memcpy+0x39/0x60 mm/kasan/common.c:107
 memcpy include/linux/string.h:381 [inline]
 drm_fb_helper_dirty_blit_real drivers/gpu/drm/drm_fb_helper.c:386 [inline]
 drm_fb_helper_dirty_work+0x3f5/0x6b0 drivers/gpu/drm/drm_fb_helper.c:415
 process_one_work+0x965/0x16a0 kernel/workqueue.c:2268
 worker_thread+0x96/0xe20 kernel/workqueue.c:2414
 kthread+0x388/0x470 kernel/kthread.c:268
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352


Memory state around the buggy address:
 ffffc900290e5e80: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
 ffffc900290e5f00: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
>ffffc900290e5f80: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
                                                       ^
 ffffc900290e6000: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
 ffffc900290e6080: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
