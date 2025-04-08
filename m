Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAF2A81654
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 22:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA6D10E73E;
	Tue,  8 Apr 2025 20:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J/BmaBQX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987D110E73E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 20:09:40 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so35190765e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 13:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744142979; x=1744747779; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M7gj8lmerEPHRb8kc2ik2R/fd0hZ8rrJhiYz8lvYR4k=;
 b=J/BmaBQXCVTxLUfZvihTp3JATspcXHgiYgfPvbMMRcERTJArsTGUPB2O+rdKNm7NOv
 b6s/nvNZZOTBnJ4hD2OlSJcd5pnDXur2BNHVw2eq0qHH/hnjdT9aAffM4ngImgRlgeT5
 /znvXz5Na4GUvptqjp4djV3/t5qYxGAZuAhVYfncZOwtsaAZiEzAEnDqxChayOoy45hH
 ZIU7CF5zda86mx0a2tMCaYC9cDUdqCMjFych/j3fqxdwMhrR6qw7sE9i1x/7CHFBEMIJ
 F3DdcbA4pnIx55cztkkNjlsdUWEFAmXtgcmjnguCD4oAoothMwjDixykjtqaDdU7v/E9
 5dqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744142979; x=1744747779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M7gj8lmerEPHRb8kc2ik2R/fd0hZ8rrJhiYz8lvYR4k=;
 b=IWLG0bmY8Sbqvr8fi3o0fPc6WD9SH3vDawLi2zqUmYFQhmFv8iz33Aes8Th8QzRfQj
 AJ/r+Jvxr19aJcer+G27LTP6Bz6obdZHdCcRNVaTNUaDcJ+NR8myEUycLc0pNY4nPGQc
 57fqAwG0TildZ6RIfEpBWfIJAVwgJNQU8czKO6zyVzGrJn+YJM3VUt5ped1DRU6AcVVP
 SMyxCorZXproQv+H56YE10PkX5Xotdq6z8pmpPqqSmvFX0uOkVHciNHjF61OGw9NF4cB
 df9ZzbM1H+cF5nAFbeEBzc3ayU860cqwB7Bj+T/5rCLSXxoY4TJrsHyZuECVEOHwH0dC
 5zlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCWgqEJBmUIlmCLzr82Vc0SXae+6txtmmJgdsbJGaFYJqimd+5/oqls79JGSvT8jeuo8zItBbg2m8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfPrJz1HqjpCcYNIxwXbke+JKpYGY2xb/G4jDf9yNXVKSC5q5+
 suh1MdhhhdHkRKNqvYj2E7wK5BLBP9lNdlKRBPUrfooAEIeYDdrM
X-Gm-Gg: ASbGncscNgr6Cs5VLH6hdVoQxApjypseCAHiYjH8o4A1vCmuzjhAriwHVdtmSwm23Ug
 NXs0IesSCJ0C9qQRS18qbNNWpFb5RNgqD2dsrMDDs/S7u6g/UlquMFJVmfkZRIytWOJtqbwMMcs
 umgzWChN1JwKN4EWPyx0FNVv+xPcNn3e1XCQtAGqXMWc8jt4StAeQzJ/GqGvN1bd+a67oTg8pJ9
 SYIQEonHgSMIy07fb50KHjhPZQcT9RoBBK7KlVDjdXJds9D7UtUHgAHPh9m5Z7WOlZGeYynyoDP
 ySJqLBXYXDOBwN0NU3POwkI5CASTa/rTUcvMcq6JNF4/TDcVGEtlE4UF+E8lBk0PZ8Hxeub3Vqu
 75b8=
X-Google-Smtp-Source: AGHT+IGoluOt52CYZWLGJ5mzQE3zfVn2OZmp1tOTjiAADzwI9rqLJNa+1nkT8EWfj83Yw9Vb3b6deg==
X-Received: by 2002:a05:600c:5122:b0:43d:79:ae1b with SMTP id
 5b1f17b1804b1-43f1ecabfd8mr2993255e9.14.1744142978991; 
 Tue, 08 Apr 2025 13:09:38 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:469:6216:b7f8:fc55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1795782sm174892875e9.26.2025.04.08.13.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 13:09:38 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 10/15] drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY
 frequency calculations
Date: Tue,  8 Apr 2025 21:09:07 +0100
Message-ID: <20250408200916.93793-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Pass the HSFREQ in milli-Hz to the `dphy_init()` callback to improve
precision, especially for the RZ/V2H(P) SoC, where PLL dividers require
high accuracy.

These changes prepare the driver for upcoming RZ/V2H(P) SoC support.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No changes
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 07457a57cf3b..4a8fe52e9752 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -33,7 +33,7 @@
 struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
-	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfreq);
+	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long long hsfreq_mhz);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
@@ -203,8 +203,9 @@ static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
  */
 
 static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
-				    unsigned long hsfreq)
+				    unsigned long long hsfreq_mhz)
 {
+	unsigned long hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_mhz, KILO);
 	const struct rzg2l_mipi_dsi_timings *dphy_timings;
 	unsigned int i;
 	u32 dphyctrl0;
@@ -277,6 +278,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 				  const struct drm_display_mode *mode)
 {
 	unsigned long hsfreq, vclk_rate;
+	unsigned long long hsfreq_mhz;
 	unsigned int bpp;
 	u32 txsetr;
 	u32 clstptsetr;
@@ -305,9 +307,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 */
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
 	vclk_rate = clk_get_rate(dsi->vclk);
-	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
+	hsfreq_mhz = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp * KILO * 1ULL, dsi->lanes);
 
-	ret = dsi->info->dphy_init(dsi, hsfreq);
+	ret = dsi->info->dphy_init(dsi, hsfreq_mhz);
 	if (ret < 0)
 		goto err_phy;
 
@@ -315,6 +317,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
 	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
 
+	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_mhz, KILO);
 	/*
 	 * Global timings characteristic depends on high speed Clock Frequency
 	 * Currently MIPI DSI-IF just supports maximum FHD@60 with:
@@ -781,7 +784,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	 * mode->clock and format are not available. So initialize DPHY with
 	 * timing parameters for 80Mbps.
 	 */
-	ret = dsi->info->dphy_init(dsi, 80000000);
+	ret = dsi->info->dphy_init(dsi, 80000000ULL * KILO);
 	if (ret < 0)
 		goto err_phy;
 
-- 
2.49.0

