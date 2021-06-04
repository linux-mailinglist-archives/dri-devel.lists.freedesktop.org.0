Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B3339BFFB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 20:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060FC6F8AB;
	Fri,  4 Jun 2021 18:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34EB6F8AA;
 Fri,  4 Jun 2021 18:56:47 +0000 (UTC)
IronPort-SDR: Fcv9U04v4XE1tGgI94zh7rzqjH2PcWPtbYARZTOJ4dH4rW5bTNJpBEbVfvbab6oc6LqtwAIN1Q
 C0mMnf1n2UVA==
X-IronPort-AV: E=McAfee;i="6200,9189,10005"; a="201330856"
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="201330856"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 11:56:45 -0700
IronPort-SDR: +EGp2nhZHwFr1FvKw/JdvxBDKW0aLEBNKltmzsYc3Rigiz79U4sQoem8ATHNlGKUWaISWfj3/T
 0LBR3BPy1NHg==
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="551249362"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 11:56:45 -0700
Date: Fri, 4 Jun 2021 11:49:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 3/9] drm/i915: Add
 i915_sched_engine_reset_on_empty function
Message-ID: <20210604184946.GA29833@sdutt-i7>
References: <20210603212722.59719-1-matthew.brost@intel.com>
 <20210603212722.59719-4-matthew.brost@intel.com>
 <CAOFGe95CkXy03G5oDEHBLHB2XNbLc2K_Uxx-rdW=Cg9RsKrYWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOFGe95CkXy03G5oDEHBLHB2XNbLc2K_Uxx-rdW=Cg9RsKrYWA@mail.gmail.com>
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

On Fri, Jun 04, 2021 at 01:31:42PM -0500, Jason Ekstrand wrote:
> On Thu, Jun 3, 2021 at 4:09 PM Matthew Brost <matthew.brost@intel.com> wrote:
> >
> > Rather than touching schedule state in the generic PM code, reset the
> > priolist allocation when empty in the submission code. Add a wrapper
> > function to do this and update the backends to call it in the correct
> > place.
> 
> Seems reasonable, I think.  I'm by no means an expert but
> 
> Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
> 
> anyway.  My one suggestion would be to tweak the commit message to
> talk about the functional change rather than the helper.  Something
> like
> 
> drm/i915: Reset sched_engine.no_priolist immediately after dequeue
> 
> Typically patches which say "add a helper function" don't come with a
> non-trivial functional change.
> 

Agree.

Thanks - Matt

> --Jason
> 
> 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_engine_pm.c            | 2 --
> >  drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 1 +
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c    | 2 ++
> >  drivers/gpu/drm/i915/i915_scheduler.h                | 7 +++++++
> >  4 files changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> > index b6a00dd72808..1f07ac4e0672 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> > @@ -280,8 +280,6 @@ static int __engine_park(struct intel_wakeref *wf)
> >         if (engine->park)
> >                 engine->park(engine);
> >
> > -       engine->sched_engine->no_priolist = false;
> > -
> >         /* While gt calls i915_vma_parked(), we have to break the lock cycle */
> >         intel_gt_pm_put_async(engine->gt);
> >         return 0;
> > diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > index 2326a73af6d3..609753b5401a 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > @@ -1553,6 +1553,7 @@ static void execlists_dequeue(struct intel_engine_cs *engine)
> >          * interrupt for secondary ports).
> >          */
> >         sched_engine->queue_priority_hint = queue_prio(sched_engine);
> > +       i915_sched_engine_reset_on_empty(sched_engine);
> >         spin_unlock(&engine->active.lock);
> >
> >         /*
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 5d00f2e3c1de..f4a6fbfaf82e 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -263,6 +263,8 @@ static void guc_submission_tasklet(struct tasklet_struct *t)
> >
> >         __guc_dequeue(engine);
> >
> > +       i915_sched_engine_reset_on_empty(engine->sched_engine);
> > +
> >         spin_unlock_irqrestore(&engine->active.lock, flags);
> >  }
> >
> > diff --git a/drivers/gpu/drm/i915/i915_scheduler.h b/drivers/gpu/drm/i915/i915_scheduler.h
> > index 5bec7b3b8456..713c38c99de9 100644
> > --- a/drivers/gpu/drm/i915/i915_scheduler.h
> > +++ b/drivers/gpu/drm/i915/i915_scheduler.h
> > @@ -72,6 +72,13 @@ i915_sched_engine_is_empty(struct i915_sched_engine *sched_engine)
> >         return RB_EMPTY_ROOT(&sched_engine->queue.rb_root);
> >  }
> >
> > +static inline void
> > +i915_sched_engine_reset_on_empty(struct i915_sched_engine *sched_engine)
> > +{
> > +       if (i915_sched_engine_is_empty(sched_engine))
> > +               sched_engine->no_priolist = false;
> > +}
> > +
> >  void i915_request_show_with_schedule(struct drm_printer *m,
> >                                      const struct i915_request *rq,
> >                                      const char *prefix,
> > --
> > 2.28.0
> >
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
