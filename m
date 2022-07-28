Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FCD584313
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 17:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D3910F5B2;
	Thu, 28 Jul 2022 15:27:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3482C10E21C;
 Thu, 28 Jul 2022 15:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659022064; x=1690558064;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JzwWzdcMH/oBvl3ZNQC7sRzcLavjBfk1xagrxukoPMI=;
 b=iChbUaxwh5Jyfc1fsqANvHc7J/mNpHQdrix70uhkp4K++PKwfWpKwvtY
 AHn/wxsi5HRKeGP6+7AozhEagpMc+zsRU3a3RAJ4YZNOo3mGb4M98j1YI
 L3cufrPYrLnyFOZP+n28chJ578sQD3c07fu2vUfwClDEN2A1lbWk50obw
 IinIiJbZ82+ErI/RyYZ1R0yvStuZ0Rru4XiJRjczvURcRplzXZgU0vevH
 az5s9GLiFmhNkrqrqwGrZhOKKDAPC5Wr+lhdTh8GeEz/DidCl8JNuNiZ3
 6jEFyvgPK1droggz8URtskJPJucncVu+JEVozpjS18TfyjfAsLNunMTtn w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="275421541"
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="275421541"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 08:27:43 -0700
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="846749291"
Received: from abernota-mobl.ger.corp.intel.com (HELO [10.213.218.28])
 ([10.213.218.28])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 08:27:40 -0700
Message-ID: <b2dc0312-2f4d-a593-30e4-68971c6cbca5@intel.com>
Date: Thu, 28 Jul 2022 16:27:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v3 4/6] drm/i915: Implement intersect/compatible functions
Content-Language: en-GB
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20220728143315.968590-1-Arunpravin.PaneerSelvam@amd.com>
 <20220728143315.968590-4-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220728143315.968590-4-Arunpravin.PaneerSelvam@amd.com>
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

On 28/07/2022 15:33, Arunpravin Paneer Selvam wrote:
> Implemented a new intersect and compatible callback function
> fetching start offset from drm buddy allocator.
> 
> v2: move the bits that are specific to buddy_man (Matthew)
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 39 +-----------
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 62 +++++++++++++++++++
>   2 files changed, 64 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 70e2ed4e99df..54eead15d74b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -396,43 +396,8 @@ static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
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
> +	if (res->mem_type == I915_PL_LMEM0)
> +		return ttm_bo_eviction_valuable(bo, place);

We should be able to drop the mem_type == I915_PL_LMEM0 check here I 
think, and just unconditionally do:

return ttm_bo_eviction_valuable(bo, place);

>   
>   	return true;
>   }
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index a5109548abc0..9d2a31154d58 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -178,6 +178,66 @@ static void i915_ttm_buddy_man_free(struct ttm_resource_manager *man,
>   	kfree(bman_res);
>   }
>   
> +static bool i915_ttm_buddy_man_intersect(struct ttm_resource_manager *man,

Nit: intersects

> +					 struct ttm_resource *res,
> +					 const struct ttm_place *place,
> +					 size_t size)
> +{
> +	struct i915_ttm_buddy_resource *bman_res = to_ttm_buddy_resource(res);
> +	u32 start, num_pages = PFN_UP(size);
> +	struct drm_buddy_block *block;
> +
> +	if (!place->fpfn && !place->lpfn)
> +		return true;
> +
> +	/*
> +	 * If we just want something mappable then we can quickly check
> +	 * if the current victim resource is using any of the CP
> +	 * visible portion.
> +	 */
> +	if (!place->fpfn &&
> +	    place->lpfn == i915_ttm_buddy_man_visible_size(man))
> +		return bman_res->used_visible_size > 0;
> +
> +	/* Check each drm buddy block individually */
> +	list_for_each_entry(block, &bman_res->blocks, link) {
> +		start = drm_buddy_block_offset(block) >> PAGE_SHIFT;
> +		/* Don't evict BOs outside of the requested placement range */
> +		if (place->fpfn >= (start + num_pages) ||
> +		    (place->lpfn && place->lpfn <= start))
> +			return false;
> +	}
> +
> +	return true;

We need to account for the block size somewhere. Also same bug in the 
amdgpu patch it seems. We also need to do this the other way around and 
keep checking until we find something that overlaps, for example if the 
first block doesn't intersect/overlap we will incorrectly return false 
here, even if one of the other blocks does intersect.

list_for_each_entry() {
     fpfn = drm_buddy_block_size(mm, block) >> PAGE_SHIFT;
     lpfn = fpfn + drm_buddy_block_size(mm, block) >> PAGE_SHIFT);

     if (place->fpfn < lpfn && place->lpfn > fpfn)
         return true;
}

return false;

> +}
> +
> +static bool i915_ttm_buddy_man_compatible(struct ttm_resource_manager *man,
> +					  struct ttm_resource *res,
> +					  const struct ttm_place *place,
> +					  size_t size)
> +{
> +	struct i915_ttm_buddy_resource *bman_res = to_ttm_buddy_resource(res);
> +	u32 start, num_pages = PFN_UP(size);
> +	struct drm_buddy_block *block;
> +
> +	if (!place->fpfn && !place->lpfn)
> +		return true;
> +
> +	if (!place->fpfn &&
> +	    place->lpfn == i915_ttm_buddy_man_visible_size(man))
> +		return bman_res->used_visible_size == res->num_pages;
> +
> +	/* Check each drm buddy block individually */
> +	list_for_each_entry(block, &bman_res->blocks, link) {
> +		start = drm_buddy_block_offset(block) >> PAGE_SHIFT;
> +		if (start < place->fpfn ||
> +		    (place->lpfn && (start + num_pages) > place->lpfn))

Same here. We need to consider the block size/range.

Otherwise I think looks good.

> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>   static void i915_ttm_buddy_man_debug(struct ttm_resource_manager *man,
>   				     struct drm_printer *printer)
>   {
> @@ -205,6 +265,8 @@ static void i915_ttm_buddy_man_debug(struct ttm_resource_manager *man,
>   static const struct ttm_resource_manager_func i915_ttm_buddy_manager_func = {
>   	.alloc = i915_ttm_buddy_man_alloc,
>   	.free = i915_ttm_buddy_man_free,
> +	.intersects = i915_ttm_buddy_man_intersect,
> +	.compatible = i915_ttm_buddy_man_compatible,
>   	.debug = i915_ttm_buddy_man_debug,
>   };
>   
