Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FB4340343
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 11:29:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0DB6E8CE;
	Thu, 18 Mar 2021 10:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A38E6E8C9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 10:29:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 105C4AD6D;
 Thu, 18 Mar 2021 10:29:30 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, corbet@lwn.net, lgirdwood@gmail.com,
 broonie@kernel.org, sam@ravnborg.org, robh@kernel.org,
 emil.l.velikov@gmail.com, geert+renesas@glider.be, hdegoede@redhat.com,
 bluescreen_avenger@verizon.net
Subject: [PATCH v2 08/10] drm/simpledrm: Acquire clocks from DT device node
Date: Thu, 18 Mar 2021 11:29:19 +0100
Message-Id: <20210318102921.21536-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210318102921.21536-1-tzimmermann@suse.de>
References: <20210318102921.21536-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make sure required hardware clocks are enabled while the firmware
framebuffer is in use.

The basic code has been taken from the simplefb driver and adapted
to DRM. Clocks are released automatically via devres helpers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: nerdopolis <bluescreen_avenger@verizon.net>
---
 drivers/gpu/drm/tiny/simpledrm.c | 108 +++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index c9cef2b50de6..10ca3373b61f 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+#include <linux/clk.h>
+#include <linux/of_clk.h>
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
 
@@ -190,6 +192,12 @@ struct simpledrm_device {
 	struct drm_device dev;
 	struct platform_device *pdev;
 
+	/* clocks */
+#if defined CONFIG_OF && defined CONFIG_COMMON_CLK
+	unsigned int clk_count;
+	struct clk **clks;
+#endif
+
 	/* simplefb settings */
 	struct drm_display_mode mode;
 	const struct drm_format_info *format;
@@ -211,6 +219,103 @@ static struct simpledrm_device *simpledrm_device_of_dev(struct drm_device *dev)
 	return container_of(dev, struct simpledrm_device, dev);
 }
 
+/*
+ * Hardware
+ */
+
+#if defined CONFIG_OF && defined CONFIG_COMMON_CLK
+/*
+ * Clock handling code.
+ *
+ * Here we handle the clocks property of our "simple-framebuffer" dt node.
+ * This is necessary so that we can make sure that any clocks needed by
+ * the display engine that the bootloader set up for us (and for which it
+ * provided a simplefb dt node), stay up, for the life of the simplefb
+ * driver.
+ *
+ * When the driver unloads, we cleanly disable, and then release the clocks.
+ *
+ * We only complain about errors here, no action is taken as the most likely
+ * error can only happen due to a mismatch between the bootloader which set
+ * up simplefb, and the clock definitions in the device tree. Chances are
+ * that there are no adverse effects, and if there are, a clean teardown of
+ * the fb probe will not help us much either. So just complain and carry on,
+ * and hope that the user actually gets a working fb at the end of things.
+ */
+
+static void simpledrm_device_release_clocks(void *res)
+{
+	struct simpledrm_device *sdev = simpledrm_device_of_dev(res);
+	unsigned int i;
+
+	for (i = 0; i < sdev->clk_count; ++i) {
+		if (sdev->clks[i]) {
+			clk_disable_unprepare(sdev->clks[i]);
+			clk_put(sdev->clks[i]);
+		}
+	}
+}
+
+static int simpledrm_device_init_clocks(struct simpledrm_device *sdev)
+{
+	struct drm_device *dev = &sdev->dev;
+	struct platform_device *pdev = sdev->pdev;
+	struct device_node *of_node = pdev->dev.of_node;
+	struct clk *clock;
+	unsigned int i;
+	int ret;
+
+	if (dev_get_platdata(&pdev->dev) || !of_node)
+		return 0;
+
+	sdev->clk_count = of_clk_get_parent_count(of_node);
+	if (!sdev->clk_count)
+		return 0;
+
+	sdev->clks = drmm_kzalloc(dev, sdev->clk_count * sizeof(sdev->clks[0]),
+				  GFP_KERNEL);
+	if (!sdev->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < sdev->clk_count; ++i) {
+		clock = of_clk_get(of_node, i);
+		if (IS_ERR(clock)) {
+			ret = PTR_ERR(clock);
+			if (ret == -EPROBE_DEFER)
+				goto err;
+			drm_err(dev, "clock %u not found: %d\n", i, ret);
+			continue;
+		}
+		ret = clk_prepare_enable(clock);
+		if (ret) {
+			drm_err(dev, "failed to enable clock %u: %d\n",
+				i, ret);
+			clk_put(clock);
+		}
+		sdev->clks[i] = clock;
+	}
+
+	return devm_add_action_or_reset(&pdev->dev,
+					simpledrm_device_release_clocks,
+					sdev);
+
+err:
+	while (i) {
+		--i;
+		if (sdev->clks[i]) {
+			clk_disable_unprepare(sdev->clks[i]);
+			clk_put(sdev->clks[i]);
+		}
+	}
+	return ret;
+}
+#else
+static int simpledrm_device_init_clocks(struct simpledrm_device *sdev)
+{
+	return 0;
+}
+#endif
+
 /*
  *  Simplefb settings
  */
@@ -534,6 +639,9 @@ simpledrm_device_create(struct drm_driver *drv, struct platform_device *pdev)
 		return ERR_CAST(sdev);
 	sdev->pdev = pdev;
 
+	ret = simpledrm_device_init_clocks(sdev);
+	if (ret)
+		return ERR_PTR(ret);
 	ret = simpledrm_device_init_fb(sdev);
 	if (ret)
 		return ERR_PTR(ret);
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
