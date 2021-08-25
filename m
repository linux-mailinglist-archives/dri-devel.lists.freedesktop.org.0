Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4523F7EE5
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 01:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF1C36E439;
	Wed, 25 Aug 2021 23:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7286E431;
 Wed, 25 Aug 2021 23:10:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="239821113"
X-IronPort-AV: E=Sophos;i="5.84,351,1620716400"; d="scan'208";a="239821113"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 16:09:58 -0700
X-IronPort-AV: E=Sophos;i="5.84,351,1620716400"; d="scan'208";a="537033900"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 16:09:58 -0700
Date: Wed, 25 Aug 2021 16:04:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: Re: [Intel-gfx] [PATCH 23/27] drm/i915/guc: Move GuC priority fields
 in context under guc_active
Message-ID: <20210825230448.GA27039@jons-linux-dev-box>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-24-matthew.brost@intel.com>
 <9de5b4ac-a808-c77c-afb3-fc45b7e57145@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9de5b4ac-a808-c77c-afb3-fc45b7e57145@intel.com>
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

On Wed, Aug 25, 2021 at 02:51:11PM -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 8/18/2021 11:16 PM, Matthew Brost wrote:
> > Move GuC management fields in context under guc_active struct as this is
> > where the lock that protects theses fields lives. Also only set guc_prio
> > field once during context init.
> 
> Can you explain what we gain by setting that only on first pin? AFAICS
> re-setting it doesn't hurt and we would cover the case where a context
> priority gets updated while the context is idle. I know the request
> submission would eventually update the prio so there is no bug, but that
> then requires an extra H2G.
> 
> > 
> > Fixes: ee242ca704d3 ("drm/i915/guc: Implement GuC priority management")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: <stable@vger.kernel.org>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_context_types.h | 12 ++--
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 68 +++++++++++--------
> >   drivers/gpu/drm/i915/i915_trace.h             |  2 +-
> >   3 files changed, 45 insertions(+), 37 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > index 524a35a78bf4..9fb0480ccf3b 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > @@ -112,6 +112,7 @@ struct intel_context {
> >   #define CONTEXT_FORCE_SINGLE_SUBMISSION	7
> >   #define CONTEXT_NOPREEMPT		8
> >   #define CONTEXT_LRCA_DIRTY		9
> > +#define CONTEXT_GUC_INIT		10
> >   	struct {
> >   		u64 timeout_us;
> > @@ -178,6 +179,11 @@ struct intel_context {
> >   		spinlock_t lock;
> >   		/** requests: active requests on this context */
> >   		struct list_head requests;
> > +		/*
> > +		 * GuC priority management
> > +		 */
> > +		u8 prio;
> > +		u32 prio_count[GUC_CLIENT_PRIORITY_NUM];
> >   	} guc_active;
> >   	/* GuC LRC descriptor ID */
> > @@ -191,12 +197,6 @@ struct intel_context {
> >   	 */
> >   	struct list_head guc_id_link;
> > -	/*
> > -	 * GuC priority management
> > -	 */
> > -	u8 guc_prio;
> > -	u32 guc_prio_count[GUC_CLIENT_PRIORITY_NUM];
> > -
> >   #ifdef CONFIG_DRM_I915_SELFTEST
> >   	/**
> >   	 * @drop_schedule_enable: Force drop of schedule enable G2H for selftest
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 3e90985b0c1b..bb90bedb1305 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -1369,8 +1369,6 @@ static void guc_context_policy_init(struct intel_engine_cs *engine,
> >   	desc->preemption_timeout = engine->props.preempt_timeout_ms * 1000;
> >   }
> > -static inline u8 map_i915_prio_to_guc_prio(int prio);
> > -
> >   static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
> >   {
> >   	struct intel_engine_cs *engine = ce->engine;
> > @@ -1378,8 +1376,6 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
> >   	struct intel_guc *guc = &engine->gt->uc.guc;
> >   	u32 desc_idx = ce->guc_id;
> >   	struct guc_lrc_desc *desc;
> > -	const struct i915_gem_context *ctx;
> > -	int prio = I915_CONTEXT_DEFAULT_PRIORITY;
> >   	bool context_registered;
> >   	intel_wakeref_t wakeref;
> >   	int ret = 0;
> > @@ -1396,12 +1392,6 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
> >   	context_registered = lrc_desc_registered(guc, desc_idx);
> > -	rcu_read_lock();
> > -	ctx = rcu_dereference(ce->gem_context);
> > -	if (ctx)
> > -		prio = ctx->sched.priority;
> > -	rcu_read_unlock();
> > -
> >   	reset_lrc_desc(guc, desc_idx);
> >   	set_lrc_desc_registered(guc, desc_idx, ce);
> > @@ -1410,8 +1400,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
> >   	desc->engine_submit_mask = adjust_engine_mask(engine->class,
> >   						      engine->mask);
> >   	desc->hw_context_desc = ce->lrc.lrca;
> > -	ce->guc_prio = map_i915_prio_to_guc_prio(prio);
> > -	desc->priority = ce->guc_prio;
> > +	desc->priority = ce->guc_active.prio;
> >   	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
> >   	guc_context_policy_init(engine, desc);
> > @@ -1813,10 +1802,10 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
> >   static void __guc_context_destroy(struct intel_context *ce)
> >   {
> > -	GEM_BUG_ON(ce->guc_prio_count[GUC_CLIENT_PRIORITY_KMD_HIGH] ||
> > -		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_HIGH] ||
> > -		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_KMD_NORMAL] ||
> > -		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_NORMAL]);
> > +	GEM_BUG_ON(ce->guc_active.prio_count[GUC_CLIENT_PRIORITY_KMD_HIGH] ||
> > +		   ce->guc_active.prio_count[GUC_CLIENT_PRIORITY_HIGH] ||
> > +		   ce->guc_active.prio_count[GUC_CLIENT_PRIORITY_KMD_NORMAL] ||
> > +		   ce->guc_active.prio_count[GUC_CLIENT_PRIORITY_NORMAL]);
> >   	GEM_BUG_ON(ce->guc_state.number_committed_requests);
> >   	lrc_fini(ce);
> > @@ -1926,14 +1915,17 @@ static void guc_context_set_prio(struct intel_guc *guc,
> >   	GEM_BUG_ON(prio < GUC_CLIENT_PRIORITY_KMD_HIGH ||
> >   		   prio > GUC_CLIENT_PRIORITY_NORMAL);
> > +	lockdep_assert_held(&ce->guc_active.lock);
> > -	if (ce->guc_prio == prio || submission_disabled(guc) ||
> > -	    !context_registered(ce))
> > +	if (ce->guc_active.prio == prio || submission_disabled(guc) ||
> > +	    !context_registered(ce)) {
> > +		ce->guc_active.prio = prio;
> >   		return;
> > +	}
> >   	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
> > -	ce->guc_prio = prio;
> > +	ce->guc_active.prio = prio;
> >   	trace_intel_context_set_prio(ce);
> >   }
> > @@ -1953,24 +1945,24 @@ static inline void add_context_inflight_prio(struct intel_context *ce,
> >   					     u8 guc_prio)
> >   {
> >   	lockdep_assert_held(&ce->guc_active.lock);
> > -	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_prio_count));
> > +	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_active.prio_count));
> > -	++ce->guc_prio_count[guc_prio];
> > +	++ce->guc_active.prio_count[guc_prio];
> >   	/* Overflow protection */
> > -	GEM_WARN_ON(!ce->guc_prio_count[guc_prio]);
> > +	GEM_WARN_ON(!ce->guc_active.prio_count[guc_prio]);
> >   }
> >   static inline void sub_context_inflight_prio(struct intel_context *ce,
> >   					     u8 guc_prio)
> >   {
> >   	lockdep_assert_held(&ce->guc_active.lock);
> > -	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_prio_count));
> > +	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_active.prio_count));
> >   	/* Underflow protection */
> > -	GEM_WARN_ON(!ce->guc_prio_count[guc_prio]);
> > +	GEM_WARN_ON(!ce->guc_active.prio_count[guc_prio]);
> > -	--ce->guc_prio_count[guc_prio];
> > +	--ce->guc_active.prio_count[guc_prio];
> >   }
> >   static inline void update_context_prio(struct intel_context *ce)
> > @@ -1983,8 +1975,8 @@ static inline void update_context_prio(struct intel_context *ce)
> >   	lockdep_assert_held(&ce->guc_active.lock);
> > -	for (i = 0; i < ARRAY_SIZE(ce->guc_prio_count); ++i) {
> > -		if (ce->guc_prio_count[i]) {
> > +	for (i = 0; i < ARRAY_SIZE(ce->guc_active.prio_count); ++i) {
> > +		if (ce->guc_active.prio_count[i]) {
> >   			guc_context_set_prio(guc, ce, i);
> >   			break;
> >   		}
> > @@ -2123,6 +2115,20 @@ static bool context_needs_register(struct intel_context *ce, bool new_guc_id)
> >   		!submission_disabled(ce_to_guc(ce));
> >   }
> > +static void guc_context_init(struct intel_context *ce)
> > +{
> > +	const struct i915_gem_context *ctx;
> > +	int prio = I915_CONTEXT_DEFAULT_PRIORITY;
> > +
> > +	rcu_read_lock();
> > +	ctx = rcu_dereference(ce->gem_context);
> > +	if (ctx)
> > +		prio = ctx->sched.priority;
> > +	rcu_read_unlock();
> > +
> > +	ce->guc_active.prio = map_i915_prio_to_guc_prio(prio);
> > +}
> > +
> >   static int guc_request_alloc(struct i915_request *rq)
> >   {
> >   	struct intel_context *ce = rq->context;
> > @@ -2154,6 +2160,9 @@ static int guc_request_alloc(struct i915_request *rq)
> >   	rq->reserved_space -= GUC_REQUEST_SIZE;
> > +	if (unlikely(!test_bit(CONTEXT_GUC_INIT, &ce->flags)))
> 
> Where is CONTEXT_GUC_INIT set? Can't find it
> 

Missed this commit. Opps, this should be set in guc_context_init.

Matt

> Daniele
> 
> > +		guc_context_init(ce);
> > +
> >   	/*
> >   	 * Call pin_guc_id here rather than in the pinning step as with
> >   	 * dma_resv, contexts can be repeatedly pinned / unpinned trashing the
> > @@ -3031,13 +3040,12 @@ static inline void guc_log_context_priority(struct drm_printer *p,
> >   {
> >   	int i;
> > -	drm_printf(p, "\t\tPriority: %d\n",
> > -		   ce->guc_prio);
> > +	drm_printf(p, "\t\tPriority: %d\n", ce->guc_active.prio);
> >   	drm_printf(p, "\t\tNumber Requests (lower index == higher priority)\n");
> >   	for (i = GUC_CLIENT_PRIORITY_KMD_HIGH;
> >   	     i < GUC_CLIENT_PRIORITY_NUM; ++i) {
> >   		drm_printf(p, "\t\tNumber requests in priority band[%d]: %d\n",
> > -			   i, ce->guc_prio_count[i]);
> > +			   i, ce->guc_active.prio_count[i]);
> >   	}
> >   	drm_printf(p, "\n");
> >   }
> > diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
> > index 0a77eb2944b5..6f882e72ed11 100644
> > --- a/drivers/gpu/drm/i915/i915_trace.h
> > +++ b/drivers/gpu/drm/i915/i915_trace.h
> > @@ -910,7 +910,7 @@ DECLARE_EVENT_CLASS(intel_context,
> >   			   __entry->guc_id = ce->guc_id;
> >   			   __entry->pin_count = atomic_read(&ce->pin_count);
> >   			   __entry->sched_state = ce->guc_state.sched_state;
> > -			   __entry->guc_prio = ce->guc_prio;
> > +			   __entry->guc_prio = ce->guc_active.prio;
> >   			   ),
> >   		    TP_printk("guc_id=%d, pin_count=%d sched_state=0x%x, guc_prio=%u",
> 
