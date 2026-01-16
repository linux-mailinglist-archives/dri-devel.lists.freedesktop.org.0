Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC87D31BB9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 14:21:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A21E10E89B;
	Fri, 16 Jan 2026 13:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ojVmoGDY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4956310E890
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 13:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768569699;
 bh=B7/OGEwz1eX6/MKfch4Nv8/P6yZZQ2ZgFGZk+0MtiWE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ojVmoGDYnZUpuhqV4zHLkYvuBAUDGLfZwTO9MiRcdD70xWn32P41USEl/vBHNlt2L
 pzt1Vlxh1+Hukis6FlaAl89zvXgQbTv7qVyHfnBjka2V0lTYMoRCYrtJlXrOueOm0i
 SGQt21VmcwHxSobZxsnyGU8gM1tvnNszwDRZ7q9Pw57mzVxu9FKQPYLYe382YeLK6K
 zlnIRzFIJxKlQcE6gY/1q92XEEgS3vVNG+zR+Z9fi5Z7Ta729lkkTknpND4Qooaq+w
 Qmo54gqjyOE2nqcDIhfTxBl3elYrgR/jQEQ6c6ZHJZTQZ9ODfPKZ89qn6HHOLkQuZP
 mo+kcOwTjS1QA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 467B717E12FE;
 Fri, 16 Jan 2026 14:21:39 +0100 (CET)
Date: Fri, 16 Jan 2026 14:21:32 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Chia-I Wu
 <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v10 1/4] drm/panthor: Rework panthor_irq::suspended into
 panthor_irq::state
Message-ID: <20260116142132.6e0ee6b8@fedora>
In-Reply-To: <20260116-panthor-tracepoints-v10-1-d925986e3d1b@collabora.com>
References: <20260116-panthor-tracepoints-v10-0-d925986e3d1b@collabora.com>
 <20260116-panthor-tracepoints-v10-1-d925986e3d1b@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri, 16 Jan 2026 13:57:30 +0100
Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:

> To deal with the threaded interrupt handler and a suspend action
> overlapping, the boolean panthor_irq::suspended is not sufficient.
> 
> Rework it into taking several different values depending on the current
> state, and check it and set it within the IRQ helper functions.
> 
> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

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

