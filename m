Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D647F70FB
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 11:13:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF1910E198;
	Fri, 24 Nov 2023 10:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B7810E198
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 10:13:02 +0000 (UTC)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2479C66073A8;
 Fri, 24 Nov 2023 10:13:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700820780;
 bh=JA4jEFSQ/k1H01YILQjvqaLXSMv6mPvLjX3nObY4uww=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=fG8QmK6l87ZUpE31tA/N+7UPMr3+Bk9Z90aEYavqA3iB+vLD+P9Q58kEx3v9SBvSw
 qdby8fRsQhmUZHS7HEuxio/JUGeupN/atYt/5E/uTaIGAUY1G6tiq74KoJoww49YRA
 yu8baW+x5WBcZkAIjyJCy4dy1jQ/2OxiAHM8qDG6o8X8Qod+jH6C2l09nssZopdgFj
 PGe1S7m5EiUGXaX41UMMmQtOZlrh+jCoP4VQqx9JmrWTEZcwKI7oBlXZ1355BsGUCv
 DTImzoLmOlASeBEtwBBclVvUuYBt4N8jhYaMe3eA55P9NqEd96qzqwoARvzZtYl+OS
 CtjtFJAc651Zw==
Message-ID: <c4a8eb63-2d67-42c3-a6b4-c6ad3bd9ab8e@collabora.com>
Date: Fri, 24 Nov 2023 11:12:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: Ignore core_mask for poweroff and sync
 interrupts
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
In-Reply-To: <5e60f1d1-8e3a-42ca-af56-126faa67ea86@collabora.com>
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

Il 24/11/23 10:17, AngeloGioacchino Del Regno ha scritto:
> Il 23/11/23 16:40, Boris Brezillon ha scritto:
>> On Thu, 23 Nov 2023 16:14:12 +0100
>> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> wrote:
>>
>>> Il 23/11/23 14:51, Boris Brezillon ha scritto:
>>>> On Thu, 23 Nov 2023 14:24:57 +0100
>>>> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> wrote:
>>>>>>>
>>>>>>> So, while I agree that it'd be slightly more readable as a diff if those
>>>>>>> were two different commits I do have reasons against splitting.....
>>>>>>
>>>>>> If we just need a quick fix to avoid PWRTRANS interrupts from kicking
>>>>>> in when we power-off the cores, I think we'd be better off dropping
>>>>>> GPU_IRQ_POWER_CHANGED[_ALL] from the value we write to GPU_INT_MASK
>>>>>> at [re]initialization time, and then have a separate series that fixes
>>>>>> the problem more generically.
>>>>>
>>>>> But that didn't work:
>>>>> https://lore.kernel.org/all/d95259b8-10cf-4ded-866c-47cbd2a44f84@linaro.org/
>>>>
>>>> I meant, your 'ignore-core_mask' fix + the
>>>> 'drop GPU_IRQ_POWER_CHANGED[_ALL] in GPU_INT_MASK' one.
>>>>
>>>> So,
>>>>
>>>> https://lore.kernel.org/all/4c73f67e-174c-497e-85a5-cb053ce657cb@collabora.com/
>>>> +
>>>> https://lore.kernel.org/all/d95259b8-10cf-4ded-866c-47cbd2a44f84@linaro.org/
>>>>>
>>>>>
>>>>> ...while this "full" solution worked:
>>>>> https://lore.kernel.org/all/39e9514b-087c-42eb-8d0e-f75dc620e954@linaro.org/
>>>>>
>>>>> https://lore.kernel.org/all/5b24cc73-23aa-4837-abb9-b6d138b46426@linaro.org/
>>>>>
>>>>>
>>>>> ...so this *is* a "quick fix" already... :-)
>>>>
>>>> It's a half-baked solution for the missing irq-synchronization-on-suspend
>>>> issue IMHO. I understand why you want it all in one patch that can serve
>>>> as a fix for 123b431f8a5c ("drm/panfrost: Really power off GPU cores in
>>>> panfrost_gpu_power_off()"), which is why I'm suggesting to go for an
>>>> even simpler diff (see below), and then fully address the
>>>> irq-synhronization-on-suspend issue in a follow-up patchset.
>>>> --->8---
>>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c 
>>>> b/drivers/gpu/drm/panfrost/panfrost_gpu.c
>>>> index 09f5e1563ebd..6e2d7650cc2b 100644
>>>> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
>>>> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
>>>> @@ -78,7 +78,10 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
>>>>           }
>>>>           gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_MASK_ALL);
>>>> -       gpu_write(pfdev, GPU_INT_MASK, GPU_IRQ_MASK_ALL);
>>
>> We probably want a comment here:
>>
>>     /* Only enable the interrupts we care about. */
>>
>>>> +       gpu_write(pfdev, GPU_INT_MASK,
>>>> +                 GPU_IRQ_MASK_ERROR |
>>>> +                 GPU_IRQ_PERFCNT_SAMPLE_COMPLETED |
>>>> +                 GPU_IRQ_CLEAN_CACHES_COMPLETED);
>>>
>>> ...but if we do that, the next patch(es) will contain a partial revert of this
>>> commit, putting back this to gpu_write(pfdev, GPU_INT_MASK, GPU_IRQ_MASK_ALL)...
>>
>> Why should we revert it? We're not processing the PWRTRANS interrupts
>> in the interrupt handler, those should never have been enabled in the
>> first place. The only reason we'd want to revert that change is if we
>> decide to do have interrupt-based waits in the poweron/off
>> implementation, which, as far as I'm aware, is not something we intend
>> to do any time soon.
>>
> 
> You're right, yes. Okay, I'll push the new code soon.
> 
> Cheers!
> 

Update: I was running some (rather fast) tests here because I ... felt like playing
with it, basically :-)

So, I had an issue with MediaTek platforms being unable to cut power to the GPU or
disable clocks aggressively... and after trying "this and that" I couldn't get it
working (in runtime suspend).

Long story short - after implementing `panfrost_{job,mmu,gpu}_suspend_irq()` (only
gpu irq, as you said, is a half solution), I can not only turn off clocks, but even
turn off GPU power supplies entirely, bringing the power consumption of the GPU
itself during *runtime* suspend to ... zero.

The result of this test makes me truly happy, even though complete powercut during
runtime suspend may not be feasible for other reasons (takes ~200000ns on AVG,
MIN ~160000ns, but the MAX is ~475000ns - and beware that I haven't run that for
long, I'd suspect to get up to 1-1.5ms as max time, so that's a big no).

This means that I will take a day or two and I'll push both the "simple" fix for
the Really-power-off and also some more commits to add the full irq sync.

Cheers!
Angelo

>>>
>>> I'm not sure that it's worth changing this like that, then changing it back right
>>> after :-\
>>>
>>> Anyway, if anyone else agrees with doing it and then partially revert, I have no
>>> issues going with this one instead; what I care about ultimately is resolving the
>>> regression ASAP :-)
>>>
>>> Cheers,
>>> Angelo
>>>
>>>>           /*
>>>>            * All in-flight jobs should have released their cycle
>>>> @@ -425,11 +428,10 @@ void panfrost_gpu_power_on(struct panfrost_device *pfdev)
>>>>    void panfrost_gpu_power_off(struct panfrost_device *pfdev)
>>>>    {
>>>> -       u64 core_mask = panfrost_get_core_mask(pfdev);
>>>>           int ret;
>>>>           u32 val;
>>>> -       gpu_write(pfdev, SHADER_PWROFF_LO, pfdev->features.shader_present & 
>>>> core_mask);
>>>> +       gpu_write(pfdev, SHADER_PWROFF_LO, pfdev->features.shader_present);
>>>>           ret = readl_relaxed_poll_timeout(pfdev->iomem + SHADER_PWRTRANS_LO,
>>>>                                            val, !val, 1, 1000);
>>>>           if (ret)
>>>> @@ -441,7 +443,7 @@ void panfrost_gpu_power_off(struct panfrost_device *pfdev)
>>>>           if (ret)
>>>>                   dev_err(pfdev->dev, "tiler power transition timeout");
>>>> -       gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present & core_mask);
>>>> +       gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present);
>>>>           ret = readl_poll_timeout(pfdev->iomem + L2_PWRTRANS_LO,
>>>>                                    val, !val, 0, 1000);
>>>>           if (ret)
>>>>
>>>
>>
> 
> 
> 



