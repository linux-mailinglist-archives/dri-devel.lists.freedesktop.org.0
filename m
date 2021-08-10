Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC3F3E5674
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 11:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684A589F47;
	Tue, 10 Aug 2021 09:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD89989F47
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 09:12:58 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 i10-20020a05600c354ab029025a0f317abfso1415662wmq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 02:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QTu49I85DFOOn2NlQOEuV6IhfzD9+1ouM55yBAuwyOY=;
 b=gzvxBvATa2c/PQZnlFcLJT3IhdhRNf9JxQuYpYBzH8nWb3bn1MnpRO5fkPK2b7qKO7
 +wgUYXKKSLR3zSEcbl7XYkmiHhCUnq3r+l+3Q+QGScpHBUZGs8pRjUXI1KvUm7vwyDVh
 ilmdLPAps65VjG9ApaKQHak3KZUFYNFQEniT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QTu49I85DFOOn2NlQOEuV6IhfzD9+1ouM55yBAuwyOY=;
 b=FtTMwGa5ByljO2PeQSsJjGRH7rn0oDbt2JWvmB1DMVE7PbNqKvjP5PJ5+0yLUkfJUO
 Xyl58omqygGLyxBS0oKaFjXKQfvjNaBeZvBVrQ2uPUSjAOCQxfjx6RTvGqzxF+lCUSoa
 tOr+Xk/Zq1U8Q9o2U2eNnmlTbtvIETUIsHnLrjbOt1XwmB4XM1Z4j9VhOw7v7Rbejajn
 LvGZJr3QqAupOAOLzJFiY4SVf3OXiwRGZMAr9lDoMF23j/OwjzPkgdFKjTCtWF+vBNAz
 +zx9/ZbLNS/27W6GZMMU0wY9ZA29m5RuTwm8MvT6s/W8kHuCcQO8K/H5+7kyGvkBkfy+
 F16Q==
X-Gm-Message-State: AOAM533Et8OfJlRoZ/LydTDgwi7hVAj5gnoOmayoS8xRgDIX7vLpVvp4
 EFTcrqS726oeePQk5zqCtzE7rg==
X-Google-Smtp-Source: ABdhPJzJUo1V0w9MX7eUa2dASpTBs/djawaYYPCcCrBxYexo+FKzN0sIjrQPL442BTMWM13VdIAASg==
X-Received: by 2002:a7b:c8c6:: with SMTP id f6mr3552687wml.44.1628586777081;
 Tue, 10 Aug 2021 02:12:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t1sm2155101wma.25.2021.08.10.02.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 02:12:56 -0700 (PDT)
Date: Tue, 10 Aug 2021 11:12:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 19/46] drm/i915/guc: Assign contexts in parent-child
 relationship consecutive guc_ids
Message-ID: <YRJDFntWKZ9sjrPz@phenom.ffwll.local>
References: <20210803222943.27686-1-matthew.brost@intel.com>
 <20210803222943.27686-20-matthew.brost@intel.com>
 <YRFKWv6h3FWwEcAH@phenom.ffwll.local>
 <20210809190312.GA123783@DUT151-ICLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809190312.GA123783@DUT151-ICLU.fm.intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Mon, Aug 09, 2021 at 07:03:12PM +0000, Matthew Brost wrote:
> On Mon, Aug 09, 2021 at 05:31:38PM +0200, Daniel Vetter wrote:
> > On Tue, Aug 03, 2021 at 03:29:16PM -0700, Matthew Brost wrote:
> > > Assign contexts in parent-child relationship consecutive guc_ids. This
> > > is accomplished by partitioning guc_id space between ones that need to
> > > be consecutive (1/16 available guc_ids) and ones that do not (15/16 of
> > > available guc_ids). The consecutive search is implemented via the bitmap
> > > API.
> > > 
> > > This is a precursor to the full GuC multi-lrc implementation but aligns
> > > to how GuC mutli-lrc interface is defined - guc_ids must be consecutive
> > > when using the GuC multi-lrc interface.
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/gt/intel_context.h       |   6 +
> > >  drivers/gpu/drm/i915/gt/intel_reset.c         |   3 +-
> > >  drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   7 +-
> > >  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 222 ++++++++++++------
> > >  .../i915/gt/uc/intel_guc_submission_types.h   |  10 +
> > >  5 files changed, 179 insertions(+), 69 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> > > index c208691fc87d..7ce3b3d2edb7 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_context.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> > > @@ -54,6 +54,12 @@ static inline bool intel_context_is_parent(struct intel_context *ce)
> > >  	return !!ce->guc_number_children;
> > >  }
> > >  
> > > +static inline struct intel_context *
> > > +intel_context_to_parent(struct intel_context *ce)
> > > +{
> > > +	return intel_context_is_child(ce) ? ce->parent : ce;
> > > +}
> > > +
> > >  void intel_context_bind_parent_child(struct intel_context *parent,
> > >  				     struct intel_context *child);
> > >  
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> > > index ea763138197f..c3d4baa1b2b8 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> > > @@ -849,6 +849,7 @@ static void reset_finish(struct intel_gt *gt, intel_engine_mask_t awake)
> > >  
> > >  static void nop_submit_request(struct i915_request *request)
> > >  {
> > > +	struct intel_context *ce = intel_context_to_parent(request->context);
> > >  	RQ_TRACE(request, "-EIO\n");
> > >  
> > >  	/*
> > > @@ -857,7 +858,7 @@ static void nop_submit_request(struct i915_request *request)
> > >  	 * this for now.
> > >  	 */
> > >  	if (intel_engine_uses_guc(request->engine))
> > > -		intel_guc_decr_num_rq_not_ready(request->context);
> > > +		intel_guc_decr_num_rq_not_ready(ce);
> > >  
> > >  	request = i915_request_mark_eio(request);
> > >  	if (request) {
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > > index c0c60ccabfa4..30a0f364db8f 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > > @@ -24,6 +24,7 @@ struct __guc_ads_blob;
> > >  
> > >  enum {
> > >  	GUC_SUBMIT_ENGINE_SINGLE_LRC,
> > > +	GUC_SUBMIT_ENGINE_MULTI_LRC,
> > >  	GUC_SUBMIT_ENGINE_MAX
> > >  };
> > >  
> > > @@ -59,8 +60,10 @@ struct intel_guc {
> > >  	struct ida guc_ids;
> > >  	u32 num_guc_ids;
> > >  	u32 max_guc_ids;
> > > -	struct list_head guc_id_list_no_ref;
> > > -	struct list_head guc_id_list_unpinned;
> > > +	unsigned long *guc_ids_bitmap;
> > > +#define MAX_GUC_ID_ORDER	(order_base_2(MAX_ENGINE_INSTANCE + 1))
> > > +	struct list_head guc_id_list_no_ref[MAX_GUC_ID_ORDER + 1];
> > > +	struct list_head guc_id_list_unpinned[MAX_GUC_ID_ORDER + 1];
> > 
> > Random new global lists definitely need kerneldoc about what is on them,
> > how they're linked, what their lifetime rules are and what locks we're
> > holding.
> > 
> > Leaving this all to reviews to figure out, and worse, future readers of
> > your code, is not kind.
> >
> 
> Got it.

I forgot the usual disclaimer: I know that the current code isn't
following this at all. But wee have to start somewhere :-/

> > >  	spinlock_t destroy_lock;	/* protects list / worker */
> > >  	struct list_head destroyed_contexts;
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > index f23dd716723f..afb9b4bb8971 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > @@ -169,6 +169,15 @@ static void clr_guc_ids_exhausted(struct guc_submit_engine *gse)
> > >  	clear_bit(GSE_STATE_GUC_IDS_EXHAUSTED, &gse->flags);
> > >  }
> > >  
> > > +/*
> > > + * We reserve 1/16 of the guc_ids for multi-lrc as these need to be contiguous
> > 
> > I think it'd be good to put down the reason here for why. Is this a
> > requirement of the guc interface, or just an artifact of our current
> > implementation? In the latter case also explain what exactly the
> > contstraint is (but honestly I can't think of much reasons for that)
> 
> Multi-lrc guc_ids need to be sequential between the parent and children
> - this is a requirement of the GuC submission interface. Can explicitly
> state that here.

Ah yes that makes sense to document. That also gives us a very clear hint
what probably the first step to fix any multi-lrc exhaustion issues are:
We need to scan the entire guc_id space for conseutively free spots are.
Not sure xarray has support for that, but I know the guy who wrote it so
the answer is at most a mail away :-)

This also means I'm a lot less worried about potentially walling ourselves
into a corner with multi-lrc guc_id exhaustion. Might be good to note that
in the commit message too.
-Daniel

> 
> Matt
> 
> > -Daniel
> > 
> > > + * and a different allocation algorithm is used (bitmap vs. ida). We believe the
> > > + * number of multi-lrc contexts in use should be low and 1/16 should be
> > > + * sufficient. Minimum of 32 ids for multi-lrc.
> > > + */
> > > +#define NUMBER_MULTI_LRC_GUC_ID(guc) \
> > > +	((guc)->num_guc_ids / 16 > 32 ? (guc)->num_guc_ids / 16 : 32)
> > > +
> > >  /*
> > >   * Below is a set of functions which control the GuC scheduling state which do
> > >   * not require a lock as all state transitions are mutually exclusive. i.e. It
> > > @@ -405,16 +414,10 @@ static inline void decr_context_blocked(struct intel_context *ce)
> > >  	ce->guc_state.sched_state -= SCHED_STATE_BLOCKED;
> > >  }
> > >  
> > > -static inline struct intel_context *
> > > -to_parent(struct intel_context *ce)
> > > -{
> > > -	return intel_context_is_child(ce) ? ce->parent : ce;
> > > -}
> > > -
> > >  static inline struct intel_context *
> > >  request_to_scheduling_context(struct i915_request *rq)
> > >  {
> > > -	return to_parent(rq->context);
> > > +	return intel_context_to_parent(rq->context);
> > >  }
> > >  
> > >  static inline bool context_guc_id_invalid(struct intel_context *ce)
> > > @@ -1436,7 +1439,7 @@ static void destroy_worker_func(struct work_struct *w);
> > >   */
> > >  int intel_guc_submission_init(struct intel_guc *guc)
> > >  {
> > > -	int ret;
> > > +	int ret, i;
> > >  
> > >  	if (guc_submission_initialized(guc))
> > >  		return 0;
> > > @@ -1448,9 +1451,13 @@ int intel_guc_submission_init(struct intel_guc *guc)
> > >  	xa_init_flags(&guc->context_lookup, XA_FLAGS_LOCK_IRQ);
> > >  
> > >  	spin_lock_init(&guc->contexts_lock);
> > > -	INIT_LIST_HEAD(&guc->guc_id_list_no_ref);
> > > -	INIT_LIST_HEAD(&guc->guc_id_list_unpinned);
> > > +	for (i = 0; i < MAX_GUC_ID_ORDER + 1; ++i) {
> > > +		INIT_LIST_HEAD(&guc->guc_id_list_no_ref[i]);
> > > +		INIT_LIST_HEAD(&guc->guc_id_list_unpinned[i]);
> > > +	}
> > >  	ida_init(&guc->guc_ids);
> > > +	guc->guc_ids_bitmap =
> > > +		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
> > >  
> > >  	spin_lock_init(&guc->destroy_lock);
> > >  
> > > @@ -1476,6 +1483,8 @@ void intel_guc_submission_fini(struct intel_guc *guc)
> > >  
> > >  		i915_sched_engine_put(sched_engine);
> > >  	}
> > > +
> > > +	bitmap_free(guc->guc_ids_bitmap);
> > >  }
> > >  
> > >  static inline void queue_request(struct i915_sched_engine *sched_engine,
> > > @@ -1499,11 +1508,13 @@ static inline void queue_request(struct i915_sched_engine *sched_engine,
> > >  static bool too_many_guc_ids_not_ready(struct guc_submit_engine *gse,
> > >  				       struct intel_context *ce)
> > >  {
> > > -	u32 available_guc_ids, guc_ids_consumed;
> > >  	struct intel_guc *guc = gse->sched_engine.private_data;
> > > +	u32 available_guc_ids = intel_context_is_parent(ce) ?
> > > +		NUMBER_MULTI_LRC_GUC_ID(guc) :
> > > +		guc->num_guc_ids - NUMBER_MULTI_LRC_GUC_ID(guc);
> > > +	u32 guc_ids_consumed = atomic_read(&gse->num_guc_ids_not_ready);
> > >  
> > > -	available_guc_ids = guc->num_guc_ids;
> > > -	guc_ids_consumed = atomic_read(&gse->num_guc_ids_not_ready);
> > > +	GEM_BUG_ON(intel_context_is_child(ce));
> > >  
> > >  	if (TOO_MANY_GUC_IDS_NOT_READY(available_guc_ids, guc_ids_consumed)) {
> > >  		set_and_update_guc_ids_exhausted(gse);
> > > @@ -1517,17 +1528,26 @@ static void incr_num_rq_not_ready(struct intel_context *ce)
> > >  {
> > >  	struct guc_submit_engine *gse = ce_to_gse(ce);
> > >  
> > > +	GEM_BUG_ON(intel_context_is_child(ce));
> > > +	GEM_BUG_ON(!intel_context_is_parent(ce) &&
> > > +		   ce->guc_number_children);
> > > +
> > >  	if (!atomic_fetch_add(1, &ce->guc_num_rq_not_ready))
> > > -		atomic_inc(&gse->num_guc_ids_not_ready);
> > > +		atomic_add(ce->guc_number_children + 1,
> > > +			   &gse->num_guc_ids_not_ready);
> > >  }
> > >  
> > >  void intel_guc_decr_num_rq_not_ready(struct intel_context *ce)
> > >  {
> > >  	struct guc_submit_engine *gse = ce_to_gse(ce);
> > >  
> > > +	GEM_BUG_ON(intel_context_is_child(ce));
> > > +
> > >  	if (atomic_fetch_add(-1, &ce->guc_num_rq_not_ready) == 1) {
> > >  		GEM_BUG_ON(!atomic_read(&gse->num_guc_ids_not_ready));
> > > -		atomic_dec(&gse->num_guc_ids_not_ready);
> > > +
> > > +		atomic_sub(ce->guc_number_children + 1,
> > > +			   &gse->num_guc_ids_not_ready);
> > >  	}
> > >  }
> > >  
> > > @@ -1579,20 +1599,42 @@ static void guc_submit_request(struct i915_request *rq)
> > >  
> > >  	spin_unlock_irqrestore(&sched_engine->lock, flags);
> > >  
> > > -	intel_guc_decr_num_rq_not_ready(rq->context);
> > > +	intel_guc_decr_num_rq_not_ready(request_to_scheduling_context(rq));
> > >  }
> > >  
> > > -static int new_guc_id(struct intel_guc *guc)
> > > +static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
> > >  {
> > > -	return ida_simple_get(&guc->guc_ids, 0,
> > > -			      guc->num_guc_ids, GFP_KERNEL |
> > > -			      __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> > > +	int ret;
> > > +
> > > +	GEM_BUG_ON(intel_context_is_child(ce));
> > > +
> > > +	if (intel_context_is_parent(ce))
> > > +		ret = bitmap_find_free_region(guc->guc_ids_bitmap,
> > > +					      NUMBER_MULTI_LRC_GUC_ID(guc),
> > > +					      order_base_2(ce->guc_number_children
> > > +							   + 1));
> > > +	else
> > > +		ret = ida_simple_get(&guc->guc_ids,
> > > +				     NUMBER_MULTI_LRC_GUC_ID(guc),
> > > +				     guc->num_guc_ids, GFP_KERNEL |
> > > +				     __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> > > +	if (unlikely(ret < 0))
> > > +		return ret;
> > > +
> > > +	ce->guc_id = ret;
> > > +	return 0;
> > >  }
> > >  
> > >  static void __release_guc_id(struct intel_guc *guc, struct intel_context *ce)
> > >  {
> > > +	GEM_BUG_ON(intel_context_is_child(ce));
> > >  	if (!context_guc_id_invalid(ce)) {
> > > -		ida_simple_remove(&guc->guc_ids, ce->guc_id);
> > > +		if (intel_context_is_parent(ce))
> > > +			bitmap_release_region(guc->guc_ids_bitmap, ce->guc_id,
> > > +					      order_base_2(ce->guc_number_children
> > > +							   + 1));
> > > +		else
> > > +			ida_simple_remove(&guc->guc_ids, ce->guc_id);
> > >  		clr_lrc_desc_registered(guc, ce->guc_id);
> > >  		set_context_guc_id_invalid(ce);
> > >  	}
> > > @@ -1604,6 +1646,8 @@ static void release_guc_id(struct intel_guc *guc, struct intel_context *ce)
> > >  {
> > >  	unsigned long flags;
> > >  
> > > +	GEM_BUG_ON(intel_context_is_child(ce));
> > > +
> > >  	spin_lock_irqsave(&guc->contexts_lock, flags);
> > >  	__release_guc_id(guc, ce);
> > >  	spin_unlock_irqrestore(&guc->contexts_lock, flags);
> > > @@ -1618,54 +1662,93 @@ static void release_guc_id(struct intel_guc *guc, struct intel_context *ce)
> > >   * schedule disable H2G + a deregister H2G.
> > >   */
> > >  static struct list_head *get_guc_id_list(struct intel_guc *guc,
> > > +					 u8 number_children,
> > >  					 bool unpinned)
> > >  {
> > > +	GEM_BUG_ON(order_base_2(number_children + 1) > MAX_GUC_ID_ORDER);
> > > +
> > >  	if (unpinned)
> > > -		return &guc->guc_id_list_unpinned;
> > > +		return &guc->guc_id_list_unpinned[order_base_2(number_children + 1)];
> > >  	else
> > > -		return &guc->guc_id_list_no_ref;
> > > +		return &guc->guc_id_list_no_ref[order_base_2(number_children + 1)];
> > >  }
> > >  
> > > -static int steal_guc_id(struct intel_guc *guc, bool unpinned)
> > > +static int steal_guc_id(struct intel_guc *guc, struct intel_context *ce,
> > > +			bool unpinned)
> > >  {
> > > -	struct intel_context *ce;
> > > -	int guc_id;
> > > -	struct list_head *guc_id_list = get_guc_id_list(guc, unpinned);
> > > +	struct intel_context *cn;
> > > +	u8 number_children = ce->guc_number_children;
> > >  
> > >  	lockdep_assert_held(&guc->contexts_lock);
> > > +	GEM_BUG_ON(intel_context_is_child(ce));
> > >  
> > > -	if (!list_empty(guc_id_list)) {
> > > -		ce = list_first_entry(guc_id_list,
> > > -				      struct intel_context,
> > > -				      guc_id_link);
> > > +	do {
> > > +		struct list_head *guc_id_list =
> > > +			get_guc_id_list(guc, number_children, unpinned);
> > >  
> > > -		/* Ensure context getting stolen in expected state */
> > > -		GEM_BUG_ON(atomic_read(&ce->guc_id_ref));
> > > -		GEM_BUG_ON(context_guc_id_invalid(ce));
> > > -		GEM_BUG_ON(context_guc_id_stolen(ce));
> > > +		if (!list_empty(guc_id_list)) {
> > > +			u8 cn_o2, ce_o2 =
> > > +				order_base_2(ce->guc_number_children + 1);
> > >  
> > > -		list_del_init(&ce->guc_id_link);
> > > -		guc_id = ce->guc_id;
> > > -		clr_context_registered(ce);
> > > +			cn = list_first_entry(guc_id_list,
> > > +					      struct intel_context,
> > > +					      guc_id_link);
> > > +			cn_o2 = order_base_2(cn->guc_number_children + 1);
> > > +
> > > +			/*
> > > +			 * Corner case where a multi-lrc context steals a guc_id
> > > +			 * from another context that has more guc_id that itself.
> > > +			 */
> > > +			if (cn_o2 != ce_o2) {
> > > +				bitmap_release_region(guc->guc_ids_bitmap,
> > > +						      cn->guc_id,
> > > +						      cn_o2);
> > > +				bitmap_allocate_region(guc->guc_ids_bitmap,
> > > +						       ce->guc_id,
> > > +						       ce_o2);
> > > +			}
> > > +
> > > +			/* Ensure context getting stolen in expected state */
> > > +			GEM_BUG_ON(atomic_read(&cn->guc_id_ref));
> > > +			GEM_BUG_ON(context_guc_id_invalid(cn));
> > > +			GEM_BUG_ON(context_guc_id_stolen(cn));
> > > +			GEM_BUG_ON(ce_to_gse(ce) != ce_to_gse(cn));
> > > +
> > > +			list_del_init(&cn->guc_id_link);
> > > +			ce->guc_id = cn->guc_id;
> > > +
> > > +			/*
> > > +			 * If stealing from the pinned list, defer invalidating
> > > +			 * the guc_id until the retire workqueue processes this
> > > +			 * context.
> > > +			 */
> > > +			clr_context_registered(cn);
> > > +			if (!unpinned) {
> > > +				GEM_BUG_ON(ce_to_gse(cn)->stalled_context);
> > > +				ce_to_gse(cn)->stalled_context =
> > > +					intel_context_get(cn);
> > > +				set_context_guc_id_stolen(cn);
> > > +			} else {
> > > +				set_context_guc_id_invalid(cn);
> > > +			}
> > > +
> > > +			return 0;
> > > +		}
> > >  
> > >  		/*
> > > -		 * If stealing from the pinned list, defer invalidating
> > > -		 * the guc_id until the retire workqueue processes this
> > > -		 * context.
> > > +		 * When using multi-lrc we search the guc_id_lists with the
> > > +		 * least amount of guc_ids required first but will consume a
> > > +		 * block larger of guc_ids if necessary. 2x the children always
> > > +		 * moves you two the next list.
> > >  		 */
> > > -		if (!unpinned) {
> > > -			GEM_BUG_ON(ce_to_gse(ce)->stalled_context);
> > > +		if (!number_children ||
> > > +		    order_base_2(number_children + 1) == MAX_GUC_ID_ORDER)
> > > +			break;
> > >  
> > > -			ce_to_gse(ce)->stalled_context = intel_context_get(ce);
> > > -			set_context_guc_id_stolen(ce);
> > > -		} else {
> > > -			set_context_guc_id_invalid(ce);
> > > -		}
> > > +		number_children *= 2;
> > > +	} while (true);
> > >  
> > > -		return guc_id;
> > > -	} else {
> > > -		return -EAGAIN;
> > > -	}
> > > +	return -EAGAIN;
> > >  }
> > >  
> > >  enum {	/* Return values for pin_guc_id / assign_guc_id */
> > > @@ -1674,17 +1757,18 @@ enum {	/* Return values for pin_guc_id / assign_guc_id */
> > >  	NEW_GUC_ID_ENABLED	= 2,
> > >  };
> > >  
> > > -static int assign_guc_id(struct intel_guc *guc, u16 *out, bool tasklet)
> > > +static int assign_guc_id(struct intel_guc *guc, struct intel_context *ce,
> > > +			 bool tasklet)
> > >  {
> > >  	int ret;
> > >  
> > >  	lockdep_assert_held(&guc->contexts_lock);
> > > +	GEM_BUG_ON(intel_context_is_child(ce));
> > >  
> > > -	ret = new_guc_id(guc);
> > > +	ret = new_guc_id(guc, ce);
> > >  	if (unlikely(ret < 0)) {
> > > -		ret = steal_guc_id(guc, true);
> > > -		if (ret >= 0) {
> > > -			*out = ret;
> > > +		ret = steal_guc_id(guc, ce, true);
> > > +		if (!ret) {
> > >  			ret = NEW_GUC_ID_DISABLED;
> > >  		} else if (ret < 0 && tasklet) {
> > >  			/*
> > > @@ -1692,15 +1776,18 @@ static int assign_guc_id(struct intel_guc *guc, u16 *out, bool tasklet)
> > >  			 * enabled if guc_ids are exhausted and we are submitting
> > >  			 * from the tasklet.
> > >  			 */
> > > -			ret = steal_guc_id(guc, false);
> > > -			if (ret >= 0) {
> > > -				*out = ret;
> > > +			ret = steal_guc_id(guc, ce, false);
> > > +			if (!ret)
> > >  				ret = NEW_GUC_ID_ENABLED;
> > > -			}
> > >  		}
> > > -	} else {
> > > -		*out = ret;
> > > -		ret = SAME_GUC_ID;
> > > +	}
> > > +
> > > +	if (!(ret < 0) && intel_context_is_parent(ce)) {
> > > +		struct intel_context *child;
> > > +		int i = 1;
> > > +
> > > +		for_each_child(ce, child)
> > > +			child->guc_id = ce->guc_id + i++;
> > >  	}
> > >  
> > >  	return ret;
> > > @@ -1713,6 +1800,7 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce,
> > >  	int ret = 0;
> > >  	unsigned long flags, tries = PIN_GUC_ID_TRIES;
> > >  
> > > +	GEM_BUG_ON(intel_context_is_child(ce));
> > >  	GEM_BUG_ON(atomic_read(&ce->guc_id_ref));
> > >  
> > >  try_again:
> > > @@ -1724,7 +1812,7 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce,
> > >  	}
> > >  
> > >  	if (context_guc_id_invalid(ce)) {
> > > -		ret = assign_guc_id(guc, &ce->guc_id, tasklet);
> > > +		ret = assign_guc_id(guc, ce, tasklet);
> > >  		if (unlikely(ret < 0))
> > >  			goto out_unlock;
> > >  	}
> > > @@ -1770,6 +1858,7 @@ static void unpin_guc_id(struct intel_guc *guc,
> > >  	unsigned long flags;
> > >  
> > >  	GEM_BUG_ON(atomic_read(&ce->guc_id_ref) < 0);
> > > +	GEM_BUG_ON(intel_context_is_child(ce));
> > >  
> > >  	if (unlikely(context_guc_id_invalid(ce)))
> > >  		return;
> > > @@ -1781,7 +1870,8 @@ static void unpin_guc_id(struct intel_guc *guc,
> > >  
> > >  	if (!context_guc_id_invalid(ce) && !context_guc_id_stolen(ce) &&
> > >  	    !atomic_read(&ce->guc_id_ref)) {
> > > -		struct list_head *head = get_guc_id_list(guc, unpinned);
> > > +		struct list_head *head =
> > > +			get_guc_id_list(guc, ce->guc_number_children, unpinned);
> > >  
> > >  		list_add_tail(&ce->guc_id_link, head);
> > >  	}
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission_types.h
> > > index 7069b7248f55..a5933e07bdd2 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission_types.h
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission_types.h
> > > @@ -22,6 +22,16 @@ struct guc_virtual_engine {
> > >  /*
> > >   * Object which encapsulates the globally operated on i915_sched_engine +
> > >   * the GuC submission state machine described in intel_guc_submission.c.
> > > + *
> > > + * Currently we have two instances of these per GuC. One for single-lrc and one
> > > + * for multi-lrc submission. We split these into two submission engines as they
> > > + * can operate in parallel allowing a blocking condition on one not to affect
> > > + * the other. i.e. guc_ids are statically allocated between these two submission
> > > + * modes. One mode may have guc_ids exhausted which requires blocking while the
> > > + * other has plenty of guc_ids and can make forward progres.
> > > + *
> > > + * In the future if different submission use cases arise we can simply
> > > + * instantiate another of these objects and assign it to the context.
> > >   */
> > >  struct guc_submit_engine {
> > >  	struct i915_sched_engine sched_engine;
> > > -- 
> > > 2.28.0
> > > 
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
