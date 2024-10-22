Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A889AA272
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 14:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A488A10E67C;
	Tue, 22 Oct 2024 12:47:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3ACF10E321
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 12:47:04 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XXsNM3RHwz2Fb95;
 Tue, 22 Oct 2024 20:45:39 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 76482180042;
 Tue, 22 Oct 2024 20:47:01 +0800 (CST)
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 22 Oct 2024 20:47:00 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 drm-dp 3/4] drm/hisilicon/hibmc: add dp hw moduel in hibmc
Date: Tue, 22 Oct 2024 20:41:47 +0800
Message-ID: <20241022124148.1952761-4-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20241022124148.1952761-1-shiyongbang@huawei.com>
References: <20241022124148.1952761-1-shiyongbang@huawei.com>
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

From: baihan li <libaihan@huawei.com>

Build a dp level that hibmc driver can enable dp by
calling their functions.

Signed-off-by: baihan li <libaihan@huawei.com>
---
ChangeLog:
v1 -> v2:
  - changed some defines and functions to former patch, suggested by Dmitry Baryshkov.
  - sorting the headers including in dp_hw.h and hibmc_drm_drv.c files, suggested by Dmitry Baryshkov.
  - deleting struct dp_mode and dp_mode_cfg function, suggested by Dmitry Baryshkov.
  - fix build errors reported by kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202410040328.VeVxM9yB-lkp@intel.com/
  v1:https://lore.kernel.org/all/20240930100610.782363-1-shiyongbang@huawei.com/
---
 drivers/gpu/drm/hisilicon/hibmc/Makefile      |   2 +-
 .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |  19 ++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 237 ++++++++++++++++++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  31 +++
 4 files changed, 288 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h

diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
index 94d77da88bbf..214228052ccf 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
+++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
-	       dp/dp_aux.o dp/dp_link.o
+	       dp/dp_aux.o dp/dp_link.o dp/dp_hw.o
 
 obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
new file mode 100644
index 000000000000..4846deb794ae
--- /dev/null
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* Copyright (c) 2024 Hisilicon Limited. */
+
+#ifndef DP_CONFIG_H
+#define DP_CONFIG_H
+
+#define DP_BPP 24
+#define DP_SYMBOL_PER_FCLK 4
+#define DP_MSA1 0x20
+#define DP_MSA2 0x845c00
+#define DP_OFFSET 0x1e0000
+#define DP_HDCP 0x2
+#define DP_INT_RST 0xffff
+#define DP_DPTX_RST 0x3ff
+#define DP_CLK_EN 0x7
+#define DP_SYNC_EN_MASK 0x3
+#define DP_LINK_RATE_CAL 27
+
+#endif
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
new file mode 100644
index 000000000000..5ed3c9138790
--- /dev/null
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
@@ -0,0 +1,237 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright (c) 2024 Hisilicon Limited.
+
+#include <linux/io.h>
+#include <linux/delay.h>
+#include "dp_config.h"
+#include "dp_comm.h"
+#include "dp_reg.h"
+#include "dp_hw.h"
+#include "dp_link.h"
+#include "dp_aux.h"
+
+static int dp_link_init(struct dp_dev *dp)
+{
+	dp->link.cap.lanes = 2;
+	dp->link.train_set = devm_kzalloc(dp->dev->dev,
+					  dp->link.cap.lanes * sizeof(u8), GFP_KERNEL);
+	if (!dp->link.train_set)
+		return -ENOMEM;
+
+	dp->link.cap.link_rate = 1;
+
+	return 0;
+}
+
+static void dp_set_tu(struct dp_dev *dp, struct drm_display_mode *mode)
+{
+	u32 tu_symbol_frac_size;
+	u32 tu_symbol_size;
+	u64 rate_ks;
+	u8 lane_num;
+	u32 value;
+	u32 bpp;
+
+	lane_num = dp->link.cap.lanes;
+	if (lane_num == 0) {
+		drm_err(dp->dev, "set tu failed, lane num cannot be 0!\n");
+		return;
+	}
+
+	bpp = DP_BPP;
+	rate_ks = dp_get_link_rate(dp->link.cap.link_rate) * DP_LINK_RATE_CAL;
+	value = (mode->clock * bpp * 5) / (61 * lane_num * rate_ks);
+
+	if (value % 10 == 9) { /* 9 carry */
+		tu_symbol_size = value / 10 + 1;
+		tu_symbol_frac_size = 0;
+	} else {
+		tu_symbol_size = value / 10;
+		tu_symbol_frac_size = value % 10 + 1;
+	}
+
+	drm_info(dp->dev, "tu value: %u.%u value: %u\n",
+		 tu_symbol_size, tu_symbol_frac_size, value);
+
+	dp_write_bits(dp->base + DP_VIDEO_PACKET,
+		      DP_CFG_STREAM_TU_SYMBOL_SIZE, tu_symbol_size);
+	dp_write_bits(dp->base + DP_VIDEO_PACKET,
+		      DP_CFG_STREAM_TU_SYMBOL_FRAC_SIZE, tu_symbol_frac_size);
+}
+
+static void dp_set_sst(struct dp_dev *dp, struct drm_display_mode *mode)
+{
+	u32 hblank_size;
+	u32 htotal_size;
+	u32 htotal_int;
+	u32 hblank_int;
+	u32 fclk; /* flink_clock */
+
+	fclk = dp_get_link_rate(dp->link.cap.link_rate) * DP_LINK_RATE_CAL;
+
+	/* ssc: 9947 / 10000 = 0.9947 */
+	htotal_int = mode->htotal * 9947 / 10000;
+	htotal_size = (u32)((u64)htotal_int * fclk / (DP_SYMBOL_PER_FCLK * (mode->clock / 1000)));
+
+	/* ssc: max effect bandwidth 53 / 10000 = 0.53% */
+	hblank_int = (mode->htotal - mode->hdisplay) - mode->hdisplay * 53 / 10000;
+	hblank_size = (u64)hblank_int * fclk * 9947 /
+		      (mode->clock * 10 * DP_SYMBOL_PER_FCLK);
+
+	drm_info(dp->dev, "h_active %u v_active %u htotal_size %u hblank_size %u",
+		 mode->hdisplay, mode->vdisplay, htotal_size, hblank_size);
+	drm_info(dp->dev, "flink_clock %u pixel_clock %d", fclk, (mode->clock / 1000));
+
+	dp_write_bits(dp->base + DP_VIDEO_HORIZONTAL_SIZE, DP_CFG_STREAM_HTOTAL_SIZE, htotal_size);
+	dp_write_bits(dp->base + DP_VIDEO_HORIZONTAL_SIZE, DP_CFG_STREAM_HBLANK_SIZE, hblank_size);
+}
+
+static void dp_link_cfg(struct dp_dev *dp, struct drm_display_mode *mode)
+{
+	u32 timing_delay;
+	u32 vblank;
+	u32 hstart;
+	u32 vstart;
+
+	vblank = mode->vtotal - mode->vdisplay;
+	timing_delay = mode->htotal - mode->hsync_start;
+	hstart = mode->htotal - mode->hsync_start;
+	vstart = mode->vtotal - mode->vsync_start;
+
+	dp_write_bits(dp->base + DP_TIMING_GEN_CONFIG0,
+		      DP_CFG_TIMING_GEN0_HBLANK, (mode->htotal - mode->hdisplay));
+	dp_write_bits(dp->base + DP_TIMING_GEN_CONFIG0,
+		      DP_CFG_TIMING_GEN0_HACTIVE, mode->hdisplay);
+
+	dp_write_bits(dp->base + DP_TIMING_GEN_CONFIG2,
+		      DP_CFG_TIMING_GEN0_VBLANK, vblank);
+	dp_write_bits(dp->base + DP_TIMING_GEN_CONFIG2,
+		      DP_CFG_TIMING_GEN0_VACTIVE, mode->vdisplay);
+	dp_write_bits(dp->base + DP_TIMING_GEN_CONFIG3,
+		      DP_CFG_TIMING_GEN0_VFRONT_PORCH, (mode->vsync_start - mode->vdisplay));
+
+	dp_write_bits(dp->base + DP_VIDEO_CONFIG0,
+		      DP_CFG_STREAM_HACTIVE, mode->hdisplay);
+	dp_write_bits(dp->base + DP_VIDEO_CONFIG0,
+		      DP_CFG_STREAM_HBLANK, (mode->htotal - mode->hdisplay));
+	dp_write_bits(dp->base + DP_VIDEO_CONFIG2,
+		      DP_CFG_STREAM_HSYNC_WIDTH, (mode->hsync_end - mode->hsync_start));
+
+	dp_write_bits(dp->base + DP_VIDEO_CONFIG1,
+		      DP_CFG_STREAM_VACTIVE, mode->vdisplay);
+	dp_write_bits(dp->base + DP_VIDEO_CONFIG1,
+		      DP_CFG_STREAM_VBLANK, vblank);
+	dp_write_bits(dp->base + DP_VIDEO_CONFIG3,
+		      DP_CFG_STREAM_VFRONT_PORCH, (mode->vsync_start - mode->vdisplay));
+	dp_write_bits(dp->base + DP_VIDEO_CONFIG3,
+		      DP_CFG_STREAM_VSYNC_WIDTH, (mode->vsync_end - mode->vsync_start));
+
+	dp_write_bits(dp->base + DP_VIDEO_MSA0,
+		      DP_CFG_STREAM_VSTART, vstart);
+	dp_write_bits(dp->base + DP_VIDEO_MSA0,
+		      DP_CFG_STREAM_HSTART, hstart);
+
+	dp_write_bits(dp->base + DP_VIDEO_CTRL,
+		      DP_CFG_STREAM_VSYNC_POLARITY,
+		      mode->flags & DRM_MODE_FLAG_PVSYNC ? 1 : 0);
+	dp_write_bits(dp->base + DP_VIDEO_CTRL,
+		      DP_CFG_STREAM_HSYNC_POLARITY,
+		      mode->flags & DRM_MODE_FLAG_PHSYNC ? 1 : 0);
+
+	/* MSA mic 0 and 1 */
+	writel(DP_MSA1, dp->base + DP_VIDEO_MSA1);
+	writel(DP_MSA2, dp->base + DP_VIDEO_MSA2);
+
+	dp_set_tu(dp, mode);
+
+	dp_write_bits(dp->base + DP_VIDEO_CTRL, DP_CFG_STREAM_RGB_ENABLE, 0x1);
+	dp_write_bits(dp->base + DP_VIDEO_CTRL, DP_CFG_STREAM_VIDEO_MAPPING, 0);
+
+	/* divide 2: up even */
+	if (timing_delay - timing_delay / 2 * 2)
+		timing_delay++;
+
+	dp_write_bits(dp->base + DP_TIMING_MODEL_CTRL,
+		      DP_CFG_PIXEL_NUM_TIMING_MODE_SEL1, timing_delay);
+
+	dp_set_sst(dp, mode);
+}
+
+int dp_hw_init(struct hibmc_dp *dp)
+{
+	struct drm_device *drm_dev = dp->drm_dev;
+	struct dp_dev *dp_dev;
+	int ret;
+
+	dp_dev = devm_kzalloc(drm_dev->dev, sizeof(struct dp_dev), GFP_KERNEL);
+	if (!dp_dev)
+		return -ENOMEM;
+
+	dp->dp_dev = dp_dev;
+
+	dp_dev->dev = drm_dev;
+	dp_dev->base = dp->mmio + DP_OFFSET;
+
+	dp_aux_init(dp_dev);
+
+	ret = dp_link_init(dp_dev);
+	if (ret) {
+		drm_err(drm_dev, "dp link init failed\n");
+		return ret;
+	}
+
+	/* hdcp data */
+	writel(DP_HDCP, dp_dev->base + DP_HDCP_CFG);
+	/* int init */
+	writel(0, dp_dev->base + DP_INTR_ENABLE);
+	writel(DP_INT_RST, dp_dev->base + DP_INTR_ORIGINAL_STATUS);
+	/* rst */
+	writel(DP_DPTX_RST, dp_dev->base + DP_DPTX_RST_CTRL);
+	/* clock enable */
+	writel(DP_CLK_EN, dp_dev->base + DP_DPTX_CLK_CTRL);
+
+	return 0;
+}
+
+void dp_hw_uninit(struct hibmc_dp *dp)
+{
+	// keep this uninit interface in the future use
+}
+
+void dp_display_en(struct hibmc_dp *dp, bool enable)
+{
+	struct dp_dev *dp_dev = dp->dp_dev;
+
+	if (enable) {
+		dp_write_bits(dp_dev->base + DP_VIDEO_CTRL, BIT(0), 0x1);
+		writel(DP_SYNC_EN_MASK, dp_dev->base + DP_TIMING_SYNC_CTRL);
+		dp_write_bits(dp_dev->base + DP_DPTX_GCTL0, BIT(10), 0x1);
+		writel(DP_SYNC_EN_MASK, dp_dev->base + DP_TIMING_SYNC_CTRL);
+	} else {
+		dp_write_bits(dp_dev->base + DP_DPTX_GCTL0, BIT(10), 0);
+		writel(DP_SYNC_EN_MASK, dp_dev->base + DP_TIMING_SYNC_CTRL);
+		dp_write_bits(dp_dev->base + DP_VIDEO_CTRL, BIT(0), 0);
+		writel(DP_SYNC_EN_MASK, dp_dev->base + DP_TIMING_SYNC_CTRL);
+	}
+
+	msleep(50);
+}
+
+int dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *mode)
+{
+	struct dp_dev *dp_dev = dp->dp_dev;
+	int ret;
+
+	if (!dp_dev->link.status.channel_equalized) {
+		ret = dp_link_training(dp_dev);
+		if (ret) {
+			drm_err(dp->drm_dev, "dp link training failed, ret: %d\n", ret);
+			return ret;
+		}
+	}
+
+	dp_display_en(dp, false);
+	dp_link_cfg(dp_dev, mode);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
new file mode 100644
index 000000000000..f5394327dc99
--- /dev/null
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* Copyright (c) 2024 Hisilicon Limited. */
+
+#ifndef DP_KAPI_H
+#define DP_KAPI_H
+
+#include <linux/types.h>
+#include <linux/delay.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_print.h>
+#include <video/videomode.h>
+
+struct dp_dev;
+
+struct hibmc_dp {
+	struct dp_dev *dp_dev;
+	struct drm_device *drm_dev;
+	struct drm_encoder encoder;
+	struct drm_connector connector;
+	void __iomem *mmio;
+};
+
+int dp_hw_init(struct hibmc_dp *dp);
+void dp_hw_uninit(struct hibmc_dp *dp);
+int dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *mode);
+void dp_display_en(struct hibmc_dp *dp, bool enable);
+
+#endif
-- 
2.33.0

