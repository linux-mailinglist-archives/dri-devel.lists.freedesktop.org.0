Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 214831292E2
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:12:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064106E218;
	Mon, 23 Dec 2019 08:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B161F6EBCA
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 04:41:10 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id b25so5279711ioh.10
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 20:41:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=4uPXf7+5cmKfc17p96HCeqIMddSPnfeSwGfxcNcV1vs=;
 b=HEZFqVAqMqT8xOrI/vNS/hgkHZ2ix9SdeoyQH07XzpV+ntVEU8lvW/g5M/XiFx/55W
 dRbvpb5QkYW+0pPfByPa2qNwYPlrGAl0MYd5yvWdHZwygMMUEG6ge0mFyR17iS9NS7fj
 y5DjdlG164S5LsqEZK/0Wm4qyey76vp6QW+HmPICiXXvGRKSvqYkYCFvyeVA2NBNNBzC
 SZWRB5UN/XJ4bO8//ZZqLAm4JfxzsMbUzU/HtzgzVxeaQ+TACL2EB87MuB2GusGz7DTv
 LDDTyHHVcuRyQxSbHfiGCR/3wdn8PZtx6/4eDCYfap2GGwLPv/bx4LIq2R9j7SA/BZKJ
 LE5A==
X-Gm-Message-State: APjAAAWxY6+J987Hj0qbd3VjJU31lKyIfddQCUnFis0qr8A/DIqCcMWj
 x28dG8IxG2ZaUJB0DReartS9XqTKIC1swZCfbI7Gz+lmY6Q/
X-Google-Smtp-Source: APXvYqwGL1EOWqCo952R7Tl2YpRQuyx8C7wZ/6pdyILMGCFvseoNbsMAmysSfaivn8KYDekccEYeUYcwi0tfdA7kCi4JZS+4yKIo
MIME-Version: 1.0
X-Received: by 2002:a6b:a0a:: with SMTP id z10mr8157848ioi.190.1576816869932; 
 Thu, 19 Dec 2019 20:41:09 -0800 (PST)
Date: Thu, 19 Dec 2019 20:41:09 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000688674059a1b4925@google.com>
Subject: KASAN: vmalloc-out-of-bounds Read in drm_fb_helper_dirty_work
From: syzbot <syzbot+5d11928e253121e6c196@syzkaller.appspotmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, sean@poorly.run, syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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

HEAD commit:    7e0165b2 Merge branch 'akpm' (patches from Andrew)
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1619eb1ee00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1b59a3066828ac4c
dashboard link: https://syzkaller.appspot.com/bug?extid=5d11928e253121e6c196
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
userspace arch: i386

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+5d11928e253121e6c196@syzkaller.appspotmail.com

BUG: KASAN: vmalloc-out-of-bounds in memcpy include/linux/string.h:380  
[inline]
BUG: KASAN: vmalloc-out-of-bounds in drm_fb_helper_dirty_blit_real  
drivers/gpu/drm/drm_fb_helper.c:399 [inline]
BUG: KASAN: vmalloc-out-of-bounds in drm_fb_helper_dirty_work+0x44c/0x780  
drivers/gpu/drm/drm_fb_helper.c:428
Read of size 4096 at addr ffffc90008bc1000 by task kworker/1:3/17225

CPU: 1 PID: 17225 Comm: kworker/1:3 Not tainted 5.5.0-rc2-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS  
rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
Workqueue: events drm_fb_helper_dirty_work
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
  drm_fb_helper_dirty_blit_real drivers/gpu/drm/drm_fb_helper.c:399 [inline]
  drm_fb_helper_dirty_work+0x44c/0x780 drivers/gpu/drm/drm_fb_helper.c:428
  process_one_work+0x9af/0x1740 kernel/workqueue.c:2264
  worker_thread+0x98/0xe40 kernel/workqueue.c:2410
  kthread+0x361/0x430 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352


Memory state around the buggy address:
  ffffc90008bc0f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  ffffc90008bc0f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> ffffc90008bc1000: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
                    ^
  ffffc90008bc1080: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
  ffffc90008bc1100: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
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
