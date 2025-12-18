Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D75C5CCC0FB
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 14:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511B110E8AE;
	Thu, 18 Dec 2025 13:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="eeV3sSh5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B8410E8AE
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 13:42:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766065368; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=V86s4wIn5AuM7d86ZM9gqOgdqt0FmekfwA+SwYtGKN8FDtntu7RXlKiBadoUb1eqLdbX8KrP75M356HyrYnsvc3wARbF9rTy0FtjkjMvBkS6hZoMgj8adRa9d3UkoiA7R1rB6KwatxgSwWv3KIXuTFl0D8nXtr4hII8oQVlFAZU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766065368;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=8FzvipRRHSSROs+cOAH23scrSluWBY3+hnRNI0L4PKA=; 
 b=cnp5QCSEy9M46259PCooIruXLdSfS2T5/tXzaCFblAI6ddeL1FC3wE179lTjR2RYg8HHVBNfWDo4UtNE6cDyOAHT4CBfXJ5EmVjJLVZtJw9zPc6T6evaUyzU5RurT/qrFNS3T7+I14bjx48JPLR6Px6WHJvvC8Ffxr1ODAYm4qE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766065368; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=8FzvipRRHSSROs+cOAH23scrSluWBY3+hnRNI0L4PKA=;
 b=eeV3sSh5oUaMa/ZJ1NPFJMHrhV1C2HGPXtzPrIT2oNFKlHt+kzr8uXlr8rhH7U6Q
 m9v0MegJti+TYWEfGwnxaXHpylL4nQwZ9Yv6N4ZXdUdUecS5ZpD2yRPEhN5kL3Tb+py
 WRyj8WZuHNZf6rsfciTvjwpXna/gAveogE9VNRmM=
Received: by mx.zohomail.com with SMTPS id 1766065367189583.7607797729479;
 Thu, 18 Dec 2025 05:42:47 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chia-I Wu <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 1/3] drm/panthor: Add panthor_*_irq_mask_set helper
Date: Thu, 18 Dec 2025 14:42:42 +0100
Message-ID: <3267470.irdbgypaU6@workhorse>
In-Reply-To: <20251218133825.64177ebf@fedora>
References: <20251217-panthor-tracepoints-v4-0-916186cb8d03@collabora.com>
 <20251217-panthor-tracepoints-v4-1-916186cb8d03@collabora.com>
 <20251218133825.64177ebf@fedora>
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

On Thursday, 18 December 2025 13:38:25 Central European Standard Time Boris Brezillon wrote:
> On Wed, 17 Dec 2025 15:29:38 +0100
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:
> 
> > Add a function to modify an IRQ's mask. If the IRQ is currently active,
> > it will write to the register, otherwise it will only set the struct
> > member.
> > 
> > There's no locking done to guarantee exclusion with the other two
> > functions that touch the IRQ mask, and it should only be called from a
> > context where the circumstances guarantee no concurrent access is
> > performed.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_device.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> > index f35e52b9546a..894d28b3eb02 100644
> > --- a/drivers/gpu/drm/panthor/panthor_device.h
> > +++ b/drivers/gpu/drm/panthor/panthor_device.h
> > @@ -470,6 +470,13 @@ static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
> >  					 panthor_ ## __name ## _irq_threaded_handler,		\
> >  					 IRQF_SHARED, KBUILD_MODNAME "-" # __name,		\
> >  					 pirq);							\
> > +}												\
> > +												\
> > +static inline void panthor_ ## __name ## _irq_mask_set(struct panthor_irq *pirq, u32 mask)	\
> > +{												\
> > +	pirq->mask = mask;									\
> > +	if (!atomic_read(&pirq->suspended))							\
> > +		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, mask);			\
> 
> This is racy if called outside the (threaded) IRQ handler, which I
> believe is the case since its called when a trace point is enabled:
> 
> 1. _irq_raw_handler() sets INT_MASK to zero to avoid receiving
> interrupts from this IRQ line until the threaded handler has processed
> events
> 
> 2. _irq_mask_set() sets INT_MASK to something non-zero, meaning the
> interrupt will be re-enabled before events have been processed

Good catch, I only considered the case where the irq mask is modified
by a PM runtime suspend/resume, not by the actual handler functions
itself.

> this leads to at least one spurious interrupt being received before we
> set INT_MASK to zero again. Probably not the end of the world, but if
> we can avoid it, that'd be better.
> 
> Also, I'd like to see if we could re-purpose panthor_irq::mask to be
> the mask of events the user wants to monitor instead of a pure proxy of
> INT_MASK. If we do that, and we make panthor_irq::mask an atomic_t,

Yeah, I was wondering why panthor_irq::mask changed on IRQ suspend
and resume, since that information is already stored in the
"suspended" atomic.

> we can add panthor_xxx_irq_{enable,disable}_event() helpers that would
> do the atomic_{or,and} on panthor_irq::mask, and write the new value
> to _INT_MASK if:
> - we're processing events in the threaded handler (we would need
>   another field, or we'd need to turn suspended into a state that can
>   encode more than just "suspended or not")

Right, I assume synchronize_irq will not really fix the race,
since a single synchronization point does not a mutually exclusive
section make.

I thought about suspending IRQs, synchronising, then changing the
mask, then re-enabling them, but that feels potentially disruptive.
Though I may be misunderstanding the hardware here; if a bit is
disabled in the INT_MASK and the hardware would want to fire such
an interrupt, does it discard it? Because in that case, any solution
where we suspend IRQs -> wait for threaded handler to finish ->
modify mask -> resume IRQs could lead to us missing out on critical
knowledge, like that a GPU fault occurred.

In a perfect world, this hardware would use a register access
pattern that allows for race-free updates of non-overlapping bits,
like FIELD_PREP_WM16 implements. ;) But we do not live in such a
world.

> - the device is not suspended (that test you already have)
> 
> >  }
> >  
> >  extern struct workqueue_struct *panthor_cleanup_wq;
> > 
> 
> 

Thanks for the review, I'll try to come up with a solution that
won't potentially blow our legs off.

Kind regards,
Nicolas Frattaroli


