Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF16C6A19E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 15:51:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8095310E4DE;
	Tue, 18 Nov 2025 14:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jtGz8jAO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F5210E4D9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 14:51:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [95.214.66.65])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 210EA1FE4;
 Tue, 18 Nov 2025 15:49:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1763477345;
 bh=vyMf0p9TJw+wLFWsPYQ/dMYQF9B968NEFdVKlRtiydg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jtGz8jAOPtGsweiG5zTo/Tz8ts/gKOeo/AUHefnbtXR+q6RvkYbk8NzmKdL3NJ/yd
 SGOM54VjEBD6joIw7fTNxWlZX7j2/Fq6kJB3ZdPaGKPdbXyOSoq92oMla50tJm6+6T
 biLwcb5kqMruq4lnmScEEGM0I8EnNQ66fUqHX6JU=
Date: Tue, 18 Nov 2025 16:50:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] drm/atomic-helper: rcar-du: Enable CRTC early on
 R-Car DU
Message-ID: <20251118145051.GB22495@pendragon.ideasonboard.com>
References: <20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org>
 <20251118-mcde-drm-regression-v2-1-4fedf10b18f6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251118-mcde-drm-regression-v2-1-4fedf10b18f6@linaro.org>
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

Hi Linus, Marek,

Thank you for the patch.

On Tue, Nov 18, 2025 at 03:36:03PM +0100, Linus Walleij wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Introduce a variant of drm_atomic_helper_commit_modeset_enables()
> which enables CRTC before encoder/bridge. This is needed on R-Car DU,
> where the CRTC provides clock to LVDS and DSI, and has to be started
> before a bridge may call .prepare , which may trigger e.g. DSI transfer.
> 
> This specifically fixes the case where ILI9881C is connected to R-Car
> DU DSI. The ILI9881C panel driver does DSI command transfer in its
> struct drm_panel_funcs .prepare function, which is currently called
> before R-Car DU rcar_du_crtc_atomic_enable() rcar_mipi_dsi_pclk_enable()
> and the DSI command transfer times out.
> 
> Fix this by restoring the enable ordering introduced in commit
> c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable
> and post-disable"), to enable CRTC early.

This will need to be tested on Gen3 and Gen4 hardware, with different
types of output in addition to DSI. Unfortunately you're catching me at
a bad time as I'm about to board a plane and won't have access to test
hardware for a month :-/ We'll need volunteers.

> Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c           | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  2 +-
>  include/drm/drm_atomic_helper.h               |  2 ++
>  3 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index d5ebe6ea0acb..f03b93c72b8f 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1692,6 +1692,30 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables);
>  
> +/**
> + * drm_atomic_helper_commit_modeset_enables_crtc_early - modeset commit to enable outputs, start CRTC early
> + * @dev: DRM device
> + * @state: atomic state object being committed
> + *
> + * This function is a variant of drm_atomic_helper_commit_modeset_enables()
> + * which enables CRTC before encoder/bridge. This is needed on R-Car DU,
> + * where the CRTC provides clock to LVDS and DSI, and has to be started
> + * before a bridge may call .prepare , which may trigger e.g. DSI transfer.
> + */
> +void
> +drm_atomic_helper_commit_modeset_enables_crtc_early(struct drm_device *dev,
> +						    struct drm_atomic_state *state)
> +{
> +	crtc_enable(dev, state);
> +
> +	encoder_bridge_pre_enable(dev, state);
> +
> +	encoder_bridge_enable(dev, state);
> +
> +	drm_atomic_helper_commit_writebacks(dev, state);
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables_crtc_early);
> +
>  /*
>   * For atomic updates which touch just a single CRTC, calculate the time of the
>   * next vblank, and inform all the fences of the deadline.
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> index 216219accfd9..b2403be4436b 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> @@ -544,7 +544,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
>  	drm_atomic_helper_commit_modeset_disables(dev, old_state);
>  	drm_atomic_helper_commit_planes(dev, old_state,
>  					DRM_PLANE_COMMIT_ACTIVE_ONLY);
> -	drm_atomic_helper_commit_modeset_enables(dev, old_state);
> +	drm_atomic_helper_commit_modeset_enables_crtc_early(dev, old_state);
>  
>  	drm_atomic_helper_commit_hw_done(old_state);
>  	drm_atomic_helper_wait_for_flip_done(dev, old_state);
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> index 53382fe93537..d7fb473db343 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -93,6 +93,8 @@ void drm_atomic_helper_commit_modeset_disables(struct drm_device *dev,
>  					       struct drm_atomic_state *state);
>  void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
>  					  struct drm_atomic_state *old_state);
> +void drm_atomic_helper_commit_modeset_enables_crtc_early(struct drm_device *dev,
> +							 struct drm_atomic_state *old_state);
>  
>  int drm_atomic_helper_prepare_planes(struct drm_device *dev,
>  				     struct drm_atomic_state *state);

-- 
Regards,

Laurent Pinchart
