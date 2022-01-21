Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C54495BC5
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 09:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AE210E95E;
	Fri, 21 Jan 2022 08:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05FDA10E590
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 01:48:07 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id
 s2-20020a056e021a0200b002b94aede929so4122949ild.12
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 17:48:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=DanrII7rs7VHR9x2Ad6ztSAzc5bhObpiObDh8wKC9WU=;
 b=EnDltCy3fJKpeI42oN8rTn3Z58Vcsjip2dmUdH+Q67SB7aQgZw6/S0Sw96Mza355fW
 7gKQQk5cISJOYtXXJdk+8FoN3ziG5/rUKLEM2tt2HRbZ7IWZsRoL6V8ZnQHljGbSsnCt
 570BvnY71+/qJ2Bgvc94mbqOKXy+u7g7ZVNeyl7kPnrZHt/RfrDac7OZwjOb5wh3m1c+
 5nmZ/XPsErMlezlje5sXi4vyoFGTjUSGpb/RI6UA7i76nGOGbVuKgwBCx+ugh4YAI92S
 3hljEvSAYk9aAbQMKYu7ETfKfUU4fUy8SCW1b2HYHz7Cql/200yaXVDPquPAnWEjy53K
 lcNw==
X-Gm-Message-State: AOAM531WOGdbqaBZtECBckMwMKwM360Q71iBuA17iHlvkh3H+BCeNzSA
 581oJ1AaaBzPvGshtC6seaMIlJuo4lHX5f292uK7jBA/Lztw
X-Google-Smtp-Source: ABdhPJwo+j/up45k23KzgrwwJOdQRYqe4wZFCj5sSOh1hefXEP0mn76QeYRFAhQgeYfh1ABeRjuYCNLoAcbb47n7Nx1OAC7WHPRo
MIME-Version: 1.0
X-Received: by 2002:a02:2207:: with SMTP id o7mr751312jao.99.1642729686278;
 Thu, 20 Jan 2022 17:48:06 -0800 (PST)
Date: Thu, 20 Jan 2022 17:48:06 -0800
In-Reply-To: <000000000000bbdd0405d120c155@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000069ab4805d60dcf4c@google.com>
Subject: Re: [syzbot] KASAN: vmalloc-out-of-bounds Write in imageblit (2)
From: syzbot <syzbot+14b0e8f3fd1612e35350@syzkaller.appspotmail.com>
To: bugs-a21@moonlit-rail.com, deller@gmx.de, dri-devel@lists.freedesktop.org, 
 javierm@redhat.com, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 maxime@cerno.tech, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 21 Jan 2022 08:20:39 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

syzbot has bisected this issue to:

commit 0499f419b76f94ede08304aad5851144813ac55c
Author: Javier Martinez Canillas <javierm@redhat.com>
Date:   Mon Jan 10 09:56:25 2022 +0000

    video: vga16fb: Only probe for EGA and VGA 16 color graphic cards

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14c71e37b00000
start commit:   7fc5253f5a13 Add linux-next specific files for 20220120
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=16c71e37b00000
console output: https://syzkaller.appspot.com/x/log.txt?x=12c71e37b00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=94e8da4df9ab6319
dashboard link: https://syzkaller.appspot.com/bug?extid=14b0e8f3fd1612e35350
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=155dde3db00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=125298e0700000

Reported-by: syzbot+14b0e8f3fd1612e35350@syzkaller.appspotmail.com
Fixes: 0499f419b76f ("video: vga16fb: Only probe for EGA and VGA 16 color graphic cards")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
