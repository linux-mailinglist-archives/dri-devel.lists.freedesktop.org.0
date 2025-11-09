Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C27AAC436C5
	for <lists+dri-devel@lfdr.de>; Sun, 09 Nov 2025 01:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B056F10E216;
	Sun,  9 Nov 2025 00:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PdOvVWhg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB2D10E216
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Nov 2025 00:20:50 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-47773cd29a4so3357065e9.2
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Nov 2025 16:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762647649; x=1763252449; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OFi0sAyKoBCnKFhTmWWYtrg2wpuTBa2Vsv6Uy0z7Gaw=;
 b=PdOvVWhgUXlGYnFggF6bYS5lUQ4waf980XLpbPQUisSK0H7lUpt/IxRRK90kjQJyqh
 FHJuiH99Y/xrGNpkWZlAGSUpH/vCuzE4BhV0UlkO0uiNVyAex3XVA/hQC+Akh0oGeUeL
 J9FjmlRC6rGrIN+3ua+jkL+AaV8LVJ6tZqTJk2q4h18sjh0FM66leF8ADSeu5/Zd6hGL
 jpPuZfX10PU8wUDcVgTHf4gYMRTYL8HQ4WbY+LxigpxylowMrUQYkgpbMjM6PkTnUlbF
 kDokbOp8ILZy03sALI4KFmDclB3kJE52khuR1YGQzWK/93cP1K9GXJkUxqbVudbyoh3m
 n2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762647649; x=1763252449;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OFi0sAyKoBCnKFhTmWWYtrg2wpuTBa2Vsv6Uy0z7Gaw=;
 b=GT4AEfuRBIoINTc+YzwwXZAO3Q7z0sPHN9noPa0Jlnqe8OAEBGls3WvlozRd2DGJIH
 jGOZg6VTMkbydROgjyb+KD6FS157tAMcVqzwhZGSFUD26HA1FhO+4b+tNh0ScP/GGvQL
 CtbsIjsnsOVakmQSzM5XVMRAEfBh4AFVmZildfNJfqlhFMBUar2BQ6ub5UXEQdAlPhDL
 8JgtnFv/gxZIvbXnW95qlNBb68V6oRob0mWiGQ2r6k4yeFZtpIlWY6D38w6qhXE/fcLx
 EO+fOOE6NWQ/iLEG0iRgRn1WUEcHY3W/DzJR4kMlq7UksWGMjiry1gi2kvaBbX1g38s5
 k4MQ==
X-Gm-Message-State: AOJu0YxosI9fNQInTRhi+X/aM8tPISKfNpycuY4MLH3R3tqXf8xvozOt
 c9rphe8+jJm1l1jR2GoTQwYQ7I9HepJSAUYw0xZmxc+E0d5i25vXVz2Q
X-Gm-Gg: ASbGncscO8rnAVPR/4dViwmx3fG6b6U+YQ3sOQ3cKpEe75wib6OzevlPkk6DO840wL6
 DigZNLMZkizUcUwJ2eB+RrmD9dmHxOKDHX/7SGaJJm+CVEVgA13O0DTgJjNmAQgV2Td0VdOI8RJ
 5AUSEupxQ8MD1fbB9lmsxmSBBvn2XKU7Q7xpln6577Srt33izvmvrR8ioGEpkM/DE1JidNuubW2
 4/jvfGeAoBn2EXQqCpA8uwHJAejmEdVhS87nBhThORFJwPxm1GfuQpP8FpUiY+U6/PRMULdAiA7
 lw6XWou8bW/jwbumeIZmtk9IDAO3gltNiXolUTe2syMxGliaDlYiCnaNHrQv93Dg20gtIZDVZAA
 DAAiVkR5UP+QuZWCjrmmcbdseO+BVG0BMRifBQFSLlamgElfQDliouhx9IpArtTr6ANKzq5zIXI
 qA9Bp0mrjQma3MTebxonLSibSPd1zw2Ak=
X-Google-Smtp-Source: AGHT+IGAX52TOu3xcrF7k0Z2xnSH9aSnRjH25BVqUHGKDaJCpk1xP1pbe94SWO8edzPJTDz+fWzgvg==
X-Received: by 2002:a05:600c:1382:b0:45d:f81d:eae7 with SMTP id
 5b1f17b1804b1-47773293056mr29900615e9.28.1762647648706; 
 Sat, 08 Nov 2025 16:20:48 -0800 (PST)
Received: from ekhafagy-ROG-Strix.. ([156.204.26.194])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42abe62bf40sm13604647f8f.9.2025.11.08.16.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Nov 2025 16:20:48 -0800 (PST)
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
To: linus.walleij@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 eslam.medhat1993@gmail.com
Subject: [PATCH] drm: pl111: replace dev_* print functions with drm_* variants
Date: Sun,  9 Nov 2025 02:19:56 +0200
Message-ID: <20251109001956.2359111-1-eslam.medhat1993@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Update the PL111 CLCD driver to use DRM print macros drm_*() instead of
dev_*(). This change ensures consistency with DRM subsystem
logging conventions [1].

[1]
Link: https://docs.kernel.org/gpu/todo.html#convert-logging-to-drm-functions-with-drm-device-parameter

Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
---
 drivers/gpu/drm/pl111/pl111_display.c   |  4 +-
 drivers/gpu/drm/pl111/pl111_drv.c       | 28 ++++++-------
 drivers/gpu/drm/pl111/pl111_nomadik.c   |  4 +-
 drivers/gpu/drm/pl111/pl111_nomadik.h   |  4 +-
 drivers/gpu/drm/pl111/pl111_versatile.c | 52 ++++++++++++-------------
 drivers/gpu/drm/pl111/pl111_versatile.h |  2 +-
 6 files changed, 47 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index b9fe926a49e8..bc7acb3a2810 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -137,7 +137,7 @@ static void pl111_display_enable(struct drm_simple_display_pipe *pipe,
 
 	ret = clk_set_rate(priv->clk, mode->clock * 1000);
 	if (ret) {
-		dev_err(drm->dev,
+		drm_err(drm,
 			"Failed to set pixel clock rate to %d: %d\n",
 			mode->clock * 1000, ret);
 	}
@@ -549,7 +549,7 @@ pl111_init_clock_divider(struct drm_device *drm)
 	int ret;
 
 	if (IS_ERR(parent)) {
-		dev_err(drm->dev, "CLCD: unable to get clcdclk.\n");
+		drm_err(drm, "CLCD: unable to get clcdclk.\n");
 		return PTR_ERR(parent);
 	}
 
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 56ff6a3fb483..4833d18b4040 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -98,7 +98,7 @@ static int pl111_modeset_init(struct drm_device *dev)
 		struct drm_panel *tmp_panel;
 		struct drm_bridge *tmp_bridge;
 
-		dev_dbg(dev->dev, "checking endpoint %d\n", i);
+		drm_dbg(dev, "checking endpoint %d\n", i);
 
 		ret = drm_of_find_panel_or_bridge(dev->dev->of_node,
 						  0, i,
@@ -114,18 +114,18 @@ static int pl111_modeset_init(struct drm_device *dev)
 				defer = true;
 			} else if (ret != -ENODEV) {
 				/* Continue, maybe something else is working */
-				dev_err(dev->dev,
+				drm_err(dev,
 					"endpoint %d returns %d\n", i, ret);
 			}
 		}
 
 		if (tmp_panel) {
-			dev_info(dev->dev,
+			drm_info(dev,
 				 "found panel on endpoint %d\n", i);
 			panel = tmp_panel;
 		}
 		if (tmp_bridge) {
-			dev_info(dev->dev,
+			drm_info(dev,
 				 "found bridge on endpoint %d\n", i);
 			bridge = tmp_bridge;
 		}
@@ -149,9 +149,9 @@ static int pl111_modeset_init(struct drm_device *dev)
 			goto finish;
 		}
 	} else if (bridge) {
-		dev_info(dev->dev, "Using non-panel bridge\n");
+		drm_info(dev, "Using non-panel bridge\n");
 	} else {
-		dev_err(dev->dev, "No bridge, exiting\n");
+		drm_err(dev, "No bridge, exiting\n");
 		return -ENODEV;
 	}
 
@@ -163,7 +163,7 @@ static int pl111_modeset_init(struct drm_device *dev)
 
 	ret = pl111_display_init(dev);
 	if (ret != 0) {
-		dev_err(dev->dev, "Failed to init display\n");
+		drm_err(dev, "Failed to init display\n");
 		goto out_bridge;
 	}
 
@@ -175,7 +175,7 @@ static int pl111_modeset_init(struct drm_device *dev)
 	if (!priv->variant->broken_vblank) {
 		ret = drm_vblank_init(dev, 1);
 		if (ret != 0) {
-			dev_err(dev->dev, "Failed to init vblank\n");
+			drm_err(dev, "Failed to init vblank\n");
 			goto out_bridge;
 		}
 	}
@@ -255,13 +255,13 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 
 	ret = of_reserved_mem_device_init(dev);
 	if (!ret) {
-		dev_info(dev, "using device-specific reserved memory\n");
+		drm_info(drm, "using device-specific reserved memory\n");
 		priv->use_device_memory = true;
 	}
 
 	if (of_property_read_u32(dev->of_node, "max-memory-bandwidth",
 				 &priv->memory_bw)) {
-		dev_info(dev, "no max memory bandwidth specified, assume unlimited\n");
+		drm_info(drm, "no max memory bandwidth specified, assume unlimited\n");
 		priv->memory_bw = 0;
 	}
 
@@ -276,17 +276,17 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 
 	priv->regs = devm_ioremap_resource(dev, &amba_dev->res);
 	if (IS_ERR(priv->regs)) {
-		dev_err(dev, "%s failed mmio\n", __func__);
+		drm_err(drm, "%s failed mmio\n", __func__);
 		ret = PTR_ERR(priv->regs);
 		goto dev_put;
 	}
 
 	/* This may override some variant settings */
-	ret = pl111_versatile_init(dev, priv);
+	ret = pl111_versatile_init(drm, priv);
 	if (ret)
 		goto dev_put;
 
-	pl111_nomadik_init(dev);
+	pl111_nomadik_init(drm);
 
 	/* turn off interrupts before requesting the irq */
 	writel(0, priv->regs + priv->ienb);
@@ -294,7 +294,7 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 	ret = devm_request_irq(dev, amba_dev->irq[0], pl111_irq, 0,
 			       variant->name, priv);
 	if (ret != 0) {
-		dev_err(dev, "%s failed irq %d\n", __func__, ret);
+		drm_err(drm, "%s failed irq %d\n", __func__, ret);
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/pl111/pl111_nomadik.c b/drivers/gpu/drm/pl111/pl111_nomadik.c
index 6f385e59be22..f3218d59c5f1 100644
--- a/drivers/gpu/drm/pl111/pl111_nomadik.c
+++ b/drivers/gpu/drm/pl111/pl111_nomadik.c
@@ -9,7 +9,7 @@
 #define PMU_CTRL_OFFSET 0x0000
 #define PMU_CTRL_LCDNDIF BIT(26)
 
-void pl111_nomadik_init(struct device *dev)
+void pl111_nomadik_init(struct drm_device *dev)
 {
 	struct regmap *pmu_regmap;
 
@@ -31,6 +31,6 @@ void pl111_nomadik_init(struct device *dev)
 			   PMU_CTRL_OFFSET,
 			   PMU_CTRL_LCDNDIF,
 			   0);
-	dev_info(dev, "set Nomadik PMU mux to CLCD mode\n");
+	drm_info(dev, "set Nomadik PMU mux to CLCD mode\n");
 }
 EXPORT_SYMBOL_GPL(pl111_nomadik_init);
diff --git a/drivers/gpu/drm/pl111/pl111_nomadik.h b/drivers/gpu/drm/pl111/pl111_nomadik.h
index 47ccf5c839fc..b2c9f7cc1c8c 100644
--- a/drivers/gpu/drm/pl111/pl111_nomadik.h
+++ b/drivers/gpu/drm/pl111/pl111_nomadik.h
@@ -8,11 +8,11 @@ struct device;
 
 #ifdef CONFIG_ARCH_NOMADIK
 
-void pl111_nomadik_init(struct device *dev);
+void pl111_nomadik_init(struct drm_device *dev);
 
 #else
 
-static inline void pl111_nomadik_init(struct device *dev)
+static inline void pl111_nomadik_init(struct drm_device *dev)
 {
 }
 
diff --git a/drivers/gpu/drm/pl111/pl111_versatile.c b/drivers/gpu/drm/pl111/pl111_versatile.c
index 5f460b296c0c..ec8683a1b5fc 100644
--- a/drivers/gpu/drm/pl111/pl111_versatile.c
+++ b/drivers/gpu/drm/pl111/pl111_versatile.c
@@ -116,7 +116,7 @@ static void pl111_integrator_enable(struct drm_device *drm, u32 format)
 {
 	u32 val;
 
-	dev_info(drm->dev, "enable Integrator CLCD connectors\n");
+	drm_info(drm, "enable Integrator CLCD connectors\n");
 
 	/* FIXME: really needed? */
 	val = INTEGRATOR_CLCD_LCD_STATIC1 | INTEGRATOR_CLCD_LCD_STATIC2 |
@@ -134,7 +134,7 @@ static void pl111_integrator_enable(struct drm_device *drm, u32 format)
 		val |= INTEGRATOR_CLCD_LCDMUX_VGA555;
 		break;
 	default:
-		dev_err(drm->dev, "unhandled format on Integrator 0x%08x\n",
+		drm_err(drm, "unhandled format on Integrator 0x%08x\n",
 			format);
 		break;
 	}
@@ -156,7 +156,7 @@ static void pl111_impd1_enable(struct drm_device *drm, u32 format)
 {
 	u32 val;
 
-	dev_info(drm->dev, "enable IM-PD1 CLCD connectors\n");
+	drm_info(drm, "enable IM-PD1 CLCD connectors\n");
 	val = IMPD1_CTRL_DISP_VGA | IMPD1_CTRL_DISP_ENABLE;
 
 	regmap_update_bits(versatile_syscon_map,
@@ -167,7 +167,7 @@ static void pl111_impd1_enable(struct drm_device *drm, u32 format)
 
 static void pl111_impd1_disable(struct drm_device *drm)
 {
-	dev_info(drm->dev, "disable IM-PD1 CLCD connectors\n");
+	drm_info(drm, "disable IM-PD1 CLCD connectors\n");
 
 	regmap_update_bits(versatile_syscon_map,
 			   IMPD1_CTRL_OFFSET,
@@ -194,7 +194,7 @@ static void pl111_impd1_disable(struct drm_device *drm)
 
 static void pl111_versatile_disable(struct drm_device *drm)
 {
-	dev_info(drm->dev, "disable Versatile CLCD connectors\n");
+	drm_info(drm, "disable Versatile CLCD connectors\n");
 	regmap_update_bits(versatile_syscon_map,
 			   SYS_CLCD,
 			   SYS_CLCD_CONNECTOR_MASK,
@@ -205,7 +205,7 @@ static void pl111_versatile_enable(struct drm_device *drm, u32 format)
 {
 	u32 val = 0;
 
-	dev_info(drm->dev, "enable Versatile CLCD connectors\n");
+	drm_info(drm, "enable Versatile CLCD connectors\n");
 
 	switch (format) {
 	case DRM_FORMAT_ABGR8888:
@@ -227,7 +227,7 @@ static void pl111_versatile_enable(struct drm_device *drm, u32 format)
 		val |= SYS_CLCD_MODE_5551;
 		break;
 	default:
-		dev_err(drm->dev, "unhandled format on Versatile 0x%08x\n",
+		drm_err(drm, "unhandled format on Versatile 0x%08x\n",
 			format);
 		break;
 	}
@@ -247,7 +247,7 @@ static void pl111_versatile_enable(struct drm_device *drm, u32 format)
 
 static void pl111_realview_clcd_disable(struct drm_device *drm)
 {
-	dev_info(drm->dev, "disable RealView CLCD connectors\n");
+	drm_info(drm, "disable RealView CLCD connectors\n");
 	regmap_update_bits(versatile_syscon_map,
 			   SYS_CLCD,
 			   SYS_CLCD_CONNECTOR_MASK,
@@ -256,7 +256,7 @@ static void pl111_realview_clcd_disable(struct drm_device *drm)
 
 static void pl111_realview_clcd_enable(struct drm_device *drm, u32 format)
 {
-	dev_info(drm->dev, "enable RealView CLCD connectors\n");
+	drm_info(drm, "enable RealView CLCD connectors\n");
 	regmap_update_bits(versatile_syscon_map,
 			   SYS_CLCD,
 			   SYS_CLCD_CONNECTOR_MASK,
@@ -376,7 +376,7 @@ static const struct pl111_variant_data pl111_vexpress = {
 #define VEXPRESS_FPGAMUX_DAUGHTERBOARD_1	0x01
 #define VEXPRESS_FPGAMUX_DAUGHTERBOARD_2	0x02
 
-static int pl111_vexpress_clcd_init(struct device *dev, struct device_node *np,
+static int pl111_vexpress_clcd_init(struct drm_device *dev, struct device_node *np,
 				    struct pl111_drm_dev_private *priv)
 {
 	struct platform_device *pdev;
@@ -433,22 +433,22 @@ static int pl111_vexpress_clcd_init(struct device *dev, struct device_node *np,
 		mux_motherboard = false;
 
 	if (mux_motherboard) {
-		dev_info(dev, "DVI muxed to motherboard CLCD\n");
+		drm_info(dev, "DVI muxed to motherboard CLCD\n");
 		val = VEXPRESS_FPGAMUX_MOTHERBOARD;
-	} else if (ct_clcd == dev->of_node) {
-		dev_info(dev,
+	} else if (ct_clcd == dev->dev->of_node) {
+		drm_info(dev,
 			 "DVI muxed to daughterboard 1 (core tile) CLCD\n");
 		val = VEXPRESS_FPGAMUX_DAUGHTERBOARD_1;
 	} else {
-		dev_info(dev, "core tile graphics present\n");
-		dev_info(dev, "this device will be deactivated\n");
+		drm_info(dev, "core tile graphics present\n");
+		drm_info(dev, "this device will be deactivated\n");
 		return -ENODEV;
 	}
 
 	/* Call into deep Vexpress configuration API */
 	pdev = of_find_device_by_node(np);
 	if (!pdev) {
-		dev_err(dev, "can't find the sysreg device, deferring\n");
+		drm_err(dev, "can't find the sysreg device, deferring\n");
 		return -EPROBE_DEFER;
 	}
 
@@ -461,17 +461,17 @@ static int pl111_vexpress_clcd_init(struct device *dev, struct device_node *np,
 	ret = regmap_write(map, 0, val);
 	platform_device_put(pdev);
 	if (ret) {
-		dev_err(dev, "error setting DVI muxmode\n");
+		drm_err(dev, "error setting DVI muxmode\n");
 		return -ENODEV;
 	}
 
 	priv->variant = &pl111_vexpress;
-	dev_info(dev, "initializing Versatile Express PL111\n");
+	drm_info(dev, "initializing Versatile Express PL111\n");
 
 	return 0;
 }
 
-int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
+int pl111_versatile_init(struct drm_device *dev, struct pl111_drm_dev_private *priv)
 {
 	const struct of_device_id *clcd_id;
 	enum versatile_clcd versatile_clcd_type;
@@ -492,7 +492,7 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 		int ret = pl111_vexpress_clcd_init(dev, np, priv);
 		of_node_put(np);
 		if (ret)
-			dev_err(dev, "Versatile Express init failed - %d", ret);
+			drm_err(dev, "Versatile Express init failed - %d", ret);
 		return ret;
 	}
 
@@ -511,7 +511,7 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 	map = syscon_node_to_regmap(np);
 	of_node_put(np);
 	if (IS_ERR(map)) {
-		dev_err(dev, "no Versatile syscon regmap\n");
+		drm_err(dev, "no Versatile syscon regmap\n");
 		return PTR_ERR(map);
 	}
 
@@ -520,14 +520,14 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 		versatile_syscon_map = map;
 		priv->variant = &pl110_integrator;
 		priv->variant_display_enable = pl111_integrator_enable;
-		dev_info(dev, "set up callbacks for Integrator PL110\n");
+		drm_info(dev, "set up callbacks for Integrator PL110\n");
 		break;
 	case INTEGRATOR_IMPD1:
 		versatile_syscon_map = map;
 		priv->variant = &pl110_impd1;
 		priv->variant_display_enable = pl111_impd1_enable;
 		priv->variant_display_disable = pl111_impd1_disable;
-		dev_info(dev, "set up callbacks for IM-PD1 PL110\n");
+		drm_info(dev, "set up callbacks for IM-PD1 PL110\n");
 		break;
 	case VERSATILE_CLCD:
 		versatile_syscon_map = map;
@@ -542,7 +542,7 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 		 */
 		priv->ienb = CLCD_PL111_IENB;
 		priv->ctrl = CLCD_PL111_CNTL;
-		dev_info(dev, "set up callbacks for Versatile PL110\n");
+		drm_info(dev, "set up callbacks for Versatile PL110\n");
 		break;
 	case REALVIEW_CLCD_EB:
 	case REALVIEW_CLCD_PB1176:
@@ -553,10 +553,10 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 		priv->variant = &pl111_realview;
 		priv->variant_display_enable = pl111_realview_clcd_enable;
 		priv->variant_display_disable = pl111_realview_clcd_disable;
-		dev_info(dev, "set up callbacks for RealView PL111\n");
+		drm_info(dev, "set up callbacks for RealView PL111\n");
 		break;
 	default:
-		dev_info(dev, "unknown Versatile system controller\n");
+		drm_info(dev, "unknown Versatile system controller\n");
 		break;
 	}
 
diff --git a/drivers/gpu/drm/pl111/pl111_versatile.h b/drivers/gpu/drm/pl111/pl111_versatile.h
index 143877010042..7a15c5f7efe8 100644
--- a/drivers/gpu/drm/pl111/pl111_versatile.h
+++ b/drivers/gpu/drm/pl111/pl111_versatile.h
@@ -7,6 +7,6 @@
 struct device;
 struct pl111_drm_dev_private;
 
-int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv);
+int pl111_versatile_init(struct drm_device *dev, struct pl111_drm_dev_private *priv);
 
 #endif
-- 
2.43.0

