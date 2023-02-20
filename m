Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A3069D0DD
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 16:46:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5084010E6CB;
	Mon, 20 Feb 2023 15:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5BF10E67C;
 Mon, 20 Feb 2023 15:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676908006; x=1708444006;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=k4wfezK6AXjJRKoJw8o50JWi2ZFodNHQ5z5zxhTGtJs=;
 b=Nxy/CTo68GN5DSYUlRtJ3kAjuyuKS23fxsXxtvkTtDL+a+PT7NWyCx/j
 yafxBZxOrcRo8myfN2KMnbcBNlZm9gTIgzgiUDYz4np9xRJl5tP6U9tsO
 K/mtvajpxun+VbKrim4M/4SFUDeLRdwWBUFG5cW5AF0vKPZJKg3Ww/nUV
 nV1xhtGnbjSRcujLln/9A8jONYx41KnkmQBGXmRsziRXsHhbII0dfBclW
 xg5X0VIJ+4YIUqWkbgiRLj04AmNONOpy31SgUcJgHobomqL1muOYmjVgj
 YWVZUJRLEQ+PMu8CeqEdD4aF0W/h/5noUksrKepZ+UxsM0nZU+1GTCD5t A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="312060021"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; d="scan'208";a="312060021"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 07:46:45 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="916897293"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; d="scan'208";a="916897293"
Received: from mochoamo-mobl.ger.corp.intel.com (HELO [10.213.211.126])
 ([10.213.211.126])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 07:46:41 -0800
Message-ID: <2716c108-0486-6e27-77e2-efd1fa350f04@linux.intel.com>
Date: Mon, 20 Feb 2023 15:46:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 14/14] drm/i915: Add deadline based boost support
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-15-robdclark@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230218211608.1630586-15-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 18/02/2023 21:15, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> 
> This should probably be re-written by someone who knows the i915
> request/timeline stuff better, to deal with non-immediate deadlines.
> But as-is I think this should be enough to handle the case where
> we want syncobj waits to trigger boost.

Yeah, there are endless possibilities. :) But I think it is effectively 
similar enough to current waitboosting (when waits are done using the 
i915 specific ioctl). So as a first step I'll try to organize some 
internal power and performance testing, at least Chromebook focused, to 
see if modern userspace (syncobj based) even benefits and does not by 
some chance regress over the board.

Regards,

Tvrtko

> 
>   drivers/gpu/drm/i915/i915_driver.c  |  2 +-
>   drivers/gpu/drm/i915/i915_request.c | 20 ++++++++++++++++++++
>   2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index cf1c0970ecb4..bd40b7bcb38a 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -1781,7 +1781,7 @@ static const struct drm_driver i915_drm_driver = {
>   	.driver_features =
>   	    DRIVER_GEM |
>   	    DRIVER_RENDER | DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_SYNCOBJ |
> -	    DRIVER_SYNCOBJ_TIMELINE,
> +	    DRIVER_SYNCOBJ_TIMELINE | DRIVER_SYNCOBJ_DEADLINE,
>   	.release = i915_driver_release,
>   	.open = i915_driver_open,
>   	.lastclose = i915_driver_lastclose,
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 7503dcb9043b..44491e7e214c 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -97,6 +97,25 @@ static bool i915_fence_enable_signaling(struct dma_fence *fence)
>   	return i915_request_enable_breadcrumb(to_request(fence));
>   }
>   
> +static void i915_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
> +{
> +	struct i915_request *rq = to_request(fence);
> +
> +	if (i915_request_completed(rq))
> +		return;
> +
> +	if (i915_request_started(rq))
> +		return;
> +
> +	/*
> +	 * TODO something more clever for deadlines that are in the
> +	 * future.  I think probably track the nearest deadline in
> +	 * rq->timeline and set timer to trigger boost accordingly?
> +	 */
> +
> +	intel_rps_boost(rq);
> +}
> +
>   static signed long i915_fence_wait(struct dma_fence *fence,
>   				   bool interruptible,
>   				   signed long timeout)
> @@ -182,6 +201,7 @@ const struct dma_fence_ops i915_fence_ops = {
>   	.signaled = i915_fence_signaled,
>   	.wait = i915_fence_wait,
>   	.release = i915_fence_release,
> +	.set_deadline = i915_fence_set_deadline,
>   };
>   
>   static void irq_execute_cb(struct irq_work *wrk)
