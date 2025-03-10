Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A02BA58B19
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 05:09:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAAD810E39B;
	Mon, 10 Mar 2025 04:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FDE10E2CD
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 04:09:21 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ZB3Gn6Cywz2CcB9;
 Mon, 10 Mar 2025 12:06:09 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id A83661401F2;
 Mon, 10 Mar 2025 12:09:19 +0800 (CST)
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 10 Mar 2025 12:09:18 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 drm-dp 5/9] drm/hisilicon/hibmc: Getting connector info and
 EDID by using AUX channel
Date: Mon, 10 Mar 2025 12:01:34 +0800
Message-ID: <20250310040138.2025715-6-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250310040138.2025715-1-shiyongbang@huawei.com>
References: <20250310040138.2025715-1-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.169.71.169]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd500013.china.huawei.com (7.221.188.12)
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

From: Baihan Li <libaihan@huawei.com>

Add registering drm_aux and use it to get connector edid with drm
functions. Add ddc channel in connector initialization to put drm_aux
in drm_connector.

Signed-off-by: Baihan Li <libaihan@huawei.com>
Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
ChangeLog:
v5 -> v6:
  - move the detect_ctx() to the patch 7/9.
v2 -> v3:
  - Capitalized EDID and AUX, suggested by Dmitry Baryshkov.
v1 -> v2:
  - deleting type conversion, suggested by Dmitry Baryshkov.
  - deleting hibmc_dp_connector_get_modes() and using drm_connector_helper_get_modes(), suggested by Dmitry Baryshkov.
---
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c   |  3 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 32 ++++++++++++++++---
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  5 +++
 3 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
index ded9e7ce887a..e0bb9b14d9d8 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
@@ -161,7 +161,8 @@ void hibmc_dp_aux_init(struct hibmc_dp *dp)
 				 HIBMC_DP_MIN_PULSE_NUM);
 
 	dp->aux.transfer = hibmc_dp_aux_xfer;
-	dp->aux.is_remote = 0;
+	dp->aux.name = kasprintf(GFP_KERNEL, "HIBMC DRM dp aux");
+	dp->aux.drm_dev = dp->drm_dev;
 	drm_dp_aux_init(&dp->aux);
 	dp->dp_dev->aux = &dp->aux;
 }
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
index 603d6b198a54..891fde237c16 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
@@ -15,11 +15,17 @@
 
 static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
 {
+	struct hibmc_dp *dp = to_hibmc_dp(connector);
+	const struct drm_edid *drm_edid;
 	int count;
 
-	count = drm_add_modes_noedid(connector, connector->dev->mode_config.max_width,
-				     connector->dev->mode_config.max_height);
-	drm_set_preferred_mode(connector, 1024, 768); // temporary implementation
+	drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
+
+	drm_edid_connector_update(connector, drm_edid);
+
+	count = drm_edid_connector_add_modes(connector);
+
+	drm_edid_free(drm_edid);
 
 	return count;
 }
@@ -28,12 +34,28 @@ static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
 	.get_modes = hibmc_dp_connector_get_modes,
 };
 
+static int hibmc_dp_late_register(struct drm_connector *connector)
+{
+	struct hibmc_dp *dp = to_hibmc_dp(connector);
+
+	return drm_dp_aux_register(&dp->aux);
+}
+
+static void hibmc_dp_early_unregister(struct drm_connector *connector)
+{
+	struct hibmc_dp *dp = to_hibmc_dp(connector);
+
+	drm_dp_aux_unregister(&dp->aux);
+}
+
 static const struct drm_connector_funcs hibmc_dp_conn_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = drm_connector_cleanup,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.late_register = hibmc_dp_late_register,
+	.early_unregister = hibmc_dp_early_unregister,
 };
 
 static inline int hibmc_dp_prepare(struct hibmc_dp *dp, struct drm_display_mode *mode)
@@ -103,8 +125,8 @@ int hibmc_dp_init(struct hibmc_drm_private *priv)
 
 	drm_encoder_helper_add(encoder, &hibmc_dp_encoder_helper_funcs);
 
-	ret = drm_connector_init(dev, connector, &hibmc_dp_conn_funcs,
-				 DRM_MODE_CONNECTOR_DisplayPort);
+	ret = drm_connector_init_with_ddc(dev, connector, &hibmc_dp_conn_funcs,
+					  DRM_MODE_CONNECTOR_DisplayPort, &dp->aux.ddc);
 	if (ret) {
 		drm_err(dev, "init dp connector failed: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
index d982f1e4b958..3ddd71aada66 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
@@ -47,6 +47,11 @@ static inline struct hibmc_vdac *to_hibmc_vdac(struct drm_connector *connector)
 	return container_of(connector, struct hibmc_vdac, connector);
 }
 
+static inline struct hibmc_dp *to_hibmc_dp(struct drm_connector *connector)
+{
+	return container_of(connector, struct hibmc_dp, connector);
+}
+
 static inline struct hibmc_drm_private *to_hibmc_drm_private(struct drm_device *dev)
 {
 	return container_of(dev, struct hibmc_drm_private, dev);
-- 
2.33.0

