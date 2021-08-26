Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 605B53F8154
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 05:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA9D6E4BB;
	Thu, 26 Aug 2021 03:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181406E4BA;
 Thu, 26 Aug 2021 03:54:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="217380949"
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="217380949"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 20:54:22 -0700
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="598340686"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 20:54:22 -0700
Date: Wed, 25 Aug 2021 20:49:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 24/33] drm/i915/guc: Implement banned
 contexts for GuC submission
Message-ID: <20210826034911.GA18286@jons-linux-dev-box>
References: <20210727002348.97202-1-matthew.brost@intel.com>
 <20210727002348.97202-25-matthew.brost@intel.com>
 <dfba1e19-0b6f-7e03-0eea-cc6c3d3b4a9a@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfba1e19-0b6f-7e03-0eea-cc6c3d3b4a9a@linux.intel.com>
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

On Wed, Aug 25, 2021 at 11:39:10AM +0100, Tvrtko Ursulin wrote:
> 
> On 27/07/2021 01:23, Matthew Brost wrote:
> > When using GuC submission, if a context gets banned disable scheduling
> > and mark all inflight requests as complete.
> > 
> > Cc: John Harrison <John.C.Harrison@Intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_context.c   |   2 +-
> >   drivers/gpu/drm/i915/gt/intel_context.h       |  13 ++
> >   drivers/gpu/drm/i915/gt/intel_context_types.h |   2 +
> >   drivers/gpu/drm/i915/gt/intel_reset.c         |  32 +---
> >   .../gpu/drm/i915/gt/intel_ring_submission.c   |  20 +++
> >   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   2 +
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 151 ++++++++++++++++--
> >   drivers/gpu/drm/i915/i915_trace.h             |  10 ++
> >   8 files changed, 195 insertions(+), 37 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > index e3df01a201d7..05c3ee191710 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > @@ -1084,7 +1084,7 @@ static void kill_engines(struct i915_gem_engines *engines, bool ban)
> >   	for_each_gem_engine(ce, engines, it) {
> >   		struct intel_engine_cs *engine;
> > -		if (ban && intel_context_set_banned(ce))
> > +		if (ban && intel_context_ban(ce, NULL))
> >   			continue;
> >   		/*
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> > index 2ed9bf5f91a5..814d9277096a 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> > @@ -16,6 +16,7 @@
> >   #include "intel_engine_types.h"
> >   #include "intel_ring_types.h"
> >   #include "intel_timeline_types.h"
> > +#include "i915_trace.h"
> >   #define CE_TRACE(ce, fmt, ...) do {					\
> >   	const struct intel_context *ce__ = (ce);			\
> > @@ -243,6 +244,18 @@ static inline bool intel_context_set_banned(struct intel_context *ce)
> >   	return test_and_set_bit(CONTEXT_BANNED, &ce->flags);
> >   }
> > +static inline bool intel_context_ban(struct intel_context *ce,
> > +				     struct i915_request *rq)
> > +{
> > +	bool ret = intel_context_set_banned(ce);
> > +
> > +	trace_intel_context_ban(ce);
> > +	if (ce->ops->ban)
> > +		ce->ops->ban(ce, rq);
> > +
> > +	return ret;
> > +}
> > +
> >   static inline bool
> >   intel_context_force_single_submission(const struct intel_context *ce)
> >   {
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > index 035108c10b2c..57c19ee3e313 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > @@ -35,6 +35,8 @@ struct intel_context_ops {
> >   	int (*alloc)(struct intel_context *ce);
> > +	void (*ban)(struct intel_context *ce, struct i915_request *rq);
> > +
> >   	int (*pre_pin)(struct intel_context *ce, struct i915_gem_ww_ctx *ww, void **vaddr);
> >   	int (*pin)(struct intel_context *ce, void *vaddr);
> >   	void (*unpin)(struct intel_context *ce);
> > diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> > index 4d281bc8a38c..91200c43951f 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> > @@ -22,7 +22,6 @@
> >   #include "intel_reset.h"
> >   #include "uc/intel_guc.h"
> > -#include "uc/intel_guc_submission.h"
> >   #define RESET_MAX_RETRIES 3
> > @@ -39,21 +38,6 @@ static void rmw_clear_fw(struct intel_uncore *uncore, i915_reg_t reg, u32 clr)
> >   	intel_uncore_rmw_fw(uncore, reg, clr, 0);
> >   }
> > -static void skip_context(struct i915_request *rq)
> > -{
> > -	struct intel_context *hung_ctx = rq->context;
> > -
> > -	list_for_each_entry_from_rcu(rq, &hung_ctx->timeline->requests, link) {
> > -		if (!i915_request_is_active(rq))
> > -			return;
> > -
> > -		if (rq->context == hung_ctx) {
> > -			i915_request_set_error_once(rq, -EIO);
> > -			__i915_request_skip(rq);
> > -		}
> > -	}
> > -}
> > -
> >   static void client_mark_guilty(struct i915_gem_context *ctx, bool banned)
> >   {
> >   	struct drm_i915_file_private *file_priv = ctx->file_priv;
> > @@ -88,10 +72,8 @@ static bool mark_guilty(struct i915_request *rq)
> >   	bool banned;
> >   	int i;
> > -	if (intel_context_is_closed(rq->context)) {
> > -		intel_context_set_banned(rq->context);
> > +	if (intel_context_is_closed(rq->context))
> >   		return true;
> > -	}
> >   	rcu_read_lock();
> >   	ctx = rcu_dereference(rq->context->gem_context);
> > @@ -123,11 +105,9 @@ static bool mark_guilty(struct i915_request *rq)
> >   	banned = !i915_gem_context_is_recoverable(ctx);
> >   	if (time_before(jiffies, prev_hang + CONTEXT_FAST_HANG_JIFFIES))
> >   		banned = true;
> > -	if (banned) {
> > +	if (banned)
> >   		drm_dbg(&ctx->i915->drm, "context %s: guilty %d, banned\n",
> >   			ctx->name, atomic_read(&ctx->guilty_count));
> > -		intel_context_set_banned(rq->context);
> > -	}
> >   	client_mark_guilty(ctx, banned);
> > @@ -149,6 +129,8 @@ static void mark_innocent(struct i915_request *rq)
> >   void __i915_request_reset(struct i915_request *rq, bool guilty)
> >   {
> > +	bool banned = false;
> > +
> >   	RQ_TRACE(rq, "guilty? %s\n", yesno(guilty));
> >   	GEM_BUG_ON(__i915_request_is_complete(rq));
> > @@ -156,13 +138,15 @@ void __i915_request_reset(struct i915_request *rq, bool guilty)
> >   	if (guilty) {
> >   		i915_request_set_error_once(rq, -EIO);
> >   		__i915_request_skip(rq);
> > -		if (mark_guilty(rq) && !intel_engine_uses_guc(rq->engine))
> > -			skip_context(rq);
> > +		banned = mark_guilty(rq);
> >   	} else {
> >   		i915_request_set_error_once(rq, -EAGAIN);
> >   		mark_innocent(rq);
> >   	}
> >   	rcu_read_unlock();
> > +
> > +	if (banned)
> > +		intel_context_ban(rq->context, rq);
> >   }
> >   static bool i915_in_reset(struct pci_dev *pdev)
> > diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> > index a5404c7b600f..05bb9f449df1 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> > @@ -586,9 +586,29 @@ static void ring_context_reset(struct intel_context *ce)
> >   	clear_bit(CONTEXT_VALID_BIT, &ce->flags);
> >   }
> > +static void ring_context_ban(struct intel_context *ce,
> > +			     struct i915_request *rq)
> > +{
> > +	struct intel_engine_cs *engine;
> > +
> > +	if (!rq || !i915_request_is_active(rq))
> > +		return;
> When this gets called from context close, via intel_context_ban, rq will be
> always NULL - so the below loop which skips a line of executing requests
> never gets to run.
> 
> This appears a functional change versus previous state of the codebase,
> where skip_context() would run in any case.
> 

Hmm, not so sure about this being a functional change. When called from
__i915_request_reset, intel_context_ban (previously skip_context there)
always has a non-NULL request argument. When called from kill_engines
the request is NULL (short circuiting ring function), but we never
hooked into the ring backend before.

> I had this observation from a patch I am working on (https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_7950/shard-snb6/igt@gem_ctx_exec@basic-nohangcheck.html
> - so a long line of executing requests which did not get zapped post reset),
> but may be wrong. Maybe I am missing something since I don't yet understand
> why would I be first to hit this issue. So take it with a grain of salt for
> now.
> 

CI was green on my series but CI doesn't always catch everything...

Do you have link to your series that I can look at?

> Ah.. maybe the key is that in my patch I made intel_context_ban not call
> ce->ops->"ban" (I renamed it to revoke) unconditionally. Hence there may be
> a path there intel_context_ban is first called wo/ a rq, then from within
> __i915_request_reset it gets called with rq, which now fails to call the
> vfunc. Hm that's clunky and fragile which ever way I look at it. I'll trybot
> one more experiment..
>

I'm open to suggestions on how to change this, to make it makes sense to
call into the function unconditionally with a correct arguments and the
backend handles the rest (i.e. the way it is currently).

Matt

> Regards,
> 
> Tvrtko
> 
> > +
> > +	engine = rq->engine;
> > +	lockdep_assert_held(&engine->sched_engine->lock);
> > +	list_for_each_entry_continue(rq, &engine->sched_engine->requests,
> > +				     sched.link)
> > +		if (rq->context == ce) {
> > +			i915_request_set_error_once(rq, -EIO);
> > +			__i915_request_skip(rq);
> > +		}
> > +}
> > +
> >   static const struct intel_context_ops ring_context_ops = {
> >   	.alloc = ring_context_alloc,
> > +	.ban = ring_context_ban,
> > +
> >   	.pre_pin = ring_context_pre_pin,
> >   	.pin = ring_context_pin,
> >   	.unpin = ring_context_unpin,
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > index 1875303c3bca..8ab70a2223b0 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > @@ -281,6 +281,8 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine);
> >   int intel_guc_global_policies_update(struct intel_guc *guc);
> > +void intel_guc_context_ban(struct intel_context *ce, struct i915_request *rq);
> > +
> >   void intel_guc_submission_reset_prepare(struct intel_guc *guc);
> >   void intel_guc_submission_reset(struct intel_guc *guc, bool stalled);
> >   void intel_guc_submission_reset_finish(struct intel_guc *guc);
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index cea3e3073a71..ad9a38a861df 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -125,6 +125,7 @@ static inline void clr_context_pending_enable(struct intel_context *ce)
> >   #define SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER	BIT(0)
> >   #define SCHED_STATE_DESTROYED				BIT(1)
> >   #define SCHED_STATE_PENDING_DISABLE			BIT(2)
> > +#define SCHED_STATE_BANNED				BIT(3)
> >   static inline void init_sched_state(struct intel_context *ce)
> >   {
> >   	/* Only should be called from guc_lrc_desc_pin() */
> > @@ -185,6 +186,23 @@ static inline void clr_context_pending_disable(struct intel_context *ce)
> >   	ce->guc_state.sched_state &= ~SCHED_STATE_PENDING_DISABLE;
> >   }
> > +static inline bool context_banned(struct intel_context *ce)
> > +{
> > +	return ce->guc_state.sched_state & SCHED_STATE_BANNED;
> > +}
> > +
> > +static inline void set_context_banned(struct intel_context *ce)
> > +{
> > +	lockdep_assert_held(&ce->guc_state.lock);
> > +	ce->guc_state.sched_state |= SCHED_STATE_BANNED;
> > +}
> > +
> > +static inline void clr_context_banned(struct intel_context *ce)
> > +{
> > +	lockdep_assert_held(&ce->guc_state.lock);
> > +	ce->guc_state.sched_state &= ~SCHED_STATE_BANNED;
> > +}
> > +
> >   static inline bool context_guc_id_invalid(struct intel_context *ce)
> >   {
> >   	return ce->guc_id == GUC_INVALID_LRC_ID;
> > @@ -357,13 +375,23 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop);
> >   static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
> >   {
> > -	int err;
> > +	int err = 0;
> >   	struct intel_context *ce = rq->context;
> >   	u32 action[3];
> >   	int len = 0;
> >   	u32 g2h_len_dw = 0;
> >   	bool enabled;
> > +	/*
> > +	 * Corner case where requests were sitting in the priority list or a
> > +	 * request resubmitted after the context was banned.
> > +	 */
> > +	if (unlikely(intel_context_is_banned(ce))) {
> > +		i915_request_put(i915_request_mark_eio(rq));
> > +		intel_engine_signal_breadcrumbs(ce->engine);
> > +		goto out;
> > +	}
> > +
> >   	GEM_BUG_ON(!atomic_read(&ce->guc_id_ref));
> >   	GEM_BUG_ON(context_guc_id_invalid(ce));
> > @@ -399,6 +427,8 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
> >   		clr_context_pending_enable(ce);
> >   		intel_context_put(ce);
> >   	}
> > +	if (likely(!err))
> > +		trace_i915_request_guc_submit(rq);
> >   out:
> >   	return err;
> > @@ -463,7 +493,6 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
> >   			guc->stalled_request = last;
> >   			return false;
> >   		}
> > -		trace_i915_request_guc_submit(last);
> >   	}
> >   	guc->stalled_request = NULL;
> > @@ -502,12 +531,13 @@ static void cs_irq_handler(struct intel_engine_cs *engine, u16 iir)
> >   static void __guc_context_destroy(struct intel_context *ce);
> >   static void release_guc_id(struct intel_guc *guc, struct intel_context *ce);
> >   static void guc_signal_context_fence(struct intel_context *ce);
> > +static void guc_cancel_context_requests(struct intel_context *ce);
> >   static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
> >   {
> >   	struct intel_context *ce;
> >   	unsigned long index, flags;
> > -	bool pending_disable, pending_enable, deregister, destroyed;
> > +	bool pending_disable, pending_enable, deregister, destroyed, banned;
> >   	xa_for_each(&guc->context_lookup, index, ce) {
> >   		/* Flush context */
> > @@ -525,6 +555,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
> >   		pending_enable = context_pending_enable(ce);
> >   		pending_disable = context_pending_disable(ce);
> >   		deregister = context_wait_for_deregister_to_register(ce);
> > +		banned = context_banned(ce);
> >   		init_sched_state(ce);
> >   		if (pending_enable || destroyed || deregister) {
> > @@ -542,6 +573,10 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
> >   		/* Not mutualy exclusive with above if statement. */
> >   		if (pending_disable) {
> >   			guc_signal_context_fence(ce);
> > +			if (banned) {
> > +				guc_cancel_context_requests(ce);
> > +				intel_engine_signal_breadcrumbs(ce->engine);
> > +			}
> >   			intel_context_sched_disable_unpin(ce);
> >   			atomic_dec(&guc->outstanding_submission_g2h);
> >   			intel_context_put(ce);
> > @@ -661,6 +696,9 @@ static void guc_reset_state(struct intel_context *ce, u32 head, bool scrub)
> >   {
> >   	struct intel_engine_cs *engine = __context_to_physical_engine(ce);
> > +	if (intel_context_is_banned(ce))
> > +		return;
> > +
> >   	GEM_BUG_ON(!intel_context_is_pinned(ce));
> >   	/*
> > @@ -731,6 +769,8 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
> >   	struct i915_request *rq;
> >   	u32 head;
> > +	intel_context_get(ce);
> > +
> >   	/*
> >   	 * GuC will implicitly mark the context as non-schedulable
> >   	 * when it sends the reset notification. Make sure our state
> > @@ -756,6 +796,7 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
> >   out_replay:
> >   	guc_reset_state(ce, head, stalled);
> >   	__unwind_incomplete_requests(ce);
> > +	intel_context_put(ce);
> >   }
> >   void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
> > @@ -940,8 +981,6 @@ static int guc_bypass_tasklet_submit(struct intel_guc *guc,
> >   	ret = guc_add_request(guc, rq);
> >   	if (ret == -EBUSY)
> >   		guc->stalled_request = rq;
> > -	else
> > -		trace_i915_request_guc_submit(rq);
> >   	if (unlikely(ret == -EPIPE))
> >   		disable_submission(guc);
> > @@ -1344,13 +1383,77 @@ static u16 prep_context_pending_disable(struct intel_context *ce)
> >   	return ce->guc_id;
> >   }
> > +static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
> > +						 u16 guc_id,
> > +						 u32 preemption_timeout)
> > +{
> > +	u32 action[] = {
> > +		INTEL_GUC_ACTION_SET_CONTEXT_PREEMPTION_TIMEOUT,
> > +		guc_id,
> > +		preemption_timeout
> > +	};
> > +
> > +	intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
> > +}
> > +
> > +static void guc_context_ban(struct intel_context *ce, struct i915_request *rq)
> > +{
> > +	struct intel_guc *guc = ce_to_guc(ce);
> > +	struct intel_runtime_pm *runtime_pm =
> > +		&ce->engine->gt->i915->runtime_pm;
> > +	intel_wakeref_t wakeref;
> > +	unsigned long flags;
> > +
> > +	guc_flush_submissions(guc);
> > +
> > +	spin_lock_irqsave(&ce->guc_state.lock, flags);
> > +	set_context_banned(ce);
> > +
> > +	if (submission_disabled(guc) ||
> > +	    (!context_enabled(ce) && !context_pending_disable(ce))) {
> > +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> > +
> > +		guc_cancel_context_requests(ce);
> > +		intel_engine_signal_breadcrumbs(ce->engine);
> > +	} else if (!context_pending_disable(ce)) {
> > +		u16 guc_id;
> > +
> > +		/*
> > +		 * We add +2 here as the schedule disable complete CTB handler
> > +		 * calls intel_context_sched_disable_unpin (-2 to pin_count).
> > +		 */
> > +		atomic_add(2, &ce->pin_count);
> > +
> > +		guc_id = prep_context_pending_disable(ce);
> > +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> > +
> > +		/*
> > +		 * In addition to disabling scheduling, set the preemption
> > +		 * timeout to the minimum value (1 us) so the banned context
> > +		 * gets kicked off the HW ASAP.
> > +		 */
> > +		with_intel_runtime_pm(runtime_pm, wakeref) {
> > +			__guc_context_set_preemption_timeout(guc, guc_id, 1);
> > +			__guc_context_sched_disable(guc, ce, guc_id);
> > +		}
> > +	} else {
> > +		if (!context_guc_id_invalid(ce))
> > +			with_intel_runtime_pm(runtime_pm, wakeref)
> > +				__guc_context_set_preemption_timeout(guc,
> > +								     ce->guc_id,
> > +								     1);
> > +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> > +	}
> > +}
> > +
> >   static void guc_context_sched_disable(struct intel_context *ce)
> >   {
> >   	struct intel_guc *guc = ce_to_guc(ce);
> > -	struct intel_runtime_pm *runtime_pm = &ce->engine->gt->i915->runtime_pm;
> >   	unsigned long flags;
> > -	u16 guc_id;
> > +	struct intel_runtime_pm *runtime_pm = &ce->engine->gt->i915->runtime_pm;
> >   	intel_wakeref_t wakeref;
> > +	u16 guc_id;
> > +	bool enabled;
> >   	if (submission_disabled(guc) || context_guc_id_invalid(ce) ||
> >   	    !lrc_desc_registered(guc, ce->guc_id)) {
> > @@ -1364,14 +1467,22 @@ static void guc_context_sched_disable(struct intel_context *ce)
> >   	spin_lock_irqsave(&ce->guc_state.lock, flags);
> >   	/*
> > -	 * We have to check if the context has been pinned again as another pin
> > -	 * operation is allowed to pass this function. Checking the pin count,
> > -	 * within ce->guc_state.lock, synchronizes this function with
> > +	 * We have to check if the context has been disabled by another thread.
> > +	 * We also have to check if the context has been pinned again as another
> > +	 * pin operation is allowed to pass this function. Checking the pin
> > +	 * count, within ce->guc_state.lock, synchronizes this function with
> >   	 * guc_request_alloc ensuring a request doesn't slip through the
> >   	 * 'context_pending_disable' fence. Checking within the spin lock (can't
> >   	 * sleep) ensures another process doesn't pin this context and generate
> >   	 * a request before we set the 'context_pending_disable' flag here.
> >   	 */
> > +	enabled = context_enabled(ce);
> > +	if (unlikely(!enabled || submission_disabled(guc))) {
> > +		if (enabled)
> > +			clr_context_enabled(ce);
> > +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> > +		goto unpin;
> > +	}
> >   	if (unlikely(atomic_add_unless(&ce->pin_count, -2, 2))) {
> >   		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> >   		return;
> > @@ -1529,6 +1640,8 @@ static const struct intel_context_ops guc_context_ops = {
> >   	.unpin = guc_context_unpin,
> >   	.post_unpin = guc_context_post_unpin,
> > +	.ban = guc_context_ban,
> > +
> >   	.enter = intel_context_enter_engine,
> >   	.exit = intel_context_exit_engine,
> > @@ -1722,6 +1835,8 @@ static const struct intel_context_ops virtual_guc_context_ops = {
> >   	.unpin = guc_context_unpin,
> >   	.post_unpin = guc_context_post_unpin,
> > +	.ban = guc_context_ban,
> > +
> >   	.enter = guc_virtual_context_enter,
> >   	.exit = guc_virtual_context_exit,
> > @@ -2164,6 +2279,8 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
> >   	if (context_pending_enable(ce)) {
> >   		clr_context_pending_enable(ce);
> >   	} else if (context_pending_disable(ce)) {
> > +		bool banned;
> > +
> >   		/*
> >   		 * Unpin must be done before __guc_signal_context_fence,
> >   		 * otherwise a race exists between the requests getting
> > @@ -2174,9 +2291,16 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
> >   		intel_context_sched_disable_unpin(ce);
> >   		spin_lock_irqsave(&ce->guc_state.lock, flags);
> > +		banned = context_banned(ce);
> > +		clr_context_banned(ce);
> >   		clr_context_pending_disable(ce);
> >   		__guc_signal_context_fence(ce);
> >   		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> > +
> > +		if (banned) {
> > +			guc_cancel_context_requests(ce);
> > +			intel_engine_signal_breadcrumbs(ce->engine);
> > +		}
> >   	}
> >   	decr_outstanding_submission_g2h(guc);
> > @@ -2211,8 +2335,11 @@ static void guc_handle_context_reset(struct intel_guc *guc,
> >   				     struct intel_context *ce)
> >   {
> >   	trace_intel_context_reset(ce);
> > -	capture_error_state(guc, ce);
> > -	guc_context_replay(ce);
> > +
> > +	if (likely(!intel_context_is_banned(ce))) {
> > +		capture_error_state(guc, ce);
> > +		guc_context_replay(ce);
> > +	}
> >   }
> >   int intel_guc_context_reset_process_msg(struct intel_guc *guc,
> > diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
> > index 3f43d904f043..9613a7c19661 100644
> > --- a/drivers/gpu/drm/i915/i915_trace.h
> > +++ b/drivers/gpu/drm/i915/i915_trace.h
> > @@ -925,6 +925,11 @@ DEFINE_EVENT(intel_context, intel_context_reset,
> >   	     TP_ARGS(ce)
> >   );
> > +DEFINE_EVENT(intel_context, intel_context_ban,
> > +	     TP_PROTO(struct intel_context *ce),
> > +	     TP_ARGS(ce)
> > +);
> > +
> >   DEFINE_EVENT(intel_context, intel_context_register,
> >   	     TP_PROTO(struct intel_context *ce),
> >   	     TP_ARGS(ce)
> > @@ -1017,6 +1022,11 @@ trace_intel_context_reset(struct intel_context *ce)
> >   {
> >   }
> > +static inline void
> > +trace_intel_context_ban(struct intel_context *ce)
> > +{
> > +}
> > +
> >   static inline void
> >   trace_intel_context_register(struct intel_context *ce)
> >   {
> > 
