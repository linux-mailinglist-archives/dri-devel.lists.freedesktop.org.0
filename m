Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F91B8ABF06
	for <lists+dri-devel@lfdr.de>; Sun, 21 Apr 2024 13:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF4E10EFD3;
	Sun, 21 Apr 2024 11:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=xff.cz header.i=@xff.cz header.b="jV1XzPuB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C537F10EFD3
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Apr 2024 11:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1713697745; bh=XlRL3xJ9G/Em9+ZaN+XKFEEbHosMAvkd/LI3ZBJQGKE=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=jV1XzPuBL2kSOtJ8S9bSgiRYNthIY1kuRtQVbC06emHwZNA5Ny47FMUpTuvMp6z5f
 oqTJHnZOdRHYokk5S2qCz8YGEems+/XxwRML/K67RpMYne55gcaGLXTucoX6TN6c2Q
 CG+18FhkpddKlbja8yw2Hs5bbTqzrmi28RWQQD8A=
Date: Sun, 21 Apr 2024 13:09:04 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH] drm: bridge: dw-mipi-dsi: Call modeset in modeset
 callback
Message-ID: <t3dkuckbko5lmkfezhdtcwrynnbcs4yfn5mtmdyirnktellc5a@ktab3j6rvf3u>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
 Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20240421002330.172723-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240421002330.172723-1-marex@denx.de>
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

Hi,

On Sun, Apr 21, 2024 at 02:22:35AM GMT, Marek Vasut wrote:
> Doing modeset in .atomic_pre_enable callback instead of dedicated .mode_set
> callback does not seem right. Undo this change, which was added as part of

Actually no. If anything, mode_set callback should be dropped entirely:

See https://elixir.bootlin.com/linux/latest/source/include/drm/drm_bridge.h#L231

It's deprecated, and enable callback should just use adjusted_mode:

    This is deprecated, do not use! New drivers shall set their mode in the
    &drm_bridge_funcs.atomic_enable operation.

> commit 05aa61334592 ("drm: bridge: dw-mipi-dsi: Fix enable/disable of DSI
> controller") as it breaks STM32MP15xx LTDC scanout (DSI)->TC358762 DSI-to-DPI
> bridge->PT800480 DPI panel pipeline. The original fix for HX8394 panel likely
> requires HX8394 panel side fix instead.

There's nothing wrong with the panel driver. And that commit is not fixing issue
with the panel driver, just like the subject hints at. Look at the referenced
commit, at "Before:" sequence specifically.

dw_mipi_dsi_mode_set may be named *_mode_set or whatever, but it's basically
an enable function that turns on clocks, initalizes phy, etc. etc.

https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L998

And if you check "Before:" sequence, you'll see that .mode_set callback is just
called once at boot and never again. And it's atomic(_pre)_enable/atomic(_post)_disable
callbacks that actually are called in ballanced way to enable/disable the
controller repeatedly ever after.

Function dw_mipi_dsi_bridge_post_atomic_disable is the inverse of
dw_mipi_dsi_mode_set, it undoes everything that dw_mipi_dsi_mode_set does.

You need to find root cause for your issue on STM32MP15xx instead of reverting
fixes for resource use bugs in this driver.

kind regards,
	o.

> Fixes: 05aa61334592 ("drm: bridge: dw-mipi-dsi: Fix enable/disable of DSI controller")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Ondrej Jirman <megi@xff.cz>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index 824fb3c65742e..ca5894393dba4 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -268,7 +268,6 @@ struct dw_mipi_dsi {
>  	struct dw_mipi_dsi *master; /* dual-dsi master ptr */
>  	struct dw_mipi_dsi *slave; /* dual-dsi slave ptr */
>  
> -	struct drm_display_mode mode;
>  	const struct dw_mipi_dsi_plat_data *plat_data;
>  };
>  
> @@ -1016,25 +1015,15 @@ static void dw_mipi_dsi_mode_set(struct dw_mipi_dsi *dsi,
>  		phy_ops->power_on(dsi->plat_data->priv_data);
>  }
>  
> -static void dw_mipi_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> -						 struct drm_bridge_state *old_bridge_state)
> -{
> -	struct dw_mipi_dsi *dsi = bridge_to_dsi(bridge);
> -
> -	/* Power up the dsi ctl into a command mode */
> -	dw_mipi_dsi_mode_set(dsi, &dsi->mode);
> -	if (dsi->slave)
> -		dw_mipi_dsi_mode_set(dsi->slave, &dsi->mode);
> -}
> -
>  static void dw_mipi_dsi_bridge_mode_set(struct drm_bridge *bridge,
>  					const struct drm_display_mode *mode,
>  					const struct drm_display_mode *adjusted_mode)
>  {
>  	struct dw_mipi_dsi *dsi = bridge_to_dsi(bridge);
>  
> -	/* Store the display mode for later use in pre_enable callback */
> -	drm_mode_copy(&dsi->mode, adjusted_mode);
> +	dw_mipi_dsi_mode_set(dsi, adjusted_mode);
> +	if (dsi->slave)
> +		dw_mipi_dsi_mode_set(dsi->slave, adjusted_mode);
>  }
>  
>  static void dw_mipi_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
> @@ -1090,7 +1079,6 @@ static const struct drm_bridge_funcs dw_mipi_dsi_bridge_funcs = {
>  	.atomic_get_input_bus_fmts = dw_mipi_dsi_bridge_atomic_get_input_bus_fmts,
>  	.atomic_check		= dw_mipi_dsi_bridge_atomic_check,
>  	.atomic_reset		= drm_atomic_helper_bridge_reset,
> -	.atomic_pre_enable	= dw_mipi_dsi_bridge_atomic_pre_enable,
>  	.atomic_enable		= dw_mipi_dsi_bridge_atomic_enable,
>  	.atomic_post_disable	= dw_mipi_dsi_bridge_post_atomic_disable,
>  	.mode_set		= dw_mipi_dsi_bridge_mode_set,
> -- 
> 2.43.0
> 
