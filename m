Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E26515629
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 22:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6635210FAA0;
	Fri, 29 Apr 2022 20:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1BF10FAA0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 20:56:55 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5747583B3D;
 Fri, 29 Apr 2022 22:56:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651265813;
 bh=KJdzPIwDtc3Gng5utaT4MWYtCstx0KV0cY/R3g8F1Sk=;
 h=From:To:Cc:Subject:Date:From;
 b=v1BpXcJvzrDTln5JouuTePWtXAXcUZ/IblVoZ7CoagDCPs2rrkHvhEIJoD4IX2agZ
 11MMgJdJpdrVxYjTH/4dEdBE/UiOc9fJ8igaksVAuLNsEn6eSkK6YGNHwX8Vqk9ASz
 y+Pn9DRVY3ltT43kFjYIinVffZeic1DgIbtsl9re4nqjdGzv8U3kbAzX+aLYyqWi5i
 zs8gQUe6LtHXRLxf5GjdkfoF4MCQXNlaQwd7QgMXY2g+0BXnh+6UkehdtTB8xx4Glh
 wxY0lT8YudH25Q4308Zf1vx5jwuU5o9nkb+UedQOs707vViEzuknuzFBXq2hPfRoal
 S9GEnU+atBcgA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/bridge: tc358767: Factor out DSI and DPI RX enablement
Date: Fri, 29 Apr 2022 22:56:43 +0200
Message-Id: <20220429205644.245480-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
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

Factor out register programming to configure the chip video RX side for
reception of video data from DSI or DPI. This is particularly useful in
the (e)DP output mode, where the video data can be received from either
DPI or DSI. While only the former is supported in (e)DP output mode so
far, this patch is added in preparation for addition of the later.

There is a change in the order or register programming in case of the
DSI-to-DPI mode. The DSI RX side is now programmed and enabled all in
one place after the output mode has been configured. Before this change,
the DSI RX has been programmed before the output mode has been set and
only enabled afterward. The order makes no difference however, since the
DSI RX is only enabled at the end either way.

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
 drivers/gpu/drm/bridge/tc358767.c | 94 +++++++++++++++++--------------
 1 file changed, 53 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 485717c8f0b4..e72dd5cd9700 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1247,11 +1247,60 @@ static int tc_main_link_disable(struct tc_data *tc)
 	return regmap_write(tc->regmap, DP0CTL, 0);
 }
 
-static int tc_dpi_stream_enable(struct tc_data *tc)
+static int tc_dsi_rx_enable(struct tc_data *tc)
 {
+	u32 value;
 	int ret;
+
+	regmap_write(tc->regmap, PPI_D0S_CLRSIPOCOUNT, 3);
+	regmap_write(tc->regmap, PPI_D1S_CLRSIPOCOUNT, 3);
+	regmap_write(tc->regmap, PPI_D2S_CLRSIPOCOUNT, 3);
+	regmap_write(tc->regmap, PPI_D3S_CLRSIPOCOUNT, 3);
+	regmap_write(tc->regmap, PPI_D0S_ATMR, 0);
+	regmap_write(tc->regmap, PPI_D1S_ATMR, 0);
+	regmap_write(tc->regmap, PPI_TX_RX_TA, TTA_GET | TTA_SURE);
+	regmap_write(tc->regmap, PPI_LPTXTIMECNT, LPX_PERIOD);
+
+	value = ((LANEENABLE_L0EN << tc->dsi_lanes) - LANEENABLE_L0EN) |
+		LANEENABLE_CLEN;
+	regmap_write(tc->regmap, PPI_LANEENABLE, value);
+	regmap_write(tc->regmap, DSI_LANEENABLE, value);
+
+	/* Set input interface */
+	value = DP0_AUDSRC_NO_INPUT;
+	if (tc_test_pattern)
+		value |= DP0_VIDSRC_COLOR_BAR;
+	else
+		value |= DP0_VIDSRC_DSI_RX;
+	ret = regmap_write(tc->regmap, SYSCTRL, value);
+	if (ret)
+		return ret;
+
+	usleep_range(120, 150);
+
+	regmap_write(tc->regmap, PPI_STARTPPI, PPI_START_FUNCTION);
+	regmap_write(tc->regmap, DSI_STARTDSI, DSI_RX_START);
+
+	return 0;
+}
+
+static int tc_dpi_rx_enable(struct tc_data *tc)
+{
 	u32 value;
 
+	/* Set input interface */
+	value = DP0_AUDSRC_NO_INPUT;
+	if (tc_test_pattern)
+		value |= DP0_VIDSRC_COLOR_BAR;
+	else
+		value |= DP0_VIDSRC_DPI_RX;
+	return regmap_write(tc->regmap, SYSCTRL, value);
+}
+
+static int tc_dpi_stream_enable(struct tc_data *tc)
+{
+	int ret;
+
 	dev_dbg(tc->dev, "enable video stream\n");
 
 	/* Setup PLL */
@@ -1277,20 +1326,6 @@ static int tc_dpi_stream_enable(struct tc_data *tc)
 	if (ret)
 		return ret;
 
-	regmap_write(tc->regmap, PPI_D0S_CLRSIPOCOUNT, 3);
-	regmap_write(tc->regmap, PPI_D1S_CLRSIPOCOUNT, 3);
-	regmap_write(tc->regmap, PPI_D2S_CLRSIPOCOUNT, 3);
-	regmap_write(tc->regmap, PPI_D3S_CLRSIPOCOUNT, 3);
-	regmap_write(tc->regmap, PPI_D0S_ATMR, 0);
-	regmap_write(tc->regmap, PPI_D1S_ATMR, 0);
-	regmap_write(tc->regmap, PPI_TX_RX_TA, TTA_GET | TTA_SURE);
-	regmap_write(tc->regmap, PPI_LPTXTIMECNT, LPX_PERIOD);
-
-	value = ((LANEENABLE_L0EN << tc->dsi_lanes) - LANEENABLE_L0EN) |
-		LANEENABLE_CLEN;
-	regmap_write(tc->regmap, PPI_LANEENABLE, value);
-	regmap_write(tc->regmap, DSI_LANEENABLE, value);
-
 	ret = tc_set_common_video_mode(tc, &tc->mode);
 	if (ret)
 		return ret;
@@ -1299,22 +1334,7 @@ static int tc_dpi_stream_enable(struct tc_data *tc)
 	if (ret)
 		return ret;
 
-	/* Set input interface */
-	value = DP0_AUDSRC_NO_INPUT;
-	if (tc_test_pattern)
-		value |= DP0_VIDSRC_COLOR_BAR;
-	else
-		value |= DP0_VIDSRC_DSI_RX;
-	ret = regmap_write(tc->regmap, SYSCTRL, value);
-	if (ret)
-		return ret;
-
-	usleep_range(120, 150);
-
-	regmap_write(tc->regmap, PPI_STARTPPI, PPI_START_FUNCTION);
-	regmap_write(tc->regmap, DSI_STARTDSI, DSI_RX_START);
-
-	return 0;
+	return tc_dsi_rx_enable(tc);
 }
 
 static int tc_dpi_stream_disable(struct tc_data *tc)
@@ -1370,19 +1390,11 @@ static int tc_edp_stream_enable(struct tc_data *tc)
 	usleep_range(500, 1000);
 	value |= VID_EN;
 	ret = regmap_write(tc->regmap, DP0CTL, value);
-	if (ret)
-		return ret;
-	/* Set input interface */
-	value = DP0_AUDSRC_NO_INPUT;
-	if (tc_test_pattern)
-		value |= DP0_VIDSRC_COLOR_BAR;
-	else
-		value |= DP0_VIDSRC_DPI_RX;
-	ret = regmap_write(tc->regmap, SYSCTRL, value);
 	if (ret)
 		return ret;
 
-	return 0;
+	/* Set input interface */
+	return tc_dpi_rx_enable(tc);
 }
 
 static int tc_edp_stream_disable(struct tc_data *tc)
-- 
2.35.1

