Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E63857C780
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 11:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9CE8BE0E;
	Thu, 21 Jul 2022 09:24:06 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E828BE04;
 Thu, 21 Jul 2022 09:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658395445; x=1689931445;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=asB97FmHb10f8EOLTc6igUbnECSIOxz5G7w0Nyaij+U=;
 b=mxCz+OvhnnlWtd1b4bacd6Fyzv7A403rQQMpvE8KwWnXQENSKOJACNXv
 Gx5jv2IiVwYLdciMQu3kz8PYotX0iMQeXsf+gEsdmfTAtyVOJjeJjtjPP
 oC1o5N18401dyhOtTlHjQDR25vAwjLgYeRZ1P1s4dPigSQDDh55M/IEZ0
 1JxHjsJjIeOhztNvu9wpgZK6ShNiRNN9ZAzJ37nxOAwgiYDxajkEKz5rn
 JWZ5COtTAKVzNRbBY0cYVFT2UJKajq8zt0Uycx9uuA8DS2f7wy+aeD0Mm
 Gzy854JlV9gd7Kpii3cM9yjerQVVc/MO6iL2VQeBAgc+rFEy3IHQ5kYcx Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="284555099"
X-IronPort-AV: E=Sophos;i="5.92,289,1650956400"; d="scan'208";a="284555099"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2022 02:24:04 -0700
X-IronPort-AV: E=Sophos;i="5.92,289,1650956400"; d="scan'208";a="740611270"
Received: from gpreetix-mobl1.amr.corp.intel.com (HELO [10.209.165.170])
 ([10.209.165.170])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2022 02:24:03 -0700
Message-ID: <e566ff59-68ce-c712-1619-da64c917c70a@linux.intel.com>
Date: Thu, 21 Jul 2022 10:24:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH 01/12] drm/i915: Remove bogus GEM_BUG_ON in
 unpark
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
 <20220712233136.1044951-2-John.C.Harrison@Intel.com>
 <d1cfac14-4c01-ce53-586f-01f8998bbab4@linux.intel.com>
 <c86064c9-cbcc-cdc5-0654-0493c8d3d444@intel.com>
 <0337c3d4-811e-1f5a-fe26-f0e8068497b8@linux.intel.com>
 <ce12b1df-8845-64d6-4fcd-e2e650c3bf34@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ce12b1df-8845-64d6-4fcd-e2e650c3bf34@intel.com>
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



On 21/07/2022 01:54, John Harrison wrote:
> On 7/19/2022 02:42, Tvrtko Ursulin wrote:
>> On 19/07/2022 01:05, John Harrison wrote:
>>> On 7/18/2022 05:15, Tvrtko Ursulin wrote:
>>>>
>>>> On 13/07/2022 00:31, John.C.Harrison@Intel.com wrote:
>>>>> From: Matthew Brost <matthew.brost@intel.com>
>>>>>
>>>>> Remove bogus GEM_BUG_ON which compared kernel context timeline 
>>>>> seqno to
>>>>> seqno in memory on engine PM unpark. If a GT reset occurred these 
>>>>> values
>>>>> might not match as a kernel context could be skipped. This bug was
>>>>> hidden by always switching to a kernel context on park (execlists
>>>>> requirement).
>>>>
>>>> Reset of the kernel context? Under which circumstances does that 
>>>> happen?
>>> As per description, the issue is with full GT reset.
>>>
>>>>
>>>> It is unclear if the claim is this to be a general problem or the 
>>>> assert is only invalid with the GuC. Lack of a CI reported issue 
>>>> suggests it is not a generic problem?
>>> Currently it is not an issue because we always switch to the kernel 
>>> context because that's how execlists works and the entire driver is 
>>> fundamentally based on execlist operation. When we stop using the 
>>> kernel context as a (non-functional) barrier when using GuC 
>>> submission, then you would see an issue without this fix.

Let me pick this point to try again - I am simply asking for a clear 
description of steps which lead to the problem, instead of, what I find 
are, generic and hard to penetrate statements of invalid assumptions etc.

I picked this spot because of this: "When we stop using the kernel 
context as a (non-functional) barrier when using GuC submission, then 
you would see an issue without this fix."

I point to 363324292710 ("drm/i915/guc: Don't call 
switch_to_kernel_context with GuC submission"). Hence it is not when but 
it already happened. Which in my mind then does not compute - I can't 
grok the explanation which appears to fall over on the first claim.

Or perhaps the bug on is already firing today on every GuC enabled 
machine in the CI? In which case there is a Fixes: link to be added?

I have asked about, if we have 363324292710, and if this patch is 
removing the seqno bug on, why it is not removing something more in 
__engine_unpark, gated on "is guc"? Like ss there a point to sanitizing 
the context which wasn't lost, because it wasn't used to park the engine 
with?

Or if the problem can't be hit with execlists (in case reset claim from 
the commit message misleading), why shouldn't the bug on be changed to 
contain the !guc condition instead of being remove?

I am simply asking for a clear explanation of the conditions and steps 
which lead to the bug on incorrectly firing. It doesn't have to be long 
text or anything like that, just clear so we can close this and move on.

Regards,

Tvrtko

>>
>> Issue is with GuC, GuC and full reset, or with full reset regardless 
>> of the backend?
> The issue is with code making invalid assumptions. The assumption is 
> currently not failing because the execlist backend requires the use of a 
> barrier context for a bunch of operations. The GuC backend does not 
> require this. In fact, the barrier context does not function as a 
> barrier when the scheduler is external to i915. Hence the desire to 
> remove the use of the barrier context from generic i915 operation and 
> make it only used when in execlist mode. At that point, the invalid 
> assumption will no longer work and the BUG will fire.
> 
>>
>> If issue is only with GuC patch should have drm/i915/guc prefix as 
>> minimum. But if it actually only becomes a problem when GuC backend 
>> stops parking with the kernel context when I think the whole unpark 
>> code should be refactored in a cleaner way than just removing the one 
>> assert. Otherwise what is the point of leaving everything else in there?
>>
>> Or if the issue is backend agnostic, *if* full reset happens to hit 
>> during parking, then it is different. Wouldn't that be a race with 
>> parking and reset which probably shouldn't happen to start with.
>>
> The issue is neither with GuC nor with resets, GT or otherwise. The 
> issue is with generic i915 code making assumptions about backend 
> implementations that are only correct for the execlist implementation.
> 
> John.
> 
> 
>> Regards,
>>
>> Tvrtko
>>
>>>
>>> John.
>>>
>>>
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/i915/gt/intel_engine_pm.c | 2 --
>>>>>   1 file changed, 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c 
>>>>> b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>>>>> index b0a4a2dbe3ee9..fb3e1599d04ec 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>>>>> @@ -68,8 +68,6 @@ static int __engine_unpark(struct intel_wakeref *wf)
>>>>>                ce->timeline->seqno,
>>>>>                READ_ONCE(*ce->timeline->hwsp_seqno),
>>>>>                ce->ring->emit);
>>>>> -        GEM_BUG_ON(ce->timeline->seqno !=
>>>>> -               READ_ONCE(*ce->timeline->hwsp_seqno));
>>>>>       }
>>>>>         if (engine->unpark)
>>>
> 
