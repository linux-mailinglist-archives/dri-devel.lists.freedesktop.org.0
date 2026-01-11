Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FB0D0EB86
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 12:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6325310E11B;
	Sun, 11 Jan 2026 11:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="eATZPv0w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB6910E11B
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 11:40:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768131602; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=N3PTON0wgMYxpdSzRz0p1dPz62WrKheCGbdrxyZlCPuyGcHzPYDIszDmewjdNW4TsadzUi1G1x+E/fc30Hw+CHXVyhgGln0+LozlJbmsxWKxL0XSLJj0wyv+tSXlJAA1uvsFAelCuL2MMDH0A3IqscWQxM3IckoAdR8Ooo3FI3o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768131602;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=gvS51pjib7XGCacaHcx84vZ0eZb00fiEDYECjEsPZ1Y=; 
 b=Efl+Y1W17Ks5vJ4Nr21k71ogq0VLGz23z7hF892obg35XMk4i145UcMELOyQvX1I2b7tfZSaIucBAXl/Wb+k1bnsZWz/iP/4nf0fsbL2NBuhVRA59Z+KeFXSeSf2oMI3xd6SuhEn8eq7jCM7GtT4fdTPVNAfAbB9kxAkq98X50s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768131602; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=gvS51pjib7XGCacaHcx84vZ0eZb00fiEDYECjEsPZ1Y=;
 b=eATZPv0w4LI8UBF7db2UCX0IeS1X+cxw0tB2+p1M1nikWZ//UDwQXjbwmZlKx6qg
 VczBUN1kKHeb5OvzdG0LlypeNQL1cn+2/7397N5RNDfv08qicb7m+ljuiKdzQzsbrM8
 57MO1XNQJW0m04e3sZ/dJCWFg4YLW2b4ABnT+KsI=
Received: by mx.zohomail.com with SMTPS id 1768131601082716.0291021260219;
 Sun, 11 Jan 2026 03:40:01 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chia-I Wu <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>,
 Steven Price <steven.price@arm.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 1/4] drm/panthor: Extend IRQ helpers for mask
 modification/restoration
Date: Sun, 11 Jan 2026 12:39:55 +0100
Message-ID: <13548164.O9o76ZdvQC@workhorse>
In-Reply-To: <f19b2ca3-56f6-4f69-9823-f6444a2d5eae@arm.com>
References: <20260108-panthor-tracepoints-v7-0-afeae181f74a@collabora.com>
 <20260108-panthor-tracepoints-v7-1-afeae181f74a@collabora.com>
 <f19b2ca3-56f6-4f69-9823-f6444a2d5eae@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Friday, 9 January 2026 16:59:46 Central European Standard Time Steven Price wrote:
> On 08/01/2026 14:19, Nicolas Frattaroli wrote:
> > The current IRQ helpers do not guarantee mutual exclusion that covers
> > the entire transaction from accessing the mask member and modifying the
> > mask register.
> > 
> > This makes it hard, if not impossible, to implement mask modification
> > helpers that may change one of these outside the normal
> > suspend/resume/isr code paths.
> > 
> > Add a spinlock to struct panthor_irq that protects both the mask member
> > and register. Acquire it in all code paths that access these, but drop
> > it before processing the threaded handler function. Then, add the
> > aforementioned new helpers: enable_events, and disable_events. They work
> > by ORing and NANDing the mask bits.
> > 
> > resume is changed to no longer have a mask passed, as pirq->mask is
> > supposed to be the user-requested mask now, rather than a mirror of the
> > INT_MASK register contents. Users of the resume helper are adjusted
> > accordingly, including a rather painful refactor in panthor_mmu.c.
> > 
> > panthor_irq::suspended remains an atomic, as it's necessarily written to
> > outside the mask_lock in the suspend path.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_device.h |  60 ++++++--
> >  drivers/gpu/drm/panthor/panthor_fw.c     |   3 +-
> >  drivers/gpu/drm/panthor/panthor_gpu.c    |   2 +-
> >  drivers/gpu/drm/panthor/panthor_mmu.c    | 247 ++++++++++++++++---------------
> >  drivers/gpu/drm/panthor/panthor_pwr.c    |   2 +-
> >  5 files changed, 179 insertions(+), 135 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> > index f35e52b9546a..cf76a8abca76 100644
> > --- a/drivers/gpu/drm/panthor/panthor_device.h
> > +++ b/drivers/gpu/drm/panthor/panthor_device.h
> > @@ -73,11 +73,14 @@ struct panthor_irq {
> >  	/** @irq: IRQ number. */
> >  	int irq;
> >  
> > -	/** @mask: Current mask being applied to xxx_INT_MASK. */
> > +	/** @mask: Values to write to xxx_INT_MASK if active. */
> >  	u32 mask;
> >  
> >  	/** @suspended: Set to true when the IRQ is suspended. */
> >  	atomic_t suspended;
> > +
> > +	/** @mask_lock: protects modifications to _INT_MASK and @mask */
> > +	spinlock_t mask_lock;
> >  };
> >  
> >  /**
> > @@ -410,6 +413,8 @@ static irqreturn_t panthor_ ## __name ## _irq_raw_handler(int irq, void *data)
> >  	struct panthor_irq *pirq = data;							\
> >  	struct panthor_device *ptdev = pirq->ptdev;						\
> >  												\
> > +	guard(spinlock_irqsave)(&pirq->mask_lock);						\
> > +												\
> >  	if (atomic_read(&pirq->suspended))							\
> >  		return IRQ_NONE;								\
> >  	if (!gpu_read(ptdev, __reg_prefix ## _INT_STAT))					\
> > @@ -424,9 +429,14 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
> >  	struct panthor_irq *pirq = data;							\
> >  	struct panthor_device *ptdev = pirq->ptdev;						\
> >  	irqreturn_t ret = IRQ_NONE;								\
> > +	u32 mask;										\
> > +												\
> > +	scoped_guard(spinlock_irqsave, &pirq->mask_lock) {					\
> > +		mask = pirq->mask;								\
> > +	}											\
> >  												\
> >  	while (true) {										\
> > -		u32 status = gpu_read(ptdev, __reg_prefix ## _INT_RAWSTAT) & pirq->mask;	\
> > +		u32 status = (gpu_read(ptdev, __reg_prefix ## _INT_RAWSTAT) & mask);		\
> >  												\
> >  		if (!status)									\
> >  			break;									\
> > @@ -435,26 +445,34 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
> >  		ret = IRQ_HANDLED;								\
> >  	}											\
> >  												\
> > -	if (!atomic_read(&pirq->suspended))							\
> > -		gpu_write(ptdev, __reg_prefix ## _INT_MASK, pirq->mask);			\
> > +	scoped_guard(spinlock_irqsave, &pirq->mask_lock) {					\
> > +		if (!atomic_read(&pirq->suspended)) {						\
> > +			/* Only restore the bits that were used and are still enabled */	\
> > +			gpu_write(ptdev, __reg_prefix ## _INT_MASK,				\
> > +				  gpu_read(ptdev, __reg_prefix ## _INT_MASK) |			\
> > +				  (mask & pirq->mask));						\
> > +		}										\
> > +	}											\
> >  												\
> >  	return ret;										\
> >  }												\
> >  												\
> >  static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)			\
> >  {												\
> > -	pirq->mask = 0;										\
> > -	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);					\
> > +	scoped_guard(spinlock_irqsave, &pirq->mask_lock) {					\
> > +		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);				\
> > +	}											\
> >  	synchronize_irq(pirq->irq);								\
> 
> This isn't quite safe with the threaded handler. The following can occur:
> 
> CPU 0				| CPU 1
> --------------------------------+----------------------------
> Running _irq_threaded_handler() |
> Enters __handler() callback     |
> 				| Enters _irq_suspend
> 				| Writes 0 to _INT_MASK
> 				| Drops scoped_guard()
> 				| Waits for the threaded handler
> Enters the final scoped_guard   |
> pirq->suspended is non-zero	|
> Reads pirq->mask/mask		|
> Writes non-zero to _INT_MASK	|
> 				| Sets suspended, but it's too late
> 
> Leading to the suspend occurring with interrupts not masked.
> 
> In the next patches you introduce the SUSPENDING flag which I think
> might fix this, but with just this patch it's broken so we could have
> bisection issues.

Yeah, when I sent it out I was aware it could have a problem because
I did the conversion in the follow-up patch. I figured at the time
that this was worth not having a giant "do everything" patch, but now
you've pointed out to me that I could just reorder the follow-up to be
before this one and things will work out.

> 
> Admittedly the old code was a little dodgy with the usage of irq->mask
> (I think really we should have atomic accesses to ensure that the write
> of pirq->mask is observed before the gpu_write).
> 
> Can you reorder the patches - introduce the panthor_irq_state enum first
> (with just SUSPENDED and ACTIVE states) and then do the conversion in
> one step?

Will do, thanks for pointing this out as a possibility. Shouldn't be too
painful either, hopefully.

> 
> Thanks,
> Steve
> 
> [ ... snip ... ]



