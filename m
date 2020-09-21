Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E27271C08
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 09:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0136E196;
	Mon, 21 Sep 2020 07:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE1D6E133
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 03:27:59 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 420C6321CC2523B2B4CF;
 Mon, 21 Sep 2020 11:27:56 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Mon, 21 Sep 2020 11:27:48 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH drm/hisilicon 1/3] drm/hisilicon: Support i2c driver
 algorithms for bit-shift adapters
Date: Mon, 21 Sep 2020 11:25:20 +0800
Message-ID: <1600658722-35945-2-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600658722-35945-1-git-send-email-tiantao6@hisilicon.com>
References: <1600658722-35945-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 21 Sep 2020 07:34:45 +0000
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
Cc: linuxarm@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding driver implementation to support i2c driver algorithms for
bit-shift adapters, so hibmc will using the interface provided by
drm to read edid.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/hisilicon/hibmc/Makefile        |  2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h | 21 +++++-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c | 98 +++++++++++++++++++++++++
 3 files changed, 119 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c

diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
index f991327..684ef79 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
+++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_ttm.o
+hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_ttm.o hibmc_drm_i2c.o
 
 obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
index 197485e..1b2edb3 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
@@ -14,11 +14,24 @@
 #ifndef HIBMC_DRM_DRV_H
 #define HIBMC_DRM_DRV_H
 
+#include <linux/gpio/consumer.h>
+#include <linux/i2c-algo-bit.h>
+#include <linux/i2c.h>
+
+#include <drm/drm_edid.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_framebuffer.h>
 
 struct drm_device;
 
+struct hibmc_connector {
+	struct drm_connector base;
+	struct drm_device  *dev;
+
+	struct i2c_adapter adapter;
+	struct i2c_algo_bit_data bit_data;
+};
+
 struct hibmc_drm_private {
 	/* hw */
 	void __iomem   *mmio;
@@ -31,10 +44,15 @@ struct hibmc_drm_private {
 	struct drm_plane primary_plane;
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
-	struct drm_connector connector;
+	struct hibmc_connector connector;
 	bool mode_config_initialized;
 };
 
+static inline struct hibmc_connector *to_hibmc_connector(struct drm_connector *connector)
+{
+	return container_of(connector, struct hibmc_connector, base);
+}
+
 void hibmc_set_power_mode(struct hibmc_drm_private *priv,
 			  unsigned int power_mode);
 void hibmc_set_current_gate(struct hibmc_drm_private *priv,
@@ -47,6 +65,7 @@ int hibmc_mm_init(struct hibmc_drm_private *hibmc);
 void hibmc_mm_fini(struct hibmc_drm_private *hibmc);
 int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
 		      struct drm_mode_create_dumb *args);
+int hibmc_ddc_create(struct hibmc_connector *connector);
 
 extern const struct drm_mode_config_funcs hibmc_mode_funcs;
 
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
new file mode 100644
index 0000000..0506846
--- /dev/null
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Hisilicon Hibmc SoC drm driver
+ *
+ * Based on the bochs drm driver.
+ *
+ * Copyright (c) 2016 Huawei Limited.
+ *
+ * Author:
+ *      Tian Tao <tiantao6@hisilicon.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/pci.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_probe_helper.h>
+
+#include "hibmc_drm_drv.h"
+
+#define GPIO_DATA		0x0802A0
+#define GPIO_DATA_DIRECTION	0x0802A4
+
+#define GPIO_SCL_MASK 0x1
+#define GPIO_SDA_MASK  0x2
+
+static void hibmc_set_i2c_signal(void *data, u32 mask, int value)
+{
+	struct hibmc_connector *hibmc_connector = data;
+	struct hibmc_drm_private *priv = hibmc_connector->dev->dev_private;
+	u32 tmp_dir = readl(priv->mmio + GPIO_DATA_DIRECTION);
+
+	if (value) {
+		tmp_dir &= ~mask;
+		writel(tmp_dir, priv->mmio + GPIO_DATA_DIRECTION);
+	} else {
+		u32 tmp_data = readl(priv->mmio + GPIO_DATA);
+
+		tmp_data &= ~mask;
+		writel(tmp_data, priv->mmio + GPIO_DATA);
+
+		tmp_dir |= mask;
+		writel(tmp_dir, priv->mmio + GPIO_DATA_DIRECTION);
+	}
+}
+
+static int hibmc_get_i2c_signal(void *data, u32 mask)
+{
+	struct hibmc_connector *hibmc_connector = data;
+	struct hibmc_drm_private *priv = hibmc_connector->dev->dev_private;
+	u32 tmp_dir = readl(priv->mmio + GPIO_DATA_DIRECTION);
+
+	if ((tmp_dir & mask) != mask) {
+		tmp_dir &= ~mask;
+		writel(tmp_dir, priv->mmio + GPIO_DATA_DIRECTION);
+	}
+
+	return (readl(priv->mmio + GPIO_DATA) & mask) ? 1 : 0;
+}
+
+static void hibmc_ddc_setsda(void *data, int state)
+{
+	hibmc_set_i2c_signal(data, GPIO_SDA_MASK, state);
+}
+
+static void hibmc_ddc_setscl(void *data, int state)
+{
+	hibmc_set_i2c_signal(data, GPIO_SCL_MASK, state);
+}
+
+static int hibmc_ddc_getsda(void *data)
+{
+	return hibmc_get_i2c_signal(data, GPIO_SDA_MASK);
+}
+
+static int hibmc_ddc_getscl(void *data)
+{
+	return hibmc_get_i2c_signal(data, GPIO_SCL_MASK);
+}
+
+int hibmc_ddc_create(struct hibmc_connector *connector)
+{
+	connector->adapter.owner = THIS_MODULE;
+	connector->adapter.class = I2C_CLASS_DDC;
+	snprintf(connector->adapter.name, I2C_NAME_SIZE, "HIS i2c bit bus");
+	connector->adapter.dev.parent = &connector->dev->pdev->dev;
+	i2c_set_adapdata(&connector->adapter, connector);
+	connector->adapter.algo_data = &connector->bit_data;
+
+	connector->bit_data.udelay = 20;
+	connector->bit_data.timeout = usecs_to_jiffies(2000);
+	connector->bit_data.data = connector;
+	connector->bit_data.setsda = hibmc_ddc_setsda;
+	connector->bit_data.setscl = hibmc_ddc_setscl;
+	connector->bit_data.getsda = hibmc_ddc_getsda;
+	connector->bit_data.getscl = hibmc_ddc_getscl;
+
+	return i2c_bit_add_bus(&connector->adapter);
+}
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
