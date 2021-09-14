Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0188F40ADA4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 14:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A832B8916C;
	Tue, 14 Sep 2021 12:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4968916C;
 Tue, 14 Sep 2021 12:28:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="285667596"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="285667596"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 05:28:02 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="432975337"
Received: from ocascan-mobl.ger.corp.intel.com (HELO [10.213.234.116])
 ([10.213.234.116])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 05:28:01 -0700
Subject: Re: [Intel-gfx] [PATCH 18/26] drm/i915: use new iterator in
 i915_gem_object_last_write_engine
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
References: <20210913131707.45639-1-christian.koenig@amd.com>
 <20210913131707.45639-19-christian.koenig@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <46a40614-b448-7f2d-7b6b-0705c4277e2b@linux.intel.com>
Date: Tue, 14 Sep 2021 13:27:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210913131707.45639-19-christian.koenig@amd.com>
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


On 13/09/2021 14:16, Christian König wrote:
> This is maybe even a fix since the RCU usage here looks incorrect.

What you think is incorrect? Pointless extra rcu locking?

Also, FWIW, I submitted a patch to remove this function altogether since 
its IMO pretty useless, just failed in getting anyone to ack it so far.

Regards,

Tvrtko

> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_object.h | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index e9eecebf5c9d..3343922af4d6 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -500,16 +500,15 @@ static inline struct intel_engine_cs *
>   i915_gem_object_last_write_engine(struct drm_i915_gem_object *obj)
>   {
>   	struct intel_engine_cs *engine = NULL;
> +	struct dma_resv_cursor cursor;
>   	struct dma_fence *fence;
>   
> -	rcu_read_lock();
> -	fence = dma_resv_get_excl_unlocked(obj->base.resv);
> -	rcu_read_unlock();
> -
> -	if (fence && dma_fence_is_i915(fence) && !dma_fence_is_signaled(fence))
> -		engine = to_request(fence)->engine;
> -	dma_fence_put(fence);
> -
> +	dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor, false,
> +					 fence) {
> +		if (fence && dma_fence_is_i915(fence) &&
> +		    !dma_fence_is_signaled(fence))
> +			engine = to_request(fence)->engine;
> +	}
>   	return engine;
>   }
>   
> 
