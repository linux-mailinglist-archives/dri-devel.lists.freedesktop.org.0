Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6544B755EBF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 10:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74E110E207;
	Mon, 17 Jul 2023 08:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147F810E210
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 08:50:00 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 594516607008;
 Mon, 17 Jul 2023 09:49:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689583799;
 bh=QDZb5oECE4ZPZwxLevZAr+YTPMqzqUQK1uRiTAydYYo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eY3u/pMv5AaSYp+AGPVkzf3zNrwfP/OFdGjq1vVFjSkcDpkp/gQuubNcb/eDMDWfv
 V3CSs7gzgpgAdxYpV6eBAIrizCL+Vrd25w+dmDoHAV7QuxAFecXcxEqgL8paY6xlzu
 9OMzT4NXqLhz+DMdwpXKrWbLIKoGWvCz+njx021j51FwBubYm51aGaYp5MhrEGc5bn
 mPR3ccouLd+2oNP0cV/CXIQwTO+m7eDtBAbcX3EPpClxlUd/nBVRzQ3IM/q8TT0nbI
 goEf3TDx0biKyGNVvkIHXnSwk+GEOBrIspbtpGbmvDggwpsvFQC6t9z9XvGnIYgvA6
 s8ZU/QZK7Bp9g==
Date: Mon, 17 Jul 2023 10:49:55 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v1] drm/panfrost: Sync IRQ by job's timeout handler
Message-ID: <20230717104955.268d84a8@collabora.com>
In-Reply-To: <0b527996-342b-da44-61dd-38743db80cda@arm.com>
References: <20230717065254.1061033-1-dmitry.osipenko@collabora.com>
 <20230717090506.2ded4594@collabora.com>
 <80de081a-e443-85a2-1a61-6a8885e8d529@collabora.com>
 <20230717094905.7a1ee007@collabora.com>
 <0b527996-342b-da44-61dd-38743db80cda@arm.com>
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
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 17 Jul 2023 09:06:56 +0100
Steven Price <steven.price@arm.com> wrote:

> On 17/07/2023 08:49, Boris Brezillon wrote:
> > On Mon, 17 Jul 2023 10:20:02 +0300
> > Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> >   
> >> Hi,
> >>
> >> On 7/17/23 10:05, Boris Brezillon wrote:  
> >>> Hi Dmitry,
> >>>
> >>> On Mon, 17 Jul 2023 09:52:54 +0300
> >>> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> >>>     
> >>>> Panfrost IRQ handler may stuck for a long time, for example this happens
> >>>> when there is a bad HDMI connection and HDMI handler takes a long time to
> >>>> finish processing, holding Panfrost. Make Panfrost's job timeout handler
> >>>> to sync IRQ before checking fence signal status in order to prevent
> >>>> spurious job timeouts due to a slow IRQ processing.    
> >>>
> >>> Feels like the problem should be fixed in the HDMI encoder driver
> >>> instead, so it doesn't stall the whole system when processing its
> >>> IRQs (use threaded irqs, maybe). I honestly don't think blocking in the
> >>> job timeout path to flush IRQs is a good strategy.    
> >>
> >> The syncing is necessary to have for correctness regardless of whether
> >> it's HDMI problem or something else, there could be other reasons for
> >> CPU to delay IRQ processing. It's wrong to say that hw is hung, while
> >> it's not.  
> > 
> > Well, hardware is effectively hung, if not indefinitely, at least
> > temporarily. All you do here is block in the timeout handler path
> > waiting for the GPU interrupt handlers to finish, handler that's
> > probably waiting in the queue, because the raw HDMI handler is blocking
> > it somehow. So, in the end, you might just be delaying the time of HWR a
> > bit more. I know it's not GPU's fault in that case, and the job could
> > have finished in time if the HDMI encoder hadn't stall the interrupt
> > handling pipeline, but I'm not sure we should care for that specific
> > situation. And more importantly, if it took more than 500ms to get a
> > frame rendered (or, in that case, to get the event that a frame is
> > rendered), you already lost, so I'm not sure correctness matters:
> > rendering didn't make it in time, and the watchdog kicked in to try and
> > unblock the situation. Feels like we're just papering over an HDMI
> > encoder driver bug here, really.  
> 
> TLDR; I don't see any major downsides and it stops the GPU getting the 
> blame for something that isn't its fault.

True, but doing that will also give the impression that things run fine,
but very slowly, which would put the blame on the userspace driver :P.

> 
> I guess the question is whether panfrost should work on a system which 
> has terrible IRQ latency. At the moment we have a synchronize_irq() call 
> in panfrost_reset() which effectively does the same thing, but with all 
> the overhead/spew of resetting the GPU.

Unless I'm mistaken, the synchronize_irq() in panfrost_reset() is
mostly here to make sure there's no race between the interrupt
handler and the reset logic (we mask interrupts, and then synchronize,
guaranteeing that the interrupt handler won't be running after that
point), and it happens after we've printed the error message, so the
user knows something was blocked at least.

> 
> Of course in the case Dmitry is actually talking about - it does seem 
> like the HDMI encoder has a bug which needs fixing. There are plenty of 
> other things that will break if IRQ latency gets that bad.

Yes, that's my point. The GPU driver is the only one to complain right
now, but the HDMI encoder behavior could be impacting other parts of
the system. Silently ignoring those weirdnesses sounds like a terrible
idea.

> 
> I do wonder if it makes sense to only synchronize when it's needed, 
> e.g.:
> 
> ----8<---
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index dbc597ab46fb..d96266b74e5c 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -720,6 +720,12 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
>  	if (dma_fence_is_signaled(job->done_fence))
>  		return DRM_GPU_SCHED_STAT_NOMINAL;
>  
> +	/* Synchronize with the IRQ handler in case the IRQ latency is bad */
> +	synchronize_irq(pfdev->js->irq);
> +	/* Recheck if the job is now complete */
> +	if (dma_fence_is_signaled(job->done_fence))
> +		return DRM_GPU_SCHED_STAT_NOMINAL;
> +
>  	dev_err(pfdev->dev, "gpu sched timeout, js=%d, config=0x%x, status=0x%x, head=0x%x, tail=0x%x, sched_job=%p",
>  		js,
>  		job_read(pfdev, JS_CONFIG(js)),
> ----8<---
> 
> I don't have any data as to how often we hit the case where the DRM 
> scheduler calls the timeout but we've already signalled - so the extra 
> check might be overkill.

Right, it's not so much about the overhead of the synchronize_irq()
call (even though my first reply complained about that :-)), but more
about silently ignoring system misbehaviors. So I guess I'd be fine with
a version printing a dev_warn("Unexpectedly high interrupt latency")
when synchronize_irq() unblocks the situation, which means you'd still
have to do it in two steps.
