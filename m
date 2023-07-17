Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 345FF756619
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 16:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB9D10E26B;
	Mon, 17 Jul 2023 14:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69DA110E26B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 14:14:52 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8363A6607071;
 Mon, 17 Jul 2023 15:14:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689603291;
 bh=jf7ly6xH04o4w4wKu1Ls3wp4+T9ztA3FEMOCyHRd1vU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GqPZ4Ci1hQkp6b08Wxr6wAh3WnaWUyGxp1Dtpz9Q2fn8jiMUxGl4PEsuEYRljZMZb
 z7U3QaOwUE/qVYB7/WYQTlKoVNhYyn3DT6gS0PmMGT9qSFY06fV0RVtdtEAOVt8veo
 6NLapybuWIiwSgwRz1d46Wly2oyrp8dE07XeMd2U5XM7Mx9zAaT5axpj9t7PWMsrlg
 y0y9GEnFbsIoipTseTDb54AF8ImCF/Hz/GqRPVBKddsqjMdtFr84BXJleyrRv4beRX
 6ZB6J7P8lWoEky5/3ik0SDck0G1OIl6y7b6nKuuekx2okFNj3TydzPrsb7bhSQ8pe6
 UlykQZ38XHqRg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v6 09/11] drm/mediatek: dp: Add support for embedded
 DisplayPort aux-bus
Date: Mon, 17 Jul 2023 16:14:36 +0200
Message-Id: <20230717141438.274419-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
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
 drivers/gpu/drm/mediatek/mtk_dp.c | 84 ++++++++++++++++++++++++++++---
 2 files changed, 79 insertions(+), 6 deletions(-)

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
index 1b4219e6a00b..acdd457b5449 100644
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
 	ret = drm_dp_read_dpcd_caps(&mtk_dp->aux, mtk_dp->rx_cap);
 	if (ret < 0)
 		return ret;
@@ -2030,15 +2043,14 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
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
@@ -2501,6 +2513,28 @@ static int mtk_dp_register_phy(struct mtk_dp *mtk_dp)
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
+	return 0;
+}
+
 static int mtk_dp_probe(struct platform_device *pdev)
 {
 	struct mtk_dp *mtk_dp;
@@ -2531,9 +2565,10 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to parse dt\n");
 
-	drm_dp_aux_init(&mtk_dp->aux);
 	mtk_dp->aux.name = "aux_mtk_dp";
+	mtk_dp->aux.dev = dev;
 	mtk_dp->aux.transfer = mtk_dp_aux_transfer;
+	drm_dp_aux_init(&mtk_dp->aux);
 
 	spin_lock_init(&mtk_dp->irq_thread_lock);
 
@@ -2577,6 +2612,43 @@ static int mtk_dp_probe(struct platform_device *pdev)
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

