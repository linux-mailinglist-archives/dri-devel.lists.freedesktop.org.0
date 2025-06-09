Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 809B0AD2A0F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 00:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5E410E44F;
	Mon,  9 Jun 2025 22:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MsgFwYMB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C76E10E449
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 22:56:57 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so4664670f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 15:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749509816; x=1750114616; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iLTgFVeKSKKYj2W9StIrIT0x8Hh4XC2mzSOEWa4V88M=;
 b=MsgFwYMBVPtCpZTT9Dry0VqT6mE4M0grKWwA2VsmWjKtJWwt8wB/bv8sQ4aotsgKH9
 OVaIEzhXs+icAW2HyNre26fAidLRXex9EPACPNdwh+5SCFCBp6OQo6OP7j0Jqwq3QuDm
 bn3zEe4mcS1dKkCKoeORJCOLXhOMZjd7F2UtCbxREnDRaggUKiEQmID8MVHQsT8bvmI5
 mX9mldaJ+dfZ1jLMvsSUxrP8YMBiYaopYJBbBfvR9zwobP9kpKH4CDTc7vcDFBqSnOc6
 v7K/2MNh8qogXr1ajDuZD850E5zjyvXmWgDZUTL5YOb7tZrLqA9fjz5g7D8L3sondHrt
 8Sag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749509816; x=1750114616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iLTgFVeKSKKYj2W9StIrIT0x8Hh4XC2mzSOEWa4V88M=;
 b=NjZsqw0PvBgc/D/rxhl5mXeSabW0lmWQQXE7Q1haDLXTviUTnvQf8pXtSGpiflWtZ2
 4dPNghEIwYJvzaaVsoL8kqo6TYCGz4xERrU6eAkJtwJqAATDuVAPIVdcPVon0DhXcSI9
 ysjdV0s2no1jN6htviG2M3zJ7BcvRCDmzN9psQTj/u+gAcwkXWoDbjksT3K9jGeeQzlc
 jgMouGz9VkNkkX2tw3MO6WFCiiXI8j5h/E8WcoKgP1BqSQkMdQk1WluThHJmGu4A98Qb
 HAUw01b7zlKKBeJuKEtiZu8WfnN5I8WFi7ocunvJSWo5poDEi+xzlORvaKIFUs61ItB5
 VHTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWE4ijnzjUse7XPT50LqvE33Zdx2o5uVUWjYZptWcDBk+lFbdU2RYQU1O6sFoa9qaBja647c//gCM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTszKbGc881rwRS8hyybaVf1sqhCrGkrQqn1Ji/6RNQgqELO7W
 M8HpbmGcGV5s64JWxS1LocmBsi9sFbisqtMemJkkGLALczBjxSa4QGXL
X-Gm-Gg: ASbGnctBCtRii//9OIe0HO3fUHBWbbUYh1rpN73wPMtW3JcbhAIDxz9hxiVJ8FDSvfF
 yogB1nkeNCdMrEw+4KFtQRMBgXS4L7QVgPko2ZDslYJofY1fn/33FpzzY4dgzpe0s2M29ieWe6C
 WXqyaYHAxmPimLmXu3vGymCIsXg8xEZ+b+ua0c4gy+wMvnVaXMI7YUTeAvpIDvKOnh1eoucLpw/
 JqEVWAm05ecN3EPNUMEfmw7vEi8gFz4r+V1MAQA0rztQyj0wZUhnv2Sb58uz/B3KcO0yl7gduRw
 BdMh/4Pbd4jgHj/0eLiA3uvjBRBAVvtpFpiydwxfhM5luPjzjBjCGqM7/BoNOY3RLIQWSV8hKNg
 UmUeHPMeTJ1ts+D/Tns8=
X-Google-Smtp-Source: AGHT+IEbIMXZBlNewl8PpIEnooYc/04QMVIdOYpD6gByQL5Fbokk3IdUCKrqFmIgDkF3Q/PdDMNQjQ==
X-Received: by 2002:a05:6000:4023:b0:3a0:9dfc:da4 with SMTP id
 ffacd0b85a97d-3a531ab6dd4mr9762174f8f.42.1749509815998; 
 Mon, 09 Jun 2025 15:56:55 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5324364c9sm10824574f8f.51.2025.06.09.15.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 15:56:55 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 9/9] drm: renesas: rz-du: mipi_dsi: Add function pointers
 for configuring VCLK and mode validation
Date: Mon,  9 Jun 2025 23:56:30 +0100
Message-ID: <20250609225630.502888-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Introduce `dphy_conf_clks` and `dphy_mode_clk_check` callbacks in
`rzg2l_mipi_dsi_hw_info` to configure the VCLK and validate
supported display modes.

On the RZ/V2H(P) SoC, the DSI PLL dividers need to be as accurate as
possible. To ensure compatibility with both RZ/G2L and RZ/V2H(P) SoCs,
function pointers are introduced.

Modify `rzg2l_mipi_dsi_startup()` to use `dphy_conf_clks` for clock
configuration and `rzg2l_mipi_dsi_bridge_mode_valid()` to invoke
`dphy_mode_clk_check` for mode validation.

This change ensures proper operation across different SoC variants
by allowing fine-grained control over clock configuration and mode
validation.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
- No changes

v5->v6:
- No changes

v4->v5:
- Added Reviewed tag from Biju

v3->v4:
- Replaced KILO with MILLI

v2->v3:
- Replaced unsigned long long with u64

v1->v2:
- No changes
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 65 +++++++++++++------
 1 file changed, 45 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 12cb9f0d32fa..f87337c3cbb5 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -42,6 +42,10 @@ struct rzg2l_mipi_dsi_hw_info {
 	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
 	void (*dphy_startup_late_init)(struct rzg2l_mipi_dsi *dsi);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
+	int (*dphy_conf_clks)(struct rzg2l_mipi_dsi *dsi, unsigned long mode_freq,
+			      u64 *hsfreq_millihz);
+	unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
+					    unsigned long mode_freq);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
 	unsigned long min_dclk;
@@ -285,12 +289,39 @@ static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
 	reset_control_assert(dsi->rstc);
 }
 
+static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_freq,
+				u64 *hsfreq_millihz)
+{
+	unsigned long vclk_rate;
+	unsigned int bpp;
+
+	clk_set_rate(dsi->vclk, mode_freq * KILO);
+	vclk_rate = clk_get_rate(dsi->vclk);
+	if (vclk_rate != mode_freq * KILO)
+		dev_dbg(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
+			mode_freq * KILO, vclk_rate);
+	/*
+	 * Relationship between hsclk and vclk must follow
+	 * vclk * bpp = hsclk * 8 * lanes
+	 * where vclk: video clock (Hz)
+	 *       bpp: video pixel bit depth
+	 *       hsclk: DSI HS Byte clock frequency (Hz)
+	 *       lanes: number of data lanes
+	 *
+	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
+	 */
+	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
+	*hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(vclk_rate, bpp * MILLI),
+						dsi->lanes);
+
+	return 0;
+}
+
 static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 				  const struct drm_display_mode *mode)
 {
-	unsigned long hsfreq, vclk_rate;
+	unsigned long hsfreq;
 	u64 hsfreq_millihz;
-	unsigned int bpp;
 	u32 txsetr;
 	u32 clstptsetr;
 	u32 lptrnstsetr;
@@ -305,24 +336,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	if (ret < 0)
 		return ret;
 
-	clk_set_rate(dsi->vclk, mode->clock * KILO);
-	vclk_rate = clk_get_rate(dsi->vclk);
-	if (vclk_rate != mode->clock * KILO)
-		dev_dbg(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
-			mode->clock * KILO, vclk_rate);
-
-	/*
-	 * Relationship between hsclk and vclk must follow
-	 * vclk * bpp = hsclk * 8 * lanes
-	 * where vclk: video clock (Hz)
-	 *       bpp: video pixel bit depth
-	 *       hsclk: DSI HS Byte clock frequency (Hz)
-	 *       lanes: number of data lanes
-	 *
-	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
-	 */
-	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-	hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(vclk_rate, bpp * MILLI), dsi->lanes);
+	ret = dsi->info->dphy_conf_clks(dsi, mode->clock, &hsfreq_millihz);
+	if (ret < 0)
+		goto err_phy;
 
 	ret = dsi->info->dphy_init(dsi, hsfreq_millihz);
 	if (ret < 0)
@@ -646,6 +662,14 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->clock < dsi->info->min_dclk)
 		return MODE_CLOCK_LOW;
 
+	if (dsi->info->dphy_mode_clk_check) {
+		enum drm_mode_status status;
+
+		status = dsi->info->dphy_mode_clk_check(dsi, mode->clock);
+		if (status != MODE_OK)
+			return status;
+	}
+
 	return MODE_OK;
 }
 
@@ -1030,6 +1054,7 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
 static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.dphy_init = rzg2l_mipi_dsi_dphy_init,
 	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
+	.dphy_conf_clks = rzg2l_dphy_conf_clks,
 	.link_reg_offset = 0x10000,
 	.min_dclk = 5803,
 	.max_dclk = 148500,
-- 
2.49.0

