Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77247780C41
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 15:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF77010E507;
	Fri, 18 Aug 2023 13:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602DC10E505
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 13:07:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3DA01C0005;
 Fri, 18 Aug 2023 13:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1692364063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dD//loP9QtgReRBOtZXeatvKNMJueOSLRqawga/87Cw=;
 b=THS/0FAGl+h4FMEYqyhvhS5xaNpbASdABm+l/L+yVM4iviSxedz/kz6Bnuv9rD3j7wrhbJ
 6rEX1Cgp/3+3tRW2dojYOVHgvnqn+TObFE2MtR/OLLbEiHJn71ALXnl2TmzvSIRyVu2TGY
 az4572AQ4H+cwiLL9bp5ICL3wkO9SBEafxTXloXjmd9vTlbveJuhmAzJXWPCRCPXFuYcf8
 hE8jz5quJmnOMmELtyus1tup7JT0k8VNwWao3K7fVvma5DEBTmyE5Z29Rn2iaQmiyGJUWY
 z4PQvZwPv3BaYAl05m3HcCTJwPqKcE3tRqfGkGcHYv8qM5tJGHz6NUGAs/ikJA==
Date: Fri, 18 Aug 2023 15:07:39 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 4/4] drm/bridge: imx: add driver for HDMI TX Parallel
 Video Interface
Message-ID: <20230818150739.474dd0a1@booty>
In-Reply-To: <20221216210742.3233382-4-l.stach@pengutronix.de>
References: <20221216210742.3233382-1-l.stach@pengutronix.de>
 <20221216210742.3233382-4-l.stach@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

On Fri, 16 Dec 2022 22:07:42 +0100
Lucas Stach <l.stach@pengutronix.de> wrote:

> This IP block is found in the HDMI subsystem of the i.MX8MP SoC. It has a
> full timing generator and can switch between different video sources. On
> the i.MX8MP however the only supported source is the LCDIF. The block
> just needs to be powered up and told about the polarity of the video
> sync signals to act in bypass mode.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Tested-by: Marek Vasut <marex@denx.de>
> ---
>  drivers/gpu/drm/bridge/imx/Kconfig           |   7 +
>  drivers/gpu/drm/bridge/imx/Makefile          |   1 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c | 202 +++++++++++++++++++
>  3 files changed, 210 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
> 
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index d828d8bfd893..e6cc4000bccd 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -53,4 +53,11 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
>  	  Choose this to enable support for the internal HDMI encoder found
>  	  on the i.MX8MP SoC.
>  
> +config DRM_IMX8MP_HDMI_PVI
> +	tristate "i.MX8MP HDMI PVI bridge support"
> +	depends on OF
> +	help
> +	  Choose this to enable support for the internal HDMI TX Parallel
> +	  Video Interface found on the i.MX8MP SoC.
> +
>  endif # ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
> index 03b0074ae538..b0fd56550dad 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -9,3 +9,4 @@ obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
>  
>  obj-$(CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE) += imx8mp-hdmi.o
> +obj-$(CONFIG_DRM_IMX8MP_HDMI_PVI) += imx8mp-hdmi-pvi.o
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
> new file mode 100644
> index 000000000000..30d40c21dabb
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
> @@ -0,0 +1,202 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright (C) 2022 Pengutronix, Lucas Stach <kernel@pengutronix.de>
> + */
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_crtc.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/pm_runtime.h>
> +
> +#define HTX_PVI_CTL	0x0

Personally I would s/CTL/CTRL/, to be consistent with the manual and
thus more search-friendly.

> +#define  PVI_CTL_OP_VSYNC_POL	BIT(18)
> +#define  PVI_CTL_OP_HSYNC_POL	BIT(17)
> +#define  PVI_CTL_OP_DE_POL	BIT(16)
> +#define  PVI_CTL_INP_VSYNC_POL	BIT(14)
> +#define  PVI_CTL_INP_HSYNC_POL	BIT(13)
> +#define  PVI_CTL_INP_DE_POL	BIT(12)
> +#define  PVI_CTL_INPUT_LCDIF	BIT(2)

According to the reference manual there is actually a 2-bit field here:
HTX_PVI_MODE, using bits 2:1, and whose "LCDIF" value is 0b10. Thus
while it obviously won't change the resulting code, it seems more
correct to define this as (2 << 1).

> +static void imx8mp_hdmi_pvi_bridge_enable(struct drm_bridge *bridge,
> +					  struct drm_bridge_state *bridge_state)
> +{
> +	struct drm_atomic_state *state = bridge_state->base.state;
> +	struct imx8mp_hdmi_pvi *pvi = to_imx8mp_hdmi_pvi(bridge);
> +	struct drm_connector_state *conn_state;
> +	const struct drm_display_mode *mode;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_connector *connector;
> +	u32 bus_flags, val;
> +
> +	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> +
> +	if (WARN_ON(pm_runtime_resume_and_get(pvi->dev)))
> +		return;
> +
> +	mode = &crtc_state->adjusted_mode;
> +
> +	val = PVI_CTL_INPUT_LCDIF;
> +
> +	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> +		val |= PVI_CTL_OP_VSYNC_POL | PVI_CTL_INP_VSYNC_POL;
> +
> +	if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> +		val |= PVI_CTL_OP_HSYNC_POL | PVI_CTL_INP_HSYNC_POL;
> +
> +	if (pvi->next_bridge->timings)
> +		bus_flags = pvi->next_bridge->timings->input_bus_flags;
> +	else if (bridge_state)
> +		bus_flags = bridge_state->input_bus_cfg.flags;
> +
> +	if (bus_flags & DRM_BUS_FLAG_DE_HIGH)
> +		val |= PVI_CTL_OP_DE_POL | PVI_CTL_INP_DE_POL;
> +
> +	writel(val, pvi->regs + HTX_PVI_CTL);
> +	val |= PVI_CTL_EN;
> +	writel(val, pvi->regs + HTX_PVI_CTL);

I guess I'm missing something here: why can't one just write the
register once, with the enable bit set? I tried removing the first
writel() and everything seems to work just the same.

With these fixed:
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

And definitely:
[Tested on a custom board using modetest on v6.5-rc6]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>



-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
