Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D7D392B58
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 12:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B12B6E505;
	Thu, 27 May 2021 10:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD3E6E505;
 Thu, 27 May 2021 10:02:32 +0000 (UTC)
IronPort-SDR: mPnhun8Ylr8P19mxDBcaMEthF/D54mLa9IUU4NkpQANY5c3HUF+lTgUwcVJD+siKv9qgvfEwO7
 zlkI2/KWILOg==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="183031941"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="183031941"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 03:02:31 -0700
IronPort-SDR: 8dh0K/Ylb47TiNYd3cUJ275KNmOlOTaeQefNZE2lJVsonM2xJJf9LgOkdzaFsGLsftK0dk249n
 0SX9RjMScBcg==
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="547740985"
Received: from amoses-mobl1.ger.corp.intel.com (HELO [10.213.211.53])
 ([10.213.211.53])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 03:02:25 -0700
Subject: Re: [Intel-gfx] [RFC PATCH 36/97] drm/i915/guc: Add non blocking CTB
 send function
To: Matthew Brost <matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-37-matthew.brost@intel.com>
 <375b4de4-168f-9c4c-dbb8-f42fd6303628@linux.intel.com>
 <20210525172121.GE14724@sdutt-i7>
 <0f26f76f-e066-fb23-a7b2-784bb8ee771d@linux.intel.com>
 <20210526181053.GA3435@sdutt-i7>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <53613c13-1cab-b9bd-3922-0389600773ee@linux.intel.com>
Date: Thu, 27 May 2021 11:02:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210526181053.GA3435@sdutt-i7>
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


On 26/05/2021 19:10, Matthew Brost wrote:

[snip]

>>>>> +static int ct_send_nb(struct intel_guc_ct *ct,
>>>>> +		      const u32 *action,
>>>>> +		      u32 len,
>>>>> +		      u32 flags)
>>>>> +{
>>>>> +	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
>>>>> +	unsigned long spin_flags;
>>>>> +	u32 fence;
>>>>> +	int ret;
>>>>> +
>>>>> +	spin_lock_irqsave(&ctb->lock, spin_flags);
>>>>> +
>>>>> +	ret = ctb_has_room(ctb, len + 1);
>>>>> +	if (unlikely(ret))
>>>>> +		goto out;
>>>>> +
>>>>> +	fence = ct_get_next_fence(ct);
>>>>> +	ret = ct_write(ct, action, len, fence, flags);
>>>>> +	if (unlikely(ret))
>>>>> +		goto out;
>>>>> +
>>>>> +	intel_guc_notify(ct_to_guc(ct));
>>>>> +
>>>>> +out:
>>>>> +	spin_unlock_irqrestore(&ctb->lock, spin_flags);
>>>>> +
>>>>> +	return ret;
>>>>> +}
>>>>> +
>>>>>     static int ct_send(struct intel_guc_ct *ct,
>>>>>     		   const u32 *action,
>>>>>     		   u32 len,
>>>>> @@ -473,6 +541,7 @@ static int ct_send(struct intel_guc_ct *ct,
>>>>>     		   u32 response_buf_size,
>>>>>     		   u32 *status)
>>>>>     {
>>>>> +	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
>>>>>     	struct ct_request request;
>>>>>     	unsigned long flags;
>>>>>     	u32 fence;
>>>>> @@ -482,8 +551,20 @@ static int ct_send(struct intel_guc_ct *ct,
>>>>>     	GEM_BUG_ON(!len);
>>>>>     	GEM_BUG_ON(len & ~GUC_CT_MSG_LEN_MASK);
>>>>>     	GEM_BUG_ON(!response_buf && response_buf_size);
>>>>> +	might_sleep();
>>>>
>>>> Sleep is just cond_resched below or there is more?
>>>>
>>>
>>> Yes, the cond_resched.
>>>
>>>>> +	/*
>>>>> +	 * We use a lazy spin wait loop here as we believe that if the CT
>>>>> +	 * buffers are sized correctly the flow control condition should be
>>>>> +	 * rare.
>>>>> +	 */
>>>>> +retry:
>>>>>     	spin_lock_irqsave(&ct->ctbs.send.lock, flags);
>>>>> +	if (unlikely(!ctb_has_room(ctb, len + 1))) {
>>>>> +		spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
>>>>> +		cond_resched();
>>>>> +		goto retry;
>>>>> +	}
>>>>
>>>> If this patch is about adding a non-blocking send function, and below we can
>>>> see that it creates a fork:
>>>>
>>>> intel_guc_ct_send:
>>>> ...
>>>> 	if (flags & INTEL_GUC_SEND_NB)
>>>> 		return ct_send_nb(ct, action, len, flags);
>>>>
>>>>    	ret = ct_send(ct, action, len, response_buf, response_buf_size, &status);
>>>>
>>>> Then why is there a change in ct_send here, which is not the new
>>>> non-blocking path?
>>>>
>>>
>>> There is not a change to ct_send(), just to intel_guc_ct_send.
>>
>> I was doing by the diff which says:
>>
>>   static int ct_send(struct intel_guc_ct *ct,
>>   		   const u32 *action,
>>   		   u32 len,
>> @@ -473,6 +541,7 @@ static int ct_send(struct intel_guc_ct *ct,
>>   		   u32 response_buf_size,
>>   		   u32 *status)
>>   {
>> +	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
>>   	struct ct_request request;
>>   	unsigned long flags;
>>   	u32 fence;
>> @@ -482,8 +551,20 @@ static int ct_send(struct intel_guc_ct *ct,
>>   	GEM_BUG_ON(!len);
>>   	GEM_BUG_ON(len & ~GUC_CT_MSG_LEN_MASK);
>>   	GEM_BUG_ON(!response_buf && response_buf_size);
>> +	might_sleep();
>> +	/*
>> +	 * We use a lazy spin wait loop here as we believe that if the CT
>> +	 * buffers are sized correctly the flow control condition should be
>> +	 * rare.
>> +	 */
>> +retry:
>>   	spin_lock_irqsave(&ct->ctbs.send.lock, flags);
>> +	if (unlikely(!ctb_has_room(ctb, len + 1))) {
>> +		spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
>> +		cond_resched();
>> +		goto retry;
>> +	}
>>
>> So it looks like a change to ct_send to me. Is that wrong?

What about this part - is the patch changing the blocking ct_send or 
not, and if it is why?

Regards,

Tvrtko


>>
>> Regards,
>>
>> Tvrtko
>>
>>> As for why intel_guc_ct_send is updated and we don't just a new public
>>> function, this was another reviewers suggestion. Again can't make
>>> everyone happy.
>>>>>     	fence = ct_get_next_fence(ct);
>>>>>     	request.fence = fence;
>>>>> @@ -495,7 +576,7 @@ static int ct_send(struct intel_guc_ct *ct,
>>>>>     	list_add_tail(&request.link, &ct->requests.pending);
>>>>>     	spin_unlock(&ct->requests.lock);
>>>>> -	err = ct_write(ct, action, len, fence);
>>>>> +	err = ct_write(ct, action, len, fence, 0);
>>>>>     	spin_unlock_irqrestore(&ct->ctbs.send.lock, flags);
>>>>> @@ -537,7 +618,7 @@ static int ct_send(struct intel_guc_ct *ct,
>>>>>      * Command Transport (CT) buffer based GuC send function.
>>>>>      */
>>>>>     int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
>>>>> -		      u32 *response_buf, u32 response_buf_size)
>>>>> +		      u32 *response_buf, u32 response_buf_size, u32 flags)
>>>>>     {
>>>>>     	u32 status = ~0; /* undefined */
>>>>>     	int ret;
>>>>> @@ -547,6 +628,9 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
>>>>>     		return -ENODEV;
>>>>>     	}
>>>>> +	if (flags & INTEL_GUC_SEND_NB)
>>>>> +		return ct_send_nb(ct, action, len, flags);
>>>>> +
>>>>>     	ret = ct_send(ct, action, len, response_buf, response_buf_size, &status);
>>>>>     	if (unlikely(ret < 0)) {
>>>>>     		CT_ERROR(ct, "Sending action %#x failed (err=%d status=%#X)\n",
>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
>>>>> index 1ae2dde6db93..55ef7c52472f 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
>>>>> @@ -9,6 +9,7 @@
>>>>>     #include <linux/interrupt.h>
>>>>>     #include <linux/spinlock.h>
>>>>>     #include <linux/workqueue.h>
>>>>> +#include <linux/ktime.h>
>>>>>     #include "intel_guc_fwif.h"
>>>>> @@ -42,7 +43,6 @@ struct intel_guc_ct_buffer {
>>>>>     	bool broken;
>>>>>     };
>>>>> -
>>>>>     /** Top-level structure for Command Transport related data
>>>>>      *
>>>>>      * Includes a pair of CT buffers for bi-directional communication and tracking
>>>>> @@ -69,6 +69,9 @@ struct intel_guc_ct {
>>>>>     		struct list_head incoming; /* incoming requests */
>>>>>     		struct work_struct worker; /* handler for incoming requests */
>>>>>     	} requests;
>>>>> +
>>>>> +	/** @stall_time: time of first time a CTB submission is stalled */
>>>>> +	ktime_t stall_time;
>>>>
>>>> Unused in this patch.
>>>>
>>>
>>> Yea, wrong patch. Will fix.
>>>
>>> Matt
>>>>>     };
>>>>>     void intel_guc_ct_init_early(struct intel_guc_ct *ct);
>>>>> @@ -88,7 +91,7 @@ static inline bool intel_guc_ct_enabled(struct intel_guc_ct *ct)
>>>>>     }
>>>>>     int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
>>>>> -		      u32 *response_buf, u32 response_buf_size);
>>>>> +		      u32 *response_buf, u32 response_buf_size, u32 flags);
>>>>>     void intel_guc_ct_event_handler(struct intel_guc_ct *ct);
>>>>>     #endif /* _INTEL_GUC_CT_H_ */
>>>>>
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
