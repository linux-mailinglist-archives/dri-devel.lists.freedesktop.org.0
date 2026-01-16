Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC5FD32C93
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 15:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A00DE10E8AB;
	Fri, 16 Jan 2026 14:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="K1yC3wA6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BBAC10E8AB
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 14:41:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768574476; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=LnSj/SBpPgwlqC/pTiyO/PaY2pzQ/4KesumefifE7g/DB9vXPXSvgkuZAn3txjbRtbARAAEJxhkZbKfknSXj0OcyXlWR/X/1Y2KP3K2LUevHfU+rkffjXKJMQzBZDPq+UQwoO8YyY1QL77BA1Jv5RQ7xW6QKqUHHPk4yRdHRlVA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768574476;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=NbsMjfAm8Ysrq+yLoTmaeRgUki8y5apISJJJdwZuxaA=; 
 b=KPPzSdowq1LGW3Z6myZ2qD1nPvk8/pjChB1763qtG9RhY3LW4I0oFoQzj0LDSIJVIHQXjXSAD3gKD2Q8kAnFogpc10WgxUT1BEsye28ycGv3APLhIVYul28giOaGCArMXeJTn63Nm+F85UqxzMlKjaDsxOpzjZ6e+iYnFQiKpaU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768574476; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=NbsMjfAm8Ysrq+yLoTmaeRgUki8y5apISJJJdwZuxaA=;
 b=K1yC3wA6YsKUcPPP2Yvap5/+/GxXQk1QB86gNSeGfG3egF7dBW4hPXwOO9AJuEGk
 c4tBCmbjV3XQAWLWsDMgO2ca0RDVnzJDhssICgRDVW2uwQzi6HPXwc1e2JbxY7gnfSz
 Dd6vGJqHpvxZzX+MmAeGOsFy4GfZHsPdXDLnajkw=
Received: by mx.zohomail.com with SMTPS id 1768574474564548.2088433723058;
 Fri, 16 Jan 2026 06:41:14 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chia-I Wu <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v10 2/4] drm/panthor: Extend IRQ helpers for mask
 modification/restoration
Date: Fri, 16 Jan 2026 15:41:08 +0100
Message-ID: <13685405.O9o76ZdvQC@workhorse>
In-Reply-To: <20260116144158.4a3fcdcc@fedora>
References: <20260116-panthor-tracepoints-v10-0-d925986e3d1b@collabora.com>
 <20260116-panthor-tracepoints-v10-2-d925986e3d1b@collabora.com>
 <20260116144158.4a3fcdcc@fedora>
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

On Friday, 16 January 2026 14:41:58 Central European Standard Time Boris Brezillon wrote:
> On Fri, 16 Jan 2026 13:57:31 +0100
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
> > aforementioned new helpers: enable_events, and disable_events. They work
> > by ORing and NANDing the mask bits.
> > 
> > resume is changed to no longer have a mask passed, as pirq->mask is
> > supposed to be the user-requested mask now, rather than a mirror of the
> > INT_MASK register contents. Users of the resume helper are adjusted
> > accordingly, including a rather painful refactor in panthor_mmu.c.
> > 
> > In panthor_mmu.c, the bespoke mask modification is excised, and replaced
> > with enable_events/disable_events in as_enable/as_disable.
> > 
> > Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Just one question below.
> 
> > ---
> >  drivers/gpu/drm/panthor/panthor_device.h | 86 ++++++++++++++++++++++++++------
> >  drivers/gpu/drm/panthor/panthor_fw.c     |  3 +-
> >  drivers/gpu/drm/panthor/panthor_gpu.c    |  2 +-
> >  drivers/gpu/drm/panthor/panthor_mmu.c    | 47 ++++++++---------
> >  drivers/gpu/drm/panthor/panthor_pwr.c    |  2 +-
> >  5 files changed, 98 insertions(+), 42 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> > index 8597b388cc40..8664adb1febf 100644
> > --- a/drivers/gpu/drm/panthor/panthor_device.h
> > +++ b/drivers/gpu/drm/panthor/panthor_device.h
> > @@ -84,9 +84,19 @@ struct panthor_irq {
> >  	/** @irq: IRQ number. */
> >  	int irq;
> >  
> > -	/** @mask: Current mask being applied to xxx_INT_MASK. */
> > +	/** @mask: Values to write to xxx_INT_MASK if active. */
> >  	u32 mask;
> >  
> > +	/**
> > +	 * @mask_lock: protects modifications to _INT_MASK and @mask.
> > +	 *
> > +	 * In paths where _INT_MASK is updated based on a state
> > +	 * transition/check, it's crucial for the state update/check to be
> > +	 * inside the locked section, otherwise it introduces a race window
> > +	 * leading to potential _INT_MASK inconsistencies.
> > +	 */
> > +	spinlock_t mask_lock;
> > +
> >  	/** @state: one of &enum panthor_irq_state reflecting the current state. */
> >  	atomic_t state;
> >  };
> > @@ -425,13 +435,14 @@ static irqreturn_t panthor_ ## __name ## _irq_raw_handler(int irq, void *data)
> >  	if (!gpu_read(ptdev, __reg_prefix ## _INT_STAT))					\
> >  		return IRQ_NONE;								\
> >  												\
> > +	guard(spinlock_irqsave)(&pirq->mask_lock);						\
> > +	gpu_write(ptdev, __reg_prefix ## _INT_MASK, 0);						\
> >  	old_state = atomic_cmpxchg(&pirq->state,						\
> >  				   PANTHOR_IRQ_STATE_ACTIVE,					\
> >  				   PANTHOR_IRQ_STATE_PROCESSING);				\
> >  	if (old_state != PANTHOR_IRQ_STATE_ACTIVE)						\
> >  		return IRQ_NONE;								\
> >  												\
> > -	gpu_write(ptdev, __reg_prefix ## _INT_MASK, 0);						\
> 
> Is moving this INT_MASK=0 before the atomic_cmpxchg() is really
> required. It's harmless of course, because of the lock surrounding the
> state + INT_MASK update, but I was wondering if there was another
> reason for doing that that I'm missing.

That was your change, not mine. :) It surprised me as well but I
looked at how this plays out, and in essence it shouldn't make
a difference. Every state where we're not IRQ_STATE_ACTIVE, the mask
will already be 0.

If I need to send a v11 for other reasons, I can
revert this change though if it was accidental.

> 
> >  	return IRQ_WAKE_THREAD;									\
> >  }												\
> 
> 




