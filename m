Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E08CA066A4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 21:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D6CE10E937;
	Wed,  8 Jan 2025 20:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="id8ODoj9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FAE910E937
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 20:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9sXMdrAsf83UYmPz7o8NHqLs8S9FkLI60oZYrNlbEpE=; b=id8ODoj9gU0Cdk3fyxjE3BdOdg
 uzdKMRy41bzNmrLscB4FzoMPJ5q7FYTtHLhNy8cYciYJrrqZfj1WblHHR20IRMFctT3j96n96gsKO
 aU0GsNK46nQFgEImmHiUJT11tcTDzlYSNewtMaYYpNHzmJS6WPMmNoPXpAy1HcrQcHBWWNgfc0ZTO
 BkaC1qZ/9eJAaE7h9DEcPguHWkzM5QJtDKQhFYgCdOb+p/YvzJwdQA2YsAl1G6bp7zfbGmAyLhc5g
 36GBWqjje5gB8aEEiFb905VC+d8oT67HKipiG6yC/KiUtQPcqHS90GWjL3Bi7Cix5Ul0hITNqkgTn
 jo44I6PA==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tVd4d-00000002p0c-1TjA; Wed, 08 Jan 2025 20:54:43 +0000
Date: Wed, 8 Jan 2025 20:54:43 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Hildenbrand <david@redhat.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [RFC PATCH 3/3] fb_defio: do not use deprecated page->mapping,
 index fields
Message-ID: <Z37mE7NdQu-ZgBES@casper.infradead.org>
References: <cover.1736352361.git.lorenzo.stoakes@oracle.com>
 <1e452b5b65f15a9a5d0c2ed3f5f812fdd1367603.1736352361.git.lorenzo.stoakes@oracle.com>
 <Z362xoQMxQRxYUlJ@casper.infradead.org>
 <b7465ad8-50ec-490b-a62a-e535e0a4691c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7465ad8-50ec-490b-a62a-e535e0a4691c@redhat.com>
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

On Wed, Jan 08, 2025 at 09:14:53PM +0100, David Hildenbrand wrote:
> On 08.01.25 18:32, Matthew Wilcox wrote:
> > On Wed, Jan 08, 2025 at 04:18:42PM +0000, Lorenzo Stoakes wrote:
> > > @@ -280,7 +269,10 @@ static void fb_deferred_io_work(struct work_struct *work)
> > >   		struct folio *folio = page_folio(pageref->page);
> > >   		folio_lock(folio);
> > > -		folio_mkclean(folio);
> > > +		rmap_wrprotect_file_page(fbdefio->mapping,
> > > +					 pageref->offset >> PAGE_SHIFT,
> > > +					 compound_nr(pageref->page),
> > > +					 page_to_pfn(pageref->page));
> > >   		folio_unlock(folio);
> > 
> > Why do we need to lock the folio?  (since this isn't necessarily a
> > folio)
> 
> Can you clarify the "since this isn't necessarily a folio" part ? Do you
> mean in the future, when we split "struct page" and "struct folio"?

Right.  I need to finish the email that explains where I think we're
going in 2025 ...

> Doing an rmap walk on something that won't be a folio is ... sounds odd
> (->wrong :) )

Not necessarily!  We already do that (since 2022) for DAX (see
6a8e0596f004).  rmap lets you find every place that a given range
of a file is mapped into user address spaces; but that file might be a
device file, and so it's not just pagecache but also (in this case)
fb memory, and whatever else device drivers decide to mmap.
