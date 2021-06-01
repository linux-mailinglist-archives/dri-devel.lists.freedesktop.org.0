Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 510C6397B2E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 22:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1086EB15;
	Tue,  1 Jun 2021 20:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C1A6EB0B;
 Tue,  1 Jun 2021 20:24:41 +0000 (UTC)
IronPort-SDR: WwR/+eyroyOc3rdWMKfR4PbZ+HtkOLAI8NPdxWtPEs+Riz+StWYb5Fj7pk4ejdZ+qyBZMgQaKW
 6VPhCcQoPmGA==
X-IronPort-AV: E=McAfee;i="6200,9189,10002"; a="190984704"
X-IronPort-AV: E=Sophos;i="5.83,241,1616482800"; d="scan'208";a="190984704"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 13:24:40 -0700
IronPort-SDR: VlmOD83rNv0v/+Cl3Mbq7sxvoTF+HOX6cc5pnqz7ahXqv2JFPoEyAgekay4N7X8csr/DGHWjdJ
 DHTar5ER5L+Q==
X-IronPort-AV: E=Sophos;i="5.83,241,1616482800"; d="scan'208";a="438154941"
Received: from anqiangu-mobl.ccr.corp.intel.com (HELO intel.com)
 ([10.254.34.92])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 13:24:39 -0700
Date: Tue, 1 Jun 2021 16:24:38 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [Intel-gfx] [PATCH v4 05/17] drm/i915/pxp: allocate a vcs
 context for pxp usage
Message-ID: <YLaXhlKFGnOsYruj@intel.com>
References: <20210525054803.7387-1-daniele.ceraolospurio@intel.com>
 <20210525054803.7387-6-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210525054803.7387-6-daniele.ceraolospurio@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 24, 2021 at 10:47:51PM -0700, Daniele Ceraolo Spurio wrote:
> The context is required to send the session termination commands to the
> VCS, which will be implemented in a follow-up patch. We can also use the
> presence of the context as a check of pxp initialization completion.
> 
> v2: use perma-pinned context (Chris)
> v3: rename pinned_context functions (Chris)
> v4: split export of pinned_context functions to a separate patch (Rodrigo)
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  drivers/gpu/drm/i915/Makefile              |  4 ++
>  drivers/gpu/drm/i915/gt/intel_engine.h     |  2 +
>  drivers/gpu/drm/i915/gt/intel_gt.c         |  5 ++
>  drivers/gpu/drm/i915/gt/intel_gt_types.h   |  3 ++
>  drivers/gpu/drm/i915/pxp/intel_pxp.c       | 62 ++++++++++++++++++++++
>  drivers/gpu/drm/i915/pxp/intel_pxp.h       | 35 ++++++++++++
>  drivers/gpu/drm/i915/pxp/intel_pxp_types.h | 15 ++++++
>  7 files changed, 126 insertions(+)
>  create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp.c
>  create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp.h
>  create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 6947495bf34b..efd950122e40 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -273,6 +273,10 @@ i915-y += \
>  
>  i915-y += i915_perf.o
>  
> +# Protected execution platform (PXP) support
> +i915-$(CONFIG_DRM_I915_PXP) += \
> +	pxp/intel_pxp.o
> +
>  # Post-mortem debug and GPU hang state capture
>  i915-$(CONFIG_DRM_I915_CAPTURE_ERROR) += i915_gpu_error.o
>  i915-$(CONFIG_DRM_I915_SELFTEST) += \
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
> index a64d28aba257..903e498beb0b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> @@ -187,6 +187,8 @@ intel_write_status_page(struct intel_engine_cs *engine, int reg, u32 value)
>  #define I915_GEM_HWS_PREEMPT_ADDR	(I915_GEM_HWS_PREEMPT * sizeof(u32))
>  #define I915_GEM_HWS_SEQNO		0x40
>  #define I915_GEM_HWS_SEQNO_ADDR		(I915_GEM_HWS_SEQNO * sizeof(u32))
> +#define I915_GEM_HWS_PXP		0x60
> +#define I915_GEM_HWS_PXP_ADDR		(I915_GEM_HWS_PXP * sizeof(u32))
>  #define I915_GEM_HWS_SCRATCH		0x80
>  
>  #define I915_HWS_CSB_BUF0_INDEX		0x10
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 8d77dcbad059..68f42fabc151 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -20,6 +20,7 @@
>  #include "intel_uncore.h"
>  #include "intel_pm.h"
>  #include "shmem_utils.h"
> +#include "pxp/intel_pxp.h"
>  
>  void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
>  {
> @@ -627,6 +628,8 @@ int intel_gt_init(struct intel_gt *gt)
>  	if (err)
>  		goto err_gt;
>  
> +	intel_pxp_init(&gt->pxp);

As we discussed today, we will need to move this earlier in the initialization...

> +
>  	goto out_fw;
>  err_gt:
>  	__intel_gt_disable(gt);
> @@ -661,6 +664,8 @@ void intel_gt_driver_unregister(struct intel_gt *gt)
>  
>  	intel_rps_driver_unregister(&gt->rps);
>  
> +	intel_pxp_fini(&gt->pxp);
> +
>  	/*
>  	 * Upon unregistering the device to prevent any new users, cancel
>  	 * all in-flight requests so that we can quickly unbind the active
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index 0caf6ca0a784..53f44fd4a974 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -25,6 +25,7 @@
>  #include "intel_rc6_types.h"
>  #include "intel_rps_types.h"
>  #include "intel_wakeref.h"
> +#include "pxp/intel_pxp_types.h"
>  
>  struct drm_i915_private;
>  struct i915_ggtt;
> @@ -148,6 +149,8 @@ struct intel_gt {
>  		/* Slice/subslice/EU info */
>  		struct sseu_dev_info sseu;
>  	} info;
> +
> +	struct intel_pxp pxp;
>  };
>  
>  enum intel_gt_scratch_field {
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> new file mode 100644
> index 000000000000..3255c6da34e8
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2020 Intel Corporation.
> + */
> +#include "intel_pxp.h"
> +#include "gt/intel_context.h"
> +#include "i915_drv.h"
> +
> +static int create_vcs_context(struct intel_pxp *pxp)
> +{
> +	static struct lock_class_key pxp_lock;
> +	struct intel_gt *gt = pxp_to_gt(pxp);
> +	struct intel_engine_cs *engine;
> +	struct intel_context *ce;
> +
> +	/*
> +	 * Find the first VCS engine present. We're guaranteed there is one
> +	 * if we're in this function due to the check in has_pxp
> +	 */
> +	for (engine = gt->engine_class[VIDEO_DECODE_CLASS][0]; !engine; engine++);
> +	GEM_BUG_ON(!engine || engine->class != VIDEO_DECODE_CLASS);
> +
> +	ce = intel_engine_create_pinned_context(engine, NULL, SZ_4K,
> +						I915_GEM_HWS_PXP_ADDR,
> +						&pxp_lock, "pxp_context");
> +	if (IS_ERR(ce)) {
> +		drm_err(&gt->i915->drm, "failed to create VCS ctx for PXP\n");
> +		return PTR_ERR(ce);
> +	}
> +
> +	pxp->ce = ce;
> +
> +	return 0;
> +}
> +
> +static void destroy_vcs_context(struct intel_pxp *pxp)
> +{
> +	intel_engine_destroy_pinned_context(fetch_and_zero(&pxp->ce));
> +}
> +
> +void intel_pxp_init(struct intel_pxp *pxp)
> +{
> +	struct intel_gt *gt = pxp_to_gt(pxp);
> +	int ret;
> +
> +	if (!HAS_PXP(gt->i915))
> +		return;
> +

... and we will need to add the PXP version check here, not in IGT...

But both changes can be done in follow-up patches, once we get the extra
docs we requested. For now this patch lgtm

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +	ret = create_vcs_context(pxp);
> +	if (ret)
> +		return;
> +
> +	drm_info(&gt->i915->drm, "Protected Xe Path (PXP) protected content support initialized\n");
> +}
> +
> +void intel_pxp_fini(struct intel_pxp *pxp)
> +{
> +	if (!intel_pxp_is_enabled(pxp))
> +		return;
> +
> +	destroy_vcs_context(pxp);
> +}
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> new file mode 100644
> index 000000000000..e87550fb9821
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2020, Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __INTEL_PXP_H__
> +#define __INTEL_PXP_H__
> +
> +#include "gt/intel_gt_types.h"
> +#include "intel_pxp_types.h"
> +
> +static inline struct intel_gt *pxp_to_gt(const struct intel_pxp *pxp)
> +{
> +	return container_of(pxp, struct intel_gt, pxp);
> +}
> +
> +static inline bool intel_pxp_is_enabled(const struct intel_pxp *pxp)
> +{
> +	return pxp->ce;
> +}
> +
> +#ifdef CONFIG_DRM_I915_PXP
> +void intel_pxp_init(struct intel_pxp *pxp);
> +void intel_pxp_fini(struct intel_pxp *pxp);
> +#else
> +static inline void intel_pxp_init(struct intel_pxp *pxp)
> +{
> +}
> +
> +static inline void intel_pxp_fini(struct intel_pxp *pxp)
> +{
> +}
> +#endif
> +
> +#endif /* __INTEL_PXP_H__ */
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> new file mode 100644
> index 000000000000..bd12c520e60a
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2020, Intel Corporation. All rights reserved.
> + */
7> +
> +#ifndef __INTEL_PXP_TYPES_H__
> +#define __INTEL_PXP_TYPES_H__
> +
> +struct intel_context;
> +
> +struct intel_pxp {
> +	struct intel_context *ce;
> +};
> +
> +#endif /* __INTEL_PXP_TYPES_H__ */
> -- 
> 2.29.2
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
