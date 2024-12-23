Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A239FB35B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 17:55:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986FD10E445;
	Mon, 23 Dec 2024 16:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1FC5C10E445
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 16:55:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1BD41424;
 Mon, 23 Dec 2024 08:56:04 -0800 (PST)
Received: from [10.57.73.219] (unknown [10.57.73.219])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D1F63F694;
 Mon, 23 Dec 2024 08:55:32 -0800 (PST)
Message-ID: <3a8aebd0-d559-4340-ad7d-b6c45ee40440@arm.com>
Date: Mon, 23 Dec 2024 16:55:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] drm/panthor: Add parsed gpu properties
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20241219170521.64879-1-karunika.choo@arm.com>
 <20241219170521.64879-3-karunika.choo@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241219170521.64879-3-karunika.choo@arm.com>
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
> This patch adds parsing of GPU register fields on initialization instead of
> parsing the fields each time it is needed.

Why? ;)

The commit message should ideally explain the reason behind a change
rather than the change itself (that should ideally be obvious from the
patch). (See below for more).

Also from a reviewer's perspective it's hard to review patches which
both move code between files and change it. So splitting into an initial
patch which just moves code into the new panthor_props.c and a follow up
patch would make the review easier.

> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
> ---
>  drivers/gpu/drm/panthor/Makefile         |   1 +
>  drivers/gpu/drm/panthor/panthor_device.c |   1 +
>  drivers/gpu/drm/panthor/panthor_device.h |   4 +
>  drivers/gpu/drm/panthor/panthor_fw.c     |   5 +-
>  drivers/gpu/drm/panthor/panthor_gpu.c    | 105 ++--------------
>  drivers/gpu/drm/panthor/panthor_heap.c   |   6 +-
>  drivers/gpu/drm/panthor/panthor_mmu.c    |  21 +---
>  drivers/gpu/drm/panthor/panthor_props.c  | 151 +++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_props.h  |  70 +++++++++++
>  drivers/gpu/drm/panthor/panthor_regs.h   |   5 +
>  drivers/gpu/drm/panthor/panthor_sched.c  |   6 +-
>  11 files changed, 252 insertions(+), 123 deletions(-)
>  create mode 100644 drivers/gpu/drm/panthor/panthor_props.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_props.h
> 
[...]
> diff --git a/drivers/gpu/drm/panthor/panthor_props.c b/drivers/gpu/drm/panthor/panthor_props.c
> new file mode 100644
> index 000000000000..0a379feaf12d
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_props.c
> @@ -0,0 +1,151 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/* Copyright 2024 ARM Limited. All rights reserved. */
> +
> +#include <drm/drm_managed.h>
> +
> +#include "panthor_device.h"
> +#include "panthor_props.h"
> +#include "panthor_regs.h"
> +
> +static void panthor_props_arch_10_8_init_info(struct panthor_device *ptdev)
> +{
> +	unsigned int i;
> +
> +	ptdev->gpu_info.csf_id = gpu_read(ptdev, GPU_CSF_ID);
> +	ptdev->gpu_info.gpu_rev = gpu_read(ptdev, GPU_REVID);
> +	ptdev->gpu_info.core_features = gpu_read(ptdev, GPU_CORE_FEATURES);
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
> +}
> +
> +static void panthor_props_arch_10_8_parse_props(struct panthor_device *ptdev)
> +{
> +	struct panthor_props *props = ptdev->props;
> +	struct drm_panthor_gpu_info *info = &ptdev->gpu_info;
> +
> +	props->shader_core_count = hweight64(info->shader_present);
> +	props->mmu_va_bits = GPU_MMU_FEATURES_VA_BITS(info->mmu_features);
> +	props->mmu_pa_bits = GPU_MMU_FEATURES_PA_BITS(info->mmu_features);
> +	props->mmu_as_count = hweight32(info->as_present);
> +	props->l2_line_size = GPU_L2_FEATURES_LINE_SIZE(info->l2_features);

From the function name I can guess that you want to future proof against
these registers being moved around. If so that should definitely be in
the commit message.

I'm also somewhat tempted to say we should "wait-and-see" whether this
abstraction is necessary.

> +
> +	/* On 32-bit kernels, the VA space is limited by the io_pgtable_ops abstraction,
> +	 * which passes iova as an unsigned long. Patch the mmu_features to reflect this
> +	 * limitation.
> +	 */
> +	if (props->mmu_va_bits > BITS_PER_LONG) {
> +		props->mmu_va_bits = BITS_PER_LONG;
> +		info->mmu_features &= ~GENMASK(7, 0);
> +		info->mmu_features |= BITS_PER_LONG;
> +	}
> +}
> +
> +static void panthor_props_arch_10_8_get_present_regs(struct panthor_device *ptdev)
> +{
> +	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
> +	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT_LO);
> +	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT_LO);
> +	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT_LO);
> +}
> +
> +static char *panthor_props_get_gpu_name(struct panthor_device *ptdev)
> +{
> +	struct panthor_gpu_id_props *gpu_id = &ptdev->props->gpu_id;
> +
> +	switch (gpu_id->product_id) {
> +	case GPU_PRODUCT_ID_MAKE(10, 2):
> +		return "Mali-G710";
> +	case GPU_PRODUCT_ID_MAKE(10, 7):
> +		return "Mali-G610";
> +	case GPU_PRODUCT_ID_MAKE(10, 3):
> +		return "Mali-G510";
> +	case GPU_PRODUCT_ID_MAKE(10, 4):
> +		return "Mali-G310";
> +	}

You've sneaked in a bunch of new product names - this definitely
shouldn't be in this patch.

> +
> +	return "(Unknown Mali GPU)";
> +}
> +
> +static void panthor_props_show_info(struct panthor_device *ptdev)
> +{
> +	struct panthor_gpu_id_props *gpu_id = &ptdev->props->gpu_id;
> +
> +	drm_info(&ptdev->base, "%s id 0x%x major 0x%x minor 0x%x status 0x%x",
> +		 panthor_props_get_gpu_name(ptdev), gpu_id->arch_id,
> +		 gpu_id->version_major, gpu_id->version_minor,
> +		 gpu_id->version_status);
> +
> +	drm_info(&ptdev->base,
> +		 "Features: L2:%#x Tiler:%#x Mem:%#x MMU:%#x AS:%#x",
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
> +int panthor_props_gpu_id_init(struct panthor_device *ptdev)
> +{
> +	struct panthor_gpu_id_props *gpu_id = &ptdev->props->gpu_id;
> +	struct drm_panthor_gpu_info *info = &ptdev->gpu_info;
> +
> +	info->gpu_id = gpu_read(ptdev, GPU_ID);
> +	if (!info->gpu_id)
> +		return -ENXIO;
> +
> +	gpu_id->arch_major = GPU_ARCH_MAJOR(info->gpu_id);
> +	gpu_id->arch_minor = GPU_ARCH_MINOR(info->gpu_id);
> +	gpu_id->arch_rev = GPU_ARCH_REV(info->gpu_id);
> +	gpu_id->product_major = GPU_PROD_MAJOR(info->gpu_id);
> +	gpu_id->version_major = GPU_VER_MAJOR(info->gpu_id);
> +	gpu_id->version_minor = GPU_VER_MINOR(info->gpu_id);
> +	gpu_id->version_status = GPU_VER_STATUS(info->gpu_id);

Why do we need to store the GPU_ID twice (once as the gpu_id register
and once again broken down)? The bit masking/extraction is really cheap.

> +
> +	gpu_id->arch_id = GPU_ARCH_ID_MAKE(
> +		gpu_id->arch_major, gpu_id->arch_minor, gpu_id->arch_rev);
> +	gpu_id->product_id =
> +		GPU_PRODUCT_ID_MAKE(gpu_id->arch_major, gpu_id->product_major);

And here we're gluing it back together... All for the benefit of a
drm_info() - clearly not a performance path.

Steve

> +
> +	return 0;
> +}
> +
> +void panthor_props_load(struct panthor_device *ptdev)
> +{
> +	panthor_props_arch_10_8_init_info(ptdev);
> +	panthor_props_arch_10_8_get_present_regs(ptdev);
> +	panthor_props_arch_10_8_parse_props(ptdev);
> +
> +	panthor_props_show_info(ptdev);
> +}
> +
> +int panthor_props_init(struct panthor_device *ptdev)
> +{
> +	struct panthor_props *props;
> +	int ret;
> +
> +	props = drmm_kzalloc(&ptdev->base, sizeof(*props), GFP_KERNEL);
> +	if (!props)
> +		return -ENOMEM;
> +
> +	ptdev->props = props;
> +
> +	ret = panthor_props_gpu_id_init(ptdev);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/panthor/panthor_props.h b/drivers/gpu/drm/panthor/panthor_props.h
> new file mode 100644
> index 000000000000..af39a7c7433f
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_props.h
> @@ -0,0 +1,70 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright 2024 ARM Limited. All rights reserved. */
> +
> +#ifndef __PANTHOR_PROPS_H__
> +#define __PANTHOR_PROPS_H__
> +
> +struct panthor_device;
> +
> +/**
> + * struct panthor_gpu_id_props - Parsed GPU_ID properties
> + */
> +struct panthor_gpu_id_props {
> +	/** @arch_major: Architecture major revision */
> +	u8 arch_major;
> +
> +	/** @arch_minor: Architecture minor revision */
> +	u8 arch_minor;
> +
> +	/** @arch_rev: Architecture patch revision */
> +	u8 arch_rev;
> +
> +	/** @product_major: Product identifier */
> +	u8 product_major;
> +
> +	/** @version_major: Major release version number */
> +	u8 version_major;
> +
> +	/** @version_minor: Minor release version number */
> +	u8 version_minor;
> +
> +	/** @version_status: Status of the GPU release */
> +	u8 version_status;
> +
> +	/** @arch_id: Composite ID of arch_major, arch_minor and arch_rev */
> +	u32 arch_id;
> +
> +	/** @arch_id: Composite ID of arch_major and product_major */
> +	u32 product_id;
> +};
> +
> +/**
> + * struct panthor_props - Parsed GPU properties
> + */
> +struct panthor_props {
> +	/** @gpu_id: parsed GPU_ID properties */
> +	struct panthor_gpu_id_props gpu_id;
> +
> +	/** @shader_core_count: Number of shader cores present */
> +	u8 shader_core_count;
> +
> +	/** @mmu_va_bits: Number of bits supported in virtual addresses */
> +	u8 mmu_va_bits;
> +
> +	/** @mmu_pa_bits: Number of bits supported in physical addresses */
> +	u8 mmu_pa_bits;
> +
> +	/** @mmu_as_count: Number of address spaces present */
> +	u8 mmu_as_count;
> +
> +	/** @l2_line_size: L2 cache line size */
> +	u8 l2_line_size;
> +};
> +
> +int panthor_props_gpu_id_init(struct panthor_device *ptdev);
> +
> +void panthor_props_load(struct panthor_device *ptdev);
> +
> +int panthor_props_init(struct panthor_device *ptdev);
> +
> +#endif /* __PANTHOR_PROPS_H__ */
> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
> index 269c2c68dde2..bad172b8af82 100644
> --- a/drivers/gpu/drm/panthor/panthor_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
> @@ -22,6 +22,11 @@
>  #define   GPU_VER_MINOR(x)				(((x) & GENMASK(11, 4)) >> 4)
>  #define   GPU_VER_STATUS(x)				((x) & GENMASK(3, 0))
>  
> +#define GPU_ARCH_ID_MAKE(major, minor, rev) \
> +	(((major) << 16) | ((minor) << 8) | (rev))
> +#define GPU_PRODUCT_ID_MAKE(arch_major, product_major) \
> +	(((arch_major) << 24) | (product_major))
> +
>  #define GPU_L2_FEATURES					0x4
>  #define  GPU_L2_FEATURES_LINE_SIZE(x)			(1 << ((x) & GENMASK(7, 0)))
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 77b184c3fb0c..209fd9576969 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -29,6 +29,7 @@
>  #include "panthor_gpu.h"
>  #include "panthor_heap.h"
>  #include "panthor_mmu.h"
> +#include "panthor_props.h"
>  #include "panthor_regs.h"
>  #include "panthor_sched.h"
>  
> @@ -3832,10 +3833,9 @@ int panthor_sched_init(struct panthor_device *ptdev)
>  	num_groups = min_t(u32, MAX_CSG_PRIO + 1, num_groups);
>  
>  	/* We need at least one AS for the MCU and one for the GPU contexts. */
> -	gpu_as_count = hweight32(ptdev->gpu_info.as_present & GENMASK(31, 1));
> -	if (!gpu_as_count) {
> +	if (ptdev->props->mmu_as_count < 2) {
>  		drm_err(&ptdev->base, "Not enough AS (%d, expected at least 2)",
> -			gpu_as_count + 1);
> +			ptdev->props->mmu_as_count);
>  		return -EINVAL;
>  	}
>  

