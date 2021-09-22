Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FA741462D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 12:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4276EB69;
	Wed, 22 Sep 2021 10:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3798E6EB68;
 Wed, 22 Sep 2021 10:27:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="221676534"
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; d="scan'208";a="221676534"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 03:27:27 -0700
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; d="scan'208";a="512928662"
Received: from bbrowne-mobl.ger.corp.intel.com (HELO [10.213.200.151])
 ([10.213.200.151])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 03:27:25 -0700
Subject: Re: [PATCH 18/26] drm/i915: use new iterator in
 i915_gem_object_last_write_engine
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
References: <20210922091044.2612-1-christian.koenig@amd.com>
 <20210922091044.2612-19-christian.koenig@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <92e428d5-76d5-e63f-5322-aa5cf1a1952a@linux.intel.com>
Date: Wed, 22 Sep 2021 11:27:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922091044.2612-19-christian.koenig@amd.com>
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


On 22/09/2021 10:10, Christian König wrote:
> This is maybe even a fix since the RCU usage here looks incorrect.

I'm afraid I gazumped you here by removing this function shortly before 
you posted the respin.

Regards,

Tvrtko

> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_object.h | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index 48112b9d76df..e20efffce3a9 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -507,16 +507,16 @@ static inline struct intel_engine_cs *
>   i915_gem_object_last_write_engine(struct drm_i915_gem_object *obj)
>   {
>   	struct intel_engine_cs *engine = NULL;
> +	struct dma_resv_iter cursor;
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
> +	dma_resv_iter_begin(&cursor, obj->base.resv, false);
> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> +		if (fence && dma_fence_is_i915(fence) &&
> +		    !dma_fence_is_signaled(fence))
> +			engine = to_request(fence)->engine;
> +	}
> +	dma_resv_iter_end(&cursor);
>   	return engine;
>   }
>   
> 
