Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4654E218E22
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 19:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DC66E8FC;
	Wed,  8 Jul 2020 17:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D976E8FB
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:19:27 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 9B5C08052E;
 Wed,  8 Jul 2020 19:19:22 +0200 (CEST)
Date: Wed, 8 Jul 2020 19:19:21 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/6] drm/vram-helper: Managed vram helpers
Message-ID: <20200708171921.GA121132@ravnborg.org>
References: <20200708074912.25422-1-tzimmermann@suse.de>
 <20200708074912.25422-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200708074912.25422-2-tzimmermann@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=pv9sigGf4hlyCikQ17MA:9 a=sci8py7bCkZDJ3vu:21
 a=b19s5Agpq-Sc0yGw:21 a=CjuIK1q_8ugA:10
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
Cc: emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 airlied@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

On Wed, Jul 08, 2020 at 09:49:07AM +0200, Thomas Zimmermann wrote:
> Calling drmm_vram_helper_alloc_mm() sets up a managed instance of
> VRAM MM. Releasing the DRM device also frees the memory manager.
> 
> The patch also updates the DRM documentation for VRAM helpers. The
> tutorial now only describes the new managed interface. The older
> interfaces are deprecated and should not be used in new code.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

A couple of comments...



> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 68 ++++++++++++++++++++-------
>  include/drm/drm_gem_vram_helper.h     |  4 ++
>  2 files changed, 55 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index ad096600d89f..af116999b193 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_gem_ttm_helper.h>
>  #include <drm/drm_gem_vram_helper.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_mode.h>
>  #include <drm/drm_plane.h>
>  #include <drm/drm_prime.h>
> @@ -41,7 +42,7 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
>   * left in VRAM, inactive GEM objects can be moved to system memory.
>   *
>   * The easiest way to use the VRAM helper library is to call
> - * drm_vram_helper_alloc_mm(). The function allocates and initializes an
> + * drmm_vram_helper_alloc_mm(). The function allocates and initializes an
>   * instance of &struct drm_vram_mm in &struct drm_device.vram_mm . Use
>   * &DRM_GEM_VRAM_DRIVER to initialize &struct drm_driver and
>   * &DRM_VRAM_MM_FILE_OPERATIONS to initialize &struct file_operations;
> @@ -69,7 +70,7 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
>   *		// setup device, vram base and size
>   *		// ...
>   *
> - *		ret = drm_vram_helper_alloc_mm(dev, vram_base, vram_size);
> + *		ret = drmm_vram_helper_alloc_mm(dev, vram_base, vram_size);
>   *		if (ret)
>   *			return ret;
This example is how this should be done - but we are not there yet..
See below.

>   *		return 0;
> @@ -81,20 +82,12 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
>   * manages an area of video RAM with VRAM MM and provides GEM VRAM objects
>   * to userspace.
>   *
> - * To clean up the VRAM memory management, call drm_vram_helper_release_mm()
> - * in the driver's clean-up code.
> + * You don't have to clean up the instance of VRAM MM.
> + * drmm_vram_helper_alloc_mm() is a managed interface that installs a
> + * clean-up handler to run during the DRM device's release.
>   *
> - * .. code-block:: c
> - *
> - *	void fini_drm_driver()
> - *	{
> - *		struct drm_device *dev = ...;
> - *
> - *		drm_vram_helper_release_mm(dev);
> - *	}
> - *
> - * For drawing or scanout operations, buffer object have to be pinned in video
> - * RAM. Call drm_gem_vram_pin() with &DRM_GEM_VRAM_PL_FLAG_VRAM or
> + * For drawing or scanout operations, rsp. buffer objects have to be pinned
> + * in video RAM. Call drm_gem_vram_pin() with &DRM_GEM_VRAM_PL_FLAG_VRAM or
>   * &DRM_GEM_VRAM_PL_FLAG_SYSTEM to pin a buffer object in video RAM or system
>   * memory. Call drm_gem_vram_unpin() to release the pinned object afterwards.
>   *
> @@ -1177,12 +1170,16 @@ static void drm_vram_mm_cleanup(struct drm_vram_mm *vmm)
>   */
>  
>  /**
> - * drm_vram_helper_alloc_mm - Allocates a device's instance of \
> -	&struct drm_vram_mm
> + * drm_vram_helper_alloc_mm - Allocates a device's instance of
> + *                            &struct drm_vram_mm
>   * @dev:	the DRM device
>   * @vram_base:	the base address of the video memory
>   * @vram_size:	the size of the video memory in bytes
>   *
> + * The driver is responsible to clean-up the VRAM manager during
> + * device cleanup by calling drm_vram_helper_release_mm(). Use
> + * drmm_vram_helper_alloc_mm() if possible.
> + *
>   * Returns:
>   * The new instance of &struct drm_vram_mm on success, or
>   * an ERR_PTR()-encoded errno code otherwise.
drm_vram_helper_alloc_mm is deprecated so just delete the kernel-doc.
We do not want kernel-doc of deprecated functions.


> @@ -1228,6 +1225,43 @@ void drm_vram_helper_release_mm(struct drm_device *dev)
>  }
>  EXPORT_SYMBOL(drm_vram_helper_release_mm);
>  
> +static void drm_vram_mm_release(struct drm_device *dev, void *ptr)
> +{
> +	drm_vram_helper_release_mm(dev);
> +}
> +
> +/**
> + * drmm_vram_helper_alloc_mm - Allocates a device's managed instance of
> + *                             &struct drm_vram_mm
> + * @dev:	the DRM device
> + * @vram_base:	the base address of the video memory
> + * @vram_size:	the size of the video memory in bytes
> + *
> + * The returned instance of &struct drm_vram_mm is auto-managed and
> + * cleaned up as part of device cleanup.
This should document that dev->vram_mm is assigned the value of the
allocated drm_vram_mm is the allocation succeeds, otherwise set it to
NULL.

> + *
> + * Returns:
Some DRM doc uses "RETURNS" - I am not sure what it the most common way.

> + * The new instance of &struct drm_vram_mm on success, or
> + * an ERR_PTR()-encoded errno code otherwise.
> + */
> +struct drm_vram_mm *drmm_vram_helper_alloc_mm(struct drm_device *dev,
> +					      uint64_t vram_base,
> +					      size_t vram_size)
> +{
None of the users of drm_vram_helper_alloc_mm() uses the pointer, they
all uses PTR_ERR().
So the right interface would be to return an int as already documented
in the intro section.
I had a patch to convert the function to return an int - but it is
better to go direct to a managed interface.


> +	struct drm_vram_mm *vram_mm;
> +	int ret;
> +
> +	vram_mm = drm_vram_helper_alloc_mm(dev, vram_base, vram_size);
> +	if (IS_ERR(vram_mm))
> +		return vram_mm;
> +	ret = drmm_add_action_or_reset(dev, drm_vram_mm_release, NULL);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return vram_mm;
> +}
> +EXPORT_SYMBOL(drmm_vram_helper_alloc_mm);
> +
>  /*
>   * Mode-config helpers
>   */
> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
> index b63bcd1b996d..a456a272968b 100644
> --- a/include/drm/drm_gem_vram_helper.h
> +++ b/include/drm/drm_gem_vram_helper.h
> @@ -206,6 +206,10 @@ struct drm_vram_mm *drm_vram_helper_alloc_mm(
>  	struct drm_device *dev, uint64_t vram_base, size_t vram_size);
>  void drm_vram_helper_release_mm(struct drm_device *dev);
>  
> +struct drm_vram_mm *drmm_vram_helper_alloc_mm(struct drm_device *dev,
> +					      uint64_t vram_base,
> +					      size_t vram_size);
> +
>  /*
>   * Mode-config helpers
>   */
> -- 
> 2.27.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
