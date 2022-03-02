Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C61B4CA2DC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 12:07:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED1910E45E;
	Wed,  2 Mar 2022 11:07:19 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9F110E45E;
 Wed,  2 Mar 2022 11:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646219239; x=1677755239;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LcpyOlJSX18absMvEVxClEXTuJw2HL1Sn9luCt1LZfk=;
 b=KN/rRuDfAFFnC/3/wz4dafC2LlTsDUPL5fosSgAfeFvct3rV+mcX1ple
 ESaeGLt04xaTsI8DAt5I4a8JngSE7PrHDLps0wfx8tpsReHwRSNP/ggno
 +T2WOcFVsSTK7pZNOWatX60zuSPzmKPPzIHKQdOnbbkbUrtVcFtesLB0A
 8Aze0EtIbP/wODpR0/PAzNRO/7vjGhmKTle1VmTcezx1gw8XUjSHm2Rzs
 vOj1zgqEqmZMX4lDwgRSFrBgk0VeAPeReN0n6zgnDLkh8IAJRBcQqT8/W
 JapbO+8I2IcjpRjd7Hj9Z9ljAh+PUHO0boiPUeMQQIBILPiJeGl+mRapr w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="236885634"
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="236885634"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 03:07:18 -0800
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="641661609"
Received: from jbuller-mobl1.ger.corp.intel.com (HELO [10.213.194.231])
 ([10.213.194.231])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 03:07:17 -0800
Message-ID: <42b114a7-04ea-71eb-7cd6-507fb4fb1655@linux.intel.com>
Date: Wed, 2 Mar 2022 11:07:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/gt: Make the heartbeat play nice
 with long pre-emption timeouts
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <20220218213307.1338478-3-John.C.Harrison@Intel.com>
 <2a486991-1bfd-9b23-0b43-9173d17b7e13@linux.intel.com>
 <e95e8710-8410-2869-dec1-7f7a9e9a74fb@intel.com>
 <18205069-1210-745f-3bcc-2eddb0d17da1@linux.intel.com>
 <94e9889d-d71a-1428-516d-2928807cbf43@intel.com>
 <6ee75384-2cf0-6b34-ed54-3c7dc9ca31a3@linux.intel.com>
 <d6624800-87b0-f992-bc83-868744e2839c@intel.com>
 <ed505a8e-2d2b-135b-aaab-7e4a0befd5ba@linux.intel.com>
 <f6c70184-121e-9a2b-6bbc-54a67af293cc@intel.com>
 <96b7ce40-12f1-9ca0-1c5a-323d63dd8153@linux.intel.com>
 <9df22764-db87-a2d2-2b03-52b4d4c6da9c@intel.com>
 <9bd316d8-004c-621a-916c-2ebad5c31b43@linux.intel.com>
 <8fb0a3a7-7968-79cb-9ea1-e31b0593acaa@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <8fb0a3a7-7968-79cb-9ea1-e31b0593acaa@intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 01/03/2022 20:59, John Harrison wrote:
> On 3/1/2022 04:09, Tvrtko Ursulin wrote:
>>
>> I'll trim it a bit again..
>>
>> On 28/02/2022 18:55, John Harrison wrote:
>>> On 2/28/2022 09:12, Tvrtko Ursulin wrote:
>>>> On 25/02/2022 18:48, John Harrison wrote:
>>>>> On 2/25/2022 10:14, Tvrtko Ursulin wrote:
>>
>> [snip]
>>
>>>>>> Your only objection is that ends up with too long total time 
>>>>>> before reset? Or something else as well?
>>>>> An unnecessarily long total heartbeat timeout is the main 
>>>>> objection. (2.5 + 12) * 5 = 72.5 seconds. That is a massive change 
>>>>> from the current 12.5s.
>>>>>
>>>>> If we are happy with that huge increase then fine. But I'm pretty 
>>>>> sure you are going to get a lot more bug reports about hung systems 
>>>>> not recovering. 10-20s is just about long enough for someone to 
>>>>> wait before leaning on the power button of their machine. Over a 
>>>>> minute is not. That kind of delay is going to cause support issues.
>>>>
>>>> Sorry I wrote 12s, while you actually said tP * 12, so 7.68s, chosen 
>>>> just so it is longer than tH * 3?
>>>>
>>>> And how do you keep coming up with factor of five? Isn't it four 
>>>> periods before "heartbeat stopped"? (Prio normal, hearbeat, barrier 
>>>> and then reset.)
>>> Prio starts at low not normal.
>>
>> Right, slipped my mind since I only keep seeing that one priority 
>> ladder block in intel_engine_heartbeat.c/heartbeat()..
>>
>>>> From the point of view of user experience I agree reasonable 
>>>> responsiveness is needed before user "reaches for the power button".
>>>>
>>>> In your proposal we are talking about 3 * 2.5s + 2 * 7.5s, so 22.5s.
>>>>
>>>> Question of workloads.. what is the actual preempt timeout compute 
>>>> is happy with? And I don't mean compute setups with disabled 
>>>> hangcheck, which you say they want anyway, but if we target defaults 
>>>> for end users. Do we have some numbers on what they are likely to run?
>>> Not that I have ever seen. This is all just finger in the air stuff. 
>>> I don't recall if we invented the number and the compute people 
>>> agreed with it or if they proposed the number to us.
>>
>> Yeah me neither. And found nothing in my email archives. :(
>>
>> Thinking about it today I don't see that disabled timeout is a 
>> practical default.
>>
>> With it, if users have something un-preemptable to run (assuming prio 
>> normal), it would get killed after ~13s (5 * 2.5).
>>
>> If we go for my scheme it gets killed in ~17.5s (3 * (2.5 + 2.5) + 2.5 
>> (third pulse triggers preempt timeout)).
>>
>> And if we go for your scheme it gets killed in ~22.5s (4 * 2.5 + 2 * 3 
>> * 2.5).
> Erm, that is not an apples to apples comparison. Your 17.5 is for an 
> engine reset tripped by the pre-emption timeout, but your 22.5s is for a 
> GT reset tripped by the heartbeat reaching the end and nuking the universe.

Right, in your scheme I did get it wrong. It would wait for GuC to reset 
the engine at the end, rather than hit the fake "hearbeat stopped" in 
that case, full reset path.

4 * 2.5 to trigger a max prio pulse, then 3 * 2.5 preempt timeout for 
GuC to reset (last hearbeat delay extended so it does not trigger). So 
17.5 as well.

> If you are saying that the first pulse at sufficient priority (third 
> being normal prio) is what causes the reset because the system is 
> working as expected and the pre-emption timeout trips the reset. In that 
> case, you have two periods to get to normal prio plus one pre-emption 
> timeout to trip the reset. I.e. (tH * 2) + tP.
> 
> Your scheme is then tH(actual) = tH(user) + tP, yes?
> So pre-emption based reset is after ((tH(user) + tP) * 2) + tP => (3 * 
> tP) + (2 * tH)
> And GT based reset is after (tH(user) + tP) * 5 => (5 * tP) + (5 * tH)
> 
> My scheme is tH(actual) = tH(user) for first four, then max(tH(user), 
> tP) for fifth.
> So pre-emption based reset is after tH(user) * 2 + tP = > tP + (2 * tH);
> And GT based reset is after (tH(user) * 4) + (max(tH(user), tP) * 1) => 
> greater of ((4 * tH) + tP) or (5 * tH)
> 
> Either way your scheme is longer. With tH(user) = 2.5s, tP(RCS) = 7.5s, 
> we get 27.5s for engine and 50s for GT versus my 12.5s for engine and 
> 17.5s for GT. With tP(RCS) = 2.5s, yours is 12.5s for engine and 25s for 
> GT versus my 7.5s for engine and 12.5s for GT.
> 
> Plus, not sure why your calculations above are using 2.5 for tP? Are you 
> still arguing that 7.5s is too long? That is a separate issue and not 
> related to the heartbeat algorithms. tP must be long enough to allow 
> 'out of box OpenCL workloads to complete'. That doesn't just mean not 
> being killed by the heartbeat, it also means not being killed by running 
> two of them concurrently (or one plus desktop OpenGL rendering) and not 
> having it killed by basic time slicing between the two contexts. The 
> heartbeat is not involved in that process. That is purely the 
> pre-emption timeout. And that is the fundamental reason why tP needs to 
> be much larger on RCS/CCS.

I was assuming 2.5s tP is enough and basing all calculation on that. 
Heartbeat or timeslicing regardless. I thought we established neither of 
us knows how long is enough.

Are you now saying 2.5s is definitely not enough? How is that usable for 
a default out of the box desktop?

>> If I did not confuse any calculation this time round, then the 
>> differences for default case for normal priority sound pretty 
>> immaterial to me.
>>
>>>> What if we gave them a default of 2.5s? That would be 4 * (2.5s + 
>>>> 2.5s) = 20s worst case until reset, comparable to your proposal. Are 
>>>> there realistic workloads which are non-preemptable for 2.5s? I am 
>>>> having hard time imagining someone would run them on a general 
>>>> purpose desktop since it would mean frozen and unusable UI anyway.
>>>>
>>>> Advantage still being in my mind that there would be no fudging of 
>>>> timeouts during driver load and heartbeat periods depending on 
>>>> priority. To me it feels more plausible to account for preempt 
>>>> timeout in heartbeat pulses that to calculate preempt timeout to be 
>>>> longer than hearbeat pulses, just to avoid races between the two.
>>> Except that when the user asks for a heartbeat period of 2.5s you are 
>>> actually setting it to 5s. How is that not a major fudge that is 
>>> totally disregarding the user's request?
>>
>> This is indeed the core question. My thinking:
>>
>> It is not defined in the heartbeat ABI that N pulses should do 
>> anything, just that they are periodic pulses which check the health of 
>> an engine.
>>
>> If we view user priority as not under our control then we can say that 
>> any heartbeat pulse can trigger preempt timeout and we should let it 
>> do that.
>>
>> From that it follows that it is justified to account for preempt 
>> timeout in the decision when to schedule heartbeat pulses and that it 
>> is legitimate to do it for all of them.
> But it can be optimised to say that it doesn't matter if you bump the 
> priority of a pulse before waiting for the pre-emption period to expire. 
> If the pulse was already high enough prio then the pre-emption has 
> already been triggered and bumping the prio has no effect. If was too 
> low then waiting for longer has no benefit at all.
> 
> All that matters is that you don't hit the end stop and trigger the GT 
> reset too early.

Yes I agree that it can also be argued what you are saying.

I was trying to weigh pros&cons of both approaches by bringing into the 
discussing the question of what are heartbeats. Given they are 
loosely/vaguely defined I think we have freedom to tweak things.

And I don't have a problem with extending the last pulse. It is 
fundamentally correct to do regardless of the backend. I just raised the 
question of whether to extend all heartbeats to account for preemption 
(and scheduling delays). (What is the point of bumping their priority 
and re-scheduling if we didn't give enough time to the engine to react? 
So opposite of the question you raise.)

What I do have a problem with is deriving the preempt timeout from the 
hearbeat period. Hence I am looking if we can instead find a fixed 
number which works, and so avoid having bi-directional coupling.

>> It also avoids the double reset problem, regardless of the backend and 
>> regardless of how the user configured the timeouts. Without the need 
>> to fudge them neither during driver load or during sysfs store.
>>
>> User has configured that heartbeat pulses should be sent every N 
>> seconds, yes, but I think we are free to account for inherent hardware 
>> and software latencies in our calculations. Especially since other 
>> than flawed Gen12 RCS, other engines will be much closer to the 
>> configured period.
>>
>> It is just the same as user asking for preempt timeout N and we say on 
>> driver load "oh no you won't get it". Same for heartbeats, they said 
>> 2.5s, we said 2.5s + broken engine factor...
> Why would you not get the pre-emption timeout? Because it is too large? 
> That is a physical limitation (of the GuC firmware) not an override 
> because we think we know better. If we can obey the user then we should 
> do so.

I was simply referring to the override in intel_engine_setup.

Regards,

Tvrtko
