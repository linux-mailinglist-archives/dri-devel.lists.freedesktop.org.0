Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB27E155645
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 12:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204336FC39;
	Fri,  7 Feb 2020 11:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306086FC39
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 11:02:30 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CBA35295B59;
 Fri,  7 Feb 2020 11:02:28 +0000 (GMT)
Date: Fri, 7 Feb 2020 12:02:25 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 04/11] drm/bridge: synopsys: dw-hdmi: add bus format
 negociation
Message-ID: <20200207120225.2ea76016@collabora.com>
In-Reply-To: <20200206191834.6125-5-narmstrong@baylibre.com>
References: <20200206191834.6125-1-narmstrong@baylibre.com>
 <20200206191834.6125-5-narmstrong@baylibre.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu,  6 Feb 2020 20:18:27 +0100
Neil Armstrong <narmstrong@baylibre.com> wrote:

> Add the atomic_get_output_bus_fmts, atomic_get_input_bus_fmts to negociate

								^ hooks?

> the possible output and input formats for the current mode and monitor,
> and use the negotiated formats in a basic atomic_check callback.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---

> +
> +/* Can return a maximum of 4 possible input formats for an output format */
> +#define MAX_INPUT_SEL_FORMATS	4

It seems to only be 3 in practice (based on the code) unless I missed
something.

> +
> +static u32 *dw_hdmi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state,
> +					u32 output_fmt,
> +					unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts;
> +	int i = 0;
> +
> +	*num_input_fmts = 0;
> +
> +	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
> +			     GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	switch (output_fmt) {
> +	/* 8bit */
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +		input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
> +		input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
> +		input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
> +		break;
> +	case MEDIA_BUS_FMT_YUV8_1X24:
> +		input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
> +		input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
> +		input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
> +		break;
> +	case MEDIA_BUS_FMT_UYVY8_1X16:
> +		input_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
> +		input_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
> +		input_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
> +		break;
> +
> +	/* 10bit */
> +	case MEDIA_BUS_FMT_RGB101010_1X30:
> +		input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
> +		input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
> +		input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
> +		break;
> +	case MEDIA_BUS_FMT_YUV10_1X30:
> +		input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
> +		input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
> +		input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
> +		break;
> +	case MEDIA_BUS_FMT_UYVY10_1X20:
> +		input_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
> +		input_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
> +		input_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
> +		break;
> +
> +	/* 12bit */
> +	case MEDIA_BUS_FMT_RGB121212_1X36:
> +		input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
> +		input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
> +		input_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
> +		break;
> +	case MEDIA_BUS_FMT_YUV12_1X36:
> +		input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
> +		input_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
> +		input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
> +		break;
> +	case MEDIA_BUS_FMT_UYVY12_1X24:
> +		input_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
> +		input_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
> +		input_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
> +		break;
> +
> +	/* 16bit */
> +	case MEDIA_BUS_FMT_RGB161616_1X48:
> +		input_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
> +		input_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
> +		break;
> +	case MEDIA_BUS_FMT_YUV16_1X48:
> +		input_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
> +		input_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
> +		break;
> +
> +	/* 420 */
> +	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
> +	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
> +	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
> +	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
> +		input_fmts[i++] = output_fmt;
> +		break;
> +	}
> +
> +	*num_input_fmts = i;
> +
> +	if (*num_input_fmts == 0) {
> +		kfree(input_fmts);
> +		input_fmts = NULL;
> +	}
> +
> +	return input_fmts;
> +}
> +
> +static int dw_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
> +				       struct drm_bridge_state *bridge_state,
> +				       struct drm_crtc_state *crtc_state,
> +				       struct drm_connector_state *conn_state)
> +{
> +	struct dw_hdmi *hdmi = bridge->driver_private;
> +
> +	dev_dbg(hdmi->dev, "selected output format %x\n",
> +			bridge_state->output_bus_cfg.format);

Nit: not aligned on the open parens.

> +
> +	hdmi->hdmi_data.enc_out_bus_format =
> +			bridge_state->output_bus_cfg.format;
> +
> +	dev_dbg(hdmi->dev, "selected input format %x\n",
> +			bridge_state->input_bus_cfg.format);
> +
> +	hdmi->hdmi_data.enc_in_bus_format =
> +			bridge_state->input_bus_cfg.format;
> +
> +	return 0;
> +}
> +
>  static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
>  {
>  	struct dw_hdmi *hdmi = bridge->driver_private;
> @@ -2499,6 +2759,9 @@ static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
>  	.atomic_reset = drm_atomic_helper_bridge_reset,
>  	.attach = dw_hdmi_bridge_attach,
>  	.detach = dw_hdmi_bridge_detach,
> +	.atomic_check = dw_hdmi_bridge_atomic_check,
> +	.atomic_get_output_bus_fmts = dw_hdmi_bridge_atomic_get_output_bus_fmts,
> +	.atomic_get_input_bus_fmts = dw_hdmi_bridge_atomic_get_input_bus_fmts,
>  	.enable = dw_hdmi_bridge_enable,
>  	.disable = dw_hdmi_bridge_disable,
>  	.mode_set = dw_hdmi_bridge_mode_set,
> @@ -2963,6 +3226,7 @@ __dw_hdmi_probe(struct platform_device *pdev,
>  
>  	hdmi->bridge.driver_private = hdmi;
>  	hdmi->bridge.funcs = &dw_hdmi_bridge_funcs;
> +

Nit: not sure this has to be part of that patch.

Looks good otherwise.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

>  #ifdef CONFIG_OF
>  	hdmi->bridge.of_node = pdev->dev.of_node;
>  #endif

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
