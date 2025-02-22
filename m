Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1720A4052E
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 03:58:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F91D10E012;
	Sat, 22 Feb 2025 02:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FD210EB5C
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 02:58:25 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Z0BSS1M8tzHr9K;
 Sat, 22 Feb 2025 10:55:20 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 259BD180103;
 Sat, 22 Feb 2025 10:58:23 +0800 (CST)
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 22 Feb 2025 10:58:21 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 drm-dp 3/8] drm/hisilicon/hibmc: Add dp serdes cfg in dp
 process
Date: Sat, 22 Feb 2025 10:50:56 +0800
Message-ID: <20250222025102.1519798-4-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250222025102.1519798-1-shiyongbang@huawei.com>
References: <20250222025102.1519798-1-shiyongbang@huawei.com>
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

Add dp serdes cfg in link training process, and related adapting
and modificating. Change some init values about training,
because we want completely to negotiation process, so we start with
the maximum rate and the electrical characteristic level is 0.

Signed-off-by: Baihan Li <libaihan@huawei.com>
Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
---
ChangeLog:
v2 -> v3:
  - change commit to an imperative sentence, suggested by Dmitry Baryshkov.
  - put HIBMC_DP_HOST_SERDES_CTRL in dp_serdes.h, suggested by Dmitry Baryshkov.
v1 -> v2:
  - splittting the patch and add more detailed the changes in the commit message, suggested by Dmitry Baryshkov.
---
 .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |  1 +
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  5 ++-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 33 ++++++++++++++++---
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  1 +
 .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.h    |  6 ++++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  8 ++---
 6 files changed, 43 insertions(+), 11 deletions(-)

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
index 59078483ec55..ad3e5c527e39 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
@@ -73,6 +73,9 @@ static void hibmc_dp_set_sst(struct hibmc_dp_dev *dp, struct drm_display_mode *m
 				 HIBMC_DP_CFG_STREAM_HTOTAL_SIZE, htotal_size);
 	hibmc_dp_reg_write_field(dp, HIBMC_DP_VIDEO_HORIZONTAL_SIZE,
 				 HIBMC_DP_CFG_STREAM_HBLANK_SIZE, hblank_size);
+	hibmc_dp_reg_write_field(dp, HIBMC_DP_VIDEO_PACKET,
+				 HIBMC_DP_CFG_STREAM_SYNC_CALIBRATION,
+				 HIBMC_DP_SYNC_DELAY(dp->link.cap.lanes));
 }
 
 static void hibmc_dp_link_cfg(struct hibmc_dp_dev *dp, struct drm_display_mode *mode)
@@ -172,7 +175,7 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
 		return ret;
 
 	dp_dev->link.cap.lanes = 0x2;
-	dp_dev->link.cap.link_rate = DP_LINK_BW_2_7;
+	dp_dev->link.cap.link_rate = DP_LINK_BW_8_1;
 
 	/* hdcp data */
 	writel(HIBMC_DP_HDCP, dp_dev->base + HIBMC_DP_HDCP_CFG);
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
index f6355c16cc0a..e2bee7500226 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
@@ -6,6 +6,7 @@
 #include <drm/drm_print.h>
 #include "dp_comm.h"
 #include "dp_reg.h"
+#include "dp_serdes.h"
 
 #define HIBMC_EQ_MAX_RETRY 5
 
@@ -108,7 +109,11 @@ static int hibmc_dp_link_training_cr_pre(struct hibmc_dp_dev *dp)
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
@@ -137,21 +142,28 @@ static bool hibmc_dp_link_get_adjust_train(struct hibmc_dp_dev *dp,
 	return false;
 }
 
-static inline int hibmc_dp_link_reduce_rate(struct hibmc_dp_dev *dp)
+static int hibmc_dp_link_reduce_rate(struct hibmc_dp_dev *dp)
 {
+	u8 rate = 0;
+
 	switch (dp->link.cap.link_rate) {
 	case DP_LINK_BW_2_7:
 		dp->link.cap.link_rate = DP_LINK_BW_1_62;
-		return 0;
+		rate = DP_SERDES_BW_1_62;
+		break;
 	case DP_LINK_BW_5_4:
 		dp->link.cap.link_rate = DP_LINK_BW_2_7;
-		return 0;
+		rate = DP_SERDES_BW_2_7;
+		break;
 	case DP_LINK_BW_8_1:
 		dp->link.cap.link_rate = DP_LINK_BW_5_4;
-		return 0;
+		rate = DP_SERDES_BW_5_4;
+		break;
 	default:
 		return -EINVAL;
 	}
+
+	return hibmc_dp_serdes_rate_switch(rate, dp);
 }
 
 static inline int hibmc_dp_link_reduce_lane(struct hibmc_dp_dev *dp)
@@ -159,6 +171,7 @@ static inline int hibmc_dp_link_reduce_lane(struct hibmc_dp_dev *dp)
 	switch (dp->link.cap.lanes) {
 	case 0x2:
 		dp->link.cap.lanes--;
+		drm_dbg_dp(dp->dev, "dp link training reduce to 1 lane\n");
 		break;
 	case 0x1:
 		drm_err(dp->dev, "dp link training reduce lane failed, already reach minimum\n");
@@ -206,6 +219,11 @@ static int hibmc_dp_link_training_cr(struct hibmc_dp_dev *dp)
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
@@ -255,6 +273,11 @@ static int hibmc_dp_link_training_channel_eq(struct hibmc_dp_dev *dp)
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
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
index dc2bd3f80b70..b75ac13a5ead 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
@@ -54,6 +54,7 @@
 #define HIBMC_DP_VIDEO_PACKET			0x114
 #define HIBMC_DP_CFG_STREAM_TU_SYMBOL_SIZE	GENMASK(5, 0)
 #define HIBMC_DP_CFG_STREAM_TU_SYMBOL_FRAC_SIZE	GENMASK(9, 6)
+#define HIBMC_DP_CFG_STREAM_SYNC_CALIBRATION	GENMASK(31, 20)
 
 #define HIBMC_DP_VIDEO_MSA0			0x118
 #define HIBMC_DP_CFG_STREAM_VSTART		GENMASK(31, 16)
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h
index 812d0794543c..e0537cc9af41 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h
@@ -4,12 +4,15 @@
 #ifndef DP_SERDES_H
 #define DP_SERDES_H
 
+#include "dp_comm.h"
+
 #define HIBMC_DP_HOST_OFFSET		0x10000
 #define HIBMC_DP_LANE0_RATE_OFFSET	0x4
 #define HIBMC_DP_LANE1_RATE_OFFSET	0xc
 #define HIBMC_DP_LANE_STATUS_OFFSET	0x10
 #define HIBMC_DP_PMA_LANE0_OFFSET	0x18
 #define HIBMC_DP_PMA_LANE1_OFFSET	0x1c
+#define HIBMC_DP_HOST_SERDES_CTRL	0x1f001c
 #define HIBMC_DP_PMA_TXDEEMPH		GENMASK(18, 1)
 
 /* dp serdes TX-Deempth Configuration */
@@ -24,6 +27,9 @@
 #define DP_SERDES_VOL2_PRE1		0x4500
 #define DP_SERDES_VOL3_PRE0		0x600
 #define DP_SERDES_BW_8_1		0x3
+#define DP_SERDES_BW_5_4		0x2
+#define DP_SERDES_BW_2_7		0x1
+#define DP_SERDES_BW_1_62		0x0
 
 #define DP_SERDES_DONE			0x3
 
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index e6de6d5edf6b..67d39e258cac 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -28,9 +28,7 @@
 #include "hibmc_drm_drv.h"
 #include "hibmc_drm_regs.h"
 
-#define HIBMC_DP_HOST_SERDES_CTRL		0x1f001c
-#define HIBMC_DP_HOST_SERDES_CTRL_VAL		0x8a00
-#define HIBMC_DP_HOST_SERDES_CTRL_MASK		0x7ffff
+#include "dp/dp_serdes.h"
 
 DEFINE_DRM_GEM_FOPS(hibmc_fops);
 
@@ -122,8 +120,8 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
 	}
 
 	/* if DP existed, init DP */
-	if ((readl(priv->mmio + HIBMC_DP_HOST_SERDES_CTRL) &
-	     HIBMC_DP_HOST_SERDES_CTRL_MASK) == HIBMC_DP_HOST_SERDES_CTRL_VAL) {
+	ret = readl(priv->mmio + HIBMC_DP_HOST_SERDES_CTRL);
+	if (ret) {
 		ret = hibmc_dp_init(priv);
 		if (ret)
 			drm_err(dev, "failed to init dp: %d\n", ret);
-- 
2.33.0

