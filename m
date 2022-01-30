Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BF24A3AF6
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 00:22:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C0B10F271;
	Sun, 30 Jan 2022 23:22:34 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22B610F271;
 Sun, 30 Jan 2022 23:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643584953; x=1675120953;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ikZnnknd5dZuAVrB3mqmuI3dndHOVk8S3irGpQ7mYFs=;
 b=EIiM3ZAnCJ0/49I1knfwHbnsLhEfNUiUrx82RbSsIHeWH9utSkyB9RC2
 hs8V5Yu8AiRosOKApfdXPPivZZcqSjntBHKgjAtAkVQbPzKks7ULilqEI
 VO3y3Agi3pCnuENZMxvlhXuYBzF2aB0ZeOPCDuFcoQ/IIsGgZns0ndnSn
 TDl44ClH4z126BDWHJKk6BXQ4UjclN6gSyWXLiHEPLGnbb8lazP/2/G6p
 vPzGaJ6ZhDCNlM54PLTaVxGRP/MkFZl9FZT6HN0FrqTqKH1kSs+PIJCUe
 PHdF9bVCnUgthA0ZqSBjqocWZ+szMxiCKGU4C534Rq/pK4V1anSp7E7VC w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="246215629"
X-IronPort-AV: E=Sophos;i="5.88,329,1635231600"; d="scan'208";a="246215629"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2022 15:22:33 -0800
X-IronPort-AV: E=Sophos;i="5.88,329,1635231600"; d="scan'208";a="619231264"
Received: from usengup-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.212.159.185])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2022 15:22:33 -0800
From: Jordan Justen <jordan.l.justen@intel.com>
To: John.C.Harrison@Intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel-GFX@Lists.FreeDesktop.Org
Subject: Re: [Intel-gfx] [PATCH v3 2/2] drm/i915/uapi: Add query for
 hwconfig table
In-Reply-To: <20220119203541.2410082-3-John.C.Harrison@Intel.com>
References: <20220119203541.2410082-1-John.C.Harrison@Intel.com>
 <20220119203541.2410082-3-John.C.Harrison@Intel.com>
Date: Sun, 30 Jan 2022 15:22:32 -0800
Message-ID: <87r18orepz.fsf@jljusten-skl>
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

John, Rodrigo,

It is now clear to me just how dependent i915 is going to be on the
closed source guc software, and that's just a fact of life for our
graphics stack going forward.

In that context, it seems kind of pointless for me to make a big deal
out of this peripheral "query item" commit message. I still think
something as simple and to the point as:

"In this interface i915 is returning a blob of data which it receives
from the guc software. This blob provides some useful data about the
hardware for drivers. The format of this blob will be documented in the
Programmer Reference Manuals when released."

... would be better, but obviously this is really just down in the noise
in terms of concerns about the greater issue. So, feel free (to
continue) to ignore my suggestion.

Sorry for having wasted your time,

-Jordan

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
