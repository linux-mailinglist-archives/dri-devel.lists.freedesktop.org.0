Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D181C680B7D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 12:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59BA10E0E4;
	Mon, 30 Jan 2023 11:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D597010E0E4;
 Mon, 30 Jan 2023 11:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675076445; x=1706612445;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4EWa4RYKyKEcFytBU9tDKJCjpK8SXR6KYFs0M251H7Q=;
 b=AS05DUTjIv3JmehZepNwF2EWaRWGHFF1NCCIUOBl83VuZdB4ZF7sLLgY
 2XGE+BhKRVsiFxa9iXczCzMs7G4mRihHc7sEQCbaPl3khzdAKc4BxpWVC
 CztNGyQT8n8D9idqQTbxHsqd/T3OBIYi4jpva/4nToRCmHJA4pIK2ajJ0
 OeTx6JRxmYSzPpxWnDXvq4Ewrzfi0CMcVuSTvkp7qrqqCh4Fdx1IvylOI
 ax4yFT0hCYhD63eG+YyBpG2TYznxC858g4AjT3ojQBtjvygp667HNEZkE
 S7AhRYucZbhHtAosb90/A99OJdZ0rlO5rqIaycqM0iDDOqH3bZ+EZNhnE A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="315489460"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="315489460"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 03:00:45 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="613985084"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="613985084"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.2.187])
 ([10.213.2.187])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 03:00:43 -0800
Message-ID: <e8b475e1-2c5c-ec78-a97c-0dd9df099a21@intel.com>
Date: Mon, 30 Jan 2023 12:00:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 2/6] drm/i915/ttm: audit remaining bo->resource
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230130101230.25347-1-matthew.auld@intel.com>
 <20230130101230.25347-2-matthew.auld@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230130101230.25347-2-matthew.auld@intel.com>
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30.01.2023 11:12, Matthew Auld wrote:
> In the near future TTM will have NULL bo->resource when the object is
> initially created, plus after calling into pipeline-gutting. Try to
> handle the remaining cases. In practice NULL bo->resource should be
> taken to mean swapped-out or purged object.
> 
> References: 516198d317d8 ("drm/i915: audit bo->resource usage v3")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Christian König <ckoenig.leichtzumerken@gmail.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c      | 12 +++++++++---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c |  7 ++++++-
>   drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c   |  7 +++++--
>   3 files changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 4758f21c91e1..4ba1d7862ff9 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -472,7 +472,7 @@ static int i915_ttm_shrink(struct drm_i915_gem_object *obj, unsigned int flags)
>   	struct ttm_placement place = {};
>   	int ret;
>   
> -	if (!bo->ttm || bo->resource->mem_type != TTM_PL_SYSTEM)
> +	if (!bo->ttm || (bo->resource && bo->resource->mem_type != TTM_PL_SYSTEM))
>   		return 0;
>   
>   	GEM_BUG_ON(!i915_tt->is_shmem);
> @@ -511,7 +511,13 @@ static void i915_ttm_delete_mem_notify(struct ttm_buffer_object *bo)
>   {
>   	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>   
> -	if (bo->resource && !i915_ttm_is_ghost_object(bo)) {
> +	/*
> +	 * This gets called twice by ttm, so long as we have a ttm resource or
> +	 * ttm_tt then we can still safely call this. Due to pipeline-gutting,
> +	 * we maybe have NULL bo->resource, but in that case we should always
> +	 * have a ttm alive (like if the pages are swapped out).
> +	 */
> +	if ((bo->resource || bo->ttm) && !i915_ttm_is_ghost_object(bo)) {
>   		__i915_gem_object_pages_fini(obj);
>   		i915_ttm_free_cached_io_rsgt(obj);
>   	}
> @@ -1198,7 +1204,7 @@ static void i915_ttm_unmap_virtual(struct drm_i915_gem_object *obj)
>   
>   	assert_object_held_shared(obj);
>   
> -	if (i915_ttm_cpu_maps_iomem(bo->resource)) {
> +	if (bo->resource && i915_ttm_cpu_maps_iomem(bo->resource)) {

I wonder if i915_ttm_cpu_maps_iomem couldn't handle null resource?


>   		wakeref = intel_runtime_pm_get(&to_i915(obj->base.dev)->runtime_pm);
>   
>   		/* userfault_count is protected by obj lock and rpm wakeref. */
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> index 76dd9e5e1a8b..72953ebadfd8 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> @@ -83,7 +83,8 @@ void i915_ttm_adjust_domains_after_move(struct drm_i915_gem_object *obj)
>   {
>   	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
>   
> -	if (i915_ttm_cpu_maps_iomem(bo->resource) || bo->ttm->caching != ttm_cached) {
> +	if ((bo->resource && i915_ttm_cpu_maps_iomem(bo->resource)) ||
> +	    bo->ttm->caching != ttm_cached) {
>   		obj->write_domain = I915_GEM_DOMAIN_WC;
>   		obj->read_domains = I915_GEM_DOMAIN_WC;
>   	} else {
> @@ -711,6 +712,10 @@ int i915_gem_obj_copy_ttm(struct drm_i915_gem_object *dst,
>   
>   	assert_object_held(dst);
>   	assert_object_held(src);
> +
> +	if (GEM_WARN_ON(!src_bo->resource || !dst_bo->resource))
> +		return -EINVAL;
> +
>   	i915_deps_init(&deps, GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN);
>   
>   	ret = dma_resv_reserve_fences(src_bo->base.resv, 1);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> index 7e67742bc65e..be44e7eed892 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> @@ -53,7 +53,7 @@ static int i915_ttm_backup(struct i915_gem_apply_to_region *apply,
>   	unsigned int flags;
>   	int err = 0;
>   
> -	if (bo->resource->mem_type == I915_PL_SYSTEM || obj->ttm.backup)
> +	if (!bo->resource || bo->resource->mem_type == I915_PL_SYSTEM || obj->ttm.backup)

!i915_ttm_cpu_maps_iomem ?

>   		return 0;
>   
>   	if (pm_apply->allow_gpu && i915_gem_object_evictable(obj))
> @@ -187,7 +187,10 @@ static int i915_ttm_restore(struct i915_gem_apply_to_region *apply,
>   		return err;
>   
>   	/* Content may have been swapped. */
> -	err = ttm_tt_populate(backup_bo->bdev, backup_bo->ttm, &ctx);
> +	if (!backup_bo->resource)
> +		err = ttm_bo_validate(backup_bo, i915_ttm_sys_placement(), &ctx);
> +	if (!err)
> +		err = ttm_tt_populate(backup_bo->bdev, backup_bo->ttm, &ctx);

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej


>   	if (!err) {
>   		err = i915_gem_obj_copy_ttm(obj, backup, pm_apply->allow_gpu,
>   					    false);

