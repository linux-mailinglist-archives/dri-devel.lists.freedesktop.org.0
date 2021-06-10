Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A82F3A3775
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 00:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65826E500;
	Thu, 10 Jun 2021 22:57:55 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F266E500;
 Thu, 10 Jun 2021 22:57:54 +0000 (UTC)
IronPort-SDR: RoEKEIPL6AYKxubLnKSj6zY8GeSxU9vPwILo2dHaDCes2tSRnM4u3nOmCujhSlCAnl81hpJb1J
 Z2eGYpY2X8nw==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="192737515"
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="192737515"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 15:57:27 -0700
IronPort-SDR: 6mIAuioidovK8Ryup2ypThl8ycUUpABbrmclszN4QDo914wmkS9p3OLDJsR+hqTEFNZF3qVtgf
 6OGYAd4NyWmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="450560339"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga008.fm.intel.com with ESMTP; 10 Jun 2021 15:57:25 -0700
Received: from [10.249.139.200] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.139.200])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 15AMvNmB004406; Thu, 10 Jun 2021 23:57:24 +0100
Subject: Re: [PATCH 2/3] drm/i915/uapi: Add query for hwconfig table
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20210610204626.2995262-1-John.C.Harrison@Intel.com>
 <20210610204626.2995262-3-John.C.Harrison@Intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <4d6723f1-86d5-01c8-4be4-0f678f895413@intel.com>
Date: Fri, 11 Jun 2021 00:57:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210610204626.2995262-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset=utf-8
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Slawomir Milczarek <slawomir.milczarek@intel.com>,
 Kenneth Graunke <kenneth.w.graunke@intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10.06.2021 22:46, John.C.Harrison@Intel.com wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> GuC contains a consolidated table with a bunch of information about the
> current device.
> 
> Previously, this information was spread and hardcoded to all the components
> including GuC, i915 and various UMDs. The goal here is to consolidate
> the data into GuC in a way that all interested components can grab the
> very latest and synchronized information using a simple query.
> 
> As per most of the other queries, this one can be called twice.
> Once with item.length=0 to determine the exact buffer size, then
> allocate the user memory and call it again for to retrieve the
> table data. For example:
>   struct drm_i915_query_item item = {
>     .query_id = DRM_I915_QUERY_HWCONCFIG_TABLE;
>   };
>   query.items_ptr = (int64_t) &item;
>   query.num_items = 1;
> 
>   ioctl(fd, DRM_IOCTL_I915_QUERY, query, sizeof(query));
> 
>   if (item.length <= 0)
>     return -ENOENT;
> 
>   data = malloc(item.length);
>   item.data_ptr = (int64_t) &data;
>   ioctl(fd, DRM_IOCTL_I915_QUERY, query, sizeof(query));
> 
>   // Parse the data as appropriate...
> 
> The returned array is a simple and flexible KLV (Key/Length/Value)
> formatted table. For example, it could be just:
>   enum device_attr {
>      ATTR_SOME_VALUE = 0,
>      ATTR_SOME_MASK  = 1,
>   };
> 
>   static const u32 hwconfig[] = {
>       ATTR_SOME_VALUE,
>       1,             // Value Length in DWords
>       8,             // Value
> 
>       ATTR_SOME_MASK,
>       3,
>       0x00FFFFFFFF, 0xFFFFFFFF, 0xFF000000,
>   };

same example was already added to code in previous patch
maybe just refer to that documentation ?

> 
> The attribute ids are defined in a hardware spec. The current list as
> known to the i915 driver can be found in i915/gt/intel_guc_hwconfig_types.h

previous patch introduced i915/gt/intel_hwconfig_types.h

also, i915 seems to be not using any/many of them directly, so it could
happen that GuC will return new/updated klvs, so shouldn't we make this
klv list more external and maybe even define as uabi header?

> 
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Kenneth Graunke <kenneth.w.graunke@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Slawomir Milczarek <slawomir.milczarek@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/i915/i915_query.c | 23 +++++++++++++++++++++++
>  include/uapi/drm/i915_drm.h       |  1 +
>  2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> index e49da36c62fb..96bd8fb3e895 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -480,12 +480,35 @@ static int query_memregion_info(struct drm_i915_private *i915,
>  	return total_length;
>  }
>  
> +static int query_hwconfig_table(struct drm_i915_private *i915,
> +				struct drm_i915_query_item *query_item)
> +{
> +	struct intel_gt *gt = &i915->gt;
> +	struct intel_guc_hwconfig *hwconfig = &gt->uc.guc.hwconfig;
> +
> +	if (!hwconfig->size || !hwconfig->ptr)
> +		return -ENODEV;

shouldn't we also have:

	if (query_item->flags != 0)
		return -EINVAL;

> +
> +	if (query_item->length == 0)
> +		return hwconfig->size;
> +
> +	if (query_item->length < hwconfig->size)
> +		return -EINVAL;
> +
> +	if (copy_to_user(u64_to_user_ptr(query_item->data_ptr),
> +			 hwconfig->ptr, hwconfig->size))
> +		return -EFAULT;
> +
> +	return hwconfig->size;
> +}
> +
>  static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
>  					struct drm_i915_query_item *query_item) = {
>  	query_topology_info,
>  	query_engine_info,
>  	query_perf_config,
>  	query_memregion_info,
> +	query_hwconfig_table,
>  };
>  
>  int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index c2c7759b7d2e..87d369cae22a 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -2233,6 +2233,7 @@ struct drm_i915_query_item {
>  #define DRM_I915_QUERY_ENGINE_INFO	2
>  #define DRM_I915_QUERY_PERF_CONFIG      3
>  #define DRM_I915_QUERY_MEMORY_REGIONS   4
> +#define DRM_I915_QUERY_HWCONFIG_TABLE   5

hmm, not sure is this single line satisfies below "well documented"
requirement ;)

>  /* Must be kept compact -- no holes and well documented */
>  
>  	/**
> 
