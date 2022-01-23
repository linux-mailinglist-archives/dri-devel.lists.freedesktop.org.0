Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1B7497625
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jan 2022 23:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C804710E51F;
	Sun, 23 Jan 2022 22:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FABB10E51F;
 Sun, 23 Jan 2022 22:51:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF423D41;
 Sun, 23 Jan 2022 23:51:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1642978276;
 bh=RRjpVXywM63nymcBmncfahaGb2Te7+lQvhrYzpBwj2g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gVEbTj6rALeTZrlFVt1jrhoSpOWD4PGzQz77rQqkon68tIfvZzK4cM+93mbQqn0Dh
 HWo0ol5dC0Kytut7oru7tkmcs+Dnlz1uonutvCFqsqOird8QeeIgqLpR1t0EkqLYFx
 Pg8BWsw0Mxrqu2C+c7mfGWTtytvDqUSzVwgb5bhY=
Date: Mon, 24 Jan 2022 00:50:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomohito Esaki <etom@igel.co.jp>
Subject: Re: [RFC PATCH v3 1/3] drm: introduce fb_modifiers_not_supported
 flag in mode_config
Message-ID: <Ye3b0x3QwlKBF7nl@pendragon.ideasonboard.com>
References: <20220114101753.24996-1-etom@igel.co.jp>
 <20220114101753.24996-2-etom@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220114101753.24996-2-etom@igel.co.jp>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Michel =?utf-8?Q?D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Lee Jones <lee.jones@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Evan Quan <evan.quan@amd.com>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Petr Mladek <pmladek@suse.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Takanari Hayama <taki@igel.co.jp>, Sean Paul <seanpaul@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Esaki-san,

On Fri, Jan 14, 2022 at 07:17:51PM +0900, Tomohito Esaki wrote:
> If only linear modifier is advertised, since there are many drivers that
> only linear supported, the DRM core should handle this rather than
> open-coding in every driver. However, there are legacy drivers such as
> radeon that do not support modifiers but infer the actual layout of the
> underlying buffer. Therefore, a new flag fb_modifiers_not_supported is
> introduced for these legacy drivers, and allow_fb_modifiers is replaced
> with this new flag.
> 
> Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       |  6 +++---
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c            |  2 ++
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c            |  2 ++
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c             |  1 +
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c             |  2 ++
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 +++
>  drivers/gpu/drm/drm_framebuffer.c                 |  6 +++---
>  drivers/gpu/drm/drm_ioctl.c                       |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_display.c         |  6 ++++--
>  drivers/gpu/drm/radeon/radeon_display.c           |  2 ++
>  include/drm/drm_mode_config.h                     | 10 ++++++++++
>  11 files changed, 33 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index 82011e75ed85..edbb30d47b8c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -954,7 +954,7 @@ static int amdgpu_display_verify_sizes(struct amdgpu_framebuffer *rfb)
>  	int ret;
>  	unsigned int i, block_width, block_height, block_size_log2;
>  
> -	if (!rfb->base.dev->mode_config.allow_fb_modifiers)
> +	if (rfb->base.dev->mode_config.fb_modifiers_not_supported)
>  		return 0;
>  
>  	for (i = 0; i < format_info->num_planes; ++i) {
> @@ -1141,7 +1141,7 @@ int amdgpu_display_framebuffer_init(struct drm_device *dev,
>  	if (ret)
>  		return ret;
>  
> -	if (!dev->mode_config.allow_fb_modifiers) {
> +	if (dev->mode_config.fb_modifiers_not_supported) {
>  		drm_WARN_ONCE(dev, adev->family >= AMDGPU_FAMILY_AI,
>  			      "GFX9+ requires FB check based on format modifier\n");
>  		ret = check_tiling_flags_gfx6(rfb);
> @@ -1149,7 +1149,7 @@ int amdgpu_display_framebuffer_init(struct drm_device *dev,
>  			return ret;
>  	}
>  
> -	if (dev->mode_config.allow_fb_modifiers &&
> +	if (!dev->mode_config.fb_modifiers_not_supported &&
>  	    !(rfb->base.flags & DRM_MODE_FB_MODIFIERS)) {
>  		ret = convert_tiling_flags_to_modifier(rfb);
>  		if (ret) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> index d1570a462a51..fb61c0814115 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> @@ -2798,6 +2798,8 @@ static int dce_v10_0_sw_init(void *handle)
>  	adev_to_drm(adev)->mode_config.preferred_depth = 24;
>  	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
>  
> +	adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
> +
>  	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
>  
>  	r = amdgpu_display_modeset_create_props(adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> index 18a7b3bd633b..17942a11366d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> @@ -2916,6 +2916,8 @@ static int dce_v11_0_sw_init(void *handle)
>  	adev_to_drm(adev)->mode_config.preferred_depth = 24;
>  	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
>  
> +	adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
> +
>  	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
>  
>  	r = amdgpu_display_modeset_create_props(adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> index c7803dc2b2d5..2ec99ec8e1a3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -2674,6 +2674,7 @@ static int dce_v6_0_sw_init(void *handle)
>  	adev_to_drm(adev)->mode_config.max_height = 16384;
>  	adev_to_drm(adev)->mode_config.preferred_depth = 24;
>  	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
> +	adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
>  	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
>  
>  	r = amdgpu_display_modeset_create_props(adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> index 8318ee8339f1..de11fbe5aba2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> @@ -2695,6 +2695,8 @@ static int dce_v8_0_sw_init(void *handle)
>  	adev_to_drm(adev)->mode_config.preferred_depth = 24;
>  	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
>  
> +	adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
> +
>  	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
>  
>  	r = amdgpu_display_modeset_create_props(adev);
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 2f0b14f8f833..61cb41766fae 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7868,6 +7868,9 @@ static int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
>  	if (res)
>  		return res;
>  
> +	if (modifiers == NULL)
> +		adev_to_drm(dm->adev)->mode_config.fb_modifiers_not_supported = true;
> +
>  	res = drm_universal_plane_init(adev_to_drm(dm->adev), plane, possible_crtcs,
>  				       &dm_plane_funcs, formats, num_formats,
>  				       modifiers, plane->type, NULL);
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index 07f5abc875e9..4562a8b86579 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -309,7 +309,7 @@ drm_internal_framebuffer_create(struct drm_device *dev,
>  	}
>  
>  	if (r->flags & DRM_MODE_FB_MODIFIERS &&
> -	    !dev->mode_config.allow_fb_modifiers) {
> +	    dev->mode_config.fb_modifiers_not_supported) {
>  		DRM_DEBUG_KMS("driver does not support fb modifiers\n");
>  		return ERR_PTR(-EINVAL);
>  	}
> @@ -594,7 +594,7 @@ int drm_mode_getfb2_ioctl(struct drm_device *dev,
>  	r->pixel_format = fb->format->format;
>  
>  	r->flags = 0;
> -	if (dev->mode_config.allow_fb_modifiers)
> +	if (!dev->mode_config.fb_modifiers_not_supported)
>  		r->flags |= DRM_MODE_FB_MODIFIERS;
>  
>  	for (i = 0; i < ARRAY_SIZE(r->handles); i++) {
> @@ -607,7 +607,7 @@ int drm_mode_getfb2_ioctl(struct drm_device *dev,
>  	for (i = 0; i < fb->format->num_planes; i++) {
>  		r->pitches[i] = fb->pitches[i];
>  		r->offsets[i] = fb->offsets[i];
> -		if (dev->mode_config.allow_fb_modifiers)
> +		if (!dev->mode_config.fb_modifiers_not_supported)
>  			r->modifier[i] = fb->modifier;
>  	}
>  
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 8b8744dcf691..51fcf1298023 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -297,7 +297,7 @@ static int drm_getcap(struct drm_device *dev, void *data, struct drm_file *file_
>  			req->value = 64;
>  		break;
>  	case DRM_CAP_ADDFB2_MODIFIERS:
> -		req->value = dev->mode_config.allow_fb_modifiers;
> +		req->value = !dev->mode_config.fb_modifiers_not_supported;
>  		break;
>  	case DRM_CAP_CRTC_IN_VBLANK_EVENT:
>  		req->value = 1;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index 2b460835a438..2cd0932b3d68 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -708,10 +708,12 @@ nouveau_display_create(struct drm_device *dev)
>  				     &disp->disp);
>  		if (ret == 0) {
>  			nouveau_display_create_properties(dev);
> -			if (disp->disp.object.oclass < NV50_DISP)
> +			if (disp->disp.object.oclass < NV50_DISP) {
> +				dev->mode_config.fb_modifiers_not_supported = true;
>  				ret = nv04_display_create(dev);
> -			else
> +			} else {
>  				ret = nv50_display_create(dev);
> +			}
>  		}
>  	} else {
>  		ret = 0;
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
> index 573154268d43..b9a07677a71e 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -1596,6 +1596,8 @@ int radeon_modeset_init(struct radeon_device *rdev)
>  	rdev->ddev->mode_config.preferred_depth = 24;
>  	rdev->ddev->mode_config.prefer_shadow = 1;
>  
> +	rdev->ddev->mode_config.fb_modifiers_not_supported = true;
> +
>  	rdev->ddev->mode_config.fb_base = rdev->mc.aper_base;
>  
>  	ret = radeon_modeset_create_props(rdev);
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 91ca575a78de..da82f45351c7 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -933,6 +933,16 @@ struct drm_mode_config {
>  	 */
>  	bool allow_fb_modifiers;
>  
> +	/**
> +	 * @fb_modifiers_not_supported:
> +	 *
> +	 * This flag is for legacy drivers such as radeon that do not support
> +	 * modifiers but infer the actual layout of the underlying buffer.
> +	 * Generally, each drivers must support modifiers, this flag should not
> +	 * be set.

I'd write it a bit differently, to explain what the flag does:

	 * When this flag is set, the DRM device will not expose modifier
	 * support to userspace. This is only used by legacy drivers (such as
	 * radeon) that infer the buffer layout through heuristics without using
	 * modifiers. New drivers shall not set fhis flag.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	 */
> +	bool fb_modifiers_not_supported;
> +
>  	/**
>  	 * @normalize_zpos:
>  	 *

-- 
Regards,

Laurent Pinchart
