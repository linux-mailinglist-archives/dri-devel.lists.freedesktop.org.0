Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B22FC2A43BC
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 12:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635E16E3B7;
	Tue,  3 Nov 2020 11:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84C46E3B7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 11:08:51 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h22so12370289wmb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 03:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XeBi6ALE7giUjkja8M9G6EY6GTINE8ijRP7xdqDtyEc=;
 b=W6/6CBR9dGL9xtQMFIHuFY2u3TUbz/9anygbLkyU0JtbGaUErnNGiRl/xho40GiNdE
 iz0DIL1Fa17239Iuq29Kt6WAycT8wNg7Q0aA8zblTXRBF9CoRsS9qI3S7/Gr4od1KC8F
 nU57IAUNe1zJOgkhoQ7PO8031dlUWlP+I0/wg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XeBi6ALE7giUjkja8M9G6EY6GTINE8ijRP7xdqDtyEc=;
 b=cJBCSvdPBrj15XXAsUb1eS+rJ7GXAHgJ9RLfXBVihb4hOdirXm5BEAIUp95cqSRE0h
 qNuuxZvfolrmEUCtTvWqqxHWDgv6G3AegCt1D8urC2eCT+PMLzpH2OF+XbG4GmQU++OH
 G0/3/pIh+fu2hhlpvuIszewDdhgSGqJbIjKvqKLqO6CJBTSVI57DYTHBWIEmiUMswt/s
 hpkT/XCh+kbN32Gq5AM5Of0d2LK+yeqKKu/xMBN74i5L7xWtzZUAyPraJPozl1zUwPbX
 70o8TTxiD/UaOTR50khHaxnLsBfSxID9urEOyo/prRLbSqvY2MhcosMfnuWpY4fhtogT
 iPzw==
X-Gm-Message-State: AOAM531g7fNVjMOxrzWRgHe6dJLtHHtPL3drea8BObX4tphZnbZZqhBk
 Ve9/KDOEeJPtP5ismSHZoSwkYh94OjkKghnj
X-Google-Smtp-Source: ABdhPJzqCrMIt19shYM7yXoul6WALo/kJKLEzcJYdefyUaCZ9Pm7J9+b3bH4HAOYyaBdgukK3QNhfg==
X-Received: by 2002:a7b:c3d5:: with SMTP id t21mr2842222wmj.37.1604401730371; 
 Tue, 03 Nov 2020 03:08:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o184sm2534443wmo.37.2020.11.03.03.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 03:08:49 -0800 (PST)
Date: Tue, 3 Nov 2020 12:08:47 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3] drm/panfrost: Move the GPU reset bits outside the
 timeout handler
Message-ID: <20201103110847.GG401619@phenom.ffwll.local>
References: <20201103081347.1000139-1-boris.brezillon@collabora.com>
 <20201103102540.GB401619@phenom.ffwll.local>
 <20201103120326.10037005@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103120326.10037005@collabora.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 03, 2020 at 12:03:26PM +0100, Boris Brezillon wrote:
> On Tue, 3 Nov 2020 11:25:40 +0100
> Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Tue, Nov 03, 2020 at 09:13:47AM +0100, Boris Brezillon wrote:
> > > We've fixed many races in panfrost_job_timedout() but some remain.
> > > Instead of trying to fix it again, let's simplify the logic and move
> > > the reset bits to a separate work scheduled when one of the queue
> > > reports a timeout.
> > > 
> > > v3:
> > > - Replace the atomic_cmpxchg() by an atomic_xchg() (Robin Murphy)
> > > - Add Steven's R-b
> > > 
> > > v2:
> > > - Use atomic_cmpxchg() to conditionally schedule the reset work (Steven Price)
> > > 
> > > Fixes: 1a11a88cfd9a ("drm/panfrost: Fix job timeout handling")
> > > Cc: <stable@vger.kernel.org>
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > Reviewed-by: Steven Price <steven.price@arm.com>  
> > 
> > Sprinkling the dma_fence annotations over this would be really nice ...
> 
> You mean something like that?

That's just the irq annotations, i.e. the one that's already guaranteed by
the irq vs. locks checks. So this does nothing.

What I mean is annotating your new reset work (it's part of the critical
path to complete batches, since it's holding up other batches that are
stuck in the scheduler still), and the drm/scheduler annotations I've
floated a while ago. The drm/scheduler annotations are stuck somewhat for
lack of feedback from any of the driver teams using it though :-/

The thing is pulling something out into a worker of it's own generally
doesn't fix any deadlocks, it just hides them from lockdep. So it would be
good to make sure lockdep can see through your maze again.
-Daniel

> 
> --->8---
> From 4f90ee2972eaec0332833ff6f9ea078acbfa899a Mon Sep 17 00:00:00 2001
> From: Boris Brezillon <boris.brezillon@collabora.com>
> Date: Tue, 3 Nov 2020 12:01:09 +0100
> Subject: [PATCH] drm/panfrost: Annotate dma_fence signalling
> 
> Annotate dma_fence signalling to help lockdep catch deadlocks.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_job.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 569a099dc10e..046cb3677332 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -482,7 +482,9 @@ static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
>  
>  		if (status & JOB_INT_MASK_DONE(j)) {
>  			struct panfrost_job *job;
> +			bool cookie;
>  
> +			cookie = dma_fence_begin_signalling();
>  			spin_lock(&pfdev->js->job_lock);
>  			job = pfdev->jobs[j];
>  			/* Only NULL if job timeout occurred */
> @@ -496,6 +498,7 @@ static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
>  				pm_runtime_put_autosuspend(pfdev->dev);
>  			}
>  			spin_unlock(&pfdev->js->job_lock);
> +			dma_fence_end_signalling(cookie);
>  		}
>  
>  		status &= ~mask;

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
