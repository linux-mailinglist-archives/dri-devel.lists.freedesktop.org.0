Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E179E1A16
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 11:58:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB5510E9DC;
	Tue,  3 Dec 2024 10:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RlAPaW5Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA1510E318;
 Tue,  3 Dec 2024 10:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733223504; x=1764759504;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=r5IzcIHpW1yeHzI+cxkcrwgUkSQv1jAL9yBPggXeYEM=;
 b=RlAPaW5ZBeFZM2GBHL/pwYe6X5/GprtMWPYHL45jfCW5gvGqh4SkoCRW
 Zr2Ff/o+vtkJmis6QDoaR4uBPFuarfbME5rbmfzU0RLRBO92NiT/TI+O3
 zq+g4tzuxRmnmoqvcmTiU0zZYSdg4gQ6uubbiqkHUv4rIgYzVDuptD5vX
 nZ55YelsuKZZL8S3t8RscXf1tl3+eGJBQjsrmEDBW2BqtkzaSr3K3LSHS
 mqZ3ucZkCtI7sJdDwjcCgnIQY3qakxcRHIzyt6/hBcAgQ8Q179ER7sIza
 A+WvA2zYXIkovA+SuZCXOqjUBFv2Q0rOITsiQ2l1Xd0skQADJ6kbH6Hww w==;
X-CSE-ConnectionGUID: h0rGeIeHTVucPjkA+FKEjA==
X-CSE-MsgGUID: A6wJY+c8Ts6kTV5e9GN+0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="43914260"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="43914260"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 02:58:24 -0800
X-CSE-ConnectionGUID: seQVHymXRPOzYEoDKLagXQ==
X-CSE-MsgGUID: Tmu1TYCtSvCpZ6NYVzNtUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="98400962"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO [10.245.245.10])
 ([10.245.245.10])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 02:58:20 -0800
Message-ID: <4e67e781-df6d-45b8-be52-637ee5926bd7@linux.intel.com>
Date: Tue, 3 Dec 2024 11:58:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] drm/i915: Add drm_panic support
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241203092836.426422-1-jfalempe@redhat.com>
 <20241203092836.426422-6-jfalempe@redhat.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20241203092836.426422-6-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

Den 2024-12-03 kl. 09:50, skrev Jocelyn Falempe:
> This adds drm_panic support for a wide range of Intel GPU. I've
> tested it only on 3 laptops, haswell (with 128MB of eDRAM),
> cometlake and alderlake.
> 
>  * DPT: if I disable tiling on a framebuffer using DPT, then it
>    displays some other memory location. As DPT is enabled only for
>    tiled framebuffer, there might be some hardware limitations.
This is because DPT points to the pagetable, when you disable tiling DPT is no longer used so the DPT is interpreted as a linear FB instead of a lookup table.

The lookup table is necessarily smaller than the real FB, so you would need to overwrite part of the GGTT and point it to linear FB.

I'm not sure what the fix is here as it would require a real GGTT mapping to fix, needing an allocation which might not succeed. Perhaps indicates a limitation to require a real pageflip to fbdev fb?

Have you tested rotated by any chance? Cursor enabled? Overlay?

I also think this may fail if there are flips queued. We should probably bite the bullet, reprogram the entire state into a known state, disable all overlay planes and cursor, reassign all watermarks for the primary and ensure any background work is killed where needed.

Cheers,
~Maarten

>  * fbdev: On my haswell laptop, the fbdev framebuffer is configured
>    with tiling enabled, but really it's linear, because fbcon don't
>    know about tiling, and the panic screen is perfect when it's drawn
>    as linear.
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  .../gpu/drm/i915/display/intel_atomic_plane.c | 85 ++++++++++++++++++-
>  1 file changed, 84 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> index b7e462075ded3..58eb3b4c55fa5 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -33,16 +33,20 @@
>  
>  #include <linux/dma-fence-chain.h>
>  #include <linux/dma-resv.h>
> +#include <linux/iosys-map.h>
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_blend.h>
> +#include <drm/drm_cache.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_panic.h>
>  
>  #include "i915_config.h"
>  #include "i9xx_plane_regs.h"
>  #include "intel_atomic_plane.h"
> +#include "intel_bo.h"
>  #include "intel_cdclk.h"
>  #include "intel_cursor.h"
>  #include "intel_display_rps.h"
> @@ -50,6 +54,7 @@
>  #include "intel_display_types.h"
>  #include "intel_fb.h"
>  #include "intel_fb_pin.h"
> +#include "intel_fbdev.h"
>  #include "skl_scaler.h"
>  #include "skl_watermark.h"
>  
> @@ -1198,14 +1203,92 @@ intel_cleanup_plane_fb(struct drm_plane *plane,
>  	intel_plane_unpin_fb(old_plane_state);
>  }
>  
> +/* Only used by drm_panic get_scanout_buffer() and panic_flush(), so it is
> + * protected by the drm panic spinlock
> + */
> +static struct iosys_map panic_map;
> +
> +static void intel_panic_flush(struct drm_plane *plane)
> +{
> +	struct intel_plane_state *plane_state = to_intel_plane_state(plane->state);
> +	struct drm_i915_private *dev_priv = to_i915(plane->dev);
> +	struct drm_framebuffer *fb = plane_state->hw.fb;
> +	struct intel_plane *iplane = to_intel_plane(plane);
> +
> +	/* Force a cache flush, otherwise the new pixels won't show up */
> +	drm_clflush_virt_range(panic_map.vaddr, fb->height * fb->pitches[0]);
> +
> +	/* Don't disable tiling if it's the fbdev framebuffer.*/
> +	if (to_intel_framebuffer(fb) == intel_fbdev_framebuffer(dev_priv->display.fbdev.fbdev))
> +		return;
> +
> +	if (fb->modifier && iplane->disable_tiling)
> +		iplane->disable_tiling(iplane);
> +}
> +
> +static int intel_get_scanout_buffer(struct drm_plane *plane,
> +				    struct drm_scanout_buffer *sb)
> +{
> +	struct intel_plane_state *plane_state;
> +	struct drm_gem_object *obj;
> +	struct drm_framebuffer *fb;
> +	struct drm_i915_private *dev_priv = to_i915(plane->dev);
> +	void *ptr;
> +
> +	if (!plane->state || !plane->state->fb || !plane->state->visible)
> +		return -ENODEV;
> +
> +	plane_state = to_intel_plane_state(plane->state);
> +	fb = plane_state->hw.fb;
> +	obj = intel_fb_bo(fb);
> +	if (!obj)
> +		return -ENODEV;
> +
> +	if (to_intel_framebuffer(fb) == intel_fbdev_framebuffer(dev_priv->display.fbdev.fbdev)) {
> +		ptr = intel_fbdev_get_vaddr(dev_priv->display.fbdev.fbdev);
> +	} else {
> +		/* can't disable tiling if DPT is in use */
> +		if (intel_bo_is_tiled(obj) && HAS_DPT(dev_priv))
> +			return -EOPNOTSUPP;
> +
> +		ptr = intel_bo_panic_map(obj);
> +	}
> +
> +	if (!ptr)
> +		return -ENOMEM;
> +
> +	if (intel_bo_has_iomem(obj))
> +		iosys_map_set_vaddr_iomem(&panic_map, ptr);
> +	else
> +		iosys_map_set_vaddr(&panic_map, ptr);
> +
> +	sb->map[0] = panic_map;
> +	sb->width = fb->width;
> +	sb->height = fb->height;
> +	sb->format = fb->format;
> +	sb->pitch[0] = fb->pitches[0];
> +
> +	return 0;
> +}
> +
>  static const struct drm_plane_helper_funcs intel_plane_helper_funcs = {
>  	.prepare_fb = intel_prepare_plane_fb,
>  	.cleanup_fb = intel_cleanup_plane_fb,
>  };
>  
> +static const struct drm_plane_helper_funcs intel_primary_plane_helper_funcs = {
> +	.prepare_fb = intel_prepare_plane_fb,
> +	.cleanup_fb = intel_cleanup_plane_fb,
> +	.get_scanout_buffer = intel_get_scanout_buffer,
> +	.panic_flush = intel_panic_flush,
> +};
> +
>  void intel_plane_helper_add(struct intel_plane *plane)
>  {
> -	drm_plane_helper_add(&plane->base, &intel_plane_helper_funcs);
> +	if (plane->base.type == DRM_PLANE_TYPE_PRIMARY)
> +		drm_plane_helper_add(&plane->base, &intel_primary_plane_helper_funcs);
> +	else
> +		drm_plane_helper_add(&plane->base, &intel_plane_helper_funcs);
>  }
>  
>  void intel_plane_init_cursor_vblank_work(struct intel_plane_state *old_plane_state,

