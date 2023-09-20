Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E507A7293
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 08:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E78710E129;
	Wed, 20 Sep 2023 06:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B788A10E36A;
 Wed, 20 Sep 2023 06:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695190102; x=1726726102;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GIaIXCqIGoxl1rQ/uxCgQqfwjzyvj08lMJhHPrSZpx0=;
 b=VZItf5AcbtNRS7v/SopXlt85Tm/OWsFU6Wbc6I4u8tStGPmuAIeoGpJm
 luNigWzawQxcfIid+OlYRABkHQT8w7mCACvhzdkH17FNBUhv5o4ZFDXQm
 xCOLEQkfN6H7PWcXKEfbCtYThw4KQ85B2yB/qrsgPkC1gqz2JlUDgQpqd
 92LckcTZeb6ooki12ug1mckXMxJPz/iKqH7TdmUESKvRdWJGLiKXfF0UM
 YdRCCHg2W+MhW03yUNMrdmddlquVb2Wm4BUHSGEB5hsIb4f3co9ALZ2k/
 u2u/G7pBbs/BQuDPLebFNPIkJgVSHuL7PilkCgMX4fX77BP4u4LXhdP+X g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="382880381"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="382880381"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 23:08:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="1077294545"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="1077294545"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.20.10])
 ([10.213.20.10])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 23:08:17 -0700
Message-ID: <81f332a3-2b30-465d-f026-bc203aada32d@intel.com>
Date: Wed, 20 Sep 2023 08:08:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH] i915: Limit the length of an sg list to the
 requested length
Content-Language: en-US
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20230919194855.347582-1-willy@infradead.org>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230919194855.347582-1-willy@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Oleksandr Natalenko <oleksandr@natalenko.name>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19.09.2023 21:48, Matthew Wilcox (Oracle) wrote:
> The folio conversion changed the behaviour of shmem_sg_alloc_table() to
> put the entire length of the last folio into the sg list, even if the sg
> list should have been shorter.  gen8_ggtt_insert_entries() relied on the
> list being the right langth and would overrun the end of the page tables.

s/langth/length/, I can fix it on applying.

> Other functions may also have been affected.
> 
> Clamp the length of the last entry in the sg list to be the expected
> length.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Fixes: 0b62af28f249 ("i915: convert shmem_sg_free_table() to use a folio_batch")
> Cc: stable@vger.kernel.org # 6.5.x
> Link: https://gitlab.freedesktop.org/drm/intel/-/issues/9256
> Link: https://lore.kernel.org/lkml/6287208.lOV4Wx5bFT@natalenko.name/
> Reported-by: Oleksandr Natalenko <oleksandr@natalenko.name>
> Tested-by: Oleksandr Natalenko <oleksandr@natalenko.name>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> index 8f1633c3fb93..73a4a4eb29e0 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -100,6 +100,7 @@ int shmem_sg_alloc_table(struct drm_i915_private *i915, struct sg_table *st,
>   	st->nents = 0;
>   	for (i = 0; i < page_count; i++) {
>   		struct folio *folio;
> +		unsigned long nr_pages;
>   		const unsigned int shrink[] = {
>   			I915_SHRINK_BOUND | I915_SHRINK_UNBOUND,
>   			0,
> @@ -150,6 +151,8 @@ int shmem_sg_alloc_table(struct drm_i915_private *i915, struct sg_table *st,
>   			}
>   		} while (1);
>   
> +		nr_pages = min_t(unsigned long,
> +				folio_nr_pages(folio), page_count - i);
>   		if (!i ||
>   		    sg->length >= max_segment ||
>   		    folio_pfn(folio) != next_pfn) {
> @@ -157,13 +160,13 @@ int shmem_sg_alloc_table(struct drm_i915_private *i915, struct sg_table *st,
>   				sg = sg_next(sg);
>   
>   			st->nents++;
> -			sg_set_folio(sg, folio, folio_size(folio), 0);
> +			sg_set_folio(sg, folio, nr_pages * PAGE_SIZE, 0);
>   		} else {
>   			/* XXX: could overflow? */
> -			sg->length += folio_size(folio);
> +			sg->length += nr_pages * PAGE_SIZE;
>   		}
> -		next_pfn = folio_pfn(folio) + folio_nr_pages(folio);
> -		i += folio_nr_pages(folio) - 1;
> +		next_pfn = folio_pfn(folio) + nr_pages;
> +		i += nr_pages - 1;
>   
>   		/* Check that the i965g/gm workaround works. */
>   		GEM_BUG_ON(gfp & __GFP_DMA32 && next_pfn >= 0x00100000UL);

