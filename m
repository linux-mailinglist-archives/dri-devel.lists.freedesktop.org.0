Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AEF5E5E87
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 11:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B05210E3E8;
	Thu, 22 Sep 2022 09:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5910010E3E8;
 Thu, 22 Sep 2022 09:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663838784; x=1695374784;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=A1vMP+zUC0HIP09xd0WR1cvs4lKMAnqbZSRXvqwbTdk=;
 b=TYjDEHZozfy9WLK8KJtHAVbfxYKkwngYmKS2cqMEQPMqI9gjgKZGSrXf
 3eXrSZxHkdCe4w5GBSs5o9UubZyGS8yjwMttA17vllo7lCt3JjYnlLaQH
 FwBoN2LS+35pA2GbacBTBIEg4nriyILLWwDx8bDCAKx79/KpNwytjkPQr
 WMaJRj2iP7XxrgqLS1bK2OPOFNpohIuVrWEeaa218b5U14IAKIRtURsVb
 MQGgLuY8yoMBGx+UpYfjUmt38xb6i6OoLh34aJJ/ClZhFt78qbN+/W6uw
 M1EmcPqQ2HZvZ49zqBzUfYwv/UeLa61ABV5C6zGZOn816+OixujE4VSqC A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="301658323"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="301658323"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 02:26:23 -0700
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="723586383"
Received: from akoska-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.36.156])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 02:26:20 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC v4 02/14] drm/i915/vm_bind: Add
 __i915_sw_fence_await_reservation()
In-Reply-To: <20220921070945.27764-3-niranjana.vishwanathapura@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220921070945.27764-1-niranjana.vishwanathapura@intel.com>
 <20220921070945.27764-3-niranjana.vishwanathapura@intel.com>
Date: Thu, 22 Sep 2022 12:26:02 +0300
Message-ID: <87fsgj7ob9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 lionel.g.landwerlin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, jason@jlekstrand.net, daniel.vetter@intel.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 21 Sep 2022, Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com> wrote:
> Add function __i915_sw_fence_await_reservation() for
> asynchronous wait on a dma-resv object with specified
> dma_resv_usage. This is required for async vma unbind
> with vm_bind.
>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_sw_fence.c | 25 ++++++++++++++++++-------
>  drivers/gpu/drm/i915/i915_sw_fence.h |  7 ++++++-
>  2 files changed, 24 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
> index 6fc0d1b89690..0ce8f4efc1ed 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence.c
> +++ b/drivers/gpu/drm/i915/i915_sw_fence.c
> @@ -569,12 +569,11 @@ int __i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
>  	return ret;
>  }
>  
> -int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
> -				    struct dma_resv *resv,
> -				    const struct dma_fence_ops *exclude,
> -				    bool write,
> -				    unsigned long timeout,
> -				    gfp_t gfp)
> +int __i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
> +				      struct dma_resv *resv,
> +				      enum dma_resv_usage usage,
> +				      unsigned long timeout,
> +				      gfp_t gfp)
>  {
>  	struct dma_resv_iter cursor;
>  	struct dma_fence *f;
> @@ -583,7 +582,7 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
>  	debug_fence_assert(fence);
>  	might_sleep_if(gfpflags_allow_blocking(gfp));
>  
> -	dma_resv_iter_begin(&cursor, resv, dma_resv_usage_rw(write));
> +	dma_resv_iter_begin(&cursor, resv, usage);
>  	dma_resv_for_each_fence_unlocked(&cursor, f) {
>  		pending = i915_sw_fence_await_dma_fence(fence, f, timeout,
>  							gfp);
> @@ -598,6 +597,18 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
>  	return ret;
>  }
>  
> +int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
> +				    struct dma_resv *resv,
> +				    const struct dma_fence_ops *exclude,
> +				    bool write,
> +				    unsigned long timeout,
> +				    gfp_t gfp)
> +{
> +	return __i915_sw_fence_await_reservation(fence, resv,
> +						 dma_resv_usage_rw(write),
> +						 timeout, gfp);
> +}
> +
>  #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>  #include "selftests/lib_sw_fence.c"
>  #include "selftests/i915_sw_fence.c"
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.h b/drivers/gpu/drm/i915/i915_sw_fence.h
> index 619fc5a22f0c..3cf4b6e16f35 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence.h
> +++ b/drivers/gpu/drm/i915/i915_sw_fence.h
> @@ -10,13 +10,13 @@
>  #define _I915_SW_FENCE_H_
>  
>  #include <linux/dma-fence.h>
> +#include <linux/dma-resv.h>

As a GCC extension you can drop this and forward declare enum
dma_resv_usage. We use it extensively.

>  #include <linux/gfp.h>
>  #include <linux/kref.h>
>  #include <linux/notifier.h> /* for NOTIFY_DONE */
>  #include <linux/wait.h>
>  
>  struct completion;
> -struct dma_resv;
>  struct i915_sw_fence;
>  
>  enum i915_sw_fence_notify {
> @@ -89,6 +89,11 @@ int i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
>  				  unsigned long timeout,
>  				  gfp_t gfp);
>  
> +int __i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
> +				      struct dma_resv *resv,
> +				      enum dma_resv_usage usage,
> +				      unsigned long timeout,
> +				      gfp_t gfp);
>  int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
>  				    struct dma_resv *resv,
>  				    const struct dma_fence_ops *exclude,

-- 
Jani Nikula, Intel Open Source Graphics Center
