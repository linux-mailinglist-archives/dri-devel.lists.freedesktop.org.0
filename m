Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E7F4842F1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 15:02:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4D110E388;
	Tue,  4 Jan 2022 14:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB2F10E388;
 Tue,  4 Jan 2022 14:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641304972; x=1672840972;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sbHWONAk7LOBRh6jtSsE5DqacSOyLx9t2iarAINJ8dE=;
 b=BrOqV7BPe9GS1va2gBXOeBKYXi8pqLeOoI1jg2rpi8pF4ozESE6y1D4U
 2WRBpzP9LEGvU9UV3LP7tpv8AJE3ccjUHNXaah1Th2vbmQjpdH1V8sGfM
 sca3KItPeNWUFN7wuzxz0aON//41bYuCSitpOFpaLnVZJSZsezrS/01oz
 3Xi3L3bMHXBgMV2R34TwGsQzs7SArqFMJcA/GQE72lodJEeZ6zaNS4ykA
 6OaKC2BVk3Dy33bryw+Mv/d5TZSeFZQ8vUCExvgRfO3eLckcsKnsewEhy
 mqrCR49ygedHmknsCK+qfu9SC0qdRSV6i+9r+bcvFDaM1ov4lkus1U3UF Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="242433580"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="242433580"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 06:02:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="762828071"
Received: from pcseow-mobl1.gar.corp.intel.com (HELO [10.213.153.37])
 ([10.213.153.37])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 06:02:15 -0800
Message-ID: <6c48028e-0330-c9f1-23c5-8fe8042564f3@intel.com>
Date: Tue, 4 Jan 2022 14:01:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 2/6] drm: improve drm_buddy_alloc function
Content-Language: en-GB
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20211226222425.544863-1-Arunpravin.PaneerSelvam@amd.com>
 <20211226222425.544863-2-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211226222425.544863-2-Arunpravin.PaneerSelvam@amd.com>
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
Cc: alexander.deucher@amd.com, tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/12/2021 22:24, Arunpravin wrote:
> - Make drm_buddy_alloc a single function to handle
>    range allocation and non-range allocation demands
> 
> - Implemented a new function alloc_range() which allocates
>    the requested power-of-two block comply with range limitations
> 
> - Moved order computation and memory alignment logic from
>    i915 driver to drm buddy
> 
> v2:
>    merged below changes to keep the build unbroken
>     - drm_buddy_alloc_range() becomes obsolete and may be removed
>     - enable ttm range allocation (fpfn / lpfn) support in i915 driver
>     - apply enhanced drm_buddy_alloc() function to i915 driver
> 
> v3(Matthew Auld):
>    - Fix alignment issues and remove unnecessary list_empty check
>    - add more validation checks for input arguments
>    - make alloc_range() block allocations as bottom-up
>    - optimize order computation logic
>    - replace uint64_t with u64, which is preferred in the kernel
> 
> v4(Matthew Auld):
>    - keep drm_buddy_alloc_range() function implementation for generic
>      actual range allocations
>    - keep alloc_range() implementation for end bias allocations
> 
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>

<snip>

> @@ -73,34 +83,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   
>   	n_pages = size >> ilog2(mm->chunk_size);
>   
> -	do {
> -		struct drm_buddy_block *block;
> -		unsigned int order;
> -
> -		order = fls(n_pages) - 1;
> -		GEM_BUG_ON(order > mm->max_order);
> -		GEM_BUG_ON(order < min_order);
> -
> -		do {
> -			mutex_lock(&bman->lock);
> -			block = drm_buddy_alloc(mm, order);
> -			mutex_unlock(&bman->lock);
> -			if (!IS_ERR(block))
> -				break;
> -
> -			if (order-- == min_order) {
> -				err = -ENOSPC;
> -				goto err_free_blocks;
> -			}
> -		} while (1);
> -
> -		n_pages -= BIT(order);
> -
> -		list_add_tail(&block->link, &bman_res->blocks);
> -
> -		if (!n_pages)
> -			break;
> -	} while (1);
> +	mutex_lock(&bman->lock);
> +	err = drm_buddy_alloc(mm, (u64)place->fpfn << PAGE_SHIFT,
> +			(u64)place->lpfn << PAGE_SHIFT,

place->lpfn will currently always be zero for i915, AFAIK. I assume here 
we want s/place->lpfn/lpfn/?

Also something in this series is preventing i915 from loading on 
discrete devices, according to CI. Hopefully that is just the lpfn 
issue...which might explain seeing -EINVAL here[1] when allocating some 
vram for the firmware.

[1] 
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_21904/bat-dg1-6/boot0.txt


> +			(u64)n_pages << PAGE_SHIFT,
> +			 min_page_size,
> +			 &bman_res->blocks,
> +			 bman_res->flags);
> +	mutex_unlock(&bman->lock);
> +	if (unlikely(err))
> +		goto err_free_blocks;
>   
>   	*res = &bman_res->base;
>   	return 0;
> @@ -266,10 +258,17 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
>   {
>   	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>   	struct drm_buddy_mm *mm = &bman->mm;
> +	unsigned long flags = 0;
>   	int ret;
>   
> +	flags |= DRM_BUDDY_RANGE_ALLOCATION;
> +
>   	mutex_lock(&bman->lock);
> -	ret = drm_buddy_alloc_range(mm, &bman->reserved, start, size);
> +	ret = drm_buddy_alloc(mm, start,
> +			start + size,
> +			size, mm->chunk_size,
> +			&bman->reserved,
> +			flags);
>   	mutex_unlock(&bman->lock);
>   
>   	return ret;
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> index fa644b512c2e..5ba490875f66 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> @@ -20,6 +20,7 @@ struct drm_buddy_mm;
>    *
>    * @base: struct ttm_resource base class we extend
>    * @blocks: the list of struct i915_buddy_block for this resource/allocation
> + * @flags: DRM_BUDDY_*_ALLOCATION flags
>    * @mm: the struct i915_buddy_mm for this resource
>    *
>    * Extends the struct ttm_resource to manage an address space allocation with
> @@ -28,6 +29,7 @@ struct drm_buddy_mm;
>   struct i915_ttm_buddy_resource {
>   	struct ttm_resource base;
>   	struct list_head blocks;
> +	unsigned long flags;
>   	struct drm_buddy_mm *mm;
>   };
>   
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index 09d73328c268..4368acaad222 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -13,15 +13,22 @@
>   
>   #include <drm/drm_print.h>
>   
> -#define range_overflows(start, size, max) ({ \
> +#define check_range_overflow(start, end, size, max) ({ \
>   	typeof(start) start__ = (start); \
> +	typeof(end) end__ = (end);\
>   	typeof(size) size__ = (size); \
>   	typeof(max) max__ = (max); \
>   	(void)(&start__ == &size__); \
>   	(void)(&start__ == &max__); \
> -	start__ >= max__ || size__ > max__ - start__; \
> +	(void)(&start__ == &end__); \
> +	(void)(&end__ == &size__); \
> +	(void)(&end__ == &max__); \
> +	start__ >= max__ || end__ > max__ || \
> +	size__ > end__ - start__; \
>   })
>   
> +#define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
> +
>   struct drm_buddy_block {
>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>   #define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
> @@ -132,12 +139,11 @@ int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size);
>   
>   void drm_buddy_fini(struct drm_buddy_mm *mm);
>   
> -struct drm_buddy_block *
> -drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order);
> -
> -int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
> -			  struct list_head *blocks,
> -			  u64 start, u64 size);
> +int drm_buddy_alloc(struct drm_buddy_mm *mm,
> +		    u64 start, u64 end, u64 size,
> +		    u64 min_page_size,
> +		    struct list_head *blocks,
> +		    unsigned long flags);
>   
>   void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block);
>   
> 
