Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3534AB8F7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 11:45:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACEC710F78E;
	Mon,  7 Feb 2022 10:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131F410F78D;
 Mon,  7 Feb 2022 10:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644230736; x=1675766736;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dCjAf4ooCDmGQzc8Fhcove8jD2gfIH5geRF4DiT71xs=;
 b=cDvJVuSlPZHNPyP3BtFHmlpLgPTXO5pVHi6mz5q3V1/VHrRttgTgtnH9
 8LqzVq5kgyDVkRSO4TVuXVWLZaP/WiIjYO+c5E/JS48agg770DPJ3bj3z
 QZTt/PIjfb8dDUDmM4VrSE+1biOzyNY+SR/huhoXrjG/wYhzTv9sYaLcJ
 YayqA/Sqr3POt/2HVjY7Dr01KIfCUor1taxBE5zQEfrPSLLhvkeYkrs6g
 Yo4ThgMvs+7G17UFd5c4oFvpgdqBOJTj1kxAyq0gHgOjwlZWre3ftwCXW
 5uJMOqXRuZp7iPd0XkzMIngrrZ4dhBYxJAF+vzaxMa01iatP5tjOE73YR w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="273209513"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="273209513"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 02:45:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="481544441"
Received: from conroyco-mobl2.ger.corp.intel.com (HELO [10.213.251.21])
 ([10.213.251.21])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 02:45:34 -0800
Message-ID: <94fd5cd5-ecb5-c26f-84d1-13e22c2dcc1a@linux.intel.com>
Date: Mon, 7 Feb 2022 10:45:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] drm/mm: Add an iterator to optimally walk over holes
 for an allocation (v2)
Content-Language: en-US
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org
References: <ed22efe9-4cd8-cf71-beb7-66af7161c518@linux.intel.com>
 <20220204011939.1517070-1-vivek.kasireddy@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220204011939.1517070-1-vivek.kasireddy@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 04/02/2022 01:19, Vivek Kasireddy wrote:
> This iterator relies on drm_mm_first_hole() and drm_mm_next_hole()
> functions to identify suitable holes for an allocation of a given
> size by efficiently traversing the rbtree associated with the given
> allocator.
> 
> It replaces the for loop in drm_mm_insert_node_in_range() and can
> also be used by drm drivers to quickly identify holes of a certain
> size within a given range.
> 
> v2: (Tvrtko)
> - Prepend a double underscore for the newly exported first/next_hole
> - s/each_best_hole/each_suitable_hole/g
> - Mask out DRM_MM_INSERT_ONCE from the mode before calling
>    first/next_hole and elsewhere.
> 
> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>   drivers/gpu/drm/drm_mm.c | 38 ++++++++++++++++++--------------------
>   include/drm/drm_mm.h     | 36 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 54 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
> index 8257f9d4f619..b6da1dffcfcb 100644
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
> +__drm_mm_first_hole(struct drm_mm *mm,
> +		    u64 start, u64 end, u64 size,
> +		    enum drm_mm_insert_mode mode)
>   {
>   	switch (mode) {
>   	default:
> @@ -374,6 +374,7 @@ first_hole(struct drm_mm *mm,
>   						hole_stack);
>   	}
>   }
> +EXPORT_SYMBOL(__drm_mm_first_hole);
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
> +__drm_mm_next_hole(struct drm_mm *mm,
> +		   struct drm_mm_node *node,
> +		   u64 size,
> +		   enum drm_mm_insert_mode mode)
>   {
>   	switch (mode) {
>   	default:
> @@ -432,6 +433,7 @@ next_hole(struct drm_mm *mm,
>   		return &node->hole_stack == &mm->hole_stack ? NULL : node;
>   	}
>   }
> +EXPORT_SYMBOL(__drm_mm_next_hole);
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
> @@ -533,22 +534,19 @@ int drm_mm_insert_node_in_range(struct drm_mm * const mm,
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
> +	drm_mm_for_each_suitable_hole(hole, mm, range_start, range_end,
> +				      size, mode) {
>   		u64 hole_start = __drm_mm_hole_node_start(hole);
>   		u64 hole_end = hole_start + hole->hole_size;
>   		u64 adj_start, adj_end;
>   		u64 col_start, col_end;
> +		enum drm_mm_insert_mode placement = mode & ~DRM_MM_INSERT_ONCE;

Could move outside the loop, but not sure if it matters much.

Could also call the masked out variable mode and the passed in one 
caller_mode, or something, and that way have a smaller diff. (Four 
following hunks wouldn't be there.)

>   
> -		if (mode == DRM_MM_INSERT_LOW && hole_start >= range_end)
> +		if (placement == DRM_MM_INSERT_LOW && hole_start >= range_end)
>   			break;
>   
> -		if (mode == DRM_MM_INSERT_HIGH && hole_end <= range_start)
> +		if (placement == DRM_MM_INSERT_HIGH && hole_end <= range_start)
>   			break;
>   
>   		col_start = hole_start;
> @@ -562,7 +560,7 @@ int drm_mm_insert_node_in_range(struct drm_mm * const mm,
>   		if (adj_end <= adj_start || adj_end - adj_start < size)
>   			continue;
>   
> -		if (mode == DRM_MM_INSERT_HIGH)
> +		if (placement == DRM_MM_INSERT_HIGH)
>   			adj_start = adj_end - size;
>   
>   		if (alignment) {
> @@ -574,7 +572,7 @@ int drm_mm_insert_node_in_range(struct drm_mm * const mm,
>   				div64_u64_rem(adj_start, alignment, &rem);
>   			if (rem) {
>   				adj_start -= rem;
> -				if (mode != DRM_MM_INSERT_HIGH)
> +				if (placement != DRM_MM_INSERT_HIGH)
>   					adj_start += alignment;
>   
>   				if (adj_start < max(col_start, range_start) ||
> diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
> index ac33ba1b18bc..777f659f9692 100644
> --- a/include/drm/drm_mm.h
> +++ b/include/drm/drm_mm.h
> @@ -400,6 +400,42 @@ static inline u64 drm_mm_hole_node_end(const struct drm_mm_node *hole_node)
>   	     1 : 0; \
>   	     pos = list_next_entry(pos, hole_stack))
>   
> +struct drm_mm_node *
> +__drm_mm_first_hole(struct drm_mm *mm,
> +		    u64 start, u64 end, u64 size,
> +		    enum drm_mm_insert_mode mode);
> +
> +struct drm_mm_node *
> +__drm_mm_next_hole(struct drm_mm *mm,
> +		   struct drm_mm_node *node,
> +		   u64 size,
> +		   enum drm_mm_insert_mode mode);
> +
> +/**
> + * drm_mm_for_each_suitable_hole - iterator to optimally walk over all
> + * holes that can fit an allocation of the given @size.
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
> + * appropriate holes within the given range by efficiently traversing the
> + * rbtree associated with @mm.
> + */
> +#define drm_mm_for_each_suitable_hole(pos, mm, range_start, range_end, \
> +				      size, mode) \
> +	for (pos = __drm_mm_first_hole(mm, range_start, range_end, size, \
> +				       mode & ~DRM_MM_INSERT_ONCE); \
> +	     pos; \
> +	     pos = mode & DRM_MM_INSERT_ONCE ? \
> +	     NULL : __drm_mm_next_hole(mm, hole, size, \
> +				       mode & ~DRM_MM_INSERT_ONCE))
> +
>   /*
>    * Basic range manager support (drm_mm.c)
>    */

Nitpicks/bikesheds or not, patch LGTM.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Adding Christian and Das to Cc, by the virtue of being last people 
active in the hole area (!). :)

Regards,

Tvrtko
