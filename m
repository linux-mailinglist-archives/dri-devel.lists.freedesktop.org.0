Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D70373B0D78
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 21:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3020A6E876;
	Tue, 22 Jun 2021 19:10:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E346E120
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 19:10:08 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 7dd50cf3-d38d-11eb-a36f-0050568cd888;
 Tue, 22 Jun 2021 19:10:22 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 53825194B4A;
 Tue, 22 Jun 2021 21:10:11 +0200 (CEST)
Date: Tue, 22 Jun 2021 21:10:03 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 07/15] drm/atomic-helper: make
 drm_gem_plane_helper_prepare_fb the default
Message-ID: <YNI1i1D88TWZU1vR@ravnborg.org>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-8-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622165511.3169559-8-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Tue, Jun 22, 2021 at 06:55:03PM +0200, Daniel Vetter wrote:
> There's a bunch of atomic drivers who don't do this quite correctly,
> luckily most of them aren't in wide use or people would have noticed
> the tearing.
> 
> By making this the default we avoid the constant audit pain and can
> additionally remove a ton of lines from vfuncs for a bit more clarity
> in smaller drivers.
> 
> While at it complain if there's a cleanup_fb hook but no prepare_fb
> hook, because that makes no sense. I haven't found any driver which
> violates this, but better safe than sorry.
> 
> Subsequent patches will reap the benefits.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c      | 10 ++++++++++
>  drivers/gpu/drm/drm_gem_atomic_helper.c  |  3 +++
>  include/drm/drm_modeset_helper_vtables.h |  7 +++++--
>  3 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 531f2374b072..9f6c5f21c4d6 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -35,6 +35,7 @@
>  #include <drm/drm_damage_helper.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_self_refresh_helper.h>
> @@ -2408,6 +2409,15 @@ int drm_atomic_helper_prepare_planes(struct drm_device *dev,
>  			ret = funcs->prepare_fb(plane, new_plane_state);
>  			if (ret)
>  				goto fail;
> +		} else {
> +			WARN_ON_ONCE(funcs->cleanup_fb);
> +
> +			if (!drm_core_check_feature(dev, DRIVER_GEM))
> +				continue;
> +
> +			ret = drm_gem_plane_helper_prepare_fb(plane, new_plane_state);
> +			if (ret)
> +				goto fail;
>  		}
>  	}
>  
> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
> index a27135084ae5..bc9396f2a0ed 100644
> --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
> @@ -135,6 +135,9 @@
>   * GEM based framebuffer drivers which have their buffers always pinned in
>   * memory.
>   *
> + * This function is the default implementation for GEM drivers of
> + * &drm_plane_helper_funcs.prepare_fb if no callback is provided.
> + *
>   * See drm_atomic_set_fence_for_plane() for a discussion of implicit and
>   * explicit fencing in atomic modeset updates.
>   */
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> index f3a4b47b3986..4e727261dca5 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -1178,8 +1178,11 @@ struct drm_plane_helper_funcs {
>  	 * equivalent functionality should be implemented through private
>  	 * members in the plane structure.
>  	 *
> -	 * Drivers which always have their buffers pinned should use
> -	 * drm_gem_plane_helper_prepare_fb() for this hook.
> +	 * For GEM drivers who neither have a @prepare_fb not @cleanup_fb hook
s/not/nor/ ??
> +	 * set drm_gem_plane_helper_prepare_fb() is called automatically to
              ^add comma?
> +	 * implement this.


Leave cleanup_fb out of the description to make it more readable.
In the description of cleanup_fb you can document that it is wrong to
have it without a matcching prepare_fb if you feel for it.

	Sam


         * Other drivers which need additional plane processing
> +	 * can call drm_gem_plane_helper_prepare_fb() from their @prepare_fb
> +	 * hook.
>  	 *
>  	 * The helpers will call @cleanup_fb with matching arguments for every
>  	 * successful call to this hook.
> -- 
> 2.32.0.rc2
