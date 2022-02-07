Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 361604ACBD0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 23:05:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E080310E255;
	Mon,  7 Feb 2022 22:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBCD10E255
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 22:05:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B22D499;
 Mon,  7 Feb 2022 23:05:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1644271550;
 bh=tW9q9g69CXOS6X66C07+I/Jek9gx1lUfNc6/1P6Br7o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hlBtGWg7RfR/3NR3ywyG8n8lddfxgSgM+9b8fZZ7cI8bAAAWyTqtpMnDWNbbpEZZj
 HmqQQsHtveX/ou4m70m0jR/1eydQq2ojqYS55GSjA4O7o4AK0XZFaeT67d/Hc/78ul
 clsgbCwWK9BaWVtFOmnd76OlSnezB4PqKKS3F81Q=
Date: Tue, 8 Feb 2022 00:05:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 07/23] drm/object: Add default zpos value at reset
Message-ID: <YgGXvCSWKXocAAse@pendragon.ideasonboard.com>
References: <20220207163515.1038648-1-maxime@cerno.tech>
 <20220207163515.1038648-8-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220207163515.1038648-8-maxime@cerno.tech>
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
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime and Dave,

Thank you for the patch.

On Mon, Feb 07, 2022 at 05:34:59PM +0100, Maxime Ripard wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> The drm_plane_create_zpos_property() function asks for an initial value,
> and will set the associated plane state variable with that value if a
> state is present.
> 
> However, that function is usually called at a time where there's no
> state yet. Since the drm_plane_state reset helper doesn't take care of
> reading that value when it's called, it means that in most cases the
> initial value will be 0, or the drivers will have to work around it.
> 
> Let's add some code in __drm_atomic_helper_plane_state_reset() to get
> the initial zpos value if the property has been attached in order to fix
> this.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Looks reasonable.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index ddcf5c2c8e6a..1412cee404ca 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -243,11 +243,22 @@ EXPORT_SYMBOL(drm_atomic_helper_crtc_destroy_state);
>  void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
>  					   struct drm_plane *plane)
>  {
> +	u64 val;
> +
>  	plane_state->plane = plane;
>  	plane_state->rotation = DRM_MODE_ROTATE_0;
>  
>  	plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
>  	plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
> +
> +	if (plane->zpos_property) {
> +		if (!drm_object_property_get_default_value(&plane->base,
> +							   plane->zpos_property,
> +							   &val)) {
> +			plane_state->zpos = val;
> +			plane_state->normalized_zpos = val;
> +		}
> +	}
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_plane_state_reset);
>  

-- 
Regards,

Laurent Pinchart
