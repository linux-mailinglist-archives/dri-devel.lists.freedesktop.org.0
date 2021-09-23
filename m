Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4206A41558F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 04:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5081B6ECA8;
	Thu, 23 Sep 2021 02:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32676ECA7;
 Thu, 23 Sep 2021 02:49:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10115"; a="203905889"
X-IronPort-AV: E=Sophos;i="5.85,315,1624345200"; d="scan'208";a="203905889"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 19:49:49 -0700
X-IronPort-AV: E=Sophos;i="5.85,315,1624345200"; d="scan'208";a="435658387"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 19:49:48 -0700
Date: Wed, 22 Sep 2021 19:44:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tony.ye@intel.com, zhengguo.xu@intel.com
Subject: Re: [Intel-gfx] [PATCH 15/27] drm/i915/guc: Implement multi-lrc
 submission
Message-ID: <20210923024453.GA14314@jons-linux-dev-box>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-16-matthew.brost@intel.com>
 <c840bf5b-c5e9-872d-e04f-2dfe1852e555@intel.com>
 <20210922162555.GA4456@jons-linux-dev-box>
 <a493356d-9676-e864-bd3b-38d9a1eb498a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a493356d-9676-e864-bd3b-38d9a1eb498a@intel.com>
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

On Wed, Sep 22, 2021 at 01:15:46PM -0700, John Harrison wrote:
> On 9/22/2021 09:25, Matthew Brost wrote:
> > On Mon, Sep 20, 2021 at 02:48:52PM -0700, John Harrison wrote:
> > > On 8/20/2021 15:44, Matthew Brost wrote:
> > > > Implement multi-lrc submission via a single workqueue entry and single
> > > > H2G. The workqueue entry contains an updated tail value for each
> > > > request, of all the contexts in the multi-lrc submission, and updates
> > > > these values simultaneously. As such, the tasklet and bypass path have
> > > > been updated to coalesce requests into a single submission.
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  21 ++
> > > >    drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   8 +
> > > >    drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  24 +-
> > > >    drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   6 +-
> > > >    .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 312 +++++++++++++++---
> > > >    drivers/gpu/drm/i915/i915_request.h           |   8 +
> > > >    6 files changed, 317 insertions(+), 62 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> > > > index fbfcae727d7f..879aef662b2e 100644
> > > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> > > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> > > > @@ -748,3 +748,24 @@ void intel_guc_load_status(struct intel_guc *guc, struct drm_printer *p)
> > > >    		}
> > > >    	}
> > > >    }
> > > > +
> > > > +void intel_guc_write_barrier(struct intel_guc *guc)
> > > > +{
> > > > +	struct intel_gt *gt = guc_to_gt(guc);
> > > > +
> > > > +	if (i915_gem_object_is_lmem(guc->ct.vma->obj)) {
> > > > +		GEM_BUG_ON(guc->send_regs.fw_domains);
> > > Granted, this patch is just moving code from one file to another not
> > > changing it. However, I think it would be worth adding a blank line in here.
> > > Otherwise the 'this register' comment below can be confusingly read as
> > > referring to the send_regs.fw_domain entry above.
> > > 
> > > And maybe add a comment why it is a bug for the send_regs value to be set?
> > > I'm not seeing any obvious connection between it and the reset of this code.
> > > 
> > Can add a blank line. I think the GEM_BUG_ON relates to being able to
> > use intel_uncore_write_fw vs intel_uncore_write. Can add comment.
> > 
> > > > +		/*
> > > > +		 * This register is used by the i915 and GuC for MMIO based
> > > > +		 * communication. Once we are in this code CTBs are the only
> > > > +		 * method the i915 uses to communicate with the GuC so it is
> > > > +		 * safe to write to this register (a value of 0 is NOP for MMIO
> > > > +		 * communication). If we ever start mixing CTBs and MMIOs a new
> > > > +		 * register will have to be chosen.
> > > > +		 */
> > > > +		intel_uncore_write_fw(gt->uncore, GEN11_SOFT_SCRATCH(0), 0);
> > > > +	} else {
> > > > +		/* wmb() sufficient for a barrier if in smem */
> > > > +		wmb();
> > > > +	}
> > > > +}
> > > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > > > index 3f95b1b4f15c..0ead2406d03c 100644
> > > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > > > @@ -37,6 +37,12 @@ struct intel_guc {
> > > >    	/* Global engine used to submit requests to GuC */
> > > >    	struct i915_sched_engine *sched_engine;
> > > >    	struct i915_request *stalled_request;
> > > > +	enum {
> > > > +		STALL_NONE,
> > > > +		STALL_REGISTER_CONTEXT,
> > > > +		STALL_MOVE_LRC_TAIL,
> > > > +		STALL_ADD_REQUEST,
> > > > +	} submission_stall_reason;
> > > >    	/* intel_guc_recv interrupt related state */
> > > >    	spinlock_t irq_lock;
> > > > @@ -332,4 +338,6 @@ void intel_guc_submission_cancel_requests(struct intel_guc *guc);
> > > >    void intel_guc_load_status(struct intel_guc *guc, struct drm_printer *p);
> > > > +void intel_guc_write_barrier(struct intel_guc *guc);
> > > > +
> > > >    #endif
> > > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > > > index 20c710a74498..10d1878d2826 100644
> > > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > > > @@ -377,28 +377,6 @@ static u32 ct_get_next_fence(struct intel_guc_ct *ct)
> > > >    	return ++ct->requests.last_fence;
> > > >    }
> > > > -static void write_barrier(struct intel_guc_ct *ct)
> > > > -{
> > > > -	struct intel_guc *guc = ct_to_guc(ct);
> > > > -	struct intel_gt *gt = guc_to_gt(guc);
> > > > -
> > > > -	if (i915_gem_object_is_lmem(guc->ct.vma->obj)) {
> > > > -		GEM_BUG_ON(guc->send_regs.fw_domains);
> > > > -		/*
> > > > -		 * This register is used by the i915 and GuC for MMIO based
> > > > -		 * communication. Once we are in this code CTBs are the only
> > > > -		 * method the i915 uses to communicate with the GuC so it is
> > > > -		 * safe to write to this register (a value of 0 is NOP for MMIO
> > > > -		 * communication). If we ever start mixing CTBs and MMIOs a new
> > > > -		 * register will have to be chosen.
> > > > -		 */
> > > > -		intel_uncore_write_fw(gt->uncore, GEN11_SOFT_SCRATCH(0), 0);
> > > > -	} else {
> > > > -		/* wmb() sufficient for a barrier if in smem */
> > > > -		wmb();
> > > > -	}
> > > > -}
> > > > -
> > > >    static int ct_write(struct intel_guc_ct *ct,
> > > >    		    const u32 *action,
> > > >    		    u32 len /* in dwords */,
> > > > @@ -468,7 +446,7 @@ static int ct_write(struct intel_guc_ct *ct,
> > > >    	 * make sure H2G buffer update and LRC tail update (if this triggering a
> > > >    	 * submission) are visible before updating the descriptor tail
> > > >    	 */
> > > > -	write_barrier(ct);
> > > > +	intel_guc_write_barrier(ct_to_guc(ct));
> > > >    	/* update local copies */
> > > >    	ctb->tail = tail;
> > > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> > > > index 0e600a3b8f1e..6cd26dc060d1 100644
> > > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> > > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> > > > @@ -65,12 +65,14 @@
> > > >    #define   WQ_TYPE_PSEUDO		(0x2 << WQ_TYPE_SHIFT)
> > > >    #define   WQ_TYPE_INORDER		(0x3 << WQ_TYPE_SHIFT)
> > > >    #define   WQ_TYPE_NOOP			(0x4 << WQ_TYPE_SHIFT)
> > > > -#define WQ_TARGET_SHIFT			10
> > > > +#define   WQ_TYPE_MULTI_LRC		(0x5 << WQ_TYPE_SHIFT)
> > > > +#define WQ_TARGET_SHIFT			8
> > > >    #define WQ_LEN_SHIFT			16
> > > >    #define WQ_NO_WCFLUSH_WAIT		(1 << 27)
> > > >    #define WQ_PRESENT_WORKLOAD		(1 << 28)
> > > > -#define WQ_RING_TAIL_SHIFT		20
> > > > +#define WQ_GUC_ID_SHIFT			0
> > > > +#define WQ_RING_TAIL_SHIFT		18
> > > Presumably all of these API changes are not actually new? They really came
> > > in with the reset of the v40 re-write? It's just that this is the first time
> > > we are using them and therefore need to finally update the defines?
> > > 
> > Yes.
> > 
> > > >    #define WQ_RING_TAIL_MAX		0x7FF	/* 2^11 QWords */
> > > >    #define WQ_RING_TAIL_MASK		(WQ_RING_TAIL_MAX << WQ_RING_TAIL_SHIFT)
> > > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > index e9dfd43d29a0..b107ad095248 100644
> > > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > @@ -391,6 +391,29 @@ __get_process_desc(struct intel_context *ce)
> > > >    		   LRC_STATE_OFFSET) / sizeof(u32)));
> > > >    }
> > > > +static u32 *get_wq_pointer(struct guc_process_desc *desc,
> > > > +			   struct intel_context *ce,
> > > > +			   u32 wqi_size)
> > > > +{
> > > > +	/*
> > > > +	 * Check for space in work queue. Caching a value of head pointer in
> > > > +	 * intel_context structure in order reduce the number accesses to shared
> > > > +	 * GPU memory which may be across a PCIe bus.
> > > > +	 */
> > > > +#define AVAILABLE_SPACE	\
> > > > +	CIRC_SPACE(ce->guc_wqi_tail, ce->guc_wqi_head, GUC_WQ_SIZE)
> > > > +	if (wqi_size > AVAILABLE_SPACE) {
> > > > +		ce->guc_wqi_head = READ_ONCE(desc->head);
> > > > +
> > > > +		if (wqi_size > AVAILABLE_SPACE)
> > > > +			return NULL;
> > > > +	}
> > > > +#undef AVAILABLE_SPACE
> > > > +
> > > > +	return ((u32 *)__get_process_desc(ce)) +
> > > > +		((WQ_OFFSET + ce->guc_wqi_tail) / sizeof(u32));
> > > > +}
> > > > +
> > > >    static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
> > > >    {
> > > >    	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
> > > > @@ -547,10 +570,10 @@ int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout)
> > > >    static int guc_lrc_desc_pin(struct intel_context *ce, bool loop);
> > > > -static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
> > > > +static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
> > > >    {
> > > >    	int err = 0;
> > > > -	struct intel_context *ce = rq->context;
> > > > +	struct intel_context *ce = request_to_scheduling_context(rq);
> > > >    	u32 action[3];
> > > >    	int len = 0;
> > > >    	u32 g2h_len_dw = 0;
> > > > @@ -571,26 +594,17 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
> > > >    	GEM_BUG_ON(!atomic_read(&ce->guc_id.ref));
> > > >    	GEM_BUG_ON(context_guc_id_invalid(ce));
> > > > -	/*
> > > > -	 * Corner case where the GuC firmware was blown away and reloaded while
> > > > -	 * this context was pinned.
> > > > -	 */
> > > > -	if (unlikely(!lrc_desc_registered(guc, ce->guc_id.id))) {
> > > > -		err = guc_lrc_desc_pin(ce, false);
> > > > -		if (unlikely(err))
> > > > -			return err;
> > > > -	}
> > > > -
> > > >    	spin_lock(&ce->guc_state.lock);
> > > >    	/*
> > > >    	 * The request / context will be run on the hardware when scheduling
> > > > -	 * gets enabled in the unblock.
> > > > +	 * gets enabled in the unblock. For multi-lrc we still submit the
> > > > +	 * context to move the LRC tails.
> > > >    	 */
> > > > -	if (unlikely(context_blocked(ce)))
> > > > +	if (unlikely(context_blocked(ce) && !intel_context_is_parent(ce)))
> > > >    		goto out;
> > > > -	enabled = context_enabled(ce);
> > > > +	enabled = context_enabled(ce) || context_blocked(ce);
> > > Would be better to say '|| is_parent(ce)' rather than blocked? The reason
> > > for reason for claiming enabled when not is because it's a multi-LRC parent,
> > > right? Or can there be a parent that is neither enabled nor blocked for
> > > which we don't want to do the processing? But why would that make sense/be
> > > possible?
> > > 
> > No. If it is parent and blocked we want to submit the enable but not
> > enable submission. In the non-multi-lrc case the submit has already been
> > done by the i915 (moving lrc tail).
> > 
> > > >    	if (!enabled) {
> > > >    		action[len++] = INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
> > > > @@ -609,6 +623,18 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
> > > >    		trace_intel_context_sched_enable(ce);
> > > >    		atomic_inc(&guc->outstanding_submission_g2h);
> > > >    		set_context_enabled(ce);
> > > > +
> > > > +		/*
> > > > +		 * Without multi-lrc KMD does the submission step (moving the
> > > > +		 * lrc tail) so enabling scheduling is sufficient to submit the
> > > > +		 * context. This isn't the case in multi-lrc submission as the
> > > > +		 * GuC needs to move the tails, hence the need for another H2G
> > > > +		 * to submit a multi-lrc context after enabling scheduling.
> > > > +		 */
> > > > +		if (intel_context_is_parent(ce)) {
> > > > +			action[0] = INTEL_GUC_ACTION_SCHED_CONTEXT;
> > > > +			err = intel_guc_send_nb(guc, action, len - 1, 0);
> > > > +		}
> > > >    	} else if (!enabled) {
> > > >    		clr_context_pending_enable(ce);
> > > >    		intel_context_put(ce);
> > > > @@ -621,6 +647,18 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
> > > >    	return err;
> > > >    }
> > > > +static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
> > > > +{
> > > > +	int ret = __guc_add_request(guc, rq);
> > > > +
> > > > +	if (unlikely(ret == -EBUSY)) {
> > > > +		guc->stalled_request= rq;
> > > > +		guc->submission_stall_reason = STALL_ADD_REQUEST;
> > > > +	}
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > >    static void guc_set_lrc_tail(struct i915_request *rq)
> > > >    {
> > > >    	rq->context->lrc_reg_state[CTX_RING_TAIL] =
> > > > @@ -632,6 +670,127 @@ static int rq_prio(const struct i915_request *rq)
> > > >    	return rq->sched.attr.priority;
> > > >    }
> > > > +static bool is_multi_lrc_rq(struct i915_request *rq)
> > > > +{
> > > > +	return intel_context_is_child(rq->context) ||
> > > > +		intel_context_is_parent(rq->context);
> > > > +}
> > > > +
> > > > +static bool can_merge_rq(struct i915_request *rq,
> > > > +			 struct i915_request *last)
> > > > +{
> > > > +	return request_to_scheduling_context(rq) ==
> > > > +		request_to_scheduling_context(last);
> > > > +}
> > > > +
> > > > +static u32 wq_space_until_wrap(struct intel_context *ce)
> > > > +{
> > > > +	return (GUC_WQ_SIZE - ce->guc_wqi_tail);
> > > > +}
> > > > +
> > > > +static void write_wqi(struct guc_process_desc *desc,
> > > > +		      struct intel_context *ce,
> > > > +		      u32 wqi_size)
> > > > +{
> > > > +	/*
> > > > +	 * Ensure WQE are visible before updating tail
> > > WQE or WQI?
> > > 
> > WQI (work queue instance) is the convention used but I actually like WQE
> > (work queue entry) better. Will change the name to WQE everywhere.
> I thought it was Work Queue Item. Which is basically the same as entry.
> Ether works but simpler just to change this one instance to WQI. And maybe
> make sure the abbreviation is actually written out in full somewhere to be
> clear? I think patch #12 is adding these fields to the ce, maybe update the
> comments to explain what wqi means.
> 

I think in the GuC spec it is 'work queue item', guess I'll stick with that.

Matt

> John.
> 
> > > > +	 */
> > > > +	intel_guc_write_barrier(ce_to_guc(ce));
> > > > +
> > > > +	ce->guc_wqi_tail = (ce->guc_wqi_tail + wqi_size) & (GUC_WQ_SIZE - 1);
> > > > +	WRITE_ONCE(desc->tail, ce->guc_wqi_tail);
> > > > +}
> > > > +
> > > > +static int guc_wq_noop_append(struct intel_context *ce)
> > > > +{
> > > > +	struct guc_process_desc *desc = __get_process_desc(ce);
> > > > +	u32 *wqi = get_wq_pointer(desc, ce, wq_space_until_wrap(ce));
> > > > +
> > > > +	if (!wqi)
> > > > +		return -EBUSY;
> > > > +
> > > > +	*wqi = WQ_TYPE_NOOP |
> > > > +		((wq_space_until_wrap(ce) / sizeof(u32) - 1) << WQ_LEN_SHIFT);
> > > This should have a BUG_ON check that the requested size fits within the
> > > WQ_LEN field?
> > > 
> > I could add that.
> > > Indeed, would be better to use the FIELD macros as they do that kind of
> > > thing for you.
> > > 
> > Yes, they do. I forget how they work, will figure this out and use the
> > macros.
> > > > +	ce->guc_wqi_tail = 0;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int __guc_wq_item_append(struct i915_request *rq)
> > > > +{
> > > > +	struct intel_context *ce = request_to_scheduling_context(rq);
> > > > +	struct intel_context *child;
> > > > +	struct guc_process_desc *desc = __get_process_desc(ce);
> > > > +	unsigned int wqi_size = (ce->guc_number_children + 4) *
> > > > +		sizeof(u32);
> > > > +	u32 *wqi;
> > > > +	int ret;
> > > > +
> > > > +	/* Ensure context is in correct state updating work queue */
> > > > +	GEM_BUG_ON(!atomic_read(&ce->guc_id.ref));
> > > > +	GEM_BUG_ON(context_guc_id_invalid(ce));
> > > > +	GEM_BUG_ON(context_wait_for_deregister_to_register(ce));
> > > > +	GEM_BUG_ON(!lrc_desc_registered(ce_to_guc(ce), ce->guc_id.id));
> > > > +
> > > > +	/* Insert NOOP if this work queue item will wrap the tail pointer. */
> > > > +	if (wqi_size > wq_space_until_wrap(ce)) {
> > > > +		ret = guc_wq_noop_append(ce);
> > > > +		if (ret)
> > > > +			return ret;
> > > > +	}
> > > > +
> > > > +	wqi = get_wq_pointer(desc, ce, wqi_size);
> > > > +	if (!wqi)
> > > > +		return -EBUSY;
> > > > +
> > > > +	*wqi++ = WQ_TYPE_MULTI_LRC |
> > > > +		((wqi_size / sizeof(u32) - 1) << WQ_LEN_SHIFT);
> > > > +	*wqi++ = ce->lrc.lrca;
> > > > +	*wqi++ = (ce->guc_id.id << WQ_GUC_ID_SHIFT) |
> > > > +		 ((ce->ring->tail / sizeof(u64)) << WQ_RING_TAIL_SHIFT);
> > > As above, would be better to use FIELD macros instead of manual shifting.
> > > 
> > Will do.
> > 
> > Matt
> > 
> > > John.
> > > 
> > > 
> > > > +	*wqi++ = 0;	/* fence_id */
> > > > +	for_each_child(ce, child)
> > > > +		*wqi++ = child->ring->tail / sizeof(u64);
> > > > +
> > > > +	write_wqi(desc, ce, wqi_size);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int guc_wq_item_append(struct intel_guc *guc,
> > > > +			      struct i915_request *rq)
> > > > +{
> > > > +	struct intel_context *ce = request_to_scheduling_context(rq);
> > > > +	int ret = 0;
> > > > +
> > > > +	if (likely(!intel_context_is_banned(ce))) {
> > > > +		ret = __guc_wq_item_append(rq);
> > > > +
> > > > +		if (unlikely(ret == -EBUSY)) {
> > > > +			guc->stalled_request = rq;
> > > > +			guc->submission_stall_reason = STALL_MOVE_LRC_TAIL;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static bool multi_lrc_submit(struct i915_request *rq)
> > > > +{
> > > > +	struct intel_context *ce = request_to_scheduling_context(rq);
> > > > +
> > > > +	intel_ring_set_tail(rq->ring, rq->tail);
> > > > +
> > > > +	/*
> > > > +	 * We expect the front end (execbuf IOCTL) to set this flag on the last
> > > > +	 * request generated from a multi-BB submission. This indicates to the
> > > > +	 * backend (GuC interface) that we should submit this context thus
> > > > +	 * submitting all the requests generated in parallel.
> > > > +	 */
> > > > +	return test_bit(I915_FENCE_FLAG_SUBMIT_PARALLEL, &rq->fence.flags) ||
> > > > +		intel_context_is_banned(ce);
> > > > +}
> > > > +
> > > >    static int guc_dequeue_one_context(struct intel_guc *guc)
> > > >    {
> > > >    	struct i915_sched_engine * const sched_engine = guc->sched_engine;
> > > > @@ -645,7 +804,17 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
> > > >    	if (guc->stalled_request) {
> > > >    		submit = true;
> > > >    		last = guc->stalled_request;
> > > > -		goto resubmit;
> > > > +
> > > > +		switch (guc->submission_stall_reason) {
> > > > +		case STALL_REGISTER_CONTEXT:
> > > > +			goto register_context;
> > > > +		case STALL_MOVE_LRC_TAIL:
> > > > +			goto move_lrc_tail;
> > > > +		case STALL_ADD_REQUEST:
> > > > +			goto add_request;
> > > > +		default:
> > > > +			MISSING_CASE(guc->submission_stall_reason);
> > > > +		}
> > > >    	}
> > > >    	while ((rb = rb_first_cached(&sched_engine->queue))) {
> > > > @@ -653,8 +822,8 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
> > > >    		struct i915_request *rq, *rn;
> > > >    		priolist_for_each_request_consume(rq, rn, p) {
> > > > -			if (last && rq->context != last->context)
> > > > -				goto done;
> > > > +			if (last && !can_merge_rq(rq, last))
> > > > +				goto register_context;
> > > >    			list_del_init(&rq->sched.link);
> > > > @@ -662,33 +831,84 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
> > > >    			trace_i915_request_in(rq, 0);
> > > >    			last = rq;
> > > > -			submit = true;
> > > > +
> > > > +			if (is_multi_lrc_rq(rq)) {
> > > > +				/*
> > > > +				 * We need to coalesce all multi-lrc requests in
> > > > +				 * a relationship into a single H2G. We are
> > > > +				 * guaranteed that all of these requests will be
> > > > +				 * submitted sequentially.
> > > > +				 */
> > > > +				if (multi_lrc_submit(rq)) {
> > > > +					submit = true;
> > > > +					goto register_context;
> > > > +				}
> > > > +			} else {
> > > > +				submit = true;
> > > > +			}
> > > >    		}
> > > >    		rb_erase_cached(&p->node, &sched_engine->queue);
> > > >    		i915_priolist_free(p);
> > > >    	}
> > > > -done:
> > > > +
> > > > +register_context:
> > > >    	if (submit) {
> > > > -		guc_set_lrc_tail(last);
> > > > -resubmit:
> > > > +		struct intel_context *ce = request_to_scheduling_context(last);
> > > > +
> > > > +		if (unlikely(!lrc_desc_registered(guc, ce->guc_id.id) &&
> > > > +			     !intel_context_is_banned(ce))) {
> > > > +			ret = guc_lrc_desc_pin(ce, false);
> > > > +			if (unlikely(ret == -EPIPE)) {
> > > > +				goto deadlk;
> > > > +			} else if (ret == -EBUSY) {
> > > > +				guc->stalled_request = last;
> > > > +				guc->submission_stall_reason =
> > > > +					STALL_REGISTER_CONTEXT;
> > > > +				goto schedule_tasklet;
> > > > +			} else if (ret != 0) {
> > > > +				GEM_WARN_ON(ret);	/* Unexpected */
> > > > +				goto deadlk;
> > > > +			}
> > > > +		}
> > > > +
> > > > +move_lrc_tail:
> > > > +		if (is_multi_lrc_rq(last)) {
> > > > +			ret = guc_wq_item_append(guc, last);
> > > > +			if (ret == -EBUSY) {
> > > > +				goto schedule_tasklet;
> > > > +			} else if (ret != 0) {
> > > > +				GEM_WARN_ON(ret);	/* Unexpected */
> > > > +				goto deadlk;
> > > > +			}
> > > > +		} else {
> > > > +			guc_set_lrc_tail(last);
> > > > +		}
> > > > +
> > > > +add_request:
> > > >    		ret = guc_add_request(guc, last);
> > > > -		if (unlikely(ret == -EPIPE))
> > > > +		if (unlikely(ret == -EPIPE)) {
> > > > +			goto deadlk;
> > > > +		} else if (ret == -EBUSY) {
> > > > +			goto schedule_tasklet;
> > > > +		} else if (ret != 0) {
> > > > +			GEM_WARN_ON(ret);	/* Unexpected */
> > > >    			goto deadlk;
> > > > -		else if (ret == -EBUSY) {
> > > > -			tasklet_schedule(&sched_engine->tasklet);
> > > > -			guc->stalled_request = last;
> > > > -			return false;
> > > >    		}
> > > >    	}
> > > >    	guc->stalled_request = NULL;
> > > > +	guc->submission_stall_reason = STALL_NONE;
> > > >    	return submit;
> > > >    deadlk:
> > > >    	sched_engine->tasklet.callback = NULL;
> > > >    	tasklet_disable_nosync(&sched_engine->tasklet);
> > > >    	return false;
> > > > +
> > > > +schedule_tasklet:
> > > > +	tasklet_schedule(&sched_engine->tasklet);
> > > > +	return false;
> > > >    }
> > > >    static void guc_submission_tasklet(struct tasklet_struct *t)
> > > > @@ -1227,10 +1447,16 @@ static int guc_bypass_tasklet_submit(struct intel_guc *guc,
> > > >    	trace_i915_request_in(rq, 0);
> > > > -	guc_set_lrc_tail(rq);
> > > > -	ret = guc_add_request(guc, rq);
> > > > -	if (ret == -EBUSY)
> > > > -		guc->stalled_request = rq;
> > > > +	if (is_multi_lrc_rq(rq)) {
> > > > +		if (multi_lrc_submit(rq)) {
> > > > +			ret = guc_wq_item_append(guc, rq);
> > > > +			if (!ret)
> > > > +				ret = guc_add_request(guc, rq);
> > > > +		}
> > > > +	} else {
> > > > +		guc_set_lrc_tail(rq);
> > > > +		ret = guc_add_request(guc, rq);
> > > > +	}
> > > >    	if (unlikely(ret == -EPIPE))
> > > >    		disable_submission(guc);
> > > > @@ -1238,6 +1464,16 @@ static int guc_bypass_tasklet_submit(struct intel_guc *guc,
> > > >    	return ret;
> > > >    }
> > > > +bool need_tasklet(struct intel_guc *guc, struct i915_request *rq)
> > > > +{
> > > > +	struct i915_sched_engine *sched_engine = rq->engine->sched_engine;
> > > > +	struct intel_context *ce = request_to_scheduling_context(rq);
> > > > +
> > > > +	return submission_disabled(guc) || guc->stalled_request ||
> > > > +		!i915_sched_engine_is_empty(sched_engine) ||
> > > > +		!lrc_desc_registered(guc, ce->guc_id.id);
> > > > +}
> > > > +
> > > >    static void guc_submit_request(struct i915_request *rq)
> > > >    {
> > > >    	struct i915_sched_engine *sched_engine = rq->engine->sched_engine;
> > > > @@ -1247,8 +1483,7 @@ static void guc_submit_request(struct i915_request *rq)
> > > >    	/* Will be called from irq-context when using foreign fences. */
> > > >    	spin_lock_irqsave(&sched_engine->lock, flags);
> > > > -	if (submission_disabled(guc) || guc->stalled_request ||
> > > > -	    !i915_sched_engine_is_empty(sched_engine))
> > > > +	if (need_tasklet(guc, rq))
> > > >    		queue_request(sched_engine, rq, rq_prio(rq));
> > > >    	else if (guc_bypass_tasklet_submit(guc, rq) == -EBUSY)
> > > >    		tasklet_hi_schedule(&sched_engine->tasklet);
> > > > @@ -2241,9 +2476,10 @@ static bool new_guc_prio_higher(u8 old_guc_prio, u8 new_guc_prio)
> > > >    static void add_to_context(struct i915_request *rq)
> > > >    {
> > > > -	struct intel_context *ce = rq->context;
> > > > +	struct intel_context *ce = request_to_scheduling_context(rq);
> > > >    	u8 new_guc_prio = map_i915_prio_to_guc_prio(rq_prio(rq));
> > > > +	GEM_BUG_ON(intel_context_is_child(ce));
> > > >    	GEM_BUG_ON(rq->guc_prio == GUC_PRIO_FINI);
> > > >    	spin_lock(&ce->guc_state.lock);
> > > > @@ -2276,7 +2512,9 @@ static void guc_prio_fini(struct i915_request *rq, struct intel_context *ce)
> > > >    static void remove_from_context(struct i915_request *rq)
> > > >    {
> > > > -	struct intel_context *ce = rq->context;
> > > > +	struct intel_context *ce = request_to_scheduling_context(rq);
> > > > +
> > > > +	GEM_BUG_ON(intel_context_is_child(ce));
> > > >    	spin_lock_irq(&ce->guc_state.lock);
> > > > @@ -2692,7 +2930,7 @@ static void guc_init_breadcrumbs(struct intel_engine_cs *engine)
> > > >    static void guc_bump_inflight_request_prio(struct i915_request *rq,
> > > >    					   int prio)
> > > >    {
> > > > -	struct intel_context *ce = rq->context;
> > > > +	struct intel_context *ce = request_to_scheduling_context(rq);
> > > >    	u8 new_guc_prio = map_i915_prio_to_guc_prio(prio);
> > > >    	/* Short circuit function */
> > > > @@ -2715,7 +2953,7 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
> > > >    static void guc_retire_inflight_request_prio(struct i915_request *rq)
> > > >    {
> > > > -	struct intel_context *ce = rq->context;
> > > > +	struct intel_context *ce = request_to_scheduling_context(rq);
> > > >    	spin_lock(&ce->guc_state.lock);
> > > >    	guc_prio_fini(rq, ce);
> > > > diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
> > > > index 177eaf55adff..8f0073e19079 100644
> > > > --- a/drivers/gpu/drm/i915/i915_request.h
> > > > +++ b/drivers/gpu/drm/i915/i915_request.h
> > > > @@ -139,6 +139,14 @@ enum {
> > > >    	 * the GPU. Here we track such boost requests on a per-request basis.
> > > >    	 */
> > > >    	I915_FENCE_FLAG_BOOST,
> > > > +
> > > > +	/*
> > > > +	 * I915_FENCE_FLAG_SUBMIT_PARALLEL - request with a context in a
> > > > +	 * parent-child relationship (parallel submission, multi-lrc) should
> > > > +	 * trigger a submission to the GuC rather than just moving the context
> > > > +	 * tail.
> > > > +	 */
> > > > +	I915_FENCE_FLAG_SUBMIT_PARALLEL,
> > > >    };
> > > >    /**
> 
