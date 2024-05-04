Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949448BBA8E
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2024 12:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7855910E86E;
	Sat,  4 May 2024 10:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gIVHK8rJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B3A10E86E
 for <dri-devel@lists.freedesktop.org>; Sat,  4 May 2024 10:44:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 86E99601DA;
 Sat,  4 May 2024 10:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F3E0C072AA;
 Sat,  4 May 2024 10:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714819475;
 bh=BLItYotWYbyfjyaUpV2xQFYIZr6/mKHn7Hcq1DddZd4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gIVHK8rJGTpZuS9PubMDG4bY2YumcGjk6TzRhJqqAh/plbNUsquxQFGCUWECGrJRE
 EzEvSIxTo4EYaTNfUE2NBTtvQOeoS6PxKjWcxkktWj4E/WHJr8O8fAnG3sfoTBN/4+
 G8i9tDMgpoyUa85xPHmgl+X+CQSc0wuLRN7dziptjOtID8DTpn20rQzI5uVZV/AEjb
 4Ape1g8W24bX7M1DAREc4k2jprCEjKPolqNkqjfYm83hFYMcF9DEBJfSs+DW6g3CfW
 1/6/xZZebHis+jmMY6X8+A/X1qDg3q6lPjUs79o8NavTNxTFe91+9fo0VupPerS0F3
 7PiA+rIodq4lg==
Date: Sat, 4 May 2024 12:44:28 +0200
From: Christian Brauner <brauner@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, keescook@chromium.org, 
 axboe@kernel.dk, christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
 io-uring@vger.kernel.org, jack@suse.cz, laura@labbott.name,
 linaro-mm-sig@lists.linaro.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 minhquangbui99@gmail.com, sumit.semwal@linaro.org, 
 syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] epoll: try to be a _bit_ better about file lifetimes
Message-ID: <20240504-chatten-unbelastet-b308db41727c@brauner>
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240503214531.GB2118490@ZenIV>
 <CAHk-=wgC+QpveKCJpeqsaORu7htoNNKA8mp+d9mvJEXmSKjhbw@mail.gmail.com>
 <20240503220145.GD2118490@ZenIV> <20240503220744.GE2118490@ZenIV>
 <CAHk-=whULchE1i5LA2Fa=ZndSAzPXGWh_e5+a=YV3qT1BEST7w@mail.gmail.com>
 <20240503233900.GG2118490@ZenIV>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240503233900.GG2118490@ZenIV>
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

On Sat, May 04, 2024 at 12:39:00AM +0100, Al Viro wrote:
> On Fri, May 03, 2024 at 04:16:15PM -0700, Linus Torvalds wrote:
> > On Fri, 3 May 2024 at 15:07, Al Viro <viro@zeniv.linux.org.uk> wrote:
> > >
> > > Suppose your program calls select() on a pipe and dmabuf, sees data to be read
> > > from pipe, reads it, closes both pipe and dmabuf and exits.
> > >
> > > Would you expect that dmabuf file would stick around for hell knows how long
> > > after that?  I would certainly be very surprised by running into that...
> > 
> > Why?
> > 
> > That's the _point_ of refcounts. They make the thing they refcount
> > stay around until it's no longer referenced.
> > 
> > Now, I agree that dmabuf's are a bit odd in how they use a 'struct
> > file' *as* their refcount, but hey, it's a specialty use. Unusual
> > perhaps, but not exactly wrong.
> > 
> > I suspect that if you saw a dmabuf just have its own 'refcount_t' and
> > stay around until it was done, you wouldn't bat an eye at it, and it's
> > really just the "it uses a struct file for counting" that you are
> > reacting to.
> 
> *IF* those files are on purely internal filesystem, that's probably
> OK; do that with something on something mountable (char device,
> sysfs file, etc.) and you have a problem with filesystem staying
> busy.

In this instance it is ok because dma-buf is an internal fs. I had the
exact same reaction you had initially but it doesn't matter for dma-buf
afaict as that thing can never be unmounted.
