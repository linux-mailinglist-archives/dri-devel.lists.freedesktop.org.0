Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 550BB370AB1
	for <lists+dri-devel@lfdr.de>; Sun,  2 May 2021 09:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3269E6E1BB;
	Sun,  2 May 2021 07:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94EB189C97
 for <dri-devel@lists.freedesktop.org>; Sun,  2 May 2021 01:53:11 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id
 z25-20020a05660200d9b02903de90ff885fso1099924ioe.11
 for <dri-devel@lists.freedesktop.org>; Sat, 01 May 2021 18:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=OaqvyMlXg8wGXZRGMIboAMoucZyr0AtXUbwHcvsJTxQ=;
 b=D/OJWHj9Ti06VumjvyPfcBaosN40wK0m+RJAa30zMICY9hc1IzHZTVgjuIIbVVRl5N
 B4LdxD+F4QnS4qdEiteKd1VrqvB9RZt5vzXQbhz9V7ZIZ7V1pueO+W4ESWPd4wp1zm+j
 Duq4S0VqyLtq0b5sk0jXMqwRGF5buVSGl42nwoVQxBTtBtnMxDNBrlETA/2KSo7oxNMq
 OAVgivvLFrozmwJDnL1E6RbK+M/rPOw+k7jQbLnXu2cpAf/L6z62ZKMEG/BHdTku+NFi
 pIHHIZkQ0QdcaBoT2vxcfZTOeckOwp9vdhP7LeEoxc++h/T8SDcUchws5q0l6fZH0FQV
 6gYg==
X-Gm-Message-State: AOAM533o/LvFceMOtHP5l0k8R3bHq8tukJeRUy4L2VWaZsCUkzJsx/lk
 tQh6KuWlSvDZtrFty8/3KC67fLs5CG+E1iVfG0bhJY2ThnL+
X-Google-Smtp-Source: ABdhPJzrDS4BZ0APncrMikVvdmVtL8AzN4r8IHRznwTpDU6fklt7kjPqWFHr3kUlkvmZAB5ysDk/ZrgPlZh+HISi5V3Ywm/O/0co
MIME-Version: 1.0
X-Received: by 2002:a6b:7413:: with SMTP id s19mr9056934iog.151.1619920390173; 
 Sat, 01 May 2021 18:53:10 -0700 (PDT)
Date: Sat, 01 May 2021 18:53:10 -0700
In-Reply-To: <00000000000086452c05a51da504@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006bbd0c05c14f1b09@google.com>
Subject: Re: [syzbot] BUG: unable to handle kernel paging request in
 vga16fb_imageblit (2)
From: syzbot <syzbot+1f29e126cf461c4de3b3@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, colin.king@canonical.com, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org, 
 jani.nikula@intel.com, jirislaby@kernel.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, penguin-kernel@i-love.sakura.ne.jp, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Sun, 02 May 2021 07:19:09 +0000
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

syzbot has bisected this issue to:

commit 988d0763361bb65690d60e2bc53a6b72777040c3
Author: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Date:   Sun Sep 27 11:46:30 2020 +0000

    vt_ioctl: make VT_RESIZEX behave like VT_RESIZE

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15633759d00000
start commit:   d2b6f8a1 Merge tag 'xfs-5.13-merge-3' of git://git.kernel...
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=17633759d00000
console output: https://syzkaller.appspot.com/x/log.txt?x=13633759d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=53fdf14defd48c56
dashboard link: https://syzkaller.appspot.com/bug?extid=1f29e126cf461c4de3b3
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16d9ff43d00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10981693d00000

Reported-by: syzbot+1f29e126cf461c4de3b3@syzkaller.appspotmail.com
Fixes: 988d0763361b ("vt_ioctl: make VT_RESIZEX behave like VT_RESIZE")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
