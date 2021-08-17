Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 117403EF0A7
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 19:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB8289D77;
	Tue, 17 Aug 2021 17:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD59B89DAB
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 17:13:37 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id k29so29699908wrd.7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 10:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Sd8qHoBmFER9B5wPP9fcA8hnyh9NE4UUvErYUqs4BNU=;
 b=H53PXfqsp2JAhugch3mCKx7hZ7Yphw34vDLdN7g/XVWjT8maYQim6Vns4CS1NvwV3/
 ZTh4QN/FTAxwlimDtOBG5Mt1A8AgfRH5x5aZKrzmS8Yuv6VnGoM2D/+pTEJ5Ny7dPufW
 3ccIsMqsfTxLhboUcSj3h3aQVrh1uJvg2pCY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Sd8qHoBmFER9B5wPP9fcA8hnyh9NE4UUvErYUqs4BNU=;
 b=kx6qa8d/dTt40Jw9p0QXuqgIGS6nazgcY50BttIA/FHXwkxwbOFmX/tsVIo2ekkat5
 rB4Sarqkh3bk69XlE8MeClowZrhm3dBYAeUHA1urF4DakMqjiiLV+A7kNYX+fIQKUKyj
 ZrhQ6+nrU1zN8vaeOJkLaOagcALtZfPZ5Fuihoin1siFvApZXHHBYvX8leQRmcYm2iG1
 K7ia2055WLL0gR/OyVwbxtWq4BdT79+T2fflVt+S/Uc8lNe4wTKieaXcl5KuR1oUrikt
 88M3U+Enrov9sVVVNz122CMMvwRuzxo/BTpupH5ve9KugNiyip6jDPROoanrtCg1/TeN
 gcgA==
X-Gm-Message-State: AOAM530I6LTteJZf9PSsCbmeDvhmqzV/900LGJD/+jN/mZNLzAaYOFcp
 XSNpwqw5U+OBsoF5BsbrKSEwAQ==
X-Google-Smtp-Source: ABdhPJwskxU6ZSeOOJBQGKxvkRuytq+NnkTdQ+KrG0O+5zZQocUaRVg0rnwYRBZJqgoksvz5b7LzcQ==
X-Received: by 2002:a5d:5646:: with SMTP id j6mr5435046wrw.314.1629220416022; 
 Tue, 17 Aug 2021 10:13:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e6sm2821104wme.6.2021.08.17.10.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 10:13:35 -0700 (PDT)
Date: Tue, 17 Aug 2021 19:13:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch
Subject: Re: [Intel-gfx] [PATCH 19/22] drm/i915/guc: Proper xarray usage for
 contexts_lookup
Message-ID: <YRvuPcQFyglVyuMa@phenom.ffwll.local>
References: <20210816135139.10060-1-matthew.brost@intel.com>
 <20210816135139.10060-20-matthew.brost@intel.com>
 <YRuPEeq2e8qdKBc2@phenom.ffwll.local>
 <20210817152628.GA19215@jons-linux-dev-box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817152628.GA19215@jons-linux-dev-box>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Tue, Aug 17, 2021 at 08:26:28AM -0700, Matthew Brost wrote:
> On Tue, Aug 17, 2021 at 12:27:29PM +0200, Daniel Vetter wrote:
> > On Mon, Aug 16, 2021 at 06:51:36AM -0700, Matthew Brost wrote:
> > > Lock the xarray and take ref to the context if needed.
> > > 
> > > v2:
> > >  (Checkpatch)
> > >   - Add new line after declaration
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 84 ++++++++++++++++---
> > >  1 file changed, 73 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > index ba19b99173fc..2ecb2f002bed 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > @@ -599,8 +599,18 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
> > >  	unsigned long index, flags;
> > >  	bool pending_disable, pending_enable, deregister, destroyed, banned;
> > >  
> > > +	xa_lock_irqsave(&guc->context_lookup, flags);
> > >  	xa_for_each(&guc->context_lookup, index, ce) {
> > > -		spin_lock_irqsave(&ce->guc_state.lock, flags);
> > > +		/*
> > > +		 * Corner case where the ref count on the object is zero but and
> > > +		 * deregister G2H was lost. In this case we don't touch the ref
> > > +		 * count and finish the destroy of the context.
> > > +		 */
> > > +		bool do_put = kref_get_unless_zero(&ce->ref);
> > 
> > This looks really scary, because in another loop below you have an
> > unconditional refcount increase. This means sometimes guc->context_lookup
> 
> Yea, good catch those loops need something like this too.
> 
> > xarray guarantees we hold a full reference on the context, sometimes we
> > don't. So we're right back in "protect the code" O(N^2) review complexity
> > instead of invariant rules about the datastructure, which is linear.
> > 
> > Essentially anytime you feel like you have to add a comment to explain
> > what's going on about concurrent stuff you're racing with, you're
> > protecting code, not data.
> > 
> > Since guc can't do a hole lot without the guc_id registered and all that,
> > I kinda expected you'd always have a full reference here. If there's
> 
> The deregister is triggered by the ref count going to zero and we can't
> fully release the guc_id until that operation completes hence why it is
> still in the xarray. I think the solution here is to use iterator like
> you mention below that ref counts this correctly.

Hm but if the refcount drops to zero while we have a guc_id, how does that
work? Do we delay the guc_context_destroy until that's done, or is the
context handed off internally somehow to a worker?

Afaik intel_context_put is called from all kinds of nasty context, so
waiting is not an option as-is ...
-Daniel

> > intermediate stages (e.g. around unregister) where this is currently not
> > always the case, then those should make sure a full reference is held.
> > 
> > Another option would be to threa ->context_lookup as a weak reference that
> > we lazily clean up when the context is finalized. That works too, but
> > probably not with a spinlock (since you most likely have to wait for all
> > pending guc transations to complete), but it's another option.
> > 
> > Either way I think standard process is needed here for locking design,
> > i.e.
> > 1. come up with the right invariants ("we always have a full reference
> > when a context is ont he guc->context_lookup xarray")
> > 2. come up with the locks. From the guc side the xa_lock is maybe good
> > enough, but from the context side this doesn't protect against a
> > re-registering racing against a deregistering. So probably needs more
> > rules on top, and then you have a nice lock inversion in a few places like
> > here.
> > 3. document it and roll it out.
> > 
> > The other thing is that this is a very tricky iterator, and there's a few
> > copies of it. That is, if this is the right solution. As-is this should be
> > abstracted away into guc_context_iter_begin/next_end() helpers, e.g. like
> > we have for drm_connector_list_iter_begin/end_next as an example.
> >
> 
> I can check this out.
> 
> Matt
>  
> > Cheers, Daniel
> > 
> > > +
> > > +		xa_unlock(&guc->context_lookup);
> > > +
> > > +		spin_lock(&ce->guc_state.lock);
> > >  
> > >  		/*
> > >  		 * Once we are at this point submission_disabled() is guaranteed
> > > @@ -616,7 +626,9 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
> > >  		banned = context_banned(ce);
> > >  		init_sched_state(ce);
> > >  
> > > -		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> > > +		spin_unlock(&ce->guc_state.lock);
> > > +
> > > +		GEM_BUG_ON(!do_put && !destroyed);
> > >  
> > >  		if (pending_enable || destroyed || deregister) {
> > >  			atomic_dec(&guc->outstanding_submission_g2h);
> > > @@ -645,7 +657,12 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
> > >  
> > >  			intel_context_put(ce);
> > >  		}
> > > +
> > > +		if (do_put)
> > > +			intel_context_put(ce);
> > > +		xa_lock(&guc->context_lookup);
> > >  	}
> > > +	xa_unlock_irqrestore(&guc->context_lookup, flags);
> > >  }
> > >  
> > >  static inline bool
> > > @@ -866,16 +883,26 @@ void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
> > >  {
> > >  	struct intel_context *ce;
> > >  	unsigned long index;
> > > +	unsigned long flags;
> > >  
> > >  	if (unlikely(!guc_submission_initialized(guc))) {
> > >  		/* Reset called during driver load? GuC not yet initialised! */
> > >  		return;
> > >  	}
> > >  
> > > -	xa_for_each(&guc->context_lookup, index, ce)
> > > +	xa_lock_irqsave(&guc->context_lookup, flags);
> > > +	xa_for_each(&guc->context_lookup, index, ce) {
> > > +		intel_context_get(ce);
> > > +		xa_unlock(&guc->context_lookup);
> > > +
> > >  		if (intel_context_is_pinned(ce))
> > >  			__guc_reset_context(ce, stalled);
> > >  
> > > +		intel_context_put(ce);
> > > +		xa_lock(&guc->context_lookup);
> > > +	}
> > > +	xa_unlock_irqrestore(&guc->context_lookup, flags);
> > > +
> > >  	/* GuC is blown away, drop all references to contexts */
> > >  	xa_destroy(&guc->context_lookup);
> > >  }
> > > @@ -950,11 +977,21 @@ void intel_guc_submission_cancel_requests(struct intel_guc *guc)
> > >  {
> > >  	struct intel_context *ce;
> > >  	unsigned long index;
> > > +	unsigned long flags;
> > > +
> > > +	xa_lock_irqsave(&guc->context_lookup, flags);
> > > +	xa_for_each(&guc->context_lookup, index, ce) {
> > > +		intel_context_get(ce);
> > > +		xa_unlock(&guc->context_lookup);
> > >  
> > > -	xa_for_each(&guc->context_lookup, index, ce)
> > >  		if (intel_context_is_pinned(ce))
> > >  			guc_cancel_context_requests(ce);
> > >  
> > > +		intel_context_put(ce);
> > > +		xa_lock(&guc->context_lookup);
> > > +	}
> > > +	xa_unlock_irqrestore(&guc->context_lookup, flags);
> > > +
> > >  	guc_cancel_sched_engine_requests(guc->sched_engine);
> > >  
> > >  	/* GuC is blown away, drop all references to contexts */
> > > @@ -2848,21 +2885,26 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
> > >  	struct intel_context *ce;
> > >  	struct i915_request *rq;
> > >  	unsigned long index;
> > > +	unsigned long flags;
> > >  
> > >  	/* Reset called during driver load? GuC not yet initialised! */
> > >  	if (unlikely(!guc_submission_initialized(guc)))
> > >  		return;
> > >  
> > > +	xa_lock_irqsave(&guc->context_lookup, flags);
> > >  	xa_for_each(&guc->context_lookup, index, ce) {
> > > +		intel_context_get(ce);
> > > +		xa_unlock(&guc->context_lookup);
> > > +
> > >  		if (!intel_context_is_pinned(ce))
> > > -			continue;
> > > +			goto next;
> > >  
> > >  		if (intel_engine_is_virtual(ce->engine)) {
> > >  			if (!(ce->engine->mask & engine->mask))
> > > -				continue;
> > > +				goto next;
> > >  		} else {
> > >  			if (ce->engine != engine)
> > > -				continue;
> > > +				goto next;
> > >  		}
> > >  
> > >  		list_for_each_entry(rq, &ce->guc_active.requests, sched.link) {
> > > @@ -2872,9 +2914,17 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
> > >  			intel_engine_set_hung_context(engine, ce);
> > >  
> > >  			/* Can only cope with one hang at a time... */
> > > -			return;
> > > +			intel_context_put(ce);
> > > +			xa_lock(&guc->context_lookup);
> > > +			goto done;
> > >  		}
> > > +next:
> > > +		intel_context_put(ce);
> > > +		xa_lock(&guc->context_lookup);
> > > +
> > >  	}
> > > +done:
> > > +	xa_unlock_irqrestore(&guc->context_lookup, flags);
> > >  }
> > >  
> > >  void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
> > > @@ -2890,23 +2940,32 @@ void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
> > >  	if (unlikely(!guc_submission_initialized(guc)))
> > >  		return;
> > >  
> > > +	xa_lock_irqsave(&guc->context_lookup, flags);
> > >  	xa_for_each(&guc->context_lookup, index, ce) {
> > > +		intel_context_get(ce);
> > > +		xa_unlock(&guc->context_lookup);
> > > +
> > >  		if (!intel_context_is_pinned(ce))
> > > -			continue;
> > > +			goto next;
> > >  
> > >  		if (intel_engine_is_virtual(ce->engine)) {
> > >  			if (!(ce->engine->mask & engine->mask))
> > > -				continue;
> > > +				goto next;
> > >  		} else {
> > >  			if (ce->engine != engine)
> > > -				continue;
> > > +				goto next;
> > >  		}
> > >  
> > >  		spin_lock_irqsave(&ce->guc_active.lock, flags);
> > >  		intel_engine_dump_active_requests(&ce->guc_active.requests,
> > >  						  hung_rq, m);
> > >  		spin_unlock_irqrestore(&ce->guc_active.lock, flags);
> > > +
> > > +next:
> > > +		intel_context_put(ce);
> > > +		xa_lock(&guc->context_lookup);
> > >  	}
> > > +	xa_unlock_irqrestore(&guc->context_lookup, flags);
> > >  }
> > >  
> > >  void intel_guc_submission_print_info(struct intel_guc *guc,
> > > @@ -2960,7 +3019,9 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
> > >  {
> > >  	struct intel_context *ce;
> > >  	unsigned long index;
> > > +	unsigned long flags;
> > >  
> > > +	xa_lock_irqsave(&guc->context_lookup, flags);
> > >  	xa_for_each(&guc->context_lookup, index, ce) {
> > >  		drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id);
> > >  		drm_printf(p, "\tHW Context Desc: 0x%08x\n", ce->lrc.lrca);
> > > @@ -2979,6 +3040,7 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
> > >  
> > >  		guc_log_context_priority(p, ce);
> > >  	}
> > > +	xa_unlock_irqrestore(&guc->context_lookup, flags);
> > >  }
> > >  
> > >  static struct intel_context *
> > > -- 
> > > 2.32.0
> > > 
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
