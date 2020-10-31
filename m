Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8908C2A2069
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 18:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C21A6EB26;
	Sun,  1 Nov 2020 17:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500C66E10C
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Oct 2020 11:28:17 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id s10so5957229iot.21
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Oct 2020 04:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=OXTr1wsblAXE338aPfrrd8q8k4gVyWgB2hXUUxvfYYw=;
 b=fpWiKtoIFQ2vaD+ih2qzUWbWIe6MSlH/1fFthTi+HqWxYHY4J+JSe8lwwJWpKdSUJW
 3g0aMr6JhT3uXZWXKFs3ZIcAlbtnBJ3/WYCPOf+xoyX9D2unEN2EjdTg1XP8kVv0Ilkc
 VR08tI53Vliio7A9b3CqkZqfvVxaeB8iGpHdaps+UU530PP9B27YQuujxTuFSuCnKlyN
 DMzIk0DLNhOzNubqymF1+XgfCBfydI3jgsm1sSOoZFtinxCOcBEUfHjyWa4R9o57B/HF
 cfu3d8IG7bH24UGKlcK4VLDXnGBNQlRITFpR7yHmj22z5WhdlboKVwukc6IUoab/faNE
 Nutw==
X-Gm-Message-State: AOAM533LMP1ptU+CXBiiOJw0/B+J2OjMplRLR0KPRTW/Pk1wiQ031CwY
 fIGfx6XeUNYhcE76n9XY3C7lC4fyJp6ZLxJ35Jt4BZtZvH9N
X-Google-Smtp-Source: ABdhPJx6W1Y67tYSKe13+Mkr6v/p/VucUq/l/zDOFZjZJFAGJJV0uNWGxokQBI9irrG+GwKTn3kBgOqVsNjMlujo9Kz00tUC6Tbt
MIME-Version: 1.0
X-Received: by 2002:a92:d5d0:: with SMTP id d16mr5163722ilq.223.1604143696510; 
 Sat, 31 Oct 2020 04:28:16 -0700 (PDT)
Date: Sat, 31 Oct 2020 04:28:16 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003305c305b2f5cfd8@google.com>
Subject: KASAN: vmalloc-out-of-bounds Write in drm_fb_helper_dirty_work (3)
From: syzbot <syzbot+58a9f453b90c4bfab018@syzkaller.appspotmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
X-Mailman-Approved-At: Sun, 01 Nov 2020 17:36:56 +0000
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

HEAD commit:    4525c878 scsi: qla2xxx: remove incorrect sparse #ifdef
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1411f308500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a5c844e56cc50cdb
dashboard link: https://syzkaller.appspot.com/bug?extid=58a9f453b90c4bfab018
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+58a9f453b90c4bfab018@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: vmalloc-out-of-bounds in memcpy include/linux/string.h:399 [inline]
BUG: KASAN: vmalloc-out-of-bounds in drm_fb_helper_dirty_blit_real drivers/gpu/drm/drm_fb_helper.c:403 [inline]
BUG: KASAN: vmalloc-out-of-bounds in drm_fb_helper_dirty_work+0x42e/0x810 drivers/gpu/drm/drm_fb_helper.c:435
Write of size 4096 at addr ffffc90009bd1000 by task kworker/2:0/23

CPU: 2 PID: 23 Comm: kworker/2:0 Not tainted 5.10.0-rc1-syzkaller #0
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
 memcpy+0x39/0x60 mm/kasan/common.c:106
 memcpy include/linux/string.h:399 [inline]
 drm_fb_helper_dirty_blit_real drivers/gpu/drm/drm_fb_helper.c:403 [inline]
 drm_fb_helper_dirty_work+0x42e/0x810 drivers/gpu/drm/drm_fb_helper.c:435
 process_one_work+0x933/0x15a0 kernel/workqueue.c:2272
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2418
 kthread+0x3af/0x4a0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296


Memory state around the buggy address:
 ffffc90009bd0f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc90009bd0f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffffc90009bd1000: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
                   ^
 ffffc90009bd1080: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc90009bd1100: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
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
