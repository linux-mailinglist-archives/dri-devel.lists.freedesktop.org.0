Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 608D1168DF5
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 10:03:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5253F6E508;
	Sat, 22 Feb 2020 09:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445936E508
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 09:03:31 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q9so4151687wmj.5
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 01:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=ytnpfbkyeaMOd6evlPcT/r/gbxcbWxB+N8iGm6jtdCQ=;
 b=o78eWWHge3JiYjTFx+l6fc/XvelGo5lDauNKBYB/zcieYcPykIkOBC2DNuXlWIJCn/
 Am7o5yqn+28hh5KpuV+X5/RpHi7fQGZGcwb6+/szDTi6rTRPPxywBQ6hxTHpJ2eGpj4b
 wtpbWBejXV2TlYRYMG7yw3rNI6phwnyvNNRuToXU00CZwhAux6T9b87O3jwPWCBUkhvS
 PQFBxNyGIOH+Oml1frR6jqODhS5sgafo7bixVBLIlXHxxkEDso+2dd8W6g+CHS4m0pOl
 sBSMPoHz3anv/12z/4CS+W7q9qF5ALCcsAowKd3RZHllmPn45zdpWN/AUKZI/K3nKk3S
 Pjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=ytnpfbkyeaMOd6evlPcT/r/gbxcbWxB+N8iGm6jtdCQ=;
 b=S8B2Ei2qEE8UsKjdG7OUs74y81a+zRCs0U5D/XyrAP+i+tq9AuIghtHbnXdJguMxq2
 B1Afy8wyUCt2AtjZxPOm40GzxwTzRdnJ9GGMXhq+RDH+nKjtfoa3Qbj8US37QlBAke2N
 EAphTN/wadj7nSFsSAqxTXyotG1E8DqO/d1qqLR82Z3uPHBVCW2zifpQPVz2p2HuD+36
 sQOw0sjD6h2Is4VFC81HFnIZeDj3V0W3QDbBRKr55NwLD5T66CbkCPFRgsLFmsRwHp5x
 RmwbGmrgjmGDt4g9PC+fu2zFpAYDmWl0gg+bzKMqOsnC8daAEWOxBY7D5zTvXfbmNoyL
 gWkg==
X-Gm-Message-State: APjAAAVKHbFW7QSVyjT4lCducuLObklEnCxOVfgMG+YOpo0HpLJ9eW1z
 A6UqVTVi2xwX1t/7lO9wqE6pZQx+1BY=
X-Google-Smtp-Source: APXvYqwiYelO65Mv0TwPGG6iTwWMoujAzM6NeGyF6Ms4iJdozR8plHNC46F8FIiEgwVEAzgE7/Ba0g==
X-Received: by 2002:a05:600c:22d3:: with SMTP id
 19mr8925782wmg.20.1582362209434; 
 Sat, 22 Feb 2020 01:03:29 -0800 (PST)
Received: from smtp.gmail.com ([2001:818:e238:a000:a4ba:2182:c4c1:3b20])
 by smtp.gmail.com with ESMTPSA id r3sm7866349wrn.34.2020.02.22.01.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Feb 2020 01:03:28 -0800 (PST)
Date: Sat, 22 Feb 2020 06:03:21 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: Looking for guidance to reproduce a bug in drm/vkms reported by
 syzkaller
Message-ID: <20200222090321.swxvqnwjqynqeh46@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: daniel.vetter@ffwll.ch, rodrigosiqueiramelo@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I am trying to reproduce a syzkaller bug found in the vkms:
- WARNING in vkms_gem_free_object
- https://groups.google.com/forum/#!msg/syzkaller-bugs/_oARhriB1SA/PelnW1BqAwAJ

However, I was not very successful in this task. As I don't know how to deal
with syzkaller and I am not sure if I am following the right steps, it would be
great if someone can give me some tips and guidance.

First, looking at the bug history at:
- https://syzkaller.appspot.com/bug?extid=e7ad70d406e74d8fc9d0,
it seems like the bug still exists. Am I right?

Second, here is a report of what I tried to do:
Note: For testing, I use a VM (QEMU) with Debian 10 with a kernel compiled at
- https://cgit.freedesktop.org/drm/drm-misc (branch drm-misc-next)

1 - Using the usual .config for my VM, I compiled and installed the kernel and,
as root, ran the C program provided by syzkaller:
- https://syzkaller.appspot.com/x/repro.c?x=15e27c53600000
Nothing happened.

2 - Then, I checked the debug/panic/hacking/drm/i915 debugging/vkms settings on
the .config reported by syzkaller:
- https://syzkaller.appspot.com/x/.config?x=7cf4eed5fe42c31a
and enabled the same things in my .config.
I compiled and installed the kernel and ran the C program.
Nothing happened.

3 - So, I reverted my current branch to the commit that generated the bug
(as reported: 94e2ec3f7fef86506293a448273b2b4ee21e6195) and used the kernel on
that state.
Nothing happened.

4 - I decided to use the syzkaller .config without modifications and
adaptations for my VM (although I didn't think it felt right). I compiled,
installed... some boot problems happened, but the kernel worked. I ran the C
program and nothing.

So I gave up... for a while :)

Does anyone have any advice for me?
I have already searched for information on the Internet, but I am still stuck.

The last thing that I noted is that syzkaller stopped providing a C program of
this bug for crashes after the beginning of the year (I also don't know if it
is something important).

Thanks in advance,

Melissa Wen
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
