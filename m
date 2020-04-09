Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A53651A2D60
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 03:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F4C6EB2F;
	Thu,  9 Apr 2020 01:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C2C6EB2D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 01:39:52 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id n13so8779212ilm.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 18:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HFS4oexa8VbxIfGS3dCImonH0q6N8MSETlkblsu0EG8=;
 b=YjcX55NVckbkr3VUDX+4UqyDCSXr5ywVLeBF1afWFKsMqDuRiZxVv/13eq/IGKFzYc
 EdbFmrjqApll+9fUCc/3xqhuVdrCLGrjzod4+uI65GXmCusLdSupiqSDmAa80HNbkVWV
 75LUf5mpm4mrKDD6DQWIZUEGgohBBRjiHxmhT2wxOdWkriEQznvtiXYydOyn48O7Zewy
 CzqSSpZiI8dkxggmltjHQadPDler9AcBC6gKkSREcpeFcKVlLJpiXF6kfWqW001o2bqf
 huS/vlZdmOsdBvH/YWooOz9onLRcLVeyH8diMKApEiea4OhXXW64ZEfy1v9ZZ4t53X31
 +v4Q==
X-Gm-Message-State: AGi0PuaqQWsODUU9BBk/7WlrHmnxEd9ChINYa30u8tseaSRTT5EXykle
 Nfo322dusZEkcU0Gn8KT0Q==
X-Google-Smtp-Source: APiQypLQ7roonLNXmPwaFrhmHM5FOyTwNVh6VW+W1cZaaPuEcLAxJDFk+kj0iC9HkPT2OY35Q+wo0g==
X-Received: by 2002:a92:3548:: with SMTP id c69mr10886585ila.216.1586396391699; 
 Wed, 08 Apr 2020 18:39:51 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
 by smtp.googlemail.com with ESMTPSA id b5sm2353026ilf.23.2020.04.08.18.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 18:39:51 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Eric Anholt <eric@anholt.net>
Subject: [PATCH 2/3] drm: pl111: Simplify vexpress init
Date: Wed,  8 Apr 2020 19:39:46 -0600
Message-Id: <20200409013947.12667-3-robh@kernel.org>
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

The init VExpress variants currently instantiates a 'muxfpga' driver for
the sole purpose of getting a regmap for it. There's no reason to
instantiate a driver and doing so just complicates things. The muxfpga
driver also isn't unregistered properly on module unload. Let's
just simplify all this this by just calling
devm_regmap_init_vexpress_config() directly.

Cc: Eric Anholt <eric@anholt.net>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/gpu/drm/pl111/pl111_versatile.c | 21 +++----------
 drivers/gpu/drm/pl111/pl111_vexpress.c  | 42 -------------------------
 drivers/gpu/drm/pl111/pl111_vexpress.h  |  7 -----
 3 files changed, 4 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_versatile.c b/drivers/gpu/drm/pl111/pl111_versatile.c
index 09aeaffb7660..8c2551088f26 100644
--- a/drivers/gpu/drm/pl111/pl111_versatile.c
+++ b/drivers/gpu/drm/pl111/pl111_versatile.c
@@ -8,6 +8,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/regmap.h>
+#include <linux/vexpress.h>
 
 #include "pl111_versatile.h"
 #include "pl111_vexpress.h"
@@ -325,17 +326,8 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 	versatile_clcd_type = (enum versatile_clcd)clcd_id->data;
 
 	/* Versatile Express special handling */
-	if (versatile_clcd_type == VEXPRESS_CLCD_V2M) {
+	if (IS_ENABLED(CONFIG_VEXPRESS_CONFIG) && versatile_clcd_type == VEXPRESS_CLCD_V2M) {
 		struct platform_device *pdev;
-
-		/* Registers a driver for the muxfpga */
-		ret = vexpress_muxfpga_init();
-		if (ret) {
-			dev_err(dev, "unable to initialize muxfpga driver\n");
-			of_node_put(np);
-			return ret;
-		}
-
 		/* Call into deep Vexpress configuration API */
 		pdev = of_find_device_by_node(np);
 		if (!pdev) {
@@ -343,13 +335,8 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 			of_node_put(np);
 			return -EPROBE_DEFER;
 		}
-		map = dev_get_drvdata(&pdev->dev);
-		if (!map) {
-			dev_err(dev, "sysreg has not yet probed\n");
-			platform_device_put(pdev);
-			of_node_put(np);
-			return -EPROBE_DEFER;
-		}
+		map = devm_regmap_init_vexpress_config(&pdev->dev);
+		platform_device_put(pdev);
 	} else {
 		map = syscon_node_to_regmap(np);
 	}
diff --git a/drivers/gpu/drm/pl111/pl111_vexpress.c b/drivers/gpu/drm/pl111/pl111_vexpress.c
index 350570fe06b5..37ed3f1da820 100644
--- a/drivers/gpu/drm/pl111/pl111_vexpress.c
+++ b/drivers/gpu/drm/pl111/pl111_vexpress.c
@@ -94,45 +94,3 @@ int pl111_vexpress_clcd_init(struct device *dev,
 
 	return 0;
 }
-
-/*
- * This sets up the regmap pointer that will then be retrieved by
- * the detection code in pl111_versatile.c and passed in to the
- * pl111_vexpress_clcd_init() function above.
- */
-static int vexpress_muxfpga_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct regmap *map;
-
-	map = devm_regmap_init_vexpress_config(&pdev->dev);
-	if (IS_ERR(map))
-		return PTR_ERR(map);
-	dev_set_drvdata(dev, map);
-
-	return 0;
-}
-
-static const struct of_device_id vexpress_muxfpga_match[] = {
-	{ .compatible = "arm,vexpress-muxfpga", },
-	{}
-};
-
-static struct platform_driver vexpress_muxfpga_driver = {
-	.driver = {
-		.name = "vexpress-muxfpga",
-		.of_match_table = of_match_ptr(vexpress_muxfpga_match),
-	},
-	.probe = vexpress_muxfpga_probe,
-};
-
-int vexpress_muxfpga_init(void)
-{
-	int ret;
-
-	ret = platform_driver_register(&vexpress_muxfpga_driver);
-	/* -EBUSY just means this driver is already registered */
-	if (ret == -EBUSY)
-		ret = 0;
-	return ret;
-}
diff --git a/drivers/gpu/drm/pl111/pl111_vexpress.h b/drivers/gpu/drm/pl111/pl111_vexpress.h
index 5d3681bb4c00..bb54864ca91e 100644
--- a/drivers/gpu/drm/pl111/pl111_vexpress.h
+++ b/drivers/gpu/drm/pl111/pl111_vexpress.h
@@ -10,8 +10,6 @@ int pl111_vexpress_clcd_init(struct device *dev,
 			     struct pl111_drm_dev_private *priv,
 			     struct regmap *map);
 
-int vexpress_muxfpga_init(void);
-
 #else
 
 static inline int pl111_vexpress_clcd_init(struct device *dev,
@@ -21,9 +19,4 @@ static inline int pl111_vexpress_clcd_init(struct device *dev,
 	return -ENODEV;
 }
 
-static inline int vexpress_muxfpga_init(void)
-{
-	return 0;
-}
-
 #endif
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
