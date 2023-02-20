Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCA669C9F0
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 12:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D053410E696;
	Mon, 20 Feb 2023 11:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F351410E670;
 Mon, 20 Feb 2023 11:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676892806; x=1708428806;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Z6F2FvUFHZLPAmYP5ekix2lQhycVf45ybVy3TgplYD0=;
 b=H4qkUtqWfQMCRP5YPfWnwZj4T3Bm7HBuchLFQS5NaEuX9OALK1CvyVQ1
 c6maU7fUSMlPbY4dnnnBnFldo8sXiGdttHCakut9wHzzPrKuigfEjJ3Ai
 UwqE6I1cy9117VCaiEeJRS1DP0b5NvZbHk9mBLqaFJJ6X0LXxqvvfOCyQ
 keqMO1KfVraHxkgbJtmidbst3RMHfQojc3UUGIsiB0LU3wmUCVsarMPRs
 bdRIng4mFnRJbO6wIg9sBHRHb+41jOI0t2HMmcbUF06hAXIG5u7QAecoD
 uPxujXyu5MDSAUUfyEY3ZCEzEAuT26i2zwHzWHJpyVV5Lc0g4dck3GPss w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="333741932"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; d="scan'208";a="333741932"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 03:33:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="701640149"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; d="scan'208";a="701640149"
Received: from mochoamo-mobl.ger.corp.intel.com (HELO [10.213.211.126])
 ([10.213.211.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 03:33:20 -0800
Message-ID: <6832ba1a-c6b0-4631-3b4e-bfcd31d8b59c@linux.intel.com>
Date: Mon, 20 Feb 2023 11:33:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [RFC v2 0/5] Waitboost drm syncobj waits
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Rob Clark <robdclark@gmail.com>
References: <20230210130647.580135-1-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGto9VMNLJnAs+n5H6MNoVASNasYEu3WhYYkhn5sERg4Fw@mail.gmail.com>
 <Y+5zyeSncSbsXHWG@intel.com>
 <7e059e8c-41c3-b56c-26c8-c0e2230616b1@linux.intel.com>
 <CAF6AEGuN2dv+Lsk3R43oPRA9c8ZoMjzCCKR+L41wNT8Sc3TgsQ@mail.gmail.com>
 <c0663648-5567-2d7a-43b1-dfa043109051@linux.intel.com>
 <CAF6AEGsGqjbL_tA8x_xwygBccKMP2DTbSy-B5_dEakpQVep8vg@mail.gmail.com>
 <Y+/ndNIu/kYGiVh5@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Y+/ndNIu/kYGiVh5@intel.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Rob Clark <robdclark@chromium.org>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 17/02/2023 20:45, Rodrigo Vivi wrote:
> On Fri, Feb 17, 2023 at 09:00:49AM -0800, Rob Clark wrote:
>> On Fri, Feb 17, 2023 at 8:03 AM Tvrtko Ursulin
>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>
>>>
>>> On 17/02/2023 14:55, Rob Clark wrote:
>>>> On Fri, Feb 17, 2023 at 4:56 AM Tvrtko Ursulin
>>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>>
>>>>>
>>>>> On 16/02/2023 18:19, Rodrigo Vivi wrote:
>>>>>> On Tue, Feb 14, 2023 at 11:14:00AM -0800, Rob Clark wrote:
>>>>>>> On Fri, Feb 10, 2023 at 5:07 AM Tvrtko Ursulin
>>>>>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>>>>>
>>>>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>>>>
>>>>>>>> In i915 we have this concept of "wait boosting" where we give a priority boost
>>>>>>>> for instance to fences which are actively waited upon from userspace. This has
>>>>>>>> it's pros and cons and can certainly be discussed at lenght. However fact is
>>>>>>>> some workloads really like it.
>>>>>>>>
>>>>>>>> Problem is that with the arrival of drm syncobj and a new userspace waiting
>>>>>>>> entry point it added, the waitboost mechanism was bypassed. Hence I cooked up
>>>>>>>> this mini series really (really) quickly to see if some discussion can be had.
>>>>>>>>
>>>>>>>> It adds a concept of "wait count" to dma fence, which is incremented for every
>>>>>>>> explicit dma_fence_enable_sw_signaling and dma_fence_add_wait_callback (like
>>>>>>>> dma_fence_add_callback but from explicit/userspace wait paths).
>>>>>>>
>>>>>>> I was thinking about a similar thing, but in the context of dma_fence
>>>>>>> (or rather sync_file) fd poll()ing.  How does the kernel differentiate
>>>>>>> between "housekeeping" poll()ers that don't want to trigger boost but
>>>>>>> simply know when to do cleanup, and waiters who are waiting with some
>>>>>>> urgency.  I think we could use EPOLLPRI for this purpose.
>>>>>>>
>>>>>>> Not sure how that translates to waits via the syncobj.  But I think we
>>>>>>> want to let userspace give some hint about urgent vs housekeeping
>>>>>>> waits.
>>>>>>
>>>>>> Should the hint be on the waits, or should the hints be on the executed
>>>>>> context?
>>>>>>
>>>>>> In the end we need some way to quickly ramp-up the frequency to avoid
>>>>>> the execution bubbles.
>>>>>>
>>>>>> waitboost is trying to guess that, but in some cases it guess wrong
>>>>>> and waste power.
>>>>>
>>>>> Do we have a list of workloads which shows who benefits and who loses
>>>>> from the current implementation of waitboost?
>>>>>> btw, this is something that other drivers might need:
>>>>>>
>>>>>> https://gitlab.freedesktop.org/drm/amd/-/issues/1500#note_825883
>>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>>
>>>>> I have several issues with the context hint if it would directly
>>>>> influence frequency selection in the "more power" direction.
>>>>>
>>>>> First of all, assume a context hint would replace the waitboost. Which
>>>>> applications would need to set it to restore the lost performance and
>>>>> how would they set it?
>>>>>
>>>>> Then I don't even think userspace necessarily knows. Think of a layer
>>>>> like OpenCL. It doesn't really know in advance the profile of
>>>>> submissions vs waits. It depends on the CPU vs GPU speed, so hardware
>>>>> generation, and the actual size of the workload which can be influenced
>>>>> by the application (or user) and not the library.
>>>>>
>>>>> The approach also lends itself well for the "arms race" where every
>>>>> application can say "Me me me, I am the most important workload there is!".
>>>>
>>>> since there is discussion happening in two places:
>>>>
>>>> https://gitlab.freedesktop.org/drm/intel/-/issues/8014#note_1777433
>>>>
>>>> What I think you might want is a ctx boost_mask which lets an app or
>>>> driver disable certain boost signals/classes.  Where fence waits is
>>>> one class of boost, but hypothetical other signals like touchscreen
>>>> (or other) input events could be another class of boost.  A compute
>>>> workload might be interested in fence wait boosts but could care less
>>>> about input events.
>>>
>>> I think it can only be apps which could have any chance knowing whether
>>> their use of a library is latency sensitive or not. Which means new
>>> library extensions and their adoption. So I have some strong reservation
>>> that route is feasible.
>>>
>>> Or we tie with priority which many drivers do. Normal and above gets the
>>> boosting and what lowered itself does not (aka SCHED_IDLE/SCHED_BATCH).
>>
>> yeah, that sounds reasonable.
>>
> 
> on that gitlab-issue discussion Emma Anholt was against using the priority
> to influence frequency since that should be more about latency.
> 
> or we are talking about something different priority here?

As Rob already explained - I was suggesting skipping waitboost for 
contexts which explicitly made themselves low priority. I don't see a 
controversial angle there.

>>> Related note is that we lack any external control of our scheduling
>>> decisions so we really do suck compared to other scheduling domains like
>>> CPU and IO etc.
>>>
>>>>> The last concern is for me shared with the proposal to expose deadlines
>>>>> or high priority waits as explicit uapi knobs. Both come under the "what
>>>>> application told us it will do" category vs what it actually does. So I
>>>>> think it is slightly weaker than basing decisions of waits.
>>>>>
>>>>> The current waitboost is a bit detached from that problem because when
>>>>> we waitboost for flips we _know_ it is an actual framebuffer in the flip
>>>>> chain. When we waitboost for waits we also know someone is waiting. We
>>>>> are not trusting userspace telling us this will be a buffer in the flip
>>>>> chain or that this is a context which will have a certain duty-cycle.
>>>>>
>>>>> But yes, even if the input is truthful, latter is still only a
>>>>> heuristics because nothing says all waits are important. AFAIU it just
>>>>> happened to work well in the past.
>>>>>
>>>>> I do understand I am effectively arguing for more heuristics, which may
>>>>> sound a bit against the common wisdom. This is because in general I
>>>>> think the logic to do the right thing, be it in the driver or in the
>>>>> firmware, can work best if it has a holistic view. Simply put it needs
>>>>> to have more inputs to the decisions it is making.
>>>>>
>>>>> That is what my series is proposing - adding a common signal of "someone
>>>>> in userspace is waiting". What happens with that signal needs not be
>>>>> defined (promised) in the uapi contract.
>>>>>
>>>>> Say you route it to SLPC logic. It doesn't need to do with it what
>>>>> legacy i915 is doing today. It just needs to do something which works
>>>>> best for majority of workloads. It can even ignore it if that works for it.
>>>>>
>>>>> Finally, back to the immediate problem is when people replace the OpenCL
>>>>> NEO driver with clvk that performance tanks. Because former does waits
>>>>> using i915 specific ioctls and so triggers waitboost, latter waits on
>>>>> syncobj so no waitboost and performance is bad. What short term solution
>>>>> can we come up with? Or we say to not use clvk? I also wonder if other
>>>>> Vulkan based stuff is perhaps missing those easy performance gains..
>>>>>
>>>>> Perhaps strictly speaking Rob's and mine proposal are not mutually
>>>>> exclusive. Yes I could piggy back on his with an "immediate deadline for
>>>>> waits" idea, but they could also be separate concepts if we concluded
>>>>> "someone is waiting" signal is useful to have. Or it takes to long to
>>>>> upstream the full deadline idea.
>>>>
>>>> Let me re-spin my series and add the syncobj wait flag and i915 bits
>>>
>>> I think wait flag is questionable unless it is inverted to imply waits
>>> which can be de-prioritized (again same parallel with SCHED_IDLE/BATCH).
>>> Having a flag which "makes things faster" IMO should require elevated
>>> privilege (to avoid the "arms race") at which point I fear it quickly
>>> becomes uninteresting.
>>
>> I guess you could make the argument in either direction.  Making the
>> default behavior ramp up clocks could be a power regression.
> 
> yeap, exactly the media / video conference case.

Yeah I agree. And as not all media use cases are the same, as are not 
all compute contexts someone somewhere will need to run a series of 
workloads for power and performance numbers. Ideally that someone would 
be the entity for which it makes sense to look at all use cases, from 
server room to client, 3d, media and compute for both. If we could get 
the capability to run this in some automated fashion, akin to CI, we 
would even have a chance to keep making good decisions in the future.

Or we do some one off testing for this instance, but we still need a 
range of workloads and parts to do it properly..

>> I also think the "arms race" scenario isn't really as much of a
>> problem as you think.  There aren't _that_ many things using the GPU
>> at the same time (compared to # of things using CPU).   And a lot of
>> mobile games throttle framerate to avoid draining your battery too
>> quickly (after all, if your battery is dead you can't keep buying loot
>> boxes or whatever).
> 
> Very good point.

On this one I still disagree from the point of view that it does not 
make it good uapi if we allow everyone to select themselves for priority 
handling (one flavour or the other).

> And in the GPU case they rely a lot on the profiles. Which btw, seems
> to be the Radeon solution. They boost the freq if the high performance
> profile is selected and don't care about the execution bubbles if low
> or mid profiles are selected, or something like that.

Profile as something which controls the waitboost globally? What would 
be the mechanism for communicating it to the driver?

Also, how would that reconcile the fact waitboost harms some workloads 
but helps others? If the latter not only improves the performance but 
also efficiency then assuming "battery" profile must mean "waitboost 
off" would be leaving battery life on the table. Conversely, if the "on 
a/c - max performance", would be global "waitboost on", then it could 
even be possible it wouldn't always be truly best performance if it 
causes thermal throttling.

Regards,

Tvrtko
