Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC8B494241
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 22:00:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A1E10E19C;
	Wed, 19 Jan 2022 21:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726FB10E19C;
 Wed, 19 Jan 2022 21:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642626009; x=1674162009;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7F9ORrUaQeTiy8qnjU6o+mCE4xM09P19XlwT3rwFuqE=;
 b=lA6eL1zPPqTMEunPRs1QOtxCuzAmnjYyiypOn94XRD6EnzGxnavo4v5P
 fszfBT+WRmFAprXSaqe22zfBNTdyXhtpIX26kAMfPYhFyiKyFycBJn+4p
 AdMuzJBTOpH7ypYgdvmXA4vQcoVMV9dS7ulw5Wly3Q3fiCN1dHvJFI47J
 XtXChy5WyPSQXhZDK+c65feRdv/Uif+fulxorwFJD9o5AVyGQURFyzH1+
 VG4HwfO3RuVoHUUdLKs2qeFOg1Rsy8X92YkBgwA/fqzdu0chpf5FGKVdn
 95FjORNPyL7J+FbCJ38ZE2TSBVdgSBRNB6qAg1bnYDZm/cC6yF+C2hSu0 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="245146576"
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="245146576"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 12:59:52 -0800
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="693938234"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 12:59:52 -0800
Date: Wed, 19 Jan 2022 12:54:05 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH 2/3] drm/i915/guc: Add work queue to trigger a GT reset
Message-ID: <20220119205405.GA32440@jons-linux-dev-box>
References: <20220118214357.33740-1-matthew.brost@intel.com>
 <20220118214357.33740-3-matthew.brost@intel.com>
 <50355add-0758-c4cc-df74-a6bb329ceb15@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50355add-0758-c4cc-df74-a6bb329ceb15@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 18, 2022 at 05:37:01PM -0800, John Harrison wrote:
> On 1/18/2022 13:43, Matthew Brost wrote:
> > The G2H handler needs to be flushed during a GT reset but a G2H
> > indicating engine reset failure can trigger a GT reset. Add a worker to
> > trigger the GT when a engine reset failure is received to break this
> s/a/an/
> 

Yep.

> > circular dependency.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  5 ++++
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 23 +++++++++++++++----
> >   2 files changed, 24 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > index 9d26a86fe557a..60ea8deef5392 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > @@ -119,6 +119,11 @@ struct intel_guc {
> >   		 * function as it might be in an atomic context (no sleeping)
> >   		 */
> >   		struct work_struct destroyed_worker;
> > +		/**
> > +		 * @reset_worker: worker to trigger a GT reset after an engine
> > +		 * reset fails
> > +		 */
> > +		struct work_struct reset_worker;
> >   	} submission_state;
> >   	/**
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 23a40f10d376d..cdd8d691251ff 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -1746,6 +1746,7 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
> >   }
> >   static void destroyed_worker_func(struct work_struct *w);
> > +static void reset_worker_func(struct work_struct *w);
> >   /*
> >    * Set up the memory resources to be shared with the GuC (via the GGTT)
> > @@ -1776,6 +1777,8 @@ int intel_guc_submission_init(struct intel_guc *guc)
> >   	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
> >   	INIT_WORK(&guc->submission_state.destroyed_worker,
> >   		  destroyed_worker_func);
> > +	INIT_WORK(&guc->submission_state.reset_worker,
> > +		  reset_worker_func);
> >   	guc->submission_state.guc_ids_bitmap =
> >   		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
> > @@ -4052,6 +4055,17 @@ guc_lookup_engine(struct intel_guc *guc, u8 guc_class, u8 instance)
> >   	return gt->engine_class[engine_class][instance];
> >   }
> > +static void reset_worker_func(struct work_struct *w)
> > +{
> > +	struct intel_guc *guc = container_of(w, struct intel_guc,
> > +					     submission_state.reset_worker);
> > +	struct intel_gt *gt = guc_to_gt(guc);
> > +
> > +	intel_gt_handle_error(gt, ALL_ENGINES,
> > +			      I915_ERROR_CAPTURE,
> > +			      "GuC failed to reset a engine\n");
> s/a/an/
> 

Yep.

> > +}
> > +
> >   int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
> >   					 const u32 *msg, u32 len)
> >   {
> > @@ -4083,10 +4097,11 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
> >   	drm_err(&gt->i915->drm, "GuC engine reset request failed on %d:%d (%s) because 0x%08X",
> >   		guc_class, instance, engine->name, reason);
> > -	intel_gt_handle_error(gt, engine->mask,
> > -			      I915_ERROR_CAPTURE,
> > -			      "GuC failed to reset %s (reason=0x%08x)\n",
> > -			      engine->name, reason);
> The engine name and reason code are lost from the error capture? I guess we
> still get it in the drm_err above, though. So probably not an issue. We
> shouldn't be getting these from end users and any internal CI run is only
> likely to give us the dmesg, not the error capture anyway! However, still

That was my reasoning on the msg too.

> seems like it is work saving engine->mask in the submission_state structure
> (ORing in, in case there are multiple resets). Clearing it should be safe
> because once a GT reset has happened, we aren't getting any more G2Hs. And
> we can't have multiple message handlers running concurrently, right? So no
> need to protect the OR either.
> 

I could do that but the engine->mask is really only used for the error
capture with GuC submission as any i915 based reset with GuC submission
is a GT reset. Going from engine->mask to ALL_ENGINES will just capture
all engine state before doing a GT reset which probably isn't a bad
thing, right?

I can update the commit message explaining this if that helps.

Matt 

> John.
> 
> 
> > +	/*
> > +	 * A GT reset flushes this worker queue (G2H handler) so we must use
> > +	 * another worker to trigger a GT reset.
> > +	 */
> > +	queue_work(system_unbound_wq, &guc->submission_state.reset_worker);
> >   	return 0;
> >   }
> 
