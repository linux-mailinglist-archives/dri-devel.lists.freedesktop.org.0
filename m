Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98086A683C2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 04:32:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831EE10E268;
	Wed, 19 Mar 2025 03:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449ED10E251
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 03:32:34 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZHZ0d4yxdz1g2F8;
 Wed, 19 Mar 2025 11:28:01 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 975441A016C;
 Wed, 19 Mar 2025 11:32:31 +0800 (CST)
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 19 Mar 2025 11:32:30 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 drm-dp 7/9] drm/hisilicon/hibmc: Enable this hot plug
 detect of irq feature
Date: Wed, 19 Mar 2025 11:24:33 +0800
Message-ID: <20250319032435.1119469-8-shiyongbang@huawei.com>
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

Add HPD interrupt enable functions in drm framework, and also add
detect_ctx functions. Because of the debouncing when HPD pulled out,
add 200 ms delay in detect. Add link reset process to reset link status
when a new connector pulgged in.

Signed-off-by: Baihan Li <libaihan@huawei.com>
Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
ChangeLog:
v5 -> v6:
  - add detect_ctx with 200ms delay, suggested by Dmitry Baryshkov.
v4 -> v5:
  - separate the vga part commit, suggested by Dmitry Baryshkov.
v3 -> v4:
  - add link reset of rates and lanes in pre link training process, suggested by Dmitry Baryshkov.
  - add vdac detect and connected/disconnected status to enable HPD process, suggested by Dmitry Baryshkov.
  - remove a drm_client, suggested by Dmitry Baryshkov.
  - fix build errors reported by kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202502231304.BCzV4Y8D-lkp@intel.com/
v2 -> v3:
  - remove mdelay(100) hpd function in ISR, suggested by Dmitry Baryshkov.
  - remove enble_display in ISR, suggested by Dmitry Baryshkov.
  - change drm_kms_helper_connector_hotplug_event() to
    drm_connector_helper_hpd_irq_event(), suggested by Dmitry Baryshkov.
  - move macros to dp_reg.h, suggested by Dmitry Baryshkov.
  - remove struct irqs, suggested by Dmitry Baryshkov.
  - split this patch into two parts, suggested by Dmitry Baryshkov.
  - add a drm client dev to handle HPD event.
v1 -> v2:
  - optimizing the description in commit message, suggested by Dmitry Baryshkov.
  - add mdelay(100) comments, suggested by Dmitry Baryshkov.
  - deleting display enable in hpd event, suggested by Dmitry Baryshkov.
---
 .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |  1 +
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 36 ++++++++++++++++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  5 +++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 42 +++++++++++++++++++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  2 +
 5 files changed, 86 insertions(+)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
index c5feef8dc27d..08f9e1caf7fc 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
@@ -16,5 +16,6 @@
 #define HIBMC_DP_SYNC_EN_MASK		0x3
 #define HIBMC_DP_LINK_RATE_CAL		27
 #define HIBMC_DP_SYNC_DELAY(lanes)	((lanes) == 0x2 ? 86 : 46)
+#define HIBMC_DP_INT_ENABLE		0xc
 
 #endif
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
index ce7cb07815b2..8f0daec7d174 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
@@ -189,6 +189,36 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
 	return 0;
 }
 
+void hibmc_dp_enable_int(struct hibmc_dp *dp)
+{
+	struct hibmc_dp_dev *dp_dev = dp->dp_dev;
+
+	writel(HIBMC_DP_INT_ENABLE, dp_dev->base + HIBMC_DP_INTR_ENABLE);
+}
+
+void hibmc_dp_disable_int(struct hibmc_dp *dp)
+{
+	struct hibmc_dp_dev *dp_dev = dp->dp_dev;
+
+	writel(0, dp_dev->base + HIBMC_DP_INTR_ENABLE);
+	writel(HIBMC_DP_INT_RST, dp_dev->base + HIBMC_DP_INTR_ORIGINAL_STATUS);
+}
+
+void hibmc_dp_hpd_cfg(struct hibmc_dp *dp)
+{
+	struct hibmc_dp_dev *dp_dev = dp->dp_dev;
+
+	hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_AUX_REQ, HIBMC_DP_CFG_AUX_SYNC_LEN_SEL, 0x0);
+	hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_AUX_REQ, HIBMC_DP_CFG_AUX_TIMER_TIMEOUT, 0x1);
+	hibmc_dp_reg_write_field(dp->dp_dev, HIBMC_DP_AUX_REQ, HIBMC_DP_CFG_AUX_MIN_PULSE_NUM, 0x9);
+	writel(HIBMC_DP_HDCP, dp_dev->base + HIBMC_DP_HDCP_CFG);
+	writel(0, dp_dev->base + HIBMC_DP_INTR_ENABLE);
+	writel(HIBMC_DP_INT_RST, dp_dev->base + HIBMC_DP_INTR_ORIGINAL_STATUS);
+	writel(HIBMC_DP_INT_ENABLE, dp_dev->base + HIBMC_DP_INTR_ENABLE);
+	writel(HIBMC_DP_DPTX_RST, dp_dev->base + HIBMC_DP_DPTX_RST_CTRL);
+	writel(HIBMC_DP_CLK_EN, dp_dev->base + HIBMC_DP_DPTX_CLK_CTRL);
+}
+
 void hibmc_dp_display_en(struct hibmc_dp *dp, bool enable)
 {
 	struct hibmc_dp_dev *dp_dev = dp->dp_dev;
@@ -227,6 +257,12 @@ int hibmc_dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *mode)
 	return 0;
 }
 
+void hibmc_dp_reset_link(struct hibmc_dp *dp)
+{
+	dp->dp_dev->link.status.clock_recovered = false;
+	dp->dp_dev->link.status.channel_equalized = false;
+}
+
 static const struct hibmc_dp_color_raw g_rgb_raw[] = {
 	{CBAR_COLOR_BAR, 0x000, 0x000, 0x000},
 	{CBAR_WHITE,     0xfff, 0xfff, 0xfff},
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
index 83a53dae8012..665f5b166dfb 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
@@ -49,11 +49,16 @@ struct hibmc_dp {
 	void __iomem *mmio;
 	struct drm_dp_aux aux;
 	struct hibmc_dp_cbar_cfg cfg;
+	u32 irq_status;
 };
 
 int hibmc_dp_hw_init(struct hibmc_dp *dp);
 int hibmc_dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *mode);
 void hibmc_dp_display_en(struct hibmc_dp *dp, bool enable);
 void hibmc_dp_set_cbar(struct hibmc_dp *dp, const struct hibmc_dp_cbar_cfg *cfg);
+void hibmc_dp_reset_link(struct hibmc_dp *dp);
+void hibmc_dp_hpd_cfg(struct hibmc_dp *dp);
+void hibmc_dp_enable_int(struct hibmc_dp *dp);
+void hibmc_dp_disable_int(struct hibmc_dp *dp);
 
 #endif
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
index 8d3c67dcb5b3..881066c1221a 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
@@ -13,6 +13,8 @@
 #include "hibmc_drm_drv.h"
 #include "dp/dp_hw.h"
 
+#define DP_MASKED_SINK_HPD_PLUG_INT	BIT(2)
+
 static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
 {
 	struct hibmc_dp *dp = to_hibmc_dp(connector);
@@ -33,14 +35,25 @@ static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
 	return count;
 }
 
+static int hibmc_dp_detect(struct drm_connector *connector,
+			   struct drm_modeset_acquire_ctx *ctx, bool force)
+{
+	mdelay(200);
+
+	return drm_connector_helper_detect_from_ddc(connector, ctx, force);
+}
+
 static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
 	.get_modes = hibmc_dp_connector_get_modes,
+	.detect_ctx = hibmc_dp_detect,
 };
 
 static int hibmc_dp_late_register(struct drm_connector *connector)
 {
 	struct hibmc_dp *dp = to_hibmc_dp(connector);
 
+	hibmc_dp_enable_int(dp);
+
 	return drm_dp_aux_register(&dp->aux);
 }
 
@@ -49,6 +62,8 @@ static void hibmc_dp_early_unregister(struct drm_connector *connector)
 	struct hibmc_dp *dp = to_hibmc_dp(connector);
 
 	drm_dp_aux_unregister(&dp->aux);
+
+	hibmc_dp_disable_int(dp);
 }
 
 static const struct drm_connector_funcs hibmc_dp_conn_funcs = {
@@ -100,6 +115,31 @@ static const struct drm_encoder_helper_funcs hibmc_dp_encoder_helper_funcs = {
 	.atomic_disable = hibmc_dp_encoder_disable,
 };
 
+irqreturn_t hibmc_dp_hpd_isr(int irq, void *arg)
+{
+	struct drm_device *dev = (struct drm_device *)arg;
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx))
+		return -ENODEV;
+
+	if (priv->dp.irq_status & DP_MASKED_SINK_HPD_PLUG_INT) {
+		drm_dbg_dp(&priv->dev, "HPD IN isr occur!\n");
+		hibmc_dp_hpd_cfg(&priv->dp);
+	} else {
+		drm_dbg_dp(&priv->dev, "HPD OUT isr occur!\n");
+		hibmc_dp_reset_link(&priv->dp);
+	}
+
+	if (dev->registered)
+		drm_connector_helper_hpd_irq_event(&priv->dp.connector);
+
+	drm_dev_exit(idx);
+
+	return IRQ_HANDLED;
+}
+
 int hibmc_dp_init(struct hibmc_drm_private *priv)
 {
 	struct drm_device *dev = &priv->dev;
@@ -140,5 +180,7 @@ int hibmc_dp_init(struct hibmc_drm_private *priv)
 
 	drm_connector_attach_encoder(connector, encoder);
 
+	connector->polled = DRM_CONNECTOR_POLL_HPD;
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
index bc89e4b9f4e3..daed1330b961 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
@@ -71,4 +71,6 @@ int hibmc_dp_init(struct hibmc_drm_private *priv);
 
 void hibmc_debugfs_init(struct drm_connector *connector, struct dentry *root);
 
+irqreturn_t hibmc_dp_hpd_isr(int irq, void *arg);
+
 #endif
-- 
2.33.0

