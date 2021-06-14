Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EA03A6DC0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 19:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B056E15D;
	Mon, 14 Jun 2021 17:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A616E091;
 Mon, 14 Jun 2021 17:55:08 +0000 (UTC)
IronPort-SDR: Z3QnAwU5WIgApGiVIHYf+X1r/Vp19wOtt55gdQnARvUzMTb5tE/XL83dJBhjXAL6vv/IiaOWck
 Xs1oQAlZyv/g==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="205884325"
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="205884325"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 10:55:07 -0700
IronPort-SDR: OdkTgfodYosXjprdpGEfivCkP3/p5RVOX8VRcmyl2D7V6qdXc9K9f7L2QJBl2R4ie/2zj+mEmr
 vBcftT8ajgEg==
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="553434325"
Received: from fnygreen-mobl1.ger.corp.intel.com (HELO [10.249.254.50])
 ([10.249.254.50])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 10:55:06 -0700
Subject: Re: [PATCH v3 10/12] drm/i915/ttm: accelerated move implementation
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ramalingam.c@intel.com
References: <20210614162612.294869-1-thomas.hellstrom@linux.intel.com>
 <20210614162612.294869-11-thomas.hellstrom@linux.intel.com>
Message-ID: <0e309744-4d13-69de-2ad8-ee0df5cd46c1@linux.intel.com>
Date: Mon, 14 Jun 2021 19:55:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614162612.294869-11-thomas.hellstrom@linux.intel.com>
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


On 6/14/21 6:26 PM, Thomas Hellström wrote:
> From: Ramalingam C <ramalingam.c@intel.com>
>
> Invokes the pipelined page migration through blt, for
> i915_ttm_move requests of eviction and also obj clear.
>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> ---
> v2:
>   - subfunction for accel_move (Thomas)
>   - engine_pm_get/put around context_move/clear (Thomas)
>   - Invalidation at accel_clear (Thomas)
> v3:
>   - conflict resolution s/&bo->mem/bo->resource/g
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 87 +++++++++++++++++++++----
>   1 file changed, 74 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index bf33724bed5c..08b72c280cb5 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -15,6 +15,9 @@
>   #include "gem/i915_gem_ttm.h"
>   #include "gem/i915_gem_mman.h"
>   
> +#include "gt/intel_migrate.h"
> +#include "gt/intel_engine_pm.h"
> +
>   #define I915_PL_LMEM0 TTM_PL_PRIV
>   #define I915_PL_SYSTEM TTM_PL_SYSTEM
>   #define I915_PL_STOLEN TTM_PL_VRAM
> @@ -282,6 +285,61 @@ i915_ttm_resource_get_st(struct drm_i915_gem_object *obj,
>   	return intel_region_ttm_node_to_st(obj->mm.region, res);
>   }
>   
> +static int i915_ttm_accel_move(struct ttm_buffer_object *bo,
> +			       struct ttm_resource *dst_mem,
> +			       struct sg_table *dst_st)
> +{
> +	struct drm_i915_private *i915 = container_of(bo->bdev, typeof(*i915),
> +						     bdev);
> +	struct ttm_resource_manager *src_man =
> +		ttm_manager_type(bo->bdev, bo->resource->mem_type);
> +	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
> +	struct sg_table *src_st;
> +	struct i915_request *rq;
> +	int ret;
> +
> +	if (!i915->gt.migrate.context)
> +		return -EINVAL;
> +
> +	if (!bo->ttm || !ttm_tt_is_populated(bo->ttm)) {
> +		if (bo->type == ttm_bo_type_kernel)
> +			return -EINVAL;
> +
> +		if (bo->ttm &&
> +		    !(bo->ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC))
> +			return 0;
> +
> +		intel_engine_pm_get(i915->gt.migrate.context->engine);
> +		ret = intel_context_migrate_clear(i915->gt.migrate.context, NULL,
> +						  dst_st->sgl, I915_CACHE_NONE,
> +						  dst_mem->mem_type >= TTM_PL_PRIV,
Here we should probably use I915_PL_LMEM0 instead of TTM_PL_PRIV, but 
since this test  will replaced by gpu_binds_iomem() in an upcoming 
patch, doesn't matter really.
> +						  0, &rq);
> +
> +		if (!ret && rq) {
> +			i915_request_wait(rq, 0, HZ);
Could be a MAX_SCHEDULE_TIMEOUT here to avoid surprises in case the 
queue to the blitter is getting long?
> +			i915_request_put(rq);
> +		}
> +		intel_engine_pm_put(i915->gt.migrate.context->engine);
> +	} else {
> +		src_st = src_man->use_tt ? i915_ttm_tt_get_st(bo->ttm) :
> +						obj->ttm.cached_io_st;
> +
> +		intel_engine_pm_get(i915->gt.migrate.context->engine);
> +		ret = intel_context_migrate_copy(i915->gt.migrate.context,
> +						 NULL, src_st->sgl, I915_CACHE_NONE,
> +						 bo->resource->mem_type >= TTM_PL_PRIV,
> +						 dst_st->sgl, I915_CACHE_NONE,
> +						 dst_mem->mem_type >= TTM_PL_PRIV, &rq);
> +		if (!ret && rq) {
> +			i915_request_wait(rq, 0, HZ);
Same thing here.


With that fixed,

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


