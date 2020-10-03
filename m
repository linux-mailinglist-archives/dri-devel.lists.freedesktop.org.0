Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B3828230D
	for <lists+dri-devel@lfdr.de>; Sat,  3 Oct 2020 11:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA1B6E2E3;
	Sat,  3 Oct 2020 09:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f79.google.com (mail-io1-f79.google.com
 [209.85.166.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAE16EA1C
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Oct 2020 02:33:06 +0000 (UTC)
Received: by mail-io1-f79.google.com with SMTP id w5so1872907iod.12
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Oct 2020 19:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=huAQ2XNxNk0+JP0caungu+yrhrmWz2OAWIUz9RtSlI4=;
 b=i7ngkWmkHaQ5X18vox+dele7hmv3956AxINTcUas1/eZKDu5zFbHn83E2pAsPSuGn7
 OUqg70IhbsKn2d6HNi5aVAgtki7q7fyJ+TV8++ufPMoAiWXinnCnJl/A+plr9sa8SqZu
 fJ5SDKbBoki4+3gOX7zI0V/YFqag0gZsYpqS5PvsLpb1Qd1KjNGGrjBRISElI3S9Xnkv
 NqEuSwKAkMjBFIFeAmta9NLiuYExtHBQZ9TynRPNRIaLpgvefG4fVleOKBcaT4g6mKpZ
 gKCWqVOojSdPpTt2+bBjTyKyDgsF/F3mxOK8wQIhkOtz+MKnMp2/QmteMtXx2wAmuBhH
 pHxA==
X-Gm-Message-State: AOAM533IQCy1PcMN3jSfiJ4RbfuTHfXM5fiXMIiAO0Ql9/1E6LOIdNQm
 KGxWUMX8mVo6A2+nYw3d3nNYlFgIHaue/7L02GOwstRdbK4I
X-Google-Smtp-Source: ABdhPJzrlAP5imDWEPKyVGiLnhg0plpe3Pjdz0K8YSADKul87MvIbS1OPbnv7c/HZQJfp1argFlx9wEiLJU/BiWVN/BRncyNJ03n
MIME-Version: 1.0
X-Received: by 2002:a02:5d85:: with SMTP id w127mr4693509jaa.76.1601692385603; 
 Fri, 02 Oct 2020 19:33:05 -0700 (PDT)
Date: Fri, 02 Oct 2020 19:33:05 -0700
In-Reply-To: <000000000000ed022605b0b1efaa@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000aef3fc05b0bb11ce@google.com>
Subject: Re: WARNING in ieee80211_bss_info_change_notify
From: syzbot <syzbot+09d1cd2f71e6dd3bfd2c@syzkaller.appspotmail.com>
To: airlied@linux.ie, alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, davem@davemloft.net, dieter@nuetzel-hh.de, 
 dri-devel@lists.freedesktop.org, johannes@sipsolutions.net, kuba@kernel.org, 
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Sat, 03 Oct 2020 09:23:39 +0000
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

commit 135f971181d779c96ff3725c1a350a721785cc66
Author: Alex Deucher <alexander.deucher@amd.com>
Date:   Mon Nov 20 22:49:53 2017 +0000

    drm/amdgpu: don't skip attributes when powerplay is enabled

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=120f55bd900000
start commit:   fcadab74 Merge tag 'drm-fixes-2020-10-01-1' of git://anong..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=110f55bd900000
console output: https://syzkaller.appspot.com/x/log.txt?x=160f55bd900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4e672827d2ffab1f
dashboard link: https://syzkaller.appspot.com/bug?extid=09d1cd2f71e6dd3bfd2c
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=161112eb900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=124fc533900000

Reported-by: syzbot+09d1cd2f71e6dd3bfd2c@syzkaller.appspotmail.com
Fixes: 135f971181d7 ("drm/amdgpu: don't skip attributes when powerplay is enabled")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
