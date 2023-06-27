Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E2C73FCDD
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 15:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5271810E1AB;
	Tue, 27 Jun 2023 13:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E82D10E1AB;
 Tue, 27 Jun 2023 13:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687872517; x=1719408517;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=QK8PWGYt9WGmo1Aafp1UFV+dZsQ8BVCohQwokMITKTU=;
 b=PmcSjeX67ch4S+3kcy71D8WPbJNKsD5zIaV08hVCIL62R8EcyQuOtHBi
 pZujYcUmSFtzgqjKcRaG5hfH9P0LCXtq2XzphHhhOXGJ69J9RheA0ioVL
 bGDN5SVSJCn6F8kaorl3h761RM7QDuFMkMKiUB7zsuuo8YoocguKn9NBC
 UQH5b+3TWuKSMDqHfpfWErZ7zs+1eaLJxmvgn9WWbG8YhrR26b3lhLgX4
 iw0oeraZ/cl3t/a13giTEAUYClCtWTpbp3kIX+rw1KySVoxnsayQb+jjL
 elc7XpxrtkZS7TL7xzPAsKCdmTNxa1ef0QibwZJFYcsbsbfi8vOARy+Bg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="361607690"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="361607690"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 06:28:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="719768311"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="719768311"
Received: from jwerner6-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.48])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 06:28:32 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: fei.yang@intel.com, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v8 1/2] drm/i915: preparation for using PAT index
In-Reply-To: <20230509165200.1740-2-fei.yang@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230509165200.1740-1-fei.yang@intel.com>
 <20230509165200.1740-2-fei.yang@intel.com>
Date: Tue, 27 Jun 2023 16:28:16 +0300
Message-ID: <874jmtt4pb.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Fei Yang <fei.yang@intel.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 09 May 2023, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
>
> This patch is a preparation for replacing enum i915_cache_level with PAT
> index. Caching policy for buffer objects is set through the PAT index in
> PTE, the old i915_cache_level is not sufficient to represent all caching
> modes supported by the hardware.
>
> Preparing the transition by adding some platform dependent data structures
> and helper functions to translate the cache_level to pat_index.
>
> cachelevel_to_pat: a platform dependent array mapping cache_level to
>                    pat_index.
>
> max_pat_index: the maximum PAT index recommended in hardware specification
>                Needed for validating the PAT index passed in from user
>                space.
>
> i915_gem_get_pat_index: function to convert cache_level to PAT index.
>
> obj_to_i915(obj): macro moved to header file for wider usage.
>
> I915_MAX_CACHE_LEVEL: upper bound of i915_cache_level for the
>                       convenience of coding.
>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

[snip]

> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> index f6a7c0bd2955..0eda8b4ee17f 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -123,7 +123,9 @@ struct drm_i915_private *mock_gem_device(void)
>  	static struct dev_iommu fake_iommu = { .priv = (void *)-1 };
>  #endif
>  	struct drm_i915_private *i915;
> +	struct intel_device_info *i915_info;
>  	struct pci_dev *pdev;
> +	unsigned int i;
>  	int ret;
>  
>  	pdev = kzalloc(sizeof(*pdev), GFP_KERNEL);
> @@ -180,6 +182,13 @@ struct drm_i915_private *mock_gem_device(void)
>  		I915_GTT_PAGE_SIZE_2M;
>  
>  	RUNTIME_INFO(i915)->memory_regions = REGION_SMEM;
> +
> +	/* simply use legacy cache level for mock device */
> +	i915_info = (struct intel_device_info *)INTEL_INFO(i915);

This is not okay. It's not okay to modify device info at runtime. This
is why we've separated runtime info from device info. This is why we've
made device info const, and localized the modifications to a couple of
places.

If you need to modify it, it belongs in runtime info. Even if it's only
ever modified for mock devices.

We were at the brink of being able to finally convert INTEL_INFO() into
a pointer to const rodata [1], where you are unable to modify it, but
this having been merged as commit 5e352e32aec2 ("drm/i915: preparation
for using PAT index") sets us back. (With [1] this oopses trying to
modify read-only data.)

This has been posted to the public list 20+ times, and nobody noticed or
pointed this out?!

Throwing away const should be a huge red flag to any developer or
reviewer. Hell, *any* cast should be.

I've got a patch ready moving cachelevel_to_pat and max_pat_index to
runtime info. It's not great, since we'd be doing it only for the mock
device. Better ideas? I'm not waiting long.


BR,
Jani.


[1] https://patchwork.freedesktop.org/patch/msgid/0badc36ce6dd6b030507bdfd8a42ab984fb38d12.1686236840.git.jani.nikula@intel.com


> +	i915_info->max_pat_index = 3;
> +	for (i = 0; i < I915_MAX_CACHE_LEVEL; i++)
> +		i915_info->cachelevel_to_pat[i] = i;
> +
>  	intel_memory_regions_hw_probe(i915);
>  
>  	spin_lock_init(&i915->gpu_error.lock);

-- 
Jani Nikula, Intel Open Source Graphics Center
