Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0104B7DFFD8
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 09:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F1110E4EE;
	Fri,  3 Nov 2023 08:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903D110E4EE
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 08:54:19 +0000 (UTC)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 90A8B66073CE;
 Fri,  3 Nov 2023 08:54:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1699001658;
 bh=bIiKWuP829Qa1UK4A8HjpiQMVNdf/JCq87erVd3wTzA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HlupnHzJ6qcvUBVpLVE10cR1GLu/t+ijbJEZ4WKjWZsF7uSKTNy4lhx3cN4GvPwuK
 sg7rd8BlPqBVzWYqTsqq5GNvDol3B7+KjIDmjpLPOXlnKTb2WpY8DKbC+H6XQXLDAf
 O0Di681qTw5ZS+zas+wtaoC5bmhXCz6CErIoZHVOjVGXUArdwYkH7wGdGrlUwwM2Ck
 vcrp70KVyscbZoiiBVh4fP7rz1tlCJbPVon6c6Tw5A9aJH4q0dmLNQ6L+cn6CYcHIs
 KGGS6oafdp+yXE0gsda9viSY2tJp0F/NHyhjLKtTamNOJxP4GTJb2hAxE05Cfa7Lv0
 OTF7kKriHB+4g==
Message-ID: <71826cf2-460d-48d1-85d3-735646db1e2a@collabora.com>
Date: Fri, 3 Nov 2023 09:54:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/panfrost: Implement ability to turn on/off GPU
 clocks in suspend
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
References: <20231102142643.75288-1-angelogioacchino.delregno@collabora.com>
 <20231102142643.75288-4-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FHwhQuDf+JCSPg_q+eV1Qb37e6bN7djO5GUSbB5pBv_A@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5FHwhQuDf+JCSPg_q+eV1Qb37e6bN7djO5GUSbB5pBv_A@mail.gmail.com>
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
 boris.brezillon@collabora.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 03/11/23 06:12, Chen-Yu Tsai ha scritto:
> On Thu, Nov 2, 2023 at 10:26 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
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
> IIRC the power domain controller also manages some bus isolation bits
> that prevent SoC lockup when the clock is disabled. Would reversing
> the runtime PM calls and the clock calls help?
> 

Thanks for the reminder, but I tested that already... that doesn't work.

There's one more thing I tried: on the MFG iospace, there are debug registers
that you can poll to check if all bus transactions are finished (so, if the bus
is idle).
During local testing, I even hacked in that, and even with the actual bus being
completely idle, it still freezes... and also checked some more in downstream
code (for Dimensity 9200, kernel 5.10) if there was any other "trick" that I
could make use of, but to no avail.

I'd propose to get at least this power saving upstreamed, then perhaps in the
future we can somehow revisit this to implement some more aggressive power
management code?
We're still getting a generous power saving with this one, I'd say...

Anyway, I expect us to be effectively able to be more aggressive here, but I
also expect that to take quite a bit of time (and probably some help from
MediaTek as well)...

Angelo

> ChenYu
> 
>>   drivers/gpu/drm/panfrost/panfrost_device.c | 61 ++++++++++++++++++++--
>>   drivers/gpu/drm/panfrost/panfrost_device.h | 11 ++++
>>   2 files changed, 68 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
>> index 28f7046e1b1a..2022ed76a620 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
>> @@ -403,7 +403,7 @@ void panfrost_device_reset(struct panfrost_device *pfdev)
>>          panfrost_job_enable_interrupts(pfdev);
>>   }
>>
>> -static int panfrost_device_resume(struct device *dev)
>> +static int panfrost_device_runtime_resume(struct device *dev)
>>   {
>>          struct panfrost_device *pfdev = dev_get_drvdata(dev);
>>
>> @@ -413,7 +413,7 @@ static int panfrost_device_resume(struct device *dev)
>>          return 0;
>>   }
>>
>> -static int panfrost_device_suspend(struct device *dev)
>> +static int panfrost_device_runtime_suspend(struct device *dev)
>>   {
>>          struct panfrost_device *pfdev = dev_get_drvdata(dev);
>>
>> @@ -426,5 +426,58 @@ static int panfrost_device_suspend(struct device *dev)
>>          return 0;
>>   }
>>
>> -EXPORT_GPL_RUNTIME_DEV_PM_OPS(panfrost_pm_ops, panfrost_device_suspend,
>> -                             panfrost_device_resume, NULL);
>> +static int panfrost_device_resume(struct device *dev)
>> +{
>> +       struct panfrost_device *pfdev = dev_get_drvdata(dev);
>> +       int ret;
>> +
>> +       if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS)) {
>> +               ret = clk_enable(pfdev->clock);
>> +               if (ret)
>> +                       return ret;
>> +
>> +               if (pfdev->bus_clock) {
>> +                       ret = clk_enable(pfdev->bus_clock);
>> +                       if (ret)
>> +                               goto err_bus_clk;
>> +               }
>> +       }
>> +
>> +       ret = pm_runtime_force_resume(dev);
>> +       if (ret)
>> +               goto err_resume;
>> +
>> +       return 0;
>> +
>> +err_resume:
>> +       if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS) && pfdev->bus_clock)
>> +               clk_disable(pfdev->bus_clock);
>> +err_bus_clk:
>> +       if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS))
>> +               clk_disable(pfdev->clock);
>> +       return ret;
>> +}
>> +
>> +static int panfrost_device_suspend(struct device *dev)
>> +{
>> +       struct panfrost_device *pfdev = dev_get_drvdata(dev);
>> +       int ret;
>> +
>> +       ret = pm_runtime_force_suspend(dev);
>> +       if (ret)
>> +               return ret;
>> +
>> +       if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS)) {
>> +               clk_disable(pfdev->clock);
>> +
>> +               if (pfdev->bus_clock)
>> +                       clk_disable(pfdev->bus_clock);
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +EXPORT_GPL_DEV_PM_OPS(panfrost_pm_ops) = {
>> +       RUNTIME_PM_OPS(panfrost_device_runtime_suspend, panfrost_device_runtime_resume, NULL)
>> +       SYSTEM_SLEEP_PM_OPS(panfrost_device_suspend, panfrost_device_resume)
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
>> +       GPU_PM_CLK_DIS,
>> +};
>> +
>>   struct panfrost_features {
>>          u16 id;
>>          u16 revision;
>> @@ -75,6 +83,9 @@ struct panfrost_compatible {
>>
>>          /* Vendor implementation quirks callback */
>>          void (*vendor_quirk)(struct panfrost_device *pfdev);
>> +
>> +       /* Allowed PM features */
>> +       u8 pm_features;
>>   };
>>
>>   struct panfrost_device {
>> --
>> 2.42.0
>>

