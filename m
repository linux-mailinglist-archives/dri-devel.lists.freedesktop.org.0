Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DE0803178
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 12:26:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8D910E199;
	Mon,  4 Dec 2023 11:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDC010E1A5
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 11:25:52 +0000 (UTC)
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4C96C6602030;
 Mon,  4 Dec 2023 11:25:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701689148;
 bh=sa5x38sxQWoXtYrCfbbmmhW4qr7xoOhx05ujJTWFqGw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RmgG8mnDz2Rq1qxxgbIayE/lY8rfQ5q7QGzLsGuRjdAn5dRdkkF5zvOReCIZD4ag7
 lzFwasSoBYztBMs0dKj4cOWO3c8NRgegBg8VkSjp25wXHyCEM/yYWPa9QrB5e0t87J
 hXDpKlo3ePWi6X4fWiiZp3RChfMB9lZPTuhfuZ8guJqOwkF+VMgB2LyFyngkCzRrmD
 EU2VNnJ/0Kfr/hOnSBfqS7QUsGeEW5YSDsVDs3VvF/vC3Oj0r7DwV/X5+TeyyqDAip
 VZ50ablH6GTKTR4GJozwaS4UBbzvACpf2pTNZOqE+VPIAyN95w12fJ5L4MFqi4BJt+
 qWxuYuEG5EptA==
Message-ID: <4e30fde8-f54c-4e07-b52d-fe90e5d44332@collabora.com>
Date: Mon, 4 Dec 2023 12:25:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/panfrost: Synchronize and disable interrupts
 before powering off
Content-Language: en-US
To: Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20231201104027.35273-1-angelogioacchino.delregno@collabora.com>
 <20231201104027.35273-4-angelogioacchino.delregno@collabora.com>
 <20231201121437.7d5cdefb@collabora.com>
 <5cad3d21-5485-49aa-ae97-589dcb831925@arm.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <5cad3d21-5485-49aa-ae97-589dcb831925@arm.com>
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
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 01/12/23 13:34, Steven Price ha scritto:
> On 01/12/2023 11:14, Boris Brezillon wrote:
>> On Fri,  1 Dec 2023 11:40:27 +0100
>> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> wrote:
>>
>>> To make sure that we don't unintentionally perform any unclocked and/or
>>> unpowered R/W operation on GPU registers, before turning off clocks and
>>> regulators we must make sure that no GPU, JOB or MMU ISR execution is
>>> pending: doing that required to add a mechanism to synchronize the
>>
>>                        ^ requires the addition of a mechanism...
>>
>>> interrupts on suspend.
>>>
>>> Add functions panfrost_{gpu,job,mmu}_suspend_irq() which will perform
>>> interrupts masking and ISR execution synchronization, and then call
>>> those in the panfrost_device_runtime_suspend() handler in the exact
>>> sequence of job (may require mmu!) -> mmu -> gpu.
>>>
>>> As a side note, JOB and MMU suspend_irq functions needed some special
>>> treatment: as their interrupt handlers will unmask interrupts, it was
>>> necessary to add a bitmap for `is_suspended` which is used to address
>>
>>              to add an `is_suspended` bitmap which is used...
>>
>>> the possible corner case of unintentional IRQ unmasking because of ISR
>>> execution after a call to synchronize_irq().
>>
>> Also fixes the case where the interrupt handler is called when the
>> device is suspended because the IRQ line is shared with another device.
>> No need to update the commit message for that though.
>>
>>>
>>> At resume, clear each is_suspended bit in the reset path of JOB/MMU
>>> to allow unmasking the interrupts.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> ---
> 
> <snip>
> 
>>>   static void panfrost_job_handle_err(struct panfrost_device *pfdev,
>>>   				    struct panfrost_job *job,
>>>   				    unsigned int js)
>>> @@ -792,9 +802,13 @@ static irqreturn_t panfrost_job_irq_handler_thread(int irq, void *data)
>>>   	struct panfrost_device *pfdev = data;
>>>   
>>>   	panfrost_job_handle_irqs(pfdev);
>>> -	job_write(pfdev, JOB_INT_MASK,
>>> -		  GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |
>>> -		  GENMASK(NUM_JOB_SLOTS - 1, 0));
>>> +
>>> +	/* Enable interrupts only if we're not about to get suspended */
>>> +	if (!test_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended))
>>> +		job_write(pfdev, JOB_INT_MASK,
>>> +			  GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |
>>> +			  GENMASK(NUM_JOB_SLOTS - 1, 0));
>>> +
>>
>> Missing if (test_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended)) in
>> panfrost_job_irq_handler(), to make sure you don't access the registers
>> if the GPU is suspended.
> 
> I think generally these IRQ handler functions should simply check the
> is_suspended flag and early out if the flag is set. It's not the
> re-enabling of the interrupts specifically that we want to gate - it's
> any access to the hardware as in the shared-IRQ case the GPU might
> already have been powered down/unclocked.
> 

Yes, in the thread handler we're still powered, because we are synchronizing
irqs - adding the test_bit in the hardirq handler will prevent scheduling the
irq_handler_thread.

What the test_bit() here does is to allow us to handle the last interrupt(s)
(synchronize_irqs() in the suspend function) before cutting off power, without
unwillingly re-enabling the job (or mmu in panfrost_mmu.c) interrupts.

Cheers,
Angelo
