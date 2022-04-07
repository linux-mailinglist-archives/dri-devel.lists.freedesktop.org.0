Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E74984F8783
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 20:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C0710ED93;
	Thu,  7 Apr 2022 18:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F151010ED92
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 18:56:34 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5DA9083C8E;
 Thu,  7 Apr 2022 20:56:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1649357792;
 bh=zpCoZ22es9Dh5dwFRdHq/mpum2ryKflITe3wO9uuWwE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gm5A7kvg3dpwhcEnrHscr+CIdtulPERFhn0OEWWAC0iS8QIJpw3yRqMGQLzcXGS7q
 O9PvCFt4ju1qJu3Flgyo0Kx0CER6X+D3gYqhzuKgC6+cXH6K1FKsp8R0Aihv7mSIal
 mIeT3LApcJkq4GScUlsC9GGiZUXcw65fLSEs+mlXA6FCudrs1SgAAp6aLi1AiPKrUL
 5kT4+RkMxLJ/3ij/scZwmmhxXHncp8tIKJAdHN4J/BWVP/gUgTht/QAmiQd0fxNLQu
 rttzbROQdolIJNvNCQ0M2dtjDAdVjwRHHOL12UUQaZPV+8aaS6n7I1JpgRzBBNAnj/
 LuH+t1rCSIaew==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm: bridge: icn6211: Add DSI lane count DT property
 parsing
Date: Thu,  7 Apr 2022 20:56:17 +0200
Message-Id: <20220407185617.179573-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407185617.179573-1-marex@denx.de>
References: <20220407185617.179573-1-marex@denx.de>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, robert.foss@linaro.org,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver currently hard-codes DSI lane count to two, however the chip
is capable of operating in 1..4 DSI lanes mode. Parse 'data-lanes' DT
property and program the result into DSI_CTRL register.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 6ce0633d4c089..e2b599a44275c 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -395,6 +395,11 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
 	/* dsi specific sequence */
 	chipone_writeb(icn, SYNC_EVENT_DLY, 0x80);
 	chipone_writeb(icn, HFP_MIN, hfp & 0xff);
+
+	/* DSI data lane count */
+	chipone_writeb(icn, DSI_CTRL,
+		    DSI_CTRL_UNKNOWN | DSI_CTRL_DSI_LANES(icn->dsi->lanes - 1));
+
 	chipone_writeb(icn, MIPI_PD_CK_LANE, 0xa0);
 	chipone_writeb(icn, PLL_CTRL(12), 0xff);
 	chipone_writeb(icn, MIPI_PN_SWAP, 0x00);
@@ -480,9 +485,23 @@ static void chipone_mode_set(struct drm_bridge *bridge,
 static int chipone_dsi_attach(struct chipone *icn)
 {
 	struct mipi_dsi_device *dsi = icn->dsi;
-	int ret;
+	struct device *dev = icn->dev;
+	struct device_node *endpoint;
+	int dsi_lanes, ret;
+
+	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
+	dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
+	of_node_put(endpoint);
+
+	/*
+	 * If the 'data-lanes' property does not exist in DT or is invalid,
+	 * default to previously hard-coded behavior, which was 4 data lanes.
+	 */
+	if (dsi_lanes >= 1 && dsi_lanes <= 4)
+		icn->dsi->lanes = dsi_lanes;
+	else
+		icn->dsi->lanes = 4;
 
-	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
 			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
-- 
2.35.1

