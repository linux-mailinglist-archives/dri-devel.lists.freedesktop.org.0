Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDF26A9A3B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 16:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9641710E6AC;
	Fri,  3 Mar 2023 15:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A2E10E6A9;
 Fri,  3 Mar 2023 15:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677856101; x=1709392101;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=s8d3oS7J43u4ul75ZgButvm6v6s/YZ4L8cHni8MIrkk=;
 b=DAoV1EOiU672QSwkXgkZImvQ2WJmqJaUnOX+ZHIZdgdptVWEcZ9JUaFp
 5SYV+l/ChyepL6J7Vbn+4cyqXFBqS17RVzu1JgFmgHSANOl3358CY5+mo
 LdiHrhLqfkJdDeei35ZQ6/Nju0VPWDY8Us7B5NtlHZrY4aeGPyiEabhrl
 /m9Bu5T7uu9HiaH98rwT/Ia3mk5zGsW7jbYi3ZBxlTRcIYXfubxNgJO5l
 D/xCYIfoabvbF+oiH1+dj6/SCdCiDuuvx93NjEjWOo0RZUyxX6mpGULmA
 5plhbReOPLCnz4qTrfTy467HRZLWO352G5PvrSlsHwl4G5Zr51je9O3zw Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="399871687"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; d="scan'208";a="399871687"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 07:07:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="739528150"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="739528150"
Received: from npalanis-mobl1.ger.corp.intel.com (HELO [10.213.202.105])
 ([10.213.202.105])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 07:07:06 -0800
Message-ID: <a5ced581-4060-0fa2-d2fc-d18beee6fdb5@linux.intel.com>
Date: Fri, 3 Mar 2023 15:07:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 15/15] drm/i915: Add deadline based boost support
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20230302235356.3148279-1-robdclark@gmail.com>
 <20230302235356.3148279-16-robdclark@gmail.com> <ZAFnqbycMleLmRe9@intel.com>
 <3bded9d7-9796-4a9b-7c11-aac994d4fdc6@linux.intel.com>
 <CAF6AEGs6QYTESuwB8E9cTbv9LqQX16tz6-geeu9BCyFos9=sOA@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAF6AEGs6QYTESuwB8E9cTbv9LqQX16tz6-geeu9BCyFos9=sOA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Rob Clark <robdclark@chromium.org>, Luben Tuikov <luben.tuikov@amd.com>,
 Matt Turner <mattst88@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 03/03/2023 14:48, Rob Clark wrote:
> On Fri, Mar 3, 2023 at 1:58 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> On 03/03/2023 03:21, Rodrigo Vivi wrote:
>>> On Thu, Mar 02, 2023 at 03:53:37PM -0800, Rob Clark wrote:
>>>> From: Rob Clark <robdclark@chromium.org>
>>>>
>>>
>>> missing some wording here...
>>>
>>>> v2: rebase
>>>>
>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>> ---
>>>>    drivers/gpu/drm/i915/i915_request.c | 20 ++++++++++++++++++++
>>>>    1 file changed, 20 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
>>>> index 7503dcb9043b..44491e7e214c 100644
>>>> --- a/drivers/gpu/drm/i915/i915_request.c
>>>> +++ b/drivers/gpu/drm/i915/i915_request.c
>>>> @@ -97,6 +97,25 @@ static bool i915_fence_enable_signaling(struct dma_fence *fence)
>>>>       return i915_request_enable_breadcrumb(to_request(fence));
>>>>    }
>>>>
>>>> +static void i915_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>>>> +{
>>>> +    struct i915_request *rq = to_request(fence);
>>>> +
>>>> +    if (i915_request_completed(rq))
>>>> +            return;
>>>> +
>>>> +    if (i915_request_started(rq))
>>>> +            return;
>>>
>>> why do we skip the boost if already started?
>>> don't we want to boost the freq anyway?
>>
>> I'd wager Rob is just copying the current i915 wait boost logic.
> 
> Yup, and probably incorrectly.. Matt reported fewer boosts/sec
> compared to your RFC, this could be the bug

Hm, there I have preserved this same !i915_request_started logic.

Presumably it's not just fewer boosts but lower performance. How is he 
setting the deadline? Somehow from clFlush or so?

Regards,

Tvrtko

P.S. Take note that I did not post the latest version of my RFC. The one 
where I fix the fence chain and array misses you pointed out. I did not 
think it would be worthwhile given no universal love for it, but if 
people are testing with it more widely that I was aware perhaps I should.

>>>> +
>>>> +    /*
>>>> +     * TODO something more clever for deadlines that are in the
>>>> +     * future.  I think probably track the nearest deadline in
>>>> +     * rq->timeline and set timer to trigger boost accordingly?
>>>> +     */
>>>
>>> I'm afraid it will be very hard to find some heuristics of what's
>>> late enough for the boost no?
>>> I mean, how early to boost the freq on an upcoming deadline for the
>>> timer?
>>
>> We can off load this patch from Rob and deal with it separately, or
>> after the fact?
> 
> That is completely my intention, I expect you to replace my i915 patch ;-)
> 
> Rough idea when everyone is happy with the core bits is to setup an
> immutable branch without the driver specific patches, which could be
> merged into drm-next and $driver-next and then each driver team can
> add there own driver patches on top
> 
> BR,
> -R
> 
>> It's a half solution without a smarter scheduler too. Like
>> https://lore.kernel.org/all/20210208105236.28498-10-chris@chris-wilson.co.uk/,
>> or if GuC plans to do something like that at any point.
>>
>> Or bump the priority too if deadline is looming?
>>
>> IMO it is not very effective to fiddle with the heuristic on an ad-hoc
>> basis. For instance I have a new heuristics which improves the
>> problematic OpenCL cases for further 5% (relative to the current
>> waitboost improvement from adding missing syncobj waitboost). But I
>> can't really test properly for regressions over platforms, stacks,
>> workloads.. :(
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>>> +
>>>> +    intel_rps_boost(rq);
>>>> +}
>>>> +
>>>>    static signed long i915_fence_wait(struct dma_fence *fence,
>>>>                                  bool interruptible,
>>>>                                  signed long timeout)
>>>> @@ -182,6 +201,7 @@ const struct dma_fence_ops i915_fence_ops = {
>>>>       .signaled = i915_fence_signaled,
>>>>       .wait = i915_fence_wait,
>>>>       .release = i915_fence_release,
>>>> +    .set_deadline = i915_fence_set_deadline,
>>>>    };
>>>>
>>>>    static void irq_execute_cb(struct irq_work *wrk)
>>>> --
>>>> 2.39.1
>>>>
