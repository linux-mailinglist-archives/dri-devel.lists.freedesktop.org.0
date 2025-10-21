Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3E9BF46B4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 04:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5BB10E563;
	Tue, 21 Oct 2025 02:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="U83UYt06";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973186.qiye.163.com (mail-m1973186.qiye.163.com
 [220.197.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E110D10E563
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 02:58:27 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2697bbb99;
 Tue, 21 Oct 2025 10:58:22 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 m.szyprowski@samsung.com, luca.ceresoli@bootlin.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v7 13/18] drm/bridge: analogix_dp: Add new API
 analogix_dp_finish_probe()
Date: Tue, 21 Oct 2025 10:56:59 +0800
Message-Id: <20251021025701.1524229-6-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251021025701.1524229-1-damon.ding@rock-chips.com>
References: <20251021023130.1523707-1-damon.ding@rock-chips.com>
 <20251021025701.1524229-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a04b4188e03a3kunmcdd3bf8c5a4743
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkJLQlZNH0hJGk9JThpCS0tWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=U83UYt06ieBEd3GQrtvD44AGBu+fdZUSwPFjOqn/eG2BKUrNt+CAJllx8G2iyrUPaMjPs9SsXRX7l2t99oxBnY5lhUyzvrvVDCChiFJ0QGV5/rKdxvlcqtbJRVayBufxUwHwzMmutIHFsA0fMq5DZqKn/arbds+P0yCah4QpA/g=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=b4eLcONxj3fXb5R2acgcxDhVDGBywKwE0CE0kXriyQY=;
 h=date:mime-version:subject:message-id:from;
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the panel/bridge should logically be positioned behind the
Analogix bridge in the display pipeline, it makes sense to handle
the panel/bridge parsing on the Analogix side. Therefore, we add
a new API analogix_dp_finish_probe(), which combines the panel/bridge
parsing with component addition, to do it.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

---

Changes in v4:
- Rename the &analogix_dp_plat_data.bridge to
  &analogix_dp_plat_data.next_bridge.
- Remame API analogix_dp_find_panel_or_bridge() to
  analogix_dp_finish_probe().

Changes in v5:
- Select DRM_DISPLAY_DP_AUX_BUS for DRM_ANALOGIX_DP.
---
 drivers/gpu/drm/bridge/analogix/Kconfig       |  1 +
 .../drm/bridge/analogix/analogix_dp_core.c    | 48 +++++++++++++++++++
 include/drm/bridge/analogix_dp.h              |  2 +
 3 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
index 4846b2e9be7c..964122b5bd39 100644
--- a/drivers/gpu/drm/bridge/analogix/Kconfig
+++ b/drivers/gpu/drm/bridge/analogix/Kconfig
@@ -29,6 +29,7 @@ config DRM_ANALOGIX_ANX78XX
 config DRM_ANALOGIX_DP
 	tristate
 	depends on DRM
+	select DRM_DISPLAY_DP_AUX_BUS
 
 config DRM_ANALOGIX_ANX7625
 	tristate "Analogix Anx7625 MIPI to DP interface support"
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 81c6e81dd352..933f1843777f 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -20,12 +20,14 @@
 #include <linux/platform_device.h>
 
 #include <drm/bridge/analogix_dp.h>
+#include <drm/display/drm_dp_aux_bus.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -1581,6 +1583,52 @@ struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp)
 }
 EXPORT_SYMBOL_GPL(analogix_dp_get_aux);
 
+static int analogix_dp_aux_done_probing(struct drm_dp_aux *aux)
+{
+	struct analogix_dp_device *dp = to_dp(aux);
+	struct analogix_dp_plat_data *plat_data = dp->plat_data;
+	int port = plat_data->dev_type == EXYNOS_DP ? 0 : 1;
+	int ret;
+
+	/*
+	 * If drm_of_find_panel_or_bridge() returns -ENODEV, there may be no valid panel
+	 * or bridge nodes. The driver should go on for the driver-free bridge or the DP
+	 * mode applications.
+	 */
+	ret = drm_of_find_panel_or_bridge(dp->dev->of_node, port, 0,
+					  &plat_data->panel, &plat_data->next_bridge);
+	if (ret && ret != -ENODEV)
+		return ret;
+
+	return component_add(dp->dev, plat_data->ops);
+}
+
+int analogix_dp_finish_probe(struct analogix_dp_device *dp)
+{
+	int ret;
+
+	ret = devm_of_dp_aux_populate_bus(&dp->aux, analogix_dp_aux_done_probing);
+	if (ret) {
+		/*
+		 * If devm_of_dp_aux_populate_bus() returns -ENODEV, the done_probing() will
+		 * not be called because there are no EP devices. Then the callback function
+		 * analogix_dp_aux_done_probing() will be called directly in order to support
+		 * the other valid DT configurations.
+		 *
+		 * NOTE: The devm_of_dp_aux_populate_bus() is allowed to return -EPROBE_DEFER.
+		 */
+		if (ret != -ENODEV) {
+			dev_err(dp->dev, "failed to populate aux bus\n");
+			return ret;
+		}
+
+		return analogix_dp_aux_done_probing(&dp->aux);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(analogix_dp_finish_probe);
+
 MODULE_AUTHOR("Jingoo Han <jg1.han@samsung.com>");
 MODULE_DESCRIPTION("Analogix DP Core Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 3428ffff24c5..bae969dec63a 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -30,6 +30,7 @@ struct analogix_dp_plat_data {
 	struct drm_bridge *next_bridge;
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
+	const struct component_ops *ops;
 
 	int (*power_on)(struct analogix_dp_plat_data *);
 	int (*power_off)(struct analogix_dp_plat_data *);
@@ -49,5 +50,6 @@ int analogix_dp_stop_crc(struct drm_connector *connector);
 
 struct analogix_dp_plat_data *analogix_dp_aux_to_plat_data(struct drm_dp_aux *aux);
 struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp);
+int analogix_dp_finish_probe(struct analogix_dp_device *dp);
 
 #endif /* _ANALOGIX_DP_H_ */
-- 
2.34.1

