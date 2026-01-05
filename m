Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0D4CF3BD8
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 14:18:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F1D10E0AD;
	Mon,  5 Jan 2026 13:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="d2hAvqKI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9221110E0AD
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 13:18:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1767619081; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PILnL3VRlOd9mMrbRNX2cRiPUzcjwwRSrgZPxjZMDYSh6sJv5uGH3gEJV2Z5PPGXMR9yw+7FX7GvQSPbWfiVUP9zbjFeMoeUL0/w1CRv1+xQe1Kx7XcnxhfXWdJb58dRNMbr4UDRpCE7nODUYkn0QW3ixS1t+Z69a5SDTvDTw8o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1767619081;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=2QeAI7ORnZY6JfcBlcEdYD8ZG7xpLsl+DIKv3ZGVWJg=; 
 b=cFFYeFzFTO2D/Qt3UY8Or1hU55P1dm9e8C0rqnPuZssFj09uHvi8lc3miWPTlFp9T3TyYH/JDF/XzwNGu6eulnsapUP3uYHetr9WTnyzagwEY4p6R56rXayDCOgFrPeDIwQd3B4yOP0d4RSHXwEXAePn+CslQybVHnHxOJJcChY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767619081; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=2QeAI7ORnZY6JfcBlcEdYD8ZG7xpLsl+DIKv3ZGVWJg=;
 b=d2hAvqKIJ5SRzgyL8aZZHt0rcdgtLvKMxvruxWTmkHPdmtmlCQjaRugtXUgWl2C2
 hnf99VrCoAZv5Y7gf/VU6ur68W6xw9pz3BL/H/OJ6CGAtMIbfbI6fM/3LRR3fuKk8Au
 LRBnR0nBBcKsvlmCt3Iih5qL8o+9MLmQxXaCbPho=
Received: by mx.zohomail.com with SMTPS id 1767619079773798.7294533440611;
 Mon, 5 Jan 2026 05:17:59 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chia-I Wu <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 1/3] drm/panthor: Extend IRQ helpers for mask
 modification/restoration
Date: Mon, 05 Jan 2026 14:17:55 +0100
Message-ID: <1947070.CQOukoFCf9@workhorse>
In-Reply-To: <20260105121220.581a98a2@fedora>
References: <20251223-panthor-tracepoints-v6-0-d3c998ee9efc@collabora.com>
 <20251223-panthor-tracepoints-v6-1-d3c998ee9efc@collabora.com>
 <20260105121220.581a98a2@fedora>
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

On Monday, 5 January 2026 12:12:20 Central European Standard Time Boris Brezillon wrote:
> On Tue, 23 Dec 2025 17:24:58 +0100
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:
> 
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
> > aforementioned new helpers: mask_enable, mask_disable, and
> > resume_restore. The first two work by ORing and NANDing the mask bits,
> > and the latter relies on the new behaviour that panthor_irq::mask is not
> > set to 0 on suspend.
> > 
> > panthor_irq::suspended remains an atomic, as it's necessarily written to
> > outside the mask_lock in the suspend path.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_device.h | 68 +++++++++++++++++++++++++++-----
> >  1 file changed, 58 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> > index f35e52b9546a..bf554cf376fb 100644
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
> > @@ -435,26 +445,44 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
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
> >  	atomic_set(&pirq->suspended, true);							\
> >  }												\
> >  												\
> >  static inline void panthor_ ## __name ## _irq_resume(struct panthor_irq *pirq, u32 mask)	\
> 
> If pirq->mask is encoding the user-selected mask, there's no point
> passing it as an argument to _irq_resume().

There is. I don't want to refactor all of panthor_mmu and the
stuff it does with the mask. It needs to set-mask-and-resume in a
race-free manner, and that's not possible unless we keep this API
around, or we do some heavy refactoring. Remember that locks in the
kernel aren't reentrant, so we can't just acquire the lock in
panthor_mmu, set the mask, and then resume the IRQ, and then drop
the lock, as we'd be re-acquiring the lock in resume.

> 
> >  {												\
> > -	atomic_set(&pirq->suspended, false);							\
> > +	guard(spinlock_irqsave)(&pirq->mask_lock);						\
> > +												\
> >  	pirq->mask = mask;									\
> > -	gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, mask);				\
> > -	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, mask);				\
> > +	atomic_set(&pirq->suspended, false);							\
> > +	gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, pirq->mask);				\
> > +	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, pirq->mask);				\
> > +}												\
> > +												\
> > +static inline void panthor_ ## __name ## _irq_resume_restore(struct panthor_irq *pirq)		\
> 
> As mentioned above, I'd just change the semantics of _irq_resume() to
> match _irq_resume_restore() and drop _irq_resume_restore().
> 
> > +{												\
> > +	guard(spinlock_irqsave)(&pirq->mask_lock);						\
> > +												\
> > +	atomic_set(&pirq->suspended, false);							\
> > +	gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, pirq->mask);				\
> > +	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, pirq->mask);				\
> >  }												\
> >  												\
> >  static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
> > @@ -463,13 +491,33 @@ static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
> >  {												\
> >  	pirq->ptdev = ptdev;									\
> >  	pirq->irq = irq;									\
> > -	panthor_ ## __name ## _irq_resume(pirq, mask);						\
> > +	pirq->mask = mask;									\
> > +	spin_lock_init(&pirq->mask_lock);							\
> > +	panthor_ ## __name ## _irq_resume_restore(pirq);					\
> >  												\
> >  	return devm_request_threaded_irq(ptdev->base.dev, irq,					\
> >  					 panthor_ ## __name ## _irq_raw_handler,		\
> >  					 panthor_ ## __name ## _irq_threaded_handler,		\
> >  					 IRQF_SHARED, KBUILD_MODNAME "-" # __name,		\
> >  					 pirq);							\
> > +}												\
> > +												\
> > +static inline void panthor_ ## __name ## _irq_mask_enable(struct panthor_irq *pirq, u32 mask)	\
> 
> nit: I think I prefer _irq_{enable,disable}_events() as a name.

Agreed, that seems clearer.

> 
> > +{												\
> > +	guard(spinlock_irqsave)(&pirq->mask_lock);						\
> > +												\
> > +	pirq->mask |= mask;									\
> > +	if (!atomic_read(&pirq->suspended))							\
> > +		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, pirq->mask);			\
> 
> There's still a problem with this solution: you might be re-enabling
> interrupts before the threaded handler is done, causing HW interrupts
> to needlessly fire. You need to repurpose ::suspended into multi-state
> field (ACTIVE, PROCESSING, SUSPENDING, SUSPENDED) to detect the case
> where the interrupt is being processed and only write to _INT_MASK if
> this ::state == ACTIVE.

Hmmm, yeah, I think there's no getting around needing more state
here. I'll do that.

Kind regards,
Nicolas Frattaroli

> > +}												\
> > +												\
> > +static inline void panthor_ ## __name ## _irq_mask_disable(struct panthor_irq *pirq, u32 mask)	\
> > +{												\
> > +	guard(spinlock_irqsave)(&pirq->mask_lock);						\
> > +												\
> > +	pirq->mask &= ~mask;									\
> > +	if (!atomic_read(&pirq->suspended))							\
> > +		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, pirq->mask);			\
> >  }
> >  
> >  extern struct workqueue_struct *panthor_cleanup_wq;
> > 
> 
> 




