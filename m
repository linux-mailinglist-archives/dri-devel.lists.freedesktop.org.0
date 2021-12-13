Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 224E147343D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 19:43:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE0B10E83D;
	Mon, 13 Dec 2021 18:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1667D10E83D;
 Mon, 13 Dec 2021 18:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639421014; x=1670957014;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=a4LqnQ75YQVCRyOLB1ug7lG0ENZOYBowvffTejBGcvY=;
 b=Rlsn5OCjI5tDcDcRNimshjFXqWPtVyw/dSzhvjl+e4VaRC1C1NvpyBxZ
 HTijZw0J++wQFKX/6kwGhv8Ojm33q6QPeCpniXlNzTe0S50QaB0geJoQJ
 Lnv+zi8C3Tlvcw9qWcEiWB9jjpJlyPvzu0WwUxWFuGkuLsBAMbR5kBePo
 Vgd3tAfUKZkl89wvlxHjXC/4PWPsynMwSLTkmDGZ4B53iu+scHAmywRYg
 9v9BLQMcegq7geulXwL3K4jHQZ3uy5DPeICsEl9Mq9WufZqGPERdbAVST
 6ip+HWFDS9CdnhldjQNx8aD2lTR0tcv04BvGq3H46zh9LoCgGynwR+u2A w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="302181497"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; d="scan'208";a="302181497"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 10:40:50 -0800
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; d="scan'208";a="463482813"
Received: from ttbuckle-mobl.ger.corp.intel.com (HELO [10.252.5.128])
 ([10.252.5.128])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 10:40:48 -0800
Message-ID: <d73bbe41-f295-8da6-5395-ce59ffb6bab5@intel.com>
Date: Mon, 13 Dec 2021 18:40:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 4/6] drm: implement a method to free unused pages
Content-Language: en-GB
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20211201163938.133226-1-Arunpravin.PaneerSelvam@amd.com>
 <20211201163938.133226-4-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211201163938.133226-4-Arunpravin.PaneerSelvam@amd.com>
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

On 01/12/2021 16:39, Arunpravin wrote:
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
> v3:
>    - remove drm_buddy_block_trim() error handling and
>      print a warn message if it fails
> 
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/drm_buddy.c                   | 72 ++++++++++++++++++-
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 10 +++
>   include/drm/drm_buddy.h                       |  4 ++
>   3 files changed, 83 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index eddc1eeda02e..707efc82216d 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -434,7 +434,8 @@ alloc_from_freelist(struct drm_buddy_mm *mm,
>   static int __alloc_range(struct drm_buddy_mm *mm,
>   			 struct list_head *dfs,
>   			 u64 start, u64 size,
> -			 struct list_head *blocks)
> +			 struct list_head *blocks,
> +			 bool trim_path)
>   {
>   	struct drm_buddy_block *block;
>   	struct drm_buddy_block *buddy;
> @@ -480,8 +481,20 @@ static int __alloc_range(struct drm_buddy_mm *mm,
>   
>   		if (!drm_buddy_block_is_split(block)) {
>   			err = split_block(mm, block);
> -			if (unlikely(err))
> +			if (unlikely(err)) {
> +				if (trim_path)
> +					/*
> +					 * Here in case of trim, we return and dont goto
> +					 * split failure path as it removes from the
> +					 * original list and potentially also freeing
> +					 * the block. so we could leave as it is,
> +					 * worse case we get some internal fragmentation
> +					 * and leave the decision to the user
> +					 */
> +					return err;

Hmm, ideally we don't want to leave around blocks where both buddies are 
free without then also merging them back(not sure if that trips some 
BUG_ON). Also IIUC, if we hit this failure path, depending on where the 
split_block() fails we might be allocating something less than new_size? 
Also if it's the first split_block() that fails then the user just gets 
an empty list?

Could we perhaps just turn this node into a temporary root node to 
prevent recursively freeing itself, but still retain the 
un-splitting/freeing of the other nodes i.e something like:

list_del(&block->link);
mark_free(mm, block);
mm->avail += ...;

/* Prevent recursively freeing this node */
parent = block->parent;
block->parent = NULL;

list_add(&block->tmp_link, &dfs);
ret = _alloc_range(mm, &dfs, new_start, new_size, blocks);
if (ret) {
     mem->avail -= ...;
     mark_allocated(block);
     list_add(&block->link, blocks);
}

block->parent = parent;
return ret;

That way we can also drop the special trim_path handling. Thoughts?

> +
>   				goto err_undo;
> +			}
>   		}
>   
>   		list_add(&block->right->tmp_link, dfs);
> @@ -535,8 +548,61 @@ static int __drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>   	for (i = 0; i < mm->n_roots; ++i)
>   		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>   
> -	return __alloc_range(mm, &dfs, start, size, blocks);
> +	return __alloc_range(mm, &dfs, start, size, blocks, 0);
> +}
> +
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
> +	u64 new_start;
> +	LIST_HEAD(dfs);
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
> +
> +	mark_free(mm, block);
> +
> +	list_add(&block->tmp_link, &dfs);
> +
> +	return __alloc_range(mm, &dfs, new_start, new_size, blocks, 1);
>   }
> +EXPORT_SYMBOL(drm_buddy_block_trim);
>   
>   /**
>    * drm_buddy_alloc - allocate power-of-two blocks
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index 7c58efb60dba..c5831c27fe82 100644
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
> +		pr_warn("drm_buddy_block_trim failed returing %d for ttm_buffer_object(%p)\n",
> +			err, bo);


IIUC this prints a warning even for success? Anyway, I think we can drop 
the pr_warn, since normal user can't really do much here?

> +	}
> +
>   	*res = &bman_res->base;
>   	return 0;
>   
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index 316ac0d25f08..90906d9dbbf0 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -146,6 +146,10 @@ int drm_buddy_alloc(struct drm_buddy_mm *mm,
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
