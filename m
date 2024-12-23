Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0803E9FB363
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 18:03:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80CA210E1B7;
	Mon, 23 Dec 2024 17:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 09AB410E1B7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 17:02:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2AC11007;
 Mon, 23 Dec 2024 09:03:08 -0800 (PST)
Received: from [10.57.73.219] (unknown [10.57.73.219])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A75993F694;
 Mon, 23 Dec 2024 09:02:36 -0800 (PST)
Message-ID: <896dc5e4-1324-424e-b839-e6f25cf92b78@arm.com>
Date: Mon, 23 Dec 2024 17:02:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/4] drm/panthor: Add gpu specific initialization
 framework
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20241219170521.64879-1-karunika.choo@arm.com>
 <20241219170521.64879-4-karunika.choo@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241219170521.64879-4-karunika.choo@arm.com>
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

On 19/12/2024 17:05, Karunika Choo wrote:
> This patch adds a framework for adding GPU specific code which adds the
> following gpu-specific features:
> - register base addresses
> - feature bits
> - function pointers
> 
> The above allows the handling of changes to register and register set
> offsets, as well as logical changes to the code between GPUs.

It would be nice to know what changes are expected to be able to review
this well. Do we really need all this flexibility straight away?

> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
>  drivers/gpu/drm/panthor/Makefile         |  1 +
>  drivers/gpu/drm/panthor/panthor_device.c | 22 ++++--
>  drivers/gpu/drm/panthor/panthor_device.h | 28 +++++--
>  drivers/gpu/drm/panthor/panthor_fw.c     | 27 ++++---
>  drivers/gpu/drm/panthor/panthor_gpu.c    | 44 ++++++-----
>  drivers/gpu/drm/panthor/panthor_gpu.h    |  1 +
>  drivers/gpu/drm/panthor/panthor_hw.c     | 94 ++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_hw.h     | 92 +++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_mmu.c    | 41 ++++++-----
>  drivers/gpu/drm/panthor/panthor_regs.h   | 62 ++++++++--------
>  drivers/gpu/drm/panthor/panthor_sched.c  |  1 +
>  11 files changed, 323 insertions(+), 90 deletions(-)
>  create mode 100644 drivers/gpu/drm/panthor/panthor_hw.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_hw.h
> 
> diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
> index ab297637d172..e1f06396bd1d 100644
> --- a/drivers/gpu/drm/panthor/Makefile
> +++ b/drivers/gpu/drm/panthor/Makefile
> @@ -8,6 +8,7 @@ panthor-y := \
>  	panthor_gem.o \
>  	panthor_gpu.o \
>  	panthor_heap.o \
> +	panthor_hw.o \
>  	panthor_mmu.o \
>  	panthor_props.o \
>  	panthor_sched.o
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 0b74dc628489..fd261e525b7b 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -18,6 +18,7 @@
>  #include "panthor_device.h"
>  #include "panthor_fw.h"
>  #include "panthor_gpu.h"
> +#include "panthor_hw.h"
>  #include "panthor_mmu.h"
>  #include "panthor_props.h"
>  #include "panthor_regs.h"
> @@ -116,6 +117,11 @@ void panthor_device_unplug(struct panthor_device *ptdev)
>  	complete_all(&ptdev->unplug.done);
>  }
>  
> +static bool panthor_device_is_initialized(struct panthor_device *ptdev)
> +{
> +	return !!ptdev->scheduler;
> +}
> +
>  static void panthor_device_reset_cleanup(struct drm_device *ddev, void *data)
>  {
>  	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
> @@ -141,11 +147,14 @@ static void panthor_device_reset_work(struct work_struct *work)
>  	if (!drm_dev_enter(&ptdev->base, &cookie))
>  		return;
>  
> +	if (!panthor_device_is_initialized(ptdev))
> +		return;
> +

This seems like an unrelated change.

>  	panthor_sched_pre_reset(ptdev);
>  	panthor_fw_pre_reset(ptdev, true);
>  	panthor_mmu_pre_reset(ptdev);
> -	panthor_gpu_soft_reset(ptdev);
> -	panthor_gpu_l2_power_on(ptdev);
> +	ptdev->hw->ops.soft_reset(ptdev);
> +	ptdev->hw->ops.l2_power_on(ptdev);

Can we not keep the panthor_gpu_soft_reset()/panthor_gpu_l2_power_on()
functions as a stubs which do the indirect function calls?

>  	panthor_mmu_post_reset(ptdev);
>  	ret = panthor_fw_post_reset(ptdev);
>  	atomic_set(&ptdev->reset.pending, 0);
> @@ -158,11 +167,6 @@ static void panthor_device_reset_work(struct work_struct *work)
>  	}
>  }
>  
> -static bool panthor_device_is_initialized(struct panthor_device *ptdev)
> -{
> -	return !!ptdev->scheduler;
> -}
> -
>  static void panthor_device_free_page(struct drm_device *ddev, void *data)
>  {
>  	__free_page(data);
> @@ -247,6 +251,10 @@ int panthor_device_init(struct panthor_device *ptdev)
>  			return ret;
>  	}
>  
> +	ret = panthor_hw_init(ptdev);
> +	if (ret)
> +		goto err_rpm_put;
> +
>  	ret = panthor_gpu_init(ptdev);
>  	if (ret)
>  		goto err_rpm_put;
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 60c9a67fb4a2..a984d5f9a68a 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -24,6 +24,7 @@ struct panthor_device;
>  struct panthor_gpu;
>  struct panthor_group_pool;
>  struct panthor_heap_pool;
> +struct panthor_hw;
>  struct panthor_job;
>  struct panthor_mmu;
>  struct panthor_props;
> @@ -124,6 +125,9 @@ struct panthor_device {
>  	/** @csif_info: Command stream interface information. */
>  	struct drm_panthor_csif_info csif_info;
>  
> +	/** @hw: GPU specific data */
> +	struct panthor_hw *hw;
> +
>  	/** @gpu: GPU management data. */
>  	struct panthor_gpu *gpu;
>  
> @@ -365,13 +369,14 @@ static irqreturn_t panthor_ ## __name ## _irq_raw_handler(int irq, void *data)
>  {												\
>  	struct panthor_irq *pirq = data;							\
>  	struct panthor_device *ptdev = pirq->ptdev;						\
> +	const u64 base = ptdev->hw->map.__name ## _irq.base;					\
>  												\
>  	if (atomic_read(&pirq->suspended))							\
>  		return IRQ_NONE;								\
> -	if (!gpu_read(ptdev, __reg_prefix ## _INT_STAT))					\
> +	if (!gpu_read(ptdev, base + __reg_prefix ## _INT_STAT))					\
>  		return IRQ_NONE;								\

Why isn't gpu_read() and friends updated to take the base directly,
rather than sprinkle the code with lots of open-coded addition?

[...]
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 51b63d258c7a..27c2e950927b 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -21,6 +21,7 @@
>  #include "panthor_fw.h"
>  #include "panthor_gem.h"
>  #include "panthor_gpu.h"
> +#include "panthor_hw.h"
>  #include "panthor_mmu.h"
>  #include "panthor_props.h"
>  #include "panthor_regs.h"
> @@ -34,6 +35,9 @@
>  #define IDLE_HYSTERESIS_US			800
>  #define PWROFF_HYSTERESIS_US			10000
>  
> +#define MCU_BASE(ptdev) (ptdev->hw->map.mcu_control_base)
> +#define JOB_BASE(ptdev) (ptdev->hw->map.job_irq.base)
> +
>  /**
>   * struct panthor_fw_binary_hdr - Firmware binary header.
>   */
> @@ -1030,13 +1034,13 @@ static int panthor_fw_start(struct panthor_device *ptdev)
>  
>  	ptdev->fw->booted = false;
>  	panthor_job_irq_resume(&ptdev->fw->irq, ~0);
> -	gpu_write(ptdev, MCU_CONTROL, MCU_CONTROL_AUTO);
> +	gpu_write(ptdev, MCU_BASE(ptdev) + MCU_CONTROL, MCU_CONTROL_AUTO);

Do we need abstractions here? The code gets very messy. Something like:

#define gpu_mcu_write(dev, reg, value) \
	gpu_write(dev, MCU_BASE(dev) + reg, value)

[...]
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 209fd9576969..0c420e8c0acb 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3838,6 +3838,7 @@ int panthor_sched_init(struct panthor_device *ptdev)
>  			ptdev->props->mmu_as_count);
>  		return -EINVAL;
>  	}
> +	gpu_as_count = ptdev->props->mmu_as_count - 1;

Unrelated change.

Thanks,
Steve

