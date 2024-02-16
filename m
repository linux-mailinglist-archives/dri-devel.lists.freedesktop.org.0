Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11833857C79
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 13:23:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8086110E2E0;
	Fri, 16 Feb 2024 12:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TLohVyJg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C0910E2E0;
 Fri, 16 Feb 2024 12:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708086216; x=1739622216;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GVz4vskNutUmwAIAsWOWy6Lj3SbNewc+xr4L2WeQE6A=;
 b=TLohVyJgMHn0nzR1o1pv/Rt1K+orUneASFr08DTkbSlV+uBgcokbfha5
 RrsuuJjLGwYqUlVfLcSWXbbvgJXgCJnwBlp1rAOVdbiIp5NFne4RD1fgc
 BOZ8Xs/odb8qQFuTHt9NqksUyFPphxGsRCNL3kx+f/jXAeQJnUIRsfsv8
 bXavOD+Rl8ooCahOfuHZ9bKpht/+ELA9fSnV8PCzGPOoD4tK8WM1fU1zq
 j1KxQsqqRAVbaidOmCGZcr+yRvVOdp9PkunLoMQeDmxz04SKGXtJKpA5Z
 uoGaVLs/HpNYgRlS2mQKimUuK+BLXtAqbsuRLWEByP9v8SOvBmfTsQCsl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2362365"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2362365"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 04:23:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="4144135"
Received: from fcrowe-mobl2.ger.corp.intel.com (HELO [10.252.21.243])
 ([10.252.21.243])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 04:23:32 -0800
Message-ID: <af43196c-d926-454b-8914-c5753f5d3799@intel.com>
Date: Fri, 16 Feb 2024 12:23:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] drm/buddy: Add defragmentation support
Content-Language: en-GB
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 felix.kuehling@amd.com, mario.limonciello@amd.com
References: <20240208155000.339325-1-Arunpravin.PaneerSelvam@amd.com>
 <20240208155000.339325-3-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240208155000.339325-3-Arunpravin.PaneerSelvam@amd.com>
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

On 08/02/2024 15:50, Arunpravin Paneer Selvam wrote:
> Add a function to support defragmentation.
> 
> v1: Defragment the memory beginning from min_order
>      till the required memory space is available.
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/drm_buddy.c | 67 +++++++++++++++++++++++++++++++------
>   include/drm/drm_buddy.h     |  3 ++

No users?

>   2 files changed, 59 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 33ad0cfbd54c..fac423d2cb73 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -276,10 +276,12 @@ drm_get_buddy(struct drm_buddy_block *block)
>   }
>   EXPORT_SYMBOL(drm_get_buddy);
>   
> -static void __drm_buddy_free(struct drm_buddy *mm,
> -			     struct drm_buddy_block *block)
> +static unsigned int __drm_buddy_free(struct drm_buddy *mm,
> +				     struct drm_buddy_block *block,
> +				     bool defrag)
>   {
>   	struct drm_buddy_block *parent;
> +	unsigned int order;
>   
>   	while ((parent = block->parent)) {
>   		struct drm_buddy_block *buddy;
> @@ -289,12 +291,14 @@ static void __drm_buddy_free(struct drm_buddy *mm,
>   		if (!drm_buddy_block_is_free(buddy))
>   			break;
>   
> -		if (drm_buddy_block_is_clear(block) !=
> -		    drm_buddy_block_is_clear(buddy))
> -			break;
> +		if (!defrag) {
> +			if (drm_buddy_block_is_clear(block) !=
> +			    drm_buddy_block_is_clear(buddy))
> +				break;
>   
> -		if (drm_buddy_block_is_clear(block))
> -			mark_cleared(parent);
> +			if (drm_buddy_block_is_clear(block))
> +				mark_cleared(parent);
> +		}

Maybe check if the two blocks are incompatible and chuck a warn if they 
are not? Main thing is not to hide issues with split blocks that should 
have been merged before.

>   
>   		list_del(&buddy->link);
>   
> @@ -304,8 +308,49 @@ static void __drm_buddy_free(struct drm_buddy *mm,
>   		block = parent;
>   	}
>   
> +	order = drm_buddy_block_order(block);
>   	mark_free(mm, block);
> +
> +	return order;
> +}
> +
> +/**
> + * drm_buddy_defrag - Defragmentation routine
> + *
> + * @mm: DRM buddy manager
> + * @min_order: minimum order in the freelist to begin
> + * the defragmentation process
> + *
> + * Driver calls the defragmentation function when the
> + * requested memory allocation returns -ENOSPC.
> + */
> +void drm_buddy_defrag(struct drm_buddy *mm,
> +		      unsigned int min_order)

Just wondering if we need "full defag" also? We would probably need to 
call this at fini() anyway.

> +{
> +	struct drm_buddy_block *block;
> +	struct list_head *list;
> +	unsigned int order;
> +	int i;
> +
> +	if (min_order > mm->max_order)
> +		return;
> +
> +	for (i = min_order - 1; i >= 0; i--) {

Need to be careful with min_order = 0 ?

> +		list = &mm->free_list[i];
> +		if (list_empty(list))
> +			continue;
> +
> +		list_for_each_entry_reverse(block, list, link) {

Don't we need the safe_reverse() variant here, since this is removing 
from the list?

> +			if (!block->parent)
> +				continue;
> +
> +			order = __drm_buddy_free(mm, block, 1);
> +			if (order >= min_order)
> +				return;
> +		}
> +	}
>   }
> +EXPORT_SYMBOL(drm_buddy_defrag);
>   
>   /**
>    * drm_buddy_free_block - free a block
> @@ -321,7 +366,7 @@ void drm_buddy_free_block(struct drm_buddy *mm,
>   	if (drm_buddy_block_is_clear(block))
>   		mm->clear_avail += drm_buddy_block_size(mm, block);
>   
> -	__drm_buddy_free(mm, block);
> +	__drm_buddy_free(mm, block, 0);
>   }
>   EXPORT_SYMBOL(drm_buddy_free_block);
>   
> @@ -470,7 +515,7 @@ __alloc_range_bias(struct drm_buddy *mm,
>   	if (buddy &&
>   	    (drm_buddy_block_is_free(block) &&
>   	     drm_buddy_block_is_free(buddy)))
> -		__drm_buddy_free(mm, block);
> +		__drm_buddy_free(mm, block, 0);
>   	return ERR_PTR(err);
>   }
>   
> @@ -588,7 +633,7 @@ alloc_from_freelist(struct drm_buddy *mm,
>   
>   err_undo:
>   	if (tmp != order)
> -		__drm_buddy_free(mm, block);
> +		__drm_buddy_free(mm, block, 0);
>   	return ERR_PTR(err);
>   }
>   
> @@ -668,7 +713,7 @@ static int __alloc_range(struct drm_buddy *mm,
>   	if (buddy &&
>   	    (drm_buddy_block_is_free(block) &&
>   	     drm_buddy_block_is_free(buddy)))
> -		__drm_buddy_free(mm, block);
> +		__drm_buddy_free(mm, block, 0);
>   
>   err_free:
>   	if (err == -ENOSPC && total_allocated_on_err) {
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index d81c596dfa38..d0f63e7b5915 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -166,6 +166,9 @@ void drm_buddy_free_list(struct drm_buddy *mm,
>   			 struct list_head *objects,
>   			 unsigned int flags);
>   
> +void drm_buddy_defrag(struct drm_buddy *mm,
> +		      unsigned int min_order);
> +
>   void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p);
>   void drm_buddy_block_print(struct drm_buddy *mm,
>   			   struct drm_buddy_block *block,
