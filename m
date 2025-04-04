Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B99A7BE13
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 15:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C5210EBBF;
	Fri,  4 Apr 2025 13:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="Dwd9ER4f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (unknown [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6E210EBBF;
 Fri,  4 Apr 2025 13:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=pImUKw3M0PMcHdkWuYJ7D8sB/fzB+idx0s4djWcXKZQ=; b=Dwd9ER4f9M//fOrC7g8V+L/B+J
 wh7pwfrTC+243uBCbeTuappR+0W/kdLGj4rQvO3Iq2eL00rYyvCzQ4hra5f0vDgWoc/ezq2TJDHtQ
 ts5X0W3naA/uWGIvQA5dI6M7HlMJfS+cwtSV8k4GJhP1DzS1D1ekIss18q2w/i5OjepMZXcyvQ1Gq
 SNZucgzw+6AcKP23JEOQGgmxpPXHjBJOdnXbp8mocTBIlzsUzrakuoK0l5ghv2xfioCG7/mIiKD1M
 is3sFX1TIj63rFoHvSew0p8JWNvt32zBLfmy+NvPRi5iSqIi1HbZExLb9aoeuaf7rujMHNefCyY/5
 WZonuwjw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1u0hHP-0000000FZyo-3NRd;
 Fri, 04 Apr 2025 13:40:19 +0000
Date: Fri, 4 Apr 2025 14:40:19 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-fsdevel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 6/9] i915: Use writeback_iter()
Message-ID: <Z-_hQwNeiOnNYJVp@casper.infradead.org>
References: <20250402150005.2309458-1-willy@infradead.org>
 <20250402150005.2309458-7-willy@infradead.org>
 <Z--XtaM7Z3zbjzAu@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z--XtaM7Z3zbjzAu@infradead.org>
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

On Fri, Apr 04, 2025 at 01:26:29AM -0700, Christoph Hellwig wrote:
> On Wed, Apr 02, 2025 at 04:00:00PM +0100, Matthew Wilcox (Oracle) wrote:
> > Convert from an inefficient loop to the standard writeback iterator.
> 
> Not for this patch but a follow on:  we really need to improve the
> abstraction for using shmem for driver a bit.  Drivers implementing
> their own writeback_iter based loop is a bad idea.   Instead the
> code here in __shmem_writeback and the similar version in ttm need to
> be consolidated into a nicely abstracted highlevel API in shmem.c.
> 
> Similarly for the mess these drivers cause by calling into the
> write_begin and write_end aops.

Yes, I agree, we need an API for "I want to use some pagable memory"
that's almost certainly built on shmem but doesn't expose nearly as much
of the innards of shmem as this does.  I've been vaguely thinking about
what that might look like ever since Darrick came up with xfile for xfs
online scrub.  The GPUs have similar requirements, so that's three users.

I don't have anything concrete to talk about yet.
