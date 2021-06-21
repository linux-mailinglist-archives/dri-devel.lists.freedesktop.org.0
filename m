Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0588A3AEC77
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 17:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 348346E1EC;
	Mon, 21 Jun 2021 15:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE436E1EC
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 15:32:58 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 55E0D1F4234E;
 Mon, 21 Jun 2021 16:32:57 +0100 (BST)
Date: Mon, 21 Jun 2021 17:32:54 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 05/12] drm/panfrost: Disable the AS on unhandled page
 faults
Message-ID: <20210621173254.0bad6dde@collabora.com>
In-Reply-To: <34ff5093-3f4b-d0fc-0d16-0328fc088d8a@arm.com>
References: <20210621133907.1683899-1-boris.brezillon@collabora.com>
 <20210621133907.1683899-6-boris.brezillon@collabora.com>
 <34ff5093-3f4b-d0fc-0d16-0328fc088d8a@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
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
Cc: dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Jun 2021 16:09:32 +0100
Steven Price <steven.price@arm.com> wrote:

> On 21/06/2021 14:39, Boris Brezillon wrote:
> > If we don't do that, we have to wait for the job timeout to expire
> > before the fault jobs gets killed.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
> 
> Don't we need to do something here to allow recovery of the MMU context
> in the future? panfrost_mmu_disable() will zero out the MMU registers on
> the hardware, but AFAICS panfrost_mmu_enable() won't be called to
> restore the values until something evicts the address space (GPU power
> down/reset or just too many other processes).
> 
> The ideal would be to block submission of new jobs from this context and
> then wait until existing jobs have completed at which point the MMU
> state can be restored and jobs allowed again.

Uh, I assumed it'd be okay to have subsequent jobs coming from
this context to fail with a BUS_FAULT until the context is closed. But
what you suggest seems more robust.

> 
> But at a minimum I think we should have something like an 'MMU poisoned'
> bit that panfrost_mmu_as_get() can check.
> 
> Steve
> 
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_mmu.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> > index 2a9bf30edc9d..d5c624e776f1 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> > @@ -661,7 +661,7 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
> >  		if ((status & mask) == BIT(as) && (exception_type & 0xF8) == 0xC0)
> >  			ret = panfrost_mmu_map_fault_addr(pfdev, as, addr);
> >  
> > -		if (ret)
> > +		if (ret) {
> >  			/* terminal fault, print info about the fault */
> >  			dev_err(pfdev->dev,
> >  				"Unhandled Page fault in AS%d at VA 0x%016llX\n"
> > @@ -679,6 +679,10 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
> >  				access_type, access_type_name(pfdev, fault_status),
> >  				source_id);
> >  
> > +			/* Disable the MMU to stop jobs on this AS immediately */
> > +			panfrost_mmu_disable(pfdev, as);
> > +		}
> > +
> >  		status &= ~mask;
> >  
> >  		/* If we received new MMU interrupts, process them before returning. */
> >   
> 

