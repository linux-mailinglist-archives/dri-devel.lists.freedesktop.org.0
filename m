Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6784F48DB40
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 17:06:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6AB10E370;
	Thu, 13 Jan 2022 16:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9159B10E37E;
 Thu, 13 Jan 2022 16:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642090004; x=1673626004;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MDr4qMoE9KKSoouThOsy1BkG7lx1Pes49/KvnBn9xbI=;
 b=Dn1NmNKEDL7Nm6Tevgqhdb7ZtwfPL+FyK9UqB/c6kSZpeaFNhfnlOahl
 kmb0TSg4Vtvsi+emnJUVbEQInFMOIroln6jTsbzgIShOwpPsz23MnZ7xT
 jzS46PfmsSVcwXJr6hM16gu5ULIFGz8O1/rHIvuhHsTr3wa+cdkgi2Rrx
 k3QHY9Ciz/iFFb4WAnRBcuJ7Sfd0s/7UQyCZcWbUIPvRX4AZn4e9zvP24
 iO2kh23fqK/tHM8k7ft/9NhthN/JifFRHsyUu3IajcGv0bNba4al72oHx
 BlRu968LXi/lEZAGtUypIcQYz7GXfN5N4I9kKSNNxzq9FgNjplypkC/Kc w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="241600544"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="241600544"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 08:06:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="613993247"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 08:06:22 -0800
Date: Thu, 13 Jan 2022 08:00:32 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/i915: Flip guc_id allocation partition
Message-ID: <20220113160032.GA8594@jons-linux-dev-box>
References: <20220111163019.13694-1-matthew.brost@intel.com>
 <37083d2f-e572-4c78-41ba-a1693e9e84f8@intel.com>
 <20220112232629.GA19134@jons-linux-dev-box>
 <2e7b4c82-222c-6ec2-8e58-d2981bb97cb6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e7b4c82-222c-6ec2-8e58-d2981bb97cb6@intel.com>
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

On Thu, Jan 13, 2022 at 03:18:14PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 13.01.2022 00:26, Matthew Brost wrote:
> > On Thu, Jan 13, 2022 at 12:21:17AM +0100, Michal Wajdeczko wrote:
> >> On 11.01.2022 17:30, Matthew Brost wrote:
> 
> ...
> 
> >>> @@ -1863,6 +1861,33 @@ static void guc_submit_request(struct i915_request *rq)
> >>>  	spin_unlock_irqrestore(&sched_engine->lock, flags);
> >>>  }
> >>>  
> >>> +static int new_mlrc_guc_id(struct intel_guc *guc, struct intel_context *ce)
> >>> +{
> >>> +	int ret;
> >>> +
> >>> +	GEM_BUG_ON(!intel_context_is_parent(ce));
> >>> +	GEM_BUG_ON(!guc->submission_state.guc_ids_bitmap);
> >>> +
> >>> +	ret =  bitmap_find_free_region(guc->submission_state.guc_ids_bitmap,
> >>> +				       NUMBER_MULTI_LRC_GUC_ID(guc),
> >>> +				       order_base_2(ce->parallel.number_children
> >>> +						    + 1));
> >>
> >> btw, is there any requirement (GuC ABI ?) that allocated ids need
> >> to be allocated with power of 2 alignment ? I don't think that we
> >> must optimize that hard and in some cases waste extra ids (as we might
> >> be limited on some configs)
> >>
> > 
> > No pow2 requirement in GuC ABI, bitmaps only work on pow2 alignment and
> > didn't optmize this.
> >
> 
> there is a slower variant of "find" function:
> 
> bitmap_find_next_zero_area - find a contiguous aligned zero area
> 
> that does not have this limitation
> 

Ah, wasn't aware of this. If this becomes an issue (running of multi-lrc
ids) for customers I suppose this is the first thing we can do to try to
address this. For now, I think we leave it as is.

> ..
> 
> 
> >>> @@ -1989,6 +2008,14 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
> >>>  
> >>>  	GEM_BUG_ON(atomic_read(&ce->guc_id.ref));
> >>>  
> >>> +	if (unlikely(intel_context_is_parent(ce) &&
> >>> +		     !guc->submission_state.guc_ids_bitmap)) {
> >>> +		guc->submission_state.guc_ids_bitmap =
> >>> +			bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
> >>> +		if (!guc->submission_state.guc_ids_bitmap)
> >>> +			return -ENOMEM;
> >>> +	}
> >>
> >> maybe move this chunk to new_mlrc_guc_id() ?
> >> or we can't due to the spin_lock below ?
> >> but then how do you protect guc_ids_bitmap pointer itself ?
> >>
> > 
> > Can't use GFP_KERNEL inside a spin lock...
> > 
> 
> ok, but what if there will be two or more parallel calls to pin_guc_id()
> with all being first parent context? each will see NULL guc_ids_bitmap..
> or there is another layer of synchronization?
> 

Good catch. Yes, it techincally possible two multi-lrc contexts to try
to allocate at the same time. I guess I should just do this at driver
load time + allocate the maximum number of multi-lrc ids and possibly
waste a bit of memory on a PF or VF.

Matt

> -Michal
