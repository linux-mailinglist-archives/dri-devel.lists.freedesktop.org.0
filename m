Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3103B5D17
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 13:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE396E432;
	Mon, 28 Jun 2021 11:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641566E432;
 Mon, 28 Jun 2021 11:21:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10028"; a="207876410"
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="207876410"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 04:21:18 -0700
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="454469636"
Received: from danielmi-mobl2.ger.corp.intel.com (HELO [10.249.254.242])
 ([10.249.254.242])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 04:21:17 -0700
Subject: Re: [PATCH 2/2] drm/ttm, drm/i915: Update ttm_move_memcpy for async
 use
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210624193045.5087-1-thomas.hellstrom@linux.intel.com>
 <20210624193045.5087-3-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ce389058-2ec8-3aa8-b332-ff34705e8b2c@linux.intel.com>
Date: Mon, 28 Jun 2021 13:21:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210624193045.5087-3-thomas.hellstrom@linux.intel.com>
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
Cc: matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/24/21 9:30 PM, Thomas Hellström wrote:
> The buffer object argument to ttm_move_memcpy was only used to
> determine whether the destination memory should be cleared only
> or whether we should copy data. Replace it with a "clear" bool, and
> update the callers.
>
> The intention here is to be able to use ttm_move_memcpy() async under
> a dma-fence as a fallback if an accelerated blit fails in a security-
> critical path where data might leak if the blit is not properly
> performed. For that purpose the bo is an unsuitable argument since
> its relevant members might already have changed at call time.
>
> Finally, update the ttm_move_memcpy kerneldoc that seems to have
> ended up with a stale version.

Hmm,

Not sure where the Cc: Christian König ended up, but in any case 
Christian if you find this patch ok, Ack to merge through drm_intel_gt_next?

/Thomas




>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c |  2 +-
>   drivers/gpu/drm/ttm/ttm_bo_util.c       | 20 ++++++++++----------
>   include/drm/ttm/ttm_bo_driver.h         |  2 +-
>   3 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 4e529adcdfc7..f19847abe856 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -517,7 +517,7 @@ static void __i915_ttm_move(struct ttm_buffer_object *bo, bool clear,
>   						 obj->ttm.cached_io_st,
>   						 src_reg->region.start);
>   
> -		ttm_move_memcpy(bo, dst_mem->num_pages, dst_iter, src_iter);
> +		ttm_move_memcpy(clear, dst_mem->num_pages, dst_iter, src_iter);
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 2f57f824e6db..e3747f069674 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -75,22 +75,21 @@ void ttm_mem_io_free(struct ttm_device *bdev,
>   
>   /**
>    * ttm_move_memcpy - Helper to perform a memcpy ttm move operation.
> - * @bo: The struct ttm_buffer_object.
> - * @new_mem: The struct ttm_resource we're moving to (copy destination).
> - * @new_iter: A struct ttm_kmap_iter representing the destination resource.
> + * @clear: Whether to clear rather than copy.
> + * @num_pages: Number of pages of the operation.
> + * @dst_iter: A struct ttm_kmap_iter representing the destination resource.
>    * @src_iter: A struct ttm_kmap_iter representing the source resource.
>    *
>    * This function is intended to be able to move out async under a
>    * dma-fence if desired.
>    */
> -void ttm_move_memcpy(struct ttm_buffer_object *bo,
> +void ttm_move_memcpy(bool clear,
>   		     u32 num_pages,
>   		     struct ttm_kmap_iter *dst_iter,
>   		     struct ttm_kmap_iter *src_iter)
>   {
>   	const struct ttm_kmap_iter_ops *dst_ops = dst_iter->ops;
>   	const struct ttm_kmap_iter_ops *src_ops = src_iter->ops;
> -	struct ttm_tt *ttm = bo->ttm;
>   	struct dma_buf_map src_map, dst_map;
>   	pgoff_t i;
>   
> @@ -99,10 +98,7 @@ void ttm_move_memcpy(struct ttm_buffer_object *bo,
>   		return;
>   
>   	/* Don't move nonexistent data. Clear destination instead. */
> -	if (src_ops->maps_tt && (!ttm || !ttm_tt_is_populated(ttm))) {
> -		if (ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC))
> -			return;
> -
> +	if (clear) {
>   		for (i = 0; i < num_pages; ++i) {
>   			dst_ops->map_local(dst_iter, &dst_map, i);
>   			if (dst_map.is_iomem)
> @@ -146,6 +142,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>   		struct ttm_kmap_iter_linear_io io;
>   	} _dst_iter, _src_iter;
>   	struct ttm_kmap_iter *dst_iter, *src_iter;
> +	bool clear;
>   	int ret = 0;
>   
>   	if (ttm && ((ttm->page_flags & TTM_PAGE_FLAG_SWAPPED) ||
> @@ -169,7 +166,10 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>   		goto out_src_iter;
>   	}
>   
> -	ttm_move_memcpy(bo, dst_mem->num_pages, dst_iter, src_iter);
> +	clear = src_iter->ops->maps_tt && (!ttm || !ttm_tt_is_populated(ttm));
> +	if (!(clear && ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC)))
> +		ttm_move_memcpy(clear, dst_mem->num_pages, dst_iter, src_iter);
> +
>   	src_copy = *src_mem;
>   	ttm_bo_move_sync_cleanup(bo, dst_mem);
>   
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index 68d6069572aa..5f087575194b 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -322,7 +322,7 @@ int ttm_bo_tt_bind(struct ttm_buffer_object *bo, struct ttm_resource *mem);
>    */
>   void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
>   
> -void ttm_move_memcpy(struct ttm_buffer_object *bo,
> +void ttm_move_memcpy(bool clear,
>   		     u32 num_pages,
>   		     struct ttm_kmap_iter *dst_iter,
>   		     struct ttm_kmap_iter *src_iter);
