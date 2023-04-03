Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2BA6D4D00
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 18:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA27410E51A;
	Mon,  3 Apr 2023 16:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54AA510E174;
 Mon,  3 Apr 2023 16:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680537735; x=1712073735;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nWDhf0S4Xzpo2vO6W4ZXxft2M0ADzG9/xLOkisQKStw=;
 b=RPgwdaLhxjR28mfd4mV9P+DJC7O8Eitsw7A0YcEm9qPn2maI/QcZKUDt
 CGp3RpXlSEANSQu2oo4Pw26SJvtzyDZND+FFJ1sxgCQbvYzDAjb05h4qS
 7vau/KiGVJEf91X8QqraKRsZXRZcoKZpNA2kWpYrA99abqhGAwD16VjVQ
 CPLBPr5TQCALqsTFKEoyvNIBcCEyF0FB03CiWHeutA1glTyzxHqq5c/5P
 E5n9/BnGx8bbwYiEJVQItHhd/qFigHXB8Evrjdh5gAfcLlvBXmsKw1ev6
 s7YS70P9q8d07b6KymrE2pSaK/yYvEtsBEKWAQ55ZvsDoMlhH5LjQO/5b g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="340669422"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="340669422"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 09:02:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="829618180"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="829618180"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga001.fm.intel.com with SMTP; 03 Apr 2023 09:02:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 03 Apr 2023 19:02:08 +0300
Date: Mon, 3 Apr 2023 19:02:08 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: fei.yang@intel.com
Subject: Re: [PATCH 7/7] drm/i915: Allow user to set cache at BO creation
Message-ID: <ZCr4gB8Q75+QWr19@intel.com>
References: <20230401063830.438127-1-fei.yang@intel.com>
 <20230401063830.438127-8-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230401063830.438127-8-fei.yang@intel.com>
X-Patchwork-Hint: comment
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
 intel-gfx@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 11:38:30PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> To comply with the design that buffer objects shall have immutable
> cache setting through out its life cycle, {set, get}_caching ioctl's
> are no longer supported from MTL onward. With that change caching
> policy can only be set at object creation time. The current code
> applies a default (platform dependent) cache setting for all objects.
> However this is not optimal for performance tuning. The patch extends
> the existing gem_create uAPI to let user set PAT index for the object
> at creation time.

This is missing the whole justification for the new uapi.
Why is MOCS not sufficient?

> The new extension is platform independent, so UMD's can switch to using
> this extension for older platforms as well, while {set, get}_caching are
> still supported on these legacy paltforms for compatibility reason.
> 
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_create.c | 33 ++++++++++++++++++++
>  include/uapi/drm/i915_drm.h                | 36 ++++++++++++++++++++++
>  tools/include/uapi/drm/i915_drm.h          | 36 ++++++++++++++++++++++
>  3 files changed, 105 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> index e76c9703680e..1c6e2034d28e 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> @@ -244,6 +244,7 @@ struct create_ext {
>  	unsigned int n_placements;
>  	unsigned int placement_mask;
>  	unsigned long flags;
> +	unsigned int pat_index;
>  };
>  
>  static void repr_placements(char *buf, size_t size,
> @@ -393,11 +394,39 @@ static int ext_set_protected(struct i915_user_extension __user *base, void *data
>  	return 0;
>  }
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
>  static const i915_user_extension_fn create_extensions[] = {
>  	[I915_GEM_CREATE_EXT_MEMORY_REGIONS] = ext_set_placements,
>  	[I915_GEM_CREATE_EXT_PROTECTED_CONTENT] = ext_set_protected,
> +	[I915_GEM_CREATE_EXT_SET_PAT] = ext_set_pat,
>  };
>  
> +#define PAT_INDEX_NOT_SET	0xffff
>  /**
>   * Creates a new mm object and returns a handle to it.
>   * @dev: drm device pointer
> @@ -417,6 +446,7 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
>  	if (args->flags & ~I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS)
>  		return -EINVAL;
>  
> +	ext_data.pat_index = PAT_INDEX_NOT_SET;
>  	ret = i915_user_extensions(u64_to_user_ptr(args->extensions),
>  				   create_extensions,
>  				   ARRAY_SIZE(create_extensions),
> @@ -453,5 +483,8 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
>  	if (IS_ERR(obj))
>  		return PTR_ERR(obj);
>  
> +	if (ext_data.pat_index != PAT_INDEX_NOT_SET)
> +		i915_gem_object_set_pat_index(obj, ext_data.pat_index);
> +
>  	return i915_gem_publish(obj, file, &args->size, &args->handle);
>  }
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index dba7c5a5b25e..03c5c314846e 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -3630,9 +3630,13 @@ struct drm_i915_gem_create_ext {
>  	 *
>  	 * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
>  	 * struct drm_i915_gem_create_ext_protected_content.
> +	 *
> +	 * For I915_GEM_CREATE_EXT_SET_PAT usage see
> +	 * struct drm_i915_gem_create_ext_set_pat.
>  	 */
>  #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
>  #define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
> +#define I915_GEM_CREATE_EXT_SET_PAT 2
>  	__u64 extensions;
>  };
>  
> @@ -3747,6 +3751,38 @@ struct drm_i915_gem_create_ext_protected_content {
>  	__u32 flags;
>  };
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
>  /* ID of the protected content session managed by i915 when PXP is active */
>  #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>  
> diff --git a/tools/include/uapi/drm/i915_drm.h b/tools/include/uapi/drm/i915_drm.h
> index 8df261c5ab9b..8cdcdb5fac26 100644
> --- a/tools/include/uapi/drm/i915_drm.h
> +++ b/tools/include/uapi/drm/i915_drm.h
> @@ -3607,9 +3607,13 @@ struct drm_i915_gem_create_ext {
>  	 *
>  	 * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
>  	 * struct drm_i915_gem_create_ext_protected_content.
> +	 *
> +	 * For I915_GEM_CREATE_EXT_SET_PAT usage see
> +	 * struct drm_i915_gem_create_ext_set_pat.
>  	 */
>  #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
>  #define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
> +#define I915_GEM_CREATE_EXT_SET_PAT 2
>  	__u64 extensions;
>  };
>  
> @@ -3724,6 +3728,38 @@ struct drm_i915_gem_create_ext_protected_content {
>  	__u32 flags;
>  };
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
>  /* ID of the protected content session managed by i915 when PXP is active */
>  #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>  
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
