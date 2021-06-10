Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2942D3A36CB
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 00:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5286EE04;
	Thu, 10 Jun 2021 22:02:02 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC0E6EDFF;
 Thu, 10 Jun 2021 22:02:00 +0000 (UTC)
IronPort-SDR: u8LORqRhZaPVXLqdBEly5IE75+OQLkFiWJyMKZZvqkqxQDscRu7GWSeGCDiD+0fyfnWF4ef0s3
 RjotkvTuiBjQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="185786359"
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="185786359"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 15:01:59 -0700
IronPort-SDR: f0asxrxG4c0nPAbNko8HnlkNd4NfZGOeq7H3k2gvzqqk6e7uHffVTILYUUwz8ksK4iAwEl3YVl
 97dPNKOUrcuA==
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="419872673"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 15:01:59 -0700
Date: Thu, 10 Jun 2021 14:55:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John.C.Harrison@Intel.com
Subject: Re: [PATCH 2/3] drm/i915/uapi: Add query for hwconfig table
Message-ID: <20210610215504.GA7616@sdutt-i7>
References: <20210610204626.2995262-1-John.C.Harrison@Intel.com>
 <20210610204626.2995262-3-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610204626.2995262-3-John.C.Harrison@Intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Kenneth Graunke <kenneth.w.graunke@intel.com>, Intel-GFX@Lists.FreeDesktop.Org,
 DRI-Devel@Lists.FreeDesktop.Org,
 Slawomir Milczarek <slawomir.milczarek@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 01:46:25PM -0700, John.C.Harrison@Intel.com wrote:
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
> 
> The attribute ids are defined in a hardware spec. The current list as
> known to the i915 driver can be found in i915/gt/intel_guc_hwconfig_types.h
> 
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Kenneth Graunke <kenneth.w.graunke@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Slawomir Milczarek <slawomir.milczarek@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

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
>  /* Must be kept compact -- no holes and well documented */
>  
>  	/**
> -- 
> 2.25.1
> 
