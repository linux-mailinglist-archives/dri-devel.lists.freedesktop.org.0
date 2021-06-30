Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5954B3B84DA
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 16:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A216E9E7;
	Wed, 30 Jun 2021 14:15:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 639506E9E9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 14:15:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C2016D;
 Wed, 30 Jun 2021 07:15:00 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B09EA3F718;
 Wed, 30 Jun 2021 07:14:58 -0700 (PDT)
Subject: Re: [PATCH v6 14/16] drm/panfrost: Kill in-flight jobs on FD close
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20210630062751.2832545-1-boris.brezillon@collabora.com>
 <20210630062751.2832545-15-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <dc7ed3ca-a30d-8288-8ab4-ef0d2c50301e@arm.com>
Date: Wed, 30 Jun 2021 15:14:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630062751.2832545-15-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/06/2021 07:27, Boris Brezillon wrote:
> If the process who submitted these jobs decided to close the FD before
> the jobs are done it probably means it doesn't care about the result.
> 
> v5:
> * Add a panfrost_exception_is_fault() helper and the
>   DRM_PANFROST_EXCEPTION_MAX_NON_FAULT value
> 
> v4:
> * Don't disable/restore irqs when taking the job_lock (not needed since
>   this lock is never taken from an interrupt context)
> 
> v3:
> * Set fence error to ECANCELED when a TERMINATED exception is received
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_device.h |  7 ++++
>  drivers/gpu/drm/panfrost/panfrost_job.c    | 42 ++++++++++++++++++----
>  2 files changed, 43 insertions(+), 6 deletions(-)

The panfrost_exception_is_fault() makes the code much more readable -
thanks!

Reviewed-by: Steven Price <steven.price@arm.com>

> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 68e93b7e5b61..193cd87f643c 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -184,6 +184,7 @@ enum drm_panfrost_exception_type {
>  	DRM_PANFROST_EXCEPTION_KABOOM = 0x05,
>  	DRM_PANFROST_EXCEPTION_EUREKA = 0x06,
>  	DRM_PANFROST_EXCEPTION_ACTIVE = 0x08,
> +	DRM_PANFROST_EXCEPTION_MAX_NON_FAULT = 0x3f,
>  	DRM_PANFROST_EXCEPTION_JOB_CONFIG_FAULT = 0x40,
>  	DRM_PANFROST_EXCEPTION_JOB_POWER_FAULT = 0x41,
>  	DRM_PANFROST_EXCEPTION_JOB_READ_FAULT = 0x42,
> @@ -244,6 +245,12 @@ enum drm_panfrost_exception_type {
>  	DRM_PANFROST_EXCEPTION_MEM_ATTR_NONCACHE_3 = 0xef,
>  };
>  
> +static inline bool
> +panfrost_exception_is_fault(u32 exception_code)
> +{
> +	return exception_code > DRM_PANFROST_EXCEPTION_MAX_NON_FAULT;
> +}
> +
>  const char *panfrost_exception_name(u32 exception_code);
>  bool panfrost_exception_needs_reset(const struct panfrost_device *pfdev,
>  				    u32 exception_code);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index cf5f9e8b2a27..8a0db9571bfd 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -483,14 +483,21 @@ static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
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
> +			if (!panfrost_exception_is_fault(js_status)) {
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
> @@ -499,7 +506,16 @@ static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
>  			if (panfrost_exception_needs_reset(pfdev, js_status)) {
>  				drm_sched_fault(&pfdev->js->queue[j].sched);
>  			} else {
> -				dma_fence_set_error(pfdev->jobs[j]->done_fence, -EINVAL);
> +				int error = 0;
> +
> +				if (js_status == DRM_PANFROST_EXCEPTION_TERMINATED)
> +					error = -ECANCELED;
> +				else if (panfrost_exception_is_fault(js_status))
> +					error = -EINVAL;
> +
> +				if (error)
> +					dma_fence_set_error(pfdev->jobs[j]->done_fence, error);
> +
>  				status |= JOB_INT_MASK_DONE(j);
>  			}
>  		}
> @@ -665,10 +681,24 @@ int panfrost_job_open(struct panfrost_file_priv *panfrost_priv)
>  
>  void panfrost_job_close(struct panfrost_file_priv *panfrost_priv)
>  {
> +	struct panfrost_device *pfdev = panfrost_priv->pfdev;
>  	int i;
>  
>  	for (i = 0; i < NUM_JOB_SLOTS; i++)
>  		drm_sched_entity_destroy(&panfrost_priv->sched_entity[i]);
> +
> +	/* Kill in-flight jobs */
> +	spin_lock(&pfdev->js->job_lock);
> +	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> +		struct drm_sched_entity *entity = &panfrost_priv->sched_entity[i];
> +		struct panfrost_job *job = pfdev->jobs[i];
> +
> +		if (!job || job->base.entity != entity)
> +			continue;
> +
> +		job_write(pfdev, JS_COMMAND(i), JS_COMMAND_HARD_STOP);
> +	}
> +	spin_unlock(&pfdev->js->job_lock);
>  }
>  
>  int panfrost_job_is_idle(struct panfrost_device *pfdev)
> 

