Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E627617CD8E
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 11:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 983416E175;
	Sat,  7 Mar 2020 10:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8F76ED2A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 14:12:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 1E1EE295C34
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] drm/bridge: anx7688: Add ANX7688 bridge driver support
Date: Fri,  6 Mar 2020 15:12:16 +0100
Message-Id: <20200306141217.423914-4-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200306141217.423914-1-enric.balletbo@collabora.com>
References: <20200306141217.423914-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 07 Mar 2020 10:14:46 +0000
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
Cc: megous@megous.com, Jernej Skrabec <jernej.skrabec@siol.net>,
 drinkcat@chromium.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Torsten Duwe <duwe@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, anarsoul@gmail.com,
 Andrzej Hajda <a.hajda@samsung.com>, Maxime Ripard <maxime@cerno.tech>,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Thomas Gleixner <tglx@linutronix.de>,
 Collabora Kernel ML <kernel@collabora.com>, icenowy@aosc.io
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nicolas Boichat <drinkcat@chromium.org>

This driver adds support for the ANX7688 HDMI to DP converter block of the
ANX7688 multi-function device.

For our use case, the only reason the Linux kernel driver is necessary is
to reject resolutions that require more bandwidth than what is available
on the DP side. DP bandwidth and lane count are reported by the bridge via
2 registers and, as far as we know, only for chips that have a firmware
version greather than 0.85 supports these two registers.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

Changes in v3:
- Convert to a child of ANX7688 multi-function device.

Changes in v2:
- Move driver to drivers/gpu/drm/bridge/analogix.
- Make the driver OF only so we can reduce the ifdefs.
- Update the Copyright to 2020.
- Use probe_new so we can get rid of the i2c_device_id table.

 drivers/gpu/drm/bridge/analogix/Kconfig       |   9 ++
 drivers/gpu/drm/bridge/analogix/Makefile      |   1 +
 .../drm/bridge/analogix/analogix-anx7688.c    | 135 ++++++++++++++++++
 3 files changed, 145 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/analogix/analogix-anx7688.c

diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
index e1fa7d820373..02c420ba79bd 100644
--- a/drivers/gpu/drm/bridge/analogix/Kconfig
+++ b/drivers/gpu/drm/bridge/analogix/Kconfig
@@ -11,6 +11,15 @@ config DRM_ANALOGIX_ANX6345
 	  ANX6345 transforms the LVTTL RGB output of an
 	  application processor to eDP or DisplayPort.
 
+config DRM_ANALOGIX_ANX7688
+	tristate "Analogix ANX7688 bridge"
+	select DRM_KMS_HELPER
+	select MFD_ANX7688
+	help
+	  ANX7688 is an ultra-low power 4k Ultra-HD (4096x2160p60)
+	  mobile HD transmitter designed for portable devices. The
+	  ANX7688 converts HDMI 2.0 to DisplayPort 1.3 Ultra-HD.
+
 config DRM_ANALOGIX_ANX78XX
 	tristate "Analogix ANX78XX bridge"
 	select DRM_ANALOGIX_DP
diff --git a/drivers/gpu/drm/bridge/analogix/Makefile b/drivers/gpu/drm/bridge/analogix/Makefile
index 97669b374098..27cd73635c8c 100644
--- a/drivers/gpu/drm/bridge/analogix/Makefile
+++ b/drivers/gpu/drm/bridge/analogix/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 analogix_dp-objs := analogix_dp_core.o analogix_dp_reg.o analogix-i2c-dptx.o
 obj-$(CONFIG_DRM_ANALOGIX_ANX6345) += analogix-anx6345.o
+obj-$(CONFIG_DRM_ANALOGIX_ANX7688) += analogix-anx7688.o
 obj-$(CONFIG_DRM_ANALOGIX_ANX78XX) += analogix-anx78xx.o
 obj-$(CONFIG_DRM_ANALOGIX_DP) += analogix_dp.o
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx7688.c b/drivers/gpu/drm/bridge/analogix/analogix-anx7688.c
new file mode 100644
index 000000000000..81b950ecde27
--- /dev/null
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx7688.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ANX7688 HDMI->DP bridge driver
+ *
+ * Copyright 2020 Google LLC
+ */
+
+#include <linux/mfd/anx7688.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_print.h>
+
+struct anx7688_bridge_data {
+	struct drm_bridge bridge;
+	struct regmap *regmap;
+
+	bool filter;
+};
+
+static inline struct anx7688_bridge_data *
+bridge_to_anx7688(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct anx7688_bridge_data, bridge);
+}
+
+static bool anx7688_bridge_mode_fixup(struct drm_bridge *bridge,
+				      const struct drm_display_mode *mode,
+				      struct drm_display_mode *adjusted_mode)
+{
+	struct anx7688_bridge_data *data = bridge_to_anx7688(bridge);
+	int totalbw, requiredbw;
+	u8 dpbw, lanecount;
+	u8 regs[2];
+	int ret;
+
+	if (!data->filter)
+		return true;
+
+	/* Read both regs 0x85 (bandwidth) and 0x86 (lane count). */
+	ret = regmap_bulk_read(data->regmap, ANX7688_DP_BANDWIDTH_REG, regs,
+			       2);
+	if (ret < 0) {
+		DRM_ERROR("Failed to read bandwidth/lane count\n");
+		return false;
+	}
+	dpbw = regs[0];
+	lanecount = regs[1];
+
+	/* Maximum 0x19 bandwidth (6.75 Gbps Turbo mode), 2 lanes */
+	if (dpbw > 0x19 || lanecount > 2) {
+		DRM_ERROR("Invalid bandwidth/lane count (%02x/%d)\n", dpbw,
+			  lanecount);
+		return false;
+	}
+
+	/* Compute available bandwidth (kHz) */
+	totalbw = dpbw * lanecount * 270000 * 8 / 10;
+
+	/* Required bandwidth (8 bpc, kHz) */
+	requiredbw = mode->clock * 8 * 3;
+
+	DRM_DEBUG_KMS("DP bandwidth: %d kHz (%02x/%d); mode requires %d Khz\n",
+		      totalbw, dpbw, lanecount, requiredbw);
+
+	if (totalbw == 0) {
+		DRM_ERROR("Bandwidth/lane count are 0, not rejecting modes\n");
+		return true;
+	}
+
+	return totalbw >= requiredbw;
+}
+
+static const struct drm_bridge_funcs anx7688_bridge_funcs = {
+	.mode_fixup = anx7688_bridge_mode_fixup,
+};
+
+static int anx7688_bridge_probe(struct platform_device *pdev)
+{
+	struct anx7688 *anx7688 = dev_get_drvdata(pdev->dev.parent);
+	struct anx7688_bridge_data *data;
+	struct device *dev = &pdev->dev;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->bridge.of_node = dev->of_node;
+	data->regmap = anx7688->regmap;
+
+	/* FW version >= 0.85 supports bandwidth/lane count registers */
+	if (anx7688->fw_version >= ANX7688_MINIMUM_FW_VERSION)
+		data->filter = true;
+	else
+		/* Warn, but not fail, for backwards compatibility */
+		DRM_WARN("Old ANX7688 FW version (0x%04x), not filtering\n",
+			 anx7688->fw_version);
+
+	data->bridge.funcs = &anx7688_bridge_funcs;
+	drm_bridge_add(&data->bridge);
+
+	return 0;
+}
+
+static int anx7688_bridge_remove(struct platform_device *pdev)
+{
+	struct anx7688_bridge_data *data = dev_get_drvdata(&pdev->dev);
+
+	drm_bridge_remove(&data->bridge);
+
+	return 0;
+}
+
+static const struct of_device_id anx7688_bridge_match_table[] = {
+	{ .compatible = "analogix,anx7688-bridge", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, anx7688_bridge_match_table);
+
+static struct platform_driver anx7688_bridge_driver = {
+	.probe = anx7688_bridge_probe,
+	.remove = anx7688_bridge_remove,
+	.driver = {
+		.name = "anx7688-bridge",
+		.of_match_table = anx7688_bridge_match_table,
+	},
+};
+
+module_platform_driver(anx7688_bridge_driver);
+
+MODULE_DESCRIPTION("ANX7688 HDMI->DP bridge driver");
+MODULE_AUTHOR("Nicolas Boichat <drinkcat@chromium.org>");
+MODULE_AUTHOR("Enric Balletbo i Serra <enric.balletbo@collabora.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
