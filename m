Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DCE7FBDC0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 16:10:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F404710E565;
	Tue, 28 Nov 2023 15:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB9A10E565
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 15:10:48 +0000 (UTC)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 103A766072A4;
 Tue, 28 Nov 2023 15:10:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701184247;
 bh=3rcjns7Zzi1era39Xxvp1KTjKNX1ChFSbb4r4eeZBrs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SIH21FmWVkd+J9lf6GOQREl1wiEcMUUYUC70dlu8y3yU9/NI7p5g6/u4lrDE4DVNr
 pz7qpMHgAxyMIn6jJKqVjiwjBAJB4v6tPbTzTac0ppOMAjVh+X2kkmzf7Ql2/f34fl
 IUAgEhPieOpzKDbV+Dr2u2p3otN6dZnQC34PoXuMUt432W2qha2NQOIh7CHL4J6Zj/
 rMj3OeHWmS0lRnPmeknSPPdfUxzdWl+r3qup3/w3qA93p8FbL/U2lJ8hNwiL6HNM5c
 et38V4nOSoWjSDENgg0Tkd6gCKhbtJ/Aabi5skZ/7kNJ6HHxb3GaH1Ru4rbUMeVUB4
 U8g43zDLzx/8g==
Message-ID: <6c14d90f-f9e1-4af7-877e-f000b7fa1e08@collabora.com>
Date: Tue, 28 Nov 2023 16:10:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/panfrost: Synchronize and disable interrupts
 before powering off
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20231128124510.391007-1-angelogioacchino.delregno@collabora.com>
 <20231128124510.391007-4-angelogioacchino.delregno@collabora.com>
 <20231128150612.17f6a095@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231128150612.17f6a095@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, mripard@kernel.org, steven.price@arm.com,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, kernel@collabora.com, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 28/11/23 15:06, Boris Brezillon ha scritto:
> On Tue, 28 Nov 2023 13:45:10 +0100
> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> wrote:
> 
>> To make sure that we don't unintentionally perform any unclocked and/or
>> unpowered R/W operation on GPU registers, before turning off clocks and
>> regulators we must make sure that no GPU, JOB or MMU ISR execution is
>> pending: doing that required to add a mechanism to synchronize the
>> interrupts on suspend.
>>
>> Add functions panfrost_{gpu,job,mmu}_suspend_irq() which will perform
>> interrupts masking and ISR execution synchronization, and then call
>> those in the panfrost_device_runtime_suspend() handler in the exact
>> sequence of job (may require mmu!) -> mmu -> gpu.
>>
>> As a side note, JOB and MMU suspend_irq functions needed some special
>> treatment: as their interrupt handlers will unmask interrupts, it was
>> necessary to add a bitmap for "is_suspending" which is used to address
>> the possible corner case of unintentional IRQ unmasking because of ISR
>> execution after a call to synchronize_irq().
>>
>> Of course, unmasking the interrupts is being done as part of the reset
>> happening during runtime_resume(): since we're anyway resuming all of
>> GPU, JOB, MMU, the only additional action is to zero out the newly
>> introduced `is_suspending` bitmap directly in the resume handler, as
>> to avoid adding panfrost_{job,mmu}_resume_irq() function just for
>> clearing own bits, especially because it currently makes way more sense
>> to just zero out the bitmap.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/panfrost/panfrost_device.c |  4 ++++
>>   drivers/gpu/drm/panfrost/panfrost_device.h |  7 +++++++
>>   drivers/gpu/drm/panfrost/panfrost_gpu.c    |  7 +++++++
>>   drivers/gpu/drm/panfrost/panfrost_gpu.h    |  1 +
>>   drivers/gpu/drm/panfrost/panfrost_job.c    | 18 +++++++++++++++---
>>   drivers/gpu/drm/panfrost/panfrost_job.h    |  1 +
>>   drivers/gpu/drm/panfrost/panfrost_mmu.c    | 17 ++++++++++++++---
>>   drivers/gpu/drm/panfrost/panfrost_mmu.h    |  1 +
>>   8 files changed, 50 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
>> index c90ad5ee34e7..ed34aa55a7da 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
>> @@ -407,6 +407,7 @@ static int panfrost_device_runtime_resume(struct device *dev)
>>   {
>>   	struct panfrost_device *pfdev = dev_get_drvdata(dev);
>>   
>> +	bitmap_zero(pfdev->is_suspending, PANFROST_COMP_BIT_MAX);
> 
> I would let each sub-block clear their bit in the reset path, since
> that's where the IRQs are effectively unmasked.
> 


Honestly I wouldn't like seeing that: the reason is that this is something that
is done *for* suspend/resume and only for that, while reset may be called out of
the suspend/resume handlers.

I find clearing the suspend bits in the HW reset path a bit confusing, especially
when it is possible to avoid doing it there...

>>   	panfrost_device_reset(pfdev);
>>   	panfrost_devfreq_resume(pfdev);
>>   
>> @@ -421,6 +422,9 @@ static int panfrost_device_runtime_suspend(struct device *dev)
>>   		return -EBUSY;
>>   
>>   	panfrost_devfreq_suspend(pfdev);
>> +	panfrost_job_suspend_irq(pfdev);
>> +	panfrost_mmu_suspend_irq(pfdev);
>> +	panfrost_gpu_suspend_irq(pfdev);
>>   	panfrost_gpu_power_off(pfdev);
>>   
>>   	return 0;
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
>> index 54a8aad54259..29f89f2d3679 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
>> @@ -25,6 +25,12 @@ struct panfrost_perfcnt;
>>   #define NUM_JOB_SLOTS 3
>>   #define MAX_PM_DOMAINS 5
>>   
>> +enum panfrost_drv_comp_bits {
>> +	PANFROST_COMP_BIT_MMU,
>> +	PANFROST_COMP_BIT_JOB,
>> +	PANFROST_COMP_BIT_MAX
>> +};
>> +
>>   /**
>>    * enum panfrost_gpu_pm - Supported kernel power management features
>>    * @GPU_PM_CLK_DIS:  Allow disabling clocks during system suspend
>> @@ -109,6 +115,7 @@ struct panfrost_device {
>>   
>>   	struct panfrost_features features;
>>   	const struct panfrost_compatible *comp;
>> +	DECLARE_BITMAP(is_suspending, PANFROST_COMP_BIT_MAX);
> 
> nit: Maybe s/is_suspending/suspended_irqs/, given the state remains
> until the device is resumed.

If we keep the `is_suspending` name, we can use this one more generically in
case we ever need to, what do you think?

Cheers,
Angelo

