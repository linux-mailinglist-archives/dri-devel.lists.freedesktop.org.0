Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBA436FC7F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 16:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC14B6F53D;
	Fri, 30 Apr 2021 14:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DDE96F53D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 14:34:20 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id i11so8202038oig.8
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 07:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N6Q3c3jpy2+E1gNQo8BFVyq88Mx6CmSrRneFTgKfSZE=;
 b=bcNk4ZnZQvzQTQ74/VW3KZD/nV7xpCySyNY8HVJm5BaybUeqevXczfonX44HwDVvEr
 TWykTwEkDejrRMOxgsx3kTbgfsGHXpkqi1bGySPpk2Wv8yRQ1PTZrPNIAkbVwI62fsvh
 kjZTGRJYUMlm20nc2/UmlfFBgFz3A/7tHll9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N6Q3c3jpy2+E1gNQo8BFVyq88Mx6CmSrRneFTgKfSZE=;
 b=Swt6KwgTI6JiqOVi6cbJbo/2Kzds8U4ncNQdGJ2iG8+1CbEM52/mA1t++P8tTx7qYC
 DlUK/MW/xFPunDolhCNOiObs3ed8uGWIkpbjvUF0WilH8Pm+ys/sCOrc1slHumwipmtq
 WeMfe7v0XhbrZs3tdk+0oa7llXTz0yeUr0AxQgRJCXhuLcfXXI9Y0qF2JJKCIcD+bWw8
 XztmXbTaNYSJL+1qBkKh/9Op61Eyu6U0lVXYa2Hncm1yOLYDXb9wl+hrtbYwDH4Iolyz
 CmyFybfUdNghldJnhNVjDA4LfL51ksbocKFzehJG1ppJEAaJ1RMuudGWgI4oIoZZ0i2e
 3AAg==
X-Gm-Message-State: AOAM532v7zijdj0+34rFLyd9vw/ePRwA9jCZOp72u44lrRPukMXkeTg1
 Zg9YVeOT0jEVg+gZHMYtLiJhmeMKnk9HF8fMH8URVw==
X-Google-Smtp-Source: ABdhPJxdRbv2S9gVHAk6jsjFspMYRN8/v+Ke34tMoW25+kFAIMglrVipabYx6Mc3rQ4cW0bLXSzD2hascXbI2dfuLbY=
X-Received: by 2002:a05:6808:699:: with SMTP id
 k25mr11022541oig.101.1619793259993; 
 Fri, 30 Apr 2021 07:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210429094640.859825-1-tvrtko.ursulin@linux.intel.com>
 <YIvuhBHBmUesp0G1@phenom.ffwll.local>
 <e09d56de-ac10-f2ac-1c15-35e42b8f129d@linux.intel.com>
In-Reply-To: <e09d56de-ac10-f2ac-1c15-35e42b8f129d@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 30 Apr 2021 16:34:09 +0200
Message-ID: <CAKMK7uEGgyTq=8Hr4gdPOXb3rqaESJ2Ka8epVcHEaGd2GJYRmg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Be more gentle with exiting
 non-persistent context
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: intel-gfx <Intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 dri-devel <dri-devel@lists.freedesktop.org>, Zhen Han <zhen.han@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 30, 2021 at 3:27 PM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
> On 30/04/2021 12:48, Daniel Vetter wrote:
> > On Thu, Apr 29, 2021 at 10:46:40AM +0100, Tvrtko Ursulin wrote:
> >> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>
> >> When a non-persistent context exits we currently mark it as banned in
> >> order to trigger fast termination of any outstanding GPU jobs it may have
> >> left running.
> >>
> >> In doing so we apply a very strict 1ms limit in which the left over job
> >> has to preempt before we issues an engine resets.
> >>
> >> Some workloads are not able to cleanly preempt in that time window and it
> >> can be argued that it would instead be better to give them a bit more
> >> grace since avoiding engine resets is generally preferrable.
> >
> > Can you pls explain here why this is preferrable?
>
> I think there's always the risk of an innocent request getting axed with
> preempt to busy being very asynchronous and also engine reset can
> sometimes fail as well.
>
> >> To achieve this the patch splits handling of banned contexts from simply
> >> exited non-persistent ones and then applies different timeouts for both
> >> and also extends the criteria which determines if a request should be
> >> scheduled back in after preemption or not.
> >>
> >> 15ms preempt timeout grace is given to exited non-persistent contexts
> >> which have been empirically tested to satisfy customers requirements
> >> and still provides reasonably quick cleanup post exit.
> >
> > Same here, a bit more detail on what exactly was the problem to be fixed
> > is needed.
>
> It is a bit multi-faceted. Start with how in some cultures errors
> messages are much bigger error flags than in others and much more
> difficult to hand-wave "oh that's not a problem really". The the
> previous considerations about why not avoid engine reset if we can. Add
> on top how non-persistent context exiting is not really an error worthy
> of a reset, *if* it exits cleanly reasonably quickly.
>
> You could say make it clean up for itself before it exits, not a kernel
> problem. But on the balance of everything, to me it sounds saleable to
> just give it some longer time compared to banned contexts, which are the
> unquestionably naughty/dangerous ones. Also, how fast non-persistent
> contexts will be cleaned up hasn't been defined really. As long as 15ms
> is an order of magnitude, plus some, shorter than the normal preempt
> timeout I think it is fine.

Yeah I think makes all sense, I just asked since the commit message
hinted at reasons but didn't explain any of them. I also assume that
generally the full reset flow is also on the order of 1ms (haven't
checked, but it's not cheap), so not being aggressive with engaging
that hammer is imo itself a very good reason to be a notch more lax
here.
-Danie

>
> Regards,
>
> Tvrtko
>
> P.S. Otherwise I plan to respin v2 with consolidated CONTEXT_SCHEDULABLE
> flag so fast paths do not have to do too many individual checks.
>
> > -Daniel
> >
> >>
> >> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> >> Cc: Zhen Han <zhen.han@intel.com>
> >> ---
> >>   drivers/gpu/drm/i915/gem/i915_gem_context.c     | 15 +++++++++------
> >>   drivers/gpu/drm/i915/gt/intel_context.h         | 17 +++++++++++++++++
> >>   drivers/gpu/drm/i915/gt/intel_context_types.h   |  1 +
> >>   .../drm/i915/gt/intel_execlists_submission.c    | 12 ++++++++++--
> >>   drivers/gpu/drm/i915/i915_request.c             |  2 +-
> >>   5 files changed, 38 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> >> index fd8ee52e17a4..5a6eba1232cd 100644
> >> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> >> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> >> @@ -426,7 +426,8 @@ static struct intel_engine_cs *active_engine(struct intel_context *ce)
> >>      return engine;
> >>   }
> >>
> >> -static void kill_engines(struct i915_gem_engines *engines, bool ban)
> >> +static void
> >> +kill_engines(struct i915_gem_engines *engines, bool ban, bool persistent)
> >>   {
> >>      struct i915_gem_engines_iter it;
> >>      struct intel_context *ce;
> >> @@ -443,6 +444,8 @@ static void kill_engines(struct i915_gem_engines *engines, bool ban)
> >>
> >>              if (ban && intel_context_set_banned(ce))
> >>                      continue;
> >> +            else if (!persistent && intel_context_set_non_persistent(ce))
> >> +                    continue;
> >>
> >>              /*
> >>               * Check the current active state of this context; if we
> >> @@ -454,7 +457,7 @@ static void kill_engines(struct i915_gem_engines *engines, bool ban)
> >>              engine = active_engine(ce);
> >>
> >>              /* First attempt to gracefully cancel the context */
> >> -            if (engine && !__cancel_engine(engine) && ban)
> >> +            if (engine && !__cancel_engine(engine) && (ban || !persistent))
> >>                      /*
> >>                       * If we are unable to send a preemptive pulse to bump
> >>                       * the context from the GPU, we have to resort to a full
> >> @@ -466,8 +469,6 @@ static void kill_engines(struct i915_gem_engines *engines, bool ban)
> >>
> >>   static void kill_context(struct i915_gem_context *ctx)
> >>   {
> >> -    bool ban = (!i915_gem_context_is_persistent(ctx) ||
> >> -                !ctx->i915->params.enable_hangcheck);
> >>      struct i915_gem_engines *pos, *next;
> >>
> >>      spin_lock_irq(&ctx->stale.lock);
> >> @@ -480,7 +481,8 @@ static void kill_context(struct i915_gem_context *ctx)
> >>
> >>              spin_unlock_irq(&ctx->stale.lock);
> >>
> >> -            kill_engines(pos, ban);
> >> +            kill_engines(pos, !ctx->i915->params.enable_hangcheck,
> >> +                         i915_gem_context_is_persistent(ctx));
> >>
> >>              spin_lock_irq(&ctx->stale.lock);
> >>              GEM_BUG_ON(i915_sw_fence_signaled(&pos->fence));
> >> @@ -526,7 +528,8 @@ static void engines_idle_release(struct i915_gem_context *ctx,
> >>
> >>   kill:
> >>      if (list_empty(&engines->link)) /* raced, already closed */
> >> -            kill_engines(engines, true);
> >> +            kill_engines(engines, true,
> >> +                         i915_gem_context_is_persistent(ctx));
> >>
> >>      i915_sw_fence_commit(&engines->fence);
> >>   }
> >> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> >> index f83a73a2b39f..b0e812b8ce39 100644
> >> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> >> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> >> @@ -220,6 +220,23 @@ static inline bool intel_context_set_banned(struct intel_context *ce)
> >>      return test_and_set_bit(CONTEXT_BANNED, &ce->flags);
> >>   }
> >>
> >> +static inline bool intel_context_is_non_persistent(const struct intel_context *ce)
> >> +{
> >> +    return test_bit(CONTEXT_NON_PERSISTENT, &ce->flags);
> >> +}
> >> +
> >> +static inline bool intel_context_set_non_persistent(struct intel_context *ce)
> >> +{
> >> +    return test_and_set_bit(CONTEXT_NON_PERSISTENT, &ce->flags);
> >> +}
> >> +
> >> +static inline bool intel_context_is_schedulable(const struct intel_context *ce)
> >> +{
> >> +    return !intel_context_is_banned(ce) &&
> >> +           !(intel_context_is_closed(ce) &&
> >> +             intel_context_is_non_persistent(ce));
> >> +}
> >> +
> >>   static inline bool
> >>   intel_context_force_single_submission(const struct intel_context *ce)
> >>   {
> >> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> >> index ed8c447a7346..aa949c539e93 100644
> >> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> >> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> >> @@ -95,6 +95,7 @@ struct intel_context {
> >>   #define CONTEXT_BANNED                     6
> >>   #define CONTEXT_FORCE_SINGLE_SUBMISSION    7
> >>   #define CONTEXT_NOPREEMPT          8
> >> +#define CONTEXT_NON_PERSISTENT              9 /* Only if also closed. */
> >>
> >>      struct {
> >>              u64 timeout_us;
> >> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> >> index de124870af44..5ad7272fbbc4 100644
> >> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> >> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> >> @@ -478,7 +478,7 @@ __execlists_schedule_in(struct i915_request *rq)
> >>                   !intel_engine_has_heartbeat(engine)))
> >>              intel_context_set_banned(ce);
> >>
> >> -    if (unlikely(intel_context_is_banned(ce) || bad_request(rq)))
> >> +    if (unlikely(!intel_context_is_schedulable(ce) || bad_request(rq)))
> >>              reset_active(rq, engine);
> >>
> >>      if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
> >> @@ -1204,12 +1204,20 @@ static void record_preemption(struct intel_engine_execlists *execlists)
> >>   static unsigned long active_preempt_timeout(struct intel_engine_cs *engine,
> >>                                          const struct i915_request *rq)
> >>   {
> >> +    struct intel_context *ce;
> >> +
> >>      if (!rq)
> >>              return 0;
> >>
> >> +    ce = rq->context;
> >> +
> >>      /* Force a fast reset for terminated contexts (ignoring sysfs!) */
> >> -    if (unlikely(intel_context_is_banned(rq->context) || bad_request(rq)))
> >> +    if (unlikely(intel_context_is_banned(ce) || bad_request(rq)))
> >>              return 1;
> >> +    /* Longer grace for closed non-persistent contexts to avoid resets. */
> >> +    else if (unlikely(intel_context_is_closed(ce) &&
> >> +                      intel_context_is_non_persistent(ce)))
> >> +            return 15;
> >>
> >>      return READ_ONCE(engine->props.preempt_timeout_ms);
> >>   }
> >> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> >> index bec9c3652188..bbac87535923 100644
> >> --- a/drivers/gpu/drm/i915/i915_request.c
> >> +++ b/drivers/gpu/drm/i915/i915_request.c
> >> @@ -660,7 +660,7 @@ bool __i915_request_submit(struct i915_request *request)
> >>              goto active;
> >>      }
> >>
> >> -    if (unlikely(intel_context_is_banned(request->context)))
> >> +    if (unlikely(!intel_context_is_schedulable(request->context)))
> >>              i915_request_set_error_once(request, -EIO);
> >>
> >>      if (unlikely(fatal_error(request->fence.error)))
> >> --
> >> 2.30.2
> >>
> >> _______________________________________________
> >> Intel-gfx mailing list
> >> Intel-gfx@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> >



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
