Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFECC4A7132
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 14:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2D589123;
	Wed,  2 Feb 2022 13:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C60610E161
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 13:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643807061; x=1675343061;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=rGPIVCE31WBToTCyGgVTy97nhIFVoQxzTzDGebqbuZI=;
 b=Q6P2dUjdlq3tkYijjetnlUNHm+NlqvQE2rWnpDrKlaTH+o7dR/OnT3DP
 NYvQFiLtPWafTiA2s4DIkcFQxKRUp//kBWHjvOOO/bkskFoZ4QFPw9vKM
 4knXJk9RN0CGTJIhjwndLu/CR2EEkPHWbnMgm7F7z/CNmTz61wvsbs4Jc
 RFWq1nlpk8ryVZSarSSKH84UZ9XKAdcmesshqhhKajgKoFr7lZ8L4UP0O
 1Yo/c5G0GLlMNAKLQhB4W7F5CSQJZUdeBaxoccZJm7shwQsShTxxwE7XS
 6SWNPgsV3gFLmGN/wuUHKDRIvyPcjBIGlX3YSEGUpRBmWIPxVOqKR0V6l A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="311218116"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="311218116"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 05:04:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="565980535"
Received: from dolandox-mobl1.ger.corp.intel.com (HELO [10.213.211.99])
 ([10.213.211.99])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 05:04:18 -0800
Message-ID: <ed22efe9-4cd8-cf71-beb7-66af7161c518@linux.intel.com>
Date: Wed, 2 Feb 2022 13:04:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] drm/mm: Add an iterator to optimally walk over holes
 for an allocation
Content-Language: en-US
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org
References: <20220202011358.1409946-1-vivek.kasireddy@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220202011358.1409946-1-vivek.kasireddy@intel.com>
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


On 02/02/2022 01:13, Vivek Kasireddy wrote:
> This iterator relies on drm_mm_first_hole() and drm_mm_next_hole()
> functions to identify suitable holes for an allocation of a given
> size by efficently traversing the rbtree associated with the given
> allocator.
> 
> It replaces the for loop in drm_mm_insert_node_in_range() and can
> also be used by drm drivers to quickly identify holes of a certain
> size within a given range.
> 
> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>   drivers/gpu/drm/drm_mm.c | 28 ++++++++++++----------------
>   include/drm/drm_mm.h     | 32 ++++++++++++++++++++++++++++++++
>   2 files changed, 44 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
> index 8257f9d4f619..416c849c10e5 100644
> --- a/drivers/gpu/drm/drm_mm.c
> +++ b/drivers/gpu/drm/drm_mm.c
> @@ -352,10 +352,10 @@ static struct drm_mm_node *find_hole_addr(struct drm_mm *mm, u64 addr, u64 size)
>   	return node;
>   }
>   
> -static struct drm_mm_node *
> -first_hole(struct drm_mm *mm,
> -	   u64 start, u64 end, u64 size,
> -	   enum drm_mm_insert_mode mode)
> +struct drm_mm_node *
> +drm_mm_first_hole(struct drm_mm *mm,
> +		  u64 start, u64 end, u64 size,
> +		  enum drm_mm_insert_mode mode)
>   {
>   	switch (mode) {
>   	default:
> @@ -374,6 +374,7 @@ first_hole(struct drm_mm *mm,
>   						hole_stack);
>   	}
>   }
> +EXPORT_SYMBOL(drm_mm_first_hole);
>   
>   /**
>    * DECLARE_NEXT_HOLE_ADDR - macro to declare next hole functions
> @@ -410,11 +411,11 @@ static struct drm_mm_node *name(struct drm_mm_node *entry, u64 size)	\
>   DECLARE_NEXT_HOLE_ADDR(next_hole_high_addr, rb_left, rb_right)
>   DECLARE_NEXT_HOLE_ADDR(next_hole_low_addr, rb_right, rb_left)
>   
> -static struct drm_mm_node *
> -next_hole(struct drm_mm *mm,
> -	  struct drm_mm_node *node,
> -	  u64 size,
> -	  enum drm_mm_insert_mode mode)
> +struct drm_mm_node *
> +drm_mm_next_hole(struct drm_mm *mm,
> +		 struct drm_mm_node *node,
> +		 u64 size,
> +		 enum drm_mm_insert_mode mode)
>   {
>   	switch (mode) {
>   	default:
> @@ -432,6 +433,7 @@ next_hole(struct drm_mm *mm,
>   		return &node->hole_stack == &mm->hole_stack ? NULL : node;
>   	}
>   }
> +EXPORT_SYMBOL(drm_mm_next_hole);

May need to add kerneldoc since first/next_hole are now exported, or 
perhaps double underscore them if DRM core allows that approach to kind 
of signify "it is exported by shouldn't really be used"? Question for 
dri-devel I guess.

>   
>   /**
>    * drm_mm_reserve_node - insert an pre-initialized node
> @@ -520,7 +522,6 @@ int drm_mm_insert_node_in_range(struct drm_mm * const mm,
>   {
>   	struct drm_mm_node *hole;
>   	u64 remainder_mask;
> -	bool once;
>   
>   	DRM_MM_BUG_ON(range_start > range_end);
>   
> @@ -533,13 +534,8 @@ int drm_mm_insert_node_in_range(struct drm_mm * const mm,
>   	if (alignment <= 1)
>   		alignment = 0;
>   
> -	once = mode & DRM_MM_INSERT_ONCE;
> -	mode &= ~DRM_MM_INSERT_ONCE;
> -
>   	remainder_mask = is_power_of_2(alignment) ? alignment - 1 : 0;
> -	for (hole = first_hole(mm, range_start, range_end, size, mode);
> -	     hole;
> -	     hole = once ? NULL : next_hole(mm, hole, size, mode)) {
> +	drm_mm_for_each_best_hole(hole, mm, range_start, range_end, size, mode) {
>   		u64 hole_start = __drm_mm_hole_node_start(hole);
>   		u64 hole_end = hole_start + hole->hole_size;
>   		u64 adj_start, adj_end;
> diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
> index ac33ba1b18bc..5055447697fa 100644
> --- a/include/drm/drm_mm.h
> +++ b/include/drm/drm_mm.h
> @@ -322,6 +322,17 @@ static inline u64 __drm_mm_hole_node_end(const struct drm_mm_node *hole_node)
>   	return list_next_entry(hole_node, node_list)->start;
>   }
>   
> +struct drm_mm_node *
> +drm_mm_first_hole(struct drm_mm *mm,
> +		  u64 start, u64 end, u64 size,
> +		  enum drm_mm_insert_mode mode);
> +
> +struct drm_mm_node *
> +drm_mm_next_hole(struct drm_mm *mm,
> +		 struct drm_mm_node *node,
> +		 u64 size,
> +		 enum drm_mm_insert_mode mode);
> +
>   /**
>    * drm_mm_hole_node_end - computes the end of the hole following @node
>    * @hole_node: drm_mm_node which implicitly tracks the following hole
> @@ -400,6 +411,27 @@ static inline u64 drm_mm_hole_node_end(const struct drm_mm_node *hole_node)
>   	     1 : 0; \
>   	     pos = list_next_entry(pos, hole_stack))
>   
> +/**
> + * drm_mm_for_each_best_hole - iterator to optimally walk over all holes >= @size
> + * @pos: &drm_mm_node used internally to track progress
> + * @mm: &drm_mm allocator to walk
> + * @range_start: start of the allowed range for the allocation
> + * @range_end: end of the allowed range for the allocation
> + * @size: size of the allocation
> + * @mode: fine-tune the allocation search
> + *
> + * This iterator walks over all holes suitable for the allocation of given
> + * @size in a very efficient manner. It is implemented by calling
> + * drm_mm_first_hole() and drm_mm_next_hole() which identify the
> + * appropriate holes within the given range by efficently traversing the
> + * rbtree associated with @mm.
> + */
> +#define drm_mm_for_each_best_hole(pos, mm, range_start, range_end, size, mode) \

Probably should not have "best" in the name since the mode is passed in 
by the caller.

> +	for (pos = drm_mm_first_hole(mm, range_start, range_end, size, mode); \
> +	     pos; \
> +	     pos = mode & DRM_MM_INSERT_ONCE ? \
> +	     NULL : drm_mm_next_hole(mm, hole, size, mode))

I think you would need to modify the first/next_hole to mask out 
DRM_MM_INSERT_ONCE, otherwise it probably does not work as it stands.

Regards,

Tvrtko

> +
>   /*
>    * Basic range manager support (drm_mm.c)
>    */
