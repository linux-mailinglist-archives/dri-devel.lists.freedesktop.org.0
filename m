Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8DB7DCAFB
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 11:33:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5778910E464;
	Tue, 31 Oct 2023 10:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6335510E46E
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 10:33:48 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3DC856607390;
 Tue, 31 Oct 2023 10:33:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698748426;
 bh=mi3QfpsDfPiaZ8qi8ydYZ5eHdTGQKohAddXDv+hUy6g=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=YrgbxKfNosUOoNMzkpaJhGOkPEIPj0mBJQx73EICvmRzAY504ytUcQCVrCW/ixrro
 UCE4a/aQdAIbeeZ3ZZKKZVvcLRq6szG0Si1Pprmm4JFyVThMWXJ9fbgLrVBOasDhzz
 NrSWE59wVpC3ueM6pYyo0GiSwErSHe/MJRsIWtcuoiT1gG1Gd9m4ZrpUQLe5fned7+
 dMu8kkOqgZ0G0TwxAaXoG1tGavu9EGuNbxza/mpImW6ZFHxr8A4zl3vLOg7dULmrCE
 oGmyAdW9if2WVrDL+Tct1tyfgD//AVOZVhW9lBkdRWlNvonM20lm3QbB5xYQrIN2UQ
 GTcSBgsAB4Bhw==
Message-ID: <5a73e1fe-e66f-4cb3-87f4-315a4034e8ba@collabora.com>
Date: Tue, 31 Oct 2023 11:33:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/panfrost: Implement ability to turn on/off GPU
 clocks in suspend
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Steven Price <steven.price@arm.com>, boris.brezillon@collabora.com
References: <20231030132257.85379-1-angelogioacchino.delregno@collabora.com>
 <20231030132257.85379-2-angelogioacchino.delregno@collabora.com>
 <f6b0d965-f386-48ad-80a7-072c81a9e4a8@arm.com>
 <44c81015-26bf-476a-afbd-45b8c6e42d4b@collabora.com>
In-Reply-To: <44c81015-26bf-476a-afbd-45b8c6e42d4b@collabora.com>
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, wenst@chromium.org, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 31/10/23 09:59, AngeloGioacchino Del Regno ha scritto:
> Il 30/10/23 15:57, Steven Price ha scritto:
>> On 30/10/2023 13:22, AngeloGioacchino Del Regno wrote:
>>> Currently, the GPU is being internally powered off for runtime suspend
>>> and turned back on for runtime resume through commands sent to it, but
>>> note that the GPU doesn't need to be clocked during the poweroff state,
>>> hence it is possible to save some power on selected platforms.
>>
>> Looks like a good addition - I suspect some implementations are quite
>> leaky so this could have a meaningful power saving in some cases.
>>
>>> Add suspend and resume handlers for full system sleep and then add
>>> a new panfrost_gpu_pm enumeration and a pm_features variable in the
>>> panfrost_compatible structure: BIT(GPU_PM_CLK_DIS) will be used to
>>> enable this power saving technique only on SoCs that are able to
>>> safely use it.
>>>
>>> Note that this was implemented only for the system sleep case and not
>>> for runtime PM because testing on one of my MediaTek platforms showed
>>> issues when turning on and off clocks aggressively (in PM runtime),
>>> with the GPU locking up and unable to soft reset, eventually resulting
>>> in a full system lockup.
>>
>> I think I know why you saw this - see below.
>>
>>> Doing this only for full system sleep never showed issues in 3 days
>>> of testing by suspending and resuming the system continuously.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> ---
>>>   drivers/gpu/drm/panfrost/panfrost_device.c | 61 ++++++++++++++++++++--
>>>   drivers/gpu/drm/panfrost/panfrost_device.h | 11 ++++
>>>   2 files changed, 68 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c 
>>> b/drivers/gpu/drm/panfrost/panfrost_device.c
>>> index 28f7046e1b1a..2022ed76a620 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
>>> @@ -403,7 +403,7 @@ void panfrost_device_reset(struct panfrost_device *pfdev)
>>>       panfrost_job_enable_interrupts(pfdev);
>>>   }
>>> -static int panfrost_device_resume(struct device *dev)
>>> +static int panfrost_device_runtime_resume(struct device *dev)
>>>   {
>>>       struct panfrost_device *pfdev = dev_get_drvdata(dev);
>>> @@ -413,7 +413,7 @@ static int panfrost_device_resume(struct device *dev)
>>>       return 0;
>>>   }
>>> -static int panfrost_device_suspend(struct device *dev)
>>> +static int panfrost_device_runtime_suspend(struct device *dev)
>>>   {
>>>       struct panfrost_device *pfdev = dev_get_drvdata(dev);
>>
>> So this function calls panfrost_gpu_power_off() which is simply:
>>
>> void panfrost_gpu_power_off(struct panfrost_device *pfdev)
>> {
>>     gpu_write(pfdev, TILER_PWROFF_LO, 0);
>>     gpu_write(pfdev, SHADER_PWROFF_LO, 0);
>>     gpu_write(pfdev, L2_PWROFF_LO, 0);
>> }
>>
>> So we instruct the GPU to turn off, but don't wait for it to complete.
>>
>>> @@ -426,5 +426,58 @@ static int panfrost_device_suspend(struct device *dev)
>>>       return 0;
>>>   }
>>> -EXPORT_GPL_RUNTIME_DEV_PM_OPS(panfrost_pm_ops, panfrost_device_suspend,
>>> -                  panfrost_device_resume, NULL);
>>> +static int panfrost_device_resume(struct device *dev)
>>> +{
>>> +    struct panfrost_device *pfdev = dev_get_drvdata(dev);
>>> +    int ret;
>>> +
>>> +    if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS)) {
>>> +        ret = clk_enable(pfdev->clock);
>>> +        if (ret)
>>> +            return ret;
>>> +
>>> +        if (pfdev->bus_clock) {
>>> +            ret = clk_enable(pfdev->bus_clock);
>>> +            if (ret)
>>> +                goto err_bus_clk;
>>> +        }
>>> +    }
>>> +
>>> +    ret = pm_runtime_force_resume(dev);
>>> +    if (ret)
>>> +        goto err_resume;
>>> +
>>> +    return 0;
>>> +
>>> +err_resume:
>>> +    if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS) && pfdev->bus_clock)
>>> +        clk_disable(pfdev->bus_clock);
>>> +err_bus_clk:
>>> +    if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS))
>>> +        clk_disable(pfdev->clock);
>>> +    return ret;
>>> +}
>>> +
>>> +static int panfrost_device_suspend(struct device *dev)
>>> +{
>>> +    struct panfrost_device *pfdev = dev_get_drvdata(dev);
>>> +    int ret;
>>> +
>>> +    ret = pm_runtime_force_suspend(dev);
>>> +    if (ret)
>>> +        return ret;
>>
>> So here we've started shutting down the GPU (pm_runtime_force_suspend
>> eventually calls panfrost_gpu_power_off). But nothing here waits for the
>> GPU to actually finish shutting down. If we're unlucky there's dirty
>> data in the caches (or coherency which can snoop into the caches) so the
>> GPU could be actively making bus cycles...
>>
>>> +
>>> +    if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS)) {
>>> +        clk_disable(pfdev->clock);
>>
>> ... until its clock goes and everything locks up.
>>
>> Something should be waiting for the power down to complete. Either poll
>> the L2_PWRTRANS_LO register to detect that the L2 is no longer
>> transitioning, or wait for the GPU_IRQ_POWER_CHANGED_ALL interrupt to fire.
>>
>> It would be good to test this with the system suspend doing the full
>> power off, it should be safe so it would be a good stress test. Although
>> whether we want the overhead in normal operation is another matter - so
>> I suspect it should just be for testing purposes.
>>
>> I would hope that we don't actually need the GPU_PM_CLK_DIS feature -
>> this should work as long as the GPU is given the time to shutdown.
>> Although note that actually cutting the power (patches 3 & 4) may expose
>> us to implementation errata - there have been issues with designs not
>> resetting correctly. I'm not sure if those made it into real products or
>> if such bugs are confined to test chips. So for the sake of not causing
>> regressions it's probably not a bad thing to have ;)
>>
> 
> Huge thanks for this analysis of that lockup issue. That was highly appreciated.
> 
> I've seen that anyway disabling the clocks during *runtime* suspend will make us
> lose only a few nanoseconds (without polling for that register, nor waiting for
> the interrupt you mentioned).... so I'd say that if L2_PWRTRANS_LO takes as well
> just nanoseconds, I could put those clk_disable()/clk_enable() calls back to the
> Runtime PM handlers as per my original idea.
> 
> I'll go on with checking if it is feasible to poll-wait to do this in runtime pm,
> otherwise the v2 will still have this in system sleep handlers...
> 
> Anyway, as for the GPU_PM_CLK_DIS feature - I feel like being extremely careful
> with this is still a good idea... thing is, even if we're sure that the GPU itself
> is fine with us turning off/on clocks (even aggressively), I'm not sure that *all*
> of the SoCs using Mali GPUs don't have any kind of quirk and for safety I don't
> want to place any bets.
> 
> My idea is to add this with feature opt-in - then, if after some time we discover
> that all SoCs want it and can safely use it, we can simplify the flow by removing
> the feature bit.
> 

Sorry for the double email - after some analysis and some trials of your wait
solution, I've just seen that... well, panfrost_gpu_power_off() is, and has always
been entirely broken, as in it has never done any poweroff!

What it does is:

	gpu_write(pfdev, TILER_PWROFF_LO, 0);
	gpu_write(pfdev, SHADER_PWROFF_LO, 0);
	gpu_write(pfdev, L2_PWROFF_LO, 0);

...but the {TILER,SHADER,L2}_PWROFF_LO register is a bitmap and in order to request
poweroff of tiler/shader cores and cache we shall flip bits to 1, but this is doing
the *exact opposite* of what it's supposed to do.

It's doing nothing, at all.

I've just fixed that locally (running some tests on MT8195 as we speak) like so:

gpu_write(pfdev, TILER_PWROFF_LO, pfdev->features.tiler_present);
gpu_write(pfdev, SHADER_PWROFF_LO, pfdev->features.shader_present & core_mask);
gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present & core_mask);

...and now it appears that I can actually manage clocks aggressively during runtime
power management without any side issues.

Apparently, v2 of this series will have "more juice" than initially intended...

Angelo

> Cheers,
> Angelo
> 
>> Steve
>>
>>> +
>>> +        if (pfdev->bus_clock)
>>> +            clk_disable(pfdev->bus_clock);
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +EXPORT_GPL_DEV_PM_OPS(panfrost_pm_ops) = {
>>> +    RUNTIME_PM_OPS(panfrost_device_runtime_suspend, 
>>> panfrost_device_runtime_resume, NULL)
>>> +    SYSTEM_SLEEP_PM_OPS(panfrost_device_suspend, panfrost_device_resume)
>>> +};
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h 
>>> b/drivers/gpu/drm/panfrost/panfrost_device.h
>>> index 1ef38f60d5dc..d7f179eb8ea3 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
>>> @@ -25,6 +25,14 @@ struct panfrost_perfcnt;
>>>   #define NUM_JOB_SLOTS 3
>>>   #define MAX_PM_DOMAINS 5
>>> +/**
>>> + * enum panfrost_gpu_pm - Supported kernel power management features
>>> + * @GPU_PM_CLK_DIS:  Allow disabling clocks during system suspend
>>> + */
>>> +enum panfrost_gpu_pm {
>>> +    GPU_PM_CLK_DIS,
>>> +};
>>> +
>>>   struct panfrost_features {
>>>       u16 id;
>>>       u16 revision;
>>> @@ -75,6 +83,9 @@ struct panfrost_compatible {
>>>       /* Vendor implementation quirks callback */
>>>       void (*vendor_quirk)(struct panfrost_device *pfdev);
>>> +
>>> +    /* Allowed PM features */
>>> +    u8 pm_features;
>>>   };
>>>   struct panfrost_device {
>>

