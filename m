Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5288BB6D3
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2024 00:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0FD1132D7;
	Fri,  3 May 2024 22:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.b="ixw6Zn2z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D911E1132D7
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 22:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=e9Q+lbqOogW8HNifFtsIP7Map61/HL1nsdMCnQKDqeg=; b=ixw6Zn2z08k8IXQn2UeXsg+bKm
 YT3mHFmtdAxGr/T71cJoTeAIJ9cybNhYjA10uBoNjdruajFBVfshWTS99mzQn2BmAvL0djycRGaQz
 xO/QjrzDFf9tqc5QzRG6rzZrX99A81BgK3nEiL9esE/1qEfd7lk3nh6DcYI/Av3A3MXZLD1vmsqZY
 wCSMQDHzhg4C+aMRUsopmDTuohWXXzzBH1hOQUtkVRzh2Ep1hwz+1DIcC0xxSOjGPRTETMXEaoTk3
 zQkG2/bCiipFfKanmwEaPpVtxOzrxyksfbooWWc39v4tytCwFwZSumInNvhBsO7Uj9Re0lt+ZNJ5O
 6A9rw/Iw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1s30yP-00BAPg-2r; Fri, 03 May 2024 22:01:46 +0000
Date: Fri, 3 May 2024 23:01:45 +0100
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
Message-ID: <20240503220145.GD2118490@ZenIV>
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240503214531.GB2118490@ZenIV>
 <CAHk-=wgC+QpveKCJpeqsaORu7htoNNKA8mp+d9mvJEXmSKjhbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgC+QpveKCJpeqsaORu7htoNNKA8mp+d9mvJEXmSKjhbw@mail.gmail.com>
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

On Fri, May 03, 2024 at 02:52:38PM -0700, Linus Torvalds wrote:
> On Fri, 3 May 2024 at 14:45, Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> > How do you get through eventpoll_release_file() while someone
> > has entered ep_item_poll()?
> 
> Doesn't matter.
> 
> Look, it's enough that the file count has gone down to zero. You may
> not even have gotten to eventpoll_release_file() yet - the important
> part is that you're on your *way* to it.
> 
> That means that the file will be released - and it means that you have
> violated all the refcounting rules for poll().
> 
> So I think you're barking up the wrong tree.

IMO there are several things in that mess (aside of epoll being what it is).

Trying to grab refcount as you do is fine; the comment is seriously
misleading, though - we *are* guaranteed that struct file hasn't hit ->release(),
let alone getting freed and reused.

Having pollwait callback grab references is fine - and the callback belongs
to whoever's calling ->poll().

Having ->poll() instance itself grab reference is really asking for problem,
even on the boxen that have CONFIG_EPOLL turned off.  select(2) is enough;
it will take care of references grabbed by __pollwait(), but it doesn't
know anything about the references driver has stashed hell knows where for
hell knows how long.
