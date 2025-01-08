Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0B5A06383
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 18:33:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A44510E158;
	Wed,  8 Jan 2025 17:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="pANWxhKc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBEC10E900
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 17:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=efjfjhNy/ciPUjqdeZUPjdUi9qYemP+O/s6sz7yjRHE=; b=pANWxhKcc5wYNurkiGzQddiIqL
 w7FpUk/gg2lJv6MnbCeORlEgD9UrFNs//jhfIECLEtqRFCAv9y23s8T9g+biYYGyzU23Cjj5RQRzw
 +5FZck6XehMK7OSNvk8LNAReH3dmWzwsLeb1pqmxVDhp0x73Kct0k8oeL+bsrhDyCtganEVeG+Ghf
 6R3I1t5hzKiYTOlpPwn/Yymgh5pjRJe/J8vxZ2cMggjbgWHpdfpB1TsMy8m8u1QFkUizqc/Mjplm1
 klqEBhaNR0HRTpWaFEpms2iwL0Qt9vIBuQvU+zpmLBHN75pk2843p+7s4Ix2acbOOL0rFFJdubgZH
 nlqQdF5w==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tVZvK-00000002GR2-2UD8; Wed, 08 Jan 2025 17:32:54 +0000
Date: Wed, 8 Jan 2025 17:32:54 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, David Hildenbrand <david@redhat.com>
Subject: Re: [RFC PATCH 3/3] fb_defio: do not use deprecated page->mapping,
 index fields
Message-ID: <Z362xoQMxQRxYUlJ@casper.infradead.org>
References: <cover.1736352361.git.lorenzo.stoakes@oracle.com>
 <1e452b5b65f15a9a5d0c2ed3f5f812fdd1367603.1736352361.git.lorenzo.stoakes@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e452b5b65f15a9a5d0c2ed3f5f812fdd1367603.1736352361.git.lorenzo.stoakes@oracle.com>
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

On Wed, Jan 08, 2025 at 04:18:42PM +0000, Lorenzo Stoakes wrote:
> @@ -280,7 +269,10 @@ static void fb_deferred_io_work(struct work_struct *work)
>  		struct folio *folio = page_folio(pageref->page);
>  
>  		folio_lock(folio);
> -		folio_mkclean(folio);
> +		rmap_wrprotect_file_page(fbdefio->mapping,
> +					 pageref->offset >> PAGE_SHIFT,
> +					 compound_nr(pageref->page),
> +					 page_to_pfn(pageref->page));
>  		folio_unlock(folio);

Why do we need to lock the folio?  (since this isn't necessarily a
folio)  Also, do we need compound_nr() here?  I _think_ for defio,
the number of pages allocated per object are fixed, so this should be
an fbdefio->nr_pages field?

(something that's always troubled me about compound_nr() is that it
returns 1 for tail pages and the number you actually expect for head
pages)

