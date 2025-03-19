Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 850E0A683BC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 04:32:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26AF10E23F;
	Wed, 19 Mar 2025 03:32:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CE310E24B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 03:32:30 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ZHZ221Y7mz2Ccfg;
 Wed, 19 Mar 2025 11:29:14 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id F391E1A016C;
 Wed, 19 Mar 2025 11:32:27 +0800 (CST)
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 19 Mar 2025 11:32:26 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 drm-dp 4/9] drm/hisilicon/hibmc: Refactor the member of
 drm_aux in struct hibmc_dp
Date: Wed, 19 Mar 2025 11:24:30 +0800
Message-ID: <20250319032435.1119469-5-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250319032435.1119469-1-shiyongbang@huawei.com>
References: <20250319032435.1119469-1-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.169.71.169]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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

Because the drm_aux of struct hibmc_dp_dev's member is not easy to get in
hibmc_drm_dp.c, move the drm_aux to struct hibmc_dp. Then there are some
adaptations and modifications to make this patch compile.

Signed-off-by: Baihan Li <libaihan@huawei.com>
Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
ChangeLog:
v3 -> v4:
  - fix the comment log to imperative sentence, suggested by Dmitry Baryshkov.
v2 -> v3:
  - split the patch into two parts, suggested by Dmitry Baryshkov.
---
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c  | 13 +++++++-----
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h |  6 ++++--
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c   |  2 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h   |  2 ++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c | 22 ++++++++++----------
 5 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
index 0a903cce1fa9..ded9e7ce887a 100644
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
@@ -151,14 +153,15 @@ static ssize_t hibmc_dp_aux_xfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *
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
 	dp->aux.is_remote = 0;
 	drm_dp_aux_init(&dp->aux);
+	dp->dp_dev->aux = &dp->aux;
 }
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
index e0c6a3b7463b..4add05c7f161 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
@@ -13,6 +13,8 @@
 #include <linux/io.h>
 #include <drm/display/drm_dp_helper.h>
 
+#include "dp_hw.h"
+
 #define HIBMC_DP_LANE_NUM_MAX 2
 
 struct hibmc_link_status {
@@ -32,7 +34,7 @@ struct hibmc_dp_link {
 };
 
 struct hibmc_dp_dev {
-	struct drm_dp_aux aux;
+	struct drm_dp_aux *aux;
 	struct drm_device *dev;
 	void __iomem *base;
 	struct mutex lock; /* protects concurrent RW in hibmc_dp_reg_write_field() */
@@ -58,7 +60,7 @@ struct hibmc_dp_dev {
 		mutex_unlock(&_dp->lock);				\
 	} while (0)
 
-void hibmc_dp_aux_init(struct hibmc_dp_dev *dp);
+void hibmc_dp_aux_init(struct hibmc_dp *dp);
 int hibmc_dp_link_training(struct hibmc_dp_dev *dp);
 int hibmc_dp_serdes_init(struct hibmc_dp_dev *dp);
 int hibmc_dp_serdes_rate_switch(u8 rate, struct hibmc_dp_dev *dp);
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
index dcb2ab5ea6bb..aa9354a996c9 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
@@ -167,7 +167,7 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
 	dp_dev->dev = drm_dev;
 	dp_dev->base = dp->mmio + HIBMC_DP_OFFSET;
 
-	hibmc_dp_aux_init(dp_dev);
+	hibmc_dp_aux_init(dp);
 
 	ret = hibmc_dp_serdes_init(dp_dev);
 	if (ret)
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
index 2b4940ea809c..f80e1d82511b 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
@@ -42,7 +42,7 @@ static int hibmc_dp_link_training_configure(struct hibmc_dp_dev *dp)
 	/* set rate and lane count */
 	buf[0] = dp->link.cap.link_rate;
 	buf[1] = DP_LANE_COUNT_ENHANCED_FRAME_EN | dp->link.cap.lanes;
-	ret = drm_dp_dpcd_write(&dp->aux, DP_LINK_BW_SET, buf, sizeof(buf));
+	ret = drm_dp_dpcd_write(dp->aux, DP_LINK_BW_SET, buf, sizeof(buf));
 	if (ret != sizeof(buf)) {
 		drm_dbg_dp(dp->dev, "dp aux write link rate and lanes failed, ret: %d\n", ret);
 		return ret >= 0 ? -EIO : ret;
@@ -51,7 +51,7 @@ static int hibmc_dp_link_training_configure(struct hibmc_dp_dev *dp)
 	/* set 8b/10b and downspread */
 	buf[0] = DP_SPREAD_AMP_0_5;
 	buf[1] = DP_SET_ANSI_8B10B;
-	ret = drm_dp_dpcd_write(&dp->aux, DP_DOWNSPREAD_CTRL, buf, sizeof(buf));
+	ret = drm_dp_dpcd_write(dp->aux, DP_DOWNSPREAD_CTRL, buf, sizeof(buf));
 	if (ret != sizeof(buf)) {
 		drm_dbg_dp(dp->dev, "dp aux write 8b/10b and downspread failed, ret: %d\n", ret);
 		return ret >= 0 ? -EIO : ret;
@@ -96,7 +96,7 @@ static int hibmc_dp_link_set_pattern(struct hibmc_dp_dev *dp, int pattern)
 
 	hibmc_dp_reg_write_field(dp, HIBMC_DP_PHYIF_CTRL0, HIBMC_DP_CFG_PAT_SEL, val);
 
-	ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_PATTERN_SET, &buf, sizeof(buf));
+	ret = drm_dp_dpcd_write(dp->aux, DP_TRAINING_PATTERN_SET, &buf, sizeof(buf));
 	if (ret != sizeof(buf)) {
 		drm_dbg_dp(dp->dev, "dp aux write training pattern set failed\n");
 		return ret >= 0 ? -EIO : ret;
@@ -126,7 +126,7 @@ static int hibmc_dp_link_training_cr_pre(struct hibmc_dp_dev *dp)
 	if (ret)
 		return ret;
 
-	ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, train_set, dp->link.cap.lanes);
+	ret = drm_dp_dpcd_write(dp->aux, DP_TRAINING_LANE0_SET, train_set, dp->link.cap.lanes);
 	if (ret != dp->link.cap.lanes) {
 		drm_dbg_dp(dp->dev, "dp aux write training lane set failed\n");
 		return ret >= 0 ? -EIO : ret;
@@ -199,9 +199,9 @@ static int hibmc_dp_link_training_cr(struct hibmc_dp_dev *dp)
 
 	voltage_tries = 1;
 	for (cr_tries = 0; cr_tries < 80; cr_tries++) {
-		drm_dp_link_train_clock_recovery_delay(&dp->aux, dp->dpcd);
+		drm_dp_link_train_clock_recovery_delay(dp->aux, dp->dpcd);
 
-		ret = drm_dp_dpcd_read_link_status(&dp->aux, lane_status);
+		ret = drm_dp_dpcd_read_link_status(dp->aux, lane_status);
 		if (ret != DP_LINK_STATUS_SIZE) {
 			drm_err(dp->dev, "Get lane status failed\n");
 			return ret;
@@ -225,7 +225,7 @@ static int hibmc_dp_link_training_cr(struct hibmc_dp_dev *dp)
 		if (ret)
 			return ret;
 
-		ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, dp->link.train_set,
+		ret = drm_dp_dpcd_write(dp->aux, DP_TRAINING_LANE0_SET, dp->link.train_set,
 					dp->link.cap.lanes);
 		if (ret != dp->link.cap.lanes) {
 			drm_dbg_dp(dp->dev, "Update link training failed\n");
@@ -252,9 +252,9 @@ static int hibmc_dp_link_training_channel_eq(struct hibmc_dp_dev *dp)
 		return ret;
 
 	for (eq_tries = 0; eq_tries < HIBMC_EQ_MAX_RETRY; eq_tries++) {
-		drm_dp_link_train_channel_eq_delay(&dp->aux, dp->dpcd);
+		drm_dp_link_train_channel_eq_delay(dp->aux, dp->dpcd);
 
-		ret = drm_dp_dpcd_read_link_status(&dp->aux, lane_status);
+		ret = drm_dp_dpcd_read_link_status(dp->aux, lane_status);
 		if (ret != DP_LINK_STATUS_SIZE) {
 			drm_err(dp->dev, "get lane status failed\n");
 			break;
@@ -279,7 +279,7 @@ static int hibmc_dp_link_training_channel_eq(struct hibmc_dp_dev *dp)
 		if (ret)
 			return ret;
 
-		ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET,
+		ret = drm_dp_dpcd_write(dp->aux, DP_TRAINING_LANE0_SET,
 					dp->link.train_set, dp->link.cap.lanes);
 		if (ret != dp->link.cap.lanes) {
 			drm_dbg_dp(dp->dev, "Update link training failed\n");
@@ -319,7 +319,7 @@ int hibmc_dp_link_training(struct hibmc_dp_dev *dp)
 	struct hibmc_dp_link *link = &dp->link;
 	int ret;
 
-	ret = drm_dp_read_dpcd_caps(&dp->aux, dp->dpcd);
+	ret = drm_dp_read_dpcd_caps(dp->aux, dp->dpcd);
 	if (ret)
 		drm_err(dp->dev, "dp aux read dpcd failed, ret: %d\n", ret);
 
-- 
2.33.0

