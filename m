Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C92FB95FA0
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 15:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653F310E127;
	Tue, 23 Sep 2025 13:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170ED10E124
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 13:15:27 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4cWL2F1G4NzddPt;
 Tue, 23 Sep 2025 21:10:45 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
 by mail.maildlp.com (Postfix) with ESMTPS id 91146180B6B;
 Tue, 23 Sep 2025 21:15:23 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 23 Sep 2025 21:15:23 +0800
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 23 Sep 2025 21:15:22 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <dmitry.baryshkov@oss.qualcomm.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <fengsheng5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 drm-dp 1/4] drm/hisilicon/hibmc: fix dp probabilistical
 detect errors after HPD irq
Date: Tue, 23 Sep 2025 21:04:08 +0800
Message-ID: <20250923130411.2522339-2-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250923130411.2522339-1-shiyongbang@huawei.com>
References: <20250923130411.2522339-1-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.169.71.169]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq100007.china.huawei.com (7.202.195.175)
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

The issue is that drm_connector_helper_detect_from_ddc() returns wrong
status when plugging or unplugging the monitor. Use HPD pin status in
DP's detect_ctx() for real physcal monitor in/out, and implementation
a complete DP detection including read DPCD, check if it's a branch
device and its sink count for different situations.

Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
Signed-off-by: Baihan Li <libaihan@huawei.com>
Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
---
ChangeLog:
v6 -> v7:
  - add the check about branch devices, suggested by Dmitry Baryshkov.
v5 -> v6:
  - use HPD status in DP detect_ctx(), suggested by Dmitry Baryshkov.
v4 -> v5:
  - fix the commit message and DP detect_ctx(), suggested by Dmitry Baryshkov.
---
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  3 ++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 12 +++++++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  6 ++++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  3 ++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 34 +++++++++++++++++--
 5 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
index 4add05c7f161..7954a883435c 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
@@ -40,6 +40,9 @@ struct hibmc_dp_dev {
 	struct mutex lock; /* protects concurrent RW in hibmc_dp_reg_write_field() */
 	struct hibmc_dp_link link;
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
+	struct drm_dp_desc desc;
+	bool is_branch;
+	int hpd_status;
 	void __iomem *serdes_base;
 };
 
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
index 8f0daec7d174..bd3d73075629 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2024 Hisilicon Limited.
 
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/delay.h>
 #include "dp_config.h"
 #include "dp_comm.h"
@@ -305,3 +306,14 @@ void hibmc_dp_set_cbar(struct hibmc_dp *dp, const struct hibmc_dp_cbar_cfg *cfg)
 	hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, BIT(0), cfg->enable);
 	writel(HIBMC_DP_SYNC_EN_MASK, dp_dev->base + HIBMC_DP_TIMING_SYNC_CTRL);
 }
+
+void hibmc_dp_update_hpd_status(struct hibmc_dp *dp)
+{
+	int status;
+
+	readl_poll_timeout(dp->dp_dev->base + HIBMC_DP_HPD_STATUS, status,
+			   FIELD_GET(HIBMC_DP_HPD_CUR_STATE, status) != dp->dp_dev->hpd_status,
+			   1000, 100000); /* DP spec says 100ms */
+
+	dp->dp_dev->hpd_status = FIELD_GET(HIBMC_DP_HPD_CUR_STATE, status);
+}
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
index 665f5b166dfb..1e2214aece6a 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
@@ -14,6 +14,11 @@
 
 struct hibmc_dp_dev;
 
+enum hibmc_hpd_status {
+	HIBMC_HPD_OUT,
+	HIBMC_HPD_IN,
+};
+
 enum hibmc_dp_cbar_pattern {
 	CBAR_COLOR_BAR,
 	CBAR_WHITE,
@@ -60,5 +65,6 @@ void hibmc_dp_reset_link(struct hibmc_dp *dp);
 void hibmc_dp_hpd_cfg(struct hibmc_dp *dp);
 void hibmc_dp_enable_int(struct hibmc_dp *dp);
 void hibmc_dp_disable_int(struct hibmc_dp *dp);
+void hibmc_dp_update_hpd_status(struct hibmc_dp *dp);
 
 #endif
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
index 394b1e933c3a..64306abcd986 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
@@ -24,6 +24,9 @@
 #define HIBMC_DP_CFG_AUX_READY_DATA_BYTE	GENMASK(16, 12)
 #define HIBMC_DP_CFG_AUX			GENMASK(24, 17)
 
+#define HIBMC_DP_HPD_STATUS			0x98
+#define HIBMC_DP_HPD_CUR_STATE		GENMASK(7, 4)
+
 #define HIBMC_DP_PHYIF_CTRL0			0xa0
 #define HIBMC_DP_CFG_SCRAMBLE_EN		BIT(0)
 #define HIBMC_DP_CFG_PAT_SEL			GENMASK(7, 4)
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
index d06832e62e96..6792cd0b64b2 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
@@ -12,6 +12,7 @@
 
 #include "hibmc_drm_drv.h"
 #include "dp/dp_hw.h"
+#include "dp/dp_comm.h"
 
 #define DP_MASKED_SINK_HPD_PLUG_INT	BIT(2)
 
@@ -34,9 +35,36 @@ static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
 static int hibmc_dp_detect(struct drm_connector *connector,
 			   struct drm_modeset_acquire_ctx *ctx, bool force)
 {
-	mdelay(200);
+	struct hibmc_dp *dp = to_hibmc_dp(connector);
+	struct hibmc_dp_dev *dp_dev = dp->dp_dev;
+	int ret;
+
+	if (dp->irq_status) {
+		if (dp_dev->hpd_status != HIBMC_HPD_IN)
+			return connector_status_disconnected;
+	}
+
+	ret = drm_dp_read_dpcd_caps(dp_dev->aux, dp_dev->dpcd);
+	if (ret)
+		return connector_status_disconnected;
+
+	dp_dev->is_branch = drm_dp_is_branch(dp_dev->dpcd);
 
-	return drm_connector_helper_detect_from_ddc(connector, ctx, force);
+	ret = drm_dp_read_desc(dp_dev->aux, &dp_dev->desc, dp_dev->is_branch);
+	if (ret)
+		return connector_status_disconnected;
+
+	if (!dp_dev->is_branch)
+		return connector_status_connected;
+
+	if (drm_dp_read_sink_count_cap(connector, dp_dev->dpcd, &dp_dev->desc) &&
+	    dp_dev->dpcd[DP_DOWNSTREAM_PORT_0] & DP_DS_PORT_HPD) {
+		ret = drm_dp_read_sink_count(dp_dev->aux);
+		if (ret > 0)
+			return connector_status_connected;
+	}
+
+	return connector_status_disconnected;
 }
 
 static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
@@ -128,6 +156,8 @@ irqreturn_t hibmc_dp_hpd_isr(int irq, void *arg)
 		hibmc_dp_reset_link(&priv->dp);
 	}
 
+	hibmc_dp_update_hpd_status(&priv->dp);
+
 	if (dev->registered)
 		drm_connector_helper_hpd_irq_event(&priv->dp.connector);
 
-- 
2.33.0

