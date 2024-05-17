Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7D78C86B2
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 14:57:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6117E10EEA3;
	Fri, 17 May 2024 12:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EOVIHPos";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC42110EEA3;
 Fri, 17 May 2024 12:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715950617; x=1747486617;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=a9fnl/yIFrjoa/bdAmlc2jbpoUqM0LMHKif37Uq1AjI=;
 b=EOVIHPosghHGPyskQOGy+ItfqfENHtamOgItesDFO1sAqCyOsKdr6f6/
 GPh8LKDS5Ucq487onT57QrnjPuzDapOkl1kDlTFvqNfC5K0IRCKqVQe2g
 Ou3iCdmSklHOfvKG1D8VRrj8fMJoyESA0NSbuutDPVw85/hl3Ufmxc1mq
 CeAmEj5jSBoSDrjEXWcx6nXUacIzQIAEHKYulEAfl910PO0b6HC6fPzUG
 bA8lek1jBC87Dmr/kojPDjVmGK65AvnHJHmOJHaDPx9UzLXc2N+htzOiJ
 mFI02bWIszwKSHAfvFrG1ubfRsh1U3VAN8sc5r/TrOlNKbxf72BzuVjUJ A==;
X-CSE-ConnectionGUID: FSQ7WDC5S3WmVXPemdBICg==
X-CSE-MsgGUID: q7/W0detRjuea6f35t2zLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="22799291"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="22799291"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 05:56:57 -0700
X-CSE-ConnectionGUID: AUPho43mSyS8KFWEoJ5pKg==
X-CSE-MsgGUID: Kfp1ZWNlR7G0yIL30+TrVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="32329885"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.244.100])
 ([10.245.244.100])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 05:56:56 -0700
Message-ID: <c4bf4921-34b1-48f4-8ca9-9c6c645f4f65@intel.com>
Date: Fri, 17 May 2024 13:56:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/buddy: Merge back blocks in bias range function
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com, airlied@gmail.com
References: <20240517123804.2816-1-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240517123804.2816-1-Arunpravin.PaneerSelvam@amd.com>
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

On 17/05/2024 13:38, Arunpravin Paneer Selvam wrote:
> In bias range allocation, when we don't find the required
> blocks (i.e) on returning the -ENOSPC, we should merge back the
> split blocks. Otherwise, during force_merge we are flooded with
> warn on's due to block and its buddy are in same clear state
> (dirty or clear).
> 
> Hence, renamed the force_merge with merge_blocks and passed a
> force_merge as a bool function parameter. Based on the requirement,
> say, in any normal situation we can call the merge_blocks passing
> the force_merge variable as false. And, in any memory cruch situation,
> we can call the merge_blocks passing the force_merge as true. This
> resolves the unnecessary warn on's thrown during force_merge call.
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Fixes: 96950929eb23 ("drm/buddy: Implement tracking clear page feature")
> ---
>   drivers/gpu/drm/drm_buddy.c | 32 ++++++++++++++++++++++----------
>   1 file changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 1daf778cf6fa..111f602f1359 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -161,10 +161,11 @@ static unsigned int __drm_buddy_free(struct drm_buddy *mm,
>   	return order;
>   }
>   
> -static int __force_merge(struct drm_buddy *mm,
> -			 u64 start,
> -			 u64 end,
> -			 unsigned int min_order)
> +static int __merge_blocks(struct drm_buddy *mm,
> +			  u64 start,
> +			  u64 end,
> +			  unsigned int min_order,
> +			  bool force_merge)
>   {
>   	unsigned int order;
>   	int i;
> @@ -195,8 +196,9 @@ static int __force_merge(struct drm_buddy *mm,
>   			if (!drm_buddy_block_is_free(buddy))
>   				continue;
>   
> -			WARN_ON(drm_buddy_block_is_clear(block) ==
> -				drm_buddy_block_is_clear(buddy));
> +			if (force_merge)
> +				WARN_ON(drm_buddy_block_is_clear(block) ==
> +					drm_buddy_block_is_clear(buddy));
>   
>   			/*
>   			 * If the prev block is same as buddy, don't access the
> @@ -210,7 +212,7 @@ static int __force_merge(struct drm_buddy *mm,
>   			if (drm_buddy_block_is_clear(block))
>   				mm->clear_avail -= drm_buddy_block_size(mm, block);
>   
> -			order = __drm_buddy_free(mm, block, true);
> +			order = __drm_buddy_free(mm, block, force_merge);
>   			if (order >= min_order)
>   				return 0;
>   		}
> @@ -332,7 +334,7 @@ void drm_buddy_fini(struct drm_buddy *mm)
>   
>   	for (i = 0; i < mm->n_roots; ++i) {
>   		order = ilog2(size) - ilog2(mm->chunk_size);
> -		__force_merge(mm, 0, size, order);
> +		__merge_blocks(mm, 0, size, order, true);
>   
>   		WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
>   		drm_block_free(mm, mm->roots[i]);
> @@ -479,7 +481,7 @@ __alloc_range_bias(struct drm_buddy *mm,
>   		   unsigned long flags,
>   		   bool fallback)
>   {
> -	u64 req_size = mm->chunk_size << order;
> +	u64 size, root_size, req_size = mm->chunk_size << order;
>   	struct drm_buddy_block *block;
>   	struct drm_buddy_block *buddy;
>   	LIST_HEAD(dfs);
> @@ -487,6 +489,7 @@ __alloc_range_bias(struct drm_buddy *mm,
>   	int i;
>   
>   	end = end - 1;
> +	size = mm->size;
>   
>   	for (i = 0; i < mm->n_roots; ++i)
>   		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
> @@ -548,6 +551,15 @@ __alloc_range_bias(struct drm_buddy *mm,
>   		list_add(&block->left->tmp_link, &dfs);
>   	} while (1);
>   
> +	/* Merge back the split blocks */
> +	for (i = 0; i < mm->n_roots; ++i) {
> +		order = ilog2(size) - ilog2(mm->chunk_size);
> +		__merge_blocks(mm, start, end, order, false);
> +
> +		root_size = mm->chunk_size << order;
> +		size -= root_size;
> +	}

Hmm, can't we just not split a given block if it is incompatible? Like 
say we are looking for cleared, there is not much point in splitting 
blocks that are dirty on this pass, right?

What about moving the incompatible check earlier like:

if (!fallback && block_incompatible(block)
    continue;

Would that not fix the issue?

> +
>   	return ERR_PTR(-ENOSPC);
>   
>   err_undo:
> @@ -1026,7 +1038,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   			if (order-- == min_order) {
>   				/* Try allocation through force merge method */
>   				if (mm->clear_avail &&
> -				    !__force_merge(mm, start, end, min_order)) {
> +				    !__merge_blocks(mm, start, end, min_order, true)) {
>   					block = __drm_buddy_alloc_blocks(mm, start,
>   									 end,
>   									 min_order,
