Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B87D0C6688B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 00:16:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9063D89AC3;
	Mon, 17 Nov 2025 23:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kAOr2Q3V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3D289AC3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 23:16:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6C9534448A;
 Mon, 17 Nov 2025 23:16:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14384C19425;
 Mon, 17 Nov 2025 23:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763421382;
 bh=8r5cMvWfXnP4pacAVAv6hrWQ/Wrvp8ZghIEUs8cXZxo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kAOr2Q3VJqQrXwMwOqIsSpJfZ6R1Dlj696Gv6d5MlAhIk3qjLTUdDEONqGJ8C7Hi8
 ob7u5EXwTVBANAmpc2URScN6FyXQufhu5Bn1U6jeJ0oHJ48ZOMWj2z/y1+QO2qGp88
 2TgjNScIvA1j8CngmT9r7xB/J8OEFFaOc1vqvIUUtdyApW+638gi5LzGtDSd9ARWSZ
 mWTuI8KS/qNkCZ/Mm+Xm16Bo7Ph9RrRdhzICcM9nMsOStD+vKJwhb9jIV7vTaW78xU
 9o8H7s8yL21FW9G7mwM2eJSe+AEhxbZO/kVNyWv+/+k3pEalHpWHmo+IB3e1eC46M9
 U9euJ2wRjYVjw==
Date: Mon, 17 Nov 2025 17:21:06 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drm: panel: Add Waveshare MIPI-DSI panel driver
Message-ID: <yp3khykumcomvfsgcwpeh7uhnpz26jv3wnpjdmsh5pzpsq4wzr@6e5he2witixd>
References: <20251111104309.3424018-1-tessolveupstream@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111104309.3424018-1-tessolveupstream@gmail.com>
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

On Tue, Nov 11, 2025 at 04:13:09PM +0530, Sudarshan Shetty wrote:
> This patch adds a DRM panel driver for Waveshare MIPI-DSI panels
> of various sizes (5.0", 5.5", 7.0", 8.0", and 10.1") with integrated
> touch functionality.
> 
> The driver provides:
>  - Initialization and reset sequencing
>  - MIPI-DSI command transfer for panel setup
>  - Backlight integration through the backlight class device
>  - Support for multiple panel variants via compatible strings
> 
> These panels are commonly used with Waveshare development kits
> and require proper power sequencing and regulator support.
> 

In order to facilitate any form of discussion about the DeviceTree
binding and how this relates to the Waveshare MCU/regulator module,
the patches for these separate parts should be sent together as one
series.


That said, I was able to puzzle the pieces together and get the
Waveshare 12.3 DSI panel working, with touchscreen, on my Particle
Tachyon.

> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
[..]
> diff --git a/drivers/gpu/drm/panel/panel-waveshare-dsi-v2.c b/drivers/gpu/drm/panel/panel-waveshare-dsi-v2.c
[..]
> +static int ws_panel_dsi_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct ws_panel *ctx;
> +	int ret;
> +
> +	dev_info(&dsi->dev, "dsi panel: %s\n",
> +		 (char *)of_get_property(
> +			 dsi->dev.of_node, "compatible", NULL));
> +
> +	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +	ctx->dsi = dsi;
> +	ctx->desc = of_device_get_match_data(&dsi->dev);
> +
> +	ctx->panel.prepare_prev_first = true;
> +	drm_panel_init(&ctx->panel, &dsi->dev, &ws_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +
> +	ctx->reset = devm_gpiod_get_optional(
> +			&dsi->dev, "reset", GPIOD_OUT_LOW);

Your reset signal is active-low, but you describe it in DeviceTree as
GPIO_ACTIVE_HIGH and then you invert the logic here (i.e. the think you
call "reset" is "not_reset").

Invert the high/low to mean high == reset, low == not-reset, here in the
driver and then say GPIO_ACTIVE_LOW in the DeviceTree.

> +	if (IS_ERR(ctx->reset))
> +		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->reset),
> +				     "Couldn't get our reset GPIO\n");
> +
> +	ctx->iovcc = devm_gpiod_get_optional(
> +			&dsi->dev, "iovcc", GPIOD_OUT_LOW);

This really sounds like a regulator, not a GPIO.

> +	if (IS_ERR(ctx->iovcc))
> +		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->iovcc),
> +					"Couldn't get our iovcc GPIO\n");
> +
> +	ctx->avdd = devm_gpiod_get_optional(&dsi->dev, "avdd", GPIOD_OUT_LOW);

This too sounds like a regulator, not a GPIO.

> +	if (IS_ERR(ctx->avdd))
> +		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->avdd),
> +					"Couldn't get our avdd GPIO\n");
> +
> +	ret = of_drm_get_panel_orientation(
> +			dsi->dev.of_node, &ctx->orientation);

Do you know why this doesn't work? (Not sure it relates to your code...)

> +	if (ret) {
> +		dev_err(&dsi->dev, "%pOF: failed to get orientation: %d\n",
> +			dsi->dev.of_node, ret);
> +		return ret;
> +	}
> +
> +	ret = drm_panel_of_backlight(&ctx->panel);
> +	if (ret)
> +		return ret;
> +
> +	drm_panel_add(&ctx->panel);
> +
> +	dsi->mode_flags = ctx->desc->mode_flags;
> +	dsi->format = ctx->desc->format;
> +	dsi->lanes = ctx->desc->lanes;
> +	dev_info(&dsi->dev, "lanes: %d\n", dsi->lanes);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret)
> +		drm_panel_remove(&ctx->panel);
> +
> +	return ret;
> +}

Regards,
Bjorn
