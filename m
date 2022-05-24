Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0178A53201B
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 03:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2565310E965;
	Tue, 24 May 2022 01:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E4E10E8C3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 01:05:49 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D619883F64;
 Tue, 24 May 2022 03:05:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1653354347;
 bh=vsh1y74N+kIn1FtplRqRNgoDGBqO8p4JVoROz3Whxp0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q/hkUqaZoN68vp8MDr8HQZIM15ey2MjzqBGGvWoh3PAGKx6vats0z4WHqS+W+mvJD
 uBcQF3bW2yfDg2UR7zwakZv1P/jGiusC8gwPegeopNT7hzWwJi7ii3eT0qcCknLVQt
 buiM2G37BafcDRqoirE4ENX+0db7Uy3yi3Datnt/3rf8PtURtCvOs+VqgXNZyCludd
 LvjTqGnwGeSbCIHlescB9VogOf+Nz3HPGcJSivb5Z+qfvAMirD51araWPcbaX2cbSk
 EMiLwGDh+WlJUizWj8w6IRKtitxUdNBJSx+pDNnemX7x2H9tQDwOeGh0JZ14ochbzb
 n+KM/4IXe3f8A==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 03/11] drm/bridge: icn6211: Convert to
 drm_of_get_data_lanes_count_ep
Date: Tue, 24 May 2022 03:05:14 +0200
Message-Id: <20220524010522.528569-3-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220524010522.528569-1-marex@denx.de>
References: <20220524010522.528569-1-marex@denx.de>
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
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Maxime Ripard <maxime@cerno.tech>, robert.foss@linaro.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert driver to use this new helper to standardize
OF "data-lanes" parsing.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
---
V2: - Rename drm_of_get_data_lanes{,_ep} to drm_of_get_data_lanes_count{,_ep}
    - Add RB from Andrzej
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 45bb89ac3fff7..6214990354d8f 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -496,21 +496,18 @@ static int chipone_dsi_attach(struct chipone *icn)
 {
 	struct mipi_dsi_device *dsi = icn->dsi;
 	struct device *dev = icn->dev;
-	struct device_node *endpoint;
 	int dsi_lanes, ret;
 
-	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
-	dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
-	of_node_put(endpoint);
+	dsi_lanes = drm_of_get_data_lanes_count_ep(dev->of_node, 0, 0, 1, 4);
 
 	/*
 	 * If the 'data-lanes' property does not exist in DT or is invalid,
 	 * default to previously hard-coded behavior, which was 4 data lanes.
 	 */
-	if (dsi_lanes >= 1 && dsi_lanes <= 4)
-		icn->dsi->lanes = dsi_lanes;
-	else
+	if (dsi_lanes < 0)
 		icn->dsi->lanes = 4;
+	else
+		icn->dsi->lanes = dsi_lanes;
 
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-- 
2.35.1

