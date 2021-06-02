Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE5D397E00
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 03:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454406EB42;
	Wed,  2 Jun 2021 01:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0886EB3F;
 Wed,  2 Jun 2021 01:20:30 +0000 (UTC)
IronPort-SDR: V14St15ptJkq7VhWtyK5lm1p1vuGWB2Bd655wxG6+H7oqqApyd5K9Bb3NOKzJueIle/I+YKF/9
 /igwpiVkPwPQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10002"; a="267552819"
X-IronPort-AV: E=Sophos;i="5.83,241,1616482800"; d="scan'208";a="267552819"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 18:20:29 -0700
IronPort-SDR: 0Crexdur5FV3r9TKP6ycadK1fHTCbuNgseJwduo0x5rcwjDe3ZpswMW9w2RuTGmhPqgLoCIBCE
 FGtPUiSXlLVw==
X-IronPort-AV: E=Sophos;i="5.83,241,1616482800"; d="scan'208";a="479505693"
Received: from johnharr-mobl1.amr.corp.intel.com (HELO [10.209.22.218])
 ([10.209.22.218])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 18:20:29 -0700
Subject: Re: [Intel-gfx] [RFC PATCH 60/97] drm/i915: Track 'serial' counts for
 virtual engines
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-61-matthew.brost@intel.com>
 <cd59ddd4-625b-c40d-05a8-e259b8fd430c@linux.intel.com>
 <20210525175239.GA21324@sdutt-i7>
 <6f6a1266-fe48-9cf1-beba-0b4463000ca7@linux.intel.com>
 <15643bd8-a270-a84d-3bd7-5376af7e378c@intel.com>
 <018044c0-d238-2060-99a4-a477d225781e@linux.intel.com>
 <87dd027f-6690-19f9-55c3-40115254fa1c@intel.com>
 <4dfcfd97-c83e-8483-cec0-d62f0da708b8@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <1b4044c4-2962-049e-f327-ea7394c95eb7@intel.com>
Date: Tue, 1 Jun 2021 18:20:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <4dfcfd97-c83e-8483-cec0-d62f0da708b8@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/1/2021 02:31, Tvrtko Ursulin wrote:
> On 27/05/2021 18:01, John Harrison wrote:
>> On 5/27/2021 01:53, Tvrtko Ursulin wrote:
>>> On 26/05/2021 19:45, John Harrison wrote:
>>>> On 5/26/2021 01:40, Tvrtko Ursulin wrote:
>>>>> On 25/05/2021 18:52, Matthew Brost wrote:
>>>>>> On Tue, May 25, 2021 at 11:16:12AM +0100, Tvrtko Ursulin wrote:
>>>>>>>
>>>>>>> On 06/05/2021 20:14, Matthew Brost wrote:
>>>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>
>>>>>>>> The serial number tracking of engines happens at the backend of
>>>>>>>> request submission and was expecting to only be given physical
>>>>>>>> engines. However, in GuC submission mode, the decomposition of 
>>>>>>>> virtual
>>>>>>>> to physical engines does not happen in i915. Instead, requests are
>>>>>>>> submitted to their virtual engine mask all the way through to the
>>>>>>>> hardware (i.e. to GuC). This would mean that the heart beat code
>>>>>>>> thinks the physical engines are idle due to the serial number not
>>>>>>>> incrementing.
>>>>>>>>
>>>>>>>> This patch updates the tracking to decompose virtual engines into
>>>>>>>> their physical constituents and tracks the request against 
>>>>>>>> each. This
>>>>>>>> is not entirely accurate as the GuC will only be issuing the 
>>>>>>>> request
>>>>>>>> to one physical engine. However, it is the best that i915 can 
>>>>>>>> do given
>>>>>>>> that it has no knowledge of the GuC's scheduling decisions.
>>>>>>>
>>>>>>> Commit text sounds a bit defeatist. I think instead of making up 
>>>>>>> the serial
>>>>>>> counts, which has downsides (could you please document in the 
>>>>>>> commit what
>>>>>>> they are), we should think how to design things properly.
>>>>>>>
>>>>>>
>>>>>> IMO, I don't think fixing serial counts is the scope of this 
>>>>>> series. We
>>>>>> should focus on getting GuC submission in not cleaning up all the 
>>>>>> crap
>>>>>> that is in the i915. Let's make a note of this though so we can 
>>>>>> revisit
>>>>>> later.
>>>>>
>>>>> I will say again - commit message implies it is introducing an 
>>>>> unspecified downside by not fully fixing an also unspecified 
>>>>> issue. It is completely reasonable, and customary even, to ask for 
>>>>> both to be documented in the commit message.
>>>> Not sure what exactly is 'unspecified'. I thought the commit 
>>>> message described both the problem (heartbeat not running when 
>>>> using virtual engines) and the result (heartbeat running on more 
>>>> engines than strictly necessary). But in greater detail...
>>>>
>>>> The serial number tracking is a hack for the heartbeat code to know 
>>>> whether an engine is busy or idle, and therefore whether it should 
>>>> be pinged for aliveness. Whenever a submission is made to an 
>>>> engine, the serial number is incremented. The heartbeat code keeps 
>>>> a copy of the value. If the value has changed, the engine is busy 
>>>> and needs to be pinged.
>>>>
>>>> This works fine for execlist mode where virtual engine 
>>>> decomposition is done inside i915. It fails miserably for GuC mode 
>>>> where the decomposition is done by the hardware. The reason being 
>>>> that the heartbeat code only looks at physical engines but the 
>>>> serial count is only incremented on the virtual engine. Thus, the 
>>>> heartbeat sees everything as idle and does not ping.
>>>
>>> So hangcheck does not work. Or it works because GuC does it anyway. 
>>> Either way, that's one thing to explicitly state in the commit message.
>>>
>>>> This patch decomposes the virtual engines for the sake of 
>>>> incrementing the serial count on each sub-engine in order to keep 
>>>> the heartbeat code happy. The downside is that now the heartbeat 
>>>> sees all sub-engines as busy rather than only the one the 
>>>> submission actually ends up on. There really isn't much that can be 
>>>> done about that. The heartbeat code is in i915 not GuC, the 
>>>> scheduler is in GuC not i915. The only way to improve it is to 
>>>> either move the heartbeat code into GuC as well and completely 
>>>> disable the i915 side, or add some way for i915 to interrogate GuC 
>>>> as to which engines are or are not active. Technically, we do have 
>>>> both. GuC has (or at least had) an option to force a context switch 
>>>> on every execution quantum pre-emption. However, that is much, 
>>>> much, more heavy weight than the heartbeat. For the latter, we do 
>>>> (almost) have the engine usage statistics for PMU and such like. 
>>>> I'm not sure how much effort it would be to wire that up to the 
>>>> heartbeat code instead of using the serial count.
>>>>
>>>> In short, the serial count is ever so slightly inefficient in that 
>>>> it causes heartbeat pings on engines which are idle. On the other 
>>>> hand, it is way more efficient and simpler than the current 
>>>> alternatives.
>>>
>>> And the hack to make hangcheck work creates this inefficiency where 
>>> heartbeats are sent to idle engines. Which is probably fine just 
>>> needs to be explained.
>>>
>>>> Does that answer the questions?
>>>
>>> With the two points I re-raise clearly explained, possibly even 
>>> patch title changed, yeah. I am just wanting for it to be more 
>>> easily obvious to patch reader what it is functionally about - not 
>>> just what implementation details have been change but why as well.
>>>
>> My understanding is that we don't explain every piece of code in 
>> minute detail in every checkin email that touches it. I thought my 
>> description was already pretty verbose. I've certainly seen way less 
>> informative checkins that apparently made it through review without 
>> issue.
>>
>> Regarding the problem statement, I thought this was fairly clear that 
>> the heartbeat was broken for virtual engines:
>>
>>     This would mean that the heart beat code
>>     thinks the physical engines are idle due to the serial number not
>>     incrementing.
>>
>>
>> Regarding the inefficiency about heartbeating all physical engines in 
>> a virtual engine, again, this seems clear to me:
>>
>>     decompose virtual engines into
>>     their physical constituents and tracks the request against each. 
>> This
>>     is not entirely accurate as the GuC will only be issuing the request
>>     to one physical engine.
>>
>>
>> For the subject, I guess you could say "Track 'heartbeat serial' 
>> counts for virtual engines". However, the serial tracking count is 
>> not explicitly named for heartbeats so it seems inaccurate to rename 
>> it for a checkin email subject.
>>
>> If you have a suggestion for better wording then feel free to propose 
>> something.
>
> Sigh, I am not asking for more low level detail but for more up to 
> point high level naming and high level description.
>
> "drm/i915: Fix hangchek for guc virtual engines"
I would argue that the bug is not a with hangcheck bug and only 
tangentially a GuC bug. It is really a bug with the serial number 
tracking of virtual engines in general and the lack of support for 
non-execlist backends in the serial number implementation. Hangcheck 
makes use of the serial number. It is not clear from the code whether 
anything else does currently or used to previously use them. Certainly, 
there is no documentation on the serial number declaration in the engine 
structure to explain its purpose. Likewise, there is nothing GuC 
specific about delaying the decomposition of virtual engines. Any 
externally scheduled backed end would do similar. E.g. once the execlist 
backend moves to using the DRM scheduler then maybe it will have delayed 
decomposition as well, and therefore also fall foul of the missing 
serial number updates.


>
> "..Blah blah, but hack because it is not ideal due xyz which 
> needlessly wakes up all engines which has an effect on power yes/no? 
> Latency? Throughput when high prio pulse triggers pointless preemption?"
Yes to all the above but that is already true of the heartbeat mechanism 
in general and I do not see any documentation in the code as to what the 
effect of the heartbeat mechanism is on power, latency, throughput, etc. 
My assumption is that the heartbeat is considered slow enough 
periodicity that any performance impact is negligible. And if the system 
is loaded to the point where the heartbeat is having an impact then all 
engines within the virtual set are going to be in use (because if they 
aren't then the system is obviously not heavily loaded), in which case 
the heartbeat would be pinging all engines anyway.

>
> Also, can we fix it properly without introducing inefficiencies? Do we 
> even need heartbeats when GuC is in charge of engine resets? And if we 
> do can we make them work better?
In short, no, not easily.

The GuC's internal hang detection and recovery mechanism relies on 
pre-emption timeouts for the detection part. However, if only one 
context is active on a given engine, there will be no pre-emptions and 
thus the GuC will not be able to detect if that context is making 
forward progress or not. That's where the heartbeat comes in. It sends a 
dummy request on a different context and thus causes a pre-emption to 
occur. So the architecture level decision was to keep the heartbeat 
enabled even with the GuC submission backend. Unless you are running 
OpenCL of course, in which case we turn everything off :(.

As for doing something better, not easily. GuC is not able to generate 
requests itself, so it can't replicate the heartbeat's operation 
internally. There is an option to force a context switch to idle on 
every quantum expiration. However, that is deemed too intrusive and 
costly from a performance viewpoint. It might be possible to add an 
independent heartbeat timer to the GuC firmware and use that to trigger 
less frequent forced pre-emptions. That would be more efficient and more 
targetted. Whether it is worth the effort required is another matter 
given how small an impact the heartbeat itself currently is.

I would still be my view that the serial count should be fixed anyway. 
It is broken for virtual engines. End of story. Whether that actually 
affects the users of the count is a separate issue that is dependent 
upon those users. But that just changes the severity of the bug, not its 
validity.

John.


>
> Regards,
>
> Tvrtko

