Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 116A2D13036
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 15:09:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240FF10E3DD;
	Mon, 12 Jan 2026 14:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3493310E3DD
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 14:09:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6003497;
 Mon, 12 Jan 2026 06:09:32 -0800 (PST)
Received: from [10.57.11.182] (unknown [10.57.11.182])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E9893F59E;
 Mon, 12 Jan 2026 06:09:37 -0800 (PST)
Message-ID: <f0dd61c4-f1d8-4c36-a517-91ed5f9e2db3@arm.com>
Date: Mon, 12 Jan 2026 14:09:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] drm/panthor: Rework panthor_irq::suspended into
 panthor_irq::state
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chia-I Wu <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20260108-panthor-tracepoints-v7-0-afeae181f74a@collabora.com>
 <20260108-panthor-tracepoints-v7-2-afeae181f74a@collabora.com>
 <67b943c4-ec28-4d14-bb34-34efabeb5360@arm.com> <5069507.31r3eYUQgx@workhorse>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <5069507.31r3eYUQgx@workhorse>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/01/2026 13:39, Nicolas Frattaroli wrote:
> On Friday, 9 January 2026 17:05:05 Central European Standard Time Steven Price wrote:
>> On 08/01/2026 14:19, Nicolas Frattaroli wrote:
>>> To deal with the threaded interrupt handler and a suspend action
>>> overlapping, the boolean panthor_irq::suspended is not sufficient.
>>>
>>> Rework it into taking several different values depending on the current
>>> state, and check it and set it within the IRQ helper functions.
>>>
>>> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>>> ---
>>>  drivers/gpu/drm/panthor/panthor_device.h | 40 +++++++++++++++++++++++++-------
>>>  1 file changed, 32 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
>>> index cf76a8abca76..a8c21a7eea05 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_device.h
>>> +++ b/drivers/gpu/drm/panthor/panthor_device.h
>>> @@ -61,6 +61,17 @@ enum panthor_device_pm_state {
>>>  	PANTHOR_DEVICE_PM_STATE_SUSPENDING,
>>>  };
>>>  
>>> +enum panthor_irq_state {
>>> +	/** @PANTHOR_IRQ_STATE_ACTIVE: IRQ is active and ready to process events. */
>>> +	PANTHOR_IRQ_STATE_ACTIVE = 0,
>>> +	/** @PANTHOR_IRQ_STATE_PROCESSING: IRQ is currently processing events. */
>>> +	PANTHOR_IRQ_STATE_PROCESSING,
>>> +	/** @PANTHOR_IRQ_STATE_SUSPENDED: IRQ is suspended. */
>>> +	PANTHOR_IRQ_STATE_SUSPENDED,
>>> +	/** @PANTHOR_IRQ_STATE_SUSPENDING: IRQ is being suspended. */
>>> +	PANTHOR_IRQ_STATE_SUSPENDING,
>>> +};
>>> +
>>>  /**
>>>   * struct panthor_irq - IRQ data
>>>   *
>>> @@ -76,8 +87,8 @@ struct panthor_irq {
>>>  	/** @mask: Values to write to xxx_INT_MASK if active. */
>>>  	u32 mask;
>>>  
>>> -	/** @suspended: Set to true when the IRQ is suspended. */
>>> -	atomic_t suspended;
>>> +	/** @state: one of &enum panthor_irq_state reflecting the current state. */
>>> +	atomic_t state;
>>>  
>>>  	/** @mask_lock: protects modifications to _INT_MASK and @mask */
>>>  	spinlock_t mask_lock;
>>> @@ -415,7 +426,7 @@ static irqreturn_t panthor_ ## __name ## _irq_raw_handler(int irq, void *data)
>>>  												\
>>>  	guard(spinlock_irqsave)(&pirq->mask_lock);						\
>>>  												\
>>> -	if (atomic_read(&pirq->suspended))							\
>>> +	if (atomic_read(&pirq->state) == PANTHOR_IRQ_STATE_SUSPENDED)				\
>>
>> Do we want to also catch the STATE_SUSPENDING case here? AFAICT in
>> SUSPENDING we should be confident that _INT_MASK==0 so this shouldn't a
>> problem (_INT_STAT should read as 0 below). But we don't want interrupts
>> during STATE_SUSPENDING so we might as well handle it.
> 
> Depends on what we want to happen here, I think. If the suspend handler
> writing 0 to _INT_MASK does not also happen to clear _INT_STAT, then as

_STAT is defined by the hardware to be the bitwise AND of _RAWSTAT and
_MASK. So we shouldn't see _INT_STAT being anything other than 0.

> far as I can see, we may enter _irq_raw_handler, block for the lock as
> suspend drops it, and then enter the function with STATE_SUSPENDING in
> a context where we'd probably want to process the remaining interrupts
> (i.e. suspend is at synchronise_irq() or about to be there, and we're
> handling the last IRQ that got raised before mask was written to 0).
> 
> Let me know if my understanding here is correct, because I think in such
> a case, it's reasonable to process that last IRQ instead of discarding it,
> unless that's something frowned upon that I'm not aware of.

My understanding is that once we have set the status to _SUSPENDING we
don't expect any further interrupts to be fired, but there may be
outstanding interrupts we're still handling. I believe this has to be
the case because AFAIK synchronize_irq() only waits for existing IRQs to
be handled - if another IRQ is triggered during the synchronize_irq()
call then it won't (necessarily) be waited for.

I don't believe the code you have is actually wrong (because the
hardware will mask out any interrupts so _STAT will be zero), but I
personally thought it would be clearer to explicitly handle the
_SUSPENDING state.

Thanks,
Steve

>>
>> Thanks,
>> Steve
>>
>>>  		return IRQ_NONE;								\
>>>  	if (!gpu_read(ptdev, __reg_prefix ## _INT_STAT))					\
>>>  		return IRQ_NONE;								\
>>> @@ -428,11 +439,14 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
>>>  {												\
>>>  	struct panthor_irq *pirq = data;							\
>>>  	struct panthor_device *ptdev = pirq->ptdev;						\
>>> +	enum panthor_irq_state state;								\
>>>  	irqreturn_t ret = IRQ_NONE;								\
>>>  	u32 mask;										\
>>>  												\
>>>  	scoped_guard(spinlock_irqsave, &pirq->mask_lock) {					\
>>>  		mask = pirq->mask;								\
>>> +		atomic_cmpxchg(&pirq->state, PANTHOR_IRQ_STATE_ACTIVE,				\
>>> +			       PANTHOR_IRQ_STATE_PROCESSING);					\
>>>  	}											\
>>>  												\
>>>  	while (true) {										\
>>> @@ -446,11 +460,14 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
>>>  	}											\
>>>  												\
>>>  	scoped_guard(spinlock_irqsave, &pirq->mask_lock) {					\
>>> -		if (!atomic_read(&pirq->suspended)) {						\
>>> +		state = atomic_read(&pirq->state);						\
>>> +		if (state != PANTHOR_IRQ_STATE_SUSPENDED &&					\
>>> +		    state != PANTHOR_IRQ_STATE_SUSPENDING) {					\
>>>  			/* Only restore the bits that were used and are still enabled */	\
>>>  			gpu_write(ptdev, __reg_prefix ## _INT_MASK,				\
>>>  				  gpu_read(ptdev, __reg_prefix ## _INT_MASK) |			\
>>>  				  (mask & pirq->mask));						\
>>> +			atomic_set(&pirq->state, PANTHOR_IRQ_STATE_ACTIVE);			\
>>>  		}										\
>>>  	}											\
>>>  												\
>>> @@ -461,16 +478,17 @@ static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)
>>>  {												\
>>>  	scoped_guard(spinlock_irqsave, &pirq->mask_lock) {					\
>>>  		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);				\
>>> +		atomic_set(&pirq->state, PANTHOR_IRQ_STATE_SUSPENDING);				\
>>>  	}											\
>>>  	synchronize_irq(pirq->irq);								\
>>> -	atomic_set(&pirq->suspended, true);							\
>>> +	atomic_set(&pirq->state, PANTHOR_IRQ_STATE_SUSPENDED);					\
>>>  }												\
>>>  												\
>>>  static inline void panthor_ ## __name ## _irq_resume(struct panthor_irq *pirq)			\
>>>  {												\
>>>  	guard(spinlock_irqsave)(&pirq->mask_lock);						\
>>>  												\
>>> -	atomic_set(&pirq->suspended, false);							\
>>> +	atomic_set(&pirq->state, PANTHOR_IRQ_STATE_ACTIVE);					\
>>>  	gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, pirq->mask);				\
>>>  	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, pirq->mask);				\
>>>  }												\
>>> @@ -494,19 +512,25 @@ static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
>>>  												\
>>>  static inline void panthor_ ## __name ## _irq_enable_events(struct panthor_irq *pirq, u32 mask)	\
>>>  {												\
>>> +	enum panthor_irq_state state;								\
>>> +												\
>>>  	guard(spinlock_irqsave)(&pirq->mask_lock);						\
>>>  												\
>>>  	pirq->mask |= mask;									\
>>> -	if (!atomic_read(&pirq->suspended))							\
>>> +	state = atomic_read(&pirq->state);							\
>>> +	if (state != PANTHOR_IRQ_STATE_SUSPENDED && state != PANTHOR_IRQ_STATE_SUSPENDING)	\
>>>  		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, pirq->mask);			\
>>>  }												\
>>>  												\
>>>  static inline void panthor_ ## __name ## _irq_disable_events(struct panthor_irq *pirq, u32 mask)\
>>>  {												\
>>> +	enum panthor_irq_state state;								\
>>> +												\
>>>  	guard(spinlock_irqsave)(&pirq->mask_lock);						\
>>>  												\
>>>  	pirq->mask &= ~mask;									\
>>> -	if (!atomic_read(&pirq->suspended))							\
>>> +	state = atomic_read(&pirq->state);							\
>>> +	if (state != PANTHOR_IRQ_STATE_SUSPENDED && state != PANTHOR_IRQ_STATE_SUSPENDING)	\
>>>  		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, pirq->mask);			\
>>>  }
>>>  
>>>
>>
>>
> 
> 
> 
> 

