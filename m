Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BD26A949B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 10:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A470810E10A;
	Fri,  3 Mar 2023 09:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC43610E0D4;
 Fri,  3 Mar 2023 09:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677837525; x=1709373525;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=43cn5v2Z9OSPVxLCaHxJZxxi3aLIc72ErHl75qOAgGQ=;
 b=AEauKBpIgAJ7uUPwMjTI3Wqsl07jbOeF+I93yKp9cH86fID0lUOhu++I
 qgoa/LF/hD9qX1z0nrCu56zPnoPo+6SHO3ZH3gkOVuMleazx+hIgLVxXe
 F6W7bagX/Ub38XpLRDpBbi6AtkM+wooSMuMLUKLov/prBrU+OfWezNq9U
 yC4OUYmNFrzf4KAmm9eRB8jmQnrptZdAwgoTP3Pf2kEDwpuJzIYIA+fBp
 kBACI44vbRr259jCBxZXSox1MEY0ZwMp0Fmid0AvMGlzrcGlnw+JR25fA
 /3M1fQsYD/JkHCye5uHt9nmUvHlbcEaNXJ8w2nqDuDYt/cLzUC7Tc5xhU A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="397598983"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="397598983"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 01:58:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="764356162"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="764356162"
Received: from shiyaowa-mobl2.ger.corp.intel.com (HELO [10.213.235.33])
 ([10.213.235.33])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 01:58:38 -0800
Message-ID: <3bded9d7-9796-4a9b-7c11-aac994d4fdc6@linux.intel.com>
Date: Fri, 3 Mar 2023 09:58:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 15/15] drm/i915: Add deadline based boost support
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Rob Clark <robdclark@gmail.com>
References: <20230302235356.3148279-1-robdclark@gmail.com>
 <20230302235356.3148279-16-robdclark@gmail.com> <ZAFnqbycMleLmRe9@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZAFnqbycMleLmRe9@intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 03/03/2023 03:21, Rodrigo Vivi wrote:
> On Thu, Mar 02, 2023 at 03:53:37PM -0800, Rob Clark wrote:
>> From: Rob Clark <robdclark@chromium.org>
>>
> 
> missing some wording here...
> 
>> v2: rebase
>>
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> ---
>>   drivers/gpu/drm/i915/i915_request.c | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
>> index 7503dcb9043b..44491e7e214c 100644
>> --- a/drivers/gpu/drm/i915/i915_request.c
>> +++ b/drivers/gpu/drm/i915/i915_request.c
>> @@ -97,6 +97,25 @@ static bool i915_fence_enable_signaling(struct dma_fence *fence)
>>   	return i915_request_enable_breadcrumb(to_request(fence));
>>   }
>>   
>> +static void i915_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>> +{
>> +	struct i915_request *rq = to_request(fence);
>> +
>> +	if (i915_request_completed(rq))
>> +		return;
>> +
>> +	if (i915_request_started(rq))
>> +		return;
> 
> why do we skip the boost if already started?
> don't we want to boost the freq anyway?

I'd wager Rob is just copying the current i915 wait boost logic.

>> +
>> +	/*
>> +	 * TODO something more clever for deadlines that are in the
>> +	 * future.  I think probably track the nearest deadline in
>> +	 * rq->timeline and set timer to trigger boost accordingly?
>> +	 */
> 
> I'm afraid it will be very hard to find some heuristics of what's
> late enough for the boost no?
> I mean, how early to boost the freq on an upcoming deadline for the
> timer?

We can off load this patch from Rob and deal with it separately, or 
after the fact?

It's a half solution without a smarter scheduler too. Like 
https://lore.kernel.org/all/20210208105236.28498-10-chris@chris-wilson.co.uk/, 
or if GuC plans to do something like that at any point.

Or bump the priority too if deadline is looming?

IMO it is not very effective to fiddle with the heuristic on an ad-hoc 
basis. For instance I have a new heuristics which improves the 
problematic OpenCL cases for further 5% (relative to the current 
waitboost improvement from adding missing syncobj waitboost). But I 
can't really test properly for regressions over platforms, stacks, 
workloads.. :(

Regards,

Tvrtko

> 
>> +
>> +	intel_rps_boost(rq);
>> +}
>> +
>>   static signed long i915_fence_wait(struct dma_fence *fence,
>>   				   bool interruptible,
>>   				   signed long timeout)
>> @@ -182,6 +201,7 @@ const struct dma_fence_ops i915_fence_ops = {
>>   	.signaled = i915_fence_signaled,
>>   	.wait = i915_fence_wait,
>>   	.release = i915_fence_release,
>> +	.set_deadline = i915_fence_set_deadline,
>>   };
>>   
>>   static void irq_execute_cb(struct irq_work *wrk)
>> -- 
>> 2.39.1
>>
