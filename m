Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8EB390712
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 19:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2956EA3B;
	Tue, 25 May 2021 17:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B95C6E415;
 Tue, 25 May 2021 17:02:28 +0000 (UTC)
IronPort-SDR: 6tIvrQmrApuZHwGgbmi/hTpkKUMhnRpKe4TTAk09AXZyb3vtaiIbn07j/uIH4j9Gm4lPtX18d0
 5+eNQ0Rav9Nw==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="181885838"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="181885838"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 10:02:02 -0700
IronPort-SDR: CjzZg+UXCaJaDnp4aJAQuxrQEEABDLWzzruF3oD095cJfIJf0PIXlfp7qo09G1hQZNwMJL3jMf
 sdgaP6r4TTSQ==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="443502863"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 10:02:01 -0700
Date: Tue, 25 May 2021 09:54:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [RFC PATCH 37/97] drm/i915/guc: Add stall timer to non blocking
 CTB send function
Message-ID: <20210525165452.GA13181@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-38-matthew.brost@intel.com>
 <7e7ca64d-e5d7-7fd8-b446-7167341c0c92@intel.com>
 <20210524183518.GA12293@sdutt-i7>
 <2b0430a4-d43e-ad52-890c-340631febd6c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b0430a4-d43e-ad52-890c-340631febd6c@intel.com>
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
Cc: tvrtko.ursulin@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, jason.ekstrand@intel.com,
 daniele.ceraolospurio@intel.com, jon.bloomfield@intel.com,
 daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 25, 2021 at 04:15:15PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 24.05.2021 20:35, Matthew Brost wrote:
> > On Mon, May 24, 2021 at 02:58:12PM +0200, Michal Wajdeczko wrote:
> >>
> >>
> >> On 06.05.2021 21:13, Matthew Brost wrote:
> >>> Implement a stall timer which fails H2G CTBs once a period of time
> >>> with no forward progress is reached to prevent deadlock.
> >>>
> >>> Also update to ct_write to return -EDEADLK rather than -EPIPE on a
> >>> corrupted descriptor.
> >>
> >> broken descriptor is really separate issue compared to no progress from
> >> GuC side, I would really like to keep old error code
> >>
> > 
> > I know you do as you have brought it up several times. Again to the rest
> > of the stack these two things mean the exact same thing.
> 
> but I guess 'the rest of the stack' is only interested if returned error
> is EBUSY or not, as all other errors are treated in the same way, thus
> no need change existing error codes
> 

No, -ENODEV means something else too. I'd rather have a single explicit
error code which means H2G is broken, take action to fix it. This is a
bikeshed, we made a decession internally to return a single error code
we really need to move on.

> >  
> >> note that broken CTB descriptor is unrecoverable error, while on other
> >> hand, in theory, we could recover from temporary non-moving CTB
> >>
> > 
> > Yea but we don't, in both cases we disable submission which in turn
> > triggers a full GPU reset.
> 
> is this current limitation or long term design?
> 

Long term design.

> I would rather expect that decision to trigger full GPU is done on solid
> foundations, like definite lost communication with the GuC or missed
> heartbeats, not that we temporarily push CTB to the limit
> 

The intent is to have a large enough value here that if it is reached it
is assumed the GuC is toast and we need a full GPU reset.

> or if do we want to treat CTB processing as kind of hw health checkout
> too, what if heartbeat timeout and CTB stall time do not match ?
>

It is a health check of H2G channel.

No need for these two values to match. One is checking if the GuC can
continue make forward progress processing H2G the other is checking if
an engine can make forward progress.

Matt
 
> > 
> >>>
> >>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> >>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> >>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >>> ---
> >>>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 48 +++++++++++++++++++++--
> >>>  1 file changed, 45 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> >>> index af7314d45a78..4eab319d61be 100644
> >>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> >>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> >>> @@ -69,6 +69,8 @@ static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
> >>>  #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
> >>>  #define CTB_G2H_BUFFER_SIZE	(SZ_4K)
> >>>  
> >>> +#define MAX_US_STALL_CTB	1000000
> >>
> >> nit: maybe we should make it a CONFIG value ?
> >>
> > 
> > Sure.
> > 
> >>> +
> >>>  struct ct_request {
> >>>  	struct list_head link;
> >>>  	u32 fence;
> >>> @@ -315,6 +317,7 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
> >>>  
> >>>  	ct->requests.last_fence = 1;
> >>>  	ct->enabled = true;
> >>> +	ct->stall_time = KTIME_MAX;
> >>>  
> >>>  	return 0;
> >>>  
> >>> @@ -378,7 +381,7 @@ static int ct_write(struct intel_guc_ct *ct,
> >>>  	unsigned int i;
> >>>  
> >>>  	if (unlikely(ctb->broken))
> >>> -		return -EPIPE;
> >>> +		return -EDEADLK;
> >>>  
> >>>  	if (unlikely(desc->status))
> >>>  		goto corrupted;
> >>> @@ -449,7 +452,7 @@ static int ct_write(struct intel_guc_ct *ct,
> >>>  	CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
> >>>  		 desc->head, desc->tail, desc->status);
> >>>  	ctb->broken = true;
> >>> -	return -EPIPE;
> >>> +	return -EDEADLK;
> >>>  }
> >>>  
> >>>  /**
> >>> @@ -494,6 +497,17 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
> >>>  	return err;
> >>>  }
> >>>  
> >>> +static inline bool ct_deadlocked(struct intel_guc_ct *ct)
> >>> +{
> >>> +	bool ret = ktime_us_delta(ktime_get(), ct->stall_time) >
> >>> +		MAX_US_STALL_CTB;
> >>> +
> >>> +	if (unlikely(ret))
> >>> +		CT_ERROR(ct, "CT deadlocked\n");
> >>> +
> >>> +	return ret;
> >>> +}
> >>> +
> >>>  static inline bool ctb_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
> >>>  {
> >>>  	struct guc_ct_buffer_desc *desc = ctb->desc;
> >>> @@ -505,6 +519,26 @@ static inline bool ctb_has_room(struct intel_guc_ct_buffer *ctb, u32 len_dw)
> >>>  	return space >= len_dw;
> >>>  }
> >>>  
> >>> +static int has_room_nb(struct intel_guc_ct *ct, u32 len_dw)
> >>> +{
> >>> +	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
> >>> +
> >>> +	lockdep_assert_held(&ct->ctbs.send.lock);
> >>> +
> >>> +	if (unlikely(!ctb_has_room(ctb, len_dw))) {
> >>> +		if (ct->stall_time == KTIME_MAX)
> >>> +			ct->stall_time = ktime_get();
> >>> +
> >>> +		if (unlikely(ct_deadlocked(ct)))
> >>> +			return -EDEADLK;
> >>> +		else
> >>> +			return -EBUSY;
> >>> +	}
> >>> +
> >>> +	ct->stall_time = KTIME_MAX;
> >>> +	return 0;
> >>> +}
> >>> +
> >>>  static int ct_send_nb(struct intel_guc_ct *ct,
> >>>  		      const u32 *action,
> >>>  		      u32 len,
> >>> @@ -517,7 +551,7 @@ static int ct_send_nb(struct intel_guc_ct *ct,
> >>>  
> >>>  	spin_lock_irqsave(&ctb->lock, spin_flags);
> >>>  
> >>> -	ret = ctb_has_room(ctb, len + 1);
> >>> +	ret = has_room_nb(ct, len + 1);
> >>>  	if (unlikely(ret))
> >>>  		goto out;
> >>>  
> >>> @@ -561,11 +595,19 @@ static int ct_send(struct intel_guc_ct *ct,
> >>>  retry:
> >>>  	spin_lock_irqsave(&ct->ctbs.send.lock, flags);
> >>>  	if (unlikely(!ctb_has_room(ctb, len + 1))) {
> >>> +		if (ct->stall_time == KTIME_MAX)
> >>> +			ct->stall_time = ktime_get();
> >>>  		spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
> >>> +
> >>> +		if (unlikely(ct_deadlocked(ct)))
> >>> +			return -EDEADLK;
> >>> +
> >>
> >> likely, instead of duplicating code, you can reuse has_room_nb here
> >>
> > 
> > In this patch yes, in the following patch no as this check changes
> > between non-blockig and blocking once we introduce G2H credits. I'd
> > rather just leave it as is than churning on the patches.
> > 
> > Matt 
> >  
> >>>  		cond_resched();
> >>>  		goto retry;
> >>>  	}
> >>>  
> >>> +	ct->stall_time = KTIME_MAX;
> >>> +
> >>>  	fence = ct_get_next_fence(ct);
> >>>  	request.fence = fence;
> >>>  	request.status = 0;
> >>>
