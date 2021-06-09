Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDD73A20AA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 01:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA9B6EB76;
	Wed,  9 Jun 2021 23:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979326E422;
 Wed,  9 Jun 2021 23:20:45 +0000 (UTC)
IronPort-SDR: jkpNaN/2YTaT8iItlqzP/bku58lilJYjCcR0LfOG+v/HI6KnEaJb9ICCAxleQWjB5GeaH7Jld1
 66YJDydJc5AQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="192301252"
X-IronPort-AV: E=Sophos;i="5.83,261,1616482800"; d="scan'208";a="192301252"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 16:20:42 -0700
IronPort-SDR: 7+uCXaf9+Ex9UXQS/fxenRnV2cX8f37ig36ftUVm/lt9OV6Lu+vwnFxbvLFzXfsYCXYDUdruqP
 4AeytIFC2cCg==
X-IronPort-AV: E=Sophos;i="5.83,261,1616482800"; d="scan'208";a="448479227"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 16:20:42 -0700
Date: Wed, 9 Jun 2021 16:13:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 36/97] drm/i915/guc: Add non blocking CTB
 send function
Message-ID: <20210609231348.GC5471@sdutt-i7>
References: <20210506191451.77768-37-matthew.brost@intel.com>
 <375b4de4-168f-9c4c-dbb8-f42fd6303628@linux.intel.com>
 <20210525172121.GE14724@sdutt-i7>
 <0f26f76f-e066-fb23-a7b2-784bb8ee771d@linux.intel.com>
 <20210526181053.GA3435@sdutt-i7>
 <53613c13-1cab-b9bd-3922-0389600773ee@linux.intel.com>
 <20210527143514.GA24720@sdutt-i7>
 <828fe399-5319-78a9-c6e3-c0c027e08e9c@linux.intel.com>
 <20210607173101.GA11968@sdutt-i7>
 <d8bda772-6c9d-8513-d2c0-ea126ece5a24@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8bda772-6c9d-8513-d2c0-ea126ece5a24@intel.com>
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
Cc: jason.ekstrand@intel.com, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 09, 2021 at 04:14:05PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 07.06.2021 19:31, Matthew Brost wrote:
> > On Thu, May 27, 2021 at 04:11:50PM +0100, Tvrtko Ursulin wrote:
> >>
> >> On 27/05/2021 15:35, Matthew Brost wrote:
> >>> On Thu, May 27, 2021 at 11:02:24AM +0100, Tvrtko Ursulin wrote:
> >>>>
> >>>> On 26/05/2021 19:10, Matthew Brost wrote:
> >>>>
> >>>> [snip]
> >>>>
> >>>>>>>>> +static int ct_send_nb(struct intel_guc_ct *ct,
> >>>>>>>>> +		      const u32 *action,
> >>>>>>>>> +		      u32 len,
> >>>>>>>>> +		      u32 flags)
> >>>>>>>>> +{
> >>>>>>>>> +	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
> >>>>>>>>> +	unsigned long spin_flags;
> >>>>>>>>> +	u32 fence;
> >>>>>>>>> +	int ret;
> >>>>>>>>> +
> >>>>>>>>> +	spin_lock_irqsave(&ctb->lock, spin_flags);
> >>>>>>>>> +
> >>>>>>>>> +	ret = ctb_has_room(ctb, len + 1);
> >>>>>>>>> +	if (unlikely(ret))
> >>>>>>>>> +		goto out;
> >>>>>>>>> +
> >>>>>>>>> +	fence = ct_get_next_fence(ct);
> >>>>>>>>> +	ret = ct_write(ct, action, len, fence, flags);
> >>>>>>>>> +	if (unlikely(ret))
> >>>>>>>>> +		goto out;
> >>>>>>>>> +
> >>>>>>>>> +	intel_guc_notify(ct_to_guc(ct));
> >>>>>>>>> +
> >>>>>>>>> +out:
> >>>>>>>>> +	spin_unlock_irqrestore(&ctb->lock, spin_flags);
> >>>>>>>>> +
> >>>>>>>>> +	return ret;
> >>>>>>>>> +}
> >>>>>>>>> +
> >>>>>>>>>      static int ct_send(struct intel_guc_ct *ct,
> >>>>>>>>>      		   const u32 *action,
> >>>>>>>>>      		   u32 len,
> >>>>>>>>> @@ -473,6 +541,7 @@ static int ct_send(struct intel_guc_ct *ct,
> >>>>>>>>>      		   u32 response_buf_size,
> >>>>>>>>>      		   u32 *status)
> >>>>>>>>>      {
> >>>>>>>>> +	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
> >>>>>>>>>      	struct ct_request request;
> >>>>>>>>>      	unsigned long flags;
> >>>>>>>>>      	u32 fence;
> >>>>>>>>> @@ -482,8 +551,20 @@ static int ct_send(struct intel_guc_ct *ct,
> >>>>>>>>>      	GEM_BUG_ON(!len);
> >>>>>>>>>      	GEM_BUG_ON(len & ~GUC_CT_MSG_LEN_MASK);
> >>>>>>>>>      	GEM_BUG_ON(!response_buf && response_buf_size);
> >>>>>>>>> +	might_sleep();
> >>>>>>>>
> >>>>>>>> Sleep is just cond_resched below or there is more?
> >>>>>>>>
> >>>>>>>
> >>>>>>> Yes, the cond_resched.
> >>>>>>>
> >>>>>>>>> +	/*
> >>>>>>>>> +	 * We use a lazy spin wait loop here as we believe that if the CT
> >>>>>>>>> +	 * buffers are sized correctly the flow control condition should be
> >>>>>>>>> +	 * rare.
> >>>>>>>>> +	 */
> >>>>>>>>> +retry:
> >>>>>>>>>      	spin_lock_irqsave(&ct->ctbs.send.lock, flags);
> >>>>>>>>> +	if (unlikely(!ctb_has_room(ctb, len + 1))) {
> >>>>>>>>> +		spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
> >>>>>>>>> +		cond_resched();
> >>>>>>>>> +		goto retry;
> >>>>>>>>> +	}
> >>>>>>>>
> >>>>>>>> If this patch is about adding a non-blocking send function, and below we can
> >>>>>>>> see that it creates a fork:
> >>>>>>>>
> >>>>>>>> intel_guc_ct_send:
> >>>>>>>> ...
> >>>>>>>> 	if (flags & INTEL_GUC_SEND_NB)
> >>>>>>>> 		return ct_send_nb(ct, action, len, flags);
> >>>>>>>>
> >>>>>>>>     	ret = ct_send(ct, action, len, response_buf, response_buf_size, &status);
> >>>>>>>>
> >>>>>>>> Then why is there a change in ct_send here, which is not the new
> >>>>>>>> non-blocking path?
> >>>>>>>>
> >>>>>>>
> >>>>>>> There is not a change to ct_send(), just to intel_guc_ct_send.
> >>>>>>
> >>>>>> I was doing by the diff which says:
> >>>>>>
> >>>>>>    static int ct_send(struct intel_guc_ct *ct,
> >>>>>>    		   const u32 *action,
> >>>>>>    		   u32 len,
> >>>>>> @@ -473,6 +541,7 @@ static int ct_send(struct intel_guc_ct *ct,
> >>>>>>    		   u32 response_buf_size,
> >>>>>>    		   u32 *status)
> >>>>>>    {
> >>>>>> +	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
> >>>>>>    	struct ct_request request;
> >>>>>>    	unsigned long flags;
> >>>>>>    	u32 fence;
> >>>>>> @@ -482,8 +551,20 @@ static int ct_send(struct intel_guc_ct *ct,
> >>>>>>    	GEM_BUG_ON(!len);
> >>>>>>    	GEM_BUG_ON(len & ~GUC_CT_MSG_LEN_MASK);
> >>>>>>    	GEM_BUG_ON(!response_buf && response_buf_size);
> >>>>>> +	might_sleep();
> >>>>>> +	/*
> >>>>>> +	 * We use a lazy spin wait loop here as we believe that if the CT
> >>>>>> +	 * buffers are sized correctly the flow control condition should be
> >>>>>> +	 * rare.
> >>>>>> +	 */
> >>>>>> +retry:
> >>>>>>    	spin_lock_irqsave(&ct->ctbs.send.lock, flags);
> >>>>>> +	if (unlikely(!ctb_has_room(ctb, len + 1))) {
> >>>>>> +		spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
> >>>>>> +		cond_resched();
> >>>>>> +		goto retry;
> >>>>>> +	}
> >>>>>>
> >>>>>> So it looks like a change to ct_send to me. Is that wrong?
> >>>>
> >>>> What about this part - is the patch changing the blocking ct_send or not,
> >>>> and if it is why?
> >>>>
> >>>
> >>> Yes, ct_send() changes. Sorry for the confusion.
> >>>
> >>> This function needs to be updated to account for the H2G space and
> >>> backoff if no space is available.
> >>
> >> Since this one is the sleeping path, it probably can and needs to be smarter
> >> than having a cond_resched busy loop added. Like sleep and get woken up when
> >> there is space. Otherwise it can degenerate to busy looping via contention
> >> with the non-blocking path.
> >>
> > 
> > That screams over enginerring a simple problem to me. If the CT channel
> > is full we are really in trouble anyways - i.e. the performance is going
> > to terrible as we overwhelmed the GuC with traffic. That being said,
> > IGTs can do this but that really isn't a real world use case. For the
> > real world, this buffer is large enough that it won't ever be full hence
> > the comment + lazy spin loop.
> > 
> > Next, it isn't like we get an interrupt or something when space
> > becomes available so how would we wake this thread? Could we come up
> > with a convoluted scheme where we insert ops that generated an interrupt
> > at regular intervals, probably? Would it be super complicated, totally
> > unnecessary, and gain use nothing - absolutely.
> > 
> > Lastly, blocking CTBs really shouldn't ever be used. Certainly the
> > submission code doesn't use these. I think SRIOV might, but those can
> > probably be reworked too to use non-blocking. At some point we might
> > want to scrub the driver and just delete the blocking path.
> 
> I guess the main problem is not with "blocking CTBs", as now only
> calling thread is "blocked" waiting for reply and other threads can
> still send their CTBs (blocked/nonblocking), but the fact that we are
> sending too many messages, stopping only when CTB is full, and even then
> trying hard to squeeze that message again.
> 
> it should be caller responsibility to throttle its stream of
> non-blocking CTBs if either we are running out of CTB but if we have too
> many "non-blocking" requests in flight.
> 
> making CTB buffer just larger and larger does not solve the problem,
> only makes it less visible
> 
> and as you are using busy-loop to send even 'non-blocking' CTBs, it
> might indicate that your code is not prepared to step-back in case of
> any temporary CTB congestion
> 
> also note that currently all CTB messages are asynchronous, REQUEST /
> RESPONSE pair could be processed in fully non-blocking approach, but
> that would require refactoring of part driver into event-driven state
> machine, as sometimes we can't move forward without information that we
> are waiting from the GuC (and blocking was simplest solution for that)
> 
> but if your submission code is already  event-driven, then it should be
> easier to trigger state machine into 'retry' mode without using this
> busy-loop

Yes, the state-machine is used in most cases as a back off where it
makes sense. Some cases we still just use a busy-loop. See my comments
about over engineering solutions - sometimes it is better to use
something simple for something that rare.

Matt

> 
> > 
> > Matt
> > 
> >> Regards,
> > 
> >>
> >> Tvrtko
