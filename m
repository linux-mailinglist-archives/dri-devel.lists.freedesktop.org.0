Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6A284BB99
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 18:06:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02211129B9;
	Tue,  6 Feb 2024 17:06:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dPy6ZjEe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3AD71129B9
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 17:06:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id ACE47CE1413;
 Tue,  6 Feb 2024 17:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA24FC433C7;
 Tue,  6 Feb 2024 17:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707239195;
 bh=Mdibn1Y+5lHSiz0nAb0TK65XaYSoIgSUVDm18PAxxiQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dPy6ZjEe2Zt+dwxg52XVC8PESSwxzL9L3ptuPJ6WQy4HpT9fqApeYpZdop4T5gNMj
 6aBATnFLZ6W4p7mczcRpd79auYTHgZ49jVXrdpBxVsOuYDC0HFKJOdyf0arHhlc+RH
 tb5SDUeT9zjDX5Cu3bcnCDLyh4GT6YX8gsFgHim97E++afyN9gC6w9CKuwYI7m/UoN
 zIOkHDWilMfEH+XqI95cewE1BiQpQ8JctOVAuXivaLCBLgCgSDpr+MI7WuSHTB43gS
 iv1TJJtc6MWR0e1MTdXuRsg4ci1dWiCmb8cyR5Jx99Cvw1o5aXvbJnWOLzzmV2EJWR
 CSqH0s0LPflFQ==
Date: Tue, 6 Feb 2024 10:06:32 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, marex@denx.de,
 alexander.stein@ew.tq-group.com, frieder.schrempf@kontron.de,
 Lucas Stach <l.stach@pengutronix.de>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Richard Leitner <richard.leitner@skidata.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Fabio Estevam <festevam@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pm@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V8 08/12] drm/bridge: imx: add driver for HDMI TX
 Parallel Video Interface
Message-ID: <20240206170632.GA2183819@dev-arch.thelio-3990X>
References: <20240203165307.7806-1-aford173@gmail.com>
 <20240203165307.7806-9-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240203165307.7806-9-aford173@gmail.com>
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

Hi all,

On Sat, Feb 03, 2024 at 10:52:48AM -0600, Adam Ford wrote:
> From: Lucas Stach <l.stach@pengutronix.de>
> 
> This IP block is found in the HDMI subsystem of the i.MX8MP SoC. It has a
> full timing generator and can switch between different video sources. On
> the i.MX8MP however the only supported source is the LCDIF. The block
> just needs to be powered up and told about the polarity of the video
> sync signals to act in bypass mode.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> (v7)
> Tested-by: Marek Vasut <marex@denx.de> (v1)
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> (v7)
> Tested-by: Richard Leitner <richard.leitner@skidata.com> (v2)
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> (v2)
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com> (v3)
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Tested-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Adam Ford <aford173@gmail.com>

<snip>

> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
> new file mode 100644
> index 000000000000..a76b7669fe8a
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
...
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
> +	val = FIELD_PREP(PVI_CTRL_MODE_MASK, PVI_CTRL_MODE_LCDIF) | PVI_CTRL_EN;
> +
> +	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> +		val |= PVI_CTRL_OP_VSYNC_POL | PVI_CTRL_INP_VSYNC_POL;
> +
> +	if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> +		val |= PVI_CTRL_OP_HSYNC_POL | PVI_CTRL_INP_HSYNC_POL;
> +
> +	if (pvi->next_bridge->timings)
> +		bus_flags = pvi->next_bridge->timings->input_bus_flags;
> +	else if (bridge_state)
> +		bus_flags = bridge_state->input_bus_cfg.flags;
> +
> +	if (bus_flags & DRM_BUS_FLAG_DE_HIGH)
> +		val |= PVI_CTRL_OP_DE_POL | PVI_CTRL_INP_DE_POL;
> +
> +	writel(val, pvi->regs + HTX_PVI_CTRL);
> +}

Apologies if this has already been reported or fixed, I searched lore
and did not find anything. Clang warns (or errors with CONFIG_WERROR=y)
for this function:

  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c:81:11: error: variable 'bus_flags' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
     81 |         else if (bridge_state)
        |                  ^~~~~~~~~~~~
  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c:84:6: note: uninitialized use occurs here
     84 |         if (bus_flags & DRM_BUS_FLAG_DE_HIGH)
        |             ^~~~~~~~~
  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c:81:7: note: remove the 'if' if its condition is always true
     81 |         else if (bridge_state)
        |              ^~~~~~~~~~~~~~~~~
     82 |                 bus_flags = bridge_state->input_bus_cfg.flags;
  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c:60:15: note: initialize the variable 'bus_flags' to silence this warning
     60 |         u32 bus_flags, val;
        |                      ^
        |                       = 0
  1 error generated.

This seems legitimate. If bridge_state can be NULL, should bus_flags be
initialized to zero like it suggests or should that 'else if' be turned
into a plain 'else'? I am happy to send a patch with that guidance.

Cheers,
Nathan
