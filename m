Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 662F7903F2A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 16:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C624910E1A0;
	Tue, 11 Jun 2024 14:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cUkJdFUP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A092910E1A0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 14:49:52 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1f7274a453bso10578875ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 07:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718117391; x=1718722191;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j5YCF6B9jcBatj7ItxDmcM7idEWLAzJfNnqPPDuiJIA=;
 b=cUkJdFUPtWJVp2d/f8qKl4XbrFxx9hTA+J1KAqiUNUvWDguj/ffZQOX8kaiomJhI2T
 aBszxj+nXVloDAxKNnbnR9Id2XUy4A3/lGMNzBs7pw3aM7Kt/sZ2yb3fZIyRECzel9Bo
 6XpUubkEUH6JiOHqEPNLceWm0f8llO9sHvx5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718117391; x=1718722191;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j5YCF6B9jcBatj7ItxDmcM7idEWLAzJfNnqPPDuiJIA=;
 b=sLBeOwdhsA5xVUPFIwbm8EVqPlJubnx6YVUSoDNONdkWARzUX+S1hiFfxRg09/GYZe
 B669LYXcZ5JUTvCi29J7EmA/vSR+KuhCGK2oNqMsVsdJTCl89xheTxkUYr1ZNhWda2jt
 IHVGr520F52vmjIY4AHE+1cU/gW1swPKqZyTP+L44NGCbEW77GOpAMEER+vBiQiGRIZA
 2jUWMFCdn/e7hPMxA/8e1d7HvQXNI8E7uY9ikEQs32RrTaGlWBB4DqpxmKG4/qRz/sKD
 ZxaULHGdpm+j5I7U0F/T5XPuE34V3CjuGOdHyHnPEuF1oXKoZL+sVYsf2VH7Ygk71g8c
 xwuA==
X-Gm-Message-State: AOJu0YwvPmcQOkvmrP3Yi+VSPnnZjKaS9394Ck8Pb5LMPvAB+G0OnaBy
 2aWTKlI8s/mv/wlvyc9by+H+dDoD0gBSAzuSRjMWSX6oJWZutUujPHa7g0uhzvzlxDKXhIleYbQ
 =
X-Google-Smtp-Source: AGHT+IGgmtV75jlWWUP/itqgZ1iq0kBKoA0+VdNfN1pUkCG/3+hoGRiPWm3pyGDcsphKke3eyZnASA==
X-Received: by 2002:a17:903:32c3:b0:1f7:e32f:f057 with SMTP id
 d9443c01a7336-1f7e32ff2d1mr559695ad.34.1718117391339; 
 Tue, 11 Jun 2024 07:49:51 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:f410:2f13:37e2:37d])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f7209970f3sm28733955ad.90.2024.06.11.07.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 07:49:50 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Chris Morgan <macromorgan@hotmail.com>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: Avoid warnings w/ panel-simple/panel-edp at
 shutdown
Date: Tue, 11 Jun 2024 07:48:51 -0700
Message-ID: <20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At shutdown if you've got a _properly_ coded DRM modeset driver then
you'll get these two warnings at shutdown time:

  Skipping disable of already disabled panel
  Skipping unprepare of already unprepared panel

These warnings are ugly and sound concerning, but they're actually a
sign of a properly working system. That's not great.

It's not easy to get rid of these warnings. Until we know that all DRM
modeset drivers used with panel-simple and panel-edp are properly
calling drm_atomic_helper_shutdown() or drm_helper_force_disable_all()
then the panel drivers _need_ to disable/unprepare themselves in order
to power off the panel cleanly. However, there are lots of DRM modeset
drivers used with panel-edp and panel-simple and it's hard to know
when we've got them all. Since the warning happens only on the drivers
that _are_ updated there's nothing to encourage broken DRM modeset
drivers to get fixed.

In order to flip the warning to the proper place, we need to know
which modeset drivers are going to shutdown properly. Though ugly, do
this by creating a list of everyone that shuts down properly. This
allows us to generate a warning for the correct case and also lets us
get rid of the warning for drivers that are shutting down properly.

Maintaining this list is ugly, but the idea is that it's only short
term. Once everyone is converted we can delete the list and call it
done. The list is ugly enough and adding to it is annoying enough that
people should push to make this happen.

Implement this all in a shared "header" file included by the two panel
drivers that need it. This avoids us adding an new exports while still
allowing the panel drivers to be modules. The code waste should be
small and, as per above, the whole solution is temporary.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I came up with this idea to help us move forward since otherwise I
couldn't see how we were ever going to fix panel-simple and panel-edp
since they're used by so many DRM Modeset drivers. It's a bit ugly but
I don't hate it. What do others think?

This is at the end of the series so even if folks hate it we could
still land the rest of the series.
This was a "bonus" extra patch I added at the end of v3 of the series
("drm/panel: Remove most store/double-check of prepared/enabled
state") [1]. There, I had the note: "I came up with this idea to help
us move forward since otherwise I couldn't see how we were ever going
to fix panel-simple and panel-edp since they're used by so many DRM
Modeset drivers. It's a bit ugly but I don't hate it. What do others
think?"

As requested by Neil, now that the rest of the series has landed I'm
sending this as a standalone patch so it can get more attention. I'm
starting it back at "v1". There is no change between v1 and the one
sent previously except for a typo fix in an error message: Can't't =>
Can't

[1] https://lore.kernel.org/r/20240605002401.2848541-1-dianders@chromium.org

 drivers/gpu/drm/drm_panel.c                   |  12 ++
 .../gpu/drm/panel/panel-drm-shutdown-check.h  | 151 ++++++++++++++++++
 drivers/gpu/drm/panel/panel-edp.c             |  19 +--
 drivers/gpu/drm/panel/panel-simple.c          |  19 +--
 4 files changed, 169 insertions(+), 32 deletions(-)
 create mode 100644 drivers/gpu/drm/panel/panel-drm-shutdown-check.h

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index cfbe020de54e..df3f15f4625e 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -161,6 +161,12 @@ int drm_panel_unprepare(struct drm_panel *panel)
 	if (!panel)
 		return -EINVAL;
 
+	/*
+	 * If you're seeing this warning, you either need to add your driver
+	 * to "drm_drivers_that_shutdown" (if you're seeing it with panel-edp
+	 * or panel-simple) or you need to remove the manual call to
+	 * drm_panel_unprepare() in your panel driver.
+	 */
 	if (!panel->prepared) {
 		dev_warn(panel->dev, "Skipping unprepare of already unprepared panel\n");
 		return 0;
@@ -245,6 +251,12 @@ int drm_panel_disable(struct drm_panel *panel)
 	if (!panel)
 		return -EINVAL;
 
+	/*
+	 * If you're seeing this warning, you either need to add your driver
+	 * to "drm_drivers_that_shutdown" (if you're seeing it with panel-edp
+	 * or panel-simple) or you need to remove the manual call to
+	 * drm_panel_disable() in your panel driver.
+	 */
 	if (!panel->enabled) {
 		dev_warn(panel->dev, "Skipping disable of already disabled panel\n");
 		return 0;
diff --git a/drivers/gpu/drm/panel/panel-drm-shutdown-check.h b/drivers/gpu/drm/panel/panel-drm-shutdown-check.h
new file mode 100644
index 000000000000..dfa8197e09fb
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-drm-shutdown-check.h
@@ -0,0 +1,151 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2024 Google Inc.
+ *
+ * This header is a temporary solution and is intended to be included
+ * directly by panel-edp.c and panel-simple.c.
+ *
+ * This header is needed because panel-edp and panel-simple are used by a
+ * wide variety of DRM drivers and it's hard to know for sure if all of the
+ * DRM drivers used by those panel drivers are properly calling
+ * drm_atomic_helper_shutdown() or drm_helper_force_disable_all() at
+ * shutdown/remove time.
+ *
+ * The plan for this header file:
+ * - Land it and hope that the warning print will encourage DRM drivers to
+ *   get fixed.
+ * - Eventually move to a WARN() splat for extra encouragement.
+ * - Assume that everyone has been fixed and remove this header file.
+ */
+
+#ifndef __PANEL_DRM_SHUTDOWN_CHECK_H__
+#define __PANEL_DRM_SHUTDOWN_CHECK_H__
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_drv.h>
+
+/*
+ * This is a list of all DRM drivers that appear to properly call
+ * drm_atomic_helper_shutdown() or drm_helper_force_disable_all() at
+ * shutdown and remove time.
+ *
+ * We can't detect this dynamically and are stuck with a list because the panel
+ * driver's shutdown() call might be called _before_ the DRM driver's
+ * shutdown() call.
+ *
+ * NOTE: no verification has been done to confirm that the below drivers
+ * are actually _used_ with panel-simple or panel-edp, only that these drivers
+ * appear to be shutting down properly. It doesn't hurt to have extra drivers
+ * listed here as long as the list doesn't contain any drivers that are
+ * missing the shutdown calls.
+ */
+static const char * const drm_drivers_that_shutdown[] = {
+	"armada-drm",
+	"aspeed-gfx-drm",
+	"ast",
+	"atmel-hlcdc",
+	"bochs-drm",
+	"cirrus",
+	"exynos",
+	"fsl-dcu-drm",
+	"gm12u320",
+	"gud",
+	"hdlcd",
+	"hibmc",
+	"hx8357d",
+	"hyperv_drm",
+	"ili9163",
+	"ili9225",
+	"ili9341",
+	"ili9486",
+	"imx-dcss",
+	"imx-drm",
+	"imx-lcdc",
+	"imx-lcdif",
+	"ingenic-drm",
+	"kirin",
+	"komeda",
+	"logicvc-drm",
+	"loongson",
+	"mali-dp",
+	"mcde",
+	"meson",
+	"mgag200",
+	"mi0283qt",
+	"msm",
+	"mxsfb-drm",
+	"omapdrm",
+	"panel-mipi-dbi",
+	"pl111",
+	"qxl",
+	"rcar-du",
+	"repaper",
+	"rockchip",
+	"rzg2l-du",
+	"ssd130x",
+	"st7586",
+	"st7735r",
+	"sti",
+	"stm",
+	"sun4i-drm",
+	"tidss",
+	"tilcdc",
+	"tve200",
+	"vboxvideo",
+	"zynqmp-dpsub",
+	""
+};
+
+static void panel_shutdown_if_drm_driver_needs_fixing(struct drm_panel *panel)
+{
+	struct drm_bridge *bridge;
+	const struct drm_driver *driver;
+	const char * const *driver_name;
+
+	/*
+	 * Look for a bridge that shares the DT node of this panel. That only
+	 * works if we've been linked up with a panel_bridge.
+	 */
+	bridge = of_drm_find_bridge(panel->dev->of_node);
+	if (bridge && bridge->dev && bridge->dev->driver) {
+		/*
+		 * If the DRM driver for the bridge is known to be fine then
+		 * we're done.
+		 */
+		driver = bridge->dev->driver;
+		for (driver_name = drm_drivers_that_shutdown; *driver_name; driver_name++) {
+			if (strcmp(*driver_name, driver->name) == 0)
+				return;
+		}
+
+		/*
+		 * If you see the message below then:
+		 * 1. Make sure your DRM driver is properly calling
+		 *    drm_atomic_helper_shutdown() or drm_helper_force_disable_all()
+		 *    at shutdown time.
+		 * 2. Add your driver to the list.
+		 */
+		dev_warn(panel->dev,
+			 "DRM driver appears buggy; manually disable/unprepare\n");
+	} else {
+		/*
+		 * If you see the message below then your setup needs to
+		 * be moved to using a panel_bridge. This often happens
+		 * by calling devm_drm_of_get_bridge(). Having a panel without
+		 * an associated panel_bridge is deprecated.
+		 */
+		dev_warn(panel->dev,
+			 "Can't find DRM driver; manually disable/unprepare\n");
+	}
+
+	/*
+	 * If we don't know if a DRM driver is properly shutting things down
+	 * then we'll manually call the disable/unprepare. This is always a
+	 * safe thing to do (in that it won't cause you to crash), but it
+	 * does generate a warning.
+	 */
+	drm_panel_disable(panel);
+	drm_panel_unprepare(panel);
+}
+
+#endif
diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 67ab6915d6e4..26f89858df9d 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -42,6 +42,8 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_panel.h>
 
+#include "panel-drm-shutdown-check.h"
+
 /**
  * struct panel_delay - Describes delays for a simple panel.
  */
@@ -948,22 +950,7 @@ static void panel_edp_shutdown(struct device *dev)
 {
 	struct panel_edp *panel = dev_get_drvdata(dev);
 
-	/*
-	 * NOTE: the following two calls don't really belong here. It is the
-	 * responsibility of a correctly written DRM modeset driver to call
-	 * drm_atomic_helper_shutdown() at shutdown time and that should
-	 * cause the panel to be disabled / unprepared if needed. For now,
-	 * however, we'll keep these calls due to the sheer number of
-	 * different DRM modeset drivers used with panel-edp. The fact that
-	 * we're calling these and _also_ the drm_atomic_helper_shutdown()
-	 * will try to disable/unprepare means that we can get a warning about
-	 * trying to disable/unprepare an already disabled/unprepared panel,
-	 * but that's something we'll have to live with until we've confirmed
-	 * that all DRM modeset drivers are properly calling
-	 * drm_atomic_helper_shutdown().
-	 */
-	drm_panel_disable(&panel->base);
-	drm_panel_unprepare(&panel->base);
+	panel_shutdown_if_drm_driver_needs_fixing(&panel->base);
 }
 
 static void panel_edp_remove(struct device *dev)
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 8345ed891f5a..f505bc27e5ae 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -42,6 +42,8 @@
 #include <drm/drm_panel.h>
 #include <drm/drm_of.h>
 
+#include "panel-drm-shutdown-check.h"
+
 /**
  * struct panel_desc - Describes a simple panel.
  */
@@ -720,22 +722,7 @@ static void panel_simple_shutdown(struct device *dev)
 {
 	struct panel_simple *panel = dev_get_drvdata(dev);
 
-	/*
-	 * NOTE: the following two calls don't really belong here. It is the
-	 * responsibility of a correctly written DRM modeset driver to call
-	 * drm_atomic_helper_shutdown() at shutdown time and that should
-	 * cause the panel to be disabled / unprepared if needed. For now,
-	 * however, we'll keep these calls due to the sheer number of
-	 * different DRM modeset drivers used with panel-simple. The fact that
-	 * we're calling these and _also_ the drm_atomic_helper_shutdown()
-	 * will try to disable/unprepare means that we can get a warning about
-	 * trying to disable/unprepare an already disabled/unprepared panel,
-	 * but that's something we'll have to live with until we've confirmed
-	 * that all DRM modeset drivers are properly calling
-	 * drm_atomic_helper_shutdown().
-	 */
-	drm_panel_disable(&panel->base);
-	drm_panel_unprepare(&panel->base);
+	panel_shutdown_if_drm_driver_needs_fixing(&panel->base);
 }
 
 static void panel_simple_remove(struct device *dev)
-- 
2.45.2.505.gda0bf45e8d-goog

