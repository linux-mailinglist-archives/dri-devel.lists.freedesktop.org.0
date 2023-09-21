Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1782A7A939E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 12:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0483E10E5AE;
	Thu, 21 Sep 2023 10:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4772A10E5AE;
 Thu, 21 Sep 2023 10:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695292888; x=1726828888;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9MzcViTHAM5U1tyZ+NUKjht9mv61PUUT1hTlte9VqAA=;
 b=ZYTFWlB4lCMznbXj3WqTf/QlqbGinNqgW77tpB0LiPhambNQdq47OqW7
 /oQeTgnp/a9Z/QsHXbm1w8J10WZpRakqKWwA8tzG34dOoPqNTSgsw21I2
 vjqHnwRuJdhfTjd4lu/zVmn3937K+JYruI+a1RsqJr7Dx3VRP4MgfK5qe
 ZlkbwU2UiQlcGm7gdV/6crC0PMllmkG+lHeob7j7lut3Maw0ZVa1CgqHx
 z+PEqvi9YMnauffDREGHBj05yJwCMpzV2QIMB2sX9tNzIOjEeOXbyhig4
 RkYfXFP3S0FP7yR6oiYykgwM2L8eP1+PG9tol4PRgqTRZKntbjhHQClQL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="379369578"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="379369578"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 03:41:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="696686481"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="696686481"
Received: from asilke-mobl2.ger.corp.intel.com (HELO [10.213.199.249])
 ([10.213.199.249])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 03:41:25 -0700
Message-ID: <5f7f3950-bc9b-06cf-611c-46c360bb90e9@linux.intel.com>
Date: Thu, 21 Sep 2023 11:41:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gem: Allow users to disable waitboost
Content-Language: en-US
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230920215624.3482244-1-vinay.belgaumkar@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230920215624.3482244-1-vinay.belgaumkar@intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 20/09/2023 22:56, Vinay Belgaumkar wrote:
> Provide a bit to disable waitboost while waiting on a gem object.
> Waitboost results in increased power consumption by requesting RP0
> while waiting for the request to complete. Add a bit in the gem_wait()
> IOCTL where this can be disabled.
> 
> This is related to the libva API change here -
> Link: https://github.com/XinfengZhang/libva/commit/3d90d18c67609a73121bb71b20ee4776b54b61a7

This link does not appear to lead to userspace code using this uapi?

> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_wait.c | 9 ++++++---
>   drivers/gpu/drm/i915/i915_request.c      | 3 ++-
>   drivers/gpu/drm/i915/i915_request.h      | 1 +
>   include/uapi/drm/i915_drm.h              | 1 +
>   4 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> index d4b918fb11ce..955885ec859d 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> @@ -72,7 +72,8 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
>   	struct dma_fence *fence;
>   	long ret = timeout ?: 1;
>   
> -	i915_gem_object_boost(resv, flags);
> +	if (!(flags & I915_WAITBOOST_DISABLE))
> +		i915_gem_object_boost(resv, flags);
>   
>   	dma_resv_iter_begin(&cursor, resv,
>   			    dma_resv_usage_rw(flags & I915_WAIT_ALL));
> @@ -236,7 +237,7 @@ i915_gem_wait_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	ktime_t start;
>   	long ret;
>   
> -	if (args->flags != 0)
> +	if (args->flags != 0 || args->flags != I915_GEM_WAITBOOST_DISABLE)
>   		return -EINVAL;
>   
>   	obj = i915_gem_object_lookup(file, args->bo_handle);
> @@ -248,7 +249,9 @@ i915_gem_wait_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	ret = i915_gem_object_wait(obj,
>   				   I915_WAIT_INTERRUPTIBLE |
>   				   I915_WAIT_PRIORITY |
> -				   I915_WAIT_ALL,
> +				   I915_WAIT_ALL |
> +				   (args->flags & I915_GEM_WAITBOOST_DISABLE ?
> +				    I915_WAITBOOST_DISABLE : 0),
>   				   to_wait_timeout(args->timeout_ns));
>   
>   	if (args->timeout_ns > 0) {
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index f59081066a19..2957409b4b2a 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -2044,7 +2044,8 @@ long i915_request_wait_timeout(struct i915_request *rq,
>   	 * but at a cost of spending more power processing the workload
>   	 * (bad for battery).
>   	 */
> -	if (flags & I915_WAIT_PRIORITY && !i915_request_started(rq))
> +	if (!(flags & I915_WAITBOOST_DISABLE) && (flags & I915_WAIT_PRIORITY) &&
> +	    !i915_request_started(rq))
>   		intel_rps_boost(rq);
>   
>   	wait.tsk = current;
> diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
> index 0ac55b2e4223..3cc00e8254dc 100644
> --- a/drivers/gpu/drm/i915/i915_request.h
> +++ b/drivers/gpu/drm/i915/i915_request.h
> @@ -445,6 +445,7 @@ long i915_request_wait(struct i915_request *rq,
>   #define I915_WAIT_INTERRUPTIBLE	BIT(0)
>   #define I915_WAIT_PRIORITY	BIT(1) /* small priority bump for the request */
>   #define I915_WAIT_ALL		BIT(2) /* used by i915_gem_object_wait() */
> +#define I915_WAITBOOST_DISABLE	BIT(3) /* used by i915_gem_object_wait() */
>   
>   void i915_request_show(struct drm_printer *m,
>   		       const struct i915_request *rq,
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 7000e5910a1d..4adee70e39cf 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -1928,6 +1928,7 @@ struct drm_i915_gem_wait {
>   	/** Handle of BO we shall wait on */
>   	__u32 bo_handle;
>   	__u32 flags;
> +#define I915_GEM_WAITBOOST_DISABLE      (1u<<0)

Probably would be good to avoid mentioning waitboost in the uapi since 
so far it wasn't an explicit feature/contract. Something like 
I915_GEM_WAIT_BACKGROUND_PRIORITY? Low priority?

I also wonder if there could be a possible angle to help Rob (+cc) 
upstream the syncobj/fence deadline code if our media driver might make 
use of that somehow.

Like if either we could wire up the deadline into GEM_WAIT (in a 
backward compatible manner), or if media could use sync fd wait instead. 
Assuming they have an out fence already, which may not be true.

Regards,

Tvrtko

>   	/** Number of nanoseconds to wait, Returns time remaining. */
>   	__s64 timeout_ns;
>   };
