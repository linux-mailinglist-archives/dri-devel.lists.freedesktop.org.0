Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A57A652D172
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 13:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1C811A35B;
	Thu, 19 May 2022 11:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393FC11A283
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 11:27:13 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9517083C7B;
 Thu, 19 May 2022 13:27:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1652959631;
 bh=yCKLbYkk0W7gF+jW4YsOpZ9MHXZLoImD2Zulfti44Hg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UjVmoMHwpxSP9QMFF0l2GRmtaT4XR+oXelLW1mNz8NakCWxCFaANl906duLD95T2Z
 wo8Dx4mX4b/Z+TdSWZYyMPbIPCfUXQEvEdkJBZXZ4/PCj7X1rdTJOsgTDVzGNzuCOV
 k+Mini7ibmc1fI/D9pV3EJv1YwdR2ctzsBZrvcR1AkyvSEP/ibDkP/gGXKiml1rxw0
 l3c8efOQC7dMIlmqUCs3kRmSqIn40zc0XBXlJ+dGciXBL9Li+G+nvkahM4TUVwbhlg
 KVwKukNuw+aHUT/Fm+xfNe/DNu0wnmMx+8JGr10/ZQ1cYVtYGkqTImPlUAD0pAy/Un
 X9bBPGcKqY6gw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/11] drm/bridge: rcar: Convert to drm_of_get_data_lanes_ep
Date: Thu, 19 May 2022 13:26:57 +0200
Message-Id: <20220519112657.62283-11-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220519112657.62283-1-marex@denx.de>
References: <20220519112657.62283-1-marex@denx.de>
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
 Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert driver to use this new helper to standardize
OF "data-lanes" parsing.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index 891bb956fd61b..915c74c0a37fd 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -683,19 +683,10 @@ static int rcar_mipi_dsi_parse_dt(struct rcar_mipi_dsi *dsi)
 	u32 data_lanes[4];
 	int ret;
 
-	ep = of_graph_get_endpoint_by_regs(dsi->dev->of_node, 1, 0);
-	if (!ep) {
-		dev_dbg(dsi->dev, "unconnected port@1\n");
-		return -ENODEV;
-	}
-
-	ret = of_property_read_variable_u32_array(ep, "data-lanes", data_lanes,
-						  1, 4);
-	of_node_put(ep);
-
+	ret = drm_of_get_data_lanes_ep(dsi->dev->of_node, 1, 0, 1, 4);
 	if (ret < 0) {
 		dev_err(dsi->dev, "missing or invalid data-lanes property\n");
-		return -ENODEV;
+		return ret;
 	}
 
 	dsi->num_data_lanes = ret;
-- 
2.35.1

