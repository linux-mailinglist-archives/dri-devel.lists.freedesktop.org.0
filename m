Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 120011A2D61
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 03:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D2F6EB30;
	Thu,  9 Apr 2020 01:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F57D6EB30
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 01:39:54 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id x16so8731488ilp.12
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 18:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NeMxgJdH/jWjk4OdPtDmPyqe4xiEJf5jOviRoYI8eDQ=;
 b=uYcQzwXPNNn1PsXaz771nls5ZqMG9A86R6+sWTxYE+xA1YxOJrqYjkWsErRwN1fMRG
 wjAVwifYgtLd7htDmqanY9hMI1d0rSskfIkHanhRI1q4lT+jnD6DWE3hRx4iB0QrSqQd
 UTGwDa/skpFsnUdQBlfyIjTSFW1OO0qMO8zxkWux4W71gKzgsXSidjxGDUi+JzJi51W/
 YoHewKArHRt7G3aie1LCtOraCPuiFFDnCUx32P5d1z62EM0iR3Qxco7prwUFPN/VKsf8
 2PWe2RX7xdDKU7YdhZwBUYqIUucoFQuTnh75N4umyJg22H5zYJTmU2I032D7MSVgnGs/
 tsqg==
X-Gm-Message-State: AGi0Puank7R3Gw6X6PQCXtfxHjH9hhpuJvYr35eOkwfHzUzLOo4dqRtW
 RZJFcaF/W8M2Ljrl/ej1pw==
X-Google-Smtp-Source: APiQypJDvvUA1E07FL+7EPjit+1Aevzg7BjR6K3kcQX1/FdaqpMlNVcBBsvTg8H0nzmvnygDavWRYw==
X-Received: by 2002:a92:af03:: with SMTP id n3mr2858690ili.180.1586396393315; 
 Wed, 08 Apr 2020 18:39:53 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
 by smtp.googlemail.com with ESMTPSA id b5sm2353026ilf.23.2020.04.08.18.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 18:39:52 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Eric Anholt <eric@anholt.net>
Subject: [PATCH 3/3] drm: pl111: Move VExpress setup into versatile init
Date: Wed,  8 Apr 2020 19:39:47 -0600
Message-Id: <20200409013947.12667-4-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409013947.12667-1-robh@kernel.org>
References: <20200409013947.12667-1-robh@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the VExpress setup in pl111_vexpress.c is now just a single
function call, let's move it into pl111_versatile.c and we can further
simplify pl111_versatile_init() by moving the other pieces for VExpress
into pl111_vexpress_clcd_init().

Cc: Eric Anholt <eric@anholt.net>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/gpu/drm/pl111/Makefile          |   1 -
 drivers/gpu/drm/pl111/pl111_versatile.c | 122 ++++++++++++++++++++----
 drivers/gpu/drm/pl111/pl111_vexpress.c  |  96 -------------------
 drivers/gpu/drm/pl111/pl111_vexpress.h  |  22 -----
 4 files changed, 102 insertions(+), 139 deletions(-)
 delete mode 100644 drivers/gpu/drm/pl111/pl111_vexpress.c
 delete mode 100644 drivers/gpu/drm/pl111/pl111_vexpress.h

diff --git a/drivers/gpu/drm/pl111/Makefile b/drivers/gpu/drm/pl111/Makefile
index 0c70f0e91d21..67d430d433e0 100644
--- a/drivers/gpu/drm/pl111/Makefile
+++ b/drivers/gpu/drm/pl111/Makefile
@@ -3,7 +3,6 @@ pl111_drm-y +=	pl111_display.o \
 		pl111_versatile.o \
 		pl111_drv.o
 
-pl111_drm-$(CONFIG_ARCH_VEXPRESS) += pl111_vexpress.o
 pl111_drm-$(CONFIG_ARCH_NOMADIK) += pl111_nomadik.o
 pl111_drm-$(CONFIG_DEBUG_FS) += pl111_debugfs.o
 
diff --git a/drivers/gpu/drm/pl111/pl111_versatile.c b/drivers/gpu/drm/pl111/pl111_versatile.c
index 8c2551088f26..1b55f977e945 100644
--- a/drivers/gpu/drm/pl111/pl111_versatile.c
+++ b/drivers/gpu/drm/pl111/pl111_versatile.c
@@ -11,7 +11,6 @@
 #include <linux/vexpress.h>
 
 #include "pl111_versatile.h"
-#include "pl111_vexpress.h"
 #include "pl111_drm.h"
 
 static struct regmap *versatile_syscon_map;
@@ -309,13 +308,110 @@ static const struct pl111_variant_data pl111_vexpress = {
 	.broken_clockdivider = true,
 };
 
+#define VEXPRESS_FPGAMUX_MOTHERBOARD		0x00
+#define VEXPRESS_FPGAMUX_DAUGHTERBOARD_1	0x01
+#define VEXPRESS_FPGAMUX_DAUGHTERBOARD_2	0x02
+
+static int pl111_vexpress_clcd_init(struct device *dev, struct device_node *np,
+				    struct pl111_drm_dev_private *priv)
+{
+	struct platform_device *pdev;
+	struct device_node *root;
+	struct device_node *child;
+	struct device_node *ct_clcd = NULL;
+	struct regmap *map;
+	bool has_coretile_clcd = false;
+	bool has_coretile_hdlcd = false;
+	bool mux_motherboard = true;
+	u32 val;
+	int ret;
+
+	if (!IS_ENABLED(CONFIG_VEXPRESS_CONFIG))
+		return -ENODEV;
+
+	/*
+	 * Check if we have a CLCD or HDLCD on the core tile by checking if a
+	 * CLCD or HDLCD is available in the root of the device tree.
+	 */
+	root = of_find_node_by_path("/");
+	if (!root)
+		return -EINVAL;
+
+	for_each_available_child_of_node(root, child) {
+		if (of_device_is_compatible(child, "arm,pl111")) {
+			has_coretile_clcd = true;
+			ct_clcd = child;
+			break;
+		}
+		if (of_device_is_compatible(child, "arm,hdlcd")) {
+			has_coretile_hdlcd = true;
+			of_node_put(child);
+			break;
+		}
+	}
+
+	of_node_put(root);
+
+	/*
+	 * If there is a coretile HDLCD and it has a driver,
+	 * do not mux the CLCD on the motherboard to the DVI.
+	 */
+	if (has_coretile_hdlcd && IS_ENABLED(CONFIG_DRM_HDLCD))
+		mux_motherboard = false;
+
+	/*
+	 * On the Vexpress CA9 we let the CLCD on the coretile
+	 * take precedence, so also in this case do not mux the
+	 * motherboard to the DVI.
+	 */
+	if (has_coretile_clcd)
+		mux_motherboard = false;
+
+	if (mux_motherboard) {
+		dev_info(dev, "DVI muxed to motherboard CLCD\n");
+		val = VEXPRESS_FPGAMUX_MOTHERBOARD;
+	} else if (ct_clcd == dev->of_node) {
+		dev_info(dev,
+			 "DVI muxed to daughterboard 1 (core tile) CLCD\n");
+		val = VEXPRESS_FPGAMUX_DAUGHTERBOARD_1;
+	} else {
+		dev_info(dev, "core tile graphics present\n");
+		dev_info(dev, "this device will be deactivated\n");
+		return -ENODEV;
+	}
+
+	/* Call into deep Vexpress configuration API */
+	pdev = of_find_device_by_node(np);
+	if (!pdev) {
+		dev_err(dev, "can't find the sysreg device, deferring\n");
+		return -EPROBE_DEFER;
+	}
+
+	map = devm_regmap_init_vexpress_config(&pdev->dev);
+	if (IS_ERR(map)) {
+		platform_device_put(pdev);
+		return PTR_ERR(map);
+	}
+
+	ret = regmap_write(map, 0, val);
+	platform_device_put(pdev);
+	if (ret) {
+		dev_err(dev, "error setting DVI muxmode\n");
+		return -ENODEV;
+	}
+
+	priv->variant = &pl111_vexpress;
+	dev_info(dev, "initializing Versatile Express PL111\n");
+
+	return 0;
+}
+
 int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 {
 	const struct of_device_id *clcd_id;
 	enum versatile_clcd versatile_clcd_type;
 	struct device_node *np;
 	struct regmap *map;
-	int ret;
 
 	np = of_find_matching_node_and_match(NULL, versatile_clcd_of_match,
 					     &clcd_id);
@@ -326,17 +422,10 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 	versatile_clcd_type = (enum versatile_clcd)clcd_id->data;
 
 	/* Versatile Express special handling */
-	if (IS_ENABLED(CONFIG_VEXPRESS_CONFIG) && versatile_clcd_type == VEXPRESS_CLCD_V2M) {
-		struct platform_device *pdev;
-		/* Call into deep Vexpress configuration API */
-		pdev = of_find_device_by_node(np);
-		if (!pdev) {
-			dev_err(dev, "can't find the sysreg device, deferring\n");
-			of_node_put(np);
-			return -EPROBE_DEFER;
-		}
-		map = devm_regmap_init_vexpress_config(&pdev->dev);
-		platform_device_put(pdev);
+	if (versatile_clcd_type == VEXPRESS_CLCD_V2M) {
+		int ret = pl111_vexpress_clcd_init(dev, np, priv);
+		of_node_put(np);
+		return ret;
 	} else {
 		map = syscon_node_to_regmap(np);
 	}
@@ -380,13 +469,6 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 		priv->variant_display_disable = pl111_realview_clcd_disable;
 		dev_info(dev, "set up callbacks for RealView PL111\n");
 		break;
-	case VEXPRESS_CLCD_V2M:
-		priv->variant = &pl111_vexpress;
-		dev_info(dev, "initializing Versatile Express PL111\n");
-		ret = pl111_vexpress_clcd_init(dev, priv, map);
-		if (ret)
-			return ret;
-		break;
 	default:
 		dev_info(dev, "unknown Versatile system controller\n");
 		break;
diff --git a/drivers/gpu/drm/pl111/pl111_vexpress.c b/drivers/gpu/drm/pl111/pl111_vexpress.c
deleted file mode 100644
index 37ed3f1da820..000000000000
--- a/drivers/gpu/drm/pl111/pl111_vexpress.c
+++ /dev/null
@@ -1,96 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Versatile Express PL111 handling
- * Copyright (C) 2018 Linus Walleij
- *
- * This module binds to the "arm,vexpress-muxfpga" device on the
- * Versatile Express configuration bus and sets up which CLCD instance
- * gets muxed out on the DVI bridge.
- */
-#include <linux/device.h>
-#include <linux/module.h>
-#include <linux/regmap.h>
-#include <linux/vexpress.h>
-#include <linux/platform_device.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_platform.h>
-#include "pl111_drm.h"
-#include "pl111_vexpress.h"
-
-#define VEXPRESS_FPGAMUX_MOTHERBOARD		0x00
-#define VEXPRESS_FPGAMUX_DAUGHTERBOARD_1	0x01
-#define VEXPRESS_FPGAMUX_DAUGHTERBOARD_2	0x02
-
-int pl111_vexpress_clcd_init(struct device *dev,
-			     struct pl111_drm_dev_private *priv,
-			     struct regmap *map)
-{
-	struct device_node *root;
-	struct device_node *child;
-	struct device_node *ct_clcd = NULL;
-	bool has_coretile_clcd = false;
-	bool has_coretile_hdlcd = false;
-	bool mux_motherboard = true;
-	u32 val;
-	int ret;
-
-	/*
-	 * Check if we have a CLCD or HDLCD on the core tile by checking if a
-	 * CLCD or HDLCD is available in the root of the device tree.
-	 */
-	root = of_find_node_by_path("/");
-	if (!root)
-		return -EINVAL;
-
-	for_each_available_child_of_node(root, child) {
-		if (of_device_is_compatible(child, "arm,pl111")) {
-			has_coretile_clcd = true;
-			ct_clcd = child;
-			break;
-		}
-		if (of_device_is_compatible(child, "arm,hdlcd")) {
-			has_coretile_hdlcd = true;
-			of_node_put(child);
-			break;
-		}
-	}
-
-	of_node_put(root);
-
-	/*
-	 * If there is a coretile HDLCD and it has a driver,
-	 * do not mux the CLCD on the motherboard to the DVI.
-	 */
-	if (has_coretile_hdlcd && IS_ENABLED(CONFIG_DRM_HDLCD))
-		mux_motherboard = false;
-
-	/*
-	 * On the Vexpress CA9 we let the CLCD on the coretile
-	 * take precedence, so also in this case do not mux the
-	 * motherboard to the DVI.
-	 */
-	if (has_coretile_clcd)
-		mux_motherboard = false;
-
-	if (mux_motherboard) {
-		dev_info(dev, "DVI muxed to motherboard CLCD\n");
-		val = VEXPRESS_FPGAMUX_MOTHERBOARD;
-	} else if (ct_clcd == dev->of_node) {
-		dev_info(dev,
-			 "DVI muxed to daughterboard 1 (core tile) CLCD\n");
-		val = VEXPRESS_FPGAMUX_DAUGHTERBOARD_1;
-	} else {
-		dev_info(dev, "core tile graphics present\n");
-		dev_info(dev, "this device will be deactivated\n");
-		return -ENODEV;
-	}
-
-	ret = regmap_write(map, 0, val);
-	if (ret) {
-		dev_err(dev, "error setting DVI muxmode\n");
-		return -ENODEV;
-	}
-
-	return 0;
-}
diff --git a/drivers/gpu/drm/pl111/pl111_vexpress.h b/drivers/gpu/drm/pl111/pl111_vexpress.h
deleted file mode 100644
index bb54864ca91e..000000000000
--- a/drivers/gpu/drm/pl111/pl111_vexpress.h
+++ /dev/null
@@ -1,22 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-struct device;
-struct pl111_drm_dev_private;
-struct regmap;
-
-#ifdef CONFIG_ARCH_VEXPRESS
-
-int pl111_vexpress_clcd_init(struct device *dev,
-			     struct pl111_drm_dev_private *priv,
-			     struct regmap *map);
-
-#else
-
-static inline int pl111_vexpress_clcd_init(struct device *dev,
-					   struct pl111_drm_dev_private *priv,
-					   struct regmap *map)
-{
-	return -ENODEV;
-}
-
-#endif
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
