Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD286F1472
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 11:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F3610ECA6;
	Fri, 28 Apr 2023 09:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE3410E3B6;
 Fri, 28 Apr 2023 09:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682675185; x=1714211185;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iUth5jhfQwmZML5AySG8xVTQC1dZMSTLC2HwysaFJlw=;
 b=TpctRDTE8mDYqvQJx4gZe9u3Vn7Gu4H9DoS80HthSZDH1WQbCpKPtr19
 3D+fD8TwOQQAxf+DHmUFDNyqL/Epa+ib+cC/uiSSpaANd8tXtpD6FbKM+
 bJA+o+OC6nITkutj3Lp8h9OuzliLLPXYBgQvWkK36SiB8B2fRnikc7yf9
 dPdixw50dTic4bducqa0Cdz9snJbuAPuu6ycAgX/ofOKq9QvAgGcHpxLE
 viTnfz7DyW6UHQ/BL1zytThi4aWsou8yDyJ1xyaC7sL57HaP29mhZD5u3
 xl29hrv1DPMpNJglR3TKthuFBHbJUomKNQnb/PN+EZo7GCJks8hC4Sj2e Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="350612862"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="350612862"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 02:46:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="806337526"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="806337526"
Received: from ksathish-mobl.ger.corp.intel.com (HELO [10.213.194.196])
 ([10.213.194.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 02:46:23 -0700
Message-ID: <bb5b0499-7ede-1e56-486a-6a6539c9ccb7@linux.intel.com>
Date: Fri, 28 Apr 2023 10:46:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH v3 5/5] drm/i915: Allow user to set cache at
 BO creation
Content-Language: en-US
To: fei.yang@intel.com, intel-gfx@lists.freedesktop.org
References: <20230428054737.1765778-1-fei.yang@intel.com>
 <20230428054737.1765778-6-fei.yang@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230428054737.1765778-6-fei.yang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/04/2023 06:47, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> To comply with the design that buffer objects shall have immutable
> cache setting through out their life cycle, {set, get}_caching ioctl's
> are no longer supported from MTL onward. With that change caching
> policy can only be set at object creation time. The current code
> applies a default (platform dependent) cache setting for all objects.
> However this is not optimal for performance tuning. The patch extends
> the existing gem_create uAPI to let user set PAT index for the object
> at creation time.
> The new extension is platform independent, so UMD's can switch to using
> this extension for older platforms as well, while {set, get}_caching are
> still supported on these legacy paltforms for compatibility reason.
> 
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_create.c | 36 ++++++++++++++++++++++
>   drivers/gpu/drm/i915/gem/i915_gem_object.c |  6 ++++
>   include/uapi/drm/i915_drm.h                | 36 ++++++++++++++++++++++
>   tools/include/uapi/drm/i915_drm.h          | 36 ++++++++++++++++++++++
>   4 files changed, 114 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> index bfe1dbda4cb7..723c3ddd6c74 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> @@ -245,6 +245,7 @@ struct create_ext {
>   	unsigned int n_placements;
>   	unsigned int placement_mask;
>   	unsigned long flags;
> +	unsigned int pat_index;
>   };
>   
>   static void repr_placements(char *buf, size_t size,
> @@ -394,11 +395,39 @@ static int ext_set_protected(struct i915_user_extension __user *base, void *data
>   	return 0;
>   }
>   
> +static int ext_set_pat(struct i915_user_extension __user *base, void *data)
> +{
> +	struct create_ext *ext_data = data;
> +	struct drm_i915_private *i915 = ext_data->i915;
> +	struct drm_i915_gem_create_ext_set_pat ext;
> +	unsigned int max_pat_index;
> +
> +	BUILD_BUG_ON(sizeof(struct drm_i915_gem_create_ext_set_pat) !=
> +		     offsetofend(struct drm_i915_gem_create_ext_set_pat, rsvd));
> +
> +	if (copy_from_user(&ext, base, sizeof(ext)))
> +		return -EFAULT;
> +
> +	max_pat_index = INTEL_INFO(i915)->max_pat_index;
> +
> +	if (ext.pat_index > max_pat_index) {
> +		drm_dbg(&i915->drm, "PAT index is invalid: %u\n",
> +			ext.pat_index);
> +		return -EINVAL;
> +	}
> +
> +	ext_data->pat_index = ext.pat_index;
> +
> +	return 0;
> +}
> +
>   static const i915_user_extension_fn create_extensions[] = {
>   	[I915_GEM_CREATE_EXT_MEMORY_REGIONS] = ext_set_placements,
>   	[I915_GEM_CREATE_EXT_PROTECTED_CONTENT] = ext_set_protected,
> +	[I915_GEM_CREATE_EXT_SET_PAT] = ext_set_pat,
>   };
>   
> +#define PAT_INDEX_NOT_SET	0xffff
>   /**
>    * i915_gem_create_ext_ioctl - Creates a new mm object and returns a handle to it.
>    * @dev: drm device pointer
> @@ -418,6 +447,7 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
>   	if (args->flags & ~I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS)
>   		return -EINVAL;
>   
> +	ext_data.pat_index = PAT_INDEX_NOT_SET;
>   	ret = i915_user_extensions(u64_to_user_ptr(args->extensions),
>   				   create_extensions,
>   				   ARRAY_SIZE(create_extensions),
> @@ -454,5 +484,11 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
>   	if (IS_ERR(obj))
>   		return PTR_ERR(obj);
>   
> +	if (ext_data.pat_index != PAT_INDEX_NOT_SET) {
> +		i915_gem_object_set_pat_index(obj, ext_data.pat_index);
> +		/* Mark pat_index is set by UMD */
> +		obj->cache_level = I915_CACHE_INVAL;
> +	}
> +
>   	return i915_gem_publish(obj, file, &args->size, &args->handle);
>   }
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 27c948350b5b..61651f7e5806 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -209,6 +209,12 @@ bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
>   	if (!(obj->flags & I915_BO_ALLOC_USER))
>   		return false;
>   
> +	/*
> +	 * Always flush cache for UMD objects at creation time.
> +	 */
> +	if (obj->cache_level == I915_CACHE_INVAL)
> +		return true;

Can this affect performance? Would you be able to make the check smarter 
if the driver had that translation table we talked about (per platform 
pat index to caching modes)?

> +
>   	/*
>   	 * EHL and JSL add the 'Bypass LLC' MOCS entry, which should make it
>   	 * possible for userspace to bypass the GTT caching bits set by the
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index dba7c5a5b25e..03c5c314846e 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -3630,9 +3630,13 @@ struct drm_i915_gem_create_ext {
>   	 *
>   	 * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
>   	 * struct drm_i915_gem_create_ext_protected_content.
> +	 *
> +	 * For I915_GEM_CREATE_EXT_SET_PAT usage see
> +	 * struct drm_i915_gem_create_ext_set_pat.
>   	 */
>   #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
>   #define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
> +#define I915_GEM_CREATE_EXT_SET_PAT 2
>   	__u64 extensions;
>   };
>   
> @@ -3747,6 +3751,38 @@ struct drm_i915_gem_create_ext_protected_content {
>   	__u32 flags;
>   };
>   
> +/**
> + * struct drm_i915_gem_create_ext_set_pat - The
> + * I915_GEM_CREATE_EXT_SET_PAT extension.
> + *
> + * If this extension is provided, the specified caching policy (PAT index) is
> + * applied to the buffer object.
> + *
> + * Below is an example on how to create an object with specific caching policy:
> + *
> + * .. code-block:: C
> + *
> + *      struct drm_i915_gem_create_ext_set_pat set_pat_ext = {
> + *              .base = { .name = I915_GEM_CREATE_EXT_SET_PAT },
> + *              .pat_index = 0,
> + *      };
> + *      struct drm_i915_gem_create_ext create_ext = {
> + *              .size = PAGE_SIZE,
> + *              .extensions = (uintptr_t)&set_pat_ext,
> + *      };
> + *
> + *      int err = ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
> + *      if (err) ...
> + */
> +struct drm_i915_gem_create_ext_set_pat {
> +	/** @base: Extension link. See struct i915_user_extension. */
> +	struct i915_user_extension base;
> +	/** @pat_index: PAT index to be set */
> +	__u32 pat_index;
> +	/** @rsvd: reserved for future use */
> +	__u32 rsvd;
> +};
> +
>   /* ID of the protected content session managed by i915 when PXP is active */
>   #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>   
> diff --git a/tools/include/uapi/drm/i915_drm.h b/tools/include/uapi/drm/i915_drm.h
> index 8df261c5ab9b..8cdcdb5fac26 100644
> --- a/tools/include/uapi/drm/i915_drm.h
> +++ b/tools/include/uapi/drm/i915_drm.h
> @@ -3607,9 +3607,13 @@ struct drm_i915_gem_create_ext {
>   	 *
>   	 * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
>   	 * struct drm_i915_gem_create_ext_protected_content.
> +	 *
> +	 * For I915_GEM_CREATE_EXT_SET_PAT usage see
> +	 * struct drm_i915_gem_create_ext_set_pat.
>   	 */
>   #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
>   #define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
> +#define I915_GEM_CREATE_EXT_SET_PAT 2
>   	__u64 extensions;
>   };
>   
> @@ -3724,6 +3728,38 @@ struct drm_i915_gem_create_ext_protected_content {
>   	__u32 flags;
>   };
>   
> +/**
> + * struct drm_i915_gem_create_ext_set_pat - The
> + * I915_GEM_CREATE_EXT_SET_PAT extension.
> + *
> + * If this extension is provided, the specified caching policy (PAT index) is
> + * applied to the buffer object.
> + *
> + * Below is an example on how to create an object with specific caching policy:
> + *
> + * .. code-block:: C
> + *
> + *      struct drm_i915_gem_create_ext_set_pat set_pat_ext = {
> + *              .base = { .name = I915_GEM_CREATE_EXT_SET_PAT },
> + *              .pat_index = 0,
> + *      };
> + *      struct drm_i915_gem_create_ext create_ext = {
> + *              .size = PAGE_SIZE,
> + *              .extensions = (uintptr_t)&set_pat_ext,
> + *      };
> + *
> + *      int err = ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
> + *      if (err) ...
> + */

Somewhere around here we need to point readers into where they can find 
further information about what PAT indexes are. Where to find per 
platform definitions and that.

Regards,

Tvrtko

> +struct drm_i915_gem_create_ext_set_pat {
> +	/** @base: Extension link. See struct i915_user_extension. */
> +	struct i915_user_extension base;
> +	/** @pat_index: PAT index to be set */
> +	__u32 pat_index;
> +	/** @rsvd: reserved for future use */
> +	__u32 rsvd;
> +};
> +
>   /* ID of the protected content session managed by i915 when PXP is active */
>   #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>   
