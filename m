Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D748812AD0D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2019 15:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C6889B9A;
	Thu, 26 Dec 2019 14:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4ACE89B9A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2019 15:26:01 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id e200so7994213iof.7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2019 07:26:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=A7S/GOq+N1/RvV3BsEeeY8VJ+E23sie3htdgMTQ6zh8=;
 b=WHcCX2tYe8UhnyFjsAdWlPvdgEiq3tdo6HXeH1KhLVK+1MRziQPi44crjzJomPU05Q
 7pbq2ssLn89kpJCDvbATrVD3244zknMcX2cObXF2phg+4F+eTR9F9BdLSvvZnkw2MPMx
 YvDHKbgLRsKtRMWBOsJlt7Y5+mS/U8ri2x2Pju111dfJXA3zfcyfgB16LcKikbuN2Lq5
 orm1tgsJk1WBcVpaw948c44GzpQ5liHvIRjR7lzJ+udDk28RyiDUpBp91kZ4fXjUjr6P
 F0qlzGsALC9Z0hWqV+BhwCx8/l8Z9RHEYzQ1c5NapvDl0mLcQ1ohaWi/w74xwZZRPLzH
 fneA==
X-Gm-Message-State: APjAAAVB0tdMcZNR3Vrom5isN31eqck6lKObw5D29zBzqF513ZkF/X8S
 UAzQEmu6FvMthFMzrQ7p4gJr1Qp4x/ldPNKMPTTqAlHvbIFh
X-Google-Smtp-Source: APXvYqxEW020KE83xrHw3Gxo/vfwdXNrRfv9mftoPAYZg1BkC/8zDOT3yGFgKCXd/lTwsoyQohVTwsOf+XKRQkf+Diz+b0SqoodX
MIME-Version: 1.0
X-Received: by 2002:a92:3996:: with SMTP id h22mr34246521ilf.129.1577287560911; 
 Wed, 25 Dec 2019 07:26:00 -0800 (PST)
Date: Wed, 25 Dec 2019 07:26:00 -0800
In-Reply-To: <0000000000001b2f4605991a4cc0@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c6e365059a88e032@google.com>
Subject: Re: KASAN: use-after-free Read in fb_mode_is_equal
From: syzbot <syzbot+f11cda116c57db68c227@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, daniel.vetter@ffwll.ch, daniel.vetter@intel.com, 
 dri-devel@lists.freedesktop.org, hdanton@sina.com, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mojha@codeaurora.org, sam@ravnborg.org, 
 shile.zhang@linux.alibaba.com, syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Thu, 26 Dec 2019 14:32:55 +0000
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

commit 13ff178ccd6d3b8074c542a911300b79c4eec255
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue May 28 09:02:53 2019 +0000

     fbcon: Call fbcon_mode_deleted/new_modelist directly

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1737c63ee00000
start commit:   46cf053e Linux 5.5-rc3
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=14b7c63ee00000
console output: https://syzkaller.appspot.com/x/log.txt?x=10b7c63ee00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ed9d672709340e35
dashboard link: https://syzkaller.appspot.com/bug?extid=f11cda116c57db68c227
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12bf72c6e00000

Reported-by: syzbot+f11cda116c57db68c227@syzkaller.appspotmail.com
Fixes: 13ff178ccd6d ("fbcon: Call fbcon_mode_deleted/new_modelist directly")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
