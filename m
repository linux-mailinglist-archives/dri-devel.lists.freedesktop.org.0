Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABF9A6B60D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 09:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7138310E109;
	Fri, 21 Mar 2025 08:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="c7yBHCqq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E33D10E109
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 08:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742545700;
 bh=3zmNVpWdo3j6NDIPP6/8TVQkTX3zooLzL7cRQn0r3PI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=c7yBHCqqEcr7dG7McbMN5i359ZQyXBDAaTo1mzPtrMcbgh6IEs6GjMfySGGLF0Ni/
 PQshbqKHNcrjRxC5T7ycPpM+zp5TYEWLDktzpBOMVlv21M8dNAOg9qWwYfkOiAspYe
 /5WbWw2YDvev7h+ZAWEoyyBUdwUa8znxlPmwlhHGScgHbSnIgbkxpGiyeXrRL9picX
 CqemaURuKgGVU4X3+uNDfteO8MJfwqb0/k38Ce0+QIbu4HXQe+hp3YlNesvKCz/jhK
 bNS2LwPwrVG2AiIPf2dQQ22McG3DYoY7DuNLvwuveMQdvWe0zDiaSXEJAtEqn1bN6Z
 iNlnAMjPBgYEw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2BAC117E0147;
 Fri, 21 Mar 2025 09:28:20 +0100 (CET)
Date: Fri, 21 Mar 2025 09:28:15 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/9] drm/panthor: Add GPU specific initialization
 framework
Message-ID: <20250321092815.66ab1798@collabora.com>
In-Reply-To: <20250320111741.1937892-4-karunika.choo@arm.com>
References: <20250320111741.1937892-1-karunika.choo@arm.com>
 <20250320111741.1937892-4-karunika.choo@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Thu, 20 Mar 2025 11:17:35 +0000
Karunika Choo <karunika.choo@arm.com> wrote:

> This patch aims to lay the foundation to provide support for multiple
> Mali GPUs through a framework by which differences in registers,
> functionality, and features can be managed.
> 
> It introduces the concept of the arch_id which is a 32-bit ID in the
> format of ((arch_major << 16) | (arch_minor << 8) | arch_rev). The 8-bit
> fields of the arch_id provides future proofing past the 4-bit fields of
> the GPU_ID's arch_major, arch_minor, and arch_rev.
> 
> The arch_id is used to select the correct abstraction for the GPU, such
> as function pointers for operations specific to the GPU, base addresses
> describing changes in register offsets, and supported features.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
>  drivers/gpu/drm/panthor/Makefile         |  1 +
>  drivers/gpu/drm/panthor/panthor_device.c |  5 ++
>  drivers/gpu/drm/panthor/panthor_device.h |  3 +
>  drivers/gpu/drm/panthor/panthor_hw.c     | 70 ++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_hw.h     | 63 +++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_regs.h   |  2 +
>  6 files changed, 144 insertions(+)
>  create mode 100644 drivers/gpu/drm/panthor/panthor_hw.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_hw.h
> 
> diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
> index 15294719b09c..02db21748c12 100644
> --- a/drivers/gpu/drm/panthor/Makefile
> +++ b/drivers/gpu/drm/panthor/Makefile
> @@ -8,6 +8,7 @@ panthor-y := \
>  	panthor_gem.o \
>  	panthor_gpu.o \
>  	panthor_heap.o \
> +	panthor_hw.o \
>  	panthor_mmu.o \
>  	panthor_sched.o
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index a9da1d1eeb70..a6fca6b3fabd 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -18,6 +18,7 @@
>  #include "panthor_device.h"
>  #include "panthor_fw.h"
>  #include "panthor_gpu.h"
> +#include "panthor_hw.h"
>  #include "panthor_mmu.h"
>  #include "panthor_regs.h"
>  #include "panthor_sched.h"
> @@ -243,6 +244,10 @@ int panthor_device_init(struct panthor_device *ptdev)
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
> index da6574021664..82741bf1a49b 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -120,6 +120,9 @@ struct panthor_device {
>  	/** @csif_info: Command stream interface information. */
>  	struct drm_panthor_csif_info csif_info;
>  
> +	/** @hw: GPU specific data. */
> +	struct panthor_hw *hw;
> +
>  	/** @gpu: GPU management data. */
>  	struct panthor_gpu *gpu;
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> new file mode 100644
> index 000000000000..234bfd50cf0d
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/* Copyright 2025 ARM Limited. All rights reserved. */
> +
> +#include "panthor_device.h"
> +#include "panthor_hw.h"
> +#include "panthor_regs.h"
> +
> +static struct panthor_hw panthor_hw_devices[] = {
> +	{
> +		.arch_id = GPU_ARCH_ID_MAKE(10, 0, 0),
> +		.arch_mask = GPU_ARCH_ID_MAKE(0xFF, 0, 0),
> +	},
> +};
> +
> +static int init_gpu_id(struct panthor_device *ptdev)
> +{
> +	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
> +
> +	if (!ptdev->gpu_info.gpu_id) {
> +		drm_err(&ptdev->base, "Invalid GPU ID (0x0)");
> +		return -ENXIO;
> +	}
> +
> +	return 0;
> +}
> +
> +int panthor_hw_init(struct panthor_device *ptdev)
> +{
> +	struct panthor_hw *hdev = NULL;
> +	u32 arch_id = 0;
> +	int i, ret;
> +
> +	ret = init_gpu_id(ptdev);
> +	if (ret)
> +		return ret;
> +
> +	arch_id = GPU_ARCH_ID_MAKE(GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id),
> +				   GPU_ARCH_MINOR(ptdev->gpu_info.gpu_id),
> +				   GPU_ARCH_REV(ptdev->gpu_info.gpu_id));
> +	if (!arch_id) {
> +		drm_err(&ptdev->base, "Invalid arch_id (0x0)");
> +		return -ENXIO;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(panthor_hw_devices); i++) {
> +		u32 mask = panthor_hw_devices[i].arch_mask;
> +		u32 hw_arch_id = panthor_hw_devices[i].arch_id;
> +
> +		if ((arch_id & mask) == (hw_arch_id & mask)) {
> +			hdev = &panthor_hw_devices[i];
> +			break;
> +		}
> +	}
> +
> +	if (!hdev) {
> +		drm_err(&ptdev->base, "Unsupported GPU (arch 0x%x)", arch_id);
> +		return -ENODEV;
> +	}
> +
> +	ptdev->hw = hdev;
> +
> +	return 0;
> +}
> +
> +bool panthor_hw_supports(struct panthor_device *ptdev,
> +			 enum panthor_hw_feature feature)
> +{
> +	return test_bit(feature, ptdev->hw->features);
> +}
> +
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
> new file mode 100644
> index 000000000000..5eb0549ad333
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_hw.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright 2025 ARM Limited. All rights reserved. */
> +
> +#ifndef __PANTHOR_HW_H__
> +#define __PANTHOR_HW_H__
> +
> +#include <linux/types.h>
> +#include <linux/bitmap.h>
> +
> +struct panthor_device;
> +
> +/**
> + * enum panthor_hw_feature - Bit position of each HW feature
> + *
> + * Used to define GPU specific features based on the GPU architecture ID.
> + * New feature flags will be added with support for newer GPU architectures.
> + */
> +enum panthor_hw_feature {
> +	/** @PANTHOR_HW_FEATURES_END: Must be last. */
> +	PANTHOR_HW_FEATURES_END
> +};
> +
> +/**
> + * struct panthor_hw_regmap - Register offsets for specific register blocks
> + */
> +struct panthor_hw_regmap {
> +
> +};
> +
> +/**
> + * struct panthor_hw_ops - HW operations that are specific to a GPU
> + */
> +struct panthor_hw_ops {
> +
> +};
> +
> +/**
> + * struct panthor_hw - GPU specific register mapping and functions
> + */
> +struct panthor_hw {
> +	/** @arch_id: Architecture id to match against */
> +	u32 arch_id;
> +
> +	/** @arch_mask: Mask for architecture id comparison */
> +	u32 arch_mask;
> +
> +	/** @features: Bitmap containing panthor_hw_feature */
> +	DECLARE_BITMAP(features, PANTHOR_HW_FEATURES_END);
> +
> +	/** @map: Panthor regmap */
> +	struct panthor_hw_regmap map;
> +
> +	/** @ops: Panthor HW specific operations */
> +	struct panthor_hw_ops ops;

Do we really need per minor arch specialization if we already have per
GPU information through panthor_model?

The way I see it, we can have a device operation specialization per
major arch, then some tweaking done in the arch major init callback
based on the minor version. And the final tweaks applied per GPU model.

> +};
> +
> +int panthor_hw_init(struct panthor_device *ptdev);
> +
> +bool panthor_hw_supports(struct panthor_device *ptdev,
> +			 enum panthor_hw_feature feature);
> +
> +#endif /* __PANTHOR_HW_H__ */
> +
> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
> index 7ec4a1d04e20..ba452c1dd644 100644
> --- a/drivers/gpu/drm/panthor/panthor_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
> @@ -19,6 +19,8 @@
>  #define   GPU_VER_MINOR(x)				(((x) & GENMASK(11, 4)) >> 4)
>  #define   GPU_VER_STATUS(x)				((x) & GENMASK(3, 0))
>  
> +#define GPU_ARCH_ID_MAKE(major, minor, rev)		(((major) << 16) | ((minor) << 8) | (rev))
> +
>  #define GPU_L2_FEATURES					0x4
>  #define  GPU_L2_FEATURES_LINE_SIZE(x)			(1 << ((x) & GENMASK(7, 0)))
>  

