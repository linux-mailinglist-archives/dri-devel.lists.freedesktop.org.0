Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 593CEC6995C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 14:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B512710E4A5;
	Tue, 18 Nov 2025 13:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gDRhE1v0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D6210E4A5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 13:24:22 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-bd5add18889so211092a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 05:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763472262; x=1764077062; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6hXSbnHm6t1xwsrf3rAhpWlksErvS9cqFGgpRmks8TA=;
 b=gDRhE1v0eUO9lssbzlKSBQn1PmKchrQNGldREMB/KVdIxH+62QzaZjDZ4Elk4/Bvk+
 x3vqWAb+DIREt4J4nj+khwIsttLUatySj9qFTQmCbSPp+FetPmp/mt7QtJ2e7jeJ+xb2
 Qb5cf8PBubd1jtHzRbFlx+xMnuYMX8jhnTiQMaxZjgGRq1jJ/gnwD/ETag3GQHXE4k5C
 oCqR43SGGS/NqdJeVCqwj/JBMulwqRCKgru6+KLOvOBxJZ2WO+oFBGm8+OW13NNfBzC/
 FKiYFbttdWgcqIIW+PQ+6Gj3+EIq4yx32Wpgx09zJdPkuWq7/kY6Jv7pVYok1AnP8QSi
 eFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763472262; x=1764077062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6hXSbnHm6t1xwsrf3rAhpWlksErvS9cqFGgpRmks8TA=;
 b=Ng2OUvvfmC3farznZAe31nRDyQwuiLp+pGKXFawHHwigHZOHCfw83I0Lsr32CweuWQ
 1tFKgFnTAF7jKBctUc6fjym0MXVOUjvo6c38+pXk/0MrUwl0ZFH5q6ohMoWWppAYO+30
 T0MvpkQ1qgE0pv/OGaPQAON7PjYEc55UI99ESQD76sDtbnu5frraBvJ9sCi4Cuc2P9Yy
 5vklLsAF8V0oWEQUhXTLvIsOhs8UeFWs/nnUPrDmzBzaA/S8Q0Q65KUdQY245iRn6jcO
 JgzN9bk6bys5dWc1TZdz6W846UHVAg+NV/LCuERvONGsgo4B8j8r26H5g7oHbrFpvWbc
 NHKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB4lP/EOrn5/x3aJxDLKKl8shZSwlVi13GJrMyCo69seCCbKXu+VeFVmdJ8UBrq4rgW0Uajd/3nmY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyQySejilJSsImQKOVigYNQy+HEMIYCJtUpplxO1YU2SYYqwzV
 LfB47PcwivkxKZl4fugW7nmR3+9qbJnJUstzM9VI7q0IJ5J3rQpZIRXl
X-Gm-Gg: ASbGncvVdY1hf48cVLhbrlIIck0qgM46OL9Jj96zhxPcXxNSBt/AbODtbazkSbvS3Kh
 w8JZE9WLnbs+fk264uz20N+ymbuanaCw4O0FrwhlP4+Fn9n+T68dkO6ywW32lW50RL6axF5Y9GG
 +qI2PbYIrwnelPPWGKgkRnlU1MZays2E2eEOCN20Tpd9IvuBjmx2eYDI05toBbCvnvtRVnL0J8q
 VjumTZWTt+0vrCXTYmLsld49E9zSjJ4rsNQq5ged3dL5aPsmaCdFl62En3z5hUJxGRk+V8J81h7
 6J8fPxKZSD0iKaOoSRseK9DeDwlugyhW3edIjGEcdvtui3CuV9VbSVpcr76s/6/BqQaBSSGLTHw
 dkbpxBV5+Wroyo09mgeO7M+fZyjMcVvlNZMTBA4YI9xZCDaXRr6i+Z2Alt1NTyKv3FfXVIy3qnB
 bk5n+K0DJfWeAVUMDJ+8psYCXJ
X-Google-Smtp-Source: AGHT+IFhUJLNI6WkwxrwX6i+ajwcFC2UIUOOt+osC0yXDq0Qu22iYDG4x3pZGm/s+SlIjd1xxE4mmA==
X-Received: by 2002:a05:7022:221:b0:119:e56b:98ac with SMTP id
 a92af1059eb24-11b411ff181mr5715909c88.19.1763472262203; 
 Tue, 18 Nov 2025 05:24:22 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8863:100d:2a2a:9a74])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11b060885d8sm66885134c88.2.2025.11.18.05.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 05:24:21 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: Laurent.pinchart@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] drm/bridge: fsl-ldb: Allow the termination resistor to be
 enabled
Date: Tue, 18 Nov 2025 10:22:08 -0300
Message-Id: <20251118132208.143315-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251118132208.143315-1-festevam@gmail.com>
References: <20251118132208.143315-1-festevam@gmail.com>
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

The LVDS Control Register (LVDS_CTRL) register has an HS_EN bit that allows
the 100 Ohm termination resistor in the chip to be enabled.

Add support to setting the HS_EN bit when the "nxp,termination-resistor"
optional property is present.

The motivation for introducing this property was a custom i.MX8MP board
that was showing visual artifacts. After enabling the 100 Ohm termination
resistor the LVDS signal quality improved causing the artifacts to
disappear.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 5c3cf37200bc..b4b9130de32c 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -92,6 +92,7 @@ struct fsl_ldb {
 	const struct fsl_ldb_devdata *devdata;
 	bool ch0_enabled;
 	bool ch1_enabled;
+	bool termination_resistor;
 };
 
 static bool fsl_ldb_is_dual(const struct fsl_ldb *fsl_ldb)
@@ -212,6 +213,10 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 	/* Program LVDS_CTRL */
 	reg = LVDS_CTRL_CC_ADJ(2) | LVDS_CTRL_PRE_EMPH_EN |
 	      LVDS_CTRL_PRE_EMPH_ADJ(3) | LVDS_CTRL_VBG_EN;
+
+	reg &= ~LVDS_CTRL_HS_EN;
+	if (fsl_ldb->termination_resistor)
+		reg |= LVDS_CTRL_HS_EN;
 	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
 
 	/* Wait for VBG to stabilize. */
@@ -292,6 +297,7 @@ static const struct drm_bridge_funcs funcs = {
 static int fsl_ldb_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
 	struct device_node *panel_node;
 	struct device_node *remote1, *remote2;
 	struct drm_panel *panel;
@@ -340,6 +346,9 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	if (IS_ERR(panel))
 		return PTR_ERR(panel);
 
+	if (of_property_present(np, "nxp,termination-resistor"))
+		fsl_ldb->termination_resistor = true;
+
 	fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
 	if (IS_ERR(fsl_ldb->panel_bridge))
 		return PTR_ERR(fsl_ldb->panel_bridge);
-- 
2.34.1

