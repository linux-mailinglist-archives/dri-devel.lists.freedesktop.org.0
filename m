Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAEF18C87A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 09:01:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5D06EAE0;
	Fri, 20 Mar 2020 08:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE346E0E2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 00:48:03 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id s2so3295777iot.17
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 17:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=KQIeV41BqSA2HWOsTXHaruLvJbTFku9df88EiZxeP2U=;
 b=Wl9tKrWUDTVH+QORDOtHquMqwJs2RaXfBGbuIxl2dLFBXEypepm6v2hVwze/DRy3Lq
 Luf+4/XOg8JbZXtFqe4nNwpmf5fPGaUoJG7tWDV06Q4rlOPmt6XEIwLwOypNBz2EIH4C
 I3sOXJDn3WkWLe+I+WRy6cxO1aCGh+hptzCI8Dg3In+UBgOcbejUUfIW1O+I0eTFc1Gg
 Asz3u6zq49D07VPMZXTxirC1WRUMwWDsFot4cRVzYGwMGaDs69xQLdNCPBOLJHj+Jb6o
 b5shI/GccKiHomzd1k3q5aP2RsHAKROpT1/jE33fsB9pSHODzxFMCp2Ohsyr4yk7Z4+m
 ozyA==
X-Gm-Message-State: ANhLgQ265dd+0dE3gvj29Xt+wM4bZ86DAz+LQGrnXWlZHj36Zwm001pQ
 wz1SsBZNjKeInoGZKvAmj6ccXLDW3ZnmBPPn9NI3zbf6qMGt
X-Google-Smtp-Source: ADFU+vtOqc6u9s+pMnAy4wggYF/r7nVtJrIj9IeIrcmEVypYawzs8Dh9C2t0kEbG2HqkEDMYGd/BujA1AdzgBk4Sx4zpBokunsE7
MIME-Version: 1.0
X-Received: by 2002:a6b:5406:: with SMTP id i6mr5275616iob.188.1584665282593; 
 Thu, 19 Mar 2020 17:48:02 -0700 (PDT)
Date: Thu, 19 Mar 2020 17:48:02 -0700
In-Reply-To: <00000000000074219d05a139e082@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000041ca9305a13ea3e0@google.com>
Subject: Re: general protection fault in sctp_ulpevent_nofity_peer_addr_change
From: syzbot <syzbot+3950016bd95c2ca0377b@syzkaller.appspotmail.com>
To: a@unstable.cc, b.a.t.m.a.n@lists.open-mesh.org, b.zolnierkie@samsung.com, 
 davem@davemloft.net, dri-devel@lists.freedesktop.org, kuba@kernel.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sctp@vger.kernel.org, lkundrak@v3.sk, marcelo.leitner@gmail.com, 
 mareklindner@neomailbox.ch, netdev@vger.kernel.org, nhorman@tuxdriver.com, 
 sw@simonwunderlich.de, syzkaller-bugs@googlegroups.com, vyasevich@gmail.com
X-Mailman-Approved-At: Fri, 20 Mar 2020 08:01:25 +0000
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

syzbot has bisected this bug to:

commit da2648390ce3d409218b6bbbf2386d8ddeec2265
Author: Lubomir Rintel <lkundrak@v3.sk>
Date:   Thu Dec 20 18:13:09 2018 +0000

    pxa168fb: trivial typo fix

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1361e139e00000
start commit:   5076190d mm: slub: be more careful about the double cmpxch..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=10e1e139e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=1761e139e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9f894bd92023de02
dashboard link: https://syzkaller.appspot.com/bug?extid=3950016bd95c2ca0377b
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1162bbe3e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13c93b45e00000

Reported-by: syzbot+3950016bd95c2ca0377b@syzkaller.appspotmail.com
Fixes: da2648390ce3 ("pxa168fb: trivial typo fix")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
