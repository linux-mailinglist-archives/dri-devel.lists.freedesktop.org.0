Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 215694D1237
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 09:28:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1EA10ED67;
	Tue,  8 Mar 2022 08:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FA410ED68
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 08:27:58 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id b8so16480562pjb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 00:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jKy7I9I8Tl8QKPFeqo0bxcmj+twFQO/bhH9VV5YQjBM=;
 b=ZF2eH5yHGgUijGzSupyWZKa/LBxvZPUxXP2gVfxmJ/VoGG7HMQibadq0YB48i1Uu9c
 hB0EirjSX+maDlI6oNNdwChvBpb7bG4FVArxkAtk5MMfEtvzWveUr5GZznJx3e4nbIca
 Nt1p2pHWnGONkftgRozIyY109QfYwTcIjum3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jKy7I9I8Tl8QKPFeqo0bxcmj+twFQO/bhH9VV5YQjBM=;
 b=h3kfHViUNC0jyYFCMhK6BLoRolnN+yd231bJbw66kCvYuGNZEBlVI6YPE2WHuK4wxD
 6w/MEEV5L8s0jbuRo7T+UuRPT6Sf+K8pH1RXB0X9YZbJI8Q6SsKNQVFQnccJD2NGeEkh
 U3bsVOCA/KJ5trE1i5Jk1bvfuq4eay/GmR8xFJB4bDPYxAbfnzDijZCTm4+fToaJ4c6c
 ou/rDrH9yxhE3MEynW+S1TWZFMxPKLG3Fdi5i94zafo5LJHr0b2GZ+WkPvYzyei0FhLJ
 cDm1AclSxN1ZydT7nq/LSCwEZUHDZgzpKyfGsWJj/unyE1PW8jOsT/t4yomOIFRqNcmE
 dHwQ==
X-Gm-Message-State: AOAM533gBPcBBDsAqqbrmmwWEJL70sV9i6nw+P/NxqcClP+MLlFH7zBL
 is1YCjQObDriPb0IDg3WyXuzNw==
X-Google-Smtp-Source: ABdhPJyFBJ9U+ScszFWKXwENgBDExh35WD+1NQflcxZN+7X8zDtI37URKAiLdZ7eKSAqJ3RShkO41w==
X-Received: by 2002:a17:90b:1b04:b0:1bf:4ad2:8b2a with SMTP id
 nu4-20020a17090b1b0400b001bf4ad28b2amr3457850pjb.184.1646728077832; 
 Tue, 08 Mar 2022 00:27:57 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:c770:6f0b:21a:8de4])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a17090a560100b001bf72b5af97sm2000671pjf.13.2022.03.08.00.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 00:27:57 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 8/8] drm: bridge: mcde_dsi: Switch to devm_drm_of_get_bridge
Date: Tue,  8 Mar 2022 13:57:26 +0530
Message-Id: <20220308082726.77482-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308082726.77482-1-jagan@amarulasolutions.com>
References: <20220308082726.77482-1-jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

devm_drm_of_get_bridge is capable of looking up the downstream
bridge and panel and trying to add a panel bridge if the panel
is found.

Replace explicit finding calls with devm_drm_of_get_bridge.

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
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

