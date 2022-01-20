Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DB8495355
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 18:35:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DA610E7D3;
	Thu, 20 Jan 2022 17:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DDA10E818;
 Thu, 20 Jan 2022 17:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642700132; x=1674236132;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DN5nnQK6lp4kz/Y+rXi3ugnQTbeCTE93kv55+cBIA3M=;
 b=gqwnsP/jxrnXXRsYTPTRKy2ntbCbt1GAMyxSmn1k97NjfYP2ul+3rlje
 RVJf9bcWY3Eysv9BVZpZmMzF3VYXes2jYuU0h5s4f9F8GWSZ+9QKOz/76
 kQwRjJP694ASTY1Yj26vOOiCYtTCIDwIhLS4hpDgtuQl1fRwBZBBhGOW9
 vovYAbcDwnqZt1TKikB9MhkSByYC29I4YedlLdhWmPjCAX9IoOvvGbOt9
 K5nyyyScOq0I2DKINiGiMLXagsH7QQGuffbH6x3mHvoAMeo7XeiRM4C4S
 rl/FZYzrvTajmzHZXMbaAzL+5Ms6HRNRF24tLMY0EVWNDaLG7U+xItODF A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="331760248"
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="331760248"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 09:35:31 -0800
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="595828899"
Received: from kdevey-mobl2.ger.corp.intel.com (HELO [10.252.29.97])
 ([10.252.29.97])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 09:35:29 -0800
Message-ID: <82ee8da9-ad9a-d1cb-4a19-b1056fa57083@intel.com>
Date: Thu, 20 Jan 2022 17:35:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v9 4/6] drm: implement a method to free unused pages
Content-Language: en-GB
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220119113718.3311-1-Arunpravin.PaneerSelvam@amd.com>
 <20220119113718.3311-3-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220119113718.3311-3-Arunpravin.PaneerSelvam@amd.com>
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

On 19/01/2022 11:37, Arunpravin wrote:
> On contiguous allocation, we round up the size
> to the *next* power of 2, implement a function
> to free the unused pages after the newly allocate block.
> 
> v2(Matthew Auld):
>    - replace function name 'drm_buddy_free_unused_pages' with
>      drm_buddy_block_trim
>    - replace input argument name 'actual_size' with 'new_size'
>    - add more validation checks for input arguments
>    - add overlaps check to avoid needless searching and splitting
>    - merged the below patch to see the feature in action
>       - add free unused pages support to i915 driver
>    - lock drm_buddy_block_trim() function as it calls mark_free/mark_split
>      are all globally visible
> 
> v3(Matthew Auld):
>    - remove trim method error handling as we address the failure case
>      at drm_buddy_block_trim() function
> 
> v4:
>    - in case of trim, at __alloc_range() split_block failure path
>      marks the block as free and removes it from the original list,
>      potentially also freeing it, to overcome this problem, we turn
>      the drm_buddy_block_trim() input node into a temporary node to
>      prevent recursively freeing itself, but still retain the
>      un-splitting/freeing of the other nodes(Matthew Auld)
> 
>    - modify the drm_buddy_block_trim() function return type
> 
> v5(Matthew Auld):
>    - revert drm_buddy_block_trim() function return type changes in v4
>    - modify drm_buddy_block_trim() passing argument n_pages to original_size
>      as n_pages has already been rounded up to the next power-of-two and
>      passing n_pages results noop
> 
> v6:
>    - fix warnings reported by kernel test robot <lkp@intel.com>
> 
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/drm_buddy.c                   | 65 +++++++++++++++++++
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 10 +++
>   include/drm/drm_buddy.h                       |  4 ++
>   3 files changed, 79 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 6aa5c1ce25bf..c5902a81b8c5 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -546,6 +546,71 @@ static int __drm_buddy_alloc_range(struct drm_buddy *mm,
>   	return __alloc_range(mm, &dfs, start, size, blocks);
>   }
>   
> +/**
> + * drm_buddy_block_trim - free unused pages
> + *
> + * @mm: DRM buddy manager
> + * @new_size: original size requested
> + * @blocks: output list head to add allocated blocks

@blocks: Input and output list of allocated blocks. MUST contain single 
block as input to be trimmed. On success will contain the newly 
allocated blocks making up the @new_size. Blocks always appear in 
ascending order.

?

> + *
> + * For contiguous allocation, we round up the size to the nearest
> + * power of two value, drivers consume *actual* size, so remaining
> + * portions are unused and it can be freed.

so remaining portions are unused and can be optionally freed with this 
function.

?

> + *
> + * Returns:
> + * 0 on success, error code on failure.
> + */
> +int drm_buddy_block_trim(struct drm_buddy *mm,
> +			 u64 new_size,
> +			 struct list_head *blocks)
> +{
> +	struct drm_buddy_block *parent;
> +	struct drm_buddy_block *block;
> +	LIST_HEAD(dfs);
> +	u64 new_start;
> +	int err;
> +
> +	if (!list_is_singular(blocks))
> +		return -EINVAL;
> +
> +	block = list_first_entry(blocks,
> +				 struct drm_buddy_block,
> +				 link);
> +
> +	if (!drm_buddy_block_is_allocated(block))

Maybe:

if (WARN_ON(!drm_buddy_block_is_allocated()))

AFAIK it should be normally impossible to be handed such non-allocated 
block, and so should be treated as a serious programmer error.

?

> +		return -EINVAL;
> +
> +	if (new_size > drm_buddy_block_size(mm, block))
> +		return -EINVAL;
> +
> +	if (!new_size && !IS_ALIGNED(new_size, mm->chunk_size))
> +		return -EINVAL;

I assume that's a typo:

if (!new_size || ...)

Otherwise I think looks good. Some unit tests for this would be nice, 
but not a blocker. And this does at least pass the igt_mock_contiguous 
selftest, and I didn't see anything nasty when running on DG1, which 
does make use of TTM_PL_FLAG_CONTIGUOUS,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +
> +	if (new_size == drm_buddy_block_size(mm, block))
> +		return 0;
> +
> +	list_del(&block->link);
> +	mark_free(mm, block);
> +	mm->avail += drm_buddy_block_size(mm, block);
> +
> +	/* Prevent recursively freeing this node */
> +	parent = block->parent;
> +	block->parent = NULL;
> +
> +	new_start = drm_buddy_block_offset(block);
> +	list_add(&block->tmp_link, &dfs);
> +	err =  __alloc_range(mm, &dfs, new_start, new_size, blocks);
> +	if (err) {
> +		mark_allocated(block);
> +		mm->avail -= drm_buddy_block_size(mm, block);
> +		list_add(&block->link, blocks);
> +	}
> +
> +	block->parent = parent;
> +	return err;
> +}
> +EXPORT_SYMBOL(drm_buddy_block_trim);
> +
>   /**
>    * drm_buddy_alloc_blocks - allocate power-of-two blocks
>    *
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index 3662434b64bb..53eb100688a6 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -97,6 +97,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   	if (unlikely(err))
>   		goto err_free_blocks;
>   
> +	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +		u64 original_size = (u64)bman_res->base.num_pages << PAGE_SHIFT;
> +
> +		mutex_lock(&bman->lock);
> +		drm_buddy_block_trim(mm,
> +				     original_size,
> +				     &bman_res->blocks);
> +		mutex_unlock(&bman->lock);
> +	}
> +
>   	*res = &bman_res->base;
>   	return 0;
>   
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index 424fc443115e..17ca928fce8e 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -145,6 +145,10 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   			   struct list_head *blocks,
>   			   unsigned long flags);
>   
> +int drm_buddy_block_trim(struct drm_buddy *mm,
> +			 u64 new_size,
> +			 struct list_head *blocks);
> +
>   void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
>   
>   void drm_buddy_free_list(struct drm_buddy *mm, struct list_head *objects);
> 
