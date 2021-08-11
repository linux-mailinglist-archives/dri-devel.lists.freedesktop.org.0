Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C50E53E96D7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 19:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2210E6E18E;
	Wed, 11 Aug 2021 17:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD36A6E18E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 17:28:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="300767232"
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; d="scan'208";a="300767232"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2021 10:28:54 -0700
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; d="scan'208";a="507102151"
Received: from dut151-iclu.fm.intel.com ([10.105.23.69])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2021 10:28:54 -0700
Date: Wed, 11 Aug 2021 17:28:53 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: gfx-internal-devel@eclists.intel.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/9] drm/i915/guc: Fix blocked context accounting
Message-ID: <20210811172853.GA296946@DUT151-ICLU.fm.intel.com>
References: <20210811011622.255784-1-matthew.brost@intel.com>
 <20210811011622.255784-2-matthew.brost@intel.com>
 <YROm3Ep+RpKHQcL/@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YROm3Ep+RpKHQcL/@phenom.ffwll.local>
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

On Wed, Aug 11, 2021 at 12:30:52PM +0200, Daniel Vetter wrote:
> On Wed, Aug 11, 2021 at 01:16:14AM +0000, Matthew Brost wrote:
> > Prior to this patch the blocked context counter was cleared on
> > init_sched_state (used during registering a context & resets) which is
> > incorrect. This state needs to be persistent or the counter can read the
> > incorrect value resulting in scheduling never getting enabled again.
> > 
> > Fixes: 62eaf0ae217d ("drm/i915/guc: Support request cancellation")
> 

Ah, relized I sent this series to the wrong list, let's stop replying to
rev of series after this patch.

> Tiny bikeshed on that commit, but for SCHED_STATE_BLOCKED_MASK you want
> GENMASK. Also SCHED_STATE_BLOCKED is usually called
> SCHED_STATE_BLOCKED_BIAS or similar if you put a counter into that field.
> 
> But also ... we can't afford a separate counter? Is all the bitshifting
> actually worth the space savings? With a separate counter your bugfix
> below would look a lot more reasonable too.
> 

Could add a counter I suppose. A lot of this clean up can be done over
time. 

> 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: <stable@vger.kernel.org>
> > ---
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 87d8dc8f51b9..69faa39da178 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -152,7 +152,7 @@ static inline void init_sched_state(struct intel_context *ce)
> >  {
> >  	/* Only should be called from guc_lrc_desc_pin() */
> >  	atomic_set(&ce->guc_sched_state_no_lock, 0);
> 
> atomic_t without barriers or anything like that. tsk, tsk.
> 
> Do we really need this?
> 
> Also I looked through the callchain of init_sched_state and I couldn't
> find any locking, nor any description about ownership that would explain
> why there's no locking.
> 
> E.g. scrub_guc_desc_for_outstanding_g2h has an xa_for_each with no
> protection. No idea how that one works. I also couldn't figure out how

In both the reset and context registration cases it is guaranteed no one
else can be touching this context. We can get a lock inversion if use
this lock while registering the context, thus we don't use it there.
All this locking complexity is going to be greatly reduced when we move
to the DRM scheduler + have a task to clean up the locking then.

> anything else in there is protected (no spinlocks to be seen anywhere at
> least).
> 
> And then there's stuff like this:
> 
> 		/* Flush context */
> 		spin_lock_irqsave(&ce->guc_state.lock, flags);
> 		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> 
> This pattern seems very common, and it freaks me out.
> 

I wrote some doc up on this in one of my initial posts. It is basically
seal a bunch of races flying around related to resets. Cycling the lock
guarantees that contexts can see that reset is in flight and not send
out a H2G that requires a G2H response. Losing a G2H is fatal as we
depend on that response to take further action (e.g. release a fence, do
a put, etc...). 

> Finally none of the locking or consistency rules are explained in the
> kerneldoc (or even comments) in the relevant datastructures, which is not
> great.

Like I said, I have a patch for documentation but it hasn't made it into
the kernel yet. I'll include the doc patch in my next spin of the parallel
submission code.

> 
> > -	ce->guc_state.sched_state = 0;
> > +	ce->guc_state.sched_state &= SCHED_STATE_BLOCKED_MASK;
> 
> The patch itself matches the commit message and makes sense. But like I
> said, would be cleaner I think if it's just a separate counter.
>

Can clean this in the future.

Matt

> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> >  }
> >  
> >  static inline bool
> > -- 
> > 2.32.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
