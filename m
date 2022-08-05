Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C33658A881
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 11:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356CBB0C27;
	Fri,  5 Aug 2022 09:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDC510E3C3;
 Fri,  5 Aug 2022 09:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659690529; x=1691226529;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HcwH7rBY8c9G5DxpGNSvCKWHB22AViIT69knXHJMmAw=;
 b=GXaKM9iruNLc1EMGzDXitVupLYPkQr1gvbjdaLhtJl/+B5l4CwrfthMg
 GbaV4wvS44VqRp4T2Q+eWlRFVtWc/e2UZXtKUSC71OtoZ1MjD9HirKZVb
 QUgKoO2fUl9bVyJUdrnUcjapwsJfWx3ujGMgbjTVua4e05vaMi4jHEJ7S
 EIadZLO+LCU9BPgBoJJX2NVtJl4xyzKkRpZPb/WXXuSUgVnu9sBOg4m3W
 JY3m3BKp18gzY41p/oX/yijZ8deiEgf6Du01OfcYwTP1BvruYsLio63w1
 YjxbV+LCFPoO7IMNBtNWlNvOjvlqPHrzav1JHjN+2p9RYZ9cQ5cagcYp/ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10429"; a="287721249"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="287721249"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2022 02:08:47 -0700
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="554047600"
Received: from namitaga-mobl.ger.corp.intel.com (HELO [10.213.224.55])
 ([10.213.224.55])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2022 02:08:45 -0700
Message-ID: <3a0ef983-6774-7de4-a2e5-0424e215460d@intel.com>
Date: Fri, 5 Aug 2022 10:08:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Subject: Re: [PATCH v4 4/6] drm/i915: Implement intersect/compatible functions
Content-Language: en-GB
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20220804085952.6137-1-Arunpravin.PaneerSelvam@amd.com>
 <20220804085952.6137-4-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220804085952.6137-4-Arunpravin.PaneerSelvam@amd.com>
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
Cc: alexander.deucher@amd.com, luben.tuikov@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/08/2022 09:59, Arunpravin Paneer Selvam wrote:
> Implemented a new intersect and compatible callback function
> fetching start offset from drm buddy allocator.
> 
> v3: move the bits that are specific to buddy_man (Matthew)
> v4: consider the block size /range (Matthew)
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 41 +----------
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 73 +++++++++++++++++++
>   2 files changed, 74 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 70e2ed4e99df..bf5fd6886ca0 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -379,7 +379,6 @@ static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
>   				       const struct ttm_place *place)
>   {
>   	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
> -	struct ttm_resource *res = bo->resource;
>   
>   	if (!obj)
>   		return false;
> @@ -396,45 +395,7 @@ static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
>   	if (!i915_gem_object_evictable(obj))
>   		return false;
>   
> -	switch (res->mem_type) {
> -	case I915_PL_LMEM0: {
> -		struct ttm_resource_manager *man =
> -			ttm_manager_type(bo->bdev, res->mem_type);
> -		struct i915_ttm_buddy_resource *bman_res =
> -			to_ttm_buddy_resource(res);
> -		struct drm_buddy *mm = bman_res->mm;
> -		struct drm_buddy_block *block;
> -
> -		if (!place->fpfn && !place->lpfn)
> -			return true;
> -
> -		GEM_BUG_ON(!place->lpfn);
> -
> -		/*
> -		 * If we just want something mappable then we can quickly check
> -		 * if the current victim resource is using any of the CPU
> -		 * visible portion.
> -		 */
> -		if (!place->fpfn &&
> -		    place->lpfn == i915_ttm_buddy_man_visible_size(man))
> -			return bman_res->used_visible_size > 0;
> -
> -		/* Real range allocation */
> -		list_for_each_entry(block, &bman_res->blocks, link) {
> -			unsigned long fpfn =
> -				drm_buddy_block_offset(block) >> PAGE_SHIFT;
> -			unsigned long lpfn = fpfn +
> -				(drm_buddy_block_size(mm, block) >> PAGE_SHIFT);
> -
> -			if (place->fpfn < lpfn && place->lpfn > fpfn)
> -				return true;
> -		}
> -		return false;
> -	} default:
> -		break;
> -	}
> -
> -	return true;
> +	return ttm_bo_eviction_valuable(bo, place);
>   }
>   
>   static void i915_ttm_evict_flags(struct ttm_buffer_object *bo,
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index a5109548abc0..9def01d5f368 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -178,6 +178,77 @@ static void i915_ttm_buddy_man_free(struct ttm_resource_manager *man,
>   	kfree(bman_res);
>   }
>   
> +static bool i915_ttm_buddy_man_intersects(struct ttm_resource_manager *man,
> +					  struct ttm_resource *res,
> +					  const struct ttm_place *place,
> +					  size_t size)
> +{
> +	struct i915_ttm_buddy_resource *bman_res = to_ttm_buddy_resource(res);
> +	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
> +	struct drm_buddy *mm = &bman->mm;
> +	struct drm_buddy_block *block;
> +
> +	if (!place->fpfn && !place->lpfn)
> +		return true;
> +
> +	GEM_BUG_ON(!place->lpfn);
> +
> +	/*
> +	 * If we just want something mappable then we can quickly check
> +	 * if the current victim resource is using any of the CP

Nit: s/CP/CPU/

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +	 * visible portion.
> +	 */
> +	if (!place->fpfn &&
> +	    place->lpfn == i915_ttm_buddy_man_visible_size(man))
> +		return bman_res->used_visible_size > 0;
> +
> +	/* Check each drm buddy block individually */
> +	list_for_each_entry(block, &bman_res->blocks, link) {
> +		unsigned long fpfn =
> +			drm_buddy_block_offset(block) >> PAGE_SHIFT;
> +		unsigned long lpfn = fpfn +
> +			(drm_buddy_block_size(mm, block) >> PAGE_SHIFT);
> +
> +		if (place->fpfn < lpfn && place->lpfn > fpfn)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static bool i915_ttm_buddy_man_compatible(struct ttm_resource_manager *man,
> +					  struct ttm_resource *res,
> +					  const struct ttm_place *place,
> +					  size_t size)
> +{
> +	struct i915_ttm_buddy_resource *bman_res = to_ttm_buddy_resource(res);
> +	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
> +	struct drm_buddy *mm = &bman->mm;
> +	struct drm_buddy_block *block;
> +
> +	if (!place->fpfn && !place->lpfn)
> +		return true;
> +
> +	GEM_BUG_ON(!place->lpfn);
> +
> +	if (!place->fpfn &&
> +	    place->lpfn == i915_ttm_buddy_man_visible_size(man))
> +		return bman_res->used_visible_size == res->num_pages;
> +
> +	/* Check each drm buddy block individually */
> +	list_for_each_entry(block, &bman_res->blocks, link) {
> +		unsigned long fpfn =
> +			drm_buddy_block_offset(block) >> PAGE_SHIFT;
> +		unsigned long lpfn = fpfn +
> +			(drm_buddy_block_size(mm, block) >> PAGE_SHIFT);
> +
> +		if (fpfn < place->fpfn || lpfn > place->lpfn)
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>   static void i915_ttm_buddy_man_debug(struct ttm_resource_manager *man,
>   				     struct drm_printer *printer)
>   {
> @@ -205,6 +276,8 @@ static void i915_ttm_buddy_man_debug(struct ttm_resource_manager *man,
>   static const struct ttm_resource_manager_func i915_ttm_buddy_manager_func = {
>   	.alloc = i915_ttm_buddy_man_alloc,
>   	.free = i915_ttm_buddy_man_free,
> +	.intersects = i915_ttm_buddy_man_intersects,
> +	.compatible = i915_ttm_buddy_man_compatible,
>   	.debug = i915_ttm_buddy_man_debug,
>   };
>   
