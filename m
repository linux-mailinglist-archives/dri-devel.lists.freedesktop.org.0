Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 203837CD7BD
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 11:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CBA10E097;
	Wed, 18 Oct 2023 09:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33E310E091;
 Wed, 18 Oct 2023 09:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697620825; x=1729156825;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=ostEWZRPhhokT9tAJjhGd77n5kepHRzHCJzwsXDamYk=;
 b=fLzduhsK5TfgeFh9apZHAnSVEKZFGT3zDrHR84TR3Op1yvQBVUtwKC9G
 kYassQO4c7+YZyw2dttkNqSxC9bGga6xnzqbg3TDWW2oBM5m661sIS4Ml
 GESptVBkxuolp8TaVp5aqUxe0PTbrtDsQbFh32/nGY8ct22UEXYLNvxKU
 BFI/R36tGKeTylpzTflgykHs0d3ekXb0GgCk34/cmcmtibetAfAalK66i
 6wownAHp1ArCeva64g6TyUyN6b+uqnhDYZdCY/GtGPr1E1JgLMOcVnUN1
 wBcYT9WYtetf03haa6Gutfga0NUD7kIRgp9nA+fJ2wo8n52ZZc5+bnQCH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="450195341"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="450195341"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 02:20:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="733089776"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="733089776"
Received: from gruberda-mobl1.ger.corp.intel.com ([10.252.62.52])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 02:20:11 -0700
Date: Wed, 18 Oct 2023 12:20:09 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v4 13/17] platform/x86/amd/pmf: Add PMF-AMDGPU get
 interface
In-Reply-To: <20231018070241.2041529-14-Shyam-sundar.S-k@amd.com>
Message-ID: <9e6c4a42-fbce-c5ea-15ce-5eb22fc3767a@linux.intel.com>
References: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
 <20231018070241.2041529-14-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Xinhui.Pan@amd.com, Patil.Reddy@amd.com, basavaraj.natikar@amd.com,
 dri-devel@lists.freedesktop.org, jikos@kernel.org,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 markgross@kernel.org, Hans de Goede <hdegoede@redhat.com>,
 benjamin.tissoires@redhat.com, mario.limonciello@amd.com,
 linux-input@vger.kernel.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 18 Oct 2023, Shyam Sundar S K wrote:

> In order to provide GPU inputs to TA for the Smart PC solution to work, we
> need to have interface between the PMF driver and the AMDGPU driver.
> 
> Add the initial code path for get interface from AMDGPU.
> 
> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/Makefile     |   2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h     |   1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 138 ++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/Kconfig    |   1 +
>  drivers/platform/x86/amd/pmf/core.c     |   1 +
>  drivers/platform/x86/amd/pmf/pmf.h      |   3 +
>  drivers/platform/x86/amd/pmf/spc.c      |  13 +++
>  drivers/platform/x86/amd/pmf/tee-if.c   |  26 +++++
>  include/linux/amd-pmf-io.h              |  35 ++++++
>  9 files changed, 220 insertions(+)
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>  create mode 100644 include/linux/amd-pmf-io.h
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
> index 384b798a9bad..7fafccefbd7a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> @@ -86,6 +86,8 @@ amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
>  
>  amdgpu-$(CONFIG_PERF_EVENTS) += amdgpu_pmu.o
>  
> +amdgpu-$(CONFIG_AMD_PMF) += amdgpu_pmf.o
> +
>  # add asic specific block
>  amdgpu-$(CONFIG_DRM_AMDGPU_CIK)+= cik.o cik_ih.o \
>  	dce_v8_0.o gfx_v7_0.o cik_sdma.o uvd_v4_2.o vce_v2_0.o
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index a79d53bdbe13..26ffa1b4fe57 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -50,6 +50,7 @@
>  #include <linux/hashtable.h>
>  #include <linux/dma-fence.h>
>  #include <linux/pci.h>
> +#include <linux/amd-pmf-io.h>
>  
>  #include <drm/ttm/ttm_bo.h>
>  #include <drm/ttm/ttm_placement.h>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
> new file mode 100644
> index 000000000000..ac981848df50
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
> @@ -0,0 +1,138 @@
> +/*
> + * Copyright 2023 Advanced Micro Devices, Inc.
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

This is MIT, right? Add the required SPDX-License-Identifier line for it
at the top of the file, thank you.

> + *
> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + *
> + */

Remove the extra empty line at the end of the comment.

> +
> +#include <linux/backlight.h>
> +#include "amdgpu.h"
> +
> +int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf)
> +{
> +	struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
> +	struct drm_mode_config *mode_config = &drm_dev->mode_config;
> +	struct amdgpu_device *adev = drm_to_adev(drm_dev);
> +	struct drm_connector_list_iter iter;
> +	struct drm_connector *connector;
> +	int i = 0;
> +
> +	/* Reset the count to zero */
> +	pmf->display_count = 0;
> +	if (!(adev->flags & AMD_IS_APU)) {
> +		DRM_ERROR("PMF-AMDGPU interface not supported\n");
> +		return -ENODEV;
> +	}
> +
> +	mutex_lock(&mode_config->mutex);
> +	drm_connector_list_iter_begin(drm_dev, &iter);
> +	drm_for_each_connector_iter(connector, &iter) {
> +		if (connector->status == connector_status_connected)
> +			pmf->display_count++;
> +		if (connector->status != pmf->con_status[i])
> +			pmf->con_status[i] = connector->status;
> +		if (connector->connector_type != pmf->connector_type[i])
> +			pmf->connector_type[i] = connector->connector_type;
> +
> +		i++;
> +		if (i >= MAX_SUPPORTED)
> +			break;
> +	}
> +	drm_connector_list_iter_end(&iter);
> +	mutex_unlock(&mode_config->mutex);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(amd_pmf_get_gfx_data);
> +
> +static int amd_pmf_gpu_get_cur_state(struct thermal_cooling_device *cooling_dev,
> +				     unsigned long *state)
> +{
> +	struct backlight_device *bd;
> +
> +	if (!acpi_video_backlight_use_native())
> +		return -ENODEV;
> +
> +	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
> +	if (!bd)
> +		return -ENODEV;
> +
> +	*state = backlight_get_brightness(bd);
> +
> +	return 0;
> +}
> +
> +static int amd_pmf_gpu_get_max_state(struct thermal_cooling_device *cooling_dev,
> +				     unsigned long *state)
> +{
> +	struct backlight_device *bd;
> +
> +	if (!acpi_video_backlight_use_native())
> +		return -ENODEV;
> +
> +	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
> +	if (!bd)
> +		return -ENODEV;
> +
> +	if (backlight_is_blank(bd))
> +		*state = 0;
> +	else
> +		*state = bd->props.max_brightness;
> +
> +	return 0;
> +}
> +
> +static const struct thermal_cooling_device_ops bd_cooling_ops = {
> +	.get_max_state = amd_pmf_gpu_get_max_state,
> +	.get_cur_state = amd_pmf_gpu_get_cur_state,
> +};
> +
> +int amd_pmf_gpu_init(struct amd_gpu_pmf_data *pmf)
> +{
> +	struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
> +	struct amdgpu_device *adev = drm_to_adev(drm_dev);
> +
> +	if (!(adev->flags & AMD_IS_APU)) {
> +		DRM_ERROR("PMF-AMDGPU interface not supported\n");
> +		return -ENODEV;
> +	}
> +
> +	if (!acpi_video_backlight_use_native())
> +		return -ENODEV;
> +
> +	pmf->raw_bd = backlight_device_get_by_type(BACKLIGHT_RAW);
> +	if (!pmf->raw_bd)
> +		return -ENODEV;
> +
> +	pmf->cooling_dev = thermal_cooling_device_register("pmf_gpu_bd",
> +							   pmf, &bd_cooling_ops);
> +	if (IS_ERR(pmf->cooling_dev))
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(amd_pmf_gpu_init);
> +
> +void amd_pmf_gpu_deinit(struct amd_gpu_pmf_data *pmf)
> +{
> +	thermal_cooling_device_unregister(pmf->cooling_dev);
> +}
> +EXPORT_SYMBOL_GPL(amd_pmf_gpu_deinit);
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index f246252bddd8..7f430de7af44 100644
> --- a/drivers/platform/x86/amd/pmf/Kconfig
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -10,6 +10,7 @@ config AMD_PMF
>  	depends on AMD_NB
>  	select ACPI_PLATFORM_PROFILE
>  	depends on TEE && AMDTEE
> +	depends on DRM_AMDGPU
>  	help
>  	  This driver provides support for the AMD Platform Management Framework.
>  	  The goal is to enhance end user experience by making AMD PCs smarter,
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 4b8156033fa6..c59ba527ff49 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -411,6 +411,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  	}
>  
>  	dev->cpu_id = rdev->device;
> +	dev->root = rdev;
>  
>  	err = amd_smn_read(0, AMD_PMF_BASE_ADDR_LO, &val);
>  	if (err) {
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 8712299ad52b..615cd3a31986 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -13,6 +13,7 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/platform_profile.h>
> +#include <linux/amd-pmf-io.h>
>  
>  #define POLICY_BUF_MAX_SZ		0x4b000
>  #define POLICY_SIGN_COOKIE		0x31535024
> @@ -228,9 +229,11 @@ struct amd_pmf_dev {
>  	void *shbuf;
>  	struct delayed_work pb_work;
>  	struct pmf_action_table *prev_data;
> +	struct amd_gpu_pmf_data gfx_data;
>  	u64 policy_addr;
>  	void *policy_base;
>  	bool smart_pc_enabled;
> +	struct pci_dev *root;
>  };
>  
>  struct apmf_sps_prop_granular {
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 512e0c66efdc..cf4962ef97c2 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -44,6 +44,10 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>  	dev_dbg(dev->dev, "Max C0 Residency : %u\n", in->ev_info.max_c0residency);
>  	dev_dbg(dev->dev, "GFX Busy : %u\n", in->ev_info.gfx_busy);
>  	dev_dbg(dev->dev, "Connected Display Count : %u\n", in->ev_info.monitor_count);
> +	dev_dbg(dev->dev, "Primary Display Type : %s\n",
> +		drm_get_connector_type_name(in->ev_info.display_type));
> +	dev_dbg(dev->dev, "Primary Display State : %s\n", in->ev_info.display_state ?
> +			"Connected" : "disconnected/unknown");
>  	dev_dbg(dev->dev, "LID State : %s\n", in->ev_info.lid_state ? "Close" : "Open");
>  	dev_dbg(dev->dev, "==== TA inputs END ====\n");
>  }
> @@ -146,6 +150,14 @@ static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  	return 0;
>  }
>  
> +static void amd_pmf_get_gpu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> +{
> +	amd_pmf_get_gfx_data(&dev->gfx_data);
> +	in->ev_info.monitor_count = dev->gfx_data.display_count;
> +	in->ev_info.display_type = dev->gfx_data.connector_type[0];
> +	in->ev_info.display_state = dev->gfx_data.con_status[0];
> +}
> +
>  void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>  {
>  	/* TA side lid open is 1 and close is 0, hence the ! here */
> @@ -154,4 +166,5 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_tab
>  	amd_pmf_get_smu_info(dev, in);
>  	amd_pmf_get_battery_info(dev, in);
>  	amd_pmf_get_slider_info(dev, in);
> +	amd_pmf_get_gpu_info(dev, in);
>  }
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 2f5fb8623c20..956e66b78605 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -9,6 +9,7 @@
>   */
>  
>  #include <linux/debugfs.h>
> +#include <linux/pci.h>
>  #include <linux/tee_drv.h>
>  #include <linux/uuid.h>
>  #include "pmf.h"
> @@ -357,6 +358,19 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
>  	return amd_pmf_start_policy_engine(dev);
>  }
>  
> +static int amd_pmf_get_gpu_handle(struct pci_dev *pdev, void *data)
> +{
> +	struct amd_pmf_dev *dev = data;
> +
> +	if (pdev->vendor == PCI_VENDOR_ID_ATI && pdev->devfn == 0) {
> +		/* Found the amdgpu handle from the pci root after walking through the pci bus */

If you insist on having this comment, make it a function comment instead 
(with appropriate modifications into the content of it) but I personally 
don't find it that useful so it could be just dropped as well, IMO.

> +		dev->gfx_data.gpu_dev = pdev;
> +		return 1; /* Stop walking */
> +	}
> +
> +	return 0; /* Continue walking */
> +}
> +
>  static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const void *data)
>  {
>  	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
> @@ -446,6 +460,15 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
>  	amd_pmf_set_dram_addr(dev);
>  	amd_pmf_get_bios_buffer(dev);
> +
> +	/* Get amdgpu handle */

Useless comment.

> +	pci_walk_bus(dev->root->bus, amd_pmf_get_gpu_handle, dev);
> +	if (!dev->gfx_data.gpu_dev)
> +		dev_err(dev->dev, "GPU handle not found!\n");
> +
> +	if (!amd_pmf_gpu_init(&dev->gfx_data))
> +		dev->gfx_data.gpu_dev_en = true;
> +
>  	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
>  	if (!dev->prev_data)
>  		return -ENOMEM;
> @@ -461,5 +484,8 @@ void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
>  	kfree(dev->prev_data);
>  	kfree(dev->policy_buf);
>  	cancel_delayed_work_sync(&dev->pb_work);
> +	if (dev->gfx_data.gpu_dev_en)
> +		amd_pmf_gpu_deinit(&dev->gfx_data);
> +	pci_dev_put(dev->gfx_data.gpu_dev);
>  	amd_pmf_tee_deinit(dev);
>  }
> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
> new file mode 100644
> index 000000000000..5f79e66a41b3
> --- /dev/null
> +++ b/include/linux/amd-pmf-io.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * AMD Platform Management Framework Interface
> + *
> + * Copyright (c) 2023, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + */
> +
> +#ifndef AMD_PMF_IO_H
> +#define AMD_PMF_IO_H
> +
> +#include <acpi/video.h>
> +#include <drm/drm_connector.h>
> +#include <linux/backlight.h>
> +#include <linux/thermal.h>
> +
> +#define MAX_SUPPORTED 4
> +
> +/* amdgpu */

Document the structure properly with kerneldoc instead of an unhelpful 
comment like above :-). Please also check if you add any other structs 
into kernel-wide headers that you didn't document yet. Or fields into 
existing structs.

> +struct amd_gpu_pmf_data {
> +	struct pci_dev *gpu_dev;
> +	struct backlight_device *raw_bd;
> +	struct thermal_cooling_device *cooling_dev;
> +	enum drm_connector_status con_status[MAX_SUPPORTED];
> +	int display_count;
> +	int connector_type[MAX_SUPPORTED];
> +	bool gpu_dev_en;
> +};
> +
> +int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
> +int amd_pmf_gpu_init(struct amd_gpu_pmf_data *pmf);
> +void amd_pmf_gpu_deinit(struct amd_gpu_pmf_data *pmf);
> +#endif
> 

-- 
 i.

