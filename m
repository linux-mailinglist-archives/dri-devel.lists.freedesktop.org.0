Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B1ACD9D39
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 16:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42DD10E09A;
	Tue, 23 Dec 2025 15:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="TW+2TZEj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F350D10E09A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 15:44:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766504645; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BWFSHRb/PHRYtD7nRHcxwUTxqw4+JozsIknda+t4c0rdi1bErTECxiacvt3BWQZdnjl2RS5rurgLbjwzB05JKU4PynCa9/IVLp1eryJ/CRA+a6TXxwgLOR3vXozsoo8SmD0P5Glhm4Ja3iHzD6+1gbZOi7Dxp3NXPGevztO+Mxc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766504645;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=wQmxKhxYfmc9eLjcDP0SWsUcslwXfmH5eErJLMQzegM=; 
 b=KG1bjvnc/P8HyQRvc54jnd/P3XavRuNJ/sdAYDR0r5J9qV+hHJge/Ra2FeNEVUIAB7b+kYsEgzBBHbFB8C7mer7kUg4yHAd8ITIGAvq/rlLJ+KxgeGU5hCbKtndxW+0XIR0W+OvPHr0bKnLHV9Me46Hz0ule0tNp6MykIKrcNKE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766504645; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=wQmxKhxYfmc9eLjcDP0SWsUcslwXfmH5eErJLMQzegM=;
 b=TW+2TZEjKDRJZm6+iofVCKUzGQm6Pf3xbS/igaOnnbj1emnilnmMHm7+7yn/54BL
 u4bfUE5JTuvEWFd1hwz8uUs5KQTi9froTw6JraccZxebvtWqu6Wy9BUxNVmWe4zolbM
 +wVEnK3y6MEsOd9ursPUvOLptyC+k3GePdG75qoo=
Received: by mx.zohomail.com with SMTPS id 1766504643784288.40644972736834;
 Tue, 23 Dec 2025 07:44:03 -0800 (PST)
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
Subject: Re: [PATCH v5 1/3] drm/panthor: Extend IRQ helpers for mask
 modification/restoration
Date: Tue, 23 Dec 2025 16:43:57 +0100
Message-ID: <2484885.ElGaqSPkdT@workhorse>
In-Reply-To: <468eb6a1-2c9e-4835-b3fd-e8c497ddd049@arm.com>
References: <20251221-panthor-tracepoints-v5-0-889ef78165d8@collabora.com>
 <20251221-panthor-tracepoints-v5-1-889ef78165d8@collabora.com>
 <468eb6a1-2c9e-4835-b3fd-e8c497ddd049@arm.com>
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

On Monday, 22 December 2025 16:23:35 Central European Standard Time Steven Price wrote:
> On 21/12/2025 17:10, Nicolas Frattaroli wrote:
> > The current IRQ helpers do not guarantee mutual exclusion that covers
> > the entire transaction from accessing the mask member and modifying the
> > mask register.
> > 
> > This makes it hard, if not impossible, to implement mask modification
> > helpers that may change one of these outside the normal
> > suspend/resume/isr code paths.
> > 
> > Add a spinlock to struct panthor_irq that protects both the mask member
> > and register. Acquire it in all code paths that access these. Then, add
> > the aforementioned new helpers: mask_enable, mask_disable, and
> > resume_restore. The first two work by ORing and NANDing the mask bits,
> > and the latter relies on the new behaviour that panthor_irq::mask is not
> > set to 0 on suspend.
> > 
> > panthor_irq::suspended remains an atomic, as it's necessarily written to
> > outside the mask_lock in the suspend path.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_device.h | 55 +++++++++++++++++++++++++++-----
> >  1 file changed, 47 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> > index f35e52b9546a..eb75c83e2db3 100644
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
> > @@ -425,8 +430,10 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
> >  	struct panthor_device *ptdev = pirq->ptdev;						\
> >  	irqreturn_t ret = IRQ_NONE;								\
> >  												\
> > +	guard(spinlock_irqsave)(&pirq->mask_lock);						\
> 
> Woah! You can't do that. That means there's a spinlock held while
> calling the __handler() function. So you'll get "sleeping while atomic"
> bug reports. Specifically I can see that panthor_mmu_irq_handler() takes
> a mutex.
> 
> But the whole point of a threaded handler is so that it can sleep, so we
> definitely don't want a spinlock held.

Hmm, yeah, I was worried about that. The core issue is that I'm
trying to make sure we don't restore the mask if we suspended
in the meantime, and don't mess anything up if the mask got
modified in the meantime as well.

I guess I can get us there by reading the mask member into a
local with the lock held for the &'ing, dropping it before
we enter the while, and at the mask restoration point we
take the lock and OR the mask register contents with the
mask we squirrelled away into the local, unless we're
suspended at this point.

I'm not sure if the behaviour when the mask is modified while
we're in the while and we're still using the old one is the
one we want, but going off vibes it seems that in this case,
it'd just conclude that all it has to process has been
processed, and the handler will presumably run again with
the new remaining interrupt status bits.

Kind regards,
Nicolas Frattaroli

> 
> Thanks,
> Steve
> 
> > +												\
> >  	while (true) {										\
> > -		u32 status = gpu_read(ptdev, __reg_prefix ## _INT_RAWSTAT) & pirq->mask;	\
> > +		u32 status = (gpu_read(ptdev, __reg_prefix ## _INT_RAWSTAT) & pirq->mask);	\
> >  												\
> >  		if (!status)									\
> >  			break;									\
> > @@ -443,18 +450,30 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
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
> > [...]



