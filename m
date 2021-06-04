Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B621839C066
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 21:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32F56E250;
	Fri,  4 Jun 2021 19:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA49D6E250;
 Fri,  4 Jun 2021 19:26:30 +0000 (UTC)
IronPort-SDR: X7nDP2v6GfjzRGKDCWvNtiunm8BFfU6kiCyNxf4j6kmU5q9AL+efurnuSQPXb03Sy0wyNUbMWj
 DcJbK9spyVuQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10005"; a="191689623"
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="191689623"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 12:26:30 -0700
IronPort-SDR: VgzmCjQgtsbdV2t8V6sMSiutJ5PHfMgzaOlKl/4Q2IM01n9KbNo5taHsRVocnQ6Egedc8L/6bf
 bLsL3XZGUu/w==
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="636658521"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 12:26:29 -0700
Date: Fri, 4 Jun 2021 12:19:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 6/9] drm/i915: Add kick_backend function to
 i915_sched_engine
Message-ID: <20210604191931.GC30465@sdutt-i7>
References: <20210603212722.59719-1-matthew.brost@intel.com>
 <20210603212722.59719-7-matthew.brost@intel.com>
 <CAOFGe95iV7_QTYCb4XW-ZmPh+o4O87Rq0tYkMNNTEX3Sw+ALsw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOFGe95iV7_QTYCb4XW-ZmPh+o4O87Rq0tYkMNNTEX3Sw+ALsw@mail.gmail.com>
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

On Fri, Jun 04, 2021 at 02:09:46PM -0500, Jason Ekstrand wrote:
> On Thu, Jun 3, 2021 at 4:09 PM Matthew Brost <matthew.brost@intel.com> wrote:
> >
> > Rather than touching execlist specific structures in the generic
> > scheduling code, add a callback function in the backend.
> 
> Seems reasonable but why does the function that's there today do
> nothing for the ringbuffer and current GuC back-ends?  I'm sure
> there's some reason but it's not immediately obvious to me.
> 

This code isn't used for ringbuffer submission and the current GuC
back-end is non-functional. The upcoming backend doesn't use these
structures nor does it is need to be kicked as it is always running if
requests are in the queue. So for the upcoming backend this function is
NULL.

Matt

> --Jason
> 
> 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  .../drm/i915/gt/intel_execlists_submission.c  | 52 ++++++++++++++++
> >  drivers/gpu/drm/i915/i915_scheduler.c         | 62 +------------------
> >  drivers/gpu/drm/i915/i915_scheduler_types.h   |  4 ++
> >  3 files changed, 58 insertions(+), 60 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > index 23fd03815ad0..3fac17103837 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > @@ -3116,10 +3116,61 @@ static bool can_preempt(struct intel_engine_cs *engine)
> >         return engine->class != RENDER_CLASS;
> >  }
> >
> > +static void kick_execlists(const struct i915_request *rq, int prio)
> > +{
> > +       struct intel_engine_cs *engine = rq->engine;
> > +       struct i915_sched_engine *sched_engine = engine->sched_engine;
> > +       const struct i915_request *inflight;
> > +
> > +       /*
> > +        * We only need to kick the tasklet once for the high priority
> > +        * new context we add into the queue.
> > +        */
> > +       if (prio <= sched_engine->queue_priority_hint)
> > +               return;
> > +
> > +       rcu_read_lock();
> > +
> > +       /* Nothing currently active? We're overdue for a submission! */
> > +       inflight = execlists_active(&engine->execlists);
> > +       if (!inflight)
> > +               goto unlock;
> > +
> > +       /*
> > +        * If we are already the currently executing context, don't
> > +        * bother evaluating if we should preempt ourselves.
> > +        */
> > +       if (inflight->context == rq->context)
> > +               goto unlock;
> > +
> > +       ENGINE_TRACE(engine,
> > +                    "bumping queue-priority-hint:%d for rq:%llx:%lld, inflight:%llx:%lld prio %d\n",
> > +                    prio,
> > +                    rq->fence.context, rq->fence.seqno,
> > +                    inflight->fence.context, inflight->fence.seqno,
> > +                    inflight->sched.attr.priority);
> > +
> > +       sched_engine->queue_priority_hint = prio;
> > +
> > +       /*
> > +        * Allow preemption of low -> normal -> high, but we do
> > +        * not allow low priority tasks to preempt other low priority
> > +        * tasks under the impression that latency for low priority
> > +        * tasks does not matter (as much as background throughput),
> > +        * so kiss.
> > +        */
> > +       if (prio >= max(I915_PRIORITY_NORMAL, rq_prio(inflight)))
> > +               tasklet_hi_schedule(&engine->execlists.tasklet);
> > +
> > +unlock:
> > +       rcu_read_unlock();
> > +}
> > +
> >  static void execlists_set_default_submission(struct intel_engine_cs *engine)
> >  {
> >         engine->submit_request = execlists_submit_request;
> >         engine->sched_engine->schedule = i915_schedule;
> > +       engine->sched_engine->kick_backend = kick_execlists;
> >         engine->execlists.tasklet.callback = execlists_submission_tasklet;
> >  }
> >
> > @@ -3702,6 +3753,7 @@ intel_execlists_create_virtual(struct intel_engine_cs **siblings,
> >         ve->base.request_alloc = execlists_request_alloc;
> >
> >         ve->base.sched_engine->schedule = i915_schedule;
> > +       ve->base.sched_engine->kick_backend = kick_execlists;
> >         ve->base.submit_request = virtual_submit_request;
> >         ve->base.bond_execute = virtual_bond_execute;
> >
> > diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
> > index 4bc6969f6a97..035b88f2e4aa 100644
> > --- a/drivers/gpu/drm/i915/i915_scheduler.c
> > +++ b/drivers/gpu/drm/i915/i915_scheduler.c
> > @@ -157,65 +157,6 @@ sched_lock_engine(const struct i915_sched_node *node,
> >         return locked;
> >  }
> >
> > -static inline int rq_prio(const struct i915_request *rq)
> > -{
> > -       return rq->sched.attr.priority;
> > -}
> > -
> > -static inline bool need_preempt(int prio, int active)
> > -{
> > -       /*
> > -        * Allow preemption of low -> normal -> high, but we do
> > -        * not allow low priority tasks to preempt other low priority
> > -        * tasks under the impression that latency for low priority
> > -        * tasks does not matter (as much as background throughput),
> > -        * so kiss.
> > -        */
> > -       return prio >= max(I915_PRIORITY_NORMAL, active);
> > -}
> > -
> > -static void kick_submission(struct intel_engine_cs *engine,
> > -                           const struct i915_request *rq,
> > -                           int prio)
> > -{
> > -       const struct i915_request *inflight;
> > -
> > -       /*
> > -        * We only need to kick the tasklet once for the high priority
> > -        * new context we add into the queue.
> > -        */
> > -       if (prio <= engine->sched_engine->queue_priority_hint)
> > -               return;
> > -
> > -       rcu_read_lock();
> > -
> > -       /* Nothing currently active? We're overdue for a submission! */
> > -       inflight = execlists_active(&engine->execlists);
> > -       if (!inflight)
> > -               goto unlock;
> > -
> > -       /*
> > -        * If we are already the currently executing context, don't
> > -        * bother evaluating if we should preempt ourselves.
> > -        */
> > -       if (inflight->context == rq->context)
> > -               goto unlock;
> > -
> > -       ENGINE_TRACE(engine,
> > -                    "bumping queue-priority-hint:%d for rq:%llx:%lld, inflight:%llx:%lld prio %d\n",
> > -                    prio,
> > -                    rq->fence.context, rq->fence.seqno,
> > -                    inflight->fence.context, inflight->fence.seqno,
> > -                    inflight->sched.attr.priority);
> > -
> > -       engine->sched_engine->queue_priority_hint = prio;
> > -       if (need_preempt(prio, rq_prio(inflight)))
> > -               tasklet_hi_schedule(&engine->execlists.tasklet);
> > -
> > -unlock:
> > -       rcu_read_unlock();
> > -}
> > -
> >  static void __i915_schedule(struct i915_sched_node *node,
> >                             const struct i915_sched_attr *attr)
> >  {
> > @@ -335,7 +276,8 @@ static void __i915_schedule(struct i915_sched_node *node,
> >                 }
> >
> >                 /* Defer (tasklet) submission until after all of our updates. */
> > -               kick_submission(engine, node_to_request(node), prio);
> > +               if (engine->sched_engine->kick_backend)
> > +                       engine->sched_engine->kick_backend(node_to_request(node), prio);
> >         }
> >
> >         spin_unlock(&engine->sched_engine->lock);
> > diff --git a/drivers/gpu/drm/i915/i915_scheduler_types.h b/drivers/gpu/drm/i915/i915_scheduler_types.h
> > index 3f462f8b06f2..8b3af536e6cf 100644
> > --- a/drivers/gpu/drm/i915/i915_scheduler_types.h
> > +++ b/drivers/gpu/drm/i915/i915_scheduler_types.h
> > @@ -132,6 +132,10 @@ struct i915_sched_engine {
> >          */
> >         bool no_priolist;
> >
> > +       /* Kick backend */
> > +       void    (*kick_backend)(const struct i915_request *rq,
> > +                               int prio);
> > +
> >         /*
> >          * Call when the priority on a request has changed and it and its
> >          * dependencies may need rescheduling. Note the request itself may
> > --
> > 2.28.0
> >
