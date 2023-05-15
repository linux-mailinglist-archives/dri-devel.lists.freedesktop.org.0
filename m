Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2165F702AC2
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 12:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60E810E1A3;
	Mon, 15 May 2023 10:40:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C177710E1A3;
 Mon, 15 May 2023 10:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684147257; x=1715683257;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qrexqX8W6FNKxOeGqzkpkS3w7lDiG4NkltWGJLGNnDE=;
 b=hdpjtjHvrx9ieCNJN7YK6NVnoLsHRFMbPzjYcbepF73FnTo9hmrWQyNF
 Kkn7grP0KS1NHDF2cMMB52nSWEK5hATXosjWX+MAzC4K3B6o0ZAynJYCk
 P51M9hPgkzwSOOjhJEF64/2R0P9rni7jEHl9saAeDaRBoyLckMeXfhM1/
 73/WbDmZdRZAG+W5YrVtkkUbhayT0Or12Ml3+bUfeva9Ko8tI9hish+z/
 xOUzGKDGnpO2WNCqsGCnqQUstsImoJtTRKRVaxSo1NLOZL2zV7FULYqq8
 qQcDeECVkz5AkSyl2Pjtm7i9tLxEBPgPchEtLcF2mHpoZjalH+Z2ziOFM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="416815714"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="416815714"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 03:40:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="947368206"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="947368206"
Received: from zolayode-mobl.ger.corp.intel.com (HELO [10.213.214.133])
 ([10.213.214.133])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 03:40:55 -0700
Message-ID: <61ea047c-59f3-cba6-6459-1d9ea97b140a@linux.intel.com>
Date: Mon, 15 May 2023 11:40:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH v8 2/2] drm/i915: Allow user to set cache at
 BO creation
Content-Language: en-US
To: fei.yang@intel.com, intel-gfx@lists.freedesktop.org
References: <20230512232825.1253644-1-fei.yang@intel.com>
 <20230512232825.1253644-3-fei.yang@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230512232825.1253644-3-fei.yang@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 13/05/2023 00:28, fei.yang@intel.com wrote:
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
> IGT posted at https://patchwork.freedesktop.org/series/117695/
> 
> Tested with https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22878
> 
> Tested-by: Jordan Justen <jordan.l.justen@intel.com>
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
> index bfe1dbda4cb7..644a936248ad 100644
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
> +		obj->pat_set_by_user = true;
> +	}
> +
>   	return i915_gem_publish(obj, file, &args->size, &args->handle);
>   }
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 46a19b099ec8..97ac6fb37958 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -208,6 +208,12 @@ bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
>   	if (!(obj->flags & I915_BO_ALLOC_USER))
>   		return false;
>   
> +	/*
> +	 * Always flush cache for UMD objects at creation time.
> +	 */
> +	if (obj->pat_set_by_user)
> +		return true;
> +
>   	/*
>   	 * EHL and JSL add the 'Bypass LLC' MOCS entry, which should make it
>   	 * possible for userspace to bypass the GTT caching bits set by the
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index ba40855dbc93..7f5597920257 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -3664,9 +3664,13 @@ struct drm_i915_gem_create_ext {
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
> @@ -3781,6 +3785,38 @@ struct drm_i915_gem_create_ext_protected_content {
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
> +struct drm_i915_gem_create_ext_set_pat {
> +	/** @base: Extension link. See struct i915_user_extension. */
> +	struct i915_user_extension base;
> +	/** @pat_index: PAT index to be set */
> +	__u32 pat_index;

Can we have at least some words on what PAT is and where to find further 
information please?

Regards,

Tvrtko

> +	/** @rsvd: reserved for future use */
> +	__u32 rsvd;
> +};
> +
>   /* ID of the protected content session managed by i915 when PXP is active */
>   #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>   
