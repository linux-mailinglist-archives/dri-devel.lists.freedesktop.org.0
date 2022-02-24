Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCBE4C2DAE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 14:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384D310E81A;
	Thu, 24 Feb 2022 13:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C25F10E814;
 Thu, 24 Feb 2022 13:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645711133; x=1677247133;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vbVRuThB12/xWAXDw0PRbhLips7wQZ1Yd939k86AU7s=;
 b=gvazmQ96vSVCFRqcTmINVgJu4D8CAYdES2dCVnfuXUaLJnOZOh86ului
 cn+8SDZxtAWUhR74SjeMM2C+017ANd9ht/ccoqaUANCQ7GIB57auRfWZ4
 fKOYA18v0GLa7MeaUm8TXcBfwVqLlgB7e6avuhPOG6CfgeLCeKhPG6jJi
 aLNVGWxNKhNANU+PPzVgL8Z397O7uOQjrbev31dQEZYhny5k5UeAxEKwH
 A4x7lGN8mdAqxIu4ay0XTQ9i5AkBIicPeL02YXM4nHmR8K8VFPJx9370o
 xrDtuzhJgdZSfnXFwkyRlaVjTRPaaBeQwlwT4Cutqj8NyMRFCBkB2KoqX w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="338674695"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="338674695"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 05:58:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="508877461"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga006.jf.intel.com with ESMTP; 24 Feb 2022 05:58:50 -0800
Received: from [10.249.157.70] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.157.70])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 21ODwm0q030928; Thu, 24 Feb 2022 13:58:48 GMT
Message-ID: <b2d323a1-01ea-7e75-94f6-4efc36017c1c@intel.com>
Date: Thu, 24 Feb 2022 14:58:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH v5 1/4] drm/i915/guc: Add fetch of hwconfig table
Content-Language: en-US
To: Jordan Justen <jordan.l.justen@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
References: <20220222103640.1006006-1-jordan.l.justen@intel.com>
 <20220222103640.1006006-2-jordan.l.justen@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20220222103640.1006006-2-jordan.l.justen@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 22.02.2022 11:36, Jordan Justen wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Implement support for fetching the hardware description table from the
> GuC. The call is made twice - once without a destination buffer to
> query the size and then a second time to fill in the buffer.
> 
> Note that the table is only available on ADL-P and later platforms.
> 
> v5 (of Jordan's posting):
>  * Various changes made by Jordan and recommended by Michal
>    - Makefile ordering
>    - Adjust "struct intel_guc_hwconfig hwconfig" comment
>    - Set Copyright year to 2022 in intel_guc_hwconfig.c/.h
>    - Drop inline from hwconfig_to_guc()
>    - Replace hwconfig param with guc in __guc_action_get_hwconfig()
>    - Move zero size check into guc_hwconfig_discover_size()
>    - Change comment to say zero size offset/size is needed to get size
>    - Add has_guc_hwconfig to devinfo and drop has_table()
>    - Change drm_err to notice in __uc_init_hw() and use %pe
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> Acked-by: Jon Bloomfield <jon.bloomfield@intel.com>
> Signed-off-by: Jordan Justen <jordan.l.justen@intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   1 +
>  .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |   4 +
>  drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   3 +
>  .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   | 145 ++++++++++++++++++
>  .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.h   |  19 +++
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   7 +
>  drivers/gpu/drm/i915/i915_pci.c               |   1 +
>  drivers/gpu/drm/i915/intel_device_info.h      |   1 +
>  9 files changed, 182 insertions(+)
>  create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
>  create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.h
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index e9ce09620eb5..661f1afb51d7 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -188,6 +188,7 @@ i915-y += gt/uc/intel_uc.o \
>  	  gt/uc/intel_guc_ct.o \
>  	  gt/uc/intel_guc_debugfs.o \
>  	  gt/uc/intel_guc_fw.o \
> +	  gt/uc/intel_guc_hwconfig.o \
>  	  gt/uc/intel_guc_log.o \
>  	  gt/uc/intel_guc_log_debugfs.o \
>  	  gt/uc/intel_guc_rc.o \
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> index fe5d7d261797..4a61c819f32b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> @@ -137,6 +137,7 @@ enum intel_guc_action {
>  	INTEL_GUC_ACTION_ENGINE_FAILURE_NOTIFICATION = 0x1009,
>  	INTEL_GUC_ACTION_SETUP_PC_GUCRC = 0x3004,
>  	INTEL_GUC_ACTION_AUTHENTICATE_HUC = 0x4000,
> +	INTEL_GUC_ACTION_GET_HWCONFIG = 0x4100,
>  	INTEL_GUC_ACTION_REGISTER_CONTEXT = 0x4502,
>  	INTEL_GUC_ACTION_DEREGISTER_CONTEXT = 0x4503,
>  	INTEL_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER = 0x4505,
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
> index 488b6061ee89..f9e2a6aaef4a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
> @@ -8,6 +8,10 @@
>  
>  enum intel_guc_response_status {
>  	INTEL_GUC_RESPONSE_STATUS_SUCCESS = 0x0,
> +	INTEL_GUC_RESPONSE_NOT_SUPPORTED = 0x20,
> +	INTEL_GUC_RESPONSE_NO_ATTRIBUTE_TABLE = 0x201,
> +	INTEL_GUC_RESPONSE_NO_DECRYPTION_KEY = 0x202,
> +	INTEL_GUC_RESPONSE_DECRYPTION_FAILED = 0x204,
>  	INTEL_GUC_RESPONSE_STATUS_GENERIC_FAIL = 0xF000,
>  };
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index f9240d4baa69..2058eb8c3d0c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -13,6 +13,7 @@
>  #include "intel_guc_fw.h"
>  #include "intel_guc_fwif.h"
>  #include "intel_guc_ct.h"
> +#include "intel_guc_hwconfig.h"
>  #include "intel_guc_log.h"
>  #include "intel_guc_reg.h"
>  #include "intel_guc_slpc_types.h"
> @@ -37,6 +38,8 @@ struct intel_guc {
>  	struct intel_guc_ct ct;
>  	/** @slpc: sub-structure containing SLPC related data and objects */
>  	struct intel_guc_slpc slpc;
> +	/** @hwconfig: data related to hardware configuration KLV blob */
> +	struct intel_guc_hwconfig hwconfig;
>  
>  	/** @sched_engine: Global engine used to submit requests to GuC */
>  	struct i915_sched_engine *sched_engine;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> new file mode 100644
> index 000000000000..ad289603460c
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#include "gt/intel_gt.h"
> +#include "i915_drv.h"
> +#include "i915_memcpy.h"
> +#include "intel_guc_hwconfig.h"
> +
> +static struct intel_guc *hwconfig_to_guc(struct intel_guc_hwconfig *hwconfig)
> +{
> +	return container_of(hwconfig, struct intel_guc, hwconfig);
> +}
> +
> +/*
> + * GuC has a blob containing hardware configuration information (HWConfig).
> + * This is formatted as a simple and flexible KLV (Key/Length/Value) table.
> + *
> + * For example, a minimal version could be:
> + *   enum device_attr {
> + *     ATTR_SOME_VALUE = 0,
> + *     ATTR_SOME_MASK  = 1,
> + *   };
> + *
> + *   static const u32 hwconfig[] = {
> + *     ATTR_SOME_VALUE,
> + *     1,		// Value Length in DWords
> + *     8,		// Value
> + *
> + *     ATTR_SOME_MASK,
> + *     3,
> + *     0x00FFFFFFFF, 0xFFFFFFFF, 0xFF000000,
> + *   };
> + *
> + * The attribute ids are defined in a hardware spec.
> + */
> +
> +static int __guc_action_get_hwconfig(struct intel_guc *guc,
> +				     u32 ggtt_offset, u32 ggtt_size)
> +{
> +	u32 action[] = {
> +		INTEL_GUC_ACTION_GET_HWCONFIG,
> +		ggtt_offset,
> +		0, /* upper 32 bits of address */

nit: to avoid comments we can use

	lower_32_bits(ggtt_offset),
	upper_32_bits(ggtt_offset),

> +		ggtt_size,
> +	};
> +	int ret;
> +
> +	ret = intel_guc_send_mmio(guc, action, ARRAY_SIZE(action), NULL, 0);
> +	if (ret == -ENXIO)
> +		return -ENOENT;
> +
> +	return ret;
> +}
> +
> +static int guc_hwconfig_discover_size(struct intel_guc_hwconfig *hwconfig)
> +{
> +	struct intel_guc *guc = hwconfig_to_guc(hwconfig);
> +	int ret;
> +
> +	/* Sending a query with zero offset and size will return the
> +	 * size of the blob.
> +	 */

nit: wrong format of multi line comment

> +	ret = __guc_action_get_hwconfig(guc, 0, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret == 0)
> +		return -EINVAL;
> +
> +	hwconfig->size = ret;
> +	return 0;
> +}
> +
> +static int guc_hwconfig_fill_buffer(struct intel_guc_hwconfig *hwconfig)
> +{
> +	struct intel_guc *guc = hwconfig_to_guc(hwconfig);
> +	struct i915_vma *vma;
> +	u32 ggtt_offset;
> +	void *vaddr;
> +	int ret;
> +
> +	GEM_BUG_ON(!hwconfig->size);
> +
> +	ret = intel_guc_allocate_and_map_vma(guc, hwconfig->size, &vma, &vaddr);
> +	if (ret)
> +		return ret;
> +
> +	ggtt_offset = intel_guc_ggtt_offset(guc, vma);
> +
> +	ret = __guc_action_get_hwconfig(guc, ggtt_offset, hwconfig->size);
> +	if (ret >= 0)
> +		memcpy(hwconfig->ptr, vaddr, hwconfig->size);
> +
> +	i915_vma_unpin_and_release(&vma, I915_VMA_RELEASE_MAP);
> +
> +	return ret;
> +}
> +
> +/**
> + * intel_guc_hwconfig_fini - Finalize the HWConfig
> + *
> + * Free up the memory allocation holding the table.
> + */
> +void intel_guc_hwconfig_fini(struct intel_guc_hwconfig *hwconfig)
> +{
> +	kfree(hwconfig->ptr);
> +	hwconfig->size = 0;
> +	hwconfig->ptr = NULL;
> +}
> +
> +/**
> + * intel_guc_hwconfig_init - Initialize the HWConfig
> + *
> + * Retrieve the HWConfig table from the GuC and save it away in a local memory

"local memory" may have different meaning, maybe ".. save it locally"

with comment reworded,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> + * allocation. It can then be queried on demand by other users later on.
> + */
> +int intel_guc_hwconfig_init(struct intel_guc_hwconfig *hwconfig)
> +{
> +	struct intel_guc *guc = hwconfig_to_guc(hwconfig);
> +	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
> +	int ret;
> +
> +	if (!INTEL_INFO(i915)->has_guc_hwconfig)
> +		return 0;
> +
> +	ret = guc_hwconfig_discover_size(hwconfig);
> +	if (ret)
> +		return ret;
> +
> +	hwconfig->ptr = kmalloc(hwconfig->size, GFP_KERNEL);
> +	if (!hwconfig->ptr) {
> +		hwconfig->size = 0;
> +		return -ENOMEM;
> +	}
> +
> +	ret = guc_hwconfig_fill_buffer(hwconfig);
> +	if (ret < 0) {
> +		intel_guc_hwconfig_fini(hwconfig);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.h
> new file mode 100644
> index 000000000000..bfb90ae168dc
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#ifndef _INTEL_GUC_HWCONFIG_H_
> +#define _INTEL_GUC_HWCONFIG_H_
> +
> +#include <linux/types.h>
> +
> +struct intel_guc_hwconfig {
> +	u32 size;
> +	void *ptr;
> +};
> +
> +int intel_guc_hwconfig_init(struct intel_guc_hwconfig *hwconfig);
> +void intel_guc_hwconfig_fini(struct intel_guc_hwconfig *hwconfig);
> +
> +#endif /* _INTEL_GUC_HWCONFIG_H_ */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 09ed29df67bc..0cefa2a95190 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -489,6 +489,11 @@ static int __uc_init_hw(struct intel_uc *uc)
>  	if (ret)
>  		goto err_log_capture;
>  
> +	ret = intel_guc_hwconfig_init(&guc->hwconfig);
> +	if (ret)
> +		drm_notice(&i915->drm, "Failed to retrieve hwconfig table: %pe\n",
> +			   ERR_PTR(ret));
> +
>  	ret = guc_enable_communication(guc);
>  	if (ret)
>  		goto err_log_capture;
> @@ -562,6 +567,8 @@ static void __uc_fini_hw(struct intel_uc *uc)
>  	if (intel_uc_uses_guc_submission(uc))
>  		intel_guc_submission_disable(guc);
>  
> +	intel_guc_hwconfig_fini(&guc->hwconfig);
> +
>  	__uc_sanitize(uc);
>  }
>  
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 76e590fcb903..1d31e35a5154 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -990,6 +990,7 @@ static const struct intel_device_info adl_p_info = {
>  		BIT(RCS0) | BIT(BCS0) | BIT(VECS0) | BIT(VCS0) | BIT(VCS2),
>  	.ppgtt_size = 48,
>  	.dma_mask_size = 39,
> +	.has_guc_hwconfig = 1,
>  };
>  
>  #undef GEN
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> index 3699b1c539ea..82d8d6bc30ff 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -133,6 +133,7 @@ enum intel_ppgtt_type {
>  	func(gpu_reset_clobbers_display); \
>  	func(has_reset_engine); \
>  	func(has_global_mocs); \
> +	func(has_guc_hwconfig); \
>  	func(has_gt_uc); \
>  	func(has_l3_dpf); \
>  	func(has_llc); \
