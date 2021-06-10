Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCEE3A36EB
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 00:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4686A6EE08;
	Thu, 10 Jun 2021 22:16:21 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B436EE06;
 Thu, 10 Jun 2021 22:16:19 +0000 (UTC)
IronPort-SDR: ZhwdxNQOdY1c9CfFSVo4StNM61eMbsA+U4luGYsJprW8vH7VxdrXhwbB8XSeGPqZroZKRs5IyT
 A/hPmvgXr2Fw==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="205377430"
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="205377430"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 15:16:18 -0700
IronPort-SDR: Fu+8Fl1SSu+nX4SVBnD2QmAuQeq3Vo5K1EomE9r8mYACldgXhV6DD9/iRnbz+zAM87SjvdCJU8
 s3w0p6jOzPNQ==
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="483028812"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 15:16:18 -0700
Date: Thu, 10 Jun 2021 15:09:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John.C.Harrison@Intel.com
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915/uapi: Add query for L3 bank count
Message-ID: <20210610220923.GA8357@sdutt-i7>
References: <20210610204626.2995262-1-John.C.Harrison@Intel.com>
 <20210610204626.2995262-4-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610204626.2995262-4-John.C.Harrison@Intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Intel-GFX@Lists.FreeDesktop.Org, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 01:46:26PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Various UMDs need to know the L3 bank count. So add a query API for it.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt.c | 15 +++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_gt.h |  1 +
>  drivers/gpu/drm/i915/i915_query.c  | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/i915/i915_reg.h    |  1 +
>  include/uapi/drm/i915_drm.h        |  1 +
>  5 files changed, 40 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 2161bf01ef8b..708bb3581d83 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -704,3 +704,18 @@ void intel_gt_info_print(const struct intel_gt_info *info,
>  
>  	intel_sseu_dump(&info->sseu, p);
>  }
> +
> +int intel_gt_get_l3bank_count(struct intel_gt *gt)

Small nit, this function is ..'l3bank_count' while the define for query
is ..'L3_BANK_COUNT'. I'm thinking this function should have a space
between l3 & bank for consistency.

> +{
> +	struct drm_i915_private *i915 = gt->i915;
> +	intel_wakeref_t wakeref;
> +	u32 fuse3;
> +
> +	if (GRAPHICS_VER(i915) < 12)
> +		return -ENODEV;
> +
> +	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
> +		fuse3 = intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3);
> +
> +	return hweight32(REG_FIELD_GET(GEN12_GT_L3_MODE_MASK, ~fuse3));
> +}
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
> index 7ec395cace69..46aa1cf4cf30 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> @@ -77,6 +77,7 @@ static inline bool intel_gt_is_wedged(const struct intel_gt *gt)
>  
>  void intel_gt_info_print(const struct intel_gt_info *info,
>  			 struct drm_printer *p);
> +int intel_gt_get_l3bank_count(struct intel_gt *gt);
>  
>  void intel_gt_watchdog_work(struct work_struct *work);
>  
> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> index 96bd8fb3e895..0e92bb2d21b2 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -10,6 +10,7 @@
>  #include "i915_perf.h"
>  #include "i915_query.h"
>  #include <uapi/drm/i915_drm.h>
> +#include "gt/intel_gt.h"
>  
>  static int copy_query_item(void *query_hdr, size_t query_sz,
>  			   u32 total_length,
> @@ -502,6 +503,26 @@ static int query_hwconfig_table(struct drm_i915_private *i915,
>  	return hwconfig->size;
>  }
>  
> +static int query_l3banks(struct drm_i915_private *i915,
> +			 struct drm_i915_query_item *query_item)
> +{
> +	u32 banks;
> +
> +	if (query_item->length == 0)
> +		return sizeof(banks);
> +
> +	if (query_item->length < sizeof(banks))
> +		return -EINVAL;
> +
> +	banks = intel_gt_get_l3bank_count(&i915->gt);
> +
> +	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr),
> +			 &banks, sizeof(banks)))
> +		return -EFAULT;
> +
> +	return sizeof(banks);
> +}
> +
>  static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
>  					struct drm_i915_query_item *query_item) = {
>  	query_topology_info,
> @@ -509,6 +530,7 @@ static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
>  	query_perf_config,
>  	query_memregion_info,
>  	query_hwconfig_table,
> +	query_l3banks,

Another nit, for consistency query_l3banks -> query_l3_bank_count.

With these nits fixed:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  };
>  
>  int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index eb13c601d680..e9ba88fe3db7 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -3099,6 +3099,7 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
>  #define	GEN10_MIRROR_FUSE3		_MMIO(0x9118)
>  #define GEN10_L3BANK_PAIR_COUNT     4
>  #define GEN10_L3BANK_MASK   0x0F
> +#define GEN12_GT_L3_MODE_MASK 0xFF
>  
>  #define GEN8_EU_DISABLE0		_MMIO(0x9134)
>  #define   GEN8_EU_DIS0_S0_MASK		0xffffff
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 87d369cae22a..20d18cca5066 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -2234,6 +2234,7 @@ struct drm_i915_query_item {
>  #define DRM_I915_QUERY_PERF_CONFIG      3
>  #define DRM_I915_QUERY_MEMORY_REGIONS   4
>  #define DRM_I915_QUERY_HWCONFIG_TABLE   5
> +#define DRM_I915_QUERY_L3_BANK_COUNT    6
>  /* Must be kept compact -- no holes and well documented */
>  
>  	/**
> -- 
> 2.25.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
