Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E706F41BA81
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 00:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0526E9BE;
	Tue, 28 Sep 2021 22:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807186E112;
 Tue, 28 Sep 2021 22:38:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="285833748"
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; d="scan'208";a="285833748"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 15:38:45 -0700
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; d="scan'208";a="538587684"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 15:38:45 -0700
Date: Tue, 28 Sep 2021 15:33:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tony.ye@intel.com, zhengguo.xu@intel.com
Subject: Re: [Intel-gfx] [PATCH 23/27] drm/i915/guc: Implement no mid batch
 preemption for multi-lrc
Message-ID: <20210928223353.GA32806@jons-linux-dev-box>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-24-matthew.brost@intel.com>
 <d5b15551-3849-1547-29c7-be593005a7e1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5b15551-3849-1547-29c7-be593005a7e1@intel.com>
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

On Tue, Sep 28, 2021 at 03:20:42PM -0700, John Harrison wrote:
> On 8/20/2021 15:44, Matthew Brost wrote:
> > For some users of multi-lrc, e.g. split frame, it isn't safe to preempt
> > mid BB. To safely enable preemption at the BB boundary, a handshake
> > between to parent and child is needed. This is implemented via custom
> > emit_bb_start & emit_fini_breadcrumb functions and enabled via by
> via by -> by
> 
> > default if a context is configured by set parallel extension.
> I tend to agree with Tvrtko that this should probably be an opt in change.
> Is there a flags word passed in when creating the context?
> 

I don't disagree but the uAPI in this series is where we landed. It has
been acked all by the relevant parties in the RFC, ported to our
internal tree, and the media UMD has been updated / posted. Concerns
with the uAPI should've been raised in the RFC phase, not now. I really
don't feel like changing this uAPI another time.

> Also, it's not just a change in pre-emption behaviour but a change in
> synchronisation too, right? Previously, if you had a whole bunch of back to
> back submissions then one child could run ahead of another and/or the
> parent. After this change, there is a forced regroup at the end of each
> batch. So while one could end sooner/later than the others, they can't ever
> get an entire batch (or more) ahead or behind. Or was that synchronisation
> already in there through other means anyway?
> 

Yes, each parent / child sync at the of each batch - this is the only
way safely insert preemption points. Without this the GuC could attempt
a preemption and hang the batches.

> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_context.c       |   2 +-
> >   drivers/gpu/drm/i915/gt/intel_context_types.h |   3 +
> >   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   2 +-
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 283 +++++++++++++++++-
> >   4 files changed, 287 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> > index 5615be32879c..2de62649e275 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> > @@ -561,7 +561,7 @@ void intel_context_bind_parent_child(struct intel_context *parent,
> >   	GEM_BUG_ON(intel_context_is_child(child));
> >   	GEM_BUG_ON(intel_context_is_parent(child));
> > -	parent->guc_number_children++;
> > +	child->guc_child_index = parent->guc_number_children++;
> >   	list_add_tail(&child->guc_child_link,
> >   		      &parent->guc_child_list);
> >   	child->parent = parent;
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > index 713d85b0b364..727f91e7f7c2 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > @@ -246,6 +246,9 @@ struct intel_context {
> >   		/** @guc_number_children: number of children if parent */
> >   		u8 guc_number_children;
> > +		/** @guc_child_index: index into guc_child_list if child */
> > +		u8 guc_child_index;
> > +
> >   		/**
> >   		 * @parent_page: page in context used by parent for work queue,
> >   		 * work queue descriptor
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> > index 6cd26dc060d1..9f61cfa5566a 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> > @@ -188,7 +188,7 @@ struct guc_process_desc {
> >   	u32 wq_status;
> >   	u32 engine_presence;
> >   	u32 priority;
> > -	u32 reserved[30];
> > +	u32 reserved[36];
> What is this extra space for? All the extra storage is grabbed from after
> the end of this structure, isn't it?
> 

This is the size of process descriptor in the GuC spec. Even though this
is unused space we really don't want the child go / join memory using
anything within the process descriptor.

> >   } __packed;
> >   #define CONTEXT_REGISTRATION_FLAG_KMD	BIT(0)
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 91330525330d..1a18f99bf12a 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -11,6 +11,7 @@
> >   #include "gt/intel_context.h"
> >   #include "gt/intel_engine_pm.h"
> >   #include "gt/intel_engine_heartbeat.h"
> > +#include "gt/intel_gpu_commands.h"
> >   #include "gt/intel_gt.h"
> >   #include "gt/intel_gt_irq.h"
> >   #include "gt/intel_gt_pm.h"
> > @@ -366,10 +367,14 @@ static struct i915_priolist *to_priolist(struct rb_node *rb)
> >   /*
> >    * When using multi-lrc submission an extra page in the context state is
> > - * reserved for the process descriptor and work queue.
> > + * reserved for the process descriptor, work queue, and preempt BB boundary
> > + * handshake between the parent + childlren contexts.
> >    *
> >    * The layout of this page is below:
> >    * 0						guc_process_desc
> > + * + sizeof(struct guc_process_desc)		child go
> > + * + CACHELINE_BYTES				child join ...
> > + * + CACHELINE_BYTES ...
> Would be better written as '[num_children]' instead of '...' to make it
> clear it is a per child array.
>

I think this description is pretty clear.

> Also, maybe create a struct for this to get rid of the magic '+1's and
> 'BYTES / sizeof' constructs in the functions below.
> 

Let me see if I can create a struct that describes the layout.

> >    * ...						unused
> >    * PAGE_SIZE / 2				work queue start
> >    * ...						work queue
> > @@ -1785,6 +1790,30 @@ static int deregister_context(struct intel_context *ce, u32 guc_id, bool loop)
> >   	return __guc_action_deregister_context(guc, guc_id, loop);
> >   }
> > +static inline void clear_children_join_go_memory(struct intel_context *ce)
> > +{
> > +	u32 *mem = (u32 *)(__get_process_desc(ce) + 1);
> > +	u8 i;
> > +
> > +	for (i = 0; i < ce->guc_number_children + 1; ++i)
> > +		mem[i * (CACHELINE_BYTES / sizeof(u32))] = 0;
> > +}
> > +
> > +static inline u32 get_children_go_value(struct intel_context *ce)
> > +{
> > +	u32 *mem = (u32 *)(__get_process_desc(ce) + 1);
> > +
> > +	return mem[0];
> > +}
> > +
> > +static inline u32 get_children_join_value(struct intel_context *ce,
> > +					  u8 child_index)
> > +{
> > +	u32 *mem = (u32 *)(__get_process_desc(ce) + 1);
> > +
> > +	return mem[(child_index + 1) * (CACHELINE_BYTES / sizeof(u32))];
> > +}
> > +
> >   static void guc_context_policy_init(struct intel_engine_cs *engine,
> >   				    struct guc_lrc_desc *desc)
> >   {
> > @@ -1867,6 +1896,8 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
> >   			desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
> >   			guc_context_policy_init(engine, desc);
> >   		}
> > +
> > +		clear_children_join_go_memory(ce);
> >   	}
> >   	/*
> > @@ -2943,6 +2974,31 @@ static const struct intel_context_ops virtual_child_context_ops = {
> >   	.get_sibling = guc_virtual_get_sibling,
> >   };
> > +/*
> > + * The below override of the breadcrumbs is enabled when the user configures a
> > + * context for parallel submission (multi-lrc, parent-child).
> > + *
> > + * The overridden breadcrumbs implements an algorithm which allows the GuC to
> > + * safely preempt all the hw contexts configured for parallel submission
> > + * between each BB. The contract between the i915 and GuC is if the parent
> > + * context can be preempted, all the children can be preempted, and the GuC will
> > + * always try to preempt the parent before the children. A handshake between the
> > + * parent / children breadcrumbs ensures the i915 holds up its end of the deal
> > + * creating a window to preempt between each set of BBs.
> > + */
> > +static int emit_bb_start_parent_no_preempt_mid_batch(struct i915_request *rq,
> > +						     u64 offset, u32 len,
> > +						     const unsigned int flags);
> > +static int emit_bb_start_child_no_preempt_mid_batch(struct i915_request *rq,
> > +						    u64 offset, u32 len,
> > +						    const unsigned int flags);
> > +static u32 *
> > +emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
> > +						 u32 *cs);
> > +static u32 *
> > +emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq,
> > +						u32 *cs);
> > +
> >   static struct intel_context *
> >   guc_create_parallel(struct intel_engine_cs **engines,
> >   		    unsigned int num_siblings,
> > @@ -2978,6 +3034,20 @@ guc_create_parallel(struct intel_engine_cs **engines,
> >   		}
> >   	}
> > +	parent->engine->emit_bb_start =
> > +		emit_bb_start_parent_no_preempt_mid_batch;
> > +	parent->engine->emit_fini_breadcrumb =
> > +		emit_fini_breadcrumb_parent_no_preempt_mid_batch;
> > +	parent->engine->emit_fini_breadcrumb_dw =
> > +		12 + 4 * parent->guc_number_children;
> > +	for_each_child(parent, ce) {
> > +		ce->engine->emit_bb_start =
> > +			emit_bb_start_child_no_preempt_mid_batch;
> > +		ce->engine->emit_fini_breadcrumb =
> > +			emit_fini_breadcrumb_child_no_preempt_mid_batch;
> > +		ce->engine->emit_fini_breadcrumb_dw = 16;
> > +	}
> > +
> >   	kfree(siblings);
> >   	return parent;
> > @@ -3362,6 +3432,204 @@ void intel_guc_submission_init_early(struct intel_guc *guc)
> >   	guc->submission_selected = __guc_submission_selected(guc);
> >   }
> > +static inline u32 get_children_go_addr(struct intel_context *ce)
> > +{
> > +	GEM_BUG_ON(!intel_context_is_parent(ce));
> > +
> > +	return i915_ggtt_offset(ce->state) +
> > +		__get_process_desc_offset(ce) +
> > +		sizeof(struct guc_process_desc);
> > +}
> > +
> > +static inline u32 get_children_join_addr(struct intel_context *ce,
> > +					 u8 child_index)
> > +{
> > +	GEM_BUG_ON(!intel_context_is_parent(ce));
> > +
> > +	return get_children_go_addr(ce) + (child_index + 1) * CACHELINE_BYTES;
> > +}
> > +
> > +#define PARENT_GO_BB			1
> > +#define PARENT_GO_FINI_BREADCRUMB	0
> > +#define CHILD_GO_BB			1
> > +#define CHILD_GO_FINI_BREADCRUMB	0
> > +static int emit_bb_start_parent_no_preempt_mid_batch(struct i915_request *rq,
> > +						     u64 offset, u32 len,
> > +						     const unsigned int flags)
> > +{
> > +	struct intel_context *ce = rq->context;
> > +	u32 *cs;
> > +	u8 i;
> > +
> > +	GEM_BUG_ON(!intel_context_is_parent(ce));
> > +
> > +	cs = intel_ring_begin(rq, 10 + 4 * ce->guc_number_children);
> > +	if (IS_ERR(cs))
> > +		return PTR_ERR(cs);
> > +
> > +	/* Wait on chidlren */
> chidlren -> children
>

Yep.
 
> > +	for (i = 0; i < ce->guc_number_children; ++i) {
> > +		*cs++ = (MI_SEMAPHORE_WAIT |
> > +			 MI_SEMAPHORE_GLOBAL_GTT |
> > +			 MI_SEMAPHORE_POLL |
> > +			 MI_SEMAPHORE_SAD_EQ_SDD);
> > +		*cs++ = PARENT_GO_BB;
> > +		*cs++ = get_children_join_addr(ce, i);
> > +		*cs++ = 0;
> > +	}
> > +
> > +	/* Turn off preemption */
> > +	*cs++ = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > +	*cs++ = MI_NOOP;
> > +
> > +	/* Tell children go */
> > +	cs = gen8_emit_ggtt_write(cs,
> > +				  CHILD_GO_BB,
> > +				  get_children_go_addr(ce),
> > +				  0);
> > +
> > +	/* Jump to batch */
> > +	*cs++ = MI_BATCH_BUFFER_START_GEN8 |
> > +		(flags & I915_DISPATCH_SECURE ? 0 : BIT(8));
> > +	*cs++ = lower_32_bits(offset);
> > +	*cs++ = upper_32_bits(offset);
> > +	*cs++ = MI_NOOP;
> > +
> > +	intel_ring_advance(rq, cs);
> > +
> > +	return 0;
> > +}
> > +
> > +static int emit_bb_start_child_no_preempt_mid_batch(struct i915_request *rq,
> > +						    u64 offset, u32 len,
> > +						    const unsigned int flags)
> > +{
> > +	struct intel_context *ce = rq->context;
> > +	u32 *cs;
> > +
> > +	GEM_BUG_ON(!intel_context_is_child(ce));
> > +
> > +	cs = intel_ring_begin(rq, 12);
> > +	if (IS_ERR(cs))
> > +		return PTR_ERR(cs);
> > +
> > +	/* Signal parent */
> > +	cs = gen8_emit_ggtt_write(cs,
> > +				  PARENT_GO_BB,
> > +				  get_children_join_addr(ce->parent,
> > +							 ce->guc_child_index),
> > +				  0);
> > +
> > +	/* Wait parent on for go */
> parent on -> on parent
>

Yep.
 
> > +	*cs++ = (MI_SEMAPHORE_WAIT |
> > +		 MI_SEMAPHORE_GLOBAL_GTT |
> > +		 MI_SEMAPHORE_POLL |
> > +		 MI_SEMAPHORE_SAD_EQ_SDD);
> > +	*cs++ = CHILD_GO_BB;
> > +	*cs++ = get_children_go_addr(ce->parent);
> > +	*cs++ = 0;
> > +
> > +	/* Turn off preemption */
> > +	*cs++ = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > +
> > +	/* Jump to batch */
> > +	*cs++ = MI_BATCH_BUFFER_START_GEN8 |
> > +		(flags & I915_DISPATCH_SECURE ? 0 : BIT(8));
> > +	*cs++ = lower_32_bits(offset);
> > +	*cs++ = upper_32_bits(offset);
> > +
> > +	intel_ring_advance(rq, cs);
> > +
> > +	return 0;
> > +}
> > +
> > +static u32 *
> > +emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
> > +						 u32 *cs)
> > +{
> > +	struct intel_context *ce = rq->context;
> > +	u8 i;
> > +
> > +	GEM_BUG_ON(!intel_context_is_parent(ce));
> > +
> > +	/* Wait on children */
> > +	for (i = 0; i < ce->guc_number_children; ++i) {
> > +		*cs++ = (MI_SEMAPHORE_WAIT |
> > +			 MI_SEMAPHORE_GLOBAL_GTT |
> > +			 MI_SEMAPHORE_POLL |
> > +			 MI_SEMAPHORE_SAD_EQ_SDD);
> > +		*cs++ = PARENT_GO_FINI_BREADCRUMB;
> > +		*cs++ = get_children_join_addr(ce, i);
> > +		*cs++ = 0;
> > +	}
> > +
> > +	/* Turn on preemption */
> > +	*cs++ = MI_ARB_ON_OFF | MI_ARB_ENABLE;
> > +	*cs++ = MI_NOOP;
> > +
> > +	/* Tell children go */
> > +	cs = gen8_emit_ggtt_write(cs,
> > +				  CHILD_GO_FINI_BREADCRUMB,
> > +				  get_children_go_addr(ce),
> > +				  0);
> > +
> > +	/* Emit fini breadcrumb */
> > +	cs = gen8_emit_ggtt_write(cs,
> > +				  rq->fence.seqno,
> > +				  i915_request_active_timeline(rq)->hwsp_offset,
> > +				  0);
> > +
> > +	/* User interrupt */
> > +	*cs++ = MI_USER_INTERRUPT;
> > +	*cs++ = MI_NOOP;
> > +
> > +	rq->tail = intel_ring_offset(rq, cs);
> > +
> > +	return cs;
> > +}
> > +
> > +static u32 *
> > +emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq, u32 *cs)
> > +{
> > +	struct intel_context *ce = rq->context;
> > +
> > +	GEM_BUG_ON(!intel_context_is_child(ce));
> > +
> > +	/* Turn on preemption */
> > +	*cs++ = MI_ARB_ON_OFF | MI_ARB_ENABLE;
> > +	*cs++ = MI_NOOP;
> > +
> > +	/* Signal parent */
> > +	cs = gen8_emit_ggtt_write(cs,
> > +				  PARENT_GO_FINI_BREADCRUMB,
> > +				  get_children_join_addr(ce->parent,
> > +							 ce->guc_child_index),
> > +				  0);
> > +
> This is backwards compared to the parent?
> 
> Parent: wait on children then enable pre-emption
> Child: enable pre-emption then signal parent
> 
> Makes for a window where the parent is waiting in atomic context for a
> signal from a child that has been pre-empted and might not get to run for
> some time?
>

No, this is correct. The rule is if the parent can be preempted all the
children can be preempted, thus we can't enable preemption on the parent
until all the children have preemption enabled, thus the parent waits
for all the children to join before enabling its preemption.

Matt
 
> John.
> 
> 
> > +	/* Wait parent on for go */
> > +	*cs++ = (MI_SEMAPHORE_WAIT |
> > +		 MI_SEMAPHORE_GLOBAL_GTT |
> > +		 MI_SEMAPHORE_POLL |
> > +		 MI_SEMAPHORE_SAD_EQ_SDD);
> > +	*cs++ = CHILD_GO_FINI_BREADCRUMB;
> > +	*cs++ = get_children_go_addr(ce->parent);
> > +	*cs++ = 0;
> > +
> > +	/* Emit fini breadcrumb */
> > +	cs = gen8_emit_ggtt_write(cs,
> > +				  rq->fence.seqno,
> > +				  i915_request_active_timeline(rq)->hwsp_offset,
> > +				  0);
> > +
> > +	/* User interrupt */
> > +	*cs++ = MI_USER_INTERRUPT;
> > +	*cs++ = MI_NOOP;
> > +
> > +	rq->tail = intel_ring_offset(rq, cs);
> > +
> > +	return cs;
> > +}
> > +
> >   static struct intel_context *
> >   g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
> >   {
> > @@ -3807,6 +4075,19 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
> >   			drm_printf(p, "\t\tWQI Status: %u\n\n",
> >   				   READ_ONCE(desc->wq_status));
> > +			drm_printf(p, "\t\tNumber Children: %u\n\n",
> > +				   ce->guc_number_children);
> > +			if (ce->engine->emit_bb_start ==
> > +			    emit_bb_start_parent_no_preempt_mid_batch) {
> > +				u8 i;
> > +
> > +				drm_printf(p, "\t\tChildren Go: %u\n\n",
> > +					   get_children_go_value(ce));
> > +				for (i = 0; i < ce->guc_number_children; ++i)
> > +					drm_printf(p, "\t\tChildren Join: %u\n",
> > +						   get_children_join_value(ce, i));
> > +			}
> > +
> >   			for_each_child(ce, child)
> >   				guc_log_context(p, child);
> >   		}
> 
