Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B02B45D733
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 10:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748BB6EB0C;
	Thu, 25 Nov 2021 09:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5B56EB0A;
 Thu, 25 Nov 2021 09:31:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="234212205"
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; d="scan'208";a="234212205"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 01:31:39 -0800
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; d="scan'208";a="498007659"
Received: from refaase-mobl1.ger.corp.intel.com (HELO [10.249.32.85])
 ([10.249.32.85])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 01:31:38 -0800
Message-ID: <7729c40e-fe4e-853e-06d4-5e39dff17d32@linux.intel.com>
Date: Thu, 25 Nov 2021 10:31:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.0
Subject: Re: [PATCH 1/6] dma-buf: move dma_resv_prune_unlocked into dma_resv.c
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 etnaviv@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211028132630.2330-1-christian.koenig@amd.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211028132630.2330-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
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

On 28-10-2021 15:26, Christian König wrote:
> The i915 driver implements a prune function which is called when it is very
> likely that the fences inside the dma_resv object can be removed because they
> are all signaled.
>
> Move that function into the dma-resv.c code since the behavior of pruning
> fences is something internal to the object.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c                   | 18 ++++++++++++++++++
>  drivers/gpu/drm/i915/Makefile                |  1 -
>  drivers/gpu/drm/i915/dma_resv_utils.c        | 17 -----------------
>  drivers/gpu/drm/i915/dma_resv_utils.h        | 13 -------------
>  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c |  3 +--
>  drivers/gpu/drm/i915/gem/i915_gem_wait.c     |  3 +--
>  include/linux/dma-resv.h                     |  1 +
>  7 files changed, 21 insertions(+), 35 deletions(-)
>  delete mode 100644 drivers/gpu/drm/i915/dma_resv_utils.c
>  delete mode 100644 drivers/gpu/drm/i915/dma_resv_utils.h
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index ff3c0558b3b8..64d4f95778c4 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -324,6 +324,24 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
>  }
>  EXPORT_SYMBOL(dma_resv_add_excl_fence);
>  
> +/**
> + * dma_resv_prune_unlocked - try to remove signaled fences
> + * @obj: The dma_resv object to prune
> + *
> + * Try to lock the object, test if it is signaled and if yes then remove all the
> + * signaled fences.
> + */
> +void dma_resv_prune_unlocked(struct dma_resv *obj)
> +{
> +	if (!dma_resv_trylock(obj))
> +		return;
> +
> +	if (dma_resv_test_signaled(obj, true))
> +		dma_resv_add_excl_fence(obj, NULL);
> +	dma_resv_unlock(obj);
> +}
> +EXPORT_SYMBOL(dma_resv_prune_unlocked);
> +
>  /**
>   * dma_resv_iter_restart_unlocked - restart the unlocked iterator
>   * @cursor: The dma_resv_iter object to restart
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 660bb03de6fc..5c1af130cb6d 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -60,7 +60,6 @@ i915-y += i915_drv.o \
>  
>  # core library code
>  i915-y += \
> -	dma_resv_utils.o \
>  	i915_memcpy.o \
>  	i915_mm.o \
>  	i915_sw_fence.o \
> diff --git a/drivers/gpu/drm/i915/dma_resv_utils.c b/drivers/gpu/drm/i915/dma_resv_utils.c
> deleted file mode 100644
> index 7df91b7e4ca8..000000000000
> --- a/drivers/gpu/drm/i915/dma_resv_utils.c
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -// SPDX-License-Identifier: MIT
> -/*
> - * Copyright © 2020 Intel Corporation
> - */
> -
> -#include <linux/dma-resv.h>
> -
> -#include "dma_resv_utils.h"
> -
> -void dma_resv_prune(struct dma_resv *resv)
> -{
> -	if (dma_resv_trylock(resv)) {
> -		if (dma_resv_test_signaled(resv, true))
> -			dma_resv_add_excl_fence(resv, NULL);
> -		dma_resv_unlock(resv);
> -	}
> -}
> diff --git a/drivers/gpu/drm/i915/dma_resv_utils.h b/drivers/gpu/drm/i915/dma_resv_utils.h
> deleted file mode 100644
> index b9d8fb5f8367..000000000000
> --- a/drivers/gpu/drm/i915/dma_resv_utils.h
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -/* SPDX-License-Identifier: MIT */
> -/*
> - * Copyright © 2020 Intel Corporation
> - */
> -
> -#ifndef DMA_RESV_UTILS_H
> -#define DMA_RESV_UTILS_H
> -
> -struct dma_resv;
> -
> -void dma_resv_prune(struct dma_resv *resv);
> -
> -#endif /* DMA_RESV_UTILS_H */
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> index 5ab136ffdeb2..48029bbda682 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> @@ -15,7 +15,6 @@
>  
>  #include "gt/intel_gt_requests.h"
>  
> -#include "dma_resv_utils.h"
>  #include "i915_trace.h"
>  
>  static bool swap_available(void)
> @@ -229,7 +228,7 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
>  					i915_gem_object_unlock(obj);
>  			}
>  
> -			dma_resv_prune(obj->base.resv);
> +			dma_resv_prune_unlocked(obj->base.resv);
>  
>  			scanned += obj->base.size >> PAGE_SHIFT;
>  skip:
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> index 569658c7859c..1915d203a72d 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> @@ -10,7 +10,6 @@
>  
>  #include "gt/intel_engine.h"
>  
> -#include "dma_resv_utils.h"
>  #include "i915_gem_ioctls.h"
>  #include "i915_gem_object.h"
>  
> @@ -53,7 +52,7 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
>  	 * signaled.
>  	 */
>  	if (timeout > 0)
> -		dma_resv_prune(resv);
> +		dma_resv_prune_unlocked(resv);
>  
>  	return timeout;
>  }
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index eebf04325b34..e0558429a5ee 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -458,6 +458,7 @@ void dma_resv_fini(struct dma_resv *obj);
>  int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
>  void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
>  void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
> +void dma_resv_prune_unlocked(struct dma_resv *obj);
>  int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
>  			unsigned *pshared_count, struct dma_fence ***pshared);
>  int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);

I don't mind adding a dma_resv_prune for locked case, but I don't think unlocked would have benefits.

Furthermore, I'm trying to remove the unlocked versions from i915. Could this be a prereq patch instead?

https://patchwork.freedesktop.org/patch/460722/?series=96115&rev=1

~Maarten

~Maarten

