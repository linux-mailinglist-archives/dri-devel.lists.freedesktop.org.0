Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ABBA5651A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 11:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE5610EB2F;
	Fri,  7 Mar 2025 10:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9C210EB2B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 10:24:19 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Z8MjX3Jfpz1dyhB;
 Fri,  7 Mar 2025 18:20:00 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 381071A0188;
 Fri,  7 Mar 2025 18:24:16 +0800 (CST)
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Fri, 7 Mar 2025 18:24:14 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 drm-dp 3/9] drm/hisilicon/hibmc: Add dp serdes cfg in dp
 process
Date: Fri, 7 Mar 2025 18:16:34 +0800
Message-ID: <20250307101640.4003229-4-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250307101640.4003229-1-shiyongbang@huawei.com>
References: <20250307101640.4003229-1-shiyongbang@huawei.com>
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

Add dp serdes cfg in link training process, and related adapting
and modificating. Change some init values about training, because we want
completely to negotiation process, so we start with the maximum rate and
the electrical characteristic level is 0. Becuase serdes default cfgs is
changed and used in hibmc_kms_init(), we changed the if-statement to check
whether the value is 0.

Signed-off-by: Baihan Li <libaihan@huawei.com>
Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
---
ChangeLog:
v4 -> v5:
  - add commit log about hibmc_kms_init(), suggested by Dmitry Baryshkov.
  - fix the format of block comments, suggested by Dmitry Baryshkov.
  - add hibmc_dp_get_serdes_rate_cfg() to correct transferring serdes cfg.
v3 -> v4:
  - add comments for if-statement of dp_init(), suggested by Dmitry Baryshkov.
v2 -> v3:
  - change commit to an imperative sentence, suggested by Dmitry Baryshkov.
  - put HIBMC_DP_HOST_SERDES_CTRL in dp_serdes.h, suggested by Dmitry Baryshkov.
v1 -> v2:
  - splittting the patch and add more detailed the changes in the commit message, suggested by Dmitry Baryshkov.
---
 .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |  1 +
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  5 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 77 ++++++++++++++-----
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  5 ++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   | 13 ++--
 5 files changed, 75 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
index 74dd9956144e..c5feef8dc27d 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
@@ -15,5 +15,6 @@
 #define HIBMC_DP_CLK_EN			0x7
 #define HIBMC_DP_SYNC_EN_MASK		0x3
 #define HIBMC_DP_LINK_RATE_CAL		27
+#define HIBMC_DP_SYNC_DELAY(lanes)	((lanes) == 0x2 ? 86 : 46)
 
 #endif
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
index 3612f3c5ab23..dcb2ab5ea6bb 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
@@ -72,6 +72,9 @@ static void hibmc_dp_set_sst(struct hibmc_dp_dev *dp, struct drm_display_mode *m
 				 HIBMC_DP_CFG_STREAM_HTOTAL_SIZE, htotal_size);
 	hibmc_dp_reg_write_field(dp, HIBMC_DP_VIDEO_HORIZONTAL_SIZE,
 				 HIBMC_DP_CFG_STREAM_HBLANK_SIZE, hblank_size);
+	hibmc_dp_reg_write_field(dp, HIBMC_DP_VIDEO_PACKET,
+				 HIBMC_DP_CFG_STREAM_SYNC_CALIBRATION,
+				 HIBMC_DP_SYNC_DELAY(dp->link.cap.lanes));
 }
 
 static void hibmc_dp_link_cfg(struct hibmc_dp_dev *dp, struct drm_display_mode *mode)
@@ -171,7 +174,7 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
 		return ret;
 
 	dp_dev->link.cap.lanes = 0x2;
-	dp_dev->link.cap.link_rate = DP_LINK_BW_2_7;
+	dp_dev->link.cap.link_rate = DP_LINK_BW_8_1;
 
 	/* hdcp data */
 	writel(HIBMC_DP_HDCP, dp_dev->base + HIBMC_DP_HDCP_CFG);
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
index f6355c16cc0a..0444e0974af9 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
@@ -9,6 +9,22 @@
 
 #define HIBMC_EQ_MAX_RETRY 5
 
+static int hibmc_dp_get_serdes_rate_cfg(struct hibmc_dp_dev *dp)
+{
+	switch (dp->link.cap.link_rate) {
+	case DP_LINK_BW_1_62:
+		return DP_SERDES_BW_1_62;
+	case DP_LINK_BW_2_7:
+		return DP_SERDES_BW_2_7;
+	case DP_LINK_BW_5_4:
+		return DP_SERDES_BW_5_4;
+	case DP_LINK_BW_8_1:
+		return DP_SERDES_BW_8_1;
+	default:
+		return -EINVAL;
+	}
+}
+
 static int hibmc_dp_link_training_configure(struct hibmc_dp_dev *dp)
 {
 	u8 buf[2];
@@ -41,11 +57,7 @@ static int hibmc_dp_link_training_configure(struct hibmc_dp_dev *dp)
 		return ret >= 0 ? -EIO : ret;
 	}
 
-	ret = drm_dp_read_dpcd_caps(&dp->aux, dp->dpcd);
-	if (ret)
-		drm_err(dp->dev, "dp aux read dpcd failed, ret: %d\n", ret);
-
-	return ret;
+	return 0;
 }
 
 static int hibmc_dp_link_set_pattern(struct hibmc_dp_dev *dp, int pattern)
@@ -108,7 +120,11 @@ static int hibmc_dp_link_training_cr_pre(struct hibmc_dp_dev *dp)
 		return ret;
 
 	for (i = 0; i < dp->link.cap.lanes; i++)
-		train_set[i] = DP_TRAIN_VOLTAGE_SWING_LEVEL_2;
+		train_set[i] = DP_TRAIN_VOLTAGE_SWING_LEVEL_0;
+
+	ret = hibmc_dp_serdes_set_tx_cfg(dp, dp->link.train_set);
+	if (ret)
+		return ret;
 
 	ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, train_set, dp->link.cap.lanes);
 	if (ret != dp->link.cap.lanes) {
@@ -137,21 +153,18 @@ static bool hibmc_dp_link_get_adjust_train(struct hibmc_dp_dev *dp,
 	return false;
 }
 
-static inline int hibmc_dp_link_reduce_rate(struct hibmc_dp_dev *dp)
+static int hibmc_dp_link_reduce_rate(struct hibmc_dp_dev *dp)
 {
-	switch (dp->link.cap.link_rate) {
-	case DP_LINK_BW_2_7:
-		dp->link.cap.link_rate = DP_LINK_BW_1_62;
-		return 0;
-	case DP_LINK_BW_5_4:
-		dp->link.cap.link_rate = DP_LINK_BW_2_7;
-		return 0;
-	case DP_LINK_BW_8_1:
-		dp->link.cap.link_rate = DP_LINK_BW_5_4;
-		return 0;
-	default:
+	int ret;
+
+	if (dp->link.cap.link_rate == DP_LINK_BW_1_62)
 		return -EINVAL;
-	}
+
+	ret = hibmc_dp_get_serdes_rate_cfg(dp);
+	if (ret < 0)
+		return ret;
+
+	return hibmc_dp_serdes_rate_switch(--ret, dp);
 }
 
 static inline int hibmc_dp_link_reduce_lane(struct hibmc_dp_dev *dp)
@@ -159,6 +172,7 @@ static inline int hibmc_dp_link_reduce_lane(struct hibmc_dp_dev *dp)
 	switch (dp->link.cap.lanes) {
 	case 0x2:
 		dp->link.cap.lanes--;
+		drm_dbg_dp(dp->dev, "dp link training reduce to 1 lane\n");
 		break;
 	case 0x1:
 		drm_err(dp->dev, "dp link training reduce lane failed, already reach minimum\n");
@@ -206,6 +220,11 @@ static int hibmc_dp_link_training_cr(struct hibmc_dp_dev *dp)
 		}
 
 		level_changed = hibmc_dp_link_get_adjust_train(dp, lane_status);
+
+		ret = hibmc_dp_serdes_set_tx_cfg(dp, dp->link.train_set);
+		if (ret)
+			return ret;
+
 		ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, dp->link.train_set,
 					dp->link.cap.lanes);
 		if (ret != dp->link.cap.lanes) {
@@ -255,6 +274,11 @@ static int hibmc_dp_link_training_channel_eq(struct hibmc_dp_dev *dp)
 		}
 
 		hibmc_dp_link_get_adjust_train(dp, lane_status);
+
+		ret = hibmc_dp_serdes_set_tx_cfg(dp, dp->link.train_set);
+		if (ret)
+			return ret;
+
 		ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET,
 					dp->link.train_set, dp->link.cap.lanes);
 		if (ret != dp->link.cap.lanes) {
@@ -295,6 +319,21 @@ int hibmc_dp_link_training(struct hibmc_dp_dev *dp)
 	struct hibmc_dp_link *link = &dp->link;
 	int ret;
 
+	ret = drm_dp_read_dpcd_caps(&dp->aux, dp->dpcd);
+	if (ret)
+		drm_err(dp->dev, "dp aux read dpcd failed, ret: %d\n", ret);
+
+	dp->link.cap.link_rate = dp->dpcd[DP_MAX_LINK_RATE];
+	dp->link.cap.lanes = 0x2;
+
+	ret = hibmc_dp_get_serdes_rate_cfg(dp);
+	if (ret < 0)
+		return ret;
+
+	ret = hibmc_dp_serdes_rate_switch(ret, dp);
+	if (ret)
+		return ret;
+
 	while (true) {
 		ret = hibmc_dp_link_training_cr_pre(dp);
 		if (ret)
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
index 45dc91832b80..aa6ac951af67 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
@@ -54,6 +54,7 @@
 #define HIBMC_DP_VIDEO_PACKET			0x114
 #define HIBMC_DP_CFG_STREAM_TU_SYMBOL_SIZE	GENMASK(5, 0)
 #define HIBMC_DP_CFG_STREAM_TU_SYMBOL_FRAC_SIZE	GENMASK(9, 6)
+#define HIBMC_DP_CFG_STREAM_SYNC_CALIBRATION	GENMASK(31, 20)
 
 #define HIBMC_DP_VIDEO_MSA0			0x118
 #define HIBMC_DP_CFG_STREAM_VSTART		GENMASK(31, 16)
@@ -102,6 +103,7 @@
 #define HIBMC_DP_LANE_STATUS_OFFSET	0x10
 #define HIBMC_DP_PMA_LANE0_OFFSET	0x18
 #define HIBMC_DP_PMA_LANE1_OFFSET	0x1c
+#define HIBMC_DP_HOST_SERDES_CTRL	0x1f001c
 #define HIBMC_DP_PMA_TXDEEMPH		GENMASK(18, 1)
 #define DP_SERDES_DONE			0x3
 
@@ -117,5 +119,8 @@
 #define DP_SERDES_VOL2_PRE1		0x4500
 #define DP_SERDES_VOL3_PRE0		0x600
 #define DP_SERDES_BW_8_1		0x3
+#define DP_SERDES_BW_5_4		0x2
+#define DP_SERDES_BW_2_7		0x1
+#define DP_SERDES_BW_1_62		0x0
 
 #endif
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index e6de6d5edf6b..c67440e20de7 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -28,9 +28,7 @@
 #include "hibmc_drm_drv.h"
 #include "hibmc_drm_regs.h"
 
-#define HIBMC_DP_HOST_SERDES_CTRL		0x1f001c
-#define HIBMC_DP_HOST_SERDES_CTRL_VAL		0x8a00
-#define HIBMC_DP_HOST_SERDES_CTRL_MASK		0x7ffff
+#include "dp/dp_reg.h"
 
 DEFINE_DRM_GEM_FOPS(hibmc_fops);
 
@@ -121,9 +119,12 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
 		return ret;
 	}
 
-	/* if DP existed, init DP */
-	if ((readl(priv->mmio + HIBMC_DP_HOST_SERDES_CTRL) &
-	     HIBMC_DP_HOST_SERDES_CTRL_MASK) == HIBMC_DP_HOST_SERDES_CTRL_VAL) {
+	/* 
+	 * If the serdes reg is readable and is not equal to 0,
+	 * DP block exists and initializes it.
+	 */
+	ret = readl(priv->mmio + HIBMC_DP_HOST_SERDES_CTRL);
+	if (ret) {
 		ret = hibmc_dp_init(priv);
 		if (ret)
 			drm_err(dev, "failed to init dp: %d\n", ret);
-- 
2.33.0

