Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B91513DBE25
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 20:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C796E431;
	Fri, 30 Jul 2021 18:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5EA6E431;
 Fri, 30 Jul 2021 18:13:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10061"; a="212872095"
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="212872095"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 11:13:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="477068044"
Received: from dut151-iclu.fm.intel.com ([10.105.23.43])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 11:13:40 -0700
Date: Fri, 30 Jul 2021 18:13:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: John Harrison <john.c.harrison@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915: Check if engine has heartbeat
 when closing a context
Message-ID: <20210730181338.GA60875@DUT151-ICLU.fm.intel.com>
References: <20210729003400.151864-1-matthew.brost@intel.com>
 <20210729003400.151864-2-matthew.brost@intel.com>
 <eea0bdb7-681b-0acb-0b9c-041fb38a7119@intel.com>
 <1b75f6c6-e458-6bc7-f867-12f1b5b18af0@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b75f6c6-e458-6bc7-f867-12f1b5b18af0@linux.intel.com>
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

On Fri, Jul 30, 2021 at 10:49:01AM +0100, Tvrtko Ursulin wrote:
> 
> On 30/07/2021 01:13, John Harrison wrote:
> > On 7/28/2021 17:34, Matthew Brost wrote:
> > > If an engine associated with a context does not have a heartbeat, ban it
> > > immediately. This is needed for GuC submission as a idle pulse doesn't
> > > kick the context off the hardware where it then can check for a
> > > heartbeat and ban the context.
> 
> Pulse, that is a request with I915_PRIORITY_BARRIER, does not preempt a
> running normal priority context?
> 

Yes, in both execlists and GuC submission the contexts gets preempted.
With execlists the i915 see the preempt CSB while with GuC submission
the GUC sees it.

> Why does it matter then whether or not heartbeats are enabled - when
> heartbeat just ends up sending the same engine pulse (eventually, with
> raising priority)?
>

With execlists when the request gets resubmitted, there is check if the
context is closed and the heartbeat is disabled. If this is true, the
context gets banned. See __execlists_schedule_in.

With the Guc sense it owns the CSB / resubmission, the heartbeat /
closed check doesn't exist to ban the context. 

> > It's worse than this. If the engine in question is an individual
> > physical engine then sending a pulse (with sufficiently high priority)
> > will pre-empt the engine and kick the context off. However, the GuC
> 
> Why it is different for physical vs virtual, aren't both just schedulable
> contexts with different engine masks for what GuC is concerned? Oh, is it a
> matter of needing to send pulses to all engines which comprise a virtual
> one?

Yes. The whole idle pulse thing is kinda junk. It really makes an
assumption that the backend is execlists. We likely have a bit more work
here.

> 
> > scheduler does not have hacks in it to check the state of the heartbeat
> > or whether a context is actually a zombie or not. Thus, the context will
> > get resubmitted to the hardware after the pulse completes and
> > effectively nothing will have happened.
> > 
> > I would assume that the DRM scheduler which we are meant to be switching
> > to for execlist as well as GuC submission is also unlikely to have hacks
> > for zombie contexts and tests for whether the i915 specific heartbeat
> > has been disabled since the context became a zombie. So when that switch
> > happens, this test will also fail in execlist mode as well as GuC mode.
> > 
> > The choices I see here are to simply remove persistence completely (it
> > is a basically a bug that became UAPI because it wasn't caught soon
> > enough!) or to implement it in a way that does not require hacks in the
> > back end scheduler. Apparently, the DRM scheduler is expected to allow
> > zombie contexts to persist until the DRM file handle is closed. So
> > presumably we will have to go with option two.
> > 
> > That means flagging a context as being a zombie when it is closed but
> > still active. The driver would then add it to a zombie list owned by the
> > DRM client object. When that client object is closed, i915 would go
> > through the list and genuinely kill all the contexts. No back end
> > scheduler hacks required and no intimate knowledge of the i915 heartbeat
> > mechanism required either.
> > 
> > John.
> > 
> > 
> > > 
> > > This patch also updates intel_engine_has_heartbeat to be a vfunc as we
> > > now need to call this function on execlists virtual engines too.
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gem/i915_gem_context.c   |  5 +++--
> > >   drivers/gpu/drm/i915/gt/intel_context_types.h |  2 ++
> > >   drivers/gpu/drm/i915/gt/intel_engine.h        | 21 ++-----------------
> > >   .../drm/i915/gt/intel_execlists_submission.c  | 14 +++++++++++++
> > >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  6 +++++-
> > >   .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 --
> > >   6 files changed, 26 insertions(+), 24 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > index 9c3672bac0e2..b8e01c5ba9e5 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > @@ -1090,8 +1090,9 @@ static void kill_engines(struct
> > > i915_gem_engines *engines, bool ban)
> > >        */
> > >       for_each_gem_engine(ce, engines, it) {
> > >           struct intel_engine_cs *engine;
> > > +        bool local_ban = ban || !intel_engine_has_heartbeat(ce->engine);
> 
> In any case (pending me understanding what's really going on there), why
> would this check not be in kill_context with currently does this:
> 
> 	bool ban = (!i915_gem_context_is_persistent(ctx) ||
> 		    !ctx->i915->params.enable_hangcheck);
> ...

This gem_context level check, while the other check is per
intel_context. We don't have the intel_context here.

> 		kill_engines(pos, ban);
> 
> So whether to ban decision would be consolidated to one place.
> 
> In fact, decision on whether to allow persistent is tied to
> enable_hangcheck, which also drives hearbeat emission. So perhaps one part
> of the correct fix is to extend the above (kill_context) ban criteria to
> include hearbeat values anyway. Otherwise isn't it a simple miss that this
> check fails to account to hearbeat disablement via sysfs?
> 

The execlists has that check in the resubmission path which doesn't
exist for the GuC (explained above). This code just moves this check to
a place where it works with GuC submission.

Matt

> Regards,
> 
> Tvrtko
> 
> > > -        if (ban && intel_context_ban(ce, NULL))
> > > +        if (local_ban && intel_context_ban(ce, NULL))
> > >               continue;
> > >           /*
> > > @@ -1104,7 +1105,7 @@ static void kill_engines(struct
> > > i915_gem_engines *engines, bool ban)
> > >           engine = active_engine(ce);
> > >           /* First attempt to gracefully cancel the context */
> > > -        if (engine && !__cancel_engine(engine) && ban)
> > > +        if (engine && !__cancel_engine(engine) && local_ban)
> > >               /*
> > >                * If we are unable to send a preemptive pulse to bump
> > >                * the context from the GPU, we have to resort to a full
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h
> > > b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > > index e54351a170e2..65f2eb2a78e4 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > > @@ -55,6 +55,8 @@ struct intel_context_ops {
> > >       void (*reset)(struct intel_context *ce);
> > >       void (*destroy)(struct kref *kref);
> > > +    bool (*has_heartbeat)(const struct intel_engine_cs *engine);
> > > +
> > >       /* virtual engine/context interface */
> > >       struct intel_context *(*create_virtual)(struct intel_engine_cs
> > > **engine,
> > >                           unsigned int count);
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h
> > > b/drivers/gpu/drm/i915/gt/intel_engine.h
> > > index c2a5640ae055..1b11a808acc4 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> > > @@ -283,28 +283,11 @@ struct intel_context *
> > >   intel_engine_create_virtual(struct intel_engine_cs **siblings,
> > >                   unsigned int count);
> > > -static inline bool
> > > -intel_virtual_engine_has_heartbeat(const struct intel_engine_cs *engine)
> > > -{
> > > -    /*
> > > -     * For non-GuC submission we expect the back-end to look at the
> > > -     * heartbeat status of the actual physical engine that the work
> > > -     * has been (or is being) scheduled on, so we should only reach
> > > -     * here with GuC submission enabled.
> > > -     */
> > > -    GEM_BUG_ON(!intel_engine_uses_guc(engine));
> > > -
> > > -    return intel_guc_virtual_engine_has_heartbeat(engine);
> > > -}
> > > -
> > >   static inline bool
> > >   intel_engine_has_heartbeat(const struct intel_engine_cs *engine)
> > >   {
> > > -    if (!IS_ACTIVE(CONFIG_DRM_I915_HEARTBEAT_INTERVAL))
> > > -        return false;
> > > -
> > > -    if (intel_engine_is_virtual(engine))
> > > -        return intel_virtual_engine_has_heartbeat(engine);
> > > +    if (engine->cops->has_heartbeat)
> > > +        return engine->cops->has_heartbeat(engine);
> > >       else
> > >           return READ_ONCE(engine->props.heartbeat_interval_ms);
> > >   }
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > > b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > > index de5f9c86b9a4..18005b5546b6 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > > @@ -3619,6 +3619,18 @@ virtual_get_sibling(struct intel_engine_cs
> > > *engine, unsigned int sibling)
> > >       return ve->siblings[sibling];
> > >   }
> > > +static bool virtual_engine_has_heartbeat(const struct
> > > intel_engine_cs *ve)
> > > +{
> > > +    struct intel_engine_cs *engine;
> > > +    intel_engine_mask_t tmp, mask = ve->mask;
> > > +
> > > +    for_each_engine_masked(engine, ve->gt, mask, tmp)
> > > +        if (READ_ONCE(engine->props.heartbeat_interval_ms))
> > > +            return true;
> > > +
> > > +    return false;
> > > +}
> > > +
> > >   static const struct intel_context_ops virtual_context_ops = {
> > >       .flags = COPS_HAS_INFLIGHT,
> > > @@ -3634,6 +3646,8 @@ static const struct intel_context_ops
> > > virtual_context_ops = {
> > >       .enter = virtual_context_enter,
> > >       .exit = virtual_context_exit,
> > > +    .has_heartbeat = virtual_engine_has_heartbeat,
> > > +
> > >       .destroy = virtual_context_destroy,
> > >       .get_sibling = virtual_get_sibling,
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > index 89ff0e4b4bc7..ae70bff3605f 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > @@ -2168,6 +2168,8 @@ static int guc_virtual_context_alloc(struct
> > > intel_context *ce)
> > >       return lrc_alloc(ce, engine);
> > >   }
> > > +static bool guc_virtual_engine_has_heartbeat(const struct
> > > intel_engine_cs *ve);
> > > +
> > >   static const struct intel_context_ops virtual_guc_context_ops = {
> > >       .alloc = guc_virtual_context_alloc,
> > > @@ -2183,6 +2185,8 @@ static const struct intel_context_ops
> > > virtual_guc_context_ops = {
> > >       .enter = guc_virtual_context_enter,
> > >       .exit = guc_virtual_context_exit,
> > > +    .has_heartbeat = guc_virtual_engine_has_heartbeat,
> > > +
> > >       .sched_disable = guc_context_sched_disable,
> > >       .destroy = guc_context_destroy,
> > > @@ -3029,7 +3033,7 @@ guc_create_virtual(struct intel_engine_cs
> > > **siblings, unsigned int count)
> > >       return ERR_PTR(err);
> > >   }
> > > -bool intel_guc_virtual_engine_has_heartbeat(const struct
> > > intel_engine_cs *ve)
> > > +static bool guc_virtual_engine_has_heartbeat(const struct
> > > intel_engine_cs *ve)
> > >   {
> > >       struct intel_engine_cs *engine;
> > >       intel_engine_mask_t tmp, mask = ve->mask;
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> > > b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> > > index c7ef44fa0c36..c2afc3b88fd8 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> > > @@ -29,8 +29,6 @@ void intel_guc_dump_active_requests(struct
> > > intel_engine_cs *engine,
> > >                       struct i915_request *hung_rq,
> > >                       struct drm_printer *m);
> > > -bool intel_guc_virtual_engine_has_heartbeat(const struct
> > > intel_engine_cs *ve);
> > > -
> > >   int intel_guc_wait_for_pending_msg(struct intel_guc *guc,
> > >                      atomic_t *wait_var,
> > >                      bool interruptible,
> > 
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
