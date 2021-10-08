Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B95B426FDA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 20:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0406F523;
	Fri,  8 Oct 2021 18:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF686F521;
 Fri,  8 Oct 2021 18:00:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="213703735"
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="213703735"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 11:00:55 -0700
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="590626574"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 11:00:54 -0700
Date: Fri, 8 Oct 2021 10:56:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniele.ceraolospurio@intel.com
Subject: Re: [PATCH 14/26] drm/i915/guc: Implement multi-lrc reset
Message-ID: <20211008175608.GA31079@jons-linux-dev-box>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-15-matthew.brost@intel.com>
 <2d816209-7c88-8059-ff04-0cb7559f2c2f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d816209-7c88-8059-ff04-0cb7559f2c2f@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 08, 2021 at 10:39:35AM -0700, John Harrison wrote:
> On 10/4/2021 15:06, Matthew Brost wrote:
> > Update context and full GPU reset to work with multi-lrc. The idea is
> > parent context tracks all the active requests inflight for itself and
> > its' children. The parent context owns the reset replaying / canceling
> Still its' should be its.
> 

Yea. Will fix.

> > requests as needed.
> > 
> > v2:
> >   (John Harrison)
> >    - Simply loop in find active request
> >    - Add comments to find ative request / reset loop
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_context.c       | 15 +++-
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 69 ++++++++++++++-----
> >   2 files changed, 63 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> > index c5bb7ccfb3f8..3b340eb59ada 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> > @@ -528,20 +528,29 @@ struct i915_request *intel_context_create_request(struct intel_context *ce)
> >   struct i915_request *intel_context_find_active_request(struct intel_context *ce)
> >   {
> > +	struct intel_context *parent = intel_context_to_parent(ce);
> >   	struct i915_request *rq, *active = NULL;
> >   	unsigned long flags;
> >   	GEM_BUG_ON(!intel_engine_uses_guc(ce->engine));
> > -	spin_lock_irqsave(&ce->guc_state.lock, flags);
> > -	list_for_each_entry_reverse(rq, &ce->guc_state.requests,
> > +	/*
> > +	 * We search the parent list to find an active request on the submitted
> > +	 * context. The parent list contains the requests for all the contexts
> > +	 * in the relationship so we have to do a compare of each request's
> > +	 * context must be done.
> "have to do ... must be done" - no need for both.
>

Right, will fix.
 
> > +	 */
> > +	spin_lock_irqsave(&parent->guc_state.lock, flags);
> > +	list_for_each_entry_reverse(rq, &parent->guc_state.requests,
> >   				    sched.link) {
> > +		if (rq->context != ce)
> > +			continue;
> >   		if (i915_request_completed(rq))
> >   			break;
> >   		active = rq;
> >   	}
> > -	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> > +	spin_unlock_irqrestore(&parent->guc_state.lock, flags);
> >   	return active;
> >   }
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 6be7adf89e4f..d661a69ef4f7 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -681,6 +681,11 @@ static inline int rq_prio(const struct i915_request *rq)
> >   	return rq->sched.attr.priority;
> >   }
> > +static inline bool is_multi_lrc(struct intel_context *ce)
> > +{
> > +	return intel_context_is_parallel(ce);
> > +}
> > +
> >   static bool is_multi_lrc_rq(struct i915_request *rq)
> >   {
> >   	return intel_context_is_parallel(rq->context);
> > @@ -1214,10 +1219,15 @@ __unwind_incomplete_requests(struct intel_context *ce)
> >   static void __guc_reset_context(struct intel_context *ce, bool stalled)
> >   {
> > +	bool local_stalled;
> >   	struct i915_request *rq;
> >   	unsigned long flags;
> >   	u32 head;
> > +	int i, number_children = ce->parallel.number_children;
> >   	bool skip = false;
> > +	struct intel_context *parent = ce;
> > +
> > +	GEM_BUG_ON(intel_context_is_child(ce));
> >   	intel_context_get(ce);
> > @@ -1243,25 +1253,38 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
> >   	if (unlikely(skip))
> >   		goto out_put;
> > -	rq = intel_context_find_active_request(ce);
> > -	if (!rq) {
> > -		head = ce->ring->tail;
> > -		stalled = false;
> > -		goto out_replay;
> > -	}
> > +	/*
> > +	 * For each context in the relationship find the hanging request
> > +	 * resetting each context / request as needed
> > +	 */
> > +	for (i = 0; i < number_children + 1; ++i) {
> > +		if (!intel_context_is_pinned(ce))
> > +			goto next_context;
> > +
> > +		local_stalled = false;
> > +		rq = intel_context_find_active_request(ce);
> > +		if (!rq) {
> > +			head = ce->ring->tail;
> > +			goto out_replay;
> > +		}
> > -	if (!i915_request_started(rq))
> > -		stalled = false;
> > +		GEM_BUG_ON(i915_active_is_idle(&ce->active));
> > +		head = intel_ring_wrap(ce->ring, rq->head);
> > -	GEM_BUG_ON(i915_active_is_idle(&ce->active));
> > -	head = intel_ring_wrap(ce->ring, rq->head);
> > -	__i915_request_reset(rq, stalled);
> > +		if (i915_request_started(rq))
> I didn't see an answer as to why the started test and the wrap call need to
> be reversed?
>

Sorry, they don't have to be. Can flip this back if you want but either
way works.

Matt
 
> John.
> 
> > +			local_stalled = true;
> > +		__i915_request_reset(rq, local_stalled && stalled);
> >   out_replay:
> > -	guc_reset_state(ce, head, stalled);
> > -	__unwind_incomplete_requests(ce);
> > +		guc_reset_state(ce, head, local_stalled && stalled);
> > +next_context:
> > +		if (i != number_children)
> > +			ce = list_next_entry(ce, parallel.child_link);
> > +	}
> > +
> > +	__unwind_incomplete_requests(parent);
> >   out_put:
> > -	intel_context_put(ce);
> > +	intel_context_put(parent);
> >   }
> >   void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
> > @@ -1282,7 +1305,8 @@ void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
> >   		xa_unlock(&guc->context_lookup);
> > -		if (intel_context_is_pinned(ce))
> > +		if (intel_context_is_pinned(ce) &&
> > +		    !intel_context_is_child(ce))
> >   			__guc_reset_context(ce, stalled);
> >   		intel_context_put(ce);
> > @@ -1374,7 +1398,8 @@ void intel_guc_submission_cancel_requests(struct intel_guc *guc)
> >   		xa_unlock(&guc->context_lookup);
> > -		if (intel_context_is_pinned(ce))
> > +		if (intel_context_is_pinned(ce) &&
> > +		    !intel_context_is_child(ce))
> >   			guc_cancel_context_requests(ce);
> >   		intel_context_put(ce);
> > @@ -2067,6 +2092,8 @@ static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
> >   	u16 guc_id;
> >   	bool enabled;
> > +	GEM_BUG_ON(intel_context_is_child(ce));
> > +
> >   	spin_lock_irqsave(&ce->guc_state.lock, flags);
> >   	incr_context_blocked(ce);
> > @@ -2121,6 +2148,7 @@ static void guc_context_unblock(struct intel_context *ce)
> >   	bool enable;
> >   	GEM_BUG_ON(context_enabled(ce));
> > +	GEM_BUG_ON(intel_context_is_child(ce));
> >   	spin_lock_irqsave(&ce->guc_state.lock, flags);
> > @@ -2147,11 +2175,14 @@ static void guc_context_unblock(struct intel_context *ce)
> >   static void guc_context_cancel_request(struct intel_context *ce,
> >   				       struct i915_request *rq)
> >   {
> > +	struct intel_context *block_context =
> > +		request_to_scheduling_context(rq);
> > +
> >   	if (i915_sw_fence_signaled(&rq->submit)) {
> >   		struct i915_sw_fence *fence;
> >   		intel_context_get(ce);
> > -		fence = guc_context_block(ce);
> > +		fence = guc_context_block(block_context);
> >   		i915_sw_fence_wait(fence);
> >   		if (!i915_request_completed(rq)) {
> >   			__i915_request_skip(rq);
> > @@ -2165,7 +2196,7 @@ static void guc_context_cancel_request(struct intel_context *ce,
> >   		 */
> >   		flush_work(&ce_to_guc(ce)->ct.requests.worker);
> > -		guc_context_unblock(ce);
> > +		guc_context_unblock(block_context);
> >   		intel_context_put(ce);
> >   	}
> >   }
> > @@ -2191,6 +2222,8 @@ static void guc_context_ban(struct intel_context *ce, struct i915_request *rq)
> >   	intel_wakeref_t wakeref;
> >   	unsigned long flags;
> > +	GEM_BUG_ON(intel_context_is_child(ce));
> > +
> >   	guc_flush_submissions(guc);
> >   	spin_lock_irqsave(&ce->guc_state.lock, flags);
> 
