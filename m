Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB383AEB80
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 16:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D86A6E19C;
	Mon, 21 Jun 2021 14:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C87F589C08
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 14:36:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82CF2D6E;
 Mon, 21 Jun 2021 07:36:29 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9060F3F694;
 Mon, 21 Jun 2021 07:36:28 -0700 (PDT)
Subject: Re: [PATCH v2 03/12] drm/panfrost: Drop the pfdev argument passed to
 panfrost_exception_name()
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20210621133907.1683899-1-boris.brezillon@collabora.com>
 <20210621133907.1683899-4-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <dd05e3f3-2062-c399-b2a5-6cca29cc1859@arm.com>
Date: Mon, 21 Jun 2021 15:36:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210621133907.1683899-4-boris.brezillon@collabora.com>
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

On 21/06/2021 14:38, Boris Brezillon wrote:
> Currently unused. We'll add it back if we need per-GPU definitions.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

Side note: we could use the definitions such as JS_STATUS_EVENT_ACTIVE
in panfrost_exception_name() rather than magic numbers. Although I do
find this function a handy mapping between codes and names to refer to! ;)

Steve

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
> index 3757c6eb3023..1be80b3dd5d0 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -500,7 +500,7 @@ static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
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
> 

