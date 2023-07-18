Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0487582BF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 18:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4593E10E38D;
	Tue, 18 Jul 2023 16:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A83710E387
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 16:54:54 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5803:2d6d:5bbc:e252])
 by albert.telenet-ops.be with bizsmtp
 id Ngur2A00B0ucMBo06gurSZ; Tue, 18 Jul 2023 18:54:51 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qLnyD-001nXt-56;
 Tue, 18 Jul 2023 18:54:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qLnyN-000gbe-6A;
 Tue, 18 Jul 2023 18:54:51 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 07/41] drm: renesas: shmobile: Add support for Runtime PM
Date: Tue, 18 Jul 2023 18:54:12 +0200
Message-Id: <ceb3a14c618335258e8caa95c8b0dd2e2229b927.1689698048.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689698048.git.geert+renesas@glider.be>
References: <cover.1689698048.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SH-Mobile LCD Controller is part of a PM Domain on all relevant SoCs
(clock domain on all, power domain on some).  Hence it may not be
sufficient to manage the LCDC module clock explicitly (e.g. if the
selected clock source differs from SHMOB_DRM_CLK_BUS).

Fix this by using Runtime PM for all clock handling.  Add an explicit
dependency on CONFIG_PM, which should already be met on all affected
platforms.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Move explicit clock handling to Runtime PM callbacks,
  - Move devm_pm_runtime_enable() after shmob_drm_setup_clocks(),
  - Depend on PM.
---
 drivers/gpu/drm/renesas/shmobile/Kconfig      |  2 +-
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 32 ++--------------
 .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  | 38 +++++++++++++++++--
 3 files changed, 40 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/Kconfig b/drivers/gpu/drm/renesas/shmobile/Kconfig
index ad14112999ad8aba..ba941587ca70e08c 100644
--- a/drivers/gpu/drm/renesas/shmobile/Kconfig
+++ b/drivers/gpu/drm/renesas/shmobile/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 config DRM_SHMOBILE
 	tristate "DRM Support for SH Mobile"
-	depends on DRM
+	depends on DRM && PM
 	depends on ARCH_RENESAS || ARCH_SHMOBILE || COMPILE_TEST
 	select BACKLIGHT_CLASS_DEVICE
 	select DRM_KMS_HELPER
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index fbfd906844da490c..2d9ae0c6ab7b18a8 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -9,6 +9,7 @@
 
 #include <linux/backlight.h>
 #include <linux/clk.h>
+#include <linux/pm_runtime.h>
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
@@ -34,29 +35,6 @@
  * TODO: panel support
  */
 
-/* -----------------------------------------------------------------------------
- * Clock management
- */
-
-static int shmob_drm_clk_on(struct shmob_drm_device *sdev)
-{
-	int ret;
-
-	if (sdev->clock) {
-		ret = clk_prepare_enable(sdev->clock);
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
-}
-
-static void shmob_drm_clk_off(struct shmob_drm_device *sdev)
-{
-	if (sdev->clock)
-		clk_disable_unprepare(sdev->clock);
-}
-
 /* -----------------------------------------------------------------------------
  * CRTC
  */
@@ -170,9 +148,8 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
 	if (WARN_ON(format == NULL))
 		return;
 
-	/* Enable clocks before accessing the hardware. */
-	ret = shmob_drm_clk_on(sdev);
-	if (ret < 0)
+	ret = pm_runtime_resume_and_get(sdev->dev);
+	if (ret)
 		return;
 
 	/* Reset and enable the LCDC. */
@@ -268,8 +245,7 @@ static void shmob_drm_crtc_stop(struct shmob_drm_crtc *scrtc)
 	/* Disable the display output. */
 	lcdc_write(sdev, LDCNT1R, 0);
 
-	/* Stop clocks. */
-	shmob_drm_clk_off(sdev);
+	pm_runtime_put(sdev->dev);
 
 	scrtc->started = false;
 }
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index 30493ce874192e3e..3fc7d820abdc61d4 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
 #include <drm/drm_drv.h>
@@ -165,8 +166,35 @@ static int shmob_drm_pm_resume(struct device *dev)
 	return 0;
 }
 
-static DEFINE_SIMPLE_DEV_PM_OPS(shmob_drm_pm_ops,
-				shmob_drm_pm_suspend, shmob_drm_pm_resume);
+static int shmob_drm_pm_runtime_suspend(struct device *dev)
+{
+	struct shmob_drm_device *sdev = dev_get_drvdata(dev);
+
+	if (sdev->clock)
+		clk_disable_unprepare(sdev->clock);
+
+	return 0;
+}
+
+static int shmob_drm_pm_runtime_resume(struct device *dev)
+{
+	struct shmob_drm_device *sdev = dev_get_drvdata(dev);
+	int ret;
+
+	if (sdev->clock) {
+		ret = clk_prepare_enable(sdev->clock);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops shmob_drm_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(shmob_drm_pm_suspend, shmob_drm_pm_resume)
+	RUNTIME_PM_OPS(shmob_drm_pm_runtime_suspend,
+		       shmob_drm_pm_runtime_resume, NULL)
+};
 
 /* -----------------------------------------------------------------------------
  * Platform driver
@@ -220,6 +248,10 @@ static int shmob_drm_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
 	ret = shmob_drm_init_interface(sdev);
 	if (ret < 0)
 		return ret;
@@ -291,7 +323,7 @@ static struct platform_driver shmob_drm_platform_driver = {
 	.remove		= shmob_drm_remove,
 	.driver		= {
 		.name	= "shmob-drm",
-		.pm	= pm_sleep_ptr(&shmob_drm_pm_ops),
+		.pm	= &shmob_drm_pm_ops,
 	},
 };
 
-- 
2.34.1

