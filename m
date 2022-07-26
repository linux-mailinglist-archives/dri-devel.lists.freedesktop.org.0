Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D08E058115A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 12:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A6814A502;
	Tue, 26 Jul 2022 10:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA4018A2EB;
 Tue, 26 Jul 2022 10:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658832097; x=1690368097;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jHZFk/+Ykb15Y5aLVAk7YLb5W9xuHiLms4IfcLqlpQQ=;
 b=GUVsp5tNQGzsTrsbKu7dxM1/YB4fpeGwR0GILtvAhfY39RnHlZ5xouyE
 9AW0VO1K/l+yNICdOkbJozzxdpMhH921Aea7NGR7LwWGfRT9TCQaTycN2
 knnZmGh6NTeNcAEDookq84eqyfgC9ZQGNHFd6XeUFElmOOFztCcyAuEQg
 PswzGANhk4Ee82r0P+tXJnSYf8n4cvSPlW4vLIAbdPgiXBfTUFmtdVRWF
 qFsDdHA2Ioucvq57933WZTWNOws/QZ2HTXyR7QXlIo0fDj3NFyO2rKBOP
 hUDs34OKVpLoU2moyhbw9cp6OQu0+dj3s1fl4i8VjXSF2ws/yLrTB+XNU g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="349622931"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="349622931"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2022 03:41:36 -0700
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="667857204"
Received: from gwolonhu-mobl.gar.corp.intel.com (HELO [10.214.160.8])
 ([10.214.160.8])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2022 03:41:32 -0700
Message-ID: <41eea55c-93d6-6406-d279-0583e17ab56c@intel.com>
Date: Tue, 26 Jul 2022 11:41:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v2 4/6] drm/i915: Implement intersect/compatible functions
Content-Language: en-GB
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20220725114240.4844-1-Arunpravin.PaneerSelvam@amd.com>
 <20220725114240.4844-4-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220725114240.4844-4-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: alexander.deucher@amd.com, luben.tuikov@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/07/2022 12:42, Arunpravin Paneer Selvam wrote:
> Implemented a new intersect and compatible callback function
> fetching start offset from drm buddy allocator.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 43 +++++++++++++++++++
>   1 file changed, 43 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index a5109548abc0..b5801c05bd41 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -178,6 +178,47 @@ static void i915_ttm_buddy_man_free(struct ttm_resource_manager *man,
>   	kfree(bman_res);
>   }
>   
> +static bool i915_ttm_buddy_man_intersect(struct ttm_resource_manager *man,
> +					 struct ttm_resource *res,
> +					 const struct ttm_place *place,
> +					 size_t size)
> +{
> +	struct i915_ttm_buddy_resource *bman_res = to_ttm_buddy_resource(res);
> +	u32 start, num_pages = PFN_UP(size);
> +	struct drm_buddy_block *block;
> +
> +	/* Check each drm buddy block individually */
> +	list_for_each_entry(block, &bman_res->blocks, link) {
> +		start = drm_buddy_block_offset(block) >> PAGE_SHIFT;
> +		/* Don't evict BOs outside of the requested placement range */
> +		if (place->fpfn >= (start + num_pages) ||
> +		    (place->lpfn && place->lpfn <= start))
> +			return false;
> +	}
> +
> +	return true;
> +}

This looks like a nice idea. We should be able to clean up 
i915_ttm_eviction_valuable() a fair bit I think, if we now call 
ttm_bo_eviction_valuable() at the end (like in amdgpu), and move the 
bits that are specific to buddy_man here?

So something like:

if (!place->fpfn && !place->lpfn)
     return true;

if (!place->fpfn &&
     place->lpfn == i915_buddy_man_visible_size(man))
     return bman_res->used_visible_size > 0;

/* Check each drm buddy block individually */
....

> +
> +static bool i915_ttm_buddy_man_compatible(struct ttm_resource_manager *man,
> +					  struct ttm_resource *res,
> +					  const struct ttm_place *place,
> +					  size_t size)

Is it not possible to derive the size from res->num_pages?

> +{
> +	struct i915_ttm_buddy_resource *bman_res = to_ttm_buddy_resource(res);
> +	u32 start, num_pages = PFN_UP(size);
> +	struct drm_buddy_block *block;
> +
> +	/* Check each drm buddy block individually */
> +	list_for_each_entry(block, &bman_res->blocks, link) {
> +		start = drm_buddy_block_offset(block) >> PAGE_SHIFT;
> +		if (start < place->fpfn ||
> +		    (place->lpfn && (start + num_pages) > place->lpfn))
> +			return false;
> +	}

if (!place->fpfn && !place->lpfn)
     return true;

if (!place->fpfn &&
     place->lpfn == i915_buddy_man_visible_size(man))
     return bman_res->used_visible_size == res->num_pages;

/* Check each drm buddy block individually */
...

> +
> +	return true;
> +}
> +
>   static void i915_ttm_buddy_man_debug(struct ttm_resource_manager *man,
>   				     struct drm_printer *printer)
>   {
> @@ -205,6 +246,8 @@ static void i915_ttm_buddy_man_debug(struct ttm_resource_manager *man,
>   static const struct ttm_resource_manager_func i915_ttm_buddy_manager_func = {
>   	.alloc = i915_ttm_buddy_man_alloc,
>   	.free = i915_ttm_buddy_man_free,
> +	.intersect = i915_ttm_buddy_man_intersect,

s/intersect/intersects/ ?

> +	.compatible = i915_ttm_buddy_man_compatible,
>   	.debug = i915_ttm_buddy_man_debug,
>   };
>   
