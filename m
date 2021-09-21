Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D853413A9D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 21:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF0526E5C0;
	Tue, 21 Sep 2021 19:18:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB046E5B9;
 Tue, 21 Sep 2021 19:18:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="223480429"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="223480429"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 12:18:05 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="512443042"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 12:18:04 -0700
Date: Tue, 21 Sep 2021 12:13:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tony.ye@intel.com, zhengguo.xu@intel.com
Subject: Re: [Intel-gfx] [PATCH 18/27] drm/i915/guc: Update debugfs for GuC
 multi-lrc
Message-ID: <20210921191309.GA4920@jons-linux-dev-box>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-19-matthew.brost@intel.com>
 <c63585cd-0cf3-0b9e-80c0-060741d1484d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c63585cd-0cf3-0b9e-80c0-060741d1484d@intel.com>
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

On Mon, Sep 20, 2021 at 03:48:59PM -0700, John Harrison wrote:
> 
> 
> On 8/20/2021 15:44, Matthew Brost wrote:
> > Display the workqueue status in debugfs for GuC contexts that are in
> > parent-child relationship.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 51 ++++++++++++++-----
> >   1 file changed, 37 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index e34e0ea9136a..07eee9a399c8 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -3673,6 +3673,26 @@ static void guc_log_context_priority(struct drm_printer *p,
> >   	drm_printf(p, "\n");
> >   }
> > +
> > +static inline void guc_log_context(struct drm_printer *p,
> > +				   struct intel_context *ce)
> > +{
> > +	drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id.id);
> > +	drm_printf(p, "\tHW Context Desc: 0x%08x\n", ce->lrc.lrca);
> > +	drm_printf(p, "\t\tLRC Head: Internal %u, Memory %u\n",
> > +		   ce->ring->head,
> > +		   ce->lrc_reg_state[CTX_RING_HEAD]);
> > +	drm_printf(p, "\t\tLRC Tail: Internal %u, Memory %u\n",
> > +		   ce->ring->tail,
> > +		   ce->lrc_reg_state[CTX_RING_TAIL]);
> > +	drm_printf(p, "\t\tContext Pin Count: %u\n",
> > +		   atomic_read(&ce->pin_count));
> > +	drm_printf(p, "\t\tGuC ID Ref Count: %u\n",
> > +		   atomic_read(&ce->guc_id.ref));
> > +	drm_printf(p, "\t\tSchedule State: 0x%x\n\n",
> > +		   ce->guc_state.sched_state);
> > +}
> > +
> >   void intel_guc_submission_print_context_info(struct intel_guc *guc,
> >   					     struct drm_printer *p)
> >   {
> > @@ -3682,22 +3702,25 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
> >   	xa_lock_irqsave(&guc->context_lookup, flags);
> >   	xa_for_each(&guc->context_lookup, index, ce) {
> > -		drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id.id);
> > -		drm_printf(p, "\tHW Context Desc: 0x%08x\n", ce->lrc.lrca);
> > -		drm_printf(p, "\t\tLRC Head: Internal %u, Memory %u\n",
> > -			   ce->ring->head,
> > -			   ce->lrc_reg_state[CTX_RING_HEAD]);
> > -		drm_printf(p, "\t\tLRC Tail: Internal %u, Memory %u\n",
> > -			   ce->ring->tail,
> > -			   ce->lrc_reg_state[CTX_RING_TAIL]);
> > -		drm_printf(p, "\t\tContext Pin Count: %u\n",
> > -			   atomic_read(&ce->pin_count));
> > -		drm_printf(p, "\t\tGuC ID Ref Count: %u\n",
> > -			   atomic_read(&ce->guc_id.ref));
> > -		drm_printf(p, "\t\tSchedule State: 0x%x\n\n",
> > -			   ce->guc_state.sched_state);
> > +		GEM_BUG_ON(intel_context_is_child(ce));
> > +		guc_log_context(p, ce);
> >   		guc_log_context_priority(p, ce);
> > +
> > +		if (intel_context_is_parent(ce)) {
> > +			struct guc_process_desc *desc = __get_process_desc(ce);
> > +			struct intel_context *child;
> > +
> > +			drm_printf(p, "\t\tWQI Head: %u\n",
> > +				   READ_ONCE(desc->head));
> > +			drm_printf(p, "\t\tWQI Tail: %u\n",
> > +				   READ_ONCE(desc->tail));
> > +			drm_printf(p, "\t\tWQI Status: %u\n\n",
> > +				   READ_ONCE(desc->wq_status));
> > +
> > +			for_each_child(ce, child)
> > +				guc_log_context(p, child);
> There should be some indication that this is a child context and/or how many
> children there are. Otherwise how does the reader differentiation between
> the list of child contexts and the next parent/single context?
> 

We don't log the priority info or work queue info for child contexts so
it is actually pretty easy to parse. That being said, I'll output the
number of children if the context is a parent.

Matt

> John.
> 
> > +		}
> >   	}
> >   	xa_unlock_irqrestore(&guc->context_lookup, flags);
> >   }
> 
