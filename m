Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE593B8482
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 15:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE9D89F07;
	Wed, 30 Jun 2021 13:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC1B89F07
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 13:56:45 +0000 (UTC)
Received: from maud (unknown [IPv6:2600:8800:8c04:8c00::912b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A6FC81F41099;
 Wed, 30 Jun 2021 14:56:40 +0100 (BST)
Date: Wed, 30 Jun 2021 09:56:34 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v6 05/16] drm/panfrost: Drop the pfdev argument passed to
 panfrost_exception_name()
Message-ID: <YNx4EjcvwXcL1+9e@maud>
References: <20210630062751.2832545-1-boris.brezillon@collabora.com>
 <20210630062751.2832545-6-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210630062751.2832545-6-boris.brezillon@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

On Wed, Jun 30, 2021 at 08:27:40AM +0200, Boris Brezillon wrote:
> Currently unused. We'll add it back if we need per-GPU definitions.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c | 2 +-
>  drivers/gpu/drm/panfrost/panfrost_device.h | 2 +-
>  drivers/gpu/drm/panfrost/panfrost_gpu.c    | 2 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c    | 2 +-
>  drivers/gpu/drm/panfrost/panfrost_mmu.c    | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index a2a09c51eed7..f7f5ca94f910 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -292,7 +292,7 @@ void panfrost_device_fini(struct panfrost_device *pfdev)
>  	panfrost_clk_fini(pfdev);
>  }
>  
> -const char *panfrost_exception_name(struct panfrost_device *pfdev, u32 exception_code)
> +const char *panfrost_exception_name(u32 exception_code)
>  {
>  	switch (exception_code) {
>  		/* Non-Fault Status code */
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 8b2cdb8c701d..2fe1550da7f8 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -173,6 +173,6 @@ void panfrost_device_reset(struct panfrost_device *pfdev);
>  int panfrost_device_resume(struct device *dev);
>  int panfrost_device_suspend(struct device *dev);
>  
> -const char *panfrost_exception_name(struct panfrost_device *pfdev, u32 exception_code);
> +const char *panfrost_exception_name(u32 exception_code);
>  
>  #endif
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index 0e70e27fd8c3..26e4196b6c90 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -33,7 +33,7 @@ static irqreturn_t panfrost_gpu_irq_handler(int irq, void *data)
>  		address |= gpu_read(pfdev, GPU_FAULT_ADDRESS_LO);
>  
>  		dev_warn(pfdev->dev, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
> -			 fault_status & 0xFF, panfrost_exception_name(pfdev, fault_status),
> +			 fault_status & 0xFF, panfrost_exception_name(fault_status),
>  			 address);
>  
>  		if (state & GPU_IRQ_MULTIPLE_FAULT)
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 3c1dbae3ebdd..ea3432ffde40 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -489,7 +489,7 @@ static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
>  
>  			dev_err(pfdev->dev, "js fault, js=%d, status=%s, head=0x%x, tail=0x%x",
>  				j,
> -				panfrost_exception_name(pfdev, job_read(pfdev, JS_STATUS(j))),
> +				panfrost_exception_name(job_read(pfdev, JS_STATUS(j))),
>  				job_read(pfdev, JS_HEAD_LO(j)),
>  				job_read(pfdev, JS_TAIL_LO(j)));
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index 569509c2ba27..2a9bf30edc9d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -675,7 +675,7 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
>  				"TODO",
>  				fault_status,
>  				(fault_status & (1 << 10) ? "DECODER FAULT" : "SLAVE FAULT"),
> -				exception_type, panfrost_exception_name(pfdev, exception_type),
> +				exception_type, panfrost_exception_name(exception_type),
>  				access_type, access_type_name(pfdev, fault_status),
>  				source_id);
>  
> -- 
> 2.31.1
> 
