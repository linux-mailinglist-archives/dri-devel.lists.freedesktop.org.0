Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 432FB800AF8
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 13:34:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7644F10E10E;
	Fri,  1 Dec 2023 12:34:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 578F010E0FC
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 12:34:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71F85143D;
 Fri,  1 Dec 2023 04:35:29 -0800 (PST)
Received: from [10.1.28.20] (e122027.cambridge.arm.com [10.1.28.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E22573F5A1;
 Fri,  1 Dec 2023 04:34:40 -0800 (PST)
Message-ID: <5cad3d21-5485-49aa-ae97-589dcb831925@arm.com>
Date: Fri, 1 Dec 2023 12:34:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/panfrost: Synchronize and disable interrupts
 before powering off
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20231201104027.35273-1-angelogioacchino.delregno@collabora.com>
 <20231201104027.35273-4-angelogioacchino.delregno@collabora.com>
 <20231201121437.7d5cdefb@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20231201121437.7d5cdefb@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/12/2023 11:14, Boris Brezillon wrote:
> On Fri,  1 Dec 2023 11:40:27 +0100
> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> wrote:
> 
>> To make sure that we don't unintentionally perform any unclocked and/or
>> unpowered R/W operation on GPU registers, before turning off clocks and
>> regulators we must make sure that no GPU, JOB or MMU ISR execution is
>> pending: doing that required to add a mechanism to synchronize the
> 
>                       ^ requires the addition of a mechanism...
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
>             to add an `is_suspended` bitmap which is used...
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

<snip>

>>  static void panfrost_job_handle_err(struct panfrost_device *pfdev,
>>  				    struct panfrost_job *job,
>>  				    unsigned int js)
>> @@ -792,9 +802,13 @@ static irqreturn_t panfrost_job_irq_handler_thread(int irq, void *data)
>>  	struct panfrost_device *pfdev = data;
>>  
>>  	panfrost_job_handle_irqs(pfdev);
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

I think generally these IRQ handler functions should simply check the
is_suspended flag and early out if the flag is set. It's not the
re-enabling of the interrupts specifically that we want to gate - it's
any access to the hardware as in the shared-IRQ case the GPU might
already have been powered down/unclocked.

Steve

