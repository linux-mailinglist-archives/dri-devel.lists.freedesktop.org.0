Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E27312A21A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 15:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A026E069;
	Tue, 24 Dec 2019 14:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B8F6E30C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 17:31:09 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id h87so14719186ild.11
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2019 09:31:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=eL67erF5b/D4o9JZa82w4s9J/Ia6904jypmJD84P8Jg=;
 b=MD3GBFsa2lRGHCzVP7kT8zoyVrlirWn7sbUfzyhKby12XOSFDWlqik2RpyPpFNM14y
 JXeDlC7ttAwwHgimy+b0dPu85wxcOTo0Vmbv3NdNi+aZb/V35Z9ya+UdlaF8A5OJIVfn
 I/Jf46gGKxm6l69j1eGyW671ObOlq2B5uJp9jcJ1cMVzcjQSDQWx9IfeAqw5VpKsU/hP
 l0oj8gaMWvz2BclbgSfyjManbDEkKhTXy4mfEdxO9tMWpBmpyXeJJFZLikRu0oHh8E75
 kK9/fuqjk7oKjcJk/Z2dbEG55y2EC5h1oD9FQLuhFn1tbbcXguA7PaivPNIUGHx1KiYo
 m2EQ==
X-Gm-Message-State: APjAAAXePAZN5Oiry8k4FEw9nfshYk+Pszvere21RIpZpXiWbj4CXqqm
 qK4cCL2PcPb1egnAGFCCMROcrr1piNoshJD/3Dj4mLDge/ce
X-Google-Smtp-Source: APXvYqyw7HWsVjlNRl3b6jvlwBnjYKNCBnTeC9/e8Rn4SkGEtpYdMlCoAuseRdhyiOaw02WHTHfNhxxp3E3BL7UiWNpZZj/WrlaC
MIME-Version: 1.0
X-Received: by 2002:a92:d18a:: with SMTP id z10mr27277028ilz.48.1577122268478; 
 Mon, 23 Dec 2019 09:31:08 -0800 (PST)
Date: Mon, 23 Dec 2019 09:31:08 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009484f4059a6264f6@google.com>
Subject: KASAN: vmalloc-out-of-bounds Write in drm_fb_helper_dirty_work
From: syzbot <syzbot+fd418471717e1e1aa783@syzkaller.appspotmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, sean@poorly.run, syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Tue, 24 Dec 2019 14:29:55 +0000
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

HEAD commit:    62104694 Merge branch 'parisc-5.5-2' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1711b6c1e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1b59a3066828ac4c
dashboard link: https://syzkaller.appspot.com/bug?extid=fd418471717e1e1aa783
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
userspace arch: i386

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+fd418471717e1e1aa783@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: vmalloc-out-of-bounds in memcpy include/linux/string.h:380  
[inline]
BUG: KASAN: vmalloc-out-of-bounds in drm_fb_helper_dirty_blit_real  
drivers/gpu/drm/drm_fb_helper.c:399 [inline]
BUG: KASAN: vmalloc-out-of-bounds in drm_fb_helper_dirty_work+0x44c/0x780  
drivers/gpu/drm/drm_fb_helper.c:428
Write of size 4064 at addr ffffc9000adea020 by task kworker/2:2/8685

CPU: 2 PID: 8685 Comm: kworker/2:2 Not tainted 5.5.0-rc2-syzkaller #0
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
  memcpy+0x38/0x50 mm/kasan/common.c:126
  memcpy include/linux/string.h:380 [inline]
  drm_fb_helper_dirty_blit_real drivers/gpu/drm/drm_fb_helper.c:399 [inline]
  drm_fb_helper_dirty_work+0x44c/0x780 drivers/gpu/drm/drm_fb_helper.c:428
  process_one_work+0x9af/0x1740 kernel/workqueue.c:2264
  worker_thread+0x98/0xe40 kernel/workqueue.c:2410
  kthread+0x361/0x430 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352


Memory state around the buggy address:
  ffffc9000ade9f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  ffffc9000ade9f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> ffffc9000adea000: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
                                ^
  ffffc9000adea080: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
  ffffc9000adea100: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
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
