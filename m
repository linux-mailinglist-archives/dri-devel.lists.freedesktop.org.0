Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C4B3AEC52
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 17:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784AD6E1D6;
	Mon, 21 Jun 2021 15:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B18C06E1D6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 15:26:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 418471042;
 Mon, 21 Jun 2021 08:26:20 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 332CD3F694;
 Mon, 21 Jun 2021 08:26:19 -0700 (PDT)
Subject: Re: [PATCH v2 09/12] drm/panfrost: Don't reset the GPU on job faults
 unless we really have to
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20210621133907.1683899-1-boris.brezillon@collabora.com>
 <20210621133907.1683899-10-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <2d9023e2-295a-4b3d-9fe3-e6dd605deaac@arm.com>
Date: Mon, 21 Jun 2021 16:26:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210621133907.1683899-10-boris.brezillon@collabora.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/06/2021 14:39, Boris Brezillon wrote:
> If we can recover from a fault without a reset there's no reason to
> issue one.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c |  9 ++++++
>  drivers/gpu/drm/panfrost/panfrost_device.h |  2 ++
>  drivers/gpu/drm/panfrost/panfrost_job.c    | 35 ++++++++++++++--------
>  3 files changed, 34 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index 2de011cee258..ac76e8646e97 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -383,6 +383,15 @@ int panfrost_exception_to_error(u32 exception_code)
>  	return panfrost_exception_infos[exception_code].error;
>  }
>  
> +bool panfrost_exception_needs_reset(const struct panfrost_device *pfdev,
> +				    u32 exception_code)
> +{
> +	/* Right now, none of the GPU we support need a reset, but this
> +	 * might change (e.g. Valhall GPUs require a when a BUS_FAULT occurs).

NITs:                        ^ some                 ^ reset

Or just drop the example for now.

> +	 */
> +	return false;
> +}
> +
>  void panfrost_device_reset(struct panfrost_device *pfdev)
>  {
>  	panfrost_gpu_soft_reset(pfdev);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 498c7b5dccd0..95e6044008d2 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -175,6 +175,8 @@ int panfrost_device_suspend(struct device *dev);
>  
>  const char *panfrost_exception_name(u32 exception_code);
>  int panfrost_exception_to_error(u32 exception_code);
> +bool panfrost_exception_needs_reset(const struct panfrost_device *pfdev,
> +				    u32 exception_code);
>  
>  static inline void
>  panfrost_device_schedule_reset(struct panfrost_device *pfdev)
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index be5d3e4a1d0a..aedc604d331c 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -493,27 +493,38 @@ static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
>  
>  		if (status & JOB_INT_MASK_ERR(j)) {
>  			enum panfrost_queue_status old_status;
> +			u32 js_status = job_read(pfdev, JS_STATUS(j));
>  
>  			job_write(pfdev, JS_COMMAND_NEXT(j), JS_COMMAND_NOP);
>  
>  			dev_err(pfdev->dev, "js fault, js=%d, status=%s, head=0x%x, tail=0x%x",
>  				j,
> -				panfrost_exception_name(job_read(pfdev, JS_STATUS(j))),
> +				panfrost_exception_name(js_status),
>  				job_read(pfdev, JS_HEAD_LO(j)),
>  				job_read(pfdev, JS_TAIL_LO(j)));
>  
> -			/*
> -			 * When the queue is being restarted we don't report
> -			 * faults directly to avoid races between the timeout
> -			 * and reset handlers. panfrost_scheduler_start() will
> -			 * call drm_sched_fault() after the queue has been
> -			 * started if status == FAULT_PENDING.
> +			/* If we need a reset, signal it to the reset handler,
> +			 * otherwise, update the fence error field and signal
> +			 * the job fence.
>  			 */
> -			old_status = atomic_cmpxchg(&pfdev->js->queue[j].status,
> -						    PANFROST_QUEUE_STATUS_STARTING,
> -						    PANFROST_QUEUE_STATUS_FAULT_PENDING);
> -			if (old_status == PANFROST_QUEUE_STATUS_ACTIVE)
> -				drm_sched_fault(&pfdev->js->queue[j].sched);
> +			if (panfrost_exception_needs_reset(pfdev, js_status)) {
> +				/*
> +				 * When the queue is being restarted we don't report
> +				 * faults directly to avoid races between the timeout
> +				 * and reset handlers. panfrost_scheduler_start() will
> +				 * call drm_sched_fault() after the queue has been
> +				 * started if status == FAULT_PENDING.
> +				 */
> +				old_status = atomic_cmpxchg(&pfdev->js->queue[j].status,
> +							    PANFROST_QUEUE_STATUS_STARTING,
> +							    PANFROST_QUEUE_STATUS_FAULT_PENDING);
> +				if (old_status == PANFROST_QUEUE_STATUS_ACTIVE)
> +					drm_sched_fault(&pfdev->js->queue[j].sched);
> +			} else {
> +				dma_fence_set_error(pfdev->jobs[j]->done_fence,
> +						    panfrost_exception_to_error(js_status));

As in the previous patch - at the moment a status of STOPPED or
TERMINATED shouldn't actually happen. But the next patch is about to
change that! TERMINATED should definitely cause an error on the fence.

Steve

> +				status |= JOB_INT_MASK_DONE(j);
> +			}
>  		}
>  
>  		if (status & JOB_INT_MASK_DONE(j)) {
> 

