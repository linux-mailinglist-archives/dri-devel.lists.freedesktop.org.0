Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9D8CD6831
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 16:23:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE1710E17D;
	Mon, 22 Dec 2025 15:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 17DB210E17D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 15:23:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DCED497;
 Mon, 22 Dec 2025 07:23:32 -0800 (PST)
Received: from [10.1.29.18] (e122027.cambridge.arm.com [10.1.29.18])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9F6B3F694;
 Mon, 22 Dec 2025 07:23:36 -0800 (PST)
Message-ID: <468eb6a1-2c9e-4835-b3fd-e8c497ddd049@arm.com>
Date: Mon, 22 Dec 2025 15:23:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm/panthor: Extend IRQ helpers for mask
 modification/restoration
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chia-I Wu <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251221-panthor-tracepoints-v5-0-889ef78165d8@collabora.com>
 <20251221-panthor-tracepoints-v5-1-889ef78165d8@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251221-panthor-tracepoints-v5-1-889ef78165d8@collabora.com>
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

On 21/12/2025 17:10, Nicolas Frattaroli wrote:
> The current IRQ helpers do not guarantee mutual exclusion that covers
> the entire transaction from accessing the mask member and modifying the
> mask register.
> 
> This makes it hard, if not impossible, to implement mask modification
> helpers that may change one of these outside the normal
> suspend/resume/isr code paths.
> 
> Add a spinlock to struct panthor_irq that protects both the mask member
> and register. Acquire it in all code paths that access these. Then, add
> the aforementioned new helpers: mask_enable, mask_disable, and
> resume_restore. The first two work by ORing and NANDing the mask bits,
> and the latter relies on the new behaviour that panthor_irq::mask is not
> set to 0 on suspend.
> 
> panthor_irq::suspended remains an atomic, as it's necessarily written to
> outside the mask_lock in the suspend path.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.h | 55 +++++++++++++++++++++++++++-----
>  1 file changed, 47 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index f35e52b9546a..eb75c83e2db3 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -73,11 +73,14 @@ struct panthor_irq {
>  	/** @irq: IRQ number. */
>  	int irq;
>  
> -	/** @mask: Current mask being applied to xxx_INT_MASK. */
> +	/** @mask: Values to write to xxx_INT_MASK if active. */
>  	u32 mask;
>  
>  	/** @suspended: Set to true when the IRQ is suspended. */
>  	atomic_t suspended;
> +
> +	/** @mask_lock: protects modifications to _INT_MASK and @mask */
> +	spinlock_t mask_lock;
>  };
>  
>  /**
> @@ -410,6 +413,8 @@ static irqreturn_t panthor_ ## __name ## _irq_raw_handler(int irq, void *data)
>  	struct panthor_irq *pirq = data;							\
>  	struct panthor_device *ptdev = pirq->ptdev;						\
>  												\
> +	guard(spinlock_irqsave)(&pirq->mask_lock);						\
> +												\
>  	if (atomic_read(&pirq->suspended))							\
>  		return IRQ_NONE;								\
>  	if (!gpu_read(ptdev, __reg_prefix ## _INT_STAT))					\
> @@ -425,8 +430,10 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
>  	struct panthor_device *ptdev = pirq->ptdev;						\
>  	irqreturn_t ret = IRQ_NONE;								\
>  												\
> +	guard(spinlock_irqsave)(&pirq->mask_lock);						\

Woah! You can't do that. That means there's a spinlock held while
calling the __handler() function. So you'll get "sleeping while atomic"
bug reports. Specifically I can see that panthor_mmu_irq_handler() takes
a mutex.

But the whole point of a threaded handler is so that it can sleep, so we
definitely don't want a spinlock held.

Thanks,
Steve

> +												\
>  	while (true) {										\
> -		u32 status = gpu_read(ptdev, __reg_prefix ## _INT_RAWSTAT) & pirq->mask;	\
> +		u32 status = (gpu_read(ptdev, __reg_prefix ## _INT_RAWSTAT) & pirq->mask);	\
>  												\
>  		if (!status)									\
>  			break;									\
> @@ -443,18 +450,30 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
>  												\
>  static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)			\
>  {												\
> -	pirq->mask = 0;										\
> -	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);					\
> +	scoped_guard(spinlock_irqsave, &pirq->mask_lock) {					\
> +		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);				\
> +	}											\
>  	synchronize_irq(pirq->irq);								\
>  	atomic_set(&pirq->suspended, true);							\
>  }												\
>  												\
>  static inline void panthor_ ## __name ## _irq_resume(struct panthor_irq *pirq, u32 mask)	\
>  {												\
> -	atomic_set(&pirq->suspended, false);							\
> +	guard(spinlock_irqsave)(&pirq->mask_lock);						\
> +												\
>  	pirq->mask = mask;									\
> -	gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, mask);				\
> -	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, mask);				\
> +	atomic_set(&pirq->suspended, false);							\
> +	gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, pirq->mask);				\
> +	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, pirq->mask);				\
> +}												\
> +												\
> +static inline void panthor_ ## __name ## _irq_resume_restore(struct panthor_irq *pirq)		\
> +{												\
> +	guard(spinlock_irqsave)(&pirq->mask_lock);						\
> +												\
> +	atomic_set(&pirq->suspended, false);							\
> +	gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, pirq->mask);				\
> +	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, pirq->mask);				\
>  }												\
>  												\
>  static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
> @@ -463,13 +482,33 @@ static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
>  {												\
>  	pirq->ptdev = ptdev;									\
>  	pirq->irq = irq;									\
> -	panthor_ ## __name ## _irq_resume(pirq, mask);						\
> +	pirq->mask = mask;									\
> +	spin_lock_init(&pirq->mask_lock);							\
> +	panthor_ ## __name ## _irq_resume_restore(pirq);					\
>  												\
>  	return devm_request_threaded_irq(ptdev->base.dev, irq,					\
>  					 panthor_ ## __name ## _irq_raw_handler,		\
>  					 panthor_ ## __name ## _irq_threaded_handler,		\
>  					 IRQF_SHARED, KBUILD_MODNAME "-" # __name,		\
>  					 pirq);							\
> +}												\
> +												\
> +static inline void panthor_ ## __name ## _irq_mask_enable(struct panthor_irq *pirq, u32 mask)	\
> +{												\
> +	guard(spinlock_irqsave)(&pirq->mask_lock);						\
> +												\
> +	pirq->mask |= mask;									\
> +	if (!atomic_read(&pirq->suspended))							\
> +		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, pirq->mask);			\
> +}												\
> +												\
> +static inline void panthor_ ## __name ## _irq_mask_disable(struct panthor_irq *pirq, u32 mask)	\
> +{												\
> +	guard(spinlock_irqsave)(&pirq->mask_lock);						\
> +												\
> +	pirq->mask &= ~mask;									\
> +	if (!atomic_read(&pirq->suspended))							\
> +		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, pirq->mask);			\
>  }
>  
>  extern struct workqueue_struct *panthor_cleanup_wq;
> 

