Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC58D33568
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 16:56:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0826D10E123;
	Fri, 16 Jan 2026 15:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 78BFF10E123
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 15:55:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CB391515;
 Fri, 16 Jan 2026 07:55:50 -0800 (PST)
Received: from [10.1.27.18] (e122027.cambridge.arm.com [10.1.27.18])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF9D63F632;
 Fri, 16 Jan 2026 07:55:54 -0800 (PST)
Message-ID: <9bf6ac3b-5b14-4844-98be-7cd1fa5e00c3@arm.com>
Date: Fri, 16 Jan 2026 15:55:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/4] drm/panthor: Rework panthor_irq::suspended into
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
References: <20260116-panthor-tracepoints-v10-0-d925986e3d1b@collabora.com>
 <20260116-panthor-tracepoints-v10-1-d925986e3d1b@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260116-panthor-tracepoints-v10-1-d925986e3d1b@collabora.com>
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

On 16/01/2026 12:57, Nicolas Frattaroli wrote:
> To deal with the threaded interrupt handler and a suspend action
> overlapping, the boolean panthor_irq::suspended is not sufficient.
> 
> Rework it into taking several different values depending on the current
> state, and check it and set it within the IRQ helper functions.
> 
> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_device.h | 35 +++++++++++++++++++++++++-------
>  1 file changed, 28 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index f35e52b9546a..8597b388cc40 100644
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
> @@ -409,12 +420,17 @@ static irqreturn_t panthor_ ## __name ## _irq_raw_handler(int irq, void *data)
>  {												\
>  	struct panthor_irq *pirq = data;							\
>  	struct panthor_device *ptdev = pirq->ptdev;						\
> +	enum panthor_irq_state old_state;							\
>  												\
> -	if (atomic_read(&pirq->suspended))							\
> -		return IRQ_NONE;								\
>  	if (!gpu_read(ptdev, __reg_prefix ## _INT_STAT))					\
>  		return IRQ_NONE;								\
>  												\
> +	old_state = atomic_cmpxchg(&pirq->state,						\
> +				   PANTHOR_IRQ_STATE_ACTIVE,					\
> +				   PANTHOR_IRQ_STATE_PROCESSING);				\
> +	if (old_state != PANTHOR_IRQ_STATE_ACTIVE)						\
> +		return IRQ_NONE;								\
> +												\
>  	gpu_write(ptdev, __reg_prefix ## _INT_MASK, 0);						\
>  	return IRQ_WAKE_THREAD;									\
>  }												\
> @@ -423,6 +439,7 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
>  {												\
>  	struct panthor_irq *pirq = data;							\
>  	struct panthor_device *ptdev = pirq->ptdev;						\
> +	enum panthor_irq_state old_state;							\
>  	irqreturn_t ret = IRQ_NONE;								\
>  												\
>  	while (true) {										\
> @@ -435,7 +452,10 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
>  		ret = IRQ_HANDLED;								\
>  	}											\
>  												\
> -	if (!atomic_read(&pirq->suspended))							\
> +	old_state = atomic_cmpxchg(&pirq->state,						\
> +				   PANTHOR_IRQ_STATE_PROCESSING,				\
> +				   PANTHOR_IRQ_STATE_ACTIVE);					\
> +	if (old_state == PANTHOR_IRQ_STATE_PROCESSING)						\
>  		gpu_write(ptdev, __reg_prefix ## _INT_MASK, pirq->mask);			\
>  												\
>  	return ret;										\
> @@ -445,14 +465,15 @@ static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)
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
> +	atomic_set(&pirq->state, PANTHOR_IRQ_STATE_ACTIVE);					\
>  	gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, mask);				\
>  	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, mask);				\
>  }												\
> 

