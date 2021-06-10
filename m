Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899923A28F4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 12:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755516ECBC;
	Thu, 10 Jun 2021 10:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1BD6ECAC;
 Thu, 10 Jun 2021 10:04:03 +0000 (UTC)
IronPort-SDR: keu534A0UZcd2/7gwJvIs6D3F1+U7LCyciKRHaEj1GnTFMS8i5mdriwxoRSCvnNenx/Qa7U/R4
 4KFTLaHZmrUg==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="185642419"
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="185642419"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 03:03:58 -0700
IronPort-SDR: CkIu7NghF7rMMe3AVGKdmSXDUQOaadEak4FGC+LhJ2F+D2XPnMP3f2i+e0XcsoRy6CqW45cRkB
 0JuYwo9VIK3A==
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="448662293"
Received: from rabolton-mobl.ger.corp.intel.com (HELO [10.213.197.140])
 ([10.213.197.140])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 03:03:55 -0700
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915: Move
 intel_engine_free_request_pool to i915_request.c
To: Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20210609212959.471209-1-jason@jlekstrand.net>
 <20210609212959.471209-2-jason@jlekstrand.net>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <0f63cba3-ec2f-c246-1375-5b1bced593f5@linux.intel.com>
Date: Thu, 10 Jun 2021 11:03:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210609212959.471209-2-jason@jlekstrand.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 09/06/2021 22:29, Jason Ekstrand wrote:
> This appears to break encapsulation by moving an intel_engine_cs
> function to a i915_request file.  However, this function is
> intrinsically tied to the lifetime rules and allocation scheme of
> i915_request and having it in intel_engine_cs.c leaks details of
> i915_request.  We have an abstraction leak either way.  Since
> i915_request's allocation scheme is far more subtle than the simple
> pointer that is intel_engine_cs.request_pool, it's probably better to
> keep i915_request's details to itself.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c | 8 --------
>   drivers/gpu/drm/i915/i915_request.c       | 7 +++++--
>   drivers/gpu/drm/i915/i915_request.h       | 2 --
>   3 files changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 9ceddfbb1687d..df6b80ec84199 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -422,14 +422,6 @@ void intel_engines_release(struct intel_gt *gt)
>   	}
>   }
>   
> -void intel_engine_free_request_pool(struct intel_engine_cs *engine)
> -{
> -	if (!engine->request_pool)
> -		return;
> -
> -	kmem_cache_free(i915_request_slab_cache(), engine->request_pool);

Argument that the slab cache shouldn't be exported from i915_request.c 
sounds good to me.

But I think step better than simply reversing the break of encapsulation 
(And it's even worse because it leaks much higher level object!) could 
be to export a freeing helper from i915_request.c, engine pool would 
then use:

void __i915_request_free(...)
{
	kmem_cache_free(...);
}

?

Regards,

Tvrtko

> -}
> -
>   void intel_engines_free(struct intel_gt *gt)
>   {
>   	struct intel_engine_cs *engine;
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 1014c71cf7f52..48c5f8527854b 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -106,9 +106,12 @@ static signed long i915_fence_wait(struct dma_fence *fence,
>   				 timeout);
>   }
>   
> -struct kmem_cache *i915_request_slab_cache(void)
> +void intel_engine_free_request_pool(struct intel_engine_cs *engine)
>   {
> -	return global.slab_requests;
> +	if (!engine->request_pool)
> +		return;
> +
> +	kmem_cache_free(global.slab_requests, engine->request_pool);
>   }
>   
>   static void i915_fence_release(struct dma_fence *fence)
> diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
> index 270f6cd37650c..f84c38d29f988 100644
> --- a/drivers/gpu/drm/i915/i915_request.h
> +++ b/drivers/gpu/drm/i915/i915_request.h
> @@ -300,8 +300,6 @@ static inline bool dma_fence_is_i915(const struct dma_fence *fence)
>   	return fence->ops == &i915_fence_ops;
>   }
>   
> -struct kmem_cache *i915_request_slab_cache(void);
> -
>   struct i915_request * __must_check
>   __i915_request_create(struct intel_context *ce, gfp_t gfp);
>   struct i915_request * __must_check
> 
