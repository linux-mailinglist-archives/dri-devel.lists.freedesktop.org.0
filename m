Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29852A2F077
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 15:57:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B2310E585;
	Mon, 10 Feb 2025 14:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA72E10E1EA
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 14:57:10 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Ys6yW4HSzz2FcV3;
 Mon, 10 Feb 2025 22:53:23 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 237EE1A0188;
 Mon, 10 Feb 2025 22:57:07 +0800 (CST)
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 10 Feb 2025 22:57:05 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 drm-dp 3/7] drm/hisilicon/hibmc: Getting connector info and
 edid by using aux channel
Date: Mon, 10 Feb 2025 22:49:55 +0800
Message-ID: <20250210144959.100551-4-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250210144959.100551-1-shiyongbang@huawei.com>
References: <20250210144959.100551-1-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.169.71.169]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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

Registering drm_aux and using it to get connector edid with drm functions.
Refactoring some structs to fit aux's register framework. We need change
a lot about getting member of drm_aux, because we change it's postions from
struct hibmc_dp_dev to struct hibmc_dp.

Signed-off-by: Baihan Li <libaihan@huawei.com>
Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
---
ChangeLog:
v1 -> v2:
  - deleting type conversion, suggested by Dmitry Baryshkov.
  - deleting hibmc_dp_connector_get_modes() and using drm_connector_helper_get_modes(), suggested by Dmitry Baryshkov.
---
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c   | 16 ++++++----
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  7 +++--
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  2 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  2 ++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 22 +++++++-------
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 30 +++++++++++--------
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  5 ++++
 7 files changed, 52 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
index 0a903cce1fa9..e0bb9b14d9d8 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
@@ -8,6 +8,7 @@
 #include <drm/drm_print.h>
 #include "dp_comm.h"
 #include "dp_reg.h"
+#include "dp_hw.h"
 
 #define HIBMC_AUX_CMD_REQ_LEN		GENMASK(7, 4)
 #define HIBMC_AUX_CMD_ADDR		GENMASK(27, 8)
@@ -124,7 +125,8 @@ static int hibmc_dp_aux_parse_xfer(struct hibmc_dp_dev *dp, struct drm_dp_aux_ms
 /* ret >= 0 ,ret is size; ret < 0, ret is err code */
 static ssize_t hibmc_dp_aux_xfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
 {
-	struct hibmc_dp_dev *dp = container_of(aux, struct hibmc_dp_dev, aux);
+	struct hibmc_dp *dp_priv = container_of(aux, struct hibmc_dp, aux);
+	struct hibmc_dp_dev *dp = dp_priv->dp_dev;
 	u32 aux_cmd;
 	int ret;
 	u32 val; /* val will be assigned at the beginning of readl_poll_timeout function */
@@ -151,14 +153,16 @@ static ssize_t hibmc_dp_aux_xfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *
 	return hibmc_dp_aux_parse_xfer(dp, msg);
 }
 
-void hibmc_dp_aux_init(struct hibmc_dp_dev *dp)
+void hibmc_dp_aux_init(struct hibmc_dp *dp)
 {
-	hibmc_dp_reg_write_field(dp, HIBMC_DP_AUX_REQ, HIBMC_DP_CFG_AUX_SYNC_LEN_SEL, 0x0);
-	hibmc_dp_reg_write_field(dp, HIBMC_DP_AUX_REQ, HIBMC_DP_CFG_AUX_TIMER_TIMEOUT, 0x1);
-	hibmc_dp_reg_write_field(dp, HIBMC_DP_AUX_REQ, HIBMC_DP_CFG_AUX_MIN_PULSE_NUM,
+	hibmc_dp_reg_write_field(dp->dp_dev, HIBMC_DP_AUX_REQ, HIBMC_DP_CFG_AUX_SYNC_LEN_SEL, 0x0);
+	hibmc_dp_reg_write_field(dp->dp_dev, HIBMC_DP_AUX_REQ, HIBMC_DP_CFG_AUX_TIMER_TIMEOUT, 0x1);
+	hibmc_dp_reg_write_field(dp->dp_dev, HIBMC_DP_AUX_REQ, HIBMC_DP_CFG_AUX_MIN_PULSE_NUM,
 				 HIBMC_DP_MIN_PULSE_NUM);
 
 	dp->aux.transfer = hibmc_dp_aux_xfer;
-	dp->aux.is_remote = 0;
+	dp->aux.name = kasprintf(GFP_KERNEL, "HIBMC DRM dp aux");
+	dp->aux.drm_dev = dp->drm_dev;
 	drm_dp_aux_init(&dp->aux);
+	dp->dp_dev->aux = &dp->aux;
 }
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
index e7746bc4b592..d613da8b544c 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
@@ -11,8 +11,11 @@
 #include <linux/kernel.h>
 #include <linux/bitfield.h>
 #include <linux/io.h>
+
 #include <drm/display/drm_dp_helper.h>
 
+#include "dp_hw.h"
+
 #define HIBMC_DP_LANE_NUM_MAX 2
 
 struct hibmc_link_status {
@@ -32,7 +35,7 @@ struct hibmc_dp_link {
 };
 
 struct hibmc_dp_dev {
-	struct drm_dp_aux aux;
+	struct drm_dp_aux *aux;
 	struct drm_device *dev;
 	void __iomem *base;
 	struct mutex lock; /* protects concurrent RW in hibmc_dp_reg_write_field() */
@@ -58,7 +61,7 @@ struct hibmc_dp_dev {
 		mutex_unlock(&_dp->lock);				\
 	} while (0)
 
-void hibmc_dp_aux_init(struct hibmc_dp_dev *dp);
+void hibmc_dp_aux_init(struct hibmc_dp *dp);
 int hibmc_dp_link_training(struct hibmc_dp_dev *dp);
 
 #endif
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
index ee1ff205ff56..77f02d5151f7 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
@@ -168,7 +168,7 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
 	dp_dev->dev = drm_dev;
 	dp_dev->base = dp->mmio + HIBMC_DP_OFFSET;
 
-	hibmc_dp_aux_init(dp_dev);
+	hibmc_dp_aux_init(dp);
 
 	if (hibmc_dp_serdes_init(dp_dev))
 		return -EAGAIN;
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
index 4dc13b3d9875..53b6d0beecea 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
@@ -10,6 +10,7 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_print.h>
+#include <drm/display/drm_dp_helper.h>
 
 struct hibmc_dp_dev;
 
@@ -19,6 +20,7 @@ struct hibmc_dp {
 	struct drm_encoder encoder;
 	struct drm_connector connector;
 	void __iomem *mmio;
+	struct drm_dp_aux aux;
 };
 
 int hibmc_dp_hw_init(struct hibmc_dp *dp);
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
index 43a4b656493f..4a99a9b7e3c4 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
@@ -27,7 +27,7 @@ static int hibmc_dp_link_training_configure(struct hibmc_dp_dev *dp)
 	/* set rate and lane count */
 	buf[0] = dp->link.cap.link_rate;
 	buf[1] = DP_LANE_COUNT_ENHANCED_FRAME_EN | dp->link.cap.lanes;
-	ret = drm_dp_dpcd_write(&dp->aux, DP_LINK_BW_SET, buf, sizeof(buf));
+	ret = drm_dp_dpcd_write(dp->aux, DP_LINK_BW_SET, buf, sizeof(buf));
 	if (ret != sizeof(buf)) {
 		drm_dbg_dp(dp->dev, "dp aux write link rate and lanes failed, ret: %d\n", ret);
 		return ret >= 0 ? -EIO : ret;
@@ -36,13 +36,13 @@ static int hibmc_dp_link_training_configure(struct hibmc_dp_dev *dp)
 	/* set 8b/10b and downspread */
 	buf[0] = DP_SPREAD_AMP_0_5;
 	buf[1] = DP_SET_ANSI_8B10B;
-	ret = drm_dp_dpcd_write(&dp->aux, DP_DOWNSPREAD_CTRL, buf, sizeof(buf));
+	ret = drm_dp_dpcd_write(dp->aux, DP_DOWNSPREAD_CTRL, buf, sizeof(buf));
 	if (ret != sizeof(buf)) {
 		drm_dbg_dp(dp->dev, "dp aux write 8b/10b and downspread failed, ret: %d\n", ret);
 		return ret >= 0 ? -EIO : ret;
 	}
 
-	ret = drm_dp_read_dpcd_caps(&dp->aux, dp->dpcd);
+	ret = drm_dp_read_dpcd_caps(dp->aux, dp->dpcd);
 	if (ret)
 		drm_err(dp->dev, "dp aux read dpcd failed, ret: %d\n", ret);
 
@@ -85,7 +85,7 @@ static int hibmc_dp_link_set_pattern(struct hibmc_dp_dev *dp, int pattern)
 
 	hibmc_dp_reg_write_field(dp, HIBMC_DP_PHYIF_CTRL0, HIBMC_DP_CFG_PAT_SEL, val);
 
-	ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_PATTERN_SET, &buf, sizeof(buf));
+	ret = drm_dp_dpcd_write(dp->aux, DP_TRAINING_PATTERN_SET, &buf, sizeof(buf));
 	if (ret != sizeof(buf)) {
 		drm_dbg_dp(dp->dev, "dp aux write training pattern set failed\n");
 		return ret >= 0 ? -EIO : ret;
@@ -115,7 +115,7 @@ static int hibmc_dp_link_training_cr_pre(struct hibmc_dp_dev *dp)
 	if (ret)
 		return ret;
 
-	ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, train_set, dp->link.cap.lanes);
+	ret = drm_dp_dpcd_write(dp->aux, DP_TRAINING_LANE0_SET, train_set, dp->link.cap.lanes);
 	if (ret != dp->link.cap.lanes) {
 		drm_dbg_dp(dp->dev, "dp aux write training lane set failed\n");
 		return ret >= 0 ? -EIO : ret;
@@ -198,9 +198,9 @@ static int hibmc_dp_link_training_cr(struct hibmc_dp_dev *dp)
 
 	voltage_tries = 1;
 	for (cr_tries = 0; cr_tries < 80; cr_tries++) {
-		drm_dp_link_train_clock_recovery_delay(&dp->aux, dp->dpcd);
+		drm_dp_link_train_clock_recovery_delay(dp->aux, dp->dpcd);
 
-		ret = drm_dp_dpcd_read_link_status(&dp->aux, lane_status);
+		ret = drm_dp_dpcd_read_link_status(dp->aux, lane_status);
 		if (ret != DP_LINK_STATUS_SIZE) {
 			drm_err(dp->dev, "Get lane status failed\n");
 			return ret;
@@ -224,7 +224,7 @@ static int hibmc_dp_link_training_cr(struct hibmc_dp_dev *dp)
 		if (ret)
 			return ret;
 
-		ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, dp->link.train_set,
+		ret = drm_dp_dpcd_write(dp->aux, DP_TRAINING_LANE0_SET, dp->link.train_set,
 					dp->link.cap.lanes);
 		if (ret != dp->link.cap.lanes) {
 			drm_dbg_dp(dp->dev, "Update link training failed\n");
@@ -251,9 +251,9 @@ static int hibmc_dp_link_training_channel_eq(struct hibmc_dp_dev *dp)
 		return ret;
 
 	for (eq_tries = 0; eq_tries < HIBMC_EQ_MAX_RETRY; eq_tries++) {
-		drm_dp_link_train_channel_eq_delay(&dp->aux, dp->dpcd);
+		drm_dp_link_train_channel_eq_delay(dp->aux, dp->dpcd);
 
-		ret = drm_dp_dpcd_read_link_status(&dp->aux, lane_status);
+		ret = drm_dp_dpcd_read_link_status(dp->aux, lane_status);
 		if (ret != DP_LINK_STATUS_SIZE) {
 			drm_err(dp->dev, "get lane status failed\n");
 			break;
@@ -278,7 +278,7 @@ static int hibmc_dp_link_training_channel_eq(struct hibmc_dp_dev *dp)
 		if (ret)
 			return ret;
 
-		ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET,
+		ret = drm_dp_dpcd_write(dp->aux, DP_TRAINING_LANE0_SET,
 					dp->link.train_set, dp->link.cap.lanes);
 		if (ret != dp->link.cap.lanes) {
 			drm_dbg_dp(dp->dev, "Update link training failed\n");
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
index 603d6b198a54..795c5b1a6b99 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
@@ -13,20 +13,24 @@
 #include "hibmc_drm_drv.h"
 #include "dp/dp_hw.h"
 
-static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
-{
-	int count;
+static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
+	.get_modes = drm_connector_helper_get_modes,
+	.detect_ctx = drm_connector_helper_detect_from_ddc,
+};
 
-	count = drm_add_modes_noedid(connector, connector->dev->mode_config.max_width,
-				     connector->dev->mode_config.max_height);
-	drm_set_preferred_mode(connector, 1024, 768); // temporary implementation
+static int hibmc_dp_late_register(struct drm_connector *connector)
+{
+	struct hibmc_dp *dp = to_hibmc_dp(connector);
 
-	return count;
+	return drm_dp_aux_register(&dp->aux);
 }
 
-static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
-	.get_modes = hibmc_dp_connector_get_modes,
-};
+static void hibmc_dp_early_unregister(struct drm_connector *connector)
+{
+	struct hibmc_dp *dp = to_hibmc_dp(connector);
+
+	drm_dp_aux_unregister(&dp->aux);
+}
 
 static const struct drm_connector_funcs hibmc_dp_conn_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
@@ -34,6 +38,8 @@ static const struct drm_connector_funcs hibmc_dp_conn_funcs = {
 	.destroy = drm_connector_cleanup,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.late_register = hibmc_dp_late_register,
+	.early_unregister = hibmc_dp_early_unregister,
 };
 
 static inline int hibmc_dp_prepare(struct hibmc_dp *dp, struct drm_display_mode *mode)
@@ -103,8 +109,8 @@ int hibmc_dp_init(struct hibmc_drm_private *priv)
 
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

