Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 612657FBEA9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 16:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA7510E095;
	Tue, 28 Nov 2023 15:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD70910E095
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 15:54:02 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BB97D66072A4;
 Tue, 28 Nov 2023 15:54:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701186841;
 bh=kX8VFnjMmnUgzzjN92JSyU07DWZZRpGOPGYPIFQv0sI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hlDKx346ueHXtFqp4rG4thCHSpEwBhnnPyznIUhe0IsmQLLDEg6UMSVZfW0TI0F7a
 67uk/P5Mzu4dCCr0hGtRvlwvXObfkHClrlrBQDcOSLenmc7EHauF48DDUOf50uTfwj
 i4K7CsQcUQ5deNunZ7R8h4YMRA86C7foHWkP/foEMPeCx73eba0ApCVo8HbxuC3GQB
 AFS3YeB/T73Kod+k0HdtCa+2ldqcMN4ybpwlGsJC93RvUo8iQ8mwZe/01egy2rOWGa
 DXCuQZ8JoYp/7+4VsEAvjOXm6b1snFUORsOJybic7rnugvRJE127SN6UC+0aa5YoYW
 9CkRSBuHhILWQ==
Date: Tue, 28 Nov 2023 16:53:57 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 3/3] drm/panfrost: Synchronize and disable interrupts
 before powering off
Message-ID: <20231128165357.2c9bfdf1@collabora.com>
In-Reply-To: <f5208c45-54c7-4030-9985-cb7c8f1d6466@collabora.com>
References: <20231128124510.391007-1-angelogioacchino.delregno@collabora.com>
 <20231128124510.391007-4-angelogioacchino.delregno@collabora.com>
 <20231128145712.3f4d3f74@collabora.com>
 <f5208c45-54c7-4030-9985-cb7c8f1d6466@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: linux-kernel@vger.kernel.org, mripard@kernel.org, steven.price@arm.com,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, kernel@collabora.com, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Nov 2023 16:10:45 +0100
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
wrote:

> >>   static void panfrost_job_handle_err(struct panfrost_device *pfdev,
> >>   				    struct panfrost_job *job,
> >>   				    unsigned int js)
> >> @@ -792,9 +800,13 @@ static irqreturn_t panfrost_job_irq_handler_thread(int irq, void *data)
> >>   	struct panfrost_device *pfdev = data;
> >>   
> >>   	panfrost_job_handle_irqs(pfdev);
> >> -	job_write(pfdev, JOB_INT_MASK,
> >> -		  GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |
> >> -		  GENMASK(NUM_JOB_SLOTS - 1, 0));
> >> +
> >> +	/* Enable interrupts only if we're not about to get suspended */
> >> +	if (!test_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspending))  
> > 
> > The irq-line is requested with IRQF_SHARED, meaning the line might be
> > shared between all three GPU IRQs, but also with other devices. I think
> > if we want to be totally safe, we need to also check this is_suspending
> > field in the hard irq handlers before accessing the xxx_INT_yyy
> > registers.
> >   
> 
> This would mean that we would have to force canceling jobs in the suspend
> handler, but if the IRQ never fired, would we still be able to find the
> right bits flipped in JOB_INT_RAWSTAT?

There should be no jobs left if we enter suspend. If there is, that's a
bug we should fix, but I'm digressing.

> 
>  From what I understand, are you suggesting to call, in job_suspend_irq()
> something like
> 
> void panfrost_job_suspend_irq(struct panfrost_device *pfdev)
> {
>          u32 status;
> 
> 	set_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspending);
> 
> 	job_write(pfdev, JOB_INT_MASK, 0);
> 	synchronize_irq(pfdev->js->irq);
> 
> 	status = job_read(pfdev, JOB_INT_STAT);

I guess you meant _RAWSTAT. _STAT should always be zero after we've
written 0 to _INT_MASK.

> 	if (status)
> 		panfrost_job_irq_handler_thread(pfdev->js->irq, (void*)pfdev);

Nope, we don't need to read the STAT reg and forcibly call the threaded
handler if it's != 0. The synchronize_irq() call should do exactly that
(make sure all pending interrupts are processed before returning), and
our previous job_write(pfdev, JOB_INT_MASK, 0) guarantees that no new
interrupts will kick in after that point.

> }
> 
> and then while still retaining the check in the IRQ thread handler, also
> check it in the hardirq handler like
> 
> static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
> {
> 	struct panfrost_device *pfdev = data;
> 	u32 status;
> 
> 	if (!test_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspending))
> 		return IRQ_NONE;

Yes, that's the extra check I was talking about, and that's also the
very reason I'm suggesting to call this field suspended_irqs instead of
is_suspending. Ultimately, each bit in this bitmap encodes the status
of a specific IRQ, not the transition from active-to-suspended,
otherwise we'd be clearing the bit at the end of
panfrost_job_suspend_irq(), right after the synchronize_irq(). But if
we were doing that, our hard IRQ handler could be called because other
devices raised an interrupt on the very same IRQ line while we are
suspended, and we'd be doing an invalid GPU reg read while the
clks/power-domains are off.

> 
> 	status = job_read(pfdev, JOB_INT_STAT);
> 	if (!status)
> 	        return IRQ_NONE;
> 
> 	job_write(pfdev, JOB_INT_MASK, 0);
> 	return IRQ_WAKE_THREAD;
> }
> 
> (rinse and repeat for panfrost_mmu)
> 
> ..or am I misunderstanding you?
> 
> Cheers,
> Angelo
> 
> 

