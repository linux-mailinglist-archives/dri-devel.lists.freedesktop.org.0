Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8B179A769
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 12:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D3A10E291;
	Mon, 11 Sep 2023 10:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9BD10E184;
 Mon, 11 Sep 2023 10:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694429170; x=1725965170;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ykm6PmoaTeMGY8Jj3BL6u8PkH9OEnE5BuvMjPIvGLeQ=;
 b=SpfCE5gWdTm6qn2+/LKQXyVxKb+G3iz0C8btK7GMgTw0310dc5smzFGQ
 L9jVyEqVcB34vY2BK74YYG3wjuyH5Y+NvJ0/T0mYK1R3GjvQlOD3ai5Ci
 SX7M6QrkBkgLyUG9mKMvtdod10W7aWSIR3xqeaFUWvUC0SqYbyWxF+MYD
 xD/r+ZdBIhQtIid/T9tTUXqGQJngiUGkkamhylol0bo5kYRJO/M+Zyv2/
 pc0oCqy4ij3eTWhVDhGuRZvH3/IofrQdKpNgcAXeJvfovel9bMAIfuoYV
 uGAHY9jZBFzrCVydeR2jQnfEG6pEl2bFU+L6x6KLuwWxuf3mfYRAb+TjI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="381849537"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="381849537"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 03:46:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="778345260"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="778345260"
Received: from dfdonlon-mobl3.ger.corp.intel.com (HELO [10.252.24.122])
 ([10.252.24.122])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 03:46:07 -0700
Message-ID: <eb7a84ee-a9df-b1b7-0aa8-488146ccd747@intel.com>
Date: Mon, 11 Sep 2023 11:46:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/3] drm/buddy: Improve contiguous memory allocation
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20230909160902.15644-1-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230909160902.15644-1-Arunpravin.PaneerSelvam@amd.com>
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/09/2023 17:09, Arunpravin Paneer Selvam wrote:
> Problem statement: The current method roundup_power_of_two()
> to allocate contiguous address triggers -ENOSPC in some cases
> even though we have enough free spaces and so to help with
> that we introduce a try harder mechanism.
> 
> In case of -ENOSPC, the new try harder mechanism rounddown the
> original size to power of 2 and iterating over the round down
> sized freelist blocks to allocate the required size traversing
> RHS and LHS.
> 
> As part of the above new method implementation we moved
> contiguous/alignment size computation part and trim function
> to the drm buddy file.
> 
> v2: Modify the alloc_range() function to return total allocated size
>      on -ENOSPC err and traverse RHS/LHS to allocate the required
>      size (Matthew).
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/drm_buddy.c | 138 ++++++++++++++++++++++++++++++++----
>   include/drm/drm_buddy.h     |   6 +-
>   2 files changed, 127 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 7098f125b54a..e909eed9cf60 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -480,10 +480,12 @@ alloc_from_freelist(struct drm_buddy *mm,
>   static int __alloc_range(struct drm_buddy *mm,
>   			 struct list_head *dfs,
>   			 u64 start, u64 size,
> -			 struct list_head *blocks)
> +			 struct list_head *blocks,
> +			 u64 *total_allocated_on_err)
>   {
>   	struct drm_buddy_block *block;
>   	struct drm_buddy_block *buddy;
> +	u64 total_allocated = 0;
>   	LIST_HEAD(allocated);
>   	u64 end;
>   	int err;
> @@ -520,6 +522,7 @@ static int __alloc_range(struct drm_buddy *mm,
>   			}
>   
>   			mark_allocated(block);
> +			total_allocated += drm_buddy_block_size(mm, block);
>   			mm->avail -= drm_buddy_block_size(mm, block);
>   			list_add_tail(&block->link, &allocated);
>   			continue;
> @@ -551,13 +554,20 @@ static int __alloc_range(struct drm_buddy *mm,
>   		__drm_buddy_free(mm, block);
>   
>   err_free:
> -	drm_buddy_free_list(mm, &allocated);
> +	if (err == -ENOSPC && total_allocated_on_err) {
> +		list_splice_tail(&allocated, blocks);
> +		*total_allocated_on_err = total_allocated;
> +	} else {
> +		drm_buddy_free_list(mm, &allocated);
> +	}
> +
>   	return err;
>   }
>   
>   static int __drm_buddy_alloc_range(struct drm_buddy *mm,
>   				   u64 start,
>   				   u64 size,
> +				   u64 *total_allocated_on_err,
>   				   struct list_head *blocks)
>   {
>   	LIST_HEAD(dfs);
> @@ -566,7 +576,62 @@ static int __drm_buddy_alloc_range(struct drm_buddy *mm,
>   	for (i = 0; i < mm->n_roots; ++i)
>   		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>   
> -	return __alloc_range(mm, &dfs, start, size, blocks);
> +	return __alloc_range(mm, &dfs, start, size,
> +			     blocks, total_allocated_on_err);
> +}
> +
> +static int __alloc_contig_try_harder(struct drm_buddy *mm,
> +				     u64 size,
> +				     u64 min_block_size,
> +				     struct list_head *blocks)
> +{
> +	u64 rhs_offset, lhs_offset, lhs_size, filled;
> +	struct drm_buddy_block *block;
> +	struct list_head *list;
> +	LIST_HEAD(blocks_lhs);
> +	unsigned long pages;
> +	unsigned int order;
> +	u64 modify_size;
> +	int err;
> +
> +	modify_size = rounddown_pow_of_two(size);
> +	pages = modify_size >> ilog2(mm->chunk_size);
> +	order = fls(pages) - 1;
> +	if (order == 0)
> +		return -ENOSPC;
> +
> +	list = &mm->free_list[order];
> +	if (list_empty(list))
> +		return -ENOSPC;
> +
> +	list_for_each_entry_reverse(block, list, link) {
> +		/* Allocate blocks traversing RHS */
> +		rhs_offset = drm_buddy_block_offset(block);
> +		err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
> +					       &filled, blocks);
> +		if (!err || err != -ENOSPC)
> +			return err;
> +
> +		lhs_size = max((size - filled), min_block_size);
> +		if (!IS_ALIGNED(lhs_size, min_block_size))
> +			lhs_size = round_up(lhs_size, min_block_size);
> +
> +		/* Allocate blocks traversing LHS */
> +		lhs_offset = drm_buddy_block_offset(block) - lhs_size;
> +		err =  __drm_buddy_alloc_range(mm, lhs_offset, lhs_size,
> +					       NULL, &blocks_lhs);
> +		if (!err) {
> +			list_splice(&blocks_lhs, blocks);
> +			return 0;

I guess we could attempt to trim this also (could tweak the trim to work 
on multiple nodes)? But I guess in practice should be pretty meh, given 
that the extra rhs is hopefully not too big in the corner case where the 
alignment doesn't fit the min_block_size?

Anyway, for patches 1-3,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +		} else if (err != -ENOSPC) {
> +			drm_buddy_free_list(mm, blocks);
> +			return err;
> +		}
> +		/* Free blocks for the next iteration */
> +		drm_buddy_free_list(mm, blocks);
> +	}
> +
> +	return -ENOSPC;
>   }
>   
>   /**
> @@ -626,7 +691,7 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>   
>   	new_start = drm_buddy_block_offset(block);
>   	list_add(&block->tmp_link, &dfs);
> -	err =  __alloc_range(mm, &dfs, new_start, new_size, blocks);
> +	err =  __alloc_range(mm, &dfs, new_start, new_size, blocks, NULL);
>   	if (err) {
>   		mark_allocated(block);
>   		mm->avail -= drm_buddy_block_size(mm, block);
> @@ -645,7 +710,7 @@ EXPORT_SYMBOL(drm_buddy_block_trim);
>    * @start: start of the allowed range for this block
>    * @end: end of the allowed range for this block
>    * @size: size of the allocation
> - * @min_page_size: alignment of the allocation
> + * @min_block_size: alignment of the allocation
>    * @blocks: output list head to add allocated blocks
>    * @flags: DRM_BUDDY_*_ALLOCATION flags
>    *
> @@ -660,23 +725,24 @@ EXPORT_SYMBOL(drm_buddy_block_trim);
>    */
>   int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   			   u64 start, u64 end, u64 size,
> -			   u64 min_page_size,
> +			   u64 min_block_size,
>   			   struct list_head *blocks,
>   			   unsigned long flags)
>   {
>   	struct drm_buddy_block *block = NULL;
> +	u64 original_size, original_min_size;
>   	unsigned int min_order, order;
> -	unsigned long pages;
>   	LIST_HEAD(allocated);
> +	unsigned long pages;
>   	int err;
>   
>   	if (size < mm->chunk_size)
>   		return -EINVAL;
>   
> -	if (min_page_size < mm->chunk_size)
> +	if (min_block_size < mm->chunk_size)
>   		return -EINVAL;
>   
> -	if (!is_power_of_2(min_page_size))
> +	if (!is_power_of_2(min_block_size))
>   		return -EINVAL;
>   
>   	if (!IS_ALIGNED(start | end | size, mm->chunk_size))
> @@ -690,14 +756,23 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   
>   	/* Actual range allocation */
>   	if (start + size == end)
> -		return __drm_buddy_alloc_range(mm, start, size, blocks);
> -
> -	if (!IS_ALIGNED(size, min_page_size))
> -		return -EINVAL;
> +		return __drm_buddy_alloc_range(mm, start, size, NULL, blocks);
> +
> +	original_size = size;
> +	original_min_size = min_block_size;
> +
> +	/* Roundup the size to power of 2 */
> +	if (flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION) {
> +		size = roundup_pow_of_two(size);
> +		min_block_size = size;
> +	/* Align size value to min_block_size */
> +	} else if (!IS_ALIGNED(size, min_block_size)) {
> +		size = round_up(size, min_block_size);
> +	}
>   
>   	pages = size >> ilog2(mm->chunk_size);
>   	order = fls(pages) - 1;
> -	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
> +	min_order = ilog2(min_block_size) - ilog2(mm->chunk_size);
>   
>   	do {
>   		order = min(order, (unsigned int)fls(pages) - 1);
> @@ -716,6 +791,16 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   				break;
>   
>   			if (order-- == min_order) {
> +				if (flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION &&
> +				    !(flags & DRM_BUDDY_RANGE_ALLOCATION))
> +					/*
> +					 * Try contiguous block allocation through
> +					 * try harder method
> +					 */
> +					return __alloc_contig_try_harder(mm,
> +									 original_size,
> +									 original_min_size,
> +									 blocks);
>   				err = -ENOSPC;
>   				goto err_free;
>   			}
> @@ -732,6 +817,31 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   			break;
>   	} while (1);
>   
> +	/* Trim the allocated block to the required size */
> +	if (original_size != size) {
> +		struct list_head *trim_list;
> +		LIST_HEAD(temp);
> +		u64 trim_size;
> +
> +		trim_list = &allocated;
> +		trim_size = original_size;
> +
> +		if (!list_is_singular(&allocated)) {
> +			block = list_last_entry(&allocated, typeof(*block), link);
> +			list_move(&block->link, &temp);
> +			trim_list = &temp;
> +			trim_size = drm_buddy_block_size(mm, block) -
> +				(size - original_size);
> +		}
> +
> +		drm_buddy_block_trim(mm,
> +				     trim_size,
> +				     trim_list);
> +
> +		if (!list_empty(&temp))
> +			list_splice_tail(trim_list, &allocated);
> +	}
> +
>   	list_splice_tail(&allocated, blocks);
>   	return 0;
>   
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index 572077ff8ae7..a5b39fc01003 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -22,8 +22,9 @@
>   	start__ >= max__ || size__ > max__ - start__; \
>   })
>   
> -#define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
> -#define DRM_BUDDY_TOPDOWN_ALLOCATION (1 << 1)
> +#define DRM_BUDDY_RANGE_ALLOCATION		BIT(0)
> +#define DRM_BUDDY_TOPDOWN_ALLOCATION		BIT(1)
> +#define DRM_BUDDY_CONTIGUOUS_ALLOCATION		BIT(2)
>   
>   struct drm_buddy_block {
>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
> @@ -155,5 +156,4 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p);
>   void drm_buddy_block_print(struct drm_buddy *mm,
>   			   struct drm_buddy_block *block,
>   			   struct drm_printer *p);
> -
>   #endif
