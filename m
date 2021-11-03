Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F194448D4
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 20:16:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8217A2B7;
	Wed,  3 Nov 2021 19:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361F37A2B4;
 Wed,  3 Nov 2021 19:16:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="292411167"
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="292411167"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 12:16:44 -0700
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="729747081"
Received: from badunne-mobl5.ger.corp.intel.com (HELO [10.252.16.100])
 ([10.252.16.100])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 12:16:41 -0700
Message-ID: <e7a84d81-c069-ad2d-6b40-3e7574d0955a@intel.com>
Date: Wed, 3 Nov 2021 19:16:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 5/8] drm: Implement method to free unused pages
Content-Language: en-GB
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20211025130033.1547667-1-Arunpravin.PaneerSelvam@amd.com>
 <20211025130033.1547667-3-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211025130033.1547667-3-Arunpravin.PaneerSelvam@amd.com>
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

On 25/10/2021 14:00, Arunpravin wrote:
> On contiguous allocation, we round up the size
> to the *next* power of 2, implement a function
> to free the unused pages after the newly allocate block.
> 
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>

Ideally this gets added with some user, so we can see it in action? 
Maybe squash the next patch here?

> ---
>   drivers/gpu/drm/drm_buddy.c | 103 ++++++++++++++++++++++++++++++++++++
>   include/drm/drm_buddy.h     |   4 ++
>   2 files changed, 107 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 9d3547bcc5da..0da8510736eb 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -284,6 +284,109 @@ static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
>   	return s1 <= s2 && e1 >= e2;
>   }
>   
> +/**
> + * drm_buddy_free_unused_pages - free unused pages
> + *
> + * @mm: DRM buddy manager
> + * @actual_size: original size requested
> + * @blocks: output list head to add allocated blocks
> + *
> + * For contiguous allocation, we round up the size to the nearest
> + * power of two value, drivers consume *actual* size, so remaining
> + * portions are unused and it can be freed.
> + *
> + * Returns:
> + * 0 on success, error code on failure.
> + */
> +int drm_buddy_free_unused_pages(struct drm_buddy_mm *mm,

drm_buddy_block_trim?

> +				u64 actual_size,

new_size?

> +				struct list_head *blocks)
> +{
> +	struct drm_buddy_block *block;
> +	struct drm_buddy_block *buddy;
> +	u64 actual_start;
> +	u64 actual_end;
> +	LIST_HEAD(dfs);
> +	u64 count = 0;
> +	int err;
> +
> +	if (!list_is_singular(blocks))
> +		return -EINVAL;
> +
> +	block = list_first_entry_or_null(blocks,
> +					 struct drm_buddy_block,
> +					 link);
> +
> +	if (!block)
> +		return -EINVAL;

list_is_singular() already ensures that I guess?


> +
> +	if (actual_size > drm_buddy_block_size(mm, block))
> +		return -EINVAL;
> +
> +	if (actual_size == drm_buddy_block_size(mm, block))
> +		return 0;

Probably need to check the alignment of the actual_size, and also check 
that it is non-zero?

> +
> +	list_del(&block->link);
> +
> +	actual_start = drm_buddy_block_offset(block);
> +	actual_end = actual_start + actual_size - 1;
> +
> +	if (drm_buddy_block_is_allocated(block))

That should rather be a programmer error.

> +		mark_free(mm, block);
> +
> +	list_add(&block->tmp_link, &dfs);
> +
> +	while (1) {
> +		block = list_first_entry_or_null(&dfs,
> +						 struct drm_buddy_block,
> +						 tmp_link);
> +
> +		if (!block)
> +			break;
> +
> +		list_del(&block->tmp_link);
> +
> +		if (count == actual_size)
> +			return 0;


Check for overlaps somewhere here to avoid needless searching and splitting?

> +
> +		if (contains(actual_start, actual_end, drm_buddy_block_offset(block),
> +			(drm_buddy_block_offset(block) + drm_buddy_block_size(mm, block) - 1))) {

Could maybe record the start/end for better readability?

> +			BUG_ON(!drm_buddy_block_is_free(block));
> +
> +			/* Allocate only required blocks */
> +			mark_allocated(block);
> +			mm->avail -= drm_buddy_block_size(mm, block);
> +			list_add_tail(&block->link, blocks);
> +			count += drm_buddy_block_size(mm, block);
> +			continue;
> +		}
> +
> +		if (drm_buddy_block_order(block) == 0)
> +			continue;

Should be impossible with overlaps check added.

> +
> +		if (!drm_buddy_block_is_split(block)) {

That should always be true.

> +			err = split_block(mm, block);
> +
> +			if (unlikely(err))
> +				goto err_undo;
> +		}
> +
> +		list_add(&block->right->tmp_link, &dfs);
> +		list_add(&block->left->tmp_link, &dfs);
> +	}
> +
> +	return -ENOSPC;


Would it make sense to factor out part of the alloc_range for this? It 
looks roughly the same.

> +
> +err_undo:
> +	buddy = get_buddy(block);
> +	if (buddy &&
> +	    (drm_buddy_block_is_free(block) &&
> +	     drm_buddy_block_is_free(buddy)))
> +		__drm_buddy_free(mm, block);
> +	return err;


Where do we add the block back to the original list? Did we not just 
leak it?


> +}
> +EXPORT_SYMBOL(drm_buddy_free_unused_pages);
> +
>   static struct drm_buddy_block *
>   alloc_range(struct drm_buddy_mm *mm,
>   	    u64 start, u64 end,
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index cd8021d2d6e7..1dfc80c88e1f 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -145,6 +145,10 @@ int drm_buddy_alloc(struct drm_buddy_mm *mm,
>   		    struct list_head *blocks,
>   		    unsigned long flags);
>   
> +int drm_buddy_free_unused_pages(struct drm_buddy_mm *mm,
> +				u64 actual_size,
> +				struct list_head *blocks);
> +
>   void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block);
>   
>   void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects);
> 
