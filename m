Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D177635B694
	for <lists+dri-devel@lfdr.de>; Sun, 11 Apr 2021 20:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8029A6E12D;
	Sun, 11 Apr 2021 18:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47796E0C9
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Apr 2021 12:01:04 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id k12so6423351ilo.20
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Apr 2021 05:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=LDTjWmZvEWtUCLx2G8NWLUQGZf4eyJlc261DSUtArss=;
 b=E6qZb27Ob7U6wfYnzmzh2ocd8jCDwHuLb0isceweoiVfzexAeojb22hHerxuTOM3Il
 kzr0lHPI/QiihGuUeQ5PDr9ep6mAyM6Ru/iwyijT8sw8uKDx2SIBxHF7iwwPfzAmt7wK
 zoL7EOqL9qdjow0HwSEExsFakUY+T9PB09xnIYz7dAiMK93uVgrljZXa7K3VNiuoF2gp
 dJ/jo5HIYl57otB4EaqArzFoAPZSrn6TnUqhQT6b8huoM3/KRDpKUCQQJz8jYD3ij+yO
 ehTgCIdTRmKmCBDA/IEiNDgHPhhDw8I9LAxSwmKJO1tDnfFppE04uVO+BUS3FfguprH+
 etXw==
X-Gm-Message-State: AOAM533o0D2LAlz1HgEG57vFp+Eo3zAfJE0qqWj7oJcvhkhQckz1nq0f
 9m2Hl7VEVE9sPIIF3NxoAy8iSrFyXwxXp+JKDRNr6wTbmiuY
X-Google-Smtp-Source: ABdhPJyDyqbVyC9mBnLUut7DKqzalFIfytiw7VvqlWdVUVr22Qx+pnaBUnEzBz6/UbxXmD5PMAsFPUDFomYIxpMTQViVD0xC5CXh
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1e0d:: with SMTP id
 g13mr19341545ila.99.1618142464099; 
 Sun, 11 Apr 2021 05:01:04 -0700 (PDT)
Date: Sun, 11 Apr 2021 05:01:04 -0700
In-Reply-To: <00000000000086f79105b5553f1e@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c4cba105bfb126a1@google.com>
Subject: Re: [syzbot] general protection fault in drm_client_buffer_vunmap
From: syzbot <syzbot+10328e8428a896b65119@syzkaller.appspotmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 igormtorrente@gmail.com, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 syzkaller-bugs@googlegroups.com, tzimmermann@suse.de, ztong0001@gmail.com
X-Mailman-Approved-At: Sun, 11 Apr 2021 18:39:08 +0000
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

syzbot suspects this issue was fixed by commit:

commit 874a52f9b693ed8bf7a92b3592a547ce8a684e6f
Author: Tong Zhang <ztong0001@gmail.com>
Date:   Sun Feb 28 04:46:25 2021 +0000

    drm/fb-helper: only unmap if buffer not null

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10c27b7ed00000
start commit:   c03c21ba Merge tag 'keys-misc-20210126' of git://git.kerne..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=ec4c85e44cc3172e
dashboard link: https://syzkaller.appspot.com/bug?extid=10328e8428a896b65119
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12d95d7ad00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=148da9ccd00000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: drm/fb-helper: only unmap if buffer not null

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
