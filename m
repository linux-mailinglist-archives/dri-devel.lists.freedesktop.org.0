Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E6C45E8A5
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 08:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFA96E169;
	Fri, 26 Nov 2021 07:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19016E169
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 07:43:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="235565319"
X-IronPort-AV: E=Sophos;i="5.87,265,1631602800"; d="scan'208";a="235565319"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 23:43:16 -0800
X-IronPort-AV: E=Sophos;i="5.87,265,1631602800"; d="scan'208";a="607769684"
Received: from krchrist-mobl2.ger.corp.intel.com (HELO [10.249.254.153])
 ([10.249.254.153])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 23:43:14 -0800
Message-ID: <62792768-0275-c5c6-a2d3-30bbe388b5cf@linux.intel.com>
Date: Fri, 26 Nov 2021 08:43:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 03/12] drm/ttm: add a weak BO reference to the resource v3
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel@ffwll.ch, ray.huang@amd.com, dri-devel@lists.freedesktop.org
References: <20211124124430.20859-1-christian.koenig@amd.com>
 <20211124124430.20859-4-christian.koenig@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20211124124430.20859-4-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/24/21 13:44, Christian König wrote:
> Keep track for which BO a resource was allocated.
> This is necessary to move the LRU handling into the resources.
>
> A bit problematic is i915 since it tries to use the resource
> interface without a BO which is illegal from the conceptional
> point of view.

s/conceptional/conceptual/ ?

Can't find the i915 workaround below? Was this the mock bo that was used 
in the selftest code, perhaps that was replaced with allowing 
resource->bo to be NULL. In that case the commit message should be updated.

/Thomas.


>
> v2: Document that this is a weak reference and add a workaround for i915
> v3: further document that this is protected by ttm_device::lru_lock and
>      clarify the i915 workaround
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo_util.c  | 7 +++++--
>   drivers/gpu/drm/ttm/ttm_resource.c | 9 +++++++++
>   include/drm/ttm/ttm_resource.h     | 4 ++++
>   3 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 95de2691ee7c..a2e3a9626198 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -237,6 +237,11 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
>   	if (bo->type != ttm_bo_type_sg)
>   		fbo->base.base.resv = &fbo->base.base._resv;
>   
> +	if (fbo->base.resource) {
> +		ttm_resource_set_bo(fbo->base.resource, &fbo->base);
> +		bo->resource = NULL;
> +	}
> +
>   	dma_resv_init(&fbo->base.base._resv);
>   	fbo->base.base.dev = NULL;
>   	ret = dma_resv_trylock(&fbo->base.base._resv);
> @@ -512,7 +517,6 @@ static int ttm_bo_move_to_ghost(struct ttm_buffer_object *bo,
>   		ghost_obj->ttm = NULL;
>   	else
>   		bo->ttm = NULL;
> -	bo->resource = NULL;
>   
>   	dma_resv_unlock(&ghost_obj->base._resv);
>   	ttm_bo_put(ghost_obj);
> @@ -637,7 +641,6 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
>   	dma_resv_unlock(&ghost->base._resv);
>   	ttm_bo_put(ghost);
>   	bo->ttm = ttm;
> -	bo->resource = NULL;
>   	ttm_bo_assign_mem(bo, sys_res);
>   	return 0;
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 41e7bf195168..7fdd58b53c61 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -41,6 +41,7 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>   	res->bus.offset = 0;
>   	res->bus.is_iomem = false;
>   	res->bus.caching = ttm_cached;
> +	res->bo = bo;
>   }
>   EXPORT_SYMBOL(ttm_resource_init);
>   
> @@ -122,6 +123,14 @@ bool ttm_resource_compat(struct ttm_resource *res,
>   }
>   EXPORT_SYMBOL(ttm_resource_compat);
>   
> +void ttm_resource_set_bo(struct ttm_resource *res,
> +			 struct ttm_buffer_object *bo)
> +{
> +	spin_lock(&bo->bdev->lru_lock);
> +	res->bo = bo;
> +	spin_unlock(&bo->bdev->lru_lock);
> +}
> +
>   /**
>    * ttm_resource_manager_init
>    *
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 6bf37383002b..69eea9d6399b 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -161,6 +161,7 @@ struct ttm_bus_placement {
>    * @mem_type: Resource type of the allocation.
>    * @placement: Placement flags.
>    * @bus: Placement on io bus accessible to the CPU
> + * @bo: weak reference to the BO, protected by ttm_device::lru_lock
>    *
>    * Structure indicating the placement and space resources used by a
>    * buffer object.
> @@ -171,6 +172,7 @@ struct ttm_resource {
>   	uint32_t mem_type;
>   	uint32_t placement;
>   	struct ttm_bus_placement bus;
> +	struct ttm_buffer_object *bo;
>   };
>   
>   /**
> @@ -271,6 +273,8 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
>   void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res);
>   bool ttm_resource_compat(struct ttm_resource *res,
>   			 struct ttm_placement *placement);
> +void ttm_resource_set_bo(struct ttm_resource *res,
> +			 struct ttm_buffer_object *bo);
>   
>   void ttm_resource_manager_init(struct ttm_resource_manager *man,
>   			       struct ttm_device *bdev,
