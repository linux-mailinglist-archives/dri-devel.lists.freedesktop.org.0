Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67448B142C5
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 22:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B9810E584;
	Mon, 28 Jul 2025 20:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DW84feqz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7977F10E582
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 20:14:44 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3b78315ff04so1521954f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 13:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753733683; x=1754338483; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MkHYiD3i1SrSr7+E4oq2bvObDBoDYbUYZAVu+lvAOW4=;
 b=DW84feqzC+ChHEIUVxsSFUWXw0/InSe+ag2InI+BwM/rB03YodHIap55BeHG+XLpTU
 /i/mDhNNhnuisFjQyUq5cSVpprML8rMz3BYrJNvzA+0OnxndfkVO1iA9WToRTVpcs4OH
 +jEKGdZzIkCSDaJkiLKkdqQb0ItvOMMs+3Zsjpez9gDkKoMTYlVhnOUkEOci0B4V3IsZ
 x4L6NLna1ebqVcQthjxPm/S9HXYpRpfI4nOWaGx4HMKn/1VlLbkN7LYyX7d0Kc3uXQRM
 HWhWuRQaG6jqI0vzczCAmWSfF4Cb2J0EvOQg9h8AXuW1xuRMhn7QShJs4WG/mwG/DmSZ
 w6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753733683; x=1754338483;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MkHYiD3i1SrSr7+E4oq2bvObDBoDYbUYZAVu+lvAOW4=;
 b=lcq1gy0Cx8ZChvkeQNh8zShpcbo2piiSmEyJVg7xrNyVI/Yed2YsIQvHP3k458R676
 m3cSD6TDLdxHrrn7yy8JGSanRBwYeNHNrWtj/w5QrwezbNxH85U+/jUINUTgGebjw8Kg
 gOgpceHJpH2osDZx4yIeztqhjD3/a0oqZkIGIN2K11V8rP/aD1j1sW2vZ5HBmWlWtBbU
 6pHXJ1bjyt63BBu2BmcdUH1ljpqtZBUrQdPzpiCn+Gj9gFQypOTU50I4oKsyPuuMl0Xh
 LPGLh4uw5OGjy8elVVa17mZq5/14OGhTWUeMQ703x/iMvufRwcufxJbMxhEaHqTs9etn
 yvcA==
X-Gm-Message-State: AOJu0Yxq6203LPbl/nKAj/hMcK5gTm3zAuQqBNX3SGQrF9nAPTHKDM4A
 fNmxO9f6k5kz5wpszjpUhCH4+gwYJrVQxi/D0+Quw2j9Y1Nae19KIiuS
X-Gm-Gg: ASbGnct/zzDOXiMMPFsaTE0huvN8gZT9xmX/4BnGNZ1sNEcFxiHPkgnDxKDSrpSgCXo
 +xwPKXzN968s10k4Nlgs3wv+vupGJ2nTxskAhilWnUCuE1KVvZv/JAJTydcJv44Yjk/cWOL89Xf
 JSMI6LLheOhUUwuK/qxvaCdswZtdZrpOA15YH9RGy6KVJTlLjpe2i3YpEiIiCyvoE/cEkG5JTQc
 F5IHOLJIYe2as4tHGxLNZRqGjtp2N2pXSihvBvoweUcLtmk2f5BUmwVkoI+LVQ5528NNCFIHUpv
 yAR6mxS3DcHGK/d051mezH8NfWFzGVfp4Lzu7Q5O0ELVbzOBZzyh6zI5RCCrE/VSJskplhQk6JC
 C/dhwv5zs/WPT+yRqjriGirKeS9dyCJvf4zYQwBZn6aTqXQPIyiB/H81YFnGij3lZjYRVRTr9hu
 7BgTltY6/8b38SYNpp3w==
X-Google-Smtp-Source: AGHT+IG/aztDhPK7Ua27wB9s3qTvQ4IALYJZMczFxV1tvd/YGek5uJFSM0ONCaYufDufLZZZVhxoUQ==
X-Received: by 2002:a5d:5d09:0:b0:3b6:c6b:e4e6 with SMTP id
 ffacd0b85a97d-3b776727319mr9732425f8f.11.1753733682845; 
 Mon, 28 Jul 2025 13:14:42 -0700 (PDT)
Received: from iku.example.org (97e54365.skybroadband.com. [151.229.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b78889682bsm4317760f8f.77.2025.07.28.13.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 13:14:42 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 3/6] clk: renesas: r9a09g057: Add clock and reset entries
 for DSI and LCDC
Date: Mon, 28 Jul 2025 21:14:32 +0100
Message-ID: <20250728201435.3505594-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add clock and reset entries for the DSI and LCDC peripherals.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v6->v7:
- Dropped passing plldsi_limits

v5->v6:
- Renamed CLK_DIV_PLLETH_LPCLK to CLK_CDIV4_PLLETH_LPCLK
- Renamed CLK_CSDIV_PLLETH_LPCLK to CLK_PLLETH_LPCLK_GEAR
- Renamed CLK_PLLDSI_SDIV2 to CLK_PLLDSI_GEAR
- Renamed plldsi_sdiv2 to plldsi_gear

v4->v5:
- No changes

v3->v4:
- No changes

v2->v3:
- Reverted CSDIV0_DIVCTL2() to use DDIV_PACK()
- Renamed plleth_lpclk_div4 -> cdiv4_plleth_lpclk
- Renamed plleth_lpclk -> plleth_lpclk_gear

v1->v2:
- Changed CSDIV0_DIVCTL2 to the NO_RMW
---
 drivers/clk/renesas/r9a09g057-cpg.c | 62 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  3 ++
 2 files changed, 65 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index f7de69a93de1..f94040f9d8a3 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/clk/renesas-rzv2h-cpg-pll.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -30,6 +31,7 @@ enum clk_ids {
 	CLK_PLLCA55,
 	CLK_PLLVDO,
 	CLK_PLLETH,
+	CLK_PLLDSI,
 	CLK_PLLGPU,
 
 	/* Internal Core Clocks */
@@ -63,6 +65,9 @@ enum clk_ids {
 	CLK_SMUX2_GBE0_RXCLK,
 	CLK_SMUX2_GBE1_TXCLK,
 	CLK_SMUX2_GBE1_RXCLK,
+	CLK_CDIV4_PLLETH_LPCLK,
+	CLK_PLLETH_LPCLK_GEAR,
+	CLK_PLLDSI_GEAR,
 	CLK_PLLGPU_GEAR,
 
 	/* Module Clocks */
@@ -91,6 +96,26 @@ static const struct clk_div_table dtable_2_16[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_2_32[] = {
+	{0, 2},
+	{1, 4},
+	{2, 6},
+	{3, 8},
+	{4, 10},
+	{5, 12},
+	{6, 14},
+	{7, 16},
+	{8, 18},
+	{9, 20},
+	{10, 22},
+	{11, 24},
+	{12, 26},
+	{13, 28},
+	{14, 30},
+	{15, 32},
+	{0, 0},
+};
+
 static const struct clk_div_table dtable_2_64[] = {
 	{0, 2},
 	{1, 4},
@@ -107,6 +132,17 @@ static const struct clk_div_table dtable_2_100[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_16_128[] = {
+	{0, 16},
+	{1, 32},
+	{2, 64},
+	{3, 128},
+	{0, 0},
+};
+
+RZV2H_CPG_PLL_DSI_LIMITS(rzv2h_cpg_pll_dsi_limits);
+#define PLLDSI		PLL_PACK_LIMITS(0xc0, 1, 0, &rzv2h_cpg_pll_dsi_limits)
+
 /* Mux clock tables */
 static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
 static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
@@ -128,6 +164,7 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLLCA55),
 	DEF_FIXED(".pllvdo", CLK_PLLVDO, CLK_QEXTAL, 105, 2),
 	DEF_FIXED(".plleth", CLK_PLLETH, CLK_QEXTAL, 125, 3),
+	DEF_PLLDSI(".plldsi", CLK_PLLDSI, CLK_QEXTAL, PLLDSI),
 	DEF_PLL(".pllgpu", CLK_PLLGPU, CLK_QEXTAL, PLLGPU),
 
 	/* Internal Core Clocks */
@@ -169,6 +206,12 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_SMUX(".smux2_gbe0_rxclk", CLK_SMUX2_GBE0_RXCLK, SSEL0_SELCTL3, smux2_gbe0_rxclk),
 	DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SELCTL0, smux2_gbe1_txclk),
 	DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCTL1, smux2_gbe1_rxclk),
+	DEF_FIXED(".cdiv4_plleth_lpclk", CLK_CDIV4_PLLETH_LPCLK, CLK_PLLETH, 1, 4),
+	DEF_CSDIV(".plleth_lpclk_gear", CLK_PLLETH_LPCLK_GEAR, CLK_CDIV4_PLLETH_LPCLK,
+		  CSDIV0_DIVCTL2, dtable_16_128),
+
+	DEF_PLLDSI_DIV(".plldsi_gear", CLK_PLLDSI_GEAR, CLK_PLLDSI,
+		       CSDIV1_DIVCTL2, dtable_2_32),
 
 	DEF_DDIV(".pllgpu_gear", CLK_PLLGPU_GEAR, CLK_PLLGPU, CDDIV3_DIVCTL1, dtable_2_64),
 
@@ -366,6 +409,22 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 						BUS_MSTOP(9, BIT(7))),
 	DEF_MOD("cru_3_pclk",			CLK_PLLDTY_DIV16, 13, 13, 6, 29,
 						BUS_MSTOP(9, BIT(7))),
+	DEF_MOD("dsi_0_pclk",			CLK_PLLDTY_DIV16, 14, 8, 7, 8,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("dsi_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 14, 9, 7, 9,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("dsi_0_vclk1",			CLK_PLLDSI_GEAR, 14, 10, 7, 10,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("dsi_0_lpclk",			CLK_PLLETH_LPCLK_GEAR, 14, 11, 7, 11,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("dsi_0_pllref_clk",		CLK_QEXTAL, 14, 12, 7, 12,
+						BUS_MSTOP(9, BIT(14) | BIT(15))),
+	DEF_MOD("lcdc_0_clk_a",			CLK_PLLDTY_ACPU_DIV2, 14, 13, 7, 13,
+						BUS_MSTOP(10, BIT(1) | BIT(2) | BIT(3))),
+	DEF_MOD("lcdc_0_clk_p",			CLK_PLLDTY_DIV16, 14, 14, 7, 14,
+						BUS_MSTOP(10, BIT(1) | BIT(2) | BIT(3))),
+	DEF_MOD("lcdc_0_clk_d",			CLK_PLLDSI_GEAR, 14, 15, 7, 15,
+						BUS_MSTOP(10, BIT(1) | BIT(2) | BIT(3))),
 	DEF_MOD("gpu_0_clk",			CLK_PLLGPU_GEAR, 15, 0, 7, 16,
 						BUS_MSTOP(3, BIT(4))),
 	DEF_MOD("gpu_0_axi_clk",		CLK_PLLDTY_ACPU_DIV2, 15, 1, 7, 17,
@@ -435,6 +494,9 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
 	DEF_RST(12, 14, 5, 31),		/* CRU_3_PRESETN */
 	DEF_RST(12, 15, 6, 0),		/* CRU_3_ARESETN */
 	DEF_RST(13, 0, 6, 1),		/* CRU_3_S_RESETN */
+	DEF_RST(13, 7, 6, 8),		/* DSI_0_PRESETN */
+	DEF_RST(13, 8, 6, 9),		/* DSI_0_ARESETN */
+	DEF_RST(13, 12, 6, 13),		/* LCDC_0_RESET_N */
 	DEF_RST(13, 13, 6, 14),		/* GPU_0_RESETN */
 	DEF_RST(13, 14, 6, 15),		/* GPU_0_AXI_RESETN */
 	DEF_RST(13, 15, 6, 16),		/* GPU_0_ACE_RESETN */
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 637803bc1e89..3dceb8dc5c13 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -126,6 +126,7 @@ struct fixed_mod_conf {
 #define CPG_CDDIV3		(0x40C)
 #define CPG_CDDIV4		(0x410)
 #define CPG_CSDIV0		(0x500)
+#define CPG_CSDIV1		(0x504)
 
 #define CDDIV0_DIVCTL1	DDIV_PACK(CPG_CDDIV0, 4, 3, 1)
 #define CDDIV0_DIVCTL2	DDIV_PACK(CPG_CDDIV0, 8, 3, 2)
@@ -142,7 +143,9 @@ struct fixed_mod_conf {
 
 #define CSDIV0_DIVCTL0	DDIV_PACK(CPG_CSDIV0, 0, 2, CSDIV_NO_MON)
 #define CSDIV0_DIVCTL1	DDIV_PACK(CPG_CSDIV0, 4, 2, CSDIV_NO_MON)
+#define CSDIV0_DIVCTL2	DDIV_PACK(CPG_CSDIV0, 8, 2, CSDIV_NO_MON)
 #define CSDIV0_DIVCTL3	DDIV_PACK_NO_RMW(CPG_CSDIV0, 12, 2, CSDIV_NO_MON)
+#define CSDIV1_DIVCTL2	DDIV_PACK(CPG_CSDIV1, 8, 4, CSDIV_NO_MON)
 
 #define SSEL0_SELCTL2	SMUX_PACK(CPG_SSEL0, 8, 1)
 #define SSEL0_SELCTL3	SMUX_PACK(CPG_SSEL0, 12, 1)
-- 
2.50.1

