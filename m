Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F27037A14F
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 10:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9206E9E1;
	Tue, 11 May 2021 08:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5136E9DD;
 Tue, 11 May 2021 08:01:55 +0000 (UTC)
Received: from [192.168.1.190] (unknown [91.155.165.229])
 (Authenticated sender: martin.peres@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id AFDC85FF9A;
 Tue, 11 May 2021 10:01:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1620720114;
 bh=a46yeCGCE0eDis8fySiFB9lAhih+GD6Vv2jPOFTNsks=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=kdtytGF4+ei+QKXYgK2m07iUaPO25g0rVN7GJ+EdRtYcrJ4d39FYvsRtq8CltFbFs
 +9EejX8j1P2KlKGOOYleABzR2IMtTbFrknI1BaB7pkD0GwaJ2cm/uCfWqvZaseJ2uq
 fS8Ndxz21W64fIgPLSWiTyvj5K63oHWTG4TD/MkeCUtG2+0g9Nv+rBwrzTmSwfnP52
 sL9TqLAHVloxZ6zl15PDJ+gHsfnxrPYSUhYDvGtJZM1Yqgp0ZgEtt+VQ/CtLzG4pug
 /8UGEnigBFFZy5ccPiqd5AHriwzxrK3ApZVDxPvGtRaD88BJ376ahpBNXB5wAxsleW
 PKi8+QZop1HkA==
Subject: Re: [RFC PATCH 00/97] Basic GuC submission support in the i915
To: Jason Ekstrand <jason@jlekstrand.net>,
 Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <d22437bd-8bb6-d7cb-c017-89cdc7da560d@free.fr>
 <17953669798.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
 <546e4ee4-9aa4-1967-cdcb-a561cac582ef@free.fr>
 <17957197dd8.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
From: Martin Peres <martin.peres@free.fr>
Message-ID: <339d4e10-33cf-4917-038b-c849dc829f77@free.fr>
Date: Tue, 11 May 2021 11:01:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <17957197dd8.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: tvrtko.ursulin@intel.com, jason.ekstrand@intel.com,
 daniele.ceraolospurio@intel.com, jon.bloomfield@intel.com,
 daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/05/2021 19:25, Jason Ekstrand wrote:
> On May 10, 2021 08:55:55 Martin Peres <martin.peres@free.fr> wrote:
> 
>> On 10/05/2021 02:11, Jason Ekstrand wrote:
>>> On May 9, 2021 12:12:36 Martin Peres <martin.peres@free.fr> wrote:
>>>
>>>> Hi,
>>>>
>>>> On 06/05/2021 22:13, Matthew Brost wrote:
>>>>> Basic GuC submission support. This is the first bullet point in the
>>>>> upstreaming plan covered in the following RFC [1].
>>>>>
>>>>> At a very high level the GuC is a piece of firmware which sits between
>>>>> the i915 and the GPU. It offloads some of the scheduling of contexts
>>>>> from the i915 and programs the GPU to submit contexts. The i915
>>>>> communicates with the GuC and the GuC communicates with the GPU.
>>>>
>>>> May I ask what will GuC command submission do that execlist won't/can't
>>>> do? And what would be the impact on users? Even forgetting the troubled
>>>> history of GuC (instability, performance regression, poor level of user
>>>> support, 6+ years of trying to upstream it...), adding this much code
>>>> and doubling the amount of validation needed should come with a
>>>> rationale making it feel worth it... and I am not seeing here. Would you
>>>> mind providing the rationale behind this work?
>>>>
>>>>>
>>>>> GuC submission will be disabled by default on all current upstream
>>>>> platforms behind a module parameter - enable_guc. A value of 3 will
>>>>> enable submission and HuC loading via the GuC. GuC submission should
>>>>> work on all gen11+ platforms assuming the GuC firmware is present.
>>>>
>>>> What is the plan here when it comes to keeping support for execlist? I
>>>> am afraid that landing GuC support in Linux is the first step towards
>>>> killing the execlist, which would force users to use proprietary
>>>> firmwares that even most Intel engineers have little influence over.
>>>> Indeed, if "drm/i915/guc: Disable semaphores when using GuC scheduling"
>>>> which states "Disable semaphores when using GuC scheduling as semaphores
>>>> are broken in the current GuC firmware." is anything to go by, it means
>>>> that even Intel developers seem to prefer working around the GuC
>>>> firmware, rather than fixing it.
>>>
>>> Yes, landing GuC support may be the first step in removing execlist
>>> support. The inevitable reality is that GPU scheduling is coming and
>>> likely to be there only path in the not-too-distant future. (See also
>>> the ongoing thread with AMD about fences.) I'm not going to pass
>>> judgement on whether or not this is a good thing.  I'm just reading the
>>> winds and, in my view, this is where things are headed for good or ill.
>>>
>>> In answer to the question above, the answer to "what do we gain from
>>> GuC?" may soon be, "you get to use your GPU."  We're not there yet and,
>>> again, I'm not necessarily advocating for it, but that is likely where
>>> things are headed.
>>
>> This will be a sad day, especially since it seems fundamentally opposed
>> with any long-term support, on top of taking away user freedom to
>> fix/tweak their system when Intel won't.
>>
>>> A firmware-based submission model isn't a bad design IMO and, aside from
>>> the firmware freedom issues, I think there are actual advantages to the
>>> model. Immediately, it'll unlock a few features like parallel submission
>>> (more on that in a bit) and long-running compute because they're
>>> implemented in GuC and the work to implement them properly in the
>>> execlist scheduler is highly non-trivial. Longer term, it may (no
>>> guarantees) unlock some performance by getting the kernel out of the way.
>>
>> Oh, I definitely agree with firmware-based submission model not being a
>> bad design. I was even cheering for it in 2015. Experience with it made
>> me regret that deeply since :s
>>
>> But with the DRM scheduler being responsible for most things, I fail to
>> see what we could offload in the GuC except context switching (like
>> every other manufacturer). The problem is, the GuC does way more than
>> just switching registers in bulk, and if the number of revisions of the
>> GuC is anything to go by, it is way too complex for me to feel
>> comfortable with it.
> 
> It's more than just bulk register writes. When it comes to 
> load-balancing multiple GPU users, firmware can theoretically preempt 
> and switch faster leading to more efficient time-slicing. All we really 
> need the DRM scheduler for is handling implicit dma_fence dependencies 
> between different applications.

Right, this makes sense. However, if the GuC's interface was so simple, 
I doubt it would be at major version 60 already :s

I don't disagree with FW-based command submission, as it has a lot of 
benefits. I just don't like the route of going with a firmware no-one 
else than Intel can work on, *and* one that doesn't seem to concern 
itself with stable interfaces, and how i915 will have to deal with every 
generation using different interfaces (assuming the firmware was bug-free).

> 
> 
>>>> In the same vein, I have another concern related to the impact of GuC on
>>>> Linux's stable releases. Let's say that in 3 years, a new application
>>>> triggers a bug in command submission inside the firmware. Given that the
>>>> Linux community cannot patch the GuC firmware, how likely is it that
>>>> Intel would release a new GuC version? That would not be necessarily
>>>> such a big problem if newer versions of the GuC could easily be
>>>> backported to this potentially-decade-old Linux version, but given that
>>>> the GuC seems to have ABI-breaking changes on a monthly cadence (we are
>>>> at major version 60 *already*? :o), I would say that it is
>>>> highly-unlikely that it would not require potentially-extensive changes
>>>> to i915 to make it work, making the fix almost impossible to land in the
>>>> stable tree... Do you have a plan to mitigate this problem?
>>>>
>>>> Patches like "drm/i915/guc: Disable bonding extension with GuC
>>>> submission" also make me twitch, as this means the two command
>>>> submission paths will not be functionally equivalent, and enabling GuC
>>>> could thus introduce a user-visible regression (one app used to work,
>>>> then stopped working). Could you add in the commit's message a proof
>>>> that this would not end up being a user regression (in which case, why
>>>> have this codepath to begin with?).
>>>
>>> I'd like to address this one specifically as it's become something of a
>>> speciality of mine the past few weeks. The current bonded submission
>>> model is bad. It provides a plethora of ways for a client to back itself
>>> into a corner and doesn't actually provide the guarantees the media
>>> driver needs for its real-time high-resolution decode. It's bad enough
>>> we're seriously considering ripping it out, backwards compatibility or
>>> not. The good news is that very little that your average desktop user
>>> does depends on it: basically just real-time >4K video decode.
>>>
>>> The new parallel submit API is much better and should be the path
>>> forward. (We should have landed parallel submit the first time around.)
>>> It isn't full of corners and does let us provides actual parallel
>>> execution guarantees. It also gives the scheduler the information it
>>> needs to reliably provide those guarantees. >
>>> If we need to support the parallel submit API with the execlist
>>> back-end, that's totally possible. The choice to only implement the
>>> parallel submit API with GuC is a pragmatic one. We're trying to get
>>> upstream back on it's feet and get all the various up-and-coming bits of
>>> hardware enabled. Enabling the new API in the execlist back-end makes
>>> that pipeline longer.
>>
>> I feel your pain, and wish you all the best to get GEM less complex
>> and more manageable.
>>
>> So, if I understood correctly, the plan is just to regress 4K+ video
>> decoding for people who do not enable GuC scheduling, or did not also
>> update to a recent-enough media driver that would support this new
>> interface? If it is indeed only for over 4K videos, then whatever. If it
>> is 4K, it starts being a little bad, assuming graceful fallback to
>> CPU-based decoding. What's the test plan for this patch then? The patch
>> in its current form is definitely not making me confident.
> 
> My understanding is that it's only >4k that's affected; we've got enough 
> bandwidth on a single VCS for 4K. I'm not sure where the exact cut-off 
> is (it may be a little higher than 4k) but real-time 4k should be fine 
> and real-time 8k requires parallel submit. So we're really not cutting 
> off many use-cases. Also, as I said above, the new API can be 
> implemented with the execlist scheduler if needed. We've just 
> pragmatically deprioritized it.

Sounds like a niche-enough use case to me that I feel no user would 
complain about it.

Martin

> 
> --Jason
> 
> 
>>>> Finally, could you explain why IGT tests need to be modified to work the
>>>> GuC [1], and how much of the code in this series is covered by
>>>> existing/upcoming tests? I would expect a very solid set of tests to
>>>> minimize the maintenance burden, and enable users to reproduce potential
>>>> issues found in this new codepath (too many users run with enable_guc=3,
>>>> as can be seen on Google[2]).
>>>
>>> The IGT changes, as I understand them, are entirely around switching to
>>> the new parallel submit API. There shouldn't be a major effect to most
>>> users.
>>
>> Right, this part I followed, but failed to connect it to the GuC...
>> because I couldn't see why it would be needed (execlist requiring a lot
>> more work).
>>
>> I sincerely wish for the GuC to stay away from upstream because of the
>> above concerns (which are yet to be addressed), but if Intel were to
>> push forward with the plan to drop execlist, I can foresee a world of
>> trouble for users... That is of course unless the GuC were to be open
>> sourced, with people outside of Intel able to sign their own builds or
>> run unsigned. Failing that, let's hope the last 6 years were just a bad
>> start, and the rapid climb in major version of the GuC will magically
>> stop! I hope execlists will remain at feature parity with the GuC when
>> possible... but deplore the increase in validation needs which will only
>> hurt users in the end.
>>
>> Thanks for your honest answer,
>> Martin
>>
>>>
>>> --Jason
> 
