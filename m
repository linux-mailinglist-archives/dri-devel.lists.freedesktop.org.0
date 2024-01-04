Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8906824495
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 16:07:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5AD10E49E;
	Thu,  4 Jan 2024 15:07:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C43710E4AC;
 Thu,  4 Jan 2024 15:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704380836; x=1735916836;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=m5muUap0foUmA7XBFQM6OOFG9HEmjMq98a2PxaKdlR4=;
 b=FoFL50lyWWgcVrzlSCklu6x1sP8hKeiNphMz+0CjAH5tpB7RyyEp4kU+
 IxzwXzPmoN2WesUaf+Tnhph63L4CB4VJ95JgDqaZo2iWUEgd7zMFjHPq3
 5ARWMzmrSd92DzzAh12ecvhG6itz6zmjx+tpRQofk/ECkmUwHecbx8lPp
 lf9nXlblYUc3EIYWcGHmCKLCO09V+RD51b4AgItmGMv9gsXdopD1VxQJF
 N4UbHIa37jta4Y8sl8qdgaO6UbWXD/gTa+5oUc03jfqPgK1nvqpr7WQzF
 AFzszhx2WbHsyC+Yu2Ou1MOf8eYgk1skUnAz3QMoLWJT/RL71c8QNAmi9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="428430197"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="428430197"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 07:07:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="953638806"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="953638806"
Received: from dhead-mobl1.ger.corp.intel.com (HELO [10.213.221.58])
 ([10.213.221.58])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 07:07:11 -0800
Message-ID: <98e56d3e-ebf0-42b9-928b-0dcc4303658c@linux.intel.com>
Date: Thu, 4 Jan 2024 15:07:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/i915/gt: Support fixed CCS mode
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20240104143558.193694-1-andi.shyti@linux.intel.com>
 <20240104143558.193694-2-andi.shyti@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20240104143558.193694-2-andi.shyti@linux.intel.com>
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 04/01/2024 14:35, Andi Shyti wrote:
> The CCS mode involves assigning CCS engines to slices depending
> on the number of slices and the number of engines the user wishes
> to set.
> 
> In this patch, the default CCS setting is established during the
> initial GT settings. It involves assigning only one CCS to all
> the slices.
> 
> Based on a patch by Chris Wilson <chris.p.wilson@linux.intel.com>
> and Tejas Upadhyay <tejas.upadhyay@intel.com>.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile               |  1 +
>   drivers/gpu/drm/i915/gt/intel_gt.c          |  6 ++
>   drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 81 +++++++++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h | 16 ++++
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 13 ++++
>   drivers/gpu/drm/i915/gt/intel_gt_types.h    | 19 +++++
>   drivers/gpu/drm/i915/i915_drv.h             |  2 +
>   7 files changed, 138 insertions(+)
>   create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
>   create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index e777686190ca..1dce15d6306b 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -119,6 +119,7 @@ gt-y += \
>   	gt/intel_ggtt_fencing.o \
>   	gt/intel_gt.o \
>   	gt/intel_gt_buffer_pool.o \
> +	gt/intel_gt_ccs_mode.o \
>   	gt/intel_gt_clock_utils.o \
>   	gt/intel_gt_debugfs.o \
>   	gt/intel_gt_engines_debugfs.o \
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index a425db5ed3a2..e83c7b80c07a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -17,6 +17,7 @@
>   #include "intel_engine_regs.h"
>   #include "intel_ggtt_gmch.h"
>   #include "intel_gt.h"
> +#include "intel_gt_ccs_mode.h"
>   #include "intel_gt_buffer_pool.h"
>   #include "intel_gt_clock_utils.h"
>   #include "intel_gt_debugfs.h"
> @@ -47,6 +48,7 @@ void intel_gt_common_init_early(struct intel_gt *gt)
>   	init_llist_head(&gt->watchdog.list);
>   	INIT_WORK(&gt->watchdog.work, intel_gt_watchdog_work);
>   
> +	intel_gt_init_ccs_mode(gt);
>   	intel_gt_init_buffer_pool(gt);
>   	intel_gt_init_reset(gt);
>   	intel_gt_init_requests(gt);
> @@ -195,6 +197,9 @@ int intel_gt_init_hw(struct intel_gt *gt)
>   
>   	intel_gt_init_swizzling(gt);
>   
> +	/* Configure CCS mode */
> +	intel_gt_apply_ccs_mode(gt);
> +
>   	/*
>   	 * At least 830 can leave some of the unused rings
>   	 * "active" (ie. head != tail) after resume which
> @@ -860,6 +865,7 @@ void intel_gt_driver_late_release_all(struct drm_i915_private *i915)
>   
>   	for_each_gt(gt, i915, id) {
>   		intel_uc_driver_late_release(&gt->uc);
> +		intel_gt_fini_ccs_mode(gt);
>   		intel_gt_fini_requests(gt);
>   		intel_gt_fini_reset(gt);
>   		intel_gt_fini_timelines(gt);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
> new file mode 100644
> index 000000000000..fab8a77bded2
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
> @@ -0,0 +1,81 @@
> +//SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "i915_drv.h"
> +
> +#include "intel_gt.h"
> +#include "intel_gt_ccs_mode.h"
> +#include "intel_gt_regs.h"
> +#include "intel_gt_types.h"
> +
> +static void __intel_gt_apply_ccs_mode(struct intel_gt *gt)
> +{
> +	u32 mode = XEHP_CCS_MODE_CSLICE_0_3_MASK; /* disable all by default */
> +	int num_slices = hweight32(CCS_MASK(gt));
> +	int num_engines = gt->ccs.mode;
> +	int slice = 0;
> +	int i;
> +
> +	if (!num_engines)
> +		return;
> +
> +	/*
> +	 * Loop over all available slices and assign each a user engine.
> +	 *
> +	 * With 1 engine (ccs0):
> +	 *   slice 0, 1, 2, 3: ccs0
> +	 *
> +	 * With 2 engines (ccs0, ccs1):
> +	 *   slice 0, 2: ccs0
> +	 *   slice 1, 3: ccs1
> +	 *
> +	 * With 4 engines (ccs0, ccs1, ccs2, ccs3):
> +	 *   slice 0: ccs0
> +	 *   slice 1: ccs1
> +	 *   slice 2: ccs2
> +	 *   slice 3: ccs3
> +	 *
> +	 * Since the number of slices and the number of engines is
> +	 * known, and we ensure that there is an exact multiple of
> +	 * engines for slices, the double loop becomes a loop over each
> +	 * slice.
> +	 */
> +	for (i = num_slices / num_engines; i < num_slices; i++) {
> +		struct intel_engine_cs *engine;
> +		intel_engine_mask_t tmp;
> +
> +		for_each_engine_masked(engine, gt, ALL_CCS(gt), tmp) {
> +			/* If a slice is fused off, leave disabled */
> +			while (!(CCS_MASK(gt) & BIT(slice)))
> +				slice++;
> +
> +			mode &= ~XEHP_CCS_MODE_CSLICE(slice, XEHP_CCS_MODE_CSLICE_MASK);
> +			mode |= XEHP_CCS_MODE_CSLICE(slice, engine->instance);
> +
> +			/* assign the next slice */
> +			slice++;
> +		}
> +	}
> +
> +	intel_uncore_write(gt->uncore, XEHP_CCS_MODE, mode);
> +}
> +
> +void intel_gt_apply_ccs_mode(struct intel_gt *gt)
> +{
> +	mutex_lock(&gt->ccs.mutex);
> +	__intel_gt_apply_ccs_mode(gt);
> +	mutex_unlock(&gt->ccs.mutex);
> +}
> +
> +void intel_gt_init_ccs_mode(struct intel_gt *gt)
> +{
> +	mutex_init(&gt->ccs.mutex);
> +	gt->ccs.mode = 1;

What is '1'? And this question carries over to the sysfs interface in 
the following patch - who will use it and where it is documented how to 
use it?

Also, should this setting somehow be gated by an applicable platform? Or 
if not on setting then when acting on it in __intel_gt_apply_ccs_mode?

Creation of sysfs files as well should be gated by platform too in the 
following patch?

Regards,

Tvrtko

> +}
> +
> +void intel_gt_fini_ccs_mode(struct intel_gt *gt)
> +{
> +	mutex_destroy(&gt->ccs.mutex);
> +}
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
> new file mode 100644
> index 000000000000..751c5700944b
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef INTEL_GT_CCS_MODE_H
> +#define INTEL_GT_CCS_MODE_H
> +
> +struct intel_gt;
> +
> +void intel_gt_init_ccs_mode(struct intel_gt *gt);
> +void intel_gt_fini_ccs_mode(struct intel_gt *gt);
> +
> +void intel_gt_apply_ccs_mode(struct intel_gt *gt);
> +
> +#endif /* INTEL_GT_CCS_MODE_H */
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 50962cfd1353..3e558d6d5e89 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1604,6 +1604,19 @@
>   #define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
>   #define   GEN12_CAGF_MASK			REG_GENMASK(19, 11)
>   
> +/*
> + * Total of 4 cslices, where each cslice is in the form:
> + *   [0-3]     CCS ID
> + *   [4-6]     RSVD
> + *   [7]       Disabled
> + */
> +#define XEHP_CCS_MODE				_MMIO(0x14804)
> +#define   XEHP_CCS_MODE_CSLICE_0_3_MASK		REG_GENMASK(11, 0)
> +#define   XEHP_CCS_MODE_CSLICE_MASK		0x7 /* CCS0-3 + rsvd */
> +#define   XEHP_CCS_MODE_CSLICE_WIDTH		ilog2(XEHP_CCS_MODE_CSLICE_MASK + 1)
> +#define   XEHP_CCS_MODE_CSLICE(cslice, ccs) \
> +	(ccs << (cslice * XEHP_CCS_MODE_CSLICE_WIDTH))
> +
>   #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
>   #define   GEN11_CSME				(31)
>   #define   GEN12_HECI_2				(30)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index def7dd0eb6f1..45db98a5ce97 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -207,6 +207,25 @@ struct intel_gt {
>   					    [MAX_ENGINE_INSTANCE + 1];
>   	enum intel_submission_method submission_method;
>   
> +	/*
> +	 * Track fixed mapping between CCS engines and compute slices.
> +	 *
> +	 * In order to w/a HW that has the inability to dynamically load
> +	 * balance between CCS engines and EU in the compute slices, we have to
> +	 * reconfigure a static mapping on the fly. We track the current CCS
> +	 * configuration (set by thr user through a sysfs interface) and compare
> +	 * it against the current CCS_MODE (which maps CCS engines to compute
> +	 * slices). If there is only a single engine selected, we can map it to
> +	 * all available compute slices for maximal single task performance
> +	 * (fast/narrow). If there are more then one engine selected, we have to
> +	 * reduce the number of slices allocated to each engine (wide/slow),
> +	 * fairly distributing the EU between the equivalent engines.
> +	 */
> +	struct {
> +		struct mutex mutex;
> +		u32 mode;
> +	} ccs;
> +
>   	/*
>   	 * Default address space (either GGTT or ppGTT depending on arch).
>   	 *
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index e81b3b2858ac..cd85889ecfe4 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -659,6 +659,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>   #define CCS_MASK(gt) \
>   	ENGINE_INSTANCES_MASK(gt, CCS0, I915_MAX_CCS)
>   
> +#define ALL_CCS(gt) (CCS_MASK(gt) << CCS0)
> +
>   #define HAS_MEDIA_RATIO_MODE(i915) (INTEL_INFO(i915)->has_media_ratio_mode)
>   
>   /*
