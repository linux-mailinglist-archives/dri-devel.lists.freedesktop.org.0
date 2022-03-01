Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 900114C8B46
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 13:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D545410E7DC;
	Tue,  1 Mar 2022 12:09:51 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EF710E7BE;
 Tue,  1 Mar 2022 12:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646136590; x=1677672590;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=25LkAkKWEzxC7W7Vr+oWmYdoPTAgfppdbQXzcP+UJIw=;
 b=cGwLDVuSjzkKfS3yKNT8x+fZ6xF3cN4M9SF9sM8ieOmGy87RsvAJH3Xx
 eU3OZoQunwShNFBvQju0scF4ydJ1a7mjTAy6eQH2ZwwGtII6H8lrHNzru
 9bkRdKAHSgTJpH1Qy/1xRF6Maie/usvRq4NeNvxfJ+nsfuro8J3HqsXVa
 i+dB1NDZFozAd8F5EhLtgsc89gycgt7+986TKcQlLnez7qX2x2tSnSkvD
 fj13A1Gf8r6NRt0jg9mQCR5C1XwTMS46NYbBY8kNiNA20BZoE/xkgwpss
 2dEoD8bNBZhMc/Mu9oz+IY8XQMWWpl6TKHMGRhxsFhDyjB7OTRjls/NsE A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="236627139"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="236627139"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 04:09:50 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="510486390"
Received: from ssahani-mobl.amr.corp.intel.com (HELO [10.212.127.177])
 ([10.212.127.177])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 04:09:48 -0800
Message-ID: <9bd316d8-004c-621a-916c-2ebad5c31b43@linux.intel.com>
Date: Tue, 1 Mar 2022 12:09:46 +0000
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
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <9df22764-db87-a2d2-2b03-52b4d4c6da9c@intel.com>
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


I'll trim it a bit again..

On 28/02/2022 18:55, John Harrison wrote:
> On 2/28/2022 09:12, Tvrtko Ursulin wrote:
>> On 25/02/2022 18:48, John Harrison wrote:
>>> On 2/25/2022 10:14, Tvrtko Ursulin wrote:

[snip]

>>>> Your only objection is that ends up with too long total time before 
>>>> reset? Or something else as well?
>>> An unnecessarily long total heartbeat timeout is the main objection. 
>>> (2.5 + 12) * 5 = 72.5 seconds. That is a massive change from the 
>>> current 12.5s.
>>>
>>> If we are happy with that huge increase then fine. But I'm pretty 
>>> sure you are going to get a lot more bug reports about hung systems 
>>> not recovering. 10-20s is just about long enough for someone to wait 
>>> before leaning on the power button of their machine. Over a minute is 
>>> not. That kind of delay is going to cause support issues.
>>
>> Sorry I wrote 12s, while you actually said tP * 12, so 7.68s, chosen 
>> just so it is longer than tH * 3?
>>
>> And how do you keep coming up with factor of five? Isn't it four 
>> periods before "heartbeat stopped"? (Prio normal, hearbeat, barrier 
>> and then reset.)
> Prio starts at low not normal.

Right, slipped my mind since I only keep seeing that one priority ladder 
block in intel_engine_heartbeat.c/heartbeat()..

>> From the point of view of user experience I agree reasonable 
>> responsiveness is needed before user "reaches for the power button".
>>
>> In your proposal we are talking about 3 * 2.5s + 2 * 7.5s, so 22.5s.
>>
>> Question of workloads.. what is the actual preempt timeout compute is 
>> happy with? And I don't mean compute setups with disabled hangcheck, 
>> which you say they want anyway, but if we target defaults for end 
>> users. Do we have some numbers on what they are likely to run?
> Not that I have ever seen. This is all just finger in the air stuff. I 
> don't recall if we invented the number and the compute people agreed 
> with it or if they proposed the number to us.

Yeah me neither. And found nothing in my email archives. :(

Thinking about it today I don't see that disabled timeout is a practical 
default.

With it, if users have something un-preemptable to run (assuming prio 
normal), it would get killed after ~13s (5 * 2.5).

If we go for my scheme it gets killed in ~17.5s (3 * (2.5 + 2.5) + 2.5 
(third pulse triggers preempt timeout)).

And if we go for your scheme it gets killed in ~22.5s (4 * 2.5 + 2 * 3 * 
2.5).

If I did not confuse any calculation this time round, then the 
differences for default case for normal priority sound pretty immaterial 
to me.

>> What if we gave them a default of 2.5s? That would be 4 * (2.5s + 
>> 2.5s) = 20s worst case until reset, comparable to your proposal. Are 
>> there realistic workloads which are non-preemptable for 2.5s? I am 
>> having hard time imagining someone would run them on a general purpose 
>> desktop since it would mean frozen and unusable UI anyway.
>>
>> Advantage still being in my mind that there would be no fudging of 
>> timeouts during driver load and heartbeat periods depending on 
>> priority. To me it feels more plausible to account for preempt timeout 
>> in heartbeat pulses that to calculate preempt timeout to be longer 
>> than hearbeat pulses, just to avoid races between the two.
> Except that when the user asks for a heartbeat period of 2.5s you are 
> actually setting it to 5s. How is that not a major fudge that is totally 
> disregarding the user's request?

This is indeed the core question. My thinking:

It is not defined in the heartbeat ABI that N pulses should do anything, 
just that they are periodic pulses which check the health of an engine.

If we view user priority as not under our control then we can say that 
any heartbeat pulse can trigger preempt timeout and we should let it do 
that.

 From that it follows that it is justified to account for preempt 
timeout in the decision when to schedule heartbeat pulses and that it is 
legitimate to do it for all of them.

It also avoids the double reset problem, regardless of the backend and 
regardless of how the user configured the timeouts. Without the need to 
fudge them neither during driver load or during sysfs store.

User has configured that heartbeat pulses should be sent every N 
seconds, yes, but I think we are free to account for inherent hardware 
and software latencies in our calculations. Especially since other than 
flawed Gen12 RCS, other engines will be much closer to the configured 
period.

It is just the same as user asking for preempt timeout N and we say on 
driver load "oh no you won't get it". Same for heartbeats, they said 
2.5s, we said 2.5s + broken engine factor...

I don't see a problem there. Nothing timing sensitive relies on the 
heartbeat interval nor we provided any guarantees.

That patch from Chris for instance AFAIR accounted for scheduling or 
context switch latencies. Because what is the point of sending further 
elevated priority pulses if we did not leave enough time to the engine 
to schedule them in, react with preemption, or signalling completion?

>>>>>>> Persistence itself can stay. There are valid UMD use cases. It is 
>>>>>>> just massively over complicated and doesn't work in all corner 
>>>>>>> cases when not using execlist submission or on newer platforms. 
>>>>>>> The simplification that is planned is to allow contexts to 
>>>>>>> persist until the associated DRM master handle is closed. At that 
>>>>>>> point, all contexts associated with that DRM handle are killed. 
>>>>>>> That is what AMD and others apparently implement.
>>>>>>
>>>>>> Okay, that goes against one recent IGT patch which appeared to 
>>>>>> work around something by moving the position of _context_ close.
>>>>> No it does not. The context close is not the trigger. The trigger is 
>>>>
>>>> Well patch says:
>>>> """
>>>> The spin all test relied on context persistence unecessarily by trying
>>>> to destroy contexts while keeping spinners active.
>>>> The current implementation of context persistence in i915 can cause
>>>> failures with GuC enabled, and persistence is not needed for this test.
>>>>
>>>> Moving intel_ctx_destroy after igt_spin_end.
>>>> """
>>>>
>>>> Implying moving context close to after spin end fixes things for 
>>>> GuC, not fd close.
>>> That's because persistence is currently a big pile of poo and does 
>>> not work in all the corner cases. The correct solution is to leave 
>>> the IGT alone and just fix the implementation of persistence. 
>>> However, the IGT update to not use the broken feature is a trivial 
>>> test change (two lines?) whereas fixing the broken feature is a 
>>> significant KMD re-work. It needs to be done but no-one currently has 
>>> the time to do it. But trivially changing the test allows the test to 
>>> work and test the features it is meant to be testing (which is not 
>>> persistence).
>>
>> Clear as mud. If the statement is that persistence cannot simply be 
>> removed, then for sure it cannot be said that anything can be fixed or 
>> unblocked by allowing some test to pass with GuC, by making them avoid 
>> using persistence (and not even explicitly with a context param). It 
>> implies persistence does not work with the GuC, which is then in 
>> contradiction with the statement that we cannot just remove 
>> persistence. I truly have no idea what the argument is here.
> Persistence works in the right set of circumstances. Those circumstances 
> do not involve dynamically changing heartbeat settings, platforms with 
> dependent engines, etc. The correct fix is to leave the IGT test alone 
> and fix the persistence implementation. However, that is not trivial and 
> we have many other high priority holes still to plug. Whereas changing 
> the IGT to not use a feature it is not intended to be testing anyway is 
> a trivial change and gets us the test coverage of what that IGT is meant 
> to be for.

It may be acceptable if someone is reviewing overall coverage and making 
sure all is not removed and so a missing ABI in GuC backend not swept 
under the carpet. That's my main concern. If it is acknowledged 
persistence is a needed ABI, then how can we upstream dependent engine 
support without making sure this ABI is respected? Removing it's use 
from random tests does not fill me with confidence that we are on top of 
this topic.

Regards,

Tvrtko
