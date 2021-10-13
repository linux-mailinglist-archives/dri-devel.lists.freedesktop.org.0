Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FB442C85B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 20:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F126E0EF;
	Wed, 13 Oct 2021 18:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4059A6E0EF;
 Wed, 13 Oct 2021 18:08:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="226269387"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="226269387"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 11:08:16 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="491581265"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 11:08:15 -0700
Date: Wed, 13 Oct 2021 11:03:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniele.ceraolospurio@intel.com
Subject: Re: [PATCH 10/26] drm/i915/guc: Assign contexts in parent-child
 relationship consecutive guc_ids
Message-ID: <20211013180331.GA13066@jons-linux-dev-box>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-11-matthew.brost@intel.com>
 <63c2eb50-b5e9-5aec-1cf8-0e0b94cb991a@intel.com>
 <20211008012151.GA24680@jons-linux-dev-box>
 <e58f0cb8-0261-1e8d-5b56-5dd69bf070e3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e58f0cb8-0261-1e8d-5b56-5dd69bf070e3@intel.com>
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

On Fri, Oct 08, 2021 at 09:40:43AM -0700, John Harrison wrote:
> On 10/7/2021 18:21, Matthew Brost wrote:
> > On Thu, Oct 07, 2021 at 03:03:04PM -0700, John Harrison wrote:
> > > On 10/4/2021 15:06, Matthew Brost wrote:
> > > > Assign contexts in parent-child relationship consecutive guc_ids. This
> > > > is accomplished by partitioning guc_id space between ones that need to
> > > > be consecutive (1/16 available guc_ids) and ones that do not (15/16 of
> > > > available guc_ids). The consecutive search is implemented via the bitmap
> > > > API.
> > > > 
> > > > This is a precursor to the full GuC multi-lrc implementation but aligns
> > > > to how GuC mutli-lrc interface is defined - guc_ids must be consecutive
> > > > when using the GuC multi-lrc interface.
> > > > 
> > > > v2:
> > > >    (Daniel Vetter)
> > > >     - Explicitly state why we assign consecutive guc_ids
> > > > v3:
> > > >    (John Harrison)
> > > >     - Bring back in spin lock
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   6 +-
> > > >    .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 104 ++++++++++++++----
> > > >    2 files changed, 86 insertions(+), 24 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > > > index 25a598e2b6e8..a9f4ec972bfb 100644
> > > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > > > @@ -76,9 +76,13 @@ struct intel_guc {
> > > >    		 */
> > > >    		spinlock_t lock;
> > > >    		/**
> > > > -		 * @guc_ids: used to allocate new guc_ids
> > > > +		 * @guc_ids: used to allocate new guc_ids, single-lrc
> > > >    		 */
> > > >    		struct ida guc_ids;
> > > > +		/**
> > > > +		 * @guc_ids_bitmap: used to allocate new guc_ids, multi-lrc
> > > > +		 */
> > > > +		unsigned long *guc_ids_bitmap;
> > > >    		/**
> > > >    		 * @guc_id_list: list of intel_context with valid guc_ids but no
> > > >    		 * refs
> > > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > index 1f2809187513..79e7732e83b2 100644
> > > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > @@ -128,6 +128,16 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
> > > >    #define GUC_REQUEST_SIZE 64 /* bytes */
> > > > +/*
> > > > + * We reserve 1/16 of the guc_ids for multi-lrc as these need to be contiguous
> > > > + * per the GuC submission interface. A different allocation algorithm is used
> > > > + * (bitmap vs. ida) between multi-lrc and single-lrc hence the reason to
> > > > + * partition the guc_id space. We believe the number of multi-lrc contexts in
> > > > + * use should be low and 1/16 should be sufficient. Minimum of 32 guc_ids for
> > > > + * multi-lrc.
> > > > + */
> > > > +#define NUMBER_MULTI_LRC_GUC_ID		(GUC_MAX_LRC_DESCRIPTORS / 16)
> > > > +
> > > >    /*
> > > >     * Below is a set of functions which control the GuC scheduling state which
> > > >     * require a lock.
> > > > @@ -1206,6 +1216,11 @@ int intel_guc_submission_init(struct intel_guc *guc)
> > > >    	INIT_WORK(&guc->submission_state.destroyed_worker,
> > > >    		  destroyed_worker_func);
> > > > +	guc->submission_state.guc_ids_bitmap =
> > > > +		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID, GFP_KERNEL);
> > > > +	if (!guc->submission_state.guc_ids_bitmap)
> > > > +		return -ENOMEM;
> > > > +
> > > >    	return 0;
> > > >    }
> > > > @@ -1217,6 +1232,7 @@ void intel_guc_submission_fini(struct intel_guc *guc)
> > > >    	guc_lrc_desc_pool_destroy(guc);
> > > >    	guc_flush_destroyed_contexts(guc);
> > > >    	i915_sched_engine_put(guc->sched_engine);
> > > > +	bitmap_free(guc->submission_state.guc_ids_bitmap);
> > > >    }
> > > >    static inline void queue_request(struct i915_sched_engine *sched_engine,
> > > > @@ -1268,18 +1284,43 @@ static void guc_submit_request(struct i915_request *rq)
> > > >    	spin_unlock_irqrestore(&sched_engine->lock, flags);
> > > >    }
> > > > -static int new_guc_id(struct intel_guc *guc)
> > > > +static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
> > > >    {
> > > > -	return ida_simple_get(&guc->submission_state.guc_ids, 0,
> > > > -			      GUC_MAX_LRC_DESCRIPTORS, GFP_KERNEL |
> > > > -			      __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> > > > +	int ret;
> > > > +
> > > > +	GEM_BUG_ON(intel_context_is_child(ce));
> > > > +
> > > > +	if (intel_context_is_parent(ce))
> > > > +		ret = bitmap_find_free_region(guc->submission_state.guc_ids_bitmap,
> > > > +					      NUMBER_MULTI_LRC_GUC_ID,
> > > > +					      order_base_2(ce->parallel.number_children
> > > > +							   + 1));
> > > > +	else
> > > > +		ret = ida_simple_get(&guc->submission_state.guc_ids,
> > > > +				     NUMBER_MULTI_LRC_GUC_ID,
> > > > +				     GUC_MAX_LRC_DESCRIPTORS,
> > > > +				     GFP_KERNEL | __GFP_RETRY_MAYFAIL |
> > > > +				     __GFP_NOWARN);
> > > > +	if (unlikely(ret < 0))
> > > > +		return ret;
> > > > +
> > > > +	ce->guc_id.id = ret;
> > > > +	return 0;
> > > >    }
> > > >    static void __release_guc_id(struct intel_guc *guc, struct intel_context *ce)
> > > >    {
> > > > +	GEM_BUG_ON(intel_context_is_child(ce));
> > > > +
> > > >    	if (!context_guc_id_invalid(ce)) {
> > > > -		ida_simple_remove(&guc->submission_state.guc_ids,
> > > > -				  ce->guc_id.id);
> > > > +		if (intel_context_is_parent(ce))
> > > > +			bitmap_release_region(guc->submission_state.guc_ids_bitmap,
> > > > +					      ce->guc_id.id,
> > > > +					      order_base_2(ce->parallel.number_children
> > > > +							   + 1));
> > > There was a discussion on the previous revision about adding a BUG_ON to
> > > ensure that number_children cannot change between the bitmap alloc and the
> > > bitmap release. I'm not seeing the new BUG_ON mentioned in this patch.
> > > 
> > I thought you meant to add a BUG_ON to ensure before we release a region
> > / id it is occupied? I looked in both the bitmap API and ida API and
> > neither have a function that checks if region / id is occupied so can't
> > really add a BUG_ON for that.
> > 
> > How much you add BUG_ON to ensure the number of children canoot change
> > between alloc and release? I don't follow how that would work.
> > 
> > Matt
> I was thinking that where number_children is modified, you have a
> BUG_ON(guc_id_is_valid). That would ensure that the release has to match the
> alloc. Hmm, you already have a BUG_ON about the parent/child not being
> pinned in intel_context_bind_parent_child(), which I guess covers it because
> you shouldn't have a guc_id if you aren't pinned, right? And that is the
> only function which can modify number_children, yes? So maybe it's all good?
> 

I think we are all good.

Matt

> John.
> 
> > 
> > > John.
> > > 
> > > 
> > > > +		else
> > > > +			ida_simple_remove(&guc->submission_state.guc_ids,
> > > > +					  ce->guc_id.id);
> > > >    		reset_lrc_desc(guc, ce->guc_id.id);
> > > >    		set_context_guc_id_invalid(ce);
> > > >    	}
> > > > @@ -1296,49 +1337,64 @@ static void release_guc_id(struct intel_guc *guc, struct intel_context *ce)
> > > >    	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> > > >    }
> > > > -static int steal_guc_id(struct intel_guc *guc)
> > > > +static int steal_guc_id(struct intel_guc *guc, struct intel_context *ce)
> > > >    {
> > > > -	struct intel_context *ce;
> > > > -	int guc_id;
> > > > +	struct intel_context *cn;
> > > >    	lockdep_assert_held(&guc->submission_state.lock);
> > > > +	GEM_BUG_ON(intel_context_is_child(ce));
> > > > +	GEM_BUG_ON(intel_context_is_parent(ce));
> > > >    	if (!list_empty(&guc->submission_state.guc_id_list)) {
> > > > -		ce = list_first_entry(&guc->submission_state.guc_id_list,
> > > > +		cn = list_first_entry(&guc->submission_state.guc_id_list,
> > > >    				      struct intel_context,
> > > >    				      guc_id.link);
> > > > -		GEM_BUG_ON(atomic_read(&ce->guc_id.ref));
> > > > -		GEM_BUG_ON(context_guc_id_invalid(ce));
> > > > +		GEM_BUG_ON(atomic_read(&cn->guc_id.ref));
> > > > +		GEM_BUG_ON(context_guc_id_invalid(cn));
> > > > +		GEM_BUG_ON(intel_context_is_child(cn));
> > > > +		GEM_BUG_ON(intel_context_is_parent(cn));
> > > > -		list_del_init(&ce->guc_id.link);
> > > > -		guc_id = ce->guc_id.id;
> > > > +		list_del_init(&cn->guc_id.link);
> > > > +		ce->guc_id = cn->guc_id;
> > > >    		spin_lock(&ce->guc_state.lock);
> > > > -		clr_context_registered(ce);
> > > > +		clr_context_registered(cn);
> > > >    		spin_unlock(&ce->guc_state.lock);
> > > > -		set_context_guc_id_invalid(ce);
> > > > -		return guc_id;
> > > > +		set_context_guc_id_invalid(cn);
> > > > +
> > > > +		return 0;
> > > >    	} else {
> > > >    		return -EAGAIN;
> > > >    	}
> > > >    }
> > > > -static int assign_guc_id(struct intel_guc *guc, u16 *out)
> > > > +static int assign_guc_id(struct intel_guc *guc, struct intel_context *ce)
> > > >    {
> > > >    	int ret;
> > > >    	lockdep_assert_held(&guc->submission_state.lock);
> > > > +	GEM_BUG_ON(intel_context_is_child(ce));
> > > > -	ret = new_guc_id(guc);
> > > > +	ret = new_guc_id(guc, ce);
> > > >    	if (unlikely(ret < 0)) {
> > > > -		ret = steal_guc_id(guc);
> > > > +		if (intel_context_is_parent(ce))
> > > > +			return -ENOSPC;
> > > > +
> > > > +		ret = steal_guc_id(guc, ce);
> > > >    		if (ret < 0)
> > > >    			return ret;
> > > >    	}
> > > > -	*out = ret;
> > > > +	if (intel_context_is_parent(ce)) {
> > > > +		struct intel_context *child;
> > > > +		int i = 1;
> > > > +
> > > > +		for_each_child(ce, child)
> > > > +			child->guc_id.id = ce->guc_id.id + i++;
> > > > +	}
> > > > +
> > > >    	return 0;
> > > >    }
> > > > @@ -1356,7 +1412,7 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
> > > >    	might_lock(&ce->guc_state.lock);
> > > >    	if (context_guc_id_invalid(ce)) {
> > > > -		ret = assign_guc_id(guc, &ce->guc_id.id);
> > > > +		ret = assign_guc_id(guc, ce);
> > > >    		if (ret)
> > > >    			goto out_unlock;
> > > >    		ret = 1;	/* Indidcates newly assigned guc_id */
> > > > @@ -1398,8 +1454,10 @@ static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
> > > >    	unsigned long flags;
> > > >    	GEM_BUG_ON(atomic_read(&ce->guc_id.ref) < 0);
> > > > +	GEM_BUG_ON(intel_context_is_child(ce));
> > > > -	if (unlikely(context_guc_id_invalid(ce)))
> > > > +	if (unlikely(context_guc_id_invalid(ce) ||
> > > > +		     intel_context_is_parent(ce)))
> > > >    		return;
> > > >    	spin_lock_irqsave(&guc->submission_state.lock, flags);
> 
