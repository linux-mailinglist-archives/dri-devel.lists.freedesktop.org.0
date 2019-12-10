Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC01811A6C1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 10:21:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96F76EAA6;
	Wed, 11 Dec 2019 09:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCBF56E89C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 12:59:01 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id o18so14363039ilb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 04:59:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=K7gPl1FphJWhh8zq+KZGN6d9O0Mc9hz+Z8xkj8vZdlQ=;
 b=McDvTaCf4irZCFMmJRVHU3wXWl5Q6SOqMIADDUc3as6kcEglaDRysAQJxC0sr80GGA
 99C7oTBj/gkQV0bdNDo9PcCHaGeQXMpSI/OsO7kcsnVey1RGsgtICI8d9Wkv+OzFeaIG
 Rw0LO0sKQpcGekI69b3enxX804LNg9JFuyAsEL+z1HPd+sZe+9U9VDaYap6SoMmCGmp8
 3sP+boe3lzeLzt6ObtfdEyF/yItU/inDGHO7qygsxLhiz8wbXz+2B0YaDh3fvQiyG48j
 CmkJMMoW/UnKJTgMaNaNfZ38wc1ndWrE1K0IzFNsDMVxinRmJ0zvFuKUUkcVGOJj9t+E
 LUOQ==
X-Gm-Message-State: APjAAAW1HCjHy3oAqAnaxH+ee0+3zEYU8rVCnStVXPf+NHxDC0VsH1sd
 E/bPyrScpGCiJ4/mroHGT/bBxJf0CqGQXt9WEForXhfJAQrz
X-Google-Smtp-Source: APXvYqwDCe80r9YbW2QQnA0KjjLSvil/nEblKeil0eEsHFedCe59r/gm8ekpcNZa3NtXqCgGqqZ6wrMr2kggORAQDm9RLlN60DpJ
MIME-Version: 1.0
X-Received: by 2002:a92:5e4b:: with SMTP id s72mr32788228ilb.211.1575982741163; 
 Tue, 10 Dec 2019 04:59:01 -0800 (PST)
Date: Tue, 10 Dec 2019 04:59:01 -0800
In-Reply-To: <0000000000007f075c0598f7aa38@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007598ae0599591335@google.com>
Subject: Re: KASAN: slab-out-of-bounds Read in bit_putcs
From: syzbot <syzbot+998dec6452146bd7a90c@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, coreteam@netfilter.org, davem@davemloft.net, 
 dri-devel@lists.freedesktop.org, gwshan@linux.vnet.ibm.com, kaber@trash.net, 
 kadlec@blackhole.kfki.hu, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au, netdev@vger.kernel.org, 
 netfilter-devel@vger.kernel.org, pablo@netfilter.org, ruscur@russell.cc, 
 stewart@linux.vnet.ibm.com, syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Wed, 11 Dec 2019 09:20:35 +0000
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

syzbot has bisected this bug to:

commit 2de50e9674fc4ca3c6174b04477f69eb26b4ee31
Author: Russell Currey <ruscur@russell.cc>
Date:   Mon Feb 8 04:08:20 2016 +0000

     powerpc/powernv: Remove support for p5ioc2

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16af042ae00000
start commit:   9455d25f Merge tag 'ntb-5.5' of git://github.com/jonmason/..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=15af042ae00000
console output: https://syzkaller.appspot.com/x/log.txt?x=11af042ae00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7a3b8f5088d4043a
dashboard link: https://syzkaller.appspot.com/bug?extid=998dec6452146bd7a90c
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12fa5c2ee00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12e327f2e00000

Reported-by: syzbot+998dec6452146bd7a90c@syzkaller.appspotmail.com
Fixes: 2de50e9674fc ("powerpc/powernv: Remove support for p5ioc2")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
