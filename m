Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2675A8BB856
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2024 01:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51994112A6F;
	Fri,  3 May 2024 23:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.b="q9II9mXc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45EEF112A6F
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 23:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=WAsHHyyLON6bH8kMNcqPvKu+nLtQfBaFyUzhN8/fmXI=; b=q9II9mXcxby6lVXHsG0JVrkTJT
 TbnocjCJurqmvStTQbv944nSP6uYVmbtKY8TuAIqJWuFuYMBM6uSKLCHaXf7YAJTamWF8AZlFwhBd
 DdsNEgsrfspvlmCfg4xJufBuXxSVe9MpcRIvGsC9KG0PLWPnWS1+PDRTYHiOYD6STZ8q1UBLB4u0D
 uS3Sm/j31Dc0E4LJEai6HSyOQqGvvpgo6kBBURsydLKEF5K4A5j7XCAClx9B9/J6zWoohYOKVzV1h
 WhiylI9wqnNhkDsYA9X7ophPs2Yf0JPspgd4a3QjJkdSGwQlQpe81inObgOvhP4wK099OCZRkf9SW
 1dBGEOkg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1s32UW-00BGUG-0X; Fri, 03 May 2024 23:39:00 +0000
Date: Sat, 4 May 2024 00:39:00 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: keescook@chromium.org, axboe@kernel.dk, brauner@kernel.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 io-uring@vger.kernel.org, jack@suse.cz, laura@labbott.name,
 linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 minhquangbui99@gmail.com, sumit.semwal@linaro.org,
 syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] epoll: try to be a _bit_ better about file lifetimes
Message-ID: <20240503233900.GG2118490@ZenIV>
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240503214531.GB2118490@ZenIV>
 <CAHk-=wgC+QpveKCJpeqsaORu7htoNNKA8mp+d9mvJEXmSKjhbw@mail.gmail.com>
 <20240503220145.GD2118490@ZenIV> <20240503220744.GE2118490@ZenIV>
 <CAHk-=whULchE1i5LA2Fa=ZndSAzPXGWh_e5+a=YV3qT1BEST7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whULchE1i5LA2Fa=ZndSAzPXGWh_e5+a=YV3qT1BEST7w@mail.gmail.com>
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

On Fri, May 03, 2024 at 04:16:15PM -0700, Linus Torvalds wrote:
> On Fri, 3 May 2024 at 15:07, Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> > Suppose your program calls select() on a pipe and dmabuf, sees data to be read
> > from pipe, reads it, closes both pipe and dmabuf and exits.
> >
> > Would you expect that dmabuf file would stick around for hell knows how long
> > after that?  I would certainly be very surprised by running into that...
> 
> Why?
> 
> That's the _point_ of refcounts. They make the thing they refcount
> stay around until it's no longer referenced.
> 
> Now, I agree that dmabuf's are a bit odd in how they use a 'struct
> file' *as* their refcount, but hey, it's a specialty use. Unusual
> perhaps, but not exactly wrong.
> 
> I suspect that if you saw a dmabuf just have its own 'refcount_t' and
> stay around until it was done, you wouldn't bat an eye at it, and it's
> really just the "it uses a struct file for counting" that you are
> reacting to.

*IF* those files are on purely internal filesystem, that's probably
OK; do that with something on something mountable (char device,
sysfs file, etc.) and you have a problem with filesystem staying
busy.

I'm really unfamiliar with the subsystem; it might be OK with all
objects that use that for ->poll(), but that's definitely not a good
thing to see in ->poll() instance in general.  And code gets copied,
so there really should be a big fat comment about the reasons why
it's OK in this particular case.

Said that, it seems that a better approach might be to have
their ->release() cancel callbacks and drop fence references.
Note that they *do* have refcounts - on fences.  The file
(well, dmabuf, really) is pinned only to protect against the
situation when pending callback is still around.  And Kees'
observation about multiple fences is also interesting - we don't
get extra fput(), but only because we get events only from one
fence, which does look fishy...
