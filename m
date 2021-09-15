Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5263640CE22
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 22:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6BE6EA2F;
	Wed, 15 Sep 2021 20:38:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DA26EA2E;
 Wed, 15 Sep 2021 20:38:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="307970115"
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; d="scan'208";a="307970115"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 13:38:43 -0700
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; d="scan'208";a="508954914"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 13:38:43 -0700
Date: Wed, 15 Sep 2021 13:33:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tony.ye@intel.com, zhengguo.xu@intel.com
Subject: Re: [Intel-gfx] [PATCH 12/27] drm/i915/guc: Add multi-lrc context
 registration
Message-ID: <20210915203345.GA17178@jons-linux-dev-box>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-13-matthew.brost@intel.com>
 <64a5c154-1a00-820e-2b30-d95af73937d7@intel.com>
 <20210915193115.GA1933@jons-linux-dev-box>
 <1a6800f8-24ac-ebbb-03a5-1121e86e893f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a6800f8-24ac-ebbb-03a5-1121e86e893f@intel.com>
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

On Wed, Sep 15, 2021 at 01:23:19PM -0700, John Harrison wrote:
> On 9/15/2021 12:31, Matthew Brost wrote:
> > On Wed, Sep 15, 2021 at 12:21:35PM -0700, John Harrison wrote:
> > > On 8/20/2021 15:44, Matthew Brost wrote:
> > > > Add multi-lrc context registration H2G. In addition a workqueue and
> > > > process descriptor are setup during multi-lrc context registration as
> > > > these data structures are needed for multi-lrc submission.
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/i915/gt/intel_context_types.h |  12 ++
> > > >    drivers/gpu/drm/i915/gt/intel_lrc.c           |   5 +
> > > >    drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   2 +-
> > > >    .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 109 +++++++++++++++++-
> > > >    4 files changed, 126 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > > > index 0fafc178cf2c..6f567ebeb039 100644
> > > > --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> > > > +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > > > @@ -232,8 +232,20 @@ struct intel_context {
> > > >    		/** @parent: pointer to parent if child */
> > > >    		struct intel_context *parent;
> > > > +
> > > > +		/** @guc_wqi_head: head pointer in work queue */
> > > > +		u16 guc_wqi_head;
> > > > +		/** @guc_wqi_tail: tail pointer in work queue */
> > > > +		u16 guc_wqi_tail;
> > > > +
> > > These should be in the 'guc_state' sub-struct? Would be good to keep all GuC
> > > specific content in one self-contained struct. Especially given the other
> > > child/parent fields are no going to be guc_ prefixed any more.
> > > 
> > Right now I have everything in guc_state protected by guc_state.lock,
> > these fields are not protected by this lock. IMO it is better to use a
> > different sub-structure for the parallel fields (even if anonymous).
> Hmm, I still think it is bad to be scattering back-end specific fields
> amongst regular fields. The GuC patches include a whole bunch of complaints
> about execlist back-end specific stuff leaking through to the higher levels,
> we really shouldn't be guilty of doing the same with GuC if at all possible.
> At the very least, the GuC specific fields should be grouped together at the
> end of the struct rather than inter-mingled.
> 

How 2 different sub-structures - parallel (shared) & guc_parallel (guc specific)?

> > 
> > > >    		/** @guc_number_children: number of children if parent */
> > > >    		u8 guc_number_children;
> > > > +
> > > > +		/**
> > > > +		 * @parent_page: page in context used by parent for work queue,
> > > Maybe 'page in context record'? Otherwise, exactly what 'context' is meant
> > > here? It isn't the 'struct intel_context'. The contetx record is saved as
> > > 'ce->state' / 'ce->lrc_reg_state', yes? Is it possible to link to either of
> > It is the page in ce->state / page minus LRC reg offset in
> > ce->lrg_reg_state. Will update the commit to make that clear.
> > 
> > > those field? Probably not given that they don't appear to have any kerneldoc
> > > description :(. Maybe add that in too :).
> > > 
> > > > +		 * work queue descriptor
> > > Later on, it is described as 'process descriptor and work queue'. It would
> > > be good to be consistent.
> > > 
> > Yep. Will fix.
> > 
> > > > +		 */
> > > > +		u8 parent_page;
> > > >    	};
> > > >    #ifdef CONFIG_DRM_I915_SELFTEST
> > > > diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> > > > index bb4af4977920..0ddbad4e062a 100644
> > > > --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> > > > +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> > > > @@ -861,6 +861,11 @@ __lrc_alloc_state(struct intel_context *ce, struct intel_engine_cs *engine)
> > > >    		context_size += PAGE_SIZE;
> > > >    	}
> > > > +	if (intel_context_is_parent(ce)) {
> > > > +		ce->parent_page = context_size / PAGE_SIZE;
> > > > +		context_size += PAGE_SIZE;
> > > > +	}
> > > > +
> > > >    	obj = i915_gem_object_create_lmem(engine->i915, context_size, 0);
> > > >    	if (IS_ERR(obj))
> > > >    		obj = i915_gem_object_create_shmem(engine->i915, context_size);
> > > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> > > > index fa4be13c8854..0e600a3b8f1e 100644
> > > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> > > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> > > > @@ -52,7 +52,7 @@
> > > >    #define GUC_DOORBELL_INVALID		256
> > > > -#define GUC_WQ_SIZE			(PAGE_SIZE * 2)
> > > > +#define GUC_WQ_SIZE			(PAGE_SIZE / 2)
> > > Is this size actually dictated by the GuC API? Or is it just a driver level
> > > decision? If the latter, shouldn't this be below instead?
> > > 
> > Driver level decision. What exactly do you mean by below?
> The next chunk of the patch - where WQ_OFFSET is defined and the whole
> caboodle is described.
> 
> > > >    /* Work queue item header definitions */
> > > >    #define WQ_STATUS_ACTIVE		1
> > > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > index 14b24298cdd7..dbcb9ab28a9a 100644
> > > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > @@ -340,6 +340,39 @@ static struct i915_priolist *to_priolist(struct rb_node *rb)
> > > >    	return rb_entry(rb, struct i915_priolist, node);
> > > >    }
> > > > +/*
> > > > + * When using multi-lrc submission an extra page in the context state is
> > > > + * reserved for the process descriptor and work queue.
> > > > + *
> > > > + * The layout of this page is below:
> > > > + * 0						guc_process_desc
> > > > + * ...						unused
> > > > + * PAGE_SIZE / 2				work queue start
> > > > + * ...						work queue
> > > > + * PAGE_SIZE - 1				work queue end
> > > > + */
> > > > +#define WQ_OFFSET	(PAGE_SIZE / 2)
> > > Can this not be derived from GUC_WQ_SIZE given that the two are
> > > fundamentally linked? E.g. '#define WQ_OFFSET (PAGE_SIZE - GUC_WQ_SIZE)'?
> > Yes. I like 'define WQ_OFFSET (PAGE_SIZE - GUC_WQ_SIZE)'. Will change.
> > 
> > > And maybe have a '#define WQ_TOTAL_SIZE PAGE_SIZE' and use that in all of
> > > WQ_OFFSET, GUC_WQ_SIZE and the allocation itself in intel_lrc.c?
> > > 
> > > Also, the process descriptor is actually an array of descriptors sized by
> > > the number of children? Or am I misunderstanding the code below? In so,
> > No, it is fixed size descriptor.
> Yeah, I think I was getting confused between pdesc and desc in the code
> below.
> 
> I still think it would be a good idea to have everything explicitly named
> and the only mention of PAGE_SIZE is in the 'total size' definition.
> 

#define PARENT_SCRATCH_SIZE 	PAGE_SIZE?

Matt 

> John.
> 
> 
> > 
> > A later patch in the series uses the space of above the process
> > descriptor for insertation of preeemption points handshake. That does
> > depend on the number of children. I will add a COMPILE_BUG_ON for that
> > to ensure everything fits in the memory layout.
> > 
> > > shouldn't there be a 'COMPILE_BUG_ON((MAX_ENGINE_INSTANCE *
> > > sizeof(descriptor)) < (WQ_DESC_SIZE)' where WQ_DESC_SIZE is WQ_TOTAL_SIZE -
> > > WQ_SIZE?
> > > 
> > > > +static u32 __get_process_desc_offset(struct intel_context *ce)
> > > > +{
> > > > +	GEM_BUG_ON(!ce->parent_page);
> > > > +
> > > > +	return ce->parent_page * PAGE_SIZE;
> > > > +}
> > > > +
> > > > +static u32 __get_wq_offset(struct intel_context *ce)
> > > > +{
> > > > +	return __get_process_desc_offset(ce) + WQ_OFFSET;
> > > > +}
> > > > +
> > > > +static struct guc_process_desc *
> > > > +__get_process_desc(struct intel_context *ce)
> > > > +{
> > > > +	return (struct guc_process_desc *)
> > > > +		(ce->lrc_reg_state +
> > > > +		 ((__get_process_desc_offset(ce) -
> > > > +		   LRC_STATE_OFFSET) / sizeof(u32)));
> > > Where did the LRC_STATE_OFFSET come from? Is that built in to the
> > > lrg_reg_state pointer itself? That needs to be documented somewhere.
> > > 
> > In gt/intel_lrc.c (lrc_pin) ce->lrc_reg_state is assigned to
> > mmap(ce->state) + LRC_STATE_OFFSET. I can update the kerneldoc for that
> > field in this patch.
> > 
> > > > +}
> > > > +
> > > >    static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
> > > >    {
> > > >    	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
> > > > @@ -1342,6 +1375,30 @@ static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
> > > >    	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> > > >    }
> > > > +static int __guc_action_register_multi_lrc(struct intel_guc *guc,
> > > > +					   struct intel_context *ce,
> > > > +					   u32 guc_id,
> > > > +					   u32 offset,
> > > > +					   bool loop)
> > > > +{
> > > > +	struct intel_context *child;
> > > > +	u32 action[4 + MAX_ENGINE_INSTANCE];
> > > > +	int len = 0;
> > > > +
> > > > +	GEM_BUG_ON(ce->guc_number_children > MAX_ENGINE_INSTANCE);
> > > > +
> > > > +	action[len++] = INTEL_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC;
> > > > +	action[len++] = guc_id;
> > > > +	action[len++] = ce->guc_number_children + 1;
> > > > +	action[len++] = offset;
> > > > +	for_each_child(ce, child) {
> > > > +		offset += sizeof(struct guc_lrc_desc);
> > > > +		action[len++] = offset;
> > > > +	}
> > > > +
> > > > +	return guc_submission_send_busy_loop(guc, action, len, 0, loop);
> > > > +}
> > > > +
> > > >    static int __guc_action_register_context(struct intel_guc *guc,
> > > >    					 u32 guc_id,
> > > >    					 u32 offset,
> > > > @@ -1364,9 +1421,15 @@ static int register_context(struct intel_context *ce, bool loop)
> > > >    		ce->guc_id.id * sizeof(struct guc_lrc_desc);
> > > >    	int ret;
> > > > +	GEM_BUG_ON(intel_context_is_child(ce));
> > > >    	trace_intel_context_register(ce);
> > > > -	ret = __guc_action_register_context(guc, ce->guc_id.id, offset, loop);
> > > > +	if (intel_context_is_parent(ce))
> > > > +		ret = __guc_action_register_multi_lrc(guc, ce, ce->guc_id.id,
> > > > +						      offset, loop);
> > > > +	else
> > > > +		ret = __guc_action_register_context(guc, ce->guc_id.id, offset,
> > > > +						    loop);
> > > >    	if (likely(!ret)) {
> > > >    		unsigned long flags;
> > > > @@ -1396,6 +1459,7 @@ static int deregister_context(struct intel_context *ce, u32 guc_id, bool loop)
> > > >    {
> > > >    	struct intel_guc *guc = ce_to_guc(ce);
> > > > +	GEM_BUG_ON(intel_context_is_child(ce));
> > > >    	trace_intel_context_deregister(ce);
> > > >    	return __guc_action_deregister_context(guc, guc_id, loop);
> > > > @@ -1423,6 +1487,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
> > > >    	struct guc_lrc_desc *desc;
> > > >    	bool context_registered;
> > > >    	intel_wakeref_t wakeref;
> > > > +	struct intel_context *child;
> > > >    	int ret = 0;
> > > >    	GEM_BUG_ON(!engine->mask);
> > > > @@ -1448,6 +1513,42 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
> > > >    	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
> > > >    	guc_context_policy_init(engine, desc);
> > > > +	/*
> > > > +	 * Context is a parent, we need to register a process descriptor
> > > > +	 * describing a work queue and register all child contexts.
> > > Technically, this should say 'If the context is a parent'. Or just move it
> > > to be inside the if block.
> > > 
> > I will add the "If the".
> > 
> > > > +	 */
> > > > +	if (intel_context_is_parent(ce)) {
> > > > +		struct guc_process_desc *pdesc;
> > > > +
> > > > +		ce->guc_wqi_tail = 0;
> > > > +		ce->guc_wqi_head = 0;
> > > > +
> > > > +		desc->process_desc = i915_ggtt_offset(ce->state) +
> > > > +			__get_process_desc_offset(ce);
> > > > +		desc->wq_addr = i915_ggtt_offset(ce->state) +
> > > > +			__get_wq_offset(ce);
> > > > +		desc->wq_size = GUC_WQ_SIZE;
> > > > +
> > > > +		pdesc = __get_process_desc(ce);
> > > > +		memset(pdesc, 0, sizeof(*(pdesc)));
> > > > +		pdesc->stage_id = ce->guc_id.id;
> > > > +		pdesc->wq_base_addr = desc->wq_addr;
> > > > +		pdesc->wq_size_bytes = desc->wq_size;
> > > > +		pdesc->priority = GUC_CLIENT_PRIORITY_KMD_NORMAL;
> > > Should this not be inherited from the ce? And same below. Or are we not
> > > using this priority in that way?
> > > 
> > Honestly I don't think this field is used or maybe doesn't even exist
> > anymore. I'll check the GuC code and likely delete this or if it is
> > still present I'll inherited this from the ce.
> > 
> > Matt
> > 
> > > John.
> > > 
> > > > +		pdesc->wq_status = WQ_STATUS_ACTIVE;
> > > > +
> > > > +		for_each_child(ce, child) {
> > > > +			desc = __get_lrc_desc(guc, child->guc_id.id);
> > > > +
> > > > +			desc->engine_class =
> > > > +				engine_class_to_guc_class(engine->class);
> > > > +			desc->hw_context_desc = child->lrc.lrca;
> > > > +			desc->priority = GUC_CLIENT_PRIORITY_KMD_NORMAL;
> > > > +			desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
> > > > +			guc_context_policy_init(engine, desc);
> > > > +		}
> > > > +	}
> > > > +
> > > >    	/*
> > > >    	 * The context_lookup xarray is used to determine if the hardware
> > > >    	 * context is currently registered. There are two cases in which it
> > > > @@ -2858,6 +2959,12 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
> > > >    		return NULL;
> > > >    	}
> > > > +	if (unlikely(intel_context_is_child(ce))) {
> > > > +		drm_err(&guc_to_gt(guc)->i915->drm,
> > > > +			"Context is child, desc_idx %u", desc_idx);
> > > > +		return NULL;
> > > > +	}
> > > > +
> > > >    	return ce;
> > > >    }
> 
