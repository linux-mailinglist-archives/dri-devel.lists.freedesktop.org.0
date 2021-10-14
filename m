Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D22842E044
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 19:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0196B6E591;
	Thu, 14 Oct 2021 17:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D1F6E591
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 17:45:20 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 7eaae583-2d16-11ec-9c3f-0050568c148b;
 Thu, 14 Oct 2021 17:45:17 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id CADFC194B77;
 Thu, 14 Oct 2021 19:45:24 +0200 (CEST)
Date: Thu, 14 Oct 2021 19:45:15 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com,
 robert.foss@linaro.org, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] drm/bridge: display-connector: implement bus fmts
 callbacks
Message-ID: <YWhsq6nxf88Uwnbx@ravnborg.org>
References: <20211014152606.2289528-1-narmstrong@baylibre.com>
 <20211014152606.2289528-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211014152606.2289528-2-narmstrong@baylibre.com>
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

Hi Neil,

code looks fine. A few improvement proposals to the comments.
With the include order fixed and the comments considered:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

On Thu, Oct 14, 2021 at 05:26:00PM +0200, Neil Armstrong wrote:
> Since this bridge is tied to the connector, it acts like a passthrough,
> so concerning the output & input bus formats, either pass the bus formats from the
> previous bridge or return fallback data like done in the bridge function:
> drm_atomic_bridge_chain_select_bus_fmts() & select_bus_fmt_recursive.
> 
> This permits avoiding skipping the negociation if the remaining bridge chain has
> all the bits in place.
> 
> Without this bus fmt negociation breaks on drm/meson HDMI pipeline when attaching
> dw-hdmi with DRM_BRIDGE_ATTACH_NO_CONNECTOR, because the last bridge of the
> display-connector doesn't implement buf fmt callbacks and MEDIA_BUS_FMT_FIXED
> is used leading to select an unsupported default bus format from dw-hdmi.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/bridge/display-connector.c | 88 ++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
> index 05eb759da6fc..9697ac173157 100644
> --- a/drivers/gpu/drm/bridge/display-connector.c
> +++ b/drivers/gpu/drm/bridge/display-connector.c
> @@ -14,6 +14,7 @@
>  #include <linux/regulator/consumer.h>
>  
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_atomic_helper.h>
>  #include <drm/drm_edid.h>
Alphabetic order.

>  
>  struct display_connector {
> @@ -87,10 +88,97 @@ static struct edid *display_connector_get_edid(struct drm_bridge *bridge,
>  	return drm_get_edid(connector, conn->bridge.ddc);
>  }
>  
> +/*
> + * Since this bridge is tied to the connector, it acts like a passthrough,
> + * so concerning the output bus formats, either pass the bus formats from the
> + * previous bridge or return fallback data like done in the bridge function:
> + * drm_atomic_bridge_chain_select_bus_fmts().
> + * This permits avoiding skipping the negociation if the bridge chain has all
> + * bits in place.
negociation if => negotiation of

Consider the following wording:
This supports negotiation if the bridge chain has all bits in place.

> + */
> +static u32 *display_connector_get_output_bus_fmts(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state,
> +					unsigned int *num_output_fmts)
> +{
> +	struct drm_bridge *prev_bridge = drm_bridge_get_prev_bridge(bridge);
> +	struct drm_bridge_state *prev_bridge_state;
> +
> +	if (!prev_bridge || !prev_bridge->funcs->atomic_get_output_bus_fmts) {
> +		struct drm_connector *conn = conn_state->connector;
> +		u32 *out_bus_fmts;
> +
> +		*num_output_fmts = 1;
> +		out_bus_fmts = kmalloc(sizeof(*out_bus_fmts), GFP_KERNEL);
> +		if (!out_bus_fmts)
> +			return NULL;
> +
> +		if (conn->display_info.num_bus_formats &&
> +		    conn->display_info.bus_formats)
> +			out_bus_fmts[0] = conn->display_info.bus_formats[0];
> +		else
> +			out_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;
> +
> +		return out_bus_fmts;
> +	}
> +
> +	prev_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
> +							    prev_bridge);
> +
> +	return prev_bridge->funcs->atomic_get_output_bus_fmts(prev_bridge, prev_bridge_state,
> +							      crtc_state, conn_state,
> +							      num_output_fmts);
> +}
> +
> +/*
> + * Since this bridge is tied to the connector, it acts like a passthrough,
> + * so concerning the input bus formats, either pass the bus formats from the
> + * previous bridge or return fallback data like done in the bridge function:
> + * select_bus_fmt_recursive() when atomic_get_input_bus_fmts is not supported.
Maybe use this this:
from the previous bridge or MEDIA_BUS_FMT_FIXED (like select_bus_fmt_recursive())


> + * This permits avoiding skipping the negociation if the bridge chain has all
> + * bits in place.
Like above
> + */
> +static u32 *display_connector_get_input_bus_fmts(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state,
> +					u32 output_fmt,
> +					unsigned int *num_input_fmts)
> +{
> +	struct drm_bridge *prev_bridge = drm_bridge_get_prev_bridge(bridge);
> +	struct drm_bridge_state *prev_bridge_state;
> +
> +	if (!prev_bridge || !prev_bridge->funcs->atomic_get_input_bus_fmts) {
> +		u32 *in_bus_fmts;
> +
> +		*num_input_fmts = 1;
> +		in_bus_fmts = kmalloc(sizeof(*in_bus_fmts), GFP_KERNEL);
> +		if (!in_bus_fmts)
> +			return NULL;
> +
> +		in_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;
> +
> +		return in_bus_fmts;
> +	}
> +
> +	prev_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
> +							    prev_bridge);
> +
> +	return prev_bridge->funcs->atomic_get_input_bus_fmts(prev_bridge, prev_bridge_state,
> +							     crtc_state, conn_state, output_fmt,
> +							     num_input_fmts);
> +}
> +
>  static const struct drm_bridge_funcs display_connector_bridge_funcs = {
>  	.attach = display_connector_attach,
>  	.detect = display_connector_detect,
>  	.get_edid = display_connector_get_edid,
> +	.atomic_get_output_bus_fmts = display_connector_get_output_bus_fmts,
> +	.atomic_get_input_bus_fmts = display_connector_get_input_bus_fmts,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
>  };
>  
>  static irqreturn_t display_connector_hpd_irq(int irq, void *arg)
> -- 
> 2.25.1
