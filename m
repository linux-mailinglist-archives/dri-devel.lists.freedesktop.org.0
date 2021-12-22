Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C88947D513
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 17:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D67010E172;
	Wed, 22 Dec 2021 16:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E628010E153;
 Wed, 22 Dec 2021 16:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640190103; x=1671726103;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lUDKe0WtB+NdKeIZ6iUvfZDu/wkM1tA3TTyOVM5fJdI=;
 b=F/4Blrd/G7EEoFl+sACkb//ybi5X8n8Ixd2d/Hm6il0wPqsljM/40021
 AqXUE+NLJcf8zAnlyYg3Owh6lcvy36dVXATsj159Y0geGw0dvRI+lX7fE
 1eG/B9qIg9N76vtbl5p+YRYhlHdn3FrDBhOGRqLaGCutto/84Bl6EwfKm
 LACbOElZsaI9swEp94Lyntpg7VGBct5PBLOj5vrFOmSogitTFUV1uzeeC
 G7BqEqrycDhPDpS4EDPifHU6PzBJ/Vr4BmubfUotAdPrdq+rpMe/gu9YD
 d0sSm5yr5papMubC+PYdcmFcMJd3+PEcuJCFn2etioYRkiCpVftnk+lLr g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="264852758"
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; d="scan'208";a="264852758"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 08:21:42 -0800
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; d="scan'208";a="468221510"
Received: from rajvende-mobl1.ger.corp.intel.com (HELO [10.213.198.55])
 ([10.213.198.55])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 08:21:41 -0800
Message-ID: <5921ac11-1286-1062-f702-f33bc55e4a0e@linux.intel.com>
Date: Wed, 22 Dec 2021 16:21:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Log engine resets
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20211214150704.984034-1-tvrtko.ursulin@linux.intel.com>
 <597d4ad0-fdae-49a6-b471-3a83d4c25b98@linux.intel.com>
 <20211217162254.GA22048@jons-linux-dev-box>
 <3d32df02-c02e-9c35-5165-79af1cb10100@linux.intel.com>
 <1c3b1b53-0e9e-a89c-1a77-90cbc229c637@intel.com>
 <01320c8c-a9c9-8c21-7601-75860bf11838@linux.intel.com>
 <1d78552e-8a7c-84c5-a9e6-7c7476a5e2e5@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <1d78552e-8a7c-84c5-a9e6-7c7476a5e2e5@intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/12/2021 22:14, John Harrison wrote:
> On 12/21/2021 05:37, Tvrtko Ursulin wrote:
>> On 20/12/2021 18:34, John Harrison wrote:
>>> On 12/20/2021 07:00, Tvrtko Ursulin wrote:
>>>> On 17/12/2021 16:22, Matthew Brost wrote:
>>>>> On Fri, Dec 17, 2021 at 12:15:53PM +0000, Tvrtko Ursulin wrote:
>>>>>>
>>>>>> On 14/12/2021 15:07, Tvrtko Ursulin wrote:
>>>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>>>
>>>>>>> Log engine resets done by the GuC firmware in the similar way it 
>>>>>>> is done
>>>>>>> by the execlists backend.
>>>>>>>
>>>>>>> This way we have notion of where the hangs are before the GuC gains
>>>>>>> support for proper error capture.
>>>>>>
>>>>>> Ping - any interest to log this info?
>>>>>>
>>>>>> All there currently is a non-descriptive "[drm] GPU HANG: ecode
>>>>>> 12:0:00000000".
>>>>>>
>>>>>
>>>>> Yea, this could be helpful. One suggestion below.
>>>>>
>>>>>> Also, will GuC be reporting the reason for the engine reset at any 
>>>>>> point?
>>>>>>
>>>>>
>>>>> We are working on the error state capture, presumably the registers 
>>>>> will
>>>>> give a clue what caused the hang.
>>>>>
>>>>> As for the GuC providing a reason, that isn't defined in the interface
>>>>> but that is decent idea to provide a hint in G2H what the issue 
>>>>> was. Let
>>>>> me run that by the i915 GuC developers / GuC firmware team and see 
>>>>> what
>>>>> they think.
>>>>>
>>> The GuC does not do any hang analysis. So as far as GuC is concerned, 
>>> the reason is pretty much always going to be pre-emption timeout. 
>>> There are a few ways the pre-emption itself could be triggered but 
>>> basically, if GuC resets an active context then it is because it did 
>>> not pre-empt quickly enough when requested.
>>>
>>>
>>>>>> Regards,
>>>>>>
>>>>>> Tvrtko
>>>>>>
>>>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 12 
>>>>>>> +++++++++++-
>>>>>>>    1 file changed, 11 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>>>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>>> index 97311119da6f..51512123dc1a 100644
>>>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>>>> @@ -11,6 +11,7 @@
>>>>>>>    #include "gt/intel_context.h"
>>>>>>>    #include "gt/intel_engine_pm.h"
>>>>>>>    #include "gt/intel_engine_heartbeat.h"
>>>>>>> +#include "gt/intel_engine_user.h"
>>>>>>>    #include "gt/intel_gpu_commands.h"
>>>>>>>    #include "gt/intel_gt.h"
>>>>>>>    #include "gt/intel_gt_clock_utils.h"
>>>>>>> @@ -3934,9 +3935,18 @@ static void capture_error_state(struct 
>>>>>>> intel_guc *guc,
>>>>>>>    {
>>>>>>>        struct intel_gt *gt = guc_to_gt(guc);
>>>>>>>        struct drm_i915_private *i915 = gt->i915;
>>>>>>> -    struct intel_engine_cs *engine = 
>>>>>>> __context_to_physical_engine(ce);
>>>>>>> +    struct intel_engine_cs *engine = ce->engine;
>>>>>>>        intel_wakeref_t wakeref;
>>>>>>> +    if (intel_engine_is_virtual(engine)) {
>>>>>>> +        drm_notice(&i915->drm, "%s class, engines 0x%x; GuC 
>>>>>>> engine reset\n",
>>>>>>> + intel_engine_class_repr(engine->class),
>>>>>>> +               engine->mask);
>>>>>>> +        engine = guc_virtual_get_sibling(engine, 0);
>>>>>>> +    } else {
>>>>>>> +        drm_notice(&i915->drm, "%s GuC engine reset\n", 
>>>>>>> engine->name);
>>>>>
>>>>> Probably include the guc_id of the context too then?
>>>>
>>>> Is the guc id stable and useful on its own - who would be the user?
>>> The GuC id is the only thing that matters when trying to correlate 
>>> KMD activity with a GuC log. So while it might not be of any use or 
>>> interest to an end user, it is extremely important and useful to a 
>>> kernel developer attempting to debug an issue. And that includes bug 
>>> reports from end users that are hard to repro given that the standard 
>>> error capture will include the GuC log.
>>
>> On the topic of GuC log - is there a tool in IGT (or will be) which 
>> will parse the bit saved in the error capture or how is that supposed 
>> to be used?
> Nope.
> 
> However, Alan is currently working on supporting the GuC error capture 
> mechanism. Prior to sending the reset notification to the KMD, the GuC 
> will save a whole bunch of register state to a memory buffer and send a 
> notification to the KMD that this is available. When we then get the 
> actual reset notification, we need to match the two together and include 
> a parsed, human readable version of the GuC's capture state buffer in 
> the sysfs error log output.
> 
> The GuC log should not be involved in this process. And note that any 
> register dumps in the GuC log are limited in scope and only enabled at 
> higher verbosity levels. Whereas, the official state capture is based on 
> a register list provided by the KMD and is available irrespective of 
> debug CONFIG settings, verbosity levels, etc.

Hm why should GuC log not be involved now? I thought earlier you said:

"""
And that includes bug reports from end users that are hard to repro 
given that the standard error capture will include the GuC log.
"""

Hence I thought there would be a tool in IGT which would parse the part 
saved inside the error capture.

>>> Also, note that GuC really resets contexts rather than engines. What 
>>> it reports back to i915 on a reset is simply the GuC id of the 
>>> context. It is up to i915 to work back from that to determine engine 
>>> instances/classes if required. And in the case of a virtual context, 
>>> it is impossible to extract the actual instance number. So your above 
>>> print about resetting all instances within the virtual engine mask is 
>>> incorrect/misleading. The reset would have been applied to one and 
>>> only one of those engines. If you really need to know exactly which 
>>> engine was poked, you need to look inside the GuC log.
>>
>> I think I understood that part. :) It wasn't my intent to imply in the 
>> message multiple engines have been reset, but in the case of veng, log 
>> the class and mask and the fact there was an engine reset (singular). 
>> Clearer message can probably be written.
>>
>>> However, the follow up point is to ask why you need to report the 
>>> exact class/instance? The end user doesn't care about which specific 
>>> engine got reset. They only care that their context was reset. Even a 
>>> KMD developer doesn't really care unless the concern is about a 
>>> hardware bug rather than a software bug.
>>
>> I was simply aligning both backends to log as similar information as 
>> possible. Information is there, just not logged.
>>
>> Concerning the wider topic, my thinking is end user is mainly 
>> interested to know there are any engine resets happening (to tie with 
>> the experience of UI/video glitching or whatever). Going for deeper 
>> analysis than that is probably beyond the scope of the kernel log and 
>> indeed error capture territory.
> I would still say that the important information is which context was 
> killed not which engine. Sure, knowing the engine is better than nothing 
> but if we can report something more useful then why not?

Make it so. :)

>>> My view is that the current message is indeed woefully uninformative. 
>>> However, it is more important to be reporting context identification 
>>> than engine instances. So sure, add the engine instance description 
>>> but also add something specific to the ce as well. Ideally (for me) 
>>> the GuC id and maybe something else that uniquely identifies the 
>>> context in KMD land for when not using GuC?
>>
>> Not sure we need to go that far at this level, but even if we do it 
>> could be a follow up to add new data to both backends. Not sure yet I 
>> care enough to drive this. My patch was simply a reaction to noticing 
>> there is zero information currently logged while debugging some DG2 
>> hangs.
> In terms of just reporting that a reset occurred, we already have the 
> 'GPU HANG: ecode 12:1:fbffffff, in testfw_app [8177]' message. The ecode 
> is a somewhat bizarre value but it does act as a 'something went wrong, 
> your system is not happy' type message. Going beyond that, I think 
> context identification is the next most useful thing to add.
> 
> But if you aren't even getting the 'GPU HANG' message then it sounds 
> like something is broken with what we already have. So we should fix 
> that as a first priority. If that message isn't appearing then it means 
> there was no error capture so adding extra info to the capture won't help!

The issue I have is that "GPU HANG ecode" messages are always "all 
zeros". It thought that was because GuC error capture was not there, but 
maybe its something else.

Regards,

Tvrtko
