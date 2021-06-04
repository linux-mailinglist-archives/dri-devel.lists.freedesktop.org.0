Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EDA39C102
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 22:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BCAE6E23B;
	Fri,  4 Jun 2021 20:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12096E23B;
 Fri,  4 Jun 2021 20:02:32 +0000 (UTC)
IronPort-SDR: I/ns67zv9KvDuDOMgypBVjKxQ0nqQRmnMCfoJuzigkIDitoiTMQxCa0GR6f4BlunKMZqlYVUxK
 ldhNAOsMBfLQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10005"; a="204337031"
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="204337031"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 13:02:30 -0700
IronPort-SDR: Ct+BtqmZugNm9V6aKy7jRnHdhuG1a0dKIBuVYM94HxKV+VREap+O5sBmgbmDZmIsF3qTTUKHrP
 xizNnTN4uHUw==
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="634124406"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 13:02:28 -0700
Date: Fri, 4 Jun 2021 12:55:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 8/9] drm/i915: Move submission tasklet to i915_sched_engine
Message-ID: <20210604195529.GA3305@sdutt-i7>
References: <20210603212722.59719-1-matthew.brost@intel.com>
 <20210603212722.59719-9-matthew.brost@intel.com>
 <CAOFGe94z7r1tk8-t7+RJZTyNOYD785HY9-FcLmn5mmKdGUn1cg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOFGe94z7r1tk8-t7+RJZTyNOYD785HY9-FcLmn5mmKdGUn1cg@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 04, 2021 at 02:26:38PM -0500, Jason Ekstrand wrote:
> On Thu, Jun 3, 2021 at 4:09 PM Matthew Brost <matthew.brost@intel.com> wrote:
> >
> > The submission tasklet operates on i915_sched_engine, thus it is the
> > correct place for it.
> >
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_engine.h        | 14 ---
> >  drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 12 +--
> >  drivers/gpu/drm/i915/gt/intel_engine_types.h  |  5 --
> >  .../drm/i915/gt/intel_execlists_submission.c  | 86 ++++++++++---------
> >  drivers/gpu/drm/i915/gt/mock_engine.c         |  1 +
> >  drivers/gpu/drm/i915/gt/selftest_execlists.c  | 16 ++--
> >  drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  2 +-
> >  drivers/gpu/drm/i915/gt/selftest_lrc.c        |  6 +-
> >  drivers/gpu/drm/i915/gt/selftest_reset.c      |  2 +-
> >  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 25 +++---
> >  drivers/gpu/drm/i915/i915_scheduler.c         |  1 +
> >  drivers/gpu/drm/i915/i915_scheduler.h         | 14 +++
> >  drivers/gpu/drm/i915/i915_scheduler_types.h   |  8 ++
> >  13 files changed, 99 insertions(+), 93 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
> > index a8b2174b4395..988d9688ae4d 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> > @@ -123,20 +123,6 @@ execlists_active(const struct intel_engine_execlists *execlists)
> >         return active;
> >  }
> >
> > -static inline void
> > -execlists_active_lock_bh(struct intel_engine_execlists *execlists)
> > -{
> > -       local_bh_disable(); /* prevent local softirq and lock recursion */
> > -       tasklet_lock(&execlists->tasklet);
> > -}
> > -
> > -static inline void
> > -execlists_active_unlock_bh(struct intel_engine_execlists *execlists)
> > -{
> > -       tasklet_unlock(&execlists->tasklet);
> > -       local_bh_enable(); /* restore softirq, and kick ksoftirqd! */
> > -}
> > -
> >  struct i915_request *
> >  execlists_unwind_incomplete_requests(struct intel_engine_execlists *execlists);
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > index b480fcb1aad1..837d2132e31b 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > @@ -711,6 +711,7 @@ static int engine_setup_common(struct intel_engine_cs *engine)
> >                 err = -ENOMEM;
> >                 goto err_sched_engine;
> >         }
> > +       engine->sched_engine->engine = engine;
> 
> This bothers me.  If we're trying to separate things, why do we have a
> back pointer?  Yes, I know it's because we need to access our engine
> back-end somehow.  Makes me wonder if it should be some sort of a
> void* private data pointer instead of the engine.  That's probably
> less safe but it seems more "right" in some sense?  I don't know.
> 

This was new moving from internal to upstream because of the new tasklet
API that has landed. Previously the tasklet function was setup with u64
data which we used to point to the engine. Now it uses a callback with
the tasklet structure as the argument and can only use a container_of to
resolve the object which in this case a i915_sched_engine. In execlists
we still need the engine object to do the submit, hence the back
pointer.

Longterm we really should have an execlists_submit_engine which
encapsulates the i915_sched_engine and everything we need for execlists
submission (and with DRM scheduler the i915_sched_engine encapsulates
the drm_gpu_scheduler object and common variables between execlists and
GuC). 

I already have an object like this for the GuC, guc_submit_eninge,
albeit slightly out of order in patch series.

Agree void* private is better as for the GuC code we likely need this to
be a backpointer to the GuC structure until the aforementioned
guc_submit_engine lands.

Are you ok with landing this with a void* and taking a note this needs
to be reworked? 

> Also, dumb question but what's a tasklet?
> 

All submissions in the current i915 go through a tasklet. The GuC
submission that will initially land uses this too. Once the DRM
scheduler lands this will go away, at least for GuC submission. If this
is still around for execlists we likely stick this in
execlists_submit_engine object and forget about it.

Matt

> --Jason
> 
> >
> >         err = intel_engine_init_cmd_parser(engine);
> >         if (err)
> > @@ -935,7 +936,6 @@ int intel_engines_init(struct intel_gt *gt)
> >  void intel_engine_cleanup_common(struct intel_engine_cs *engine)
> >  {
> >         GEM_BUG_ON(!list_empty(&engine->sched_engine->requests));
> > -       tasklet_kill(&engine->execlists.tasklet); /* flush the callback */
> >
> >         i915_sched_engine_put(engine->sched_engine);
> >         intel_breadcrumbs_free(engine->breadcrumbs);
> > @@ -1221,7 +1221,7 @@ static bool ring_is_idle(struct intel_engine_cs *engine)
> >
> >  void __intel_engine_flush_submission(struct intel_engine_cs *engine, bool sync)
> >  {
> > -       struct tasklet_struct *t = &engine->execlists.tasklet;
> > +       struct tasklet_struct *t = &engine->sched_engine->tasklet;
> >
> >         if (!t->callback)
> >                 return;
> > @@ -1482,8 +1482,8 @@ static void intel_engine_print_registers(struct intel_engine_cs *engine,
> >
> >                 drm_printf(m, "\tExeclist tasklet queued? %s (%s), preempt? %s, timeslice? %s\n",
> >                            yesno(test_bit(TASKLET_STATE_SCHED,
> > -                                         &engine->execlists.tasklet.state)),
> > -                          enableddisabled(!atomic_read(&engine->execlists.tasklet.count)),
> > +                                         &engine->sched_engine->tasklet.state)),
> > +                          enableddisabled(!atomic_read(&engine->sched_engine->tasklet.count)),
> >                            repr_timer(&engine->execlists.preempt),
> >                            repr_timer(&engine->execlists.timer));
> >
> > @@ -1507,7 +1507,7 @@ static void intel_engine_print_registers(struct intel_engine_cs *engine,
> >                                    idx, hws[idx * 2], hws[idx * 2 + 1]);
> >                 }
> >
> > -               execlists_active_lock_bh(execlists);
> > +               i915_sched_engine_active_lock_bh(engine->sched_engine);
> >                 rcu_read_lock();
> >                 for (port = execlists->active; (rq = *port); port++) {
> >                         char hdr[160];
> > @@ -1538,7 +1538,7 @@ static void intel_engine_print_registers(struct intel_engine_cs *engine,
> >                         i915_request_show(m, rq, hdr, 0);
> >                 }
> >                 rcu_read_unlock();
> > -               execlists_active_unlock_bh(execlists);
> > +               i915_sched_engine_active_unlock_bh(engine->sched_engine);
> >         } else if (INTEL_GEN(dev_priv) > 6) {
> >                 drm_printf(m, "\tPP_DIR_BASE: 0x%08x\n",
> >                            ENGINE_READ(engine, RING_PP_DIR_BASE));
> > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > index f1b14aff5118..6f2fd6f13ac4 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > @@ -138,11 +138,6 @@ struct st_preempt_hang {
> >   * driver and the hardware state for execlist mode of submission.
> >   */
> >  struct intel_engine_execlists {
> > -       /**
> > -        * @tasklet: softirq tasklet for bottom handler
> > -        */
> > -       struct tasklet_struct tasklet;
> > -
> >         /**
> >          * @timer: kick the current context if its timeslice expires
> >          */
> > diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > index 7240c153be35..7a93aec3f6a9 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > @@ -570,7 +570,7 @@ static void kick_siblings(struct i915_request *rq, struct intel_context *ce)
> >                 resubmit_virtual_request(rq, ve);
> >
> >         if (READ_ONCE(ve->request))
> > -               tasklet_hi_schedule(&ve->base.execlists.tasklet);
> > +               tasklet_hi_schedule(&ve->base.sched_engine->tasklet);
> >  }
> >
> >  static void __execlists_schedule_out(struct i915_request * const rq,
> > @@ -739,9 +739,9 @@ trace_ports(const struct intel_engine_execlists *execlists,
> >  }
> >
> >  static bool
> > -reset_in_progress(const struct intel_engine_execlists *execlists)
> > +reset_in_progress(const struct intel_engine_cs *engine)
> >  {
> > -       return unlikely(!__tasklet_is_enabled(&execlists->tasklet));
> > +       return unlikely(!__tasklet_is_enabled(&engine->sched_engine->tasklet));
> >  }
> >
> >  static __maybe_unused noinline bool
> > @@ -757,7 +757,7 @@ assert_pending_valid(const struct intel_engine_execlists *execlists,
> >         trace_ports(execlists, msg, execlists->pending);
> >
> >         /* We may be messing around with the lists during reset, lalala */
> > -       if (reset_in_progress(execlists))
> > +       if (reset_in_progress(engine))
> >                 return true;
> >
> >         if (!execlists->pending[0]) {
> > @@ -1190,7 +1190,7 @@ static void start_timeslice(struct intel_engine_cs *engine)
> >                          * its timeslice, so recheck.
> >                          */
> >                         if (!timer_pending(&el->timer))
> > -                               tasklet_hi_schedule(&el->tasklet);
> > +                               tasklet_hi_schedule(&engine->sched_engine->tasklet);
> >                         return;
> >                 }
> >
> > @@ -1772,8 +1772,8 @@ process_csb(struct intel_engine_cs *engine, struct i915_request **inactive)
> >          * access. Either we are inside the tasklet, or the tasklet is disabled
> >          * and we assume that is only inside the reset paths and so serialised.
> >          */
> > -       GEM_BUG_ON(!tasklet_is_locked(&execlists->tasklet) &&
> > -                  !reset_in_progress(execlists));
> > +       GEM_BUG_ON(!tasklet_is_locked(&engine->sched_engine->tasklet) &&
> > +                  !reset_in_progress(engine));
> >
> >         /*
> >          * Note that csb_write, csb_status may be either in HWSP or mmio.
> > @@ -2131,7 +2131,7 @@ static void execlists_unhold(struct intel_engine_cs *engine,
> >
> >         if (rq_prio(rq) > engine->sched_engine->queue_priority_hint) {
> >                 engine->sched_engine->queue_priority_hint = rq_prio(rq);
> > -               tasklet_hi_schedule(&engine->execlists.tasklet);
> > +               tasklet_hi_schedule(&engine->sched_engine->tasklet);
> >         }
> >
> >         spin_unlock_irq(&engine->sched_engine->lock);
> > @@ -2322,13 +2322,13 @@ static void execlists_reset(struct intel_engine_cs *engine, const char *msg)
> >         ENGINE_TRACE(engine, "reset for %s\n", msg);
> >
> >         /* Mark this tasklet as disabled to avoid waiting for it to complete */
> > -       tasklet_disable_nosync(&engine->execlists.tasklet);
> > +       tasklet_disable_nosync(&engine->sched_engine->tasklet);
> >
> >         ring_set_paused(engine, 1); /* Freeze the current request in place */
> >         execlists_capture(engine);
> >         intel_engine_reset(engine, msg);
> >
> > -       tasklet_enable(&engine->execlists.tasklet);
> > +       tasklet_enable(&engine->sched_engine->tasklet);
> >         clear_and_wake_up_bit(bit, lock);
> >  }
> >
> > @@ -2351,8 +2351,9 @@ static bool preempt_timeout(const struct intel_engine_cs *const engine)
> >   */
> >  static void execlists_submission_tasklet(struct tasklet_struct *t)
> >  {
> > -       struct intel_engine_cs * const engine =
> > -               from_tasklet(engine, t, execlists.tasklet);
> > +       struct i915_sched_engine *sched_engine =
> > +               from_tasklet(sched_engine, t, tasklet);
> > +       struct intel_engine_cs * const engine = sched_engine->engine;
> >         struct i915_request *post[2 * EXECLIST_MAX_PORTS];
> >         struct i915_request **inactive;
> >
> > @@ -2427,13 +2428,16 @@ static void execlists_irq_handler(struct intel_engine_cs *engine, u16 iir)
> >                 intel_engine_signal_breadcrumbs(engine);
> >
> >         if (tasklet)
> > -               tasklet_hi_schedule(&engine->execlists.tasklet);
> > +               tasklet_hi_schedule(&engine->sched_engine->tasklet);
> >  }
> >
> >  static void __execlists_kick(struct intel_engine_execlists *execlists)
> >  {
> > +       struct intel_engine_cs *engine =
> > +               container_of(execlists, typeof(*engine), execlists);
> > +
> >         /* Kick the tasklet for some interrupt coalescing and reset handling */
> > -       tasklet_hi_schedule(&execlists->tasklet);
> > +       tasklet_hi_schedule(&engine->sched_engine->tasklet);
> >  }
> >
> >  #define execlists_kick(t, member) \
> > @@ -2808,10 +2812,8 @@ static int execlists_resume(struct intel_engine_cs *engine)
> >
> >  static void execlists_reset_prepare(struct intel_engine_cs *engine)
> >  {
> > -       struct intel_engine_execlists * const execlists = &engine->execlists;
> > -
> >         ENGINE_TRACE(engine, "depth<-%d\n",
> > -                    atomic_read(&execlists->tasklet.count));
> > +                    atomic_read(&engine->sched_engine->tasklet.count));
> >
> >         /*
> >          * Prevent request submission to the hardware until we have
> > @@ -2822,8 +2824,8 @@ static void execlists_reset_prepare(struct intel_engine_cs *engine)
> >          * Turning off the execlists->tasklet until the reset is over
> >          * prevents the race.
> >          */
> > -       __tasklet_disable_sync_once(&execlists->tasklet);
> > -       GEM_BUG_ON(!reset_in_progress(execlists));
> > +       __tasklet_disable_sync_once(&engine->sched_engine->tasklet);
> > +       GEM_BUG_ON(!reset_in_progress(engine));
> >
> >         /*
> >          * We stop engines, otherwise we might get failed reset and a
> > @@ -2973,8 +2975,9 @@ static void execlists_reset_rewind(struct intel_engine_cs *engine, bool stalled)
> >
> >  static void nop_submission_tasklet(struct tasklet_struct *t)
> >  {
> > -       struct intel_engine_cs * const engine =
> > -               from_tasklet(engine, t, execlists.tasklet);
> > +       struct i915_sched_engine *sched_engine =
> > +               from_tasklet(sched_engine, t, tasklet);
> > +       struct intel_engine_cs * const engine = sched_engine->engine;
> >
> >         /* The driver is wedged; don't process any more events. */
> >         WRITE_ONCE(engine->sched_engine->queue_priority_hint, INT_MIN);
> > @@ -3061,8 +3064,8 @@ static void execlists_reset_cancel(struct intel_engine_cs *engine)
> >         sched_engine->queue_priority_hint = INT_MIN;
> >         sched_engine->queue = RB_ROOT_CACHED;
> >
> > -       GEM_BUG_ON(__tasklet_is_enabled(&execlists->tasklet));
> > -       execlists->tasklet.callback = nop_submission_tasklet;
> > +       GEM_BUG_ON(__tasklet_is_enabled(&engine->sched_engine->tasklet));
> > +       engine->sched_engine->tasklet.callback = nop_submission_tasklet;
> >
> >         spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
> >         rcu_read_unlock();
> > @@ -3082,14 +3085,14 @@ static void execlists_reset_finish(struct intel_engine_cs *engine)
> >          * reset as the next level of recovery, and as a final resort we
> >          * will declare the device wedged.
> >          */
> > -       GEM_BUG_ON(!reset_in_progress(execlists));
> > +       GEM_BUG_ON(!reset_in_progress(engine));
> >
> >         /* And kick in case we missed a new request submission. */
> > -       if (__tasklet_enable(&execlists->tasklet))
> > +       if (__tasklet_enable(&engine->sched_engine->tasklet))
> >                 __execlists_kick(execlists);
> >
> >         ENGINE_TRACE(engine, "depth->%d\n",
> > -                    atomic_read(&execlists->tasklet.count));
> > +                    atomic_read(&engine->sched_engine->tasklet.count));
> >  }
> >
> >  static void gen8_logical_ring_enable_irq(struct intel_engine_cs *engine)
> > @@ -3153,8 +3156,6 @@ static void kick_execlists(const struct i915_request *rq, int prio)
> >                      inflight->fence.context, inflight->fence.seqno,
> >                      inflight->sched.attr.priority);
> >
> > -       sched_engine->queue_priority_hint = prio;
> > -
> >         /*
> >          * Allow preemption of low -> normal -> high, but we do
> >          * not allow low priority tasks to preempt other low priority
> > @@ -3163,7 +3164,7 @@ static void kick_execlists(const struct i915_request *rq, int prio)
> >          * so kiss.
> >          */
> >         if (prio >= max(I915_PRIORITY_NORMAL, rq_prio(inflight)))
> > -               tasklet_hi_schedule(&engine->execlists.tasklet);
> > +               tasklet_hi_schedule(&sched_engine->tasklet);
> >
> >  unlock:
> >         rcu_read_unlock();
> > @@ -3174,7 +3175,7 @@ static void execlists_set_default_submission(struct intel_engine_cs *engine)
> >         engine->submit_request = execlists_submit_request;
> >         engine->sched_engine->schedule = i915_schedule;
> >         engine->sched_engine->kick_backend = kick_execlists;
> > -       engine->execlists.tasklet.callback = execlists_submission_tasklet;
> > +       engine->sched_engine->tasklet.callback = execlists_submission_tasklet;
> >  }
> >
> >  static void execlists_shutdown(struct intel_engine_cs *engine)
> > @@ -3182,7 +3183,7 @@ static void execlists_shutdown(struct intel_engine_cs *engine)
> >         /* Synchronise with residual timers and any softirq they raise */
> >         del_timer_sync(&engine->execlists.timer);
> >         del_timer_sync(&engine->execlists.preempt);
> > -       tasklet_kill(&engine->execlists.tasklet);
> > +       tasklet_kill(&engine->sched_engine->tasklet);
> >  }
> >
> >  static void execlists_release(struct intel_engine_cs *engine)
> > @@ -3298,7 +3299,7 @@ int intel_execlists_submission_setup(struct intel_engine_cs *engine)
> >         struct intel_uncore *uncore = engine->uncore;
> >         u32 base = engine->mmio_base;
> >
> > -       tasklet_setup(&engine->execlists.tasklet, execlists_submission_tasklet);
> > +       tasklet_setup(&engine->sched_engine->tasklet, execlists_submission_tasklet);
> >         timer_setup(&engine->execlists.timer, execlists_timeslice, 0);
> >         timer_setup(&engine->execlists.preempt, execlists_preempt, 0);
> >
> > @@ -3380,7 +3381,7 @@ static void rcu_virtual_context_destroy(struct work_struct *wrk)
> >          * rbtrees as in the case it is running in parallel, it may reinsert
> >          * the rb_node into a sibling.
> >          */
> > -       tasklet_kill(&ve->base.execlists.tasklet);
> > +       tasklet_kill(&ve->base.sched_engine->tasklet);
> >
> >         /* Decouple ourselves from the siblings, no more access allowed. */
> >         for (n = 0; n < ve->num_siblings; n++) {
> > @@ -3392,13 +3393,13 @@ static void rcu_virtual_context_destroy(struct work_struct *wrk)
> >
> >                 spin_lock_irq(&sibling->sched_engine->lock);
> >
> > -               /* Detachment is lazily performed in the execlists tasklet */
> > +               /* Detachment is lazily performed in the sched_engine->tasklet */
> >                 if (!RB_EMPTY_NODE(node))
> >                         rb_erase_cached(node, &sibling->execlists.virtual);
> >
> >                 spin_unlock_irq(&sibling->sched_engine->lock);
> >         }
> > -       GEM_BUG_ON(__tasklet_is_scheduled(&ve->base.execlists.tasklet));
> > +       GEM_BUG_ON(__tasklet_is_scheduled(&ve->base.sched_engine->tasklet));
> >         GEM_BUG_ON(!list_empty(virtual_queue(ve)));
> >
> >         lrc_fini(&ve->context);
> > @@ -3545,9 +3546,11 @@ static intel_engine_mask_t virtual_submission_mask(struct virtual_engine *ve)
> >
> >  static void virtual_submission_tasklet(struct tasklet_struct *t)
> >  {
> > +       struct i915_sched_engine *sched_engine =
> > +               from_tasklet(sched_engine, t, tasklet);
> >         struct virtual_engine * const ve =
> > -               from_tasklet(ve, t, base.execlists.tasklet);
> > -       const int prio = READ_ONCE(ve->base.sched_engine->queue_priority_hint);
> > +               (struct virtual_engine *)sched_engine->engine;
> > +       const int prio = READ_ONCE(sched_engine->queue_priority_hint);
> >         intel_engine_mask_t mask;
> >         unsigned int n;
> >
> > @@ -3616,7 +3619,7 @@ static void virtual_submission_tasklet(struct tasklet_struct *t)
> >                 GEM_BUG_ON(RB_EMPTY_NODE(&node->rb));
> >                 node->prio = prio;
> >                 if (first && prio > sibling->sched_engine->queue_priority_hint)
> > -                       tasklet_hi_schedule(&sibling->execlists.tasklet);
> > +                       tasklet_hi_schedule(&sibling->sched_engine->tasklet);
> >
> >  unlock_engine:
> >                 spin_unlock_irq(&sibling->sched_engine->lock);
> > @@ -3657,7 +3660,7 @@ static void virtual_submit_request(struct i915_request *rq)
> >         GEM_BUG_ON(!list_empty(virtual_queue(ve)));
> >         list_move_tail(&rq->sched.link, virtual_queue(ve));
> >
> > -       tasklet_hi_schedule(&ve->base.execlists.tasklet);
> > +       tasklet_hi_schedule(&ve->base.sched_engine->tasklet);
> >
> >  unlock:
> >         spin_unlock_irqrestore(&ve->base.sched_engine->lock, flags);
> > @@ -3751,6 +3754,7 @@ intel_execlists_create_virtual(struct intel_engine_cs **siblings,
> >                 err = -ENOMEM;
> >                 goto err_put;
> >         }
> > +       ve->base.sched_engine->engine = &ve->base;
> >
> >         ve->base.cops = &virtual_context_ops;
> >         ve->base.request_alloc = execlists_request_alloc;
> > @@ -3761,7 +3765,7 @@ intel_execlists_create_virtual(struct intel_engine_cs **siblings,
> >         ve->base.bond_execute = virtual_bond_execute;
> >
> >         INIT_LIST_HEAD(virtual_queue(ve));
> > -       tasklet_setup(&ve->base.execlists.tasklet, virtual_submission_tasklet);
> > +       tasklet_setup(&ve->base.sched_engine->tasklet, virtual_submission_tasklet);
> >
> >         intel_context_init(&ve->context, &ve->base);
> >
> > @@ -3789,7 +3793,7 @@ intel_execlists_create_virtual(struct intel_engine_cs **siblings,
> >                  * layering if we handle cloning of the requests and
> >                  * submitting a copy into each backend.
> >                  */
> > -               if (sibling->execlists.tasklet.callback !=
> > +               if (sibling->sched_engine->tasklet.callback !=
> >                     execlists_submission_tasklet) {
> >                         err = -ENODEV;
> >                         goto err_put;
> > diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
> > index a49fd3039f13..bd005c1b6fd5 100644
> > --- a/drivers/gpu/drm/i915/gt/mock_engine.c
> > +++ b/drivers/gpu/drm/i915/gt/mock_engine.c
> > @@ -349,6 +349,7 @@ int mock_engine_init(struct intel_engine_cs *engine)
> >         engine->sched_engine = i915_sched_engine_create(ENGINE_MOCK);
> >         if (!engine->sched_engine)
> >                 return -ENOMEM;
> > +       engine->sched_engine->engine = engine;
> >
> >         intel_engine_init_execlists(engine);
> >         intel_engine_init__pm(engine);
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> > index 5cc7648d1e5a..2554a2f343b4 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> > @@ -43,7 +43,7 @@ static int wait_for_submit(struct intel_engine_cs *engine,
> >                            unsigned long timeout)
> >  {
> >         /* Ignore our own attempts to suppress excess tasklets */
> > -       tasklet_hi_schedule(&engine->execlists.tasklet);
> > +       tasklet_hi_schedule(&engine->sched_engine->tasklet);
> >
> >         timeout += jiffies;
> >         do {
> > @@ -606,9 +606,9 @@ static int live_hold_reset(void *arg)
> >                         err = -EBUSY;
> >                         goto out;
> >                 }
> > -               tasklet_disable(&engine->execlists.tasklet);
> > +               tasklet_disable(&engine->sched_engine->tasklet);
> >
> > -               engine->execlists.tasklet.callback(&engine->execlists.tasklet);
> > +               engine->sched_engine->tasklet.callback(&engine->sched_engine->tasklet);
> >                 GEM_BUG_ON(execlists_active(&engine->execlists) != rq);
> >
> >                 i915_request_get(rq);
> > @@ -618,7 +618,7 @@ static int live_hold_reset(void *arg)
> >                 __intel_engine_reset_bh(engine, NULL);
> >                 GEM_BUG_ON(rq->fence.error != -EIO);
> >
> > -               tasklet_enable(&engine->execlists.tasklet);
> > +               tasklet_enable(&engine->sched_engine->tasklet);
> >                 clear_and_wake_up_bit(I915_RESET_ENGINE + id,
> >                                       &gt->reset.flags);
> >                 local_bh_enable();
> > @@ -1183,7 +1183,7 @@ static int live_timeslice_rewind(void *arg)
> >                 while (i915_request_is_active(rq[A2])) { /* semaphore yield! */
> >                         /* Wait for the timeslice to kick in */
> >                         del_timer(&engine->execlists.timer);
> > -                       tasklet_hi_schedule(&engine->execlists.tasklet);
> > +                       tasklet_hi_schedule(&engine->sched_engine->tasklet);
> >                         intel_engine_flush_submission(engine);
> >                 }
> >                 /* -> ELSP[] = { { A:rq1 }, { B:rq1 } } */
> > @@ -4593,9 +4593,9 @@ static int reset_virtual_engine(struct intel_gt *gt,
> >                 err = -EBUSY;
> >                 goto out_heartbeat;
> >         }
> > -       tasklet_disable(&engine->execlists.tasklet);
> > +       tasklet_disable(&engine->sched_engine->tasklet);
> >
> > -       engine->execlists.tasklet.callback(&engine->execlists.tasklet);
> > +       engine->sched_engine->tasklet.callback(&engine->sched_engine->tasklet);
> >         GEM_BUG_ON(execlists_active(&engine->execlists) != rq);
> >
> >         /* Fake a preemption event; failed of course */
> > @@ -4612,7 +4612,7 @@ static int reset_virtual_engine(struct intel_gt *gt,
> >         GEM_BUG_ON(rq->fence.error != -EIO);
> >
> >         /* Release our grasp on the engine, letting CS flow again */
> > -       tasklet_enable(&engine->execlists.tasklet);
> > +       tasklet_enable(&engine->sched_engine->tasklet);
> >         clear_and_wake_up_bit(I915_RESET_ENGINE + engine->id, &gt->reset.flags);
> >         local_bh_enable();
> >
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> > index e57dc900ae8d..cbcb800e2ca0 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> > @@ -1702,7 +1702,7 @@ static int __igt_atomic_reset_engine(struct intel_engine_cs *engine,
> >                                      const struct igt_atomic_section *p,
> >                                      const char *mode)
> >  {
> > -       struct tasklet_struct * const t = &engine->execlists.tasklet;
> > +       struct tasklet_struct * const t = &engine->sched_engine->tasklet;
> >         int err;
> >
> >         GEM_TRACE("i915_reset_engine(%s:%s) under %s\n",
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> > index d8f6623524e8..6a3a0d89dcd2 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> > @@ -49,7 +49,7 @@ static int wait_for_submit(struct intel_engine_cs *engine,
> >                            unsigned long timeout)
> >  {
> >         /* Ignore our own attempts to suppress excess tasklets */
> > -       tasklet_hi_schedule(&engine->execlists.tasklet);
> > +       tasklet_hi_schedule(&engine->sched_engine->tasklet);
> >
> >         timeout += jiffies;
> >         do {
> > @@ -1613,12 +1613,12 @@ static void garbage_reset(struct intel_engine_cs *engine,
> >
> >         local_bh_disable();
> >         if (!test_and_set_bit(bit, lock)) {
> > -               tasklet_disable(&engine->execlists.tasklet);
> > +               tasklet_disable(&engine->sched_engine->tasklet);
> >
> >                 if (!rq->fence.error)
> >                         __intel_engine_reset_bh(engine, NULL);
> >
> > -               tasklet_enable(&engine->execlists.tasklet);
> > +               tasklet_enable(&engine->sched_engine->tasklet);
> >                 clear_and_wake_up_bit(bit, lock);
> >         }
> >         local_bh_enable();
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
> > index 8784257ec808..7a50c9f4071b 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
> > @@ -321,7 +321,7 @@ static int igt_atomic_engine_reset(void *arg)
> >                 goto out_unlock;
> >
> >         for_each_engine(engine, gt, id) {
> > -               struct tasklet_struct *t = &engine->execlists.tasklet;
> > +               struct tasklet_struct *t = &engine->sched_engine->tasklet;
> >
> >                 if (t->func)
> >                         tasklet_disable(t);
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 7ed21670ef14..95c6f6af4047 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -241,8 +241,9 @@ static void __guc_dequeue(struct intel_engine_cs *engine)
> >
> >  static void guc_submission_tasklet(struct tasklet_struct *t)
> >  {
> > -       struct intel_engine_cs * const engine =
> > -               from_tasklet(engine, t, execlists.tasklet);
> > +       struct i915_sched_engine *sched_engine =
> > +               from_tasklet(sched_engine, t, tasklet);
> > +       struct intel_engine_cs * const engine = sched_engine->engine;
> >         struct intel_engine_execlists * const execlists = &engine->execlists;
> >         struct i915_request **port, *rq;
> >         unsigned long flags;
> > @@ -272,14 +273,12 @@ static void cs_irq_handler(struct intel_engine_cs *engine, u16 iir)
> >  {
> >         if (iir & GT_RENDER_USER_INTERRUPT) {
> >                 intel_engine_signal_breadcrumbs(engine);
> > -               tasklet_hi_schedule(&engine->execlists.tasklet);
> > +               tasklet_hi_schedule(&engine->sched_engine->tasklet);
> >         }
> >  }
> >
> >  static void guc_reset_prepare(struct intel_engine_cs *engine)
> >  {
> > -       struct intel_engine_execlists * const execlists = &engine->execlists;
> > -
> >         ENGINE_TRACE(engine, "\n");
> >
> >         /*
> > @@ -291,7 +290,7 @@ static void guc_reset_prepare(struct intel_engine_cs *engine)
> >          * Turning off the execlists->tasklet until the reset is over
> >          * prevents the race.
> >          */
> > -       __tasklet_disable_sync_once(&execlists->tasklet);
> > +       __tasklet_disable_sync_once(&engine->sched_engine->tasklet);
> >  }
> >
> >  static void guc_reset_state(struct intel_context *ce,
> > @@ -395,14 +394,12 @@ static void guc_reset_cancel(struct intel_engine_cs *engine)
> >
> >  static void guc_reset_finish(struct intel_engine_cs *engine)
> >  {
> > -       struct intel_engine_execlists * const execlists = &engine->execlists;
> > -
> > -       if (__tasklet_enable(&execlists->tasklet))
> > +       if (__tasklet_enable(&engine->sched_engine->tasklet))
> >                 /* And kick in case we missed a new request submission. */
> > -               tasklet_hi_schedule(&execlists->tasklet);
> > +               tasklet_hi_schedule(&engine->sched_engine->tasklet);
> >
> >         ENGINE_TRACE(engine, "depth->%d\n",
> > -                    atomic_read(&execlists->tasklet.count));
> > +                    atomic_read(&engine->sched_engine->tasklet.count));
> >  }
> >
> >  /*
> > @@ -546,7 +543,7 @@ static void guc_submit_request(struct i915_request *rq)
> >         GEM_BUG_ON(i915_sched_engine_is_empty(engine->sched_engine));
> >         GEM_BUG_ON(list_empty(&rq->sched.link));
> >
> > -       tasklet_hi_schedule(&engine->execlists.tasklet);
> > +       tasklet_hi_schedule(&engine->sched_engine->tasklet);
> >
> >         spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
> >  }
> > @@ -626,7 +623,7 @@ static void guc_release(struct intel_engine_cs *engine)
> >  {
> >         engine->sanitize = NULL; /* no longer in control, nothing to sanitize */
> >
> > -       tasklet_kill(&engine->execlists.tasklet);
> > +       tasklet_kill(&engine->sched_engine->tasklet);
> >
> >         intel_engine_cleanup_common(engine);
> >         lrc_fini_wa_ctx(engine);
> > @@ -705,7 +702,7 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
> >          */
> >         GEM_BUG_ON(INTEL_GEN(i915) < 11);
> >
> > -       tasklet_setup(&engine->execlists.tasklet, guc_submission_tasklet);
> > +       tasklet_setup(&engine->sched_engine->tasklet, guc_submission_tasklet);
> >
> >         guc_default_vfuncs(engine);
> >         guc_default_irqs(engine);
> > diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
> > index 3d36e4447b5d..6f082579ee9e 100644
> > --- a/drivers/gpu/drm/i915/i915_scheduler.c
> > +++ b/drivers/gpu/drm/i915/i915_scheduler.c
> > @@ -436,6 +436,7 @@ void i915_sched_engine_free(struct kref *kref)
> >         struct i915_sched_engine *sched_engine =
> >                 container_of(kref, typeof(*sched_engine), ref);
> >
> > +       tasklet_kill(&sched_engine->tasklet); /* flush the callback */
> >         kfree(sched_engine);
> >  }
> >
> > diff --git a/drivers/gpu/drm/i915/i915_scheduler.h b/drivers/gpu/drm/i915/i915_scheduler.h
> > index 0014745bda30..650ab8e0db9f 100644
> > --- a/drivers/gpu/drm/i915/i915_scheduler.h
> > +++ b/drivers/gpu/drm/i915/i915_scheduler.h
> > @@ -79,6 +79,20 @@ i915_sched_engine_reset_on_empty(struct i915_sched_engine *sched_engine)
> >                 sched_engine->no_priolist = false;
> >  }
> >
> > +static inline void
> > +i915_sched_engine_active_lock_bh(struct i915_sched_engine *sched_engine)
> > +{
> > +       local_bh_disable(); /* prevent local softirq and lock recursion */
> > +       tasklet_lock(&sched_engine->tasklet);
> > +}
> > +
> > +static inline void
> > +i915_sched_engine_active_unlock_bh(struct i915_sched_engine *sched_engine)
> > +{
> > +       tasklet_unlock(&sched_engine->tasklet);
> > +       local_bh_enable(); /* restore softirq, and kick ksoftirqd! */
> > +}
> > +
> >  void i915_request_show_with_schedule(struct drm_printer *m,
> >                                      const struct i915_request *rq,
> >                                      const char *prefix,
> > diff --git a/drivers/gpu/drm/i915/i915_scheduler_types.h b/drivers/gpu/drm/i915/i915_scheduler_types.h
> > index 8b3af536e6cf..9d79514450de 100644
> > --- a/drivers/gpu/drm/i915/i915_scheduler_types.h
> > +++ b/drivers/gpu/drm/i915/i915_scheduler_types.h
> > @@ -103,6 +103,11 @@ struct i915_sched_engine {
> >         struct list_head requests;
> >         struct list_head hold; /* ready requests, but on hold */
> >
> > +       /**
> > +        * @tasklet: softirq tasklet for bottom handler
> > +        */
> > +       struct tasklet_struct tasklet;
> > +
> >         /**
> >          * @default_priolist: priority list for I915_PRIORITY_NORMAL
> >          */
> > @@ -132,6 +137,9 @@ struct i915_sched_engine {
> >          */
> >         bool no_priolist;
> >
> > +       /* Back pointer to engine */
> > +       struct intel_engine_cs *engine;
> > +
> >         /* Kick backend */
> >         void    (*kick_backend)(const struct i915_request *rq,
> >                                 int prio);
> > --
> > 2.28.0
> >
