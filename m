Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D970C72639D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 17:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5651E10E057;
	Wed,  7 Jun 2023 15:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9095810E057;
 Wed,  7 Jun 2023 15:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686150182; x=1717686182;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=My+cGPAksEEHWSj+RxgsXa8bbpOW2K9jeZ8G9V2ML28=;
 b=DrCRRQHf2Kb6b2J9cGsnyVDzqOsgkBawS6Ne9G9c7CLrTRJTV2qYC5bL
 KGGN5YUUMuv1UWH+aYBr+EP2pRHJXVDkAgFFt8MvPTzn6WFOw3MMiG3Th
 AFcBJrsbiJCZD8Mnt0QXSGytfxwq2+CngJ8AIhpErPpX/UsvBpZfizr+G
 KsQGhnD1rGomuk4NQyL02v/nPrHYLGbs9VHepLrLZ/IMW1yNoWqyOWQZc
 +iD4Ckrl6k/9w2cBWTZJ20p8fCgA4jgGvPd3P83ZKsczsK0MMYyJFXZeA
 NeAhfTlER8vLLLV/qbKMZQTdjyJSqepZsFiIy+cVJeZCyJ7qOW2v39IUN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="346624552"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="346624552"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 08:01:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="687031670"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="687031670"
Received: from jjrevuel-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.249.42.202])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 08:01:24 -0700
Date: Wed, 7 Jun 2023 17:01:18 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v17 1/1] drm/i915: Allow user to set cache at BO creation
Message-ID: <ZICbvibRL0ctON9f@ashyti-mobl2.lan>
References: <20230606100042.482345-1-andi.shyti@linux.intel.com>
 <20230606100042.482345-2-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606100042.482345-2-andi.shyti@linux.intel.com>
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
 Lihao Gu <lihao.gu@intel.com>,
 Slawomir Milczarek <slawomir.milczarek@intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Fei Yang <fei.yang@intel.com>,
 Carl Zhang <carl.zhang@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 06, 2023 at 12:00:42PM +0200, Andi Shyti wrote:
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
> However, since PAT index was not clearly defined for platforms prior to
> GEN12 (TGL), so we are limiting this externsion to GEN12+ platforms
> only. See ext_set_pat() in for the implementation details.
> 
> Note: The documentation related to the PAT/MOCS tables is currently
> available for Tiger Lake here:
> https://www.intel.com/content/www/us/en/docs/graphics-for-linux/developer-reference/1-0/tiger-lake.html
> 
> BSpec: 45101
> 
> Mesa support has been submitted in this merge request:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22878
> 
> The media driver is supported by the following commits:
> https://github.com/intel/media-driver/commit/92c00a857433ebb34ec575e9834f473c6fcb6341
> https://github.com/intel/media-driver/commit/fd375cf2c5e1f6bf6b43258ff797b3134aadc9fd
> https://github.com/intel/media-driver/commit/08dd244b22484770a33464c2c8ae85430e548000
> 
> The IGT test related to this change is
> igt@gem_create@create-ext-set-pat
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Acked-by: Jordan Justen <jordan.l.justen@intel.com>
> Tested-by: Jordan Justen <jordan.l.justen@intel.com>
> Acked-by: Carl Zhang <carl.zhang@intel.com>
> Tested-by: Lihao Gu <lihao.gu@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

I'm also adding:

Acked-by: Slawomir Milczarek <slawomir.milczarek@intel.com>

from the Compute UMD team.

Thanks, Slawek!
Andi

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_create.c | 40 +++++++++++++++++++++
>  drivers/gpu/drm/i915/gem/i915_gem_object.c |  6 ++++
>  include/uapi/drm/i915_drm.h                | 41 ++++++++++++++++++++++
>  3 files changed, 87 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> index bfe1dbda4cb75..d24c0ce8805c7 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> @@ -245,6 +245,7 @@ struct create_ext {
>  	unsigned int n_placements;
>  	unsigned int placement_mask;
>  	unsigned long flags;
> +	unsigned int pat_index;
>  };
>  
>  static void repr_placements(char *buf, size_t size,
> @@ -394,11 +395,43 @@ static int ext_set_protected(struct i915_user_extension __user *base, void *data
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
> +	/* Limiting the extension only to Meteor Lake */
> +	if (!IS_METEORLAKE(i915))
> +		return -ENODEV;
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
>   * i915_gem_create_ext_ioctl - Creates a new mm object and returns a handle to it.
>   * @dev: drm device pointer
> @@ -418,6 +451,7 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
>  	if (args->flags & ~I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS)
>  		return -EINVAL;
>  
> +	ext_data.pat_index = PAT_INDEX_NOT_SET;
>  	ret = i915_user_extensions(u64_to_user_ptr(args->extensions),
>  				   create_extensions,
>  				   ARRAY_SIZE(create_extensions),
> @@ -454,5 +488,11 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
>  	if (IS_ERR(obj))
>  		return PTR_ERR(obj);
>  
> +	if (ext_data.pat_index != PAT_INDEX_NOT_SET) {
> +		i915_gem_object_set_pat_index(obj, ext_data.pat_index);
> +		/* Mark pat_index is set by UMD */
> +		obj->pat_set_by_user = true;
> +	}
> +
>  	return i915_gem_publish(obj, file, &args->size, &args->handle);
>  }
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 46a19b099ec88..97ac6fb37958f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -208,6 +208,12 @@ bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
>  	if (!(obj->flags & I915_BO_ALLOC_USER))
>  		return false;
>  
> +	/*
> +	 * Always flush cache for UMD objects at creation time.
> +	 */
> +	if (obj->pat_set_by_user)
> +		return true;
> +
>  	/*
>  	 * EHL and JSL add the 'Bypass LLC' MOCS entry, which should make it
>  	 * possible for userspace to bypass the GTT caching bits set by the
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index a1848e8060590..7000e5910a1d7 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -3680,9 +3680,13 @@ struct drm_i915_gem_create_ext {
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
> @@ -3797,6 +3801,43 @@ struct drm_i915_gem_create_ext_protected_content {
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
> +	/**
> +	 * @pat_index: PAT index to be set
> +	 * PAT index is a bit field in Page Table Entry to control caching
> +	 * behaviors for GPU accesses. The definition of PAT index is
> +	 * platform dependent and can be found in hardware specifications,
> +	 */
> +	__u32 pat_index;
> +	/** @rsvd: reserved for future use */
> +	__u32 rsvd;
> +};
> +
>  /* ID of the protected content session managed by i915 when PXP is active */
>  #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>  
> -- 
> 2.40.1
