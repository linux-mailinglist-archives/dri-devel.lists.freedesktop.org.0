Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2FB4BC360
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 01:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDF110EABB;
	Sat, 19 Feb 2022 00:29:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8260D10EA7E
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 00:29:06 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D7E9683BA2;
 Sat, 19 Feb 2022 01:29:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645230545;
 bh=omuqhxDL60Kp051Ey9wmAuH7K5IB+pkShX1jBNb3Vao=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TIYSbxV1r3DfljFY2Rt94D2wpAV0yEX5LGZF8Jyqu2y5aG92IdnCPT7CBVrtsgG2L
 FyKavkPO8089UbveBGZvG6O1dBKtFjHT29GfFQnTOcbuq9MZHlrMRsFqI2anciqij/
 Qhu5K8PCzjr55rUYmz3f2m/lpZE8FBpjXsdA5jgaVWb/Gz41J7dWnEtXcM6JnAYyJw
 X/NZF0WFgXUaE1ROUmBdzZqpMhXZY28vylKNNNfdnJWlNnHrnD0mnFgNwaLXznbH+c
 jYNBdt71Pom6lvvAWicoBsXkqA7dBlxNo55+P7zuhmZsQZ4Mdqd5+sDEbT5ysTEBV2
 /pJOL0zRKrFEg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/7] drm/bridge: dw-mipi-dsi: Move PLL setup into atomic_enable
Date: Sat, 19 Feb 2022 01:28:41 +0100
Message-Id: <20220219002844.362157-5-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220219002844.362157-1-marex@denx.de>
References: <20220219002844.362157-1-marex@denx.de>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <narmstrong@baylibre.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bridge clock configuration should happen in atomic_enable
instead of mode_set callback, since that is where the current
state of the bridge is available. Move the clock configuration
into atomic_enable callback.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index f4a6e4da903ca..7a2ea21dc0554 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -267,6 +267,8 @@ struct dw_mipi_dsi {
 	u32 format;
 	unsigned long mode_flags;
 
+	struct drm_display_mode mode;
+
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs;
 	struct debugfs_entries *debugfs_vpg;
@@ -1045,15 +1047,18 @@ static void dw_mipi_dsi_bridge_mode_set(struct drm_bridge *bridge,
 {
 	struct dw_mipi_dsi *dsi = bridge_to_dsi(bridge);
 
-	dw_mipi_dsi_mode_set(dsi, adjusted_mode);
-	if (dsi->slave)
-		dw_mipi_dsi_mode_set(dsi->slave, adjusted_mode);
+	drm_mode_copy(&dsi->mode, adjusted_mode);
 }
 
 static void dw_mipi_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
 					     struct drm_bridge_state *old_bridge_state)
 {
 	struct dw_mipi_dsi *dsi = bridge_to_dsi(bridge);
+	const struct drm_display_mode *adjusted_mode = &dsi->mode;
+
+	dw_mipi_dsi_mode_set(dsi, adjusted_mode);
+	if (dsi->slave)
+		dw_mipi_dsi_mode_set(dsi->slave, adjusted_mode);
 
 	/* Switch to video mode for panel-bridge enable & panel enable */
 	dw_mipi_dsi_set_mode(dsi, MIPI_DSI_MODE_VIDEO);
-- 
2.34.1

