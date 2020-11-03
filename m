Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F03322A43AE
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 12:03:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A915D6E15D;
	Tue,  3 Nov 2020 11:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8480A6E15D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 11:03:30 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 211651F4561E;
 Tue,  3 Nov 2020 11:03:29 +0000 (GMT)
Date: Tue, 3 Nov 2020 12:03:26 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3] drm/panfrost: Move the GPU reset bits outside the
 timeout handler
Message-ID: <20201103120326.10037005@collabora.com>
In-Reply-To: <20201103102540.GB401619@phenom.ffwll.local>
References: <20201103081347.1000139-1-boris.brezillon@collabora.com>
 <20201103102540.GB401619@phenom.ffwll.local>
Organization: Collabora
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 3 Nov 2020 11:25:40 +0100
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Tue, Nov 03, 2020 at 09:13:47AM +0100, Boris Brezillon wrote:
> > We've fixed many races in panfrost_job_timedout() but some remain.
> > Instead of trying to fix it again, let's simplify the logic and move
> > the reset bits to a separate work scheduled when one of the queue
> > reports a timeout.
> > 
> > v3:
> > - Replace the atomic_cmpxchg() by an atomic_xchg() (Robin Murphy)
> > - Add Steven's R-b
> > 
> > v2:
> > - Use atomic_cmpxchg() to conditionally schedule the reset work (Steven Price)
> > 
> > Fixes: 1a11a88cfd9a ("drm/panfrost: Fix job timeout handling")
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Reviewed-by: Steven Price <steven.price@arm.com>  
> 
> Sprinkling the dma_fence annotations over this would be really nice ...

You mean something like that?

--->8---
From 4f90ee2972eaec0332833ff6f9ea078acbfa899a Mon Sep 17 00:00:00 2001
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Tue, 3 Nov 2020 12:01:09 +0100
Subject: [PATCH] drm/panfrost: Annotate dma_fence signalling

Annotate dma_fence signalling to help lockdep catch deadlocks.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 569a099dc10e..046cb3677332 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -482,7 +482,9 @@ static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
 
 		if (status & JOB_INT_MASK_DONE(j)) {
 			struct panfrost_job *job;
+			bool cookie;
 
+			cookie = dma_fence_begin_signalling();
 			spin_lock(&pfdev->js->job_lock);
 			job = pfdev->jobs[j];
 			/* Only NULL if job timeout occurred */
@@ -496,6 +498,7 @@ static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
 				pm_runtime_put_autosuspend(pfdev->dev);
 			}
 			spin_unlock(&pfdev->js->job_lock);
+			dma_fence_end_signalling(cookie);
 		}
 
 		status &= ~mask;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
