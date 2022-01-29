Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C078B4A3EA8
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 09:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CDA110F536;
	Mon, 31 Jan 2022 08:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8044B1128A7
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jan 2022 14:07:10 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id
 r4-20020a6b4404000000b00614d5a865f7so4858348ioa.5
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jan 2022 06:07:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=0yID9FBNEnlHIDDPVExH7+jnkGuixmiFgWV9iVk8uAw=;
 b=jpQwREXjPxFTtQHKdKG/cnZPEs4yEvgixUnLx8GBjplHsjhnWeSVuUipFb9QmIJkHA
 vM/t04xxDRp+9nUC71NOZ/bf82cWkaWCHr2z0nHcUlFdlerHl8SR/6MQj0HW2x47AuXC
 4M2iWi3jo+Q+TxWQuERRyRGEuDKu5UtCxR+gbUbk8WpowVr7SvKQuNc2rwX0T9TrNAfF
 OuJP2VT12Nvs02o0ZOkpmbqaA6MyzYxOK6LqWsB8t0O4AQXLss4435y2ru8m/0Lj15vb
 +p9TxwMjhfISiAjG67bQRVai9FF5hn6Ps2RT2JwmDoYpN23Vfk4aULCWdXDifGi01S/9
 PszA==
X-Gm-Message-State: AOAM5312r9HIA3tLjxdDK5u+HPKND4KQMLUf2OC2mpFKGF60CEbdV7yl
 /lftUpRklWnMzrgf3SGCqLR0z9UzQXHrJYA1r/yQ9pc9ZuPG
X-Google-Smtp-Source: ABdhPJys2smNcd54wqnufpsY+9aFghoE3qs6+teGCIqgvZBHcvUKkSP+xokUF3PxNaUW5iPcGnSHcmzTLIMObGaNGwv6yrAlWEs8
MIME-Version: 1.0
X-Received: by 2002:a6b:3b8a:: with SMTP id i132mr7981765ioa.85.1643465229580; 
 Sat, 29 Jan 2022 06:07:09 -0800 (PST)
Date: Sat, 29 Jan 2022 06:07:09 -0800
In-Reply-To: <000000000000ab6df705b453993a@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000035befb05d6b91185@google.com>
Subject: Re: [syzbot] BUG: unable to handle kernel paging request in
 bitfill_aligned (2)
From: syzbot <syzbot+a4edd73d589b0b7efbeb@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, bugs-a21@moonlit-rail.com, 
 dri-devel@lists.freedesktop.org, javierm@redhat.com, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, maxime@cerno.tech, 
 ngraniel@cocobongo.net, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 31 Jan 2022 08:35:18 +0000
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

syzbot suspects this issue was fixed by commit:

commit 0499f419b76f94ede08304aad5851144813ac55c
Author: Javier Martinez Canillas <javierm@redhat.com>
Date:   Mon Jan 10 09:56:25 2022 +0000

    video: vga16fb: Only probe for EGA and VGA 16 color graphic cards

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1752f5c0700000
start commit:   2a987e65025e Merge tag 'perf-tools-fixes-for-v5.16-2021-12..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d5e878e3399b6cc
dashboard link: https://syzkaller.appspot.com/bug?extid=a4edd73d589b0b7efbeb
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16671badb00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=122beabdb00000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: video: vga16fb: Only probe for EGA and VGA 16 color graphic cards

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
