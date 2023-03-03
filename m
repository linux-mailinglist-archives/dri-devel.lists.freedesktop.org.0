Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1A86A9CC1
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 18:07:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA1410E710;
	Fri,  3 Mar 2023 17:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1250C10E710
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 17:07:18 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4202AE0004;
 Fri,  3 Mar 2023 17:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1677863237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OjYiBf4Gf1Z7h+D55/oraZ0dkhkV8eX9Rf59pAAfkP4=;
 b=JYLUnVscGOdN1m0gw5vYTURHItoOmysjxB24CtP6odIlDIcMougk6wHrJAGUkkGFgTcmiZ
 ESbaymfvOq9xCRaKwt8oYS3B0qamWtN/zOe6lqyyTypYE3NQ1FU5ahu20A4Q2TvQrMFOZD
 UHFuxSLuJ6x4zlU5dvLi+5BrUrkdQF1GHGjjyrgl55HfQ97ZpazIabrYtshUgTqUoHjBdj
 kh0EG04t2te1Ua5c4iXAxgDcdepA6M/pjHOV3td/zSQ0N0m+kiyFbAQwli/SrxGv/tW9aR
 0a1gVNO+KOMgBbx8npoThBX2zBYzzaaIWUpfDRcu8J5Nje+ODp6D5Vuy2fcmXA==
Date: Fri, 3 Mar 2023 18:07:14 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 4/4] drm/imx: add driver for HDMI TX Parallel Video
 Interface
Message-ID: <20230303180714.5c67cb12@booty>
In-Reply-To: <20220826192424.3216734-4-l.stach@pengutronix.de>
References: <20220826192424.3216734-1-l.stach@pengutronix.de>
 <20220826192424.3216734-4-l.stach@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, patchwork-lst@pengutronix.de,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Lucas,

On Fri, 26 Aug 2022 21:24:24 +0200
Lucas Stach <l.stach@pengutronix.de> wrote:

> This IP block is found in the HDMI subsystem of the i.MX8MP SoC. It has a
> full timing generator and can switch between different video sources. On
> the i.MX8MP however the only supported source is the LCDIF.

Reading this sentence I had assumed that the i.MX8MP does only support
the LCDIF as an input to the PVI, but after having read the reference
manual it does not seem to have such a limitation. Do you mean that
"this driver only supports the LCDIF as an input"?

> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
> @@ -0,0 +1,201 @@
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
> +#define  PVI_CTL_OP_VSYNC_POL	BIT(18)
> +#define  PVI_CTL_OP_HSYNC_POL	BIT(17)
> +#define  PVI_CTL_OP_DE_POL	BIT(16)
> +#define  PVI_CTL_INP_VSYNC_POL	BIT(14)
> +#define  PVI_CTL_INP_HSYNC_POL	BIT(13)
> +#define  PVI_CTL_INP_DE_POL	BIT(12)
> +#define  PVI_CTL_INPUT_LCDIF	BIT(2)

According to the reference manual there is actually a 2-bit field here:
HTX_PVI_MOD, using bits 2:1, and whose "LCDIF" value is 0b10. Thus while
it obviously won't change the resulting code, it seems more correct to
define this as (2 << 1).

> +static void imx_hdmi_pvi_bridge_enable(struct drm_bridge *bridge,
> +				       struct drm_bridge_state *bridge_state)
> +{
> +	struct drm_atomic_state *state = bridge_state->base.state;
> +	struct imx_hdmi_pvi *pvi = to_imx_hdmi_pvi(bridge);
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

> +static void imx_hdmi_pvi_bridge_disable(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state)
> +{
> +	struct imx_hdmi_pvi *pvi = to_imx_hdmi_pvi(bridge);
> +
> +	writel(0x0, pvi->regs + HTX_PVI_CTL);

A very minor nit: why not simply writel(0, ...)?

With these fixed:
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

And definitely:
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
