Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C089E6A49E4
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 19:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFFA10E1E4;
	Mon, 27 Feb 2023 18:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC4810E1D8;
 Mon, 27 Feb 2023 18:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=jYT+cGJBvQcrrjhbci0ohC6UHJhkTcwfc27DUKpdpjo=; b=DYZiatxMcGzMStxHrkjOwq1K3C
 tSf8vNX+Z9nv50rokR5GAdnOs9ehEfqo6HT16BCOr/D7Qw678un7eK9IvP7AZUI4PSjmQC5vGs/6e
 i4MNwKGONuiZB89KQYE8FJOmqwLEGJrOyLEeXpxMK5MOErpyQNinxWNY06mEtRA81ojSQMLJgJax/
 FCkMOylQgSg7TepXBGpoWBilkjiAnckITPS124OWuMV/f8tfETAkxHC3YCTuXXpwm7FCBhKFQWn+X
 EjT1SPnMy8IzDGwfW6ujMPWMprMba8gkcVh2oerkNgYxV6FX08XNhLHEh3N3B1pqhhJyTevC/CL2Q
 C93Lx7Tw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pWiMi-000Jv6-NK; Mon, 27 Feb 2023 18:36:48 +0000
Date: Mon, 27 Feb 2023 18:36:48 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v2 04/16] maple_tree: add flag MT_FLAGS_LOCK_NONE
Message-ID: <Y/z4QMyIkZLi4Ruw@casper.infradead.org>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-5-dakr@redhat.com>
 <Y+/Xn11dfdn7SfBD@casper.infradead.org>
 <3bb02ec3-4d19-9135-cabc-26ed210f7396@redhat.com>
 <Y/ONYhyDCPEYH1ml@casper.infradead.org>
 <e43f6acc-175d-1031-c4a2-67a6f1741866@redhat.com>
 <Y/PZH/q2Xsr3od9m@casper.infradead.org> <Y/TXPasvkhtGiR+w@pollux>
 <Y/UN50hCaRe+8ZCg@casper.infradead.org>
 <67942a68-2ae7-8883-25d7-c6d595c3587e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67942a68-2ae7-8883-25d7-c6d595c3587e@redhat.com>
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
Cc: matthew.brost@intel.com, bagasdotme@gmail.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, boris.brezillon@collabora.com, bskeggs@redhat.com,
 tzimmermann@suse.de, Liam.Howlett@oracle.com, christian.koenig@amd.com,
 jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 27, 2023 at 06:39:33PM +0100, Danilo Krummrich wrote:
> On 2/21/23 19:31, Matthew Wilcox wrote:
> > Lockdep will shout at you if you get it wrong ;-)  But you can safely
> > take the spinlock before calling mas_store_gfp(GFP_KERNEL) because
> > mas_nomem() knows to drop the lock before doing a sleeping allocation.
> > Essentially you're open-coding mtree_store_range() but doing your own
> > thing in addition to the store.
> 
> As already mentioned, I went with your advice to just take the maple tree's
> internal spinlock within the GPUVA manager and leave all the other locking
> to the drivers as intended.
> 
> However, I run into the case that lockdep shouts at me for not taking the
> spinlock before calling mas_find() in the iterator macros.
> 
> Now, I definitely don't want to let the drivers take the maple tree's
> spinlock before they use the iterator macro. Of course, drivers shouldn't
> even know about the underlying maple tree of the GPUVA manager.
> 
> One way to make lockdep happy in this case seems to be taking the spinlock
> right before mas_find() and drop it right after for each iteration.

While we don't have any lockdep checking of this, you really shouldn't be
using an iterator if you're going to drop the lock between invocations.
The iterator points into the tree, so you need to invalidate the iterator
any time you drop the lock.

You don't have to use a spinlock to do a read iteration.  You can just
take the rcu_read_lock() around your iteration, as long as you can
tolerate the mild inconsistencies that RCU permits.
