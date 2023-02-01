Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBE3686C9A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 18:16:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B7110E435;
	Wed,  1 Feb 2023 17:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3CD10E435;
 Wed,  1 Feb 2023 17:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675271784; x=1706807784;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ojJ+SgByvIQwL5Qlxvkf0TN6HmKtGWxJaqapdG3lBwA=;
 b=kwnI5v35frOxCpYTbbxXOYPw35O2+PPash+FSgJmUBiKOyjxWFySKijA
 QwWRNdh3+6gF9IjPsq9rCbJPH239fTABzO4FFPSluYI8eZBixyWRMtvDr
 G0sNfPUEC5fSKyKSGsgk9nnEEX1N7tbWk8v6W5x/lyzpgciVDddEmGiBE
 OhKLD8c7mGtNTLutGenhjzLUP6b/NVp09FnxqB9wNtY89tUqtVTrmX540
 G5rJX+wX4+6Ubz6XyQLhvmkTq2PpfceO4XaFfWriu0mcz102QWk9slSJQ
 zcf16LbZ9mDRFKpSRsna31VX8lg+GNlHRNsp6gmECeQWvtZW3IxUTRv1M Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="316204683"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="316204683"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 09:14:18 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="773494663"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="773494663"
Received: from grimpe-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.34.30])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 09:14:14 -0800
Date: Wed, 1 Feb 2023 18:14:11 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH v10 02/23] drm/i915/vm_bind: Add
 __i915_sw_fence_await_reservation()
Message-ID: <Y9qd4xISnNLyqB5A@ashyti-mobl2.lan>
References: <20230118071609.17572-1-niranjana.vishwanathapura@intel.com>
 <20230118071609.17572-3-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118071609.17572-3-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com,
 lionel.g.landwerlin@intel.com, tvrtko.ursulin@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Niranjana,

On Tue, Jan 17, 2023 at 11:15:48PM -0800, Niranjana Vishwanathapura wrote:
> Add function __i915_sw_fence_await_reservation() for
> asynchronous wait on a dma-resv object with specified
> dma_resv_usage. This is required for async vma unbind
> with vm_bind.
> 
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi

> ---
>  drivers/gpu/drm/i915/i915_sw_fence.c | 28 +++++++++++++++++++++-------
>  drivers/gpu/drm/i915/i915_sw_fence.h | 23 +++++++++++++++++------
>  2 files changed, 38 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
> index cc2a8821d22a..ae06d35db056 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence.c
> +++ b/drivers/gpu/drm/i915/i915_sw_fence.c
> @@ -7,7 +7,6 @@
>  #include <linux/slab.h>
>  #include <linux/dma-fence.h>
>  #include <linux/irq_work.h>
> -#include <linux/dma-resv.h>
>  
>  #include "i915_sw_fence.h"
>  #include "i915_selftest.h"
> @@ -569,11 +568,26 @@ int __i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
>  	return ret;
>  }
>  
> -int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
> -				    struct dma_resv *resv,
> -				    bool write,
> -				    unsigned long timeout,
> -				    gfp_t gfp)
> +/**
> + * __i915_sw_fence_await_reservation() - Setup a fence to wait on a dma-resv
> + * object with specified usage.
> + * @fence: the fence that needs to wait
> + * @resv: dma-resv object
> + * @usage: dma_resv_usage (See enum dma_resv_usage)
> + * @timeout: how long to wait in jiffies
> + * @gfp: allocation mode
> + *
> + * Setup the @fence to asynchronously wait on dma-resv object @resv for
> + * @usage to complete before signaling.
> + *
> + * Returns 0 if there is nothing to wait on, -ve error code upon error
> + * and >0 upon successfully setting up the wait.
> + */
> +int __i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
> +				      struct dma_resv *resv,
> +				      enum dma_resv_usage usage,
> +				      unsigned long timeout,
> +				      gfp_t gfp)
>  {
>  	struct dma_resv_iter cursor;
>  	struct dma_fence *f;
> @@ -582,7 +596,7 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
>  	debug_fence_assert(fence);
>  	might_sleep_if(gfpflags_allow_blocking(gfp));
>  
> -	dma_resv_iter_begin(&cursor, resv, dma_resv_usage_rw(write));
> +	dma_resv_iter_begin(&cursor, resv, usage);
>  	dma_resv_for_each_fence_unlocked(&cursor, f) {
>  		pending = i915_sw_fence_await_dma_fence(fence, f, timeout,
>  							gfp);
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.h b/drivers/gpu/drm/i915/i915_sw_fence.h
> index f752bfc7c6e1..9c4859dc4c0d 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence.h
> +++ b/drivers/gpu/drm/i915/i915_sw_fence.h
> @@ -10,13 +10,13 @@
>  #define _I915_SW_FENCE_H_
>  
>  #include <linux/dma-fence.h>
> +#include <linux/dma-resv.h>
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
> @@ -89,11 +89,22 @@ int i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
>  				  unsigned long timeout,
>  				  gfp_t gfp);
>  
> -int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
> -				    struct dma_resv *resv,
> -				    bool write,
> -				    unsigned long timeout,
> -				    gfp_t gfp);
> +int __i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
> +				      struct dma_resv *resv,
> +				      enum dma_resv_usage usage,
> +				      unsigned long timeout,
> +				      gfp_t gfp);
> +
> +static inline int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
> +						  struct dma_resv *resv,
> +						  bool write,
> +						  unsigned long timeout,
> +						  gfp_t gfp)
> +{
> +	return __i915_sw_fence_await_reservation(fence, resv,
> +						 dma_resv_usage_rw(write),
> +						 timeout, gfp);
> +}
>  
>  bool i915_sw_fence_await(struct i915_sw_fence *fence);
>  void i915_sw_fence_complete(struct i915_sw_fence *fence);
> -- 
> 2.21.0.rc0.32.g243a4c7e27
