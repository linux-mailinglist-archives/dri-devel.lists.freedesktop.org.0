Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 827D57EA26F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 18:53:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915AF10E3E5;
	Mon, 13 Nov 2023 17:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6B210E3E5;
 Mon, 13 Nov 2023 17:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699897988; x=1731433988;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=udS9SfzTwwnCam3BM7zqV5qU6ZGdKL8Y0UdUz8KpRV8=;
 b=fIBMRLnKnGsk4oJ5/OGJzZEU7ncj+hI4olfsOpNUdkl0CooCYn3beR6p
 VaH5NxokhSfyRRF9XDpPiyPn4yEJkL0y0/zZRgZnIVyJRipNU7dqC1QTs
 nlQvElYu2MkqGbvRYE93fU2Xavy6Xap4E+v0iF1wxkabyd9TCvOAi9dSz
 V1ZFC1oJNj0c1pCmrgMUMOoXFmn9Wnpy1nJ/I67Dg4cdlGLPYtW9rnb/V
 7S1GP7aWRuovkoOeA2J7YeDhSvmAYJmGuYNf8G2YMfRhn9jQPmkTqvz6c
 UDrkBGejeDLfPxr/cCzKYVZSj1zMiFcN4+CRr+L6Ru8IdY6wyIWG7wsbM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="9122383"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="9122383"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 09:53:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="855030752"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="855030752"
Received: from cgheban-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.92])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 09:53:03 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dipam Turkar <dipamt1729@gmail.com>
Subject: Re: [PATCH v2] Remove custom dumb_map_offset implementations in
 i915 driver
In-Reply-To: <20231110184126.712310-1-dipamt1729@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231110184126.712310-1-dipamt1729@gmail.com>
Date: Mon, 13 Nov 2023 19:53:01 +0200
Message-ID: <875y25tu9u.fsf@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, Dipam Turkar <dipamt1729@gmail.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 11 Nov 2023, Dipam Turkar <dipamt1729@gmail.com> wrote:
> Making i915 use drm_gem_create_mmap_offset() instead of its custom
> implementations for associating GEM object with a fake offset.

It would probably help a lot if your commit messages explained what you
are trying to achieve and, especially, why. This only describes the
patch in English.

BR,
Jani.

>
> Signed-off-by: Dipam Turkar <dipamt1729@gmail.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 21 ---------------------
>  drivers/gpu/drm/i915/gem/i915_gem_mman.h |  4 ----
>  drivers/gpu/drm/i915/i915_driver.c       |  3 ++-
>  3 files changed, 2 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index aa4d842d4c5a..71d621a1f249 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -771,27 +771,6 @@ __assign_mmap_offset_handle(struct drm_file *file,
>  	return err;
>  }
>  
> -int
> -i915_gem_dumb_mmap_offset(struct drm_file *file,
> -			  struct drm_device *dev,
> -			  u32 handle,
> -			  u64 *offset)
> -{
> -	struct drm_i915_private *i915 = to_i915(dev);
> -	enum i915_mmap_type mmap_type;
> -
> -	if (HAS_LMEM(to_i915(dev)))
> -		mmap_type = I915_MMAP_TYPE_FIXED;
> -	else if (pat_enabled())
> -		mmap_type = I915_MMAP_TYPE_WC;
> -	else if (!i915_ggtt_has_aperture(to_gt(i915)->ggtt))
> -		return -ENODEV;
> -	else
> -		mmap_type = I915_MMAP_TYPE_GTT;
> -
> -	return __assign_mmap_offset_handle(file, handle, mmap_type, offset);
> -}
> -
>  /**
>   * i915_gem_mmap_offset_ioctl - prepare an object for GTT mmap'ing
>   * @dev: DRM device
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.h b/drivers/gpu/drm/i915/gem/i915_gem_mman.h
> index 196417fd0f5c..253435795caf 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.h
> @@ -20,10 +20,6 @@ struct mutex;
>  int i915_gem_mmap_gtt_version(void);
>  int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma);
>  
> -int i915_gem_dumb_mmap_offset(struct drm_file *file_priv,
> -			      struct drm_device *dev,
> -			      u32 handle, u64 *offset);
> -
>  void __i915_gem_object_release_mmap_gtt(struct drm_i915_gem_object *obj);
>  void i915_gem_object_release_mmap_gtt(struct drm_i915_gem_object *obj);
>  
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index d50347e5773a..48d7e53c49d6 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -42,6 +42,7 @@
>  #include <drm/drm_aperture.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_ioctl.h>
> +#include <drm/drm_gem.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_probe_helper.h>
>  
> @@ -1826,7 +1827,7 @@ static const struct drm_driver i915_drm_driver = {
>  	.gem_prime_import = i915_gem_prime_import,
>  
>  	.dumb_create = i915_gem_dumb_create,
> -	.dumb_map_offset = i915_gem_dumb_mmap_offset,
> +	.dumb_map_offset = drm_gem_dumb_map_offset,
>  
>  	.ioctls = i915_ioctls,
>  	.num_ioctls = ARRAY_SIZE(i915_ioctls),

-- 
Jani Nikula, Intel
