Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAC939EF17
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 08:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E66D6EAB0;
	Tue,  8 Jun 2021 06:56:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655F86EAB1
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 06:56:00 +0000 (UTC)
IronPort-SDR: LmZLupIYSRWWquLdzHJWNmcRwRh8KOltObWr/klZLV0pfL7R9eKMdF6bwnMOixNJ61/3a6mQE1
 hxX2XMDT9koQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="268637942"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="268637942"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 23:55:58 -0700
IronPort-SDR: B1dzXudDSOu9xfwx84Qgj3FKidsgyLzEnrPAsEb6+rxN48ZlbY+TEpjIfu8OlvZaHuTeYqGe1t
 jOg2GZ4vEyYA==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="634974036"
Received: from delmer-mobl.ger.corp.intel.com (HELO [10.249.254.231])
 ([10.249.254.231])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 23:55:56 -0700
Subject: Re: [PATCH 01/10] drm/ttm: allocate resource object instead of
 embedding it v2
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org
References: <20210602100914.46246-1-christian.koenig@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <dbc63965-d96c-1ebe-e198-d110129bf581@linux.intel.com>
Date: Tue, 8 Jun 2021 08:55:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602100914.46246-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/2/21 12:09 PM, Christian König wrote:
> To improve the handling we want the establish the resource object as base
> class for the backend allocations.
>
> v2: add missing error handling
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 54 +++++++-------
>   drivers/gpu/drm/nouveau/nouveau_bo.c       |  2 +-
>   drivers/gpu/drm/radeon/radeon_ttm.c        |  2 +-
>   drivers/gpu/drm/ttm/ttm_bo.c               | 83 ++++++++--------------
>   drivers/gpu/drm/ttm/ttm_bo_util.c          | 43 ++++++-----
>   drivers/gpu/drm/ttm/ttm_resource.c         | 31 +++++---
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  2 +-
>   include/drm/ttm/ttm_bo_api.h               |  1 -
>   include/drm/ttm/ttm_bo_driver.h            | 10 ++-
>   include/drm/ttm/ttm_resource.h             |  4 +-
>   11 files changed, 110 insertions(+), 126 deletions(-)
...
>   
> @@ -629,7 +628,7 @@ static void ttm_bo_move_pipeline_evict(struct ttm_buffer_object *bo,
>   	}
>   	spin_unlock(&from->move_lock);
>   
> -	ttm_resource_free(bo, bo->resource);
> +	ttm_resource_free(bo, &bo->resource);
>   
>   	dma_fence_put(bo->moving);
>   	bo->moving = dma_fence_get(fence);
> @@ -678,11 +677,11 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
>   	if (ret)
>   		ttm_bo_wait(bo, false, false);
>   
> -	ttm_resource_alloc(bo, &sys_mem, bo->resource);
> +	ret = ttm_resource_alloc(bo, &sys_mem, &bo->resource);
>   	bo->ttm = NULL;
>   
>   	dma_resv_unlock(&ghost->base._resv);
>   	ttm_bo_put(ghost);
>   
> -	return 0;
> +	return ret;

Here we re-introduce a late point of failure, which I guess leaves the 
bo in an undefined state? Same thing with my optimization for the idle 
case. Needs fixing as soon as possible.

/Thomas


