Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4463C8BC9D7
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 10:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDBB11224D;
	Mon,  6 May 2024 08:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WiQEaAXK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C370711224E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 08:45:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DD7CDCE0B93;
 Mon,  6 May 2024 08:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E24BC116B1;
 Mon,  6 May 2024 08:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714985135;
 bh=dJ9zuyrdQMElrOzde31P4H08+N2W3DV9j7dWCbVqR4k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WiQEaAXK+d3VZO4xZnfaaIE7Sfh/pbjnMpO2gmWdDzHwWYp4rCrmzMwXPbAuSq2D8
 fH+uA4HbPL5yqyI2GI4Xc1nJoimiQWf+O2OZbhl4eYWFSaH6g9e91opm+dSgDUUjAo
 cG3n3hq8hLlCm6ZsuoLuvkOvcM+NPydIKO2b4EhgiC3t07V0qaT/mPyvfrKo2du0XH
 JKiCZbDEcy7JnFsbVJDyor6eEcRM3VC21/p2XQujBcHzxcTTufWj4iOIv1ZXu3TpfD
 Gedh6JD88bRDWqWtwfa4IVCiDN3PyGp/pVOTPWZ2724+lohSOjT706b6NsDbMz5iyb
 wPCurUHMEdlsw==
Date: Mon, 6 May 2024 10:45:27 +0200
From: Christian Brauner <brauner@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, keescook@chromium.org, 
 axboe@kernel.dk, christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
 io-uring@vger.kernel.org, jack@suse.cz, laura@labbott.name,
 linaro-mm-sig@lists.linaro.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 minhquangbui99@gmail.com, sumit.semwal@linaro.org, 
 syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] epoll: try to be a _bit_ better about file lifetimes
Message-ID: <20240506-injizieren-administration-f5900157566a@brauner>
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
 <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wirxPSQgRV1u7t4qS1t4ED7w7OeehdUSC-LYZXspqa49w@mail.gmail.com>
 <20240505-gelehnt-anfahren-8250b487da2c@brauner>
 <CAHk-=wgMzzfPwKc=8yBdXwSkxoZMZroTCiLZTYESYD3BC_7rhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wgMzzfPwKc=8yBdXwSkxoZMZroTCiLZTYESYD3BC_7rhQ@mail.gmail.com>
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

> The fact is, it's not dma-buf that is violating any rules. It's epoll.

I agree that epoll() not taking a reference on the file is at least
unexpected and contradicts the usual code patterns for the sake of
performance and that it very likely is the case that most callers of
f_op->poll() don't know this.

Note, I cleary wrote upthread that I'm ok to do it like you suggested
but raised two concerns a) there's currently only one instance of
prolonged @file lifetime in f_op->poll() afaict and b) that there's
possibly going to be some performance impact on epoll().

So it's at least worth discussing what's more important because epoll()
is very widely used and it's not that we haven't favored performance
before.

But you've already said that you aren't concerned with performance on
epoll() upthread. So afaict then there's really not a lot more to
discuss other than take the patch and see whether we get any complaints.
