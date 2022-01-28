Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 836D149EFED
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 01:48:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48EA10E28D;
	Fri, 28 Jan 2022 00:48:50 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F222A10E19D;
 Fri, 28 Jan 2022 00:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643330929; x=1674866929;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=qmJpIEyB7ATUghrUZYO2NRm/18pZlf6KHe7K9+/bpas=;
 b=bviR7eS6p3pj6D8+R+55lKxsEMRSHGcf00cdbWW1ruOhCnVtI4R5NwsR
 fJfW0N+OM4JYBbB4BVduqHpUcetJLq+i4nNtBLNTP9QLaJremTcvr0bHb
 05TkbpQLcXAAflQwf/Jo76E25PcbAFa6eFVvzA6BKpwkuHjpbZrfpBD1x
 9GOksBtc3bkh/qBz6EsLKcHDP9rfcU4Fq8EN3RnwA64QPrq6FeVFyntVW
 0ppuI1XAQei1Avz4Gbi3NrZVVp4KNkeq2p5FcsWkimjOo8GuL55h4fxFT
 kaA9yxKKGoTOM5mUhEALX+YnoGdXGxgWR6g/HymGgZ/BqRULuh9X7WO5U g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="234382893"
X-IronPort-AV: E=Sophos;i="5.88,322,1635231600"; d="scan'208";a="234382893"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 16:48:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,322,1635231600"; d="scan'208";a="521469792"
Received: from sswallic-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.251.15.132])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 16:48:47 -0800
From: Jordan Justen <jordan.l.justen@intel.com>
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
Subject: Re: [Intel-gfx] [PATCH v3 2/2] drm/i915/uapi: Add query for
 hwconfig table
In-Reply-To: <20220119203541.2410082-3-John.C.Harrison@Intel.com>
References: <20220119203541.2410082-1-John.C.Harrison@Intel.com>
 <20220119203541.2410082-3-John.C.Harrison@Intel.com>
Date: Thu, 27 Jan 2022 16:48:47 -0800
Message-ID: <87k0eksn0w.fsf@jljusten-skl>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Kenneth Graunke <kenneth.w.graunke@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org,
 Slawomir Milczarek <slawomir.milczarek@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

John.C.Harrison@Intel.com writes:

> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
> GuC contains a consolidated table with a bunch of information about the
> current device.
>
> Previously, this information was spread and hardcoded to all the components
> including GuC, i915 and various UMDs. The goal here is to consolidate
> the data into GuC in a way that all interested components can grab the
> very latest and synchronized information using a simple query.

This "consolidate" goal is not what I was told for the purpose of this.
I don't think these paragraphs are the true.

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

You said on 03 Nov 2021 that you would remove the parts of this commit
message that document the format. Why? Because i915 will not make any
guarantees as to the format of what is returned. Thus, i915 should not
comment on the format.

Can you Cc me on future postings of this patch?

> The attribute ids are defined in a hardware spec.

As this spec is not published, it's hard to verify or refute this claim.

Think this is a more accurate commit message for this patch:

    In this interface i915 is returning a currently undocumented blob of
    data which it receives from the closed source guc software. The
    format of this blob *might* be defined in a hardware spec in the
    future.

I'm sure you will prefer to replace "might" with "is planned to". I
think "might" is more accurate, but I suppose the other would be
acceptable.

-Jordan

>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Kenneth Graunke <kenneth.w.graunke@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Slawomir Milczarek <slawomir.milczarek@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_query.c | 23 +++++++++++++++++++++++
>  include/uapi/drm/i915_drm.h       |  1 +
>  2 files changed, 24 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> index 2dfbc22857a3..609e64d5f395 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -479,12 +479,35 @@ static int query_memregion_info(struct drm_i915_private *i915,
>  	return total_length;
>  }
>  
> +static int query_hwconfig_table(struct drm_i915_private *i915,
> +				struct drm_i915_query_item *query_item)
> +{
> +	struct intel_gt *gt = to_gt(i915);
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
> index 914ebd9290e5..132515199f27 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -2685,6 +2685,7 @@ struct drm_i915_query_item {
>  #define DRM_I915_QUERY_ENGINE_INFO	2
>  #define DRM_I915_QUERY_PERF_CONFIG      3
>  #define DRM_I915_QUERY_MEMORY_REGIONS   4
> +#define DRM_I915_QUERY_HWCONFIG_TABLE   5
>  /* Must be kept compact -- no holes and well documented */
>  
>  	/**
> -- 
> 2.25.1
