Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F20B51562A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 22:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A9210FAA2;
	Fri, 29 Apr 2022 20:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3C410FAA1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 20:56:55 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AB71A83E3C;
 Fri, 29 Apr 2022 22:56:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651265814;
 bh=OGq15KDTpkUSK5PiLKf+yAW9ki4x7Xh8sosZqlHxPBc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uD6X/uaHgwEkHFzcQCdp55xWalX0zPMHhf81VkhHK9iXJjY/Ysr8SEeXkXD3htlvH
 TdNYxRNQWsy2kEJM6hDXc4iWE8GsYFJsTcFTfWmEZBZu8m/T6yUDQYWq4ZhQzxy8Jr
 GhGWiTJm5JYvP+4MF7GgxbTraSb5+yBjX2da83uC84Ve35sVdruyr4LzUM5aRSQVXn
 kAqCWQxO8esc2YYggxxBFSfN30CudQSRg3wouKxDfJnxafEvt17R7OqBT+u8mn4o9b
 SDtWpGXl2VM75WGoql9hls5HhlpY6UFqoXNoGoskwEhoIbVMgGu08fuvXE7vLBHUfD
 qlwDMjXv96hCQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/bridge: tc358767: Add DSI-to-(e)DP mode support
Date: Fri, 29 Apr 2022 22:56:44 +0200
Message-Id: <20220429205644.245480-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429205644.245480-1-marex@denx.de>
References: <20220429205644.245480-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 robert.foss@linaro.org, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement DSI-to-e(DP) mode, which is a mix of currently supported
DSI-to-DPI and DPI-to-(e)DP modes. The input side is configured as
either DSI or DPI, the DP AUX channel is registered for both input
side options, and the DSI host is attached for both DPI and (e)DP
output side options.

One notable detail is that the DSI-to-(e)DP mode requires the Pixel
PLL to be always enabled, which is not needed for DPI-to-(e)DP mode
which gets the matching clock direct from DPI Pixel Clock instead.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Marek Vasut <marex@denx.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/bridge/tc358767.c | 40 +++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index e72dd5cd9700..798da0e4d086 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -309,6 +309,9 @@ struct tc_data {
 	/* do we have IRQ */
 	bool			have_irq;
 
+	/* Input connector type, DSI and not DPI. */
+	bool			input_connector_dsi;
+
 	/* HPD pin number (0 or 1) or -ENODEV */
 	int			hpd_pin;
 };
@@ -1353,8 +1356,18 @@ static int tc_edp_stream_enable(struct tc_data *tc)
 
 	dev_dbg(tc->dev, "enable video stream\n");
 
-	/* PXL PLL setup */
-	if (tc_test_pattern) {
+	/*
+	 * Pixel PLL must be enabled for DSI input mode and test pattern.
+	 *
+	 * Per TC9595XBG datasheet Revision 0.1 2018-12-27 Figure 4.18
+	 * "Clock Mode Selection and Clock Sources", either Pixel PLL
+	 * or DPI_PCLK supplies StrmClk. DPI_PCLK is only available in
+	 * case valid Pixel Clock are supplied to the chip DPI input.
+	 * In case built-in test pattern is desired OR DSI input mode
+	 * is used, DPI_PCLK is not available and thus Pixel PLL must
+	 * be used instead.
+	 */
+	if (tc->input_connector_dsi || tc_test_pattern) {
 		ret = tc_pxl_pll_en(tc, clk_get_rate(tc->refclk),
 				    1000 * tc->mode.clock);
 		if (ret)
@@ -1394,7 +1407,10 @@ static int tc_edp_stream_enable(struct tc_data *tc)
 		return ret;
 
 	/* Set input interface */
-	return tc_dpi_rx_enable(tc);
+	if (tc->input_connector_dsi)
+		return tc_dsi_rx_enable(tc);
+	else
+		return tc_dpi_rx_enable(tc);
 }
 
 static int tc_edp_stream_disable(struct tc_data *tc)
@@ -2004,14 +2020,18 @@ static int tc_probe_bridge_endpoint(struct tc_data *tc)
 		mode |= BIT(endpoint.port);
 	}
 
-	if (mode == mode_dpi_to_edp || mode == mode_dpi_to_dp)
+	if (mode == mode_dpi_to_edp || mode == mode_dpi_to_dp) {
+		tc->input_connector_dsi = false;
 		return tc_probe_edp_bridge_endpoint(tc);
-	else if (mode == mode_dsi_to_dpi)
+	} else if (mode == mode_dsi_to_dpi) {
+		tc->input_connector_dsi = true;
 		return tc_probe_dpi_bridge_endpoint(tc);
-	else if (mode == mode_dsi_to_edp || mode == mode_dsi_to_dp)
-		dev_warn(dev, "The mode DSI-to-(e)DP is not supported!\n");
-	else
-		dev_warn(dev, "Invalid mode (0x%x) is not supported!\n", mode);
+	} else if (mode == mode_dsi_to_edp || mode == mode_dsi_to_dp) {
+		tc->input_connector_dsi = true;
+		return tc_probe_edp_bridge_endpoint(tc);
+	}
+
+	dev_warn(dev, "Invalid mode (0x%x) is not supported!\n", mode);
 
 	return -EINVAL;
 }
@@ -2149,7 +2169,7 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 	i2c_set_clientdata(client, tc);
 
-	if (tc->bridge.type == DRM_MODE_CONNECTOR_DPI) { /* DPI output */
+	if (tc->input_connector_dsi) {			/* DSI input */
 		ret = tc_mipi_dsi_host_attach(tc);
 		if (ret) {
 			drm_bridge_remove(&tc->bridge);
-- 
2.35.1

