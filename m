Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0E630A82B
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 13:59:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9836E58A;
	Mon,  1 Feb 2021 12:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E396E58A
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 12:59:07 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B15BB1F4496D;
 Mon,  1 Feb 2021 12:59:05 +0000 (GMT)
Date: Mon, 1 Feb 2021 13:59:02 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 3/3] drm/panfrost: Stay in the threaded MMU IRQ handler
 until we've handled all IRQs
Message-ID: <20210201135902.6798a203@collabora.com>
In-Reply-To: <ecf5fb35-fd3b-5980-5eb0-fba36d6bd83f@arm.com>
References: <20210201082116.267208-1-boris.brezillon@collabora.com>
 <20210201082116.267208-4-boris.brezillon@collabora.com>
 <ecf5fb35-fd3b-5980-5eb0-fba36d6bd83f@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 1 Feb 2021 12:13:49 +0000
Steven Price <steven.price@arm.com> wrote:

> On 01/02/2021 08:21, Boris Brezillon wrote:
> > Doing a hw-irq -> threaded-irq round-trip is counter-productive, stay
> > in the threaded irq handler as long as we can.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
> 
> Looks fine to me, but I'm interested to know if you actually saw a 
> performance improvement. Back-to-back MMU faults should (hopefully) be 
> fairly uncommon.

I actually didn't check the perf improvement or the actual number of
back-to-back MMU faults, but
dEQP-GLES31.functional.draw_indirect.compute_interop.large.drawelements_combined_grid_1000x1000_drawcount_5000
seemed to generate a few of those, so I thought it'd be good to
optimize that case given how trivial it is.

> 
> Regardless:
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> 
> > ---
> >   drivers/gpu/drm/panfrost/panfrost_mmu.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> > index 21e552d1ac71..65bc20628c4e 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> > @@ -580,6 +580,8 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
> >   	u32 status = mmu_read(pfdev, MMU_INT_RAWSTAT);
> >   	int i, ret;
> >   
> > +again:
> > +
> >   	for (i = 0; status; i++) {
> >   		u32 mask = BIT(i) | BIT(i + 16);
> >   		u64 addr;
> > @@ -628,6 +630,11 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
> >   		status &= ~mask;
> >   	}
> >   
> > +	/* If we received new MMU interrupts, process them before returning. */
> > +	status = mmu_read(pfdev, MMU_INT_RAWSTAT);
> > +	if (status)
> > +		goto again;
> > +
> >   	mmu_write(pfdev, MMU_INT_MASK, ~0);
> >   	return IRQ_HANDLED;
> >   };
> >   
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
