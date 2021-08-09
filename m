Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B203E4A1D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 18:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C4089BF0;
	Mon,  9 Aug 2021 16:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82B489AC3;
 Mon,  9 Aug 2021 16:39:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="211623907"
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; d="scan'208";a="211623907"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 09:39:49 -0700
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; d="scan'208";a="444558839"
Received: from dut151-iclu.fm.intel.com ([10.105.23.43])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 09:39:49 -0700
Date: Mon, 9 Aug 2021 16:39:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 23/46] drm/i915/guc: Insert submit fences
 between requests in parent-child relationship
Message-ID: <20210809163948.GA122898@DUT151-ICLU.fm.intel.com>
References: <20210803222943.27686-1-matthew.brost@intel.com>
 <20210803222943.27686-24-matthew.brost@intel.com>
 <YRFYquq9BnZgPLuY@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRFYquq9BnZgPLuY@phenom.ffwll.local>
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

On Mon, Aug 09, 2021 at 06:32:42PM +0200, Daniel Vetter wrote:
> On Tue, Aug 03, 2021 at 03:29:20PM -0700, Matthew Brost wrote:
> > The GuC must receive requests in the order submitted for contexts in a
> > parent-child relationship to function correctly. To ensure this, insert
> > a submit fence between the current request and last request submitted
> > for requests / contexts in a parent child relationship. This is
> > conceptually similar to a single timeline.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: John Harrison <John.C.Harrison@Intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_context.c       |   2 +
> >  drivers/gpu/drm/i915/gt/intel_context.h       |   5 +
> >  drivers/gpu/drm/i915/gt/intel_context_types.h |   3 +
> >  .../gpu/drm/i915/gt/uc/intel_guc_submission.c |   3 +-
> >  drivers/gpu/drm/i915/i915_request.c           | 120 ++++++++++++++----
> >  5 files changed, 105 insertions(+), 28 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> > index bb4c14656067..98ef2d0f7a39 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> > @@ -487,6 +487,8 @@ void intel_context_fini(struct intel_context *ce)
> >  {
> >  	struct intel_context *child, *next;
> >  
> > +	if (ce->last_rq)
> > +		i915_request_put(ce->last_rq);
> >  	if (ce->timeline)
> >  		intel_timeline_put(ce->timeline);
> >  	i915_vm_put(ce->vm);
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> > index 7ce3b3d2edb7..a302599e436a 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> > @@ -60,6 +60,11 @@ intel_context_to_parent(struct intel_context *ce)
> >  	return intel_context_is_child(ce) ? ce->parent : ce;
> >  }
> >  
> > +static inline bool intel_context_is_parallel(struct intel_context *ce)
> > +{
> > +	return intel_context_is_child(ce) || intel_context_is_parent(ce);
> > +}
> > +
> >  void intel_context_bind_parent_child(struct intel_context *parent,
> >  				     struct intel_context *child);
> >  
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > index 9665cb31bab0..f4fc81f64921 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > @@ -225,6 +225,9 @@ struct intel_context {
> >  	 */
> >  	u8 guc_prio;
> >  	u32 guc_prio_count[GUC_CLIENT_PRIORITY_NUM];
> > +
> > +	/* Last request submitted on a parent */
> > +	struct i915_request *last_rq;
> >  };
> >  
> >  #endif /* __INTEL_CONTEXT_TYPES__ */
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index d1d4a1e59e8d..1cb382f7d79d 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -820,8 +820,7 @@ static inline int rq_prio(const struct i915_request *rq)
> >  
> >  static inline bool is_multi_lrc_rq(struct i915_request *rq)
> >  {
> > -	return intel_context_is_child(rq->context) ||
> > -		intel_context_is_parent(rq->context);
> > +	return intel_context_is_parallel(rq->context);
> >  }
> >  
> >  /*
> > diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> > index ce446716d092..2e51c8999088 100644
> > --- a/drivers/gpu/drm/i915/i915_request.c
> > +++ b/drivers/gpu/drm/i915/i915_request.c
> > @@ -1546,36 +1546,62 @@ i915_request_await_object(struct i915_request *to,
> >  	return ret;
> >  }
> >  
> > +static inline bool is_parallel_rq(struct i915_request *rq)
> > +{
> > +	return intel_context_is_parallel(rq->context);
> > +}
> > +
> > +static inline struct intel_context *request_to_parent(struct i915_request *rq)
> > +{
> > +	return intel_context_to_parent(rq->context);
> > +}
> > +
> >  static struct i915_request *
> > -__i915_request_add_to_timeline(struct i915_request *rq)
> > +__i915_request_ensure_parallel_ordering(struct i915_request *rq,
> > +					struct intel_timeline *timeline)
> >  {
> > -	struct intel_timeline *timeline = i915_request_timeline(rq);
> >  	struct i915_request *prev;
> >  
> > -	/*
> > -	 * Dependency tracking and request ordering along the timeline
> > -	 * is special cased so that we can eliminate redundant ordering
> > -	 * operations while building the request (we know that the timeline
> > -	 * itself is ordered, and here we guarantee it).
> > -	 *
> > -	 * As we know we will need to emit tracking along the timeline,
> > -	 * we embed the hooks into our request struct -- at the cost of
> > -	 * having to have specialised no-allocation interfaces (which will
> > -	 * be beneficial elsewhere).
> > -	 *
> > -	 * A second benefit to open-coding i915_request_await_request is
> > -	 * that we can apply a slight variant of the rules specialised
> > -	 * for timelines that jump between engines (such as virtual engines).
> > -	 * If we consider the case of virtual engine, we must emit a dma-fence
> > -	 * to prevent scheduling of the second request until the first is
> > -	 * complete (to maximise our greedy late load balancing) and this
> > -	 * precludes optimising to use semaphores serialisation of a single
> > -	 * timeline across engines.
> > -	 */
> > +	GEM_BUG_ON(!is_parallel_rq(rq));
> > +
> > +	prev = request_to_parent(rq)->last_rq;
> > +	if (prev) {
> > +		if (!__i915_request_is_complete(prev)) {
> > +			i915_sw_fence_await_sw_fence(&rq->submit,
> > +						     &prev->submit,
> > +						     &rq->submitq);
> > +
> > +			if (rq->engine->sched_engine->schedule)
> > +				__i915_sched_node_add_dependency(&rq->sched,
> > +								 &prev->sched,
> > +								 &rq->dep,
> > +								 0);
> > +		}
> > +		i915_request_put(prev);
> > +	}
> > +
> > +	request_to_parent(rq)->last_rq = i915_request_get(rq);
> > +
> > +	return to_request(__i915_active_fence_set(&timeline->last_request,
> > +						  &rq->fence));
> > +}
> > +
> > +static struct i915_request *
> > +__i915_request_ensure_ordering(struct i915_request *rq,
> > +			       struct intel_timeline *timeline)
> > +{
> > +	struct i915_request *prev;
> > +
> > +	GEM_BUG_ON(is_parallel_rq(rq));
> > +
> >  	prev = to_request(__i915_active_fence_set(&timeline->last_request,
> >  						  &rq->fence));
> > +
> >  	if (prev && !__i915_request_is_complete(prev)) {
> >  		bool uses_guc = intel_engine_uses_guc(rq->engine);
> > +		bool pow2 = is_power_of_2(READ_ONCE(prev->engine)->mask |
> > +					  rq->engine->mask);
> > +		bool same_context = prev->context == rq->context;
> >  
> >  		/*
> >  		 * The requests are supposed to be kept in order. However,
> > @@ -1583,13 +1609,11 @@ __i915_request_add_to_timeline(struct i915_request *rq)
> >  		 * is used as a barrier for external modification to this
> >  		 * context.
> >  		 */
> > -		GEM_BUG_ON(prev->context == rq->context &&
> > +		GEM_BUG_ON(same_context &&
> >  			   i915_seqno_passed(prev->fence.seqno,
> >  					     rq->fence.seqno));
> >  
> > -		if ((!uses_guc &&
> > -		     is_power_of_2(READ_ONCE(prev->engine)->mask | rq->engine->mask)) ||
> > -		    (uses_guc && prev->context == rq->context))
> > +		if ((same_context && uses_guc) || (!uses_guc && pow2))
> >  			i915_sw_fence_await_sw_fence(&rq->submit,
> >  						     &prev->submit,
> >  						     &rq->submitq);
> > @@ -1604,6 +1628,50 @@ __i915_request_add_to_timeline(struct i915_request *rq)
> >  							 0);
> >  	}
> >  
> > +	return prev;
> > +}
> > +
> > +static struct i915_request *
> > +__i915_request_add_to_timeline(struct i915_request *rq)
> > +{
> > +	struct intel_timeline *timeline = i915_request_timeline(rq);
> > +	struct i915_request *prev;
> > +
> > +	/*
> > +	 * Dependency tracking and request ordering along the timeline
> > +	 * is special cased so that we can eliminate redundant ordering
> > +	 * operations while building the request (we know that the timeline
> > +	 * itself is ordered, and here we guarantee it).
> > +	 *
> > +	 * As we know we will need to emit tracking along the timeline,
> > +	 * we embed the hooks into our request struct -- at the cost of
> > +	 * having to have specialised no-allocation interfaces (which will
> > +	 * be beneficial elsewhere).
> > +	 *
> > +	 * A second benefit to open-coding i915_request_await_request is
> > +	 * that we can apply a slight variant of the rules specialised
> > +	 * for timelines that jump between engines (such as virtual engines).
> > +	 * If we consider the case of virtual engine, we must emit a dma-fence
> > +	 * to prevent scheduling of the second request until the first is
> > +	 * complete (to maximise our greedy late load balancing) and this
> > +	 * precludes optimising to use semaphores serialisation of a single
> > +	 * timeline across engines.
> > +	 *
> 
> Can we put a big FIXME in here that this should all be resolved with a
> proper interface which passes the entire thing down to the backend?
> 
> Or is that no longer (or wasn't ever) the long-term goal?

I now you mentioned this in the past but I really don't think this all
that great of an idea as it would be a pretty intrusive change and not
sure what the real benefit is.

However, when we move the DRM scheduler this can be dropped because the
ordering of jobs on a sched_entity.

Matt

> -Daniel
> 
> > +	 * We do not order parallel submission requests on the timeline as each
> > +	 * parallel submission context has its own timeline and the ordering
> > +	 * rules for parallel requests are that they must be submitted in the
> > +	 * order received from the execbuf IOCTL. So rather than using the
> > +	 * timeline we store a pointer to last request submitted in the
> > +	 * relationship in the gem context and insert a submission fence
> > +	 * between that request and request passed into this function or
> > +	 * alternatively we use completion fence if gem context has a single
> > +	 * timeline and this is the first submission of an execbuf IOCTL.
> > +	 */
> > +	if (likely(!is_parallel_rq(rq)))
> > +		prev = __i915_request_ensure_ordering(rq, timeline);
> > +	else
> > +		prev = __i915_request_ensure_parallel_ordering(rq, timeline);
> > +
> >  	/*
> >  	 * Make sure that no request gazumped us - if it was allocated after
> >  	 * our i915_request_alloc() and called __i915_request_add() before
> > -- 
> > 2.28.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
