Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BB8A2F07A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 15:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF2610E57D;
	Mon, 10 Feb 2025 14:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4809210E586
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 14:57:12 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Ys6yb16LBz2FctR;
 Mon, 10 Feb 2025 22:53:27 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id AB3671A016C;
 Mon, 10 Feb 2025 22:57:10 +0800 (CST)
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 10 Feb 2025 22:57:09 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 drm-dp 6/7] drm/hisilicon/hibmc: Add drm debugfs functions
Date: Mon, 10 Feb 2025 22:49:58 +0800
Message-ID: <20250210144959.100551-7-shiyongbang@huawei.com>
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

We use the previous two patches as our debug functions and
generate two files. "hibmc-dp" and "color-bar".
hibmc-dp: read only, print the dp link status and dpcd version
color-bar: read/write
           write: cfg color bar and enable/disable it by your input
           read: print your current cfg info of color-bar

Signed-off-by: Baihan Li <libaihan@huawei.com>
Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
---
ChangeLog:
v1 -> v2:
  - deleting edid decoder and its debugfs, suggested by Dmitry Baryshkov.
  - using debugfs_init() callback, suggested by Dmitry Baryshkov.
---
 drivers/gpu/drm/hisilicon/hibmc/Makefile      |   3 +-
 .../drm/hisilicon/hibmc/hibmc_drm_debugfs.c   | 124 ++++++++++++++++++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    |   1 +
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |   2 +
 4 files changed, 129 insertions(+), 1 deletion(-)
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
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c
new file mode 100644
index 000000000000..af2efb70d6ea
--- /dev/null
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c
@@ -0,0 +1,124 @@
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
+static int hibmc_dp_show(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = m->private;
+	struct drm_device *dev = node->minor->dev;
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx))
+		return -ENODEV;
+
+	seq_printf(m, "enable lanes: %u\n", hibmc_dp_get_lanes(&priv->dp));
+	seq_printf(m, "link rate: %d\n", hibmc_dp_get_link_rate(&priv->dp) * 27);
+	seq_printf(m, "dpcd version: 0x%x\n", hibmc_dp_get_dpcd(&priv->dp));
+
+	drm_dev_exit(idx);
+
+	return 0;
+}
+
+static ssize_t hibmc_control_write(struct file *file, const char __user *user_buf,
+				   size_t size, loff_t *ppos)
+{
+	struct hibmc_drm_private *priv = file_inode(file)->i_private;
+	struct hibmc_dp_cbar_cfg *cfg = &priv->dp.cfg;
+	u32 input = 0;
+	int ret, idx;
+	u8 val;
+
+	ret = kstrtou32_from_user(user_buf, size, 0, &input);
+	if (ret)
+		return ret;
+
+	val = FIELD_GET(GENMASK(13, 10), input);
+	if (val > 9)
+		return -EINVAL;
+	cfg->pattern = val;
+	cfg->enable = FIELD_GET(BIT(0), input);
+	cfg->self_timing = FIELD_GET(BIT(1), input);
+	cfg->dynamic_rate = FIELD_GET(GENMASK(9, 2), input);
+
+	ret = drm_dev_enter(&priv->dev, &idx);
+	if (!ret)
+		return -ENODEV;
+
+	hibmc_dp_set_cbar(&priv->dp, cfg);
+
+	drm_dev_exit(idx);
+
+	return size;
+}
+
+static int hibmc_dp_dbgfs_show(struct seq_file *m, void *arg)
+{
+	struct hibmc_drm_private *priv = m->private;
+	struct hibmc_dp_cbar_cfg *cfg = &priv->dp.cfg;
+	u32 output = 0;
+	int idx;
+
+	if (!drm_dev_enter(&priv->dev, &idx))
+		return -ENODEV;
+
+	/* bit[0]: 0: enable colorbar, 1: disable colorbar
+	 * bit[1]: 0: timing follows XDP, 1: internal self timing
+	 * bit[2,9]: 0: static colorbar image,
+	 *           1~255: right shifting a type of color per (1~255)frames
+	 * bit[10,13]: 0~9: color bar, white, red, orange,
+	 *             yellow, green, cyan, bule, pupper, black
+	 */
+	output = cfg->enable | (cfg->self_timing << 1) |
+		 (cfg->dynamic_rate << 2) | (cfg->pattern << 10);
+
+	drm_dev_exit(idx);
+
+	seq_printf(m, "hibmc dp colorbar cfg: %u\n", output);
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
+static struct drm_info_list hibmc_debugfs_list[] = {
+	{ "hibmc-dp", hibmc_dp_show },
+};
+
+void hibmc_debugfs_init(struct drm_connector *connector, struct dentry *root)
+{
+	struct drm_device *dev = connector->dev;
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
+	struct drm_minor *minor = dev->primary;
+
+	/* create the file in drm directory, so we don't need to remove manually */
+	debugfs_create_file("colorbar-cfg", 0200,
+			    root, priv, &hibmc_dbg_fops);
+
+	drm_debugfs_create_files(hibmc_debugfs_list, ARRAY_SIZE(hibmc_debugfs_list),
+				 root, minor);
+}
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
index 795c5b1a6b99..1f8f7b74f5b4 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
@@ -40,6 +40,7 @@ static const struct drm_connector_funcs hibmc_dp_conn_funcs = {
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

