Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB4614A4BA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 14:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3479E6EB8A;
	Mon, 27 Jan 2020 13:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1152 seconds by postgrey-1.36 at gabe;
 Mon, 27 Jan 2020 13:16:44 UTC
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF13E6EB8A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 13:16:44 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1iw3x5-0003wI-Lq; Mon, 27 Jan 2020 13:57:15 +0100
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1iw3x1-0001Y5-7H; Mon, 27 Jan 2020 13:57:11 +0100
Message-ID: <ea2957045774ff714a0cb5cd4fb91660d761ec1e.camel@pengutronix.de>
Subject: Re: [PATCH v9 07/12] drm/imx: pd: Use bus format/flags provided by
 the bridge when available
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 dri-devel@lists.freedesktop.org
Date: Mon, 27 Jan 2020 13:57:11 +0100
In-Reply-To: <20200127110043.2731697-8-boris.brezillon@collabora.com>
References: <20200127110043.2731697-1-boris.brezillon@collabora.com>
 <20200127110043.2731697-8-boris.brezillon@collabora.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Mark Rutland <mark.rutland@arm.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 intel-gfx-trybot@lists.freedesktop.org, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Boris,

On Mon, 2020-01-27 at 12:00 +0100, Boris Brezillon wrote:
> Now that bridges can expose the bus format/flags they expect, we can
> use those instead of the relying on the display_info provided by the
> connector (which is only valid if the encoder is directly connected
> to bridge element driving the panel/display).
> 
> We also explicitly expose the bus formats supported by our encoder by
> filling encoder->output_bus_caps with proper info.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v7:
> * Add an imx_pd_format_supported() helper (suggested by Philipp)
> * Simplify imx_pd_bridge_atomic_get_output_bus_fmts() (suggested by Philipp)
> * Simplify imx_pd_bridge_atomic_get_input_bus_fmts()
> * Explicitly set the duplicate/destro_state() and reset() hooks
> 
> Changes in v3 (all suggested by Philipp):
> * Adjust to match core changes
> * Propagate output format to input format
> * Pick a default value when output_fmt = _FIXED
> * Add missing BGR888 and GBR888 fmts to imx_pd_bus_fmts[]
> 
> Changes in v2:
> * Adjust things to match the new bus-format negotiation infra
> ---
>  drivers/gpu/drm/imx/parallel-display.c | 176 +++++++++++++++++++++----
>  1 file changed, 151 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
> index 3dca424059f7..031579aa7fc2 100644
> --- a/drivers/gpu/drm/imx/parallel-display.c
> +++ b/drivers/gpu/drm/imx/parallel-display.c
> @@ -24,6 +24,7 @@
[...]
> +static u32 *
> +imx_pd_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state,
> +					u32 output_fmt,
> +					unsigned int *num_input_fmts)
> +{
> +	struct imx_parallel_display *imxpd = bridge_to_imxpd(bridge);
> +	u32 *input_fmts;
> +
> +	/*
> +	 * If the next bridge does not support bus format negotiation, let's
> +	 * use the static bus format definition (imxpd->bus_format) if it's
> +	 * specified, RGB888 when it's not.
> +	 */
> +	if (output_fmt == MEDIA_BUS_FMT_FIXED)
> +		output_fmt = imxpd->bus_format ? : MEDIA_BUS_FMT_RGB888_1X24;
> +
> +	/* Now make sure the requested output format is supported. */
> +	if ((imxpd->bus_format && imxpd->bus_format != output_fmt) ||
> +	    !imx_pd_format_supported(output_fmt)) {
> +		*num_input_fmts = 0;
> +		return NULL;
> +	}
> +
> +	*num_input_fmts = 1;
> +	input_fmts = kcalloc(*num_input_fmts, sizeof(*input_fmts),
> +			     GFP_KERNEL);

You could just use kzalloc() here.

> +	if (!input_fmts)
> +		return NULL;
> +
> +	input_fmts[0] = output_fmt;
> +	return input_fmts;
> +}
> +
> +static int imx_pd_bridge_atomic_check(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *bridge_state,
> +				      struct drm_crtc_state *crtc_state,
> +				      struct drm_connector_state *conn_state)
> +{
> +	struct imx_crtc_state *imx_crtc_state = to_imx_crtc_state(crtc_state);
> +	struct drm_display_info *di = &conn_state->connector->display_info;
> +	struct imx_parallel_display *imxpd = bridge_to_imxpd(bridge);
> +	struct drm_bridge_state *next_bridge_state = NULL;
> +	struct drm_bridge *next_bridge;
> +	u32 bus_flags, bus_fmt;
> +
> +	next_bridge = drm_bridge_get_next_bridge(bridge);
> +	if (next_bridge)
> +		next_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
> +								    next_bridge);
> +
> +	if (next_bridge_state)
> +		bus_flags = next_bridge_state->input_bus_cfg.flags;
> +	else if (!imxpd->bus_format && di->num_bus_formats)
> +		bus_flags = di->bus_flags;
> +	else
> +		bus_flags = imxpd->bus_flags;
> +
> +	bus_fmt = bridge_state->input_bus_cfg.format;
> +	if (!imx_pd_format_supported(bus_fmt))
> +		return -EINVAL;
> +
> +	if (bus_flags &
> +	    ~(DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_DE_HIGH |
> +	      DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
> +	      DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE))

Maybe add a warning so the first person to hook up a bridge / panel with
unsupported flags knows where to look.

Otherwise this looks fine to me.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
