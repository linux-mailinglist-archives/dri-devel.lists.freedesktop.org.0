Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD693A96F0
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 12:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CC26E037;
	Wed, 16 Jun 2021 10:08:49 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863756E57E;
 Wed, 16 Jun 2021 10:08:48 +0000 (UTC)
IronPort-SDR: U+/+G5WVFVVvNjzdNnLsh+3X8uiocfevqOjnf3/aMJ8/MxMyxjLdsRs30NtOSWIoP+LNX856yI
 aoOHi6uNnkcA==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="269999269"
X-IronPort-AV: E=Sophos;i="5.83,277,1616482800"; d="scan'208";a="269999269"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 03:08:47 -0700
IronPort-SDR: NBsdTn2Jss6yGUE6ERgVSwx8X/Wx5TBRfOB5vxjU84WJzn19ugF4xlcX1/61rD+5c3DFCPmK7r
 2bIvsx+Jp0hw==
X-IronPort-AV: E=Sophos;i="5.83,277,1616482800"; d="scan'208";a="442835889"
Received: from tomfin1x-mobl1.ger.corp.intel.com (HELO [10.213.246.124])
 ([10.213.246.124])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 03:08:46 -0700
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915/uapi: Add query for L3 bank count
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20210610204626.2995262-1-John.C.Harrison@Intel.com>
 <20210610204626.2995262-4-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <4a8623d4-4450-ea64-b0dc-70e6458d77df@linux.intel.com>
Date: Wed, 16 Jun 2021 11:08:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610204626.2995262-4-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/06/2021 21:46, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Various UMDs need to know the L3 bank count. So add a query API for it.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt.c | 15 +++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_gt.h |  1 +
>   drivers/gpu/drm/i915/i915_query.c  | 22 ++++++++++++++++++++++
>   drivers/gpu/drm/i915/i915_reg.h    |  1 +
>   include/uapi/drm/i915_drm.h        |  1 +
>   5 files changed, 40 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 2161bf01ef8b..708bb3581d83 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -704,3 +704,18 @@ void intel_gt_info_print(const struct intel_gt_info *info,
>   
>   	intel_sseu_dump(&info->sseu, p);
>   }
> +
> +int intel_gt_get_l3bank_count(struct intel_gt *gt)
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
>   void intel_gt_info_print(const struct intel_gt_info *info,
>   			 struct drm_printer *p);
> +int intel_gt_get_l3bank_count(struct intel_gt *gt);
>   
>   void intel_gt_watchdog_work(struct work_struct *work);
>   
> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> index 96bd8fb3e895..0e92bb2d21b2 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -10,6 +10,7 @@
>   #include "i915_perf.h"
>   #include "i915_query.h"
>   #include <uapi/drm/i915_drm.h>
> +#include "gt/intel_gt.h"
>   
>   static int copy_query_item(void *query_hdr, size_t query_sz,
>   			   u32 total_length,
> @@ -502,6 +503,26 @@ static int query_hwconfig_table(struct drm_i915_private *i915,
>   	return hwconfig->size;
>   }
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

Having spotted i915->gt I am thinking whether this should be future 
proofed to take, say, struct i915_engine_class_instance as input. If one 
need different GTs will have different L3 config. Alternative is adding 
a new query at that point. No strong opinion either way.

Otherwise yes, I agree with adding flags mbz check and documenting the 
uapi as other people have suggested.

Regards,

Tvrtko

> +
> +	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr),
> +			 &banks, sizeof(banks)))
> +		return -EFAULT;
> +
> +	return sizeof(banks);
> +}
> +
>   static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
>   					struct drm_i915_query_item *query_item) = {
>   	query_topology_info,
> @@ -509,6 +530,7 @@ static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
>   	query_perf_config,
>   	query_memregion_info,
>   	query_hwconfig_table,
> +	query_l3banks,
>   };
>   
>   int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index eb13c601d680..e9ba88fe3db7 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -3099,6 +3099,7 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
>   #define	GEN10_MIRROR_FUSE3		_MMIO(0x9118)
>   #define GEN10_L3BANK_PAIR_COUNT     4
>   #define GEN10_L3BANK_MASK   0x0F
> +#define GEN12_GT_L3_MODE_MASK 0xFF
>   
>   #define GEN8_EU_DISABLE0		_MMIO(0x9134)
>   #define   GEN8_EU_DIS0_S0_MASK		0xffffff
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 87d369cae22a..20d18cca5066 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -2234,6 +2234,7 @@ struct drm_i915_query_item {
>   #define DRM_I915_QUERY_PERF_CONFIG      3
>   #define DRM_I915_QUERY_MEMORY_REGIONS   4
>   #define DRM_I915_QUERY_HWCONFIG_TABLE   5
> +#define DRM_I915_QUERY_L3_BANK_COUNT    6
>   /* Must be kept compact -- no holes and well documented */
>   
>   	/**
> 
