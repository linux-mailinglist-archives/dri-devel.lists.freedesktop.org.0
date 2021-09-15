Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDE840CD51
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 21:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BBE6E9F2;
	Wed, 15 Sep 2021 19:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9706E9F2;
 Wed, 15 Sep 2021 19:39:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="283414314"
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; d="scan'208";a="283414314"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 12:39:42 -0700
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; d="scan'208";a="472521788"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 12:39:42 -0700
Date: Wed, 15 Sep 2021 12:34:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tony.ye@intel.com, zhengguo.xu@intel.com
Subject: Re: [Intel-gfx] [PATCH 13/27] drm/i915/guc: Ensure GuC schedule
 operations do not operate on child contexts
Message-ID: <20210915193443.GA16098@jons-linux-dev-box>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-14-matthew.brost@intel.com>
 <bc782f52-a19a-0a2e-a472-fb469858135b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc782f52-a19a-0a2e-a472-fb469858135b@intel.com>
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

On Wed, Sep 15, 2021 at 12:24:41PM -0700, John Harrison wrote:
> On 8/20/2021 15:44, Matthew Brost wrote:
> > In GuC parent-child contexts the parent context controls the scheduling,
> > ensure only the parent does the scheduling operations.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 24 ++++++++++++++-----
> >   1 file changed, 18 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index dbcb9ab28a9a..00d54bb00bfb 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -320,6 +320,12 @@ static void decr_context_committed_requests(struct intel_context *ce)
> >   	GEM_BUG_ON(ce->guc_state.number_committed_requests < 0);
> >   }
> > +static struct intel_context *
> > +request_to_scheduling_context(struct i915_request *rq)
> > +{
> > +	return intel_context_to_parent(rq->context);
> > +}
> > +
> >   static bool context_guc_id_invalid(struct intel_context *ce)
> >   {
> >   	return ce->guc_id.id == GUC_INVALID_LRC_ID;
> > @@ -1684,6 +1690,7 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
> >   	GEM_BUG_ON(guc_id == GUC_INVALID_LRC_ID);
> > +	GEM_BUG_ON(intel_context_is_child(ce));
> >   	trace_intel_context_sched_disable(ce);
> >   	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
> > @@ -1898,6 +1905,8 @@ static void guc_context_sched_disable(struct intel_context *ce)
> >   	u16 guc_id;
> >   	bool enabled;
> > +	GEM_BUG_ON(intel_context_is_child(ce));
> > +
> >   	if (submission_disabled(guc) || context_guc_id_invalid(ce) ||
> >   	    !lrc_desc_registered(guc, ce->guc_id.id)) {
> >   		spin_lock_irqsave(&ce->guc_state.lock, flags);
> > @@ -2286,6 +2295,8 @@ static void guc_signal_context_fence(struct intel_context *ce)
> >   {
> >   	unsigned long flags;
> > +	GEM_BUG_ON(intel_context_is_child(ce));
> > +
> >   	spin_lock_irqsave(&ce->guc_state.lock, flags);
> >   	clr_context_wait_for_deregister_to_register(ce);
> >   	__guc_signal_context_fence(ce);
> > @@ -2315,7 +2326,7 @@ static void guc_context_init(struct intel_context *ce)
> >   static int guc_request_alloc(struct i915_request *rq)
> >   {
> > -	struct intel_context *ce = rq->context;
> > +	struct intel_context *ce = request_to_scheduling_context(rq);
> >   	struct intel_guc *guc = ce_to_guc(ce);
> >   	unsigned long flags;
> >   	int ret;
> > @@ -2358,11 +2369,12 @@ static int guc_request_alloc(struct i915_request *rq)
> >   	 * exhausted and return -EAGAIN to the user indicating that they can try
> >   	 * again in the future.
> >   	 *
> > -	 * There is no need for a lock here as the timeline mutex ensures at
> > -	 * most one context can be executing this code path at once. The
> > -	 * guc_id_ref is incremented once for every request in flight and
> > -	 * decremented on each retire. When it is zero, a lock around the
> > -	 * increment (in pin_guc_id) is needed to seal a race with unpin_guc_id.
> > +	 * There is no need for a lock here as the timeline mutex (or
> > +	 * parallel_submit mutex in the case of multi-lrc) ensures at most one
> > +	 * context can be executing this code path at once. The guc_id_ref is
> Isn't that now two? One uni-LRC holding the timeline mutex and one multi-LRC
> holding the parallel submit mutex?
> 

This is actually a stale comment and need scrub this. The
parallel_submit mutex is gone, now we grab the ce->timeline locks
starting at the parent and then all children in a loop. I think the
original comment is sufficient.

Matt

> John.
> 
> > +	 * incremented once for every request in flight and decremented on each
> > +	 * retire. When it is zero, a lock around the increment (in pin_guc_id)
> > +	 * is needed to seal a race with unpin_guc_id.
> >   	 */
> >   	if (atomic_add_unless(&ce->guc_id.ref, 1, 0))
> >   		goto out;
> 
