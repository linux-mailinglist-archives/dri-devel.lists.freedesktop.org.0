Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E33347A2573
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 20:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19EF810E66A;
	Fri, 15 Sep 2023 18:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB0E10E669
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 18:18:27 +0000 (UTC)
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-1c8f14ed485so3527083fac.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 11:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694801907; x=1695406707;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2VqufmfxjSUb4XqKQu2eQXU3QONq2sl0HERC26tPXI0=;
 b=NppI9XBy9cgP5GjZWzSA4SwiTjKVrXyBB/nZrvzv/7IX0bw4PgjzoxuVcA/rVH8fzu
 9oztrVTKvJ5R6sJAVG77ADmKHpi60S26sVeGze8xa+6swCQrOwVBEXpfjOAmSqIFjGsJ
 k7mUJsMld7LUEIWZ7aNfwMb5myHL3jcFYb2/8c2+lfSXFb6xxJNqxvLXWupWz0xpDggH
 sJz9AmXTLGOvXrMaV0+nSg78vDe6QWArfche5YJUyydODYGU80EmBf5c/2Wy39cyy/9p
 nNf20xSOYlpIA+j8vycUHooWHGgHAkUSmBCVffvgK7LCB2HkUlEAMo+SJ+iGAWfodxIn
 CP3g==
X-Gm-Message-State: AOJu0YxtK/iQE6TAyTxb5/6Z5iPP19AdQ+llAAuufWIYuE9knO0tYwFR
 pR5VOTUgFJ8O7Vt3BKPREtpBkGQctacPacfwNNWIdfCAyJRd
X-Google-Smtp-Source: AGHT+IHJk3PMmbnZmZM8RAAdi9QO4c+58BuymeUxaU3YwVtig0M8O4dFyhBNpBSzru7Dewszo4NjkQUbjE39n+z4Yr9WF1ychMzG
MIME-Version: 1.0
X-Received: by 2002:a05:6870:c789:b0:1d1:3ad6:bb99 with SMTP id
 dy9-20020a056870c78900b001d13ad6bb99mr738883oab.2.1694801906800; Fri, 15 Sep
 2023 11:18:26 -0700 (PDT)
Date: Fri, 15 Sep 2023 11:18:26 -0700
In-Reply-To: <000000000000be3c1a0604b53a1c@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009e9e1b060569d17c@google.com>
Subject: Re: [syzbot] [mm?] kernel BUG in filemap_unaccount_folio
From: syzbot <syzbot+17a207d226b8a5fb0fd9@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, christian.koenig@amd.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, fengwei.yin@intel.com, 
 gurchetansingh@chromium.org, hughd@google.com, kraxel@redhat.com, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-mm@kvack.org, sumit.semwal@linaro.org, 
 syzkaller-bugs@googlegroups.com, vivek.kasireddy@intel.com
Content-Type: text/plain; charset="UTF-8"
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

commit 5c074eeabbd332b11559f7fc1e89d456f94801fb
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Wed Nov 14 12:20:29 2018 +0000

    udmabuf: set read/write flag when exporting

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12b21bbfa80000
start commit:   db906f0ca6bb Merge tag 'phy-for-6.6' of git://git.kernel.o..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=11b21bbfa80000
console output: https://syzkaller.appspot.com/x/log.txt?x=16b21bbfa80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3bd57a1ac08277b0
dashboard link: https://syzkaller.appspot.com/bug?extid=17a207d226b8a5fb0fd9
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11609f38680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14c1fc00680000

Reported-by: syzbot+17a207d226b8a5fb0fd9@syzkaller.appspotmail.com
Fixes: 5c074eeabbd3 ("udmabuf: set read/write flag when exporting")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
