Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F69A4BABB
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 10:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFAA10E3A2;
	Mon,  3 Mar 2025 09:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tHtGDha5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDAF10E3A2
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 09:26:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B6152611EB;
 Mon,  3 Mar 2025 09:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44854C4CEE4;
 Mon,  3 Mar 2025 09:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740993980;
 bh=m7pLdPXQWCNRenKWCOj9QGklukAUggqeQTZ/jePvJ+k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tHtGDha5Zbwwl8eFABfT3/lOyOAPQyA941Oy3/pisGsByfKaNroKCJJdkeYMkYRYQ
 08Qx51MIsWAIJEg5b0dI0v/VNC6bwSHJgSpV8iAVRtz6NX0FC9lVxFsAwjPs6Rs12b
 CYVS/Gj4opkVuplXo+M1sERIWKz6zjFTEu1CVpLcPtG//Xe5YBinZT+cxoVoTQKVnR
 JS/EMs3BKH9rVbmhQXJbsJB0sEaem/VFFFx8l6aGpF/yIUpsNpERSW301+HeqOxBAf
 sWC3gL3o+kWCdqssPE3PvHzhy0x+SuEBE72LkIWKwx9nR0rWtZ35ZCENGkXOQOTq1w
 MExLrwKSJzUag==
Date: Mon, 3 Mar 2025 10:26:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hironori KIKUCHI <kikuchan98@gmail.com>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm: panel: Add a driver for Generic
 MIPI-DSI/DPI(+SPI) panels
Message-ID: <20250303-massive-beagle-of-authority-40bbb5@krzk-bin>
References: <20250226112552.52494-1-kikuchan98@gmail.com>
 <20250226112552.52494-4-kikuchan98@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250226112552.52494-4-kikuchan98@gmail.com>
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

On Wed, Feb 26, 2025 at 08:25:50PM +0900, Hironori KIKUCHI wrote:
> +
> +struct panel_firmware_header {
> +	u8 magic[15];
> +	u8 file_format_version; /* must be 1 */
> +} __packed;
> +
> +struct panel_firmware_config {
> +	u16 width_mm, height_mm;
> +	u16 rotation;
> +	u8 _reserved_1[2];
> +	u8 _reserved_2[8];
> +
> +	u16 reset_delay; /* delay after the reset command, in ms */
> +	u16 init_delay; /* delay for sending the initial command sequence, in ms */
> +	u16 sleep_delay; /* delay after the sleep command, in ms */
> +	u16 backlight_delay; /* delay for enabling the backlight, in ms */

These should be implied by compatible.

> +	u16 _reserved_3[4];
> +
> +	u16 dsi_lanes; /* unsigned int */
> +	u16 dsi_format; /* enum mipi_dsi_pixel_format */
> +	u32 dsi_mode_flags; /* unsigned long */
> +	u32 bus_flags; /* struct drm_bus_flags */
> +	u8 _reserved_4[2];
> +	u8 preferred_timing;
> +	u8 num_timings;
> +} __packed;
> +

...

> +
> +static int panel_mipi_probe(struct device *dev, int connector_type)
> +{
> +	struct panel_mipi *mipi;
> +	int err;
> +
> +	mipi = devm_kzalloc(dev, sizeof(*mipi), GFP_KERNEL);
> +	if (!mipi)
> +		return -ENOMEM;
> +
> +	mutex_init(&mipi->lock);
> +
> +	mipi->display_id = -1;
> +
> +	/* Get `power-supply` and `io-supply` (if any) */
> +	mipi->supplies[0].supply = "power";
> +	mipi->supplies[1].supply = "io";
> +	err = devm_regulator_bulk_get(dev, ARRAY_SIZE(mipi->supplies),
> +				      mipi->supplies);
> +	if (err < 0) {
> +		return dev_err_probe(dev, err,
> +				     "%pOF: Failed to get regulators\n",
> +				     dev->of_node);

Drop pOF. Device name already tells this.

> +	}
> +
> +	/* GPIO for /RESET */
> +	mipi->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(mipi->reset))
> +		return dev_err_probe(dev, PTR_ERR(mipi->reset),
> +				     "%pOF: Failed to get GPIO for RESET\n",

Drop pOF. Device name already tells this.

> +				     dev->of_node);
> +
> +	/* Load the firmware */
> +	mipi->firmware = panel_mipi_load_firmware(dev);
> +	if (IS_ERR(mipi->firmware))
> +		return dev_err_probe(dev, PTR_ERR(mipi->firmware),
> +				     "Failed to load firmware\n");
> +
> +	err = panel_mipi_read_firmware(dev, mipi, mipi->firmware);
> +	if (err)
> +		return err;
> +
> +	err = panel_mipi_probe_modes(dev, mipi);
> +	if (err)
> +		return err;
> +
> +	/* DRM panel setup */
> +	drm_panel_init(&mipi->panel, dev, &panel_mipi_funcs, connector_type);
> +
> +	err = panel_mipi_set_backlight(&mipi->panel, dev, mipi);
> +	if (err)
> +		return dev_err_probe(dev, err, "Failed to set backlight\n");
> +
> +	drm_panel_add(&mipi->panel);
> +
> +	dev_set_drvdata(dev, mipi);
> +
> +	panel_mipi_debugfs_init(dev, mipi);
> +
> +	return devm_add_action_or_reset(dev, panel_mipi_cleanup, mipi);
> +}
> +
> +static int panel_mipi_dsi_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct panel_mipi *mipi;
> +	int err;
> +
> +	err = panel_mipi_probe(&dsi->dev, DRM_MODE_CONNECTOR_DSI);
> +	if (err)
> +		return err;
> +
> +	mipi = dev_get_drvdata(&dsi->dev);
> +	mipi->dsi = dsi;
> +	mipi->write_command = panel_mipi_dsi_write;
> +	mipi->read_command = panel_mipi_dsi_read;
> +
> +	/* Read from the firmware */
> +	dsi->lanes = be16_to_cpu(mipi->firmware->config->dsi_lanes);

lanes are from DT, because they are depending on how panel is wired. At
least usually.

> +	dsi->format = be16_to_cpu(mipi->firmware->config->dsi_format);
> +	dsi->mode_flags = be32_to_cpu(mipi->firmware->config->dsi_mode_flags);
> +
> +	if (!dsi->lanes)
> +		return dev_err_probe(&dsi->dev, -EINVAL,
> +				     "dsi-lanes == 0 for DSI panel\n");
> +
> +	/* Adjust bus_format */
> +	switch (dsi->format) {
> +	case MIPI_DSI_FMT_RGB888:
> +		mipi->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> +		break;
> +	case MIPI_DSI_FMT_RGB666:
> +		mipi->bus_format = MEDIA_BUS_FMT_RGB666_1X24_CPADHI;
> +		break;
> +	case MIPI_DSI_FMT_RGB666_PACKED:
> +		mipi->bus_format = MEDIA_BUS_FMT_RGB666_1X18;
> +		break;
> +	case MIPI_DSI_FMT_RGB565:
> +		mipi->bus_format = MEDIA_BUS_FMT_RGB565_1X16;
> +		break;
> +	}

Best regards,
Krzysztof

