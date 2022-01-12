Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2047F48CF21
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 00:32:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14C610E66C;
	Wed, 12 Jan 2022 23:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1F610E66C;
 Wed, 12 Jan 2022 23:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642030342; x=1673566342;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=B5z0Q0gLzwWsjBfeo/HFjoo8ms9MAs9vVXGpTZd7dsc=;
 b=byMyzDHWkC9RdgAE7riS1pUdsjf+BnAgMejqHgDAafUCUkSASQcR3MrA
 1rQNAlmY7zLY30du8l5ZOgHxLjFFCfkpIc8OYYtC25oq+fI/fLRfSp1aS
 F1XT4qdwMPtkv5qQcxTsradGaE9HWc6/adP01X0XfdsO8LSi5jOVXxZrE
 IDoCiRAov28a2UftrmZZuLlPoPNHi74ruVr/KVxepWGRrF4OlBOLHSXLH
 ATmFZznMgDbvbiUg1pg6VXcwFOucTB3rxbdLUyI4BztdguNgVX3VNYlaG
 KRv7BK9ggMCHtyCyEh/QBlejuLTIrmwJDfkrpcXydmz7NuGL49G1Q4uSZ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="243830392"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="243830392"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 15:32:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="490924374"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 15:32:21 -0800
Date: Wed, 12 Jan 2022 15:26:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/i915: Flip guc_id allocation partition
Message-ID: <20220112232629.GA19134@jons-linux-dev-box>
References: <20220111163019.13694-1-matthew.brost@intel.com>
 <37083d2f-e572-4c78-41ba-a1693e9e84f8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37083d2f-e572-4c78-41ba-a1693e9e84f8@intel.com>
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
 john.c.harrison@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 13, 2022 at 12:21:17AM +0100, Michal Wajdeczko wrote:
> 
> 
> On 11.01.2022 17:30, Matthew Brost wrote:
> > Move the multi-lrc guc_id from the lower allocation partition (0 to
> > number of multi-lrc guc_ids) to upper allocation partition (number of
> > single-lrc to max guc_ids).
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 57 ++++++++++++++-----
> >  1 file changed, 42 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 9989d121127df..1bacc9621cea8 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -147,6 +147,8 @@ guc_create_parallel(struct intel_engine_cs **engines,
> >   */
> >  #define NUMBER_MULTI_LRC_GUC_ID(guc)	\
> >  	((guc)->submission_state.num_guc_ids / 16)
> > +#define NUMBER_SINGLE_LRC_GUC_ID(guc)	\
> > +	((guc)->submission_state.num_guc_ids - NUMBER_MULTI_LRC_GUC_ID(guc))
> 
> above two will likely look better if converted into inline functions, or
> even better if we explicitly store slrc/mlrc upper/lower id limits under
> guc submission state
> 

Definitely inline functions, or I guess variables work too but that
might be overkill. Let me play around with this and see how it looks.

> >  
> >  /*
> >   * Below is a set of functions which control the GuC scheduling state which
> > @@ -1776,11 +1778,6 @@ int intel_guc_submission_init(struct intel_guc *guc)
> >  	INIT_WORK(&guc->submission_state.destroyed_worker,
> >  		  destroyed_worker_func);
> >  
> > -	guc->submission_state.guc_ids_bitmap =
> > -		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
> > -	if (!guc->submission_state.guc_ids_bitmap)
> > -		return -ENOMEM;
> > -
> >  	spin_lock_init(&guc->timestamp.lock);
> >  	INIT_DELAYED_WORK(&guc->timestamp.work, guc_timestamp_ping);
> >  	guc->timestamp.ping_delay = (POLL_TIME_CLKS / gt->clock_frequency + 1) * HZ;
> > @@ -1796,7 +1793,8 @@ void intel_guc_submission_fini(struct intel_guc *guc)
> >  	guc_flush_destroyed_contexts(guc);
> >  	guc_lrc_desc_pool_destroy(guc);
> >  	i915_sched_engine_put(guc->sched_engine);
> > -	bitmap_free(guc->submission_state.guc_ids_bitmap);
> > +	if (guc->submission_state.guc_ids_bitmap)
> > +		bitmap_free(guc->submission_state.guc_ids_bitmap);
> 
> it should be fine to pass NULL to bitmap_free, no?
>

Probably? I'll double check on this.
 
> >  }
> >  
> >  static inline void queue_request(struct i915_sched_engine *sched_engine,
> > @@ -1863,6 +1861,33 @@ static void guc_submit_request(struct i915_request *rq)
> >  	spin_unlock_irqrestore(&sched_engine->lock, flags);
> >  }
> >  
> > +static int new_mlrc_guc_id(struct intel_guc *guc, struct intel_context *ce)
> > +{
> > +	int ret;
> > +
> > +	GEM_BUG_ON(!intel_context_is_parent(ce));
> > +	GEM_BUG_ON(!guc->submission_state.guc_ids_bitmap);
> > +
> > +	ret =  bitmap_find_free_region(guc->submission_state.guc_ids_bitmap,
> > +				       NUMBER_MULTI_LRC_GUC_ID(guc),
> > +				       order_base_2(ce->parallel.number_children
> > +						    + 1));
> 
> btw, is there any requirement (GuC ABI ?) that allocated ids need
> to be allocated with power of 2 alignment ? I don't think that we
> must optimize that hard and in some cases waste extra ids (as we might
> be limited on some configs)
> 

No pow2 requirement in GuC ABI, bitmaps only work on pow2 alignment and
didn't optmize this.

> > +	if (likely(!(ret < 0)))
> > +		ret += NUMBER_SINGLE_LRC_GUC_ID(guc);
> 
> nit: more readable would be
> 
> 	if (unlikely(ret < 0))
> 		return ret;
> 
> 	return ret + guc->submission_state.mlrc_base;
> 

Sure.

> > +
> > +	return ret;
> > +}
> > +
> > +static int new_slrc_guc_id(struct intel_guc *guc, struct intel_context *ce)
> > +{
> > +	GEM_BUG_ON(intel_context_is_parent(ce));
> 
> do we really need ce here ?
>

Just for the GEM_BUG_ON... Can remove if it is a big deal.

> > +
> > +	return ida_simple_get(&guc->submission_state.guc_ids,
> > +			      0, NUMBER_SINGLE_LRC_GUC_ID(guc),
> 
> if we change the logic of NUMBER_SINGLE/MULTI_LRC_GUC_ID macros from
> static split into more dynamic, then we could likely implement lazy
> increase of available slrc/mlrc id limits on demand, within available
> range, without deciding upfront of the hardcoded split 15 : 1
> 
> but this can be done next time ;)
>

Yea I guess. Doubt we need anything beyond a static split tho.
 
> > +			      GFP_KERNEL | __GFP_RETRY_MAYFAIL |
> > +			      __GFP_NOWARN);
> > +}
> > +
> >  static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
> >  {
> >  	int ret;
> > @@ -1870,16 +1895,10 @@ static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
> >  	GEM_BUG_ON(intel_context_is_child(ce));
> >  
> >  	if (intel_context_is_parent(ce))
> > -		ret = bitmap_find_free_region(guc->submission_state.guc_ids_bitmap,
> > -					      NUMBER_MULTI_LRC_GUC_ID(guc),
> > -					      order_base_2(ce->parallel.number_children
> > -							   + 1));
> > +		ret = new_mlrc_guc_id(guc, ce);
> >  	else
> > -		ret = ida_simple_get(&guc->submission_state.guc_ids,
> > -				     NUMBER_MULTI_LRC_GUC_ID(guc),
> > -				     guc->submission_state.num_guc_ids,
> > -				     GFP_KERNEL | __GFP_RETRY_MAYFAIL |
> > -				     __GFP_NOWARN);
> > +		ret = new_slrc_guc_id(guc, ce);
> > +
> 
> with above helpers introduced, shouldn't we move code from new_guc_id()
> to assign_guc_id() ?
> 

Why add inline to code to assign_guc_id?

> >  	if (unlikely(ret < 0))
> >  		return ret;
> >  
> > @@ -1989,6 +2008,14 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
> >  
> >  	GEM_BUG_ON(atomic_read(&ce->guc_id.ref));
> >  
> > +	if (unlikely(intel_context_is_parent(ce) &&
> > +		     !guc->submission_state.guc_ids_bitmap)) {
> > +		guc->submission_state.guc_ids_bitmap =
> > +			bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
> > +		if (!guc->submission_state.guc_ids_bitmap)
> > +			return -ENOMEM;
> > +	}
> 
> maybe move this chunk to new_mlrc_guc_id() ?
> or we can't due to the spin_lock below ?
> but then how do you protect guc_ids_bitmap pointer itself ?
> 

Can't use GFP_KERNEL inside a spin lock...

Matt

> -Michal
> 
> > +
> >  try_again:
> >  	spin_lock_irqsave(&guc->submission_state.lock, flags);
> >  
