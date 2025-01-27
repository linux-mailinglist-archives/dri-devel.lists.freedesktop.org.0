Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 432B3A1DC3B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 19:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBFB10E5A3;
	Mon, 27 Jan 2025 18:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FQ9zgeHH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F08010E311;
 Mon, 27 Jan 2025 18:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738003649; x=1769539649;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9GS4OklWy9gKghj6+YfBxN2F+1ADLIQV1MOra18wIFI=;
 b=FQ9zgeHH7bHTBrBZe0XODhzzUYCT0TcYqaolCrdiXzOHoO2uRKAyJAUu
 d1NoyJtc4jBON/Bt9m8thjb6C90hAof4UTWsKX/KSlRvIGgF9DwTHrIEk
 MDQYa8hZ8VHWd7nHmHecHS/G8r487FN/TNgne0RII8JPl/iMB1YObGba1
 4q/roYK2nqiD1QzBoUTQY1jZre8naFMm5HNs12lkwJoVRnwmpgcp52Us2
 U5rReL/s01nQ1hzMPquiACyVwc6m5nu/aeT9S7YUlieyv/r37EGySLpTw
 jTgxqXOayIh6XoxqYteupcsJ3uupNWzdWcufPkgUCHz/txjsRNvsoWrha A==;
X-CSE-ConnectionGUID: Jf4q52l0Riqm4WA76ZnT4w==
X-CSE-MsgGUID: 4MCRDtoERk256wq79k7P8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38176432"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="38176432"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 10:47:28 -0800
X-CSE-ConnectionGUID: VoIGDF70T42mRutcbLVv2g==
X-CSE-MsgGUID: w5FrBGClTH6WtmgMQwa81A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="108631350"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 27 Jan 2025 10:47:24 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 27 Jan 2025 20:47:23 +0200
Date: Mon, 27 Jan 2025 20:47:23 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Brian Geffon <bgeffon@google.com>
Cc: intel-gfx@lists.freedesktop.org, chris.p.wilson@intel.com,
 jani.saarinen@intel.com, tomasz.mistat@intel.com,
 vidya.srinivas@intel.com, jani.nikula@linux.intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 stable@vger.kernel.org, Tomasz Figa <tfiga@google.com>
Subject: Re: [PATCH v2] drm/i915: Fix page cleanup on DMA remap failure
Message-ID: <Z5fUu6XwUrZESb5H@intel.com>
References: <20250116155340.533180-1-bgeffon@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250116155340.533180-1-bgeffon@google.com>
X-Patchwork-Hint: comment
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

On Thu, Jan 16, 2025 at 10:53:40AM -0500, Brian Geffon wrote:
> When converting to folios the cleanup path of shmem_get_pages() was
> missed. When a DMA remap fails and the max segment size is greater than
> PAGE_SIZE it will attempt to retry the remap with a PAGE_SIZEd segment
> size. The cleanup code isn't properly using the folio apis and as a
> result isn't handling compound pages correctly.
> 
> v1 -> v2:
>   (Ville) Fixed locations where we were not clearing mapping unevictable.
> 
> Cc: stable@vger.kernel.org
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Vidya Srinivas <vidya.srinivas@intel.com>
> Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13487
> Link: https://lore.kernel.org/lkml/20250116135636.410164-1-bgeffon@google.com/
> Fixes: 0b62af28f249 ("i915: convert shmem_sg_free_table() to use a folio_batch")
> Signed-off-by: Brian Geffon <bgeffon@google.com>
> Suggested-by: Tomasz Figa <tfiga@google.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_object.h |  3 +--
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c  | 23 +++++++++-------------
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  7 ++++---
>  3 files changed, 14 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index 3dc61cbd2e11..0f122a12d4a5 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -843,8 +843,7 @@ int shmem_sg_alloc_table(struct drm_i915_private *i915, struct sg_table *st,
>  			 size_t size, struct intel_memory_region *mr,
>  			 struct address_space *mapping,
>  			 unsigned int max_segment);
> -void shmem_sg_free_table(struct sg_table *st, struct address_space *mapping,
> -			 bool dirty, bool backup);
> +void shmem_sg_free_table(struct sg_table *st, bool dirty, bool backup);
>  void __shmem_writeback(size_t size, struct address_space *mapping);
>  
>  #ifdef CONFIG_MMU_NOTIFIER
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> index fe69f2c8527d..b320d9dfd6d3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -29,16 +29,13 @@ static void check_release_folio_batch(struct folio_batch *fbatch)
>  	cond_resched();
>  }
>  
> -void shmem_sg_free_table(struct sg_table *st, struct address_space *mapping,
> -			 bool dirty, bool backup)
> +void shmem_sg_free_table(struct sg_table *st, bool dirty, bool backup)

This still makes the alloc vs. free completely asymmetric.
This is not what we want because it just makes it very easy
to make it mistake in the caller.

I think the correct fix is to simply call the current
shmem_sg_free_table() from the now broken failure path.
mapping_{set,clear}_unevictable() just seems to be some
bit operation so AFAICS the slight ping-pong should be
inconsequential.

>  {
>  	struct sgt_iter sgt_iter;
>  	struct folio_batch fbatch;
>  	struct folio *last = NULL;
>  	struct page *page;
>  
> -	mapping_clear_unevictable(mapping);
> -
>  	folio_batch_init(&fbatch);
>  	for_each_sgt_page(page, sgt_iter, st) {
>  		struct folio *folio = page_folio(page);
> @@ -180,10 +177,10 @@ int shmem_sg_alloc_table(struct drm_i915_private *i915, struct sg_table *st,
>  	return 0;
>  err_sg:
>  	sg_mark_end(sg);
> +	mapping_clear_unevictable(mapping);
>  	if (sg != st->sgl) {
> -		shmem_sg_free_table(st, mapping, false, false);
> +		shmem_sg_free_table(st, false, false);
>  	} else {
> -		mapping_clear_unevictable(mapping);
>  		sg_free_table(st);
>  	}
>  
> @@ -209,8 +206,6 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
>  	struct address_space *mapping = obj->base.filp->f_mapping;
>  	unsigned int max_segment = i915_sg_segment_size(i915->drm.dev);
>  	struct sg_table *st;
> -	struct sgt_iter sgt_iter;
> -	struct page *page;
>  	int ret;
>  
>  	/*
> @@ -239,9 +234,8 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
>  		 * for PAGE_SIZE chunks instead may be helpful.
>  		 */
>  		if (max_segment > PAGE_SIZE) {
> -			for_each_sgt_page(page, sgt_iter, st)
> -				put_page(page);
> -			sg_free_table(st);
> +			/* Leave the mapping unevictable while we retry */
> +			shmem_sg_free_table(st, false, false);
>  			kfree(st);
>  
>  			max_segment = PAGE_SIZE;
> @@ -265,7 +259,8 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
>  	return 0;
>  
>  err_pages:
> -	shmem_sg_free_table(st, mapping, false, false);
> +	mapping_clear_unevictable(mapping);
> +	shmem_sg_free_table(st, false, false);
>  	/*
>  	 * shmemfs first checks if there is enough memory to allocate the page
>  	 * and reports ENOSPC should there be insufficient, along with the usual
> @@ -402,8 +397,8 @@ void i915_gem_object_put_pages_shmem(struct drm_i915_gem_object *obj, struct sg_
>  	if (i915_gem_object_needs_bit17_swizzle(obj))
>  		i915_gem_object_save_bit_17_swizzle(obj, pages);
>  
> -	shmem_sg_free_table(pages, file_inode(obj->base.filp)->i_mapping,
> -			    obj->mm.dirty, obj->mm.madv == I915_MADV_WILLNEED);
> +	mapping_clear_unevictable(file_inode(obj->base.filp)->i_mapping);
> +	shmem_sg_free_table(pages, obj->mm.dirty, obj->mm.madv == I915_MADV_WILLNEED);
>  	kfree(pages);
>  	obj->mm.dirty = false;
>  }
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 10d8673641f7..37f51a04b838 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -232,7 +232,8 @@ static int i915_ttm_tt_shmem_populate(struct ttm_device *bdev,
>  	return 0;
>  
>  err_free_st:
> -	shmem_sg_free_table(st, filp->f_mapping, false, false);
> +	mapping_clear_unevictable(filp->f_mapping);
> +	shmem_sg_free_table(st, false, false);
>  
>  	return err;
>  }
> @@ -243,8 +244,8 @@ static void i915_ttm_tt_shmem_unpopulate(struct ttm_tt *ttm)
>  	bool backup = ttm->page_flags & TTM_TT_FLAG_SWAPPED;
>  	struct sg_table *st = &i915_tt->cached_rsgt.table;
>  
> -	shmem_sg_free_table(st, file_inode(i915_tt->filp)->i_mapping,
> -			    backup, backup);
> +	mapping_clear_unevictable(file_inode(i915_tt->filp)->i_mapping);
> +	shmem_sg_free_table(st, backup, backup);
>  }
>  
>  static void i915_ttm_tt_release(struct kref *ref)
> -- 
> 2.48.0.rc2.279.g1de40edade-goog

-- 
Ville Syrjälä
Intel
