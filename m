Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E4687FFBA
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 15:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DB310E233;
	Tue, 19 Mar 2024 14:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="esKQQKRz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB35110E0AA;
 Tue, 19 Mar 2024 14:37:39 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-41465082887so5550245e9.2; 
 Tue, 19 Mar 2024 07:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710859058; x=1711463858; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w+Hx3jTBckzxRZcHDR1qc6kCjKl3puLO+lxfjqol3eo=;
 b=esKQQKRzYt1HI0sFyCdydU4O2sOBDSALCPfykbv7rxvUXtWQl9+q1aIUW1Un4xRHrN
 GFJgm4C0ccGhvFl4v3b1Wxh05tvfw0bLqb279SX015EKfY6L4MLQlNUF37wxhn1okl5Q
 DNtvJpqBMyMw44UWge4MyaVT0XvZIbDTFNdD+JjOLaoKCz3YWB4aKotcjCNQmpzImyEa
 9YrGl3lWF6sT/E9PfjOVQJMp+SR0tQp86yr0gv7tJeGR/oSE0RlNzxajlc4G/oVacTG0
 NnbjVrZZuUD3u+hI9GL814PYLQhPCF6EV/dVT4jtLI9CVRGJHJ8GHrsgL7qHNVYI8svm
 hvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710859058; x=1711463858;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w+Hx3jTBckzxRZcHDR1qc6kCjKl3puLO+lxfjqol3eo=;
 b=CFf7VY4bMbl62cV20Dunf9GKRWucbpjpMzfSzc5xTLVRR6k+8AYL0HFheWNjiL3xfF
 6G8BqZEr+QosvSO82wxO7BxrmYyuNhh0QOdtPUvCMe4Mmce77I02MGlczLz7wJx3sjOB
 Mjji3IyxcZqlDoTShJkNnToZaTI/NEKVODCJrn3iL+HLLUwjjom+keQfkHDvqN2hSpS3
 JYYzISNmRWWTQEsSNbPvwsdkuv8kRNzAc7Q3/+CYFCyEtsBgRk6occXiHQZ/Y3hlYr9k
 K/l1mcFFTWG1CKoBRGDamNliq0FIXGGotUICzoFBXNkVNg7zeZtzCxC/hC8GO3NzkJcH
 cXqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTaaU21kBXhalGVHrzLgIy7V/+EddkOLV9+dyWp736RzhfUBtFMSnpdaqQzaMkgH40Q3iml03kgCgRVO1emMSDBFG6yqYQpncSQ4FZzdNJ
X-Gm-Message-State: AOJu0YyD+Whzt1eWlpwiDUJp80uy5ezN3/JJM/ZUoy6iJyTnsDYwCdnY
 Prw/2Ax/YNj3AJwZTA3hIMEjrfILMyj3Yb385OzO2DXn3QaDxa8R
X-Google-Smtp-Source: AGHT+IELvq0C88sFRzGmyuh8MH6rLuGL4gnbWO8FSO3NWeBXCEdDRjR0wUIIMN1G7VcLEN1S+3gKzg==
X-Received: by 2002:a05:600c:46cd:b0:412:f015:6fa6 with SMTP id
 q13-20020a05600c46cd00b00412f0156fa6mr2058495wmo.28.1710859057679; 
 Tue, 19 Mar 2024 07:37:37 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a05600c3ac800b0041462a42c82sm3043208wms.17.2024.03.19.07.37.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 07:37:37 -0700 (PDT)
Message-ID: <5c5882f9-e1c2-46c7-82fc-5fe903ac6616@gmail.com>
Date: Tue, 19 Mar 2024 15:37:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdgpu: refactor code to reuse system information
Content-Language: en-US
To: Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hawking Zhang <Hawking.Zhang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Lijo Lazar <lijo.lazar@amd.com>
References: <20240319142552.893674-1-sunil.khatri@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240319142552.893674-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Am 19.03.24 um 15:25 schrieb Sunil Khatri:
> Refactor the code so debugfs and devcoredump can reuse
> the common information and avoid unnecessary copy of it.
>
> created a new file which would be the right place to
> hold functions which will be used between ioctl, debugfs
> and devcoredump.

Ok, taking a closer look that is certainly not a good idea.

The devinfo structure was just created because somebody thought that 
mixing all that stuff into one structure would be a good idea.

We have pretty much deprecated that approach and should *really* not 
change anything here any more.

Regards,
Christian.

>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/Makefile         |   2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h         |   1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c | 151 ++++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     | 118 +--------------
>   4 files changed, 157 insertions(+), 115 deletions(-)
>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
> index 4536c8ad0e11..05d34f4b18f5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> @@ -80,7 +80,7 @@ amdgpu-y += amdgpu_device.o amdgpu_doorbell_mgr.o amdgpu_kms.o \
>   	amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
>   	amdgpu_fw_attestation.o amdgpu_securedisplay.o \
>   	amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
> -	amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o
> +	amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o amdgpu_devinfo.o
>   
>   amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 9c62552bec34..0267870aa9b1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1609,4 +1609,5 @@ extern const struct attribute_group amdgpu_vram_mgr_attr_group;
>   extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
>   extern const struct attribute_group amdgpu_flash_attr_group;
>   
> +int amdgpu_device_info(struct amdgpu_device *adev, struct drm_amdgpu_info_device *dev_info);
>   #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
> new file mode 100644
> index 000000000000..fdcbc1984031
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_devinfo.c
> @@ -0,0 +1,151 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2024 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + */
> +
> +#include "amdgpu.h"
> +#include "amd_pcie.h"
> +
> +#include <drm/amdgpu_drm.h>
> +
> +int amdgpu_device_info(struct amdgpu_device *adev, struct drm_amdgpu_info_device *dev_info)
> +{
> +	int ret;
> +	uint64_t vm_size;
> +	uint32_t pcie_gen_mask;
> +
> +	if (dev_info == NULL)
> +		return -EINVAL;
> +
> +	dev_info->device_id = adev->pdev->device;
> +	dev_info->chip_rev = adev->rev_id;
> +	dev_info->external_rev = adev->external_rev_id;
> +	dev_info->pci_rev = adev->pdev->revision;
> +	dev_info->family = adev->family;
> +	dev_info->num_shader_engines = adev->gfx.config.max_shader_engines;
> +	dev_info->num_shader_arrays_per_engine = adev->gfx.config.max_sh_per_se;
> +	/* return all clocks in KHz */
> +	dev_info->gpu_counter_freq = amdgpu_asic_get_xclk(adev) * 10;
> +	if (adev->pm.dpm_enabled) {
> +		dev_info->max_engine_clock = amdgpu_dpm_get_sclk(adev, false) * 10;
> +		dev_info->max_memory_clock = amdgpu_dpm_get_mclk(adev, false) * 10;
> +		dev_info->min_engine_clock = amdgpu_dpm_get_sclk(adev, true) * 10;
> +		dev_info->min_memory_clock = amdgpu_dpm_get_mclk(adev, true) * 10;
> +	} else {
> +		dev_info->max_engine_clock =
> +			dev_info->min_engine_clock =
> +				adev->clock.default_sclk * 10;
> +		dev_info->max_memory_clock =
> +			dev_info->min_memory_clock =
> +				adev->clock.default_mclk * 10;
> +		}
> +	dev_info->enabled_rb_pipes_mask = adev->gfx.config.backend_enable_mask;
> +	dev_info->num_rb_pipes = adev->gfx.config.max_backends_per_se *
> +		adev->gfx.config.max_shader_engines;
> +	dev_info->num_hw_gfx_contexts = adev->gfx.config.max_hw_contexts;
> +	dev_info->ids_flags = 0;
> +	if (adev->flags & AMD_IS_APU)
> +		dev_info->ids_flags |= AMDGPU_IDS_FLAGS_FUSION;
> +	if (adev->gfx.mcbp)
> +		dev_info->ids_flags |= AMDGPU_IDS_FLAGS_PREEMPTION;
> +	if (amdgpu_is_tmz(adev))
> +		dev_info->ids_flags |= AMDGPU_IDS_FLAGS_TMZ;
> +	if (adev->gfx.config.ta_cntl2_truncate_coord_mode)
> +		dev_info->ids_flags |= AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD;
> +
> +	vm_size = adev->vm_manager.max_pfn * AMDGPU_GPU_PAGE_SIZE;
> +	vm_size -= AMDGPU_VA_RESERVED_TOP;
> +
> +	/* Older VCE FW versions are buggy and can handle only 40bits */
> +	if (adev->vce.fw_version && adev->vce.fw_version < AMDGPU_VCE_FW_53_45)
> +		vm_size = min(vm_size, 1ULL << 40);
> +
> +	dev_info->virtual_address_offset = AMDGPU_VA_RESERVED_BOTTOM;
> +	dev_info->virtual_address_max = min(vm_size, AMDGPU_GMC_HOLE_START);
> +
> +	if (vm_size > AMDGPU_GMC_HOLE_START) {
> +		dev_info->high_va_offset = AMDGPU_GMC_HOLE_END;
> +		dev_info->high_va_max = AMDGPU_GMC_HOLE_END | vm_size;
> +	}
> +	dev_info->virtual_address_alignment = max_t(u32, PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE);
> +	dev_info->pte_fragment_size = (1 << adev->vm_manager.fragment_size) * AMDGPU_GPU_PAGE_SIZE;
> +	dev_info->gart_page_size = max_t(u32, PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE);
> +	dev_info->cu_active_number = adev->gfx.cu_info.number;
> +	dev_info->cu_ao_mask = adev->gfx.cu_info.ao_cu_mask;
> +	dev_info->ce_ram_size = adev->gfx.ce_ram_size;
> +	memcpy(&dev_info->cu_ao_bitmap[0], &adev->gfx.cu_info.ao_cu_bitmap[0],
> +	       sizeof(adev->gfx.cu_info.ao_cu_bitmap));
> +	memcpy(&dev_info->cu_bitmap[0], &adev->gfx.cu_info.bitmap[0],
> +	       sizeof(dev_info->cu_bitmap));
> +	dev_info->vram_type = adev->gmc.vram_type;
> +	dev_info->vram_bit_width = adev->gmc.vram_width;
> +	dev_info->vce_harvest_config = adev->vce.harvest_config;
> +	dev_info->gc_double_offchip_lds_buf =
> +		adev->gfx.config.double_offchip_lds_buf;
> +	dev_info->wave_front_size = adev->gfx.cu_info.wave_front_size;
> +	dev_info->num_shader_visible_vgprs = adev->gfx.config.max_gprs;
> +	dev_info->num_cu_per_sh = adev->gfx.config.max_cu_per_sh;
> +	dev_info->num_tcc_blocks = adev->gfx.config.max_texture_channel_caches;
> +	dev_info->gs_vgt_table_depth = adev->gfx.config.gs_vgt_table_depth;
> +	dev_info->gs_prim_buffer_depth = adev->gfx.config.gs_prim_buffer_depth;
> +	dev_info->max_gs_waves_per_vgt = adev->gfx.config.max_gs_threads;
> +
> +	if (adev->family >= AMDGPU_FAMILY_NV)
> +		dev_info->pa_sc_tile_steering_override =
> +			adev->gfx.config.pa_sc_tile_steering_override;
> +
> +	dev_info->tcc_disabled_mask = adev->gfx.config.tcc_disabled_mask;
> +
> +	/* Combine the chip gen mask with the platform (CPU/mobo) mask. */
> +	pcie_gen_mask = adev->pm.pcie_gen_mask & (adev->pm.pcie_gen_mask >> 16);
> +	dev_info->pcie_gen = fls(pcie_gen_mask);
> +	dev_info->pcie_num_lanes =
> +		adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X32 ? 32 :
> +		adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X16 ? 16 :
> +		adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X12 ? 12 :
> +		adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X8 ? 8 :
> +		adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X4 ? 4 :
> +		adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X2 ? 2 : 1;
> +
> +	dev_info->tcp_cache_size = adev->gfx.config.gc_tcp_l1_size;
> +	dev_info->num_sqc_per_wgp = adev->gfx.config.gc_num_sqc_per_wgp;
> +	dev_info->sqc_data_cache_size = adev->gfx.config.gc_l1_data_cache_size_per_sqc;
> +	dev_info->sqc_inst_cache_size = adev->gfx.config.gc_l1_instruction_cache_size_per_sqc;
> +	dev_info->gl1c_cache_size = adev->gfx.config.gc_gl1c_size_per_instance *
> +				    adev->gfx.config.gc_gl1c_per_sa;
> +	dev_info->gl2c_cache_size = adev->gfx.config.gc_gl2c_per_gpu;
> +	dev_info->mall_size = adev->gmc.mall_size;
> +
> +
> +	if (adev->gfx.funcs->get_gfx_shadow_info) {
> +		struct amdgpu_gfx_shadow_info shadow_info;
> +
> +		ret = amdgpu_gfx_get_gfx_shadow_info(adev, &shadow_info);
> +		if (!ret) {
> +			dev_info->shadow_size = shadow_info.shadow_size;
> +			dev_info->shadow_alignment = shadow_info.shadow_alignment;
> +			dev_info->csa_size = shadow_info.csa_size;
> +			dev_info->csa_alignment = shadow_info.csa_alignment;
> +		}
> +	}
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index a66d47865e3b..c924ba14f9a4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -850,125 +850,15 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>   	}
>   	case AMDGPU_INFO_DEV_INFO: {
>   		struct drm_amdgpu_info_device *dev_info;
> -		uint64_t vm_size;
> -		uint32_t pcie_gen_mask;
>   
>   		dev_info = kzalloc(sizeof(*dev_info), GFP_KERNEL);
>   		if (!dev_info)
>   			return -ENOMEM;
>   
> -		dev_info->device_id = adev->pdev->device;
> -		dev_info->chip_rev = adev->rev_id;
> -		dev_info->external_rev = adev->external_rev_id;
> -		dev_info->pci_rev = adev->pdev->revision;
> -		dev_info->family = adev->family;
> -		dev_info->num_shader_engines = adev->gfx.config.max_shader_engines;
> -		dev_info->num_shader_arrays_per_engine = adev->gfx.config.max_sh_per_se;
> -		/* return all clocks in KHz */
> -		dev_info->gpu_counter_freq = amdgpu_asic_get_xclk(adev) * 10;
> -		if (adev->pm.dpm_enabled) {
> -			dev_info->max_engine_clock = amdgpu_dpm_get_sclk(adev, false) * 10;
> -			dev_info->max_memory_clock = amdgpu_dpm_get_mclk(adev, false) * 10;
> -			dev_info->min_engine_clock = amdgpu_dpm_get_sclk(adev, true) * 10;
> -			dev_info->min_memory_clock = amdgpu_dpm_get_mclk(adev, true) * 10;
> -		} else {
> -			dev_info->max_engine_clock =
> -				dev_info->min_engine_clock =
> -					adev->clock.default_sclk * 10;
> -			dev_info->max_memory_clock =
> -				dev_info->min_memory_clock =
> -					adev->clock.default_mclk * 10;
> -		}
> -		dev_info->enabled_rb_pipes_mask = adev->gfx.config.backend_enable_mask;
> -		dev_info->num_rb_pipes = adev->gfx.config.max_backends_per_se *
> -			adev->gfx.config.max_shader_engines;
> -		dev_info->num_hw_gfx_contexts = adev->gfx.config.max_hw_contexts;
> -		dev_info->ids_flags = 0;
> -		if (adev->flags & AMD_IS_APU)
> -			dev_info->ids_flags |= AMDGPU_IDS_FLAGS_FUSION;
> -		if (adev->gfx.mcbp)
> -			dev_info->ids_flags |= AMDGPU_IDS_FLAGS_PREEMPTION;
> -		if (amdgpu_is_tmz(adev))
> -			dev_info->ids_flags |= AMDGPU_IDS_FLAGS_TMZ;
> -		if (adev->gfx.config.ta_cntl2_truncate_coord_mode)
> -			dev_info->ids_flags |= AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD;
> -
> -		vm_size = adev->vm_manager.max_pfn * AMDGPU_GPU_PAGE_SIZE;
> -		vm_size -= AMDGPU_VA_RESERVED_TOP;
> -
> -		/* Older VCE FW versions are buggy and can handle only 40bits */
> -		if (adev->vce.fw_version &&
> -		    adev->vce.fw_version < AMDGPU_VCE_FW_53_45)
> -			vm_size = min(vm_size, 1ULL << 40);
> -
> -		dev_info->virtual_address_offset = AMDGPU_VA_RESERVED_BOTTOM;
> -		dev_info->virtual_address_max =
> -			min(vm_size, AMDGPU_GMC_HOLE_START);
> -
> -		if (vm_size > AMDGPU_GMC_HOLE_START) {
> -			dev_info->high_va_offset = AMDGPU_GMC_HOLE_END;
> -			dev_info->high_va_max = AMDGPU_GMC_HOLE_END | vm_size;
> -		}
> -		dev_info->virtual_address_alignment = max_t(u32, PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE);
> -		dev_info->pte_fragment_size = (1 << adev->vm_manager.fragment_size) * AMDGPU_GPU_PAGE_SIZE;
> -		dev_info->gart_page_size = max_t(u32, PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE);
> -		dev_info->cu_active_number = adev->gfx.cu_info.number;
> -		dev_info->cu_ao_mask = adev->gfx.cu_info.ao_cu_mask;
> -		dev_info->ce_ram_size = adev->gfx.ce_ram_size;
> -		memcpy(&dev_info->cu_ao_bitmap[0], &adev->gfx.cu_info.ao_cu_bitmap[0],
> -		       sizeof(adev->gfx.cu_info.ao_cu_bitmap));
> -		memcpy(&dev_info->cu_bitmap[0], &adev->gfx.cu_info.bitmap[0],
> -		       sizeof(dev_info->cu_bitmap));
> -		dev_info->vram_type = adev->gmc.vram_type;
> -		dev_info->vram_bit_width = adev->gmc.vram_width;
> -		dev_info->vce_harvest_config = adev->vce.harvest_config;
> -		dev_info->gc_double_offchip_lds_buf =
> -			adev->gfx.config.double_offchip_lds_buf;
> -		dev_info->wave_front_size = adev->gfx.cu_info.wave_front_size;
> -		dev_info->num_shader_visible_vgprs = adev->gfx.config.max_gprs;
> -		dev_info->num_cu_per_sh = adev->gfx.config.max_cu_per_sh;
> -		dev_info->num_tcc_blocks = adev->gfx.config.max_texture_channel_caches;
> -		dev_info->gs_vgt_table_depth = adev->gfx.config.gs_vgt_table_depth;
> -		dev_info->gs_prim_buffer_depth = adev->gfx.config.gs_prim_buffer_depth;
> -		dev_info->max_gs_waves_per_vgt = adev->gfx.config.max_gs_threads;
> -
> -		if (adev->family >= AMDGPU_FAMILY_NV)
> -			dev_info->pa_sc_tile_steering_override =
> -				adev->gfx.config.pa_sc_tile_steering_override;
> -
> -		dev_info->tcc_disabled_mask = adev->gfx.config.tcc_disabled_mask;
> -
> -		/* Combine the chip gen mask with the platform (CPU/mobo) mask. */
> -		pcie_gen_mask = adev->pm.pcie_gen_mask & (adev->pm.pcie_gen_mask >> 16);
> -		dev_info->pcie_gen = fls(pcie_gen_mask);
> -		dev_info->pcie_num_lanes =
> -			adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X32 ? 32 :
> -			adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X16 ? 16 :
> -			adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X12 ? 12 :
> -			adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X8 ? 8 :
> -			adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X4 ? 4 :
> -			adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X2 ? 2 : 1;
> -
> -		dev_info->tcp_cache_size = adev->gfx.config.gc_tcp_l1_size;
> -		dev_info->num_sqc_per_wgp = adev->gfx.config.gc_num_sqc_per_wgp;
> -		dev_info->sqc_data_cache_size = adev->gfx.config.gc_l1_data_cache_size_per_sqc;
> -		dev_info->sqc_inst_cache_size = adev->gfx.config.gc_l1_instruction_cache_size_per_sqc;
> -		dev_info->gl1c_cache_size = adev->gfx.config.gc_gl1c_size_per_instance *
> -					    adev->gfx.config.gc_gl1c_per_sa;
> -		dev_info->gl2c_cache_size = adev->gfx.config.gc_gl2c_per_gpu;
> -		dev_info->mall_size = adev->gmc.mall_size;
> -
> -
> -		if (adev->gfx.funcs->get_gfx_shadow_info) {
> -			struct amdgpu_gfx_shadow_info shadow_info;
> -
> -			ret = amdgpu_gfx_get_gfx_shadow_info(adev, &shadow_info);
> -			if (!ret) {
> -				dev_info->shadow_size = shadow_info.shadow_size;
> -				dev_info->shadow_alignment = shadow_info.shadow_alignment;
> -				dev_info->csa_size = shadow_info.csa_size;
> -				dev_info->csa_alignment = shadow_info.csa_alignment;
> -			}
> +		ret = amdgpu_device_info(adev, dev_info);
> +		if (ret == -EINVAL) {
> +			kfree(dev_info);
> +			return ret;
>   		}
>   
>   		ret = copy_to_user(out, dev_info,

