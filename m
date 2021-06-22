Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DF83B0102
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 12:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563346E487;
	Tue, 22 Jun 2021 10:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD11B6E0DD;
 Tue, 22 Jun 2021 10:11:39 +0000 (UTC)
IronPort-SDR: 9u1dH1upPunTLO8U3I3mRLDBmIuUAZROY6p9vgqEKZCknoB3bMnfsygG+cpbE7IjJGexQhMGIy
 RVtS7ScNBnzA==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="204016491"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="204016491"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 03:11:26 -0700
IronPort-SDR: plzRNugId5emiyaj6/ElH+gRqbenQHqt3BTdkDxG2+2naX0hcn4xBCUpHFePvdpCjAZcyvL0VD
 wf3HDs0voyUQ==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="623417857"
Received: from clanggaa-mobl1.ger.corp.intel.com (HELO [10.249.254.95])
 ([10.249.254.95])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 03:11:24 -0700
Subject: Re: [PATCH] drm/i915/ttm: consider all placements for the page
 alignment
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210622095843.132549-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <1aeeac85-07d7-b6d5-4253-386801088307@linux.intel.com>
Date: Tue, 22 Jun 2021 12:11:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210622095843.132549-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/22/21 11:58 AM, Matthew Auld wrote:
> Just checking the current region is not enough, if we later migrate the
> object somewhere else. For example if the placements are {SMEM, LMEM},
> then we might get this wrong. Another idea might be to make the
> page_alignment part of the ttm_place, instead of the BO.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 21 ++++++++++++++++++++-
>   1 file changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index c5deb8b7227c..5d894bba6430 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -753,6 +753,25 @@ void i915_ttm_bo_destroy(struct ttm_buffer_object *bo)
>   		call_rcu(&obj->rcu, __i915_gem_free_object_rcu);
>   }
>   
> +static u64 i915_gem_object_page_size(struct drm_i915_gem_object *obj)
> +{
> +	u64 page_size;
> +	int i;
> +
> +	if (!obj->mm.n_placements)
> +		return obj->mm.region->min_page_size;
> +
> +	page_size = 0;
> +	for (i = 0; i < obj->mm.n_placements; i++) {
> +		struct intel_memory_region *mr = obj->mm.placements[i];
> +
> +		page_size = max_t(u64, mr->min_page_size, page_size);
> +	}
> +
> +	GEM_BUG_ON(!page_size);
> +	return page_size;
> +}
> +
>   /**
>    * __i915_gem_ttm_object_init - Initialize a ttm-backed i915 gem object
>    * @mem: The initial memory region for the object.
> @@ -793,7 +812,7 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
>   	obj->base.vma_node.driver_private = i915_gem_to_ttm(obj);
>   	ret = ttm_bo_init(&i915->bdev, i915_gem_to_ttm(obj), size,
>   			  bo_type, &i915_sys_placement,
> -			  mem->min_page_size >> PAGE_SHIFT,
> +			  i915_gem_object_page_size(obj) >> PAGE_SHIFT,

Hmm, can't we just have the buddy manager silently enforce its 
min_page_size?

/Thomas


