Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AF6A40533
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 03:58:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C290310EB61;
	Sat, 22 Feb 2025 02:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAB610E012
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 02:58:24 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Z0BXY25XCznl0m;
 Sat, 22 Feb 2025 10:58:53 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id E259B1A0188;
 Sat, 22 Feb 2025 10:58:21 +0800 (CST)
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 22 Feb 2025 10:58:20 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 drm-dp 2/8] drm/hisilicon/hibmc: Add dp serdes cfg to
 adjust serdes rate, voltage and pre-emphasis
Date: Sat, 22 Feb 2025 10:50:55 +0800
Message-ID: <20250222025102.1519798-3-shiyongbang@huawei.com>
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

This dp controller need features of digital-to-analog conversion and
high-speed transmission in chip by its extern serdes controller. Our
serdes cfg is relatively simple, just need two register configurations.
Don't need too much functions, like: power on/off, initialize, and some
complex configurations, so I'm not going to use the phy framework.
This serdes is inited and configured in dp initialization, and also
integrating them into link training process.

For rate changing, we can change from 1.62-8.2Gpbs by cfg reg.
For voltage and pre-emphasis levels changing, we can cfg different
serdes ffe value.

Signed-off-by: Baihan Li <libaihan@huawei.com>
Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
---
ChangeLog:
v2 - > v3:
  - add commit log about dp serdes, suggested by Dmitry Baryshkov.
  - return value in hibmc_dp_serdes_init(), suggested by Dmitry Baryshkov.
  - add static const in the array of serdes_tx_cfg[], suggested by Dmitry Baryshkov.
  - change drm_warn to drm_dbg_dp, suggested by Dmitry Baryshkov.
  - add explanations about dp serdes macros, suggested by Dmitry Baryshkov.
v1 -> v2:
  - splittting the patch and add more detailed the changes in the commit message, suggested by Dmitry Baryshkov.
  - changing all names of dp phy to dp serdes.
---
 drivers/gpu/drm/hisilicon/hibmc/Makefile      |  2 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  1 +
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  6 ++
 .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.c    | 72 +++++++++++++++++++
 .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.h    | 34 +++++++++
 5 files changed, 114 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h

diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
index 95a4ed599d98..43de077d6769 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
+++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
-	       dp/dp_aux.o dp/dp_link.o dp/dp_hw.o hibmc_drm_dp.o
+	       dp/dp_aux.o dp/dp_link.o dp/dp_hw.o dp/dp_serdes.o hibmc_drm_dp.o
 
 obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
index 2c52a4476c4d..e7746bc4b592 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
@@ -38,6 +38,7 @@ struct hibmc_dp_dev {
 	struct mutex lock; /* protects concurrent RW in hibmc_dp_reg_write_field() */
 	struct hibmc_dp_link link;
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
+	void __iomem *serdes_base;
 };
 
 #define dp_field_modify(reg_value, mask, val)				\
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
index a8d543881c09..59078483ec55 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
@@ -7,6 +7,7 @@
 #include "dp_comm.h"
 #include "dp_reg.h"
 #include "dp_hw.h"
+#include "dp_serdes.h"
 
 static void hibmc_dp_set_tu(struct hibmc_dp_dev *dp, struct drm_display_mode *mode)
 {
@@ -151,6 +152,7 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
 {
 	struct drm_device *drm_dev = dp->drm_dev;
 	struct hibmc_dp_dev *dp_dev;
+	int ret;
 
 	dp_dev = devm_kzalloc(drm_dev->dev, sizeof(struct hibmc_dp_dev), GFP_KERNEL);
 	if (!dp_dev)
@@ -165,6 +167,10 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
 
 	hibmc_dp_aux_init(dp_dev);
 
+	ret = hibmc_dp_serdes_init(dp_dev);
+	if (ret)
+		return ret;
+
 	dp_dev->link.cap.lanes = 0x2;
 	dp_dev->link.cap.link_rate = DP_LINK_BW_2_7;
 
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
new file mode 100644
index 000000000000..241b9ef782b0
--- /dev/null
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright (c) 2025 Hisilicon Limited.
+
+#include <linux/delay.h>
+#include <drm/drm_device.h>
+#include <drm/drm_print.h>
+#include "dp_comm.h"
+#include "dp_config.h"
+#include "dp_reg.h"
+#include "dp_serdes.h"
+
+int hibmc_dp_serdes_set_tx_cfg(struct hibmc_dp_dev *dp, u8 train_set[HIBMC_DP_LANE_NUM_MAX])
+{
+	static const u32 serdes_tx_cfg[4][4] = { {DP_SERDES_VOL0_PRE0, DP_SERDES_VOL0_PRE1,
+						  DP_SERDES_VOL0_PRE2, DP_SERDES_VOL0_PRE3},
+						 {DP_SERDES_VOL1_PRE0, DP_SERDES_VOL1_PRE1,
+						  DP_SERDES_VOL1_PRE2}, {DP_SERDES_VOL2_PRE0,
+						  DP_SERDES_VOL2_PRE1}, {DP_SERDES_VOL3_PRE0}};
+	int cfg[2];
+	int i;
+
+	for (i = 0; i < HIBMC_DP_LANE_NUM_MAX; i++) {
+		cfg[i] = serdes_tx_cfg[(train_set[i] & 0x3)]
+			 [(train_set[i] << DP_TRAIN_PRE_EMPHASIS_SHIFT & 0x3)];
+		if (!cfg[i])
+			return -EINVAL;
+
+		/* lane1 offset is 4 */
+		writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, cfg[i]),
+		       dp->serdes_base + HIBMC_DP_PMA_LANE0_OFFSET + i * 4);
+	}
+
+	usleep_range(300, 500);
+
+	if (readl(dp->serdes_base + HIBMC_DP_LANE_STATUS_OFFSET) != DP_SERDES_DONE) {
+		drm_dbg_dp(dp->dev, "dp serdes cfg failed\n");
+		return -EAGAIN;
+	}
+
+	return 0;
+}
+
+int hibmc_dp_serdes_rate_switch(u8 rate, struct hibmc_dp_dev *dp)
+{
+	writel(rate, dp->serdes_base + HIBMC_DP_LANE0_RATE_OFFSET);
+	writel(rate, dp->serdes_base + HIBMC_DP_LANE1_RATE_OFFSET);
+
+	usleep_range(300, 500);
+
+	if (readl(dp->serdes_base + HIBMC_DP_LANE_STATUS_OFFSET) != DP_SERDES_DONE) {
+		drm_dbg_dp(dp->dev, "dp serdes rate switching failed\n");
+		return -EAGAIN;
+	}
+
+	if (rate < DP_SERDES_BW_8_1)
+		drm_dbg_dp(dp->dev, "reducing serdes rate to :%d\n",
+			   rate ? rate * HIBMC_DP_LINK_RATE_CAL * 10 : 162);
+
+	return 0;
+}
+
+int hibmc_dp_serdes_init(struct hibmc_dp_dev *dp)
+{
+	dp->serdes_base = dp->base + HIBMC_DP_HOST_OFFSET;
+
+	writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, DP_SERDES_VOL0_PRE0),
+	       dp->serdes_base + HIBMC_DP_PMA_LANE0_OFFSET);
+	writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, DP_SERDES_VOL0_PRE0),
+	       dp->serdes_base + HIBMC_DP_PMA_LANE1_OFFSET);
+
+	return hibmc_dp_serdes_rate_switch(DP_SERDES_BW_8_1, dp);
+}
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h
new file mode 100644
index 000000000000..812d0794543c
--- /dev/null
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* Copyright (c) 2025 Hisilicon Limited. */
+
+#ifndef DP_SERDES_H
+#define DP_SERDES_H
+
+#define HIBMC_DP_HOST_OFFSET		0x10000
+#define HIBMC_DP_LANE0_RATE_OFFSET	0x4
+#define HIBMC_DP_LANE1_RATE_OFFSET	0xc
+#define HIBMC_DP_LANE_STATUS_OFFSET	0x10
+#define HIBMC_DP_PMA_LANE0_OFFSET	0x18
+#define HIBMC_DP_PMA_LANE1_OFFSET	0x1c
+#define HIBMC_DP_PMA_TXDEEMPH		GENMASK(18, 1)
+
+/* dp serdes TX-Deempth Configuration */
+#define DP_SERDES_VOL0_PRE0		0x280
+#define DP_SERDES_VOL0_PRE1		0x2300
+#define DP_SERDES_VOL0_PRE2		0x53c0
+#define DP_SERDES_VOL0_PRE3		0x8400
+#define DP_SERDES_VOL1_PRE0		0x380
+#define DP_SERDES_VOL1_PRE1		0x3440
+#define DP_SERDES_VOL1_PRE2		0x6480
+#define DP_SERDES_VOL2_PRE0		0x500
+#define DP_SERDES_VOL2_PRE1		0x4500
+#define DP_SERDES_VOL3_PRE0		0x600
+#define DP_SERDES_BW_8_1		0x3
+
+#define DP_SERDES_DONE			0x3
+
+int hibmc_dp_serdes_init(struct hibmc_dp_dev *dp);
+int hibmc_dp_serdes_rate_switch(u8 rate, struct hibmc_dp_dev *dp);
+int hibmc_dp_serdes_set_tx_cfg(struct hibmc_dp_dev *dp, u8 train_set[HIBMC_DP_LANE_NUM_MAX]);
+
+#endif
-- 
2.33.0

