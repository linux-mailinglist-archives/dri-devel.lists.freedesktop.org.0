Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B702E4AEB18
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 08:33:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872CE10E38F;
	Wed,  9 Feb 2022 07:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB1110E38F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 07:33:05 +0000 (UTC)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi
 [91.156.85.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EFC2393;
 Wed,  9 Feb 2022 08:33:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1644391983;
 bh=o3UQSb7ttWdgg2eQaFijw6jTZjJsbnGqgRrtULINB6k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Lm3zp5TasVn1VJIlHbR306ld3K91M24XcRP53uq/wm+Xvf6OqT0iKtsTOndKbeMTt
 L9SJitwb8aQAh9uRLEvl5tYurInUSH4t63adxCQ7RzBQW4lqxmsVJVZ/i8XSp/SRMN
 6fou5oc4NCgCp4Qx3+YUr0Mk8JEGUg8DVJpvzJVU=
Message-ID: <fa147802-d53e-7018-ca9f-0791e049af00@ideasonboard.com>
Date: Wed, 9 Feb 2022 09:33:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 14/23] drm/omap: plane: Fix zpos initial value mismatch
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20220207163515.1038648-1-maxime@cerno.tech>
 <20220207163515.1038648-15-maxime@cerno.tech>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220207163515.1038648-15-maxime@cerno.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/02/2022 18:35, Maxime Ripard wrote:
> While the omap_plane_init() function calls
> drm_plane_create_zpos_property() with an initial value of 0,
> omap_plane_reset() will force it to another value depending on the plane
> type.
> 
> Fix the discrepancy by setting the initial zpos value to the same value
> in the drm_plane_create_zpos_property() call.
> 
> Cc: Tomi Valkeinen <tomba@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/gpu/drm/omapdrm/omap_plane.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
> index b35205c4e979..e67baf9a942c 100644
> --- a/drivers/gpu/drm/omapdrm/omap_plane.c
> +++ b/drivers/gpu/drm/omapdrm/omap_plane.c
> @@ -533,6 +533,7 @@ struct drm_plane *omap_plane_init(struct drm_device *dev,
>   	unsigned int num_planes = dispc_get_num_ovls(priv->dispc);
>   	struct drm_plane *plane;
>   	struct omap_plane *omap_plane;
> +	unsigned int zpos;
>   	int ret;
>   	u32 nformats;
>   	const u32 *formats;
> @@ -564,7 +565,16 @@ struct drm_plane *omap_plane_init(struct drm_device *dev,
>   	drm_plane_helper_add(plane, &omap_plane_helper_funcs);
>   
>   	omap_plane_install_properties(plane, &plane->base);
> -	drm_plane_create_zpos_property(plane, 0, 0, num_planes - 1);
> +
> +	/*
> +	 * Set the zpos default depending on whether we are a primary or overlay
> +	 * plane.
> +	 */
> +	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
> +		zpos = 0;
> +	else
> +		zpos = omap_plane->id;
> +	drm_plane_create_zpos_property(plane, zpos, 0, num_planes - 1);
>   	drm_plane_create_alpha_property(plane);
>   	drm_plane_create_blend_mode_property(plane, BIT(DRM_MODE_BLEND_PREMULTI) |
>   					     BIT(DRM_MODE_BLEND_COVERAGE));

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi
