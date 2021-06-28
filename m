Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A80253B5B9B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 11:49:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1496E3F7;
	Mon, 28 Jun 2021 09:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C8F906E3F7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 09:49:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 329211FB;
 Mon, 28 Jun 2021 02:49:08 -0700 (PDT)
Received: from [10.57.89.43] (unknown [10.57.89.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0C5A3F694;
 Mon, 28 Jun 2021 02:49:06 -0700 (PDT)
Subject: Re: [PATCH v4 12/14] drm/panfrost: Don't reset the GPU on job faults
 unless we really have to
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20210628074210.2695399-1-boris.brezillon@collabora.com>
 <20210628074210.2695399-13-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <cada3a3d-5afe-08d2-f81b-ae39ec0f8f3c@arm.com>
Date: Mon, 28 Jun 2021 10:49:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628074210.2695399-13-boris.brezillon@collabora.com>
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

On 28/06/2021 08:42, Boris Brezillon wrote:
> If we can recover from a fault without a reset there's no reason to
> issue one.
> 
> v3:
> * Drop the mention of Valhall requiring a reset on JOB_BUS_FAULT
> * Set the fence error to -EINVAL instead of having per-exception
>   error codes
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c |  9 +++++++++
>  drivers/gpu/drm/panfrost/panfrost_device.h |  2 ++
>  drivers/gpu/drm/panfrost/panfrost_job.c    | 16 ++++++++++++++--
>  3 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index 736854542b05..f4e42009526d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -379,6 +379,15 @@ const char *panfrost_exception_name(u32 exception_code)
>  	return panfrost_exception_infos[exception_code].name;
>  }
>  
> +bool panfrost_exception_needs_reset(const struct panfrost_device *pfdev,
> +				    u32 exception_code)
> +{
> +	/* Right now, none of the GPU we support need a reset, but this
> +	 * might change.
> +	 */
> +	return false;
> +}
> +
>  void panfrost_device_reset(struct panfrost_device *pfdev)
>  {
>  	panfrost_gpu_soft_reset(pfdev);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 2dc8c0d1d987..d91f71366214 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -244,6 +244,8 @@ enum drm_panfrost_exception_type {
>  };
>  
>  const char *panfrost_exception_name(u32 exception_code);
> +bool panfrost_exception_needs_reset(const struct panfrost_device *pfdev,
> +				    u32 exception_code);
>  
>  static inline void
>  panfrost_device_schedule_reset(struct panfrost_device *pfdev)
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 4bd4d11377b7..b0f4857ca084 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -498,14 +498,26 @@ static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
>  		job_write(pfdev, JOB_INT_CLEAR, mask);
>  
>  		if (status & JOB_INT_MASK_ERR(j)) {
> +			u32 js_status = job_read(pfdev, JS_STATUS(j));
> +
>  			job_write(pfdev, JS_COMMAND_NEXT(j), JS_COMMAND_NOP);
>  
>  			dev_err(pfdev->dev, "js fault, js=%d, status=%s, head=0x%x, tail=0x%x",
>  				j,
> -				panfrost_exception_name(job_read(pfdev, JS_STATUS(j))),
> +				panfrost_exception_name(js_status),
>  				job_read(pfdev, JS_HEAD_LO(j)),
>  				job_read(pfdev, JS_TAIL_LO(j)));
> -			drm_sched_fault(&pfdev->js->queue[j].sched);
> +
> +			/* If we need a reset, signal it to the timeout
> +			 * handler, otherwise, update the fence error field and
> +			 * signal the job fence.
> +			 */
> +			if (panfrost_exception_needs_reset(pfdev, js_status)) {
> +				drm_sched_fault(&pfdev->js->queue[j].sched);
> +			} else {
> +				dma_fence_set_error(pfdev->jobs[j]->done_fence, -EINVAL);
> +				status |= JOB_INT_MASK_DONE(j);
> +			}
>  		}
>  
>  		if (status & JOB_INT_MASK_DONE(j)) {
> 

