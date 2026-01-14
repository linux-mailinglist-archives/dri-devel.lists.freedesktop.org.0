Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E469D1DDF4
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 11:11:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B5410E5E9;
	Wed, 14 Jan 2026 10:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="csRCAjQv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C71710E320
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 10:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768385508;
 bh=h+UzTLPVfy9+Dq9qX4CcdvZbpW7U11gROlNg5qYQDys=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=csRCAjQvgFOPOEsbhxAHsKpPk7Eqrts4QD7WbOBFcJvgxgbIen0+d3MmhaNCacNf+
 7dk7y7329iQzQmwwRXLHYF6l5Mn+daWUwbObR46FvJRUATKJuiNrdJ5Ilbng+D/E61
 9uKDpbAJDuaM5HT0Pqz1HOZUYL4gu0wWf273q1InsVOu8ibgiczCmo3QEgDaNMaamC
 KEgt9M7uljn3lU+1JeMzqzn4i5HDNKv1XPFN/FCfhXu6QaawKnl4lwcxl17AsTMPYS
 CSzJNTXp/EieH5BW1K3u/NIt4l+kftemh9yvJHt1BNNpRHAA0PYZHDXvX9mdUJZ8IP
 8JuPjAEhfqtPA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5DC8117E10C8;
 Wed, 14 Jan 2026 11:11:48 +0100 (CET)
Date: Wed, 14 Jan 2026 11:11:43 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, nd@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Mihail
 Atanassov <mihail.atanassov@arm.com>
Subject: Re: [PATCH v6 2/7] drm/panthor: Add DEV_QUERY.PERF_INFO handling
 for Gx10
Message-ID: <20260114111143.4d415194@fedora>
In-Reply-To: <20251215171453.2506348-3-lukas.zapolskas@arm.com>
References: <20251215171453.2506348-1-lukas.zapolskas@arm.com>
 <20251215171453.2506348-3-lukas.zapolskas@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 15 Dec 2025 17:14:48 +0000
Lukas Zapolskas <lukas.zapolskas@arm.com> wrote:

> This change adds the IOCTL to query data about the performance counter
> setup. Some of this data was available via previous DEV_QUERY calls,
> for instance for GPU info, but exposing it via PERF_INFO
> minimizes the overhead of creating a single session to just the one
> aggregate IOCTL.
>=20
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> Reviewed-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panthor/Makefile         |  1 +
>  drivers/gpu/drm/panthor/panthor_device.c |  7 ++
>  drivers/gpu/drm/panthor/panthor_device.h |  3 +
>  drivers/gpu/drm/panthor/panthor_drv.c    | 10 ++-
>  drivers/gpu/drm/panthor/panthor_fw.h     |  3 +
>  drivers/gpu/drm/panthor/panthor_perf.c   | 89 ++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_perf.h   | 15 ++++
>  drivers/gpu/drm/panthor/panthor_regs.h   |  3 +
>  8 files changed, 130 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/panthor/panthor_perf.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_perf.h
>=20
> diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/M=
akefile
> index 753a32c446df..824e5d6e9e3d 100644
> --- a/drivers/gpu/drm/panthor/Makefile
> +++ b/drivers/gpu/drm/panthor/Makefile
> @@ -10,6 +10,7 @@ panthor-y :=3D \
>  	panthor_heap.o \
>  	panthor_hw.o \
>  	panthor_mmu.o \
> +	panthor_perf.o \
>  	panthor_pwr.o \
>  	panthor_sched.o
> =20
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/p=
anthor/panthor_device.c
> index 54fbb1aa07c5..dc237da92340 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -22,6 +22,7 @@
>  #include "panthor_gpu.h"
>  #include "panthor_hw.h"
>  #include "panthor_mmu.h"
> +#include "panthor_perf.h"
>  #include "panthor_pwr.h"
>  #include "panthor_regs.h"
>  #include "panthor_sched.h"
> @@ -305,6 +306,10 @@ int panthor_device_init(struct panthor_device *ptdev)
> =20
>  	panthor_gem_init(ptdev);
> =20
> +	ret =3D panthor_perf_init(ptdev);
> +	if (ret)
> +		goto err_unplug_sched;
> +
>  	/* ~3 frames */
>  	pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
>  	pm_runtime_use_autosuspend(ptdev->base.dev);
> @@ -318,6 +323,8 @@ int panthor_device_init(struct panthor_device *ptdev)
> =20
>  err_disable_autosuspend:
>  	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
> +
> +err_unplug_sched:
>  	panthor_sched_unplug(ptdev);
> =20
>  err_unplug_fw:
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/p=
anthor/panthor_device.h
> index f35e52b9546a..64b0048de6ac 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -142,6 +142,9 @@ struct panthor_device {
>  	/** @pwr: Power control management data. */
>  	struct panthor_pwr *pwr;
> =20
> +	/** @perf_info: Performance counter interface information. */
> +	struct drm_panthor_perf_info perf_info;
> +
>  	/** @gpu: GPU management data. */
>  	struct panthor_gpu *gpu;
> =20
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index 98d4e8d867ed..f9e01c42d237 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -178,7 +178,8 @@ panthor_get_uobj_array(const struct drm_panthor_obj_a=
rray *in, u32 min_stride,
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
> -		 PANTHOR_UOBJ_DECL(struct drm_panthor_bo_sync_op, size))
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_bo_sync_op, size), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks))
> =20
>  /**
>   * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
> @@ -838,6 +839,10 @@ static int panthor_ioctl_dev_query(struct drm_device=
 *ddev, void *data, struct d
>  			args->size =3D sizeof(priorities_info);
>  			return 0;
> =20
> +		case DRM_PANTHOR_DEV_QUERY_PERF_INFO:
> +			args->size =3D sizeof(ptdev->perf_info);
> +			return 0;
> +
>  		default:
>  			return -EINVAL;
>  		}
> @@ -862,6 +867,9 @@ static int panthor_ioctl_dev_query(struct drm_device =
*ddev, void *data, struct d
>  		panthor_query_group_priorities_info(file, &priorities_info);
>  		return PANTHOR_UOBJ_SET(args->pointer, args->size, priorities_info);
> =20
> +	case DRM_PANTHOR_DEV_QUERY_PERF_INFO:
> +		return PANTHOR_UOBJ_SET(args->pointer, args->size, ptdev->perf_info);
> +
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panth=
or/panthor_fw.h
> index fbdc21469ba3..dae78618a080 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.h
> +++ b/drivers/gpu/drm/panthor/panthor_fw.h
> @@ -198,8 +198,11 @@ struct panthor_fw_global_control_iface {
>  	u32 output_va;
>  	u32 group_num;
>  	u32 group_stride;
> +#define GLB_PERFCNT_FW_SIZE(x) ((((x) >> 16) << 8))
>  	u32 perfcnt_size;
>  	u32 instr_features;
> +#define PERFCNT_FEATURES_MD_SIZE(x) (((x) & GENMASK(3, 0)) << 8)
> +	u32 perfcnt_features;
>  };
> =20
>  struct panthor_fw_global_input_iface {
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/pan=
thor/panthor_perf.c
> new file mode 100644
> index 000000000000..842d62826ac3
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
> @@ -0,0 +1,89 @@
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
> +#include "panthor_regs.h"
> +
> +/**
> + * PANTHOR_PERF_COUNTERS_PER_BLOCK - On CSF architectures pre-11.x, the =
number of counters

According to the doc, the kernel doc format for object-like macros is

/** define XXX - blabla */

But actually, I'm not sure we want to make all these kernel doc
comments because:

1. doc is not generated out of panthor source files
2. kernel doc is inconsistent across these new files (sometimes
   entirely missing for structs, other times it's there for fields, but
   the /** struct xxxx - blabla */ header is missing, ...
3. for any internal stuff, when the name is obvious (like is the case
   here), I'm not convinced we need extra doc at all
4. my personal feel on comments is that too many comments can also hurt
   readability. Important information tends to get lost in the noise of
   all other trivial comments

So, what I've tried to do in panthor so far is:

- document functions that are exposed by a module to other modules (non
  static functions) using kernel doc headers
- document uAPI with kernel doc headers (IIRC, those are parsed)
- when it's not obvious what an internal/static function does, add a
  simple comment to explain it
- sprinkle comments in various places when I feel it deserves an
  explanation (which admittedly, is very subjective)

> + * per block was hardcoded to be 64. Arch 11.0 onwards supports the PRFC=
NT_FEATURES GPU register,
> + * which indicates the same information.
> + */
> +#define PANTHOR_PERF_COUNTERS_PER_BLOCK (64)

Drop the parenthesis for those single constant values. Also, given this
is only used once, and this only applies to v10, I think I'd prefer to
have

	perf_info->counters_per_block =3D 64;

with the comment moved next to this counters_per_block initialization
(just before the if/else).

> +
> +/**
> + * PANTHOR_HW_COUNTER_SIZE - The size of a hardware counter in the FW ri=
ng buffer.
> + */
> +#define PANTHOR_HW_COUNTER_SIZE (sizeof(u32))

Drop the parens.

> +
> +struct panthor_perf_counter_block {
> +	struct drm_panthor_perf_block_header header;
> +	u64 counters[];
> +};

See, that one I think deserves some explanation. Above you say a
HW counter is 32-bit, but it's a u64 array you have here. I get why,
that's accumulated counter values that are passed to userspace, while
the other macro is for raw HW counters in a FW ringbug, but there's no
comment saying what panthor_perf_counter_block is for or mentioning why
SW counter size differs.

> +
> +static size_t get_annotated_block_size(size_t counters_per_block)
> +{
> +	return struct_size_t(struct panthor_perf_counter_block, counters, count=
ers_per_block);
> +}
> +
> +static size_t session_get_user_sample_size(const struct drm_panthor_perf=
_info *const info)
> +{
> +	const size_t block_size =3D get_annotated_block_size(info->counters_per=
_block);
> +	const size_t block_nr =3D info->cshw_blocks + info->fw_blocks +
> +		info->tiler_blocks + info->memsys_blocks + info->shader_blocks;
> +
> +	return info->sample_header_size + (block_size * block_nr);
> +}
> +
> +static void panthor_perf_info_init(struct panthor_device *const ptdev)
> +{
> +	struct panthor_fw_global_iface *glb_iface =3D panthor_fw_get_glb_iface(=
ptdev);
> +	struct drm_panthor_perf_info *const perf_info =3D &ptdev->perf_info;
> +
> +	if (PERFCNT_FEATURES_MD_SIZE(glb_iface->control->perfcnt_features))
> +		perf_info->flags |=3D DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT;
> +
> +	if (GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id) < 11) {
> +		perf_info->counters_per_block =3D PANTHOR_PERF_COUNTERS_PER_BLOCK;
> +	} else {
> +		u32 features =3D gpu_read(ptdev, GPU_PRFCNT_FEATURES);
> +
> +		perf_info->counters_per_block =3D PRFCNT_FEATURES_COUNTER_BLOCK_SIZE(f=
eatures) /
> +			PANTHOR_HW_COUNTER_SIZE;
> +	}

As suggested above, I'd go for:

        /* PANTHOR_PERF_COUNTERS_PER_BLOCK - On CSF architectures pre-11.x,=
 the
         * number of counters per block was hardcodedto be 64. Arch 11.0 on=
wards
         * supports the PRFCNT_FEATURES GPU register, which indicates the s=
ame
         * information.
         */
        if (GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id) < 11) {
                perf_info->counters_per_block =3D 64;
        } else {
                u32 features =3D gpu_read(ptdev, GPU_PRFCNT_FEATURES);
                u32 blk_size =3D PRFCNT_FEATURES_COUNTER_BLOCK_SIZE(feature=
s);

                perf_info->counters_per_block =3D blk_size / PANTHOR_HW_COU=
NTER_SIZE;
	}

> +
> +	perf_info->sample_header_size =3D sizeof(struct drm_panthor_perf_sample=
_header);
> +	perf_info->block_header_size =3D sizeof(struct drm_panthor_perf_block_h=
eader);
> +
> +	if (GLB_PERFCNT_FW_SIZE(glb_iface->control->perfcnt_size))
> +		perf_info->fw_blocks =3D 1;
> +
> +	perf_info->cshw_blocks =3D 1;
> +	perf_info->tiler_blocks =3D 1;
> +	perf_info->memsys_blocks =3D GPU_MEM_FEATURES_L2_SLICES(ptdev->gpu_info=
.mem_features);
> +	perf_info->shader_blocks =3D hweight64(ptdev->gpu_info.shader_present);
> +
> +	perf_info->sample_size =3D session_get_user_sample_size(perf_info);
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
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/pan=
thor/panthor_perf.h
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
> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/pan=
thor/panthor_regs.h
> index 08bf06c452d6..9e66c207b9fb 100644
> --- a/drivers/gpu/drm/panthor/panthor_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
> @@ -27,6 +27,7 @@
>  #define GPU_TILER_FEATURES				0xC
>  #define GPU_MEM_FEATURES				0x10
>  #define   GROUPS_L2_COHERENT				BIT(0)
> +#define   GPU_MEM_FEATURES_L2_SLICES(x)			((((x) & GENMASK(11, 8)) >> 8)=
 + 1)
> =20
>  #define GPU_MMU_FEATURES				0x14
>  #define  GPU_MMU_FEATURES_VA_BITS(x)			((x) & GENMASK(7, 0))
> @@ -75,6 +76,8 @@
>  #define GPU_FEATURES					0x60
>  #define   GPU_FEATURES_RAY_INTERSECTION			BIT(2)
>  #define   GPU_FEATURES_RAY_TRAVERSAL			BIT(5)
> +#define GPU_PRFCNT_FEATURES				0x68
> +#define   PRFCNT_FEATURES_COUNTER_BLOCK_SIZE(x)		(((x) & GENMASK(7, 0)) =
<< 8)
> =20
>  #define GPU_TIMESTAMP_OFFSET				0x88
>  #define GPU_CYCLE_COUNT					0x90

