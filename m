Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2344B6AC355
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 15:32:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328BA10E247;
	Mon,  6 Mar 2023 14:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABB010E245;
 Mon,  6 Mar 2023 14:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678113168; x=1709649168;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1O7cMkx9/E9v8B5FjS74qJQ2rlDzNhvPdeLIFoee4xI=;
 b=I22t/iXyGFO70ErOuFlrhZvZa5dAqaNfkpnTrPVwdb55T+vFnNuIn3Qp
 zt+vZYlRJUQ2/vhRIFaznbACRxfDpNzEqlDkhXvikQ/4jxaiDZtGm0poo
 xLamfpeRq8t18Z+yfWnywx6zFr3kiPNbpbJct0o2r9yDyyKUqFfbw8qIi
 zbmlh1y8EZLmNpgu5nOcc//jA8ie3PRnRDCQeBry5Keo+RYK9QGkLpvgf
 ciWc/PLeW+CdHls3lcwT9hd801POuUnfQJPbHEvM1qhsjVfw5eUAUaDD2
 OSUI8BB3HW5kVhZQfmughn0dSMJ4Jo4gD5FNJTS3DpZZXiu41QWNKLyAh Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="337884921"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="337884921"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 06:32:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="708669703"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="708669703"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga001.jf.intel.com with SMTP; 06 Mar 2023 06:32:45 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 06 Mar 2023 16:32:44 +0200
Date: Mon, 6 Mar 2023 16:32:44 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH RFC 3/3] drm/i915/display: Implement fb_mmap callback
 function
Message-ID: <ZAX5jC+E/aUgUW9X@intel.com>
References: <20230306102850.18299-1-nirmoy.das@intel.com>
 <20230306102850.18299-3-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230306102850.18299-3-nirmoy.das@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 06, 2023 at 11:28:50AM +0100, Nirmoy Das wrote:
> If stolen memory allocation fails for fbdev, the driver will
> fallback to system memory. Calculation of smem_start is wrong
> for such framebuffer objs if the platform comes with no gmadr or
> no aperture. Solve this by adding fb_mmap callback which also gives
> driver more control.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index 98ae3a3a986a..ed0f9e2af3ed 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -40,8 +40,10 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
>  
>  #include "gem/i915_gem_lmem.h"
> +#include "gem/i915_gem_mman.h"
>  
>  #include "i915_drv.h"
>  #include "intel_display_types.h"
> @@ -120,6 +122,23 @@ static int intel_fbdev_pan_display(struct fb_var_screeninfo *var,
>  	return ret;
>  }
>  
> +#define to_intel_fbdev(x) container_of(x, struct intel_fbdev, helper)
> +static int intel_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
> +{
> +	struct intel_fbdev *fbdev = to_intel_fbdev(info->par);
> +	struct drm_gem_object *bo = drm_gem_fb_get_obj(&fbdev->fb->base, 0);
> +	struct drm_i915_gem_object *obj = to_intel_bo(bo);
> +	struct drm_device *dev = fbdev->helper.dev;

You seem to be missing the fb vs. mmio handling here entirely.

> +
> +	vma->vm_page_prot =
> +			pgprot_writecombine(vm_get_page_prot(vma->vm_flags));

Does that do something sane on eg. !PAT?

> +
> +	if (obj->stolen)
> +		return vm_iomap_memory(vma, info->fix.smem_start,
> +				       info->fix.smem_len);

Why doesn't i915_gem_object_mmap() know how to handle stolen?

> +
> +	return i915_gem_object_mmap(obj, vma);
> +}
>  static const struct fb_ops intelfb_ops = {
>  	.owner = THIS_MODULE,
>  	DRM_FB_HELPER_DEFAULT_OPS,
> @@ -131,6 +150,7 @@ static const struct fb_ops intelfb_ops = {
>  	.fb_imageblit = drm_fb_helper_cfb_imageblit,
>  	.fb_pan_display = intel_fbdev_pan_display,
>  	.fb_blank = intel_fbdev_blank,
> +	.fb_mmap = intel_fbdev_mmap,
>  };
>  
>  static int intelfb_alloc(struct drm_fb_helper *helper,
> -- 
> 2.39.0

-- 
Ville Syrjälä
Intel
