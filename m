Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9E9265BF8
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 10:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA6C6E358;
	Fri, 11 Sep 2020 08:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130906E358
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 08:50:39 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c18so10643080wrm.9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 01:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JL2m2zxFt6VhbPQoHb7Dl4ra2Rsq1idPDgnY5TubTbg=;
 b=M1g6LqmugCF5ewHTCGB8tDViktk0ufHmAHnBccYRNb/Z6HQ38scoWVdeVZLXdXkNhb
 2ldDzMBK0MrTfE8qKgAAQJCEQ3NLIxSJQz2TdqyVTel7ASeIKT5EadIq/nWpxUYv/ODN
 TEdBxR4fjKij2gGMUJlkxpMMvtG/hDrR5WltI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JL2m2zxFt6VhbPQoHb7Dl4ra2Rsq1idPDgnY5TubTbg=;
 b=gHjHAAi6LZUkbDqp315EsuXTvUN9nKHVNa9zvqXKj0n3Twy7lax46ABdcqN6W+Mjgo
 F1JD+WKePGY+U34pZi6zDsXuYC93U2+5wqxxw6IFVWCAJoEX6HXr6fBtExPJ0RIXGbvy
 tQDaggyoZvenQJZEqch8Nb4yP+XqETp3sdingMnTRczrfUtJhiqdWeLHDshBdJSG1qBY
 RmzLdpKb5pOXomsLADzEp2Qg+1HUzoZ77Y9LwEb6BbZ+ITW5qZYBc/y++MLp9ik5liMr
 XXRo7yNX1L2Hu1FYFJZ/VEhwX2Sw4yXW5rn7YpnGIGDuUgMifF7tHA0ozyFGmtDxX42L
 8qpA==
X-Gm-Message-State: AOAM531834awz9I+E2Dyf8xm+GXAeSg3zX11nQTwShZRilhpuuufDKaj
 VnrNKHmuFqZKtNUj3mY87ARrcg==
X-Google-Smtp-Source: ABdhPJzMTbfdUJ9CtGbBTkCjLpBLPddpebqlhhu7p8ueWoyuRKnFjAs7k6TUtP108pKb4J9ffc+R8Q==
X-Received: by 2002:a5d:62c2:: with SMTP id o2mr946744wrv.418.1599814237347;
 Fri, 11 Sep 2020 01:50:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d6sm3224658wrq.67.2020.09.11.01.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 01:50:36 -0700 (PDT)
Date: Fri, 11 Sep 2020 10:50:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Stefan Agner <stefan@agner.ch>
Subject: Re: [RFC PATCH 1/3] drm: use flags instead of boolean in plane check
Message-ID: <20200911085034.GO438822@phenom.ffwll.local>
References: <20200910092425.1016976-1-stefan@agner.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910092425.1016976-1-stefan@agner.ch>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: marex@denx.de, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 10, 2020 at 11:24:23AM +0200, Stefan Agner wrote:
> To improve readability and make it easier to add further optional checks
> replace the boolean parameters with a single flag bitfield as parameter
> of drm_atomic_helper_check_plane_state.
> 
> The regular call sites have been converted using a simple coccinelle
> patch.
> 
> virtual patch

Looks reasonable, but needs kerneldoc. For that either do a list in the
kerneldoc for drm_atomic_helper_check_plane_state, or make the flags an
enum (still setting the value for each explicitly), and then kerneldoc
that with a link from the function to that.
-Daniel

> 
> @@
> expression e1, e2, e3, e4;
> symbol true, false;
> @@
> 
> (
> - drm_atomic_helper_check_plane_state(e1, e2, e3, e4, true, true)
> + drm_atomic_helper_check_plane_state(e1, e2, e3, e4, DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED)
> |
> - drm_atomic_helper_check_plane_state(e1, e2, e3, e4, true, false)
> + drm_atomic_helper_check_plane_state(e1, e2, e3, e4, DRM_PLANE_CAN_POSITION)
> |
> - drm_atomic_helper_check_plane_state(e1, e2, e3, e4, false, true)
> + drm_atomic_helper_check_plane_state(e1, e2, e3, e4, DRM_PLANE_CAN_UPDATE_DISABLED)
> |
> - drm_atomic_helper_check_plane_state(e1, e2, e3, e4, false, false)
> + drm_atomic_helper_check_plane_state(e1, e2, e3, e4, 0)
> )
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
> This implements what has been discussed in the thread of the patch
> "drm: mxsfb: check framebuffer pitch":
> https://lkml.org/lkml/2020/9/8/1342
> 
> Before sending it out to all maintainers I wanted to get conformation
> if the general approach is fine.
> 
> I think in some places there should be another linebreak for the flags,
> but this is what coccinelle gives me. Not sure if I should manually fix
> those places...
> 
> --
> Stefan
> 
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  5 ++--
>  drivers/gpu/drm/arm/hdlcd_crtc.c              |  6 ++---
>  drivers/gpu/drm/arm/malidp_planes.c           |  5 ++--
>  drivers/gpu/drm/armada/armada_plane.c         |  3 ++-
>  drivers/gpu/drm/ast/ast_mode.c                |  4 +--
>  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   |  4 +--
>  drivers/gpu/drm/drm_atomic_helper.c           | 17 +++++++------
>  drivers/gpu/drm/drm_plane_helper.c            |  9 +++----
>  drivers/gpu/drm/drm_simple_kms_helper.c       |  2 +-
>  drivers/gpu/drm/i915/display/intel_display.c  |  9 ++++---
>  drivers/gpu/drm/i915/display/intel_sprite.c   |  6 ++---
>  drivers/gpu/drm/imx/ipuv3-plane.c             |  7 ++++--
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  7 ++++--
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c      |  4 +--
>  drivers/gpu/drm/meson/meson_overlay.c         |  2 +-
>  drivers/gpu/drm/meson/meson_plane.c           |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  7 +++---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |  4 +--
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c             |  2 +-
>  drivers/gpu/drm/nouveau/dispnv50/base507c.c   |  2 +-
>  drivers/gpu/drm/nouveau/dispnv50/curs507a.c   |  2 +-
>  drivers/gpu/drm/nouveau/dispnv50/ovly507e.c   |  2 +-
>  drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c   |  2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c       |  2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |  4 +--
>  .../gpu/drm/selftests/test-drm_plane_helper.c | 25 +++++++++----------
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  2 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  2 +-
>  drivers/gpu/drm/tegra/plane.c                 |  5 ++--
>  drivers/gpu/drm/tidss/tidss_plane.c           |  3 ++-
>  drivers/gpu/drm/vboxvideo/vbox_mode.c         |  4 +--
>  drivers/gpu/drm/vc4/vc4_plane.c               |  3 ++-
>  drivers/gpu/drm/virtio/virtgpu_plane.c        |  7 ++++--
>  drivers/gpu/drm/vkms/vkms_plane.c             |  8 +++---
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           |  4 +--
>  drivers/gpu/drm/xlnx/zynqmp_disp.c            |  2 +-
>  drivers/gpu/drm/zte/zx_plane.c                |  4 +--
>  include/drm/drm_atomic_helper.h               |  7 ++++--
>  38 files changed, 108 insertions(+), 87 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index fd96fafec5b8..db0256ecf1a2 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -5731,8 +5731,9 @@ static int dm_plane_helper_check_state(struct drm_plane_state *state,
>  	int max_upscale = INT_MAX;
>  
>  	/* TODO: These should be checked against DC plane caps */
> -	return drm_atomic_helper_check_plane_state(
> -		state, new_crtc_state, max_downscale, max_upscale, true, true);
> +	return drm_atomic_helper_check_plane_state(state, new_crtc_state,
> +						   max_downscale, max_upscale,
> +						   DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  }
>  
>  static int dm_plane_atomic_check(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
> index af67fefed38d..94c9a75c0c2d 100644
> --- a/drivers/gpu/drm/arm/hdlcd_crtc.c
> +++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
> @@ -247,9 +247,9 @@ static int hdlcd_plane_atomic_check(struct drm_plane *plane,
>  		if (!state->fb && crtc_state->active)
>  			return -EINVAL;
>  		return drm_atomic_helper_check_plane_state(state, crtc_state,
> -						DRM_PLANE_HELPER_NO_SCALING,
> -						DRM_PLANE_HELPER_NO_SCALING,
> -						false, true);
> +							   DRM_PLANE_HELPER_NO_SCALING,
> +							   DRM_PLANE_HELPER_NO_SCALING,
> +							   DRM_PLANE_CAN_UPDATE_DISABLED);
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
> index 351a85088d0e..c818e0a8e399 100644
> --- a/drivers/gpu/drm/arm/malidp_planes.c
> +++ b/drivers/gpu/drm/arm/malidp_planes.c
> @@ -281,8 +281,9 @@ static int malidp_se_check_scaling(struct malidp_plane *mp,
>  
>  	mc = to_malidp_crtc_state(crtc_state);
>  
> -	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
> -						  0, INT_MAX, true, true);
> +	ret = drm_atomic_helper_check_plane_state(state, crtc_state, 0,
> +						  INT_MAX,
> +						  DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/armada/armada_plane.c b/drivers/gpu/drm/armada/armada_plane.c
> index e7cc2b343bcb..0f2af0faae5a 100644
> --- a/drivers/gpu/drm/armada/armada_plane.c
> +++ b/drivers/gpu/drm/armada/armada_plane.c
> @@ -125,7 +125,8 @@ int armada_drm_plane_atomic_check(struct drm_plane *plane,
>  		crtc_state = crtc->state;
>  
>  	ret = drm_atomic_helper_check_plane_state(state, crtc_state, 0,
> -						  INT_MAX, true, false);
> +						  INT_MAX,
> +						  DRM_PLANE_CAN_POSITION);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 62fe682a7de6..5bafa1c5981f 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -539,7 +539,7 @@ static int ast_primary_plane_helper_atomic_check(struct drm_plane *plane,
>  	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  false, true);
> +						  DRM_PLANE_CAN_UPDATE_DISABLED);
>  	if (ret)
>  		return ret;
>  
> @@ -644,7 +644,7 @@ static int ast_cursor_plane_helper_atomic_check(struct drm_plane *plane,
>  	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  true, true);
> +						  DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> index 40800ec5700a..ecc0984b05d1 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> @@ -611,8 +611,8 @@ static int atmel_hlcdc_plane_atomic_check(struct drm_plane *p,
>  	mode = &crtc_state->adjusted_mode;
>  
>  	ret = drm_atomic_helper_check_plane_state(s, crtc_state,
> -						  (1 << 16) / 2048,
> -						  INT_MAX, true, true);
> +						  (1 << 16) / 2048, INT_MAX,
> +						  DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  	if (ret || !s->visible)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index f68c69a45752..755572a37f3f 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -771,11 +771,7 @@ EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
>   * @crtc_state: CRTC state to check
>   * @min_scale: minimum @src:@dest scaling factor in 16.16 fixed point
>   * @max_scale: maximum @src:@dest scaling factor in 16.16 fixed point
> - * @can_position: is it legal to position the plane such that it
> - *                doesn't cover the entire CRTC?  This will generally
> - *                only be false for primary planes.
> - * @can_update_disabled: can the plane be updated while the CRTC
> - *                       is disabled?
> + * @flags: flags for checking the plane state
>   *
>   * Checks that a desired plane update is valid, and updates various
>   * bits of derived state (clipped coordinates etc.). Drivers that provide
> @@ -783,6 +779,12 @@ EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
>   * still wish to call this function to avoid duplication of error checking
>   * code.
>   *
> + * Drivers may set the CAN_POSITION flag in @flags if the display controller
> + * can position the plane such that it doesn't cover the entire CRTC. This will
> + * generally be set for all but primary planes. The CAN_UPDATE_DISABLED flag
> + * may be set if the display controller can update the plane while the CRTC is
> + * disabled.
> + *
>   * RETURNS:
>   * Zero if update appears valid, error code on failure
>   */
> @@ -790,8 +792,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>  					const struct drm_crtc_state *crtc_state,
>  					int min_scale,
>  					int max_scale,
> -					bool can_position,
> -					bool can_update_disabled)
> +					uint32_t flags)
>  {
>  	struct drm_framebuffer *fb = plane_state->fb;
>  	struct drm_rect *src = &plane_state->src;
> @@ -799,6 +800,8 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>  	unsigned int rotation = plane_state->rotation;
>  	struct drm_rect clip = {};
>  	int hscale, vscale;
> +	bool can_position = flags & DRM_PLANE_CAN_POSITION;
> +	bool can_update_disabled = flags & DRM_PLANE_CAN_UPDATE_DISABLED;
>  
>  	WARN_ON(plane_state->crtc && plane_state->crtc != crtc_state->crtc);
>  
> diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
> index 3aae7ea522f2..1d5fd5f4da52 100644
> --- a/drivers/gpu/drm/drm_plane_helper.c
> +++ b/drivers/gpu/drm/drm_plane_helper.c
> @@ -106,8 +106,7 @@ static int drm_plane_helper_check_update(struct drm_plane *plane,
>  					 unsigned int rotation,
>  					 int min_scale,
>  					 int max_scale,
> -					 bool can_position,
> -					 bool can_update_disabled,
> +					 uint32_t flags,
>  					 bool *visible)
>  {
>  	struct drm_plane_state plane_state = {
> @@ -133,9 +132,7 @@ static int drm_plane_helper_check_update(struct drm_plane *plane,
>  	int ret;
>  
>  	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> -						  min_scale, max_scale,
> -						  can_position,
> -						  can_update_disabled);
> +						  min_scale, max_scale, flags);
>  	if (ret)
>  		return ret;
>  
> @@ -182,7 +179,7 @@ static int drm_primary_helper_update(struct drm_plane *plane, struct drm_crtc *c
>  					    DRM_MODE_ROTATE_0,
>  					    DRM_PLANE_HELPER_NO_SCALING,
>  					    DRM_PLANE_HELPER_NO_SCALING,
> -					    false, false, &visible);
> +					    0, &visible);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
> index 74946690aba4..f3ce7a0a827c 100644
> --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> @@ -178,7 +178,7 @@ static int drm_simple_kms_plane_atomic_check(struct drm_plane *plane,
>  	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  false, true);
> +						  DRM_PLANE_CAN_UPDATE_DISABLED);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 729ec6e0d43a..04b3005162f5 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -4344,17 +4344,20 @@ i9xx_plane_check(struct intel_crtc_state *crtc_state,
>  {
>  	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
>  	int ret;
> +	uint32_t flags = DRM_PLANE_CAN_UPDATE_DISABLED;
>  
>  	ret = chv_plane_check_rotation(plane_state);
>  	if (ret)
>  		return ret;
>  
> +	if (i9xx_plane_has_windowing(plane))
> +		flags |= DRM_PLANE_CAN_POSITION;
> +
>  	ret = drm_atomic_helper_check_plane_state(&plane_state->uapi,
>  						  &crtc_state->uapi,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  i9xx_plane_has_windowing(plane),
> -						  true);
> +						  flags);
>  	if (ret)
>  		return ret;
>  
> @@ -11367,7 +11370,7 @@ static int intel_check_cursor(struct intel_crtc_state *crtc_state,
>  						  &crtc_state->uapi,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  true, true);
> +						  DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
> index d03860fef2d7..4f4ba474cf46 100644
> --- a/drivers/gpu/drm/i915/display/intel_sprite.c
> +++ b/drivers/gpu/drm/i915/display/intel_sprite.c
> @@ -2013,7 +2013,7 @@ g4x_sprite_check(struct intel_crtc_state *crtc_state,
>  	ret = drm_atomic_helper_check_plane_state(&plane_state->uapi,
>  						  &crtc_state->uapi,
>  						  min_scale, max_scale,
> -						  true, true);
> +						  DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  	if (ret)
>  		return ret;
>  
> @@ -2072,7 +2072,7 @@ vlv_sprite_check(struct intel_crtc_state *crtc_state,
>  						  &crtc_state->uapi,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  true, true);
> +						  DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  	if (ret)
>  		return ret;
>  
> @@ -2282,7 +2282,7 @@ static int skl_plane_check(struct intel_crtc_state *crtc_state,
>  	ret = drm_atomic_helper_check_plane_state(&plane_state->uapi,
>  						  &crtc_state->uapi,
>  						  min_scale, max_scale,
> -						  true, true);
> +						  DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
> index 6776ebb3246d..d6e5f86c24d5 100644
> --- a/drivers/gpu/drm/imx/ipuv3-plane.c
> +++ b/drivers/gpu/drm/imx/ipuv3-plane.c
> @@ -352,7 +352,7 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
>  	struct drm_framebuffer *fb = state->fb;
>  	struct drm_framebuffer *old_fb = old_state->fb;
>  	unsigned long eba, ubo, vbo, old_ubo, old_vbo, alpha_eba;
> -	bool can_position = (plane->type == DRM_PLANE_TYPE_OVERLAY);
> +	uint32_t flags = DRM_PLANE_CAN_UPDATE_DISABLED;
>  	int ret;
>  
>  	/* Ok to disable */
> @@ -367,10 +367,13 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
>  	if (WARN_ON(!crtc_state))
>  		return -EINVAL;
>  
> +	if (plane->type == DRM_PLANE_TYPE_OVERLAY)
> +		flags |= DRM_PLANE_CAN_POSITION;
> +
>  	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  can_position, true);
> +						  flags);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 5dab9c3d0a52..d885b9e6bfee 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -298,6 +298,7 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
>  	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
>  	struct drm_crtc_state *crtc_state;
>  	struct drm_crtc *crtc = state->crtc ?: plane->state->crtc;
> +	uint32_t flags = DRM_PLANE_CAN_UPDATE_DISABLED;
>  	int ret;
>  
>  	if (!crtc)
> @@ -307,11 +308,13 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
>  	if (WARN_ON(!crtc_state))
>  		return -EINVAL;
>  
> +	if (priv->soc_info->has_osd)
> +		flags |= DRM_PLANE_CAN_POSITION;
> +
>  	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  priv->soc_info->has_osd,
> -						  true);
> +						  flags);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index 92141a19681b..cfa7551b2a66 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -105,7 +105,7 @@ static int mtk_plane_atomic_async_check(struct drm_plane *plane,
>  	return drm_atomic_helper_check_plane_state(plane->state, crtc_state,
>  						   DRM_PLANE_HELPER_NO_SCALING,
>  						   DRM_PLANE_HELPER_NO_SCALING,
> -						   true, true);
> +						   DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  }
>  
>  static void mtk_plane_atomic_async_update(struct drm_plane *plane,
> @@ -161,7 +161,7 @@ static int mtk_plane_atomic_check(struct drm_plane *plane,
>  	return drm_atomic_helper_check_plane_state(state, crtc_state,
>  						   DRM_PLANE_HELPER_NO_SCALING,
>  						   DRM_PLANE_HELPER_NO_SCALING,
> -						   true, true);
> +						   DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  }
>  
>  static void mtk_plane_atomic_disable(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
> index a8bcc70644df..91c1d86e0429 100644
> --- a/drivers/gpu/drm/meson/meson_overlay.c
> +++ b/drivers/gpu/drm/meson/meson_overlay.c
> @@ -179,7 +179,7 @@ static int meson_overlay_atomic_check(struct drm_plane *plane,
>  	return drm_atomic_helper_check_plane_state(state, crtc_state,
>  						   FRAC_16_16(1, 5),
>  						   FRAC_16_16(5, 1),
> -						   true, true);
> +						   DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  }
>  
>  /* Takes a fixed 16.16 number and converts it to integer. */
> diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
> index 35338ed18209..1d4a4d62ff53 100644
> --- a/drivers/gpu/drm/meson/meson_plane.c
> +++ b/drivers/gpu/drm/meson/meson_plane.c
> @@ -90,7 +90,7 @@ static int meson_plane_atomic_check(struct drm_plane *plane,
>  	return drm_atomic_helper_check_plane_state(state, crtc_state,
>  						   FRAC_16_16(1, 5),
>  						   DRM_PLANE_HELPER_NO_SCALING,
> -						   false, true);
> +						   DRM_PLANE_CAN_UPDATE_DISABLED);
>  }
>  
>  #define MESON_MOD_AFBC_VALID_BITS (AFBC_FORMAT_MOD_BLOCK_SIZE_16x16 |	\
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 33f6c56f01ed..bf8153361f23 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -867,9 +867,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>  							   state->crtc);
>  
>  	min_scale = FRAC_16_16(1, pdpu->pipe_sblk->maxdwnscale);
> -	ret = drm_atomic_helper_check_plane_state(state, crtc_state, min_scale,
> -					  pdpu->pipe_sblk->maxupscale << 16,
> -					  true, true);
> +	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
> +						  min_scale,
> +						  pdpu->pipe_sblk->maxupscale << 16,
> +						  DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  	if (ret) {
>  		DPU_DEBUG_PLANE(pdpu, "Check plane state failed (%d)\n", ret);
>  		return ret;
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> index 83423092de2f..c8f5d39dda29 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> @@ -300,7 +300,7 @@ static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
>  
>  	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
>  						  min_scale, max_scale,
> -						  true, true);
> +						  DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  	if (ret)
>  		return ret;
>  
> @@ -474,7 +474,7 @@ static int mdp5_plane_atomic_async_check(struct drm_plane *plane,
>  
>  	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
>  						  min_scale, max_scale,
> -						  true, true);
> +						  DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index b721b8b262ce..c24ef330718e 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -410,7 +410,7 @@ static int mxsfb_plane_atomic_check(struct drm_plane *plane,
>  	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
>  						   DRM_PLANE_HELPER_NO_SCALING,
>  						   DRM_PLANE_HELPER_NO_SCALING,
> -						   false, true);
> +						   DRM_PLANE_CAN_UPDATE_DISABLED);
>  }
>  
>  static void mxsfb_plane_primary_atomic_update(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/base507c.c b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
> index 302d4e6fc52f..bc6846c6618b 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/base507c.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
> @@ -236,7 +236,7 @@ base507c_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
>  	ret = drm_atomic_helper_check_plane_state(&asyw->state, &asyh->state,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  false, true);
> +						  DRM_PLANE_CAN_UPDATE_DISABLED);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
> index 54fbd6fe751d..dbf5a23e178d 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
> @@ -104,7 +104,7 @@ curs507a_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
>  	ret = drm_atomic_helper_check_plane_state(&asyw->state, &asyh->state,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  true, true);
> +						  DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  	asyh->curs.visible = asyw->state.visible;
>  	if (ret || !asyh->curs.visible)
>  		return ret;
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
> index afd6c7271de1..56f98e464f2f 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
> @@ -109,7 +109,7 @@ ovly507e_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
>  	ret = drm_atomic_helper_check_plane_state(&asyw->state, &asyh->state,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  true, true);
> +						  DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
> index 57df997c5ff3..b2441deb762f 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
> @@ -303,7 +303,7 @@ wndwc37e_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
>  	return drm_atomic_helper_check_plane_state(&asyw->state, &asyh->state,
>  						   DRM_PLANE_HELPER_NO_SCALING,
>  						   DRM_PLANE_HELPER_NO_SCALING,
> -						   true, true);
> +						   DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  }
>  
>  static const u32
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> index a0021fc25b27..713d4e06ce7e 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> @@ -587,7 +587,7 @@ int __rcar_du_plane_atomic_check(struct drm_plane *plane,
>  	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  true, true);
> +						  DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  	if (ret < 0)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index c80f7d9fd13f..f2c64068888e 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -800,7 +800,7 @@ static int vop_plane_atomic_check(struct drm_plane *plane,
>  
>  	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
>  						  min_scale, max_scale,
> -						  true, true);
> +						  DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  	if (ret)
>  		return ret;
>  
> @@ -1048,7 +1048,7 @@ static int vop_plane_atomic_async_check(struct drm_plane *plane,
>  
>  	return drm_atomic_helper_check_plane_state(plane->state, crtc_state,
>  						   min_scale, max_scale,
> -						   true, true);
> +						   DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  }
>  
>  static void vop_plane_atomic_async_update(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/selftests/test-drm_plane_helper.c b/drivers/gpu/drm/selftests/test-drm_plane_helper.c
> index 0a9553f51796..01e95b2d572f 100644
> --- a/drivers/gpu/drm/selftests/test-drm_plane_helper.c
> +++ b/drivers/gpu/drm/selftests/test-drm_plane_helper.c
> @@ -103,7 +103,7 @@ int igt_check_plane_state(void *ignored)
>  	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  false, false);
> +						  0);
>  	FAIL(ret < 0, "Simple clipping check should pass\n");
>  	FAIL_ON(!plane_state.visible);
>  	FAIL_ON(!check_src_eq(&plane_state, 0, 0, 1024 << 16, 768 << 16));
> @@ -114,7 +114,7 @@ int igt_check_plane_state(void *ignored)
>  	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  false, false);
> +						  0);
>  	FAIL(ret < 0, "Rotated clipping check should pass\n");
>  	FAIL_ON(!plane_state.visible);
>  	FAIL_ON(!check_src_eq(&plane_state, 0, 0, 768 << 16, 1024 << 16));
> @@ -127,13 +127,13 @@ int igt_check_plane_state(void *ignored)
>  	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  false, false);
> +						  0);
>  	FAIL(!ret, "Should not be able to position on the crtc with can_position=false\n");
>  
>  	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  true, false);
> +						  DRM_PLANE_CAN_POSITION);
>  	FAIL(ret < 0, "Simple positioning should work\n");
>  	FAIL_ON(!plane_state.visible);
>  	FAIL_ON(!check_src_eq(&plane_state, 0, 0, 1023 << 16, 767 << 16));
> @@ -145,12 +145,12 @@ int igt_check_plane_state(void *ignored)
>  	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
>  						  0x8001,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  false, false);
> +						  0);
>  	FAIL(!ret, "Upscaling out of range should fail.\n");
>  	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
>  						  0x8000,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  false, false);
> +						  0);
>  	FAIL(ret < 0, "Upscaling exactly 2x should work\n");
>  	FAIL_ON(!plane_state.visible);
>  	FAIL_ON(!check_src_eq(&plane_state, 0, 0, 512 << 16, 384 << 16));
> @@ -159,11 +159,11 @@ int igt_check_plane_state(void *ignored)
>  	set_src(&plane_state, 0, 0, 2048 << 16, 1536 << 16);
>  	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  0x1ffff, false, false);
> +						  0x1ffff, 0);
>  	FAIL(!ret, "Downscaling out of range should fail.\n");
>  	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  0x20000, false, false);
> +						  0x20000, 0);
>  	FAIL(ret < 0, "Should succeed with exact scaling limit\n");
>  	FAIL_ON(!plane_state.visible);
>  	FAIL_ON(!check_src_eq(&plane_state, 0, 0, 2048 << 16, 1536 << 16));
> @@ -175,7 +175,7 @@ int igt_check_plane_state(void *ignored)
>  	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  0x10001,
> -						  true, false);
> +						  DRM_PLANE_CAN_POSITION);
>  	FAIL(ret < 0, "Should succeed by clipping to exact multiple");
>  	FAIL_ON(!plane_state.visible);
>  	FAIL_ON(!check_src_eq(&plane_state, 0, 0, 2 << 16, 2 << 16));
> @@ -185,8 +185,7 @@ int igt_check_plane_state(void *ignored)
>  	set_crtc(&plane_state, -2, -2, 1028, 772);
>  	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  0x10001,
> -						  false, false);
> +						  0x10001, 0);
>  	FAIL(ret < 0, "Should succeed by clipping to exact multiple");
>  	FAIL_ON(!plane_state.visible);
>  	FAIL_ON(!check_src_eq(&plane_state, 0x40002, 0x40002, 1024 << 16, 768 << 16));
> @@ -197,7 +196,7 @@ int igt_check_plane_state(void *ignored)
>  	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
>  						  0xffff,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  true, false);
> +						  DRM_PLANE_CAN_POSITION);
>  	FAIL(ret < 0, "Should succeed by clipping to exact multiple");
>  	FAIL_ON(!plane_state.visible);
>  	/* Should not be rounded to 0x20001, which would be upscaling. */
> @@ -209,7 +208,7 @@ int igt_check_plane_state(void *ignored)
>  	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
>  						  0xffff,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  false, false);
> +						  0);
>  	FAIL(ret < 0, "Should succeed by clipping to exact multiple");
>  	FAIL_ON(!plane_state.visible);
>  	FAIL_ON(!check_src_eq(&plane_state, 0x3fffe, 0x3fffe, 1024 << 16, 768 << 16));
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> index 816ad4ce8996..c706b615bbe1 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -260,7 +260,7 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
>  
>  	return drm_atomic_helper_check_plane_state(state, crtc_state,
>  						   min_scale, max_scale,
> -						   true, true);
> +						   DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  }
>  
>  static void sun8i_ui_layer_atomic_disable(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> index a360697a4a4a..7490c19b0117 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -363,7 +363,7 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
>  
>  	return drm_atomic_helper_check_plane_state(state, crtc_state,
>  						   min_scale, max_scale,
> -						   true, true);
> +						   DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  }
>  
>  static void sun8i_vi_layer_atomic_disable(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
> index 4cd0461cc508..7bb0d5361900 100644
> --- a/drivers/gpu/drm/tegra/plane.c
> +++ b/drivers/gpu/drm/tegra/plane.c
> @@ -230,8 +230,9 @@ int tegra_plane_state_add(struct tegra_plane *plane,
>  		return PTR_ERR(crtc_state);
>  
>  	/* Check plane state for visibility and calculate clipping bounds */
> -	err = drm_atomic_helper_check_plane_state(state, crtc_state,
> -						  0, INT_MAX, true, true);
> +	err = drm_atomic_helper_check_plane_state(state, crtc_state, 0,
> +						  INT_MAX,
> +						  DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  	if (err < 0)
>  		return err;
>  
> diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
> index 43e72d0b2d84..9b47cdab51fd 100644
> --- a/drivers/gpu/drm/tidss/tidss_plane.c
> +++ b/drivers/gpu/drm/tidss/tidss_plane.c
> @@ -46,7 +46,8 @@ static int tidss_plane_atomic_check(struct drm_plane *plane,
>  		return PTR_ERR(crtc_state);
>  
>  	ret = drm_atomic_helper_check_plane_state(state, crtc_state, 0,
> -						  INT_MAX, true, true);
> +						  INT_MAX,
> +						  DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  	if (ret < 0)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> index d9a5af62af89..9a775cd71fe1 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> @@ -264,7 +264,7 @@ static int vbox_primary_atomic_check(struct drm_plane *plane,
>  	return drm_atomic_helper_check_plane_state(new_state, crtc_state,
>  						   DRM_PLANE_HELPER_NO_SCALING,
>  						   DRM_PLANE_HELPER_NO_SCALING,
> -						   false, true);
> +						   DRM_PLANE_CAN_UPDATE_DISABLED);
>  }
>  
>  static void vbox_primary_atomic_update(struct drm_plane *plane,
> @@ -340,7 +340,7 @@ static int vbox_cursor_atomic_check(struct drm_plane *plane,
>  	ret = drm_atomic_helper_check_plane_state(new_state, crtc_state,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  true, true);
> +						  DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
> index d040d9f12c6d..7263209bf266 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -324,7 +324,8 @@ static int vc4_plane_setup_clipping_and_scaling(struct drm_plane_state *state)
>  	}
>  
>  	ret = drm_atomic_helper_check_plane_state(state, crtc_state, 1,
> -						  INT_MAX, true, true);
> +						  INT_MAX,
> +						  DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
> index 6a311cd93440..1297c6c8bae8 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> @@ -85,7 +85,7 @@ static const struct drm_plane_funcs virtio_gpu_plane_funcs = {
>  static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
>  					 struct drm_plane_state *state)
>  {
> -	bool is_cursor = plane->type == DRM_PLANE_TYPE_CURSOR;
> +	uint32_t flags = DRM_PLANE_CAN_UPDATE_DISABLED;
>  	struct drm_crtc_state *crtc_state;
>  	int ret;
>  
> @@ -96,10 +96,13 @@ static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
>  	if (IS_ERR(crtc_state))
>                  return PTR_ERR(crtc_state);
>  
> +	if (plane->type == DRM_PLANE_TYPE_CURSOR)
> +		flags |= DRM_PLANE_CAN_POSITION;
> +
>  	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  is_cursor, true);
> +						  flags);
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 6d31265a2ab7..6fa0f9452efd 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -114,7 +114,7 @@ static int vkms_plane_atomic_check(struct drm_plane *plane,
>  				   struct drm_plane_state *state)
>  {
>  	struct drm_crtc_state *crtc_state;
> -	bool can_position = false;
> +	uint32_t flags = DRM_PLANE_CAN_UPDATE_DISABLED;
>  	int ret;
>  
>  	if (!state->fb || WARN_ON(!state->crtc))
> @@ -125,17 +125,17 @@ static int vkms_plane_atomic_check(struct drm_plane *plane,
>  		return PTR_ERR(crtc_state);
>  
>  	if (plane->type == DRM_PLANE_TYPE_CURSOR)
> -		can_position = true;
> +		flags |= DRM_PLANE_CAN_POSITION;
>  
>  	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  can_position, true);
> +						  flags);
>  	if (ret != 0)
>  		return ret;
>  
>  	/* for now primary plane must be visible and full screen */
> -	if (!state->visible && !can_position)
> +	if (!state->visible && plane->type != DRM_PLANE_TYPE_CURSOR)
>  		return -EINVAL;
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index 312ed0881a99..d58088ab44a4 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -453,7 +453,7 @@ int vmw_du_primary_plane_atomic_check(struct drm_plane *plane,
>  	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  false, true);
> +						  DRM_PLANE_CAN_UPDATE_DISABLED);
>  
>  	if (!ret && new_fb) {
>  		struct drm_crtc *crtc = state->crtc;
> @@ -494,7 +494,7 @@ int vmw_du_cursor_plane_atomic_check(struct drm_plane *plane,
>  	ret = drm_atomic_helper_check_plane_state(new_state, crtc_state,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
> -						  true, true);
> +						  DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index a455cfc1bee5..4969e2e0c874 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -1164,7 +1164,7 @@ zynqmp_disp_plane_atomic_check(struct drm_plane *plane,
>  	return drm_atomic_helper_check_plane_state(state, crtc_state,
>  						   DRM_PLANE_HELPER_NO_SCALING,
>  						   DRM_PLANE_HELPER_NO_SCALING,
> -						   false, false);
> +						   0);
>  }
>  
>  static void
> diff --git a/drivers/gpu/drm/zte/zx_plane.c b/drivers/gpu/drm/zte/zx_plane.c
> index c8f7b21fa09e..e12935ab488c 100644
> --- a/drivers/gpu/drm/zte/zx_plane.c
> +++ b/drivers/gpu/drm/zte/zx_plane.c
> @@ -72,7 +72,7 @@ static int zx_vl_plane_atomic_check(struct drm_plane *plane,
>  
>  	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
>  						   min_scale, max_scale,
> -						   true, true);
> +						   DRM_PLANE_CAN_POSITION | DRM_PLANE_CAN_UPDATE_DISABLED);
>  }
>  
>  static int zx_vl_get_fmt(uint32_t format)
> @@ -300,7 +300,7 @@ static int zx_gl_plane_atomic_check(struct drm_plane *plane,
>  	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
>  						   DRM_PLANE_HELPER_NO_SCALING,
>  						   DRM_PLANE_HELPER_NO_SCALING,
> -						   false, true);
> +						   DRM_PLANE_CAN_UPDATE_DISABLED);
>  }
>  
>  static int zx_gl_get_fmt(uint32_t format)
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> index b268180c97eb..bb9957b4f91b 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -40,12 +40,15 @@ struct drm_private_state;
>  
>  int drm_atomic_helper_check_modeset(struct drm_device *dev,
>  				struct drm_atomic_state *state);
> +
> +#define DRM_PLANE_CAN_POSITION				BIT(0)
> +#define DRM_PLANE_CAN_UPDATE_DISABLED			BIT(1)
> +
>  int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>  					const struct drm_crtc_state *crtc_state,
>  					int min_scale,
>  					int max_scale,
> -					bool can_position,
> -					bool can_update_disabled);
> +					uint32_t flags);
>  int drm_atomic_helper_check_planes(struct drm_device *dev,
>  			       struct drm_atomic_state *state);
>  int drm_atomic_helper_check(struct drm_device *dev,
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
