Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B06477B720
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 12:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5012A10E1A5;
	Mon, 14 Aug 2023 10:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 90A6810E1A2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 10:54:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F58C2F4;
 Mon, 14 Aug 2023 03:55:18 -0700 (PDT)
Received: from [10.57.34.244] (unknown [10.57.34.244])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC1CA3F762;
 Mon, 14 Aug 2023 03:54:27 -0700 (PDT)
Message-ID: <b1c4d260-93a5-d1f0-7f4b-4dcb444e7a24@arm.com>
Date: Mon, 14 Aug 2023 11:54:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 05/15] drm/panthor: Add the GPU logical block
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-6-boris.brezillon@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230809165330.2451699-6-boris.brezillon@collabora.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/08/2023 17:53, Boris Brezillon wrote:
> Handles everything that's not related to the FW, the MMU or the
> scheduler. This is the block dealing with the GPU property retrieval,
> the GPU block power on/off logic, and some global operations, like
> global cache flushing.
> 
> v2:
> - Rename the driver (pancsf -> panthor)
> - Change the license (GPL2 -> MIT + GPL2)
> - Split the driver addition commit
> - Use drm_dev_{unplug,enter,exit}() to provide safe device removal
> - Use the panthor_irq layer to manage/process IRQs
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_gpu.c | 463 ++++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_gpu.h |  52 +++
>  2 files changed, 515 insertions(+)
>  create mode 100644 drivers/gpu/drm/panthor/panthor_gpu.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_gpu.h
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> new file mode 100644
> index 000000000000..47d15334b46e
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -0,0 +1,463 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/* Copyright 2018 Marty E. Plummer <hanetzer@startmail.com> */
> +/* Copyright 2019 Linaro, Ltd., Rob Herring <robh@kernel.org> */
> +/* Copyright 2019 Collabora ltd. */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bitmap.h>
> +#include <linux/delay.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
> +
> +#include "panthor_device.h"
> +#include "panthor_gpu.h"
> +#include "panthor_regs.h"
> +
> +/**
> + * struct panthor_gpu - GPU block management data.
> + */
> +struct panthor_gpu {
> +	/** @irq: GPU irq. */
> +	struct panthor_irq irq;
> +
> +	/** @reqs_lock: Lock protecting access to pending_reqs. */
> +	spinlock_t reqs_lock;
> +
> +	/** @pending_reqs: Pending GPU requests. */
> +	u32 pending_reqs;
> +
> +	/** @reqs_acked: GPU request wait queue. */
> +	wait_queue_head_t reqs_acked;
> +};
> +
> +/**
> + * struct panthor_model - GPU model description
> + */
> +struct panthor_model {
> +	/** @name: Model name. */
> +	const char *name;
> +
> +	/** @id: Model ID. */
> +	u32 id;
> +};
> +
> +/**
> + * GPU_MODEL() - Define a GPU model.
> + */
> +#define GPU_MODEL(_name, _id, ...) \
> +{\
> +	.name = __stringify(_name),				\
> +	.id = _id,						\
> +}
> +
> +#define GPU_MODEL_ID_MASK		0xf00f0000

I would be nice if we had defines for the two components that make this
up (ARCH_MAJOR | PRODUCT_MAJOR). It might even be easier to read the
model list below if we split ID into arch/product combinations (which
can then be written in decimal rather than hex).

> +
> +static const struct panthor_model gpu_models[] = {
> +	GPU_MODEL(g610, 0xa0070000),
> +	{},
> +};
> +
> +#define GPU_INTERRUPTS_MASK	\
> +	(GPU_IRQ_FAULT | \
> +	 GPU_IRQ_PROTM_FAULT | \
> +	 GPU_IRQ_RESET_COMPLETED | \
> +	 GPU_IRQ_MCU_STATUS_CHANGED | \

The code doesn't seem to use the MCU_STATUS_CHANGED interrupt, if it's
not used then it doesn't make sense to be in the mask.

> +	 GPU_IRQ_CLEAN_CACHES_COMPLETED)
> +
> +static void panthor_gpu_init_info(struct panthor_device *ptdev)
> +{
> +	const struct panthor_model *model;
> +	u32 major, minor, status;
> +	unsigned int i;
> +
> +	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
> +	ptdev->gpu_info.csf_id = gpu_read(ptdev, GPU_CSF_ID);
> +	ptdev->gpu_info.gpu_rev = gpu_read(ptdev, GPU_REVID);
> +	ptdev->gpu_info.l2_features = gpu_read(ptdev, GPU_L2_FEATURES);
> +	ptdev->gpu_info.tiler_features = gpu_read(ptdev, GPU_TILER_FEATURES);
> +	ptdev->gpu_info.mem_features = gpu_read(ptdev, GPU_MEM_FEATURES);
> +	ptdev->gpu_info.mmu_features = gpu_read(ptdev, GPU_MMU_FEATURES);
> +	ptdev->gpu_info.thread_features = gpu_read(ptdev, GPU_THREAD_FEATURES);
> +	ptdev->gpu_info.max_threads = gpu_read(ptdev, GPU_THREAD_MAX_THREADS);
> +	ptdev->gpu_info.thread_max_workgroup_size = gpu_read(ptdev, GPU_THREAD_MAX_WORKGROUP_SIZE);
> +	ptdev->gpu_info.thread_max_barrier_size = gpu_read(ptdev, GPU_THREAD_MAX_BARRIER_SIZE);
> +	ptdev->gpu_info.coherency_features = gpu_read(ptdev, GPU_COHERENCY_FEATURES);
> +	for (i = 0; i < 4; i++)
> +		ptdev->gpu_info.texture_features[i] = gpu_read(ptdev, GPU_TEXTURE_FEATURES(i));
> +
> +	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
> +
> +	ptdev->gpu_info.shader_present = gpu_read(ptdev, GPU_SHADER_PRESENT_LO);
> +	ptdev->gpu_info.shader_present |= (u64)gpu_read(ptdev, GPU_SHADER_PRESENT_HI) << 32;
> +
> +	ptdev->gpu_info.tiler_present = gpu_read(ptdev, GPU_TILER_PRESENT_LO);
> +	ptdev->gpu_info.tiler_present |= (u64)gpu_read(ptdev, GPU_TILER_PRESENT_HI) << 32;
> +
> +	ptdev->gpu_info.l2_present = gpu_read(ptdev, GPU_L2_PRESENT_LO);
> +	ptdev->gpu_info.l2_present |= (u64)gpu_read(ptdev, GPU_L2_PRESENT_HI) << 32;
> +	ptdev->gpu_info.core_group_count = hweight64(ptdev->gpu_info.l2_present);

Do we want to expose 'computed' properties like this? My experience in
the past with kbase is that they can cause problems and are practically
impossible to kill off once added.

AFAICT it isn't used by the current Mesa driver so I would suggest
dropping core_group_count (which also enables us to drop the 'pad' field
which is a nice side-effect).

> +
> +	major = (ptdev->gpu_info.gpu_id >> 12) & 0xf;
> +	minor = (ptdev->gpu_info.gpu_id >> 4) & 0xff;
> +	status = ptdev->gpu_info.gpu_id & 0xf;
> +
> +	for (model = gpu_models; model->name; model++) {
> +		if (model->id == (ptdev->gpu_info.gpu_id & GPU_MODEL_ID_MASK))
> +			break;
> +	}
> +
> +	drm_info(&ptdev->base,
> +		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
> +		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
> +		 major, minor, status);
> +
> +	drm_info(&ptdev->base,
> +		 "Features: L2:0x%08x Tiler:0x%08x Mem:0x%0x MMU:0x%08x AS:0x%x",

There's an odd mix of format strings here. "%0x" for Mem and just "%x"
for AS.

> +		 ptdev->gpu_info.l2_features,
> +		 ptdev->gpu_info.tiler_features,
> +		 ptdev->gpu_info.mem_features,
> +		 ptdev->gpu_info.mmu_features,
> +		 ptdev->gpu_info.as_present);
> +
> +	drm_info(&ptdev->base,
> +		 "shader_present=0x%0llx l2_present=0x%0llx tiler_present=0x%0llx",
> +		 ptdev->gpu_info.shader_present, ptdev->gpu_info.l2_present,
> +		 ptdev->gpu_info.tiler_present);
> +}
> +
> +static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
> +{
> +	if (status & (GPU_IRQ_FAULT | GPU_IRQ_PROTM_FAULT)) {

The spec states that GPU_FAULTSTATUS "does not update for
GPU_PROTECTED_FAULT interrupts" - so I don't think we want
GPU_IRQ_PROTM_FAULT in that condition. Or at least printing the
exception information should ideally be avoided.

If I understand correctly a protected fault interrupt is basically
saying the fault is the same as a GPU_IRQ_FAULT but the GPU isn't going
to tell us the details because it was in protected mode (and it doesn't
to accidentally leak the 'super secret' content).

> +		u32 fault_status = gpu_read(ptdev, GPU_FAULT_STATUS);
> +		u64 address = ((u64)gpu_read(ptdev, GPU_FAULT_ADDR_HI) << 32) |
> +			      gpu_read(ptdev, GPU_FAULT_ADDR_LO);
> +
> +		drm_warn(&ptdev->base, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
> +			 fault_status, panthor_exception_name(ptdev, fault_status & 0xFF),
> +			 address);
> +	}
> +
> +	spin_lock(&ptdev->gpu->reqs_lock);
> +	if (status & ptdev->gpu->pending_reqs) {
> +		ptdev->gpu->pending_reqs &= ~status;
> +		wake_up_all(&ptdev->gpu->reqs_acked);
> +	}
> +	spin_unlock(&ptdev->gpu->reqs_lock);
> +}
> +PANTHOR_IRQ_HANDLER(gpu, GPU, panthor_gpu_irq_handler);
> +
> +/**
> + * panthor_gpu_unplug() - Called when the GPU is unplugged.
> + */
> +void panthor_gpu_unplug(struct panthor_device *ptdev)
> +{
> +	unsigned long flags;
> +
> +	/* Make sure the IRQ handler is not running after that point. */
> +	panthor_gpu_irq_suspend(&ptdev->gpu->irq);
> +
> +	/* Wake-up all waiters. */
> +	spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
> +	ptdev->gpu->pending_reqs = 0;
> +	wake_up_all(&ptdev->gpu->reqs_acked);
> +	spin_unlock_irqrestore(&ptdev->gpu->reqs_lock, flags);
> +}
> +
> +/**
> + * panthor_gpu_init() - Initialize the GPU block
> + * @ptdev: Device.
> + *
> + * Return: 0 on success, a negative error code otherwise.
> + */
> +int panthor_gpu_init(struct panthor_device *ptdev)
> +{
> +	struct panthor_gpu *gpu;
> +	u32 pa_bits;
> +	int ret, irq;
> +
> +	gpu = drmm_kzalloc(&ptdev->base, sizeof(*gpu), GFP_KERNEL);
> +	if (!gpu)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&gpu->reqs_lock);
> +	init_waitqueue_head(&gpu->reqs_acked);
> +	ptdev->gpu = gpu;
> +	panthor_gpu_init_info(ptdev);
> +
> +	dma_set_max_seg_size(ptdev->base.dev, UINT_MAX);
> +	pa_bits = GPU_MMU_FEATURES_PA_BITS(ptdev->gpu_info.mmu_features);
> +	ret = dma_set_mask_and_coherent(ptdev->base.dev, DMA_BIT_MASK(pa_bits));
> +	if (ret)
> +		return ret;
> +
> +	irq = platform_get_irq_byname(to_platform_device(ptdev->base.dev), "gpu");
> +	if (irq <= 0)
> +		return ret;
> +
> +	ret = panthor_request_gpu_irq(ptdev, &ptdev->gpu->irq, irq, GPU_INTERRUPTS_MASK);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +/**
> + * panthor_gpu_block_power_off() - Power-off a specific block of the GPU
> + * @ptdev: Device.
> + * @blk_name: Block name.
> + * @pwroff_reg: Power-off register for this block.
> + * @pwrtrans_reg: Power transition register for this block.
> + * @mask: Sub-elements to power-off.
> + * @timeout_ms: Timeout in milliseconds.
> + *
> + * Return: 0 on success, a negative error code otherwise.
> + */
> +int panthor_gpu_block_power_off(struct panthor_device *ptdev,
> +				const char *blk_name,
> +				u32 pwroff_reg, u32 pwrtrans_reg,
> +				u64 mask, u32 timeout_us)
> +{
> +	u32 val, i;
> +	int ret;
> +
> +	for (i = 0; i < 2; i++) {
> +		u32 mask32 = mask >> (i * 32);
> +
> +		if (!mask32)
> +			continue;
> +
> +		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
> +						 val, !(mask32 & val),
> +						 100, timeout_us);
> +		if (ret) {
> +			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
> +				blk_name, mask);
> +			return ret;
> +		}
> +	}
> +
> +	if (mask & GENMASK(31, 0))
> +		gpu_write(ptdev, pwroff_reg, mask);
> +
> +	if (mask >> 32)
> +		gpu_write(ptdev, pwroff_reg, mask >> 32);

This should be pwroff_reg + 4.

> +
> +	for (i = 0; i < 2; i++) {
> +		u32 mask32 = mask >> (i * 32);
> +
> +		if (!mask32)
> +			continue;
> +
> +		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
> +						 val, !(mask & val),
> +						 100, timeout_us);
> +		if (ret) {
> +			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
> +				blk_name, mask);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * panthor_gpu_block_power_on() - Power-on a specific block of the GPU
> + * @ptdev: Device.
> + * @blk_name: Block name.
> + * @pwron_reg: Power-on register for this block.
> + * @pwrtrans_reg: Power transition register for this block.
> + * @mask: Sub-elements to power-on.
> + * @timeout_ms: Timeout in milliseconds.
> + *
> + * Return: 0 on success, a negative error code otherwise.
> + */
> +int panthor_gpu_block_power_on(struct panthor_device *ptdev,
> +			       const char *blk_name,
> +			       u32 pwron_reg, u32 pwrtrans_reg,
> +			       u32 rdy_reg, u64 mask, u32 timeout_us)
> +{
> +	u32 val, i;
> +	int ret;
> +
> +	for (i = 0; i < 2; i++) {
> +		u32 mask32 = mask >> (i * 32);
> +
> +		if (!mask32)
> +			continue;
> +
> +		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
> +						 val, !(mask32 & val),
> +						 100, timeout_us);
> +		if (ret) {
> +			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
> +				blk_name, mask);
> +			return ret;
> +		}
> +	}
> +
> +	if (mask & GENMASK(31, 0))
> +		gpu_write(ptdev, pwron_reg, mask);
> +
> +	if (mask >> 32)
> +		gpu_write(ptdev, pwron_reg + 4, mask >> 32);
> +
> +	for (i = 0; i < 2; i++) {
> +		u32 mask32 = mask >> (i * 32);
> +
> +		if (!mask32)
> +			continue;
> +
> +		ret = readl_relaxed_poll_timeout(ptdev->iomem + rdy_reg + (i * 4),
> +						 val, (mask32 & val) == mask32,
> +						 100, timeout_us);
> +		if (ret) {
> +			drm_err(&ptdev->base, "timeout waiting on %s:%llx readyness",
> +				blk_name, mask);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * panthor_gpu_l2_power_on() - Power-on the L2-cache
> + * @ptdev: Device.
> + *
> + * Return: 0 on success, a negative error code otherwise.
> + */
> +int panthor_gpu_l2_power_on(struct panthor_device *ptdev)
> +{
> +	u64 core_mask = U64_MAX;
> +
> +	if (ptdev->gpu_info.l2_present != 1) {
> +		/*
> +		 * Only support one core group now.
> +		 * ~(l2_present - 1) unsets all bits in l2_present except
> +		 * the bottom bit. (l2_present - 2) has all the bits in
> +		 * the first core group set. AND them together to generate
> +		 * a mask of cores in the first core group.
> +		 */
> +		core_mask = ~(ptdev->gpu_info.l2_present - 1) &
> +			     (ptdev->gpu_info.l2_present - 2);
> +		drm_info_once(&ptdev->base, "using only 1st core group (%lu cores from %lu)\n",
> +			      hweight64(core_mask),
> +			      hweight64(ptdev->gpu_info.shader_present));

I'm not sure what the point of this complexity is. This boils down to
the equivalent of:

	if (ptdev->gpu_info.l2_present != 1)
		core_mask = 1;

If we were doing shader-core power management manually (like on pre-CSF
GPUs, rather than letting the firmware control it) then the computed
core_mask would be useful. So I guess it comes down to the
drm_info_once() output and counting the cores - which is nice to have
but it took me some time figuring out what was going on here.

> +	}
> +
> +	return panthor_gpu_power_on(ptdev, L2,
> +				    ptdev->gpu_info.l2_present & core_mask,
> +				    20000);
> +}
> +
> +/**
> + * panthor_gpu_flush_caches() - Flush caches
> + * @ptdev: Device.
> + * @l2: L2 flush type.
> + * @lsc: LSC flush type.
> + * @other: Other flush type.
> + *
> + * Return: 0 on success, a negative error code otherwise.
> + */
> +int panthor_gpu_flush_caches(struct panthor_device *ptdev,
> +			     u32 l2, u32 lsc, u32 other)
> +{
> +	bool timedout = false;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
> +	if (!drm_WARN_ON(&ptdev->base,
> +			 ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED)) {
> +		ptdev->gpu->pending_reqs |= GPU_IRQ_CLEAN_CACHES_COMPLETED;
> +		gpu_write(ptdev, GPU_CMD, GPU_FLUSH_CACHES(l2, lsc, other));
> +	}
> +	spin_unlock_irqrestore(&ptdev->gpu->reqs_lock, flags);
> +
> +	if (!wait_event_timeout(ptdev->gpu->reqs_acked,
> +				!(ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED),
> +				msecs_to_jiffies(100))) {
> +		spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
> +		if ((ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED) != 0 &&
> +		    !(gpu_read(ptdev, GPU_INT_RAWSTAT) & GPU_IRQ_CLEAN_CACHES_COMPLETED))
> +			timedout = true;
> +		spin_unlock_irqrestore(&ptdev->gpu->reqs_lock, flags);
> +	}
> +
> +	if (timedout) {
> +		drm_err(&ptdev->base, "Flush caches timeout");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * panthor_gpu_soft_reset() - Issue a soft-reset
> + * @ptdev: Device.
> + *
> + * Return: 0 on success, a negative error code otherwise.
> + */
> +int panthor_gpu_soft_reset(struct panthor_device *ptdev)
> +{
> +	bool timedout = false;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
> +	if (!drm_WARN_ON(&ptdev->base,
> +			 ptdev->gpu->pending_reqs & GPU_IRQ_RESET_COMPLETED)) {
> +		ptdev->gpu->pending_reqs |= GPU_IRQ_RESET_COMPLETED;
> +		gpu_write(ptdev, GPU_INT_CLEAR, GPU_IRQ_RESET_COMPLETED);
> +		gpu_write(ptdev, GPU_CMD, GPU_SOFT_RESET);
> +	}
> +	spin_unlock_irqrestore(&ptdev->gpu->reqs_lock, flags);
> +
> +	if (!wait_event_timeout(ptdev->gpu->reqs_acked,
> +				!(ptdev->gpu->pending_reqs & GPU_IRQ_RESET_COMPLETED),
> +				msecs_to_jiffies(100))) {
> +		spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
> +		if ((ptdev->gpu->pending_reqs & GPU_IRQ_RESET_COMPLETED) != 0 &&
> +		    !(gpu_read(ptdev, GPU_INT_RAWSTAT) & GPU_IRQ_RESET_COMPLETED))
> +			timedout = true;
> +		spin_unlock_irqrestore(&ptdev->gpu->reqs_lock, flags);
> +	}
> +
> +	if (timedout) {
> +		drm_err(&ptdev->base, "Soft reset timeout");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * panthor_gpu_suspend() - Suspend the GPU block.
> + * @ptdev: Device.
> + *
> + * Soft reset and suspend the GPU irq. This should be called last
> + * in the suspend procedure, after all other blocks have been suspented.
> + */
> +void panthor_gpu_suspend(struct panthor_device *ptdev)
> +{
> +	panthor_gpu_soft_reset(ptdev);

I'm not sure why we need to soft-reset when suspending? I guess this is
instead of manually powering off the L2? It might be the right action,
but it would be good to have a comment explaining why.

Steve

> +	panthor_gpu_irq_suspend(&ptdev->gpu->irq);
> +}
> +
> +/**
> + * panthor_gpu_resume() - Resume the GPU block.
> + *
> + * Resume the IRQ handler and power-on the L2-cache.
> + * The FW takes care of powering the other blocks.
> + */
> +void panthor_gpu_resume(struct panthor_device *ptdev)
> +{
> +	panthor_gpu_irq_resume(&ptdev->gpu->irq, GPU_INTERRUPTS_MASK);
> +	panthor_gpu_l2_power_on(ptdev);
> +}
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.h b/drivers/gpu/drm/panthor/panthor_gpu.h
> new file mode 100644
> index 000000000000..bba7555dd3c6
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright 2018 Marty E. Plummer <hanetzer@startmail.com> */
> +/* Copyright 2019 Collabora ltd. */
> +
> +#ifndef __PANTHOR_GPU_H__
> +#define __PANTHOR_GPU_H__
> +
> +struct panthor_device;
> +
> +int panthor_gpu_init(struct panthor_device *ptdev);
> +void panthor_gpu_unplug(struct panthor_device *ptdev);
> +void panthor_gpu_suspend(struct panthor_device *ptdev);
> +void panthor_gpu_resume(struct panthor_device *ptdev);
> +
> +int panthor_gpu_block_power_on(struct panthor_device *ptdev,
> +			       const char *blk_name,
> +			       u32 pwron_reg, u32 pwrtrans_reg,
> +			       u32 rdy_reg, u64 mask, u32 timeout_us);
> +int panthor_gpu_block_power_off(struct panthor_device *ptdev,
> +				const char *blk_name,
> +				u32 pwroff_reg, u32 pwrtrans_reg,
> +				u64 mask, u32 timeout_us);
> +
> +/**
> + * panthor_gpu_power_on() - Power on the GPU block.
> + *
> + * Return: 0 on success, a negative error code otherwise.
> + */
> +#define panthor_gpu_power_on(ptdev, type, mask, timeout_us) \
> +	panthor_gpu_block_power_on(ptdev, #type, \
> +				  type ## _PWRON_LO, \
> +				  type ## _PWRTRANS_LO, \
> +				  type ## _READY_LO, \
> +				  mask, timeout_us)
> +
> +/**
> + * panthor_gpu_power_off() - Power off the GPU block.
> + *
> + * Return: 0 on success, a negative error code otherwise.
> + */
> +#define panthor_gpu_power_off(ptdev, type, mask, timeout_us) \
> +	panthor_gpu_block_power_off(ptdev, #type, \
> +				   type ## _PWROFF_LO, \
> +				   type ## _PWRTRANS_LO, \
> +				   mask, timeout_us)
> +
> +int panthor_gpu_l2_power_on(struct panthor_device *ptdev);
> +int panthor_gpu_flush_caches(struct panthor_device *ptdev,
> +			     u32 l2, u32 lsc, u32 other);
> +int panthor_gpu_soft_reset(struct panthor_device *ptdev);
> +
> +#endif

