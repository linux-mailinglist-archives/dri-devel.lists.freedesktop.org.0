Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C650454D98
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 20:02:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B726E3F5;
	Wed, 17 Nov 2021 19:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DE26E3EE;
 Wed, 17 Nov 2021 19:02:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="233976673"
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="233976673"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 11:02:37 -0800
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="586758261"
Received: from ianock-mobl1.ger.corp.intel.com (HELO [10.252.8.140])
 ([10.252.8.140])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 11:02:35 -0800
Message-ID: <70b5facd-06cd-2400-dd94-1090fe3da7d6@intel.com>
Date: Wed, 17 Nov 2021 19:02:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 4/6] drm: implement a method to free unused pages
Content-Language: en-GB
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20211116201807.147486-1-Arunpravin.PaneerSelvam@amd.com>
 <20211116201807.147486-4-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211116201807.147486-4-Arunpravin.PaneerSelvam@amd.com>
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

On 16/11/2021 20:18, Arunpravin wrote:
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
>      - add free unused pages support to i915 driver
>    - lock drm_buddy_block_trim() function as it calls mark_free/mark_split
>      are all globally visible
> 
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/drm_buddy.c                   | 108 ++++++++++++++++++
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  10 ++
>   include/drm/drm_buddy.h                       |   4 +
>   3 files changed, 122 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 0a9db2981188..943fe2ad27bf 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -284,6 +284,114 @@ static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
>   	return s1 <= s2 && e1 >= e2;
>   }
>   
> +/**
> + * drm_buddy_block_trim - free unused pages
> + *
> + * @mm: DRM buddy manager
> + * @new_size: original size requested
> + * @blocks: output list head to add allocated blocks
> + *
> + * For contiguous allocation, we round up the size to the nearest
> + * power of two value, drivers consume *actual* size, so remaining
> + * portions are unused and it can be freed.
> + *
> + * Returns:
> + * 0 on success, error code on failure.
> + */
> +int drm_buddy_block_trim(struct drm_buddy_mm *mm,
> +			 u64 new_size,
> +			 struct list_head *blocks)
> +{
> +	struct drm_buddy_block *block;
> +	struct drm_buddy_block *buddy;
> +	u64 new_start;
> +	u64 new_end;
> +	LIST_HEAD(dfs);
> +	u64 count = 0;
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
> +		return -EINVAL;
> +
> +	if (new_size > drm_buddy_block_size(mm, block))
> +		return -EINVAL;
> +
> +	if (!new_size && !IS_ALIGNED(new_size, mm->chunk_size))
> +		return -EINVAL;
> +
> +	if (new_size == drm_buddy_block_size(mm, block))
> +		return 0;
> +
> +	list_del(&block->link);
> +
> +	new_start = drm_buddy_block_offset(block);
> +	new_end = new_start + new_size - 1;
> +
> +	mark_free(mm, block);
> +
> +	list_add(&block->tmp_link, &dfs);
> +
> +	do {
> +		u64 block_start;
> +		u64 block_end;
> +
> +		block = list_first_entry_or_null(&dfs,
> +						 struct drm_buddy_block,
> +						 tmp_link);
> +		if (!block)
> +			break;
> +
> +		list_del(&block->tmp_link);
> +
> +		if (count == new_size)
> +			return 0;
> +
> +		block_start = drm_buddy_block_offset(block);
> +		block_end = block_start + drm_buddy_block_size(mm, block) - 1;
> +
> +		if (!overlaps(new_start, new_end, block_start, block_end))
> +			continue;
> +
> +		if (contains(new_start, new_end, block_start, block_end)) {
> +			BUG_ON(!drm_buddy_block_is_free(block));
> +
> +			/* Allocate only required blocks */
> +			mark_allocated(block);
> +			mm->avail -= drm_buddy_block_size(mm, block);
> +			list_add_tail(&block->link, blocks);
> +			count += drm_buddy_block_size(mm, block);
> +			continue;
> +		}
> +
> +		if (!drm_buddy_block_is_split(block)) {

Should always be true, right? But I guess depends if we want to re-use 
this for generic range allocation...

> +			err = split_block(mm, block);
> +			if (unlikely(err))
> +				goto err_undo;
> +		}
> +
> +		list_add(&block->right->tmp_link, &dfs);
> +		list_add(&block->left->tmp_link, &dfs);
> +	} while (1);
> +
> +	return -ENOSPC;
> +
> +err_undo:
> +	buddy = get_buddy(block);
> +	if (buddy &&
> +	    (drm_buddy_block_is_free(block) &&
> +	     drm_buddy_block_is_free(buddy)))
> +		__drm_buddy_free(mm, block);
> +	return err;

Looking at the split_block failure path. The user allocated some block, 
and then tried to trim it, but this then marks it as free and removes it 
from their original list(potentially also freeing it), if we fail here. 
Would it be better to leave that decision to the user? If the trim() 
fails, worse case we get some internal fragmentation, and the user might 
be totally fine with that? I guess we could leave as-is, but for sure 
needs some big comment somewhere.

> +}
> +EXPORT_SYMBOL(drm_buddy_block_trim);
> +
>   static struct drm_buddy_block *
>   alloc_range(struct drm_buddy_mm *mm,
>   	    u64 start, u64 end,
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index b6ed5b37cf18..5e1f8c443058 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -97,6 +97,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   	if (unlikely(err))
>   		goto err_free_blocks;
>   
> +	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +		mutex_lock(&bman->lock);
> +		err = drm_buddy_block_trim(mm,
> +				(u64)n_pages << PAGE_SHIFT,
> +				&bman_res->blocks);
> +		mutex_unlock(&bman->lock);
> +		if (unlikely(err))
> +			goto err_free_blocks;

Yeah, so maybe we could in theory treat this as best effort? But I guess 
unlikely to ever hit this anyway, so meh.

> +	}
> +
>   	*res = &bman_res->base;
>   	return 0;
>   
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index cbe5e648440a..36e8f548acf7 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -145,6 +145,10 @@ int drm_buddy_alloc(struct drm_buddy_mm *mm,
>   		    struct list_head *blocks,
>   		    unsigned long flags);
>   
> +int drm_buddy_block_trim(struct drm_buddy_mm *mm,
> +			 u64 new_size,
> +			 struct list_head *blocks);
> +
>   void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block);
>   
>   void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects);
> 
