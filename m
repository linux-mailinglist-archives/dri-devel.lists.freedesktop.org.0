Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C027FBF00
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 17:10:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C3010E15B;
	Tue, 28 Nov 2023 16:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92FEF10E15B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 16:10:22 +0000 (UTC)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0B60F66072E7;
 Tue, 28 Nov 2023 16:10:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701187821;
 bh=kMG1I4O6N/0qm/ZYve1cd6mlTUjtXKzKNM/ZG43+6KU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YemsDFnnTQUsBpAb9E2CaJU7elx0nqKjHIYUM51KCCqPgKzNBsWYeeed0CE8ygw8M
 60n/aAXkCdZe9q6+D4/n03AEMQiDs0B+54FOpdWn3zRzr523+X/y4AfTUne+x7VhZY
 Y22xIe89OS0xHE7pa/tU6lg7QGSnAyo5Q634QLH9/Whx3h2KzQDe8Upnk4y3qiuDWv
 NGUpdrMqZ7wV//dcRX6LIpt0TfFWwBk1PS1A9E07s7wTPr8hWzArBisN8CeyHklX5P
 TgyrF5+7GI2N6H9n8hJOkHBDUKFyNndXZ27CD8Wxcz6sJF/+nznhY7S/VgfPHBPh6U
 +UQE+jaqh6bHA==
Message-ID: <5f45485a-fee6-4ab9-9894-6da4491a985c@collabora.com>
Date: Tue, 28 Nov 2023 17:10:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/panfrost: Synchronize and disable interrupts
 before powering off
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20231128124510.391007-1-angelogioacchino.delregno@collabora.com>
 <20231128124510.391007-4-angelogioacchino.delregno@collabora.com>
 <20231128145712.3f4d3f74@collabora.com>
 <f5208c45-54c7-4030-9985-cb7c8f1d6466@collabora.com>
 <20231128165357.2c9bfdf1@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231128165357.2c9bfdf1@collabora.com>
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

Il 28/11/23 16:53, Boris Brezillon ha scritto:
> On Tue, 28 Nov 2023 16:10:45 +0100
> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> wrote:
> 
>>>>    static void panfrost_job_handle_err(struct panfrost_device *pfdev,
>>>>    				    struct panfrost_job *job,
>>>>    				    unsigned int js)
>>>> @@ -792,9 +800,13 @@ static irqreturn_t panfrost_job_irq_handler_thread(int irq, void *data)
>>>>    	struct panfrost_device *pfdev = data;
>>>>    
>>>>    	panfrost_job_handle_irqs(pfdev);
>>>> -	job_write(pfdev, JOB_INT_MASK,
>>>> -		  GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |
>>>> -		  GENMASK(NUM_JOB_SLOTS - 1, 0));
>>>> +
>>>> +	/* Enable interrupts only if we're not about to get suspended */
>>>> +	if (!test_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspending))
>>>
>>> The irq-line is requested with IRQF_SHARED, meaning the line might be
>>> shared between all three GPU IRQs, but also with other devices. I think
>>> if we want to be totally safe, we need to also check this is_suspending
>>> field in the hard irq handlers before accessing the xxx_INT_yyy
>>> registers.
>>>    
>>
>> This would mean that we would have to force canceling jobs in the suspend
>> handler, but if the IRQ never fired, would we still be able to find the
>> right bits flipped in JOB_INT_RAWSTAT?
> 
> There should be no jobs left if we enter suspend. If there is, that's a
> bug we should fix, but I'm digressing.
> 
>>
>>   From what I understand, are you suggesting to call, in job_suspend_irq()
>> something like
>>
>> void panfrost_job_suspend_irq(struct panfrost_device *pfdev)
>> {
>>           u32 status;
>>
>> 	set_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspending);
>>
>> 	job_write(pfdev, JOB_INT_MASK, 0);
>> 	synchronize_irq(pfdev->js->irq);
>>
>> 	status = job_read(pfdev, JOB_INT_STAT);
> 
> I guess you meant _RAWSTAT. _STAT should always be zero after we've
> written 0 to _INT_MASK.
> 

Whoops! Yes, as I wrote up there, I meant _RAWSTAT, sorry! :-)

>> 	if (status)
>> 		panfrost_job_irq_handler_thread(pfdev->js->irq, (void*)pfdev);
> 
> Nope, we don't need to read the STAT reg and forcibly call the threaded
> handler if it's != 0. The synchronize_irq() call should do exactly that
> (make sure all pending interrupts are processed before returning), and
> our previous job_write(pfdev, JOB_INT_MASK, 0) guarantees that no new
> interrupts will kick in after that point.
> 

Unless we synchronize_irq() *before* masking all interrupts (which would be
wrong, as some interrupt could still fire after execution of the ISR), we get
*either of* two scenarios:

  - COMP_BIT_JOB is not set, softirq thread unmasks some interrupts by
    writing to JOB_INT_MASK; or
  - COMP_BIT_JOB is set, hardirq handler returns IRQ_NONE, the threaded
    interrupt handler doesn't get executed, jobs are not canceled.

So if we don't forbicly call the threaded handler if RAWSTAT != 0 in there,
and if the extra check is present in the hardirq handler, and if the hardirq
handler wasn't executed already before our synchronize_irq() call (so: if the
hardirq execution has to be done to synchronize irqs), we are not guaranteeing
that jobs cancellation/dequeuing/removal/whatever-handling is done before
entering suspend.

That, unless the suggestion was to call panfrost_job_handle_irqs() instead of
the handler thread like that (because reading it back, it makes sense to do so).

Cheers!

>> }
>>
>> and then while still retaining the check in the IRQ thread handler, also
>> check it in the hardirq handler like
>>
>> static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
>> {
>> 	struct panfrost_device *pfdev = data;
>> 	u32 status;
>>
>> 	if (!test_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspending))
>> 		return IRQ_NONE;
> 
> Yes, that's the extra check I was talking about, and that's also the
> very reason I'm suggesting to call this field suspended_irqs instead of
> is_suspending. Ultimately, each bit in this bitmap encodes the status
> of a specific IRQ, not the transition from active-to-suspended,
> otherwise we'd be clearing the bit at the end of
> panfrost_job_suspend_irq(), right after the synchronize_irq(). But if
> we were doing that, our hard IRQ handler could be called because other
> devices raised an interrupt on the very same IRQ line while we are
> suspended, and we'd be doing an invalid GPU reg read while the
> clks/power-domains are off.
> 
>>
>> 	status = job_read(pfdev, JOB_INT_STAT);
>> 	if (!status)
>> 	        return IRQ_NONE;
>>
>> 	job_write(pfdev, JOB_INT_MASK, 0);
>> 	return IRQ_WAKE_THREAD;
>> }
>>
>> (rinse and repeat for panfrost_mmu)
>>
>> ..or am I misunderstanding you?
>>
>> Cheers,
>> Angelo
>>
>>
> 

