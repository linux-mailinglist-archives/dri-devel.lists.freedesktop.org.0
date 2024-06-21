Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4A0912ADA
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 18:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE00110F2A2;
	Fri, 21 Jun 2024 16:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OtiqxUr5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4002010F2A1;
 Fri, 21 Jun 2024 16:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718985995; x=1750521995;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lhVLrxV8fqEKBguecDtyTVRfIS4719nPBQuhGAfIh3g=;
 b=OtiqxUr5QMFSt1dVYXlnSG+YmqAxgFXadcQvAo23psuepnJRI9+JrExz
 OFITJRFE7FH9dNS9p/N6MkoCr+/Zy2f2ZDqoF9OQeTPtq2LY3MN6tODIC
 gNwb+xIsa5DWXCxX7RyWMRuINTthCYL1Xc3Owcwo9FINPCvnz/PSUX871
 thFJgNQHnAc886l/i1mPavaTaCjuZ63wYONZR2yPo0RWIF6MiMFCYaQlg
 BMxyLXTXVQ2CordAxaANPiK49bNeiysgwOj/hwxO95XaDe8eYSR336Js6
 FPkSzMMR7foXiW1Afp6nRkv8DH0PrNZkWE6ARVACmqhcVNTCmygStleVh Q==;
X-CSE-ConnectionGUID: C8D6glxzS3+vRLSfShnaWA==
X-CSE-MsgGUID: 2n0k0rEvT9OOmw5rxWRDGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="15903499"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="15903499"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 09:06:35 -0700
X-CSE-ConnectionGUID: YYZtwhz0QjSKXbQOPh44Aw==
X-CSE-MsgGUID: xpUIo+dbS2m3gNXXXVZN1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="47079352"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.244.53])
 ([10.245.244.53])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 09:06:33 -0700
Message-ID: <124e374f-7e98-428b-8ad6-f9a038840cb7@intel.com>
Date: Fri, 21 Jun 2024 17:06:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/buddy: Add start address support to trim function
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com, frank.min@amd.com
References: <20240621052909.450539-1-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240621052909.450539-1-Arunpravin.PaneerSelvam@amd.com>
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

Hi,

On 21/06/2024 06:29, Arunpravin Paneer Selvam wrote:
> - Add a new start parameter in trim function to specify exact
>    address from where to start the trimming. This would help us
>    in situations like if drivers would like to do address alignment
>    for specific requirements.
> 
> - Add a new flag DRM_BUDDY_TRIM_DISABLE. Drivers can use this
>    flag to disable the allocator trimming part. This patch enables
>    the drivers control trimming and they can do it themselves
>    based on the application requirements.
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/drm_buddy.c          | 22 ++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  2 +-
>   include/drm/drm_buddy.h              |  2 ++
>   3 files changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 6a8e45e9d0ec..287b6acb1637 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -851,6 +851,7 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
>    * drm_buddy_block_trim - free unused pages
>    *
>    * @mm: DRM buddy manager
> + * @start: start address to begin the trimming.
>    * @new_size: original size requested
>    * @blocks: Input and output list of allocated blocks.
>    * MUST contain single block as input to be trimmed.
> @@ -866,11 +867,13 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
>    * 0 on success, error code on failure.
>    */
>   int drm_buddy_block_trim(struct drm_buddy *mm,
> +			 u64 *start,

I guess just wondering if this should be offset within or address. If it 
offset then zero be the valid default giving the existing behaviour. But 
hard to say without seeing the user for this. Are there some more 
patches to give some context for this usecase?

>   			 u64 new_size,
>   			 struct list_head *blocks)
>   {
>   	struct drm_buddy_block *parent;
>   	struct drm_buddy_block *block;
> +	u64 block_start, block_end;
>   	LIST_HEAD(dfs);
>   	u64 new_start;
>   	int err;
> @@ -882,6 +885,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>   				 struct drm_buddy_block,
>   				 link);
>   
> +	block_start = drm_buddy_block_offset(block);
> +	block_end = block_start + drm_buddy_block_size(mm, block) - 1;
> +
>   	if (WARN_ON(!drm_buddy_block_is_allocated(block)))
>   		return -EINVAL;
>   
> @@ -894,6 +900,17 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>   	if (new_size == drm_buddy_block_size(mm, block))
>   		return 0;
>   
> +	new_start = block_start;
> +	if (start) {
> +		new_start = *start;
> +
> +		if (new_start < block_start)
> +			return -EINVAL;

In addition should check that the alignment of new_start is at least 
compatible with the min chunk_size. Otherwise I think bad stuff can happen.

> +
> +		if ((new_start + new_size) > block_end)

range_overflows() ?

> +			return -EINVAL;
> +	}
> +
>   	list_del(&block->link);
>   	mark_free(mm, block);
>   	mm->avail += drm_buddy_block_size(mm, block);
> @@ -904,7 +921,6 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>   	parent = block->parent;
>   	block->parent = NULL;
>   
> -	new_start = drm_buddy_block_offset(block);
>   	list_add(&block->tmp_link, &dfs);
>   	err =  __alloc_range(mm, &dfs, new_start, new_size, blocks, NULL);
>   	if (err) {
> @@ -1066,7 +1082,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   	} while (1);
>   
>   	/* Trim the allocated block to the required size */
> -	if (original_size != size) {
> +	if (!(flags & DRM_BUDDY_TRIM_DISABLE) &&
> +	    original_size != size) {
>   		struct list_head *trim_list;
>   		LIST_HEAD(temp);
>   		u64 trim_size;
> @@ -1083,6 +1100,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   		}
>   
>   		drm_buddy_block_trim(mm,
> +				     NULL,
>   				     trim_size,
>   				     trim_list);
>   
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index fe3779fdba2c..423b261ea743 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -150,7 +150,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>   	} while (remaining_size);
>   
>   	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> -		if (!drm_buddy_block_trim(mm, vres->base.size, &vres->blocks))
> +		if (!drm_buddy_block_trim(mm, NULL, vres->base.size, &vres->blocks))
>   			size = vres->base.size;
>   	}
>   
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index 2a74fa9d0ce5..9689a7c5dd36 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -27,6 +27,7 @@
>   #define DRM_BUDDY_CONTIGUOUS_ALLOCATION		BIT(2)
>   #define DRM_BUDDY_CLEAR_ALLOCATION		BIT(3)
>   #define DRM_BUDDY_CLEARED			BIT(4)
> +#define DRM_BUDDY_TRIM_DISABLE			BIT(5)
>   
>   struct drm_buddy_block {
>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
> @@ -155,6 +156,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   			   unsigned long flags);
>   
>   int drm_buddy_block_trim(struct drm_buddy *mm,
> +			 u64 *start,
>   			 u64 new_size,
>   			 struct list_head *blocks);
>   
