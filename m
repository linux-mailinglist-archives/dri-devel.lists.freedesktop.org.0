Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A051F803167
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 12:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750CC10E350;
	Mon,  4 Dec 2023 11:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C61410E350
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 11:20:30 +0000 (UTC)
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D953D6602030;
 Mon,  4 Dec 2023 11:20:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701688828;
 bh=cZeI5VKu1LE+0g50TIvM40Dlj8CQw2yZgDTALs1PHU0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=buSFgO4rAzYsi+vvoqP2Clk3yGypsraT+LVLmh2mmv5LcqDgb6ihDfku0yaCby9Q9
 u4KCCtQqFynTk9mMnYK+dXZuInrI1VBgNNjQnQXcUDfgYw+/871X/Whbh1QMptTDml
 n8T3PPC+WNuSiE5Tn2g+0poOhnJT7kGz+r7ERyr+B6q5AGeklD0aW408fWMxi9Wj0w
 t5una1nqiNjsuvZtItmVOwsaxI+8O2od7Fq0cAi30yZ8byofY/kwkRSvhifQkKL9mL
 CoWAXOXhJwJ/WVh60CJQvs1NtHTkIWGmaC3S0BcmCJI5aweoLfUzUJZju3n0mRG0d9
 BFZN2B0hDE1Xg==
Message-ID: <8b58d97d-7643-46bd-b702-b315addf32a1@collabora.com>
Date: Mon, 4 Dec 2023 12:20:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/panfrost: Synchronize and disable interrupts
 before powering off
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20231201104027.35273-1-angelogioacchino.delregno@collabora.com>
 <20231201104027.35273-4-angelogioacchino.delregno@collabora.com>
 <20231201121437.7d5cdefb@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231201121437.7d5cdefb@collabora.com>
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

Il 01/12/23 12:14, Boris Brezillon ha scritto:
> On Fri,  1 Dec 2023 11:40:27 +0100
> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> wrote:
> 
>> To make sure that we don't unintentionally perform any unclocked and/or
>> unpowered R/W operation on GPU registers, before turning off clocks and
>> regulators we must make sure that no GPU, JOB or MMU ISR execution is
>> pending: doing that required to add a mechanism to synchronize the
> 
>                        ^ requires the addition of a mechanism...
> 
>> interrupts on suspend.
>>
>> Add functions panfrost_{gpu,job,mmu}_suspend_irq() which will perform
>> interrupts masking and ISR execution synchronization, and then call
>> those in the panfrost_device_runtime_suspend() handler in the exact
>> sequence of job (may require mmu!) -> mmu -> gpu.
>>
>> As a side note, JOB and MMU suspend_irq functions needed some special
>> treatment: as their interrupt handlers will unmask interrupts, it was
>> necessary to add a bitmap for `is_suspended` which is used to address
> 
>              to add an `is_suspended` bitmap which is used...
> 
>> the possible corner case of unintentional IRQ unmasking because of ISR
>> execution after a call to synchronize_irq().
> 
> Also fixes the case where the interrupt handler is called when the
> device is suspended because the IRQ line is shared with another device.
> No need to update the commit message for that though.
> 
>>
>> At resume, clear each is_suspended bit in the reset path of JOB/MMU
>> to allow unmasking the interrupts.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/panfrost/panfrost_device.c |  3 +++
>>   drivers/gpu/drm/panfrost/panfrost_device.h |  7 +++++++
>>   drivers/gpu/drm/panfrost/panfrost_gpu.c    |  6 ++++++
>>   drivers/gpu/drm/panfrost/panfrost_gpu.h    |  1 +
>>   drivers/gpu/drm/panfrost/panfrost_job.c    | 20 +++++++++++++++++---
>>   drivers/gpu/drm/panfrost/panfrost_job.h    |  1 +
>>   drivers/gpu/drm/panfrost/panfrost_mmu.c    | 19 ++++++++++++++++---
>>   drivers/gpu/drm/panfrost/panfrost_mmu.h    |  1 +
>>   8 files changed, 52 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
>> index c90ad5ee34e7..a45e4addcc19 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
>> @@ -421,6 +421,9 @@ static int panfrost_device_runtime_suspend(struct device *dev)
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
>> index 54a8aad54259..5c24f01f8904 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
>> @@ -25,6 +25,12 @@ struct panfrost_perfcnt;
>>   #define NUM_JOB_SLOTS 3
>>   #define MAX_PM_DOMAINS 5
>>   
>> +enum panfrost_drv_comp_bits {
>> +	PANFROST_COMP_BIT_MMU,
>> +	PANFROST_COMP_BIT_JOB,
> 
> I think we need one for the GPU interrupt too, for the
> irq-line-is-shared-with-another-device thing I was mentioning.
> 

Yes, I've also reordered the entries by name for v4.

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
>> +	DECLARE_BITMAP(is_suspended, PANFROST_COMP_BIT_MAX);
>>   
>>   	spinlock_t as_lock;
>>   	unsigned long as_in_use_mask;
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
>> index 7adc4441fa14..3a6a4fe7aca1 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
>> @@ -452,6 +452,12 @@ void panfrost_gpu_power_off(struct panfrost_device *pfdev)
>>   		dev_err(pfdev->dev, "l2 power transition timeout");
>>   }
>>   
>> +void panfrost_gpu_suspend_irq(struct panfrost_device *pfdev)
>> +{
> 
>          set_bit(PANFROST_COMP_BIT_GPU, pfdev->is_suspended);
> 
> here, and an extra check in panfrost_gpu_irq_handler() to bail out
> before the register accesses if PANFROST_COMP_BIT_GPU is set.
> 

Right.

>> +	gpu_write(pfdev, GPU_INT_MASK, 0);
>> +	synchronize_irq(pfdev->gpu_irq);
>> +}
>> +
>>   int panfrost_gpu_init(struct panfrost_device *pfdev)
>>   {
>>   	int err;
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.h b/drivers/gpu/drm/panfrost/panfrost_gpu.h
>> index 876fdad9f721..d841b86504ea 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.h
>> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.h
>> @@ -15,6 +15,7 @@ u32 panfrost_gpu_get_latest_flush_id(struct panfrost_device *pfdev);
>>   int panfrost_gpu_soft_reset(struct panfrost_device *pfdev);
>>   void panfrost_gpu_power_on(struct panfrost_device *pfdev);
>>   void panfrost_gpu_power_off(struct panfrost_device *pfdev);
>> +void panfrost_gpu_suspend_irq(struct panfrost_device *pfdev);
>>   
>>   void panfrost_cycle_counter_get(struct panfrost_device *pfdev);
>>   void panfrost_cycle_counter_put(struct panfrost_device *pfdev);
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
>> index f9446e197428..7600e7741211 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>> @@ -405,6 +405,8 @@ void panfrost_job_enable_interrupts(struct panfrost_device *pfdev)
>>   	int j;
>>   	u32 irq_mask = 0;
>>   
>> +	clear_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended);
>> +
>>   	for (j = 0; j < NUM_JOB_SLOTS; j++) {
>>   		irq_mask |= MK_JS_MASK(j);
>>   	}
>> @@ -413,6 +415,14 @@ void panfrost_job_enable_interrupts(struct panfrost_device *pfdev)
>>   	job_write(pfdev, JOB_INT_MASK, irq_mask);
>>   }
>>   
>> +void panfrost_job_suspend_irq(struct panfrost_device *pfdev)
>> +{
>> +	set_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended);
>> +
>> +	job_write(pfdev, JOB_INT_MASK, 0);
>> +	synchronize_irq(pfdev->js->irq);
>> +}
>> +
>>   static void panfrost_job_handle_err(struct panfrost_device *pfdev,
>>   				    struct panfrost_job *job,
>>   				    unsigned int js)
>> @@ -792,9 +802,13 @@ static irqreturn_t panfrost_job_irq_handler_thread(int irq, void *data)
>>   	struct panfrost_device *pfdev = data;
>>   
>>   	panfrost_job_handle_irqs(pfdev);
>> -	job_write(pfdev, JOB_INT_MASK,
>> -		  GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |
>> -		  GENMASK(NUM_JOB_SLOTS - 1, 0));
>> +
>> +	/* Enable interrupts only if we're not about to get suspended */
>> +	if (!test_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended))
>> +		job_write(pfdev, JOB_INT_MASK,
>> +			  GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |
>> +			  GENMASK(NUM_JOB_SLOTS - 1, 0));
>> +
> 
> Missing if (test_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended)) in
> panfrost_job_irq_handler(), to make sure you don't access the registers
> if the GPU is suspended.
> 

Ok.

Cheers,
Angelo
