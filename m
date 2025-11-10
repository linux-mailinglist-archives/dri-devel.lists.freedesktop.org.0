Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B291C45964
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 10:18:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AC810E373;
	Mon, 10 Nov 2025 09:18:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BF9C710E367
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 09:18:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF442497;
 Mon, 10 Nov 2025 01:18:05 -0800 (PST)
Received: from [10.57.72.117] (unknown [10.57.72.117])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 055D03F63F;
 Mon, 10 Nov 2025 01:18:10 -0800 (PST)
Message-ID: <d8e229a7-0ca1-43db-8de3-f6a6390b18c6@arm.com>
Date: Mon, 10 Nov 2025 09:18:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] drm/panthor: Introduce panthor_pwr API and power
 control framework
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20251107142440.1134528-1-karunika.choo@arm.com>
 <20251107142440.1134528-4-karunika.choo@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251107142440.1134528-4-karunika.choo@arm.com>
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

On 07/11/2025 14:24, Karunika Choo wrote:
> Add the new panthor_pwr module, which provides basic power control
> management for Mali-G1 GPUs. The initial implementation includes
> infrastructure for initializing the PWR_CONTROL block, requesting and
> handling its IRQ, and checking for PWR_CONTROL support based on GPU
> architecture.
> 
> The patch also integrates panthor_pwr with the device lifecycle (init,
> suspend, resume, and unplug) through the new API functions. It also
> registers the IRQ handler under the 'gpu' IRQ as the PWR_CONTROL block
> is located within the GPU_CONTROL block.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
> v4:
>  * Reintroduced include for panthor_regs.h.
>  * Add include for drm_print.h
> v3:
>  * Turned panthor_hw_has_pwr_ctrl() into a static inline function.
> v2:
>  * Removed stub functions.
>  * Updated BIT() definitions for 64-bit fields to use BIT_U64() to
>    address kernel test robot warnings for 32-bit systems.
>  * Moved GPU_FEATURES_RAY_TRAVERSAL definition to the next patch where
>    it is being used.
>  * Drop the use of feature bits in favour of a function that performs a
>    GPU_ARCH_MAJOR check instead.
> ---
>  drivers/gpu/drm/panthor/Makefile         |   1 +
>  drivers/gpu/drm/panthor/panthor_device.c |  14 ++-
>  drivers/gpu/drm/panthor/panthor_device.h |   4 +
>  drivers/gpu/drm/panthor/panthor_hw.h     |   6 ++
>  drivers/gpu/drm/panthor/panthor_pwr.c    | 121 +++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_pwr.h    |  17 ++++
>  drivers/gpu/drm/panthor/panthor_regs.h   |  78 +++++++++++++++
>  7 files changed, 240 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.h
> 
> diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
> index 02db21748c12..753a32c446df 100644
> --- a/drivers/gpu/drm/panthor/Makefile
> +++ b/drivers/gpu/drm/panthor/Makefile
> @@ -10,6 +10,7 @@ panthor-y := \
>  	panthor_heap.o \
>  	panthor_hw.o \
>  	panthor_mmu.o \
> +	panthor_pwr.o \
>  	panthor_sched.o
> 
>  obj-$(CONFIG_DRM_PANTHOR) += panthor.o
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 847dea458682..d3e16da0b24e 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -20,6 +20,7 @@
>  #include "panthor_gpu.h"
>  #include "panthor_hw.h"
>  #include "panthor_mmu.h"
> +#include "panthor_pwr.h"
>  #include "panthor_regs.h"
>  #include "panthor_sched.h"
> 
> @@ -102,6 +103,7 @@ void panthor_device_unplug(struct panthor_device *ptdev)
>  	panthor_fw_unplug(ptdev);
>  	panthor_mmu_unplug(ptdev);
>  	panthor_gpu_unplug(ptdev);
> +	panthor_pwr_unplug(ptdev);
> 
>  	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
>  	pm_runtime_put_sync_suspend(ptdev->base.dev);
> @@ -249,10 +251,14 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	if (ret)
>  		goto err_rpm_put;
> 
> -	ret = panthor_gpu_init(ptdev);
> +	ret = panthor_pwr_init(ptdev);
>  	if (ret)
>  		goto err_rpm_put;
> 
> +	ret = panthor_gpu_init(ptdev);
> +	if (ret)
> +		goto err_unplug_pwr;
> +
>  	ret = panthor_gpu_coherency_init(ptdev);
>  	if (ret)
>  		goto err_unplug_gpu;
> @@ -293,6 +299,9 @@ int panthor_device_init(struct panthor_device *ptdev)
>  err_unplug_gpu:
>  	panthor_gpu_unplug(ptdev);
> 
> +err_unplug_pwr:
> +	panthor_pwr_unplug(ptdev);
> +
>  err_rpm_put:
>  	pm_runtime_put_sync_suspend(ptdev->base.dev);
>  	return ret;
> @@ -446,6 +455,7 @@ static int panthor_device_resume_hw_components(struct panthor_device *ptdev)
>  {
>  	int ret;
> 
> +	panthor_pwr_resume(ptdev);
>  	panthor_gpu_resume(ptdev);
>  	panthor_mmu_resume(ptdev);
> 
> @@ -455,6 +465,7 @@ static int panthor_device_resume_hw_components(struct panthor_device *ptdev)
> 
>  	panthor_mmu_suspend(ptdev);
>  	panthor_gpu_suspend(ptdev);
> +	panthor_pwr_suspend(ptdev);
>  	return ret;
>  }
> 
> @@ -568,6 +579,7 @@ int panthor_device_suspend(struct device *dev)
>  		panthor_fw_suspend(ptdev);
>  		panthor_mmu_suspend(ptdev);
>  		panthor_gpu_suspend(ptdev);
> +		panthor_pwr_suspend(ptdev);
>  		drm_dev_exit(cookie);
>  	}
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 1457c1255f1f..05818318e0ba 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -31,6 +31,7 @@ struct panthor_job;
>  struct panthor_mmu;
>  struct panthor_fw;
>  struct panthor_perfcnt;
> +struct panthor_pwr;
>  struct panthor_vm;
>  struct panthor_vm_pool;
> 
> @@ -126,6 +127,9 @@ struct panthor_device {
>  	/** @hw: GPU-specific data. */
>  	struct panthor_hw *hw;
> 
> +	/** @pwr: Power control management data. */
> +	struct panthor_pwr *pwr;
> +
>  	/** @gpu: GPU management data. */
>  	struct panthor_gpu *gpu;
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
> index 64616caa6f05..56c68c1e9c26 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.h
> +++ b/drivers/gpu/drm/panthor/panthor_hw.h
> @@ -5,6 +5,7 @@
>  #define __PANTHOR_HW_H__
> 
>  #include "panthor_device.h"
> +#include "panthor_regs.h"
> 
>  /**
>   * struct panthor_hw_ops - HW operations that are specific to a GPU
> @@ -47,4 +48,9 @@ static inline void panthor_hw_l2_power_off(struct panthor_device *ptdev)
>  	ptdev->hw->ops.l2_power_off(ptdev);
>  }
> 
> +static inline bool panthor_hw_has_pwr_ctrl(struct panthor_device *ptdev)
> +{
> +	return GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id) >= 14;
> +}
> +
>  #endif /* __PANTHOR_HW_H__ */
> diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
> new file mode 100644
> index 000000000000..66dc72b29116
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_pwr.c
> @@ -0,0 +1,121 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/* Copyright 2025 ARM Limited. All rights reserved. */
> +
> +#include <linux/platform_device.h>
> +#include <linux/interrupt.h>
> +#include <linux/iopoll.h>
> +#include <linux/wait.h>
> +
> +#include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
> +
> +#include "panthor_device.h"
> +#include "panthor_hw.h"
> +#include "panthor_pwr.h"
> +#include "panthor_regs.h"
> +
> +#define PWR_INTERRUPTS_MASK \
> +	(PWR_IRQ_POWER_CHANGED_SINGLE | \
> +	 PWR_IRQ_POWER_CHANGED_ALL | \
> +	 PWR_IRQ_DELEGATION_CHANGED | \
> +	 PWR_IRQ_RESET_COMPLETED | \
> +	 PWR_IRQ_RETRACT_COMPLETED | \
> +	 PWR_IRQ_INSPECT_COMPLETED | \
> +	 PWR_IRQ_COMMAND_NOT_ALLOWED | \
> +	 PWR_IRQ_COMMAND_INVALID)
> +
> +/**
> + * struct panthor_pwr - PWR_CONTROL block management data.
> + */
> +struct panthor_pwr {
> +	/** @irq: PWR irq. */
> +	struct panthor_irq irq;
> +
> +	/** @reqs_lock: Lock protecting access to pending_reqs. */
> +	spinlock_t reqs_lock;
> +
> +	/** @pending_reqs: Pending PWR requests. */
> +	u32 pending_reqs;
> +
> +	/** @reqs_acked: PWR request wait queue. */
> +	wait_queue_head_t reqs_acked;
> +};
> +
> +static void panthor_pwr_irq_handler(struct panthor_device *ptdev, u32 status)
> +{
> +	spin_lock(&ptdev->pwr->reqs_lock);
> +	gpu_write(ptdev, PWR_INT_CLEAR, status);
> +
> +	if (unlikely(status & PWR_IRQ_COMMAND_NOT_ALLOWED))
> +		drm_err(&ptdev->base, "PWR_IRQ: COMMAND_NOT_ALLOWED");
> +
> +	if (unlikely(status & PWR_IRQ_COMMAND_INVALID))
> +		drm_err(&ptdev->base, "PWR_IRQ: COMMAND_INVALID");
> +
> +	if (status & ptdev->pwr->pending_reqs) {
> +		ptdev->pwr->pending_reqs &= ~status;
> +		wake_up_all(&ptdev->pwr->reqs_acked);
> +	}
> +	spin_unlock(&ptdev->pwr->reqs_lock);
> +}
> +PANTHOR_IRQ_HANDLER(pwr, PWR, panthor_pwr_irq_handler);
> +
> +void panthor_pwr_unplug(struct panthor_device *ptdev)
> +{
> +	unsigned long flags;
> +
> +	if (!ptdev->pwr)
> +		return;
> +
> +	/* Make sure the IRQ handler is not running after that point. */
> +	panthor_pwr_irq_suspend(&ptdev->pwr->irq);
> +
> +	/* Wake-up all waiters. */
> +	spin_lock_irqsave(&ptdev->pwr->reqs_lock, flags);
> +	ptdev->pwr->pending_reqs = 0;
> +	wake_up_all(&ptdev->pwr->reqs_acked);
> +	spin_unlock_irqrestore(&ptdev->pwr->reqs_lock, flags);
> +}
> +
> +int panthor_pwr_init(struct panthor_device *ptdev)
> +{
> +	struct panthor_pwr *pwr;
> +	int err, irq;
> +
> +	if (!panthor_hw_has_pwr_ctrl(ptdev))
> +		return 0;
> +
> +	pwr = drmm_kzalloc(&ptdev->base, sizeof(*pwr), GFP_KERNEL);
> +	if (!pwr)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&pwr->reqs_lock);
> +	init_waitqueue_head(&pwr->reqs_acked);
> +	ptdev->pwr = pwr;
> +
> +	irq = platform_get_irq_byname(to_platform_device(ptdev->base.dev), "gpu");
> +	if (irq < 0)
> +		return irq;
> +
> +	err = panthor_request_pwr_irq(ptdev, &pwr->irq, irq, PWR_INTERRUPTS_MASK);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
> +void panthor_pwr_suspend(struct panthor_device *ptdev)
> +{
> +	if (!ptdev->pwr)
> +		return;
> +
> +	panthor_pwr_irq_suspend(&ptdev->pwr->irq);
> +}
> +
> +void panthor_pwr_resume(struct panthor_device *ptdev)
> +{
> +	if (!ptdev->pwr)
> +		return;
> +
> +	panthor_pwr_irq_resume(&ptdev->pwr->irq, PWR_INTERRUPTS_MASK);
> +}
> diff --git a/drivers/gpu/drm/panthor/panthor_pwr.h b/drivers/gpu/drm/panthor/panthor_pwr.h
> new file mode 100644
> index 000000000000..b325e5b7eba3
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_pwr.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright 2025 ARM Limited. All rights reserved. */
> +
> +#ifndef __PANTHOR_PWR_H__
> +#define __PANTHOR_PWR_H__
> +
> +struct panthor_device;
> +
> +void panthor_pwr_unplug(struct panthor_device *ptdev);
> +
> +int panthor_pwr_init(struct panthor_device *ptdev);
> +
> +void panthor_pwr_suspend(struct panthor_device *ptdev);
> +
> +void panthor_pwr_resume(struct panthor_device *ptdev);
> +
> +#endif /* __PANTHOR_PWR_H__ */
> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
> index 8bee76d01bf8..5469eec02178 100644
> --- a/drivers/gpu/drm/panthor/panthor_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
> @@ -205,4 +205,82 @@
>  #define CSF_DOORBELL(i)					(0x80000 + ((i) * 0x10000))
>  #define CSF_GLB_DOORBELL_ID				0
> 
> +/* PWR Control registers */
> +
> +#define PWR_CONTROL_BASE				0x800
> +#define PWR_CTRL_REG(x)					(PWR_CONTROL_BASE + (x))
> +
> +#define PWR_INT_RAWSTAT					PWR_CTRL_REG(0x0)
> +#define PWR_INT_CLEAR					PWR_CTRL_REG(0x4)
> +#define PWR_INT_MASK					PWR_CTRL_REG(0x8)
> +#define PWR_INT_STAT					PWR_CTRL_REG(0xc)
> +#define   PWR_IRQ_POWER_CHANGED_SINGLE			BIT(0)
> +#define   PWR_IRQ_POWER_CHANGED_ALL			BIT(1)
> +#define   PWR_IRQ_DELEGATION_CHANGED			BIT(2)
> +#define   PWR_IRQ_RESET_COMPLETED			BIT(3)
> +#define   PWR_IRQ_RETRACT_COMPLETED			BIT(4)
> +#define   PWR_IRQ_INSPECT_COMPLETED			BIT(5)
> +#define   PWR_IRQ_COMMAND_NOT_ALLOWED			BIT(30)
> +#define   PWR_IRQ_COMMAND_INVALID			BIT(31)
> +
> +#define PWR_STATUS					PWR_CTRL_REG(0x20)
> +#define   PWR_STATUS_ALLOW_L2				BIT_U64(0)
> +#define   PWR_STATUS_ALLOW_TILER			BIT_U64(1)
> +#define   PWR_STATUS_ALLOW_SHADER			BIT_U64(8)
> +#define   PWR_STATUS_ALLOW_BASE				BIT_U64(14)
> +#define   PWR_STATUS_ALLOW_STACK			BIT_U64(15)
> +#define   PWR_STATUS_DOMAIN_ALLOWED(x)			BIT_U64(x)
> +#define   PWR_STATUS_DELEGATED_L2			BIT_U64(16)
> +#define   PWR_STATUS_DELEGATED_TILER			BIT_U64(17)
> +#define   PWR_STATUS_DELEGATED_SHADER			BIT_U64(24)
> +#define   PWR_STATUS_DELEGATED_BASE			BIT_U64(30)
> +#define   PWR_STATUS_DELEGATED_STACK			BIT_U64(31)
> +#define   PWR_STATUS_DELEGATED_SHIFT			16
> +#define   PWR_STATUS_DOMAIN_DELEGATED(x)		BIT_U64((x) + PWR_STATUS_DELEGATED_SHIFT)
> +#define   PWR_STATUS_ALLOW_SOFT_RESET			BIT_U64(33)
> +#define   PWR_STATUS_ALLOW_FAST_RESET			BIT_U64(34)
> +#define   PWR_STATUS_POWER_PENDING			BIT_U64(41)
> +#define   PWR_STATUS_RESET_PENDING			BIT_U64(42)
> +#define   PWR_STATUS_RETRACT_PENDING			BIT_U64(43)
> +#define   PWR_STATUS_INSPECT_PENDING			BIT_U64(44)
> +
> +#define PWR_COMMAND					PWR_CTRL_REG(0x28)
> +#define   PWR_COMMAND_POWER_UP				0x10
> +#define   PWR_COMMAND_POWER_DOWN			0x11
> +#define   PWR_COMMAND_DELEGATE				0x20
> +#define   PWR_COMMAND_RETRACT				0x21
> +#define   PWR_COMMAND_RESET_SOFT			0x31
> +#define   PWR_COMMAND_RESET_FAST			0x32
> +#define   PWR_COMMAND_INSPECT				0xF0
> +#define   PWR_COMMAND_DOMAIN_L2				0
> +#define   PWR_COMMAND_DOMAIN_TILER			1
> +#define   PWR_COMMAND_DOMAIN_SHADER			8
> +#define   PWR_COMMAND_DOMAIN_BASE			14
> +#define   PWR_COMMAND_DOMAIN_STACK			15
> +#define   PWR_COMMAND_SUBDOMAIN_RTU			BIT(0)
> +#define   PWR_COMMAND_DEF(cmd, domain, subdomain)	\
> +	(((subdomain) << 16) | ((domain) << 8) | (cmd))
> +
> +#define PWR_CMDARG					PWR_CTRL_REG(0x30)
> +
> +#define PWR_L2_PRESENT					PWR_CTRL_REG(0x100)
> +#define PWR_L2_READY					PWR_CTRL_REG(0x108)
> +#define PWR_L2_PWRTRANS					PWR_CTRL_REG(0x110)
> +#define PWR_L2_PWRACTIVE				PWR_CTRL_REG(0x118)
> +#define PWR_TILER_PRESENT				PWR_CTRL_REG(0x140)
> +#define PWR_TILER_READY					PWR_CTRL_REG(0x148)
> +#define PWR_TILER_PWRTRANS				PWR_CTRL_REG(0x150)
> +#define PWR_TILER_PWRACTIVE				PWR_CTRL_REG(0x158)
> +#define PWR_SHADER_PRESENT				PWR_CTRL_REG(0x200)
> +#define PWR_SHADER_READY				PWR_CTRL_REG(0x208)
> +#define PWR_SHADER_PWRTRANS				PWR_CTRL_REG(0x210)
> +#define PWR_SHADER_PWRACTIVE				PWR_CTRL_REG(0x218)
> +#define PWR_BASE_PRESENT				PWR_CTRL_REG(0x380)
> +#define PWR_BASE_READY					PWR_CTRL_REG(0x388)
> +#define PWR_BASE_PWRTRANS				PWR_CTRL_REG(0x390)
> +#define PWR_BASE_PWRACTIVE				PWR_CTRL_REG(0x398)
> +#define PWR_STACK_PRESENT				PWR_CTRL_REG(0x3c0)
> +#define PWR_STACK_READY					PWR_CTRL_REG(0x3c8)
> +#define PWR_STACK_PWRTRANS				PWR_CTRL_REG(0x3d0)
> +
>  #endif
> --
> 2.49.0
> 

