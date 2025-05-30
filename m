Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB5CAC9008
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 15:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A11C10E02C;
	Fri, 30 May 2025 13:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hgizACTG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA3D10E7EE;
 Fri, 30 May 2025 13:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748611516; x=1780147516;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0kthnVRhTRRX2apxh9rZ0wbaR6efYxE+DnDU7flD2ts=;
 b=hgizACTGUm1fbCGZ07Xvi6phSWpI7uK4xonI3E/tZuURf1ytPgazrL3S
 AXtuP2lTy2r0W3q7k5ZijG3vkM5w8pffRYH/SJ+2JlInlR3boAX1wJMM+
 MhGPifaGf7/Bke2jxa338twDPj43+vJkekDJlQ/ZkYmieeJmuozpxJ0nr
 74CDZ5dbGr5da4OJ2oP9sbHYxVtxlCRiKe5Xoxj5S+N35im4+we2Fmetp
 ISXoVoG+ARMjz2Ghxkj+FG116bEtcgKMRcj9u7EPGmbih4UsiROTpuSxk
 z9IbVZHHxGrDeH4L71nLJMKZxbS1jo25Y3NUKMXC6BKzWJhotC4RaNVns A==;
X-CSE-ConnectionGUID: UBSuUDHNR7OADhdB23tZRw==
X-CSE-MsgGUID: ATSNb4XOTii3WpRdyGRcFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50756345"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="50756345"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 06:25:15 -0700
X-CSE-ConnectionGUID: wGwFwY+DSPaWAYB57NEarQ==
X-CSE-MsgGUID: 17mc5XVJT7yfulx2L8/uvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="144206830"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.234])
 ([10.245.244.234])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 06:25:10 -0700
Message-ID: <1d7eb70c-7752-411f-8e20-f41f85438d31@linux.intel.com>
Date: Fri, 30 May 2025 15:25:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 08/10] drm/xe/nvm: add on-die non-volatile memory
 device
To: Alexander Usyskin <alexander.usyskin@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Karthik Poosa <karthik.poosa@intel.com>, Raag Jadav <raag.jadav@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
 Oren Weil <oren.jer.weil@intel.com>, linux-mtd@lists.infradead.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250528135115.2512429-1-alexander.usyskin@intel.com>
 <20250528135115.2512429-9-alexander.usyskin@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20250528135115.2512429-9-alexander.usyskin@intel.com>
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

Hey,

I was looking into testing this with the xe code on PVC, and noticed some small changes that would be useful to integrate before merging.

On 2025-05-28 15:51, Alexander Usyskin wrote:
> Enable access to internal non-volatile memory on DGFX
> with GSC/CSC devices via a child device.
> The nvm child device is exposed via auxiliary bus.
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |   1 +
>  drivers/gpu/drm/xe/xe_device.c       |   5 ++
>  drivers/gpu/drm/xe/xe_device_types.h |   6 ++
>  drivers/gpu/drm/xe/xe_nvm.c          | 107 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_nvm.h          |  15 ++++
>  drivers/gpu/drm/xe/xe_pci.c          |   6 ++
>  6 files changed, 140 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_nvm.c
>  create mode 100644 drivers/gpu/drm/xe/xe_nvm.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index e4bf484d4121..4c51fe3520dc 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -80,6 +80,7 @@ xe-y += xe_bb.o \
>  	xe_mmio.o \
>  	xe_mocs.o \
>  	xe_module.o \
> +	xe_nvm.o \
>  	xe_oa.o \
>  	xe_observation.o \
>  	xe_pat.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d4b6e623aa48..845b38aea692 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -46,6 +46,7 @@
>  #include "xe_memirq.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
> +#include "xe_nvm.h"
>  #include "xe_oa.h"
>  #include "xe_observation.h"
>  #include "xe_pat.h"
> @@ -884,6 +885,8 @@ int xe_device_probe(struct xe_device *xe)
>  			return err;
>  	}
>  
> +	xe_nvm_init(xe);
> +
>  	err = xe_heci_gsc_init(xe);
>  	if (err)
>  		return err;
> @@ -941,6 +944,8 @@ void xe_device_remove(struct xe_device *xe)
>  {
>  	xe_display_unregister(xe);
>  
> +	xe_nvm_fini(xe);
> +
>  	drm_dev_unplug(&xe->drm);
>  
>  	xe_bo_pci_dev_remove_all(xe);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 50b2bfa682ac..938cf1a440de 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -35,6 +35,7 @@
>  #include "intel_display_device.h"
>  #endif
>  
> +struct intel_dg_nvm_dev;
>  struct xe_ggtt;
>  struct xe_pat_ops;
>  struct xe_pxp;
> @@ -319,6 +320,8 @@ struct xe_device {
>  		u8 has_fan_control:1;
>  		/** @info.has_flat_ccs: Whether flat CCS metadata is used */
>  		u8 has_flat_ccs:1;
> +		/** @info.has_gsc_nvm: Device has gsc non-volatile memory */
> +		u8 has_gsc_nvm:1;
Is this flag really needed, or is IS_DGFX() enough? It's literally only used during NVM init, so any conditions could probably just be put there.

>  		/** @info.has_heci_cscfi: device has heci cscfi */
>  		u8 has_heci_cscfi:1;
>  		/** @info.has_heci_gscfi: device has heci gscfi */
> @@ -544,6 +547,9 @@ struct xe_device {
>  	/** @heci_gsc: graphics security controller */
>  	struct xe_heci_gsc heci_gsc;
>  
> +	/** @nvm: discrete graphics non-volatile memory */
> +	struct intel_dg_nvm_dev *nvm;
> +
>  	/** @oa: oa observation subsystem */
>  	struct xe_oa oa;
>  
> diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
> new file mode 100644
> index 000000000000..33ba635ce116
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_nvm.c
> @@ -0,0 +1,107 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2019-2025, Intel Corporation. All rights reserved.
> + */
> +
> +#include <linux/intel_dg_nvm_aux.h>
> +#include <linux/pci.h>
> +
> +#include "xe_device_types.h"
> +#include "xe_nvm.h"
> +#include "xe_sriov.h"
> +
> +#define GEN12_GUNIT_NVM_BASE 0x00102040
> +#define GEN12_GUNIT_NVM_SIZE 0x80
> +#define HECI_FW_STATUS_2_NVM_ACCESS_MODE BIT(3)
> +
> +static const struct intel_dg_nvm_region regions[INTEL_DG_NVM_REGIONS] = {
> +	[0] = { .name = "DESCRIPTOR", },
> +	[2] = { .name = "GSC", },
> +	[9] = { .name = "PADDING", },
> +	[11] = { .name = "OptionROM", },
> +	[12] = { .name = "DAM", },
> +};
> +
Small ask, can we enable PSC for PVC too? Or at least bump regions with 1 so it's doable.

> +static void xe_nvm_release_dev(struct device *dev)
> +{
> +}
> +
> +int xe_nvm_init(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct auxiliary_device *aux_dev;
> +	struct intel_dg_nvm_dev *nvm;
> +	int ret;
> +
> +	if (!xe->info.has_gsc_nvm)
> +		return 0;
> +
> +	/* No access to internal NVM from VFs */
> +	if (IS_SRIOV_VF(xe))
> +		return 0;
> +
> +	/* Nvm pointer should be NULL here */
> +	if (WARN_ON(xe->nvm))
> +		return -EFAULT;
> +
> +	xe->nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
> +	if (!xe->nvm)
> +		return -ENOMEM;
> +
> +	nvm = xe->nvm;
> +
> +	nvm->writable_override = false;
> +	nvm->bar.parent = &pdev->resource[0];
> +	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev->resource[0].start;
> +	nvm->bar.end = nvm->bar.start + GEN12_GUNIT_NVM_SIZE - 1;
> +	nvm->bar.flags = IORESOURCE_MEM;
> +	nvm->bar.desc = IORES_DESC_NONE;
> +	nvm->regions = regions;
> +
> +	aux_dev = &nvm->aux_dev;
> +
> +	aux_dev->name = "nvm";
> +	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) | pci_dev_id(pdev);
> +	aux_dev->dev.parent = &pdev->dev;
> +	aux_dev->dev.release = xe_nvm_release_dev;
> +
> +	ret = auxiliary_device_init(aux_dev);
> +	if (ret) {
> +		drm_err(&xe->drm, "xe-nvm aux init failed %d\n", ret);
> +		goto err;
> +	}
> +
> +	ret = auxiliary_device_add(aux_dev);
> +	if (ret) {
> +		drm_err(&xe->drm, "xe-nvm aux add failed %d\n", ret);
> +		auxiliary_device_uninit(aux_dev);
> +		goto err;
> +	}
> +	return 0;
> +
> +err:
> +	kfree(nvm);
> +	xe->nvm = NULL;
> +	return ret;
> +}
> +
> +void xe_nvm_fini(struct xe_device *xe)
> +{
> +	struct intel_dg_nvm_dev *nvm = xe->nvm;
> +
> +	if (!xe->info.has_gsc_nvm)
> +		return;
> +
> +	/* No access to internal NVM from VFs */
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	/* Nvm pointer should not be NULL here */
> +	if (WARN_ON(!nvm))
> +		return;
> +
> +	auxiliary_device_delete(&nvm->aux_dev);
> +	auxiliary_device_uninit(&nvm->aux_dev);
> +	kfree(nvm);
> +	xe->nvm = NULL;
> +}
In xe, instead of exporting nvm_fini, it would be good to use the drmm interface, like drmm_kzalloc for allocating NVM so it doesn't have to be freed on failure, and drmm_add_action_or_reset as last action in during init. That also removes all checks from fini().

> diff --git a/drivers/gpu/drm/xe/xe_nvm.h b/drivers/gpu/drm/xe/xe_nvm.h
> new file mode 100644
> index 000000000000..7f3d5f57bed0
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_nvm.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2019-2025 Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __XE_NVM_H__
> +#define __XE_NVM_H__
> +
> +struct xe_device;
> +
> +int xe_nvm_init(struct xe_device *xe);
> +
> +void xe_nvm_fini(struct xe_device *xe);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index b68c90910d82..6aa9850bb342 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -63,6 +63,7 @@ struct xe_device_desc {
>  
>  	u8 has_display:1;
>  	u8 has_fan_control:1;
> +	u8 has_gsc_nvm:1;
>  	u8 has_heci_gscfi:1;
>  	u8 has_heci_cscfi:1;
>  	u8 has_llc:1;
> @@ -271,6 +272,7 @@ static const struct xe_device_desc dg1_desc = {
>  	PLATFORM(DG1),
>  	.dma_mask_size = 39,
>  	.has_display = true,
> +	.has_gsc_nvm = 1,
>  	.has_heci_gscfi = 1,
>  	.require_force_probe = true,
>  };
> @@ -282,6 +284,7 @@ static const u16 dg2_g12_ids[] = { INTEL_DG2_G12_IDS(NOP), 0 };
>  #define DG2_FEATURES \
>  	DGFX_FEATURES, \
>  	PLATFORM(DG2), \
> +	.has_gsc_nvm = 1, \
>  	.has_heci_gscfi = 1, \
>  	.subplatforms = (const struct xe_subplatform_desc[]) { \
>  		{ XE_SUBPLATFORM_DG2_G10, "G10", dg2_g10_ids }, \
> @@ -318,6 +321,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
>  	PLATFORM(PVC),
>  	.dma_mask_size = 52,
>  	.has_display = false,
> +	.has_gsc_nvm = 1,
>  	.has_heci_gscfi = 1,
>  	.max_remote_tiles = 1,
>  	.require_force_probe = true,
> @@ -346,6 +350,7 @@ static const struct xe_device_desc bmg_desc = {
>  	.dma_mask_size = 46,
>  	.has_display = true,
>  	.has_fan_control = true,
> +	.has_gsc_nvm = 1,
>  	.has_heci_cscfi = 1,
>  	.needs_scratch = true,
>  };
> @@ -589,6 +594,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.dma_mask_size = desc->dma_mask_size;
>  	xe->info.is_dgfx = desc->is_dgfx;
>  	xe->info.has_fan_control = desc->has_fan_control;
> +	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
>  	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>  	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
>  	xe->info.has_llc = desc->has_llc;

Kind regards,
Maarten Lankhorst
