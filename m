Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B04959AFE30
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 11:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D2C10EA45;
	Fri, 25 Oct 2024 09:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8B4E010EA45
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 09:29:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB9AF339
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 02:30:19 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D0DBF3F528
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 02:29:49 -0700 (PDT)
Date: Fri, 25 Oct 2024 10:29:46 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Akash Goel <akash.goel@arm.com>
Cc: boris.brezillon@collabora.com, steven.price@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mihail.atanassov@arm.com, ketil.johnsen@arm.com,
 florent.tomasin@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, nd@arm.com
Subject: Re: [PATCH 2/3] drm/panthor: Explicitly set the coherency mode
Message-ID: <ZxtlCkGA5pdng-KH@e110455-lin.cambridge.arm.com>
References: <20241024145432.934086-1-akash.goel@arm.com>
 <20241024145432.934086-3-akash.goel@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241024145432.934086-3-akash.goel@arm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 24, 2024 at 03:54:31PM +0100, Akash Goel wrote:
> This commit fixes the potential misalignment between the value of device
> tree property "dma-coherent" and default value of COHERENCY_ENABLE
> register.
> Panthor driver didn't explicitly program the COHERENCY_ENABLE register
> with the desired coherency mode. The default value of COHERENCY_ENABLE
> register is implementation defined, so it may not be always aligned with
> the "dma-coherent" property value.
> The commit also checks the COHERENCY_FEATURES register to confirm that
> the coherency protocol is actually supported or not.
> 
> Signed-off-by: Akash Goel <akash.goel@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 22 +++++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_gpu.c    |  9 +++++++++
>  2 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 4082c8f2951d..984615f4ed27 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -22,6 +22,24 @@
>  #include "panthor_regs.h"
>  #include "panthor_sched.h"
>  
> +static int panthor_gpu_coherency_init(struct panthor_device *ptdev)
> +{
> +	ptdev->coherent = device_get_dma_attr(ptdev->base.dev) == DEV_DMA_COHERENT;
> +
> +	if (!ptdev->coherent)
> +		return 0;
> +
> +	/* Check if the ACE-Lite coherency protocol is actually supported by the GPU.
> +	 * ACE protocol has never been supported for command stream frontend GPUs.
> +	 */
> +	if ((gpu_read(ptdev, GPU_COHERENCY_FEATURES) &
> +		      GPU_COHERENCY_PROT_BIT(ACE_LITE)))
> +		return 0;
> +
> +	drm_err(&ptdev->base, "Coherency not supported by the device");
> +	return -ENOTSUPP;
> +}
> +
>  static int panthor_clk_init(struct panthor_device *ptdev)
>  {
>  	ptdev->clks.core = devm_clk_get(ptdev->base.dev, NULL);
> @@ -156,7 +174,9 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	struct page *p;
>  	int ret;
>  
> -	ptdev->coherent = device_get_dma_attr(ptdev->base.dev) == DEV_DMA_COHERENT;
> +	ret = panthor_gpu_coherency_init(ptdev);
> +	if (ret)
> +		return ret;
>  
>  	init_completion(&ptdev->unplug.done);
>  	ret = drmm_mutex_init(&ptdev->base, &ptdev->unplug.lock);
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 5251d8764e7d..1e24f08a519a 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -77,6 +77,12 @@ static const struct panthor_model gpu_models[] = {
>  	 GPU_IRQ_RESET_COMPLETED | \
>  	 GPU_IRQ_CLEAN_CACHES_COMPLETED)
>  
> +static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
> +{
> +	gpu_write(ptdev, GPU_COHERENCY_PROTOCOL,
> +		ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_COHERENCY_NONE);
> +}
> +
>  static void panthor_gpu_init_info(struct panthor_device *ptdev)
>  {
>  	const struct panthor_model *model;
> @@ -365,6 +371,9 @@ int panthor_gpu_l2_power_on(struct panthor_device *ptdev)
>  			      hweight64(ptdev->gpu_info.shader_present));
>  	}
>  
> +	/* Set the desired coherency mode before the power up of L2 */
> +	panthor_gpu_coherency_set(ptdev);
> +
>  	return panthor_gpu_power_on(ptdev, L2, 1, 20000);
>  }
>  
> -- 
> 2.25.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
