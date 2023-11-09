Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A627E672D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 10:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403AB10E217;
	Thu,  9 Nov 2023 09:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E1310E217
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 09:53:42 +0000 (UTC)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EBAE76607410;
 Thu,  9 Nov 2023 09:53:39 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1699523620;
 bh=ZGn7roYimOFpkQ85qNvqGc33xwlpOQIEnSogwkDgLxw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=i7l8oxAhoeC323h+d+wmvTuAdcy4RJleeJtH6CbWXFRoFX6kd7dG4P7Y3ga4DxflT
 +KIB8y3Nrzl4EjNQqypq5nsiCTMKoKjruemrRIonmFnL+oDDkHT/WqpB1lMRdNom8x
 CL5+a7cUSK4hMXVMRgLbnYObuz58YdL946VzZm4V7LwXaVvClZQfShrqu/SR0cJHN7
 59zq5WMLLDvW68Jw/8cOASYp1pUxaxcbF5Fh6s+3Kns5qW3jZQlArHbZJ11hZbEl1W
 /5WmBDn9E6QpLGyw7OAAJL/cAhPiUWvBMpMZr8UyOUSq+3DfYcIFIZ89ln+t4KomSh
 SQLit0OqvV02Q==
Message-ID: <e88b6d5e-6888-4594-bbd4-7639e4205ee7@collabora.com>
Date: Thu, 9 Nov 2023 10:53:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/panfrost: Implement ability to turn on/off GPU
 clocks in suspend
Content-Language: en-US
To: Steven Price <steven.price@arm.com>, boris.brezillon@collabora.com
References: <20231102142643.75288-1-angelogioacchino.delregno@collabora.com>
 <20231102142643.75288-4-angelogioacchino.delregno@collabora.com>
 <343788b6-c3b7-44f3-9376-d6937baeb16e@arm.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <343788b6-c3b7-44f3-9376-d6937baeb16e@arm.com>
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, wenst@chromium.org, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 08/11/23 16:44, Steven Price ha scritto:
> On 02/11/2023 14:26, AngeloGioacchino Del Regno wrote:
>> Currently, the GPU is being internally powered off for runtime suspend
>> and turned back on for runtime resume through commands sent to it, but
>> note that the GPU doesn't need to be clocked during the poweroff state,
>> hence it is possible to save some power on selected platforms.
>>
>> Add suspend and resume handlers for full system sleep and then add
>> a new panfrost_gpu_pm enumeration and a pm_features variable in the
>> panfrost_compatible structure: BIT(GPU_PM_CLK_DIS) will be used to
>> enable this power saving technique only on SoCs that are able to
>> safely use it.
>>
>> Note that this was implemented only for the system sleep case and not
>> for runtime PM because testing on one of my MediaTek platforms showed
>> issues when turning on and off clocks aggressively (in PM runtime)
>> resulting in a full system lockup.
>>
>> Doing this only for full system sleep never showed issues during my
>> testing by suspending and resuming the system continuously for more
>> than 100 cycles.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>
>> Note: Even after fixing the panfrost_power_off() function, I'm still
>> getting issues with turning off the clocks at .runtime_suspend() but
>> this time, instead of getting a GPU lockup, the entire SoC will deadlock
>> bringing down the entire system with it (so it's even worst!) :-)
> 
> Ouch! Hopefully that's a SoC issue as I can't see anything that should
> cause problems. But note that if the GPU is powered down during a bus
> transaction that can lock up the entire bus.
>>
>>
>>   drivers/gpu/drm/panfrost/panfrost_device.c | 61 ++++++++++++++++++++--
>>   drivers/gpu/drm/panfrost/panfrost_device.h | 11 ++++
>>   2 files changed, 68 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
>> index 28f7046e1b1a..2022ed76a620 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
>> @@ -403,7 +403,7 @@ void panfrost_device_reset(struct panfrost_device *pfdev)
>>   	panfrost_job_enable_interrupts(pfdev);
>>   }
>>   
>> -static int panfrost_device_resume(struct device *dev)
>> +static int panfrost_device_runtime_resume(struct device *dev)
>>   {
>>   	struct panfrost_device *pfdev = dev_get_drvdata(dev);
>>   
>> @@ -413,7 +413,7 @@ static int panfrost_device_resume(struct device *dev)
>>   	return 0;
>>   }
>>   
>> -static int panfrost_device_suspend(struct device *dev)
>> +static int panfrost_device_runtime_suspend(struct device *dev)
>>   {
>>   	struct panfrost_device *pfdev = dev_get_drvdata(dev);
>>   
>> @@ -426,5 +426,58 @@ static int panfrost_device_suspend(struct device *dev)
>>   	return 0;
>>   }
>>   
>> -EXPORT_GPL_RUNTIME_DEV_PM_OPS(panfrost_pm_ops, panfrost_device_suspend,
>> -			      panfrost_device_resume, NULL);
>> +static int panfrost_device_resume(struct device *dev)
>> +{
>> +	struct panfrost_device *pfdev = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS)) {
>> +		ret = clk_enable(pfdev->clock);
>> +		if (ret)
>> +			return ret;
>> +
>> +		if (pfdev->bus_clock) {
>> +			ret = clk_enable(pfdev->bus_clock);
>> +			if (ret)
>> +				goto err_bus_clk;
>> +		}
>> +	}
>> +
>> +	ret = pm_runtime_force_resume(dev);
>> +	if (ret)
>> +		goto err_resume;
>> +
>> +	return 0;
>> +
>> +err_resume:
>> +	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS) && pfdev->bus_clock)
>> +		clk_disable(pfdev->bus_clock);
>> +err_bus_clk:
>> +	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS))
>> +		clk_disable(pfdev->clock);
>> +	return ret;
>> +}
>> +
>> +static int panfrost_device_suspend(struct device *dev)
>> +{
>> +	struct panfrost_device *pfdev = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret = pm_runtime_force_suspend(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS)) {
>> +		clk_disable(pfdev->clock);
>> +
>> +		if (pfdev->bus_clock)
>> +			clk_disable(pfdev->bus_clock);
> 
> NIT: I would normally expect panfrost_device_resume() to have the
> opposite order. I'm not sure if there's an expected order here but I
> feel like the bus should be enabled before core - so _resume() would
> need to be swapped round.
> 

Actually, in panfrost_clk_init(), "bus" gets enabled after core... I'm
not sure whether this was intentional or not either - but for consistency
I will swap them in suspend (turning off `bus_clock` first, 'clock` after)
as that's how it's done in panfrost_clk_fini() as well (except there the
clocks are also unprepared).

Though, I would agree on the logical fact that bus should get disabled
after core...

Cheers,
Angelo

> Other than that:
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> 
> Thanks,
> 
> Steve
> 
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +EXPORT_GPL_DEV_PM_OPS(panfrost_pm_ops) = {
>> +	RUNTIME_PM_OPS(panfrost_device_runtime_suspend, panfrost_device_runtime_resume, NULL)
>> +	SYSTEM_SLEEP_PM_OPS(panfrost_device_suspend, panfrost_device_resume)
>> +};
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
>> index 1ef38f60d5dc..d7f179eb8ea3 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
>> @@ -25,6 +25,14 @@ struct panfrost_perfcnt;
>>   #define NUM_JOB_SLOTS 3
>>   #define MAX_PM_DOMAINS 5
>>   
>> +/**
>> + * enum panfrost_gpu_pm - Supported kernel power management features
>> + * @GPU_PM_CLK_DIS:  Allow disabling clocks during system suspend
>> + */
>> +enum panfrost_gpu_pm {
>> +	GPU_PM_CLK_DIS,
>> +};
>> +
>>   struct panfrost_features {
>>   	u16 id;
>>   	u16 revision;
>> @@ -75,6 +83,9 @@ struct panfrost_compatible {
>>   
>>   	/* Vendor implementation quirks callback */
>>   	void (*vendor_quirk)(struct panfrost_device *pfdev);
>> +
>> +	/* Allowed PM features */
>> +	u8 pm_features;
>>   };
>>   
>>   struct panfrost_device {
> 
> _______________________________________________
> Kernel mailing list -- kernel@mailman.collabora.com
> To unsubscribe send an email to kernel-leave@mailman.collabora.com


