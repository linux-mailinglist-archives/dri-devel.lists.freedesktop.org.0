Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3E0A2F078
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 15:57:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AE910E586;
	Mon, 10 Feb 2025 14:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9EE510E57D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 14:57:11 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Ys6yZ148Jz1ltZr;
 Mon, 10 Feb 2025 22:53:26 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 7EAD518005F;
 Mon, 10 Feb 2025 22:57:09 +0800 (CST)
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 10 Feb 2025 22:57:08 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 drm-dp 5/7] drm/hisilicon/hibmc: Get link status and dpcd
 caps
Date: Mon, 10 Feb 2025 22:49:57 +0800
Message-ID: <20250210144959.100551-6-shiyongbang@huawei.com>
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

Prepare the hibmc_dp_get_foo() functions for debugfs using in
next patch. We also add dpcd's if statement in link training process,
because we have the dpcd.

Signed-off-by: Baihan Li <libaihan@huawei.com>
Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
---
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h |  3 ++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c   | 15 ++++++++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h   |  3 ++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c | 39 ++++++++++++++++----
 4 files changed, 52 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
index d613da8b544c..8eb1659c7685 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
@@ -26,6 +26,9 @@ struct hibmc_link_status {
 struct hibmc_link_cap {
 	u8 link_rate;
 	u8 lanes;
+	int rx_dpcd_revision;
+	bool is_tps3;
+	bool is_tps4;
 };
 
 struct hibmc_dp_link {
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
index 8adace0befde..5e889c377117 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
@@ -227,6 +227,21 @@ int hibmc_dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *mode)
 	return 0;
 }
 
+u8 hibmc_dp_get_link_rate(struct hibmc_dp *dp)
+{
+	return dp->dp_dev->link.cap.link_rate;
+}
+
+u8 hibmc_dp_get_lanes(struct hibmc_dp *dp)
+{
+	return dp->dp_dev->link.cap.lanes;
+}
+
+int hibmc_dp_get_dpcd(struct hibmc_dp *dp)
+{
+	return dp->dp_dev->link.cap.rx_dpcd_revision;
+}
+
 static const struct hibmc_dp_color_raw g_rgb_raw[] = {
 	{CBAR_COLOR_BAR, 0x000, 0x000, 0x000},
 	{CBAR_WHITE,     0xfff, 0xfff, 0xfff},
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
index 621a0a1d7eb7..823544b8008b 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
@@ -54,6 +54,9 @@ struct hibmc_dp {
 int hibmc_dp_hw_init(struct hibmc_dp *dp);
 int hibmc_dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *mode);
 void hibmc_dp_display_en(struct hibmc_dp *dp, bool enable);
+int hibmc_dp_get_dpcd(struct hibmc_dp *dp);
+u8 hibmc_dp_get_link_rate(struct hibmc_dp *dp);
+u8 hibmc_dp_get_lanes(struct hibmc_dp *dp);
 void hibmc_dp_set_cbar(struct hibmc_dp *dp, const struct hibmc_dp_cbar_cfg *cfg);
 
 #endif
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
index 4a99a9b7e3c4..39345fc78c06 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
@@ -7,6 +7,7 @@
 #include "dp_comm.h"
 #include "dp_reg.h"
 #include "dp_serdes.h"
+#include "dp_config.h"
 
 #define HIBMC_EQ_MAX_RETRY 5
 
@@ -42,11 +43,7 @@ static int hibmc_dp_link_training_configure(struct hibmc_dp_dev *dp)
 		return ret >= 0 ? -EIO : ret;
 	}
 
-	ret = drm_dp_read_dpcd_caps(dp->aux, dp->dpcd);
-	if (ret)
-		drm_err(dp->dev, "dp aux read dpcd failed, ret: %d\n", ret);
-
-	return ret;
+	return 0;
 }
 
 static int hibmc_dp_link_set_pattern(struct hibmc_dp_dev *dp, int pattern)
@@ -189,15 +186,17 @@ static int hibmc_dp_link_training_cr(struct hibmc_dp_dev *dp)
 	bool level_changed;
 	u32 voltage_tries;
 	u32 cr_tries;
+	u32 max_cr;
 	int ret;
 
 	/*
 	 * DP 1.4 spec define 10 for maxtries value, for pre DP 1.4 version set a limit of 80
 	 * (4 voltage levels x 4 preemphasis levels x 5 identical voltage retries)
 	 */
+	max_cr = dp->link.cap.rx_dpcd_revision >= DP_DPCD_REV_14 ? 10 : 80;
 
 	voltage_tries = 1;
-	for (cr_tries = 0; cr_tries < 80; cr_tries++) {
+	for (cr_tries = 0; cr_tries < max_cr; cr_tries++) {
 		drm_dp_link_train_clock_recovery_delay(dp->aux, dp->dpcd);
 
 		ret = drm_dp_dpcd_read_link_status(dp->aux, lane_status);
@@ -234,7 +233,7 @@ static int hibmc_dp_link_training_cr(struct hibmc_dp_dev *dp)
 		voltage_tries = level_changed ? 1 : voltage_tries + 1;
 	}
 
-	drm_err(dp->dev, "dp link training clock recovery 80 times failed\n");
+	drm_err(dp->dev, "dp link training clock recovery %u times failed\n", max_cr);
 	dp->link.status.clock_recovered = false;
 
 	return 0;
@@ -244,9 +243,17 @@ static int hibmc_dp_link_training_channel_eq(struct hibmc_dp_dev *dp)
 {
 	u8 lane_status[DP_LINK_STATUS_SIZE] = {0};
 	u8 eq_tries;
+	int tps;
 	int ret;
 
-	ret = hibmc_dp_link_set_pattern(dp, DP_TRAINING_PATTERN_2);
+	if (dp->link.cap.is_tps4)
+		tps = DP_TRAINING_PATTERN_4;
+	else if (dp->link.cap.is_tps3)
+		tps = DP_TRAINING_PATTERN_3;
+	else
+		tps = DP_TRAINING_PATTERN_2;
+
+	ret = hibmc_dp_link_set_pattern(dp, tps);
 	if (ret)
 		return ret;
 
@@ -313,11 +320,27 @@ static int hibmc_dp_link_downgrade_training_eq(struct hibmc_dp_dev *dp)
 	return hibmc_dp_link_reduce_rate(dp);
 }
 
+static void hibmc_dp_update_caps(struct hibmc_dp_dev *dp)
+{
+	dp->link.cap.rx_dpcd_revision = dp->dpcd[DP_DPCD_REV];
+
+	dp->link.cap.is_tps3 = (dp->dpcd[DP_DPCD_REV] >= DP_DPCD_REV_13) &&
+			       (dp->dpcd[DP_MAX_LANE_COUNT] & DP_TPS3_SUPPORTED);
+	dp->link.cap.is_tps4 = (dp->dpcd[DP_DPCD_REV] >= DP_DPCD_REV_14) &&
+			       (dp->dpcd[DP_MAX_DOWNSPREAD] & DP_TPS4_SUPPORTED);
+}
+
 int hibmc_dp_link_training(struct hibmc_dp_dev *dp)
 {
 	struct hibmc_dp_link *link = &dp->link;
 	int ret;
 
+	ret = drm_dp_read_dpcd_caps(dp->aux, dp->dpcd);
+	if (ret)
+		drm_err(dp->dev, "dp aux read dpcd failed, ret: %d\n", ret);
+
+	hibmc_dp_update_caps(dp);
+
 	while (true) {
 		ret = hibmc_dp_link_training_cr_pre(dp);
 		if (ret)
-- 
2.33.0

