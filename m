Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97576398948
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 14:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C52C6E0DB;
	Wed,  2 Jun 2021 12:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818A86E09E;
 Wed,  2 Jun 2021 12:18:51 +0000 (UTC)
IronPort-SDR: Vvpk6k6CoCFCjyLGMMBtpcAKR0mDI2J1AXt6g+PNJQk68oVIqVlOb0E+epwUOxJ9XD2h15uhA7
 5uneU2645HYA==
X-IronPort-AV: E=McAfee;i="6200,9189,10002"; a="203767555"
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="203767555"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 05:18:50 -0700
IronPort-SDR: 4+JbLYa3aTwmlV+B3Asz7lEEcsZm+L7Si/shpUtus0YB19GBC5z6SKOTTiUXEev3KJ9vtmJ6cI
 o1Db+ue03XeQ==
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="447382516"
Received: from tstaplex-mobl1.ger.corp.intel.com (HELO [10.213.195.193])
 ([10.213.195.193])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 05:18:49 -0700
Subject: Re: [Intel-gfx] [RFC PATCH 61/97] drm/i915: Hold reference to
 intel_context over life of i915_request
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-62-matthew.brost@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <9d27e06c-bbc7-b643-e52e-8e2714f2e98f@linux.intel.com>
Date: Wed, 2 Jun 2021 13:18:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210506191451.77768-62-matthew.brost@intel.com>
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 06/05/2021 20:14, Matthew Brost wrote:
> Hold a reference to the intel_context over life of an i915_request.
> Without this an i915_request can exist after the context has been
> destroyed (e.g. request retired, context closed, but user space holds a
> reference to the request from an out fence). In the case of GuC
> submission + virtual engine, the engine that the request references is
> also destroyed which can trigger bad pointer dref in fence ops (e.g.
> i915_fence_get_driver_name). We could likely change
> i915_fence_get_driver_name to avoid touching the engine but let's just
> be safe and hold the intel_context reference.

Isn't this a bug in present upstream as well? Like calling sync fence 
info on retired requests or something else?

If it is a bug in upstream then I think a single patch to deal with the 
issue should be posted independently. It may be as simple as checking 
for the signaled bit in i915_fence_get_driver_name and dereferencing 
with rcu protection.

Regards,

Tvrtko

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_request.c | 54 ++++++++++++-----------------
>   1 file changed, 22 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 127d60b36422..0b96b824ea06 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -126,39 +126,17 @@ static void i915_fence_release(struct dma_fence *fence)
>   	i915_sw_fence_fini(&rq->semaphore);
>   
>   	/*
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
> +	 * Keep one request on each engine for reserved use under mempressure,
> +	 * do not use with virtual engines as this really is only needed for
> +	 * kernel contexts.
>   	 */
> -	if (is_power_of_2(rq->execution_mask) &&
> -	    !cmpxchg(&rq->engine->request_pool, NULL, rq))
> +	if (!intel_engine_is_virtual(rq->engine) &&
> +	    !cmpxchg(&rq->engine->request_pool, NULL, rq)) {
> +		intel_context_put(rq->context);
>   		return;
> +	}
> +
> +	intel_context_put(rq->context);
>   
>   	kmem_cache_free(global.slab_requests, rq);
>   }
> @@ -977,7 +955,18 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
>   		}
>   	}
>   
> -	rq->context = ce;
> +	/*
> +	 * Hold a reference to the intel_context over life of an i915_request.
> +	 * Without this an i915_request can exist after the context has been
> +	 * destroyed (e.g. request retired, context closed, but user space holds
> +	 * a reference to the request from an out fence). In the case of GuC
> +	 * submission + virtual engine, the engine that the request references
> +	 * is also destroyed which can trigger bad pointer dref in fence ops
> +	 * (e.g. i915_fence_get_driver_name). We could likely change these
> +	 * functions to avoid touching the engine but let's just be safe and
> +	 * hold the intel_context reference.
> +	 */
> +	rq->context = intel_context_get(ce);
>   	rq->engine = ce->engine;
>   	rq->ring = ce->ring;
>   	rq->execution_mask = ce->engine->mask;
> @@ -1054,6 +1043,7 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
>   	GEM_BUG_ON(!list_empty(&rq->sched.waiters_list));
>   
>   err_free:
> +	intel_context_put(ce);
>   	kmem_cache_free(global.slab_requests, rq);
>   err_unreserve:
>   	intel_context_unpin(ce);
> 
