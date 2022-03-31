Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 864A64EDDB3
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A984D10F3F4;
	Thu, 31 Mar 2022 15:45:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE89B10F3F1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:45:36 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id w7so19750429pfu.11
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 08:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vp100snWzjlwIzMGFemdwqiCb11PotYbxi064xgRA5s=;
 b=b9ce5lv9Ou4S/oSLOEGDJXUqDgKQbmFZe9Sqt8O3IMxZzLNBOsHmpPnYkrZxy97Z8t
 7pfevTlq/hKZLuQ5gMsOhI6C3kEiFyK3sC73qxFCBxpX5mh06qVd/77qraOM+KUJcEVX
 NElORuw17Wjo+oILcHMSJq9yZfG/7LBVESt1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vp100snWzjlwIzMGFemdwqiCb11PotYbxi064xgRA5s=;
 b=NvES54ZdaLpEZF1twNAK5M9aVGrJy/CYCi9LMCmVdYD/1E641H0IJXFTVnYbxAKiLD
 U0CwdSDn2vvyfDrTKbPT7ouY383N1uUM3Fe8nQasKxAAhyu32hNXhIyDQ7cRQ1PruhhX
 TD8lIF4cK/UoKEbd7+8lH27tyU8BAGw0MS6CgK3c/pr1lM7Mwsd16Ay/LCXhDFNSmqVs
 CpVDh1OBo1X+Fv4ZvJUiKGnzrUkQLvgeli1SE5E/EXjLufvXERMu9MWJVG3rEqyQej61
 MP96ps1LwnRPBXQABeQqEi9FXZ8TaoC0jBCkDcEMzcrszygV7Tzb/+dQryS2L+Syb3ny
 krpQ==
X-Gm-Message-State: AOAM5335egwn/Ai+Gl8CS7mKt1KFMH6iq1ckHIGBd5uZEKHQhItMDBHL
 c0Apf10Xtkv2dpwssCGBjkqynw==
X-Google-Smtp-Source: ABdhPJx3nEqyaVBFRf2lDqEWVOJTowcxRwZQQrwMFWeGvSMXXMJaMH8KBhTQpLwCDCAbWLfNCa4GNw==
X-Received: by 2002:a63:e617:0:b0:382:9ad9:d829 with SMTP id
 g23-20020a63e617000000b003829ad9d829mr11232400pgh.553.1648741536347; 
 Thu, 31 Mar 2022 08:45:36 -0700 (PDT)
Received: from localhost.localdomain ([183.83.137.38])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a17090adac100b001c67cedd84esm10205684pjx.42.2022.03.31.08.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 08:45:35 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 5/5] drm: bridge: mcde_dsi: Switch to devm_drm_of_get_bridge
Date: Thu, 31 Mar 2022 21:15:03 +0530
Message-Id: <20220331154503.66054-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331154503.66054-1-jagan@amarulasolutions.com>
References: <20220331154503.66054-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-amarula@amarulasolutions.com, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

devm_drm_of_get_bridge is capable of looking up the downstream
bridge and panel and trying to add a panel bridge if the panel
is found.

Replace explicit finding calls with devm_drm_of_get_bridge.

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes for v4:
- collect r-b
Changes for v3:
- fix commit head
- drop panel.h
- use drm_bridge_remove
Changes for v2:
- split the patch

 drivers/gpu/drm/mcde/mcde_dsi.c | 44 +++++----------------------------
 1 file changed, 6 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 5651734ce977..083a4728654d 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -19,7 +19,6 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -39,7 +38,6 @@ struct mcde_dsi {
 	struct device *dev;
 	struct mcde *mcde;
 	struct drm_bridge bridge;
-	struct drm_panel *panel;
 	struct drm_bridge *bridge_out;
 	struct mipi_dsi_host dsi_host;
 	struct mipi_dsi_device *mdsi;
@@ -1073,9 +1071,7 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 	struct drm_device *drm = data;
 	struct mcde *mcde = to_mcde(drm);
 	struct mcde_dsi *d = dev_get_drvdata(dev);
-	struct device_node *child;
-	struct drm_panel *panel = NULL;
-	struct drm_bridge *bridge = NULL;
+	struct drm_bridge *bridge;
 
 	if (!of_get_available_child_count(dev->of_node)) {
 		dev_info(dev, "unused DSI interface\n");
@@ -1100,37 +1096,10 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 		return PTR_ERR(d->lp_clk);
 	}
 
-	/* Look for a panel as a child to this node */
-	for_each_available_child_of_node(dev->of_node, child) {
-		panel = of_drm_find_panel(child);
-		if (IS_ERR(panel)) {
-			dev_err(dev, "failed to find panel try bridge (%ld)\n",
-				PTR_ERR(panel));
-			panel = NULL;
-
-			bridge = of_drm_find_bridge(child);
-			if (!bridge) {
-				dev_err(dev, "failed to find bridge\n");
-				return -EINVAL;
-			}
-		}
-	}
-	if (panel) {
-		bridge = drm_panel_bridge_add_typed(panel,
-						    DRM_MODE_CONNECTOR_DSI);
-		if (IS_ERR(bridge)) {
-			dev_err(dev, "error adding panel bridge\n");
-			return PTR_ERR(bridge);
-		}
-		dev_info(dev, "connected to panel\n");
-		d->panel = panel;
-	} else if (bridge) {
-		/* TODO: AV8100 HDMI encoder goes here for example */
-		dev_info(dev, "connected to non-panel bridge (unsupported)\n");
-		return -ENODEV;
-	} else {
-		dev_err(dev, "no panel or bridge\n");
-		return -ENODEV;
+	bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
+	if (IS_ERR(bridge)) {
+		dev_err(dev, "error to get bridge\n");
+		return PTR_ERR(bridge);
 	}
 
 	d->bridge_out = bridge;
@@ -1153,8 +1122,7 @@ static void mcde_dsi_unbind(struct device *dev, struct device *master,
 {
 	struct mcde_dsi *d = dev_get_drvdata(dev);
 
-	if (d->panel)
-		drm_panel_bridge_remove(d->bridge_out);
+	drm_bridge_remove(d->bridge_out);
 	regmap_update_bits(d->prcmu, PRCM_DSI_SW_RESET,
 			   PRCM_DSI_SW_RESET_DSI0_SW_RESETN, 0);
 }
-- 
2.25.1

