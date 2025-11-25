Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF9AC86D3B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 20:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9733710E44D;
	Tue, 25 Nov 2025 19:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WWpdvFi0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1D410E072
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 19:38:52 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-42b32a3e78bso4887507f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 11:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764099531; x=1764704331; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HhdvsOVj27n/3OX2Xubld0LZbS4jqGYO9b78eyJdYWM=;
 b=WWpdvFi0bOqTSrv/kiTUtRWQzaYmeSkcS3dU5mEKZgtdmt1HK7MePD4aWL8xkpM3Y6
 6nyQpQ+hmb5WPDxQKCnMdEr6crQr8f/LhXA2dLkCRqeenseMiAWcjcxIlAGR0XPQx5D0
 tFThGMCanflK2Oqs+tf/JgGMiagm4LXMfs9yS7mUANSrEaTbp4Jw1naZEC02EVD8mQ33
 pTOji/fiY8BkdOHnl49cdYR4q0Do9FtNopdldJ8jOgUfFaKOIFBpsQIb2en7zbNStLpP
 G2pg1+Worx5iQXExRyYgfsftrFWyf5HnZjOPfVDneS1L26pisRnXd6PJl4wj0wDuMD2T
 xnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764099531; x=1764704331;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HhdvsOVj27n/3OX2Xubld0LZbS4jqGYO9b78eyJdYWM=;
 b=dCN6hxSsQh+nKavBMjOeFZ/cTKbRgKTn6pEv6BvD3cfiZeWE2i+K9aW10wl4KpetsW
 2odGmw01jKunSO4/AgONC2Szt2fOF+VcySCoU509Xt+l11slF/X+MlVgK49DkY7Ft/uZ
 qOOKnw8m5vbQwfY+zWL8LU0vba6B1Ll4Bp5GPH5iHOqS0ykfzUBFfz1U2NTl6Hd4DXTI
 Ze84C9+zFpMHY0rGZSRfSI1qKi52Q3608CzeV1W6yjO/Eebn0eloeMm5U/g436hqWJj+
 ijpXtXqwq1xC5V9CV1WcYJ6WdfAcs6XajiPCG4v5NEEkecCvKIS+f/Zn2howxYkHODVS
 poUw==
X-Gm-Message-State: AOJu0YxDlGV7dHvgmJgh9WqYFoJOEUruY+Hm+EE5fUnFk7dPCJKpoHPT
 SlUm2TDVDmvmAq70jZAa9hbALncMsMzBavDwnw1bCGpZzKf0kTgzNdEZ
X-Gm-Gg: ASbGncv6nSyune91rsB8gr2fhseqBA7/APDfgG4QeozIulBDdgsPjSWuHqKTraizpDt
 cv77NTYZWlnaArpURdNrC+9Lza+gDS1ZDCeJU7pQhNKULQQLTe0tnei8K7pYcBNA9Xyrp0aP71/
 eFsoLOidxBGWQHCUptPEUMrmhDfhygMJe7xwPqs5mWvwcUDHIuf0K9ZVU1P3qgHOUwngmx3RLWu
 a3ZAinj27ijBs7XfjwQ1nflYF5m1HmYcyTXkQ2rjtzIc7J7R2k1P22/1JhuLTrykRxmgzA2vEUQ
 jrbySMkjQMCMKcMLjCYYFqVfMWI/eQaqdOB1X6ruM77OUPu1KOkGUu2eXij2KMMRz2G6sB4e+1M
 pwpAAP64iewqwN48slmNIJASFwICdA/bDwPfQ76ZUUDekc8vG0qFtzwkvO10CvBVJi9ZTx+dMOn
 89/H6JeuaQcXFBsiD7vkOecjbaaklfPQ==
X-Google-Smtp-Source: AGHT+IEbIDsEt1+Gf5EHUaxUFKp2foy/z/YAHyHLKb3QMfpKucpSc5d777Hh0Tsc642j+bwxsjXtPg==
X-Received: by 2002:a5d:5d08:0:b0:429:cd3f:f43b with SMTP id
 ffacd0b85a97d-42cc1ac9c81mr17324919f8f.4.1764099530351; 
 Tue, 25 Nov 2025 11:38:50 -0800 (PST)
Received: from ekhafagy-ROG-Strix.. ([41.34.101.194])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f2e556sm35792375f8f.5.2025.11.25.11.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 11:38:48 -0800 (PST)
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
To: =linus.walleij@linaro.org, =maarten.lankhorst@linux.intel.com,
 =mripard@kernel.org, =tzimmermann@suse.de, =airlied@gmail.com,
 =simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Eslam Khafagy <eslam.medhat1993@gmail.com>
Subject: [PATCH v2] drm: pl111: replace dev_* print functions with drm_*
 variants
Date: Tue, 25 Nov 2025 21:38:45 +0200
Message-ID: <20251125193845.425416-1-eslam.medhat1993@gmail.com>
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
v2:
* Add mssing include file drm/drm_print.h
v1: https://lore.kernel.org/all/20251122004951.567753-1-eslam.medhat1993@gmail.com/
---
 drivers/gpu/drm/pl111/pl111_display.c   |  4 +-
 drivers/gpu/drm/pl111/pl111_drv.c       | 29 +++++++-------
 drivers/gpu/drm/pl111/pl111_nomadik.c   |  4 +-
 drivers/gpu/drm/pl111/pl111_nomadik.h   |  4 +-
 drivers/gpu/drm/pl111/pl111_versatile.c | 53 +++++++++++++------------
 drivers/gpu/drm/pl111/pl111_versatile.h |  2 +-
 6 files changed, 49 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index 3a9661b9b1fc..5d10bc5fdf1f 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -138,7 +138,7 @@ static void pl111_display_enable(struct drm_simple_display_pipe *pipe,
 
 	ret = clk_set_rate(priv->clk, mode->clock * 1000);
 	if (ret) {
-		dev_err(drm->dev,
+		drm_err(drm,
 			"Failed to set pixel clock rate to %d: %d\n",
 			mode->clock * 1000, ret);
 	}
@@ -553,7 +553,7 @@ pl111_init_clock_divider(struct drm_device *drm)
 	int ret;
 
 	if (IS_ERR(parent)) {
-		dev_err(drm->dev, "CLCD: unable to get clcdclk.\n");
+		drm_err(drm, "CLCD: unable to get clcdclk.\n");
 		return PTR_ERR(parent);
 	}
 
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 56ff6a3fb483..ac9e4b6bd2eb 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -55,6 +55,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -98,7 +99,7 @@ static int pl111_modeset_init(struct drm_device *dev)
 		struct drm_panel *tmp_panel;
 		struct drm_bridge *tmp_bridge;
 
-		dev_dbg(dev->dev, "checking endpoint %d\n", i);
+		drm_dbg(dev, "checking endpoint %d\n", i);
 
 		ret = drm_of_find_panel_or_bridge(dev->dev->of_node,
 						  0, i,
@@ -114,18 +115,18 @@ static int pl111_modeset_init(struct drm_device *dev)
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
@@ -149,9 +150,9 @@ static int pl111_modeset_init(struct drm_device *dev)
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
 
@@ -163,7 +164,7 @@ static int pl111_modeset_init(struct drm_device *dev)
 
 	ret = pl111_display_init(dev);
 	if (ret != 0) {
-		dev_err(dev->dev, "Failed to init display\n");
+		drm_err(dev, "Failed to init display\n");
 		goto out_bridge;
 	}
 
@@ -175,7 +176,7 @@ static int pl111_modeset_init(struct drm_device *dev)
 	if (!priv->variant->broken_vblank) {
 		ret = drm_vblank_init(dev, 1);
 		if (ret != 0) {
-			dev_err(dev->dev, "Failed to init vblank\n");
+			drm_err(dev, "Failed to init vblank\n");
 			goto out_bridge;
 		}
 	}
@@ -255,13 +256,13 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 
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
 
@@ -276,17 +277,17 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 
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
@@ -294,7 +295,7 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
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
index 5f460b296c0c..0d8331a3909f 100644
--- a/drivers/gpu/drm/pl111/pl111_versatile.c
+++ b/drivers/gpu/drm/pl111/pl111_versatile.c
@@ -20,6 +20,7 @@
 #include <linux/vexpress.h>
 
 #include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
 
 #include "pl111_versatile.h"
 #include "pl111_drm.h"
@@ -116,7 +117,7 @@ static void pl111_integrator_enable(struct drm_device *drm, u32 format)
 {
 	u32 val;
 
-	dev_info(drm->dev, "enable Integrator CLCD connectors\n");
+	drm_info(drm, "enable Integrator CLCD connectors\n");
 
 	/* FIXME: really needed? */
 	val = INTEGRATOR_CLCD_LCD_STATIC1 | INTEGRATOR_CLCD_LCD_STATIC2 |
@@ -134,7 +135,7 @@ static void pl111_integrator_enable(struct drm_device *drm, u32 format)
 		val |= INTEGRATOR_CLCD_LCDMUX_VGA555;
 		break;
 	default:
-		dev_err(drm->dev, "unhandled format on Integrator 0x%08x\n",
+		drm_err(drm, "unhandled format on Integrator 0x%08x\n",
 			format);
 		break;
 	}
@@ -156,7 +157,7 @@ static void pl111_impd1_enable(struct drm_device *drm, u32 format)
 {
 	u32 val;
 
-	dev_info(drm->dev, "enable IM-PD1 CLCD connectors\n");
+	drm_info(drm, "enable IM-PD1 CLCD connectors\n");
 	val = IMPD1_CTRL_DISP_VGA | IMPD1_CTRL_DISP_ENABLE;
 
 	regmap_update_bits(versatile_syscon_map,
@@ -167,7 +168,7 @@ static void pl111_impd1_enable(struct drm_device *drm, u32 format)
 
 static void pl111_impd1_disable(struct drm_device *drm)
 {
-	dev_info(drm->dev, "disable IM-PD1 CLCD connectors\n");
+	drm_info(drm, "disable IM-PD1 CLCD connectors\n");
 
 	regmap_update_bits(versatile_syscon_map,
 			   IMPD1_CTRL_OFFSET,
@@ -194,7 +195,7 @@ static void pl111_impd1_disable(struct drm_device *drm)
 
 static void pl111_versatile_disable(struct drm_device *drm)
 {
-	dev_info(drm->dev, "disable Versatile CLCD connectors\n");
+	drm_info(drm, "disable Versatile CLCD connectors\n");
 	regmap_update_bits(versatile_syscon_map,
 			   SYS_CLCD,
 			   SYS_CLCD_CONNECTOR_MASK,
@@ -205,7 +206,7 @@ static void pl111_versatile_enable(struct drm_device *drm, u32 format)
 {
 	u32 val = 0;
 
-	dev_info(drm->dev, "enable Versatile CLCD connectors\n");
+	drm_info(drm, "enable Versatile CLCD connectors\n");
 
 	switch (format) {
 	case DRM_FORMAT_ABGR8888:
@@ -227,7 +228,7 @@ static void pl111_versatile_enable(struct drm_device *drm, u32 format)
 		val |= SYS_CLCD_MODE_5551;
 		break;
 	default:
-		dev_err(drm->dev, "unhandled format on Versatile 0x%08x\n",
+		drm_err(drm, "unhandled format on Versatile 0x%08x\n",
 			format);
 		break;
 	}
@@ -247,7 +248,7 @@ static void pl111_versatile_enable(struct drm_device *drm, u32 format)
 
 static void pl111_realview_clcd_disable(struct drm_device *drm)
 {
-	dev_info(drm->dev, "disable RealView CLCD connectors\n");
+	drm_info(drm, "disable RealView CLCD connectors\n");
 	regmap_update_bits(versatile_syscon_map,
 			   SYS_CLCD,
 			   SYS_CLCD_CONNECTOR_MASK,
@@ -256,7 +257,7 @@ static void pl111_realview_clcd_disable(struct drm_device *drm)
 
 static void pl111_realview_clcd_enable(struct drm_device *drm, u32 format)
 {
-	dev_info(drm->dev, "enable RealView CLCD connectors\n");
+	drm_info(drm, "enable RealView CLCD connectors\n");
 	regmap_update_bits(versatile_syscon_map,
 			   SYS_CLCD,
 			   SYS_CLCD_CONNECTOR_MASK,
@@ -376,7 +377,7 @@ static const struct pl111_variant_data pl111_vexpress = {
 #define VEXPRESS_FPGAMUX_DAUGHTERBOARD_1	0x01
 #define VEXPRESS_FPGAMUX_DAUGHTERBOARD_2	0x02
 
-static int pl111_vexpress_clcd_init(struct device *dev, struct device_node *np,
+static int pl111_vexpress_clcd_init(struct drm_device *dev, struct device_node *np,
 				    struct pl111_drm_dev_private *priv)
 {
 	struct platform_device *pdev;
@@ -433,22 +434,22 @@ static int pl111_vexpress_clcd_init(struct device *dev, struct device_node *np,
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
 
@@ -461,17 +462,17 @@ static int pl111_vexpress_clcd_init(struct device *dev, struct device_node *np,
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
@@ -492,7 +493,7 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 		int ret = pl111_vexpress_clcd_init(dev, np, priv);
 		of_node_put(np);
 		if (ret)
-			dev_err(dev, "Versatile Express init failed - %d", ret);
+			drm_err(dev, "Versatile Express init failed - %d", ret);
 		return ret;
 	}
 
@@ -511,7 +512,7 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 	map = syscon_node_to_regmap(np);
 	of_node_put(np);
 	if (IS_ERR(map)) {
-		dev_err(dev, "no Versatile syscon regmap\n");
+		drm_err(dev, "no Versatile syscon regmap\n");
 		return PTR_ERR(map);
 	}
 
@@ -520,14 +521,14 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
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
@@ -542,7 +543,7 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 		 */
 		priv->ienb = CLCD_PL111_IENB;
 		priv->ctrl = CLCD_PL111_CNTL;
-		dev_info(dev, "set up callbacks for Versatile PL110\n");
+		drm_info(dev, "set up callbacks for Versatile PL110\n");
 		break;
 	case REALVIEW_CLCD_EB:
 	case REALVIEW_CLCD_PB1176:
@@ -553,10 +554,10 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
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

