Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B2540F7F0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604136EC62;
	Fri, 17 Sep 2021 12:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED976EC64
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 12:37:04 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d6so14875698wrc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 05:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=R3ak1gCf40c0Y/NZW0USsZwtiWPgnrp+n/dtxyTzhjY=;
 b=E9fBihNgvfvjKv/J3ZiC8Xw1tJKIOwujiQGrMp5hAs7MxT9ZKWdmqKgm2MmNZeyo4s
 u2rpkhgm+HQei6xCWARbiAnnIRs2f4KKdbz1fhT1i7+ma7daZCqbW17dFq5cFj9sbZej
 IEz6ySSvtJpqmjMX+szqZAIz7UZwhL3ljKcz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R3ak1gCf40c0Y/NZW0USsZwtiWPgnrp+n/dtxyTzhjY=;
 b=VKtqvwhsatxAXcpgbyLuA70WyYTkfzRPAel9IVvanZcHb97qE8iUAawsx2SMLDIMLS
 6GS6GL286EAey/j8qTyW1p6ssYXmAibkhtwiibeoJYXxwWtAwDg/Feuz5ZJat3ci+uMt
 M0OYJZZEBWP7r+yZLXTKcnBt8KbiiO9vwFp9YfqmJPuU2icyHn7w5qtZfJV3Rsi/IZw0
 3odInRMoiqIpLlf/o7H8/HWt3TBbeFVzqqsAoPZcbsy6ALf4E50C9jhlncHiCrt6Xpby
 AdV4SgCciIzKXozSirr3/cspdgtsrGe6o87w1t2Qj7dZUyT8ZY9eBnBgZ+oQ4xWlO2lN
 J6xA==
X-Gm-Message-State: AOAM530QI++2umVVnEmMiIwq5wf0jEIS3dzUMELmAWPsH+vXffoAhK+Z
 tTrBDNLXOF6DZaU2K78zVY0IbzZd6kJzmw==
X-Google-Smtp-Source: ABdhPJxGat6Aic8+U20N1X2KxauAA5wtr3cRDqmcziVUw1Yw1nYBQjatjFqFW+GTbPedHgQWi9u6gQ==
X-Received: by 2002:a5d:4e47:: with SMTP id r7mr11957118wrt.417.1631882222660; 
 Fri, 17 Sep 2021 05:37:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j20sm6716257wrb.5.2021.09.17.05.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:37:02 -0700 (PDT)
Date: Fri, 17 Sep 2021 14:37:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: John Harrison <john.c.harrison@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniele.ceraolospurio@intel.com
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915/guc: Refcount context during
 error capture
Message-ID: <YUSL7GHasikSkafS@phenom.ffwll.local>
References: <20210914050956.30685-1-matthew.brost@intel.com>
 <20210914050956.30685-5-matthew.brost@intel.com>
 <YUCxwV+A3C8BXQp+@phenom.ffwll.local>
 <03f76ec8-0d10-6078-3dfe-ef72eeaac487@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03f76ec8-0d10-6078-3dfe-ef72eeaac487@intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Tue, Sep 14, 2021 at 04:23:26PM -0700, John Harrison wrote:
> On 9/14/2021 07:29, Daniel Vetter wrote:
> > On Mon, Sep 13, 2021 at 10:09:56PM -0700, Matthew Brost wrote:
> > > From: John Harrison <John.C.Harrison@Intel.com>
> > > 
> > > When i915 receives a context reset notification from GuC, it triggers
> > > an error capture before resetting any outstanding requsts of that
> > > context. Unfortunately, the error capture is not a time bound
> > > operation. In certain situations it can take a long time, particularly
> > > when multiple large LMEM buffers must be read back and eoncoded. If
> > > this delay is longer than other timeouts (heartbeat, test recovery,
> > > etc.) then a full GT reset can be triggered in the middle.
> > > 
> > > That can result in the context being reset by GuC actually being
> > > destroyed before the error capture completes and the GuC submission
> > > code resumes. Thus, the GuC side can start dereferencing stale
> > > pointers and Bad Things ensue.
> > > 
> > > So add a refcount get of the context during the entire reset
> > > operation. That way, the context can't be destroyed part way through
> > > no matter what other resets or user interactions occur.
> > > 
> > > v2:
> > >   (Matthew Brost)
> > >    - Update patch to work with async error capture
> > > 
> > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > This sounds like a fundamental issue in our reset/scheduler design. If we
> > have multiple timeout-things working in parallel, then there's going to be
> > an endless whack-a-mole fireworks show.
> > 
> > Reset is not a perf critical path (aside from media timeout, which guc
> > handles internally anyway). Simplicity trumps everything else. The fix
> > here is to guarantee that anything related to reset cannot happen in
> > parallel with anything else related to reset/timeout. At least on a
> > per-engine (and really on a per-reset domain) basis.
> > 
> > The fix we've developed for drm/sched is that the driver can allocate a
> > single-thread work queue, pass it to each drm/sched instance, and all
> > timeout handling is run in there.
> > 
> > For i915 it's more of a mess since we have a ton of random things that
> > time out/reset potentially going on in parallel. But that's the design we
> > should head towards.
> > 
> > _not_ sprinkling random refcounts all over the place until most of the
> > oops/splats disappear. That's cargo-culting, not engineering.
> > -Daniel
> Not sure I follow this.
> 
> The code pulls an intel_context object out of a structure and proceeds to
> dereference it in what can be a slow piece of code that is running in a
> worker thread and is therefore already asynchronous to other activity.
> Acquiring a reference count on that object while holding its pointer is
> standard practice, I thought. That's the whole point of reference counting!
> 
> To be clear, this is not adding a brand new reference count object. It is
> merely taking the correct lock on an object while accessing that object.
> 
> It uses the xarray's lock while accessing the xarray and then the ce's lock
> while accessing the ce and makes sure to overlap the two to prevent any race
> conditions. To me, that seems like a) correct object access practice and b)
> it should have been there in the first place.

Sure we do reference count. And we reference count intel_context. But we
shouldn't just use a reference count because it's there and looks
convenient.

This is reset code. If the intel_context can go away while we process the
reset affecting it, there's a giantic bug going on. Doing locally a bit
more reference counting just makes the race small enough to not hit it
anymore easily. It doesn't fix a bug anywhere, or if it does, then the
locking looks really, really fragile.

The proper fix here is breaking this back to data structures, figuring out
what exactly the invariants are (e.g. it shouldn't be possible to try
processing an intel_context when it's not longer in need of processing).
And then figuring out the locking scheme you need.

For the intel_context refcount we currently (if I got them all):
- gem_context -> intel_context refcount
- some temp reference during execbuf
- i915_request->context so that we don't tear down the context while it's
  still running stuff

The latter should be enough to also make sure the context doesn't
disappear while guc code is processing it. If that's not enough, then we
need to analyze this, figure out why/where, and rework this rules around
locking/refcounting so that things are clean, simple, understandable and
actually get the job done.

This patch otoh looks a lot like "if we whack this refcount the oops goes
away, therefore it must be the right fix". And that's not how locking
works, at least not maintainable locking.

Cheers, Daniel

> 
> John.
> 
> 
> > 
> > > ---
> > >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 24 +++++++++++++++++--
> > >   1 file changed, 22 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > index 1986a57b52cc..02917fc4d4a8 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > @@ -2888,6 +2888,8 @@ static void capture_worker_func(struct work_struct *w)
> > >   	intel_engine_set_hung_context(engine, ce);
> > >   	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
> > >   		i915_capture_error_state(gt, ce->engine->mask);
> > > +
> > > +	intel_context_put(ce);
> > >   }
> > >   static void capture_error_state(struct intel_guc *guc,
> > > @@ -2924,7 +2926,7 @@ static void guc_context_replay(struct intel_context *ce)
> > >   	tasklet_hi_schedule(&sched_engine->tasklet);
> > >   }
> > > -static void guc_handle_context_reset(struct intel_guc *guc,
> > > +static bool guc_handle_context_reset(struct intel_guc *guc,
> > >   				     struct intel_context *ce)
> > >   {
> > >   	trace_intel_context_reset(ce);
> > > @@ -2937,7 +2939,11 @@ static void guc_handle_context_reset(struct intel_guc *guc,
> > >   		   !context_blocked(ce))) {
> > >   		capture_error_state(guc, ce);
> > >   		guc_context_replay(ce);
> > > +
> > > +		return false;
> > >   	}
> > > +
> > > +	return true;
> > >   }
> > >   int intel_guc_context_reset_process_msg(struct intel_guc *guc,
> > > @@ -2945,6 +2951,7 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
> > >   {
> > >   	struct intel_context *ce;
> > >   	int desc_idx;
> > > +	unsigned long flags;
> > >   	if (unlikely(len != 1)) {
> > >   		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
> > > @@ -2952,11 +2959,24 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
> > >   	}
> > >   	desc_idx = msg[0];
> > > +
> > > +	/*
> > > +	 * The context lookup uses the xarray but lookups only require an RCU lock
> > > +	 * not the full spinlock. So take the lock explicitly and keep it until the
> > > +	 * context has been reference count locked to ensure it can't be destroyed
> > > +	 * asynchronously until the reset is done.
> > > +	 */
> > > +	xa_lock_irqsave(&guc->context_lookup, flags);
> > >   	ce = g2h_context_lookup(guc, desc_idx);
> > > +	if (ce)
> > > +		intel_context_get(ce);
> > > +	xa_unlock_irqrestore(&guc->context_lookup, flags);
> > > +
> > >   	if (unlikely(!ce))
> > >   		return -EPROTO;
> > > -	guc_handle_context_reset(guc, ce);
> > > +	if (guc_handle_context_reset(guc, ce))
> > > +		intel_context_put(ce);
> > >   	return 0;
> > >   }
> > > -- 
> > > 2.32.0
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
