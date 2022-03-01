Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 733C14C8D6F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 15:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F56410E9E4;
	Tue,  1 Mar 2022 14:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF13D10E9E4
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 14:13:29 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 q8-20020a17090a178800b001bc299b8de1so2288057pja.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 06:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8VZ+1+x00//VHYdLM+85OInV2D6cw8S7xV1ddz5BzBo=;
 b=RwZ6EPrZk5uBGp0BSa/TfQFzC4O05J6LaQlM/IdbCIpvsb225oA/ID9VPASeNKOCLb
 fOcS71519hI9LC1jv4BS7kzDtb6RAAoQDA/dd/cVbTIKyDVrqdhWs55z6BKYB3Rp2/F4
 7+hZiVlgpHUTYj1MXM4wTbsyl5634FLKAwbOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8VZ+1+x00//VHYdLM+85OInV2D6cw8S7xV1ddz5BzBo=;
 b=tI/8WwW+wkOvStTydMsaEogH91VqCf8Ma4ngqWvXVMKdA1MNm0hIinyetnTmBbLM+l
 JbwJmA5DhjMyLQwA7EPiJPEs4zgkZ/O2lVg1tSzkHmCEkoBiqty+zOmKLrftDibRvpdn
 wkHUjHovL5ML15ChFEP3OvqEbrd0z0TvcnfR4PewwR/k44vJxVXekOb/YwAWIbHoyuXO
 apax4syCDpQ2ZYhA416Ohwz3fvp0XE2nBr0wxWPxJt+XXh3kDVjiAEoh4UvLKVNDLSWd
 eAL8s/9wWKe0kNXeVuB7O+INSqK6oMuORn43Ggcul9cifN8phmx82sE3UZnk5bwtbgqP
 nc3w==
X-Gm-Message-State: AOAM5337lV9uiGNIv83vpkL2upqfwdBZMgXodUs21rlZ189/eFAaCkyl
 Fpn9PmnvXRuc6z8fHbFPc286nQ==
X-Google-Smtp-Source: ABdhPJyqUQXIKIkRpcimMN3gJso/NQITLT80HwlQNijX3ni08L0HCBQyA77jhLHAwH3/uA4OMlCXbw==
X-Received: by 2002:a17:903:32d0:b0:150:9b8b:12b2 with SMTP id
 i16-20020a17090332d000b001509b8b12b2mr21081165plr.40.1646144009458; 
 Tue, 01 Mar 2022 06:13:29 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:dbfb:dee9:8dc1:861a])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a056a0010cb00b004e1b76b09c0sm17317571pfu.74.2022.03.01.06.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 06:13:28 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2 8/8] drm: bridge: anx7625: Switch to devm_drm_of_get_bridge
Date: Tue,  1 Mar 2022 19:42:47 +0530
Message-Id: <20220301141247.126911-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301141247.126911-1-jagan@amarulasolutions.com>
References: <20220301141247.126911-1-jagan@amarulasolutions.com>
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
Changes for v2:
- split the patch

 drivers/gpu/drm/mcde/mcde_dsi.c | 39 +++++----------------------------
 1 file changed, 5 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 5651734ce977..9371349b8b25 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -1073,9 +1073,7 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 	struct drm_device *drm = data;
 	struct mcde *mcde = to_mcde(drm);
 	struct mcde_dsi *d = dev_get_drvdata(dev);
-	struct device_node *child;
-	struct drm_panel *panel = NULL;
-	struct drm_bridge *bridge = NULL;
+	struct drm_bridge *bridge;
 
 	if (!of_get_available_child_count(dev->of_node)) {
 		dev_info(dev, "unused DSI interface\n");
@@ -1100,37 +1098,10 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
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
-- 
2.25.1

