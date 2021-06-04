Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3830B39C060
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 21:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBEA6F8C8;
	Fri,  4 Jun 2021 19:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 841406F8C8;
 Fri,  4 Jun 2021 19:21:52 +0000 (UTC)
IronPort-SDR: hvswLfiuobVtOVy3L4JjNXQVlT5z2NHUc+ki71QugTyQNMSkj2IBZgpFtHALbXvoM0U/Pi1JlO
 36JLK+xbsinA==
X-IronPort-AV: E=McAfee;i="6200,9189,10005"; a="184724351"
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="184724351"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 12:21:52 -0700
IronPort-SDR: 16QQ8wudH96jK4ZwwCtg8GyfBOPwoSbVP/1yEi2RMhaaL5ZodLXW/IL1QsL/bW+Zh1AhmI3apP
 4xD8ec//KhWg==
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="636657865"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 12:21:51 -0700
Date: Fri, 4 Jun 2021 12:14:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 7/9] drm/i915: Update i915_scheduler to
 operate on i915_sched_engine
Message-ID: <20210604191453.GB30465@sdutt-i7>
References: <20210603212722.59719-1-matthew.brost@intel.com>
 <20210603212722.59719-8-matthew.brost@intel.com>
 <CAOFGe966f+M+RECs-v-eVa9PWqCJcY0H2O-3d8hB3_Y0e47LdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOFGe966f+M+RECs-v-eVa9PWqCJcY0H2O-3d8hB3_Y0e47LdQ@mail.gmail.com>
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 04, 2021 at 02:17:58PM -0500, Jason Ekstrand wrote:
> On Thu, Jun 3, 2021 at 4:09 PM Matthew Brost <matthew.brost@intel.com> wrote:
> >
> > Rather passing around an intel_engine_cs in the scheduling code, pass
> > around a i915_sched_engine.
> 
> 👍
> 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  .../drm/i915/gt/intel_execlists_submission.c  | 11 +++--
> >  .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  2 +-
> >  drivers/gpu/drm/i915/i915_scheduler.c         | 46 +++++++++----------
> >  drivers/gpu/drm/i915/i915_scheduler.h         |  2 +-
> >  4 files changed, 32 insertions(+), 29 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > index 3fac17103837..7240c153be35 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > @@ -382,7 +382,8 @@ __unwind_incomplete_requests(struct intel_engine_cs *engine)
> >                 GEM_BUG_ON(rq_prio(rq) == I915_PRIORITY_INVALID);
> >                 if (rq_prio(rq) != prio) {
> >                         prio = rq_prio(rq);
> > -                       pl = i915_sched_lookup_priolist(engine, prio);
> > +                       pl = i915_sched_lookup_priolist(engine->sched_engine,
> > +                                                       prio);
> >                 }
> >                 GEM_BUG_ON(i915_sched_engine_is_empty(engine->sched_engine));
> >
> > @@ -1096,7 +1097,8 @@ static void defer_active(struct intel_engine_cs *engine)
> >         if (!rq)
> >                 return;
> >
> > -       defer_request(rq, i915_sched_lookup_priolist(engine, rq_prio(rq)));
> > +       defer_request(rq, i915_sched_lookup_priolist(engine->sched_engine,
> > +                                                    rq_prio(rq)));
> >  }
> >
> >  static bool
> > @@ -2083,7 +2085,7 @@ static void __execlists_unhold(struct i915_request *rq)
> >
> >                 i915_request_clear_hold(rq);
> >                 list_move_tail(&rq->sched.link,
> > -                              i915_sched_lookup_priolist(rq->engine,
> > +                              i915_sched_lookup_priolist(rq->engine->sched_engine,
> >                                                           rq_prio(rq)));
> >                 set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
> >
> > @@ -2452,7 +2454,8 @@ static void queue_request(struct intel_engine_cs *engine,
> >  {
> >         GEM_BUG_ON(!list_empty(&rq->sched.link));
> >         list_add_tail(&rq->sched.link,
> > -                     i915_sched_lookup_priolist(engine, rq_prio(rq)));
> > +                     i915_sched_lookup_priolist(engine->sched_engine,
> > +                                                rq_prio(rq)));
> >         set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
> >  }
> >
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 4c5bbec0775d..7ed21670ef14 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -529,7 +529,7 @@ static inline void queue_request(struct intel_engine_cs *engine,
> >  {
> >         GEM_BUG_ON(!list_empty(&rq->sched.link));
> >         list_add_tail(&rq->sched.link,
> > -                     i915_sched_lookup_priolist(engine, prio));
> > +                     i915_sched_lookup_priolist(engine->sched_engine, prio));
> >         set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
> >  }
> >
> > diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
> > index 035b88f2e4aa..3d36e4447b5d 100644
> > --- a/drivers/gpu/drm/i915/i915_scheduler.c
> > +++ b/drivers/gpu/drm/i915/i915_scheduler.c
> > @@ -61,14 +61,13 @@ static void assert_priolists(struct i915_sched_engine * const sched_engine)
> >  }
> >
> >  struct list_head *
> > -i915_sched_lookup_priolist(struct intel_engine_cs *engine, int prio)
> > +i915_sched_lookup_priolist(struct i915_sched_engine *sched_engine, int prio)
> >  {
> > -       struct i915_sched_engine * const sched_engine = engine->sched_engine;
> >         struct i915_priolist *p;
> >         struct rb_node **parent, *rb;
> >         bool first = true;
> >
> > -       lockdep_assert_held(&engine->sched_engine->lock);
> > +       lockdep_assert_held(&sched_engine->lock);
> >         assert_priolists(sched_engine);
> >
> >         if (unlikely(sched_engine->no_priolist))
> > @@ -130,13 +129,13 @@ struct sched_cache {
> >         struct list_head *priolist;
> >  };
> >
> > -static struct intel_engine_cs *
> > -sched_lock_engine(const struct i915_sched_node *node,
> > -                 struct intel_engine_cs *locked,
> > +static struct i915_sched_engine *
> > +lock_sched_engine(struct i915_sched_node *node,
> > +                 struct i915_sched_engine *locked,
> >                   struct sched_cache *cache)
> >  {
> >         const struct i915_request *rq = node_to_request(node);
> > -       struct intel_engine_cs *engine;
> > +       struct i915_sched_engine *sched_engine;
> >
> >         GEM_BUG_ON(!locked);
> >
> > @@ -146,14 +145,14 @@ sched_lock_engine(const struct i915_sched_node *node,
> >          * engine lock. The simple ploy we use is to take the lock then
> >          * check that the rq still belongs to the newly locked engine.
> >          */
> > -       while (locked != (engine = READ_ONCE(rq->engine))) {
> > -               spin_unlock(&locked->sched_engine->lock);
> > +       while (locked != (sched_engine = rq->engine->sched_engine)) {
> 
> You lost the READ_ONCE here.  Based on the comment above, that may
> matter.  I guess it depends on what all barriers spin_lock() implies.
> 

Ah, good catch. I think it should be:

READ_ONCE(rq->engine)->sched_engine

As the rq->engine is the unstable pointer.

Matt

> Assuming that's all good,
> 
> Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
> 
> > +               spin_unlock(&locked->lock);
> >                 memset(cache, 0, sizeof(*cache));
> > -               spin_lock(&engine->sched_engine->lock);
> > -               locked = engine;
> > +               spin_lock(&sched_engine->lock);
> > +               locked = sched_engine;
> >         }
> >
> > -       GEM_BUG_ON(locked != engine);
> > +       GEM_BUG_ON(locked != sched_engine);
> >         return locked;
> >  }
> >
> > @@ -161,7 +160,7 @@ static void __i915_schedule(struct i915_sched_node *node,
> >                             const struct i915_sched_attr *attr)
> >  {
> >         const int prio = max(attr->priority, node->attr.priority);
> > -       struct intel_engine_cs *engine;
> > +       struct i915_sched_engine *sched_engine;
> >         struct i915_dependency *dep, *p;
> >         struct i915_dependency stack;
> >         struct sched_cache cache;
> > @@ -236,23 +235,24 @@ static void __i915_schedule(struct i915_sched_node *node,
> >         }
> >
> >         memset(&cache, 0, sizeof(cache));
> > -       engine = node_to_request(node)->engine;
> > -       spin_lock(&engine->sched_engine->lock);
> > +       sched_engine = node_to_request(node)->engine->sched_engine;
> > +       spin_lock(&sched_engine->lock);
> >
> >         /* Fifo and depth-first replacement ensure our deps execute before us */
> > -       engine = sched_lock_engine(node, engine, &cache);
> > +       sched_engine = lock_sched_engine(node, sched_engine, &cache);
> >         list_for_each_entry_safe_reverse(dep, p, &dfs, dfs_link) {
> >                 INIT_LIST_HEAD(&dep->dfs_link);
> >
> >                 node = dep->signaler;
> > -               engine = sched_lock_engine(node, engine, &cache);
> > -               lockdep_assert_held(&engine->sched_engine->lock);
> > +               sched_engine = lock_sched_engine(node, sched_engine, &cache);
> > +               lockdep_assert_held(&sched_engine->lock);
> >
> >                 /* Recheck after acquiring the engine->timeline.lock */
> >                 if (prio <= node->attr.priority || node_signaled(node))
> >                         continue;
> >
> > -               GEM_BUG_ON(node_to_request(node)->engine != engine);
> > +               GEM_BUG_ON(node_to_request(node)->engine->sched_engine !=
> > +                          sched_engine);
> >
> >                 WRITE_ONCE(node->attr.priority, prio);
> >
> > @@ -270,17 +270,17 @@ static void __i915_schedule(struct i915_sched_node *node,
> >                 if (i915_request_in_priority_queue(node_to_request(node))) {
> >                         if (!cache.priolist)
> >                                 cache.priolist =
> > -                                       i915_sched_lookup_priolist(engine,
> > +                                       i915_sched_lookup_priolist(sched_engine,
> >                                                                    prio);
> >                         list_move_tail(&node->link, cache.priolist);
> >                 }
> >
> >                 /* Defer (tasklet) submission until after all of our updates. */
> > -               if (engine->sched_engine->kick_backend)
> > -                       engine->sched_engine->kick_backend(node_to_request(node), prio);
> > +               if (sched_engine->kick_backend)
> > +                       sched_engine->kick_backend(node_to_request(node), prio);
> >         }
> >
> > -       spin_unlock(&engine->sched_engine->lock);
> > +       spin_unlock(&sched_engine->lock);
> >  }
> >
> >  void i915_schedule(struct i915_request *rq, const struct i915_sched_attr *attr)
> > diff --git a/drivers/gpu/drm/i915/i915_scheduler.h b/drivers/gpu/drm/i915/i915_scheduler.h
> > index 713c38c99de9..0014745bda30 100644
> > --- a/drivers/gpu/drm/i915/i915_scheduler.h
> > +++ b/drivers/gpu/drm/i915/i915_scheduler.h
> > @@ -39,7 +39,7 @@ void i915_schedule(struct i915_request *request,
> >                    const struct i915_sched_attr *attr);
> >
> >  struct list_head *
> > -i915_sched_lookup_priolist(struct intel_engine_cs *engine, int prio);
> > +i915_sched_lookup_priolist(struct i915_sched_engine *sched_engine, int prio);
> >
> >  void __i915_priolist_free(struct i915_priolist *p);
> >  static inline void i915_priolist_free(struct i915_priolist *p)
> > --
> > 2.28.0
> >
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
