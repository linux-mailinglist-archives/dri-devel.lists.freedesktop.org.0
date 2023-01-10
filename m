Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C52663FA8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 13:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0658A10E5AC;
	Tue, 10 Jan 2023 12:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C114A10E5AB;
 Tue, 10 Jan 2023 12:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673352181; x=1704888181;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=05jqlNtiS5owacvMk5DptB9H6iSW7Vh8h1rmk9nzURw=;
 b=b0je0w/QSUzZNeGq/02MARMn8VOxMxNBd8Vv9jq8ukquTbLA1yFLCbV9
 OKDbyQy0P7p60yUrinXOlBIzgiHr5QuxjHXLRw7s0JvaJHim+3+xrBvxm
 pVvo66Iu4cAO7P+F2rXJTriIKX8ijNJOHEcKgqAV5y2U5gKTzCd8MIVDc
 5SXmo7t7G8z6xG26Kw/l8KGEtK0RLH9ry5wQHuec7RphyWAzlbSVKCB9P
 pYcvcui9k+ebOZrqYVsZRWreGBCrYiT7/fet+T6aoX2OkW4D+88ZpsaHa
 gJW95l5/MepE/h4J86USOhx5967VHudZ1XMAY9gnxgKw6mATIb6rghhp7 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="324365576"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="324365576"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 04:03:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="606939542"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="606939542"
Received: from ffagan-mobl1.ger.corp.intel.com (HELO [10.252.26.60])
 ([10.252.26.60])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 04:02:59 -0800
Message-ID: <8f376efe-e19b-d1d5-031d-35df399bb6cf@intel.com>
Date: Tue, 10 Jan 2023 12:02:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [PATCH] drm: Alloc high address for drm buddy topdown flag
Content-Language: en-GB
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 alexander.deucher@amd.com
References: <20230107151523.29864-1-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230107151523.29864-1-Arunpravin.PaneerSelvam@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/01/2023 15:15, Arunpravin Paneer Selvam wrote:
> As we are observing low numbers in viewperf graphics benchmark, we
> are strictly not allowing the top down flag enabled allocations
> to steal the memory space from cpu visible region.
> 
> The approach is, we are sorting each order list entries in
> ascending order and compare the last entry of each order
> list in the freelist and return the max block.

Did you also run the selftests? Does everything still pass and complete 
in a reasonable amount of time?

> 
> This patch improves the viewperf 3D benchmark scores.
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/drm_buddy.c | 81 ++++++++++++++++++++++++-------------
>   1 file changed, 54 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 11bb59399471..50916b2f2fc5 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -38,6 +38,25 @@ static void drm_block_free(struct drm_buddy *mm,
>   	kmem_cache_free(slab_blocks, block);
>   }
>   
> +static void list_insert_sorted(struct drm_buddy *mm,
> +			       struct drm_buddy_block *block)
> +{
> +	struct drm_buddy_block *node;
> +	struct list_head *head;
> +
> +	head = &mm->free_list[drm_buddy_block_order(block)];
> +	if (list_empty(head)) {
> +		list_add(&block->link, head);
> +		return;
> +	}
> +
> +	list_for_each_entry(node, head, link)
> +		if (drm_buddy_block_offset(block) < drm_buddy_block_offset(node))
> +			break;
> +
> +	__list_add(&block->link, node->link.prev, &node->link);
> +}
> +
>   static void mark_allocated(struct drm_buddy_block *block)
>   {
>   	block->header &= ~DRM_BUDDY_HEADER_STATE;
> @@ -52,8 +71,7 @@ static void mark_free(struct drm_buddy *mm,
>   	block->header &= ~DRM_BUDDY_HEADER_STATE;
>   	block->header |= DRM_BUDDY_FREE;
>   
> -	list_add(&block->link,
> -		 &mm->free_list[drm_buddy_block_order(block)]);
> +	list_insert_sorted(mm, block);

One advantage of not sorting is when splitting down a large block. 
Previously the most-recently-split would be at the start of the list for 
the next order down, where potentially the next allocation could use it. 
So perhaps less fragmentation if it's all part of one BO. Otherwise I 
don't see any other downsides, other than the extra overhead of sorting.

>   }
>   
>   static void mark_split(struct drm_buddy_block *block)
> @@ -387,20 +405,26 @@ alloc_range_bias(struct drm_buddy *mm,
>   }
>   
>   static struct drm_buddy_block *
> -get_maxblock(struct list_head *head)
> +get_maxblock(struct drm_buddy *mm, unsigned int order)
>   {
>   	struct drm_buddy_block *max_block = NULL, *node;
> +	unsigned int i;
>   
> -	max_block = list_first_entry_or_null(head,
> -					     struct drm_buddy_block,
> -					     link);
> -	if (!max_block)
> -		return NULL;
> +	for (i = order; i <= mm->max_order; ++i) {
> +		if (!list_empty(&mm->free_list[i])) {
> +			node = list_last_entry(&mm->free_list[i],
> +					       struct drm_buddy_block,
> +					       link);
> +			if (!max_block) {
> +				max_block = node;
> +				continue;
> +			}
>   
> -	list_for_each_entry(node, head, link) {
> -		if (drm_buddy_block_offset(node) >
> -		    drm_buddy_block_offset(max_block))
> -			max_block = node;
> +			if (drm_buddy_block_offset(node) >
> +				drm_buddy_block_offset(max_block)) {

Formatting doesn't look right here.

Going to test this today with some workloads with small-bar and i915 
just to see if this improves/impacts anything for us.

> +				max_block = node;
> +			}
> +		}
>   	}
>   
>   	return max_block;
> @@ -412,20 +436,23 @@ alloc_from_freelist(struct drm_buddy *mm,
>   		    unsigned long flags)
>   {
>   	struct drm_buddy_block *block = NULL;
> -	unsigned int i;
> +	unsigned int tmp;
>   	int err;
>   
> -	for (i = order; i <= mm->max_order; ++i) {
> -		if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
> -			block = get_maxblock(&mm->free_list[i]);
> -			if (block)
> -				break;
> -		} else {
> -			block = list_first_entry_or_null(&mm->free_list[i],
> -							 struct drm_buddy_block,
> -							 link);
> -			if (block)
> -				break;
> +	if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
> +		block = get_maxblock(mm, order);
> +		if (block)
> +			/* Store the obtained block order */
> +			tmp = drm_buddy_block_order(block);
> +	} else {
> +		for (tmp = order; tmp <= mm->max_order; ++tmp) {
> +			if (!list_empty(&mm->free_list[tmp])) {
> +				block = list_last_entry(&mm->free_list[tmp],
> +							struct drm_buddy_block,
> +							link);
> +				if (block)
> +					break;
> +			}
>   		}
>   	}
>   
> @@ -434,18 +461,18 @@ alloc_from_freelist(struct drm_buddy *mm,
>   
>   	BUG_ON(!drm_buddy_block_is_free(block));
>   
> -	while (i != order) {
> +	while (tmp != order) {
>   		err = split_block(mm, block);
>   		if (unlikely(err))
>   			goto err_undo;
>   
>   		block = block->right;
> -		i--;
> +		tmp--;
>   	}
>   	return block;
>   
>   err_undo:
> -	if (i != order)
> +	if (tmp != order)
>   		__drm_buddy_free(mm, block);
>   	return ERR_PTR(err);
>   }
