Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C76C82F878B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 22:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C766E4A5;
	Fri, 15 Jan 2021 21:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA79C6E49B;
 Fri, 15 Jan 2021 21:20:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6241F58B;
 Fri, 15 Jan 2021 22:20:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610745638;
 bh=gBrtw5MNkdCbuPvi2cTqhl5za5Pqp/q6zVdWl/a94uc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DpGlh+3zv26rFKiVKPMFcYE9SIJo78wTzt+f/qWBARm/BpkTmg6EAErEFPBPbbPhX
 fh5IdmlIWmtQSiBr7ktLcqDESDp5TwoTZAovDL33H8Kodwu6i7gIW5IBgS4KdC5rwv
 RKLhIq/ekLRDmOepJkHy4FhmHBsfknCCplWClCys=
Date: Fri, 15 Jan 2021 23:20:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 10/10] drm: Use state helper instead of the plane state
 pointer
Message-ID: <YAIHFTYiry6ebUsY@pendragon.ideasonboard.com>
References: <20210115125703.1315064-1-maxime@cerno.tech>
 <20210115125703.1315064-10-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115125703.1315064-10-maxime@cerno.tech>
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, dri-devel@lists.freedesktop.org,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Vincent Abriou <vincent.abriou@st.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, spice-devel@lists.freedesktop.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Roland Scheidegger <sroland@vmware.com>,
 Sean Paul <sean@poorly.run>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 freedreno@lists.freedesktop.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Airlie <airlied@linux.ie>, Edmund Dea <edmund.j.dea@intel.com>,
 virtualization@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Dave Airlie <airlied@redhat.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Melissa Wen <melissa.srw@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Chen Feng <puck.chen@hisilicon.com>,
 Alison Wang <alison.wang@nxp.com>, Tomi Valkeinen <tomba@kernel.org>,
 Philippe Cornu <philippe.cornu@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Paul Cercueil <paul@crapouillou.net>,
 Marek Vasut <marex@denx.de>, linux-renesas-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, Russell King <linux@armlinux.org.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>, Hans de Goede <hdegoede@redhat.com>,
 linux-mediatek@lists.infradead.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Jyri Sarha <jyri.sarha@iki.fi>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Thank you for the patch.

On Fri, Jan 15, 2021 at 01:57:02PM +0100, Maxime Ripard wrote:
> Many drivers reference the plane->state pointer in order to get the
> current plane state in their atomic_update or atomic_disable hooks,

Please don't use the word "current", it's ambiguous. Do you mean old
state or new state ?

> which would be the new plane state in the global atomic state since
> _swap_state happened when those hooks are run.

Is this relevant ? drm_atomic_helper_swap_state() doesn't change the
old_state and new_state pointers in drm_atomic_state as far as I can
tell.

> Use the drm_atomic_get_new_plane_state helper to get that state to make it
> more obvious.
> 
> This was made using the coccinelle script below:
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
> @ adds_new_state @
> identifier plane_atomic_func.func;
> identifier plane, state;
> identifier new_state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_atomic_state *state)
>  {
>  	...
> -	struct drm_plane_state *new_state = plane->state;
> +	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
> 	...
>  }
> 
> @ include depends on adds_new_state @
> @@
> 
>  #include <drm/drm_atomic.h>
> 
> @ no_include depends on !include && adds_new_state @
> @@
> 
> + #include <drm/drm_atomic.h>
>   #include <drm/...>
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

[snip]

>  drivers/gpu/drm/omapdrm/omap_plane.c            | 6 ++++--
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c         | 3 ++-
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c           | 3 ++-
>  drivers/gpu/drm/xlnx/zynqmp_disp.c              | 3 ++-

[snip]

> diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
> index cd8cf7c786b5..021a94de84a1 100644
> --- a/drivers/gpu/drm/omapdrm/omap_plane.c
> +++ b/drivers/gpu/drm/omapdrm/omap_plane.c
> @@ -44,7 +44,8 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
>  {
>  	struct omap_drm_private *priv = plane->dev->dev_private;
>  	struct omap_plane *omap_plane = to_omap_plane(plane);
> -	struct drm_plane_state *new_state = plane->state;

This seems to imply that you're interested in the new state.

> +	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
> +									   plane);

Does this really make things more obvious ?

>  	struct omap_overlay_info info;
>  	int ret;
>  
> @@ -89,7 +90,8 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
>  static void omap_plane_atomic_disable(struct drm_plane *plane,
>  				      struct drm_atomic_state *state)
>  {
> -	struct drm_plane_state *new_state = plane->state;
> +	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
> +									   plane);
>  	struct omap_drm_private *priv = plane->dev->dev_private;
>  	struct omap_plane *omap_plane = to_omap_plane(plane);
>  

[snip]

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
