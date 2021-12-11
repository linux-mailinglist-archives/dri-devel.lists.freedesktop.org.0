Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59002470FC7
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 02:16:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F26510E691;
	Sat, 11 Dec 2021 01:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC2210E2FE;
 Sat, 11 Dec 2021 01:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639185374; x=1670721374;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uU+66Uwp6TQ5eAjMEXLMKl2tBRVC3dOT0EQcYR/FL7E=;
 b=JPxfXWXw5H6yUjyBN02V7N4cfymsFD9X13H3lAUE5m3VZkaDcru5EQOT
 b+ihMRw19dRkEl+Goyk7dCivTq6c1WKzRB2turNBBEPNfqQFrgJE3PCE0
 toJo4B4s7RQLuMw5ZA4XtoA75Q72fiWz5w2qckTYhhW3hbGlhbrXuUhUl
 sODsGPtkbZ4aOcGh8p5sbKudTxiNShE8aBJ9KLSQdBza6PYjr7JhtMY1S
 3XozFahqp6dB/DEV5r7ajxsbGM0uq30QG6QeMVd8EEAmjrRV6RFVa+8L/
 D4FEPiP3Rpvc6GVDn6Y0LAH5u31Ku+vi96fJFsGfG9ITg9s4hMcIsVrsA w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="237228816"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="237228816"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 17:16:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="517006451"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 17:16:13 -0800
Date: Fri, 10 Dec 2021 17:10:50 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH 4/7] drm/i915/guc: Don't hog IRQs when destroying contexts
Message-ID: <20211211011049.GA8660@jons-linux-dev-box>
References: <20211211005612.8575-1-matthew.brost@intel.com>
 <20211211005612.8575-5-matthew.brost@intel.com>
 <ec870417-3894-0bb2-6561-722b8345be6f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec870417-3894-0bb2-6561-722b8345be6f@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 10, 2021 at 05:07:12PM -0800, John Harrison wrote:
> On 12/10/2021 16:56, Matthew Brost wrote:
> > From: John Harrison <John.C.Harrison@Intel.com>
> > 
> > While attempting to debug a CT deadlock issue in various CI failures
> > (most easily reproduced with gem_ctx_create/basic-files), I was seeing
> > CPU deadlock errors being reported. This were because the context
> > destroy loop was blocking waiting on H2G space from inside an IRQ
> > spinlock. There was deadlock as such, it's just that the H2G queue was
> There was *no* deadlock as such
> 

Let's fix this up when applying the series.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> John.
> 
> > full of context destroy commands and GuC was taking a long time to
> > process them. However, the kernel was seeing the large amount of time
> > spent inside the IRQ lock as a dead CPU. Various Bad Things(tm) would
> > then happen (heartbeat failures, CT deadlock errors, outstanding H2G
> > WARNs, etc.).
> > 
> > Re-working the loop to only acquire the spinlock around the list
> > management (which is all it is meant to protect) rather than the
> > entire destroy operation seems to fix all the above issues.
> > 
> > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > ---
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 45 ++++++++++++-------
> >   1 file changed, 28 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 36c2965db49b..96fcf869e3ff 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -2644,7 +2644,6 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
> >   	unsigned long flags;
> >   	bool disabled;
> > -	lockdep_assert_held(&guc->submission_state.lock);
> >   	GEM_BUG_ON(!intel_gt_pm_is_awake(gt));
> >   	GEM_BUG_ON(!lrc_desc_registered(guc, ce->guc_id.id));
> >   	GEM_BUG_ON(ce != __get_context(guc, ce->guc_id.id));
> > @@ -2660,7 +2659,7 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
> >   	}
> >   	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> >   	if (unlikely(disabled)) {
> > -		__release_guc_id(guc, ce);
> > +		release_guc_id(guc, ce);
> >   		__guc_context_destroy(ce);
> >   		return;
> >   	}
> > @@ -2694,36 +2693,48 @@ static void __guc_context_destroy(struct intel_context *ce)
> >   static void guc_flush_destroyed_contexts(struct intel_guc *guc)
> >   {
> > -	struct intel_context *ce, *cn;
> > +	struct intel_context *ce;
> >   	unsigned long flags;
> >   	GEM_BUG_ON(!submission_disabled(guc) &&
> >   		   guc_submission_initialized(guc));
> > -	spin_lock_irqsave(&guc->submission_state.lock, flags);
> > -	list_for_each_entry_safe(ce, cn,
> > -				 &guc->submission_state.destroyed_contexts,
> > -				 destroyed_link) {
> > -		list_del_init(&ce->destroyed_link);
> > -		__release_guc_id(guc, ce);
> > +	while (!list_empty(&guc->submission_state.destroyed_contexts)) {
> > +		spin_lock_irqsave(&guc->submission_state.lock, flags);
> > +		ce = list_first_entry_or_null(&guc->submission_state.destroyed_contexts,
> > +					      struct intel_context,
> > +					      destroyed_link);
> > +		if (ce)
> > +			list_del_init(&ce->destroyed_link);
> > +		spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> > +
> > +		if (!ce)
> > +			break;
> > +
> > +		release_guc_id(guc, ce);
> >   		__guc_context_destroy(ce);
> >   	}
> > -	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> >   }
> >   static void deregister_destroyed_contexts(struct intel_guc *guc)
> >   {
> > -	struct intel_context *ce, *cn;
> > +	struct intel_context *ce;
> >   	unsigned long flags;
> > -	spin_lock_irqsave(&guc->submission_state.lock, flags);
> > -	list_for_each_entry_safe(ce, cn,
> > -				 &guc->submission_state.destroyed_contexts,
> > -				 destroyed_link) {
> > -		list_del_init(&ce->destroyed_link);
> > +	while (!list_empty(&guc->submission_state.destroyed_contexts)) {
> > +		spin_lock_irqsave(&guc->submission_state.lock, flags);
> > +		ce = list_first_entry_or_null(&guc->submission_state.destroyed_contexts,
> > +					      struct intel_context,
> > +					      destroyed_link);
> > +		if (ce)
> > +			list_del_init(&ce->destroyed_link);
> > +		spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> > +
> > +		if (!ce)
> > +			break;
> > +
> >   		guc_lrc_desc_unpin(ce);
> >   	}
> > -	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> >   }
> >   static void destroyed_worker_func(struct work_struct *w)
> 
