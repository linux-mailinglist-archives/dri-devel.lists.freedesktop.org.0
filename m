Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D67143F6E1F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 06:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC306E13A;
	Wed, 25 Aug 2021 04:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3926E113;
 Wed, 25 Aug 2021 04:10:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="204578598"
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; d="scan'208";a="204578598"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 21:10:28 -0700
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; d="scan'208";a="473711767"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 21:10:27 -0700
Date: Tue, 24 Aug 2021 21:05:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: Re: [Intel-gfx] [PATCH 06/27] drm/i915/guc: Workaround reset G2H is
 received after schedule done G2H
Message-ID: <20210825040518.GA21209@jons-linux-dev-box>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-7-matthew.brost@intel.com>
 <5015ca18-7237-b101-8afa-0cd17ef98aed@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5015ca18-7237-b101-8afa-0cd17ef98aed@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 24, 2021 at 04:31:21PM -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 8/18/2021 11:16 PM, Matthew Brost wrote:
> > If the context is reset as a result of the request cancelation the
> > context reset G2H is received after schedule disable done G2H which is
> > likely the wrong order. The schedule disable done G2H release the
> > waiting request cancelation code which resubmits the context. This races
> > with the context reset G2H which also wants to resubmit the context but
> > in this case it really should be a NOP as request cancelation code owns
> > the resubmit. Use some clever tricks of checking the context state to
> > seal this race until if / when the GuC firmware is fixed.
> 
> Did you raise this with the GuC team? If it's a GuC issue we definitely want
> a fix there ASAP so we can drop any i915-side WAs.
>

Yep, def an issue with the GuC firmware behavior. Will get fixed, just
not sure when.
 
> > 
> > v2:
> >   (Checkpatch)
> >    - Fix typos
> > 
> > Fixes: 62eaf0ae217d ("drm/i915/guc: Support request cancellation")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: <stable@vger.kernel.org>
> > ---
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 43 ++++++++++++++++---
> >   1 file changed, 37 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index e4a099f8f820..8f7a11e65ef5 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -832,17 +832,35 @@ __unwind_incomplete_requests(struct intel_context *ce)
> >   static void __guc_reset_context(struct intel_context *ce, bool stalled)
> >   {
> >   	struct i915_request *rq;
> > +	unsigned long flags;
> >   	u32 head;
> > +	bool skip = false;
> >   	intel_context_get(ce);
> >   	/*
> > -	 * GuC will implicitly mark the context as non-schedulable
> > -	 * when it sends the reset notification. Make sure our state
> > -	 * reflects this change. The context will be marked enabled
> > -	 * on resubmission.
> > +	 * GuC will implicitly mark the context as non-schedulable when it sends
> > +	 * the reset notification. Make sure our state reflects this change. The
> > +	 * context will be marked enabled on resubmission.
> > +	 *
> > +	 * XXX: If the context is reset as a result of the request cancellation
> > +	 * this G2H is received after the schedule disable complete G2H which is
> > +	 * likely wrong as this creates a race between the request cancellation
> > +	 * code re-submitting the context and this G2H handler. This likely
> > +	 * should be fixed in the GuC but until if / when that gets fixed we
> > +	 * need to workaround this. Convert this function to a NOP if a pending
> > +	 * enable is in flight as this indicates that a request cancellation has
> > +	 * occurred.
> >   	 */
> 
> IMO this comment sounds like we're not clear on expected behavior. Either
> the ordering is wrong, in which case we have a GuC bug and this is a
> temporary WA, or the ordering is allowed and we need to cope with it. The
> way the comment is written sounds like we're not sure.
> 

Comments written prior to confirmation that GuC behavior was wrong, will
reword.

> Code changes look ok.
>

Ty. I'll think we have to carry this until we upgrade the GuC firmware
with a the proper behavior - until then without this workaround
canceling non-preemptable requests is 100% broken, hence why I added a
selftest. Will add a FIXME / XXX comment so we can remove this in the
future.

Matt

> Daniele
> 
> > -	clr_context_enabled(ce);
> > +	spin_lock_irqsave(&ce->guc_state.lock, flags);
> > +	if (likely(!context_pending_enable(ce))) {
> > +		clr_context_enabled(ce);
> > +	} else {
> > +		skip = true;
> > +	}
> > +	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> > +	if (unlikely(skip))
> > +		goto out_put;
> >   	rq = intel_context_find_active_request(ce);
> >   	if (!rq) {
> > @@ -861,6 +879,7 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
> >   out_replay:
> >   	guc_reset_state(ce, head, stalled);
> >   	__unwind_incomplete_requests(ce);
> > +out_put:
> >   	intel_context_put(ce);
> >   }
> > @@ -1605,6 +1624,13 @@ static void guc_context_cancel_request(struct intel_context *ce,
> >   			guc_reset_state(ce, intel_ring_wrap(ce->ring, rq->head),
> >   					true);
> >   		}
> > +
> > +		/*
> > +		 * XXX: Racey if context is reset, see comment in
> > +		 * __guc_reset_context().
> > +		 */
> > +		flush_work(&ce_to_guc(ce)->ct.requests.worker);
> > +
> >   		guc_context_unblock(ce);
> >   	}
> >   }
> > @@ -2719,7 +2745,12 @@ static void guc_handle_context_reset(struct intel_guc *guc,
> >   {
> >   	trace_intel_context_reset(ce);
> > -	if (likely(!intel_context_is_banned(ce))) {
> > +	/*
> > +	 * XXX: Racey if request cancellation has occurred, see comment in
> > +	 * __guc_reset_context().
> > +	 */
> > +	if (likely(!intel_context_is_banned(ce) &&
> > +		   !context_blocked(ce))) {
> >   		capture_error_state(guc, ce);
> >   		guc_context_replay(ce);
> >   	}
> 
