Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 256B8782F9A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 19:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8688C10E265;
	Mon, 21 Aug 2023 17:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7262810E265;
 Mon, 21 Aug 2023 17:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692639972; x=1724175972;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vn8EEKlH8sncfWztyhPqD/idQFrOO4QPxQvNWIs8FFo=;
 b=hFljYuS1hkWAcfSejEY3KQMSyo/HzR1Z8dSlDKf8FnTRakM17RbVXneL
 iexaXqVuDf4gFmOdlEU1FqmKrtAjHpqooOAQ05FB6JQ72XIk+6aveO1G1
 8s2Urf5/MyoXjhPCHRoFnkP56BJFlDQxATv1IXIgA078c4dl4QeLTMX/3
 qIxS6MRqj7jslqG5LQEoPLYeVONO7kJemeSrsKx/LCHFnabiuVgDwi1jK
 Q/J0aDO+8Zvx4+WyD8Sz8DB17dsET7MtL5i/ZOLye6Aklr3GfpY4G2FpZ
 OMgY6ZFix9wkxI3otNzvrv9aBHsjKPcXicMDwkTZWs5suXhEtMk65FZA+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="376400115"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="376400115"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 10:46:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="850268836"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="850268836"
Received: from gpcorr-mobl.ger.corp.intel.com (HELO [10.252.20.153])
 ([10.252.20.153])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 10:46:09 -0700
Message-ID: <bfe1e810-e3b9-775c-8b25-ceb0324f5b6b@intel.com>
Date: Mon, 21 Aug 2023 18:46:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] drm/buddy: Fix contiguous memory allocation issues
Content-Language: en-GB
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20230821101444.119601-1-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230821101444.119601-1-Arunpravin.PaneerSelvam@amd.com>
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

Hi,

On 21/08/2023 11:14, Arunpravin Paneer Selvam wrote:
> The way now contiguous requests are implemented such that
> the size rounded up to power of 2 and the corresponding order
> block picked from the freelist.
> 
> In addition to the older method, the new method will rounddown
> the size to power of 2 and the corresponding order block picked
> from the freelist. And for the remaining size we traverse the
> tree and try to allocate either from the freelist block's buddy
> or from the peer block. If the remaining size from peer/buddy
> block is not free, we pick the next freelist block and repeat
> the same method.
> 
> Moved contiguous/alignment size computation part and trim
> function to the drm buddy manager.

I think we should also mention somewhere what issue this is trying to 
solve. IIUC the roundup_power_of_two() might in some cases trigger 
-ENOSPC even though there might be enough free space, and so to help 
with that we introduce a try harder mechanism.

> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/drm_buddy.c | 253 ++++++++++++++++++++++++++++++++++--
>   include/drm/drm_buddy.h     |   6 +-
>   2 files changed, 248 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 7098f125b54a..220f60c08a03 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -569,6 +569,197 @@ static int __drm_buddy_alloc_range(struct drm_buddy *mm,
>   	return __alloc_range(mm, &dfs, start, size, blocks);
>   }
>   
> +static int __alloc_contiguous_block_from_buddy(struct drm_buddy *mm,
> +					       u64 size,
> +					       u64 min_block_size,
> +					       struct drm_buddy_block *block,
> +					       struct list_head *blocks)
> +{
> +	struct drm_buddy_block *buddy, *parent = NULL;
> +	u64 start, offset = 0;
> +	LIST_HEAD(dfs);
> +	int err;
> +
> +	if (!block)
> +		return -EINVAL;
> +
> +	buddy = __get_buddy(block);
> +	if (!buddy)
> +		return -ENOSPC;
> +
> +	if (drm_buddy_block_is_allocated(buddy))
> +		return -ENOSPC;
> +
> +	parent = block->parent;
> +	if (!parent)
> +		return -ENOSPC;
> +
> +	if (block->parent->right == block) {
> +		u64 remaining;
> +
> +		/* Compute the leftover size for allocation */
> +		remaining = max((size - drm_buddy_block_size(mm, buddy)),
> +				min_block_size);
> +		if (!IS_ALIGNED(remaining, min_block_size))
> +			remaining = round_up(remaining, min_block_size);
> +
> +		/* Check if remaining size is greater than buddy block size */
> +		if (drm_buddy_block_size(mm, buddy) < remaining)
> +			return -ENOSPC;
> +
> +		offset = drm_buddy_block_size(mm, buddy) - remaining;
> +	}
> +
> +	list_add(&parent->tmp_link, &dfs);
> +	start = drm_buddy_block_offset(parent) + offset;
> +
> +	err = __alloc_range(mm, &dfs, start, size, blocks);
> +	if (err)
> +		return -ENOSPC;
> +
> +	return 0;
> +}
> +
> +static int __alloc_contiguous_block_from_peer(struct drm_buddy *mm,
> +					      u64 size,
> +					      u64 min_block_size,
> +					      struct drm_buddy_block *block,
> +					      struct list_head *blocks)
> +{
> +	struct drm_buddy_block *first, *peer, *tmp;
> +	struct drm_buddy_block *parent = NULL;
> +	u64 start, offset = 0;
> +	unsigned int order;
> +	LIST_HEAD(dfs);
> +	int err;
> +
> +	if (!block)
> +		return -EINVAL;
> +
> +	order = drm_buddy_block_order(block);
> +	/* Add freelist block to dfs list */
> +	list_add(&block->tmp_link, &dfs);
> +
> +	tmp = block;
> +	parent = block->parent;
> +	while (parent) {
> +		if (block->parent->left == block) {
> +			if (parent->left != tmp) {
> +				peer = parent->left;
> +				break;
> +			}
> +		} else {
> +			if (parent->right != tmp) {
> +				peer = parent->right;
> +				break;
> +			}
> +		}
> +
> +		tmp = parent;
> +		parent = tmp->parent;
> +	}
> +
> +	if (!parent)
> +		return -ENOSPC;
> +
> +	do {
> +		if (drm_buddy_block_is_allocated(peer))
> +			return -ENOSPC;
> +		/* Exit loop if peer block order is equal to block order */
> +		if (drm_buddy_block_order(peer) == order)
> +			break;
> +
> +		if (drm_buddy_block_is_split(peer)) {
> +			/* Traverse down to the block order level */
> +			if (block->parent->left == block)
> +				peer = peer->right;
> +			else
> +				peer = peer->left;
> +		} else {
> +			break;
> +		}
> +	} while (1);
> +
> +	if (block->parent->left == block) {
> +		u64 remaining;
> +
> +		/* Compute the leftover size for allocation */
> +		remaining = max((size - drm_buddy_block_size(mm, block)),
> +				min_block_size);
> +		if (!IS_ALIGNED(remaining, min_block_size))
> +			remaining = round_up(remaining, min_block_size);
> +
> +		/* Check if remaining size is greater than peer block size */
> +		if (drm_buddy_block_size(mm, peer) < remaining)
> +			return -ENOSPC;
> +
> +		offset = drm_buddy_block_size(mm, peer) - remaining;
> +		/* Add left peer block to dfs list */
> +		list_add(&peer->tmp_link, &dfs);
> +	} else {
> +		/* Add right peer block to dfs list */
> +		list_add_tail(&peer->tmp_link, &dfs);
> +	}
> +
> +	first = list_first_entry_or_null(&dfs,
> +					 struct drm_buddy_block,
> +					 tmp_link);
> +	if (!first)
> +		return -EINVAL;
> +
> +	start = drm_buddy_block_offset(first) + offset;
> +	err = __alloc_range(mm, &dfs, start, size, blocks);
> +	if (err)
> +		return -ENOSPC;
> +
> +	return 0;
> +}
> +
> +static int __drm_buddy_alloc_contiguous_blocks(struct drm_buddy *mm,
> +					       u64 size,
> +					       u64 min_block_size,
> +					       struct list_head *blocks)
> +{
> +	struct drm_buddy_block *block;
> +	struct list_head *list;
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
> +		/* Allocate contiguous blocks from the buddy */
> +		err = __alloc_contiguous_block_from_buddy(mm,
> +							  size,
> +							  min_block_size,
> +							  block,
> +							  blocks);
> +		if (!err)
> +			return 0;
> +
> +		/* Allocate contiguous blocks from tree traversal method */
> +		err = __alloc_contiguous_block_from_peer(mm,
> +							 size,
> +							 min_block_size,
> +							 block,
> +							 blocks);
> +		if (!err)
> +			return 0;
> +	}
> +
> +	return -ENOSPC;
> +}

Wondering if this would be a lot simpler if we can tweak alloc_range() 
to support allocating as much as it can up to some size? If it runs out 
of space it still returns an error but doesn't actually free what it has 
successfully allocated. It then also tells us how much it allocated. We 
can then allocate the rhs first and then from whatever is left we can 
figure out the precise offset we need for the lhs? I think that looks 
sort of similar to what the above does, but here we can for the most 
part just re-use alloc_range()? So maybe something like:

__alloc_range(..., u64 *total_allocated_on_err)
{
     ....
     err_free:
         if (err == -ENOSPC && total_allocated_on_err)
             *total_allocated_on_err = total_allocated;
         else
             drm_buddy_free_list(mm, &allocated);
         return err;
}

alloc_contig_try_harder()
{
      ....
      list_for_each_entry_reverse(b, list, link) {
          .....

          rhs_offset = block_offset(b);
          err =  __drm_buddy_alloc_range(mm, rhs_offset,
                                         size, &filled,
                                         blocks);
          if (!err || err != -ENOSPC)
              break;

          lhs_size = size - filled;
          lhs_offset = block_offset(b) - lhs_size;
          err =  __drm_buddy_alloc_range(mm, lhs_offset,
                                         lhs_size, NULL,
                                         blocks_lhs);
          list_splice(blocks_lhs, blocks);

          ....
      }
}

?

> +
>   /**
>    * drm_buddy_block_trim - free unused pages
>    *
> @@ -645,7 +836,7 @@ EXPORT_SYMBOL(drm_buddy_block_trim);
>    * @start: start of the allowed range for this block
>    * @end: end of the allowed range for this block
>    * @size: size of the allocation
> - * @min_page_size: alignment of the allocation
> + * @min_block_size: alignment of the allocation
>    * @blocks: output list head to add allocated blocks
>    * @flags: DRM_BUDDY_*_ALLOCATION flags
>    *
> @@ -660,23 +851,24 @@ EXPORT_SYMBOL(drm_buddy_block_trim);
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
> @@ -692,12 +884,21 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   	if (start + size == end)
>   		return __drm_buddy_alloc_range(mm, start, size, blocks);
>   
> -	if (!IS_ALIGNED(size, min_page_size))
> -		return -EINVAL;
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
> @@ -716,6 +917,17 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   				break;
>   
>   			if (order-- == min_order) {
> +				if (flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION &&
> +				    !(flags & DRM_BUDDY_RANGE_ALLOCATION))
> +					/*
> +					 * Try contiguous block allocation through
> +					 * tree traversal method
> +					 */
> +					return __drm_buddy_alloc_contiguous_blocks(mm,
> +										   original_size,
> +										   original_min_size,
> +										   blocks);
> +
>   				err = -ENOSPC;
>   				goto err_free;
>   			}
> @@ -732,6 +944,31 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
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
