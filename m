Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66419495EEC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 13:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65B710EA28;
	Fri, 21 Jan 2022 12:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E1710E6F5;
 Fri, 21 Jan 2022 12:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642767615; x=1674303615;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lhytBqpOKg8M8GvhUcgLt4ML0h/CSSrW1gue6C+jqWg=;
 b=EoG/nKMzX7DYgdFCsNeEDlCsGCv3RpUN2Ym/t9QCA9AsM9MTqCMVJnTu
 5wf5mSgK83gm0wns1YBrgEPXRpcltPHgnWoRNVfLH4Dnw8I9+seMOy23o
 yPLFvP1zLhxKRdk6cOAF5+laG2FUosMP1Mhgs10bAWpQXJr0UinajNYPc
 WrudF5rEz7lvf7WTU5opXgD6lGBLyE1vjlBtuWTA5SdEuRlLjcWx95jyv
 zakUWWX3qNwmOyErCmN2NDzPmjzR32HljgrOiX+J0NGiJdeWyErq8QFpi
 wr4uQKmOzrZCQ0vhGiDIog+jE2CTVJIufXoSMT7DDhJsCezBHGPQflBQ1 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245425943"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="245425943"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 04:20:15 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="561856355"
Received: from jjduignx-mobl.ger.corp.intel.com (HELO [10.213.206.232])
 ([10.213.206.232])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 04:20:12 -0800
Message-ID: <05ad0380-fb7f-c119-9ecb-b3872164d5f4@intel.com>
Date: Fri, 21 Jan 2022 12:20:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v9 3/6] drm: implement top-down allocation method
Content-Language: en-GB
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220119113718.3311-1-Arunpravin.PaneerSelvam@amd.com>
 <20220119113718.3311-2-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220119113718.3311-2-Arunpravin.PaneerSelvam@amd.com>
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

If we feed in the knowledge of the visible_size(or perhaps implement 
that generically as "zones"), I think this can be done more efficiently. 
It could also be useful to track directly in the allocator how much of 
the visible_size is still available, rather than having to do that in 
the upper levels by scanning the entire list. But hopefully in practice 
this should be good enough for our needs,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

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
> 
