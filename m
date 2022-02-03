Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2494A8A77
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 18:44:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C7B10E86B;
	Thu,  3 Feb 2022 17:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D6F10E11E;
 Thu,  3 Feb 2022 17:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643910237; x=1675446237;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JyPQbN/K0exhN42d7S3sl0vAuCEUHSminju+eIqGHos=;
 b=KXqzFDMezyXbLHlzjUrSOgpSK4FkoWh3UYJ5+FEzoZjBhVxG8gb9MEJi
 zpS7oxkxSiIp51a8phAibB2jwYxttUf24SV6PO6Ypk6tei2l7ffJZJn1l
 +hNIRIoZ4+EUr/5XzQ/6EPUqsXUvnVMj16sg7f6Km/Arid0DT7ScoOfAY
 9M8S4sAeigSVkXLTuepIYm3btg5GLbwzTtdM4tk4uZqPlWgoqc6/EfJXn
 E48tqfx83N0rU1Rs1JL5+Dg1PeLBWEAiThTM2PJ8HJCiHNWnjEXV+wBL2
 Ucu6VE+30J9kUbwuNyumG2giFHt4Lhv4mNAaUZ1dOBzXBFxTuuGxyE3H2 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="228166351"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="228166351"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 09:43:56 -0800
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="631416637"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 09:43:55 -0800
Date: Thu, 3 Feb 2022 09:37:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/i915: Flip guc_id allocation partition
Message-ID: <20220203173755.GA3287@jons-linux-dev-box>
References: <20220113162747.4017-1-matthew.brost@intel.com>
 <42aa9c4d-8a09-d02a-c205-491438a52305@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42aa9c4d-8a09-d02a-c205-491438a52305@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 02, 2022 at 11:15:00PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 13.01.2022 17:27, Matthew Brost wrote:
> > Move the multi-lrc guc_id from the lower allocation partition (0 to
> > number of multi-lrc guc_ids) to upper allocation partition (number of
> > single-lrc to max guc_ids).
> > 
> > This will help when a native driver transitions to a PF after driver
> > load time. If the perma-pin guc_ids (kernel contexts) are in a low range
> > it is easy reduce total number of guc_ids as the allocated slrc are in a
> > valid range the mlrc range moves to an unused range. Assuming no mlrc
> > are allocated and few slrc are used the native to PF transition is
> > seamless for the guc_id resource.
> > 
> > v2:
> >  (Michal / Tvrtko)
> >   - Add an explaination to commit message of why this patch is needed
> >  (Michal / Piotr)
> >   - Replace marcos with functions
> >  (Michal)
> >   - Rework logic flow in new_mlrc_guc_id
> >   - Unconditionally call bitmap_free
> > v3:
> >  (Michal)
> >   - Move allocation of mlrc bitmap back submission init
> >  (CI)
> >   - Resend for CI
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 77 ++++++++++++++-----
> >  1 file changed, 56 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 23a40f10d376d..fce58365b3ff8 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -138,17 +138,6 @@ guc_create_parallel(struct intel_engine_cs **engines,
> >  
> >  #define GUC_REQUEST_SIZE 64 /* bytes */
> >  
> > -/*
> > - * We reserve 1/16 of the guc_ids for multi-lrc as these need to be contiguous
> > - * per the GuC submission interface. A different allocation algorithm is used
> > - * (bitmap vs. ida) between multi-lrc and single-lrc hence the reason to
> > - * partition the guc_id space. We believe the number of multi-lrc contexts in
> > - * use should be low and 1/16 should be sufficient. Minimum of 32 guc_ids for
> > - * multi-lrc.
> > - */
> > -#define NUMBER_MULTI_LRC_GUC_ID(guc)	\
> > -	((guc)->submission_state.num_guc_ids / 16)
> > -
> >  /*
> >   * Below is a set of functions which control the GuC scheduling state which
> >   * require a lock.
> > @@ -1746,6 +1735,7 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
> >  }
> >  
> >  static void destroyed_worker_func(struct work_struct *w);
> > +static int number_mlrc_guc_id(struct intel_guc *guc);
> >  
> >  /*
> >   * Set up the memory resources to be shared with the GuC (via the GGTT)
> > @@ -1778,7 +1768,7 @@ int intel_guc_submission_init(struct intel_guc *guc)
> >  		  destroyed_worker_func);
> >  
> >  	guc->submission_state.guc_ids_bitmap =
> > -		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
> > +		bitmap_zalloc(number_mlrc_guc_id(guc), GFP_KERNEL);
> 
> to fully benefit from the id partition flip we likely will have to
> allocate bitmap 'just-in-time' when first mlrc id is needed
> 

No. At worst over allocate memory and don't use it. At the current
ratio, number_mlrc_guc_id is 4k translates into a 1 page allocation.

> so something like you had in early rev but abandon to avoid alloc inside
> spinlock - but I'm wondering why we can't alloc bitmap for mlrc case,
> while we allow allocation for slrc (as ida_simple_get may alloc, no?
>

That is a good question, more on that below.
 
> >  	if (!guc->submission_state.guc_ids_bitmap)
> >  		return -ENOMEM;
> >  
> > @@ -1864,6 +1854,57 @@ static void guc_submit_request(struct i915_request *rq)
> >  	spin_unlock_irqrestore(&sched_engine->lock, flags);
> >  }
> >  
> > +/*
> > + * We reserve 1/16 of the guc_ids for multi-lrc as these need to be contiguous
> > + * per the GuC submission interface. A different allocation algorithm is used
> > + * (bitmap vs. ida) between multi-lrc and single-lrc hence the reason to
> > + * partition the guc_id space. We believe the number of multi-lrc contexts in
> > + * use should be low and 1/16 should be sufficient.
> 
> do we have any other numbers as guideline ?
> 
> while it is easy assumption that 1/16 from 64K contexts may be
> sufficient, what about 1/16 of 1K contexts ? will that work too ?
> 

Nope, just random split I choose. We might need to change this ratio on
a VF or enforce a minimum of mlrc (e.g. 128). Easy enough to tune as
needed.

> also, do we have to make hard split ? what if there will be no users for
> mlrc but more slrc contexts would be beneficial ? or the opposite ?
>

Hard split manages complexity. Could we cook some dynamic sharing
algorith, sure. Would be it be overly complex and unnecessary, almost
certainly. The only thing I can see changing is the ratio on a VF if
needed.

> > + */
> > +#define MLRC_GUC_ID_RATIO	16
> > +
> > +static int number_mlrc_guc_id(struct intel_guc *guc)
> > +{
> > +	return guc->submission_state.num_guc_ids / MLRC_GUC_ID_RATIO;
> > +}
> > +
> > +static int number_slrc_guc_id(struct intel_guc *guc)
> > +{
> > +	return guc->submission_state.num_guc_ids - number_mlrc_guc_id(guc);
> > +}
> > +
> > +static int mlrc_guc_id_base(struct intel_guc *guc)
> > +{
> > +	return number_slrc_guc_id(guc);
> > +}
> > +
> > +static int new_mlrc_guc_id(struct intel_guc *guc, struct intel_context *ce)
> > +{
> > +	int ret;
> > +
> > +	GEM_BUG_ON(!intel_context_is_parent(ce));
> > +	GEM_BUG_ON(!guc->submission_state.guc_ids_bitmap);
> > +
> > +	ret =  bitmap_find_free_region(guc->submission_state.guc_ids_bitmap,
> > +				       number_mlrc_guc_id(guc),
> > +				       order_base_2(ce->parallel.number_children
> > +						    + 1));
> > +	if (unlikely(ret < 0))
> > +		return ret;
> > +
> > +	return ret + mlrc_guc_id_base(guc);
> > +}
> > +
> > +static int new_slrc_guc_id(struct intel_guc *guc, struct intel_context *ce)
> > +{
> > +	GEM_BUG_ON(intel_context_is_parent(ce));
> > +
> > +	return ida_simple_get(&guc->submission_state.guc_ids,
> > +			      0, number_slrc_guc_id(guc),
> > +			      GFP_KERNEL | __GFP_RETRY_MAYFAIL |
> > +			      __GFP_NOWARN);
> 
> are you sure that these gfp flags are safe for use under spinlock ?
> 

GFP_KERNEL shouldn't be used under a spin lock but this has never blown
up in CI and we used to have tests that allocated every single guc id
which seems odd. Regardless this probably should be changed to
GFP_ATOMIC.

Matt

> -Michal
> 
> > +}
> > +
> >  static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
> >  {
> >  	int ret;
> > @@ -1871,16 +1912,10 @@ static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
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
> >  	if (unlikely(ret < 0))
> >  		return ret;
> >  
