Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C9ECB364F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 16:57:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E91A10E080;
	Wed, 10 Dec 2025 15:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0286810E080
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 15:57:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FB3A153B;
 Wed, 10 Dec 2025 07:57:40 -0800 (PST)
Received: from [10.57.45.72] (unknown [10.57.45.72])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82B3D3F73B;
 Wed, 10 Dec 2025 07:57:44 -0800 (PST)
Message-ID: <99ee1d8c-e43a-4d7d-a0d0-37546c09c183@arm.com>
Date: Wed, 10 Dec 2025 15:57:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/panthor: Add tracepoint for hardware
 utilisation changes
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chia-I Wu <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251210-panthor-tracepoints-v2-0-ace2e29bad0f@collabora.com>
 <20251210-panthor-tracepoints-v2-3-ace2e29bad0f@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251210-panthor-tracepoints-v2-3-ace2e29bad0f@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/12/2025 14:30, Nicolas Frattaroli wrote:
> Mali GPUs have three registers that indicate which parts of the hardware
> are powered at any moment. These take the form of bitmaps. In the case
> of SHADER_READY for example, a high bit indicates that the shader core
> corresponding to that bit index is powered on. These bitmaps aren't
> solely contiguous bits, as it's common to have holes in the sequence of
> shader core indices, and the actual set of which cores are present is
> defined by the "shader present" register.
> 
> When the GPU finishes a power state transition, it fires a
> GPU_IRQ_POWER_CHANGED_ALL interrupt. After such an interrupt is
> received, the _READY registers will contain new interesting data. During
> power transitions, the GPU_IRQ_POWER_CHANGED interrupt will fire, and
> the registers will likewise contain potentially changed data.
> 
> This is not to be confused with the PWR_IRQ_POWER_CHANGED_ALL interrupt,
> which is something related to Mali v14+'s power control logic. The
> _READY registers and corresponding interrupts are already available in
> v9 and onwards.
> 
> Additionally, the SHADER_PWRFEATURES register may be of interest, which
> contains a bit flag indicating whether raytracing functionality is
> turned on, as the ray tracing unit's power can separately be toggled.
> Reading this register on platforms from before it was added has no
> unpleasant side-effects; it's officially specified to read as 0 in this
> case.

I'm confused by this addition, SHADER_PWRFEATURES is sampled (by the
hardware) on power up of a shader core. So the value of the register
isn't necessarily representative of the actual hardware state. In normal
operation it is controlled by the MCU and so probably has some
correlation to ray tracing happening, but I don't think there's any
gaurentee there. And on later GPUs this functionality has been moved
into the POWER_CONTROL block and I don't think there's anything equivalent.

Also in general I wouldn't rely on the "read as 0" parts - not
specifically because I expect HW bugs, but because later GPUs might
reuse those register positions for other things.

So this seems to only work on a small number of GPUs and even then it's
relying on a firmware behaviour which isn't gaurenteed.

It would be good if we can come up with a tracepoint which is both
useful and likely to work over a range of GPUs.

Thanks,
Steve

> Expose the data as a tracepoint to userspace. This allows users to debug
> various scenarios and gather interesting information, such as: knowing
> how much hardware is lit up at any given time, correlating graphics
> corruption with a specific powered shader core, measuring when hardware
> is allowed to go to a powered off state again, and so on.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_gpu.c   | 96 ++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_trace.h | 62 +++++++++++++++++++++
>  2 files changed, 156 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 057e167468d0..e86bca9ffd10 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -22,6 +22,9 @@
>  #include "panthor_hw.h"
>  #include "panthor_regs.h"
>  
> +#define CREATE_TRACE_POINTS
> +#include "panthor_trace.h"
> +
>  /**
>   * struct panthor_gpu - GPU block management data.
>   */
> @@ -29,6 +32,9 @@ struct panthor_gpu {
>  	/** @irq: GPU irq. */
>  	struct panthor_irq irq;
>  
> +	/** @irq_mask: GPU irq mask. */
> +	u32 irq_mask;
> +
>  	/** @reqs_lock: Lock protecting access to pending_reqs. */
>  	spinlock_t reqs_lock;
>  
> @@ -48,6 +54,9 @@ struct panthor_gpu {
>  	 GPU_IRQ_RESET_COMPLETED | \
>  	 GPU_IRQ_CLEAN_CACHES_COMPLETED)
>  
> +#define GPU_POWER_INTERRUPTS_MASK	\
> +	(GPU_IRQ_POWER_CHANGED | GPU_IRQ_POWER_CHANGED_ALL)
> +
>  static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
>  {
>  	gpu_write(ptdev, GPU_COHERENCY_PROTOCOL,
> @@ -80,6 +89,14 @@ static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
>  {
>  	gpu_write(ptdev, GPU_INT_CLEAR, status);
>  
> +	if (tracepoint_enabled(gpu_power_status) && (status & GPU_POWER_INTERRUPTS_MASK))
> +		trace_gpu_power_status(ptdev->base.dev,
> +				       gpu_read64(ptdev, SHADER_READY),
> +				       gpu_read64(ptdev, TILER_READY),
> +				       gpu_read64(ptdev, L2_READY),
> +				       gpu_read(ptdev, SHADER_PWRFEATURES) &
> +				       SHADER_PWRFEATURES_RT);
> +
>  	if (status & GPU_IRQ_FAULT) {
>  		u32 fault_status = gpu_read(ptdev, GPU_FAULT_STATUS);
>  		u64 address = gpu_read64(ptdev, GPU_FAULT_ADDR);
> @@ -139,6 +156,7 @@ int panthor_gpu_init(struct panthor_device *ptdev)
>  	init_waitqueue_head(&gpu->reqs_acked);
>  	mutex_init(&gpu->cache_flush_lock);
>  	ptdev->gpu = gpu;
> +	gpu->irq_mask = GPU_INTERRUPTS_MASK;
>  
>  	dma_set_max_seg_size(ptdev->base.dev, UINT_MAX);
>  	pa_bits = GPU_MMU_FEATURES_PA_BITS(ptdev->gpu_info.mmu_features);
> @@ -150,13 +168,87 @@ int panthor_gpu_init(struct panthor_device *ptdev)
>  	if (irq < 0)
>  		return irq;
>  
> -	ret = panthor_request_gpu_irq(ptdev, &ptdev->gpu->irq, irq, GPU_INTERRUPTS_MASK);
> +	ret = panthor_request_gpu_irq(ptdev, &ptdev->gpu->irq, irq, gpu->irq_mask);
>  	if (ret)
>  		return ret;
>  
>  	return 0;
>  }
>  
> +static int panthor_gpu_set_power_tracing(struct device *dev, void *data)
> +{
> +	struct panthor_device *ptdev = dev_get_drvdata(dev);
> +	u32 mask = GPU_INTERRUPTS_MASK;
> +
> +	if (!ptdev || !ptdev->gpu)
> +		return -ENODEV;
> +
> +	/* v14+ don't use this interrupt for this purpose, skip */
> +	if (GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id) > 13)
> +		return 0;
> +
> +	if (data)
> +		mask |= GPU_POWER_INTERRUPTS_MASK;
> +
> +	guard(pm_runtime_active)(dev);
> +
> +	ptdev->gpu->irq_mask = mask;
> +	panthor_gpu_irq_mask_set(&ptdev->gpu->irq, mask);
> +
> +	return 0;
> +}
> +
> +/**
> + * panthor_gpu_power_status_register - reg callback for power_status tracepoint
> + *
> + * This function gets called when the gpu_power_status tracepoint is enabled.
> + * Its purpose is to modify the interrupt mask for the GPU interrupt.
> + *
> + * Returns 0 on success, negative errno otherwise.
> + */
> +int panthor_gpu_power_status_register(void)
> +{
> +	struct device_driver *drv;
> +	int ret;
> +
> +	drv = driver_find("panthor", &platform_bus_type);
> +	if (!drv)
> +		return -ENODEV;
> +
> +	ret = driver_for_each_device(drv, NULL, (void *)true,
> +				     panthor_gpu_set_power_tracing);
> +
> +	return ret;
> +}
> +
> +/**
> + * panthor_gpu_power_status_unregister - unreg callback for power_status tracepoint
> + *
> + * This function gets called when the gpu_power_status tracepoint is disabled.
> + * Its purpose is to modify the interrupt mask for the GPU interrupt.
> + */
> +void panthor_gpu_power_status_unregister(void)
> +{
> +	struct device_driver *drv;
> +	int ret;
> +
> +	drv = driver_find("panthor", &platform_bus_type);
> +	if (!drv)
> +		return;
> +
> +	ret = driver_for_each_device(drv, NULL, NULL, panthor_gpu_set_power_tracing);
> +
> +	/*
> +	 * Ideally, it'd be possible to ask driver_for_each_device to hand us
> +	 * another "start" to keep going after the failing device, but it
> +	 * doesn't do that. Minor inconvenience in what is probably a bad day
> +	 * on the computer already though.
> +	 */
> +	if (ret)
> +		pr_warn("Couldn't mask power IRQ for at least one device: %pe\n",
> +			ERR_PTR(ret));
> +}
> +
>  /**
>   * panthor_gpu_block_power_off() - Power-off a specific block of the GPU
>   * @ptdev: Device.
> @@ -395,7 +487,7 @@ void panthor_gpu_suspend(struct panthor_device *ptdev)
>   */
>  void panthor_gpu_resume(struct panthor_device *ptdev)
>  {
> -	panthor_gpu_irq_resume(&ptdev->gpu->irq, GPU_INTERRUPTS_MASK);
> +	panthor_gpu_irq_resume(&ptdev->gpu->irq, ptdev->gpu->irq_mask);
>  	panthor_hw_l2_power_on(ptdev);
>  }
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_trace.h b/drivers/gpu/drm/panthor/panthor_trace.h
> new file mode 100644
> index 000000000000..8258217066fc
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_trace.h
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright 2025 Collabora ltd. */
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM panthor
> +
> +#if !defined(__PANTHOR_TRACE_H__) || defined(TRACE_HEADER_MULTI_READ)
> +#define __PANTHOR_TRACE_H__
> +
> +#include <linux/tracepoint.h>
> +#include <linux/types.h>
> +
> +int panthor_gpu_power_status_register(void);
> +void panthor_gpu_power_status_unregister(void);
> +
> +/**
> + * gpu_power_status - called whenever parts of GPU hardware are turned on or off
> + * @dev: pointer to the &struct device, for printing the device name
> + * @shader_bitmap: bitmap where a high bit indicates the shader core at a given
> + *                 bit index is on, and a low bit indicates a shader core is
> + *                 either powered off or absent
> + * @tiler_bitmap: bitmap where a high bit indicates the tiler unit at a given
> + *                bit index is on, and a low bit indicates a tiler unit is
> + *                either powered off or absent
> + * @l2_bitmap: bitmap where a high bit indicates the L2 cache at a given bit
> + *             index is on, and a low bit indicates the L2 cache is either
> + *             powered off or absent
> + * @rt_on: 0 all the raytracing units are off, 1 if they're all powered on.
> + */
> +TRACE_EVENT_FN(gpu_power_status,
> +	TP_PROTO(const struct device *dev, u64 shader_bitmap, u64 tiler_bitmap,
> +		 u64 l2_bitmap, bool rt_on),
> +	TP_ARGS(dev, shader_bitmap, tiler_bitmap, l2_bitmap, rt_on),
> +	TP_STRUCT__entry(
> +		__string(dev_name, dev_name(dev))
> +		__field(u64, shader_bitmap)
> +		__field(u64, tiler_bitmap)
> +		__field(u64, l2_bitmap)
> +		__field(bool, rt_on)
> +	),
> +	TP_fast_assign(
> +		__assign_str(dev_name);
> +		__entry->shader_bitmap	= shader_bitmap;
> +		__entry->tiler_bitmap	= tiler_bitmap;
> +		__entry->l2_bitmap	= l2_bitmap;
> +		__entry->rt_on		= rt_on;
> +	),
> +	TP_printk("%s: shader_bitmap=0x%llx tiler_bitmap=0x%llx l2_bitmap=0x%llx rt_on=%d",
> +		  __get_str(dev_name), __entry->shader_bitmap, __entry->tiler_bitmap,
> +		  __entry->l2_bitmap, __entry->rt_on
> +	),
> +	panthor_gpu_power_status_register, panthor_gpu_power_status_unregister
> +);
> +
> +#endif /* __PANTHOR_TRACE_H__ */
> +
> +#undef TRACE_INCLUDE_PATH
> +#define TRACE_INCLUDE_PATH .
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_FILE panthor_trace
> +
> +#include <trace/define_trace.h>
> 

