Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CCD3AE916
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 14:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620B989FC8;
	Mon, 21 Jun 2021 12:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735F089FC8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 12:30:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61E0B21A4;
 Mon, 21 Jun 2021 14:30:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624278645;
 bh=mhytmudEVSKLIN6PcacXPcOzqxtrDlHXCQzrQAXWxeE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o5DdlrbCKKR2Eou9cupXA86i8szATwT6A5yuV+j+0uUDQk8OPMOcc8SHwigaHlZZa
 +oB8olF3RSMvxgSoiPDArTq1pGhVNUHYQSX3RIXNfF9AGEkUdzzRN1O0uT4GC/rOF5
 RzkD4x4FbU4mkL+yUhrPVhN+Oc141ogDYMCm8c2s=
Date: Mon, 21 Jun 2021 15:30:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Replace connector format
 patching with atomic_get_input_bus_fmts
Message-ID: <YNCGW5vQibED5v5V@pendragon.ideasonboard.com>
References: <20210620224208.184719-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210620224208.184719-1-marex@denx.de>
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
Cc: Loic Poulain <loic.poulain@linaro.org>, ch@denx.de,
 Adam Ford <aford173@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 Robert Foss <robert.foss@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 dri-devel@lists.freedesktop.org, Valentin Raevsky <valentin@compulab.co.il>,
 Stephen Boyd <swboyd@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

Thank you for the patch.

On Mon, Jun 21, 2021 at 12:42:08AM +0200, Marek Vasut wrote:
> Patching the connector format is causing various problematic
> side effects. Implement .atomic_get_input_bus_fmts callback
> instead, which sets up the input (DSI-end) format, and that
> format can then be used in pipeline format negotiation between
> the DSI-end of this bridge and the other component closer to
> the scanout engine.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Cc: Philippe Schenker <philippe.schenker@toradex.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Valentin Raevsky <valentin@compulab.co.il>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 35 ++++++++++++++++++++++++---
>  1 file changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index 750f2172ef08..32bda20f5dda 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -517,7 +517,6 @@ static bool sn65dsi83_mode_fixup(struct drm_bridge *bridge,
>  				 struct drm_display_mode *adj)
>  {
>  	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
> -	u32 input_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
>  	struct drm_encoder *encoder = bridge->encoder;
>  	struct drm_device *ddev = encoder->dev;
>  	struct drm_connector *connector;
> @@ -550,14 +549,37 @@ static bool sn65dsi83_mode_fixup(struct drm_bridge *bridge,
>  				 connector->display_info.bus_formats[0]);
>  			break;
>  		}
> -
> -		drm_display_info_set_bus_formats(&connector->display_info,
> -						 &input_bus_format, 1);
>  	}
>  
>  	return true;
>  }
>  
> +#define MAX_INPUT_SEL_FORMATS	1
> +
> +static u32 *
> +sn65dsi83_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +				    struct drm_bridge_state *bridge_state,
> +				    struct drm_crtc_state *crtc_state,
> +				    struct drm_connector_state *conn_state,
> +				    u32 output_fmt,
> +				    unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts;
> +
> +	*num_input_fmts = 0;
> +
> +	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
> +			     GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	/* This is the DSI-end bus format */
> +	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +	*num_input_fmts = 1;
> +
> +	return input_fmts;
> +}

Perfect :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  static const struct drm_bridge_funcs sn65dsi83_funcs = {
>  	.attach		= sn65dsi83_attach,
>  	.pre_enable	= sn65dsi83_pre_enable,
> @@ -567,6 +589,11 @@ static const struct drm_bridge_funcs sn65dsi83_funcs = {
>  	.mode_valid	= sn65dsi83_mode_valid,
>  	.mode_set	= sn65dsi83_mode_set,
>  	.mode_fixup	= sn65dsi83_mode_fixup,
> +
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.atomic_get_input_bus_fmts = sn65dsi83_atomic_get_input_bus_fmts,
>  };
>  
>  static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)

-- 
Regards,

Laurent Pinchart
