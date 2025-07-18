Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E38C5B0A6DA
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 17:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6377610E193;
	Fri, 18 Jul 2025 15:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="X2ZT/tcf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5573F10E193
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 15:12:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1752851526; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OBxHUawpuLM546fy8RxVERZpQxETKF/2eWdf4eH7Gz8DMsGP1420RImiy7FIUAD20vhAsswbl7MQSBdqZ5rtGbCejgVh9pqmx/nShLJsx3HXZH7npHcNnXhpZ3iYWE5TG9KNfF6yAtCImRAJeG+DL+Y79tY+nmoYM9NmoMpEQo8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1752851526;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=OCor2K0Py4pMzURHWfr4G/qC2/0kd1MVhT9iMFzJIU0=; 
 b=m50i4q4fff0zxWJol18wGvV3svDzP5jGojC62G5RQWe4hF4iXsDxfQX6zZFKLGVZVsXXCYNA1mrI8exeVfJ2Vxr2T6O7/8pWaBKfu3nSexysRYpG60UUgKZI1jKmHiMHMEoUfBXQqaEA1CyAplKJr1s1qQThvDFM/KQMR1KGWcI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752851526; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=OCor2K0Py4pMzURHWfr4G/qC2/0kd1MVhT9iMFzJIU0=;
 b=X2ZT/tcfXxFVM8XLXvgHtx1WUGud4T+GBbbPI110zcS3dVbCzGfpryFWMDGTsFNt
 XM9fxxlV3EqKKD28ZPi3w4J+uDYi8m4OhbbBo3Z/dkSLs/bXmsfnQ5Z5bKkSt9bIXZb
 WTXLefc57JHkdOi30hYLfmmPbaWXIRT/f46JT8O4=
Received: by mx.zohomail.com with SMTPS id 1752851524359699.2523695026119;
 Fri, 18 Jul 2025 08:12:04 -0700 (PDT)
Date: Fri, 18 Jul 2025 16:11:59 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/7] drm/panthor: Add DEV_QUERY.PERF_INFO handling for
 Gx10
Message-ID: <b5oqisjeevzkowyw6acwydlencmxeb6fuonesny3paas37we6f@bgh674s7wqya>
References: <cover.1747148172.git.lukas.zapolskas@arm.com>
 <90e9521ad4deb13fd098f30ab3edae55cde8b5f5.1747148172.git.lukas.zapolskas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90e9521ad4deb13fd098f30ab3edae55cde8b5f5.1747148172.git.lukas.zapolskas@arm.com>
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

Hi Lucas, forgot to add one comment in the previous patch review,

On 16.05.2025 16:49, Lukas Zapolskas wrote:
> This change adds the IOCTL to query data about the performance counter
> setup. Some of this data was available via previous DEV_QUERY calls,
> for instance for GPU info, but exposing it via PERF_INFO
> minimizes the overhead of creating a single session to just the one
> aggregate IOCTL.
>
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panthor/Makefile         |  1 +
>  drivers/gpu/drm/panthor/panthor_device.c |  5 ++
>  drivers/gpu/drm/panthor/panthor_device.h |  3 +
>  drivers/gpu/drm/panthor/panthor_drv.c    | 10 +++-
>  drivers/gpu/drm/panthor/panthor_fw.h     |  3 +
>  drivers/gpu/drm/panthor/panthor_perf.c   | 76 ++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_perf.h   | 15 +++++
>  drivers/gpu/drm/panthor/panthor_regs.h   |  1 +
>  8 files changed, 113 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/panthor/panthor_perf.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_perf.h
>
> diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
> index 15294719b09c..0df9947f3575 100644
> --- a/drivers/gpu/drm/panthor/Makefile
> +++ b/drivers/gpu/drm/panthor/Makefile
> @@ -9,6 +9,7 @@ panthor-y := \
>  	panthor_gpu.o \
>  	panthor_heap.o \
>  	panthor_mmu.o \
> +	panthor_perf.o \
>  	panthor_sched.o
>
>  obj-$(CONFIG_DRM_PANTHOR) += panthor.o
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index a9da1d1eeb70..76b4cf3dc391 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -19,6 +19,7 @@
>  #include "panthor_fw.h"
>  #include "panthor_gpu.h"
>  #include "panthor_mmu.h"
> +#include "panthor_perf.h"
>  #include "panthor_regs.h"
>  #include "panthor_sched.h"
>
> @@ -259,6 +260,10 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	if (ret)
>  		goto err_unplug_fw;
>
> +	ret = panthor_perf_init(ptdev);
> +	if (ret)
> +		goto err_unplug_fw;
> +
>  	/* ~3 frames */
>  	pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
>  	pm_runtime_use_autosuspend(ptdev->base.dev);
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index da6574021664..657ccc39568c 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -120,6 +120,9 @@ struct panthor_device {
>  	/** @csif_info: Command stream interface information. */
>  	struct drm_panthor_csif_info csif_info;
>
> +	/** @perf_info: Performance counter interface information. */
> +	struct drm_panthor_perf_info perf_info;
> +
>  	/** @gpu: GPU management data. */
>  	struct panthor_gpu *gpu;
>
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 06fe46e32073..9d2b716cca45 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -175,7 +175,8 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
> -		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs))
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks))
>
>  /**
>   * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
> @@ -835,6 +836,10 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
>  			args->size = sizeof(priorities_info);
>  			return 0;
>
> +		case DRM_PANTHOR_DEV_QUERY_PERF_INFO:
> +			args->size = sizeof(ptdev->perf_info);
> +			return 0;
> +
>  		default:
>  			return -EINVAL;
>  		}
> @@ -859,6 +864,9 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
>  		panthor_query_group_priorities_info(file, &priorities_info);
>  		return PANTHOR_UOBJ_SET(args->pointer, args->size, priorities_info);
>
> +	case DRM_PANTHOR_DEV_QUERY_PERF_INFO:
> +		return PANTHOR_UOBJ_SET(args->pointer, args->size, ptdev->perf_info);
> +
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
> index 6598d96c6d2a..8bcb933fa790 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.h
> +++ b/drivers/gpu/drm/panthor/panthor_fw.h
> @@ -197,8 +197,11 @@ struct panthor_fw_global_control_iface {
>  	u32 output_va;
>  	u32 group_num;
>  	u32 group_stride;
> +#define GLB_PERFCNT_FW_SIZE(x) ((((x) >> 16) << 8))
>  	u32 perfcnt_size;
>  	u32 instr_features;
> +#define PERFCNT_FEATURES_MD_SIZE(x) (((x) & GENMASK(3, 0)) << 8)
> +	u32 perfcnt_features;
>  };
>
>  struct panthor_fw_global_input_iface {
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
> new file mode 100644
> index 000000000000..66e9a197ac1f
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/* Copyright 2023 Collabora Ltd */
> +/* Copyright 2025 Arm ltd. */
> +
> +#include <linux/bitops.h>
> +#include <drm/panthor_drm.h>
> +
> +#include "panthor_device.h"
> +#include "panthor_fw.h"
> +#include "panthor_perf.h"
> +
> +struct panthor_perf_counter_block {
> +	struct drm_panthor_perf_block_header header;
> +	u64 counters[];
> +};
> +
> +static size_t get_annotated_block_size(size_t counters_per_block)
> +{
> +	return struct_size_t(struct panthor_perf_counter_block, counters, counters_per_block);
> +}
> +
> +static size_t session_get_user_sample_size(const struct drm_panthor_perf_info *const info)
> +{
> +	const size_t block_size = get_annotated_block_size(info->counters_per_block);
> +	const size_t block_nr = info->cshw_blocks + info->fw_blocks +
> +		info->tiler_blocks + info->memsys_blocks + info->shader_blocks;
> +
> +	return sizeof(struct drm_panthor_perf_sample_header) + (block_size * block_nr);

I think you could use 'perf_info->sample_header_size' because you assign it in the calling function.

> +}
> +
> +/**
> + * PANTHOR_PERF_COUNTERS_PER_BLOCK - On CSF architectures pre-11.x, the number of counters
> + * per block was hardcoded to be 64. Arch 11.0 onwards supports the PRFCNT_FEATURES GPU register,
> + * which indicates the same information.
> + */
> +#define PANTHOR_PERF_COUNTERS_PER_BLOCK (64)
> +
> +static void panthor_perf_info_init(struct panthor_device *ptdev)
> +{
> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
> +	struct drm_panthor_perf_info *const perf_info = &ptdev->perf_info;
> +
> +	if (PERFCNT_FEATURES_MD_SIZE(glb_iface->control->perfcnt_features))
> +		perf_info->flags |= DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT;
> +
> +	perf_info->counters_per_block = PANTHOR_PERF_COUNTERS_PER_BLOCK;
> +
> +	perf_info->sample_header_size = sizeof(struct drm_panthor_perf_sample_header);
> +	perf_info->block_header_size = sizeof(struct drm_panthor_perf_block_header);
> +
> +	if (GLB_PERFCNT_FW_SIZE(glb_iface->control->perfcnt_size))
> +		perf_info->fw_blocks = 1;
> +
> +	perf_info->cshw_blocks = 1;
> +	perf_info->tiler_blocks = 1;
> +	perf_info->memsys_blocks = GPU_MEM_FEATURES_L2_SLICES(ptdev->gpu_info.mem_features);
> +	perf_info->shader_blocks = hweight64(ptdev->gpu_info.shader_present);
> +
> +	perf_info->sample_size = session_get_user_sample_size(perf_info);
> +}
> +
> +/**
> + * panthor_perf_init - Initialize the performance counter subsystem.
> + * @ptdev: Panthor device
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int panthor_perf_init(struct panthor_device *ptdev)
> +{
> +	if (!ptdev)
> +		return -EINVAL;
> +
> +	panthor_perf_info_init(ptdev);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
> new file mode 100644
> index 000000000000..3c32c24c164c
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_perf.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright 2025 Collabora Ltd */
> +/* Copyright 2025 Arm ltd. */
> +
> +#ifndef __PANTHOR_PERF_H__
> +#define __PANTHOR_PERF_H__
> +
> +#include <linux/types.h>
> +
> +struct panthor_device;
> +
> +int panthor_perf_init(struct panthor_device *ptdev);
> +
> +#endif /* __PANTHOR_PERF_H__ */
> +
> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
> index b7b3b3add166..d9e9379d1a20 100644
> --- a/drivers/gpu/drm/panthor/panthor_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
> @@ -27,6 +27,7 @@
>  #define GPU_TILER_FEATURES				0xC
>  #define GPU_MEM_FEATURES				0x10
>  #define   GROUPS_L2_COHERENT				BIT(0)
> +#define   GPU_MEM_FEATURES_L2_SLICES(x)			((((x) & GENMASK(11, 8)) >> 8) + 1)
>
>  #define GPU_MMU_FEATURES				0x14
>  #define  GPU_MMU_FEATURES_VA_BITS(x)			((x) & GENMASK(7, 0))
> --
> 2.33.0.dirty


Adrian Larumbe
