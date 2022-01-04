Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33693484316
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 15:11:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A1510E508;
	Tue,  4 Jan 2022 14:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB8710E508;
 Tue,  4 Jan 2022 14:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641305495; x=1672841495;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=n98qdxgkm3Djsqc0LoAr83StfeGmWOx8NnOWUystr+E=;
 b=MVS3DR1wyJPDKxWzo35GtcgkKu9KMsk5fAYlscxmwnsPSzgZutqJMlsQ
 OiUTQ4gZ/Qv0ntWgIm5NWB52PtsqqP1L9jq3IWfJPNToV0kRD3ETp70wX
 yTUIIc5c3uurkneWnPzHsB/B8I456SXOHusXvPIi85j6xZ+g5JafDWX0L
 E8W9TBRDZalY5ZWqf3thW6NqA8+TkqvQxO3mGBXyuOqnZ1kNM1WLQdSPP
 WwM3wellYlNb4u3yA/Ay32WB0GeNVPDFF0mCSz5eWjoPYkVZAI5CsYfJw
 kbUp17BjqoWlwdrgJankHF9wO1w90N0EGDJ6N4aZrnI3W3pAub3dORZNh Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="229047510"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="229047510"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 06:11:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="762830584"
Received: from pcseow-mobl1.gar.corp.intel.com (HELO [10.213.153.37])
 ([10.213.153.37])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 06:11:29 -0800
Message-ID: <9350846b-26bb-cfd6-6c9e-af109ad8b7bb@intel.com>
Date: Tue, 4 Jan 2022 14:11:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 4/6] drm: implement a method to free unused pages
Content-Language: en-GB
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20211226222425.544863-1-Arunpravin.PaneerSelvam@amd.com>
 <20211226222425.544863-4-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211226222425.544863-4-Arunpravin.PaneerSelvam@amd.com>
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

On 26/12/2021 22:24, Arunpravin wrote:
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
>       - add free unused pages support to i915 driver
>    - lock drm_buddy_block_trim() function as it calls mark_free/mark_split
>      are all globally visible
> 
> v3(Matthew Auld):
>    - remove trim method error handling as we address the failure case
>      at drm_buddy_block_trim() function
> 
> v4:
>    - in case of trim, at __alloc_range() split_block failure path
>      marks the block as free and removes it from the original list,
>      potentially also freeing it, to overcome this problem, we turn
>      the drm_buddy_block_trim() input node into a temporary node to
>      prevent recursively freeing itself, but still retain the
>      un-splitting/freeing of the other nodes(Matthew Auld)
> 
>    - modify the drm_buddy_block_trim() function return type
> 
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/drm_buddy.c                   | 61 +++++++++++++++++++
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  8 +++
>   include/drm/drm_buddy.h                       |  4 ++
>   3 files changed, 73 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index eddc1eeda02e..855afcaf7edd 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -538,6 +538,67 @@ static int __drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>   	return __alloc_range(mm, &dfs, start, size, blocks);
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
> + */
> +void drm_buddy_block_trim(struct drm_buddy_mm *mm,
> +			  u64 new_size,
> +			  struct list_head *blocks)

It might be better to just return the error, and let the user decide if 
they want to ignore it? Also we might want some kind of unit test for 
this, so having an actual return value might be useful there.

> +{
> +	struct drm_buddy_block *parent;
> +	struct drm_buddy_block *block;
> +	LIST_HEAD(dfs);
> +	u64 new_start;
> +	int err;
> +
> +	if (!list_is_singular(blocks))
> +		return;
> +
> +	block = list_first_entry(blocks,
> +				 struct drm_buddy_block,
> +				 link);
> +
> +	if (!drm_buddy_block_is_allocated(block))
> +		return;
> +
> +	if (new_size > drm_buddy_block_size(mm, block))
> +		return;
> +
> +	if (!new_size && !IS_ALIGNED(new_size, mm->chunk_size))
> +		return;
> +
> +	if (new_size == drm_buddy_block_size(mm, block))
> +		return;
> +
> +	list_del(&block->link);
> +	mark_free(mm, block);
> +	mm->avail += drm_buddy_block_size(mm, block);
> +
> +	/* Prevent recursively freeing this node */
> +	parent = block->parent;
> +	block->parent = NULL;
> +
> +	new_start = drm_buddy_block_offset(block);
> +	list_add(&block->tmp_link, &dfs);
> +	err =  __alloc_range(mm, &dfs, new_start, new_size, blocks);
> +	if (err) {
> +		mark_allocated(block);
> +		mm->avail -= drm_buddy_block_size(mm, block);
> +		list_add(&block->link, blocks);
> +	}
> +
> +	block->parent = parent;
> +}
> +EXPORT_SYMBOL(drm_buddy_block_trim);
> +
>   /**
>    * drm_buddy_alloc - allocate power-of-two blocks
>    *
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index 7c58efb60dba..05f924f32e96 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -97,6 +97,14 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   	if (unlikely(err))
>   		goto err_free_blocks;
>   
> +	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +		mutex_lock(&bman->lock);
> +		drm_buddy_block_trim(mm,
> +				(u64)n_pages << PAGE_SHIFT,

AFAIK, n_pages has already been rounded up to the next power-of-two 
here, so this becomes a noop. I assume we need to use the "original" 
size here?

> +				&bman_res->blocks);
> +		mutex_unlock(&bman->lock);
> +	}
> +
>   	*res = &bman_res->base;
>   	return 0;
>   
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index f573b02304f4..703866a87939 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -146,6 +146,10 @@ int drm_buddy_alloc(struct drm_buddy_mm *mm,
>   		    struct list_head *blocks,
>   		    unsigned long flags);
>   
> +void drm_buddy_block_trim(struct drm_buddy_mm *mm,
> +			  u64 new_size,
> +			  struct list_head *blocks);
> +
>   void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block);
>   
>   void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects);
> 
