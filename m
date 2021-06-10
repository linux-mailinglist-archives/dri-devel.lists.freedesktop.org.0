Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6DD3A2907
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 12:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BF36ECAC;
	Thu, 10 Jun 2021 10:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B386ECAC;
 Thu, 10 Jun 2021 10:08:55 +0000 (UTC)
IronPort-SDR: wujmNWXrEQ+WBKQY2NAR4qgtwdVCQIgmkzafb//2PaleN5X0PpjL0E8fhT0M7NktnnYscji363
 vKcZPh2iHYbQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="192585116"
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="192585116"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 03:08:44 -0700
IronPort-SDR: rqQO0fGK/6oc8EOd92ybJlMrsD7sRTUCnKtO5XLwZeqAZocKMvLU1jcsw7OJW9VfRtahpt31bh
 Qe4fM1zdayxA==
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="448663345"
Received: from rabolton-mobl.ger.corp.intel.com (HELO [10.213.197.140])
 ([10.213.197.140])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 03:08:42 -0700
Subject: Re: [Intel-gfx] [PATCH 2/5] drm/i915: Use a simpler scheme for
 caching i915_request
To: Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20210609212959.471209-1-jason@jlekstrand.net>
 <20210609212959.471209-3-jason@jlekstrand.net>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <2902ebcf-ec60-fdd3-2e61-a113bca835fd@linux.intel.com>
Date: Thu, 10 Jun 2021 11:08:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210609212959.471209-3-jason@jlekstrand.net>
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
> Instead of attempting to recycle a request in to the cache when it
> retires, stuff a new one in the cache every time we allocate a request
> for some other reason.

I supposed the "why?" is "simpler scheme" - but in what way it is simpler?

> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/i915_request.c | 66 ++++++++++++++---------------
>   1 file changed, 31 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 48c5f8527854b..e531c74f0b0e2 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -128,41 +128,6 @@ static void i915_fence_release(struct dma_fence *fence)
>   	i915_sw_fence_fini(&rq->submit);
>   	i915_sw_fence_fini(&rq->semaphore);
>   
> -	/*
> -	 * Keep one request on each engine for reserved use under mempressure
> -	 *
> -	 * We do not hold a reference to the engine here and so have to be
> -	 * very careful in what rq->engine we poke. The virtual engine is
> -	 * referenced via the rq->context and we released that ref during
> -	 * i915_request_retire(), ergo we must not dereference a virtual
> -	 * engine here. Not that we would want to, as the only consumer of
> -	 * the reserved engine->request_pool is the power management parking,
> -	 * which must-not-fail, and that is only run on the physical engines.
> -	 *
> -	 * Since the request must have been executed to be have completed,
> -	 * we know that it will have been processed by the HW and will
> -	 * not be unsubmitted again, so rq->engine and rq->execution_mask
> -	 * at this point is stable. rq->execution_mask will be a single
> -	 * bit if the last and _only_ engine it could execution on was a
> -	 * physical engine, if it's multiple bits then it started on and
> -	 * could still be on a virtual engine. Thus if the mask is not a
> -	 * power-of-two we assume that rq->engine may still be a virtual
> -	 * engine and so a dangling invalid pointer that we cannot dereference
> -	 *
> -	 * For example, consider the flow of a bonded request through a virtual
> -	 * engine. The request is created with a wide engine mask (all engines
> -	 * that we might execute on). On processing the bond, the request mask
> -	 * is reduced to one or more engines. If the request is subsequently
> -	 * bound to a single engine, it will then be constrained to only
> -	 * execute on that engine and never returned to the virtual engine
> -	 * after timeslicing away, see __unwind_incomplete_requests(). Thus we
> -	 * know that if the rq->execution_mask is a single bit, rq->engine
> -	 * can be a physical engine with the exact corresponding mask.
> -	 */
> -	if (is_power_of_2(rq->execution_mask) &&
> -	    !cmpxchg(&rq->engine->request_pool, NULL, rq))
> -		return;
> -
>   	kmem_cache_free(global.slab_requests, rq);
>   }
>   
> @@ -869,6 +834,29 @@ static void retire_requests(struct intel_timeline *tl)
>   			break;
>   }
>   
> +static void
> +ensure_cached_request(struct i915_request **rsvd, gfp_t gfp)
> +{
> +	struct i915_request *rq;
> +
> +	/* Don't try to add to the cache if we don't allow blocking.  That
> +	 * just increases the chance that the actual allocation will fail.
> +	 */

Linus has been known to rant passionately against this comment style so 
we actively try to never use it.

Rega4rds,

Tvrtko

> +	if (gfpflags_allow_blocking(gfp))
> +		return;
> +
> +	if (READ_ONCE(rsvd))
> +		return;
> +
> +	rq = kmem_cache_alloc(global.slab_requests,
> +			      gfp | __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> +	if (!rq)
> +		return; /* Oops but nothing we can do */
> +
> +	if (cmpxchg(rsvd, NULL, rq))
> +		kmem_cache_free(global.slab_requests, rq);
> +}
> +
>   static noinline struct i915_request *
>   request_alloc_slow(struct intel_timeline *tl,
>   		   struct i915_request **rsvd,
> @@ -937,6 +925,14 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
>   	/* Check that the caller provided an already pinned context */
>   	__intel_context_pin(ce);
>   
> +	/* Before we do anything, try to make sure we have at least one
> +	 * request in the engine's cache.  If we get here with GPF_NOWAIT
> +	 * (this can happen when switching to a kernel context), we we want
> +	 * to try very hard to not fail and we fall back to this cache.
> +	 * Top it off with a fresh request whenever it's empty.
> +	 */
> +	ensure_cached_request(&ce->engine->request_pool, gfp);
> +
>   	/*
>   	 * Beware: Dragons be flying overhead.
>   	 *
> 
