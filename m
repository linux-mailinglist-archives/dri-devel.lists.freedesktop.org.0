Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D12F940CE79
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 23:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5D46EA3A;
	Wed, 15 Sep 2021 21:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414996EA3A;
 Wed, 15 Sep 2021 21:00:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="220547101"
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; d="scan'208";a="220547101"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 14:00:32 -0700
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; d="scan'208";a="700383255"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 14:00:27 -0700
Date: Wed, 15 Sep 2021 13:55:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tony.ye@intel.com, zhengguo.xu@intel.com
Subject: Re: [Intel-gfx] [PATCH 14/27] drm/i915/guc: Assign contexts in
 parent-child relationship consecutive guc_ids
Message-ID: <20210915205528.GA22272@jons-linux-dev-box>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-15-matthew.brost@intel.com>
 <69b3d47e-75a3-b09a-aa52-5ff7113b7f32@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69b3d47e-75a3-b09a-aa52-5ff7113b7f32@intel.com>
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

On Wed, Sep 15, 2021 at 01:04:45PM -0700, John Harrison wrote:
> On 8/20/2021 15:44, Matthew Brost wrote:
> > Assign contexts in parent-child relationship consecutive guc_ids. This
> > is accomplished by partitioning guc_id space between ones that need to
> > be consecutive (1/16 available guc_ids) and ones that do not (15/16 of
> > available guc_ids). The consecutive search is implemented via the bitmap
> > API.
> > 
> > This is a precursor to the full GuC multi-lrc implementation but aligns
> > to how GuC mutli-lrc interface is defined - guc_ids must be consecutive
> > when using the GuC multi-lrc interface.
> > 
> > v2:
> >   (Daniel Vetter)
> >    - Explictly state why we assign consecutive guc_ids
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   6 +-
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 107 +++++++++++++-----
> >   2 files changed, 86 insertions(+), 27 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > index 023953e77553..3f95b1b4f15c 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > @@ -61,9 +61,13 @@ struct intel_guc {
> >   		 */
> >   		spinlock_t lock;
> >   		/**
> > -		 * @guc_ids: used to allocate new guc_ids
> > +		 * @guc_ids: used to allocate new guc_ids, single-lrc
> >   		 */
> >   		struct ida guc_ids;
> > +		/**
> > +		 * @guc_ids_bitmap: used to allocate new guc_ids, multi-lrc
> > +		 */
> > +		unsigned long *guc_ids_bitmap;
> >   		/** @num_guc_ids: number of guc_ids that can be used */
> >   		u32 num_guc_ids;
> >   		/** @max_guc_ids: max number of guc_ids that can be used */
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 00d54bb00bfb..e9dfd43d29a0 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -125,6 +125,18 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
> >   #define GUC_REQUEST_SIZE 64 /* bytes */
> > +/*
> > + * We reserve 1/16 of the guc_ids for multi-lrc as these need to be contiguous
> > + * per the GuC submission interface. A different allocation algorithm is used
> > + * (bitmap vs. ida) between multi-lrc and single-lrc hence the reason to
> The 'hence' clause seems to be attached to the wrong reason. The id space is
> partition because of the contiguous vs random requirements of multi vs
> single LRC, not because a different allocator is used in one partion vs the
> other.
> 

Kinda? The reason I partitioned it because to algorithms are different,
we could a unified space with a single algorithm, right? It was just
easier split the space and use 2 already existing data structures rather
cook up an algorithm in a unified space. There isn't a requirement from
the GuC that the space is partitioned, the only requirement is multi-lrc
IDs are contiguous. All this being said, I think comment is correct.

> > + * partition the guc_id space. We believe the number of multi-lrc contexts in
> > + * use should be low and 1/16 should be sufficient. Minimum of 32 guc_ids for
> > + * multi-lrc.
> > + */
> > +#define NUMBER_MULTI_LRC_GUC_ID(guc) \
> > +	((guc)->submission_state.num_guc_ids / 16 > 32 ? \
> > +	 (guc)->submission_state.num_guc_ids / 16 : 32)
> > +
> >   /*
> >    * Below is a set of functions which control the GuC scheduling state which
> >    * require a lock.
> > @@ -1176,6 +1188,10 @@ int intel_guc_submission_init(struct intel_guc *guc)
> >   	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
> >   	intel_gt_pm_unpark_work_init(&guc->submission_state.destroyed_worker,
> >   				     destroyed_worker_func);
> > +	guc->submission_state.guc_ids_bitmap =
> > +		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
> > +	if (!guc->submission_state.guc_ids_bitmap)
> > +		return -ENOMEM;
> >   	return 0;
> >   }
> > @@ -1188,6 +1204,7 @@ void intel_guc_submission_fini(struct intel_guc *guc)
> >   	guc_lrc_desc_pool_destroy(guc);
> >   	guc_flush_destroyed_contexts(guc);
> >   	i915_sched_engine_put(guc->sched_engine);
> > +	bitmap_free(guc->submission_state.guc_ids_bitmap);
> >   }
> >   static void queue_request(struct i915_sched_engine *sched_engine,
> > @@ -1239,18 +1256,43 @@ static void guc_submit_request(struct i915_request *rq)
> >   	spin_unlock_irqrestore(&sched_engine->lock, flags);
> >   }
> > -static int new_guc_id(struct intel_guc *guc)
> > +static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
> >   {
> > -	return ida_simple_get(&guc->submission_state.guc_ids, 0,
> > -			      guc->submission_state.num_guc_ids, GFP_KERNEL |
> > -			      __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> > +	int ret;
> > +
> > +	GEM_BUG_ON(intel_context_is_child(ce));
> > +
> > +	if (intel_context_is_parent(ce))
> > +		ret = bitmap_find_free_region(guc->submission_state.guc_ids_bitmap,
> > +					      NUMBER_MULTI_LRC_GUC_ID(guc),
> > +					      order_base_2(ce->guc_number_children
> > +							   + 1));
> > +	else
> > +		ret = ida_simple_get(&guc->submission_state.guc_ids,
> > +				     NUMBER_MULTI_LRC_GUC_ID(guc),
> > +				     guc->submission_state.num_guc_ids,
> > +				     GFP_KERNEL | __GFP_RETRY_MAYFAIL |
> > +				     __GFP_NOWARN);
> > +	if (unlikely(ret < 0))
> > +		return ret;
> > +
> > +	ce->guc_id.id = ret;
> > +	return 0;
> >   }
> >   static void __release_guc_id(struct intel_guc *guc, struct intel_context *ce)
> >   {
> > +	GEM_BUG_ON(intel_context_is_child(ce));
> > +
> >   	if (!context_guc_id_invalid(ce)) {
> > -		ida_simple_remove(&guc->submission_state.guc_ids,
> > -				  ce->guc_id.id);
> > +		if (intel_context_is_parent(ce))
> > +			bitmap_release_region(guc->submission_state.guc_ids_bitmap,
> > +					      ce->guc_id.id,
> > +					      order_base_2(ce->guc_number_children
> > +							   + 1));
> Is there any check against adding/removing children when the guc_ids are
> allocated? Presumably it shouldn't ever happen but if it did then the

I don't have any protection for that but adding something like this
isn't bad idea.

> bitmap_release would not match the allocation. Maybe add BUG_ON(ce->guc_id)
> to the parent/child link functions (if it's not there already?).
>

Do you something like below in this function?

GEM_BUG_ON(guc_id_not_is_use());

> > +		else
> > +			ida_simple_remove(&guc->submission_state.guc_ids,
> > +					  ce->guc_id.id);
> >   		reset_lrc_desc(guc, ce->guc_id.id);
> >   		set_context_guc_id_invalid(ce);
> >   	}
> > @@ -1267,49 +1309,60 @@ static void release_guc_id(struct intel_guc *guc, struct intel_context *ce)
> >   	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> >   }
> > -static int steal_guc_id(struct intel_guc *guc)
> > +static int steal_guc_id(struct intel_guc *guc, struct intel_context *ce)
> >   {
> > -	struct intel_context *ce;
> > -	int guc_id;
> > +	struct intel_context *cn;
> Leaving this as 'ce' and calling the input parameter 'ce_in' would have made
> for significantly easier to read diffs!
> 

Yea probably but I think we should change the style to make diff easier
to read.

> >   	lockdep_assert_held(&guc->submission_state.lock);
> > +	GEM_BUG_ON(intel_context_is_child(ce));
> > +	GEM_BUG_ON(intel_context_is_parent(ce));
> >   	if (!list_empty(&guc->submission_state.guc_id_list)) {
> > -		ce = list_first_entry(&guc->submission_state.guc_id_list,
> > +		cn = list_first_entry(&guc->submission_state.guc_id_list,
> >   				      struct intel_context,
> >   				      guc_id.link);
> > -		GEM_BUG_ON(atomic_read(&ce->guc_id.ref));
> > -		GEM_BUG_ON(context_guc_id_invalid(ce));
> > -
> > -		list_del_init(&ce->guc_id.link);
> > -		guc_id = ce->guc_id.id;
> > +		GEM_BUG_ON(atomic_read(&cn->guc_id.ref));
> > +		GEM_BUG_ON(context_guc_id_invalid(cn));
> > +		GEM_BUG_ON(intel_context_is_child(cn));
> > +		GEM_BUG_ON(intel_context_is_parent(cn));
> > -		spin_lock(&ce->guc_state.lock);
> As far as I can tell, the only actual change to this function (beyond
> 'ce_in->id = id' vs 'return id' and adding anti-family asserts) is that this
> spinlock was dropped. However, I'm not seeing any replacement for it or any
> comment about why the spinlock is no longer necessary.
>

Good catch, the lock shouldn't be dropped.

Matt
 
> John.
> 
> 
> > -		clr_context_registered(ce);
> > -		spin_unlock(&ce->guc_state.lock);
> > +		list_del_init(&cn->guc_id.link);
> > +		ce->guc_id = cn->guc_id;
> > +		clr_context_registered(cn);
> > +		set_context_guc_id_invalid(cn);
> > -		set_context_guc_id_invalid(ce);
> > -		return guc_id;
> > +		return 0;
> >   	} else {
> >   		return -EAGAIN;
> >   	}
> >   }
> > -static int assign_guc_id(struct intel_guc *guc, u16 *out)
> > +static int assign_guc_id(struct intel_guc *guc, struct intel_context *ce)
> >   {
> >   	int ret;
> >   	lockdep_assert_held(&guc->submission_state.lock);
> > +	GEM_BUG_ON(intel_context_is_child(ce));
> > -	ret = new_guc_id(guc);
> > +	ret = new_guc_id(guc, ce);
> >   	if (unlikely(ret < 0)) {
> > -		ret = steal_guc_id(guc);
> > +		if (intel_context_is_parent(ce))
> > +			return -ENOSPC;
> > +
> > +		ret = steal_guc_id(guc, ce);
> >   		if (ret < 0)
> >   			return ret;
> >   	}
> > -	*out = ret;
> > +	if (intel_context_is_parent(ce)) {
> > +		struct intel_context *child;
> > +		int i = 1;
> > +
> > +		for_each_child(ce, child)
> > +			child->guc_id.id = ce->guc_id.id + i++;
> > +	}
> > +
> >   	return 0;
> >   }
> > @@ -1327,7 +1380,7 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
> >   	might_lock(&ce->guc_state.lock);
> >   	if (context_guc_id_invalid(ce)) {
> > -		ret = assign_guc_id(guc, &ce->guc_id.id);
> > +		ret = assign_guc_id(guc, ce);
> >   		if (ret)
> >   			goto out_unlock;
> >   		ret = 1;	/* Indidcates newly assigned guc_id */
> > @@ -1369,8 +1422,10 @@ static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
> >   	unsigned long flags;
> >   	GEM_BUG_ON(atomic_read(&ce->guc_id.ref) < 0);
> > +	GEM_BUG_ON(intel_context_is_child(ce));
> > -	if (unlikely(context_guc_id_invalid(ce)))
> > +	if (unlikely(context_guc_id_invalid(ce) ||
> > +		     intel_context_is_parent(ce)))
> >   		return;
> >   	spin_lock_irqsave(&guc->submission_state.lock, flags);
> 
