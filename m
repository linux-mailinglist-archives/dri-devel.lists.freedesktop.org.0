Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8048F749BCB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 14:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B2010E47D;
	Thu,  6 Jul 2023 12:30:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B453610E3EA
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 12:30:39 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C1FD96606FC5;
 Thu,  6 Jul 2023 13:30:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1688646638;
 bh=9O3oPbgNu2Rdb7yDbhzv2dqxXHdNKO6uVeeOVLaab60=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S9fh0zEBn+hmDuKxNXcSQGYU3PiJv74boIpg00AXRaYaeGZxP4Ni8Ny2Amkx7qdl/
 rGvdeaW6uqLFXPrlClXwRCWRp7wGTGV/jOzY/WKQjUXUhoohNueTEHC9IJSUul86UE
 DxSrEtVL2Z0LtEl86xJictTt3SMgb3bUIQFBa7+bu7Rc9RcXvcLqwKKC7kG3Pl/Bxq
 QYVMmO2xtndAaQnwDPrOKR+0Zb/dYTiZRAMmaRDmKKmBenFto8KbTOFVe62QqVh6/A
 1ptYi6/AAxC95PB9pW359bQlxj1cOZehIjH6WmcwllwetLsr9HJEFrNbqz5kro2fUK
 ttYiWsPLR7dxg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v4 9/9] drm/mediatek: dp: Add support for embedded DisplayPort
 aux-bus
Date: Thu,  6 Jul 2023 14:30:25 +0200
Message-Id: <20230706123025.208408-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230706123025.208408-1-angelogioacchino.delregno@collabora.com>
References: <20230706123025.208408-1-angelogioacchino.delregno@collabora.com>
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
Cc: nfraprado@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the eDP case we can support using aux-bus on MediaTek DP: this
gives us the possibility to declare our panel as generic "panel-edp"
which will automatically configure the timings and available modes
via the EDID that we read from it.

To do this, move the panel parsing at the end of the probe function
so that the hardware is initialized beforehand and also initialize
the DPTX AUX block and power both on as, when we populate the
aux-bus, the panel driver will trigger an EDID read to perform
panel detection.

Last but not least, since now the AUX transfers can happen in the
separated aux-bus, it was necessary to add an exclusion for the
cable_plugged_in check in `mtk_dp_aux_transfer()` and the easiest
way to do this is to simply ignore checking that when the bridge
type is eDP.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 72 ++++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 2ad836fbb7c4..16109d5ca5ae 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2022 BayLibre
  */
 
+#include <drm/display/drm_dp_aux_bus.h>
 #include <drm/display/drm_dp.h>
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_atomic_helper.h>
@@ -2042,7 +2043,8 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 
 	mtk_dp = container_of(mtk_aux, struct mtk_dp, aux);
 
-	if (!mtk_dp->train_info.cable_plugged_in) {
+	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP &&
+	    !mtk_dp->train_info.cable_plugged_in) {
 		ret = -EAGAIN;
 		goto err;
 	}
@@ -2153,6 +2155,11 @@ static int mtk_dp_bridge_attach(struct drm_bridge *bridge,
 	enable_irq(mtk_dp->irq);
 	mtk_dp_hwirq_enable(mtk_dp, true);
 
+	if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP) {
+		mtk_dp->train_info.cable_plugged_in = true;
+		drm_helper_hpd_irq_event(mtk_dp->drm_dev);
+	}
+
 	return 0;
 
 err_bridge_attach:
@@ -2482,6 +2489,25 @@ static int mtk_dp_register_audio_driver(struct device *dev)
 	return PTR_ERR_OR_ZERO(mtk_dp->audio_pdev);
 }
 
+static int mtk_dp_edp_link_panel(struct drm_dp_aux *mtk_aux)
+{
+	struct mtk_dp *mtk_dp = container_of(mtk_aux, struct mtk_dp, aux);
+	struct device *dev = mtk_aux->dev;
+	struct drm_bridge *panel_aux_bridge;
+
+	panel_aux_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
+
+	/* Power off the DP: either detection is done, or no panel present */
+	mtk_dp_aux_panel_poweron(mtk_dp, false);
+	mtk_dp_power_disable(mtk_dp);
+
+	if (IS_ERR(panel_aux_bridge))
+		return PTR_ERR(panel_aux_bridge);
+
+	mtk_dp->next_bridge = panel_aux_bridge;
+	return 0;
+}
+
 static int mtk_dp_probe(struct platform_device *pdev)
 {
 	struct mtk_dp *mtk_dp;
@@ -2500,21 +2526,14 @@ static int mtk_dp_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, mtk_dp->irq,
 				     "failed to request dp irq resource\n");
 
-	mtk_dp->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
-	if (IS_ERR(mtk_dp->next_bridge) &&
-	    PTR_ERR(mtk_dp->next_bridge) == -ENODEV)
-		mtk_dp->next_bridge = NULL;
-	else if (IS_ERR(mtk_dp->next_bridge))
-		return dev_err_probe(dev, PTR_ERR(mtk_dp->next_bridge),
-				     "Failed to get bridge\n");
-
 	ret = mtk_dp_dt_parse(mtk_dp, pdev);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to parse dt\n");
 
-	drm_dp_aux_init(&mtk_dp->aux);
 	mtk_dp->aux.name = "aux_mtk_dp";
+	mtk_dp->aux.dev = dev;
 	mtk_dp->aux.transfer = mtk_dp_aux_transfer;
+	drm_dp_aux_init(&mtk_dp->aux);
 
 	spin_lock_init(&mtk_dp->irq_thread_lock);
 
@@ -2570,6 +2589,39 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	mtk_dp->need_debounce = true;
 	timer_setup(&mtk_dp->debounce_timer, mtk_dp_debounce_timer, 0);
 
+	if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP) {
+		/*
+		 * Set the data lanes to idle in case the bootloader didn't
+		 * properly close the eDP port to avoid stalls and then
+		 * reinitialize, reset and power on the AUX block.
+		 */
+		mtk_dp_set_idle_pattern(mtk_dp, true);
+		mtk_dp_initialize_aux_settings(mtk_dp);
+		mtk_dp_power_enable(mtk_dp);
+
+		/*
+		 * Power on the panel to allow reading the EDID from aux-bus:
+		 * please note that it is necessary to call power off in the
+		 * .done_probing() callback (mtk_dp_edp_link_panel), as only
+		 * there we can safely assume that we finished reading EDID.
+		 */
+		mtk_dp_aux_panel_poweron(mtk_dp, true);
+
+		ret = devm_of_dp_aux_populate_bus(&mtk_dp->aux, mtk_dp_edp_link_panel);
+		if (ret) {
+			/* -ENODEV this means that the panel is not on the aux-bus */
+			if (ret == -ENODEV) {
+				ret = mtk_dp_edp_link_panel(&mtk_dp->aux);
+				if (ret)
+					return ret;
+			} else {
+				mtk_dp_aux_panel_poweron(mtk_dp, false);
+				mtk_dp_power_disable(mtk_dp);
+				return ret;
+			}
+		}
+	}
+
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
-- 
2.40.1

