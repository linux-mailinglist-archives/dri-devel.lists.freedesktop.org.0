Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D453E2FD4
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 21:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E3D66E07B;
	Fri,  6 Aug 2021 19:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513BB6EC25
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 19:47:06 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 z9-20020a9d62c90000b0290462f0ab0800so805662otk.11
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Aug 2021 12:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qMbkmaYIi53EaKTYX/oaTUUreJ9sDJkDzJWTl2L73LY=;
 b=PooACIvY0oGDglUGQroUhWI6axGYNz0dZ1JEEhwYyGoKQcDKbqeqt0UTFPWWdt0Mnw
 NbOgcjusepYe3zVNp4EBtOF4GNkG4XNNIQMXBzPO29I+3vREHO8wGKbOcN3spMzHTSlu
 7lQYyjKPwEsVqiIn52D2b0hEaEd5slESdW33Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qMbkmaYIi53EaKTYX/oaTUUreJ9sDJkDzJWTl2L73LY=;
 b=V2RCwdRQSgeOkC8Cfi0htiQV9Hp3ggHhUJ7uwgyZDKo+1HnyDVa6ikJkDMUkMOBngx
 H9rH6Onu1hjkq4Jz/Uv7SuLqoWncr3AY3Gc3BEJ9nYi4FVVwkPbVKham/r+XUYTVX/ls
 zzxugIxyc29ZZB4QSijyOnqeFh1GCDP5p9D3ZTEWEwvLcPxo7um6s2qTgtgzxprptrIr
 YWsbabmpPXzDD8lwiiHs4AhRD3+aQimRfYuEPpp5xF/NHNejjs/FbcUzzBcATVBpp527
 x28QQ6EzXj5VxqLKX2ZdplPFWbqwkQZ6WvYlo2wp9SjgrLbTdDG87yTYzQMgIGDVAyVl
 YisA==
X-Gm-Message-State: AOAM532BNmeFi+CNY3atY7OlBVk7XhwAcaIbZ3FRNIpFMMG5/3w5orOa
 0TP3TMB8AQnThHFDudLM6cRL/hdU6pGxNSz3Jhz/GA==
X-Google-Smtp-Source: ABdhPJy2JJx2XwDDPCJNz2HP5JcMDn4FH7RM4iIJz3I/4zailitAxXYTzfLcmWDMaoAXrwQHXYnI8Uy5v7sRYtR3a84=
X-Received: by 2002:a05:6830:2802:: with SMTP id
 w2mr8697253otu.303.1628279225341; 
 Fri, 06 Aug 2021 12:47:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210729003400.151864-1-matthew.brost@intel.com>
 <20210729003400.151864-2-matthew.brost@intel.com>
 <eea0bdb7-681b-0acb-0b9c-041fb38a7119@intel.com>
 <1b75f6c6-e458-6bc7-f867-12f1b5b18af0@linux.intel.com>
 <e6e893a7-a0e2-0441-260f-75da3760de0b@intel.com>
 <58cb6331-813a-7007-dac5-65a2f2ad344e@linux.intel.com>
 <b3d7ae68-ce4b-ec2c-c70d-9f81e2ea07d7@intel.com>
In-Reply-To: <b3d7ae68-ce4b-ec2c-c70d-9f81e2ea07d7@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 6 Aug 2021 21:46:54 +0200
Message-ID: <CAKMK7uF_xBt2WTLkyWf0tfwtzpbFEigZLMUqy4tHQXx47fJRBQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915: Check if engine has heartbeat
 when closing a context
To: John Harrison <john.c.harrison@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, 
 intel-gfx <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

Seen this fly by and figured I dropped a few thoughts in here. At the
likely cost of looking a bit out of whack :-)

On Fri, Aug 6, 2021 at 8:01 PM John Harrison <john.c.harrison@intel.com> wrote:
> On 8/2/2021 02:40, Tvrtko Ursulin wrote:
> > On 30/07/2021 19:13, John Harrison wrote:
> >> On 7/30/2021 02:49, Tvrtko Ursulin wrote:
> >>> On 30/07/2021 01:13, John Harrison wrote:
> >>>> On 7/28/2021 17:34, Matthew Brost wrote:
> >>>>> If an engine associated with a context does not have a heartbeat,
> >>>>> ban it
> >>>>> immediately. This is needed for GuC submission as a idle pulse
> >>>>> doesn't
> >>>>> kick the context off the hardware where it then can check for a
> >>>>> heartbeat and ban the context.
> >>>
> >>> Pulse, that is a request with I915_PRIORITY_BARRIER, does not
> >>> preempt a running normal priority context?
> >>>
> >>> Why does it matter then whether or not heartbeats are enabled - when
> >>> heartbeat just ends up sending the same engine pulse (eventually,
> >>> with raising priority)?
> >> The point is that the pulse is pointless. See the rest of my comments
> >> below, specifically "the context will get resubmitted to the hardware
> >> after the pulse completes". To re-iterate...
> >>
> >> Yes, it preempts the context. Yes, it does so whether heartbeats are
> >> enabled or not. But so what? Who cares? You have preempted a context.
> >> It is no longer running on the hardware. BUT IT IS STILL A VALID
> >> CONTEXT.
> >
> > It is valid yes, and it even may be the current ABI so another
> > question is whether it is okay to change that.
> >
> >> The backend scheduler will just resubmit it to the hardware as soon
> >> as the pulse completes. The only reason this works at all is because
> >> of the horrid hack in the execlist scheduler's back end
> >> implementation (in __execlists_schedule_in):
> >>          if (unlikely(intel_context_is_closed(ce) &&
> >>                       !intel_engine_has_heartbeat(engine)))
> >>                  intel_context_set_banned(ce);
> >
> > Right, is the above code then needed with this patch - when ban is
> > immediately applied on the higher level?
> >
> >> The actual back end scheduler is saying "Is this a zombie context? Is
> >> the heartbeat disabled? Then ban it". No other scheduler backend is
> >> going to have knowledge of zombie context status or of the heartbeat
> >> status. Nor are they going to call back into the higher levels of the
> >> i915 driver to trigger a ban operation. Certainly a hardware
> >> implemented scheduler is not going to be looking at private i915
> >> driver information to decide whether to submit a context or whether
> >> to tell the OS to kill it off instead.
> >>
> >> For persistence to work with a hardware scheduler (or a non-Intel
> >> specific scheduler such as the DRM one), the handling of zombie
> >> contexts, banning, etc. *must* be done entirely in the front end. It
> >> cannot rely on any backend hacks. That means you can't rely on any
> >> fancy behaviour of pulses.
> >>
> >> If you want to ban a context then you must explicitly ban that
> >> context. If you want to ban it at some later point then you need to
> >> track it at the top level as a zombie and then explicitly ban that
> >> zombie at whatever later point.
> >
> > I am still trying to understand it all. If I go by the commit message:
> >
> > """
> > This is needed for GuC submission as a idle pulse doesn't
> > kick the context off the hardware where it then can check for a
> > heartbeat and ban the context.
> > """
> >
> > That did not explain things for me. Sentence does not appear to make
> > sense. Now, it seems "kick off the hardware" is meant as revoke and
> > not just preempt. Which is fine, perhaps just needs to be written more
> > explicitly. But the part of checking for heartbeat after idle pulse
> > does not compute for me. It is the heartbeat which emits idle pulses,
> > not idle pulse emitting heartbeats.
> I am in agreement that the commit message is confusing and does not
> explain either the problem or the solution.
>
>
> >
> >
> > But anyway, I can buy the handling at the front end story completely.
> > It makes sense. We just need to agree that a) it is okay to change the
> > ABI and b) remove the backend check from execlists if it is not needed
> > any longer.
> >
> > And if ABI change is okay then commit message needs to talk about it
> > loudly and clearly.
> I don't think we have a choice. The current ABI is not and cannot ever
> be compatible with any scheduler external to i915. It cannot be
> implemented with a hardware scheduler such as the GuC and it cannot be
> implemented with an external software scheduler such as the DRM one.

So generally on linux we implement helper libraries, which means
massive flexibility everywhere.

https://blog.ffwll.ch/2016/12/midlayers-once-more-with-feeling.html

So it shouldn't be an insurmountable problem to make this happen even
with drm/scheduler, we can patch it up.

Whether that's justified is another question.

> My view is that any implementation involving knowledge of the heartbeat
> is fundamentally broken.
>
> According to Daniel Vetter, the DRM ABI on this subject is that an
> actively executing context should persist until the DRM file handle is
> closed. That seems like a much more plausible and simple ABI than one

DRM ABI is maybe a bit an overkill statement. It's more "what other
drivers do", but it's generally a good idea to not ignore that :-)

> that says 'if the heartbeat is running then a context will persist
> forever, if the heartbeat is not running then it will be killed
> immediately, if the heart was running but then stops running then the
> context will be killed on the next context switch, ...'. And if I
> understand it correctly, the current ABI allows a badly written user app
> to cause a denial of service by leaving contexts permanently running an
> infinite loop on the hardware even after the app has been killed! How
> can that ever be considered a good idea?

We're not going to support changing all these settings at runtime.
There's just not point in trying to make that work race-free, it
either adds complexity to the code for no reason, or it adds overhead
to the code for no reason.

Yes I know existing customers and all that, but
- they can change this stuff, and when they change it while anyting is
in-flight they get to keep the pieces. These options taint the kernel
for a reason (and if they don't, that should be fixed)
- quite a few around heartbeat and compute support as we've merged a
while ago hang by design when trying to smash them into drm rules.
We're not going to fix that, and we should not use any existing such
assumptions as justification for code changes.

Wrt infinitely running: Right now nothing is allowed to run forever,
because hangcheck will step in and kill that job. Once we add compute
mode ctx flag we'll require killing on process exit to stop escape.

> Therefore, the context close implementation should be to add an active
> context to a zombie list. If a context is in zombie state and its last
> request completes then the context can be immediately killed at that
> point. Otherwise, on DRM handle close, we go through the zombie list and
> immediately kill all contexts.
>
> Simple, clean, no back-end scheduler hacks, no reliance on heartbeats or
> pulses. Also no opportunity for rogue (or just badly written) user
> processes to leave zombie contexts running on the hardware forever and
> causing a denial of service attack. If the host process is killed, all
> of its GPU processes are also killed irrespective of what dodgy context
> flags they may or may not have set.

Uh, the intel_context state machine is already a bit too complex, and
the implementation lacks a bunch of barriers at least from the cursor
look I've given it thus far.

So if we really need to make that more complex with more states then I
think someone needs to come up with an actual clean design, with
proper state transitions and all the barriers (or really, a design
which doesn't need barriers). This is going to be work.
-Daniel

>
> John.
>
>
> >
> > Or perhaps there is no ABI change? I am not really clear how does
> > setting banned status propagate to the GuC backend. I mean at which
> > point does i915 ends up passing that info to the firmware?
> >
> > Regards,
> >
> > Tvrtko
> >
> >>
> >>
> >>>
> >>>> It's worse than this. If the engine in question is an individual
> >>>> physical engine then sending a pulse (with sufficiently high
> >>>> priority) will pre-empt the engine and kick the context off.
> >>>> However, the GuC
> >>>
> >>> Why it is different for physical vs virtual, aren't both just
> >>> schedulable contexts with different engine masks for what GuC is
> >>> concerned? Oh, is it a matter of needing to send pulses to all
> >>> engines which comprise a virtual one?
> >> It isn't different. It is totally broken for both. It is potentially
> >> more broken for virtual engines because of the question of which
> >> engine to pulse. But as stated above, the pulse is pointless anyway
> >> so the which engine question doesn't even matter.
> >>
> >> John.
> >>
> >>
> >>>
> >>>> scheduler does not have hacks in it to check the state of the
> >>>> heartbeat or whether a context is actually a zombie or not. Thus,
> >>>> the context will get resubmitted to the hardware after the pulse
> >>>> completes and effectively nothing will have happened.
> >>>>
> >>>> I would assume that the DRM scheduler which we are meant to be
> >>>> switching to for execlist as well as GuC submission is also
> >>>> unlikely to have hacks for zombie contexts and tests for whether
> >>>> the i915 specific heartbeat has been disabled since the context
> >>>> became a zombie. So when that switch happens, this test will also
> >>>> fail in execlist mode as well as GuC mode.
> >>>>
> >>>> The choices I see here are to simply remove persistence completely
> >>>> (it is a basically a bug that became UAPI because it wasn't caught
> >>>> soon enough!) or to implement it in a way that does not require
> >>>> hacks in the back end scheduler. Apparently, the DRM scheduler is
> >>>> expected to allow zombie contexts to persist until the DRM file
> >>>> handle is closed. So presumably we will have to go with option two.
> >>>>
> >>>> That means flagging a context as being a zombie when it is closed
> >>>> but still active. The driver would then add it to a zombie list
> >>>> owned by the DRM client object. When that client object is closed,
> >>>> i915 would go through the list and genuinely kill all the contexts.
> >>>> No back end scheduler hacks required and no intimate knowledge of
> >>>> the i915 heartbeat mechanism required either.
> >>>>
> >>>> John.
> >>>>
> >>>>
> >>>>>
> >>>>> This patch also updates intel_engine_has_heartbeat to be a vfunc
> >>>>> as we
> >>>>> now need to call this function on execlists virtual engines too.
> >>>>>
> >>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >>>>> ---
> >>>>>   drivers/gpu/drm/i915/gem/i915_gem_context.c   |  5 +++--
> >>>>>   drivers/gpu/drm/i915/gt/intel_context_types.h |  2 ++
> >>>>>   drivers/gpu/drm/i915/gt/intel_engine.h        | 21
> >>>>> ++-----------------
> >>>>>   .../drm/i915/gt/intel_execlists_submission.c  | 14 +++++++++++++
> >>>>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  6 +++++-
> >>>>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 --
> >>>>>   6 files changed, 26 insertions(+), 24 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> >>>>> b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> >>>>> index 9c3672bac0e2..b8e01c5ba9e5 100644
> >>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> >>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> >>>>> @@ -1090,8 +1090,9 @@ static void kill_engines(struct
> >>>>> i915_gem_engines *engines, bool ban)
> >>>>>        */
> >>>>>       for_each_gem_engine(ce, engines, it) {
> >>>>>           struct intel_engine_cs *engine;
> >>>>> +        bool local_ban = ban ||
> >>>>> !intel_engine_has_heartbeat(ce->engine);
> >>>
> >>> In any case (pending me understanding what's really going on there),
> >>> why would this check not be in kill_context with currently does this:
> >>>
> >>>     bool ban = (!i915_gem_context_is_persistent(ctx) ||
> >>>             !ctx->i915->params.enable_hangcheck);
> >>> ...
> >>>         kill_engines(pos, ban);
> >>>
> >>> So whether to ban decision would be consolidated to one place.
> >>>
> >>> In fact, decision on whether to allow persistent is tied to
> >>> enable_hangcheck, which also drives hearbeat emission. So perhaps
> >>> one part of the correct fix is to extend the above (kill_context)
> >>> ban criteria to include hearbeat values anyway. Otherwise isn't it a
> >>> simple miss that this check fails to account to hearbeat disablement
> >>> via sysfs?
> >>>
> >>> Regards,
> >>>
> >>> Tvrtko
> >>>
> >>>>> -        if (ban && intel_context_ban(ce, NULL))
> >>>>> +        if (local_ban && intel_context_ban(ce, NULL))
> >>>>>               continue;
> >>>>>           /*
> >>>>> @@ -1104,7 +1105,7 @@ static void kill_engines(struct
> >>>>> i915_gem_engines *engines, bool ban)
> >>>>>           engine = active_engine(ce);
> >>>>>           /* First attempt to gracefully cancel the context */
> >>>>> -        if (engine && !__cancel_engine(engine) && ban)
> >>>>> +        if (engine && !__cancel_engine(engine) && local_ban)
> >>>>>               /*
> >>>>>                * If we are unable to send a preemptive pulse to bump
> >>>>>                * the context from the GPU, we have to resort to a
> >>>>> full
> >>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h
> >>>>> b/drivers/gpu/drm/i915/gt/intel_context_types.h
> >>>>> index e54351a170e2..65f2eb2a78e4 100644
> >>>>> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> >>>>> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> >>>>> @@ -55,6 +55,8 @@ struct intel_context_ops {
> >>>>>       void (*reset)(struct intel_context *ce);
> >>>>>       void (*destroy)(struct kref *kref);
> >>>>> +    bool (*has_heartbeat)(const struct intel_engine_cs *engine);
> >>>>> +
> >>>>>       /* virtual engine/context interface */
> >>>>>       struct intel_context *(*create_virtual)(struct
> >>>>> intel_engine_cs **engine,
> >>>>>                           unsigned int count);
> >>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h
> >>>>> b/drivers/gpu/drm/i915/gt/intel_engine.h
> >>>>> index c2a5640ae055..1b11a808acc4 100644
> >>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> >>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> >>>>> @@ -283,28 +283,11 @@ struct intel_context *
> >>>>>   intel_engine_create_virtual(struct intel_engine_cs **siblings,
> >>>>>                   unsigned int count);
> >>>>> -static inline bool
> >>>>> -intel_virtual_engine_has_heartbeat(const struct intel_engine_cs
> >>>>> *engine)
> >>>>> -{
> >>>>> -    /*
> >>>>> -     * For non-GuC submission we expect the back-end to look at the
> >>>>> -     * heartbeat status of the actual physical engine that the work
> >>>>> -     * has been (or is being) scheduled on, so we should only reach
> >>>>> -     * here with GuC submission enabled.
> >>>>> -     */
> >>>>> -    GEM_BUG_ON(!intel_engine_uses_guc(engine));
> >>>>> -
> >>>>> -    return intel_guc_virtual_engine_has_heartbeat(engine);
> >>>>> -}
> >>>>> -
> >>>>>   static inline bool
> >>>>>   intel_engine_has_heartbeat(const struct intel_engine_cs *engine)
> >>>>>   {
> >>>>> -    if (!IS_ACTIVE(CONFIG_DRM_I915_HEARTBEAT_INTERVAL))
> >>>>> -        return false;
> >>>>> -
> >>>>> -    if (intel_engine_is_virtual(engine))
> >>>>> -        return intel_virtual_engine_has_heartbeat(engine);
> >>>>> +    if (engine->cops->has_heartbeat)
> >>>>> +        return engine->cops->has_heartbeat(engine);
> >>>>>       else
> >>>>>           return READ_ONCE(engine->props.heartbeat_interval_ms);
> >>>>>   }
> >>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> >>>>> b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> >>>>> index de5f9c86b9a4..18005b5546b6 100644
> >>>>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> >>>>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> >>>>> @@ -3619,6 +3619,18 @@ virtual_get_sibling(struct intel_engine_cs
> >>>>> *engine, unsigned int sibling)
> >>>>>       return ve->siblings[sibling];
> >>>>>   }
> >>>>> +static bool virtual_engine_has_heartbeat(const struct
> >>>>> intel_engine_cs *ve)
> >>>>> +{
> >>>>> +    struct intel_engine_cs *engine;
> >>>>> +    intel_engine_mask_t tmp, mask = ve->mask;
> >>>>> +
> >>>>> +    for_each_engine_masked(engine, ve->gt, mask, tmp)
> >>>>> +        if (READ_ONCE(engine->props.heartbeat_interval_ms))
> >>>>> +            return true;
> >>>>> +
> >>>>> +    return false;
> >>>>> +}
> >>>>> +
> >>>>>   static const struct intel_context_ops virtual_context_ops = {
> >>>>>       .flags = COPS_HAS_INFLIGHT,
> >>>>> @@ -3634,6 +3646,8 @@ static const struct intel_context_ops
> >>>>> virtual_context_ops = {
> >>>>>       .enter = virtual_context_enter,
> >>>>>       .exit = virtual_context_exit,
> >>>>> +    .has_heartbeat = virtual_engine_has_heartbeat,
> >>>>> +
> >>>>>       .destroy = virtual_context_destroy,
> >>>>>       .get_sibling = virtual_get_sibling,
> >>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> >>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> >>>>> index 89ff0e4b4bc7..ae70bff3605f 100644
> >>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> >>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> >>>>> @@ -2168,6 +2168,8 @@ static int guc_virtual_context_alloc(struct
> >>>>> intel_context *ce)
> >>>>>       return lrc_alloc(ce, engine);
> >>>>>   }
> >>>>> +static bool guc_virtual_engine_has_heartbeat(const struct
> >>>>> intel_engine_cs *ve);
> >>>>> +
> >>>>>   static const struct intel_context_ops virtual_guc_context_ops = {
> >>>>>       .alloc = guc_virtual_context_alloc,
> >>>>> @@ -2183,6 +2185,8 @@ static const struct intel_context_ops
> >>>>> virtual_guc_context_ops = {
> >>>>>       .enter = guc_virtual_context_enter,
> >>>>>       .exit = guc_virtual_context_exit,
> >>>>> +    .has_heartbeat = guc_virtual_engine_has_heartbeat,
> >>>>> +
> >>>>>       .sched_disable = guc_context_sched_disable,
> >>>>>       .destroy = guc_context_destroy,
> >>>>> @@ -3029,7 +3033,7 @@ guc_create_virtual(struct intel_engine_cs
> >>>>> **siblings, unsigned int count)
> >>>>>       return ERR_PTR(err);
> >>>>>   }
> >>>>> -bool intel_guc_virtual_engine_has_heartbeat(const struct
> >>>>> intel_engine_cs *ve)
> >>>>> +static bool guc_virtual_engine_has_heartbeat(const struct
> >>>>> intel_engine_cs *ve)
> >>>>>   {
> >>>>>       struct intel_engine_cs *engine;
> >>>>>       intel_engine_mask_t tmp, mask = ve->mask;
> >>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> >>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> >>>>> index c7ef44fa0c36..c2afc3b88fd8 100644
> >>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> >>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> >>>>> @@ -29,8 +29,6 @@ void intel_guc_dump_active_requests(struct
> >>>>> intel_engine_cs *engine,
> >>>>>                       struct i915_request *hung_rq,
> >>>>>                       struct drm_printer *m);
> >>>>> -bool intel_guc_virtual_engine_has_heartbeat(const struct
> >>>>> intel_engine_cs *ve);
> >>>>> -
> >>>>>   int intel_guc_wait_for_pending_msg(struct intel_guc *guc,
> >>>>>                      atomic_t *wait_var,
> >>>>>                      bool interruptible,
> >>>>
> >>>> _______________________________________________
> >>>> Intel-gfx mailing list
> >>>> Intel-gfx@lists.freedesktop.org
> >>>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> >>
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
