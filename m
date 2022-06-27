Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AA255BB4F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 19:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F9E11337F;
	Mon, 27 Jun 2022 17:24:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB0C11337F;
 Mon, 27 Jun 2022 17:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656350685; x=1687886685;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/khke9EIu0Dazh/snshoi1gvyGyY0VyYNP8aJTHnZrQ=;
 b=VLtSjvfEJ0CpN26FWlS04jRorw6f0U9fOkTFygE2keMZKq+8noOEFaxo
 rCDeojNQZbMG/7JLwgHIfhAaD3PD6N1+NJc+lHE0UwvmjprVJO6rktcJI
 n+W3RvQYnyIqgv/VJ6uIuQ7N3iq3Ou9m1Z5fh+str7csa77zBohvPWFHW
 jcwE8SmWX67w/h+5yypFSAikib11YQFk51gcvy6DmUssfF8jqCN5Nfrku
 p1d/0Rve9j0leWv8HEQ7UWIAmUVntwr4IEgp66s/4lTBUvfzLiCgAr0gc
 j4Zb+/y5Com6QmnO49qzaz3m0i42t/r7ZB/Q6D8cgrQm4cp3Mm+BeKHPe w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="306991412"
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; d="scan'208";a="306991412"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 10:24:45 -0700
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; d="scan'208";a="646522650"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 10:24:45 -0700
Date: Mon, 27 Jun 2022 10:18:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH 2/3] Revert "drm/i915: Hold reference to intel_context
 over life of i915_request"
Message-ID: <20220627171811.GA15034@jons-linux-dev-box>
References: <20220614184348.23746-1-ramalingam.c@intel.com>
 <20220614184348.23746-3-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220614184348.23746-3-ramalingam.c@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 15, 2022 at 12:13:47AM +0530, Ramalingam C wrote:
> From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> 
> This reverts commit 1e98d8c52ed5dfbaf273c4423c636525c2ce59e7.
> 
> The problem with this patch is that it makes i915_request to hold a
> reference to intel_context, which in turn holds a reference on the VM.
> This strong back referencing can lead to reference loops which leads
> to resource leak.
> 
> An example is the upcoming VM_BIND work which requires VM to hold
> a reference to some shared VM specific BO. But this BO's dma-resv
> fences holds reference to the i915_request thus leading to reference
> loop.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Talked with Ram, this patch needs to be squashed with the following
patch. The reasoning is with just this patch, the tree is broken -
parallel submission contexts will leak requests.

With the patches squashed:

Reviewed-by: Mathew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_request.c | 55 +++++++++++++++++------------
>  1 file changed, 32 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 7f6998bf390c..c71905d8e154 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -134,17 +134,39 @@ static void i915_fence_release(struct dma_fence *fence)
>  	i915_sw_fence_fini(&rq->semaphore);
>  
>  	/*
> -	 * Keep one request on each engine for reserved use under mempressure,
> -	 * do not use with virtual engines as this really is only needed for
> -	 * kernel contexts.
> +	 * Keep one request on each engine for reserved use under mempressure
> +	 *
> +	 * We do not hold a reference to the engine here and so have to be
> +	 * very careful in what rq->engine we poke. The virtual engine is
> +	 * referenced via the rq->context and we released that ref during
> +	 * i915_request_retire(), ergo we must not dereference a virtual
> +	 * engine here. Not that we would want to, as the only consumer of
> +	 * the reserved engine->request_pool is the power management parking,
> +	 * which must-not-fail, and that is only run on the physical engines.
> +	 *
> +	 * Since the request must have been executed to be have completed,
> +	 * we know that it will have been processed by the HW and will
> +	 * not be unsubmitted again, so rq->engine and rq->execution_mask
> +	 * at this point is stable. rq->execution_mask will be a single
> +	 * bit if the last and _only_ engine it could execution on was a
> +	 * physical engine, if it's multiple bits then it started on and
> +	 * could still be on a virtual engine. Thus if the mask is not a
> +	 * power-of-two we assume that rq->engine may still be a virtual
> +	 * engine and so a dangling invalid pointer that we cannot dereference
> +	 *
> +	 * For example, consider the flow of a bonded request through a virtual
> +	 * engine. The request is created with a wide engine mask (all engines
> +	 * that we might execute on). On processing the bond, the request mask
> +	 * is reduced to one or more engines. If the request is subsequently
> +	 * bound to a single engine, it will then be constrained to only
> +	 * execute on that engine and never returned to the virtual engine
> +	 * after timeslicing away, see __unwind_incomplete_requests(). Thus we
> +	 * know that if the rq->execution_mask is a single bit, rq->engine
> +	 * can be a physical engine with the exact corresponding mask.
>  	 */
> -	if (!intel_engine_is_virtual(rq->engine) &&
> -	    !cmpxchg(&rq->engine->request_pool, NULL, rq)) {
> -		intel_context_put(rq->context);
> +	if (is_power_of_2(rq->execution_mask) &&
> +	    !cmpxchg(&rq->engine->request_pool, NULL, rq))
>  		return;
> -	}
> -
> -	intel_context_put(rq->context);
>  
>  	kmem_cache_free(slab_requests, rq);
>  }
> @@ -921,19 +943,7 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
>  		}
>  	}
>  
> -	/*
> -	 * Hold a reference to the intel_context over life of an i915_request.
> -	 * Without this an i915_request can exist after the context has been
> -	 * destroyed (e.g. request retired, context closed, but user space holds
> -	 * a reference to the request from an out fence). In the case of GuC
> -	 * submission + virtual engine, the engine that the request references
> -	 * is also destroyed which can trigger bad pointer dref in fence ops
> -	 * (e.g. i915_fence_get_driver_name). We could likely change these
> -	 * functions to avoid touching the engine but let's just be safe and
> -	 * hold the intel_context reference. In execlist mode the request always
> -	 * eventually points to a physical engine so this isn't an issue.
> -	 */
> -	rq->context = intel_context_get(ce);
> +	rq->context = ce;
>  	rq->engine = ce->engine;
>  	rq->ring = ce->ring;
>  	rq->execution_mask = ce->engine->mask;
> @@ -1009,7 +1019,6 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
>  	GEM_BUG_ON(!list_empty(&rq->sched.waiters_list));
>  
>  err_free:
> -	intel_context_put(ce);
>  	kmem_cache_free(slab_requests, rq);
>  err_unreserve:
>  	intel_context_unpin(ce);
> -- 
> 2.20.1
> 
