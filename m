Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BABD69E9985
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 15:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB2F10E7A0;
	Mon,  9 Dec 2024 14:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206B710E798
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 14:54:48 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Y6PwP2Wk4z1kvdx;
 Mon,  9 Dec 2024 22:52:21 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 990471402CC;
 Mon,  9 Dec 2024 22:54:44 +0800 (CST)
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 9 Dec 2024 22:54:43 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 drm-dp 2/5] drm/hisilicon/hibmc: add dp link moduel in hibmc
Date: Mon, 9 Dec 2024 22:48:37 +0800
Message-ID: <20241209144840.1933265-3-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20241209144840.1933265-1-shiyongbang@huawei.com>
References: <20241209144840.1933265-1-shiyongbang@huawei.com>
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

From: baihan li <libaihan@huawei.com>

Add link training process functions in this moduel.

Signed-off-by: Baihan Li <libaihan@huawei.com>
Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
---
Changelog:
v6 -> v7:
  - deleteing unset fields in struct hibmc_link_cap, suggested by Dmitry Baryshkov.
  - using macro instead of constants in hibmc_dp_link_training_configure(), suggested by Dmitry Baryshkov.
v5 -> v6:
  - using drm_dbg_dp() to print debug info instead of drm_info(), suggested by Dmitry Baryshkov.
v3 -> v4:
  - optimizing hibmc_dp_link_get_adjust_train() to delete for loop, suggested by Dmitry Baryshkov.
  - changing ELNRNG to EIO error code, suggested by Dmitry Baryshkov.
  - deleting meaningless macro, suggested by Dmitry Baryshkov.
  - fixing build errors reported by kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202411041559.WIfxRN6n-lkp@intel.com/
v2 -> v3:
  - using switchcase in dp_link_reduce_lane, suggested by Dmitry Baryshkov.
  - deleting dp_link_pattern2dpcd function and using macros directly, suggested by Dmitry Baryshkov.
  - deleting EFAULT error codes, suggested by Dmitry Baryshkov.
v1 -> v2:
  - using drm_dp_* functions implement dp link training process, suggested by Jani Nikula.
  - fix build errors reported by kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202410031735.8iRZZR6T-lkp@intel.com/
  v1:https://lore.kernel.org/all/20240930100610.782363-1-shiyongbang@huawei.com/
---
 drivers/gpu/drm/hisilicon/hibmc/Makefile     |   2 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h |  21 ++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c | 329 +++++++++++++++++++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h  |   8 +
 4 files changed, 359 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c

diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
index 8770ec6dfffd..94d77da88bbf 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
+++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
-	       dp/dp_aux.o
+	       dp/dp_aux.o dp/dp_link.o
 
 obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
index 7d3cd32393c0..2c52a4476c4d 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
@@ -13,11 +13,31 @@
 #include <linux/io.h>
 #include <drm/display/drm_dp_helper.h>
 
+#define HIBMC_DP_LANE_NUM_MAX 2
+
+struct hibmc_link_status {
+	bool clock_recovered;
+	bool channel_equalized;
+};
+
+struct hibmc_link_cap {
+	u8 link_rate;
+	u8 lanes;
+};
+
+struct hibmc_dp_link {
+	struct hibmc_link_status status;
+	u8 train_set[HIBMC_DP_LANE_NUM_MAX];
+	struct hibmc_link_cap cap;
+};
+
 struct hibmc_dp_dev {
 	struct drm_dp_aux aux;
 	struct drm_device *dev;
 	void __iomem *base;
 	struct mutex lock; /* protects concurrent RW in hibmc_dp_reg_write_field() */
+	struct hibmc_dp_link link;
+	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 };
 
 #define dp_field_modify(reg_value, mask, val)				\
@@ -38,5 +58,6 @@ struct hibmc_dp_dev {
 	} while (0)
 
 void hibmc_dp_aux_init(struct hibmc_dp_dev *dp);
+int hibmc_dp_link_training(struct hibmc_dp_dev *dp);
 
 #endif
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
new file mode 100644
index 000000000000..5a62dedd067a
--- /dev/null
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
@@ -0,0 +1,329 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright (c) 2024 Hisilicon Limited.
+
+#include <linux/delay.h>
+#include <drm/drm_device.h>
+#include <drm/drm_print.h>
+#include "dp_comm.h"
+#include "dp_reg.h"
+
+#define HIBMC_EQ_MAX_RETRY 5
+
+static int hibmc_dp_link_training_configure(struct hibmc_dp_dev *dp)
+{
+	u8 buf[2];
+	int ret;
+
+	/* DP 2 lane */
+	hibmc_dp_reg_write_field(dp, HIBMC_DP_PHYIF_CTRL0, HIBMC_DP_CFG_LANE_DATA_EN,
+				 dp->link.cap.lanes == 0x2 ? 0x3 : 0x1);
+	hibmc_dp_reg_write_field(dp, HIBMC_DP_DPTX_GCTL0, HIBMC_DP_CFG_PHY_LANE_NUM,
+				 dp->link.cap.lanes == 0x2 ? 0x1 : 0);
+
+	/* enhanced frame */
+	hibmc_dp_reg_write_field(dp, HIBMC_DP_VIDEO_CTRL, HIBMC_DP_CFG_STREAM_FRAME_MODE, 0x1);
+
+	/* set rate and lane count */
+	buf[0] = dp->link.cap.link_rate;
+	buf[1] = DP_LANE_COUNT_ENHANCED_FRAME_EN | dp->link.cap.lanes;
+	ret = drm_dp_dpcd_write(&dp->aux, DP_LINK_BW_SET, buf, sizeof(buf));
+	if (ret != sizeof(buf)) {
+		drm_dbg_dp(dp->dev, "dp aux write link rate and lanes failed, ret: %d\n", ret);
+		return ret >= 0 ? -EIO : ret;
+	}
+
+	/* set 8b/10b and downspread */
+	buf[0] = DP_SPREAD_AMP_0_5;
+	buf[1] = DP_SET_ANSI_8B10B;
+	ret = drm_dp_dpcd_write(&dp->aux, DP_DOWNSPREAD_CTRL, buf, sizeof(buf));
+	if (ret != sizeof(buf)) {
+		drm_dbg_dp(dp->dev, "dp aux write 8b/10b and downspread failed, ret: %d\n", ret);
+		return ret >= 0 ? -EIO : ret;
+	}
+
+	ret = drm_dp_read_dpcd_caps(&dp->aux, dp->dpcd);
+	if (ret)
+		drm_err(dp->dev, "dp aux read dpcd failed, ret: %d\n", ret);
+
+	return ret;
+}
+
+static int hibmc_dp_link_set_pattern(struct hibmc_dp_dev *dp, int pattern)
+{
+	int ret;
+	u8 val;
+	u8 buf;
+
+	buf = (u8)pattern;
+	if (pattern != DP_TRAINING_PATTERN_DISABLE && pattern != DP_TRAINING_PATTERN_4) {
+		buf |= DP_LINK_SCRAMBLING_DISABLE;
+		hibmc_dp_reg_write_field(dp, HIBMC_DP_PHYIF_CTRL0, HIBMC_DP_CFG_SCRAMBLE_EN, 0x1);
+	} else {
+		hibmc_dp_reg_write_field(dp, HIBMC_DP_PHYIF_CTRL0, HIBMC_DP_CFG_SCRAMBLE_EN, 0);
+	}
+
+	switch (pattern) {
+	case DP_TRAINING_PATTERN_1:
+		val = 1;
+		break;
+	case DP_TRAINING_PATTERN_2:
+		val = 2;
+		break;
+	case DP_TRAINING_PATTERN_3:
+		val = 3;
+		break;
+	case DP_TRAINING_PATTERN_4:
+		val = 4;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	hibmc_dp_reg_write_field(dp, HIBMC_DP_PHYIF_CTRL0, HIBMC_DP_CFG_PAT_SEL, val);
+
+	ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_PATTERN_SET, &buf, sizeof(buf));
+	if (ret != sizeof(buf)) {
+		drm_dbg_dp(dp->dev, "dp aux write training pattern set failed\n");
+		return ret >= 0 ? -EIO : ret;
+	}
+
+	return 0;
+}
+
+static int hibmc_dp_link_training_cr_pre(struct hibmc_dp_dev *dp)
+{
+	u8 *train_set = dp->link.train_set;
+	int ret;
+	u8 i;
+
+	ret = hibmc_dp_link_training_configure(dp);
+	if (ret)
+		return ret;
+
+	ret = hibmc_dp_link_set_pattern(dp, DP_TRAINING_PATTERN_1);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < dp->link.cap.lanes; i++)
+		train_set[i] = DP_TRAIN_VOLTAGE_SWING_LEVEL_2;
+
+	ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, train_set, dp->link.cap.lanes);
+	if (ret != dp->link.cap.lanes) {
+		drm_dbg_dp(dp->dev, "dp aux write training lane set failed\n");
+		return ret >= 0 ? -EIO : ret;
+	}
+
+	return 0;
+}
+
+static bool hibmc_dp_link_get_adjust_train(struct hibmc_dp_dev *dp,
+					   u8 lane_status[DP_LINK_STATUS_SIZE])
+{
+	u8 train_set[HIBMC_DP_LANE_NUM_MAX] = {0};
+	u8 lane;
+
+	for (lane = 0; lane < dp->link.cap.lanes; lane++)
+		train_set[lane] = drm_dp_get_adjust_request_voltage(lane_status, lane) |
+				  drm_dp_get_adjust_request_pre_emphasis(lane_status, lane);
+
+	if (memcmp(dp->link.train_set, train_set, HIBMC_DP_LANE_NUM_MAX)) {
+		memcpy(dp->link.train_set, train_set, HIBMC_DP_LANE_NUM_MAX);
+		return true;
+	}
+
+	return false;
+}
+
+static inline int hibmc_dp_link_reduce_rate(struct hibmc_dp_dev *dp)
+{
+	switch (dp->link.cap.link_rate) {
+	case DP_LINK_BW_2_7:
+		dp->link.cap.link_rate = DP_LINK_BW_1_62;
+		return 0;
+	case DP_LINK_BW_5_4:
+		dp->link.cap.link_rate = DP_LINK_BW_2_7;
+		return 0;
+	case DP_LINK_BW_8_1:
+		dp->link.cap.link_rate = DP_LINK_BW_5_4;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static inline int hibmc_dp_link_reduce_lane(struct hibmc_dp_dev *dp)
+{
+	switch (dp->link.cap.lanes) {
+	case 0x2:
+		dp->link.cap.lanes--;
+		break;
+	case 0x1:
+		drm_err(dp->dev, "dp link training reduce lane failed, already reach minimum\n");
+		return -EIO;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int hibmc_dp_link_training_cr(struct hibmc_dp_dev *dp)
+{
+	u8 lane_status[DP_LINK_STATUS_SIZE] = {0};
+	bool level_changed;
+	u32 voltage_tries;
+	u32 cr_tries;
+	int ret;
+
+	/*
+	 * DP 1.4 spec define 10 for maxtries value, for pre DP 1.4 version set a limit of 80
+	 * (4 voltage levels x 4 preemphasis levels x 5 identical voltage retries)
+	 */
+
+	voltage_tries = 1;
+	for (cr_tries = 0; cr_tries < 80; cr_tries++) {
+		drm_dp_link_train_clock_recovery_delay(&dp->aux, dp->dpcd);
+
+		ret = drm_dp_dpcd_read_link_status(&dp->aux, lane_status);
+		if (ret != DP_LINK_STATUS_SIZE) {
+			drm_err(dp->dev, "Get lane status failed\n");
+			return ret;
+		}
+
+		if (drm_dp_clock_recovery_ok(lane_status, dp->link.cap.lanes)) {
+			drm_dbg_dp(dp->dev, "dp link training cr done\n");
+			dp->link.status.clock_recovered = true;
+			return 0;
+		}
+
+		if (voltage_tries == 5) {
+			drm_dbg_dp(dp->dev, "same voltage tries 5 times\n");
+			dp->link.status.clock_recovered = false;
+			return 0;
+		}
+
+		level_changed = hibmc_dp_link_get_adjust_train(dp, lane_status);
+		ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, dp->link.train_set,
+					dp->link.cap.lanes);
+		if (ret != dp->link.cap.lanes) {
+			drm_dbg_dp(dp->dev, "Update link training failed\n");
+			return ret >= 0 ? -EIO : ret;
+		}
+
+		voltage_tries = level_changed ? 1 : voltage_tries + 1;
+	}
+
+	drm_err(dp->dev, "dp link training clock recovery 80 times failed\n");
+	dp->link.status.clock_recovered = false;
+
+	return 0;
+}
+
+static int hibmc_dp_link_training_channel_eq(struct hibmc_dp_dev *dp)
+{
+	u8 lane_status[DP_LINK_STATUS_SIZE] = {0};
+	u8 eq_tries;
+	int ret;
+
+	ret = hibmc_dp_link_set_pattern(dp, DP_TRAINING_PATTERN_2);
+	if (ret)
+		return ret;
+
+	for (eq_tries = 0; eq_tries < HIBMC_EQ_MAX_RETRY; eq_tries++) {
+		drm_dp_link_train_channel_eq_delay(&dp->aux, dp->dpcd);
+
+		ret = drm_dp_dpcd_read_link_status(&dp->aux, lane_status);
+		if (ret != DP_LINK_STATUS_SIZE) {
+			drm_err(dp->dev, "get lane status failed\n");
+			break;
+		}
+
+		if (!drm_dp_clock_recovery_ok(lane_status, dp->link.cap.lanes)) {
+			drm_dbg_dp(dp->dev, "clock recovery check failed\n");
+			drm_dbg_dp(dp->dev, "cannot continue channel equalization\n");
+			dp->link.status.clock_recovered = false;
+			break;
+		}
+
+		if (drm_dp_channel_eq_ok(lane_status, dp->link.cap.lanes)) {
+			dp->link.status.channel_equalized = true;
+			drm_dbg_dp(dp->dev, "dp link training eq done\n");
+			break;
+		}
+
+		hibmc_dp_link_get_adjust_train(dp, lane_status);
+		ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET,
+					dp->link.train_set, dp->link.cap.lanes);
+		if (ret != dp->link.cap.lanes) {
+			drm_dbg_dp(dp->dev, "Update link training failed\n");
+			ret = (ret >= 0) ? -EIO : ret;
+			break;
+		}
+	}
+
+	if (eq_tries == HIBMC_EQ_MAX_RETRY)
+		drm_err(dp->dev, "channel equalization failed %u times\n", eq_tries);
+
+	hibmc_dp_link_set_pattern(dp, DP_TRAINING_PATTERN_DISABLE);
+
+	return ret < 0 ? ret : 0;
+}
+
+static int hibmc_dp_link_downgrade_training_cr(struct hibmc_dp_dev *dp)
+{
+	if (hibmc_dp_link_reduce_rate(dp))
+		return hibmc_dp_link_reduce_lane(dp);
+
+	return 0;
+}
+
+static int hibmc_dp_link_downgrade_training_eq(struct hibmc_dp_dev *dp)
+{
+	if ((dp->link.status.clock_recovered && !dp->link.status.channel_equalized)) {
+		if (!hibmc_dp_link_reduce_lane(dp))
+			return 0;
+	}
+
+	return hibmc_dp_link_reduce_rate(dp);
+}
+
+int hibmc_dp_link_training(struct hibmc_dp_dev *dp)
+{
+	struct hibmc_dp_link *link = &dp->link;
+	int ret;
+
+	while (true) {
+		ret = hibmc_dp_link_training_cr_pre(dp);
+		if (ret)
+			goto err;
+
+		ret = hibmc_dp_link_training_cr(dp);
+		if (ret)
+			goto err;
+
+		if (!link->status.clock_recovered) {
+			ret = hibmc_dp_link_downgrade_training_cr(dp);
+			if (ret)
+				goto err;
+			continue;
+		}
+
+		ret = hibmc_dp_link_training_channel_eq(dp);
+		if (ret)
+			goto err;
+
+		if (!link->status.channel_equalized) {
+			ret = hibmc_dp_link_downgrade_training_eq(dp);
+			if (ret)
+				goto err;
+			continue;
+		}
+
+		return 0;
+	}
+
+err:
+	hibmc_dp_link_set_pattern(dp, DP_TRAINING_PATTERN_DISABLE);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
index f3e6781e111a..0bd308eccdc5 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
@@ -12,16 +12,24 @@
 #define HIBMC_DP_AUX_RD_DATA0			0x64
 #define HIBMC_DP_AUX_REQ			0x74
 #define HIBMC_DP_AUX_STATUS			0x78
+#define HIBMC_DP_PHYIF_CTRL0			0xa0
+#define HIBMC_DP_VIDEO_CTRL			0x100
 #define HIBMC_DP_DPTX_RST_CTRL			0x700
+#define HIBMC_DP_DPTX_GCTL0			0x708
 
 #define HIBMC_DP_CFG_AUX_SYNC_LEN_SEL		BIT(1)
 #define HIBMC_DP_CFG_AUX_TIMER_TIMEOUT		BIT(2)
+#define HIBMC_DP_CFG_STREAM_FRAME_MODE		BIT(6)
 #define HIBMC_DP_CFG_AUX_MIN_PULSE_NUM		GENMASK(13, 9)
+#define HIBMC_DP_CFG_LANE_DATA_EN		GENMASK(11, 8)
+#define HIBMC_DP_CFG_PHY_LANE_NUM		GENMASK(2, 1)
 #define HIBMC_DP_CFG_AUX_REQ			BIT(0)
 #define HIBMC_DP_CFG_AUX_RST_N			BIT(4)
 #define HIBMC_DP_CFG_AUX_TIMEOUT		BIT(0)
 #define HIBMC_DP_CFG_AUX_READY_DATA_BYTE	GENMASK(16, 12)
 #define HIBMC_DP_CFG_AUX			GENMASK(24, 17)
 #define HIBMC_DP_CFG_AUX_STATUS			GENMASK(11, 4)
+#define HIBMC_DP_CFG_SCRAMBLE_EN		BIT(0)
+#define HIBMC_DP_CFG_PAT_SEL			GENMASK(7, 4)
 
 #endif
-- 
2.33.0

