Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561675F2FFB
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 14:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6DC10E386;
	Mon,  3 Oct 2022 12:00:12 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C0710E326;
 Mon,  3 Oct 2022 12:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664798404; x=1696334404;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=0vLRwsAghV2ruv4X8qB76VGZ6XMlYF5Ra33xu3JU8kY=;
 b=N/rkstRq+fXfjAdJkFAUrA+wL/RZ8Rok47n56reg5oYQa+IWqE3k0zXO
 EhTJ5Y8naFAX+FyBtr01rbso+Ddw8URgTV1Q8dkiKTvfoXsKheSApSvYj
 8aCWoCwPvurKJXS/EsnlrupzbCmfw9g7/4vSCjF53yn4khKMwTRxVp63F
 c43a6DHohTcumGVSiQg1rDJjNh0vamXfdbgljBWOvRoIC4BKZ0uF5m9gw
 klIIEH5e1d1D0bDG+RsDLwCHMTuO2Z6anwcs2GcQ9pN5T3HjQi1Z0ogmo
 9m2ahgRsa8uQ/aCXdGSFB62hYecWcbE8k6817Ek2/o+079Ut3eZgP0M3R g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="285750553"
X-IronPort-AV: E=Sophos;i="5.93,365,1654585200"; d="scan'208";a="285750553"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 05:00:03 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="623505926"
X-IronPort-AV: E=Sophos;i="5.93,365,1654585200"; d="scan'208";a="623505926"
Received: from praffert-mobl.ger.corp.intel.com (HELO [10.213.196.20])
 ([10.213.196.20])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 05:00:02 -0700
Message-ID: <0e29ab23-4304-bd62-7065-4d1ab3a1461a@linux.intel.com>
Date: Mon, 3 Oct 2022 13:00:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [Intel-gfx] [PATCH v4 3/4] drm/i915: Make the heartbeat play nice
 with long pre-emption timeouts
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20220929021813.2172701-1-John.C.Harrison@Intel.com>
 <20220929021813.2172701-4-John.C.Harrison@Intel.com>
 <a2c2cddf-009b-a2e0-2af2-6f1553c59cbc@linux.intel.com>
 <ae042c9d-f6f1-2ecd-e23a-7d6994c97151@intel.com>
 <28690581-b934-b99f-feb9-78a8e6c2d052@linux.intel.com>
 <89566262-2cd0-f456-e8b2-c7bc6ad6fe36@intel.com>
 <c61d540a-9b3a-76f5-2641-c508a6e2bcbd@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <c61d540a-9b3a-76f5-2641-c508a6e2bcbd@linux.intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 03/10/2022 08:53, Tvrtko Ursulin wrote:
> 
> On 30/09/2022 18:44, John Harrison wrote:
>> On 9/30/2022 02:22, Tvrtko Ursulin wrote:
>>> On 29/09/2022 17:21, John Harrison wrote:
>>>> On 9/29/2022 00:42, Tvrtko Ursulin wrote:
>>>>> On 29/09/2022 03:18, John.C.Harrison@Intel.com wrote:
>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>
>>>>>> Compute workloads are inherently not pre-emptible for long periods on
>>>>>> current hardware. As a workaround for this, the pre-emption timeout
>>>>>> for compute capable engines was disabled. This is undesirable with 
>>>>>> GuC
>>>>>> submission as it prevents per engine reset of hung contexts. Hence 
>>>>>> the
>>>>>> next patch will re-enable the timeout but bumped up by an order of
>>>>>> magnitude.
>>>>>>
>>>>>> However, the heartbeat might not respect that. Depending upon current
>>>>>> activity, a pre-emption to the heartbeat pulse might not even be
>>>>>> attempted until the last heartbeat period. Which means that only one
>>>>>> period is granted for the pre-emption to occur. With the aforesaid
>>>>>> bump, the pre-emption timeout could be significantly larger than this
>>>>>> heartbeat period.
>>>>>>
>>>>>> So adjust the heartbeat code to take the pre-emption timeout into
>>>>>> account. When it reaches the final (high priority) period, it now
>>>>>> ensures the delay before hitting reset is bigger than the pre-emption
>>>>>> timeout.
>>>>>>
>>>>>> v2: Fix for selftests which adjust the heartbeat period manually.
>>>>>>
>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>> ---
>>>>>>   .../gpu/drm/i915/gt/intel_engine_heartbeat.c  | 19 
>>>>>> +++++++++++++++++++
>>>>>>   1 file changed, 19 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c 
>>>>>> b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>>>>>> index a3698f611f457..823a790a0e2ae 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>>>>>> @@ -22,9 +22,28 @@
>>>>>>     static bool next_heartbeat(struct intel_engine_cs *engine)
>>>>>>   {
>>>>>> +    struct i915_request *rq;
>>>>>>       long delay;
>>>>>>         delay = READ_ONCE(engine->props.heartbeat_interval_ms);
>>>>>> +
>>>>>> +    rq = engine->heartbeat.systole;
>>>>>> +
>>>>>> +    if (rq && rq->sched.attr.priority >= I915_PRIORITY_BARRIER &&
>>>>>> +        delay == engine->defaults.heartbeat_interval_ms) {
>>>>>
>>>>> Maybe I forgot but what is the reason for the check against the 
>>>>> default heartbeat interval?
>>>> That's the 'v2: fix for selftests that manually adjust the 
>>>> heartbeat'. If something (or someone) has explicitly set an override 
>>>> of the heartbeat then it has to be assumed that they know what they 
>>>> are doing, and if things don't work any more that's their problem. 
>>>> But if we don't respect their override then they won't get the 
>>>> timings they expect and the selftest will fail.
>>>
>>> Isn't this a bit too strict for the non-selftest case? If the new 
>>> concept is extending the last pulse to guarantee preemption, then I 
>>> think we could allow tweaking of the heartbeat period. Like what if 
>>> user wants 1s, or 10s instead of 2.5s - why would that need to break 
>>> the improvement from this patch?
>> Then the user is back to where they were before this patch.
>>
>>>
>>> In what ways selftests fail? Are they trying to guess time to reset 
>>> based on the hearbeat period set? If so perhaps add a helper to query 
>>> it based on the last pulse extension.
>>
>> I don't recall. It was six months ago when I was actually working on 
>> this. And right now I do not have the time to go back and re-run all 
>> the testing and re-write a bunch of self tests with whole new helpers 
>> and algorithms and whatever else might be necessary to polish this to 
>> perfection. And in the meantime, all the existing issues are still 
>> present - there is no range checking on any of this stuff, it is very 
>> possible for a driver with default settings to break a legal workload 
>> because the heartbeat and pre-emption are fighting with each other, we 
>> don't even have per engine resets enabled, etc.
>>
>> Maybe it could be even better with a follow up patch. Feel free to do 
>> that. But as it stands, this patch set significantly improves the 
>> situation without making anything worse.
> 
> As we seem to be in agreement that the check against default heartbeat 
> is a hack with only purpose to work around assumptions made by 
> selftests, then please file a Jira about removing it (this hack). Then 
> work can be assigned to someone to clean it up. With that done I would 
> agree the series is indeed an improvement and it would have my ack.

One more thing - put a comment in the code along the lines of 
"FIXME/HACK: Work around selftests assumptions by only extending the 
last heartbeat if the period is at default value". The the Jira can 
associate to that comment.

Until that is resolve it may also be worth emitting a drm_notice if 
heartbeat is changed via sysfs? Informing users the things will not work 
as expected if they fiddle with it. Whether as a blanket warning or 
checking first the 3-4x heartbeat vs preempt timeout value. That message 
should then go away once the follow up work to fix the selftests is 
done. See what the other reviewers will think.

Regards,

Tvrtko
