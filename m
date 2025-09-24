Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86376B97E46
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 02:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E1A10E686;
	Wed, 24 Sep 2025 00:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="FqOA9mLz";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Zvs0E6S5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C2110E67E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 00:30:48 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cWd6v28FWz9t6L;
 Wed, 24 Sep 2025 02:30:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758673847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Le0nX9s7KTGSA1wld5eQ1F37E1JZdy5zkSk7TiVdcQ=;
 b=FqOA9mLzbWeWpdqzXhXz4434cPVn6p1bIsIdG/c9u8zdI+St+w8BFaI414amrBvSknNSxH
 /lyr+1Hy8QzrDZU1ntx2lzyqmp/p6/n10/+3PSqBRqpP42t8gKdgp3rfYu4dGRdmW4swMY
 QR8+1h4eh4WtX3fVIbql0ABIdO2fW0IYikW+7HAr5IlC0JpgljPqV7BfSyz+kmIKjd8/oP
 oA3F2UGVjiEc8OMl3/2yWbSxWAInBHJyuWBW2GGDiXRNfcP7oALdiak2IMG9tgubWZKgoy
 T11HM4fqaIIHcDcqDIkJxcKA5eTNGRHt8VFsWv7HEnOP+CDjcPyKknaF9A0lfg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758673845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Le0nX9s7KTGSA1wld5eQ1F37E1JZdy5zkSk7TiVdcQ=;
 b=Zvs0E6S5wqu+tu28hZA80gJMyIXMieTfzZji+nlNCL0+jjOtYqqSjE7xzvyRSX1nlcvrE+
 OECcGYpyBViVdninDq+iYhfRTxhi3YPetAzGXYk4LzfLaHYBhE/bMkNj3i9+O2zfOd24FD
 qdn0YNXfNjXi4KqF//anDZvn5UT1rh6mDxslZuo7g1+YBnku5ayAYgdGiffFZu1j65NnTf
 mPKu4N5axCyCH+p31/EF3LyRgw6sDjAciKqTXLhyQ8BuS9D+coX17NprO9unwEHAkvc5B0
 WcOMKkAFWC08kGq3xIv9rM/mLCr9hYXJfu5NL+4ZlLQSKiTwOT6EdLwa+xmDYg==
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
Subject: [PATCH v2 10/10] drm/rcar-du: dsi: Convert register bitfields to
 GENMASK() macro
Date: Wed, 24 Sep 2025 02:28:27 +0200
Message-ID: <20250924003003.91039-11-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
References: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 79552a866f3f8b1291e
X-MBO-RS-META: aitxeecd5oaebchwepeaqcr3zqmr68u4
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
V2: No change
---
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   | 46 +++++------
 .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h  | 77 +++++++++----------
 2 files changed, 61 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 412bbb8b9acf2..cc186b09049cd 100644
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
index 3b0f6c5285a71..e4b3f7760458d 100644
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
@@ -180,20 +180,20 @@
 #define TXVMVPRMSET0R_BPP_24		FIELD_PREP(TXVMVPRMSET0R_BPP_MASK, 2)
 
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
@@ -228,35 +228,34 @@
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
 #define VCLKSET_BPP_16			FIELD_PREP(VCLKSET_BPP_MASK, 0)
 #define VCLKSET_BPP_18			FIELD_PREP(VCLKSET_BPP_MASK, 1)
 #define VCLKSET_BPP_18L			FIELD_PREP(VCLKSET_BPP_MASK, 2)
 #define VCLKSET_BPP_24			FIELD_PREP(VCLKSET_BPP_MASK, 3)
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
 
@@ -271,21 +270,21 @@
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

