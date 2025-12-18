Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93105CCB88F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 12:06:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0AB10EE63;
	Thu, 18 Dec 2025 11:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PbtzFIvC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E97C10EE21
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 11:06:42 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-34c84ec3b6eso619462a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 03:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766056001; x=1766660801; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=76T2SjmDIqZyZD3OqG0HjQASUCl7IRYbYAxLx4z4J70=;
 b=PbtzFIvCYftp8AvPAkiB5z8QurUWfhGEzWqwAc2inzJPvLAsN3KIznaw/KYKBoltuT
 KxakzAmrHe3g8WASmFKGnae6D4PoSXmJo9ZnzGOSANg7HhCAV9J1o5WlFshpf51TOujl
 VQhKNaE5cgxHmqgzrdFh6hRjlp+mF1w2Dg4vBN+SowVd29OFrDlWkKcu5qEsMkvubYpP
 sIgijZ01Ak7u4NIPTrZs17v/XPKmy3/P6BYQ5urL+YLhPMTr/kATGF5Yy5ly/ngj/TKw
 CmdKeIEYDNCUWm/0zGuAiNLH/kDmaI7HvEZSIAwG61VFrDElJrXYu0tJlQoiKeXLC+HK
 dWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766056001; x=1766660801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=76T2SjmDIqZyZD3OqG0HjQASUCl7IRYbYAxLx4z4J70=;
 b=uioS4SpmQ7AXevIarM317fll1YQ2XCUoNdDbxAOW8S++dCtbwKbEe4t0XF6i2qigYP
 rRTuwQfUOVvRs4FFOctKtDJQA5cS7VPfS98IL7f1lEqtf4cUYauqtSXD3u7bH9VIb1XI
 8wgSaDDgu+eVmpTMvjh2vzGUhXKu2BKPNLaOdgwxIeMN2wFkXFqTvz11gD1FqE3amvxu
 InUR9epz6/JA7PON0uH+w29zZaS+h6R6yX/5PDG+CWJ1ZWRqjRHVNGJD4rTydzBRfs6T
 uryb9TKHFYmil8uSEvBUJmx5dC42DD+k0amA96+BChzzIFfib+kDSGJDMiuqLiWTrL0h
 5WDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/YxNWItDBRnbVNbBsaLHpLFfpejdbqwB5LpKttaT7NQlFoL5sAW2N2wEq2dvt5RrA2k+DX/DIJdo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxp8JKwSkghhqTOM6MqIQbyQBdsAaK5McBGonx9fylOLk8W9IFH
 p3N3TmNtDrJi49dUHGpIjGkoc5hZ0G6LMz6lPiqqD3GjThglDqCDb9LW
X-Gm-Gg: AY/fxX6YJ/nD3y2U/e8CHqTVCuoBWhMYHBX8gd0G4f4LQhcMd5TP58xgKR/PEkb+CrI
 aCytXo4hqI9BLi/aPQH8I21sor6lci3bmVKv2ZVB6AmEtEL9RaJCOAQv8NepDmOj6xB62F32W23
 BX1xbmsLgtsKnGA6cG+LBXHnCl5koMh+adQ8sIYhq7A0+4WBA/rwQ7AoCgR78JPC/lWK5mBzGvL
 y/THKnKEbSLsZXnudBtqZq3kdy2IydOiBlLqpZmIG13nD/g52HHScpBURMz0OCxQvJCURYy4rIG
 CybFRUcfzeRQKVzVIbxIOMG5L5D87IUnu6zBBxVzHJDo6a2DwvPwZVUCXrk+4rB4m+29pj9Bxdp
 BpNdiaaiDQkUQIQA6IO/sn/1U1zKHTGO5PyTZYrHGayMJchVOZgtt5IXsqpZTtij4Kjsp3gS3Xi
 oZu7qr0j5rg4o86BVEMT9kQYuB
X-Google-Smtp-Source: AGHT+IG3ph1IvSh4XGZD1On2HARUs44QBwXvbTKA0eqE3qKLwVQGAvZjsH5QN7Zc+P654QlMWsTQcw==
X-Received: by 2002:a05:7022:5f06:b0:11d:f44c:afbc with SMTP id
 a92af1059eb24-11f34c436f1mr11885266c88.37.1766056001412; 
 Thu, 18 Dec 2025 03:06:41 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:cbeb:945e:cfcc:849a])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12061f473ebsm6896718c88.1.2025.12.18.03.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 03:06:41 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: victor.liu@nxp.com
Cc: marek.vasut@mailbox.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH RESEND v2 2/2] drm/bridge: fsl-ldb: Allow the termination
 resistor to be enabled
Date: Thu, 18 Dec 2025 08:06:26 -0300
Message-Id: <20251218110626.605558-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251218110626.605558-1-festevam@gmail.com>
References: <20251218110626.605558-1-festevam@gmail.com>
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

