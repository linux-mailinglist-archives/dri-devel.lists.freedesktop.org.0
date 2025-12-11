Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA0CCB6814
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 17:40:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DA810E860;
	Thu, 11 Dec 2025 16:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="JRDVhR9d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C4510E854
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 16:40:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 46AFFC1934C;
 Thu, 11 Dec 2025 16:39:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4B70B6072F;
 Thu, 11 Dec 2025 16:40:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1C449103C8C1E; Thu, 11 Dec 2025 17:40:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765471218; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=jolfFnXSCYM2Atl2GHRATLvYO1jkI7i3mjjW1V6teb4=;
 b=JRDVhR9dsZhpFVHtton6J9ewSYNCMlT7hehonoQmNT+RkzuDd7Ji4Cy6rKrvgku5aTOxgc
 2a8Wdiqby9zZHs06M7QReiNichYgoycz9e+7wg+XXg6NLDAke00ZIfSOvMC68bFh6HkAf1
 AQsWDDbdyIOMZGfuw0Zk8hUAv9szApLiDsFIwGyxCAeESO/aIWVjmpFcwO2SHXmW/3XTql
 FLEP8ZYoiWuB77CqDy2Fak5leLVabhIyL3TEHyvmDOZ85AzYzC13qmqkW4PzH9IUCSOpjd
 P0ht+AiwWxyQkBi5PqJ+F1LGUN/R5Ji/jfkhcnibXRNw/UjDyWGQmhhvtVa2ug==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Thu, 11 Dec 2025 17:38:57 +0100
Subject: [PATCH v2 13/20] drm/tilcdc: Remove the useless module list
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-feature_tilcdc-v2-13-f48bac3cd33e@bootlin.com>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
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

The tilcdc driver previously supported a sub-module system where
external display drivers (panels, encoders) could register themselves
through tilcdc_module_init() and be automatically initialized through
a module list. This infrastructure became unused after the component
framework support and panel driver was removed.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 48 +------------------------------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.h | 27 ---------------------
 2 files changed, 1 insertion(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 6a08f50762af9..4630e56c3f028 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -7,7 +7,6 @@
 /* LCDC DRM driver, based on da8xx-fb */
 
 #include <linux/mod_devicetable.h>
-#include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -34,8 +33,6 @@ enum {
 	DA850_TILCDC,
 };
 
-static LIST_HEAD(module_list);
-
 static const u32 tilcdc_rev1_formats[] = { DRM_FORMAT_RGB565 };
 
 static const u32 tilcdc_straight_formats[] = { DRM_FORMAT_RGB565,
@@ -50,20 +47,6 @@ static const u32 tilcdc_legacy_formats[] = { DRM_FORMAT_RGB565,
 					     DRM_FORMAT_RGB888,
 					     DRM_FORMAT_XRGB8888 };
 
-void tilcdc_module_init(struct tilcdc_module *mod, const char *name,
-		const struct tilcdc_module_ops *funcs)
-{
-	mod->name = name;
-	mod->funcs = funcs;
-	INIT_LIST_HEAD(&mod->list);
-	list_add(&mod->list, &module_list);
-}
-
-void tilcdc_module_cleanup(struct tilcdc_module *mod)
-{
-	list_del(&mod->list);
-}
-
 static int tilcdc_atomic_check(struct drm_device *dev,
 			       struct drm_atomic_state *state)
 {
@@ -97,12 +80,6 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
 static void modeset_init(struct drm_device *dev)
 {
 	struct tilcdc_drm_private *priv = dev->dev_private;
-	struct tilcdc_module *mod;
-
-	list_for_each_entry(mod, &module_list, list) {
-		DBG("loading module: %s", mod->name);
-		mod->funcs->modeset_init(mod, dev);
-	}
 
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
@@ -474,15 +451,9 @@ static struct drm_info_list tilcdc_debugfs_list[] = {
 
 static void tilcdc_debugfs_init(struct drm_minor *minor)
 {
-	struct tilcdc_module *mod;
-
 	drm_debugfs_create_files(tilcdc_debugfs_list,
 				 ARRAY_SIZE(tilcdc_debugfs_list),
 				 minor->debugfs_root, minor);
-
-	list_for_each_entry(mod, &module_list, list)
-		if (mod->funcs->debugfs_init)
-			mod->funcs->debugfs_init(mod, minor);
 }
 #endif
 
@@ -562,24 +533,7 @@ static struct platform_driver tilcdc_platform_driver = {
 		.of_match_table = tilcdc_of_match,
 	},
 };
-
-static int __init tilcdc_drm_init(void)
-{
-	if (drm_firmware_drivers_only())
-		return -ENODEV;
-
-	DBG("init");
-	return platform_driver_register(&tilcdc_platform_driver);
-}
-
-static void __exit tilcdc_drm_fini(void)
-{
-	DBG("fini");
-	platform_driver_unregister(&tilcdc_platform_driver);
-}
-
-module_init(tilcdc_drm_init);
-module_exit(tilcdc_drm_fini);
+module_platform_driver(tilcdc_platform_driver);
 
 MODULE_AUTHOR("Rob Clark <robdclark@gmail.com");
 MODULE_DESCRIPTION("TI LCD Controller DRM Driver");
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index dafb00908d1d4..60e85e29b1063 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -81,33 +81,6 @@ struct tilcdc_drm_private {
 	bool irq_enabled;
 };
 
-/* Sub-module for display.  Since we don't know at compile time what panels
- * or display adapter(s) might be present (for ex, off chip dvi/tfp410,
- * hdmi encoder, various lcd panels), the connector/encoder(s) are split into
- * separate drivers.  If they are probed and found to be present, they
- * register themselves with tilcdc_register_module().
- */
-struct tilcdc_module;
-
-struct tilcdc_module_ops {
-	/* create appropriate encoders/connectors: */
-	int (*modeset_init)(struct tilcdc_module *mod, struct drm_device *dev);
-#ifdef CONFIG_DEBUG_FS
-	/* create debugfs nodes (can be NULL): */
-	int (*debugfs_init)(struct tilcdc_module *mod, struct drm_minor *minor);
-#endif
-};
-
-struct tilcdc_module {
-	const char *name;
-	struct list_head list;
-	const struct tilcdc_module_ops *funcs;
-};
-
-void tilcdc_module_init(struct tilcdc_module *mod, const char *name,
-		const struct tilcdc_module_ops *funcs);
-void tilcdc_module_cleanup(struct tilcdc_module *mod);
-
 #define DBG(fmt, ...) DRM_DEBUG(fmt"\n", ##__VA_ARGS__)
 
 int tilcdc_crtc_create(struct drm_device *dev);

-- 
2.43.0

