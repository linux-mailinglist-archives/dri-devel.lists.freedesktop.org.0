Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7EDA0621F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 17:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F6810EC0B;
	Wed,  8 Jan 2025 16:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05D510EC0B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 16:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=FbU9VMY2knnyygoOkEqJ57aJta1BgUBzkTdgylqElUQ=; b=b7cNyG9G2ZGLQcMZWf3aJRITuA
 +WgZHkVzsXkPS/qfBTZ42vxQnWdnmgHoNk0qU+C5ZnVDPghuQQZ+uJWTVlpGxKmStMkZ8FxuqqGpX
 ywCma1pUtFTR/T+K9zYH1Vw2dlIUmTkVW1TUkNr5sDZfD7CqmVndqZ+Na2z+zWbB8h4We+xm9Q74c
 USGgpEaENMqGUMiVv3b6vwzIEEquwl97/0p2FXAzUaZNyPUjV2BFTFZvNrwzH4h9e4XZ9RCYzDt2U
 u5BIp3aDXX9O/DcUygBM7eSBOdJ5+v3knySEsAwN/XLGw3Litm1aupjduo4dsC3w2kRbnj12bmXfu
 6+7Vx33A==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tVZ57-000000021bJ-3u87; Wed, 08 Jan 2025 16:38:58 +0000
Date: Wed, 8 Jan 2025 16:38:57 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, David Hildenbrand <david@redhat.com>
Subject: Re: [RFC PATCH 1/3] mm: refactor rmap_walk_file() to separate out
 traversal logic
Message-ID: <Z36qIbm82vMLW7w_@casper.infradead.org>
References: <cover.1736352361.git.lorenzo.stoakes@oracle.com>
 <0c53589f34a6195938eeb58c3a88594fa30cc90a.1736352361.git.lorenzo.stoakes@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c53589f34a6195938eeb58c3a88594fa30cc90a.1736352361.git.lorenzo.stoakes@oracle.com>
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

On Wed, Jan 08, 2025 at 04:18:40PM +0000, Lorenzo Stoakes wrote:
> +/*
> + * rmap_walk_file - do something to file page using the object-based rmap method
> + * @folio: the folio to be handled
> + * @rwc: control variable according to each walk type
> + * @locked: caller holds relevant rmap lock
> + *
> + * Find all the mappings of a folio using the mapping pointer and the vma chains
> + * contained in the address_space struct it points to.
> + */
> +static void rmap_walk_file(struct folio *folio,
> +		struct rmap_walk_control *rwc, bool locked)
> +{
> +	struct address_space *mapping = folio_mapping(folio);

I'm unconvinced this shouldn't be just folio->mapping.  On the face of
it, we're saying that we're walking a file, and file folios just want
to use folio->mapping.  But let's dig a little deeper.

The folio passed in is locked, so it can't be changed during this call.
In folio_mapping(), folio_test_slab() is guaranteed untrue.
folio_test_swapcache() doesn't seem likely to be true either; unless
it's shmem, it can't be in the swapcache, and if it's shmem and in the
swap cache, it can't be mapped to userspace (they're swizzled back from
the swapcache to the pagecache before being mapped).  And then the
check for PAGE_MAPPING_FLAGS is guaranteed to be untrue (we know it's
not anon/ksm/movable).  So I think this should just be folio->mapping.

> +	/*
> +	 * The page lock not only makes sure that page->mapping cannot
> +	 * suddenly be NULLified by truncation, it makes sure that the
> +	 * structure at mapping cannot be freed and reused yet,
> +	 * so we can safely take mapping->i_mmap_rwsem.
> +	 */

I know you only moved this comment, but please fix it to refer to
folios, not pages.

> +	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
> +
> +	if (!mapping)
> +		return;

Maybe make this a WARN_ON_ONCE?

> +	__rmap_walk_file(folio, mapping, folio_pgoff(folio),
> +			 folio_nr_pages(folio), rwc, locked);

folio_pgoff() can go too.  Just use folio->index.

