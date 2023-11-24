Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C557F71FC
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 11:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0EEA10E1B0;
	Fri, 24 Nov 2023 10:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111B010E1B0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 10:48:43 +0000 (UTC)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2EF1E66073AA;
 Fri, 24 Nov 2023 10:48:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700822921;
 bh=Sx+Ot9i01DSUKlEZSaKJTKmVD/+s6DQmXFCXOQUy3/o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FH8qo6SPVrvMJRd87g4WFYY0+tgR5HvRkbc8keVtWXKcAzaMyNKaVt2wiNd3WSfmf
 4chWrGxHrKwmEbb6fpngbBphjvBJpo/sRmOKBFSuLbxtaJ3q8CBWsu9Qw1ZY6nJf0x
 BtXrVdJFSLZY/vJzybjEXhzCeNxN2IYJY4HW8jV7KJKrR8zNAfwXIy0TE1GaiggY+A
 MhQJZQvTe9zqf6ZZy/4Ne/BGul5w6/eQXoNvjtASJdbtBmx+OA6S+CntorNZl9tiT7
 zVlGgJ7mRh+Ilud5sa5qjD7SR5QZURVOOFz/u5Uz1JYbgO/m7aCT+FNqOfqfLrblcN
 +GtMM/8ulHr4g==
Message-ID: <5a140dd0-c6e3-47ff-9d25-f11eb7414036@collabora.com>
Date: Fri, 24 Nov 2023 11:48:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: Ignore core_mask for poweroff and sync
 interrupts
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20231123095320.41433-1-angelogioacchino.delregno@collabora.com>
 <20231123113530.46191ded@collabora.com>
 <1740797f-f3ae-4868-924a-08d6d731e506@collabora.com>
 <20231123135933.34d643f7@collabora.com>
 <5019af46-f5ae-4db5-979e-802b61025ba4@collabora.com>
 <20231123145103.23b6eac9@collabora.com>
 <43cc8641-6a60-41d9-b8f2-32227235702a@collabora.com>
 <20231123164019.629c91f9@collabora.com>
 <5e60f1d1-8e3a-42ca-af56-126faa67ea86@collabora.com>
 <c4a8eb63-2d67-42c3-a6b4-c6ad3bd9ab8e@collabora.com>
 <20231124112147.19b6b6b7@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231124112147.19b6b6b7@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, mripard@kernel.org, steven.price@arm.com,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 24/11/23 11:21, Boris Brezillon ha scritto:
> On Fri, 24 Nov 2023 11:12:57 +0100
> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> wrote:
> 
>> Il 24/11/23 10:17, AngeloGioacchino Del Regno ha scritto:
>>> Il 23/11/23 16:40, Boris Brezillon ha scritto:
>>>> On Thu, 23 Nov 2023 16:14:12 +0100
>>>> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> wrote:
>>>>   
>>>>> Il 23/11/23 14:51, Boris Brezillon ha scritto:
>>>>>> On Thu, 23 Nov 2023 14:24:57 +0100
>>>>>> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>>>> wrote:
>>>>>>>>>
>>>>>>>>> So, while I agree that it'd be slightly more readable as a diff if those
>>>>>>>>> were two different commits I do have reasons against splitting.....
>>>>>>>>
>>>>>>>> If we just need a quick fix to avoid PWRTRANS interrupts from kicking
>>>>>>>> in when we power-off the cores, I think we'd be better off dropping
>>>>>>>> GPU_IRQ_POWER_CHANGED[_ALL] from the value we write to GPU_INT_MASK
>>>>>>>> at [re]initialization time, and then have a separate series that fixes
>>>>>>>> the problem more generically.
>>>>>>>
>>>>>>> But that didn't work:
>>>>>>> https://lore.kernel.org/all/d95259b8-10cf-4ded-866c-47cbd2a44f84@linaro.org/
>>>>>>
>>>>>> I meant, your 'ignore-core_mask' fix + the
>>>>>> 'drop GPU_IRQ_POWER_CHANGED[_ALL] in GPU_INT_MASK' one.
>>>>>>
>>>>>> So,
>>>>>>
>>>>>> https://lore.kernel.org/all/4c73f67e-174c-497e-85a5-cb053ce657cb@collabora.com/
>>>>>> +
>>>>>> https://lore.kernel.org/all/d95259b8-10cf-4ded-866c-47cbd2a44f84@linaro.org/
>>>>>>>
>>>>>>>
>>>>>>> ...while this "full" solution worked:
>>>>>>> https://lore.kernel.org/all/39e9514b-087c-42eb-8d0e-f75dc620e954@linaro.org/
>>>>>>>
>>>>>>> https://lore.kernel.org/all/5b24cc73-23aa-4837-abb9-b6d138b46426@linaro.org/
>>>>>>>
>>>>>>>
>>>>>>> ...so this *is* a "quick fix" already... :-)
>>>>>>
>>>>>> It's a half-baked solution for the missing irq-synchronization-on-suspend
>>>>>> issue IMHO. I understand why you want it all in one patch that can serve
>>>>>> as a fix for 123b431f8a5c ("drm/panfrost: Really power off GPU cores in
>>>>>> panfrost_gpu_power_off()"), which is why I'm suggesting to go for an
>>>>>> even simpler diff (see below), and then fully address the
>>>>>> irq-synhronization-on-suspend issue in a follow-up patchset.
>>>>>> --->8---
>>>>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c
>>>>>> b/drivers/gpu/drm/panfrost/panfrost_gpu.c
>>>>>> index 09f5e1563ebd..6e2d7650cc2b 100644
>>>>>> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
>>>>>> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
>>>>>> @@ -78,7 +78,10 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
>>>>>>            }
>>>>>>            gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_MASK_ALL);
>>>>>> -       gpu_write(pfdev, GPU_INT_MASK, GPU_IRQ_MASK_ALL);
>>>>
>>>> We probably want a comment here:
>>>>
>>>>      /* Only enable the interrupts we care about. */
>>>>   
>>>>>> +       gpu_write(pfdev, GPU_INT_MASK,
>>>>>> +                 GPU_IRQ_MASK_ERROR |
>>>>>> +                 GPU_IRQ_PERFCNT_SAMPLE_COMPLETED |
>>>>>> +                 GPU_IRQ_CLEAN_CACHES_COMPLETED);
>>>>>
>>>>> ...but if we do that, the next patch(es) will contain a partial revert of this
>>>>> commit, putting back this to gpu_write(pfdev, GPU_INT_MASK, GPU_IRQ_MASK_ALL)...
>>>>
>>>> Why should we revert it? We're not processing the PWRTRANS interrupts
>>>> in the interrupt handler, those should never have been enabled in the
>>>> first place. The only reason we'd want to revert that change is if we
>>>> decide to do have interrupt-based waits in the poweron/off
>>>> implementation, which, as far as I'm aware, is not something we intend
>>>> to do any time soon.
>>>>   
>>>
>>> You're right, yes. Okay, I'll push the new code soon.
>>>
>>> Cheers!
>>>    
>>
>> Update: I was running some (rather fast) tests here because I ... felt like playing
>> with it, basically :-)
>>
>> So, I had an issue with MediaTek platforms being unable to cut power to the GPU or
>> disable clocks aggressively... and after trying "this and that" I couldn't get it
>> working (in runtime suspend).
>>
>> Long story short - after implementing `panfrost_{job,mmu,gpu}_suspend_irq()` (only
>> gpu irq, as you said, is a half solution), I can not only turn off clocks, but even
>> turn off GPU power supplies entirely, bringing the power consumption of the GPU
>> itself during *runtime* suspend to ... zero.
> 
> Very nice!
> 
>>
>> The result of this test makes me truly happy, even though complete powercut during
>> runtime suspend may not be feasible for other reasons (takes ~200000ns on AVG,
>> MIN ~160000ns, but the MAX is ~475000ns - and beware that I haven't run that for
>> long, I'd suspect to get up to 1-1.5ms as max time, so that's a big no).
> 
> Do you know what's taking so long? I'm disabling clks + the main power
> domain in panthor (I leave the regulators enabled), but I didn't get to
> measure the time it takes to enter/exit suspend. I might have to do
> what you did in panfrost and have different paths for system and RPM
> suspend.
> 

That's SoC dependant... there's only one way to get runtime suspend right in terms
of timing, and that is to select what to do there on a per-SoC basis: this is why
some of them will take lots of time to turn off (or on!) clocks, because clock
controllers are not all equal: this is not only in relation to different vendors
(as in, rockchip vs nxp vs mediatek vs qcom vs...) but also for different parts
from the same vendor (as in, MSM8953 uses different clock controllers compared to
SM8350 and MT6795 different compared to MT6985 and MT8195).

Some of them will require a long time to turn on a PLL mainly because "locking the
PLL" (read: waiting until the PLL outputs a certain clock rate in a stable manner)
may take time, or some could lose time by waiting for ungating... though, usually
clock controllers take no time to *turn off* a clock, but needs a bit more time to
turn them *on* (which matters in runtime resume, but not much in system pm resume).

The situation is exactly the same in regard to power supplies: some may need a bit
of time to turn on/off a power *domain* (not MTK's case), some lose time turning
on/off a regulator instead.

Related to the case of my MediaTek platforms (MT8192, MT8195, MT8186), the power
domains go on/off in nanoseconds, same for clocks (as the clock tree uses a generic
PLL for init, then switches to a GPU-dedicate with "you being picky" :-)d PLL which 
anyway doesn't require a
lot of time to reach lock state), but turning off the *Vgpu* (gpu core supply)
regulator takes "all that much".

So the only solution to do that on a per-SoC basis would be to have the code to
turn on/off clocks and regulators in a barrier, and have it in both runtime PM
*and* system PM, and to select - for each SoC - what to do such that the driver is
able to do *either of*:

  - Runtime PM only PWRTRANS (beware: power domains off implicit, in all cases!)
  - Runtime PM PWRTRANS + clocks off
  - Runtime PM PWRTRANS + clocks off + regulators off

  - System PM RPM() only
  - System PM RPM() + clocks off (only if not done already in RPM)
  - System PM RPM() + clocks off + regulators off (only if not done already in RPM)

...at least, that's to reach an "almost perfect" power save tuning on *all*, but
the shortest path is obviously to leave the "clocks off + regulators off" code in
System PM only, as that's something that 99.9% of the SoCs would support.

I'd be happy to find a (clean) solution to add what I described to Panfrost (and
would be reusable in Panthor, I believe) but I don't know if I'd be able to put
something on the table for this merge window anyway.

>>
>> This means that I will take a day or two and I'll push both the "simple" fix for
>> the Really-power-off and also some more commits to add the full irq sync.
> 
> Thanks for working on that, and sorry if I've been picky in my previous
> reviews. Looking forward to review these new patches.
> 

Many times, being picky means reaching a better solution, and this is one of those
cases: there's no need to be sorry (not to me at least).

I appreciate when others are giving out valuable *and constructive* feedback, which
again, this was the case - so thank you for "being picky"! :-)

Cheers,
Angelo

