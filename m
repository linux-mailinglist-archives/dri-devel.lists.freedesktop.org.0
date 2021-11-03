Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9B54448A6
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 19:51:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED5A7A28E;
	Wed,  3 Nov 2021 18:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C547A28E;
 Wed,  3 Nov 2021 18:51:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="212317892"
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="212317892"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 11:44:38 -0700
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="729739103"
Received: from badunne-mobl5.ger.corp.intel.com (HELO [10.252.16.100])
 ([10.252.16.100])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 11:44:35 -0700
Message-ID: <a5fcbbc3-6c06-d676-3403-1e77a04ddde5@intel.com>
Date: Wed, 3 Nov 2021 18:44:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/8] drm: implement top-down allocation method
Content-Language: en-GB
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20211025130033.1547667-1-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211025130033.1547667-1-Arunpravin.PaneerSelvam@amd.com>
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
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/drm_buddy.c | 42 +++++++++++++++++++++++++++++++------
>   include/drm/drm_buddy.h     |  1 +
>   2 files changed, 37 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 406e3d521903..9d3547bcc5da 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -362,6 +362,27 @@ alloc_range(struct drm_buddy_mm *mm,
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
> +
> +	if (!max_block)
> +		return NULL;
> +
> +	list_for_each_entry(node, head, link) {
> +		if (drm_buddy_block_offset(node) >
> +				drm_buddy_block_offset(max_block))

Alignment.

> +			max_block = node;
> +	}

I suppose there will be pathological cases where this will unnecessarily 
steal the mappable portion? But in practice maybe this is good enough?

> +
> +	return max_block;
> +}
> +
>   static struct drm_buddy_block *
>   alloc_from_freelist(struct drm_buddy_mm *mm,
>   		    unsigned int order,
> @@ -372,13 +393,22 @@ alloc_from_freelist(struct drm_buddy_mm *mm,
>   	int err;
>   
>   	for (i = order; i <= mm->max_order; ++i) {
> -		if (!list_empty(&mm->free_list[i])) {
> -			block = list_first_entry_or_null(&mm->free_list[i],
> -							 struct drm_buddy_block,
> -							 link);
> +		if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
> +			if (!list_empty(&mm->free_list[i])) {

AFAIK no need to keep checking list_empty(), below also.

> +				block = get_maxblock(&mm->free_list[i]);
>   
> -			if (block)
> -				break;
> +				if (block)
> +					break;
> +			}
> +		} else {
> +			if (!list_empty(&mm->free_list[i])) {
> +				block = list_first_entry_or_null(&mm->free_list[i],
> +								 struct drm_buddy_block,
> +								 link);
> +
> +				if (block)
> +					break;
> +			}
>   		}
>   	}
>   
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index c7bb5509a7ad..cd8021d2d6e7 100644
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
