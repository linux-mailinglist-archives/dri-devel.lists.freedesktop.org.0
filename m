Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3091BCF8F2
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3524410E314;
	Sat, 11 Oct 2025 17:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="qknFBvHm";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="iARN/8+N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93EA610E318
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:03:25 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ckVLN33TQz9skc;
 Sat, 11 Oct 2025 19:03:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G5/7Lt+eNMZQ+TGwwFETdn83sCmAOjop8aki964TaUc=;
 b=qknFBvHmJgz6b5Aer3Bk6XWF7PFgAGODUhithYwwRL4aoum67M7NZENKN/x0ML2mM2XSNb
 sWfyRZvwgCPVsGF8kyFLKLNshiguX2zIms4v6X6PrAwnB6jhDr5o09AtCszIR492dqeY4I
 5MzO046gqIUpEiJTgFtXYuFkKsP8z/PxF0R9xZYlEeSQOYn61/dgwf/xVERIXX89S+RfZh
 WUZxD2ZgpdkzC3APWsCT9iYKBorr7yeRWZW0LJ8Vu969QO31kNFvjJ5ldmUmVurVT5nrwV
 phE9lQQxBYvbwPwgM/Ei4TS1R7RGjOMNMf3mPQgx0Smf2TfWwvdovggmVM3ABQ==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G5/7Lt+eNMZQ+TGwwFETdn83sCmAOjop8aki964TaUc=;
 b=iARN/8+NTr1tb+7SIF15ATKw2f44+/GH3Dv2xDcE4M0kc1pl8oGDCcLvM1ZMbL2mJT+NZL
 3XkNj9JKmvOl8ZXEqA+yIvXotHNRUyJw2XRNwCm1yQmGEkar+n3z+ReZCdtJO2ZZEQXEEK
 XFo2uwByH9XN6j9GP3/AZ6JKmr8LeGwf62MYUd7Ok4+ha8vtrjc6bwjSiPSxY02BdOtNfK
 vhgrr6VMJGg4EVBl/sh+IaoQ4YE422tS2w2XRqN3N1kfOYwgcx4VaGK69JFx8Pb+gDp+AW
 XZZlC01ma96ZY2jgIYF2S8Bv964W2w92NZIbrkRCHvFZqolP9UtyBwo7af9wXg==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH 11/39] drm/imx: dc: fg: Parametrize register access
Date: Sat, 11 Oct 2025 18:51:26 +0200
Message-ID: <20251011170213.128907-12-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: e82f7a823f4d9d513e8
X-MBO-RS-META: 3h7y4g8eyge9xajw4q4kdnray3cfydw8
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

Pass register offset for the second half of the register area around.
This is done in preparation for i.MX95 support addition, which has the
registers at offset 0x24 instead of 0x00. No functional change so far.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 drivers/gpu/drm/imx/dc/dc-fg.c | 62 ++++++++++++++++++----------------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-fg.c b/drivers/gpu/drm/imx/dc/dc-fg.c
index 5fadd67aa911b..05e635fdb4f9c 100644
--- a/drivers/gpu/drm/imx/dc/dc-fg.c
+++ b/drivers/gpu/drm/imx/dc/dc-fg.c
@@ -49,35 +49,37 @@
 #define  ROW(x)			FIELD_PREP(GENMASK(29, 16), (x))
 #define  COL(x)			FIELD_PREP(GENMASK(13, 0), (x))
 
-#define PACFG			0x54
-#define SACFG			0x58
+#define OFFSET_MX8QXP		0x00
+
+#define PACFG(o)		(0x54 + (o))
+#define SACFG(o)		(0x58 + (o))
 #define  STARTY(x)		FIELD_PREP(GENMASK(29, 16), ((x) + 1))
 #define  STARTX(x)		FIELD_PREP(GENMASK(13, 0), ((x) + 1))
 
-#define FGINCTRL		0x5c
-#define FGINCTRLPANIC		0x60
+#define FGINCTRL(o)		(0x5c + (o))
+#define FGINCTRLPANIC(o)	(0x60 + (o))
 #define  FGDM_MASK		GENMASK(2, 0)
 #define  ENPRIMALPHA		BIT(3)
 #define  ENSECALPHA		BIT(4)
 
-#define FGCCR			0x64
+#define FGCCR(o)		(0x64 + (o))
 #define  CCGREEN(x)		FIELD_PREP(GENMASK(19, 10), (x))
 
-#define FGENABLE		0x68
+#define FGENABLE(o)		(0x68 + (o))
 #define  FGEN			BIT(0)
 
-#define FGSLR			0x6c
+#define FGSLR(o)		(0x6c + (o))
 #define  SHDTOKGEN		BIT(0)
 
-#define FGTIMESTAMP		0x74
+#define FGTIMESTAMP(o)		(0x74 + (o))
 #define  FRAMEINDEX(x)		FIELD_GET(GENMASK(31, 14), (x))
 #define  LINEINDEX(x)		FIELD_GET(GENMASK(13, 0), (x))
 
-#define FGCHSTAT		0x78
+#define FGCHSTAT(o)		(0x78 + (o))
 #define  SECSYNCSTAT		BIT(24)
 #define  SFIFOEMPTY		BIT(16)
 
-#define FGCHSTATCLR		0x7c
+#define FGCHSTATCLR(o)		(0x7c + (o))
 #define  CLRSECSTAT		BIT(16)
 
 enum dc_fg_syncmode {
@@ -98,15 +100,15 @@ static const struct dc_subdev_info dc_fg_info[] = {
 static const struct regmap_range dc_fg_regmap_write_ranges[] = {
 	regmap_reg_range(FGSTCTRL, VTCFG2),
 	regmap_reg_range(PKICKCONFIG, SKICKCONFIG),
-	regmap_reg_range(PACFG, FGSLR),
-	regmap_reg_range(FGCHSTATCLR, FGCHSTATCLR),
+	regmap_reg_range(PACFG(OFFSET_MX8QXP), FGSLR(OFFSET_MX8QXP)),
+	regmap_reg_range(FGCHSTATCLR(OFFSET_MX8QXP), FGCHSTATCLR(OFFSET_MX8QXP)),
 };
 
 static const struct regmap_range dc_fg_regmap_read_ranges[] = {
 	regmap_reg_range(FGSTCTRL, VTCFG2),
 	regmap_reg_range(PKICKCONFIG, SKICKCONFIG),
-	regmap_reg_range(PACFG, FGENABLE),
-	regmap_reg_range(FGTIMESTAMP, FGCHSTAT),
+	regmap_reg_range(PACFG(OFFSET_MX8QXP), FGENABLE(OFFSET_MX8QXP)),
+	regmap_reg_range(FGTIMESTAMP(OFFSET_MX8QXP), FGCHSTAT(OFFSET_MX8QXP)),
 };
 
 static const struct regmap_access_table dc_fg_regmap_write_table = {
@@ -126,7 +128,7 @@ static const struct regmap_config dc_fg_regmap_config = {
 	.fast_io = true,
 	.wr_table = &dc_fg_regmap_write_table,
 	.rd_table = &dc_fg_regmap_read_table,
-	.max_register = FGCHSTATCLR,
+	.max_register = FGCHSTATCLR(OFFSET_MX8QXP),
 };
 
 static inline void dc_fg_enable_shden(struct dc_fg *fg)
@@ -172,15 +174,15 @@ void dc_fg_cfg_videomode(struct dc_fg *fg, struct drm_display_mode *m)
 	regmap_write(fg->reg, SKICKCONFIG, COL(kick_col) | ROW(kick_row) | EN);
 
 	/* primary and secondary area position configuration */
-	regmap_write(fg->reg, PACFG, STARTX(0) | STARTY(0));
-	regmap_write(fg->reg, SACFG, STARTX(0) | STARTY(0));
+	regmap_write(fg->reg, PACFG(OFFSET_MX8QXP), STARTX(0) | STARTY(0));
+	regmap_write(fg->reg, SACFG(OFFSET_MX8QXP), STARTX(0) | STARTY(0));
 
 	/* alpha */
-	regmap_write_bits(fg->reg, FGINCTRL,      ENPRIMALPHA | ENSECALPHA, 0);
-	regmap_write_bits(fg->reg, FGINCTRLPANIC, ENPRIMALPHA | ENSECALPHA, 0);
+	regmap_write_bits(fg->reg, FGINCTRL(OFFSET_MX8QXP), ENPRIMALPHA | ENSECALPHA, 0);
+	regmap_write_bits(fg->reg, FGINCTRLPANIC(OFFSET_MX8QXP), ENPRIMALPHA | ENSECALPHA, 0);
 
 	/* constant color is green(used in panic mode)  */
-	regmap_write(fg->reg, FGCCR, CCGREEN(0x3ff));
+	regmap_write(fg->reg, FGCCR(OFFSET_MX8QXP), CCGREEN(0x3ff));
 
 	ret = clk_set_rate(fg->clk_disp, m->clock * HZ_PER_KHZ);
 	if (ret < 0)
@@ -189,34 +191,34 @@ void dc_fg_cfg_videomode(struct dc_fg *fg, struct drm_display_mode *m)
 
 static inline void dc_fg_displaymode(struct dc_fg *fg, enum dc_fg_dm mode)
 {
-	regmap_write_bits(fg->reg, FGINCTRL, FGDM_MASK, mode);
+	regmap_write_bits(fg->reg, FGINCTRL(OFFSET_MX8QXP), FGDM_MASK, mode);
 }
 
 static inline void dc_fg_panic_displaymode(struct dc_fg *fg, enum dc_fg_dm mode)
 {
-	regmap_write_bits(fg->reg, FGINCTRLPANIC, FGDM_MASK, mode);
+	regmap_write_bits(fg->reg, FGINCTRLPANIC(OFFSET_MX8QXP), FGDM_MASK, mode);
 }
 
 void dc_fg_enable(struct dc_fg *fg)
 {
-	regmap_write(fg->reg, FGENABLE, FGEN);
+	regmap_write(fg->reg, FGENABLE(OFFSET_MX8QXP), FGEN);
 }
 
 void dc_fg_disable(struct dc_fg *fg)
 {
-	regmap_write(fg->reg, FGENABLE, 0);
+	regmap_write(fg->reg, FGENABLE(OFFSET_MX8QXP), 0);
 }
 
 void dc_fg_shdtokgen(struct dc_fg *fg)
 {
-	regmap_write(fg->reg, FGSLR, SHDTOKGEN);
+	regmap_write(fg->reg, FGSLR(OFFSET_MX8QXP), SHDTOKGEN);
 }
 
 u32 dc_fg_get_frame_index(struct dc_fg *fg)
 {
 	u32 val;
 
-	regmap_read(fg->reg, FGTIMESTAMP, &val);
+	regmap_read(fg->reg, FGTIMESTAMP(OFFSET_MX8QXP), &val);
 
 	return FRAMEINDEX(val);
 }
@@ -225,7 +227,7 @@ u32 dc_fg_get_line_index(struct dc_fg *fg)
 {
 	u32 val;
 
-	regmap_read(fg->reg, FGTIMESTAMP, &val);
+	regmap_read(fg->reg, FGTIMESTAMP(OFFSET_MX8QXP), &val);
 
 	return LINEINDEX(val);
 }
@@ -249,21 +251,21 @@ bool dc_fg_secondary_requests_to_read_empty_fifo(struct dc_fg *fg)
 {
 	u32 val;
 
-	regmap_read(fg->reg, FGCHSTAT, &val);
+	regmap_read(fg->reg, FGCHSTAT(OFFSET_MX8QXP), &val);
 
 	return !!(val & SFIFOEMPTY);
 }
 
 void dc_fg_secondary_clear_channel_status(struct dc_fg *fg)
 {
-	regmap_write(fg->reg, FGCHSTATCLR, CLRSECSTAT);
+	regmap_write(fg->reg, FGCHSTATCLR(OFFSET_MX8QXP), CLRSECSTAT);
 }
 
 int dc_fg_wait_for_secondary_syncup(struct dc_fg *fg)
 {
 	unsigned int val;
 
-	return regmap_read_poll_timeout(fg->reg, FGCHSTAT, val,
+	return regmap_read_poll_timeout(fg->reg, FGCHSTAT(OFFSET_MX8QXP), val,
 					val & SECSYNCSTAT, 5, 100000);
 }
 
-- 
2.51.0

