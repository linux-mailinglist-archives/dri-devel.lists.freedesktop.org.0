Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC2ACF3CCE
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 14:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C12410E1AF;
	Mon,  5 Jan 2026 13:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CypkX25r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F7210E1AF
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 13:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767619761;
 bh=bC7EbaimyPyHspkdcQDsLWxtvV9CyW2+E1CkfnxfWQA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CypkX25rYMaEczsFrE6XNHmH2M6FNaXeMK/ZstEl7Vi9D6oV7y0x2pDUal2zc5Gp7
 ECdw56kPTyGiMZ/ySCZzLsx1Xrxw5XQMhYlmDdX79v+kx6d01kfQKVVqsmF3s2z5bO
 E2X1ZR/vfkSHpehp682ZndUOtG/7ElrhsaiCwMAxmk2fR+wLIxIv5oNagfZ1Q9NWVT
 II2yiafguvWCnzuGidybxYDsbQbOc1j4d6Dw7uNmfmrAKQqBS6+8tuz51/g+RRseQR
 iWsNoGQTo5/2knSfbwTkiAfIiuHmqKarvUBSWV4trtdrPU1FQKsQmEXDB5Kd6gL0Ly
 zPzI/k88sZKgg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CBA4A17E139F;
 Mon,  5 Jan 2026 14:29:20 +0100 (CET)
Date: Mon, 5 Jan 2026 14:29:14 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Chia-I Wu
 <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 1/3] drm/panthor: Extend IRQ helpers for mask
 modification/restoration
Message-ID: <20260105142914.73507ee7@fedora>
In-Reply-To: <1947070.CQOukoFCf9@workhorse>
References: <20251223-panthor-tracepoints-v6-0-d3c998ee9efc@collabora.com>
 <20251223-panthor-tracepoints-v6-1-d3c998ee9efc@collabora.com>
 <20260105121220.581a98a2@fedora> <1947070.CQOukoFCf9@workhorse>
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

On Mon, 05 Jan 2026 14:17:55 +0100
Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:

> On Monday, 5 January 2026 12:12:20 Central European Standard Time Boris Brezillon wrote:
> > On Tue, 23 Dec 2025 17:24:58 +0100
> > Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:
> >   
> > > The current IRQ helpers do not guarantee mutual exclusion that covers
> > > the entire transaction from accessing the mask member and modifying the
> > > mask register.
> > > 
> > > This makes it hard, if not impossible, to implement mask modification
> > > helpers that may change one of these outside the normal
> > > suspend/resume/isr code paths.
> > > 
> > > Add a spinlock to struct panthor_irq that protects both the mask member
> > > and register. Acquire it in all code paths that access these, but drop
> > > it before processing the threaded handler function. Then, add the
> > > aforementioned new helpers: mask_enable, mask_disable, and
> > > resume_restore. The first two work by ORing and NANDing the mask bits,
> > > and the latter relies on the new behaviour that panthor_irq::mask is not
> > > set to 0 on suspend.
> > > 
> > > panthor_irq::suspended remains an atomic, as it's necessarily written to
> > > outside the mask_lock in the suspend path.
> > > 
> > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > ---
> > >  drivers/gpu/drm/panthor/panthor_device.h | 68 +++++++++++++++++++++++++++-----
> > >  1 file changed, 58 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> > > index f35e52b9546a..bf554cf376fb 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_device.h
> > > +++ b/drivers/gpu/drm/panthor/panthor_device.h
> > > @@ -73,11 +73,14 @@ struct panthor_irq {
> > >  	/** @irq: IRQ number. */
> > >  	int irq;
> > >  
> > > -	/** @mask: Current mask being applied to xxx_INT_MASK. */
> > > +	/** @mask: Values to write to xxx_INT_MASK if active. */
> > >  	u32 mask;
> > >  
> > >  	/** @suspended: Set to true when the IRQ is suspended. */
> > >  	atomic_t suspended;
> > > +
> > > +	/** @mask_lock: protects modifications to _INT_MASK and @mask */
> > > +	spinlock_t mask_lock;
> > >  };
> > >  
> > >  /**
> > > @@ -410,6 +413,8 @@ static irqreturn_t panthor_ ## __name ## _irq_raw_handler(int irq, void *data)
> > >  	struct panthor_irq *pirq = data;							\
> > >  	struct panthor_device *ptdev = pirq->ptdev;						\
> > >  												\
> > > +	guard(spinlock_irqsave)(&pirq->mask_lock);						\
> > > +												\
> > >  	if (atomic_read(&pirq->suspended))							\
> > >  		return IRQ_NONE;								\
> > >  	if (!gpu_read(ptdev, __reg_prefix ## _INT_STAT))					\
> > > @@ -424,9 +429,14 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
> > >  	struct panthor_irq *pirq = data;							\
> > >  	struct panthor_device *ptdev = pirq->ptdev;						\
> > >  	irqreturn_t ret = IRQ_NONE;								\
> > > +	u32 mask;										\
> > > +												\
> > > +	scoped_guard(spinlock_irqsave, &pirq->mask_lock) {					\
> > > +		mask = pirq->mask;								\
> > > +	}											\
> > >  												\
> > >  	while (true) {										\
> > > -		u32 status = gpu_read(ptdev, __reg_prefix ## _INT_RAWSTAT) & pirq->mask;	\
> > > +		u32 status = (gpu_read(ptdev, __reg_prefix ## _INT_RAWSTAT) & mask);		\
> > >  												\
> > >  		if (!status)									\
> > >  			break;									\
> > > @@ -435,26 +445,44 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
> > >  		ret = IRQ_HANDLED;								\
> > >  	}											\
> > >  												\
> > > -	if (!atomic_read(&pirq->suspended))							\
> > > -		gpu_write(ptdev, __reg_prefix ## _INT_MASK, pirq->mask);			\
> > > +	scoped_guard(spinlock_irqsave, &pirq->mask_lock) {					\
> > > +		if (!atomic_read(&pirq->suspended)) {						\
> > > +			/* Only restore the bits that were used and are still enabled */	\
> > > +			gpu_write(ptdev, __reg_prefix ## _INT_MASK,				\
> > > +				  gpu_read(ptdev, __reg_prefix ## _INT_MASK) |			\
> > > +				  (mask & pirq->mask));						\
> > > +		}										\
> > > +	}											\
> > >  												\
> > >  	return ret;										\
> > >  }												\
> > >  												\
> > >  static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)			\
> > >  {												\
> > > -	pirq->mask = 0;										\
> > > -	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);					\
> > > +	scoped_guard(spinlock_irqsave, &pirq->mask_lock) {					\
> > > +		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);				\
> > > +	}											\
> > >  	synchronize_irq(pirq->irq);								\
> > >  	atomic_set(&pirq->suspended, true);							\
> > >  }												\
> > >  												\
> > >  static inline void panthor_ ## __name ## _irq_resume(struct panthor_irq *pirq, u32 mask)	\  
> > 
> > If pirq->mask is encoding the user-selected mask, there's no point
> > passing it as an argument to _irq_resume().  
> 
> There is. I don't want to refactor all of panthor_mmu and the
> stuff it does with the mask. It needs to set-mask-and-resume in a
> race-free manner, and that's not possible unless we keep this API
> around, or we do some heavy refactoring.

That's problematic I think. It means we have two different semantics
for panthor_irq::mask now. One where it directly reflects the mask
wanted by its user (GPU, JOB, PWR) and one where it's not (MMU). 

> Remember that locks in the
> kernel aren't reentrant, so we can't just acquire the lock in
> panthor_mmu, set the mask, and then resume the IRQ, and then drop
> the lock, as we'd be re-acquiring the lock in resume.

But you shouldn't have to, because panthor_irq::mask should always
reflect the user requested mask, so whatever is in panthor_irq::mask at
resume time is the thing we should push to INT_MASK, and that we do
with the ::mask_lock held to avoid races. What we need to do though, is
patch panthor_mmu.c to use _irq_{enable,disable}_events() instead of the
open-coded version we have at the moment.

