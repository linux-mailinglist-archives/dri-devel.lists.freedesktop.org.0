Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 369157A6848
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 17:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1F210E27A;
	Tue, 19 Sep 2023 15:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8AF10E27A;
 Tue, 19 Sep 2023 15:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=K4XOxDjoQc0tDKul2sAFg8dPE5RBNC5v+ER7EvKWlro=; b=NUUqRKI9eBera0KC3gXkeqZtkM
 /GFKMZSxhT/N4WSHKiJ/LnKARML8J4fVRmJAK6vS+sngTB3qVVyL5CZ7+aYjPzEBzodj/t51kyRLt
 +lC5J68P8dYuCckGOdMcFiLmJTQjK6XnyMKf+KwyMI7oVjFXRLoLzSfMEgkQla6fltpCc33xk0tTD
 jkWzrEOofVLacRE1OsH9DD0Y3UrJuKKDfV9dv6ARDpn1HVgbpIj1e8+kk7CJygrv6/VjTWV4BPRkl
 RwV6MSNc1q6jXJklBhtoCEN0yr3A6DbNe1h+LuJ/9Kx0mqQ2fnY4HswW1WJ8xjBYMRuhM1tY0rMmS
 FoqlIc6w==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qict2-000Qnd-Tt; Tue, 19 Sep 2023 15:43:40 +0000
Date: Tue, 19 Sep 2023 16:43:40 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: Re: [REGRESSION] [BISECTED] Panic in gen8_ggtt_insert_entries() with
 v6.5
Message-ID: <ZQnBrLCPnZfG0A1s@casper.infradead.org>
References: <4857570.31r3eYUQgx@natalenko.name>
 <6287208.lOV4Wx5bFT@natalenko.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6287208.lOV4Wx5bFT@natalenko.name>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Nathan Chancellor <nathan@kernel.org>, linux-mm@kvack.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Fei Yang <fei.yang@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 19, 2023 at 10:26:42AM +0200, Oleksandr Natalenko wrote:
> Andrzej asked me to try to revert commits 0b62af28f249, e0b72c14d8dc and 1e0877d58b1e, and reverting those fixed the i915 crash for me. The e0b72c14d8dc and 1e0877d58b1e commits look like just prerequisites, so I assume 0b62af28f249 ("i915: convert shmem_sg_free_table() to use a folio_batch") is the culprit here.
> 
> Could you please check this?
> 
> Our conversation with Andrzej is available at drm-intel GitLab [1].
> 
> Thanks.
> 
> [1] https://gitlab.freedesktop.org/drm/intel/-/issues/9256

Wow, that is some great debugging.  Thanks for all the time & effort
you and others have invested.  Sorry for breaking your system.

You're almost right about the "prerequisites", but it's in the other
direction; 0b62af28f249 is a prerequisite for the later two cleanups,
so reverting all three is necessary to test 0b62af28f249.

It seems to me that you've isolated the problem to constructing overly
long sg lists.  I didn't realise that was going to be a problem, so
that's my fault.

Could I ask you to try this patch?  I'll follow up with another patch
later because I think I made another assumption that may not be valid.

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 8f1633c3fb93..73a4a4eb29e0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -100,6 +100,7 @@ int shmem_sg_alloc_table(struct drm_i915_private *i915, struct sg_table *st,
 	st->nents = 0;
 	for (i = 0; i < page_count; i++) {
 		struct folio *folio;
+		unsigned long nr_pages;
 		const unsigned int shrink[] = {
 			I915_SHRINK_BOUND | I915_SHRINK_UNBOUND,
 			0,
@@ -150,6 +151,8 @@ int shmem_sg_alloc_table(struct drm_i915_private *i915, struct sg_table *st,
 			}
 		} while (1);
 
+		nr_pages = min_t(unsigned long,
+				folio_nr_pages(folio), page_count - i);
 		if (!i ||
 		    sg->length >= max_segment ||
 		    folio_pfn(folio) != next_pfn) {
@@ -157,13 +160,13 @@ int shmem_sg_alloc_table(struct drm_i915_private *i915, struct sg_table *st,
 				sg = sg_next(sg);
 
 			st->nents++;
-			sg_set_folio(sg, folio, folio_size(folio), 0);
+			sg_set_folio(sg, folio, nr_pages * PAGE_SIZE, 0);
 		} else {
 			/* XXX: could overflow? */
-			sg->length += folio_size(folio);
+			sg->length += nr_pages * PAGE_SIZE;
 		}
-		next_pfn = folio_pfn(folio) + folio_nr_pages(folio);
-		i += folio_nr_pages(folio) - 1;
+		next_pfn = folio_pfn(folio) + nr_pages;
+		i += nr_pages - 1;
 
 		/* Check that the i965g/gm workaround works. */
 		GEM_BUG_ON(gfp & __GFP_DMA32 && next_pfn >= 0x00100000UL);
