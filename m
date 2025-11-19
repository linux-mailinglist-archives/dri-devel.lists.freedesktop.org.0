Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99982C6C61D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 03:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715A710E554;
	Wed, 19 Nov 2025 02:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ghAe33UG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C0510E554
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 02:30:19 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2984dfae0acso84515085ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 18:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763519419; x=1764124219; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=76T2SjmDIqZyZD3OqG0HjQASUCl7IRYbYAxLx4z4J70=;
 b=ghAe33UGTFMGo3W28Hk/yVSwwoNGQRn2QDy7ArzBzDNnaYmVQqkYN0Y1YeyTlB0BZH
 4P2zeedSdOp+1n7OeK4gF82R3fz56ncPjFPiKF4dpm4xoU1C4ymN7yUS6XDT7YYFtfA7
 ZQ2zaZcdsFFUf0AKWA0aMxpNTo8Jmy4OaEBuwVOIQOKGHg5oklAP7JY/cPTkMHXYCndj
 it2SQ61svXwHySKdMnyM19zEjTNSQtogqtVvk6k5bOPqflngxEk2vY3+cCrnU4Q7ZjAH
 ZjDAii07eFVfhwnq06IJNJmSWgcmV+iWHmwdvLyz2leeExcV/KXPHPc1JyZnrribxCFy
 skcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763519419; x=1764124219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=76T2SjmDIqZyZD3OqG0HjQASUCl7IRYbYAxLx4z4J70=;
 b=atMn4HXL8EQONZiqcriCPhODM/JUt3PIzSHemTItKQg6TybHDjtZj8y/ju7/3sUaru
 tgK/QGiU46w4zWabF4dVgp+uUYG2f46Iwt8j6+9eSkEWKUV4g9TgUVwzGbGcyd08C5hy
 R9FDVx9gcaCHfvFst1yd60qgPJxZDnI3jSrSrYE6YjGs8fKsSWrP1MyXhTEsja7k8DdW
 RCEBvYDJiALmO/h5YGBkb2Zi2Da98lJzyjHdc8gkXyMUgwxANu6cBQInkcLiSDfln+tx
 tncKyfkNO0xboJ77vLF9Sk/XYihrywlvjFPjWqD3uyuIrK+ZhZ0z0eAP59fH7unCcYaX
 7pow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuCsAjqG4b1xGP25Djtxsb6ho6AjECYJnLlKO8Uxumo1JW3bC8Y5YhPeYGoBbkedxEd2hy5pT0ht0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjMocW3sFUfknvmEupqalbm54LCJrzHYmL7mG8pjCAvFnlP4wn
 w+CxIa1xRG81k8UjYX+6qge03oTBw29+QEk1KigsZgimmHZj00M/ubCs
X-Gm-Gg: ASbGncsBFCGXlL/zqBf+gU7/PGgcyL9DbmX3NF/2LYA1zUiTUU6fAkHVftCgaWj5Fdd
 oM+D5GogOuav05jZPKdzBjEMQsQmzkb/Pg0JTCYpd8ZNc9BZcbFvECDSt8+VVKQ+tT9UUNpGgmc
 ddBb6pkgRlt12z1t0WZc9A1KAsHXb8sJor5mBWrBlo/WIq/33V+fZR2EkHnL9y//Ylcws0Ulg/A
 M9VS1Mb2oPuWPcHHmGPVQBxrnP+pwqi57PP9CNk0SVjUOaxxb7F5q4nk890Id3RBs/lbhXpsu0T
 XyyaUo4YNjQ9Z0WyBb6v2AiO4bV4mhob0TCvn0yh8ePHbm9gNrbwEOe10o0G28cYHlJkwsz0NDL
 1SUURDKsPj1a9ahBoz7WOMS8BU5dA82+MCmFDPvIqFrReVpTgK2/u9FjVQ4x2J1A0PS3v3SdlpK
 B+UuTNHhSHMaklUOK/pZg3PCOf
X-Google-Smtp-Source: AGHT+IFWZ5/K4rKe/g3YbwS6+fpTcdZCtTl6icmOpbHtBhpTsB7wajSZbBxQF3fAXwGOOtNoN85Uqg==
X-Received: by 2002:a05:7022:ef04:b0:119:e56b:c749 with SMTP id
 a92af1059eb24-11b40f92c5emr8189781c88.14.1763519418927; 
 Tue, 18 Nov 2025 18:30:18 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8863:100d:2a2a:9a74])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11b060885e3sm65842955c88.0.2025.11.18.18.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 18:30:18 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: Laurent.pinchart@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, Frank.li@nxp.com,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 2/2] drm/bridge: fsl-ldb: Allow the termination resistor to
 be enabled
Date: Tue, 18 Nov 2025 23:29:46 -0300
Message-Id: <20251119022946.268748-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251119022946.268748-1-festevam@gmail.com>
References: <20251119022946.268748-1-festevam@gmail.com>
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

Add support to setting the HS_EN bit when the optional property
"nxp,enable-termination-resistor" is present.

The motivation for introducing this property was a custom i.MX8MP board
that was showing visual artifacts. After enabling the 100 Ohm termination
resistor the LVDS signal quality improved causing the artifacts to
disappear.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Change the property name to nxp,enable-termination-resistor (Frank).

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
 
+	if (of_property_present(np, "nxp,enable-termination-resistor"))
+		fsl_ldb->termination_resistor = true;
+
 	fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
 	if (IS_ERR(fsl_ldb->panel_bridge))
 		return PTR_ERR(fsl_ldb->panel_bridge);
-- 
2.34.1

