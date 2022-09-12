Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A525B5894
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 12:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A170D10E37F;
	Mon, 12 Sep 2022 10:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAC610E37F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 10:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662979256; x=1694515256;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xvZUSVtkt8NC7DmHmTz7x9gz0jguSGru5KDUJa1jfIA=;
 b=Moi4Tw/SPlNESpNb/vOieDGgYlh9quendheTH2phweTNqKJ044hUCDpN
 pX0EPDDwW7yW4YDjGBj9cD3vqFLVt3D2ndDiZTUXUAfvUPg9gzDz76pX+
 iunKgCFFXcv5rpbFcFldilJsVBBTsdz0F3WubPROtJ0UuORvQb4tj1hDi
 E5mw0LE4E5zPyv/niIEUsbZZg65O7lcR0GdrBwCU9c+bR7YNvBivYtnKw
 FyYPPOu6ZjXB0z9BDPfYyebVCk9tUcA0aODFPzQkbejjpiPc31Wp0gghx
 ZyX4J/fQITcFZjn8v2sNhFXacPjyT7WEYzJ5+aMoNOdI2CViElF3ExTId A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="295418412"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="295418412"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 03:40:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="616005410"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga002.jf.intel.com with SMTP; 12 Sep 2022 03:40:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 12 Sep 2022 13:40:51 +0300
Date: Mon, 12 Sep 2022 13:40:51 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] drm/plane-helper: Add a drm_plane_helper_atomic_check()
 helper
Message-ID: <Yx8Ms2jhgwpiDqA6@intel.com>
References: <20220912101522.69482-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220912101522.69482-1-javierm@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 12, 2022 at 12:15:22PM +0200, Javier Martinez Canillas wrote:
> Provides a default plane state check handler for primary planes that are a
> fullscreen scanout buffer and whose state scale and position can't change.
> 
> There are some drivers that duplicate this logic in their helpers, such as
> simpledrm and ssd130x. Factor out this common code into a plane helper and
> make drivers use it.
> 
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
>  drivers/gpu/drm/drm_plane_helper.c | 29 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/solomon/ssd130x.c  | 18 +-----------------
>  drivers/gpu/drm/tiny/simpledrm.c   | 25 +------------------------
>  include/drm/drm_plane_helper.h     |  2 ++
>  4 files changed, 33 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
> index c7785967f5bf..fb41eee74693 100644
> --- a/drivers/gpu/drm/drm_plane_helper.c
> +++ b/drivers/gpu/drm/drm_plane_helper.c
> @@ -278,3 +278,32 @@ void drm_plane_helper_destroy(struct drm_plane *plane)
>  	kfree(plane);
>  }
>  EXPORT_SYMBOL(drm_plane_helper_destroy);
> +
> +/**
> + * drm_plane_helper_atomic_check() - Helper to check primary planes states
> + * @plane: plane to check
> + * @new_state: plane state to check

That is not a plane state. Also should s/new_// since it's just
the overall atomic state thing rather than some new or old state.

> + *
> + * Provides a default plane state check handler for primary planes whose atomic
> + * state scale and position is not expected to change because the primary plane
> + * is always a fullscreen scanout buffer.
> + *
> + * RETURNS:
> + * Zero on success, or an errno code otherwise.
> + */
> +int drm_plane_helper_atomic_check(struct drm_plane *plane,
> +				  struct drm_atomic_state *new_state)
> +{
> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
> +	struct drm_crtc *new_crtc = new_plane_state->crtc;
> +	struct drm_crtc_state *new_crtc_state = NULL;
> +
> +	if (new_crtc)
> +		new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_crtc);
> +
> +	return drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
> +						   DRM_PLANE_NO_SCALING,
> +						   DRM_PLANE_NO_SCALING,
> +						   false, false);
> +}
> +EXPORT_SYMBOL(drm_plane_helper_atomic_check);
> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
> index 79e8e2017c68..28cf9c87f86d 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -565,22 +565,6 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_m
>  	return ret;
>  }
>  
> -static int ssd130x_primary_plane_helper_atomic_check(struct drm_plane *plane,
> -						     struct drm_atomic_state *new_state)
> -{
> -	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
> -	struct drm_crtc *new_crtc = new_plane_state->crtc;
> -	struct drm_crtc_state *new_crtc_state = NULL;
> -
> -	if (new_crtc)
> -		new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_crtc);
> -
> -	return drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
> -						   DRM_PLANE_NO_SCALING,
> -						   DRM_PLANE_NO_SCALING,
> -						   false, false);
> -}
> -
>  static void ssd130x_primary_plane_helper_atomic_update(struct drm_plane *plane,
>  						       struct drm_atomic_state *old_state)
>  {
> @@ -623,7 +607,7 @@ static void ssd130x_primary_plane_helper_atomic_disable(struct drm_plane *plane,
>  
>  static const struct drm_plane_helper_funcs ssd130x_primary_plane_helper_funcs = {
>  	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> -	.atomic_check = ssd130x_primary_plane_helper_atomic_check,
> +	.atomic_check = drm_plane_helper_atomic_check,
>  	.atomic_update = ssd130x_primary_plane_helper_atomic_update,
>  	.atomic_disable = ssd130x_primary_plane_helper_atomic_disable,
>  };
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
> index 777ccd250871..ea5b3239a659 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -469,29 +469,6 @@ static const uint64_t simpledrm_primary_plane_format_modifiers[] = {
>  	DRM_FORMAT_MOD_INVALID
>  };
>  
> -static int simpledrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
> -						       struct drm_atomic_state *new_state)
> -{
> -	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
> -	struct drm_crtc *new_crtc = new_plane_state->crtc;
> -	struct drm_crtc_state *new_crtc_state = NULL;
> -	int ret;
> -
> -	if (new_crtc)
> -		new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_crtc);
> -
> -	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
> -						  DRM_PLANE_NO_SCALING,
> -						  DRM_PLANE_NO_SCALING,
> -						  false, false);
> -	if (ret)
> -		return ret;
> -	else if (!new_plane_state->visible)
> -		return 0;
> -
> -	return 0;
> -}
> -
>  static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
>  							 struct drm_atomic_state *old_state)
>  {
> @@ -543,7 +520,7 @@ static void simpledrm_primary_plane_helper_atomic_disable(struct drm_plane *plan
>  
>  static const struct drm_plane_helper_funcs simpledrm_primary_plane_helper_funcs = {
>  	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> -	.atomic_check = simpledrm_primary_plane_helper_atomic_check,
> +	.atomic_check = drm_plane_helper_atomic_check,
>  	.atomic_update = simpledrm_primary_plane_helper_atomic_update,
>  	.atomic_disable = simpledrm_primary_plane_helper_atomic_disable,
>  };
> diff --git a/include/drm/drm_plane_helper.h b/include/drm/drm_plane_helper.h
> index 1781fab24dd6..7ba414655d69 100644
> --- a/include/drm/drm_plane_helper.h
> +++ b/include/drm/drm_plane_helper.h
> @@ -41,5 +41,7 @@ int drm_plane_helper_update_primary(struct drm_plane *plane, struct drm_crtc *cr
>  int drm_plane_helper_disable_primary(struct drm_plane *plane,
>  				     struct drm_modeset_acquire_ctx *ctx);
>  void drm_plane_helper_destroy(struct drm_plane *plane);
> +int drm_plane_helper_atomic_check(struct drm_plane *plane,
> +				  struct drm_atomic_state *new_state);
>  
>  #endif
> -- 
> 2.37.1

-- 
Ville Syrjälä
Intel
