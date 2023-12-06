Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9B6806C06
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 11:35:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C74210E0F6;
	Wed,  6 Dec 2023 10:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4798F10E0F6;
 Wed,  6 Dec 2023 10:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701858908; x=1733394908;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hqWL2C0DBwbU6kMR1PyMR6dn88gGotg6rQzbZPqqFK8=;
 b=epiMZK6y6qpmNzvQmlejS9ENJ+0gfYrZRJ5jaTMFmuleghujtG/QT+Fj
 HiXhNdf1YyL2PJXaBVXDzqiXjLe9ljtQ8XatlCZPrvfN9BqfZubtdD2mr
 OlEUVrQn7ktXvJP7Y4pmrhSEi/JfPEXPMwRKDvS1fsLYk8C4p59KoKN+f
 LOLQLBohDEz2HvK8uKdQYjjhFcC18e5Ksa6yWuyZE7lJC3w740Nz2ZZxZ
 2xOWKtCe6b0lkpXmEQwz/G5Gj2bzhHiYjkrQJwnyxQjhGwOv9woJ9u1X/
 0qkaxKf8sLCGFKcSaaTIARXbhzeilI8mYj1HBL5mXXh7kC58OkT3/kQS9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="458362569"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="458362569"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 02:35:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="721033564"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="721033564"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.248.101])
 ([10.94.248.101])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 02:35:06 -0800
Message-ID: <8a0013bc-00e1-47c6-8dc8-bc8787f691a1@linux.intel.com>
Date: Wed, 6 Dec 2023 11:35:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/gt: Convert reset prepare failure log to trace
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20231205085248.2577-1-nirmoy.das@intel.com>
 <40875e9a-3729-4153-8de2-69d0ce586442@intel.com>
 <69036ebc-561f-4c9b-b68b-04f7e1c77e27@linux.intel.com>
 <4eb477b8-2756-42c3-b349-566c2d4bddfc@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <4eb477b8-2756-42c3-b349-566c2d4bddfc@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

On 12/5/2023 8:50 PM, John Harrison wrote:
> On 12/5/2023 02:39, Nirmoy Das wrote:
>> Hi John,
>>
>> On 12/5/2023 10:10 AM, John Harrison wrote:
>>> On 12/5/2023 00:52, Nirmoy Das wrote:
>>>> gen8_engine_reset_prepare() can fail when HW fails to set
>>>> RESET_CTL_READY_TO_RESET bit. In some cases this is not fatal
>>>> error as driver will retry.
>>>>
>>>> Convert the log to a trace log for debugging without triggering
>>>> unnecessary concerns in CI or for end-users during non-fatal 
>>>> scenarios.
>>> I strongly disagree with this change. The hardware spec for the 
>>> RESET_CTL and GDRST registers are that they will self clear within a 
>>> matter of microseconds. If something is so badly wrong with the 
>>> hardware that it can't even manage to reset
>>
>>
>> This message is for reset readiness  poll timeout not that the reset 
>> is failed which doesn't sound so serious if the subsequent attempt 
>> managed reset the engine.
> Not sure what the distinction is. The reset procedure is poke 
> RESET_CTL wait for it to clear, poke GDRST and wait for it to clear. 
> Just because step one is failing rather than step 2 does not mean that 
> the reset as a whole has not failed.
>
> Note that the purpose of RESET_CTL is to pause a bunch of stuff like 
> the command streamers to prevent them from issuing new memory requests 
> while the reset is in progress. If it fails, it likely means that a CS 
> is refusing to stop. Most probably because it can't reach a stopping 
> point because it is stuck waiting on a lost memory request or similar. 
> And the point of stopping further memory requests during reset is that 
> if the memory channel gets out of sync (because only the GT side is 
> reset during a GT reset) then that can result in total system failure. 
> As in potentially even the CPU can no longer get to memory if it is an 
> integrated platform. So yes, it can be quite a serious failure indeed.
>

Thanks bspec didn't explain those details. My intention was to 
acknowledge that engine reset is a complicated process which why the 
driver retries  and don't spook CI/user if subsequent reset works but I 
get your objection on this.

>>
>> I couldn't get enough details when this can happen that HW takes very 
>> long time to set the readiness bit.
> Is it simply 'taking a long time' or is never clearing at all? If it 
> is just that the timeout is too short then the proper fix would be to 
> increase the timeout. But if it is taking seconds or longer or just 
> never succeeding at all, then something is very bad.

I tried with 10x timeout without any help so I think the CS is stuck 
though re-try works. I will try to get more details from HW team on this 
issue.

>
>>
>>
>>> then that is something that very much warrants more than a 
>>> completely silent trace event. It most certainly should be flagged 
>>> as a failure in CI.
>>>
>>> Just because the driver will retry does not mean that this is not a 
>>> serious error. And if the first attempt failed, why would a 
>>> subsequent attempt succeed?
>>
>> The patch is not ignoring the failure. If the subsequent attempt 
>> fails then driver load will fail or it will be wedged if that happens 
>> after driver load.
> One thing I really hate about our driver is the total lack of 
> information when something goes wrong during load. The driver wedges 
> in total silence. There are many error paths that have no reporting at 
> all. Which means you are left with a totally useless bug report.
>
>
>>
>>
>>> Escalating to FLR may have more success, but that is not something 
>>> that i915 currently does.
>>
>> Do we still need to do FLR if a subsequent engine reset failure ?
> Assuming that we are talking about modern(ish) platforms, an engine 
> reset failure would be hit by GuC rather than i915, but that would be 
> escalated to an i915 based full GT reset. Generally speaking though, 
> if the engine reset fails the GT reset isn't going to do much better. 
> It would fix a dead GuC problem but it can't help with memory related 
> issues. If the full GT reset fails then we are out of escalation 
> routes as there is no FLR path at present (I think we have that at 
> driver unload on MTL but not for general reset?). The FLR resets a lot 
> more than just the GT, so it does have a chance to fix some issues 
> that a GT reset can't. After driver-level FLR, there is PCI level FLR. 
> Not sure if that involves a full power down and restart, but if not 
> then that would be the last escalation possible. A power cycle really 
> should fix any issues, if it doesn't then it's time to return the 
> system as being totally dead!
>
> My recollection is that the vast majority of engine reset failures 
> I've looked at have been completely catastrophic and the system only 
> recovered after a reboot. I.e. after the card was power cycled. Such 
> issues were generally caused by bad memory. Once the path to memory 
> has died, there really is not much of the GPU that can do anything at 
> all and there isn't much that can be done to recover it.


Thanks,

Nirmoy

>
> John.
>
>
>>
>>
>> Regards,
>>
>> Nirmoy
>>
>>>
>>> John.
>>>
>>>
>>>>
>>>> v2: Improve commit message(Tvrtko)
>>>>
>>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>>>> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5591
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>>>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gt/intel_reset.c | 8 ++++----
>>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c 
>>>> b/drivers/gpu/drm/i915/gt/intel_reset.c
>>>> index d5ed904f355d..e6fbc6202c80 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
>>>> @@ -593,10 +593,10 @@ static int gen8_engine_reset_prepare(struct 
>>>> intel_engine_cs *engine)
>>>>       ret = __intel_wait_for_register_fw(uncore, reg, mask, ack,
>>>>                          700, 0, NULL);
>>>>       if (ret)
>>>> -        gt_err(engine->gt,
>>>> -               "%s reset request timed out: {request: %08x, 
>>>> RESET_CTL: %08x}\n",
>>>> -               engine->name, request,
>>>> -               intel_uncore_read_fw(uncore, reg));
>>>> +        GT_TRACE(engine->gt,
>>>> +             "%s reset request timed out: {request: %08x, 
>>>> RESET_CTL: %08x}\n",
>>>> +             engine->name, request,
>>>> +             intel_uncore_read_fw(uncore, reg));
>>>>         return ret;
>>>>   }
>>>
>
