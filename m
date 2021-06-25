Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DA53B44B0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 15:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78AA36EDE1;
	Fri, 25 Jun 2021 13:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36176EDE1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 13:43:48 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1lwm7X-0003lh-3G; Fri, 25 Jun 2021 15:43:47 +0200
Message-ID: <595cfd158a03c0c22af8bb6d186da43fd12c99ac.camel@pengutronix.de>
Subject: Re: [PATCH v3 14/15] drm/panfrost: Kill in-flight jobs on FD close
From: Lucas Stach <l.stach@pengutronix.de>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 dri-devel@lists.freedesktop.org
Date: Fri, 25 Jun 2021 15:43:45 +0200
In-Reply-To: <20210625133327.2598825-15-boris.brezillon@collabora.com>
References: <20210625133327.2598825-1-boris.brezillon@collabora.com>
 <20210625133327.2598825-15-boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, dem 25.06.2021 um 15:33 +0200 schrieb Boris Brezillon:
> If the process who submitted these jobs decided to close the FD before
> the jobs are done it probably means it doesn't care about the result.
> 
> v3:
> * Set fence error to ECANCELED when a TERMINATED exception is received
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_job.c | 43 +++++++++++++++++++++----
>  1 file changed, 37 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 948bd174ff99..aa1e6542adde 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -498,14 +498,21 @@ static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
>  
>  		if (status & JOB_INT_MASK_ERR(j)) {
>  			u32 js_status = job_read(pfdev, JS_STATUS(j));
> +			const char *exception_name = panfrost_exception_name(js_status);
>  
>  			job_write(pfdev, JS_COMMAND_NEXT(j), JS_COMMAND_NOP);
>  
> -			dev_err(pfdev->dev, "js fault, js=%d, status=%s, head=0x%x, tail=0x%x",
> -				j,
> -				panfrost_exception_name(js_status),
> -				job_read(pfdev, JS_HEAD_LO(j)),
> -				job_read(pfdev, JS_TAIL_LO(j)));
> +			if (js_status < DRM_PANFROST_EXCEPTION_JOB_CONFIG_FAULT) {
> +				dev_dbg(pfdev->dev, "js interrupt, js=%d, status=%s, head=0x%x, tail=0x%x",
> +					j, exception_name,
> +					job_read(pfdev, JS_HEAD_LO(j)),
> +					job_read(pfdev, JS_TAIL_LO(j)));
> +			} else {
> +				dev_err(pfdev->dev, "js fault, js=%d, status=%s, head=0x%x, tail=0x%x",
> +					j, exception_name,
> +					job_read(pfdev, JS_HEAD_LO(j)),
> +					job_read(pfdev, JS_TAIL_LO(j)));
> +			}
>  
>  			/* If we need a reset, signal it to the timeout
>  			 * handler, otherwise, update the fence error field and
> @@ -514,7 +521,16 @@ static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
>  			if (panfrost_exception_needs_reset(pfdev, js_status)) {
>  				drm_sched_fault(&pfdev->js->queue[j].sched);
>  			} else {
> -				dma_fence_set_error(pfdev->jobs[j]->done_fence, -EINVAL);
> +				int error = 0;
> +
> +				if (js_status == DRM_PANFROST_EXCEPTION_TERMINATED)
> +					error = -ECANCELED;
> +				else if (js_status >= DRM_PANFROST_EXCEPTION_JOB_CONFIG_FAULT)
> +					error = -EINVAL;
> +
> +				if (error)
> +					dma_fence_set_error(pfdev->jobs[j]->done_fence, error);
> +
>  				status |= JOB_INT_MASK_DONE(j);
>  			}
>  		}
> @@ -673,10 +689,25 @@ int panfrost_job_open(struct panfrost_file_priv *panfrost_priv)
>  
>  void panfrost_job_close(struct panfrost_file_priv *panfrost_priv)
>  {
> +	struct panfrost_device *pfdev = panfrost_priv->pfdev;
> +	unsigned long flags;
>  	int i;
>  
>  	for (i = 0; i < NUM_JOB_SLOTS; i++)
>  		drm_sched_entity_destroy(&panfrost_priv->sched_entity[i]);
> +
> +	/* Kill in-flight jobs */
> +	spin_lock_irqsave(&pfdev->js->job_lock, flags);

Micro-optimization, but this code is never called from IRQ context, so
a spin_lock_irq would do here, no need to save/restore flags.

Regards,
Lucas

> +	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> +		struct drm_sched_entity *entity = &panfrost_priv->sched_entity[i];
> +		struct panfrost_job *job = pfdev->jobs[i];
> +
> +		if (!job || job->base.entity != entity)
> +			continue;
> +
> +		job_write(pfdev, JS_COMMAND(i), JS_COMMAND_HARD_STOP);
> +	}
> +	spin_unlock_irqrestore(&pfdev->js->job_lock, flags);
>  }
>  
>  int panfrost_job_is_idle(struct panfrost_device *pfdev)


