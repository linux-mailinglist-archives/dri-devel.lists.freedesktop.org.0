Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C618889D6D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 12:43:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F01110E6C0;
	Mon, 25 Mar 2024 11:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="nlzzgBDP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D1810E6C0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 11:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711367028;
 bh=PQqpSAQVvTKSAU+6QHdgIv30W7NSBmCtubL0l2YuySc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nlzzgBDP5Y+vUSxgDEoOrAtbJUhf8CS1eVF3V5KRRCl04tAiZt8e7cKaI8fj9e5bc
 x5BaxsxYvHImCRx+aA4jKQVHyTfjCpU+Dsa9rjXY+zNHu3q5EkahFCcnIZlfdMo2C8
 wvjOz1u3cexeLRy50hFDk1I9oXqHx1jq68DFaFyjOYU5skL3N/8QSS7frAAEn8FL3f
 Zt8NtpQlJnt5Q+Anmby9R05wUEvSxYyAHO0Sy3XZdNw4+yFWKUWdkA+Bs7AF1ILWD0
 6VYgVjtirKZ/kyRY2V7uSHbd2SG7k64Ib3cBeCsmgjFP/tMDlYLEJxSOtrm4DiIxj5
 qvKPz8VUIdefg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C9E213780626;
 Mon, 25 Mar 2024 11:43:47 +0000 (UTC)
Date: Mon, 25 Mar 2024 12:43:46 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH 2/2] drm/panthor: Actually suspend IRQs in the unplug path
Message-ID: <20240325124346.105bbdfc@collabora.com>
In-Reply-To: <d10e71ec-0c1f-4d32-b8f5-53abc3aeba9f@arm.com>
References: <20240325104111.3553712-1-boris.brezillon@collabora.com>
 <20240325104111.3553712-2-boris.brezillon@collabora.com>
 <d10e71ec-0c1f-4d32-b8f5-53abc3aeba9f@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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

On Mon, 25 Mar 2024 11:17:24 +0000
Steven Price <steven.price@arm.com> wrote:

> On 25/03/2024 10:41, Boris Brezillon wrote:
> > panthor_xxx_irq_suspend() doesn't mask the interrupts if drm_dev_unplug()
> > has been called, which is always the case when our panthor_xxx_unplug()
> > helpers are called. Fix that by introducing a panthor_xxx_unplug() helper
> > that does what panthor_xxx_irq_suspend() except it does it
> > unconditionally.
> > 
> > Fixes: 5fe909cae118 ("drm/panthor: Add the device logical block")
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> > Found inadvertently while debugging another issue. I guess I managed to
> > call rmmod during a PING and that led to the FW interrupt handler
> > being executed after the device suspend happened.
> > ---
> >  drivers/gpu/drm/panthor/panthor_device.h | 8 ++++++++
> >  drivers/gpu/drm/panthor/panthor_fw.c     | 2 +-
> >  drivers/gpu/drm/panthor/panthor_gpu.c    | 2 +-
> >  drivers/gpu/drm/panthor/panthor_mmu.c    | 2 +-
> >  4 files changed, 11 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> > index 51c9d61b6796..ba43d5ea4e96 100644
> > --- a/drivers/gpu/drm/panthor/panthor_device.h
> > +++ b/drivers/gpu/drm/panthor/panthor_device.h
> > @@ -321,6 +321,14 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
> >  	return ret;										\
> >  }												\
> >  												\
> > +static inline void panthor_ ## __name ## _irq_unplug(struct panthor_irq *pirq)			\
> > +{												\
> > +	pirq->mask = 0;										\
> > +	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);					\
> > +	synchronize_irq(pirq->irq);								\
> > +	atomic_set(&pirq->suspended, true);							\
> > +}												\
> > +												\  
> 
> This does things in a different order to _irq_suspend, is there a good
> reason?
> I'd expect:
> 
> {
> 	atomic_set(&pirq->suspended, true);
> 	gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);
> 	synchronize_irq(pirq->irq);
> 	pirq->mask = 0;
> }
> 
> In particular I'm wondering if having the atomic_set after
> synchronize_irq() could cause problems with an irq handler changing the
> INT_MASK again (although AFAICT it should end up setting it to 0).

Hm, now that you mention it, I'm wondering if the ordering in
_irq_suspend() is not problematic actually. If we set suspended=true
before anything else in the __irq_suspend() path, and just after than,
an interrupt kicks is. In that case, the hard irq handler will return
IRQ_NONE even though the irqs are not masked (_INT_MASK not zero), which
might lead to an interrupt flood (the interrupt is neither processed nor
masked), which is probably recoverable on a multi-core system
(_irq_suspend() should end up masking the interrupts at some point), but
still not an ideal situation.

Masking the interrupts, synchronizing, and finally flagging the IRQ as
suspended sounds safer for both the suspend and unplug cases. What do
you think?

> 
> Otherwise this change looks good.
> 
> Thanks,
> 
> Steve
> 
> >  static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)			\
> >  {												\
> >  	int cookie;										\
> > diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> > index 33c87a59834e..7a9710a38c5f 100644
> > --- a/drivers/gpu/drm/panthor/panthor_fw.c
> > +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> > @@ -1128,7 +1128,7 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
> >  
> >  	/* Make sure the IRQ handler can be called after that point. */
> >  	if (ptdev->fw->irq.irq)
> > -		panthor_job_irq_suspend(&ptdev->fw->irq);
> > +		panthor_job_irq_unplug(&ptdev->fw->irq);
> >  
> >  	panthor_fw_stop(ptdev);
> >  
> > diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> > index 6dbbc4cfbe7e..b84c5b650fd9 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> > @@ -174,7 +174,7 @@ void panthor_gpu_unplug(struct panthor_device *ptdev)
> >  	unsigned long flags;
> >  
> >  	/* Make sure the IRQ handler is not running after that point. */
> > -	panthor_gpu_irq_suspend(&ptdev->gpu->irq);
> > +	panthor_gpu_irq_unplug(&ptdev->gpu->irq);
> >  
> >  	/* Wake-up all waiters. */
> >  	spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> > index fdd35249169f..1f333cdded0f 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -2622,7 +2622,7 @@ int panthor_vm_prepare_mapped_bos_resvs(struct drm_exec *exec, struct panthor_vm
> >   */
> >  void panthor_mmu_unplug(struct panthor_device *ptdev)
> >  {
> > -	panthor_mmu_irq_suspend(&ptdev->mmu->irq);
> > +	panthor_mmu_irq_unplug(&ptdev->mmu->irq);
> >  
> >  	mutex_lock(&ptdev->mmu->as.slots_lock);
> >  	for (u32 i = 0; i < ARRAY_SIZE(ptdev->mmu->as.slots); i++) {  
> 

