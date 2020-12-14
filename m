Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CE02DA8F2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 09:07:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3D46E175;
	Tue, 15 Dec 2020 08:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556906E218
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 13:46:11 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id t23so10975565ioh.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 05:46:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=u5uOJTkvi9oLcz7eMTJJP02g8EDZk0rHridQXPr2iyA=;
 b=CuB/sdquinjiVxbN62Kor9Fb7N8lB74KyuAgQHE/lYuy8sDaoQWqPA+aJyi42zptEU
 EFyP/t7y9ZhBnfkLjsdcpzwIWFX/nW/9KdkYZGJT3lyEGWhpwQ5swh165NC6hWwsTGX0
 KWEAmDeiBTK+NGWUVxk3AUCJzPEnJcZnJPeuhVEIFQ98oF5B9dAfkPgCaYkP3FjEwy5+
 ReocT0I4SvLwcCah2LHsspA6yWyElGvTKbjAScOziOTyzm6VJwKcptpJJII4/LKilAer
 8tKjp6qE+jctq7ZLh73FjsLSamnq+0lst5OHdiu9Flf7c0s9MaYoc79vISCT590zuYWi
 4l2w==
X-Gm-Message-State: AOAM530nRDSdh8IcR/DjfX9aCjet8Q2SdJxRP8BLfOpwkFc083QZiXbZ
 vFKNEc8mAGhNx32gdwD+l2rdpXrIvb1gBoOYOn/3ECdVmdQ4
X-Google-Smtp-Source: ABdhPJw30Zf+SQWT4CZg+eXyhFKthUhneApcpWHnyF2LbdX5WYe+Qia53e6TuouwwLQaVEigd+Q2wIqtoMj2DZQzRnP6aZNujfO7
MIME-Version: 1.0
X-Received: by 2002:a05:6602:150b:: with SMTP id
 g11mr32252338iow.88.1607953570678; 
 Mon, 14 Dec 2020 05:46:10 -0800 (PST)
Date: Mon, 14 Dec 2020 05:46:10 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000654c9c05b66cdd73@google.com>
Subject: KASAN: vmalloc-out-of-bounds Read in drm_fb_helper_dirty_work (2)
From: syzbot <syzbot+cc9acdabdf6ea0c8dc0b@syzkaller.appspotmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
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

HEAD commit:    a2f5ea9e Merge tag 'arm-soc-fixes-v5.10-4b' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=167b497b500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=868cd1c95c02180
dashboard link: https://syzkaller.appspot.com/bug?extid=cc9acdabdf6ea0c8dc0b
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cc9acdabdf6ea0c8dc0b@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: vmalloc-out-of-bounds in memcpy include/linux/string.h:399 [inline]
BUG: KASAN: vmalloc-out-of-bounds in drm_fb_helper_dirty_blit_real drivers/gpu/drm/drm_fb_helper.c:403 [inline]
BUG: KASAN: vmalloc-out-of-bounds in drm_fb_helper_dirty_work+0x42e/0x810 drivers/gpu/drm/drm_fb_helper.c:435
Read of size 3168 at addr ffffc9000b8613a0 by task kworker/0:5/11875

CPU: 0 PID: 11875 Comm: kworker/0:5 Not tainted 5.10.0-rc7-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
Workqueue: events drm_fb_helper_dirty_work
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x107/0x163 lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0x5/0x497 mm/kasan/report.c:385
 __kasan_report mm/kasan/report.c:545 [inline]
 kasan_report.cold+0x1f/0x37 mm/kasan/report.c:562
 check_memory_region_inline mm/kasan/generic.c:186 [inline]
 check_memory_region+0x13d/0x180 mm/kasan/generic.c:192
 memcpy+0x20/0x60 mm/kasan/common.c:105
 memcpy include/linux/string.h:399 [inline]
 drm_fb_helper_dirty_blit_real drivers/gpu/drm/drm_fb_helper.c:403 [inline]
 drm_fb_helper_dirty_work+0x42e/0x810 drivers/gpu/drm/drm_fb_helper.c:435
 process_one_work+0x933/0x15a0 kernel/workqueue.c:2272
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2418
 kthread+0x3b1/0x4a0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296


Memory state around the buggy address:
 ffffc9000b861280: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc9000b861300: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
>ffffc9000b861380: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
                               ^
 ffffc9000b861400: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc9000b861480: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
