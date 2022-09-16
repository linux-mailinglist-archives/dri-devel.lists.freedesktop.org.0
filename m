Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 732445BAC40
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 13:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63CAF10EC16;
	Fri, 16 Sep 2022 11:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E3F10EBE9;
 Fri, 16 Sep 2022 11:22:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [89.101.193.71])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4184247C;
 Fri, 16 Sep 2022 13:22:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1663327372;
 bh=fwR7dPLNJYegHMvXUf4xQC4g3qZ+0kL4WG4Spxq5o5Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RaWh1Is+nwRIz/IdcJqIxDCdvq55bS7jnxKZwhWWy+lp596ivmvEfegSHeo7R1GqR
 rMJCRIe/4bNstI0KJ8c8wuhkzlziJJ7q/ND1n88/2m38qv0D0L/pAeJxa6tHsJFdj3
 ji6QKqWu7HhWlyKSs8q+jkejQfIL+XDZ9O0b0M0s=
Date: Fri, 16 Sep 2022 14:22:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/4] drm/plane-helper: Provide DRM_PLANE_NON_ATOMIC_FUNCS
 initializer macro
Message-ID: <YyRceTY7YxafwF7L@pendragon.ideasonboard.com>
References: <20220909105947.6487-1-tzimmermann@suse.de>
 <20220909105947.6487-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220909105947.6487-5-tzimmermann@suse.de>
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
Cc: tomba@kernel.org, kherbst@redhat.com, airlied@linux.ie, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, bskeggs@redhat.com,
 nouveau@lists.freedesktop.org, jyri.sarha@iki.fi
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Thank you for the patch.

On Fri, Sep 09, 2022 at 12:59:47PM +0200, Thomas Zimmermann wrote:
> Provide DRM_PLANE_NON_ATOMIC_FUNCS, which initializes plane functions
> of non-atomic drivers to default values. The macro is not supposed to
> be used in new code, but helps with documenting and finding existing
> users.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_modeset_helper.c    |  4 +---
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c |  4 +---
>  include/drm/drm_plane_helper.h          | 12 ++++++++++++
>  3 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
> index 38040eebfa16..f858dfedf2cf 100644
> --- a/drivers/gpu/drm/drm_modeset_helper.c
> +++ b/drivers/gpu/drm/drm_modeset_helper.c
> @@ -108,9 +108,7 @@ static const uint32_t safe_modeset_formats[] = {
>  };
>  
>  static const struct drm_plane_funcs primary_plane_funcs = {
> -	.update_plane = drm_plane_helper_update_primary,
> -	.disable_plane = drm_plane_helper_disable_primary,
> -	.destroy = drm_plane_helper_destroy,
> +	DRM_PLANE_NON_ATOMIC_FUNCS,
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> index 6b8a014b5e97..ee92d576d277 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> @@ -1276,9 +1276,7 @@ static const uint32_t modeset_formats[] = {
>  };
>  
>  static const struct drm_plane_funcs nv04_primary_plane_funcs = {
> -	.update_plane = drm_plane_helper_update_primary,
> -	.disable_plane = drm_plane_helper_disable_primary,
> -	.destroy = drm_plane_helper_destroy,
> +	DRM_PLANE_NON_ATOMIC_FUNCS,
>  };
>  
>  static int nv04_crtc_vblank_handler(struct nvif_notify *notify)
> diff --git a/include/drm/drm_plane_helper.h b/include/drm/drm_plane_helper.h
> index 1781fab24dd6..75f9c4830564 100644
> --- a/include/drm/drm_plane_helper.h
> +++ b/include/drm/drm_plane_helper.h
> @@ -42,4 +42,16 @@ int drm_plane_helper_disable_primary(struct drm_plane *plane,
>  				     struct drm_modeset_acquire_ctx *ctx);
>  void drm_plane_helper_destroy(struct drm_plane *plane);
>  
> +/**
> + * DRM_PLANE_NON_ATOMIC_FUNCS - Default plane functions for non-atomic drivers
> + *
> + * This macro initializes plane functions for non-atomic drivers to default
> + * values. Non-atomic interfaces are deprecated and should not be used in new
> + * drivers.

I wonder if we could teach checkpath.pl to catch new users.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> + */
> +#define DRM_PLANE_NON_ATOMIC_FUNCS \
> +	.update_plane = drm_plane_helper_update_primary, \
> +	.disable_plane = drm_plane_helper_disable_primary, \
> +	.destroy = drm_plane_helper_destroy
> +
>  #endif

-- 
Regards,

Laurent Pinchart
