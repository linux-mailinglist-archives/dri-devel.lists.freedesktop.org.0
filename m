Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 352C45BFA31
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 11:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED1F10E8ED;
	Wed, 21 Sep 2022 09:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3D610E8ED;
 Wed, 21 Sep 2022 09:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663751215; x=1695287215;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SN/MGj5xb+CypOENK00dMMxkPVB7aukHv887XoAZ79U=;
 b=GKRJZkh5LOCwS956anMExlK2B9vFq5wR1MagcCi9ZKYIvZoMKQUFlQ7e
 0eTg4OcxXVLGAO2wqUATJLivnTgpeHztJcR5ECRxdKuYwhKRtSLzd1eJB
 wECStQpW/6dlinrvl/PwNscEpzP5D0d60zwDsyMgTwA7QfgKbjCFEHnTH
 0wsRk/SJGSi+LaYFz/+F8XvKG+9lAXjVx7XzaJaGHxpCzYRKLGHs970sO
 PcSVspIhRyvreH+kcmdE2+g7lu5BlxiWYJOIE/nNttnvTbbVeFcnSdvgQ
 Wqz9Fq9z+bjPIZiviOHhYkZFrnsinQk/tRCoAIR2tK32TkQQ5HvXXoq7B Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="297546371"
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; d="scan'208";a="297546371"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 02:06:52 -0700
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; d="scan'208";a="570454135"
Received: from jrcarrol-mobl.ger.corp.intel.com (HELO [10.213.205.22])
 ([10.213.205.22])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 02:06:50 -0700
Message-ID: <e3e2ebd8-7886-c040-fc56-2be3478fb1dc@linux.intel.com>
Date: Wed, 21 Sep 2022 10:06:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [Intel-gfx] [RFC v4 02/14] drm/i915/vm_bind: Add
 __i915_sw_fence_await_reservation()
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220921070945.27764-1-niranjana.vishwanathapura@intel.com>
 <20220921070945.27764-3-niranjana.vishwanathapura@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220921070945.27764-3-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: daniel.vetter@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@intel.com, paulo.r.zanoni@intel.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/09/2022 08:09, Niranjana Vishwanathapura wrote:
> Add function __i915_sw_fence_await_reservation() for
> asynchronous wait on a dma-resv object with specified
> dma_resv_usage. This is required for async vma unbind
> with vm_bind.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_sw_fence.c | 25 ++++++++++++++++++-------
>   drivers/gpu/drm/i915/i915_sw_fence.h |  7 ++++++-
>   2 files changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
> index 6fc0d1b89690..0ce8f4efc1ed 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence.c
> +++ b/drivers/gpu/drm/i915/i915_sw_fence.c
> @@ -569,12 +569,11 @@ int __i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
>   	return ret;
>   }
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
>   {
>   	struct dma_resv_iter cursor;
>   	struct dma_fence *f;
> @@ -583,7 +582,7 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
>   	debug_fence_assert(fence);
>   	might_sleep_if(gfpflags_allow_blocking(gfp));
>   
> -	dma_resv_iter_begin(&cursor, resv, dma_resv_usage_rw(write));
> +	dma_resv_iter_begin(&cursor, resv, usage);
>   	dma_resv_for_each_fence_unlocked(&cursor, f) {
>   		pending = i915_sw_fence_await_dma_fence(fence, f, timeout,
>   							gfp);
> @@ -598,6 +597,18 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
>   	return ret;
>   }
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

Drive by observation - it looked dodgy that you create a wrapper here 
which ignores one function parameter.

On a more detailed look it seems no callers actually use exclude and 
it's even unused inside this function since 1b5bdf071e62 ("drm/i915: use 
the new iterator in i915_sw_fence_await_reservation v3").

So a cleanup patch before this one?

Regards,

Tvrtko


> +
>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>   #include "selftests/lib_sw_fence.c"
>   #include "selftests/i915_sw_fence.c"
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.h b/drivers/gpu/drm/i915/i915_sw_fence.h
> index 619fc5a22f0c..3cf4b6e16f35 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence.h
> +++ b/drivers/gpu/drm/i915/i915_sw_fence.h
> @@ -10,13 +10,13 @@
>   #define _I915_SW_FENCE_H_
>   
>   #include <linux/dma-fence.h>
> +#include <linux/dma-resv.h>
>   #include <linux/gfp.h>
>   #include <linux/kref.h>
>   #include <linux/notifier.h> /* for NOTIFY_DONE */
>   #include <linux/wait.h>
>   
>   struct completion;
> -struct dma_resv;
>   struct i915_sw_fence;
>   
>   enum i915_sw_fence_notify {
> @@ -89,6 +89,11 @@ int i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
>   				  unsigned long timeout,
>   				  gfp_t gfp);
>   
> +int __i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
> +				      struct dma_resv *resv,
> +				      enum dma_resv_usage usage,
> +				      unsigned long timeout,
> +				      gfp_t gfp);
>   int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
>   				    struct dma_resv *resv,
>   				    const struct dma_fence_ops *exclude,
