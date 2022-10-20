Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5928260596C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 10:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B9810E133;
	Thu, 20 Oct 2022 08:14:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F28510E133;
 Thu, 20 Oct 2022 08:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666253654; x=1697789654;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Ix58jGT2vYUfZafbCP6HbWf23IGlxsmWU9msKHvx8wo=;
 b=eRGnzL6xF0V/jlh4uB4dSTEZTU0b1ljWwf5WXhxI0+MBSizz2DLugPZM
 BV0ti5O6wlEmWQxZ23BK/X+nFXjxqxmwj/r+abOs/XdaHCHRzACupPbxz
 twoVSYqny89RjpBua8aifkfkVdBieSJFreKNqNJt7TAAe8llzPlyVQEg6
 x0yrs+CCGbRoOrOF2ml2FoZWstfi3+Mx36jjEcc3ZsKKTKoIH+AR8jmcn
 oO6Sc9fzyWXI0Q/Ak8fz91PMVQ/Nenq6tUZOENNwIyJcBkqEoXhs6Cffy
 wPZbTU23DIdgOikmH//xbcmGq42tHXifZfWan4wDcICFEd9TpRVvGn7yR w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="333211474"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="333211474"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 01:14:13 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="734683084"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="734683084"
Received: from aasthash-mobl.ger.corp.intel.com (HELO [10.213.232.117])
 ([10.213.232.117])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 01:14:12 -0700
Message-ID: <08b6fab7-7479-65bd-a0be-16be16fa250f@linux.intel.com>
Date: Thu, 20 Oct 2022 09:14:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [Intel-gfx] [PATCH] drm/i915/slpc: Optmize waitboost for SLPC
Content-Language: en-US
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20221018221546.17852-1-vinay.belgaumkar@intel.com>
 <c46f4714-7c12-c331-ec4f-ab52a7c499cf@linux.intel.com>
 <4fa5bd14-f891-3909-68c5-3b6b43ca27d1@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <4fa5bd14-f891-3909-68c5-3b6b43ca27d1@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 19/10/2022 22:12, Belgaumkar, Vinay wrote:
> 
> On 10/19/2022 12:40 AM, Tvrtko Ursulin wrote:
>>
>> On 18/10/2022 23:15, Vinay Belgaumkar wrote:
>>> Waitboost (when SLPC is enabled) results in a H2G message. This can 
>>> result
>>> in thousands of messages during a stress test and fill up an already 
>>> full
>>> CTB. There is no need to request for RP0 if GuC is already requesting 
>>> the
>>> same.
>>>
>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/intel_rps.c | 9 ++++++++-
>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c 
>>> b/drivers/gpu/drm/i915/gt/intel_rps.c
>>> index fc23c562d9b2..a20ae4fceac8 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>>> @@ -1005,13 +1005,20 @@ void intel_rps_dec_waiters(struct intel_rps 
>>> *rps)
>>>   void intel_rps_boost(struct i915_request *rq)
>>>   {
>>>       struct intel_guc_slpc *slpc;
>>> +    struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
>>>         if (i915_request_signaled(rq) || i915_request_has_waitboost(rq))
>>>           return;
>>>   +    /* If GuC is already requesting RP0, skip */
>>> +    if (rps_uses_slpc(rps)) {
>>> +        slpc = rps_to_slpc(rps);
>>> +        if (intel_rps_get_requested_frequency(rps) == slpc->rp0_freq)
> One correction here is this should be slpc->boost_freq.
>>> +            return;
>>> +    }
>>> +
>>
>> Feels a little bit like a layering violation. Wait boost reference 
>> counts and request markings will changed based on asynchronous state - 
>> a mmio read.
>>
>> Also, a little below we have this:
>>
>> """
>>     /* Serializes with i915_request_retire() */
>>     if (!test_and_set_bit(I915_FENCE_FLAG_BOOST, &rq->fence.flags)) {
>>         struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
>>
>>         if (rps_uses_slpc(rps)) {
>>             slpc = rps_to_slpc(rps);
>>
>>             /* Return if old value is non zero */
>>             if (!atomic_fetch_inc(&slpc->num_waiters))
>>
>> ***>>>> Wouldn't it skip doing anything here already? <<<<***
> It will skip only if boost is already happening. This patch is trying to 
> prevent even that first one if possible.

Do you mean that the first boost request comes outside the driver control?

>>
>>                 schedule_work(&slpc->boost_work);
>>
>>             return;
>>         }
>>
>>         if (atomic_fetch_inc(&rps->num_waiters))
>>             return;
>> """
>>
>> But I wonder if this is not a layering violation already. Looks like 
>> one for me at the moment. And as it happens there is an ongoing debug 
>> of clvk slowness where I was a bit puzzled by the lack of "boost 
>> fence" in trace_printk logs - but now I see how that happens. Does not 
>> feel right to me that we lose that tracing with SLPC.
> Agreed. Will add the trace to the SLPC case as well.  However, the 
> question is what does that trace indicate? Even in the host case, we log 
> the trace, but may skip the actual boost as the req is already matching 
> boost freq. IMO, we should log the trace only when we actually decide to 
> boost.

Good question - let me come back to this later when the current 
emergencies subside. Feel free to remind me if I forget.

>> So in general - why the correct approach wouldn't be to solve this in 
>> the worker - which perhaps should fork to slpc specific branch and do 
>> the consolidations/skips based on mmio reads in there?
> 
> sure, I can move the mmio read to the SLPC worker thread.

Thanks, yes I think that will even be better since mmio read will only 
happen if the higher level thinks that it should boost. So the hierarchy 
of "duties" would be slightly improved. Driver tracking -> SLPC tracking 
-> HW status.

I'll come back to the latest version of the patch later today or tomorrow.

Regards,

Tvrtko
> Thanks,
> 
> Vinay.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>       /* Serializes with i915_request_retire() */
>>>       if (!test_and_set_bit(I915_FENCE_FLAG_BOOST, &rq->fence.flags)) {
>>> -        struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
>>>             if (rps_uses_slpc(rps)) {
>>>               slpc = rps_to_slpc(rps);
