Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E52669D503
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 21:33:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F3410E071;
	Mon, 20 Feb 2023 20:33:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD30110E071;
 Mon, 20 Feb 2023 20:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=X6oKYpBwCPPA2hKDvH6wktIKJITLyPmX0fi+XHJg5NA=; b=mYmoJ0rbUaT5FaaxuvwwJb3Ehe
 APso/ZhX3utDjjf8833KEVujc3ZRAlkvVNcEp3kq/Vke+H2z+mGGIH9KFor5MOJpidNYY+92Fp3jD
 SqGAstCH6lAUYqyhaBp8ZUZIkOwlmOiXgQwrVyiDTGYm51xTZN/0jmooRF+bg0ifoTLCvgzjNVief
 guN5FOAhbkmXODvTRPGzDv8BxOJtg7DZyewqvGsvkvLS/j3unzSdzMH1WR3gns1TGGZhnmkZNJ+0b
 NbgHzIBLoKGJQ8Jd5bSoPdGixKvBijeQemjCLBIpx6nThFLb774j9BxAbb/06H3VZVtoNiRpTQwaV
 1Aep9b8g==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pUCqt-00C0Dm-D9; Mon, 20 Feb 2023 20:33:35 +0000
Date: Mon, 20 Feb 2023 20:33:35 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v2 04/16] maple_tree: add flag MT_FLAGS_LOCK_NONE
Message-ID: <Y/PZH/q2Xsr3od9m@casper.infradead.org>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-5-dakr@redhat.com>
 <Y+/Xn11dfdn7SfBD@casper.infradead.org>
 <3bb02ec3-4d19-9135-cabc-26ed210f7396@redhat.com>
 <Y/ONYhyDCPEYH1ml@casper.infradead.org>
 <e43f6acc-175d-1031-c4a2-67a6f1741866@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e43f6acc-175d-1031-c4a2-67a6f1741866@redhat.com>
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

On Mon, Feb 20, 2023 at 06:06:03PM +0100, Danilo Krummrich wrote:
> On 2/20/23 16:10, Matthew Wilcox wrote:
> > This is why we like people to use the spinlock embedded in the tree.
> > There's nothing for the user to care about.  If the access really is
> > serialised, acquiring/releasing the uncontended spinlock is a minimal
> > cost compared to all the other things that will happen while modifying
> > the tree.
> 
> I think as for the users of the GPUVA manager we'd have two cases:
> 
> 1) Accesses to the manager (and hence the tree) are serialized, no lock
> needed.
> 
> 2) Multiple operations on the tree must be locked in order to make them
> appear atomic.

Could you give an example here of what you'd like to do?  Ideally
something complicated so I don't say "Oh, you can just do this" when
there's a more complex example for which "this" won't work.  I'm sure
that's embedded somewhere in the next 20-odd patches, but it's probably
quicker for you to describe in terms of tree operations that have to
appear atomic than for me to try to figure it out.

> In either case the embedded spinlock wouldn't be useful, we'd either need an
> external lock or no lock at all.
> 
> If there are any internal reasons why specific tree operations must be
> mutually excluded (such as those you explain below), wouldn't it make more
> sense to always have the internal lock and, optionally, allow users to
> specify an external lock additionally?

So the way this works for the XArray, which is a little older than the
Maple tree, is that we always use the internal spinlock for
modifications (possibly BH or IRQ safe), and if someone wants to
use an external mutex to make some callers atomic with respect to each
other, they're free to do so.  In that case, the XArray doesn't check
the user's external locking at all, because it really can't know.

I'd advise taking that approach; if there's really no way to use the
internal spinlock to make your complicated updates appear atomic
then just let the maple tree use its internal spinlock, and you can
also use your external mutex however you like.
