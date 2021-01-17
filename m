Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 717E22F9B36
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 09:25:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BAC76E19C;
	Mon, 18 Jan 2021 08:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BD789F3B
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jan 2021 11:29:06 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id m3so23954129ioy.0
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jan 2021 03:29:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=P/d1FEPC5iUSKICunGAq3DjPk63uAX3l81ePhtYb8N0=;
 b=Nik2lp8UdOzkZQs09/pkuzEZ6AWsp2hT+CwpCg3kVni1jcZ6/0pWVbL/E1Ut2xTUPt
 MT/LvbgFL9IOdhLRVCSLp+UDJg/DLJQRkg7Zj+KwCZfDDqe7FLTzrHqgeoWgoH99HFAZ
 fsMp8sbZcwIfm7IPIwB1FZMoKFyTfnsM9/1/NXy2MtaSkd+Rf79inPuWpIqzXj2W7n9O
 fkMdL/3wh8BVo25e3xUV062aUbfaBaVQw9lZJhuP/XWQ3Py0HQAtpjnH70OwRarnN0KW
 /Hw1pI2oUEOteySkeMvAGkBuL0Cz/e1MTtEDa1E3XXiK/ZuQNAxTkrIpIxF1KainZ4Ie
 JCCA==
X-Gm-Message-State: AOAM531fHQc46X9QOR9qeYuEOpCrBhs3GUvoW6FlWPv002b8kCTWRAMr
 iiz74OPfNI34ScTFZXhTRK5UmvLTEoa2kRYE51N6CwRAPe+Q
X-Google-Smtp-Source: ABdhPJx5wlmIgilxar3mPnrNpenLIHXRB8QsmmaXtwL5co5ZgqUuD4L6Odq9Is16TpVeRpNjHvh4NXgVuwKnnAtq+1m2JAFvsRlf
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:411:: with SMTP id
 p17mr8267172ilr.33.1610882945873; 
 Sun, 17 Jan 2021 03:29:05 -0800 (PST)
Date: Sun, 17 Jan 2021 03:29:05 -0800
In-Reply-To: <00000000000091111005b435456e@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c37b3a05b916e95a@google.com>
Subject: Re: BUG: unable to handle kernel NULL pointer dereference in
 fbcon_cursor
From: syzbot <syzbot+b67aaae8d3a927f68d20@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, daniel.vetter@ffwll.ch, daniel.vetter@intel.com, 
 dri-devel@lists.freedesktop.org, george.kennedy@oracle.com, 
 gregkh@linuxfoundation.org, jirislaby@kernel.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, melissa.srw@gmail.com, natechancellor@gmail.com, 
 sam@ravnborg.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de, 
 yepeilin.cs@gmail.com
X-Mailman-Approved-At: Mon, 18 Jan 2021 08:25:29 +0000
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

commit ea40d7857d5250e5400f38c69ef9e17321e9c4a2
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri Oct 9 23:21:56 2020 +0000

    drm/vkms: fbdev emulation support

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=148e2748d00000
start commit:   b3a3cbde Add linux-next specific files for 20210115
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=168e2748d00000
console output: https://syzkaller.appspot.com/x/log.txt?x=128e2748d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6ea08dae6aab586f
dashboard link: https://syzkaller.appspot.com/bug?extid=b67aaae8d3a927f68d20
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15cd8fe0d00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17af5258d00000

Reported-by: syzbot+b67aaae8d3a927f68d20@syzkaller.appspotmail.com
Fixes: ea40d7857d52 ("drm/vkms: fbdev emulation support")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
