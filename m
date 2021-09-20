Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BB3411148
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 10:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46BE6E44B;
	Mon, 20 Sep 2021 08:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A296E46B;
 Mon, 20 Sep 2021 08:46:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10112"; a="223123286"
X-IronPort-AV: E=Sophos;i="5.85,307,1624345200"; d="scan'208";a="223123286"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 01:45:59 -0700
X-IronPort-AV: E=Sophos;i="5.85,307,1624345200"; d="scan'208";a="473492639"
Received: from gbradyx-mobl2.ger.corp.intel.com (HELO [10.213.235.119])
 ([10.213.235.119])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 01:45:58 -0700
Subject: Re: [Intel-gfx] [PATCH 14/26] drm/i915: use the new iterator in
 i915_sw_fence_await_reservation v3
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-15-christian.koenig@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <93b93f00-7ad3-9ea3-e947-77297b4552c9@linux.intel.com>
Date: Mon, 20 Sep 2021 09:45:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917123513.1106-15-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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


On 17/09/2021 13:35, Christian König wrote:
> Simplifying the code a bit.
> 
> v2: use dma_resv_for_each_fence instead, according to Tvrtko the lock is
>      held here anyway.
> v3: back to using dma_resv_for_each_fence_unlocked.

It did not work out - what happened?

Regards,

Tvrtko

> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/i915/i915_sw_fence.c | 57 ++++++++--------------------
>   1 file changed, 15 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
> index c589a681da77..7635b0478ea5 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence.c
> +++ b/drivers/gpu/drm/i915/i915_sw_fence.c
> @@ -572,56 +572,29 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
>   				    unsigned long timeout,
>   				    gfp_t gfp)
>   {
> -	struct dma_fence *excl;
> +	struct dma_resv_iter cursor;
> +	struct dma_fence *f;
>   	int ret = 0, pending;
>   
>   	debug_fence_assert(fence);
>   	might_sleep_if(gfpflags_allow_blocking(gfp));
>   
> -	if (write) {
> -		struct dma_fence **shared;
> -		unsigned int count, i;
> -
> -		ret = dma_resv_get_fences(resv, &excl, &count, &shared);
> -		if (ret)
> -			return ret;
> -
> -		for (i = 0; i < count; i++) {
> -			if (shared[i]->ops == exclude)
> -				continue;
> -
> -			pending = i915_sw_fence_await_dma_fence(fence,
> -								shared[i],
> -								timeout,
> -								gfp);
> -			if (pending < 0) {
> -				ret = pending;
> -				break;
> -			}
> -
> -			ret |= pending;
> -		}
> -
> -		for (i = 0; i < count; i++)
> -			dma_fence_put(shared[i]);
> -		kfree(shared);
> -	} else {
> -		excl = dma_resv_get_excl_unlocked(resv);
> -	}
> -
> -	if (ret >= 0 && excl && excl->ops != exclude) {
> -		pending = i915_sw_fence_await_dma_fence(fence,
> -							excl,
> -							timeout,
> +	rcu_read_lock();
> +	dma_resv_iter_begin(&cursor, resv, write);
> +	dma_resv_for_each_fence_unlocked(&cursor, f) {
> +		rcu_read_unlock();
> +		pending = i915_sw_fence_await_dma_fence(fence, f, timeout,
>   							gfp);
> -		if (pending < 0)
> +		rcu_read_lock();
> +		if (pending < 0) {
>   			ret = pending;
> -		else
> -			ret |= pending;
> -	}
> -
> -	dma_fence_put(excl);
> +			break;
> +		}
>   
> +		ret |= pending;
> +	}
> +	dma_resv_iter_end(&cursor);
> +	rcu_read_unlock();
>   	return ret;
>   }
>   
> 
