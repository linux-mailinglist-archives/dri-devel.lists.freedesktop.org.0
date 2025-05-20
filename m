Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CB0ABE049
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 18:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3638F10E518;
	Tue, 20 May 2025 16:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="aK7rnonF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F9C10E568
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 16:15:41 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so34983515e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 09:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1747757740; x=1748362540;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=s8CzE081NADV7dJH88t6emjucLeu/93WMG3ve6ghEMo=;
 b=aK7rnonFoGPqPXvVB6EDM3jaNrIJPNzIRw5+bPQXsVQzFtsJTSZlcOcdAnA+9xoSxz
 q+bj/X+kG6yGTazaMkDh5r+3JKZXZ56vT9vPfBiVxmv/eRFZuyao5pM0U1fViJH+1Yfd
 NVfArcN4Yjtj+OvZy9Q4j3YDtFjpmGDv9o0VgAhK9XMz2nCZ65E7QX2qnj9QkgANxGnv
 PzbXhc22oaUzABGkZvGM2MwnHsSFi3mUcswYgIyLQ4dQgjCrFODumN8WpE1JnOyzNthw
 OKLj+HsD3A/gWPxOlnPOqzD/YGCZY7Z6msWiNL3n1G3sgyNoqsxVeRTknOD2KYAb+K+t
 Do5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747757740; x=1748362540;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s8CzE081NADV7dJH88t6emjucLeu/93WMG3ve6ghEMo=;
 b=sa9xhQ+s9FpU3aCS2pu2pshKmmYscvMA/42P4ykmJjeh421g6X6GjsQu9pR81ahS23
 SmoGjanzyNkKNo20G3cFE9tyWGF/Hkf55WN6S/OPuAZx3HZiII4nGCbh/9zxWrO0zdAi
 7qC3DheDd2lz8VOmzRh4atKUM+iTQuzT9RYcqWpJn+WuQvvuPUgq29Qf1eDjKAnQUVj1
 X6Gr8Bqa1kdRaGkT5Sd0mS1h7VydEQq1gciA43aPt2eVi9KmAmlboBLyh0Qck2GDLDMb
 GpFw1GYVyAqSxBWAJjEYFX88ILTWn4dtUpL9toXDise8rilMlHtiZWBS5/y7sMXya8Bq
 +Ilg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnIFvBlAOCxGL1RCKQKazRvJCAIKHbnFlMSN3WoCa25Fp8bzHEUyEbfy19hlXqC8+uuAlvjFihdBE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzN6419O8Ejzlu6cdRxqmGyc0fMjeVpe/d3piXTUrOVM6fIpJDy
 mun6PJxTJSbudeOE43PNCQB8rFAEWFekizC7YkohxFrKBvA33aG7ncL6kpAQ4jjm4hs=
X-Gm-Gg: ASbGncuHZ9dN6UHPV1ubaSa2IcdgMxxyOiTFZAEJr3hSxOlyR/Ha+utTBTLwQ9gt4wn
 UoMkiLQ3ZtnaRTZRnyRw8uvu7x4RpEcWHHH77irZTNdaddz6CYc1aWRzKz2BY5Gjrp0M8m3XMX7
 Kg19E+8jvQVTL2F6tCJM4QpkJI2ZpRT2/WC8NeNKq4nGL7iq/S2LxRQjhpOehnS9YZ49pNIUeYT
 0lSmeITKFAX7/jDJqfLIAUPQLpaquoNNAUWNfQb7vvKWiwHe78EkWM15zaH8ToQS+Szxo5Nwy4e
 PUKu1DiTIQbuNirA/E9g4M11NH4vgJpvjtoHcfJzuQmCfhwZpXWvhW5OBGKDVIrrEA==
X-Google-Smtp-Source: AGHT+IHUXReM0aaWZWNtVQf19kLqYU2YN2wS194+mWwuidtrxnfYosa7PXJImeea4E8/iehtft0Y0w==
X-Received: by 2002:a05:600c:3e88:b0:43d:94:2d1e with SMTP id
 5b1f17b1804b1-442fd627303mr166341735e9.13.1747757739460; 
 Tue, 20 May 2025 09:15:39 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442ffaa75cfsm100927495e9.1.2025.05.20.09.15.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 09:15:38 -0700 (PDT)
Message-ID: <8b975d5f-eafd-4b25-8629-69fd71dcd4d9@ursulin.net>
Date: Tue, 20 May 2025 17:15:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/sched: add drm_sched_prealloc_dependency_slots v3
To: phasta@kernel.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <ckoenig.leichtzumerken@gmail.com>, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, amd-gfx@lists.freedesktop.org
References: <20250515150038.4615-1-christian.koenig@amd.com>
 <20250515150038.4615-2-christian.koenig@amd.com>
 <a5e53b34-c247-4193-b4ab-551693ad089a@ursulin.net>
 <5c93f114a58e84796f239b9e0f4a13e9c223e45b.camel@mailbox.org>
 <6e5ab077-77ff-443b-b345-7d99fcd01a73@ursulin.net>
 <6a361f21-1ba2-4084-b85c-0db30c9b01cc@ursulin.net>
 <fc617b712c5937c02be89f7ba068ce0de1512027.camel@mailbox.org>
 <01cce810-7303-4c92-b138-d8a647f3dcee@ursulin.net>
 <a36fdcf31fa0ca7d9e1a24f60ba4c5bf78c7ae87.camel@mailbox.org>
 <da8cfddf-6cb9-4ddd-9345-16d065663d4b@ursulin.net>
 <25363de0e88f750fe70a7b7629113f93f12f47e7.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <25363de0e88f750fe70a7b7629113f93f12f47e7.camel@mailbox.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 19/05/2025 10:04, Philipp Stanner wrote:
> On Mon, 2025-05-19 at 09:51 +0100, Tvrtko Ursulin wrote:
>>
>> On 16/05/2025 18:16, Philipp Stanner wrote:
>>> On Fri, 2025-05-16 at 15:30 +0100, Tvrtko Ursulin wrote:
>>>>
>>>> On 16/05/2025 14:38, Philipp Stanner wrote:
>>>>> On Fri, 2025-05-16 at 13:10 +0100, Tvrtko Ursulin wrote:
>>>>>>
>>>>>> On 16/05/2025 12:53, Tvrtko Ursulin wrote:
>>>>>>>
>>>>>>>
> 
> [snip]
> 
>>>>>>>>>> +
>>>>>>>>>> +/**
>>>>>>>>>> + * drm_sched_job_add_prealloc_dep - add dependency
>>>>>>>>>> to
>>>>>>>>>> preallocated
>>>>>>>>>> slot
>>>>>>>>>> + * @job: scheduler job where dependencies will be
>>>>>>>>>> added
>>>>>>>>>> + * @id: the preallocated slot index
>>>>>>>>>> + * @fence: the dependency to add
>>>>>>>>>> + *
>>>>>>>>>> + * Consumes @fence and adds it to the preallocated
>>>>>>>>>> slot
>>>>>>>>>> dependency.
>>>>>>>>>> + */
>>>>>>>>>> +void drm_sched_job_add_prealloc_dep(struct
>>>>>>>>>> drm_sched_job
>>>>>>>>>> *job, u32
>>>>>>>>>> id,
>>>>>>>>>> +                    struct dma_fence *fence)
>>>>>>>>>> +{
>>>>>>>>>> +    fence = xa_store(&job->dependencies, id, fence,
>>>>>>>>>> GFP_ATOMIC);
>>>>>>>>>
>>>>>>>>> Add assert that the passed id exists (was preallocated)
>>>>>>>>> and
>>>>>>>>> is
>>>>>>>>> NULL?
>>>>>>>>
>>>>>>>> You
>>>>>>>
>>>>>>> Hm?
>>>>>>>
>>>>>>>>>
>>>>>>>>> Also, if someone preallocates and does not consume the
>>>>>>>>> slot
>>>>>>>>> will that
>>>>>>>>> confuse the iteration in drm_sched_job_dependency()?
>>>>>>>>
>>>>>>>> drm_sched_job_add_dependency() you mean.
>>>>>>>
>>>>>>> I was actually thinking of drm_sched_job_dependency()
>>>>>>> because
>>>>>>> that
>>>>>>> looked it would skip dependencies upon encountering an
>>>>>>> unconsumed
>>>>>>> preallocated slot, but yes, drm_sched_job_add_dependency()
>>>>>>> could
>>>>>>> explode
>>>>>>> even earlier if adding a normal dependency after
>>>>>>> preallocating
>>>>>>> a
>>>>>>> slot.
>>>>>>>
>>>>>>>> Yes, it would. All operations simply give you NULL for
>>>>>>>> those
>>>>>>>> slots. So
>>>>>>>> seems to me you have to check for NULL wherever a
>>>>>>>> preallocated
>>>>>>>> slot
>>>>>>>> might drop out. That would then be a bug.
>>>>>>>>
>>>>>>>> It's kind of tricky, all that. It's a pity that Wilcox
>>>>>>>> didn't
>>>>>>>> answer
>>>>>>>> our questions about the idiomatic way to do it.
>>>>>>>>
>>>>>>>> Maybe reserving slots with already signaled fences wasn't
>>>>>>>> such a
>>>>>>>> bad
>>>>>>>> idea after all?
>>>>>>>>
>>>>>>>> If we go for the NULL approach, it's probably the only
>>>>>>>> sane
>>>>>>>> way
>>>>>>>> to then
>>>>>>>> check for NULL wherever dependencies are accessed :(
>>>>>>>>
>>>>>>>> Opinions?
>>>>>>>
>>>>>>> Well if the xarray API returns the NULL consistently the
>>>>>>> approach
>>>>>>> from
>>>>>>> this patch is fine I think.
>>>>>>>
>>>>>>> We just need to add two more checks to the above mentioned
>>>>>>> functions,
>>>>>>
>>>>>> I need to correct myself, drm_sched_job_dependency() wouldn't
>>>>>> be
>>>>>> able
>>>>>> to
>>>>>> just skip NULLs since it relies on NULL for "no more
>>>>>> dependencies".
>>>>>> We
>>>>>> would need to track something like job->max_dependency and
>>>>>> terminate
>>>>>> on
>>>>>> job->last_dependency > job->max_dependency or so.
>>>>>
>>>>> Agreed, that would have to be fixed.
>>>>>
>>>>> I believe we should reconsider Christian's first idea [1].
>>>>>
>>>>> Thinking about it some more:
>>>>>     * With the NULL version, suddenly the xarray containing only
>>>>> valid
>>>>>       dependencies can sometimes contain NULL entries.
>>>>>     * If we could create our own tag, entries could be returned
>>>>> that
>>>>> were
>>>>>       neither NULL nor valid fences, also requiring checks
>>>>> 'everywhere'.
>>>>>     * Only the "signaled fence as prealloc reservation" approach
>>>>> is
>>>>> fully
>>>>>       backwards compatible and will never cause anyone to block
>>>>> after
>>>>>       later reworks.
>>>>>
>>>>> So maybe it's actually the best idea?
>>>>>
>>>>> Sorry for the zigg-zagg. No hard requirements intended from my
>>>>> side,
>>>>> I'm willing to go with what you guys think.
>>>>>
>>>>> Just saying, at least now I think that the already-signaled
>>>>> fence
>>>>> seems
>>>>> the most elegant solution. And since there's a function
>>>>> (dma_fence_get_stub()) for that, it seems to be in alignment
>>>>> with
>>>>> official dma_fence rules.
>>>>
>>>> Potential problem there was dma_fence_is_signaled() and fence
>>>> signaling
>>>> annotations. In case some driver is holding a lock over the
>>>> arm+push
>>>> pair. I wish we had a non-signaling is_signaled helper..
>>>>
>>>
>>> Yes! +1!
>>>
>>> But Christian doesn't like that direction:
>>>
>>> https://lore.kernel.org/all/20250409120640.106408-2-phasta@kernel.org/
>>
>> Thanks, I read this but ended up uncertain on the conclusion.
>>
>> For instance Christian at the end comments like this:
>>
>> """
>> You can test the flag if you know what the fence means to you, that
>> is
>> not a problem at all.
>> """
>>
>> That was in the context of testing the signaled bit without
>> opportunistic signaling.
>>
>> For me, from the scheduler dependencies side, that should exactly
>> apply.
>> Scheduler knows it does not need to add a signaled fence to the dep
>> array so AFAICS it is fine to skip it. And it may easily be
>> opportunistic signaling ends up a problem for the scheduler.
>>
>> So maybe such helper would be okay after all.
> 
> The thing is that, if I understand him correctly, Christian doesn't
> want a helper. He wants "us" to just use test_bit().

I suspected it may be only about not renaming into some variant of 
check_and_signal etc. With which I agree with, that the name should be 
left alone, because...

> My point is just that dma_fence_is_signaled() is a horrible name.

... as dodgy as it is, and despite me also failing to really understand 
the reason why it _has_ to be have opportunistic signaling, I think 
those semantics are by now pretty much ingrained into people dealing 
with this API so I would leave it as is.

What I was thinking was the double underscore version of the helper and 
some kerneldoc to say when it is safe to use. For me a helper is better 
than poking directly.

> The function pci_is_enabled() tells you whether the PCI device is
> enabled. What it doesn't do is
> 
> bool pci_is_enabled(pdev)
> {
>     if (crazy_callback_is_implemented()) {
>        pci_enable_device();
>        return true;
>     }
> 
>    ...
> }
> 
> It's not intuitive that a function called "{something}_is_signaled()"
> does signal that thing. Although I get that the syntactical idea
> probably is that from the GPUs POV the fence is already signaled when
> this or that seqno has been reached.
> 
> Anyways, judging aside, if a wrapper for test_bit(dma_fence) were
> acceptable, then it would need to steal dma_fence_is_signaled()'s name,
> and dma_fence_is_signaled() would have to get a new name. Which is
> precisely what was rejected, as I see it.

__dma_fence_is_signaled() is what I would do and leave the existing one 
as is.

Regards,

Tvrtko

>> Or if the concern is helper might encourage some potentially unsafe
>> usage, in that case it should come with kerneldoc describing. It is
>> not
>> like review is guaranteed to catch someone using test_bit directly
>> anyway so for me, on balance, helper is always better.
>>
>> Regards,
>>
>> Tvrtko
>>
>>
>>
>>
>>>
>>> P.
>>>
>>>>
>>>>
>>>
>>>
>>>>
>>>>
>>>> Anyway, I think both options are passable. I even like the NULL
>>>> entry
>>>> slightly more since it is simpler in a way and I don't mind some
>>>> extra
>>>> checks completely hidden in scheduler internals.
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>>
>>>>>
>>>>> Philipp
>>>>>
>>>>>
>>>>> [1]
>>>>> https://lore.kernel.org/all/20250318120313.19099-2-christian.koenig@amd.com
>>>>> /
>>>>>
>>>>>
>>>>>>
>>>>>> Regards,
>>>>>>
>>>>>> Tvrtko
>>>>>>
>>>>>>> some more unit tests probably to make sure, and that should
>>>>>>> be
>>>>>>> fine
>>>>>>> for
>>>>>>> now.
>>>>>>>
>>>>>>> On the bikeshedding front I would perhaps suggest:
>>>>>>>
>>>>>>>      - drm_sched_job_preallocate_dependency()
>>>>>>>      - drm_sched_job_replace_dependency()
>>>>>>>
>>>>>>> Reads a little bit more aligned with the rest of the API
>>>>>>> and a
>>>>>>> bit
>>>>>>> easier on the eyes, to my eyes at least.
>>>>>>>
>>>>>>> Regards,
>>>>>>>
>>>>>>> Tvrtko
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
> 

