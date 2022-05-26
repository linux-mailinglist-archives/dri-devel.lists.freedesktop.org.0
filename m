Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41539534B08
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 09:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75E410F3FD;
	Thu, 26 May 2022 07:58:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE9E10F3E3;
 Thu, 26 May 2022 07:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653551894; x=1685087894;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qufzwhdmgBIg3C3sfQ4EafUh9jtTj6htrChMUfoNUBo=;
 b=SRAqOWjmNqtk21Bu0U9S7RlJdU0AFTepHLjg6QT/jayxXIAxIK5OMWVn
 rtphlOAtIsiq2Hswz1ykoAfJ9vi9kqnLH7jiO4ZuNCQyf49I1yhzIunSI
 hIpVT8YtpRBO8q75ig+M7gRbrrB+5uX00edxm/j2Z6CgJajpG5WKGr4lt
 P6Ny3bXwsaOOVp5Ns+uB+EKMyV7YUOqIKIgYNjQEIn7GDHYZCobRZ7vda
 49bzA0GbpErTIGvylvr4b54fh2pn5VxsPKZ/7FYR7NYCnv46k0a3DvkeO
 TZGsS+4pG55w18GPysIbuz59yB6MjrfpCvNdqLZjUZd1tJmciWqV8E1jk w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="271647578"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="271647578"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2022 00:58:09 -0700
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="664822060"
Received: from tkinch-mobl.ger.corp.intel.com (HELO [10.213.214.182])
 ([10.213.214.182])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2022 00:58:07 -0700
Message-ID: <db5b82b1-4eb0-0d26-eaa8-b814b0de4dc0@linux.intel.com>
Date: Thu, 26 May 2022 08:58:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 03/10] drm/i915/uapi: expose the avail tracking
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220525184337.491763-1-matthew.auld@intel.com>
 <20220525184337.491763-4-matthew.auld@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220525184337.491763-4-matthew.auld@intel.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 25/05/2022 19:43, Matthew Auld wrote:
> Vulkan would like to have a rough measure of how much device memory can
> in theory be allocated. Also add unallocated_cpu_visible_size to track
> the visible portion, in case the device is using small BAR.

I have concerns here that it isn't useful and could even be 
counter-productive. If we give unprivileged access it may be considered 
a side channel, but if we "lie" (report total region size) to 
unprivileged clients (like in this patch), then they don't co-operate 
well and end trashing.

Is Vulkan really sure it wants this and why?

Regards,

Tvrtko

> Testcase: igt@i915_query@query-regions-unallocated
> Testcase: igt@i915_query@query-regions-sanity-check
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_query.c             | 10 +++++-
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 20 ++++++++++++
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |  3 ++
>   drivers/gpu/drm/i915/intel_memory_region.c    | 14 +++++++++
>   drivers/gpu/drm/i915/intel_memory_region.h    |  3 ++
>   include/uapi/drm/i915_drm.h                   | 31 ++++++++++++++++++-
>   6 files changed, 79 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> index 9aa0b28aa6ee..e095c55f4d4b 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -502,7 +502,15 @@ static int query_memregion_info(struct drm_i915_private *i915,
>   		else
>   			info.probed_cpu_visible_size = mr->total;
>   
> -		info.unallocated_size = mr->avail;
> +		if (perfmon_capable()) {
> +			intel_memory_region_avail(mr,
> +						  &info.unallocated_size,
> +						  &info.unallocated_cpu_visible_size);
> +		} else {
> +			info.unallocated_size = info.probed_size;
> +			info.unallocated_cpu_visible_size =
> +				info.probed_cpu_visible_size;
> +		}
>   
>   		if (__copy_to_user(info_ptr, &info, sizeof(info)))
>   			return -EFAULT;
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index a5109548abc0..aa5c91e44438 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -365,6 +365,26 @@ u64 i915_ttm_buddy_man_visible_size(struct ttm_resource_manager *man)
>   	return bman->visible_size;
>   }
>   
> +/**
> + * i915_ttm_buddy_man_visible_size - Query the avail tracking for the manager.
> + *
> + * @man: The buddy allocator ttm manager
> + * @avail: The total available memory in pages for the entire manager.
> + * @visible_avail: The total available memory in pages for the CPU visible
> + * portion. Note that this will always give the same value as @avail on
> + * configurations that don't have a small BAR.
> + */
> +void i915_ttm_buddy_man_avail(struct ttm_resource_manager *man,
> +			     u64 *avail, u64 *visible_avail)
> +{
> +	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
> +
> +	mutex_lock(&bman->lock);
> +	*avail = bman->mm.avail >> PAGE_SHIFT;
> +	*visible_avail = bman->visible_avail;
> +	mutex_unlock(&bman->lock);
> +}
> +
>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>   void i915_ttm_buddy_man_force_visible_size(struct ttm_resource_manager *man,
>   					   u64 size)
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> index 52d9586d242c..d64620712830 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> @@ -61,6 +61,9 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
>   
>   u64 i915_ttm_buddy_man_visible_size(struct ttm_resource_manager *man);
>   
> +void i915_ttm_buddy_man_avail(struct ttm_resource_manager *man,
> +			      u64 *avail, u64 *avail_visible);
> +
>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>   void i915_ttm_buddy_man_force_visible_size(struct ttm_resource_manager *man,
>   					   u64 size);
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
> index e38d2db1c3e3..94ee26e99549 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.c
> +++ b/drivers/gpu/drm/i915/intel_memory_region.c
> @@ -279,6 +279,20 @@ void intel_memory_region_set_name(struct intel_memory_region *mem,
>   	va_end(ap);
>   }
>   
> +void intel_memory_region_avail(struct intel_memory_region *mr,
> +			       u64 *avail, u64 *visible_avail)
> +{
> +	if (mr->type == INTEL_MEMORY_LOCAL) {
> +		i915_ttm_buddy_man_avail(mr->region_private,
> +					 avail, visible_avail);
> +		*avail <<= PAGE_SHIFT;
> +		*visible_avail <<= PAGE_SHIFT;
> +	} else {
> +		*avail = mr->total;
> +		*visible_avail = mr->total;
> +	}
> +}
> +
>   void intel_memory_region_destroy(struct intel_memory_region *mem)
>   {
>   	int ret = 0;
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
> index 3d8378c1b447..2214f251bec3 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.h
> +++ b/drivers/gpu/drm/i915/intel_memory_region.h
> @@ -127,6 +127,9 @@ int intel_memory_region_reserve(struct intel_memory_region *mem,
>   void intel_memory_region_debug(struct intel_memory_region *mr,
>   			       struct drm_printer *printer);
>   
> +void intel_memory_region_avail(struct intel_memory_region *mr,
> +			       u64 *avail, u64 *visible_avail);
> +
>   struct intel_memory_region *
>   i915_gem_ttm_system_setup(struct drm_i915_private *i915,
>   			  u16 type, u16 instance);
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 9df419a45244..e30f31a440b3 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -3228,7 +3228,15 @@ struct drm_i915_memory_region_info {
>   	 */
>   	__u64 probed_size;
>   
> -	/** @unallocated_size: Estimate of memory remaining (-1 = unknown) */
> +	/**
> +	 * @unallocated_size: Estimate of memory remaining (-1 = unknown)
> +	 *
> +	 * Requires CAP_PERFMON or CAP_SYS_ADMIN to get reliable accounting.
> +	 * Without this (or if this is an older kernel) the value here will
> +	 * always equal the @probed_size. Note this is only currently tracked
> +	 * for I915_MEMORY_CLASS_DEVICE regions (for other types the value here
> +	 * will always equal the @probed_size).
> +	 */
>   	__u64 unallocated_size;
>   
>   	union {
> @@ -3262,6 +3270,27 @@ struct drm_i915_memory_region_info {
>   			 * @probed_size.
>   			 */
>   			__u64 probed_cpu_visible_size;
> +
> +			/**
> +			 * @unallocated_cpu_visible_size: Estimate of CPU
> +			 * visible memory remaining (-1 = unknown).
> +			 *
> +			 * Note this is only tracked for
> +			 * I915_MEMORY_CLASS_DEVICE regions (for other types the
> +			 * value here will always equal the
> +			 * @probed_cpu_visible_size).
> +			 *
> +			 * Requires CAP_PERFMON or CAP_SYS_ADMIN to get reliable
> +			 * accounting.  Without this the value here will always
> +			 * equal the @probed_cpu_visible_size. Note this is only
> +			 * currently tracked for I915_MEMORY_CLASS_DEVICE
> +			 * regions (for other types the value here will also
> +			 * always equal the @probed_cpu_visible_size).
> +			 *
> +			 * If this is an older kernel the value here will be
> +			 * zero, see also @probed_cpu_visible_size.
> +			 */
> +			__u64 unallocated_cpu_visible_size;
>   		};
>   	};
>   };
