Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B8D22FDEB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 01:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD8F6E0DA;
	Mon, 27 Jul 2020 23:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2E089CB8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 16:45:08 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id w23so1425049ila.15
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 09:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=YHOnlUDfMk9Oce0Ou/WEOEHZ7nLvW59TMeR/2OpcF3Q=;
 b=Zb/S4lHzevDd9A7WWYJwmmIzqfyJ9qImp8N26+HBAaN3iYj5dyyZ1a/rDHdKS+8NNB
 Sw5bWrzz2krIOCfvghxbHuGEQMHLWtigwewjmmxnJ9IcX4Rr05+RmUYbSE8sbtQX9ahg
 UzdaZyZVvDzSAamsrma8U76QXIL4iNBNAtSlv+1+T38LK3HQNrnRawYBLK8vZtaktn9f
 qRQqsaclMD3s0JXacXdQoX09hXWJIS6t4tLc3TPsSD75Af3J4g1GVVjFur0UU4co3oR0
 O6nN6wTqsiTfLXS6Crd6FRwQbhyy522LWhEFTn14xwhMRA9APrn++nhsHppW/t3spYit
 Ff7A==
X-Gm-Message-State: AOAM531saSIxh8yVQaCzIxRe+8y/o1p1ilvkXK/b6Igh5G31kCHhzvZF
 YkKLvudWmRL+kcZHokvfDj1r9UKgatA7c1s2LW0+qESyGZao
X-Google-Smtp-Source: ABdhPJyWPqw6wdnxG6yEAcA0v1YAdXbJ62nm7W119h3e4RaBn+6wSQs6av1fBXa58L3cKtV8U9o26rlCi8xL4nuWsto7OXO4uR+Z
MIME-Version: 1.0
X-Received: by 2002:a05:6638:1649:: with SMTP id
 a9mr18800320jat.115.1595868308050; 
 Mon, 27 Jul 2020 09:45:08 -0700 (PDT)
Date: Mon, 27 Jul 2020 09:45:08 -0700
In-Reply-To: <00000000000072cb4c0598d25a69@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009c18f005ab6f0bc0@google.com>
Subject: Re: divide error in fbcon_switch
From: syzbot <syzbot+13013adc4a234406c29e@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, daniel.thompson@linaro.org, 
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org, ghalat@redhat.com, 
 gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 penguin-kernel@I-love.SAKURA.ne.jp, penguin-kernel@i-love.sakura.ne.jp, 
 sam@ravnborg.org, syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Mon, 27 Jul 2020 23:32:42 +0000
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

commit ce684552a266cb1c7cc2f7e623f38567adec6653
Author: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Date:   Sun Jul 12 11:10:12 2020 +0000

    vt: Reject zero-sized screen buffer size.

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=155549c4900000
start commit:   76bb8b05 Merge tag 'kbuild-v5.5' of git://git.kernel.org/p..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=dd226651cb0f364b
dashboard link: https://syzkaller.appspot.com/bug?extid=13013adc4a234406c29e
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17d69aeae00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13fdcc2ae00000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: vt: Reject zero-sized screen buffer size.

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
