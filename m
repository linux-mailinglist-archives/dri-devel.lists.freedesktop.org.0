Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80203751C88
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 11:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5E010E63F;
	Thu, 13 Jul 2023 09:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D038310E63B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 09:02:05 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1BFD26607044;
 Thu, 13 Jul 2023 10:02:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689238924;
 bh=a2y6iUVla5+pIn5z+7D4/kqdqycxBnWHIaW1Jg3D+Jw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZyYRsAknKyICraMTy11TZxc+BzNYewsw8kGo0g5N+QR71Qjj/AVQiake79dmRjACF
 3qlZ4966jbgvsLagb/XimBIfLXd12MrOIefyfKqMQo9ByxMQHcSPjKWsLxX+SvJdOn
 6X339smYOoXfrydGJpQukI3EQdQqOycIIRYcNAphaEYJg+/t+ap7Rf4nhrTDl0ir6s
 4x+B17LfRFcUodWMFZ2K22+eKy7wuHy7T/f9x8P5dCcyV93T8Em0VOEYXnKEimWhmR
 JtA/cO2JIjZtE8BZEbxP6cdudvMO2CaNiPBD8CFl62kasJS2Sb7f3Gr1VQxqdptgE6
 GvRI0NJ1Qy6RQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v5 08/10] drm/mediatek: dp: Add support for embedded
 DisplayPort aux-bus
Date: Thu, 13 Jul 2023 11:01:50 +0200
Message-Id: <20230713090152.140060-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230713090152.140060-1-angelogioacchino.delregno@collabora.com>
References: <20230713090152.140060-1-angelogioacchino.delregno@collabora.com>
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
 drivers/gpu/drm/mediatek/Kconfig  |  1 +
 drivers/gpu/drm/mediatek/mtk_dp.c | 85 ++++++++++++++++++++++++++++---
 2 files changed, 80 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index b451dee64d34..76cab28e010c 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -26,6 +26,7 @@ config DRM_MEDIATEK_DP
 	select PHY_MTK_DP
 	select DRM_DISPLAY_HELPER
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DP_AUX_BUS
 	help
 	  DRM/KMS Display Port driver for MediaTek SoCs.
 
diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 1684dbf7bbff..8668ab17135d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2022 BayLibre
  */
 
+#include <drm/display/drm_dp_aux_bus.h>
 #include <drm/display/drm_dp.h>
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_atomic_helper.h>
@@ -1313,9 +1314,11 @@ static void mtk_dp_power_disable(struct mtk_dp *mtk_dp)
 
 static void mtk_dp_initialize_priv_data(struct mtk_dp *mtk_dp)
 {
+	bool plugged_in = (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP);
+
 	mtk_dp->train_info.link_rate = DP_LINK_BW_5_4;
 	mtk_dp->train_info.lane_count = mtk_dp->max_lanes;
-	mtk_dp->train_info.cable_plugged_in = false;
+	mtk_dp->train_info.cable_plugged_in = plugged_in;
 
 	mtk_dp->info.format = DP_PIXELFORMAT_RGB;
 	memset(&mtk_dp->info.vm, 0, sizeof(struct videomode));
@@ -1617,6 +1620,16 @@ static int mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
 	u8 val;
 	ssize_t ret;
 
+	/*
+	 * If we're eDP and capabilities were already parsed we can skip
+	 * reading again because eDP panels aren't hotpluggable hence the
+	 * caps and training information won't ever change in a boot life
+	 */
+	if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP &&
+	    mtk_dp->rx_cap[DP_MAX_LINK_RATE] &&
+	    mtk_dp->train_info.sink_ssc)
+		return 0;
+
 	drm_dp_read_dpcd_caps(&mtk_dp->aux, mtk_dp->rx_cap);
 
 	if (drm_dp_tps4_supported(mtk_dp->rx_cap))
@@ -2025,15 +2038,14 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
 static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 				   struct drm_dp_aux_msg *msg)
 {
-	struct mtk_dp *mtk_dp;
+	struct mtk_dp *mtk_dp = container_of(mtk_aux, struct mtk_dp, aux);
 	bool is_read;
 	u8 request;
 	size_t accessed_bytes = 0;
 	int ret;
 
-	mtk_dp = container_of(mtk_aux, struct mtk_dp, aux);
-
-	if (!mtk_dp->train_info.cable_plugged_in) {
+	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP &&
+	    !mtk_dp->train_info.cable_plugged_in) {
 		ret = -EAGAIN;
 		goto err;
 	}
@@ -2496,6 +2508,29 @@ static int mtk_dp_register_phy(struct mtk_dp *mtk_dp)
 	return 0;
 }
 
+static int mtk_dp_edp_link_panel(struct drm_dp_aux *mtk_aux)
+{
+	struct mtk_dp *mtk_dp = container_of(mtk_aux, struct mtk_dp, aux);
+	struct device *dev = mtk_aux->dev;
+	int ret;
+
+	mtk_dp->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
+
+	/* Power off the DP and AUX: either detection is done, or no panel present */
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+			   DP_PWR_STATE_BANDGAP_TPLL,
+			   DP_PWR_STATE_MASK);
+	mtk_dp_power_disable(mtk_dp);
+
+	if (IS_ERR(mtk_dp->next_bridge)) {
+		ret = PTR_ERR(mtk_dp->next_bridge);
+		mtk_dp->next_bridge = NULL;
+		return ret;
+	}
+
+	return 0;
+}
+
 static int mtk_dp_probe(struct platform_device *pdev)
 {
 	struct mtk_dp *mtk_dp;
@@ -2526,9 +2561,10 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to parse dt\n");
 
-	drm_dp_aux_init(&mtk_dp->aux);
 	mtk_dp->aux.name = "aux_mtk_dp";
+	mtk_dp->aux.dev = dev;
 	mtk_dp->aux.transfer = mtk_dp_aux_transfer;
+	drm_dp_aux_init(&mtk_dp->aux);
 
 	spin_lock_init(&mtk_dp->irq_thread_lock);
 
@@ -2570,6 +2606,43 @@ static int mtk_dp_probe(struct platform_device *pdev)
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
+		 * Power on the AUX to allow reading the EDID from aux-bus:
+		 * please note that it is necessary to call power off in the
+		 * .done_probing() callback (mtk_dp_edp_link_panel), as only
+		 * there we can safely assume that we finished reading EDID.
+		 */
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+				   DP_PWR_STATE_BANDGAP_TPLL_LANE,
+				   DP_PWR_STATE_MASK);
+
+		ret = devm_of_dp_aux_populate_bus(&mtk_dp->aux, mtk_dp_edp_link_panel);
+		if (ret) {
+			/* -ENODEV this means that the panel is not on the aux-bus */
+			if (ret == -ENODEV) {
+				ret = mtk_dp_edp_link_panel(&mtk_dp->aux);
+				if (ret)
+					return ret;
+			} else {
+				mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+						   DP_PWR_STATE_BANDGAP_TPLL,
+						   DP_PWR_STATE_MASK);
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

