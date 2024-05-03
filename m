Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E79608BB597
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BAAB10FB87;
	Fri,  3 May 2024 21:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.b="lHUXrMUy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B256810FB87
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=vSF9CJAk18KfYQ6Yz2FBQxa3cjRXNGsVqxiFCavCXyw=; b=lHUXrMUy3szqVJFXp8ewwVyALG
 FMwhGXj/QBF2ekq73bYumwb8JvTE5PalsZ/PXPWVBB0oPorPebp2p+RIBHU5rMBlca8sRkgFVg50b
 RiQbqehih1W0n77kUD51e1Ju8d4qNoEz+iD4dDvl/i+QyYhIO47/IUPNa9b5W8RqhJdO1Zii9HJ8R
 Tu56r7I50FMejgn8K4U+56PWJ5ubJUM/djzCFRHyVI6whK4JddDTF4M5gsKpbE2ScztycM8lwTywG
 kc6isI7RHzwqBNN1wTBXvtIxbWAa7z6X7h3OsXyp1il17czzMLjeA9HwLKD9q8gTzmbf002b7rhS2
 Ho0KrFIA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1s30OK-00B7yG-1D; Fri, 03 May 2024 21:24:28 +0000
Date: Fri, 3 May 2024 22:24:28 +0100
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
Message-ID: <20240503212428.GY2118490@ZenIV>
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503211129.679762-2-torvalds@linux-foundation.org>
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

On Fri, May 03, 2024 at 02:11:30PM -0700, Linus Torvalds wrote:
> epoll is a mess, and does various invalid things in the name of
> performance.
> 
> Let's try to rein it in a bit. Something like this, perhaps?

> +/*
> + * The ffd.file pointer may be in the process of
> + * being torn down due to being closed, but we
> + * may not have finished eventpoll_release() yet.
> + *
> + * Technically, even with the atomic_long_inc_not_zero,
> + * the file may have been free'd and then gotten
> + * re-allocated to something else (since files are
> + * not RCU-delayed, they are SLAB_TYPESAFE_BY_RCU).

Can we get to ep_item_poll(epi, ...) after eventpoll_release_file()
got past __ep_remove()?  Because if we can, we have a worse problem -
epi freed under us.

If not, we couldn't possibly have reached ->release() yet, let
alone freeing anything.
