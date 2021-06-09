Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F01553A16C8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 16:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07966E400;
	Wed,  9 Jun 2021 14:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07306E400;
 Wed,  9 Jun 2021 14:14:08 +0000 (UTC)
IronPort-SDR: FNj0EshpGQKthOHntbKw3Q3239EmAd1nBT1P2OLEV4jZ1V+Z8KDvWw1nuZAhSJoSDZ0ZFug3rb
 R6dJISCDK/3w==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="184767843"
X-IronPort-AV: E=Sophos;i="5.83,261,1616482800"; d="scan'208";a="184767843"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 07:14:08 -0700
IronPort-SDR: LxNH69iEapDqEho/93Fiayhz8oXsxZfhqx/Ji/t9cAgRmcYBd2nny2vTRYaDiUyOH5kIAhL3QP
 lBr8Bc67Os5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,261,1616482800"; d="scan'208";a="635432948"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga006.fm.intel.com with ESMTP; 09 Jun 2021 07:14:06 -0700
Received: from [10.249.139.139] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.139.139])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 159EE5Fi032589; Wed, 9 Jun 2021 15:14:05 +0100
Subject: Re: [Intel-gfx] [RFC PATCH 36/97] drm/i915/guc: Add non blocking CTB
 send function
To: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-37-matthew.brost@intel.com>
 <375b4de4-168f-9c4c-dbb8-f42fd6303628@linux.intel.com>
 <20210525172121.GE14724@sdutt-i7>
 <0f26f76f-e066-fb23-a7b2-784bb8ee771d@linux.intel.com>
 <20210526181053.GA3435@sdutt-i7>
 <53613c13-1cab-b9bd-3922-0389600773ee@linux.intel.com>
 <20210527143514.GA24720@sdutt-i7>
 <828fe399-5319-78a9-c6e3-c0c027e08e9c@linux.intel.com>
 <20210607173101.GA11968@sdutt-i7>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <d8bda772-6c9d-8513-d2c0-ea126ece5a24@intel.com>
Date: Wed, 9 Jun 2021 16:14:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210607173101.GA11968@sdutt-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07.06.2021 19:31, Matthew Brost wrote:
> On Thu, May 27, 2021 at 04:11:50PM +0100, Tvrtko Ursulin wrote:
>>
>> On 27/05/2021 15:35, Matthew Brost wrote:
>>> On Thu, May 27, 2021 at 11:02:24AM +0100, Tvrtko Ursulin wrote:
>>>>
>>>> On 26/05/2021 19:10, Matthew Brost wrote:
>>>>
>>>> [snip]
>>>>
>>>>>>>>> +static int ct_send_nb(struct intel_guc_ct *ct,
>>>>>>>>> +		      const u32 *action,
>>>>>>>>> +		      u32 len,
>>>>>>>>> +		      u32 flags)
>>>>>>>>> +{
>>>>>>>>> +	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
>>>>>>>>> +	unsigned long spin_flags;
>>>>>>>>> +	u32 fence;
>>>>>>>>> +	int ret;
>>>>>>>>> +
>>>>>>>>> +	spin_lock_irqsave(&ctb->lock, spin_flags);
>>>>>>>>> +
>>>>>>>>> +	ret = ctb_has_room(ctb, len + 1);
>>>>>>>>> +	if (unlikely(ret))
>>>>>>>>> +		goto out;
>>>>>>>>> +
>>>>>>>>> +	fence = ct_get_next_fence(ct);
>>>>>>>>> +	ret = ct_write(ct, action, len, fence, flags);
>>>>>>>>> +	if (unlikely(ret))
>>>>>>>>> +		goto out;
>>>>>>>>> +
>>>>>>>>> +	intel_guc_notify(ct_to_guc(ct));
>>>>>>>>> +
>>>>>>>>> +out:
>>>>>>>>> +	spin_unlock_irqrestore(&ctb->lock, spin_flags);
>>>>>>>>> +
>>>>>>>>> +	return ret;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>>      static int ct_send(struct intel_guc_ct *ct,
>>>>>>>>>      		   const u32 *action,
>>>>>>>>>      		   u32 len,
>>>>>>>>> @@ -473,6 +541,7 @@ static int ct_send(struct intel_guc_ct *ct,
>>>>>>>>>      		   u32 response_buf_size,
>>>>>>>>>      		   u32 *status)
>>>>>>>>>      {
>>>>>>>>> +	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
>>>>>>>>>      	struct ct_request request;
>>>>>>>>>      	unsigned long flags;
>>>>>>>>>      	u32 fence;
>>>>>>>>> @@ -482,8 +551,20 @@ static int ct_send(struct intel_guc_ct *ct,
>>>>>>>>>      	GEM_BUG_ON(!len);
>>>>>>>>>      	GEM_BUG_ON(len & ~GUC_CT_MSG_LEN_MASK);
>>>>>>>>>      	GEM_BUG_ON(!response_buf && response_buf_size);
>>>>>>>>> +	might_sleep();
>>>>>>>>
>>>>>>>> Sleep is just cond_resched below or there is more?
>>>>>>>>
>>>>>>>
>>>>>>> Yes, the cond_resched.
>>>>>>>
>>>>>>>>> +	/*
>>>>>>>>> +	 * We use a lazy spin wait loop here as we believe that if the CT
>>>>>>>>> +	 * buffers are sized correctly the flow control condition should be
>>>>>>>>> +	 * rare.
>>>>>>>>> +	 */
>>>>>>>>> +retry:
>>>>>>>>>      	spin_lock_irqsave(&ct->ctbs.send.lock, flags);
>>>>>>>>> +	if (unlikely(!ctb_has_room(ctb, len + 1))) {
>>>>>>>>> +		spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
>>>>>>>>> +		cond_resched();
>>>>>>>>> +		goto retry;
>>>>>>>>> +	}
>>>>>>>>
>>>>>>>> If this patch is about adding a non-blocking send function, and below we can
>>>>>>>> see that it creates a fork:
>>>>>>>>
>>>>>>>> intel_guc_ct_send:
>>>>>>>> ...
>>>>>>>> 	if (flags & INTEL_GUC_SEND_NB)
>>>>>>>> 		return ct_send_nb(ct, action, len, flags);
>>>>>>>>
>>>>>>>>     	ret = ct_send(ct, action, len, response_buf, response_buf_size, &status);
>>>>>>>>
>>>>>>>> Then why is there a change in ct_send here, which is not the new
>>>>>>>> non-blocking path?
>>>>>>>>
>>>>>>>
>>>>>>> There is not a change to ct_send(), just to intel_guc_ct_send.
>>>>>>
>>>>>> I was doing by the diff which says:
>>>>>>
>>>>>>    static int ct_send(struct intel_guc_ct *ct,
>>>>>>    		   const u32 *action,
>>>>>>    		   u32 len,
>>>>>> @@ -473,6 +541,7 @@ static int ct_send(struct intel_guc_ct *ct,
>>>>>>    		   u32 response_buf_size,
>>>>>>    		   u32 *status)
>>>>>>    {
>>>>>> +	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
>>>>>>    	struct ct_request request;
>>>>>>    	unsigned long flags;
>>>>>>    	u32 fence;
>>>>>> @@ -482,8 +551,20 @@ static int ct_send(struct intel_guc_ct *ct,
>>>>>>    	GEM_BUG_ON(!len);
>>>>>>    	GEM_BUG_ON(len & ~GUC_CT_MSG_LEN_MASK);
>>>>>>    	GEM_BUG_ON(!response_buf && response_buf_size);
>>>>>> +	might_sleep();
>>>>>> +	/*
>>>>>> +	 * We use a lazy spin wait loop here as we believe that if the CT
>>>>>> +	 * buffers are sized correctly the flow control condition should be
>>>>>> +	 * rare.
>>>>>> +	 */
>>>>>> +retry:
>>>>>>    	spin_lock_irqsave(&ct->ctbs.send.lock, flags);
>>>>>> +	if (unlikely(!ctb_has_room(ctb, len + 1))) {
>>>>>> +		spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
>>>>>> +		cond_resched();
>>>>>> +		goto retry;
>>>>>> +	}
>>>>>>
>>>>>> So it looks like a change to ct_send to me. Is that wrong?
>>>>
>>>> What about this part - is the patch changing the blocking ct_send or not,
>>>> and if it is why?
>>>>
>>>
>>> Yes, ct_send() changes. Sorry for the confusion.
>>>
>>> This function needs to be updated to account for the H2G space and
>>> backoff if no space is available.
>>
>> Since this one is the sleeping path, it probably can and needs to be smarter
>> than having a cond_resched busy loop added. Like sleep and get woken up when
>> there is space. Otherwise it can degenerate to busy looping via contention
>> with the non-blocking path.
>>
> 
> That screams over enginerring a simple problem to me. If the CT channel
> is full we are really in trouble anyways - i.e. the performance is going
> to terrible as we overwhelmed the GuC with traffic. That being said,
> IGTs can do this but that really isn't a real world use case. For the
> real world, this buffer is large enough that it won't ever be full hence
> the comment + lazy spin loop.
> 
> Next, it isn't like we get an interrupt or something when space
> becomes available so how would we wake this thread? Could we come up
> with a convoluted scheme where we insert ops that generated an interrupt
> at regular intervals, probably? Would it be super complicated, totally
> unnecessary, and gain use nothing - absolutely.
> 
> Lastly, blocking CTBs really shouldn't ever be used. Certainly the
> submission code doesn't use these. I think SRIOV might, but those can
> probably be reworked too to use non-blocking. At some point we might
> want to scrub the driver and just delete the blocking path.

I guess the main problem is not with "blocking CTBs", as now only
calling thread is "blocked" waiting for reply and other threads can
still send their CTBs (blocked/nonblocking), but the fact that we are
sending too many messages, stopping only when CTB is full, and even then
trying hard to squeeze that message again.

it should be caller responsibility to throttle its stream of
non-blocking CTBs if either we are running out of CTB but if we have too
many "non-blocking" requests in flight.

making CTB buffer just larger and larger does not solve the problem,
only makes it less visible

and as you are using busy-loop to send even 'non-blocking' CTBs, it
might indicate that your code is not prepared to step-back in case of
any temporary CTB congestion

also note that currently all CTB messages are asynchronous, REQUEST /
RESPONSE pair could be processed in fully non-blocking approach, but
that would require refactoring of part driver into event-driven state
machine, as sometimes we can't move forward without information that we
are waiting from the GuC (and blocking was simplest solution for that)

but if your submission code is already  event-driven, then it should be
easier to trigger state machine into 'retry' mode without using this
busy-loop

> 
> Matt
> 
>> Regards,
> 
>>
>> Tvrtko
