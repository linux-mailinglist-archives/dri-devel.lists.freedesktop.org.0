Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3FA39F116
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 10:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197DD6E0EA;
	Tue,  8 Jun 2021 08:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A276E0EA;
 Tue,  8 Jun 2021 08:39:15 +0000 (UTC)
IronPort-SDR: d+a0jeky9ELwzUW41wq7253gBqJZIH26MzarPLQ7zS/letoy/NUQ28ZNC5MkeAHCya9edcDFl/
 95RuFqIOLFtg==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="226143654"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="226143654"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 01:39:14 -0700
IronPort-SDR: MAfOqFI0qcy6GCcLZNDE8D5pdVX8hA7YEmv/+mzKmg2wTtxKYAJ8bI1s3qxs8gx4r9WCWoZ83H
 uf9vDPs1/NwA==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="449445364"
Received: from mohitsha-mobl.ger.corp.intel.com (HELO [10.213.197.7])
 ([10.213.197.7])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 01:39:12 -0700
Subject: Re: [Intel-gfx] [RFC PATCH 36/97] drm/i915/guc: Add non blocking CTB
 send function
To: Matthew Brost <matthew.brost@intel.com>
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
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <2706c890-5145-4edb-acd1-b9862caba8cf@linux.intel.com>
Date: Tue, 8 Jun 2021 09:39:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607173101.GA11968@sdutt-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
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


On 07/06/2021 18:31, Matthew Brost wrote:
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
>>>>>>>>>       static int ct_send(struct intel_guc_ct *ct,
>>>>>>>>>       		   const u32 *action,
>>>>>>>>>       		   u32 len,
>>>>>>>>> @@ -473,6 +541,7 @@ static int ct_send(struct intel_guc_ct *ct,
>>>>>>>>>       		   u32 response_buf_size,
>>>>>>>>>       		   u32 *status)
>>>>>>>>>       {
>>>>>>>>> +	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
>>>>>>>>>       	struct ct_request request;
>>>>>>>>>       	unsigned long flags;
>>>>>>>>>       	u32 fence;
>>>>>>>>> @@ -482,8 +551,20 @@ static int ct_send(struct intel_guc_ct *ct,
>>>>>>>>>       	GEM_BUG_ON(!len);
>>>>>>>>>       	GEM_BUG_ON(len & ~GUC_CT_MSG_LEN_MASK);
>>>>>>>>>       	GEM_BUG_ON(!response_buf && response_buf_size);
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
>>>>>>>>>       	spin_lock_irqsave(&ct->ctbs.send.lock, flags);
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
>>>>>>>>      	ret = ct_send(ct, action, len, response_buf, response_buf_size, &status);
>>>>>>>>
>>>>>>>> Then why is there a change in ct_send here, which is not the new
>>>>>>>> non-blocking path?
>>>>>>>>
>>>>>>>
>>>>>>> There is not a change to ct_send(), just to intel_guc_ct_send.
>>>>>>
>>>>>> I was doing by the diff which says:
>>>>>>
>>>>>>     static int ct_send(struct intel_guc_ct *ct,
>>>>>>     		   const u32 *action,
>>>>>>     		   u32 len,
>>>>>> @@ -473,6 +541,7 @@ static int ct_send(struct intel_guc_ct *ct,
>>>>>>     		   u32 response_buf_size,
>>>>>>     		   u32 *status)
>>>>>>     {
>>>>>> +	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
>>>>>>     	struct ct_request request;
>>>>>>     	unsigned long flags;
>>>>>>     	u32 fence;
>>>>>> @@ -482,8 +551,20 @@ static int ct_send(struct intel_guc_ct *ct,
>>>>>>     	GEM_BUG_ON(!len);
>>>>>>     	GEM_BUG_ON(len & ~GUC_CT_MSG_LEN_MASK);
>>>>>>     	GEM_BUG_ON(!response_buf && response_buf_size);
>>>>>> +	might_sleep();
>>>>>> +	/*
>>>>>> +	 * We use a lazy spin wait loop here as we believe that if the CT
>>>>>> +	 * buffers are sized correctly the flow control condition should be
>>>>>> +	 * rare.
>>>>>> +	 */
>>>>>> +retry:
>>>>>>     	spin_lock_irqsave(&ct->ctbs.send.lock, flags);
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

Performance of what would be terrible? Something relating to submitting 
new jobs to the GPU I guess. Or something SRIOV related as you hint below.

But there is no real reason why CPU cycles/power should suffer if GuC is 
busy.

Okay, if it can't happen in real world then it's possibly passable as a 
design of a communication interface. But to me it leaves a bad taste and 
a doubt that there is this other aspect of the real world. And that is 
when the unexpected happens. Even the most trivial things like a bug in 
GuC firmware causes the driver to busy spin in there. So not much 
happening on the machine but CPU cores pinned burning cycles in this 
code. It's just lazy and not robust design. "Bug #nnnnn - High CPU usage 
and GUI blocked - Solution: Upgrade GuC firmware and _reboot_ the 
machine". Oh well..

At least I think the commit message should spell out clearly that a busy 
looping path is being added to the sleeping send as a downside of 
implementation choices. Still, for the record, I object to the design.

Regards,

Tvrtko

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
> 
> Matt
> 
>> Regards,
> 
>>
>> Tvrtko
