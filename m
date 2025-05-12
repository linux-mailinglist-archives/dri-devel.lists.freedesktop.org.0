Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 225D7AB428E
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 20:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8E210E487;
	Mon, 12 May 2025 18:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RP9qJBoE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D5310E482
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 18:23:56 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3a1d8c0966fso2994678f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 11:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747074235; x=1747679035; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=amLZpBJMN7X2H2vlhMlGUhKnumpCz2RuD1ueFv4+O2g=;
 b=RP9qJBoE9IihXv34eSPcCGGUVrIpsLbAuXWMEqXLzCbsEZo7/a3QpeZcdsyMW4Q500
 BGNL1fY+InIiGd0D+qcz52f0BCFgo0o+lOyeE2fQ9jkYwzvLpMs/xqfhehrYRdlwIarY
 2eRGZO91JeH2zzg36OLSTr/bta96FJ5iOqhpDCw+6aQH+WmFgyPozsGavndIJn1z2YhC
 SPZ2AldqftNoZ4+ltIz6XHeyLw1qiBXmmbyKC1pcB9jLmSOeF4jkSMY5aHbo0QvQsPi1
 qUwOJOKHcCvJO+IPTehZWJ0pWBesc5r56B4GTNEkmGVF/HM5lFncbbRNDrNwrFq3uAr7
 IONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747074235; x=1747679035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=amLZpBJMN7X2H2vlhMlGUhKnumpCz2RuD1ueFv4+O2g=;
 b=CmIk3GMYUzD13SCZN1QjZPPzWWEp3EsZIBaNdgIazC5bPP6T7N42czY09Qgq/VgGBL
 zL/oOeBP/Yo6FDE5pway4Kjs8m3VlT0Jo9X41B4I+xAe1peyHAKAq96hHDM4F/lOyHYp
 BJw1HxxPuO+Wb0Lnbczb1+LMJtZZm8JUuWGGkTl5tN+vXS1Gy71opo0Gq+uDJ+czHwqe
 X0oHXdxtX6MmQd6pslGtPnr0e7zSOQHDyRuFHGel8rqsui1DwwuBTyVwvTQOL/vHya60
 3Zlsr0vMN3cNYzIBccykeAK7Pj9qshifFHo8KKwlQTjxgXG4/8tsVYiw7+xlL3Eo5P3Q
 uhrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXggQMsquHlmefhaeXbhCBlPZ2He4IrxEmf5mqGot48hAvek4SW5tmihuhvKmpxXJx1ULMDjGB9Skw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxxn3oEYourfd4bprjnwJnP88i6T1N+CxvRZhtY0eNdaGHAaCw1
 quF4H76Qpjf2LTbuLwesVNcTqN4kG9MzzjydrkIcTGqRJCOKL7lC
X-Gm-Gg: ASbGncsK7FF81hXNtg74r/Ah00gj1mjlTc38MRSYxl9Mwhx36tkjwJdL21CzDtKBsw+
 15UBzKVRTi8dD6zGR+TPv9epgdTzkykQENcG+4HsE/wH6174cdXkN/jWt+0pP3rdZmbF8mIE+eO
 bWYJj0jeI/YpfwW3p16bppIGZqy8RxIXkL7srr38S2tMylJYqK+U/+T9SF6riFPPuuyAjeOZYc2
 IIdM7sfXczICvk8xll1kyjS6u89Ot/Xxg4Jr2PFnyZQAblutgI7YlrQlDRACoOVsLCKwsNNaCO8
 bbZRThD3V0+MNNG4sdagNaUzDEO73I6fFxafWYMrh+f2U1PSu+7cGmdQw+7r9q4AUVfzq7gjcbL
 OFvW6bgzAY/c=
X-Google-Smtp-Source: AGHT+IGifdJP7ug23PtYNjvhG2POc/iiuYgvwDeqquz7Lfoza7aSCRMXPY0dc5gyvUImWBTklaYphw==
X-Received: by 2002:a5d:5010:0:b0:3a0:aeba:47d8 with SMTP id
 ffacd0b85a97d-3a340d28f88mr349942f8f.29.1747074234771; 
 Mon, 12 May 2025 11:23:54 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a4c5f6sm13175497f8f.86.2025.05.12.11.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 11:23:53 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 06/12] drm: renesas: rz-du: mipi_dsi: Add OF data support
Date: Mon, 12 May 2025 19:23:24 +0100
Message-ID: <20250512182330.238259-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

In preparation for adding support for the Renesas RZ/V2H(P) SoC, this patch
introduces a mechanism to pass SoC-specific information via OF data in the
DSI driver. This enables the driver to adapt dynamically to various
SoC-specific requirements without hardcoding configurations.

The MIPI DSI interface on the RZ/V2H(P) SoC is nearly identical to the one
on the RZ/G2L SoC. While the LINK registers are shared between the two
SoCs, the D-PHY registers differ. Also the VCLK range differs on both these
SoCs. To accommodate these differences `struct rzg2l_mipi_dsi_hw_info` is
introduced and as now passed as OF data.

These changes lay the groundwork for the upcoming RZ/V2H(P) SoC support by
allowing SoC-specific data to be passed through OF.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
- Dropped RZ_MIPI_DSI_FEATURE_DPHY_RST feature flag
- Added Reviewed tag from Biju

v3->v4:
- No changes

v2->v3:
- Dropped !dsi->info check in rzg2l_mipi_dsi_probe() as it is not needed.

v1->v2:
- Added DPHY_RST as feature flag
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 51 ++++++++++++++-----
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  2 -
 2 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 3f6988303e63..00c2bc6e9d6c 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -28,10 +28,23 @@
 
 #include "rzg2l_mipi_dsi_regs.h"
 
+struct rzg2l_mipi_dsi;
+
+struct rzg2l_mipi_dsi_hw_info {
+	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfreq);
+	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
+	u32 phy_reg_offset;
+	u32 link_reg_offset;
+	unsigned long max_dclk;
+	unsigned long min_dclk;
+};
+
 struct rzg2l_mipi_dsi {
 	struct device *dev;
 	void __iomem *mmio;
 
+	const struct rzg2l_mipi_dsi_hw_info *info;
+
 	struct reset_control *rstc;
 	struct reset_control *arstc;
 	struct reset_control *prstc;
@@ -164,22 +177,22 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
 
 static void rzg2l_mipi_dsi_phy_write(struct rzg2l_mipi_dsi *dsi, u32 reg, u32 data)
 {
-	iowrite32(data, dsi->mmio + reg);
+	iowrite32(data, dsi->mmio + dsi->info->phy_reg_offset + reg);
 }
 
 static void rzg2l_mipi_dsi_link_write(struct rzg2l_mipi_dsi *dsi, u32 reg, u32 data)
 {
-	iowrite32(data, dsi->mmio + LINK_REG_OFFSET + reg);
+	iowrite32(data, dsi->mmio + dsi->info->link_reg_offset + reg);
 }
 
 static u32 rzg2l_mipi_dsi_phy_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
 {
-	return ioread32(dsi->mmio + reg);
+	return ioread32(dsi->mmio + dsi->info->phy_reg_offset + reg);
 }
 
 static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
 {
-	return ioread32(dsi->mmio + LINK_REG_OFFSET + reg);
+	return ioread32(dsi->mmio + dsi->info->link_reg_offset + reg);
 }
 
 /* -----------------------------------------------------------------------------
@@ -294,7 +307,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 			 mode->clock * MILLI, vclk_rate);
 	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
 
-	ret = rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
+	ret = dsi->info->dphy_init(dsi, hsfreq);
 	if (ret < 0)
 		goto err_phy;
 
@@ -337,7 +350,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	return 0;
 
 err_phy:
-	rzg2l_mipi_dsi_dphy_exit(dsi);
+	dsi->info->dphy_exit(dsi);
 	pm_runtime_put(dsi->dev);
 
 	return ret;
@@ -345,7 +358,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 
 static void rzg2l_mipi_dsi_stop(struct rzg2l_mipi_dsi *dsi)
 {
-	rzg2l_mipi_dsi_dphy_exit(dsi);
+	dsi->info->dphy_exit(dsi);
 	pm_runtime_put(dsi->dev);
 }
 
@@ -587,10 +600,12 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 				 const struct drm_display_info *info,
 				 const struct drm_display_mode *mode)
 {
-	if (mode->clock > 148500)
+	struct rzg2l_mipi_dsi *dsi = bridge_to_rzg2l_mipi_dsi(bridge);
+
+	if (mode->clock > dsi->info->max_dclk)
 		return MODE_CLOCK_HIGH;
 
-	if (mode->clock < 5803)
+	if (mode->clock < dsi->info->min_dclk)
 		return MODE_CLOCK_LOW;
 
 	return MODE_OK;
@@ -716,6 +731,8 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, dsi);
 	dsi->dev = &pdev->dev;
 
+	dsi->info = of_device_get_match_data(&pdev->dev);
+
 	ret = drm_of_get_data_lanes_count_ep(dsi->dev->of_node, 1, 0, 1, 4);
 	if (ret < 0)
 		return dev_err_probe(dsi->dev, ret,
@@ -759,13 +776,13 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	 * mode->clock and format are not available. So initialize DPHY with
 	 * timing parameters for 80Mbps.
 	 */
-	ret = rzg2l_mipi_dsi_dphy_init(dsi, 80000000);
+	ret = dsi->info->dphy_init(dsi, 80000000);
 	if (ret < 0)
 		goto err_phy;
 
 	txsetr = rzg2l_mipi_dsi_link_read(dsi, TXSETR);
 	dsi->num_data_lanes = min(((txsetr >> 16) & 3) + 1, num_data_lanes);
-	rzg2l_mipi_dsi_dphy_exit(dsi);
+	dsi->info->dphy_exit(dsi);
 	pm_runtime_put(dsi->dev);
 
 	/* Initialize the DRM bridge. */
@@ -782,7 +799,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	return 0;
 
 err_phy:
-	rzg2l_mipi_dsi_dphy_exit(dsi);
+	dsi->info->dphy_exit(dsi);
 	pm_runtime_put(dsi->dev);
 err_pm_disable:
 	pm_runtime_disable(dsi->dev);
@@ -797,8 +814,16 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
+	.dphy_init = rzg2l_mipi_dsi_dphy_init,
+	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
+	.link_reg_offset = 0x10000,
+	.max_dclk = 148500,
+	.min_dclk = 5803,
+};
+
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
-	{ .compatible = "renesas,rzg2l-mipi-dsi" },
+	{ .compatible = "renesas,rzg2l-mipi-dsi", .data = &rzg2l_mipi_dsi_info, },
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
index 1dbc16ec64a4..16efe4dc59f4 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
@@ -41,8 +41,6 @@
 #define DSIDPHYTIM3_THS_ZERO(x)		((x) << 0)
 
 /* --------------------------------------------------------*/
-/* Link Registers */
-#define LINK_REG_OFFSET			0x10000
 
 /* Link Status Register */
 #define LINKSR				0x10
-- 
2.49.0

