Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 410ED3E4CBB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 21:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A9889C48;
	Mon,  9 Aug 2021 19:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343FF89C48;
 Mon,  9 Aug 2021 19:13:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="194352729"
X-IronPort-AV: E=Sophos;i="5.84,308,1620716400"; d="scan'208";a="194352729"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 12:13:12 -0700
X-IronPort-AV: E=Sophos;i="5.84,308,1620716400"; d="scan'208";a="671022584"
Received: from dut151-iclu.fm.intel.com ([10.105.23.43])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 12:13:12 -0700
Date: Mon, 9 Aug 2021 19:13:11 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 25/46] drm/i915/guc: Update debugfs for GuC multi-lrc
Message-ID: <20210809191311.GA123935@DUT151-ICLU.fm.intel.com>
References: <20210803222943.27686-1-matthew.brost@intel.com>
 <20210803222943.27686-26-matthew.brost@intel.com>
 <YRFZnGNvmHPr6DTL@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRFZnGNvmHPr6DTL@phenom.ffwll.local>
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

On Mon, Aug 09, 2021 at 06:36:44PM +0200, Daniel Vetter wrote:
> On Tue, Aug 03, 2021 at 03:29:22PM -0700, Matthew Brost wrote:
> > Display the workqueue status in debugfs for GuC contexts that are in
> > parent-child relationship.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 56 +++++++++++++------
> >  1 file changed, 39 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 30df1c8db491..44a7582c9aed 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -4527,31 +4527,53 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
> >  		gse_log_submission_info(guc->gse[i], p, i);
> >  }
> >  
> > +static inline void guc_log_context(struct drm_printer *p,
> > +				   struct intel_context *ce)
> > +{
> > +	drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id);
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
> > +		   atomic_read(&ce->guc_id_ref));
> > +	drm_printf(p, "\t\tNumber Requests Not Ready: %u\n",
> > +		   atomic_read(&ce->guc_num_rq_not_ready));
> > +	drm_printf(p, "\t\tSchedule State: 0x%x, 0x%x\n\n",
> > +		   ce->guc_state.sched_state,
> > +		   atomic_read(&ce->guc_sched_state_no_lock));
> 
> It's all debugfs, but I think proper locking even there is good. It at
> least reduces the confusion when the locking scheme is largely
> undocumented. Also given how much we have rcu for everything would be good
> to double-check all pointer dererences are properly protected.
>

Not sure if I 100% follow this but I don't think any of the pointers
dref here are RCU protected. Certainly none of the GuC ones are.

Will double before the next respin though.

> > +}
> > +
> >  void intel_guc_submission_print_context_info(struct intel_guc *guc,
> >  					     struct drm_printer *p)
> >  {
> >  	struct intel_context *ce;
> >  	unsigned long index;
> >  	xa_for_each(&guc->context_lookup, index, ce) {
> 
> xa_for_each doesn't provide any guarantees, so doesn't protect against
> concurrent removeal or anything like that. We need to do better than that.

https://elixir.bootlin.com/linux/latest/source/include/linux/xarray.h#L498
'It is safe to modify the array during the iteration.'

Matt

> -Daniel
> 
> > -		drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id);
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
> > -			   atomic_read(&ce->guc_id_ref));
> > -		drm_printf(p, "\t\tNumber Requests Not Ready: %u\n",
> > -			   atomic_read(&ce->guc_num_rq_not_ready));
> > -		drm_printf(p, "\t\tSchedule State: 0x%x, 0x%x\n\n",
> > -			   ce->guc_state.sched_state,
> > -			   atomic_read(&ce->guc_sched_state_no_lock));
> > +		GEM_BUG_ON(intel_context_is_child(ce));
> >  
> > +		guc_log_context(p, ce);
> >  		guc_log_context_priority(p, ce);
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
> > +		}
> >  	}
> >  }
> >  
> > -- 
> > 2.28.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
