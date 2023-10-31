Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 366807DCDAF
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 14:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FF510E4BB;
	Tue, 31 Oct 2023 13:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAE610E4BB
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 13:20:45 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E522A66073A3;
 Tue, 31 Oct 2023 13:20:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698758443;
 bh=QnmE4Ern4NeUDthiCkxZFXVHc4ml/cBbNmjxDIZdl88=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Lgooypwv8KNm90QUPD80duJntBaA4qLPjk3zwJsPHnOspk8mQebRCI32elJg3MUeI
 VmD1Y+5jrFqjqluFsbQVnasJV8+y5GmBsV1mEPLpppIK5wGqXT35j3iHu23pqHi0sb
 0CINcilVYMGw4rIYzSUWKekEPVB+9++S0By2lNEYOqaESRIgWC2OTfWYt3qhNWeF6X
 NE2ZbMEYOrUoS6sNPU0BwWW9MK9K7qPhL4BWqE7l2fYSWrZ2jkDpbcRVCh5jhB8Rws
 2KR+5lmVBRqTa0r1V2nn5Uji9/VBsEmujmJUhn9aR2+nrhjKEum+tdaHlqJBsPnRz9
 l1MeLNzfnuVHw==
Message-ID: <38b62659-dcef-4b49-9b4c-e055ed9a215a@collabora.com>
Date: Tue, 31 Oct 2023 14:20:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/panfrost: Implement ability to turn on/off GPU
 clocks in suspend
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
References: <20231030132257.85379-1-angelogioacchino.delregno@collabora.com>
 <20231030132257.85379-2-angelogioacchino.delregno@collabora.com>
 <CAGXv+5EhRUz6qptSzhzbcq4-qQKDzN5xFtS0WMNUCOH5JSL0Jw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5EhRUz6qptSzhzbcq4-qQKDzN5xFtS0WMNUCOH5JSL0Jw@mail.gmail.com>
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

Il 31/10/23 04:18, Chen-Yu Tsai ha scritto:
> On Mon, Oct 30, 2023 at 9:23 PM AngeloGioacchino Del Regno
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
>> issues when turning on and off clocks aggressively (in PM runtime),
>> with the GPU locking up and unable to soft reset, eventually resulting
>> in a full system lockup.
>>
>> Doing this only for full system sleep never showed issues in 3 days
>> of testing by suspending and resuming the system continuously.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
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
> 
> Nit: I'd just use bitfields. They are easier to set and get without
> extra macros, and the naming would be self-explanatory. Unless you
> expect a need to do mask checking (though the compiler might be able
> to optimize this).
> 

I don't expect a need to do mask checking, but I don't expect the opposite either..
...this could happen in the future, or maybe not, and this becomes a bool, even.

That's why I went with a u8 :-)

Let's keep it flexible.

Thanks,
Angelo

> ChenYu
> 
>>   };
>>
>>   struct panfrost_device {
>> --
>> 2.42.0
>>

