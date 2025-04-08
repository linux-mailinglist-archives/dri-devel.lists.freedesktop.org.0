Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E6DA8165E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 22:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBFA10E745;
	Tue,  8 Apr 2025 20:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VjRq91z9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663D410E736
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 20:09:47 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso34440595e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 13:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744142986; x=1744747786; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V/vyF0h0cqjb1PuGqRaTPFaLpMMwFEUdxndJMto08PI=;
 b=VjRq91z9/KypSLBnrk22EW//QsJ8zTYQ2GRID6gxUn8MGpfes1v7Qrs2yOMgrzOWbn
 lOQlTQFXojZreLU8bNFWDP/NlJQdc5Vj2oc6weXGDlarFD4KfcJZrwAZYaLjxaqcIFEE
 mNnYJH6GOgN0TtgDjPf04qnsdRUWqN9gMevciFj1fOeQFteTWnod2ja9EZXHMMARA/vS
 M0H3yS0St5/fWYqz9FCLsloQvUMSu1oPsZy1jUYo41m0YqD04a6TtZXJ21ucBP4suhOI
 v03f8AQNb8XAh9NbPQR2E1TskorNuuVY+R1t58SG6nrCrMQ5L/JftXQsLv2CSc2FYmtD
 qS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744142986; x=1744747786;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V/vyF0h0cqjb1PuGqRaTPFaLpMMwFEUdxndJMto08PI=;
 b=iUd+GCclO8Xuf6U4qzlSqSwx3UzUpg393/LChVWHj33XnFgSh3aotK3sbSqzXuaVqY
 BoAjekaS2KGTX9Wjp6BRrW73moww7cE85RuHRY5p1QkaQtpFxq3WXDRT/2JiwGnKo2ug
 QYe68v/iVannThBT1k+DaJRNR3PQZBUW/8r2gxDLv5Io7u+tqS6wh9aYNvjvrwGTmzsw
 sPTDd9qj8+jd+8egC/LU1RAFaoZy/DXYN2Vp2ptLIKlCPwbqBploG/BxBgky6dDX5bOX
 jMFDvxpcgJ05Zlle/lM51s1MDnXdMLTIGIt9v637THJOMHOtxU83tA/ASTdK+xxh3chO
 T7eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWodJSBdKQaGLF5EAoIMENymsZQ0MdVGq46wAJCz6XWD/tyFyevpJDKVPMUrqBD7yELPzBI96WzJq4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSYBu9GO2R4rIGvETPxFxvp/kf5bHJJG4x5avNcAAPmH8hAiMo
 n+nhRG5EgKVSMR07BnKaxRgN+pgiyuGJMJUBMUYojmgABTzoPOX0
X-Gm-Gg: ASbGncs46VL5utSNHwGc1wReSPBlQiJL6CVepIkh9zeDSOuFQZ6Kl5LTUYURszm3dr4
 Sd2ll3zawHw31CayJTrezaTWZ/rUDK5n1yLGrN0yDLj0nEFVQtjEhtJmlFG1mYLftU3pszIVYL4
 t9tzYYiKfLL/quZPxJiKnCuaVuBrwF7X4zbk2GSpCWr3PKCZSJtmrqnd9d6RBqRJjwwqep1nXWS
 NLF61Zssk+M9rzLkZSkkET1asH7O6jzPx3pg00nvcfIzaXAnxqIu8SPFtYPbliXBYs/q/Woo6v6
 n5mEfEejI2tRSHDPsA8Nvfh5OCBznDFlgiAv/sHTD629U3DbF3E1XrY/yTA5bG/0Bku3
X-Google-Smtp-Source: AGHT+IHriM/nDhfxgd8j5cyKIpIu1/DUC810j8MMeVISNh1McjCk6d3Bxj5YzM6TYv+3xTJYEJqfiA==
X-Received: by 2002:a05:600c:1c02:b0:43b:c5a3:2e1a with SMTP id
 5b1f17b1804b1-43f1ec7cc9cmr4170365e9.2.1744142985789; 
 Tue, 08 Apr 2025 13:09:45 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:469:6216:b7f8:fc55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1795782sm174892875e9.26.2025.04.08.13.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 13:09:45 -0700 (PDT)
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
Subject: [PATCH v2 15/15] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
Date: Tue,  8 Apr 2025 21:09:12 +0100
Message-ID: <20250408200916.93793-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add DSI support for Renesas RZ/V2H(P) SoC.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Dropped unused macros
- Added missing LPCLK flag to rzvv2h info
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 451 ++++++++++++++++++
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
 2 files changed, 485 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 6c6bc59eabbc..e260e2ed03c1 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2022 Renesas Electronics Corporation
  */
 #include <linux/clk.h>
+#include <linux/clk/renesas-rzv2h-dsi.h>
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -32,6 +33,9 @@
 #define RZ_MIPI_DSI_FEATURE_16BPP	BIT(1)
 #define RZ_MIPI_DSI_FEATURE_LPCLK	BIT(2)
 
+#define RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA	(80 * MEGA)
+#define RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA	(1500 * MEGA)
+
 struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
@@ -42,6 +46,7 @@ struct rzg2l_mipi_dsi_hw_info {
 			      unsigned long long *hsfreq_mhz);
 	unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
 					    unsigned long mode_freq);
+	const struct rzv2h_plldsi_div_limits *cpg_dsi_limits;
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
 	unsigned long max_dclk;
@@ -49,6 +54,11 @@ struct rzg2l_mipi_dsi_hw_info {
 	u8 features;
 };
 
+struct rzv2h_dsi_mode_calc {
+	unsigned long mode_freq;
+	unsigned long long mode_freq_hz;
+};
+
 struct rzg2l_mipi_dsi {
 	struct device *dev;
 	void __iomem *mmio;
@@ -70,6 +80,18 @@ struct rzg2l_mipi_dsi {
 	unsigned int num_data_lanes;
 	unsigned int lanes;
 	unsigned long mode_flags;
+
+	struct rzv2h_dsi_mode_calc mode_calc;
+	struct rzv2h_plldsi_parameters dsi_parameters;
+};
+
+static const struct rzv2h_plldsi_div_limits rzv2h_plldsi_div_limits = {
+	.m = { .min = 64, .max = 1023 },
+	.p = { .min = 1, .max = 4 },
+	.s = { .min = 0, .max = 5 },
+	.k = { .min = -32768, .max = 32767 },
+	.csdiv = { .min = 1, .max = 1 },
+	.fvco = { .min = 1050 * MEGA, .max = 2100 * MEGA }
 };
 
 static inline struct rzg2l_mipi_dsi *
@@ -186,6 +208,249 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
 	},
 };
 
+struct rzv2h_mipi_dsi_timings {
+	unsigned long hsfreq;
+	u16 value;
+};
+
+static const struct rzv2h_mipi_dsi_timings TCLKPRPRCTL[] = {
+	{150000000UL, 0},
+	{260000000UL, 1},
+	{370000000UL, 2},
+	{470000000UL, 3},
+	{580000000UL, 4},
+	{690000000UL, 5},
+	{790000000UL, 6},
+	{900000000UL, 7},
+	{1010000000UL, 8},
+	{1110000000UL, 9},
+	{1220000000UL, 10},
+	{1330000000UL, 11},
+	{1430000000UL, 12},
+	{1500000000UL, 13},
+};
+
+static const struct rzv2h_mipi_dsi_timings TCLKZEROCTL[] = {
+	{90000000UL, 2},
+	{110000000UL, 3},
+	{130000000UL, 4},
+	{150000000UL, 5},
+	{180000000UL, 6},
+	{210000000UL, 7},
+	{230000000UL, 8},
+	{240000000UL, 9},
+	{250000000UL, 10},
+	{270000000UL, 11},
+	{290000000UL, 12},
+	{310000000UL, 13},
+	{340000000UL, 14},
+	{360000000UL, 15},
+	{380000000UL, 16},
+	{410000000UL, 17},
+	{430000000UL, 18},
+	{450000000UL, 19},
+	{470000000UL, 20},
+	{500000000UL, 21},
+	{520000000UL, 22},
+	{540000000UL, 23},
+	{570000000UL, 24},
+	{590000000UL, 25},
+	{610000000UL, 26},
+	{630000000UL, 27},
+	{660000000UL, 28},
+	{680000000UL, 29},
+	{700000000UL, 30},
+	{730000000UL, 31},
+	{750000000UL, 32},
+	{770000000UL, 33},
+	{790000000UL, 34},
+	{820000000UL, 35},
+	{840000000UL, 36},
+	{860000000UL, 37},
+	{890000000UL, 38},
+	{910000000UL, 39},
+	{930000000UL, 40},
+	{950000000UL, 41},
+	{980000000UL, 42},
+	{1000000000UL, 43},
+	{1020000000UL, 44},
+	{1050000000UL, 45},
+	{1070000000UL, 46},
+	{1090000000UL, 47},
+	{1110000000UL, 48},
+	{1140000000UL, 49},
+	{1160000000UL, 50},
+	{1180000000UL, 51},
+	{1210000000UL, 52},
+	{1230000000UL, 53},
+	{1250000000UL, 54},
+	{1270000000UL, 55},
+	{1300000000UL, 56},
+	{1320000000UL, 57},
+	{1340000000UL, 58},
+	{1370000000UL, 59},
+	{1390000000UL, 60},
+	{1410000000UL, 61},
+	{1430000000UL, 62},
+	{1460000000UL, 63},
+	{1480000000UL, 64},
+	{1500000000UL, 65},
+};
+
+static const struct rzv2h_mipi_dsi_timings TCLKPOSTCTL[] = {
+	{80000000UL, 6},
+	{210000000UL, 7},
+	{340000000UL, 8},
+	{480000000UL, 9},
+	{610000000UL, 10},
+	{740000000UL, 11},
+	{880000000UL, 12},
+	{1010000000UL, 13},
+	{1140000000UL, 14},
+	{1280000000UL, 15},
+	{1410000000UL, 16},
+	{1500000000UL, 17},
+};
+
+static const struct rzv2h_mipi_dsi_timings TCLKTRAILCTL[] = {
+	{140000000UL, 1},
+	{250000000UL, 2},
+	{370000000UL, 3},
+	{480000000UL, 4},
+	{590000000UL, 5},
+	{710000000UL, 6},
+	{820000000UL, 7},
+	{940000000UL, 8},
+	{1050000000UL, 9},
+	{1170000000UL, 10},
+	{1280000000UL, 11},
+	{1390000000UL, 12},
+	{1500000000UL, 13},
+};
+
+static const struct rzv2h_mipi_dsi_timings THSPRPRCTL[] = {
+	{110000000UL, 0},
+	{190000000UL, 1},
+	{290000000UL, 2},
+	{400000000UL, 3},
+	{500000000UL, 4},
+	{610000000UL, 5},
+	{720000000UL, 6},
+	{820000000UL, 7},
+	{930000000UL, 8},
+	{1030000000UL, 9},
+	{1140000000UL, 10},
+	{1250000000UL, 11},
+	{1350000000UL, 12},
+	{1460000000UL, 13},
+	{1500000000UL, 14},
+};
+
+static const struct rzv2h_mipi_dsi_timings THSZEROCTL[] = {
+	{180000000UL, 0},
+	{240000000UL, 1},
+	{290000000UL, 2},
+	{350000000UL, 3},
+	{400000000UL, 4},
+	{460000000UL, 5},
+	{510000000UL, 6},
+	{570000000UL, 7},
+	{620000000UL, 8},
+	{680000000UL, 9},
+	{730000000UL, 10},
+	{790000000UL, 11},
+	{840000000UL, 12},
+	{900000000UL, 13},
+	{950000000UL, 14},
+	{1010000000UL, 15},
+	{1060000000UL, 16},
+	{1120000000UL, 17},
+	{1170000000UL, 18},
+	{1230000000UL, 19},
+	{1280000000UL, 20},
+	{1340000000UL, 21},
+	{1390000000UL, 22},
+	{1450000000UL, 23},
+	{1500000000UL, 24},
+};
+
+static const struct rzv2h_mipi_dsi_timings THSTRAILCTL[] = {
+	{100000000UL, 3},
+	{210000000UL, 4},
+	{320000000UL, 5},
+	{420000000UL, 6},
+	{530000000UL, 7},
+	{640000000UL, 8},
+	{750000000UL, 9},
+	{850000000UL, 10},
+	{960000000UL, 11},
+	{1070000000UL, 12},
+	{1180000000UL, 13},
+	{1280000000UL, 14},
+	{1390000000UL, 15},
+	{1500000000UL, 16},
+};
+
+static const struct rzv2h_mipi_dsi_timings TLPXCTL[] = {
+	{130000000UL, 0},
+	{260000000UL, 1},
+	{390000000UL, 2},
+	{530000000UL, 3},
+	{660000000UL, 4},
+	{790000000UL, 5},
+	{930000000UL, 6},
+	{1060000000UL, 7},
+	{1190000000UL, 8},
+	{1330000000UL, 9},
+	{1460000000UL, 10},
+	{1500000000UL, 11},
+};
+
+static const struct rzv2h_mipi_dsi_timings THSEXITCTL[] = {
+	{150000000UL, 1},
+	{230000000UL, 2},
+	{310000000UL, 3},
+	{390000000UL, 4},
+	{470000000UL, 5},
+	{550000000UL, 6},
+	{630000000UL, 7},
+	{710000000UL, 8},
+	{790000000UL, 9},
+	{870000000UL, 10},
+	{950000000UL, 11},
+	{1030000000UL, 12},
+	{1110000000UL, 13},
+	{1190000000UL, 14},
+	{1270000000UL, 15},
+	{1350000000UL, 16},
+	{1430000000UL, 17},
+	{1500000000UL, 18},
+};
+
+static const struct rzv2h_mipi_dsi_timings ULPSEXIT[] = {
+	{1953125UL, 49},
+	{3906250UL, 98},
+	{7812500UL, 195},
+	{15625000UL, 391},
+};
+
+static int rzv2h_dphy_find_timings_val(unsigned long freq,
+				       const struct rzv2h_mipi_dsi_timings timings[],
+				       unsigned int size)
+{
+	unsigned int i;
+
+	for (i = 0; i < size; i++) {
+		if (freq <= timings[i].hsfreq)
+			break;
+	}
+
+	if (i == size)
+		i -= 1;
+
+	return timings[i].value;
+};
+
 static void rzg2l_mipi_dsi_phy_write(struct rzg2l_mipi_dsi *dsi, u32 reg, u32 data)
 {
 	iowrite32(data, dsi->mmio + dsi->info->phy_reg_offset + reg);
@@ -307,6 +572,168 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
 	return 0;
 }
 
+static unsigned int rzv2h_dphy_mode_clk_check(struct rzg2l_mipi_dsi *dsi,
+					      unsigned long mode_freq)
+{
+	struct rzv2h_plldsi_parameters *dsi_parameters = &dsi->dsi_parameters;
+	unsigned long long hsfreq_mhz, mode_freq_hz, mode_freq_mhz;
+	struct rzv2h_plldsi_parameters cpg_dsi_parameters;
+	unsigned int bpp, i;
+
+	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
+
+	for (i = 0; i < 10; i += 1) {
+		unsigned long hsfreq;
+		bool parameters_found;
+
+		mode_freq_hz = mode_freq * KILO + i;
+		mode_freq_mhz = mode_freq_hz * KILO * 1ULL;
+		parameters_found = rzv2h_dsi_get_pll_parameters_values(dsi->info->cpg_dsi_limits,
+								       &cpg_dsi_parameters,
+								       mode_freq_mhz);
+		if (!parameters_found)
+			continue;
+
+		hsfreq_mhz = DIV_ROUND_CLOSEST_ULL(cpg_dsi_parameters.freq_mhz * bpp, dsi->lanes);
+		parameters_found = rzv2h_dsi_get_pll_parameters_values(&rzv2h_plldsi_div_limits,
+								       dsi_parameters,
+								       hsfreq_mhz);
+		if (!parameters_found)
+			continue;
+
+		if (abs(dsi_parameters->error_mhz) >= 500)
+			continue;
+
+		hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_mhz, KILO);
+		if (hsfreq >= RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA &&
+		    hsfreq <= RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA) {
+			dsi->mode_calc.mode_freq_hz = mode_freq_hz;
+			dsi->mode_calc.mode_freq = mode_freq;
+			return MODE_OK;
+		}
+	}
+
+	return MODE_CLOCK_RANGE;
+}
+
+static int rzv2h_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_freq,
+				unsigned long long *hsfreq_mhz)
+{
+	struct rzv2h_plldsi_parameters *dsi_parameters = &dsi->dsi_parameters;
+	unsigned long status;
+
+	if (dsi->mode_calc.mode_freq != mode_freq) {
+		status = rzv2h_dphy_mode_clk_check(dsi, mode_freq);
+		if (status != MODE_OK) {
+			dev_err(dsi->dev, "No PLL parameters found for mode clk %lu\n",
+				mode_freq);
+			return -EINVAL;
+		}
+	}
+
+	clk_set_rate(dsi->vclk, dsi->mode_calc.mode_freq_hz);
+	*hsfreq_mhz = dsi_parameters->freq_mhz;
+
+	return 0;
+}
+
+static int rzv2h_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
+				    unsigned long long hsfreq_mhz)
+{
+	struct rzv2h_plldsi_parameters *dsi_parameters = &dsi->dsi_parameters;
+	unsigned long lpclk_rate = clk_get_rate(dsi->lpclk);
+	u32 phytclksetr, phythssetr, phytlpxsetr, phycr;
+	struct rzg2l_mipi_dsi_timings dphy_timings;
+	unsigned long long hsfreq;
+	u32 ulpsexit;
+
+	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_mhz, KILO);
+
+	if (dsi_parameters->freq_mhz == hsfreq_mhz)
+		goto parameters_found;
+
+	if (rzv2h_dsi_get_pll_parameters_values(&rzv2h_plldsi_div_limits,
+						dsi_parameters, hsfreq_mhz))
+		goto parameters_found;
+
+	dev_err(dsi->dev, "No PLL parameters found for HSFREQ %lluHz\n", hsfreq);
+	return -EINVAL;
+
+parameters_found:
+	dphy_timings.tclk_trail =
+		rzv2h_dphy_find_timings_val(hsfreq, TCLKTRAILCTL,
+					    ARRAY_SIZE(TCLKTRAILCTL));
+	dphy_timings.tclk_post =
+		rzv2h_dphy_find_timings_val(hsfreq, TCLKPOSTCTL,
+					    ARRAY_SIZE(TCLKPOSTCTL));
+	dphy_timings.tclk_zero =
+		rzv2h_dphy_find_timings_val(hsfreq, TCLKZEROCTL,
+					    ARRAY_SIZE(TCLKZEROCTL));
+	dphy_timings.tclk_prepare =
+		rzv2h_dphy_find_timings_val(hsfreq, TCLKPRPRCTL,
+					    ARRAY_SIZE(TCLKPRPRCTL));
+	dphy_timings.ths_exit =
+		rzv2h_dphy_find_timings_val(hsfreq, THSEXITCTL,
+					    ARRAY_SIZE(THSEXITCTL));
+	dphy_timings.ths_trail =
+		rzv2h_dphy_find_timings_val(hsfreq, THSTRAILCTL,
+					    ARRAY_SIZE(THSTRAILCTL));
+	dphy_timings.ths_zero =
+		rzv2h_dphy_find_timings_val(hsfreq, THSZEROCTL,
+					    ARRAY_SIZE(THSZEROCTL));
+	dphy_timings.ths_prepare =
+		rzv2h_dphy_find_timings_val(hsfreq, THSPRPRCTL,
+					    ARRAY_SIZE(THSPRPRCTL));
+	dphy_timings.tlpx =
+		rzv2h_dphy_find_timings_val(hsfreq, TLPXCTL,
+					    ARRAY_SIZE(TLPXCTL));
+	ulpsexit =
+		rzv2h_dphy_find_timings_val(lpclk_rate, ULPSEXIT,
+					    ARRAY_SIZE(ULPSEXIT));
+
+	phytclksetr = PHYTCLKSETR_TCLKTRAILCTL(dphy_timings.tclk_trail) |
+		      PHYTCLKSETR_TCLKPOSTCTL(dphy_timings.tclk_post) |
+		      PHYTCLKSETR_TCLKZEROCTL(dphy_timings.tclk_zero) |
+		      PHYTCLKSETR_TCLKPRPRCTL(dphy_timings.tclk_prepare);
+	phythssetr = PHYTHSSETR_THSEXITCTL(dphy_timings.ths_exit) |
+		     PHYTHSSETR_THSTRAILCTL(dphy_timings.ths_trail) |
+		     PHYTHSSETR_THSZEROCTL(dphy_timings.ths_zero) |
+		     PHYTHSSETR_THSPRPRCTL(dphy_timings.ths_prepare);
+	phytlpxsetr = rzg2l_mipi_dsi_phy_read(dsi, PHYTLPXSETR) & ~GENMASK(7, 0);
+	phytlpxsetr |= PHYTLPXSETR_TLPXCTL(dphy_timings.tlpx);
+	phycr = rzg2l_mipi_dsi_phy_read(dsi, PHYCR) & ~GENMASK(9, 0);
+	phycr |= PHYCR_ULPSEXIT(ulpsexit);
+
+	/* Setting all D-PHY Timings Registers */
+	rzg2l_mipi_dsi_phy_write(dsi, PHYTCLKSETR, phytclksetr);
+	rzg2l_mipi_dsi_phy_write(dsi, PHYTHSSETR, phythssetr);
+	rzg2l_mipi_dsi_phy_write(dsi, PHYTLPXSETR, phytlpxsetr);
+	rzg2l_mipi_dsi_phy_write(dsi, PHYCR, phycr);
+
+	rzg2l_mipi_dsi_phy_write(dsi, PLLCLKSET0R,
+				 PLLCLKSET0R_PLL_S(dsi_parameters->s) |
+				 PLLCLKSET0R_PLL_P(dsi_parameters->p) |
+				 PLLCLKSET0R_PLL_M(dsi_parameters->m));
+	rzg2l_mipi_dsi_phy_write(dsi, PLLCLKSET1R, PLLCLKSET1R_PLL_K(dsi_parameters->k));
+	udelay(20);
+
+	rzg2l_mipi_dsi_phy_write(dsi, PLLENR, PLLENR_PLLEN);
+	udelay(500);
+
+	return 0;
+}
+
+static void rzv2h_mipi_dsi_dphy_late_init(struct rzg2l_mipi_dsi *dsi)
+{
+	udelay(220);
+	rzg2l_mipi_dsi_phy_write(dsi, PHYRSTR, PHYRSTR_PHYMRSTN);
+}
+
+static void rzv2h_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
+{
+	rzg2l_mipi_dsi_phy_write(dsi, PLLENR, 0);
+}
+
 static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 				  const struct drm_display_mode *mode)
 {
@@ -409,6 +836,9 @@ static void rzg2l_mipi_dsi_set_display_timing(struct rzg2l_mipi_dsi *dsi,
 	case 18:
 		vich1ppsetr = VICH1PPSETR_DT_RGB18;
 		break;
+	case 16:
+		vich1ppsetr = VICH1PPSETR_DT_RGB16;
+		break;
 	}
 
 	if ((dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) &&
@@ -439,6 +869,9 @@ static void rzg2l_mipi_dsi_set_display_timing(struct rzg2l_mipi_dsi *dsi,
 	rzg2l_mipi_dsi_link_write(dsi, VICH1HSSETR, vich1hssetr);
 	rzg2l_mipi_dsi_link_write(dsi, VICH1HPSETR, vich1hpsetr);
 
+	if (dsi->info->dphy_late_init)
+		dsi->info->dphy_late_init(dsi);
+
 	/*
 	 * Configuration for Delay Value
 	 * Delay value based on 2 ranges of video clock.
@@ -867,6 +1300,23 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+RZV2H_CPG_PLL_DSI_LIMITS(rzv2h_cpg_pll_dsi_limits);
+
+static const struct rzg2l_mipi_dsi_hw_info rzv2h_mipi_dsi_info = {
+	.dphy_init = rzv2h_mipi_dsi_dphy_init,
+	.dphy_late_init = rzv2h_mipi_dsi_dphy_late_init,
+	.dphy_exit = rzv2h_mipi_dsi_dphy_exit,
+	.dphy_mode_clk_check = rzv2h_dphy_mode_clk_check,
+	.dphy_conf_clks = rzv2h_dphy_conf_clks,
+	.cpg_dsi_limits = &rzv2h_cpg_pll_dsi_limits,
+	.phy_reg_offset = 0x10000,
+	.link_reg_offset = 0,
+	.max_dclk = 187500,
+	.min_dclk = 5440,
+	.features = RZ_MIPI_DSI_FEATURE_16BPP |
+		    RZ_MIPI_DSI_FEATURE_LPCLK,
+};
+
 static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.dphy_init = rzg2l_mipi_dsi_dphy_init,
 	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
@@ -878,6 +1328,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 };
 
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
+	{ .compatible = "renesas,r9a09g057-mipi-dsi", .data = &rzv2h_mipi_dsi_info, },
 	{ .compatible = "renesas,rzg2l-mipi-dsi", .data = &rzg2l_mipi_dsi_info, },
 	{ /* sentinel */ }
 };
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
index 16efe4dc59f4..68165395d61c 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
@@ -40,6 +40,39 @@
 #define DSIDPHYTIM3_THS_TRAIL(x)	((x) << 8)
 #define DSIDPHYTIM3_THS_ZERO(x)		((x) << 0)
 
+/* RZ/V2H DPHY Registers */
+#define PLLENR				0x000
+#define PLLENR_PLLEN			BIT(0)
+
+#define PHYRSTR				0x004
+#define PHYRSTR_PHYMRSTN		BIT(0)
+
+#define PLLCLKSET0R			0x010
+#define PLLCLKSET0R_PLL_S(x)		((x) << 0)
+#define PLLCLKSET0R_PLL_P(x)		((x) << 8)
+#define PLLCLKSET0R_PLL_M(x)		((x) << 16)
+
+#define PLLCLKSET1R			0x014
+#define PLLCLKSET1R_PLL_K(x)		((x) << 0)
+
+#define PHYTCLKSETR			0x020
+#define PHYTCLKSETR_TCLKTRAILCTL(x)	((x) << 0)
+#define PHYTCLKSETR_TCLKPOSTCTL(x)	((x) << 8)
+#define PHYTCLKSETR_TCLKZEROCTL(x)	((x) << 16)
+#define PHYTCLKSETR_TCLKPRPRCTL(x)	((x) << 24)
+
+#define PHYTHSSETR			0x024
+#define PHYTHSSETR_THSEXITCTL(x)	((x) << 0)
+#define PHYTHSSETR_THSTRAILCTL(x)	((x) << 8)
+#define PHYTHSSETR_THSZEROCTL(x)	((x) << 16)
+#define PHYTHSSETR_THSPRPRCTL(x)	((x) << 24)
+
+#define PHYTLPXSETR			0x028
+#define PHYTLPXSETR_TLPXCTL(x)		((x) << 0)
+
+#define PHYCR				0x030
+#define PHYCR_ULPSEXIT(x)		((x) << 0)
+
 /* --------------------------------------------------------*/
 
 /* Link Status Register */
@@ -116,6 +149,7 @@
 
 /* Video-Input Channel 1 Pixel Packet Set Register */
 #define VICH1PPSETR			0x420
+#define VICH1PPSETR_DT_RGB16		(0x0e << 16)
 #define VICH1PPSETR_DT_RGB18		(0x1e << 16)
 #define VICH1PPSETR_DT_RGB18_LS		(0x2e << 16)
 #define VICH1PPSETR_DT_RGB24		(0x3e << 16)
-- 
2.49.0

