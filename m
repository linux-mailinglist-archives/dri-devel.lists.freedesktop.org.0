Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AF4573949
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 16:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 776789B2E8;
	Wed, 13 Jul 2022 14:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394CA10FC5F;
 Wed, 13 Jul 2022 14:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657723989; x=1689259989;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nzRRfc3c0jBW0Fh+LDvco00HZBv4dFG+ZpSe2+pdCBk=;
 b=lwStXAywn2X4p8pPFQkrNVRS0+A6P9BmY7vtfSxt+F4GFCEYmV9hQnZZ
 /0mJngArcMV8R96zk1el8vtbuNDrTprWSQkq2kwqZCcdRptyi9Ck/53M+
 gCUw21K2ddvH5/9xoep3MARG2JjZgutuuXblgG69uLgpMNwxFPxm2Lz8p
 QsrCB7sLgssH8QeE+laixwDDiimNMiyeVxs8c3lR1pXSHt30q37QRtJQC
 FFA/M7RpUdUlBVHkAam8NZdDNpYk1JbEIJ0bV9RlFk+WrpB1A4DGNPtla
 CgfR9CTxfj78s8jFpHFv7VYDH7IJVN/xiDwRrSBpsY4tUlDmbPRv3jPvS g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="285256783"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="285256783"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 07:53:05 -0700
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="772267664"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.18.234])
 ([10.252.18.234])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 07:53:04 -0700
Message-ID: <b93ea0d4-77f6-0ba9-670d-9aa8dac819cb@linux.intel.com>
Date: Wed, 13 Jul 2022 16:53:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/i915/ttm: fix 32b build
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220712174050.592550-1-matthew.auld@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20220712174050.592550-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

On 7/12/2022 7:40 PM, Matthew Auld wrote:
> Since segment_pages is no longer a compile time constant, it looks the
> DIV_ROUND_UP(node->size, segment_pages) breaks the 32b build. Simplest
> is just to use the ULL variant, but really we should need not need more
> than u32 for the page alignment (also we are limited by that due to the
> sg->length type), so also make it all u32.
>
> Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Fixes: bc99f1209f19 ("drm/i915/ttm: fix sg_table construction")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_region.c |  2 ++
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  2 +-
>   drivers/gpu/drm/i915/i915_scatterlist.c    | 16 ++++++++--------
>   drivers/gpu/drm/i915/i915_scatterlist.h    |  4 ++--
>   drivers/gpu/drm/i915/intel_region_ttm.c    |  2 +-
>   drivers/gpu/drm/i915/intel_region_ttm.h    |  2 +-
>   6 files changed, 15 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
> index f46ee16a323a..a4fb577eceb4 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
> @@ -60,6 +60,8 @@ __i915_gem_object_create_region(struct intel_memory_region *mem,
>   	if (page_size)
>   		default_page_size = page_size;
>   
> +	/* We should be able to fit a page within an sg entry */
> +	GEM_BUG_ON(overflows_type(default_page_size, u32));
>   	GEM_BUG_ON(!is_power_of_2_u64(default_page_size));
>   	GEM_BUG_ON(default_page_size < PAGE_SIZE);
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 053b0022ddd0..5a5cf332d8a5 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -602,7 +602,7 @@ i915_ttm_resource_get_st(struct drm_i915_gem_object *obj,
>   			 struct ttm_resource *res)
>   {
>   	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
> -	u64 page_alignment;
> +	u32 page_alignment;
>   
>   	if (!i915_ttm_gtt_binds_lmem(res))
>   		return i915_ttm_tt_get_st(bo->ttm);
> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
> index f63b50b71e10..dcc081874ec8 100644
> --- a/drivers/gpu/drm/i915/i915_scatterlist.c
> +++ b/drivers/gpu/drm/i915/i915_scatterlist.c
> @@ -79,10 +79,10 @@ void i915_refct_sgt_init(struct i915_refct_sgt *rsgt, size_t size)
>    */
>   struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
>   					      u64 region_start,
> -					      u64 page_alignment)
> +					      u32 page_alignment)
>   {
> -	const u64 max_segment = round_down(UINT_MAX, page_alignment);
> -	u64 segment_pages = max_segment >> PAGE_SHIFT;
> +	const u32 max_segment = round_down(UINT_MAX, page_alignment);
> +	const u32 segment_pages = max_segment >> PAGE_SHIFT;
>   	u64 block_size, offset, prev_end;
>   	struct i915_refct_sgt *rsgt;
>   	struct sg_table *st;
> @@ -96,7 +96,7 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
>   
>   	i915_refct_sgt_init(rsgt, node->size << PAGE_SHIFT);
>   	st = &rsgt->table;
> -	if (sg_alloc_table(st, DIV_ROUND_UP(node->size, segment_pages),
> +	if (sg_alloc_table(st, DIV_ROUND_UP_ULL(node->size, segment_pages),
>   			   GFP_KERNEL)) {
>   		i915_refct_sgt_put(rsgt);
>   		return ERR_PTR(-ENOMEM);
> @@ -123,7 +123,7 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
>   			st->nents++;
>   		}
>   
> -		len = min(block_size, max_segment - sg->length);
> +		len = min_t(u64, block_size, max_segment - sg->length);
>   		sg->length += len;
>   		sg_dma_len(sg) += len;
>   
> @@ -155,11 +155,11 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
>    */
>   struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
>   						     u64 region_start,
> -						     u64 page_alignment)
> +						     u32 page_alignment)
>   {
>   	struct i915_ttm_buddy_resource *bman_res = to_ttm_buddy_resource(res);
>   	const u64 size = res->num_pages << PAGE_SHIFT;
> -	const u64 max_segment = round_down(UINT_MAX, page_alignment);
> +	const u32 max_segment = round_down(UINT_MAX, page_alignment);
>   	struct drm_buddy *mm = bman_res->mm;
>   	struct list_head *blocks = &bman_res->blocks;
>   	struct drm_buddy_block *block;
> @@ -207,7 +207,7 @@ struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
>   				st->nents++;
>   			}
>   
> -			len = min(block_size, max_segment - sg->length);
> +			len = min_t(u64, block_size, max_segment - sg->length);
>   			sg->length += len;
>   			sg_dma_len(sg) += len;
>   
> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h b/drivers/gpu/drm/i915/i915_scatterlist.h
> index b13e4cdea923..9ddb3e743a3e 100644
> --- a/drivers/gpu/drm/i915/i915_scatterlist.h
> +++ b/drivers/gpu/drm/i915/i915_scatterlist.h
> @@ -214,10 +214,10 @@ void i915_refct_sgt_init(struct i915_refct_sgt *rsgt, size_t size);
>   
>   struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
>   					      u64 region_start,
> -					      u64 page_alignment);
> +					      u32 page_alignment);
>   
>   struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
>   						     u64 region_start,
> -						     u64 page_alignment);
> +						     u32 page_alignment);
>   
>   #endif
> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
> index 6873808a7015..575d67bc6ffe 100644
> --- a/drivers/gpu/drm/i915/intel_region_ttm.c
> +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
> @@ -163,7 +163,7 @@ int intel_region_ttm_fini(struct intel_memory_region *mem)
>   struct i915_refct_sgt *
>   intel_region_ttm_resource_to_rsgt(struct intel_memory_region *mem,
>   				  struct ttm_resource *res,
> -				  u64 page_alignment)
> +				  u32 page_alignment)
>   {
>   	if (mem->is_range_manager) {
>   		struct ttm_range_mgr_node *range_node =
> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.h b/drivers/gpu/drm/i915/intel_region_ttm.h
> index 98fba5155619..5bb8d8b582ae 100644
> --- a/drivers/gpu/drm/i915/intel_region_ttm.h
> +++ b/drivers/gpu/drm/i915/intel_region_ttm.h
> @@ -25,7 +25,7 @@ int intel_region_ttm_fini(struct intel_memory_region *mem);
>   struct i915_refct_sgt *
>   intel_region_ttm_resource_to_rsgt(struct intel_memory_region *mem,
>   				  struct ttm_resource *res,
> -				  u64 page_alignment);
> +				  u32 page_alignment);
>   
>   void intel_region_ttm_resource_free(struct intel_memory_region *mem,
>   				    struct ttm_resource *res);
