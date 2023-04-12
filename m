Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D39E26DF90D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 16:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D5810E85D;
	Wed, 12 Apr 2023 14:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED71110E85D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 14:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681311206; x=1712847206;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LUFgVaaXrvK/HYl8CKrYvLgWg5X07neWYVCIZdAkKX0=;
 b=RnzxbAo35RIoXNd1cv3DVHEmI/cwKRoB/1n83tulZHDo6S1mB8GWwLrg
 rRCLWpCCBf/KX2jywac8R33jeRS7j4Gvdbf59kJLt/ZiCmO2Fi/e8u5+Q
 QDzKeg8hBQxEu+OBaVsVgezAoFyVIO5diNoXgb9ESy0eHQMDqFTJZQTdY
 0y16Gs/wnw6adiwCasBt+hL8vVKYDOj2l0XxBX0pSjz2ED/k7mJ2epXvp
 y6O5/lnzXisMtYWhBogQqa7jY5reJDr/fG5h45mKU1W/bwAsZDxUuiMsw
 tKqvgbD3z3v/RVRM9soAFf8LQbZ7Ny9oXC0VpHJu2Yl9UYrDNq6mFrDQr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="341411763"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="341411763"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:53:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="666385676"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="666385676"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga006.jf.intel.com with SMTP; 12 Apr 2023 07:53:21 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 12 Apr 2023 17:53:20 +0300
Date: Wed, 12 Apr 2023 17:53:20 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH] drm/gem: Check for valid formats
Message-ID: <ZDbF4Lgct8Fyj7Wa@intel.com>
References: <20230412142923.136707-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230412142923.136707-1-mcanal@igalia.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Melissa Wen <mwen@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 11:29:23AM -0300, Maíra Canal wrote:
> Currently, drm_gem_fb_create() doesn't check if the pixel format is
> supported, which can lead to the acceptance of invalid pixel formats
> e.g. the acceptance of invalid modifiers. Therefore, add a check for
> valid formats on drm_gem_fb_create().
> 
> Moreover, note that this check is only valid for atomic drivers,
> because, for non-atomic drivers, checking drm_any_plane_has_format() is
> not possible since the format list for the primary plane is fake, and
> we'd therefor reject valid formats.
> 
> Adding this check to drm_gem_fb_create() will guarantee that the
> igt@kms_addfb_basic@addfb25-bad-modifier IGT test passes for drivers
> using this callback.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Seems sane enough, assuming all the drivers using this are happy
with the baked in !modifiers -> linear assumption. That might be
a good thing to highlight in the docs.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

BTW long ago I tried to make igt check this stugg a bit
more vehemently:
https://patchwork.freedesktop.org/patch/239814/?series=46876&rev=1
Someone might want to pick that up again and see if it
cab be makde to work with more drivers than just i915.

> ---
> 
> This patch is a recapture of a series I sent a while ago. Initially, I sent a
> patch [1] similar to this one in which I introduced the format check to
> drm_gem_fb_create().
> 
> Based on the feedback on the patch, I placed the check inside
> framebuffer_check() [2] so that it wouldn't be needed to hit any driver-specific
> code path when the check fails. Therefore, we could remove the check from the
> specific drivers (i915, amdgpu, and vmwgfx).
> 
> But, with some new feedback, it was shown that introducing this check inside
> framebuffer_check() is problematic for the i915 driver [3]. So, I kept the check
> inside the i915 driver and removed the check from amdgpu and vmwgfx [4]. But,
> this yet hasn't solved the i915 problem [5].
> 
> As we cannot add the check inside framebuffer_check() without affecting the i915
> behavior, I propose going back to the original patch. This way we can guarantee
> a more uniform behavior from the drivers that use the drm_gem_fb_create()
> callback.
> 
> [1] https://lore.kernel.org/dri-devel/20230103125322.855089-1-mcanal@igalia.com/T/
> [2] https://lore.kernel.org/dri-devel/20230109105807.18172-1-mcanal@igalia.com/T/
> [3] https://lore.kernel.org/dri-devel/Y8AAdW2y7zN7DCUZ@intel.com/
> [4] https://lore.kernel.org/dri-devel/20230113112743.188486-1-mcanal@igalia.com/T/
> [5] https://lore.kernel.org/dri-devel/Y8FXWvEhO7GCRKVJ@intel.com/
> 
> Best Regards,
> - Maíra Canal
> 
> ---
>  Documentation/gpu/todo.rst                   | 7 ++-----
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 9 +++++++++
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 1f8a5ebe188e..68bdafa0284f 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -276,11 +276,8 @@ Various hold-ups:
>  - Need to switch to drm_fbdev_generic_setup(), otherwise a lot of the custom fb
>    setup code can't be deleted.
>  
> -- Many drivers wrap drm_gem_fb_create() only to check for valid formats. For
> -  atomic drivers we could check for valid formats by calling
> -  drm_plane_check_pixel_format() against all planes, and pass if any plane
> -  supports the format. For non-atomic that's not possible since like the format
> -  list for the primary plane is fake and we'd therefor reject valid formats.
> +- Need to switch to drm_gem_fb_create(), as now drm_gem_fb_create() checks for
> +  valid formats for atomic drivers.
>  
>  - Many drivers subclass drm_framebuffer, we'd need a embedding compatible
>    version of the varios drm_gem_fb_create functions. Maybe called
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index e93533b86037..b8a615a138cd 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -9,6 +9,7 @@
>  #include <linux/module.h>
>  
>  #include <drm/drm_damage_helper.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem.h>
> @@ -164,6 +165,14 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>  		return -EINVAL;
>  	}
>  
> +	if (drm_drv_uses_atomic_modeset(dev) &&
> +	    !drm_any_plane_has_format(dev, mode_cmd->pixel_format,
> +				      mode_cmd->modifier[0])) {
> +		drm_dbg(dev, "Unsupported pixel format %p4cc / modifier 0x%llx\n",
> +			&mode_cmd->pixel_format, mode_cmd->modifier[0]);
> +		return -EINVAL;
> +	}
> +
>  	for (i = 0; i < info->num_planes; i++) {
>  		unsigned int width = mode_cmd->width / (i ? info->hsub : 1);
>  		unsigned int height = mode_cmd->height / (i ? info->vsub : 1);
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
