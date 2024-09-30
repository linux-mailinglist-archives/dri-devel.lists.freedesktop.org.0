Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D100E98B57B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 09:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA5410E5F0;
	Tue,  1 Oct 2024 07:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98E510E3E6
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 10:31:00 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XHH0R70Bkz2QTx5;
 Mon, 30 Sep 2024 18:11:19 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 8566C1A0190;
 Mon, 30 Sep 2024 18:12:13 +0800 (CST)
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 30 Sep 2024 18:12:12 +0800
From: shiyongbang <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH drm-dp 3/4] drm/hisilicon/hibmc: add dp kapi moduel in hibmc
 drivers
Date: Mon, 30 Sep 2024 18:06:09 +0800
Message-ID: <20240930100610.782363-4-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20240930100610.782363-1-shiyongbang@huawei.com>
References: <20240930100610.782363-1-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.169.71.169]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd500013.china.huawei.com (7.221.188.12)
X-Mailman-Approved-At: Tue, 01 Oct 2024 07:26:13 +0000
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

Build a kapi level that hibmc driver can enable dp by
calling these kapi functions.

Signed-off-by: baihan li <libaihan@huawei.com>
---
 drivers/gpu/drm/hisilicon/hibmc/Makefile      |  2 +-
 .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    | 20 ++++++++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.c  | 12 ++---
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.h  | 48 +++++++++++++++++++
 4 files changed, 75 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.h

diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
index 94d77da88bbf..693036dfab52 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
+++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
-	       dp/dp_aux.o dp/dp_link.o
+	       dp/dp_aux.o dp/dp_link.o dp/dp_kapi.o
 
 obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
new file mode 100644
index 000000000000..a6353a808cc4
--- /dev/null
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* Copyright (c) 2024 Hisilicon Limited. */
+
+#ifndef DP_CONFIG_H
+#define DP_CONFIG_H
+
+#define DP_BPP 24
+#define DP_SYMBOL_PER_FCLK 4
+#define DP_MIN_PULSE_NUM 0x9
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
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.c
index 4091723473ad..ca7edc69427c 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.c
@@ -64,12 +64,12 @@ static void hibmc_dp_set_tu(struct hibmc_dp_dev *dp, struct dp_mode *mode)
 	rate_ks = dp->link.cap.link_rate * DP_LINK_RATE_CAL;
 	value = (pixel_clock * bpp * 5000) / (61 * lane_num * rate_ks);
 
-	if (value % 10 == 9) { /* 10: div, 9: carry */
-		tu_symbol_size = value / 10 + 1; /* 10: div */
+	if (value % 10 == 9) { /* 9 carry */
+		tu_symbol_size = value / 10 + 1;
 		tu_symbol_frac_size = 0;
 	} else {
-		tu_symbol_size = value / 10; /* 10: div */
-		tu_symbol_frac_size = value % 10 + 1; /* 10: div */
+		tu_symbol_size = value / 10;
+		tu_symbol_frac_size = value % 10 + 1;
 	}
 
 	drm_info(dp->dev, "tu value: %u.%u value: %u\n",
@@ -158,7 +158,7 @@ static void hibmc_dp_link_cfg(struct hibmc_dp_dev *dp, struct dp_mode *mode)
 	dp_write_bits(dp->base + DP_VIDEO_CTRL,
 		      DP_CFG_STREAM_HSYNC_POLARITY, mode->h_pol);
 
-	/* MSA mic 0 and 1*/
+	/* MSA mic 0 and 1 */
 	writel(DP_MSA1, dp->base + DP_VIDEO_MSA1);
 	writel(DP_MSA2, dp->base + DP_VIDEO_MSA2);
 
@@ -167,7 +167,7 @@ static void hibmc_dp_link_cfg(struct hibmc_dp_dev *dp, struct dp_mode *mode)
 	dp_write_bits(dp->base + DP_VIDEO_CTRL, DP_CFG_STREAM_RGB_ENABLE, 0x1);
 	dp_write_bits(dp->base + DP_VIDEO_CTRL, DP_CFG_STREAM_VIDEO_MAPPING, 0);
 
-	/*divide 2: up even */
+	/* divide 2: up even */
 	if (timing_delay % 2)
 		timing_delay++;
 
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.h
new file mode 100644
index 000000000000..6b07642d55b8
--- /dev/null
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* Copyright (c) 2024 Hisilicon Limited. */
+
+#ifndef DP_KAPI_H
+#define DP_KAPI_H
+
+#include <linux/types.h>
+#include <drm/drm_device.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_print.h>
+#include <linux/delay.h>
+
+struct hibmc_dp_dev;
+
+struct dp_mode {
+	u32 h_total;
+	u32 h_active;
+	u32 h_blank;
+	u32 h_front;
+	u32 h_sync;
+	u32 h_back;
+	bool h_pol;
+	u32 v_total;
+	u32 v_active;
+	u32 v_blank;
+	u32 v_front;
+	u32 v_sync;
+	u32 v_back;
+	bool v_pol;
+	u32 field_rate;
+	u32 pixel_clock; // khz
+};
+
+struct hibmc_dp {
+	struct hibmc_dp_dev *dp_dev;
+	struct drm_device *drm_dev;
+	struct drm_encoder encoder;
+	struct drm_connector connector;
+	void __iomem *mmio;
+};
+
+int hibmc_dp_kapi_init(struct hibmc_dp *dp);
+void hibmc_dp_kapi_uninit(struct hibmc_dp *dp);
+int hibmc_dp_mode_set(struct hibmc_dp *dp, struct dp_mode *mode);
+void hibmc_dp_display_en(struct hibmc_dp *dp, bool enable);
+
+#endif
-- 
2.33.0

