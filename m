Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE9972EA99
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 20:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B0510E3CA;
	Tue, 13 Jun 2023 18:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E4B10E3CA
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 18:13:00 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35DICpFc124326;
 Tue, 13 Jun 2023 13:12:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1686679971;
 bh=+vbKn0LJ3uBXn7OyfwankjDfFJTtWJtS3v1TYSqWiu4=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=vzDnU+6oQQj04NFa0eFTcfSKUIFK3ECUa0lpUy1q//JM1CJWPgyAI3o3GdtiOEjdF
 yoSjqbwTM+o5aO/CKeqmvMg9+/OWb6fbDaX/RSWyasxxYGiX6N9UE2AMsSg3IZ1wDy
 oCAEa3p6sEsi0/ujfFRYXBB2F/sRVONXmmVerY7c=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35DICpXE010628
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 13 Jun 2023 13:12:51 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 Jun 2023 13:12:51 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 Jun 2023 13:12:51 -0500
Received: from [10.250.37.94] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35DICoJ2034300;
 Tue, 13 Jun 2023 13:12:50 -0500
Message-ID: <7099ef2a-0a6c-9a04-44ba-da24d7953c51@ti.com>
Date: Tue, 13 Jun 2023 13:12:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 05/17] drm/imagination: Get GPU resources
Content-Language: en-US
To: Sarah Walker <sarah.walker@imgtec.com>, <dri-devel@lists.freedesktop.org>
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
 <20230613144800.52657-6-sarah.walker@imgtec.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230613144800.52657-6-sarah.walker@imgtec.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: matthew.brost@intel.com, christian.koenig@amd.com, luben.tuikov@amd.com,
 dakr@redhat.com, donald.robson@imgtec.com, boris.brezillon@collabora.com,
 sumit.semwal@linaro.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/13/23 9:47 AM, Sarah Walker wrote:
> Acquire clock, regulator and register resources, and enable/map as
> appropriate.
> 
> Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
> ---
>   drivers/gpu/drm/imagination/Makefile     |   1 +
>   drivers/gpu/drm/imagination/pvr_device.c | 271 +++++++++++++++++++++++
>   drivers/gpu/drm/imagination/pvr_device.h | 214 ++++++++++++++++++
>   drivers/gpu/drm/imagination/pvr_drv.c    |  11 +-
>   4 files changed, 496 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/imagination/pvr_device.c
> 
> diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
> index 62ccf0ccbd51..186f920d615b 100644
> --- a/drivers/gpu/drm/imagination/Makefile
> +++ b/drivers/gpu/drm/imagination/Makefile
> @@ -4,6 +4,7 @@
>   subdir-ccflags-y := -I$(srctree)/$(src)
>   
>   powervr-y := \
> +	pvr_device.o \
>   	pvr_drv.o \
>   
>   obj-$(CONFIG_DRM_POWERVR) += powervr.o
> diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
> new file mode 100644
> index 000000000000..790c36cebec1
> --- /dev/null
> +++ b/drivers/gpu/drm/imagination/pvr_device.c
> @@ -0,0 +1,271 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/* Copyright (c) 2022 Imagination Technologies Ltd. */
> +
> +#include "pvr_device.h"
> +
> +#include <drm/drm_print.h>
> +
> +#include <linux/clk.h>
> +#include <linux/compiler_attributes.h>
> +#include <linux/compiler_types.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/err.h>
> +#include <linux/gfp.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
> +#include <linux/stddef.h>
> +#include <linux/types.h>
> +
> +/**
> + * pvr_device_reg_init() - Initialize kernel access to a PowerVR device's
> + * control registers.
> + * @pvr_dev: Target PowerVR device.
> + *
> + * Sets struct pvr_device->regs.
> + *
> + * This method of mapping the device control registers into memory ensures that
> + * they are unmapped when the driver is detached (i.e. no explicit cleanup is
> + * required).
> + *
> + * Return:
> + *  * 0 on success, or
> + *  * Any error returned by devm_platform_ioremap_resource().
> + */
> +static int
> +pvr_device_reg_init(struct pvr_device *pvr_dev)
> +{
> +	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
> +	struct platform_device *plat_dev = to_platform_device(drm_dev->dev);
> +	struct resource *regs_resource;
> +	void __iomem *regs;
> +	int err;
> +
> +	pvr_dev->regs_resource = NULL;
> +	pvr_dev->regs = NULL;
> +
> +	regs = devm_platform_get_and_ioremap_resource(plat_dev, 0, &regs_resource);
> +	if (IS_ERR(regs)) {
> +		err = PTR_ERR(regs);
> +		drm_err(drm_dev, "failed to ioremap gpu registers (err=%d)\n",
> +			err);
> +		return err;
> +	}
> +
> +	pvr_dev->regs = regs;
> +	pvr_dev->regs_resource = regs_resource;
> +
> +	return 0;
> +}
> +
> +/**
> + * pvr_device_reg_fini() - Deinitialize kernel access to a PowerVR device's
> + * control registers.
> + * @pvr_dev: Target PowerVR device.
> + *
> + * This is essentially a no-op, since pvr_device_reg_init() already ensures that
> + * struct pvr_device->regs is unmapped when the device is detached. This
> + * function just sets struct pvr_device->regs to %NULL.
> + */
> +static __always_inline void
> +pvr_device_reg_fini(struct pvr_device *pvr_dev)
> +{
> +	pvr_dev->regs = NULL;

This function isn't needed, kinda defeats the purpose of using devm_*()
if you go an manually have no-op functions to unwind it..

> +}
> +
> +/**
> + * pvr_device_clk_init() - Initialize clocks required by a PowerVR device
> + * @pvr_dev: Target PowerVR device.
> + *
> + * Sets struct pvr_device->core_clk, struct pvr_device->sys_clk and
> + * struct pvr_device->mem_clk.
> + *
> + * Three clocks are required by the PowerVR device: core, sys and mem. On
> + * return, this function guarantees that the clocks are in one of the following
> + * states:
> + *
> + *  * All successfully initialized,
> + *  * Core errored, sys and mem uninitialized,
> + *  * Core deinitialized, sys errored, mem uninitialized, or
> + *  * Core and sys deinitialized, mem errored.
> + *
> + * Return:
> + *  * 0 on success,
> + *  * Any error returned by devm_clk_get(), or
> + *  * Any error returned by clk_prepare_enable().
> + */
> +static int pvr_device_clk_init(struct pvr_device *pvr_dev)
> +{
> +	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
> +	struct clk *core_clk;
> +	struct clk *sys_clk;
> +	struct clk *mem_clk;
> +	int err;
> +
> +	pvr_dev->core_clk = NULL;
> +	pvr_dev->sys_clk = NULL;
> +	pvr_dev->mem_clk = NULL;

You could NULL these out on the error path, but is that even needed, looks
like if this functions fails we bail on the whole init where this is all
deallocated (plus NULL'd out again in that path).

> +
> +	core_clk = devm_clk_get(drm_dev->dev, "core");
> +	if (IS_ERR(core_clk)) {
> +		err = PTR_ERR(core_clk);
> +		drm_err(drm_dev, "failed to get core clock (err=%d)\n", err);
> +		goto err_out;
> +	}
> +
> +	sys_clk = devm_clk_get(drm_dev->dev, "sys");
> +	if (IS_ERR(sys_clk))
> +		sys_clk = NULL;
> +
> +	mem_clk = devm_clk_get(drm_dev->dev, "mem");
> +	if (IS_ERR(mem_clk))
> +		mem_clk = NULL;
> +
> +	err = clk_prepare(core_clk);
> +	if (err)
> +		goto err_out;
> +
> +	if (sys_clk) {
> +		err = clk_prepare(sys_clk);
> +		if (err)
> +			goto err_deinit_core_clk;
> +	}
> +
> +	if (mem_clk) {
> +		err = clk_prepare(mem_clk);
> +		if (err)
> +			goto err_deinit_sys_clk;
> +	}
> +
> +	pvr_dev->core_clk = core_clk;
> +	pvr_dev->sys_clk = sys_clk;
> +	pvr_dev->mem_clk = mem_clk;
> +
> +	return 0;
> +
> +err_deinit_sys_clk:
> +	if (sys_clk)
> +		clk_disable_unprepare(sys_clk);
> +err_deinit_core_clk:
> +	clk_disable_unprepare(core_clk);
> +err_out:
> +	return err;
> +}
> +
> +/**
> + * pvr_device_clk_fini() - Deinitialize clocks required by a PowerVR device
> + * @pvr_dev: Target PowerVR device.
> + */
> +static void
> +pvr_device_clk_fini(struct pvr_device *pvr_dev)
> +{
> +	if (pvr_dev->mem_clk)
> +		clk_unprepare(pvr_dev->mem_clk);

Using devm_clk_get_(optional)_prepared() in the init function above might allow
these to be unprepaired for you, in that case this function also can be dropped.

> +	if (pvr_dev->sys_clk)
> +		clk_unprepare(pvr_dev->sys_clk);
> +	clk_unprepare(pvr_dev->core_clk);
> +
> +	pvr_dev->core_clk = NULL;
> +	pvr_dev->sys_clk = NULL;
> +	pvr_dev->mem_clk = NULL;
> +}
> +
> +/**
> + * pvr_device_regulator_init() - Initialise regulator required by a PowerVR device
> + * @pvr_dev: Target PowerVR device.
> + *
> + * The regulator is not a required devicetree property. If it is not present then this function will
> + * succeed, but &pvr_device->regulator will be %NULL.
> + *
> + * Returns:
> + *  * 0 on success, or
> + *  * Any error returned by devm_regulator_get().
> + */
> +static int
> +pvr_device_regulator_init(struct pvr_device *pvr_dev)
> +{
> +	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
> +	struct regulator *regulator;
> +	int err;
> +
> +	regulator = devm_regulator_get(drm_dev->dev, "power");
> +	if (IS_ERR(regulator)) {
> +		err = PTR_ERR(regulator);
> +		/* Regulator is not required, so ENODEV is allowed here. */

There is devm_regulator_get_optional(), might be what you want here.

Also using dev_err_probe() would check for probe defer here.

> +		if (err != -ENODEV)
> +			goto err_out;
> +		regulator = NULL;
> +	}
> +
> +	pvr_dev->regulator = regulator;
> +
> +	return 0;
> +
> +err_out:
> +	return err;
> +}
> +
> +/**
> + * pvr_device_init() - Initialize a PowerVR device
> + * @pvr_dev: Target PowerVR device.
> + *
> + * If this function returns successfully, the device will have been fully
> + * initialized. Otherwise, any parts of the device initialized before an error
> + * occurs will be de-initialized before returning.
> + *
> + * NOTE: The initialization steps currently taken are the bare minimum required
> + *       to read from the control registers. The device is unlikely to function
> + *       until further initialization steps are added. [This note should be
> + *       removed when that happens.]
> + *
> + * Return:
> + *  * 0 on success,
> + *  * Any error returned by pvr_device_reg_init(),
> + *  * Any error returned by pvr_device_clk_init(), or
> + *  * Any error returned by pvr_device_gpu_init().
> + */
> +int
> +pvr_device_init(struct pvr_device *pvr_dev)
> +{
> +	int err;
> +
> +	/* Enable and initialize clocks required for the device to operate. */
> +	err = pvr_device_clk_init(pvr_dev);
> +	if (err)
> +		goto err_out;
> +
> +	err = pvr_device_regulator_init(pvr_dev);
> +	if (err)
> +		goto err_device_clk_fini;
> +
> +	/* Map the control registers into memory. */
> +	err = pvr_device_reg_init(pvr_dev);
> +	if (err)
> +		goto err_device_reg_fini;
> +
> +	return 0;
> +
> +err_device_reg_fini:
> +	pvr_device_reg_fini(pvr_dev);
> +
> +err_device_clk_fini:
> +	pvr_device_clk_fini(pvr_dev);
> +
> +err_out:
> +	return err;
> +}
> +
> +/**
> + * pvr_device_fini() - Deinitialize a PowerVR device
> + * @pvr_dev: Target PowerVR device.
> + */
> +void
> +pvr_device_fini(struct pvr_device *pvr_dev)
> +{
> +	/*
> +	 * Deinitialization stages are performed in reverse order compared to
> +	 * the initialization stages in pvr_device_init().
> +	 */
> +	pvr_device_reg_fini(pvr_dev);
> +	pvr_device_clk_fini(pvr_dev);
> +}
> diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
> index 3d2865d726b8..c0dd0562844c 100644
> --- a/drivers/gpu/drm/imagination/pvr_device.h
> +++ b/drivers/gpu/drm/imagination/pvr_device.h
> @@ -11,9 +11,25 @@
>   #include <linux/bits.h>
>   #include <linux/compiler_attributes.h>
>   #include <linux/compiler_types.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
>   #include <linux/kernel.h>
> +#include <linux/math.h>
> +#include <linux/mutex.h>
> +#include <linux/timer.h>
>   #include <linux/types.h>
>   #include <linux/wait.h>
> +#include <linux/workqueue.h>
> +#include <linux/xarray.h>
> +
> +/* Forward declaration from <linux/clk.h>. */
> +struct clk;
> +
> +/* Forward declaration from <linux/firmware.h>. */
> +struct firmware;
> +
> +/* Forward declaration from <linux/regulator/consumer.h>. */
> +struct regulator;
>   
>   /**
>    * struct pvr_device - powervr-specific wrapper for &struct drm_device
> @@ -26,6 +42,29 @@ struct pvr_device {
>   	 * from_pvr_device().
>   	 */
>   	struct drm_device base;
> +
> +	/** @regs_resource: Resource representing device control registers. */
> +	struct resource *regs_resource;
> +
> +	/**
> +	 * @regs: Device control registers.
> +	 *
> +	 * These are mapped into memory when the device is initialized; that
> +	 * location is where this pointer points.
> +	 */
> +	void __iomem *regs;
> +
> +	/** @core_clk: General core clock. */
> +	struct clk *core_clk;
> +
> +	/** @sys_clk: System bus clock. */
> +	struct clk *sys_clk;
> +
> +	/** @mem_clk: Memory clock. */
> +	struct clk *mem_clk;
> +
> +	/** @regulator: Power regulator. */
> +	struct regulator *regulator;
>   };
>   
>   /**
> @@ -72,6 +111,181 @@ to_pvr_file(struct drm_file *file)
>   	return file->driver_priv;
>   }
>   
> +int pvr_device_init(struct pvr_device *pvr_dev);
> +void pvr_device_fini(struct pvr_device *pvr_dev);
> +
> +int
> +pvr_device_clk_core_get_freq(struct pvr_device *pvr_dev, u32 *freq_out);
> +
> +/**
> + * PVR_CR_READ32() - Read a 32-bit register from a PowerVR device
> + * @pvr_dev: Target PowerVR device.
> + * @reg: Target register.
> + *
> + * This macro is a wrapper around pvr_cr_read32(). It applies ROGUE_CR_ prefix
> + * to the provided @reg name, making it behave comparably to the
> + * PVR_CR_FIELD_GET() macro.
> + *
> + * Return: The value of the requested register.
> + */
> +#define PVR_CR_READ32(pvr_dev, reg) pvr_cr_read32(pvr_dev, ROGUE_CR_##reg)

Not a huge fan of all these oneline functions/macros, does this really add anyhing?
All it does IMHO is add two levels of indirection we have to track back though
to figure out what it actually is doing, when calling ioread32() directly would
have been just as clean and more obvious.

Andrew

> +
> +/**
> + * PVR_CR_READ64() - Read a 64-bit register from a PowerVR device
> + * @pvr_dev: Target PowerVR device.
> + * @reg: Target register.
> + *
> + * This macro is a wrapper around pvr_cr_read64(). It applies ROGUE_CR_ prefix
> + * to the provided @reg name, making it behave comparably to the
> + * PVR_CR_FIELD_GET() macro.
> + *
> + * Return: The value of the requested register.
> + */
> +#define PVR_CR_READ64(pvr_dev, reg) pvr_cr_read64(pvr_dev, ROGUE_CR_##reg)
> +
> +/**
> + * PVR_CR_WRITE32() - Write to a 32-bit register in a PowerVR device
> + * @pvr_dev: Target PowerVR device.
> + * @reg: Target register.
> + * @val: Value to write.
> + *
> + * This macro is a wrapper around pvr_cr_write32(). It applies ROGUE_CR_
> + * prefix to the provided @reg name, making it behave comparably to the
> + * PVR_CR_FIELD_GET() macro.
> + */
> +#define PVR_CR_WRITE32(pvr_dev, reg, val) \
> +	pvr_cr_write32(pvr_dev, ROGUE_CR_##reg, val)
> +
> +/**
> + * PVR_CR_WRITE64() - Write to a 64-bit register in a PowerVR device
> + * @pvr_dev: Target PowerVR device.
> + * @reg: Target register.
> + * @val: Value to write.
> + *
> + * This macro is a wrapper around pvr_cr_write64(). It applies ROGUE_CR_
> + * prefix to the provided @reg name, making it behave comparably to the
> + * PVR_CR_FIELD_GET() macro.
> + */
> +#define PVR_CR_WRITE64(pvr_dev, reg, val) \
> +	pvr_cr_write64(pvr_dev, ROGUE_CR_##reg, val)
> +
> +/**
> + * PVR_CR_FIELD_GET() - Extract a single field from a PowerVR control register
> + * @val: Value of the target register.
> + * @field: Field specifier, as defined in "pvr_rogue_cr_defs.h".
> + *
> + * Return: The extracted field.
> + */
> +#define PVR_CR_FIELD_GET(val, field) FIELD_GET(~ROGUE_CR_##field##_CLRMSK, val)
> +
> +/**
> + * pvr_cr_read32() - Read a 32-bit register from a PowerVR device
> + * @pvr_dev: Target PowerVR device.
> + * @reg: Target register.
> + *
> + * The wrapper macro PVR_CR_READ32() may be used instead to simplify the
> + * selection of @reg.
> + *
> + * Return: The value of the requested register.
> + */
> +static __always_inline u32
> +pvr_cr_read32(struct pvr_device *pvr_dev, u32 reg)
> +{
> +	return ioread32(pvr_dev->regs + reg);
> +}
> +
> +/**
> + * pvr_cr_read64() - Read a 64-bit register from a PowerVR device
> + * @pvr_dev: Target PowerVR device.
> + * @reg: Target register.
> + *
> + * The wrapper macro PVR_CR_READ64() may be used instead to simplify the
> + * selection of @reg.
> + *
> + * Return: The value of the requested register.
> + */
> +static __always_inline u64
> +pvr_cr_read64(struct pvr_device *pvr_dev, u32 reg)
> +{
> +	return ioread64(pvr_dev->regs + reg);
> +}
> +
> +/**
> + * pvr_cr_write32() - Write to a 32-bit register in a PowerVR device
> + * @pvr_dev: Target PowerVR device.
> + * @reg: Target register.
> + * @val: Value to write.
> + *
> + * The wrapper macro PVR_CR_WRITE32() may be used instead to simplify the
> + * selection of @reg.
> + */
> +static __always_inline void
> +pvr_cr_write32(struct pvr_device *pvr_dev, u32 reg, u32 val)
> +{
> +	iowrite32(val, pvr_dev->regs + reg);
> +}
> +
> +/**
> + * pvr_cr_write64() - Write to a 64-bit register in a PowerVR device
> + * @pvr_dev: Target PowerVR device.
> + * @reg: Target register.
> + * @val: Value to write.
> + *
> + * The wrapper macro PVR_CR_WRITE64() may be used instead to simplify the
> + * selection of @reg.
> + */
> +static __always_inline void
> +pvr_cr_write64(struct pvr_device *pvr_dev, u32 reg, u64 val)
> +{
> +	iowrite64(val, pvr_dev->regs + reg);
> +}
> +
> +/**
> + * pvr_cr_poll_reg32() - Wait for a 32-bit register to match a given value by
> + *                       polling
> + * @pvr_dev: Target PowerVR device.
> + * @reg_addr: Address of register.
> + * @reg_value: Expected register value (after masking).
> + * @reg_mask: Mask of bits valid for comparison with @reg_value.
> + * @timeout_usec: Timeout length, in us.
> + *
> + * Returns:
> + *  * 0 on success, or
> + *  * -%ETIMEDOUT on timeout.
> + */
> +static __always_inline int
> +pvr_cr_poll_reg32(struct pvr_device *pvr_dev, u32 reg_addr, u32 reg_value,
> +		  u32 reg_mask, u64 timeout_usec)
> +{
> +	u32 value;
> +
> +	return readl_poll_timeout(pvr_dev->regs + reg_addr, value,
> +		(value & reg_mask) == reg_value, 0, timeout_usec);
> +}
> +
> +/**
> + * pvr_cr_poll_reg64() - Wait for a 64-bit register to match a given value by
> + *                       polling
> + * @pvr_dev: Target PowerVR device.
> + * @reg_addr: Address of register.
> + * @reg_value: Expected register value (after masking).
> + * @reg_mask: Mask of bits valid for comparison with @reg_value.
> + * @timeout_usec: Timeout length, in us.
> + *
> + * Returns:
> + *  * 0 on success, or
> + *  * -%ETIMEDOUT on timeout.
> + */
> +static __always_inline int
> +pvr_cr_poll_reg64(struct pvr_device *pvr_dev, u32 reg_addr, u64 reg_value,
> +		  u64 reg_mask, u64 timeout_usec)
> +{
> +	u64 value;
> +
> +	return readq_poll_timeout(pvr_dev->regs + reg_addr, value,
> +		(value & reg_mask) == reg_value, 0, timeout_usec);
> +}
> +
>   /**
>    * DOC: IOCTL validation helpers
>    *
> diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
> index e203a2370f55..48a870715426 100644
> --- a/drivers/gpu/drm/imagination/pvr_drv.c
> +++ b/drivers/gpu/drm/imagination/pvr_drv.c
> @@ -485,12 +485,19 @@ pvr_probe(struct platform_device *plat_dev)
>   
>   	platform_set_drvdata(plat_dev, drm_dev);
>   
> -	err = drm_dev_register(drm_dev, 0);
> +	err = pvr_device_init(pvr_dev);
>   	if (err)
>   		goto err_out;
>   
> +	err = drm_dev_register(drm_dev, 0);
> +	if (err)
> +		goto err_device_fini;
> +
>   	return 0;
>   
> +err_device_fini:
> +	pvr_device_fini(pvr_dev);
> +
>   err_out:
>   	return err;
>   }
> @@ -499,8 +506,10 @@ static int
>   pvr_remove(struct platform_device *plat_dev)
>   {
>   	struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
> +	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
>   
>   	drm_dev_unregister(drm_dev);
> +	pvr_device_fini(pvr_dev);
>   
>   	return 0;
>   }
