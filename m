Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55101A58B18
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 05:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6095410E399;
	Mon, 10 Mar 2025 04:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E448410E2CD
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 04:09:22 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ZB3LR22bYzyRrG;
 Mon, 10 Mar 2025 12:09:19 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id EB03A140118;
 Mon, 10 Mar 2025 12:09:20 +0800 (CST)
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 10 Mar 2025 12:09:19 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 drm-dp 6/9] drm/hisilicon/hibmc: Add colorbar-cfg feature
 and its debugfs file
Date: Mon, 10 Mar 2025 12:01:35 +0800
Message-ID: <20250310040138.2025715-7-shiyongbang@huawei.com>
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

DP controller can support generating a color bar signal over the
DisplayPort interface. This can be useful to check for possible DDR
or GPU problems, as the signal generator resides completely in the DP
block. Add debugfs file that controls colorbar generator.

echo: config the color bar register to display
cat: print the color bar configuration

Signed-off-by: Baihan Li <libaihan@huawei.com>
Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
ChangeLog:
v3 -> v4:
  - add comments in hibmc_control_write(), suggested by Dmitry Baryshkov.
v2 -> v3:
  - rewrite the commit log, suggested by Dmitry Baryshkov.
  - move colorbar debugfs entry to this patch, suggested by Dmitry Baryshkov.
  - change binary format to integer format, suggested by Dmitry Baryshkov.
v1 -> v2:
  - add colorbar introduction in commit, suggested by Dmitry Baryshkov.
  - splittting colorbar and debugfs in different patches, suggested by Dmitry Baryshkov.
  - deleting edid decoder and its debugfs, suggested by Dmitry Baryshkov.
  - using debugfs_init() callback, suggested by Dmitry Baryshkov.
---
 drivers/gpu/drm/hisilicon/hibmc/Makefile      |   3 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  43 ++++++++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  29 +++++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |   3 +
 .../drm/hisilicon/hibmc/hibmc_drm_debugfs.c   | 104 ++++++++++++++++++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    |   1 +
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |   2 +
 7 files changed, 184 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c

diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
index 43de077d6769..1f65c683282f 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
+++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
-	       dp/dp_aux.o dp/dp_link.o dp/dp_hw.o dp/dp_serdes.o hibmc_drm_dp.o
+	       dp/dp_aux.o dp/dp_link.o dp/dp_hw.o dp/dp_serdes.o hibmc_drm_dp.o \
+	       hibmc_drm_debugfs.o
 
 obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
index aa9354a996c9..ce7cb07815b2 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
@@ -226,3 +226,46 @@ int hibmc_dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *mode)
 
 	return 0;
 }
+
+static const struct hibmc_dp_color_raw g_rgb_raw[] = {
+	{CBAR_COLOR_BAR, 0x000, 0x000, 0x000},
+	{CBAR_WHITE,     0xfff, 0xfff, 0xfff},
+	{CBAR_RED,       0xfff, 0x000, 0x000},
+	{CBAR_ORANGE,    0xfff, 0x800, 0x000},
+	{CBAR_YELLOW,    0xfff, 0xfff, 0x000},
+	{CBAR_GREEN,     0x000, 0xfff, 0x000},
+	{CBAR_CYAN,      0x000, 0x800, 0x800},
+	{CBAR_BLUE,      0x000, 0x000, 0xfff},
+	{CBAR_PURPLE,    0x800, 0x000, 0x800},
+	{CBAR_BLACK,     0x000, 0x000, 0x000},
+};
+
+void hibmc_dp_set_cbar(struct hibmc_dp *dp, const struct hibmc_dp_cbar_cfg *cfg)
+{
+	struct hibmc_dp_dev *dp_dev = dp->dp_dev;
+	struct hibmc_dp_color_raw raw_data;
+
+	if (cfg->enable) {
+		hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, BIT(9),
+					 cfg->self_timing);
+		hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, GENMASK(8, 1),
+					 cfg->dynamic_rate);
+		if (cfg->pattern == CBAR_COLOR_BAR) {
+			hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, BIT(10), 0);
+		} else {
+			raw_data = g_rgb_raw[cfg->pattern];
+			drm_dbg_dp(dp->drm_dev, "r:%x g:%x b:%x\n", raw_data.r_value,
+				   raw_data.g_value, raw_data.b_value);
+			hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, BIT(10), 1);
+			hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, GENMASK(23, 12),
+						 raw_data.r_value);
+			hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL1, GENMASK(23, 12),
+						 raw_data.g_value);
+			hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL1, GENMASK(11, 0),
+						 raw_data.b_value);
+		}
+	}
+
+	hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, BIT(0), cfg->enable);
+	writel(HIBMC_DP_SYNC_EN_MASK, dp_dev->base + HIBMC_DP_TIMING_SYNC_CTRL);
+}
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
index 53b6d0beecea..83a53dae8012 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
@@ -14,6 +14,33 @@
 
 struct hibmc_dp_dev;
 
+enum hibmc_dp_cbar_pattern {
+	CBAR_COLOR_BAR,
+	CBAR_WHITE,
+	CBAR_RED,
+	CBAR_ORANGE,
+	CBAR_YELLOW,
+	CBAR_GREEN,
+	CBAR_CYAN,
+	CBAR_BLUE,
+	CBAR_PURPLE,
+	CBAR_BLACK,
+};
+
+struct hibmc_dp_color_raw {
+	enum hibmc_dp_cbar_pattern pattern;
+	u32 r_value;
+	u32 g_value;
+	u32 b_value;
+};
+
+struct hibmc_dp_cbar_cfg {
+	u8 enable;
+	u8 self_timing;
+	u8 dynamic_rate; /* 0:static, 1-255(frame):dynamic */
+	enum hibmc_dp_cbar_pattern pattern;
+};
+
 struct hibmc_dp {
 	struct hibmc_dp_dev *dp_dev;
 	struct drm_device *drm_dev;
@@ -21,10 +48,12 @@ struct hibmc_dp {
 	struct drm_connector connector;
 	void __iomem *mmio;
 	struct drm_dp_aux aux;
+	struct hibmc_dp_cbar_cfg cfg;
 };
 
 int hibmc_dp_hw_init(struct hibmc_dp *dp);
 int hibmc_dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *mode);
 void hibmc_dp_display_en(struct hibmc_dp *dp, bool enable);
+void hibmc_dp_set_cbar(struct hibmc_dp *dp, const struct hibmc_dp_cbar_cfg *cfg);
 
 #endif
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
index 6eb76decc636..5614b727a710 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
@@ -67,6 +67,9 @@
 #define HIBMC_DP_CFG_STREAM_HTOTAL_SIZE		GENMASK(31, 16)
 #define HIBMC_DP_CFG_STREAM_HBLANK_SIZE		GENMASK(15, 0)
 
+#define HIBMC_DP_COLOR_BAR_CTRL			0x260
+#define HIBMC_DP_COLOR_BAR_CTRL1		0x264
+
 #define HIBMC_DP_TIMING_GEN_CONFIG0		0x26c
 #define HIBMC_DP_CFG_TIMING_GEN0_HACTIVE	GENMASK(31, 16)
 #define HIBMC_DP_CFG_TIMING_GEN0_HBLANK		GENMASK(15, 0)
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c
new file mode 100644
index 000000000000..f585387c3a49
--- /dev/null
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright (c) 2024 Hisilicon Limited.
+
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/seq_file.h>
+#include <linux/pci.h>
+
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+#include <drm/drm_debugfs.h>
+#include <drm/drm_edid.h>
+
+#include "hibmc_drm_drv.h"
+
+#define MAX_BUF_SIZE 12
+
+static ssize_t hibmc_control_write(struct file *file, const char __user *user_buf,
+				   size_t count, loff_t *ppos)
+{
+	struct hibmc_drm_private *priv = file_inode(file)->i_private;
+	struct hibmc_dp_cbar_cfg *cfg = &priv->dp.cfg;
+	int ret, idx;
+	u8 buf[MAX_BUF_SIZE];
+
+	if (count >= MAX_BUF_SIZE)
+		return -EINVAL;
+
+	if (copy_from_user(buf, user_buf, count))
+		return -EFAULT;
+
+	buf[count] = '\0';
+
+	/* Only 4 parameters is allowed, the ranger are as follow:
+	 * [0] enable/disable colorbar feature
+	       0: enable colorbar, 1: disable colorbar
+	 * [1] the timing source of colorbar displaying
+	       0: timing follows XDP, 1: internal self timing
+	 * [2] the movment of colorbar displaying
+	       0: static colorbar image,
+	 *     1~255: right shifting a type of color per (1~255)frames
+	 * [3] the color type of colorbar displaying
+	       0~9: color bar, white, red, orange,
+	 *          yellow, green, cyan, bule, pupper, black
+	 */
+	if (sscanf(buf, "%hhu %hhu %hhu %u", &cfg->enable, &cfg->self_timing,
+		   &cfg->dynamic_rate, &cfg->pattern) != 4) {
+		return -EINVAL;
+	}
+
+	if (cfg->pattern > 9 || cfg->enable > 1 || cfg->self_timing > 1)
+		return -EINVAL;
+
+	ret = drm_dev_enter(&priv->dev, &idx);
+	if (!ret)
+		return -ENODEV;
+
+	hibmc_dp_set_cbar(&priv->dp, cfg);
+
+	drm_dev_exit(idx);
+
+	return count;
+}
+
+static int hibmc_dp_dbgfs_show(struct seq_file *m, void *arg)
+{
+	struct hibmc_drm_private *priv = m->private;
+	struct hibmc_dp_cbar_cfg *cfg = &priv->dp.cfg;
+	int idx;
+
+	if (!drm_dev_enter(&priv->dev, &idx))
+		return -ENODEV;
+
+	seq_printf(m, "hibmc dp colorbar cfg: %u %u %u %u\n", cfg->enable, cfg->self_timing,
+		   cfg->dynamic_rate, cfg->pattern);
+
+	drm_dev_exit(idx);
+
+	return 0;
+}
+
+static int hibmc_open(struct inode *inode, struct file *filp)
+{
+	return single_open(filp, hibmc_dp_dbgfs_show, inode->i_private);
+}
+
+static const struct file_operations hibmc_dbg_fops = {
+	.owner   = THIS_MODULE,
+	.write   = hibmc_control_write,
+	.read    = seq_read,
+	.open    = hibmc_open,
+	.llseek  = seq_lseek,
+	.release = single_release,
+};
+
+void hibmc_debugfs_init(struct drm_connector *connector, struct dentry *root)
+{
+	struct drm_device *dev = connector->dev;
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
+
+	/* create the file in drm directory, so we don't need to remove manually */
+	debugfs_create_file("colorbar-cfg", 0200,
+			    root, priv, &hibmc_dbg_fops);
+}
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
index 891fde237c16..6e7b1a6247cd 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
@@ -56,6 +56,7 @@ static const struct drm_connector_funcs hibmc_dp_conn_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 	.late_register = hibmc_dp_late_register,
 	.early_unregister = hibmc_dp_early_unregister,
+	.debugfs_init = hibmc_debugfs_init,
 };
 
 static inline int hibmc_dp_prepare(struct hibmc_dp *dp, struct drm_display_mode *mode)
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
index 3ddd71aada66..bc89e4b9f4e3 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
@@ -69,4 +69,6 @@ int hibmc_ddc_create(struct drm_device *drm_dev, struct hibmc_vdac *connector);
 
 int hibmc_dp_init(struct hibmc_drm_private *priv);
 
+void hibmc_debugfs_init(struct drm_connector *connector, struct dentry *root);
+
 #endif
-- 
2.33.0

