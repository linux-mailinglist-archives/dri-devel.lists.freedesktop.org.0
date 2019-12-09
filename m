Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC042118277
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:40:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE7589FBC;
	Tue, 10 Dec 2019 08:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA8F89B0D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 15:58:02 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id l25so2335380ioh.5
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 07:58:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=haSirlvjghAy8O+UGZZ1CIdjmlMMpGQNnbPGRDREiuo=;
 b=hoOJatdcc+zJxr33SWZ2Hd2EWZfKzAKmsP8JB6YgT3gZKWrmASpwvM58qiiLDyy+ia
 8jOz05WDzhmSDvcaxF42N8+DhPrmH6uIdMuEtGVRn47Gwsfljfx2U+sE0mWJt8GmGlC2
 UpbnvI85ovvVr7C8saLXOSd8RayoPc2803fpf0SvNcw6pY9FeCDn0CAHfyMlfPXkSW53
 G568TCELsZ1Rwd3Wp5W/aNtjw1dq9C6ukMr5ojD/UVDbUWatMZPtmnqk4R03tUQrzhBK
 NF4vTBzmEOmFXoWjQSRYpge7HsSenwzzD4ljUiThYwEh0f2A4nuZ9Z7mU+21pBczZfhB
 MQGA==
X-Gm-Message-State: APjAAAXKLENqEYr2Y5CuQy82CeQWcsLu4TWzVPPQIoOf74fsSBUPHZBy
 Ep5i5q0p4KMIckmOCau/bncXtvDH1nrSLH8QXZecAVfmRpJm
X-Google-Smtp-Source: APXvYqy7SHoywomGmpRRGQOfRHAlD50ocSW6nQ6ugt5VWZKCvCo8SfnyYovVgE3ZOkflrPwPuNULbNVTBJdi5Engji2jZ7ttDdZV
MIME-Version: 1.0
X-Received: by 2002:a92:45d2:: with SMTP id z79mr28552816ilj.76.1575907081960; 
 Mon, 09 Dec 2019 07:58:01 -0800 (PST)
Date: Mon, 09 Dec 2019 07:58:01 -0800
In-Reply-To: <00000000000000ffab05992442a7@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d1c7150599477511@google.com>
Subject: Re: KASAN: global-out-of-bounds Read in fb_pad_aligned_buffer
From: syzbot <syzbot+0568d05e486eee0a1ba2@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, coreteam@netfilter.org, daniel.vetter@ffwll.ch, 
 davem@davemloft.net, dri-devel@lists.freedesktop.org, 
 gwshan@linux.vnet.ibm.com, kaber@trash.net, kadlec@blackhole.kfki.hu, 
 kraxel@redhat.com, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mpe@ellerman.id.au, netdev@vger.kernel.org, 
 netfilter-devel@vger.kernel.org, pablo@netfilter.org, peda@axentia.se, 
 ruscur@russell.cc, sam@ravnborg.org, stewart@linux.vnet.ibm.com, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Tue, 10 Dec 2019 08:40:04 +0000
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

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13ea0aeae00000
start commit:   9455d25f Merge tag 'ntb-5.5' of git://github.com/jonmason/..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=101a0aeae00000
console output: https://syzkaller.appspot.com/x/log.txt?x=17ea0aeae00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7a3b8f5088d4043a
dashboard link: https://syzkaller.appspot.com/bug?extid=0568d05e486eee0a1ba2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15ddeca6e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16df9e41e00000

Reported-by: syzbot+0568d05e486eee0a1ba2@syzkaller.appspotmail.com
Fixes: 2de50e9674fc ("powerpc/powernv: Remove support for p5ioc2")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
