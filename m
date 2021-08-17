Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B58843EEF33
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 17:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA1689F4A;
	Tue, 17 Aug 2021 15:31:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5D189F4A;
 Tue, 17 Aug 2021 15:31:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="213004371"
X-IronPort-AV: E=Sophos;i="5.84,329,1620716400"; d="scan'208";a="213004371"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 08:31:44 -0700
X-IronPort-AV: E=Sophos;i="5.84,329,1620716400"; d="scan'208";a="676554798"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 08:31:42 -0700
Date: Tue, 17 Aug 2021 08:26:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: Re: [Intel-gfx] [PATCH 19/22] drm/i915/guc: Proper xarray usage for
 contexts_lookup
Message-ID: <20210817152628.GA19215@jons-linux-dev-box>
References: <20210816135139.10060-1-matthew.brost@intel.com>
 <20210816135139.10060-20-matthew.brost@intel.com>
 <YRuPEeq2e8qdKBc2@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRuPEeq2e8qdKBc2@phenom.ffwll.local>
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

On Tue, Aug 17, 2021 at 12:27:29PM +0200, Daniel Vetter wrote:
> On Mon, Aug 16, 2021 at 06:51:36AM -0700, Matthew Brost wrote:
> > Lock the xarray and take ref to the context if needed.
> > 
> > v2:
> >  (Checkpatch)
> >   - Add new line after declaration
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 84 ++++++++++++++++---
> >  1 file changed, 73 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index ba19b99173fc..2ecb2f002bed 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -599,8 +599,18 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
> >  	unsigned long index, flags;
> >  	bool pending_disable, pending_enable, deregister, destroyed, banned;
> >  
> > +	xa_lock_irqsave(&guc->context_lookup, flags);
> >  	xa_for_each(&guc->context_lookup, index, ce) {
> > -		spin_lock_irqsave(&ce->guc_state.lock, flags);
> > +		/*
> > +		 * Corner case where the ref count on the object is zero but and
> > +		 * deregister G2H was lost. In this case we don't touch the ref
> > +		 * count and finish the destroy of the context.
> > +		 */
> > +		bool do_put = kref_get_unless_zero(&ce->ref);
> 
> This looks really scary, because in another loop below you have an
> unconditional refcount increase. This means sometimes guc->context_lookup

Yea, good catch those loops need something like this too.

> xarray guarantees we hold a full reference on the context, sometimes we
> don't. So we're right back in "protect the code" O(N^2) review complexity
> instead of invariant rules about the datastructure, which is linear.
> 
> Essentially anytime you feel like you have to add a comment to explain
> what's going on about concurrent stuff you're racing with, you're
> protecting code, not data.
> 
> Since guc can't do a hole lot without the guc_id registered and all that,
> I kinda expected you'd always have a full reference here. If there's

The deregister is triggered by the ref count going to zero and we can't
fully release the guc_id until that operation completes hence why it is
still in the xarray. I think the solution here is to use iterator like
you mention below that ref counts this correctly.

> intermediate stages (e.g. around unregister) where this is currently not
> always the case, then those should make sure a full reference is held.
> 
> Another option would be to threa ->context_lookup as a weak reference that
> we lazily clean up when the context is finalized. That works too, but
> probably not with a spinlock (since you most likely have to wait for all
> pending guc transations to complete), but it's another option.
> 
> Either way I think standard process is needed here for locking design,
> i.e.
> 1. come up with the right invariants ("we always have a full reference
> when a context is ont he guc->context_lookup xarray")
> 2. come up with the locks. From the guc side the xa_lock is maybe good
> enough, but from the context side this doesn't protect against a
> re-registering racing against a deregistering. So probably needs more
> rules on top, and then you have a nice lock inversion in a few places like
> here.
> 3. document it and roll it out.
> 
> The other thing is that this is a very tricky iterator, and there's a few
> copies of it. That is, if this is the right solution. As-is this should be
> abstracted away into guc_context_iter_begin/next_end() helpers, e.g. like
> we have for drm_connector_list_iter_begin/end_next as an example.
>

I can check this out.

Matt
 
> Cheers, Daniel
> 
> > +
> > +		xa_unlock(&guc->context_lookup);
> > +
> > +		spin_lock(&ce->guc_state.lock);
> >  
> >  		/*
> >  		 * Once we are at this point submission_disabled() is guaranteed
> > @@ -616,7 +626,9 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
> >  		banned = context_banned(ce);
> >  		init_sched_state(ce);
> >  
> > -		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> > +		spin_unlock(&ce->guc_state.lock);
> > +
> > +		GEM_BUG_ON(!do_put && !destroyed);
> >  
> >  		if (pending_enable || destroyed || deregister) {
> >  			atomic_dec(&guc->outstanding_submission_g2h);
> > @@ -645,7 +657,12 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
> >  
> >  			intel_context_put(ce);
> >  		}
> > +
> > +		if (do_put)
> > +			intel_context_put(ce);
> > +		xa_lock(&guc->context_lookup);
> >  	}
> > +	xa_unlock_irqrestore(&guc->context_lookup, flags);
> >  }
> >  
> >  static inline bool
> > @@ -866,16 +883,26 @@ void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
> >  {
> >  	struct intel_context *ce;
> >  	unsigned long index;
> > +	unsigned long flags;
> >  
> >  	if (unlikely(!guc_submission_initialized(guc))) {
> >  		/* Reset called during driver load? GuC not yet initialised! */
> >  		return;
> >  	}
> >  
> > -	xa_for_each(&guc->context_lookup, index, ce)
> > +	xa_lock_irqsave(&guc->context_lookup, flags);
> > +	xa_for_each(&guc->context_lookup, index, ce) {
> > +		intel_context_get(ce);
> > +		xa_unlock(&guc->context_lookup);
> > +
> >  		if (intel_context_is_pinned(ce))
> >  			__guc_reset_context(ce, stalled);
> >  
> > +		intel_context_put(ce);
> > +		xa_lock(&guc->context_lookup);
> > +	}
> > +	xa_unlock_irqrestore(&guc->context_lookup, flags);
> > +
> >  	/* GuC is blown away, drop all references to contexts */
> >  	xa_destroy(&guc->context_lookup);
> >  }
> > @@ -950,11 +977,21 @@ void intel_guc_submission_cancel_requests(struct intel_guc *guc)
> >  {
> >  	struct intel_context *ce;
> >  	unsigned long index;
> > +	unsigned long flags;
> > +
> > +	xa_lock_irqsave(&guc->context_lookup, flags);
> > +	xa_for_each(&guc->context_lookup, index, ce) {
> > +		intel_context_get(ce);
> > +		xa_unlock(&guc->context_lookup);
> >  
> > -	xa_for_each(&guc->context_lookup, index, ce)
> >  		if (intel_context_is_pinned(ce))
> >  			guc_cancel_context_requests(ce);
> >  
> > +		intel_context_put(ce);
> > +		xa_lock(&guc->context_lookup);
> > +	}
> > +	xa_unlock_irqrestore(&guc->context_lookup, flags);
> > +
> >  	guc_cancel_sched_engine_requests(guc->sched_engine);
> >  
> >  	/* GuC is blown away, drop all references to contexts */
> > @@ -2848,21 +2885,26 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
> >  	struct intel_context *ce;
> >  	struct i915_request *rq;
> >  	unsigned long index;
> > +	unsigned long flags;
> >  
> >  	/* Reset called during driver load? GuC not yet initialised! */
> >  	if (unlikely(!guc_submission_initialized(guc)))
> >  		return;
> >  
> > +	xa_lock_irqsave(&guc->context_lookup, flags);
> >  	xa_for_each(&guc->context_lookup, index, ce) {
> > +		intel_context_get(ce);
> > +		xa_unlock(&guc->context_lookup);
> > +
> >  		if (!intel_context_is_pinned(ce))
> > -			continue;
> > +			goto next;
> >  
> >  		if (intel_engine_is_virtual(ce->engine)) {
> >  			if (!(ce->engine->mask & engine->mask))
> > -				continue;
> > +				goto next;
> >  		} else {
> >  			if (ce->engine != engine)
> > -				continue;
> > +				goto next;
> >  		}
> >  
> >  		list_for_each_entry(rq, &ce->guc_active.requests, sched.link) {
> > @@ -2872,9 +2914,17 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
> >  			intel_engine_set_hung_context(engine, ce);
> >  
> >  			/* Can only cope with one hang at a time... */
> > -			return;
> > +			intel_context_put(ce);
> > +			xa_lock(&guc->context_lookup);
> > +			goto done;
> >  		}
> > +next:
> > +		intel_context_put(ce);
> > +		xa_lock(&guc->context_lookup);
> > +
> >  	}
> > +done:
> > +	xa_unlock_irqrestore(&guc->context_lookup, flags);
> >  }
> >  
> >  void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
> > @@ -2890,23 +2940,32 @@ void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
> >  	if (unlikely(!guc_submission_initialized(guc)))
> >  		return;
> >  
> > +	xa_lock_irqsave(&guc->context_lookup, flags);
> >  	xa_for_each(&guc->context_lookup, index, ce) {
> > +		intel_context_get(ce);
> > +		xa_unlock(&guc->context_lookup);
> > +
> >  		if (!intel_context_is_pinned(ce))
> > -			continue;
> > +			goto next;
> >  
> >  		if (intel_engine_is_virtual(ce->engine)) {
> >  			if (!(ce->engine->mask & engine->mask))
> > -				continue;
> > +				goto next;
> >  		} else {
> >  			if (ce->engine != engine)
> > -				continue;
> > +				goto next;
> >  		}
> >  
> >  		spin_lock_irqsave(&ce->guc_active.lock, flags);
> >  		intel_engine_dump_active_requests(&ce->guc_active.requests,
> >  						  hung_rq, m);
> >  		spin_unlock_irqrestore(&ce->guc_active.lock, flags);
> > +
> > +next:
> > +		intel_context_put(ce);
> > +		xa_lock(&guc->context_lookup);
> >  	}
> > +	xa_unlock_irqrestore(&guc->context_lookup, flags);
> >  }
> >  
> >  void intel_guc_submission_print_info(struct intel_guc *guc,
> > @@ -2960,7 +3019,9 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
> >  {
> >  	struct intel_context *ce;
> >  	unsigned long index;
> > +	unsigned long flags;
> >  
> > +	xa_lock_irqsave(&guc->context_lookup, flags);
> >  	xa_for_each(&guc->context_lookup, index, ce) {
> >  		drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id);
> >  		drm_printf(p, "\tHW Context Desc: 0x%08x\n", ce->lrc.lrca);
> > @@ -2979,6 +3040,7 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
> >  
> >  		guc_log_context_priority(p, ce);
> >  	}
> > +	xa_unlock_irqrestore(&guc->context_lookup, flags);
> >  }
> >  
> >  static struct intel_context *
> > -- 
> > 2.32.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
