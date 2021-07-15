Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7ED3C9543
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 02:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDD46E4E3;
	Thu, 15 Jul 2021 00:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FAC56E4B6;
 Thu, 15 Jul 2021 00:53:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="210265465"
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="210265465"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 17:53:25 -0700
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="630564591"
Received: from dut031-tgly.fm.intel.com ([10.105.19.16])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 17:53:25 -0700
Date: Thu, 15 Jul 2021 00:53:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH 31/47] drm/i915/guc: Reset implementation for new GuC
 interface
Message-ID: <20210715005323.GA18153@DUT031-TGLY.fm.intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-32-matthew.brost@intel.com>
 <844763b3-3abd-f7c8-5f62-8e255165a9cd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <844763b3-3abd-f7c8-5f62-8e255165a9cd@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 12, 2021 at 12:58:45PM -0700, John Harrison wrote:
> On 6/24/2021 00:05, Matthew Brost wrote:
> > Reset implementation for new GuC interface. This is the legacy reset
> > implementation which is called when the i915 owns the engine hang check.
> > Future patches will offload the engine hang check to GuC but we will
> > continue to maintain this legacy path as a fallback and this code path
> > is also required if the GuC dies.
> > 
> > With the new GuC interface it is not possible to reset individual
> > engines - it is only possible to reset the GPU entirely. This patch
> > forces an entire chip reset if any engine hangs.
> There seems to be quite a lot more code being changed in the patch than is
> described above. Sure, it's all in order to support resets but there is a
> lot happening to request/context management, support for GuC submission
> enable/disable, etc. It feels like this patch really should be split into a
> couple of prep patches followed by the actual reset support. Plus see couple
> of minor comments below.
> 

Yea, this is probably the most churned on patch we have as getting
resets to full work isn't easy. I'll fix the below comments but I don't
know if it worth spliting. Everything in the patch is required to get
resets to work and I think it is better to have in a single patch so
'git blame' can give you the whole picture.

Matt 

> > Cc: John Harrison <john.c.harrison@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_context.c       |   3 +
> >   drivers/gpu/drm/i915/gt/intel_context_types.h |   7 +
> >   drivers/gpu/drm/i915/gt/intel_engine_types.h  |   6 +
> >   .../drm/i915/gt/intel_execlists_submission.c  |  40 ++
> >   drivers/gpu/drm/i915/gt/intel_gt_pm.c         |   6 +-
> >   drivers/gpu/drm/i915/gt/intel_reset.c         |  18 +-
> >   .../gpu/drm/i915/gt/intel_ring_submission.c   |  22 +
> >   drivers/gpu/drm/i915/gt/mock_engine.c         |  31 +
> >   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  13 -
> >   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   8 +-
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 581 ++++++++++++++----
> >   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  39 +-
> >   drivers/gpu/drm/i915/gt/uc/intel_uc.h         |   3 +
> >   drivers/gpu/drm/i915/i915_request.c           |  41 +-
> >   drivers/gpu/drm/i915/i915_request.h           |   2 +
> >   15 files changed, 649 insertions(+), 171 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> > index b24a1b7a3f88..2f01437056a8 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> > @@ -392,6 +392,9 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
> >   	spin_lock_init(&ce->guc_state.lock);
> >   	INIT_LIST_HEAD(&ce->guc_state.fences);
> > +	spin_lock_init(&ce->guc_active.lock);
> > +	INIT_LIST_HEAD(&ce->guc_active.requests);
> > +
> >   	ce->guc_id = GUC_INVALID_LRC_ID;
> >   	INIT_LIST_HEAD(&ce->guc_id_link);
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > index 6945963a31ba..b63c8cf7823b 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > @@ -165,6 +165,13 @@ struct intel_context {
> >   		struct list_head fences;
> >   	} guc_state;
> > +	struct {
> > +		/** lock: protects everything in guc_active */
> > +		spinlock_t lock;
> > +		/** requests: active requests on this context */
> > +		struct list_head requests;
> > +	} guc_active;
> > +
> >   	/* GuC scheduling state that does not require a lock. */
> >   	atomic_t guc_sched_state_no_lock;
> > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > index e7cb6a06db9d..f9d264c008e8 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > @@ -426,6 +426,12 @@ struct intel_engine_cs {
> >   	void		(*release)(struct intel_engine_cs *engine);
> > +	/*
> > +	 * Add / remove request from engine active tracking
> > +	 */
> > +	void		(*add_active_request)(struct i915_request *rq);
> > +	void		(*remove_active_request)(struct i915_request *rq);
> > +
> >   	struct intel_engine_execlists execlists;
> >   	/*
> > diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > index c10ea6080752..c301a2d088b1 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > @@ -3118,6 +3118,42 @@ static void execlists_park(struct intel_engine_cs *engine)
> >   	cancel_timer(&engine->execlists.preempt);
> >   }
> > +static void add_to_engine(struct i915_request *rq)
> > +{
> > +	lockdep_assert_held(&rq->engine->sched_engine->lock);
> > +	list_move_tail(&rq->sched.link, &rq->engine->sched_engine->requests);
> > +}
> > +
> > +static void remove_from_engine(struct i915_request *rq)
> > +{
> > +	struct intel_engine_cs *engine, *locked;
> > +
> > +	/*
> > +	 * Virtual engines complicate acquiring the engine timeline lock,
> > +	 * as their rq->engine pointer is not stable until under that
> > +	 * engine lock. The simple ploy we use is to take the lock then
> > +	 * check that the rq still belongs to the newly locked engine.
> > +	 */
> > +	locked = READ_ONCE(rq->engine);
> > +	spin_lock_irq(&locked->sched_engine->lock);
> > +	while (unlikely(locked != (engine = READ_ONCE(rq->engine)))) {
> > +		spin_unlock(&locked->sched_engine->lock);
> > +		spin_lock(&engine->sched_engine->lock);
> > +		locked = engine;
> > +	}
> > +	list_del_init(&rq->sched.link);
> > +
> > +	clear_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
> > +	clear_bit(I915_FENCE_FLAG_HOLD, &rq->fence.flags);
> > +
> > +	/* Prevent further __await_execution() registering a cb, then flush */
> > +	set_bit(I915_FENCE_FLAG_ACTIVE, &rq->fence.flags);
> > +
> > +	spin_unlock_irq(&locked->sched_engine->lock);
> > +
> > +	i915_request_notify_execute_cb_imm(rq);
> > +}
> > +
> >   static bool can_preempt(struct intel_engine_cs *engine)
> >   {
> >   	if (GRAPHICS_VER(engine->i915) > 8)
> > @@ -3218,6 +3254,8 @@ logical_ring_default_vfuncs(struct intel_engine_cs *engine)
> >   	engine->cops = &execlists_context_ops;
> >   	engine->request_alloc = execlists_request_alloc;
> >   	engine->bump_serial = execlist_bump_serial;
> > +	engine->add_active_request = add_to_engine;
> > +	engine->remove_active_request = remove_from_engine;
> >   	engine->reset.prepare = execlists_reset_prepare;
> >   	engine->reset.rewind = execlists_reset_rewind;
> > @@ -3912,6 +3950,8 @@ execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
> >   			 "v%dx%d", ve->base.class, count);
> >   		ve->base.context_size = sibling->context_size;
> > +		ve->base.add_active_request = sibling->add_active_request;
> > +		ve->base.remove_active_request = sibling->remove_active_request;
> >   		ve->base.emit_bb_start = sibling->emit_bb_start;
> >   		ve->base.emit_flush = sibling->emit_flush;
> >   		ve->base.emit_init_breadcrumb = sibling->emit_init_breadcrumb;
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> > index aef3084e8b16..463a6ae605a0 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> > @@ -174,8 +174,6 @@ static void gt_sanitize(struct intel_gt *gt, bool force)
> >   	if (intel_gt_is_wedged(gt))
> >   		intel_gt_unset_wedged(gt);
> > -	intel_uc_sanitize(&gt->uc);
> > -
> >   	for_each_engine(engine, gt, id)
> >   		if (engine->reset.prepare)
> >   			engine->reset.prepare(engine);
> > @@ -191,6 +189,8 @@ static void gt_sanitize(struct intel_gt *gt, bool force)
> >   			__intel_engine_reset(engine, false);
> >   	}
> > +	intel_uc_reset(&gt->uc, false);
> > +
> >   	for_each_engine(engine, gt, id)
> >   		if (engine->reset.finish)
> >   			engine->reset.finish(engine);
> > @@ -243,6 +243,8 @@ int intel_gt_resume(struct intel_gt *gt)
> >   		goto err_wedged;
> >   	}
> > +	intel_uc_reset_finish(&gt->uc);
> > +
> >   	intel_rps_enable(&gt->rps);
> >   	intel_llc_enable(&gt->llc);
> > diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> > index 72251638d4ea..2987282dff6d 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> > @@ -826,6 +826,8 @@ static int gt_reset(struct intel_gt *gt, intel_engine_mask_t stalled_mask)
> >   		__intel_engine_reset(engine, stalled_mask & engine->mask);
> >   	local_bh_enable();
> > +	intel_uc_reset(&gt->uc, true);
> > +
> >   	intel_ggtt_restore_fences(gt->ggtt);
> >   	return err;
> > @@ -850,6 +852,8 @@ static void reset_finish(struct intel_gt *gt, intel_engine_mask_t awake)
> >   		if (awake & engine->mask)
> >   			intel_engine_pm_put(engine);
> >   	}
> > +
> > +	intel_uc_reset_finish(&gt->uc);
> >   }
> >   static void nop_submit_request(struct i915_request *request)
> > @@ -903,6 +907,7 @@ static void __intel_gt_set_wedged(struct intel_gt *gt)
> >   	for_each_engine(engine, gt, id)
> >   		if (engine->reset.cancel)
> >   			engine->reset.cancel(engine);
> > +	intel_uc_cancel_requests(&gt->uc);
> >   	local_bh_enable();
> >   	reset_finish(gt, awake);
> > @@ -1191,6 +1196,9 @@ int __intel_engine_reset_bh(struct intel_engine_cs *engine, const char *msg)
> >   	ENGINE_TRACE(engine, "flags=%lx\n", gt->reset.flags);
> >   	GEM_BUG_ON(!test_bit(I915_RESET_ENGINE + engine->id, &gt->reset.flags));
> > +	if (intel_engine_uses_guc(engine))
> > +		return -ENODEV;
> > +
> >   	if (!intel_engine_pm_get_if_awake(engine))
> >   		return 0;
> > @@ -1201,13 +1209,10 @@ int __intel_engine_reset_bh(struct intel_engine_cs *engine, const char *msg)
> >   			   "Resetting %s for %s\n", engine->name, msg);
> >   	atomic_inc(&engine->i915->gpu_error.reset_engine_count[engine->uabi_class]);
> > -	if (intel_engine_uses_guc(engine))
> > -		ret = intel_guc_reset_engine(&engine->gt->uc.guc, engine);
> > -	else
> > -		ret = intel_gt_reset_engine(engine);
> > +	ret = intel_gt_reset_engine(engine);
> >   	if (ret) {
> >   		/* If we fail here, we expect to fallback to a global reset */
> > -		ENGINE_TRACE(engine, "Failed to reset, err: %d\n", ret);
> > +		ENGINE_TRACE(engine, "Failed to reset %s, err: %d\n", engine->name, ret);
> >   		goto out;
> >   	}
> > @@ -1341,7 +1346,8 @@ void intel_gt_handle_error(struct intel_gt *gt,
> >   	 * Try engine reset when available. We fall back to full reset if
> >   	 * single reset fails.
> >   	 */
> > -	if (intel_has_reset_engine(gt) && !intel_gt_is_wedged(gt)) {
> > +	if (!intel_uc_uses_guc_submission(&gt->uc) &&
> > +	    intel_has_reset_engine(gt) && !intel_gt_is_wedged(gt)) {
> >   		local_bh_disable();
> >   		for_each_engine_masked(engine, gt, engine_mask, tmp) {
> >   			BUILD_BUG_ON(I915_RESET_MODESET >= I915_RESET_ENGINE);
> > diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> > index e1506b280df1..99dcdc8fba12 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> > @@ -1049,6 +1049,25 @@ static void ring_bump_serial(struct intel_engine_cs *engine)
> >   	engine->serial++;
> >   }
> > +static void add_to_engine(struct i915_request *rq)
> > +{
> > +	lockdep_assert_held(&rq->engine->sched_engine->lock);
> > +	list_move_tail(&rq->sched.link, &rq->engine->sched_engine->requests);
> > +}
> > +
> > +static void remove_from_engine(struct i915_request *rq)
> > +{
> > +	spin_lock_irq(&rq->engine->sched_engine->lock);
> > +	list_del_init(&rq->sched.link);
> > +
> > +	/* Prevent further __await_execution() registering a cb, then flush */
> > +	set_bit(I915_FENCE_FLAG_ACTIVE, &rq->fence.flags);
> > +
> > +	spin_unlock_irq(&rq->engine->sched_engine->lock);
> > +
> > +	i915_request_notify_execute_cb_imm(rq);
> > +}
> > +
> >   static void setup_common(struct intel_engine_cs *engine)
> >   {
> >   	struct drm_i915_private *i915 = engine->i915;
> > @@ -1066,6 +1085,9 @@ static void setup_common(struct intel_engine_cs *engine)
> >   	engine->reset.cancel = reset_cancel;
> >   	engine->reset.finish = reset_finish;
> > +	engine->add_active_request = add_to_engine;
> > +	engine->remove_active_request = remove_from_engine;
> > +
> >   	engine->cops = &ring_context_ops;
> >   	engine->request_alloc = ring_request_alloc;
> >   	engine->bump_serial = ring_bump_serial;
> > diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
> > index fc5a65ab1937..c12ff3a75ce6 100644
> > --- a/drivers/gpu/drm/i915/gt/mock_engine.c
> > +++ b/drivers/gpu/drm/i915/gt/mock_engine.c
> > @@ -235,6 +235,35 @@ static void mock_submit_request(struct i915_request *request)
> >   	spin_unlock_irqrestore(&engine->hw_lock, flags);
> >   }
> > +static void mock_add_to_engine(struct i915_request *rq)
> > +{
> > +	lockdep_assert_held(&rq->engine->sched_engine->lock);
> > +	list_move_tail(&rq->sched.link, &rq->engine->sched_engine->requests);
> > +}
> > +
> > +static void mock_remove_from_engine(struct i915_request *rq)
> > +{
> > +	struct intel_engine_cs *engine, *locked;
> > +
> > +	/*
> > +	 * Virtual engines complicate acquiring the engine timeline lock,
> > +	 * as their rq->engine pointer is not stable until under that
> > +	 * engine lock. The simple ploy we use is to take the lock then
> > +	 * check that the rq still belongs to the newly locked engine.
> > +	 */
> > +
> > +	locked = READ_ONCE(rq->engine);
> > +	spin_lock_irq(&locked->sched_engine->lock);
> > +	while (unlikely(locked != (engine = READ_ONCE(rq->engine)))) {
> > +		spin_unlock(&locked->sched_engine->lock);
> > +		spin_lock(&engine->sched_engine->lock);
> > +		locked = engine;
> > +	}
> > +	list_del_init(&rq->sched.link);
> > +	spin_unlock_irq(&locked->sched_engine->lock);
> > +}
> > +
> > +
> >   static void mock_reset_prepare(struct intel_engine_cs *engine)
> >   {
> >   }
> > @@ -327,6 +356,8 @@ struct intel_engine_cs *mock_engine(struct drm_i915_private *i915,
> >   	engine->base.emit_flush = mock_emit_flush;
> >   	engine->base.emit_fini_breadcrumb = mock_emit_breadcrumb;
> >   	engine->base.submit_request = mock_submit_request;
> > +	engine->base.add_active_request = mock_add_to_engine;
> > +	engine->base.remove_active_request = mock_remove_from_engine;
> >   	engine->base.reset.prepare = mock_reset_prepare;
> >   	engine->base.reset.rewind = mock_reset_rewind;
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> > index 6661dcb02239..9b09395b998f 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> > @@ -572,19 +572,6 @@ int intel_guc_suspend(struct intel_guc *guc)
> >   	return 0;
> >   }
> > -/**
> > - * intel_guc_reset_engine() - ask GuC to reset an engine
> > - * @guc:	intel_guc structure
> > - * @engine:	engine to be reset
> > - */
> > -int intel_guc_reset_engine(struct intel_guc *guc,
> > -			   struct intel_engine_cs *engine)
> > -{
> > -	/* XXX: to be implemented with submission interface rework */
> > -
> > -	return -ENODEV;
> > -}
> > -
> >   /**
> >    * intel_guc_resume() - notify GuC resuming from suspend state
> >    * @guc:	the guc
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > index 22eb1e9cca41..40c9868762d7 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > @@ -242,14 +242,16 @@ static inline void intel_guc_disable_msg(struct intel_guc *guc, u32 mask)
> >   int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout);
> > -int intel_guc_reset_engine(struct intel_guc *guc,
> > -			   struct intel_engine_cs *engine);
> > -
> >   int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
> >   					  const u32 *msg, u32 len);
> >   int intel_guc_sched_done_process_msg(struct intel_guc *guc,
> >   				     const u32 *msg, u32 len);
> > +void intel_guc_submission_reset_prepare(struct intel_guc *guc);
> > +void intel_guc_submission_reset(struct intel_guc *guc, bool stalled);
> > +void intel_guc_submission_reset_finish(struct intel_guc *guc);
> > +void intel_guc_submission_cancel_requests(struct intel_guc *guc);
> > +
> >   void intel_guc_load_status(struct intel_guc *guc, struct drm_printer *p);
> >   #endif
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 83058df5ba01..b8c894ad8caf 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -141,7 +141,7 @@ context_wait_for_deregister_to_register(struct intel_context *ce)
> >   static inline void
> >   set_context_wait_for_deregister_to_register(struct intel_context *ce)
> >   {
> > -	/* Only should be called from guc_lrc_desc_pin() */
> > +	/* Only should be called from guc_lrc_desc_pin() without lock */
> >   	ce->guc_state.sched_state |=
> >   		SCHED_STATE_WAIT_FOR_DEREGISTER_TO_REGISTER;
> >   }
> > @@ -241,15 +241,31 @@ static int guc_lrc_desc_pool_create(struct intel_guc *guc)
> >   static void guc_lrc_desc_pool_destroy(struct intel_guc *guc)
> >   {
> > +	guc->lrc_desc_pool_vaddr = NULL;
> >   	i915_vma_unpin_and_release(&guc->lrc_desc_pool, I915_VMA_RELEASE_MAP);
> >   }
> > +static inline bool guc_submission_initialized(struct intel_guc *guc)
> > +{
> > +	return guc->lrc_desc_pool_vaddr != NULL;
> > +}
> > +
> >   static inline void reset_lrc_desc(struct intel_guc *guc, u32 id)
> >   {
> > -	struct guc_lrc_desc *desc = __get_lrc_desc(guc, id);
> > +	if (likely(guc_submission_initialized(guc))) {
> > +		struct guc_lrc_desc *desc = __get_lrc_desc(guc, id);
> > +		unsigned long flags;
> > -	memset(desc, 0, sizeof(*desc));
> > -	xa_erase_irq(&guc->context_lookup, id);
> > +		memset(desc, 0, sizeof(*desc));
> > +
> > +		/*
> > +		 * xarray API doesn't have xa_erase_irqsave wrapper, so calling
> > +		 * the lower level functions directly.
> > +		 */
> > +		xa_lock_irqsave(&guc->context_lookup, flags);
> > +		__xa_erase(&guc->context_lookup, id);
> > +		xa_unlock_irqrestore(&guc->context_lookup, flags);
> > +	}
> >   }
> >   static inline bool lrc_desc_registered(struct intel_guc *guc, u32 id)
> > @@ -260,7 +276,15 @@ static inline bool lrc_desc_registered(struct intel_guc *guc, u32 id)
> >   static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
> >   					   struct intel_context *ce)
> >   {
> > -	xa_store_irq(&guc->context_lookup, id, ce, GFP_ATOMIC);
> > +	unsigned long flags;
> > +
> > +	/*
> > +	 * xarray API doesn't have xa_save_irqsave wrapper, so calling the
> > +	 * lower level functions directly.
> > +	 */
> > +	xa_lock_irqsave(&guc->context_lookup, flags);
> > +	__xa_store(&guc->context_lookup, id, ce, GFP_ATOMIC);
> > +	xa_unlock_irqrestore(&guc->context_lookup, flags);
> >   }
> >   static int guc_submission_busy_loop(struct intel_guc* guc,
> > @@ -331,6 +355,8 @@ int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout)
> >   					interruptible, timeout);
> >   }
> > +static int guc_lrc_desc_pin(struct intel_context *ce, bool loop);
> > +
> >   static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
> >   {
> >   	int err;
> > @@ -338,11 +364,22 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
> >   	u32 action[3];
> >   	int len = 0;
> >   	u32 g2h_len_dw = 0;
> > -	bool enabled = context_enabled(ce);
> > +	bool enabled;
> >   	GEM_BUG_ON(!atomic_read(&ce->guc_id_ref));
> >   	GEM_BUG_ON(context_guc_id_invalid(ce));
> > +	/*
> > +	 * Corner case where the GuC firmware was blown away and reloaded while
> > +	 * this context was pinned.
> > +	 */
> > +	if (unlikely(!lrc_desc_registered(guc, ce->guc_id))) {
> > +		err = guc_lrc_desc_pin(ce, false);
> > +		if (unlikely(err))
> > +			goto out;
> > +	}
> > +	enabled = context_enabled(ce);
> > +
> >   	if (!enabled) {
> >   		action[len++] = INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
> >   		action[len++] = ce->guc_id;
> > @@ -365,6 +402,7 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
> >   		intel_context_put(ce);
> >   	}
> > +out:
> >   	return err;
> >   }
> > @@ -419,15 +457,10 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
> >   	if (submit) {
> >   		guc_set_lrc_tail(last);
> >   resubmit:
> > -		/*
> > -		 * We only check for -EBUSY here even though it is possible for
> > -		 * -EDEADLK to be returned. If -EDEADLK is returned, the GuC has
> > -		 * died and a full GPU needs to be done. The hangcheck will
> > -		 * eventually detect that the GuC has died and trigger this
> > -		 * reset so no need to handle -EDEADLK here.
> > -		 */
> >   		ret = guc_add_request(guc, last);
> > -		if (ret == -EBUSY) {
> > +		if (unlikely(ret == -EIO))
> > +			goto deadlk;
> > +		else if (ret == -EBUSY) {
> >   			tasklet_schedule(&sched_engine->tasklet);
> >   			guc->stalled_request = last;
> >   			return false;
> > @@ -437,6 +470,11 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
> >   	guc->stalled_request = NULL;
> >   	return submit;
> > +
> > +deadlk:
> > +	sched_engine->tasklet.callback = NULL;
> > +	tasklet_disable_nosync(&sched_engine->tasklet);
> > +	return false;
> >   }
> >   static void guc_submission_tasklet(struct tasklet_struct *t)
> > @@ -463,27 +501,165 @@ static void cs_irq_handler(struct intel_engine_cs *engine, u16 iir)
> >   		intel_engine_signal_breadcrumbs(engine);
> >   }
> > -static void guc_reset_prepare(struct intel_engine_cs *engine)
> > +static void __guc_context_destroy(struct intel_context *ce);
> > +static void release_guc_id(struct intel_guc *guc, struct intel_context *ce);
> > +static void guc_signal_context_fence(struct intel_context *ce);
> > +
> > +static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
> > +{
> > +	struct intel_context *ce;
> > +	unsigned long index, flags;
> > +	bool pending_disable, pending_enable, deregister, destroyed;
> > +
> > +	xa_for_each(&guc->context_lookup, index, ce) {
> > +		/* Flush context */
> > +		spin_lock_irqsave(&ce->guc_state.lock, flags);
> > +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> > +
> > +		/*
> > +		 * Once we are at this point submission_disabled() is guaranteed
> > +		 * to visible to all callers who set the below flags (see above
> to be visible
> 
> > +		 * flush and flushes in reset_prepare). If submission_disabled()
> > +		 * is set, the caller shouldn't set these flags.
> > +		 */
> > +
> > +		destroyed = context_destroyed(ce);
> > +		pending_enable = context_pending_enable(ce);
> > +		pending_disable = context_pending_disable(ce);
> > +		deregister = context_wait_for_deregister_to_register(ce);
> > +		init_sched_state(ce);
> > +
> > +		if (pending_enable || destroyed || deregister) {
> > +			atomic_dec(&guc->outstanding_submission_g2h);
> > +			if (deregister)
> > +				guc_signal_context_fence(ce);
> > +			if (destroyed) {
> > +				release_guc_id(guc, ce);
> > +				__guc_context_destroy(ce);
> > +			}
> > +			if (pending_enable|| deregister)
> > +				intel_context_put(ce);
> > +		}
> > +
> > +		/* Not mutualy exclusive with above if statement. */
> > +		if (pending_disable) {
> > +			guc_signal_context_fence(ce);
> > +			intel_context_sched_disable_unpin(ce);
> > +			atomic_dec(&guc->outstanding_submission_g2h);
> > +			intel_context_put(ce);
> > +		}
> > +	}
> > +}
> > +
> > +static inline bool
> > +submission_disabled(struct intel_guc *guc)
> > +{
> > +	struct i915_sched_engine * const sched_engine = guc->sched_engine;
> > +
> > +	return unlikely(!__tasklet_is_enabled(&sched_engine->tasklet));
> > +}
> > +
> > +static void disable_submission(struct intel_guc *guc)
> > +{
> > +	struct i915_sched_engine * const sched_engine = guc->sched_engine;
> > +
> > +	if (__tasklet_is_enabled(&sched_engine->tasklet)) {
> > +		GEM_BUG_ON(!guc->ct.enabled);
> > +		__tasklet_disable_sync_once(&sched_engine->tasklet);
> > +		sched_engine->tasklet.callback = NULL;
> > +	}
> > +}
> > +
> > +static void enable_submission(struct intel_guc *guc)
> > +{
> > +	struct i915_sched_engine * const sched_engine = guc->sched_engine;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&guc->sched_engine->lock, flags);
> > +	sched_engine->tasklet.callback = guc_submission_tasklet;
> > +	wmb();
> > +	if (!__tasklet_is_enabled(&sched_engine->tasklet) &&
> > +	    __tasklet_enable(&sched_engine->tasklet)) {
> > +		GEM_BUG_ON(!guc->ct.enabled);
> > +
> > +		/* And kick in case we missed a new request submission. */
> > +		tasklet_hi_schedule(&sched_engine->tasklet);
> > +	}
> > +	spin_unlock_irqrestore(&guc->sched_engine->lock, flags);
> > +}
> > +
> > +static void guc_flush_submissions(struct intel_guc *guc)
> >   {
> > -	ENGINE_TRACE(engine, "\n");
> > +	struct i915_sched_engine * const sched_engine = guc->sched_engine;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&sched_engine->lock, flags);
> > +	spin_unlock_irqrestore(&sched_engine->lock, flags);
> > +}
> > +
> > +void intel_guc_submission_reset_prepare(struct intel_guc *guc)
> > +{
> > +	int i;
> > +
> > +	if (unlikely(!guc_submission_initialized(guc)))
> > +		/* Reset called during driver load? GuC not yet initialised! */
> > +		return;
> Ew. Multi-line if without braces just looks broken even if one line is just
> a comment.
> 
> > +
> > +	disable_submission(guc);
> > +	guc->interrupts.disable(guc);
> > +
> > +	/* Flush IRQ handler */
> > +	spin_lock_irq(&guc_to_gt(guc)->irq_lock);
> > +	spin_unlock_irq(&guc_to_gt(guc)->irq_lock);
> > +
> > +	guc_flush_submissions(guc);
> >   	/*
> > -	 * Prevent request submission to the hardware until we have
> > -	 * completed the reset in i915_gem_reset_finish(). If a request
> > -	 * is completed by one engine, it may then queue a request
> > -	 * to a second via its execlists->tasklet *just* as we are
> > -	 * calling engine->init_hw() and also writing the ELSP.
> > -	 * Turning off the execlists->tasklet until the reset is over
> > -	 * prevents the race.
> > -	 */
> > -	__tasklet_disable_sync_once(&engine->sched_engine->tasklet);
> > +	 * Handle any outstanding G2Hs before reset. Call IRQ handler directly
> > +	 * each pass as interrupt have been disabled. We always scrub for
> > +	 * outstanding G2H as it is possible for outstanding_submission_g2h to
> > +	 * be incremented after the context state update.
> > + 	 */
> > +	for (i = 0; i < 4 && atomic_read(&guc->outstanding_submission_g2h); ++i) {
> > +		intel_guc_to_host_event_handler(guc);
> > +#define wait_for_reset(guc, wait_var) \
> > +		guc_wait_for_pending_msg(guc, wait_var, false, (HZ / 20))
> > +		do {
> > +			wait_for_reset(guc, &guc->outstanding_submission_g2h);
> > +		} while (!list_empty(&guc->ct.requests.incoming));
> > +	}
> > +	scrub_guc_desc_for_outstanding_g2h(guc);
> >   }
> > -static void guc_reset_state(struct intel_context *ce,
> > -			    struct intel_engine_cs *engine,
> > -			    u32 head,
> > -			    bool scrub)
> > +static struct intel_engine_cs *
> > +guc_virtual_get_sibling(struct intel_engine_cs *ve, unsigned int sibling)
> >   {
> > +	struct intel_engine_cs *engine;
> > +	intel_engine_mask_t tmp, mask = ve->mask;
> > +	unsigned int num_siblings = 0;
> > +
> > +	for_each_engine_masked(engine, ve->gt, mask, tmp)
> > +		if (num_siblings++ == sibling)
> > +			return engine;
> > +
> > +	return NULL;
> > +}
> > +
> > +static inline struct intel_engine_cs *
> > +__context_to_physical_engine(struct intel_context *ce)
> > +{
> > +	struct intel_engine_cs *engine = ce->engine;
> > +
> > +	if (intel_engine_is_virtual(engine))
> > +		engine = guc_virtual_get_sibling(engine, 0);
> > +
> > +	return engine;
> > +}
> > +
> > +static void guc_reset_state(struct intel_context *ce, u32 head, bool scrub)
> > +{
> > +	struct intel_engine_cs *engine = __context_to_physical_engine(ce);
> > +
> >   	GEM_BUG_ON(!intel_context_is_pinned(ce));
> >   	/*
> > @@ -501,42 +677,147 @@ static void guc_reset_state(struct intel_context *ce,
> >   	lrc_update_regs(ce, engine, head);
> >   }
> > -static void guc_reset_rewind(struct intel_engine_cs *engine, bool stalled)
> > +static void guc_reset_nop(struct intel_engine_cs *engine)
> >   {
> > -	struct intel_engine_execlists * const execlists = &engine->execlists;
> > -	struct i915_request *rq;
> > +}
> > +
> > +static void guc_rewind_nop(struct intel_engine_cs *engine, bool stalled)
> > +{
> > +}
> > +
> > +static void
> > +__unwind_incomplete_requests(struct intel_context *ce)
> > +{
> > +	struct i915_request *rq, *rn;
> > +	struct list_head *pl;
> > +	int prio = I915_PRIORITY_INVALID;
> > +	struct i915_sched_engine * const sched_engine =
> > +		ce->engine->sched_engine;
> >   	unsigned long flags;
> > -	spin_lock_irqsave(&engine->sched_engine->lock, flags);
> > +	spin_lock_irqsave(&sched_engine->lock, flags);
> > +	spin_lock(&ce->guc_active.lock);
> > +	list_for_each_entry_safe(rq, rn,
> > +				 &ce->guc_active.requests,
> > +				 sched.link) {
> > +		if (i915_request_completed(rq))
> > +			continue;
> > +
> > +		list_del_init(&rq->sched.link);
> > +		spin_unlock(&ce->guc_active.lock);
> > +
> > +		__i915_request_unsubmit(rq);
> > +
> > +		/* Push the request back into the queue for later resubmission. */
> > +		GEM_BUG_ON(rq_prio(rq) == I915_PRIORITY_INVALID);
> > +		if (rq_prio(rq) != prio) {
> > +			prio = rq_prio(rq);
> > +			pl = i915_sched_lookup_priolist(sched_engine, prio);
> > +		}
> > +		GEM_BUG_ON(i915_sched_engine_is_empty(sched_engine));
> > +
> > +		list_add_tail(&rq->sched.link, pl);
> > +		set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
> > -	/* Push back any incomplete requests for replay after the reset. */
> > -	rq = execlists_unwind_incomplete_requests(execlists);
> > -	if (!rq)
> > -		goto out_unlock;
> > +		spin_lock(&ce->guc_active.lock);
> > +	}
> > +	spin_unlock(&ce->guc_active.lock);
> > +	spin_unlock_irqrestore(&sched_engine->lock, flags);
> > +}
> > +
> > +static struct i915_request *context_find_active_request(struct intel_context *ce)
> > +{
> > +	struct i915_request *rq, *active = NULL;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&ce->guc_active.lock, flags);
> > +	list_for_each_entry_reverse(rq, &ce->guc_active.requests,
> > +				    sched.link) {
> > +		if (i915_request_completed(rq))
> > +			break;
> > +
> > +		active = rq;
> > +	}
> > +	spin_unlock_irqrestore(&ce->guc_active.lock, flags);
> > +
> > +	return active;
> > +}
> > +
> > +static void __guc_reset_context(struct intel_context *ce, bool stalled)
> > +{
> > +	struct i915_request *rq;
> > +	u32 head;
> > +
> > +	/*
> > +	 * GuC will implicitly mark the context as non-schedulable
> > +	 * when it sends the reset notification. Make sure our state
> > +	 * reflects this change. The context will be marked enabled
> > +	 * on resubmission.
> > +	 */
> > +	clr_context_enabled(ce);
> > +
> > +	rq = context_find_active_request(ce);
> > +	if (!rq) {
> > +		head = ce->ring->tail;
> > +		stalled = false;
> > +		goto out_replay;
> > +	}
> >   	if (!i915_request_started(rq))
> >   		stalled = false;
> > +	GEM_BUG_ON(i915_active_is_idle(&ce->active));
> > +	head = intel_ring_wrap(ce->ring, rq->head);
> >   	__i915_request_reset(rq, stalled);
> > -	guc_reset_state(rq->context, engine, rq->head, stalled);
> > -out_unlock:
> > -	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
> > +out_replay:
> > +	guc_reset_state(ce, head, stalled);
> > +	__unwind_incomplete_requests(ce);
> >   }
> > -static void guc_reset_cancel(struct intel_engine_cs *engine)
> > +void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
> > +{
> > +	struct intel_context *ce;
> > +	unsigned long index;
> > +
> > +	if (unlikely(!guc_submission_initialized(guc)))
> > +		/* Reset called during driver load? GuC not yet initialised! */
> > +		return;
> And again.
> 
> > +
> > +	xa_for_each(&guc->context_lookup, index, ce)
> > +		if (intel_context_is_pinned(ce))
> > +			__guc_reset_context(ce, stalled);
> > +
> > +	/* GuC is blown away, drop all references to contexts */
> > +	xa_destroy(&guc->context_lookup);
> > +}
> > +
> > +static void guc_cancel_context_requests(struct intel_context *ce)
> > +{
> > +	struct i915_sched_engine *sched_engine = ce_to_guc(ce)->sched_engine;
> > +	struct i915_request *rq;
> > +	unsigned long flags;
> > +
> > +	/* Mark all executing requests as skipped. */
> > +	spin_lock_irqsave(&sched_engine->lock, flags);
> > +	spin_lock(&ce->guc_active.lock);
> > +	list_for_each_entry(rq, &ce->guc_active.requests, sched.link)
> > +		i915_request_put(i915_request_mark_eio(rq));
> > +	spin_unlock(&ce->guc_active.lock);
> > +	spin_unlock_irqrestore(&sched_engine->lock, flags);
> > +}
> > +
> > +static void
> > +guc_cancel_sched_engine_requests(struct i915_sched_engine *sched_engine)
> >   {
> > -	struct i915_sched_engine * const sched_engine = engine->sched_engine;
> >   	struct i915_request *rq, *rn;
> >   	struct rb_node *rb;
> >   	unsigned long flags;
> >   	/* Can be called during boot if GuC fails to load */
> > -	if (!engine->gt)
> > +	if (!sched_engine)
> >   		return;
> > -	ENGINE_TRACE(engine, "\n");
> > -
> >   	/*
> >   	 * Before we call engine->cancel_requests(), we should have exclusive
> >   	 * access to the submission state. This is arranged for us by the
> > @@ -553,21 +834,16 @@ static void guc_reset_cancel(struct intel_engine_cs *engine)
> >   	 */
> >   	spin_lock_irqsave(&sched_engine->lock, flags);
> > -	/* Mark all executing requests as skipped. */
> > -	list_for_each_entry(rq, &sched_engine->requests, sched.link) {
> > -		i915_request_set_error_once(rq, -EIO);
> > -		i915_request_mark_complete(rq);
> > -	}
> > -
> >   	/* Flush the queued requests to the timeline list (for retiring). */
> >   	while ((rb = rb_first_cached(&sched_engine->queue))) {
> >   		struct i915_priolist *p = to_priolist(rb);
> >   		priolist_for_each_request_consume(rq, rn, p) {
> >   			list_del_init(&rq->sched.link);
> > +
> >   			__i915_request_submit(rq);
> > -			dma_fence_set_error(&rq->fence, -EIO);
> > -			i915_request_mark_complete(rq);
> > +
> > +			i915_request_put(i915_request_mark_eio(rq));
> >   		}
> >   		rb_erase_cached(&p->node, &sched_engine->queue);
> > @@ -582,14 +858,38 @@ static void guc_reset_cancel(struct intel_engine_cs *engine)
> >   	spin_unlock_irqrestore(&sched_engine->lock, flags);
> >   }
> > -static void guc_reset_finish(struct intel_engine_cs *engine)
> > +void intel_guc_submission_cancel_requests(struct intel_guc *guc)
> >   {
> > -	if (__tasklet_enable(&engine->sched_engine->tasklet))
> > -		/* And kick in case we missed a new request submission. */
> > -		tasklet_hi_schedule(&engine->sched_engine->tasklet);
> > +	struct intel_context *ce;
> > +	unsigned long index;
> > +
> > +	xa_for_each(&guc->context_lookup, index, ce)
> > +		if (intel_context_is_pinned(ce))
> > +			guc_cancel_context_requests(ce);
> > -	ENGINE_TRACE(engine, "depth->%d\n",
> > -		     atomic_read(&engine->sched_engine->tasklet.count));
> > +	guc_cancel_sched_engine_requests(guc->sched_engine);
> > +
> > +	/* GuC is blown away, drop all references to contexts */
> > +	xa_destroy(&guc->context_lookup);
> This function shares most of the code with 'intel_guc_submission_reset'. Can
> the xa clean be moved to a common helper?
> 
> John.
> 
> > +}
> > +
> > +void intel_guc_submission_reset_finish(struct intel_guc *guc)
> > +{
> > +	/* Reset called during driver load or during wedge? */
> > +	if (unlikely(!guc_submission_initialized(guc) ||
> > +		     test_bit(I915_WEDGED, &guc_to_gt(guc)->reset.flags)))
> > +		return;
> > +
> > +	/*
> > +	 * Technically possible for either of these values to be non-zero here,
> > +	 * but very unlikely + harmless. Regardless let's add a warn so we can
> > +	 * see in CI if this happens frequently / a precursor to taking down the
> > +	 * machine.
> > +	 */
> > +	GEM_WARN_ON(atomic_read(&guc->outstanding_submission_g2h));
> > +	atomic_set(&guc->outstanding_submission_g2h, 0);
> > +
> > +	enable_submission(guc);
> >   }
> >   /*
> > @@ -656,6 +956,9 @@ static int guc_bypass_tasklet_submit(struct intel_guc *guc,
> >   	else
> >   		trace_i915_request_guc_submit(rq);
> > +	if (unlikely(ret == -EIO))
> > +		disable_submission(guc);
> > +
> >   	return ret;
> >   }
> > @@ -668,7 +971,8 @@ static void guc_submit_request(struct i915_request *rq)
> >   	/* Will be called from irq-context when using foreign fences. */
> >   	spin_lock_irqsave(&sched_engine->lock, flags);
> > -	if (guc->stalled_request || !i915_sched_engine_is_empty(sched_engine))
> > +	if (submission_disabled(guc) || guc->stalled_request ||
> > +	    !i915_sched_engine_is_empty(sched_engine))
> >   		queue_request(sched_engine, rq, rq_prio(rq));
> >   	else if (guc_bypass_tasklet_submit(guc, rq) == -EBUSY)
> >   		tasklet_hi_schedule(&sched_engine->tasklet);
> > @@ -805,7 +1109,8 @@ static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
> >   static int __guc_action_register_context(struct intel_guc *guc,
> >   					 u32 guc_id,
> > -					 u32 offset)
> > +					 u32 offset,
> > +					 bool loop)
> >   {
> >   	u32 action[] = {
> >   		INTEL_GUC_ACTION_REGISTER_CONTEXT,
> > @@ -813,10 +1118,10 @@ static int __guc_action_register_context(struct intel_guc *guc,
> >   		offset,
> >   	};
> > -	return guc_submission_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
> > +	return guc_submission_busy_loop(guc, action, ARRAY_SIZE(action), 0, loop);
> >   }
> > -static int register_context(struct intel_context *ce)
> > +static int register_context(struct intel_context *ce, bool loop)
> >   {
> >   	struct intel_guc *guc = ce_to_guc(ce);
> >   	u32 offset = intel_guc_ggtt_offset(guc, guc->lrc_desc_pool) +
> > @@ -824,11 +1129,12 @@ static int register_context(struct intel_context *ce)
> >   	trace_intel_context_register(ce);
> > -	return __guc_action_register_context(guc, ce->guc_id, offset);
> > +	return __guc_action_register_context(guc, ce->guc_id, offset, loop);
> >   }
> >   static int __guc_action_deregister_context(struct intel_guc *guc,
> > -					   u32 guc_id)
> > +					   u32 guc_id,
> > +					   bool loop)
> >   {
> >   	u32 action[] = {
> >   		INTEL_GUC_ACTION_DEREGISTER_CONTEXT,
> > @@ -836,16 +1142,16 @@ static int __guc_action_deregister_context(struct intel_guc *guc,
> >   	};
> >   	return guc_submission_busy_loop(guc, action, ARRAY_SIZE(action),
> > -					G2H_LEN_DW_DEREGISTER_CONTEXT, true);
> > +					G2H_LEN_DW_DEREGISTER_CONTEXT, loop);
> >   }
> > -static int deregister_context(struct intel_context *ce, u32 guc_id)
> > +static int deregister_context(struct intel_context *ce, u32 guc_id, bool loop)
> >   {
> >   	struct intel_guc *guc = ce_to_guc(ce);
> >   	trace_intel_context_deregister(ce);
> > -	return __guc_action_deregister_context(guc, guc_id);
> > +	return __guc_action_deregister_context(guc, guc_id, loop);
> >   }
> >   static intel_engine_mask_t adjust_engine_mask(u8 class, intel_engine_mask_t mask)
> > @@ -874,7 +1180,7 @@ static void guc_context_policy_init(struct intel_engine_cs *engine,
> >   	desc->preemption_timeout = CONTEXT_POLICY_DEFAULT_PREEMPTION_TIME_US;
> >   }
> > -static int guc_lrc_desc_pin(struct intel_context *ce)
> > +static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
> >   {
> >   	struct intel_runtime_pm *runtime_pm =
> >   		&ce->engine->gt->i915->runtime_pm;
> > @@ -920,18 +1226,44 @@ static int guc_lrc_desc_pin(struct intel_context *ce)
> >   	 */
> >   	if (context_registered) {
> >   		trace_intel_context_steal_guc_id(ce);
> > -		set_context_wait_for_deregister_to_register(ce);
> > -		intel_context_get(ce);
> > +		if (!loop) {
> > +			set_context_wait_for_deregister_to_register(ce);
> > +			intel_context_get(ce);
> > +		} else {
> > +			bool disabled;
> > +			unsigned long flags;
> > +
> > +			/* Seal race with Reset */
> > +			spin_lock_irqsave(&ce->guc_state.lock, flags);
> > +			disabled = submission_disabled(guc);
> > +			if (likely(!disabled)) {
> > +				set_context_wait_for_deregister_to_register(ce);
> > +				intel_context_get(ce);
> > +			}
> > +			spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> > +			if (unlikely(disabled)) {
> > +				reset_lrc_desc(guc, desc_idx);
> > +				return 0;	/* Will get registered later */
> > +			}
> > +		}
> >   		/*
> >   		 * If stealing the guc_id, this ce has the same guc_id as the
> >   		 * context whos guc_id was stole.
> >   		 */
> >   		with_intel_runtime_pm(runtime_pm, wakeref)
> > -			ret = deregister_context(ce, ce->guc_id);
> > +			ret = deregister_context(ce, ce->guc_id, loop);
> > +		if (unlikely(ret == -EBUSY)) {
> > +			clr_context_wait_for_deregister_to_register(ce);
> > +			intel_context_put(ce);
> > +		}
> >   	} else {
> >   		with_intel_runtime_pm(runtime_pm, wakeref)
> > -			ret = register_context(ce);
> > +			ret = register_context(ce, loop);
> > +		if (unlikely(ret == -EBUSY))
> > +			reset_lrc_desc(guc, desc_idx);
> > +		else if (unlikely(ret == -ENODEV))
> > +			ret = 0;	/* Will get registered later */
> >   	}
> >   	return ret;
> > @@ -994,7 +1326,6 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
> >   	GEM_BUG_ON(guc_id == GUC_INVALID_LRC_ID);
> >   	trace_intel_context_sched_disable(ce);
> > -	intel_context_get(ce);
> >   	guc_submission_busy_loop(guc, action, ARRAY_SIZE(action),
> >   				 G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, true);
> > @@ -1004,6 +1335,7 @@ static u16 prep_context_pending_disable(struct intel_context *ce)
> >   {
> >   	set_context_pending_disable(ce);
> >   	clr_context_enabled(ce);
> > +	intel_context_get(ce);
> >   	return ce->guc_id;
> >   }
> > @@ -1016,7 +1348,7 @@ static void guc_context_sched_disable(struct intel_context *ce)
> >   	u16 guc_id;
> >   	intel_wakeref_t wakeref;
> > -	if (context_guc_id_invalid(ce) ||
> > +	if (submission_disabled(guc) || context_guc_id_invalid(ce) ||
> >   	    !lrc_desc_registered(guc, ce->guc_id)) {
> >   		clr_context_enabled(ce);
> >   		goto unpin;
> > @@ -1034,6 +1366,7 @@ static void guc_context_sched_disable(struct intel_context *ce)
> >   	 * request doesn't slip through the 'context_pending_disable' fence.
> >   	 */
> >   	if (unlikely(atomic_add_unless(&ce->pin_count, -2, 2))) {
> > +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> >   		return;
> >   	}
> >   	guc_id = prep_context_pending_disable(ce);
> > @@ -1050,19 +1383,13 @@ static void guc_context_sched_disable(struct intel_context *ce)
> >   static inline void guc_lrc_desc_unpin(struct intel_context *ce)
> >   {
> > -	struct intel_engine_cs *engine = ce->engine;
> > -	struct intel_guc *guc = &engine->gt->uc.guc;
> > -	unsigned long flags;
> > +	struct intel_guc *guc = ce_to_guc(ce);
> >   	GEM_BUG_ON(!lrc_desc_registered(guc, ce->guc_id));
> >   	GEM_BUG_ON(ce != __get_context(guc, ce->guc_id));
> >   	GEM_BUG_ON(context_enabled(ce));
> > -	spin_lock_irqsave(&ce->guc_state.lock, flags);
> > -	set_context_destroyed(ce);
> > -	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> > -
> > -	deregister_context(ce, ce->guc_id);
> > +	deregister_context(ce, ce->guc_id, true);
> >   }
> >   static void __guc_context_destroy(struct intel_context *ce)
> > @@ -1090,13 +1417,15 @@ static void guc_context_destroy(struct kref *kref)
> >   	struct intel_guc *guc = &ce->engine->gt->uc.guc;
> >   	intel_wakeref_t wakeref;
> >   	unsigned long flags;
> > +	bool disabled;
> >   	/*
> >   	 * If the guc_id is invalid this context has been stolen and we can free
> >   	 * it immediately. Also can be freed immediately if the context is not
> >   	 * registered with the GuC.
> >   	 */
> > -	if (context_guc_id_invalid(ce) ||
> > +	if (submission_disabled(guc) ||
> > +	    context_guc_id_invalid(ce) ||
> >   	    !lrc_desc_registered(guc, ce->guc_id)) {
> >   		release_guc_id(guc, ce);
> >   		__guc_context_destroy(ce);
> > @@ -1123,6 +1452,18 @@ static void guc_context_destroy(struct kref *kref)
> >   		list_del_init(&ce->guc_id_link);
> >   	spin_unlock_irqrestore(&guc->contexts_lock, flags);
> > +	/* Seal race with Reset */
> > +	spin_lock_irqsave(&ce->guc_state.lock, flags);
> > +	disabled = submission_disabled(guc);
> > +	if (likely(!disabled))
> > +		set_context_destroyed(ce);
> > +	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> > +	if (unlikely(disabled)) {
> > +		release_guc_id(guc, ce);
> > +		__guc_context_destroy(ce);
> > +		return;
> > +	}
> > +
> >   	/*
> >   	 * We defer GuC context deregistration until the context is destroyed
> >   	 * in order to save on CTBs. With this optimization ideally we only need
> > @@ -1145,6 +1486,33 @@ static int guc_context_alloc(struct intel_context *ce)
> >   	return lrc_alloc(ce, ce->engine);
> >   }
> > +static void add_to_context(struct i915_request *rq)
> > +{
> > +	struct intel_context *ce = rq->context;
> > +
> > +	spin_lock(&ce->guc_active.lock);
> > +	list_move_tail(&rq->sched.link, &ce->guc_active.requests);
> > +	spin_unlock(&ce->guc_active.lock);
> > +}
> > +
> > +static void remove_from_context(struct i915_request *rq)
> > +{
> > +	struct intel_context *ce = rq->context;
> > +
> > +	spin_lock_irq(&ce->guc_active.lock);
> > +
> > +	list_del_init(&rq->sched.link);
> > +	clear_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
> > +
> > +	/* Prevent further __await_execution() registering a cb, then flush */
> > +	set_bit(I915_FENCE_FLAG_ACTIVE, &rq->fence.flags);
> > +
> > +	spin_unlock_irq(&ce->guc_active.lock);
> > +
> > +	atomic_dec(&ce->guc_id_ref);
> > +	i915_request_notify_execute_cb_imm(rq);
> > +}
> > +
> >   static const struct intel_context_ops guc_context_ops = {
> >   	.alloc = guc_context_alloc,
> > @@ -1183,8 +1551,6 @@ static void guc_signal_context_fence(struct intel_context *ce)
> >   {
> >   	unsigned long flags;
> > -	GEM_BUG_ON(!context_wait_for_deregister_to_register(ce));
> > -
> >   	spin_lock_irqsave(&ce->guc_state.lock, flags);
> >   	clr_context_wait_for_deregister_to_register(ce);
> >   	__guc_signal_context_fence(ce);
> > @@ -1193,8 +1559,9 @@ static void guc_signal_context_fence(struct intel_context *ce)
> >   static bool context_needs_register(struct intel_context *ce, bool new_guc_id)
> >   {
> > -	return new_guc_id || test_bit(CONTEXT_LRCA_DIRTY, &ce->flags) ||
> > -		!lrc_desc_registered(ce_to_guc(ce), ce->guc_id);
> > +	return (new_guc_id || test_bit(CONTEXT_LRCA_DIRTY, &ce->flags) ||
> > +		!lrc_desc_registered(ce_to_guc(ce), ce->guc_id)) &&
> > +		!submission_disabled(ce_to_guc(ce));
> >   }
> >   static int guc_request_alloc(struct i915_request *rq)
> > @@ -1252,8 +1619,12 @@ static int guc_request_alloc(struct i915_request *rq)
> >   	if (unlikely(ret < 0))
> >   		return ret;;
> >   	if (context_needs_register(ce, !!ret)) {
> > -		ret = guc_lrc_desc_pin(ce);
> > +		ret = guc_lrc_desc_pin(ce, true);
> >   		if (unlikely(ret)) {	/* unwind */
> > +			if (ret == -EIO) {
> > +				disable_submission(guc);
> > +				goto out;	/* GPU will be reset */
> > +			}
> >   			atomic_dec(&ce->guc_id_ref);
> >   			unpin_guc_id(guc, ce);
> >   			return ret;
> > @@ -1290,20 +1661,6 @@ static int guc_request_alloc(struct i915_request *rq)
> >   	return 0;
> >   }
> > -static struct intel_engine_cs *
> > -guc_virtual_get_sibling(struct intel_engine_cs *ve, unsigned int sibling)
> > -{
> > -	struct intel_engine_cs *engine;
> > -	intel_engine_mask_t tmp, mask = ve->mask;
> > -	unsigned int num_siblings = 0;
> > -
> > -	for_each_engine_masked(engine, ve->gt, mask, tmp)
> > -		if (num_siblings++ == sibling)
> > -			return engine;
> > -
> > -	return NULL;
> > -}
> > -
> >   static int guc_virtual_context_pre_pin(struct intel_context *ce,
> >   				       struct i915_gem_ww_ctx *ww,
> >   				       void **vaddr)
> > @@ -1512,7 +1869,7 @@ static inline void guc_kernel_context_pin(struct intel_guc *guc,
> >   {
> >   	if (context_guc_id_invalid(ce))
> >   		pin_guc_id(guc, ce);
> > -	guc_lrc_desc_pin(ce);
> > +	guc_lrc_desc_pin(ce, true);
> >   }
> >   static inline void guc_init_lrc_mapping(struct intel_guc *guc)
> > @@ -1578,13 +1935,15 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
> >   	engine->cops = &guc_context_ops;
> >   	engine->request_alloc = guc_request_alloc;
> >   	engine->bump_serial = guc_bump_serial;
> > +	engine->add_active_request = add_to_context;
> > +	engine->remove_active_request = remove_from_context;
> >   	engine->sched_engine->schedule = i915_schedule;
> > -	engine->reset.prepare = guc_reset_prepare;
> > -	engine->reset.rewind = guc_reset_rewind;
> > -	engine->reset.cancel = guc_reset_cancel;
> > -	engine->reset.finish = guc_reset_finish;
> > +	engine->reset.prepare = guc_reset_nop;
> > +	engine->reset.rewind = guc_rewind_nop;
> > +	engine->reset.cancel = guc_reset_nop;
> > +	engine->reset.finish = guc_reset_nop;
> >   	engine->emit_flush = gen8_emit_flush_xcs;
> >   	engine->emit_init_breadcrumb = gen8_emit_init_breadcrumb;
> > @@ -1757,7 +2116,7 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
> >   		 * register this context.
> >   		 */
> >   		with_intel_runtime_pm(runtime_pm, wakeref)
> > -			register_context(ce);
> > +			register_context(ce, true);
> >   		guc_signal_context_fence(ce);
> >   		intel_context_put(ce);
> >   	} else if (context_destroyed(ce)) {
> > @@ -1939,6 +2298,10 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
> >   				 "v%dx%d", ve->base.class, count);
> >   			ve->base.context_size = sibling->context_size;
> > +			ve->base.add_active_request =
> > +				sibling->add_active_request;
> > +			ve->base.remove_active_request =
> > +				sibling->remove_active_request;
> >   			ve->base.emit_bb_start = sibling->emit_bb_start;
> >   			ve->base.emit_flush = sibling->emit_flush;
> >   			ve->base.emit_init_breadcrumb =
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> > index 6d8b9233214e..f0b02200aa01 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> > @@ -565,12 +565,49 @@ void intel_uc_reset_prepare(struct intel_uc *uc)
> >   {
> >   	struct intel_guc *guc = &uc->guc;
> > -	if (!intel_guc_is_ready(guc))
> > +
> > +	/* Nothing to do if GuC isn't supported */
> > +	if (!intel_uc_supports_guc(uc))
> >   		return;
> > +	/* Firmware expected to be running when this function is called */
> > +	if (!intel_guc_is_ready(guc))
> > +		goto sanitize;
> > +
> > +	if (intel_uc_uses_guc_submission(uc))
> > +		intel_guc_submission_reset_prepare(guc);
> > +
> > +sanitize:
> >   	__uc_sanitize(uc);
> >   }
> > +void intel_uc_reset(struct intel_uc *uc, bool stalled)
> > +{
> > +	struct intel_guc *guc = &uc->guc;
> > +
> > +	/* Firmware can not be running when this function is called  */
> > +	if (intel_uc_uses_guc_submission(uc))
> > +		intel_guc_submission_reset(guc, stalled);
> > +}
> > +
> > +void intel_uc_reset_finish(struct intel_uc *uc)
> > +{
> > +	struct intel_guc *guc = &uc->guc;
> > +
> > +	/* Firmware expected to be running when this function is called */
> > +	if (intel_guc_is_fw_running(guc) && intel_uc_uses_guc_submission(uc))
> > +		intel_guc_submission_reset_finish(guc);
> > +}
> > +
> > +void intel_uc_cancel_requests(struct intel_uc *uc)
> > +{
> > +	struct intel_guc *guc = &uc->guc;
> > +
> > +	/* Firmware can not be running when this function is called  */
> > +	if (intel_uc_uses_guc_submission(uc))
> > +		intel_guc_submission_cancel_requests(guc);
> > +}
> > +
> >   void intel_uc_runtime_suspend(struct intel_uc *uc)
> >   {
> >   	struct intel_guc *guc = &uc->guc;
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> > index c4cef885e984..eaa3202192ac 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> > @@ -37,6 +37,9 @@ void intel_uc_driver_late_release(struct intel_uc *uc);
> >   void intel_uc_driver_remove(struct intel_uc *uc);
> >   void intel_uc_init_mmio(struct intel_uc *uc);
> >   void intel_uc_reset_prepare(struct intel_uc *uc);
> > +void intel_uc_reset(struct intel_uc *uc, bool stalled);
> > +void intel_uc_reset_finish(struct intel_uc *uc);
> > +void intel_uc_cancel_requests(struct intel_uc *uc);
> >   void intel_uc_suspend(struct intel_uc *uc);
> >   void intel_uc_runtime_suspend(struct intel_uc *uc);
> >   int intel_uc_resume(struct intel_uc *uc);
> > diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> > index dec5a35c9aa2..192784875a1d 100644
> > --- a/drivers/gpu/drm/i915/i915_request.c
> > +++ b/drivers/gpu/drm/i915/i915_request.c
> > @@ -194,7 +194,7 @@ static bool irq_work_imm(struct irq_work *wrk)
> >   	return false;
> >   }
> > -static void __notify_execute_cb_imm(struct i915_request *rq)
> > +void i915_request_notify_execute_cb_imm(struct i915_request *rq)
> >   {
> >   	__notify_execute_cb(rq, irq_work_imm);
> >   }
> > @@ -268,37 +268,6 @@ i915_request_active_engine(struct i915_request *rq,
> >   	return ret;
> >   }
> > -
> > -static void remove_from_engine(struct i915_request *rq)
> > -{
> > -	struct intel_engine_cs *engine, *locked;
> > -
> > -	/*
> > -	 * Virtual engines complicate acquiring the engine timeline lock,
> > -	 * as their rq->engine pointer is not stable until under that
> > -	 * engine lock. The simple ploy we use is to take the lock then
> > -	 * check that the rq still belongs to the newly locked engine.
> > -	 */
> > -	locked = READ_ONCE(rq->engine);
> > -	spin_lock_irq(&locked->sched_engine->lock);
> > -	while (unlikely(locked != (engine = READ_ONCE(rq->engine)))) {
> > -		spin_unlock(&locked->sched_engine->lock);
> > -		spin_lock(&engine->sched_engine->lock);
> > -		locked = engine;
> > -	}
> > -	list_del_init(&rq->sched.link);
> > -
> > -	clear_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
> > -	clear_bit(I915_FENCE_FLAG_HOLD, &rq->fence.flags);
> > -
> > -	/* Prevent further __await_execution() registering a cb, then flush */
> > -	set_bit(I915_FENCE_FLAG_ACTIVE, &rq->fence.flags);
> > -
> > -	spin_unlock_irq(&locked->sched_engine->lock);
> > -
> > -	__notify_execute_cb_imm(rq);
> > -}
> > -
> >   static void __rq_init_watchdog(struct i915_request *rq)
> >   {
> >   	rq->watchdog.timer.function = NULL;
> > @@ -395,9 +364,7 @@ bool i915_request_retire(struct i915_request *rq)
> >   	 * after removing the breadcrumb and signaling it, so that we do not
> >   	 * inadvertently attach the breadcrumb to a completed request.
> >   	 */
> > -	if (!list_empty(&rq->sched.link))
> > -		remove_from_engine(rq);
> > -	atomic_dec(&rq->context->guc_id_ref);
> > +	rq->engine->remove_active_request(rq);
> >   	GEM_BUG_ON(!llist_empty(&rq->execute_cb));
> >   	__list_del_entry(&rq->link); /* poison neither prev/next (RCU walks) */
> > @@ -539,7 +506,7 @@ __await_execution(struct i915_request *rq,
> >   	if (llist_add(&cb->work.node.llist, &signal->execute_cb)) {
> >   		if (i915_request_is_active(signal) ||
> >   		    __request_in_flight(signal))
> > -			__notify_execute_cb_imm(signal);
> > +			i915_request_notify_execute_cb_imm(signal);
> >   	}
> >   	return 0;
> > @@ -676,7 +643,7 @@ bool __i915_request_submit(struct i915_request *request)
> >   	result = true;
> >   	GEM_BUG_ON(test_bit(I915_FENCE_FLAG_ACTIVE, &request->fence.flags));
> > -	list_move_tail(&request->sched.link, &engine->sched_engine->requests);
> > +	engine->add_active_request(request);
> >   active:
> >   	clear_bit(I915_FENCE_FLAG_PQUEUE, &request->fence.flags);
> >   	set_bit(I915_FENCE_FLAG_ACTIVE, &request->fence.flags);
> > diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
> > index f870cd75a001..bcc6340c505e 100644
> > --- a/drivers/gpu/drm/i915/i915_request.h
> > +++ b/drivers/gpu/drm/i915/i915_request.h
> > @@ -649,4 +649,6 @@ bool
> >   i915_request_active_engine(struct i915_request *rq,
> >   			   struct intel_engine_cs **active);
> > +void i915_request_notify_execute_cb_imm(struct i915_request *rq);
> > +
> >   #endif /* I915_REQUEST_H */
> 
