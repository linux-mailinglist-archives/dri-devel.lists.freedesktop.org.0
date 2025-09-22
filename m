Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAB7B92B25
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 20:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44D010E4DF;
	Mon, 22 Sep 2025 18:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Z9jvPdEO";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="f4zsr8/G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0FC10E4DF
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 18:58:43 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cVspB1Ytkz9tBF;
 Mon, 22 Sep 2025 20:58:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758567522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uwsoa3fKD1fQf9iyhGVHOv1mAJmIqFKKYg0iJU4hgGQ=;
 b=Z9jvPdEOL4eZ/gG0lV346isUtgeFvZBpX64swPXIx0aDqhTxDizecBoWDNGTL5oWzv8ahH
 iir9rEjhVMe4mbbSjZeX5hMxnukC4j7y6/FsxVj+jzoz0QXtIUw0wN9NWgmN1CM+hG4K3M
 V6z8N2dndoy/BAdJwJpwLBL9UV8+tZUhaOBwLkgK6r9jezj42cg+vY04GNvBhAk6tciukX
 GQufTexxAjshdKKfjtczpUAHKG8eZ09thUhYbXyqvnYTyXwa1vlMCbZ7zBgFJat2kSZB/e
 QZxC5XbB7wdnSI2zLjAdRH6MBgKTKNFi4pOrF0I4WWWFNuIfIhhUAyV+WQ+K8w==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758567520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uwsoa3fKD1fQf9iyhGVHOv1mAJmIqFKKYg0iJU4hgGQ=;
 b=f4zsr8/GskF0N06MIEDSamR+mimHLq4O5vOcWSz4QzMOET/nD0gOrCMqW3Qc0ahsbZIi94
 edfln0N5n24kF5Mo4/aattTNC8M8hZa1WELlx8qpddgj1GJyv59x0PIaCHerVrQLokDbJ9
 nbO+ZZDNbrH39U3lCouImi2OfiVuTz1yHaK9Qsp6x4eW35aurx8IJAWW9BTKjxZDlztJ53
 q4P9TaZRdqilDUC3aaASx7L3BX2o3+Pn1mqqHNvt2rgXT4Dnnao3Vb5AhXpIMivWeZGkM3
 kzDVbMv6HNkFP6cpQdZt+9r/hg2KUctJuNsMBLNBGHo2Ewbjrf6J0cCkjdKf/g==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH 9/9] drm/rcar-du: dsi: Convert register bitfields to GENMASK()
 macro
Date: Mon, 22 Sep 2025 20:55:05 +0200
Message-ID: <20250922185740.153759-10-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: bad47ba7d9d87d2f6b8
X-MBO-RS-META: rc83zj1idp8cmb45jnkr19muzz4dx9nw
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

Convert register bitfields to GENMASK() macro where applicable.
Use FIELD_PREP() throughout the driver.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   | 46 +++++------
 .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h  | 77 +++++++++----------
 2 files changed, 61 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index f91cc35423758..67bab7fbd9288 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -496,17 +496,17 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
 		vprmset0r |= TXVMVPRMSET0R_HSPOL_LOW;
 
-	vprmset1r = TXVMVPRMSET1R_VACTIVE(mode->vdisplay)
-		  | TXVMVPRMSET1R_VSA(mode->vsync_end - mode->vsync_start);
+	vprmset1r = FIELD_PREP(TXVMVPRMSET1R_VACTIVE_MASK, mode->vdisplay)
+		  | FIELD_PREP(TXVMVPRMSET1R_VSA_MASK, mode->vsync_end - mode->vsync_start);
 
-	vprmset2r = TXVMVPRMSET2R_VFP(mode->vsync_start - mode->vdisplay)
-		  | TXVMVPRMSET2R_VBP(mode->vtotal - mode->vsync_end);
+	vprmset2r = FIELD_PREP(TXVMVPRMSET2R_VFP_MASK, mode->vsync_start - mode->vdisplay)
+		  | FIELD_PREP(TXVMVPRMSET2R_VBP_MASK, mode->vtotal - mode->vsync_end);
 
-	vprmset3r = TXVMVPRMSET3R_HACTIVE(mode->hdisplay)
-		  | TXVMVPRMSET3R_HSA(mode->hsync_end - mode->hsync_start);
+	vprmset3r = FIELD_PREP(TXVMVPRMSET3R_HACTIVE_MASK, mode->hdisplay)
+		  | FIELD_PREP(TXVMVPRMSET3R_HSA_MASK, mode->hsync_end - mode->hsync_start);
 
-	vprmset4r = TXVMVPRMSET4R_HFP(mode->hsync_start - mode->hdisplay)
-		  | TXVMVPRMSET4R_HBP(mode->htotal - mode->hsync_end);
+	vprmset4r = FIELD_PREP(TXVMVPRMSET4R_HFP_MASK, mode->hsync_start - mode->hdisplay)
+		  | FIELD_PREP(TXVMVPRMSET4R_HBP_MASK, mode->htotal - mode->hsync_end);
 
 	rcar_mipi_dsi_write(dsi, TXVMVPRMSET0R, vprmset0r);
 	rcar_mipi_dsi_write(dsi, TXVMVPRMSET1R, vprmset1r);
@@ -553,7 +553,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 	/* PHY setting */
 	phy_setup = rcar_mipi_dsi_read(dsi, PHYSETUP);
 	phy_setup &= ~PHYSETUP_HSFREQRANGE_MASK;
-	phy_setup |= PHYSETUP_HSFREQRANGE(setup_info.hsfreqrange);
+	phy_setup |= FIELD_PREP(PHYSETUP_HSFREQRANGE_MASK, setup_info.hsfreqrange);
 	rcar_mipi_dsi_write(dsi, PHYSETUP, phy_setup);
 
 	switch (dsi->info->model) {
@@ -576,13 +576,13 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 	rcar_mipi_dsi_set(dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
 	rcar_mipi_dsi_clr(dsi, CLOCKSET1, CLOCKSET1_SHADOW_CLEAR);
 
-	clockset2 = CLOCKSET2_M(setup_info.m - dsi->info->clockset2_m_offset)
-		  | CLOCKSET2_N(setup_info.n - 1)
-		  | CLOCKSET2_VCO_CNTRL(setup_info.clkset->vco_cntrl);
-	clockset3 = CLOCKSET3_PROP_CNTRL(setup_info.clkset->prop_cntrl)
-		  | CLOCKSET3_INT_CNTRL(setup_info.clkset->int_cntrl)
-		  | CLOCKSET3_CPBIAS_CNTRL(setup_info.clkset->cpbias_cntrl)
-		  | CLOCKSET3_GMP_CNTRL(setup_info.clkset->gmp_cntrl);
+	clockset2 = FIELD_PREP(CLOCKSET2_M_MASK, setup_info.m - dsi->info->clockset2_m_offset)
+		  | FIELD_PREP(CLOCKSET2_N_MASK, setup_info.n - 1)
+		  | FIELD_PREP(CLOCKSET2_VCO_CNTRL_MASK, setup_info.clkset->vco_cntrl);
+	clockset3 = FIELD_PREP(CLOCKSET3_PROP_CNTRL_MASK, setup_info.clkset->prop_cntrl)
+		  | FIELD_PREP(CLOCKSET3_INT_CNTRL_MASK, setup_info.clkset->int_cntrl)
+		  | FIELD_PREP(CLOCKSET3_CPBIAS_CNTRL_MASK, setup_info.clkset->cpbias_cntrl)
+		  | FIELD_PREP(CLOCKSET3_GMP_CNTRL_MASK, setup_info.clkset->gmp_cntrl);
 	rcar_mipi_dsi_write(dsi, CLOCKSET2, clockset2);
 	rcar_mipi_dsi_write(dsi, CLOCKSET3, clockset3);
 
@@ -647,16 +647,16 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 		return -EINVAL;
 	}
 
-	vclkset |= VCLKSET_LANE(dsi->lanes - 1);
+	vclkset |= FIELD_PREP(VCLKSET_LANE_MASK, dsi->lanes - 1);
 
 	switch (dsi->info->model) {
 	case RCAR_DSI_V3U:
 	default:
-		vclkset |= VCLKSET_DIV_V3U(__ffs(setup_info.vclk_divider));
+		vclkset |= FIELD_PREP(VCLKSET_DIV_V3U_MASK, __ffs(setup_info.vclk_divider));
 		break;
 
 	case RCAR_DSI_V4H:
-		vclkset |= VCLKSET_DIV_V4H(__ffs(setup_info.vclk_divider) - 1);
+		vclkset |= FIELD_PREP(VCLKSET_DIV_V4H_MASK, __ffs(setup_info.vclk_divider) - 1);
 		break;
 	}
 
@@ -988,10 +988,10 @@ static ssize_t rcar_mipi_dsi_host_tx_transfer(struct mipi_dsi_host *host,
 	 */
 	rcar_mipi_dsi_write(dsi, TXCMPHDR,
 			    (is_tx_long ? TXCMPHDR_FMT : 0) |
-			    TXCMPHDR_VC(msg->channel) |
-			    TXCMPHDR_DT(msg->type) |
-			    TXCMPHDR_DATA1(packet.header[2]) |
-			    TXCMPHDR_DATA0(packet.header[1]));
+			    FIELD_PREP(TXCMPHDR_VC_MASK, msg->channel) |
+			    FIELD_PREP(TXCMPHDR_DT_MASK, msg->type) |
+			    FIELD_PREP(TXCMPHDR_DATA1_MASK, packet.header[2]) |
+			    FIELD_PREP(TXCMPHDR_DATA0_MASK, packet.header[1]));
 
 	if (is_tx_long) {
 		memcpy(payload, packet.payload,
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index 29c806cae3557..c605e7a964dd7 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -40,18 +40,18 @@
 #define TXCMADDRSET0R			0x140
 #define TXCMPHDR			0x150
 #define TXCMPHDR_FMT			BIT(24)	/* 0:SP 1:LP */
-#define TXCMPHDR_VC(n)			(((n) & 0x3) << 22)
-#define TXCMPHDR_DT(n)			(((n) & 0x3f) << 16)
-#define TXCMPHDR_DATA1(n)		(((n) & 0xff) << 8)
-#define TXCMPHDR_DATA0(n)		(((n) & 0xff) << 0)
+#define TXCMPHDR_VC_MASK		GENMASK(23, 22)
+#define TXCMPHDR_DT_MASK		GENMASK(21, 16)
+#define TXCMPHDR_DATA1_MASK		GENMASK(15, 8)
+#define TXCMPHDR_DATA0_MASK		GENMASK(7, 0)
 #define TXCMPPD0R			0x160
 #define TXCMPPD1R			0x164
 #define TXCMPPD2R			0x168
 #define TXCMPPD3R			0x16c
 
 #define RXSETR				0x200
-#define RXSETR_CRCEN(n)			(((n) & 0xf) << 24)
-#define RXSETR_ECCEN(n)			(((n) & 0xf) << 16)
+#define RXSETR_CRCEN_MASK		GENMASK(27, 24)
+#define RXSETR_ECCEN_MASK		GENMASK(19, 16)
 #define RXPSETR				0x210
 #define RXPSETR_LPPDACC			BIT(0)
 #define RXPSR				0x220
@@ -107,21 +107,21 @@
 #define RXPIER_BTAREQEND		BIT(0)
 #define RXPADDRSET0R			0x230
 #define RXPSIZESETR			0x238
-#define RXPSIZESETR_SIZE(n)		(((n) & 0xf) << 3)
+#define RXPSIZESETR_SIZE_MASK		GENMASK(6, 3)
 #define RXPHDR				0x240
 #define RXPHDR_FMT			BIT(24)	/* 0:SP 1:LP */
-#define RXPHDR_VC(n)			(((n) & 0x3) << 22)
-#define RXPHDR_DT(n)			(((n) & 0x3f) << 16)
-#define RXPHDR_DATA1(n)			(((n) & 0xff) << 8)
-#define RXPHDR_DATA0(n)			(((n) & 0xff) << 0)
+#define RXPHDR_VC_MASK			GENMASK(23, 22)
+#define RXPHDR_DT_MASK			GENMASK(21, 16)
+#define RXPHDR_DATA1_MASK		GENMASK(15, 8)
+#define RXPHDR_DATA0_MASK		GENMASK(7, 0)
 #define RXPPD0R				0x250
 #define RXPPD1R				0x254
 #define RXPPD2R				0x258
 #define RXPPD3R				0x25c
 #define AKEPR				0x300
-#define AKEPR_VC(n)			(((n) & 0x3) << 22)
-#define AKEPR_DT(n)			(((n) & 0x3f) << 16)
-#define AKEPR_ERRRPT(n)			(((n) & 0xffff) << 0)
+#define AKEPR_VC_MASK			GENMASK(23, 22)
+#define AKEPR_DT_MASK			GENMASK(21, 16)
+#define AKEPR_ERRRPT_MASK		GENMASK(15, 0)
 #define RXRESPTOSETR			0x400
 #define TACR				0x500
 #define TASR				0x510
@@ -179,20 +179,20 @@
 #define TXVMVPRMSET0R_BPP_24		2
 
 #define TXVMVPRMSET1R			0x1d4
-#define TXVMVPRMSET1R_VACTIVE(x)	(((x) & 0x7fff) << 16)
-#define TXVMVPRMSET1R_VSA(x)		(((x) & 0xfff) << 0)
+#define TXVMVPRMSET1R_VACTIVE_MASK	GENMASK(30, 16)
+#define TXVMVPRMSET1R_VSA_MASK		GENMASK(11, 0)
 
 #define TXVMVPRMSET2R			0x1d8
-#define TXVMVPRMSET2R_VFP(x)		(((x) & 0x1fff) << 16)
-#define TXVMVPRMSET2R_VBP(x)		(((x) & 0x1fff) << 0)
+#define TXVMVPRMSET2R_VFP_MASK		GENMASK(28, 16)
+#define TXVMVPRMSET2R_VBP_MASK		GENMASK(12, 0)
 
 #define TXVMVPRMSET3R			0x1dc
-#define TXVMVPRMSET3R_HACTIVE(x)	(((x) & 0x7fff) << 16)
-#define TXVMVPRMSET3R_HSA(x)		(((x) & 0xfff) << 0)
+#define TXVMVPRMSET3R_HACTIVE_MASK	GENMASK(30, 16)
+#define TXVMVPRMSET3R_HSA_MASK		GENMASK(11, 0)
 
 #define TXVMVPRMSET4R			0x1e0
-#define TXVMVPRMSET4R_HFP(x)		(((x) & 0x1fff) << 16)
-#define TXVMVPRMSET4R_HBP(x)		(((x) & 0x1fff) << 0)
+#define TXVMVPRMSET4R_HFP_MASK		GENMASK(28, 16)
+#define TXVMVPRMSET4R_HBP_MASK		GENMASK(12, 0)
 
 /*
  * PHY-Protocol Interface (PPI) Registers
@@ -227,35 +227,34 @@
  */
 #define LPCLKSET			0x1000
 #define LPCLKSET_CKEN			BIT(8)
-#define LPCLKSET_LPCLKDIV(x)		(((x) & 0x3f) << 0)
+#define LPCLKSET_LPCLKDIV_MASK		GENMASK(5, 0)
 
 #define CFGCLKSET			0x1004
 #define CFGCLKSET_CKEN			BIT(8)
-#define CFGCLKSET_CFGCLKDIV(x)		(((x) & 0x3f) << 0)
+#define CFGCLKSET_CFGCLKDIV_MASK	GENMASK(5, 0)
 
 #define DOTCLKDIV			0x1008
 #define DOTCLKDIV_CKEN			BIT(8)
-#define DOTCLKDIV_DOTCLKDIV(x)		(((x) & 0x3f) << 0)
+#define DOTCLKDIV_DOTCLKDIV_MASK	GENMASK(5, 0)
 
 #define VCLKSET				0x100c
 #define VCLKSET_CKEN			BIT(16)
 #define VCLKSET_COLOR_YCC		BIT(8) /* 0:RGB 1:YCbCr */
-#define VCLKSET_DIV_V3U(x)		(((x) & 0x3) << 4)
-#define VCLKSET_DIV_V4H(x)		(((x) & 0x7) << 4)
+#define VCLKSET_DIV_V3U_MASK		GENMASK(5, 4)
+#define VCLKSET_DIV_V4H_MASK		GENMASK(6, 4)
 #define VCLKSET_BPP_MASK		GENMASK(3, 2)
 #define VCLKSET_BPP_16			0
 #define VCLKSET_BPP_18			1
 #define VCLKSET_BPP_18L			2
 #define VCLKSET_BPP_24			3
-#define VCLKSET_LANE(x)			(((x) & 0x3) << 0)
+#define VCLKSET_LANE_MASK		GENMASK(1, 0)
 
 #define VCLKEN				0x1010
 #define VCLKEN_CKEN			BIT(0)
 
 #define PHYSETUP			0x1014
-#define PHYSETUP_HSFREQRANGE(x)		(((x) & 0x7f) << 16)
 #define PHYSETUP_HSFREQRANGE_MASK	GENMASK(22, 16)
-#define PHYSETUP_CFGCLKFREQRANGE(x)	(((x) & 0x3f) << 8)
+#define PHYSETUP_CFGCLKFREQRANGE_MASK	GENMASK(13, 8)
 #define PHYSETUP_SHUTDOWNZ		BIT(1)
 #define PHYSETUP_RSTZ			BIT(0)
 
@@ -270,21 +269,21 @@
 #define CLOCKSET1_UPDATEPLL		BIT(0)
 
 #define CLOCKSET2			0x1020
-#define CLOCKSET2_M(x)			(((x) & 0xfff) << 16)
-#define CLOCKSET2_VCO_CNTRL(x)		(((x) & 0x3f) << 8)
-#define CLOCKSET2_N(x)			(((x) & 0xf) << 0)
+#define CLOCKSET2_M_MASK		GENMASK(27, 16)
+#define CLOCKSET2_VCO_CNTRL_MASK	GENMASK(13, 8)
+#define CLOCKSET2_N_MASK		GENMASK(3, 0)
 
 #define CLOCKSET3			0x1024
-#define CLOCKSET3_PROP_CNTRL(x)		(((x) & 0x3f) << 24)
-#define CLOCKSET3_INT_CNTRL(x)		(((x) & 0x3f) << 16)
-#define CLOCKSET3_CPBIAS_CNTRL(x)	(((x) & 0x7f) << 8)
-#define CLOCKSET3_GMP_CNTRL(x)		(((x) & 0x3) << 0)
+#define CLOCKSET3_PROP_CNTRL_MASK	GENMASK(29, 24)
+#define CLOCKSET3_INT_CNTRL_MASK	GENMASK(21, 16)
+#define CLOCKSET3_CPBIAS_CNTRL_MASK	GENMASK(14, 8)
+#define CLOCKSET3_GMP_CNTRL_MASK	GENMASK(1, 0)
 
 #define PHTW				0x1034
 #define PHTW_DWEN			BIT(24)
-#define PHTW_TESTDIN_DATA(x)		(((x) & 0xff) << 16)
+#define PHTW_TESTDIN_DATA_MASK		GENMASK(23, 16)
 #define PHTW_CWEN			BIT(8)
-#define PHTW_TESTDIN_CODE(x)		(((x) & 0xff) << 0)
+#define PHTW_TESTDIN_CODE_MASK		GENMASK(15, 0)
 
 #define PHTR				0x1038
 #define PHTR_TEST			BIT(16)
-- 
2.51.0

