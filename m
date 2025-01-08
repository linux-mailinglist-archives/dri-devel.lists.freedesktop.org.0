Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59087A0679D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 22:55:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D76910E2B5;
	Wed,  8 Jan 2025 21:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="tKtR3JeM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F187310E2B5
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 21:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=GZFfG+Oey+YrRCmnuLUDH49MTGtZAOROTvCOTJdkge4=; b=tKtR3JeM6A1gmAWNtq4cuOMcjM
 Ymux5zQa7scoEka+qRFfaW9TtNncXNfaGb0/Dur+AnmApwhDpMulmiupz69vy885FpWVvr+kf12Mv
 QV/Y0jB8EFEU2D7DCawSyRYGvekSg24VJrNJRHJgv+w3rX6QJgYtWqnVlFJd+RZszj4XK67Pb4szY
 hDRHyLmHH59eOk/GiBit7gph6L0jZUOKh+8mYxOesouUB6VUeVFEGCowNisc7TcDQ0VJ//RZMrd59
 8kniig18CBsDcV/cctYTRE2YKf1R8ZWHFHaqHPlJRVSveYFAMKJgyitdKWPg3F2Sf5cMXBXznmozy
 pm+98I7Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tVe1B-00000002xlB-08gm; Wed, 08 Jan 2025 21:55:13 +0000
Date: Wed, 8 Jan 2025 21:55:12 +0000
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
Message-ID: <Z370QO_Qq8-g4DZ6@casper.infradead.org>
References: <cover.1736352361.git.lorenzo.stoakes@oracle.com>
 <1e452b5b65f15a9a5d0c2ed3f5f812fdd1367603.1736352361.git.lorenzo.stoakes@oracle.com>
 <Z362xoQMxQRxYUlJ@casper.infradead.org>
 <b7465ad8-50ec-490b-a62a-e535e0a4691c@redhat.com>
 <Z37mE7NdQu-ZgBES@casper.infradead.org>
 <34ad8349-c4c3-4370-a662-324fa91b32b1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34ad8349-c4c3-4370-a662-324fa91b32b1@redhat.com>
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

On Wed, Jan 08, 2025 at 10:12:36PM +0100, David Hildenbrand wrote:
> On 08.01.25 21:54, Matthew Wilcox wrote:
> > Not necessarily!  We already do that (since 2022) for DAX (see
> > 6a8e0596f004).  rmap lets you find every place that a given range
> > of a file is mapped into user address spaces; but that file might be a
> > device file, and so it's not just pagecache but also (in this case)
> > fb memory, and whatever else device drivers decide to mmap.
> 
> Yes, that part I remember.
> 
> I thought we would be passing in a page into rmap_wrprotect_file_page(), and
> was wondering what we would do to "struct page" that won't be a folio in
> there.
> 
> Probably, because the "_page" in rmap_wrprotect_file_page() is misleading :)
> 
> ... should it be "file_range" ? (but we also pass the pfn ... )

I don't think it's unprecedented for us to identify a page by its pfn.
After all, the acronym stands for "page frame number".  That said, for
the one caller of this, it has the struct page and passes in the result
from page_to_pfn().  So no harm in passing in the struct page directly.

I would not like to see this function called "rmap_wrprotect_file_pfn".
Files don't have pfns, so that's a bad name.
