Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B65C22F86F7
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 21:58:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C506E499;
	Fri, 15 Jan 2021 20:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B576E47A;
 Fri, 15 Jan 2021 20:57:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F32CB58B;
 Fri, 15 Jan 2021 21:57:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610744277;
 bh=VjE+h+vZVJvv9Us4y8H19WCA00VSbF5Mv39d7q0MA9U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BV3hEMjlk7/sEuKZRq6pt0i2HuaqsH60PVECUzrsL2O1TD7ANDlEjKgpfLxpsno0J
 V+GDPEX+RT1JaaqsMkgbVNMHG6qTeG7N7mWXbGklvGmCYKw1yxb3d/evRKRLjIbvkr
 5xrKIgguJLiN4CHn4qNUfx/2EFxHOtUVq3DDfbUg=
Date: Fri, 15 Jan 2021 22:57:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 07/10] drm: Store new plane state in a variable for
 atomic_update and disable
Message-ID: <YAIBxF2kiy0twoV+@pendragon.ideasonboard.com>
References: <20210115125703.1315064-1-maxime@cerno.tech>
 <20210115125703.1315064-7-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115125703.1315064-7-maxime@cerno.tech>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Michal Simek <michal.simek@xilinx.com>,
 Melissa Wen <melissa.srw@gmail.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Chen-Yu Tsai <wens@csie.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Roland Scheidegger <sroland@vmware.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Dave Airlie <airlied@redhat.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Edmund Dea <edmund.j.dea@intel.com>,
 Hans de Goede <hdegoede@redhat.com>, linux-mediatek@lists.infradead.org,
 spice-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Thank you for the patch.

On Fri, Jan 15, 2021 at 01:56:59PM +0100, Maxime Ripard wrote:
> In order to store the new plane state in a subsequent helper, let's move
> the plane->state dereferences into a variable.
> 
> This was done using the following coccinelle script, plus some hand
> changes for vmwgfx:
> 
> @ plane_atomic_func @
> identifier helpers;
> identifier func;
> @@
> 
> (
>  static const struct drm_plane_helper_funcs helpers = {
>  	...,
>  	.atomic_disable = func,
> 	...,
>  };
> |
>  static const struct drm_plane_helper_funcs helpers = {
>  	...,
>  	.atomic_update = func,
> 	...,
>  };
> )
> 
> @ has_new_state_old_state @
> identifier plane_atomic_func.func;
> identifier plane;
> identifier new_state;
> symbol old_state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *old_state)
>  {
>  	...
>  	struct drm_plane_state *new_state = plane->state;
> 	...
>  }
> 
> @ depends on !has_new_state_old_state @
> identifier plane_atomic_func.func;
> identifier plane;
> symbol old_state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *old_state)
>  {
> +	struct drm_plane_state *new_state = plane->state;
>  	<+...
> -	plane->state
> +	new_state
> 	...+>
>  }
> 
> @ has_new_state_state @
> identifier plane_atomic_func.func;
> identifier plane;
> identifier new_state;
> symbol state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *state)
>  {
>  	...
>  	struct drm_plane_state *new_state = plane->state;
> 	...
>  }
> 
> @ depends on !has_new_state_state @
> identifier plane_atomic_func.func;
> identifier plane;
> symbol state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *state)
>  {
> +	struct drm_plane_state *new_plane_state = plane->state;
>  	<+...
> -	plane->state
> +	new_plane_state
> 	...+>
>  }
> 
> @ has_new_state_old_s @
> identifier plane_atomic_func.func;
> identifier plane;
> identifier new_state;
> symbol old_s;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *old_s)
>  {
>  	...
>  	struct drm_plane_state *new_state = plane->state;
> 	...
>  }
> 
> @ depends on !has_new_state_old_s @
> identifier plane_atomic_func.func;
> identifier plane;
> symbol old_s;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *old_s)
>  {
> +	struct drm_plane_state *new_s = plane->state;
>  	<+...
> -	plane->state
> +	new_s
> 	...+>
>  }

I may have taken this as an opportunity to align naming conventions for
variables across drivers, but that may just be me.

> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

[snip]

>  drivers/gpu/drm/omapdrm/omap_plane.c          |  5 ++-
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c       |  5 ++-
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  3 +-
>  drivers/gpu/drm/xlnx/zynqmp_disp.c            |  7 ++--

For these, with the small issue below addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[snip]

> diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
> index 1042e1147e74..de5ad69af4cb 100644
> --- a/drivers/gpu/drm/omapdrm/omap_plane.c
> +++ b/drivers/gpu/drm/omapdrm/omap_plane.c
> @@ -88,11 +88,12 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
>  static void omap_plane_atomic_disable(struct drm_plane *plane,
>  				      struct drm_plane_state *old_state)
>  {
> +	struct drm_plane_state *new_state = plane->state;
>  	struct omap_drm_private *priv = plane->dev->dev_private;
>  	struct omap_plane *omap_plane = to_omap_plane(plane);
>  
> -	plane->state->rotation = DRM_MODE_ROTATE_0;
> -	plane->state->zpos = plane->type == DRM_PLANE_TYPE_PRIMARY
> +	new_state->rotation = DRM_MODE_ROTATE_0;
> +	new_state->zpos = plane->type == DRM_PLANE_TYPE_PRIMARY
>  			   ? 0 : omap_plane->id;

Can you fix the indentation ?

>  	dispc_ovl_enable(priv->dispc, omap_plane->id, false);

[snip]

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
