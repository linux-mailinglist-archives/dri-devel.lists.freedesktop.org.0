Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B79CD20109
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 17:07:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E390C10E5AA;
	Wed, 14 Jan 2026 16:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3A1AE10E585
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 16:07:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEEE11515;
 Wed, 14 Jan 2026 08:07:00 -0800 (PST)
Received: from [10.57.10.71] (unknown [10.57.10.71])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0DDC3F632;
 Wed, 14 Jan 2026 08:07:02 -0800 (PST)
Message-ID: <09151ff9-ff2a-4d3d-9ee1-b6f30b729fe6@arm.com>
Date: Wed, 14 Jan 2026 16:07:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/4] drm/panthor: Rework panthor_irq::suspended into
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
References: <20260112-panthor-tracepoints-v8-0-63efcb421d22@collabora.com>
 <20260112-panthor-tracepoints-v8-1-63efcb421d22@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260112-panthor-tracepoints-v8-1-63efcb421d22@collabora.com>
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

On 12/01/2026 14:37, Nicolas Frattaroli wrote:
> To deal with the threaded interrupt handler and a suspend action
> overlapping, the boolean panthor_irq::suspended is not sufficient.
> 
> Rework it into taking several different values depending on the current
> state, and check it and set it within the IRQ helper functions.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

There are some unwanted changes in this patch. We want to keep it simple
so it does exactly what the changelog says. See below.

> ---
>  drivers/gpu/drm/panthor/panthor_device.h | 40 +++++++++++++++++++++++++-------
>  1 file changed, 31 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index f35e52b9546a..424f6cd1a814 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -61,6 +61,17 @@ enum panthor_device_pm_state {
>  	PANTHOR_DEVICE_PM_STATE_SUSPENDING,
>  };
>  
> +enum panthor_irq_state {
> +	/** @PANTHOR_IRQ_STATE_ACTIVE: IRQ is active and ready to process events. */
> +	PANTHOR_IRQ_STATE_ACTIVE = 0,
> +	/** @PANTHOR_IRQ_STATE_PROCESSING: IRQ is currently processing events. */
> +	PANTHOR_IRQ_STATE_PROCESSING,
> +	/** @PANTHOR_IRQ_STATE_SUSPENDED: IRQ is suspended. */
> +	PANTHOR_IRQ_STATE_SUSPENDED,
> +	/** @PANTHOR_IRQ_STATE_SUSPENDING: IRQ is being suspended. */
> +	PANTHOR_IRQ_STATE_SUSPENDING,
> +};
> +
>  /**
>   * struct panthor_irq - IRQ data
>   *
> @@ -76,8 +87,8 @@ struct panthor_irq {
>  	/** @mask: Current mask being applied to xxx_INT_MASK. */
>  	u32 mask;
>  
> -	/** @suspended: Set to true when the IRQ is suspended. */
> -	atomic_t suspended;
> +	/** @state: one of &enum panthor_irq_state reflecting the current state. */
> +	atomic_t state;
>  };
>  
>  /**
> @@ -409,8 +420,10 @@ static irqreturn_t panthor_ ## __name ## _irq_raw_handler(int irq, void *data)
>  {												\
>  	struct panthor_irq *pirq = data;							\
>  	struct panthor_device *ptdev = pirq->ptdev;						\
> +	enum panthor_irq_state state;								\
>  												\
> -	if (atomic_read(&pirq->suspended))							\
> +	state = atomic_read(&pirq->state);							\
> +	if (state == PANTHOR_IRQ_STATE_SUSPENDED || state == PANTHOR_IRQ_STATE_SUSPENDING)	\
>  		return IRQ_NONE;								\
>  	if (!gpu_read(ptdev, __reg_prefix ## _INT_STAT))					\
>  		return IRQ_NONE;								\
> @@ -423,8 +436,11 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
>  {												\
>  	struct panthor_irq *pirq = data;							\
>  	struct panthor_device *ptdev = pirq->ptdev;						\
> +	enum panthor_irq_state state;								\
>  	irqreturn_t ret = IRQ_NONE;								\
>  												\
> +	atomic_cmpxchg(&pirq->state, PANTHOR_IRQ_STATE_ACTIVE, PANTHOR_IRQ_STATE_PROCESSING);	\
> +												\
>  	while (true) {										\
>  		u32 status = gpu_read(ptdev, __reg_prefix ## _INT_RAWSTAT) & pirq->mask;	\
>  												\
> @@ -435,8 +451,13 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
>  		ret = IRQ_HANDLED;								\
>  	}											\
>  												\
> -	if (!atomic_read(&pirq->suspended))							\
> -		gpu_write(ptdev, __reg_prefix ## _INT_MASK, pirq->mask);			\
> +	state = atomic_read(&pirq->state);							\
> +	if (state != PANTHOR_IRQ_STATE_SUSPENDED && state != PANTHOR_IRQ_STATE_SUSPENDING) {	\
> +		/* Only restore the bits that were used and are still enabled */		\
> +		gpu_write(ptdev, __reg_prefix ## _INT_MASK,					\
> +			  gpu_read(ptdev, __reg_prefix ## _INT_MASK) | (mask & pirq->mask));	\

This change to read the _INT_MASK and mask pirq->mask with 'mask'
shouldn't be part of this patch.

> +		atomic_set(&pirq->state, PANTHOR_IRQ_STATE_ACTIVE);				\
> +	}											\
>  												\
>  	return ret;										\
>  }												\
> @@ -445,16 +466,17 @@ static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)
>  {												\
>  	pirq->mask = 0;										\
>  	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);					\
> +	atomic_set(&pirq->state, PANTHOR_IRQ_STATE_SUSPENDING);					\
>  	synchronize_irq(pirq->irq);								\
> -	atomic_set(&pirq->suspended, true);							\
> +	atomic_set(&pirq->state, PANTHOR_IRQ_STATE_SUSPENDED);					\
>  }												\
>  												\
>  static inline void panthor_ ## __name ## _irq_resume(struct panthor_irq *pirq, u32 mask)	\
>  {												\
> -	atomic_set(&pirq->suspended, false);							\
>  	pirq->mask = mask;									\
> -	gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, mask);				\
> -	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, mask);				\
> +	atomic_set(&pirq->state, PANTHOR_IRQ_STATE_ACTIVE);					\
> +	gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, pirq->mask);				\
> +	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, pirq->mask);				\

Here the change from using the local 'mask' to 'pirq->mask' is
unrelated. It belongs in the next patch where 'mask' is being removed.

But otherwise this looks good to me.

Thanks,
Steve

>  }												\
>  												\
>  static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
> 

