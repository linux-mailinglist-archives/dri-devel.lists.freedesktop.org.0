Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BED405B3C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 18:48:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206306E8C4;
	Thu,  9 Sep 2021 16:48:19 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7F16E8C2;
 Thu,  9 Sep 2021 16:48:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="217682221"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="217682221"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 09:48:16 -0700
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="548653426"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 09:48:15 -0700
Date: Thu, 9 Sep 2021 09:43:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John.C.Harrison@Intel.com
Cc: Intel-GFX@Lists.FreeDesktop.Org, DRI-Devel@Lists.FreeDesktop.Org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Kenneth Graunke <kenneth.w.graunke@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Slawomir Milczarek <slawomir.milczarek@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/uapi: Add query for hwconfig table
Message-ID: <20210909164313.GA30405@jons-linux-dev-box>
References: <20210903005333.3627255-1-John.C.Harrison@Intel.com>
 <20210903005333.3627255-3-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903005333.3627255-3-John.C.Harrison@Intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 02, 2021 at 05:53:33PM -0700, John.C.Harrison@Intel.com wrote:
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
> The attribute ids are defined in a hardware spec.
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
> index 5e2b909827f4..96989a37453c 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -477,12 +477,35 @@ static int query_memregion_info(struct drm_i915_private *i915,
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
> index bde5860b3686..a1281f35b190 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -2499,6 +2499,7 @@ struct drm_i915_query_item {
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
