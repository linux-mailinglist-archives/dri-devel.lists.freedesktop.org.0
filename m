Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC3714D7AC
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 09:33:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874966F90C;
	Thu, 30 Jan 2020 08:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723906E3EE
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 16:06:15 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id i8so10903922ioi.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 08:06:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=fEUlUjM8SEojeOk6pwtcSTQDu8D7nALBWF21TUkUjFQ=;
 b=MNaIeR/q8O9yGTPYKZ337GNPPAmJ/e8D5sYr0wDwCq4w73z35ZgN8MgG+lfr0qtOGR
 PBallbjPuBv4fG2H0+z+3xGgP/X25ggXXx26tW1+hzznXOHH7P5noi8ROlZWrP6jzTln
 Oxsftnf8pXAqChkK9A2Ri8cJpSAljm7uT5cmA0i2JiN8bNR1ydZ1duiDfcdPvtzKK9y8
 /smUs1jJ1R56HVjUjFmlaZKOu8BApuiETpt9Bs0d0SdAQ50IC/mgqllUG95cJuP5zNS6
 7Itj9RWPhhUt30WUP4Xy5YBjvsI9eXbyQ0u7p24KLyo90MHiVVGMDxqn9ZxvY1rklf2M
 X5KQ==
X-Gm-Message-State: APjAAAWi3omTtn2JBFlHgrB6PgXEYAAK6L1pltJngrC15M921rto9s8E
 yP12rHX7/J/rPQT2re1xRCt0mUIJmwLP/97xhnuAlUtDgqST
X-Google-Smtp-Source: APXvYqxRd2se19n9AMGBF0tsd+V/QMOOXynWF3G0Gosz8cItmjCbMWlTR4gOeDt0e9z2keIjwUnyAv5NoJ294QR5X7nnb81NTilm
MIME-Version: 1.0
X-Received: by 2002:a92:914a:: with SMTP id t71mr26674745ild.293.1580313974646; 
 Wed, 29 Jan 2020 08:06:14 -0800 (PST)
Date: Wed, 29 Jan 2020 08:06:14 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000017ad0d059d498531@google.com>
Subject: memory leak in snd_pcm_hw_params
From: syzbot <syzbot+30edd0f34bfcdc548ac4@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, perex@perex.cz, sumit.semwal@linaro.org, 
 syzkaller-bugs@googlegroups.com, tglx@linutronix.de, tiwai@suse.com
X-Mailman-Approved-At: Thu, 30 Jan 2020 08:32:45 +0000
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

HEAD commit:    b3a60822 Merge branch 'for-v5.6' of git://git.kernel.org:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1351cf66e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e97a1bc78afb77f
dashboard link: https://syzkaller.appspot.com/bug?extid=30edd0f34bfcdc548ac4
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14e97735e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13cd9bc9e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+30edd0f34bfcdc548ac4@syzkaller.appspotmail.com

executing program
executing program
executing program
BUG: memory leak
unreferenced object 0xffff888108fdefc0 (size 64):
  comm "syz-executor222", pid 7310, jiffies 4294946025 (age 13.660s)
  hex dump (first 32 bytes):
    07 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 10 33 02 00 c9 ff ff 00 00 00 00 00 00 00 00  ..3.............
  backtrace:
    [<00000000c59c6b0c>] kmemleak_alloc_recursive include/linux/kmemleak.h:43 [inline]
    [<00000000c59c6b0c>] slab_post_alloc_hook mm/slab.h:586 [inline]
    [<00000000c59c6b0c>] slab_alloc mm/slab.c:3320 [inline]
    [<00000000c59c6b0c>] kmem_cache_alloc_trace+0x145/0x2c0 mm/slab.c:3549
    [<00000000478172ce>] kmalloc include/linux/slab.h:556 [inline]
    [<00000000478172ce>] kzalloc include/linux/slab.h:670 [inline]
    [<00000000478172ce>] snd_pcm_lib_malloc_pages+0x12b/0x200 sound/core/pcm_memory.c:404
    [<0000000091532e16>] snd_pcm_hw_params+0x720/0x830 sound/core/pcm_native.c:691
    [<000000002070a986>] snd_pcm_kernel_ioctl+0xb5/0x170 sound/core/pcm_native.c:3238
    [<00000000394e99f4>] snd_pcm_oss_change_params_locked+0x745/0x1140 sound/core/oss/pcm_oss.c:944
    [<00000000c81f42ac>] snd_pcm_oss_change_params+0x43/0x80 sound/core/oss/pcm_oss.c:1087
    [<000000007710a1c0>] snd_pcm_oss_make_ready+0x55/0xc0 sound/core/oss/pcm_oss.c:1146
    [<0000000069305204>] snd_pcm_oss_sync.isra.0+0xb8/0x310 sound/core/oss/pcm_oss.c:1707
    [<00000000692460c8>] snd_pcm_oss_release+0xef/0x100 sound/core/oss/pcm_oss.c:2545
    [<0000000013ba02c9>] __fput+0xed/0x300 fs/file_table.c:280
    [<0000000080810f18>] ____fput+0x16/0x20 fs/file_table.c:313
    [<00000000e6bb3aa6>] task_work_run+0x9d/0xc0 kernel/task_work.c:113
    [<00000000b6ce71eb>] exit_task_work include/linux/task_work.h:22 [inline]
    [<00000000b6ce71eb>] do_exit+0x3fa/0xe20 kernel/exit.c:801
    [<0000000045ce7ad3>] do_group_exit+0x4b/0xe0 kernel/exit.c:899
    [<00000000aeb85903>] __do_sys_exit_group kernel/exit.c:910 [inline]
    [<00000000aeb85903>] __se_sys_exit_group kernel/exit.c:908 [inline]
    [<00000000aeb85903>] __x64_sys_exit_group+0x1c/0x20 kernel/exit.c:908
    [<000000008b12db16>] do_syscall_64+0x73/0x220 arch/x86/entry/common.c:294



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
