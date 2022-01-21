Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC4F4958CC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 05:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0B510E264;
	Fri, 21 Jan 2022 04:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA9210E19A;
 Fri, 21 Jan 2022 04:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642738214; x=1674274214;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GIrCuJsZz+b3Aa+1RBUuG3CkTrW1hofcNwtQXfdUgvU=;
 b=KzFmebIMdshB+VIF7mo4aD1h+Y4/IW16+PgSzhrJz8Mvv/GFnJKA2wFc
 WWUw8RWaNC9t91UtlpKp+HiWAO45j/hOpwRsnja9TL/n7uRNhILz+Kgy+
 MTW7yBGh2sh0pJgqEIQxY8mW2F0XMeI6mPaFVVhIcfYeymEEK7S1VJa0I
 g8lYVJgFfbQR2h+s0lJVtb443aOzDAibRH6dx2NtIB5mTPEId4Vv6J2V8
 KMQ8+e8Ms1k1l8U4byOeM2nOGWLQneuwJgAiLFwCRXt2ek0P8H1NyQ/DW
 9ONbTcNpC0U0SbN8yPumszU1Gn2k9Q9TOBYs05h7pZt6SDNw5e/1BgUnT A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245778777"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="245778777"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 20:10:06 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="493710307"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 20:10:06 -0800
Date: Thu, 20 Jan 2022 20:04:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH 2/3] drm/i915/guc: Add work queue to trigger a GT reset
Message-ID: <20220121040420.GA4148@jons-linux-dev-box>
References: <20220119212419.23068-1-matthew.brost@intel.com>
 <20220119212419.23068-3-matthew.brost@intel.com>
 <4eecb7af-245c-60aa-2eed-0dbb54e65189@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4eecb7af-245c-60aa-2eed-0dbb54e65189@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 20, 2022 at 05:34:54PM -0800, John Harrison wrote:
> On 1/19/2022 13:24, Matthew Brost wrote:
> > The G2H handler needs to be flushed during a GT reset but a G2H
> > indicating engine reset failure can trigger a GT reset. Add a worker to
> > trigger the GT when an engine reset failure is received to break this
> trigger the GT reset?
> 

Yes.

> > circular dependency.
> > 
> > v2:
> >   (John Harrison)
> >    - Store engine reset mask
> >    - Fix typo in commit message
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  9 +++++
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 37 +++++++++++++++++--
> >   2 files changed, 42 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > index 9d26a86fe557..c4a9fc7dd246 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > @@ -119,6 +119,15 @@ struct intel_guc {
> >   		 * function as it might be in an atomic context (no sleeping)
> >   		 */
> >   		struct work_struct destroyed_worker;
> > +		/**
> > +		 * @reset_worker: worker to trigger a GT reset after an engine
> > +		 * reset fails
> > +		 */
> > +		struct work_struct reset_worker;
> > +		/**
> > +		 * @reset_mask: mask of engines that failed to reset
> > +		 */
> > +		intel_engine_mask_t reset_mask;
> reset_fail_mask might be a less ambiguous name? Same for the worker struct
> and function.
> 

How about:

struct {
	worker;
	mask;
} engine_reset_fail;

Matt

> John.
> 
> >   	} submission_state;
> >   	/**
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 3918f1be114f..514b3060b141 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -1731,6 +1731,7 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
> >   }
> >   static void destroyed_worker_func(struct work_struct *w);
> > +static void reset_worker_func(struct work_struct *w);
> >   /*
> >    * Set up the memory resources to be shared with the GuC (via the GGTT)
> > @@ -1761,6 +1762,8 @@ int intel_guc_submission_init(struct intel_guc *guc)
> >   	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
> >   	INIT_WORK(&guc->submission_state.destroyed_worker,
> >   		  destroyed_worker_func);
> > +	INIT_WORK(&guc->submission_state.reset_worker,
> > +		  reset_worker_func);
> >   	guc->submission_state.guc_ids_bitmap =
> >   		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
> > @@ -4026,6 +4029,26 @@ guc_lookup_engine(struct intel_guc *guc, u8 guc_class, u8 instance)
> >   	return gt->engine_class[engine_class][instance];
> >   }
> > +static void reset_worker_func(struct work_struct *w)
> > +{
> > +	struct intel_guc *guc = container_of(w, struct intel_guc,
> > +					     submission_state.reset_worker);
> > +	struct intel_gt *gt = guc_to_gt(guc);
> > +	intel_engine_mask_t reset_mask;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&guc->submission_state.lock, flags);
> > +	reset_mask = guc->submission_state.reset_mask;
> > +	guc->submission_state.reset_mask = 0;
> > +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> > +
> > +	if (likely(reset_mask))
> > +		intel_gt_handle_error(gt, reset_mask,
> > +				      I915_ERROR_CAPTURE,
> > +				      "GuC failed to reset engine mask=0x%x\n",
> > +				      reset_mask);
> > +}
> > +
> >   int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
> >   					 const u32 *msg, u32 len)
> >   {
> > @@ -4033,6 +4056,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
> >   	struct intel_gt *gt = guc_to_gt(guc);
> >   	u8 guc_class, instance;
> >   	u32 reason;
> > +	unsigned long flags;
> >   	if (unlikely(len != 3)) {
> >   		drm_err(&gt->i915->drm, "Invalid length %u", len);
> > @@ -4057,10 +4081,15 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
> >   	drm_err(&gt->i915->drm, "GuC engine reset request failed on %d:%d (%s) because 0x%08X",
> >   		guc_class, instance, engine->name, reason);
> > -	intel_gt_handle_error(gt, engine->mask,
> > -			      I915_ERROR_CAPTURE,
> > -			      "GuC failed to reset %s (reason=0x%08x)\n",
> > -			      engine->name, reason);
> > +	spin_lock_irqsave(&guc->submission_state.lock, flags);
> > +	guc->submission_state.reset_mask |= engine->mask;
> > +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> > +
> > +	/*
> > +	 * A GT reset flushes this worker queue (G2H handler) so we must use
> > +	 * another worker to trigger a GT reset.
> > +	 */
> > +	queue_work(system_unbound_wq, &guc->submission_state.reset_worker);
> >   	return 0;
> >   }
> 
