Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 820EA4AE328
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 22:56:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CC910E4D2;
	Tue,  8 Feb 2022 21:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B6110E4BC;
 Tue,  8 Feb 2022 21:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644357392; x=1675893392;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=o93+JW+42VjsJzrhTDtRlaN0GSaiAnKqV9w10H22j8s=;
 b=kNgWzfmgLlJpAJMP/rCmSOpYJiIyWGP/HTm6CSz3CiKNYjcwoDCo1XnA
 MY/JuUubY3KEanct/cxYlInz7tvHtanS1bL1KnK3lTUA3wTw+Z0K4pa7m
 dybYRoA8lHNfFPpGOSLM7sZn8YGY5gAljCjSz+2xOpRDhjZidJJ21Sw99
 PEk1JXSGQD5C/3KLbgIiYdiSsfNipIKiA2N9JUQOFflvgn70L/pbh7BQR
 WlUzWDJYZNlqsWWevJj+T/U+6P2+uZGePOcIdw42KDSOtjzFjWBu3eO6V
 WBTBQ+apCahstF7ZzvR8/sZ8YuctnS9p6iASUEiv7JW6u33T+VFFfVnZS g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="247894192"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="247894192"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 13:56:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="525718644"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga007.jf.intel.com with ESMTP; 08 Feb 2022 13:56:30 -0800
Received: from [10.249.151.37] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.151.37])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 218LuSwn019537; Tue, 8 Feb 2022 21:56:29 GMT
Message-ID: <c9584d58-9b7e-8f72-a097-70848aea744c@intel.com>
Date: Tue, 8 Feb 2022 22:56:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.1
Subject: Re: [PATCH v3 1/4] drm/i915/guc: Add fetch of hwconfig table
Content-Language: en-US
To: Jordan Justen <jordan.l.justen@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
References: <20220208210503.869491-1-jordan.l.justen@intel.com>
 <20220208210503.869491-2-jordan.l.justen@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20220208210503.869491-2-jordan.l.justen@intel.com>
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
 John Harrison <John.C.Harrison@Intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 08.02.2022 22:05, Jordan Justen wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Implement support for fetching the hardware description table from the
> GuC. The call is made twice - once without a destination buffer to
> query the size and then a second time to fill in the buffer.
> 
> Note that the table is only available on ADL-P and later platforms.
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   1 +
>  .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |   4 +
>  drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   3 +
>  .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   | 151 ++++++++++++++++++
>  .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.h   |  19 +++
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   6 +
>  7 files changed, 185 insertions(+)
>  create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
>  create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.h
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 6836b020a5be..ba9b6557d59d 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -192,6 +192,7 @@ i915-y += gt/uc/intel_uc.o \
>  	  gt/uc/intel_guc_rc.o \
>  	  gt/uc/intel_guc_slpc.o \
>  	  gt/uc/intel_guc_submission.o \
> +	  gt/uc/intel_guc_hwconfig.o \

nit: I guess ordering of files (by name) is also desired in makefiles

>  	  gt/uc/intel_huc.o \
>  	  gt/uc/intel_huc_debugfs.o \
>  	  gt/uc/intel_huc_fw.o
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
> index f9240d4baa69..ce2ff4bb0fd5 100644
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
> +	/** @hwconfig: hardware configuration KLV table */

nit: "@hwconfig: data related to hardware configuration KLV blob"

> +	struct intel_guc_hwconfig hwconfig;
>  
>  	/** @sched_engine: Global engine used to submit requests to GuC */
>  	struct i915_sched_engine *sched_engine;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> new file mode 100644
> index 000000000000..ce6088f112d4
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> @@ -0,0 +1,151 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2021 Intel Corporation

2022 ?

> + */
> +
> +#include "gt/intel_gt.h"
> +#include "i915_drv.h"
> +#include "i915_memcpy.h"
> +#include "intel_guc_hwconfig.h"
> +
> +static inline struct intel_guc *hwconfig_to_guc(struct intel_guc_hwconfig *hwconfig)

no need for explicit "inline"

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
> +static int __guc_action_get_hwconfig(struct intel_guc_hwconfig *hwconfig,

since this is "guc_action" then you should pass "guc" instead of
"hwconfig" (as you don't need anything from hwconfig in this helper)

> +				     u32 ggtt_offset, u32 ggtt_size)
> +{
> +	struct intel_guc *guc = hwconfig_to_guc(hwconfig);
> +	u32 action[] = {
> +		INTEL_GUC_ACTION_GET_HWCONFIG,
> +		ggtt_offset,
> +		0, /* upper 32 bits of address */
> +		ggtt_size,
> +	};
> +	int ret;
> +
> +	ret = intel_guc_send_mmio(guc, action, ARRAY_SIZE(action), NULL, 0);
> +	if (ret == -ENXIO)
> +		return -ENOENT;
> +
> +	if (!ggtt_size && !ret)
> +		ret = -EINVAL;

you have dedicated function for query/discover size, any special error
handling shall be done there

> +
> +	return ret;
> +}
> +
> +static int guc_hwconfig_discover_size(struct intel_guc_hwconfig *hwconfig)
> +{
> +	int ret;
> +
> +	/* Sending a query with too small a table will return the size of the table */

sending too small buffer size should result in error
only passing zero offset/size is treated as a query

> +	ret = __guc_action_get_hwconfig(hwconfig, 0, 0);
> +	if (ret < 0)
> +		return ret;
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
> +	ret = __guc_action_get_hwconfig(hwconfig, ggtt_offset, hwconfig->size);
> +	if (ret >= 0)
> +		memcpy(hwconfig->ptr, vaddr, hwconfig->size);
> +
> +	i915_vma_unpin_and_release(&vma, I915_VMA_RELEASE_MAP);
> +
> +	return ret;
> +}
> +
> +static bool has_table(struct drm_i915_private *i915)
> +{
> +	if (IS_ALDERLAKE_P(i915))
> +		return true;

shouldn't this be a part of our device_info ?

 	func(has_gt_uc); \
 	func(has_guc_deprivilege); \
+	func(has_guc_hwconfig); \


> +
> +	return false;
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
> + * allocation. It can then be queried on demand by other users later on.
> + */
> +int intel_guc_hwconfig_init(struct intel_guc_hwconfig *hwconfig)
> +{
> +	struct intel_guc *guc = hwconfig_to_guc(hwconfig);
> +	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
> +	int ret;
> +
> +	if (!has_table(i915))
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
> index 000000000000..fdd7f0d6e938
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2021 Intel Corporation

2022

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
> index 09ed29df67bc..d045ff6d4d63 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -489,6 +489,10 @@ static int __uc_init_hw(struct intel_uc *uc)
>  	if (ret)
>  		goto err_log_capture;
>  
> +	ret = intel_guc_hwconfig_init(&guc->hwconfig);
> +	if (ret)
> +		drm_err(&i915->drm, "Failed to retrieve hwconfig table: %d\n", ret);

maybe drm_notice since we continue probe

nit: you may report error as: "%pe", ERR_PTR(ret)

Michal

> +
>  	ret = guc_enable_communication(guc);
>  	if (ret)
>  		goto err_log_capture;
> @@ -562,6 +566,8 @@ static void __uc_fini_hw(struct intel_uc *uc)
>  	if (intel_uc_uses_guc_submission(uc))
>  		intel_guc_submission_disable(guc);
>  
> +	intel_guc_hwconfig_fini(&guc->hwconfig);
> +
>  	__uc_sanitize(uc);
>  }
>  
