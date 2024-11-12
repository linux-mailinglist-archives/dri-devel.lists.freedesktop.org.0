Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E609C4E38
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 06:29:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177EE10E572;
	Tue, 12 Nov 2024 05:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wUbmB4U0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C29F10E570
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 05:29:21 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 227E6512;
 Tue, 12 Nov 2024 06:29:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1731389348;
 bh=EN3H5ctw+W8jPZHaMp+X3x7khh5ZqkE8eDyq5RTuNf0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wUbmB4U0Uqsf6+fkgTaEWOLslDNYHUovU3MEg0jvpj2gHjv94xi5aRF2Hy1qlyu3g
 thu3RMxghSu5iNnbbLtjx1E2f+cK6jDhEHrL1x8mrIBaeOcr7kcOGewzKi/v4PmuG9
 LNSV0Y2fxoQd1OoMhUafd0IcJ8zLeL2hi0tdnH9w=
Date: Tue, 12 Nov 2024 07:29:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 2/2] drm/bridge: tc358767: Improve DPI output pixel
 clock accuracy
Message-ID: <20241112052911.GA5877@pendragon.ideasonboard.com>
References: <20241112020737.335297-1-marex@denx.de>
 <20241112020737.335297-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241112020737.335297-2-marex@denx.de>
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

Hi Marek,

Thank you for the patch.

On Tue, Nov 12, 2024 at 03:05:37AM +0100, Marek Vasut wrote:
> The Pixel PLL is not very capable and may come up with wildly inaccurate
> clock. Since DPI panels are often tolerant to slightly higher pixel clock
> without being operated outside of specification, calculate two Pixel PLL
> from either mode clock or display_timing .pixelclock.max , whichever is
> higher.

Maybe this is a leftover from v1 in the commit message, but I don't
think the code computes two pixel PLL.

> Since the Pixel PLL output clock frequency calculation always
> returns lower frequency than the requested clock frequency, passing in
> the higher clock frequency should result in output clock frequency which
> is closer to the expected pixel clock.

Is that guaranteed ?

> For the Chefree CH101 panel with 13 MHz Xtal input clock, the frequency
> without this patch is 65 MHz which is out of the panel specification of
> 68.9..73.4 MHz, while with this patch it is 71.5 MHz which is well within
> the specification and far more accurate.

I'm a bit concerned that this patch is quite a bit of a hack, but fixing
the problem correctly would be too much yak shaving :-S

> 
> Keep the change isolated to DPI output.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> ---
> V2: - Isolate the change to DPI only, split tc_bridge_mode_set()
>     - Look up display_timings and use .pixelclock.max as input
>       into the PLL calculation if available. That should yield
>       more accurate results for DPI panels.
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 47 +++++++++++++++++++++++++------
>  1 file changed, 39 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 0d523322fdd8e..fe9ab06d82d91 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -39,6 +39,8 @@
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
>  
> +#include <video/display_timing.h>
> +
>  /* Registers */
>  
>  /* DSI D-PHY Layer registers */
> @@ -1681,13 +1683,33 @@ static int tc_dpi_atomic_check(struct drm_bridge *bridge,
>  			       struct drm_crtc_state *crtc_state,
>  			       struct drm_connector_state *conn_state)
>  {
> +	u32 mode_clock = crtc_state->mode.clock * 1000;
>  	struct tc_data *tc = bridge_to_tc(bridge);
> -	int adjusted_clock = 0;
> +	struct drm_bridge *nb = bridge;
> +	struct display_timing timings;
> +	struct drm_panel *panel;
> +	int adjusted_clock;
>  	int ret;
>  
> +	do {
> +		if (!drm_bridge_is_panel(nb))

drm_bridge_get_panel() already checks if the bridge is related to a
panel, so I think you can drop this check.

> +			continue;
> +
> +		panel = drm_bridge_get_panel(nb);
> +		if (!panel || !panel->funcs || !panel->funcs->get_timings)
> +			continue;
> +
> +		ret = panel->funcs->get_timings(panel, 1, &timings);
> +		if (ret <= 0)
> +			break;
> +
> +		if (timings.pixelclock.max > mode_clock)
> +			mode_clock = timings.pixelclock.max;
> +		break;
> +	} while ((nb = drm_bridge_get_next_bridge(nb)));

Can the panel be anything that the last bridge in the chain ?

> +
>  	ret = tc_pxl_pll_calc(tc, clk_get_rate(tc->refclk),
> -			      crtc_state->mode.clock * 1000,
> -			      &adjusted_clock, NULL);
> +			      mode_clock, &adjusted_clock, NULL);
>  	if (ret)
>  		return ret;
>  
> @@ -1758,9 +1780,18 @@ tc_edp_mode_valid(struct drm_bridge *bridge,
>  	return MODE_OK;
>  }
>  
> -static void tc_bridge_mode_set(struct drm_bridge *bridge,
> -			       const struct drm_display_mode *mode,
> -			       const struct drm_display_mode *adj)
> +static void tc_dpi_bridge_mode_set(struct drm_bridge *bridge,
> +				   const struct drm_display_mode *mode,
> +				   const struct drm_display_mode *adj)
> +{
> +	struct tc_data *tc = bridge_to_tc(bridge);
> +
> +	drm_mode_copy(&tc->mode, adj);
> +}
> +
> +static void tc_edp_bridge_mode_set(struct drm_bridge *bridge,
> +				   const struct drm_display_mode *mode,
> +				   const struct drm_display_mode *adj)
>  {
>  	struct tc_data *tc = bridge_to_tc(bridge);
>  
> @@ -1977,7 +2008,7 @@ tc_edp_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>  static const struct drm_bridge_funcs tc_dpi_bridge_funcs = {
>  	.attach = tc_dpi_bridge_attach,
>  	.mode_valid = tc_dpi_mode_valid,
> -	.mode_set = tc_bridge_mode_set,
> +	.mode_set = tc_dpi_bridge_mode_set,
>  	.atomic_check = tc_dpi_atomic_check,
>  	.atomic_enable = tc_dpi_bridge_atomic_enable,
>  	.atomic_disable = tc_dpi_bridge_atomic_disable,
> @@ -1991,7 +2022,7 @@ static const struct drm_bridge_funcs tc_edp_bridge_funcs = {
>  	.attach = tc_edp_bridge_attach,
>  	.detach = tc_edp_bridge_detach,
>  	.mode_valid = tc_edp_mode_valid,
> -	.mode_set = tc_bridge_mode_set,
> +	.mode_set = tc_edp_bridge_mode_set,
>  	.atomic_check = tc_edp_atomic_check,
>  	.atomic_enable = tc_edp_bridge_atomic_enable,
>  	.atomic_disable = tc_edp_bridge_atomic_disable,

-- 
Regards,

Laurent Pinchart
