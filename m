Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D5A415F12
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 15:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A22D16ED13;
	Thu, 23 Sep 2021 13:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2DE16ED13;
 Thu, 23 Sep 2021 13:00:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10115"; a="223875980"
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="223875980"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 06:00:03 -0700
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="702704974"
Received: from gerardqu-mobl.ger.corp.intel.com (HELO [10.213.243.237])
 ([10.213.243.237])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 06:00:01 -0700
Subject: Re: [Intel-gfx] [PATCH v6 3/9] drm/i915/gt: Increase suspend timeout
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
References: <20210922062527.865433-1-thomas.hellstrom@linux.intel.com>
 <20210922062527.865433-4-thomas.hellstrom@linux.intel.com>
 <f276fe3d-5ed8-7ac9-440d-3703f6f0e5e5@linux.intel.com>
 <0f1050c9-b9fe-b587-2aac-cceae4032638@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <061617be-9bf4-7853-a34d-7501f6b3179f@linux.intel.com>
Date: Thu, 23 Sep 2021 13:59:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <0f1050c9-b9fe-b587-2aac-cceae4032638@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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


On 23/09/2021 12:47, Thomas Hellström wrote:
> Hi, Tvrtko,
> 
> On 9/23/21 12:13 PM, Tvrtko Ursulin wrote:
>>
>> On 22/09/2021 07:25, Thomas Hellström wrote:
>>> With GuC submission on DG1, the execution of the requests times out
>>> for the gem_exec_suspend igt test case after executing around 800-900
>>> of 1000 submitted requests.
>>>
>>> Given the time we allow elsewhere for fences to signal (in the order of
>>> seconds), increase the timeout before we mark the gt wedged and proceed.
>>
>> I suspect it is not about requests not retiring in time but about the 
>> intel_guc_wait_for_idle part of intel_gt_wait_for_idle. Although I 
>> don't know which G2H message is the code waiting for at suspend time 
>> so perhaps something to run past the GuC experts.
> 
> So what's happening here is that the tests submits 1000 requests, each 
> writing a value to an object, and then that object content is checked 
> after resume. With GuC it turns out that only 800-900 or so values are 
> actually written before we time out, and the test (basic-S3) fails, but 
> not on every run.

Yes and that did not make sense to me. It is a single context even so I 
did not come up with an explanation why would GuC be slower.

Unless it somehow manages to not even update the ring tail in time and 
requests are still only stuck in the software queue? Perhaps you can see 
that from context tail and head when it happens.

> This is a bit interesting in itself, because I never saw the hang-S3 
> test fail, which from what I can tell basically is an identical test but 
> with a spinner submitted after the 1000th request. Could be that the 
> suspend backup code ends up waiting for something before we end up in 
> intel_gt_wait_for_idle, giving more requests time to execute.

No idea, I don't know the suspend paths that well. For instance before 
looking at the code I thought we would preempt what's executing and not 
wait for everything that has been submitted to finish. :)

>> Anyway, if that turns out to be correct then perhaps it would be 
>> better to split the two timeouts (like if required GuC timeout is 
>> perhaps fundamentally independent) so it's clear who needs how much 
>> time. Adding Matt and John to comment.
> 
> You mean we have separate timeouts depending on whether we're using GuC 
> or execlists submission?

No, I don't know yet. First I think we need to figure out what exactly 
is happening.

>> To be clear, as timeout is AFAIK an arbitrary value, I don't have 
>> fundamental objections here. Just think it would be good to have 
>> accurate story in the commit message.
> 
> Ok. yes. I wonder whether we actually should increase this timeout even 
> more since now the watchdog times out after 10+ seconds? I guess those 
> long-running requests could be executing also at suspend time.

We probably should not just increase it hugely. Because watchdog is a 
separate story since it applies to unsubmited and unready requests and 
suspend can happen fine with those around I think.

Regards,

Tvrtko

> /Thomas
> 
> 
> 
> 
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/intel_gt_pm.c | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c 
>>> b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>>> index dea8e2479897..f84f2bfe2de0 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>>> @@ -19,6 +19,8 @@
>>>   #include "intel_rps.h"
>>>   #include "intel_wakeref.h"
>>>   +#define I915_GT_SUSPEND_IDLE_TIMEOUT (HZ / 2)
>>> +
>>>   static void user_forcewake(struct intel_gt *gt, bool suspend)
>>>   {
>>>       int count = atomic_read(&gt->user_wakeref);
>>> @@ -279,7 +281,7 @@ static void wait_for_suspend(struct intel_gt *gt)
>>>       if (!intel_gt_pm_is_awake(gt))
>>>           return;
>>>   -    if (intel_gt_wait_for_idle(gt, I915_GEM_IDLE_TIMEOUT) == 
>>> -ETIME) {
>>> +    if (intel_gt_wait_for_idle(gt, I915_GT_SUSPEND_IDLE_TIMEOUT) == 
>>> -ETIME) {
>>>           /*
>>>            * Forcibly cancel outstanding work and leave
>>>            * the gpu quiet.
>>>
