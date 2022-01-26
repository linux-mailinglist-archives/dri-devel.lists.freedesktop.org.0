Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB6549D1E9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 19:42:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1B910E38C;
	Wed, 26 Jan 2022 18:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5134E10E13B;
 Wed, 26 Jan 2022 18:42:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id BEEB41F44A8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643222527;
 bh=IYUnDN+Ob4JYuRTXa2WgdKV0raxd+EDgVroRWxukxaM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BjRzSDJyIrRvRfaVcABOcx7KGhjZti/hUBrGWelGerlmjcJuuTW0ZI4BVIsE8Zh/Z
 FW0eiv7H8u5y6V46by35t0+j0eBqxdIW0JDbQd4DOenrFnREEv5LH+DTwWutnmDrvm
 6wuW2o2JrnGWplJtU9wbE0ilQT3mUtLqlS9YRguyM0yTAzy2qDBsl1A7oepWtubUhN
 Bei1AVw/2hFRi9UDXUrmnVkmkHqwCKTKntO14fFdBEKy0T8bWFVHnUOXQ0tksE2Gpf
 F6HUfdVYeWPeYdpX2JUdYuDvNhYrSG2VrKlHJuQel1A/sVSoDvNjA2tVF0AEVtpwpm
 jjcAK9KiqyiXA==
Message-ID: <34377c24-636f-234e-fcf7-eee47ad6aa9c@collabora.com>
Date: Wed, 26 Jan 2022 18:42:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH 02/20] drm: implement top-down allocation
 method
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220126152155.3070602-1-matthew.auld@intel.com>
 <20220126152155.3070602-3-matthew.auld@intel.com>
From: Robert Beckett <bob.beckett@collabora.com>
In-Reply-To: <20220126152155.3070602-3-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 26/01/2022 15:21, Matthew Auld wrote:
> From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> 
> Implemented a function which walk through the order list,
> compares the offset and returns the maximum offset block,
> this method is unpredictable in obtaining the high range
> address blocks which depends on allocation and deallocation.
> for instance, if driver requests address at a low specific
> range, allocator traverses from the root block and splits
> the larger blocks until it reaches the specific block and
> in the process of splitting, lower orders in the freelist
> are occupied with low range address blocks and for the
> subsequent TOPDOWN memory request we may return the low
> range blocks.To overcome this issue, we may go with the
> below approach.
> 
> The other approach, sorting each order list entries in
> ascending order and compares the last entry of each
> order list in the freelist and return the max block.
> This creates sorting overhead on every drm_buddy_free()
> request and split up of larger blocks for a single page
> request.

ooc, why did you choose to implement this as an alloc flag?
Seems to me like it would be a good candidate for a new memory region. 
That way allocation algorithms wouldn't need exta logic and ttm can 
already handle migrations.

> 
> v2:
>    - Fix alignment issues(Matthew Auld)
>    - Remove unnecessary list_empty check(Matthew Auld)
>    - merged the below patch to see the feature in action
>       - add top-down alloc support to i915 driver
> 
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/drm_buddy.c                   | 36 ++++++++++++++++---
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  3 ++
>   include/drm/drm_buddy.h                       |  1 +
>   3 files changed, 35 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 954e31962c74..6aa5c1ce25bf 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -371,6 +371,26 @@ alloc_range_bias(struct drm_buddy *mm,
>   	return ERR_PTR(err);
>   }
>   
> +static struct drm_buddy_block *
> +get_maxblock(struct list_head *head)
> +{
> +	struct drm_buddy_block *max_block = NULL, *node;
> +
> +	max_block = list_first_entry_or_null(head,
> +					     struct drm_buddy_block,
> +					     link);
> +	if (!max_block)
> +		return NULL;
> +
> +	list_for_each_entry(node, head, link) {
> +		if (drm_buddy_block_offset(node) >
> +		    drm_buddy_block_offset(max_block))
> +			max_block = node;
> +	}
> +
> +	return max_block;
> +}
> +
>   static struct drm_buddy_block *
>   alloc_from_freelist(struct drm_buddy *mm,
>   		    unsigned int order,
> @@ -381,11 +401,17 @@ alloc_from_freelist(struct drm_buddy *mm,
>   	int err;
>   
>   	for (i = order; i <= mm->max_order; ++i) {
> -		block = list_first_entry_or_null(&mm->free_list[i],
> -						 struct drm_buddy_block,
> -						 link);
> -		if (block)
> -			break;
> +		if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
> +			block = get_maxblock(&mm->free_list[i]);
> +			if (block)
> +				break;
> +		} else {
> +			block = list_first_entry_or_null(&mm->free_list[i],
> +							 struct drm_buddy_block,
> +							 link);
> +			if (block)
> +				break;
> +		}
>   	}
>   
>   	if (!block)
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index 1411f4cf1f21..3662434b64bb 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -53,6 +53,9 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   	INIT_LIST_HEAD(&bman_res->blocks);
>   	bman_res->mm = mm;
>   
> +	if (place->flags & TTM_PL_FLAG_TOPDOWN)
> +		bman_res->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
> +
>   	if (place->fpfn || lpfn != man->size)
>   		bman_res->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>   
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index 865664b90a8a..424fc443115e 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -28,6 +28,7 @@
>   })
>   
>   #define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
> +#define DRM_BUDDY_TOPDOWN_ALLOCATION (1 << 1)
>   
>   struct drm_buddy_block {
>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
