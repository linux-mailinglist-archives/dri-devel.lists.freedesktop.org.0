Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFC13E569A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 11:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3293C89F63;
	Tue, 10 Aug 2021 09:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372E189F61
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 09:18:24 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id l18so25320803wrv.5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 02:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9hufEZjAKEFWJ8zzrYpN2mq0/S0tL+FK2DPnSWxnaRE=;
 b=h7/0o8nH5A81QtmMyJFyPtoadcVMEUgNFxSIW9ar22BgJI2zR9uZmEtkigbftZHRXk
 ouYgsyqGLqIhUgzILc2B9K/2TukTMggxfnSOvNuIDBLRWMk+Y5eFhuU6FQVha6LEu2i9
 KB+MxsYwn3SB2QPqgAn3fyM3WPfaazYnOZGfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9hufEZjAKEFWJ8zzrYpN2mq0/S0tL+FK2DPnSWxnaRE=;
 b=gpvmARbSPVtSgk0S+pcH9O7545x2cX8wcwKmLqenc31a9irpUJNpLNibDujhEj8PhJ
 T+BUhoTwCckdchOfnWZUKLtYqhHIC/nnv/D/qgDnIC/Gu/VeIYLqfzahT5wmJ9vlUhci
 5e+Icks8cI4RxuKrTY4IOtQTx5g2qXC48ckwEhlEk7XjkAViwJa4jByOXLzQkNqAz6qz
 W7wznd+idxfTbdEZFDYN15hxkDBa0HP0hZX6UdgaFWsrqLq8iWI2+w8xmOksbP270t4H
 n4os1vRwiZYt9cHBgQIwI6cCz9Xam9guG11a/wLk+Qp9ffNk9wqHnLMVffBcSZxl3SNe
 EcGA==
X-Gm-Message-State: AOAM533QH9rqS0kn3vcGl3Rfu06/U7B6oGczfiNQl7NXdhttsOjwZBm7
 KwC3H89uVhrcMitefLeLwwXJ6w==
X-Google-Smtp-Source: ABdhPJyzoHKcTY2XeOC/z9B48LXleZqKaupfp9bqRd8mG6ZqFBDLBluOYdH6/OLo2bK+Tx3ZN1KJQQ==
X-Received: by 2002:a05:6000:104f:: with SMTP id
 c15mr3095509wrx.357.1628587102558; 
 Tue, 10 Aug 2021 02:18:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n186sm2404761wme.40.2021.08.10.02.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 02:18:21 -0700 (PDT)
Date: Tue, 10 Aug 2021 11:18:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 20/46] drm/i915/guc: Add hang check to GuC submit engine
Message-ID: <YRJEXOUtdyi2yD5N@phenom.ffwll.local>
References: <20210803222943.27686-1-matthew.brost@intel.com>
 <20210803222943.27686-21-matthew.brost@intel.com>
 <YRFLPfzsAgFqqytd@phenom.ffwll.local>
 <20210809190558.GA123848@DUT151-ICLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809190558.GA123848@DUT151-ICLU.fm.intel.com>
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

On Mon, Aug 09, 2021 at 07:05:58PM +0000, Matthew Brost wrote:
> On Mon, Aug 09, 2021 at 05:35:25PM +0200, Daniel Vetter wrote:
> > On Tue, Aug 03, 2021 at 03:29:17PM -0700, Matthew Brost wrote:
> > > The heartbeat uses a single instance of a GuC submit engine (GSE) to do
> > > the hang check. As such if a different GSE's state machine hangs, the
> > > heartbeat cannot detect this hang. Add timer to each GSE which in turn
> > > can disable all submissions if it is hung.
> > > 
> > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 36 +++++++++++++++++++
> > >  .../i915/gt/uc/intel_guc_submission_types.h   |  3 ++
> > >  2 files changed, 39 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > index afb9b4bb8971..2d8296bcc583 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > @@ -105,15 +105,21 @@ static bool tasklet_blocked(struct guc_submit_engine *gse)
> > >  	return test_bit(GSE_STATE_TASKLET_BLOCKED, &gse->flags);
> > >  }
> > >  
> > > +/* 2 seconds seems like a reasonable timeout waiting for a G2H */
> > > +#define MAX_TASKLET_BLOCKED_NS	2000000000
> > >  static void set_tasklet_blocked(struct guc_submit_engine *gse)
> > >  {
> > >  	lockdep_assert_held(&gse->sched_engine.lock);
> > > +	hrtimer_start_range_ns(&gse->hang_timer,
> > > +			       ns_to_ktime(MAX_TASKLET_BLOCKED_NS), 0,
> > > +			       HRTIMER_MODE_REL_PINNED);
> > >  	set_bit(GSE_STATE_TASKLET_BLOCKED, &gse->flags);
> > 
> > So with drm/scheduler the reset handling is assumed to be
> > single-threaded, and there's quite complex rules around that. I've
> > recently worked with Boris Brezillion to clarify all this a bit and
> > improve docs. Does this all still work in that glorious future? Might be
> > good to at least sprinkle some comments/thoughts around in the commit
> > message about the envisaged future direction for all this stuff, to keep
> > people in the loop. Especially future people.
> > 
> > Ofc plan is still to just largely land all this.
> > 
> > Also: set_bit is an unordered atomic, which means you need barriers, which
> > meanes ... *insert the full rant about justifying/documenting lockless
> > algorithms from earlier *
> >
> 
> lockdep_assert_held(&gse->sched_engine.lock);
> 
> Not lockless. Also spin locks act as barriers, right?

Well if that spinlock is protecting that bit then that's good, but then it
shouldn't be an atomic set_bit. In that case:
- either make the entire bitfield non-atomic so it's clear there's boring
  dumb locking going on
- or split out your new bit into a separate field so that there's no false
  sharing with the existing bitfield state machinery, and add a kernel doc
  to that field explaining the locking

set_bit itself is atomic and unordered, so means you need barriers and all
that. If you don't have a lockless algorithm, don't use atomic bitops to
avoid confusing readers because set_bit/test_bit sets of all the warning
bells.

And yes it's annoying that for bitops the atomic ones don't have an
atomic_ prefix. The non-atomic ones have a __ prefix. This is honestly why
I don't think we should use bitfields as much as we do, because the main
use-case for them is when you have bitfields which are longer than 64bits.
They come from the cpumask world, and linux supports a lot of cpus.

Open-coding non-atomic simple bitfields with the usual C operators is
perfectly fine and legible imo. But that part is maybe more a bikeshed.

> > But I think this all falls out with the removal of the guc-id allocation
> > scheme?
> 
> Yes, this patch is getting deleted.

That works too :-)
-Daniel

> 
> Matt
> 
> > -Daniel
> > 
> > >  }
> > >  
> > >  static void __clr_tasklet_blocked(struct guc_submit_engine *gse)
> > >  {
> > >  	lockdep_assert_held(&gse->sched_engine.lock);
> > > +	hrtimer_cancel(&gse->hang_timer);
> > >  	clear_bit(GSE_STATE_TASKLET_BLOCKED, &gse->flags);
> > >  }
> > >  
> > > @@ -1028,6 +1034,7 @@ static void disable_submission(struct intel_guc *guc)
> > >  		if (__tasklet_is_enabled(&sched_engine->tasklet)) {
> > >  			GEM_BUG_ON(!guc->ct.enabled);
> > >  			__tasklet_disable_sync_once(&sched_engine->tasklet);
> > > +			hrtimer_try_to_cancel(&guc->gse[i]->hang_timer);
> > >  			sched_engine->tasklet.callback = NULL;
> > >  		}
> > >  	}
> > > @@ -3750,6 +3757,33 @@ static void guc_sched_engine_destroy(struct kref *kref)
> > >  	kfree(gse);
> > >  }
> > >  
> > > +static enum hrtimer_restart gse_hang(struct hrtimer *hrtimer)
> > > +{
> > > +	struct guc_submit_engine *gse =
> > > +		container_of(hrtimer, struct guc_submit_engine, hang_timer);
> > > +	struct intel_guc *guc = gse->sched_engine.private_data;
> > > +
> > > +#if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
> > > +	if (guc->gse_hang_expected)
> > > +		drm_dbg(&guc_to_gt(guc)->i915->drm,
> > > +			"GSE[%i] hung, disabling submission", gse->id);
> > > +	else
> > > +		drm_err(&guc_to_gt(guc)->i915->drm,
> > > +			"GSE[%i] hung, disabling submission", gse->id);
> > > +#else
> > > +	drm_err(&guc_to_gt(guc)->i915->drm,
> > > +		"GSE[%i] hung, disabling submission", gse->id);
> > > +#endif
> > > +
> > > +	/*
> > > +	 * Tasklet not making forward progress, disable submission which in turn
> > > +	 * will kick in the heartbeat to do a full GPU reset.
> > > +	 */
> > > +	disable_submission(guc);
> > > +
> > > +	return HRTIMER_NORESTART;
> > > +}
> > > +
> > >  static void guc_submit_engine_init(struct intel_guc *guc,
> > >  				   struct guc_submit_engine *gse,
> > >  				   int id)
> > > @@ -3767,6 +3801,8 @@ static void guc_submit_engine_init(struct intel_guc *guc,
> > >  	sched_engine->retire_inflight_request_prio =
> > >  		guc_retire_inflight_request_prio;
> > >  	sched_engine->private_data = guc;
> > > +	hrtimer_init(&gse->hang_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> > > +	gse->hang_timer.function = gse_hang;
> > >  	gse->id = id;
> > >  }
> > >  
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission_types.h
> > > index a5933e07bdd2..eae2e9725ede 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission_types.h
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission_types.h
> > > @@ -6,6 +6,8 @@
> > >  #ifndef _INTEL_GUC_SUBMISSION_TYPES_H_
> > >  #define _INTEL_GUC_SUBMISSION_TYPES_H_
> > >  
> > > +#include <linux/xarray.h>
> > > +
> > >  #include "gt/intel_engine_types.h"
> > >  #include "gt/intel_context_types.h"
> > >  #include "i915_scheduler_types.h"
> > > @@ -41,6 +43,7 @@ struct guc_submit_engine {
> > >  	unsigned long flags;
> > >  	int total_num_rq_with_no_guc_id;
> > >  	atomic_t num_guc_ids_not_ready;
> > > +	struct hrtimer hang_timer;
> > >  	int id;
> > >  
> > >  	/*
> > > -- 
> > > 2.28.0
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
