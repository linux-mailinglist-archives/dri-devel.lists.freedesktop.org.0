Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5404715BEAC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 13:48:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD5F6F5AB;
	Thu, 13 Feb 2020 12:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7862C6F5AB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 12:48:42 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id z26so4143184lfg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 04:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mn+WjjbEETsQlpk4SU5veQcJm6P575D3UCOqa0smQN8=;
 b=fWYvL8RS3p6o84iF5W3UYskmB9JyR1iA+nIstP+Hcm0MxYwC+tAVmd3T4CcvikM2p6
 +zSERhQbW23ib75QeTmD3Oya0jzwEMaKdid3UxJO5i/IgRkD02EjS4jvLS2/CsOae8dk
 nBhxO4Rm0kzLJzX6ODZFwev/EVMf49tNxzAwxZzlH8IaxAci+ElMHnWYWy7Hfifja0l8
 B29jAK5qADWn+lG4gaqVEgM1tAIfzxK/S5bhRIKTty8N3CNpaolJv+yUU1IYp9dcHOvx
 Uj0HU1xxza7RJyYuG7Is2y1dCikxazFp08kOHjaWIqwIg9dqVIrUBmq+S7xeeIK18BOI
 5zwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mn+WjjbEETsQlpk4SU5veQcJm6P575D3UCOqa0smQN8=;
 b=QzpfqX5c7wFhZm3SuvqH372SqvkHSPFkAes7IrBL52b541uP0EcQKXuoK9o1Uc4b2J
 AGX+L9Pi0TKax4g3f/xzTu2U44TTALwrIwUzES5IjUxHPK3z8OGoVn4FG3Hkg6gJgrLn
 SadTVJOh9QQhX4W9riIb6HwmVxwO7y6+VJAY0d82mpEYDyt7UrcjTGafcbu0DML4ybdh
 OHTVtIvx37w8dzN6QdfnUkHjkGSTVLfCaR0FwRV6rUwkZlheNcNFxAzhFO6DBuxMMion
 FuPC0zI3JkaQjjWzcJ+AlaAgt77tSbwaZSSNBNLhZCtkKhHvm1ghzbUuTNuZqlWQuX4f
 ndLA==
X-Gm-Message-State: APjAAAXuHfKmWdmitPDqyepfw49SMhuu78cIiPYu99i2zzDKGXcFdU1a
 5PmcVj2SlPgTR6yo1z9YUm8AhnJ8c5c=
X-Google-Smtp-Source: APXvYqz5pmx8EwWFgmYNyX74WM0Q3rB9Icvd4JzYZdBsoG+50mQa7O2W+J5gJNv6bNDdOtJguv6Iqg==
X-Received: by 2002:ac2:5ec3:: with SMTP id d3mr9569766lfq.176.1581598119775; 
 Thu, 13 Feb 2020 04:48:39 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id j19sm1482196lfb.90.2020.02.13.04.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 04:48:39 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/pl111: Support Integrator IM-PD1 module
Date: Thu, 13 Feb 2020 13:48:33 +0100
Message-Id: <20200213124833.35545-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
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
Cc: linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The last in-kernel user of the old framebuffer driver is the
IM-PD1 module for the Integrator/AP. Let's implement support for
this remaining user so we can migrate the last user over to
DRM and delete the old FB driver.

On the Integrator/AP the IM-PD1 system controller will exist
alongside the common Integrator system controller so make
sure to do a special lookup for the IM-PD1 syscon and make it
take precedence if found.

Tested on the Integrator/AP with the IM-PD1 mounted.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/pl111/pl111_versatile.c | 73 +++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/gpu/drm/pl111/pl111_versatile.c b/drivers/gpu/drm/pl111/pl111_versatile.c
index 09aeaffb7660..4f325c410b5d 100644
--- a/drivers/gpu/drm/pl111/pl111_versatile.c
+++ b/drivers/gpu/drm/pl111/pl111_versatile.c
@@ -19,6 +19,7 @@ static struct regmap *versatile_syscon_map;
  * We detect the different syscon types from the compatible strings.
  */
 enum versatile_clcd {
+	INTEGRATOR_IMPD1,
 	INTEGRATOR_CLCD_CM,
 	VERSATILE_CLCD,
 	REALVIEW_CLCD_EB,
@@ -65,6 +66,14 @@ static const struct of_device_id versatile_clcd_of_match[] = {
 	{},
 };
 
+static const struct of_device_id impd1_clcd_of_match[] = {
+	{
+		.compatible = "arm,im-pd1-syscon",
+		.data = (void *)INTEGRATOR_IMPD1,
+	},
+	{},
+};
+
 /*
  * Core module CLCD control on the Integrator/CP, bits
  * 8 thru 19 of the CM_CONTROL register controls a bunch
@@ -125,6 +134,36 @@ static void pl111_integrator_enable(struct drm_device *drm, u32 format)
 			   val);
 }
 
+#define IMPD1_CTRL_OFFSET	0x18
+#define IMPD1_CTRL_DISP_LCD	(0 << 0)
+#define IMPD1_CTRL_DISP_VGA	(1 << 0)
+#define IMPD1_CTRL_DISP_LCD1	(2 << 0)
+#define IMPD1_CTRL_DISP_ENABLE	(1 << 2)
+#define IMPD1_CTRL_DISP_MASK	(7 << 0)
+
+static void pl111_impd1_enable(struct drm_device *drm, u32 format)
+{
+	u32 val;
+
+	dev_info(drm->dev, "enable IM-PD1 CLCD connectors\n");
+	val = IMPD1_CTRL_DISP_VGA | IMPD1_CTRL_DISP_ENABLE;
+
+	regmap_update_bits(versatile_syscon_map,
+			   IMPD1_CTRL_OFFSET,
+			   IMPD1_CTRL_DISP_MASK,
+			   val);
+}
+
+static void pl111_impd1_disable(struct drm_device *drm)
+{
+	dev_info(drm->dev, "disable IM-PD1 CLCD connectors\n");
+
+	regmap_update_bits(versatile_syscon_map,
+			   IMPD1_CTRL_OFFSET,
+			   IMPD1_CTRL_DISP_MASK,
+			   0);
+}
+
 /*
  * This configuration register in the Versatile and RealView
  * family is uniformly present but appears more and more
@@ -270,6 +309,20 @@ static const struct pl111_variant_data pl110_integrator = {
 	.fb_bpp = 16,
 };
 
+/*
+ * The IM-PD1 variant is a PL110 with a bunch of broken, or not
+ * yet implemented features
+ */
+static const struct pl111_variant_data pl110_impd1 = {
+	.name = "PL110 IM-PD1",
+	.is_pl110 = true,
+	.broken_clockdivider = true,
+	.broken_vblank = true,
+	.formats = pl110_integrator_pixel_formats,
+	.nformats = ARRAY_SIZE(pl110_integrator_pixel_formats),
+	.fb_bpp = 16,
+};
+
 /*
  * This is the in-between PL110 variant found in the ARM Versatile,
  * supporting RGB565/BGR565
@@ -322,8 +375,21 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 		/* Non-ARM reference designs, just bail out */
 		return 0;
 	}
+
 	versatile_clcd_type = (enum versatile_clcd)clcd_id->data;
 
+	/*
+	 * On the Integrator, check if we should use the IM-PD1 instead,
+	 * if we find it, it will take precedence. This is on the Integrator/AP
+	 * which only has this option for PL110 graphics.
+	 */
+	 if (versatile_clcd_type == INTEGRATOR_CLCD_CM) {
+		np = of_find_matching_node_and_match(NULL, impd1_clcd_of_match,
+						     &clcd_id);
+		if (np)
+			versatile_clcd_type = (enum versatile_clcd)clcd_id->data;
+	}
+
 	/* Versatile Express special handling */
 	if (versatile_clcd_type == VEXPRESS_CLCD_V2M) {
 		struct platform_device *pdev;
@@ -367,6 +433,13 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 		priv->variant_display_enable = pl111_integrator_enable;
 		dev_info(dev, "set up callbacks for Integrator PL110\n");
 		break;
+	case INTEGRATOR_IMPD1:
+		versatile_syscon_map = map;
+		priv->variant = &pl110_impd1;
+		priv->variant_display_enable = pl111_impd1_enable;
+		priv->variant_display_disable = pl111_impd1_disable;
+		dev_info(dev, "set up callbacks for IM-PD1 PL110\n");
+		break;
 	case VERSATILE_CLCD:
 		versatile_syscon_map = map;
 		/* This can do RGB565 with external PLD */
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
