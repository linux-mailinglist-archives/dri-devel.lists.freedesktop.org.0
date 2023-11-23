Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B28C7F5D8C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 12:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F18D10E71C;
	Thu, 23 Nov 2023 11:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A42B10E71C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 11:15:06 +0000 (UTC)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 15DCF6607395;
 Thu, 23 Nov 2023 11:15:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700738104;
 bh=NLUDJVvSCF2+avO17YUlDheenMM4po6rfTadOu+6hys=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ANSmp8II61zEIPwX4axXqi3lBbiOVIAe0t6nXA+OdY5iJjH1QM/9L78QP+f+KdkQ7
 6E5Ac1M/pvnzQtFUQ0hQ+e1vB+LJ4w2ZiJYlvyDv7Hqo2su5Ci1Ig13gggzEkEbG6b
 qmZeWOxx5SSydvXJhp2diaf4kthRzB1r96M3/u6w9XMw+3lPtTJPkeoyPxuJ3CdAeI
 VLMuP2EwrWxgiuagjDbjrqXVQRc1Me+tff3RprnMuBGpx+bTUT4mqqlw5G+l7qfgZ2
 Fn7W5tGctASs0Zg0RxpwsN9pHYCW0TZprnsZdc5nD5riLptA6homgxrAs5rydd5NaC
 RW/QtYm1EFn5g==
Message-ID: <1740797f-f3ae-4868-924a-08d6d731e506@collabora.com>
Date: Thu, 23 Nov 2023 12:15:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: Ignore core_mask for poweroff and sync
 interrupts
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20231123095320.41433-1-angelogioacchino.delregno@collabora.com>
 <20231123113530.46191ded@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231123113530.46191ded@collabora.com>
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
 tzimmermann@suse.de, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/11/23 11:35, Boris Brezillon ha scritto:
> On Thu, 23 Nov 2023 10:53:20 +0100
> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> wrote:
> 
>> Some SoCs may be equipped with a GPU containing two core groups
>> and this is exactly the case of Samsung's Exynos 5422 featuring
>> an ARM Mali-T628 MP6 GPU: the support for this GPU in Panfrost
>> is partial, as this driver currently supports using only one
>> core group and that's reflected on all parts of it, including
>> the power on (and power off, previously to this patch) function.
>>
>> The issue with this is that even though executing the soft reset
>> operation should power off all cores unconditionally, on at least
>> one platform we're seeing a crash that seems to be happening due
>> to an interrupt firing which may be because we are calling power
>> transition only on the first core group, leaving the second one
>> unchanged, or because ISR execution was pending before entering
>> the panfrost_gpu_power_off() function and executed after powering
>> off the GPU cores, or all of the above.
>>
>> Finally, solve this by changing the power off flow to
>>   1. Mask and clear all interrupts: we don't need nor want any, as
>>      we are polling PWRTRANS anyway;
>>   2. Call synchronize_irq() after that to make sure that any pending
>>      ISR is executed before powering off the GPU Shaders/Tilers/L2
>>      hence avoiding unpowered registers R/W; and
>>   3. Ignore the core_mask and ask the GPU to poweroff both core groups
> 
> Could we split that in two patches? 1+2 in one patch, and 3 in another.
> These are two orthogonal fixes IMO.
> 

My initial idea was exactly that, but I opted for one patch doing 'em all
because a "full fix" comprises all of 1+2+3: the third one without the
first two and vice-versa may not fully resolve the issue that was seen
on the HC1 board.

So, while I agree that it'd be slightly more readable as a diff if those
were two different commits I do have reasons against splitting.....

>>
>> Of course it was also necessary to add a `irq` variable to `struct
>> panfrost_device` as we need to get that in panfrost_gpu_power_off()
>> for calling synchronize_irq() on it.
>>
>> Fixes: 123b431f8a5c ("drm/panfrost: Really power off GPU cores in panfrost_gpu_power_off()")
>> [Regression detected on Odroid HC1, Exynos 5422, Mali-T628 MP6]
>> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/panfrost/panfrost_device.h |  1 +
>>   drivers/gpu/drm/panfrost/panfrost_gpu.c    | 26 +++++++++++++++-------
>>   2 files changed, 19 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
>> index 0fc558db6bfd..b4feaa99e34f 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
>> @@ -94,6 +94,7 @@ struct panfrost_device {
>>   	struct device *dev;
>>   	struct drm_device *ddev;
>>   	struct platform_device *pdev;
>> +	int irq;
> 
> I know it's the only irq being stored at the panfrost_device level, but
> I think it's clearer if we explicitly prefix it with gpu_.
> 

Makes sense, agreed.

>>   
>>   	void __iomem *iomem;
>>   	struct clk *clock;
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
>> index 1cc55fb9c45b..30b395125155 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
>> @@ -425,11 +425,21 @@ void panfrost_gpu_power_on(struct panfrost_device *pfdev)
>>   
>>   void panfrost_gpu_power_off(struct panfrost_device *pfdev)
>>   {
>> -	u64 core_mask = panfrost_get_core_mask(pfdev);
>>   	int ret;
>>   	u32 val;
>>   
>> -	gpu_write(pfdev, SHADER_PWROFF_LO, pfdev->features.shader_present & core_mask);
>> +	/* We are polling PWRTRANS and we don't need nor want interrupts */
> 
> I kinda agree with that, but that's not exactly why we're
> masking+syncing IRQs here. If that was the only reason, the right fix
> would be to modify GPU_IRQ_MASK_ALL so it doesn't include the PWRTRANS
> bits.
> 
> This fix should cover more than just the power transition IRQ use case:
> we want all IRQs to be disabled before the device is suspended.
> 

Eh I should reword that, effectively, because what I wrote as comments make
sense (as in, the logic of it completes) only if you read both of them "as one".

I'll do that in the new suspend irq helper :-)

>> +	gpu_write(pfdev, GPU_INT_MASK, 0);
>> +	gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_MASK_ALL);
>> +
>> +	/*
>> +	 * Make sure that we don't have pending ISRs, otherwise we'll be
>> +	 * reading and/or writing registers while the GPU is powered off
>> +	 */
>> +	synchronize_irq(pfdev->irq);
> 
> Could we move that to a panfrost_gpu_suspend_irq() helper? I'm also not
> sure making it part of panfrost_gpu_power_off() is a good idea. I'd
> rather have this panfrost_gpu_suspend_irq() helper called from
> panfrost_device_[runtime_]suspend(), along with
> panfrost_{mmu,job}_suspend_irq().
> 

Okay I will move that to a helper, but I still want to clarify:
  - For JOB, we're checking if panfrost_job_is_idle() before trying
    to runtime_suspend() (hence before trying to power off cores),
    so implicitly no interrupt can fire I guess? Though there could
    still be a pending ISR there too.... mmh. Brain ticking :-)
  - For MMU, we're not checking anything, but I guess that if there
    is no job, the mmu can't be doing anything at all?
    ...but then you also gave me the doubt about that one as well.

What I think that would be sensible to do is to get this commit as
a "clear" fix for the "Really power off" one, then have one or more
additional commit(s) without any fixes tag to improve the IRQ suspend
with the new mmu/job irq suspend helpers.

Of course *this* commit would introduce the panfrost_gpu_suspend_irq()
helper directly, instead of moving the logic to a helper in a later one.

Any reason against? :-)

>> +
>> +	/* Now it's safe to request poweroff for Shaders, Tilers and L2 */
> 
> It was safe before too, it's just that we probably don't want to be

In theory yes, in practice the Odroid HC1 board crashed :-P

P.S.: Joking! I understand what you're saying :-)

> interrupted, if all we do is ignore the interrupts we receive, hence
> the suggestion to not use GPU_IRQ_MASK_ALL, and only enable the
> IRQs we care about instead.
> 
>> +	gpu_write(pfdev, SHADER_PWROFF_LO, pfdev->features.shader_present);
>>   	ret = readl_relaxed_poll_timeout(pfdev->iomem + SHADER_PWRTRANS_LO,
>>   					 val, !val, 1, 1000);
>>   	if (ret)
>> @@ -441,7 +451,7 @@ void panfrost_gpu_power_off(struct panfrost_device *pfdev)
>>   	if (ret)
>>   		dev_err(pfdev->dev, "tiler power transition timeout");
>>   
>> -	gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present & core_mask);
>> +	gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present);
> 
> I really think we should have a helper doing the 'write(PWROFF_{LO,HI} +
> poll(PWRTRANS_{LO,HI})' sequence, similar to what's done here [1][2],
> such that, once we got it right for one block, we have it working for
> all of them. And if there's a fix to apply, it automatically applies
> to all blocks without having to fix the same bug in each copy.
> 

...technically yes, but practically this driver doesn't currently support any
GPU that even fills the _LO registers.

I guess that we can do that later?

That's just to (paranoidly) avoid any risk to introduce other regressions in
this merge window, since we're fixing one that shouldn't have happened in the
first place...

> Note that these panthor_gpu_block_power_{on,off}() helpers also handle
> the case where power transitions are already in progress when you ask a
> new power transition, which I don't think is checked in
> panfrost_gpu_power_{off,on}().
> 

I admit I didn't analyze the panthor driver - but here, the only power transitions
that may happen are either because of panfrost_gpu_power_on(), or because of
panfrost_gpu_power_off(), and both are polling and blocking... so from what I
understand, there's no possibility to have "another" power transition happening
while calling poweron, or poweroff.

That would change if we start to selectively turn on and off a number of shaders
and/or a number of tilers (not all of them) depending on the workload, but we're
not doing that...

...yet?

:-)

>>   	ret = readl_poll_timeout(pfdev->iomem + L2_PWRTRANS_LO,
>>   					 val, !val, 0, 1000);
> 
> Not introduced by the patch, but I noticed args passed on the second
> line are no longer aligned on the open parens.
> 

Yeah, fixing that for v2 :-)

Cheers,
Angelo


