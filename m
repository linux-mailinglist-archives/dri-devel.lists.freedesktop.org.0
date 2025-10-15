Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EBCBE05F9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 21:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE7410E8CC;
	Wed, 15 Oct 2025 19:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mxdxFHj4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4135B10E8CB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 19:26:55 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b62e7221351so5734637a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 12:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760556415; x=1761161215; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2nwfs3kwk3/QA3E/2uCZgw+iuyonqlTLNeALM9x3qYc=;
 b=mxdxFHj4fn/d17bbSyW0x0atTAPn384k+4eJN5MhWJAx8cmnmdjuItchPAsoj0cA40
 rAchHESfV7NY1j+hbRheHji+sH9pogC7goPdUuCO+ok453xlXyFoqC9npqfQt2lCh6Yq
 bG2xgWyLE1/MtyBp5I4tejU0WowdB6e/P+bM2+V/8fXMKahLaailQbALtnh930Onxg5z
 pJ61SSHGOOQqEBBnfIqgq18jIfrg5vZTbVc9KsVB6p1Q1Ouq0k+7xQHB+19UYJHdjJ0w
 aNcv+V2ZZxIhvKHymkwO0Ln3Q953s9GHrsPuxk6PBlll7uQXJopfBi3DTX3ZAWfKVsR4
 FkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760556415; x=1761161215;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2nwfs3kwk3/QA3E/2uCZgw+iuyonqlTLNeALM9x3qYc=;
 b=hMvWQglLCnmjLFP3LveOxS7XDIHViJ3WRmWxIksdCiRbeeOqMiE2WKWzXC1idMD0t3
 c4CpDUXPJ//I7VwGHEbZ5mIkCUIaCXnNusm7dpoJLW+2Q2H6HnK0gsCc9llNXGFZf6ak
 3fP8mSxZczrm86I4YRGIAQkJppPxdn4LICNMT2hbtYsct8k+zbLgsojH9lzS/lFN0TOV
 PMxk/mFbvU3o+YlMDJqxbYhH1/ZOZxXJdQiaZd6fYoGhn2GAI2Yq+qZmIVC4RVTqq6yU
 5WZcYBxkMgXlTaamChE1kZ9gFGCAIshxVwP8r2ZvjQcXQ6mr6/ocd9RHmBEBHuT45Bn4
 9Kzw==
X-Gm-Message-State: AOJu0YyfG9V+O0I6SIIVijThS6djdn72MxyBl/+j2aRMx2WQGLzamXAf
 D4t66PFvIG8LCkcNbD6jo1p0C74g640pB16pmTPazE1lpjjpG2/xf7mX
X-Gm-Gg: ASbGnctCJO1qClXLfmUcCmnO9vd1IF57ZkUpJrq38HsI31QWPQvdQ7VlFcq1iHByuCE
 xK1JFfG0ByfLU2Wi2QM60okM4BR2LY0BePcKgbQrU3dL07Z28uRoIBHhIdH2O1dN1OkUI/uge6H
 T67nY+AbJ5xP2+6OhDJCkumjIbRo4+82nnbdgXHWPY2zECfv1O4Vz159U53TCc8oJ4olMEIFyMX
 fiIJKtxeljba/5GPWkXl2X+iAgYQE8aKub2qAhk00k1DFEs9fzMAO7xuVc/KY7OTtNp2hEVbZS2
 TApv1nkvf5t65oISPf188UCfpTVadgu5yf9WUC8eKyIB9WPtgRTqAjayB6Vd+F/G8kH1NsVkz5n
 Hf9Rc2c3HXFegUwO3Fl0Yf2QQMeMH97VHju87VE3Or18hXLqeGVGNZRyjwsOPHkHWyR/4SeK2Dc
 awY2mXNveuXyHb74qZc/0e3LteWa4461w1
X-Google-Smtp-Source: AGHT+IGGz0/I/nL0eYN76IcdSFqhmPe/ym4t+Z4JeYRO1hEFKAkdhxvS8pLI4y7W9kT+oSDcNSh7aA==
X-Received: by 2002:a17:903:1ac8:b0:26f:f489:bba6 with SMTP id
 d9443c01a7336-290272f5913mr344016275ad.50.1760556414549; 
 Wed, 15 Oct 2025 12:26:54 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:c7d3:f449:63fb:7005:808e])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-290993102c9sm4427005ad.24.2025.10.15.12.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 12:26:53 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v11 3/7] clk: renesas: rzv2h-cpg: Add support for DSI clocks
Date: Wed, 15 Oct 2025 20:26:07 +0100
Message-ID: <20251015192611.241920-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add support for PLLDSI and its post-dividers in the RZ/V2H CPG driver and
export helper APIs for use by the DSI driver.

Introduce per-PLL-DSI state in the CPG private structure and provide a
set of helper functions that find valid PLL parameter combinations for
a requested frequency. The new helpers are rzv2h_get_pll_pars(),
rzv2h_get_pll_div_pars(), rzv2h_get_pll_divs_pars() and
rzv2h_get_pll_dtable_pars() and they are exported in the "RZV2H_CPG"
namespace for use by other consumers (notably the DSI driver). These
helpers perform iterative searches over PLL parameters (M, K, P, S)
and optional post-dividers and return the best match (or an exact
match when possible).

Move PLL/CLK related limits and parameter types into the shared
include (include/linux/clk/renesas.h) by adding struct rzv2h_pll_limits,
struct rzv2h_pll_pars and struct rzv2h_pll_div_pars plus the
RZV2H_CPG_PLL_DSI_LIMITS() helper macro to define DSI PLL limits.

This change centralises the PLLDSI algorithms so the CPG and DSI
drivers compute PLL parameters consistently and allows the DSI driver
to accurately request rates and program its PLL.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v10->v11:
- Dropped GENMASK changes into separate patch
- Updated rzv2h_cpg_plldsi_div_determine_rate()
  while iterating over the divider table
- Added Acked-by tag from Tomi
- Added Reviewed-by tag from Geert

v9->v10:
- Dropped rzv2h_get_pll_div_pars() helper and opencoded instead.
- Dropped rzv2h_get_pll_dtable_pars() helper and opencoded instead.
- Added dummy helpers rzv2h_get_pll_pars() and rzv2h_get_pll_divs_pars()
  in renesas.h for !CONFIG_CLK_RZV2H case.
- Updated commit message.

v8->v9:
- Dropped `renesas-rzv2h-cpg-pll.h` header and merged into `renesas.h`
- Exported the symbols for PLL calculation apis
- Updated commit message
- Dropped reviewed-by tags due to above changes

v7->v8:
- Dropped rzv2h_get_pll_dsi_info() helper and opencoded instead.
- Dropped is_plldsi parameter from rzv2h_cpg_pll_clk_register()

v6->v7:
- Made struct rzv2h_pll_limits more modular also added Ffout limits
- Made the alogirithm modular and also added apis based on the
  needs for lvds and dpi

v5->v6:
- Renamed CPG_PLL_STBY_SSCGEN_WEN to CPG_PLL_STBY_SSC_EN_WEN
- Updated CPG_PLL_CLK1_DIV_K, CPG_PLL_CLK1_DIV_M, and
  CPG_PLL_CLK1_DIV_P macros to use GENMASK
- Updated req->rate in rzv2h_cpg_plldsi_div_determine_rate()
- Dropped the cast in rzv2h_cpg_plldsi_div_set_rate()
- Dropped rzv2h_cpg_plldsi_round_rate() and implemented
  rzv2h_cpg_plldsi_determine_rate() instead
- Made use of FIELD_PREP()
- Moved CPG_CSDIV1 macro in patch 2/4
- Dropped two_pow_s in rzv2h_dsi_get_pll_parameters_values()
- Used mul_u32_u32() while calculating output_m and output_k_range
- Used div_s64() instead of div64_s64() while calculating
  pll_k
- Used mul_u32_u32() while calculating fvco and fvco checks
- Rounded the final output using DIV_U64_ROUND_CLOSEST()

v4->v5:
- No changes

v3->v4:
- Corrected parameter name in rzv2h_dsi_get_pll_parameters_values()
  description freq_millihz

v2->v3:
- Update the commit message to clarify the purpose of `renesas-rzv2h-dsi.h`
  header
- Used mul_u32_u32() in rzv2h_cpg_plldsi_div_determine_rate()
- Replaced *_mhz to *_millihz for clarity
- Updated u64->u32 for fvco limits
- Initialized the members in declaration order for
  RZV2H_CPG_PLL_DSI_LIMITS() macro
- Used clk_div_mask() in rzv2h_cpg_plldsi_div_recalc_rate()
- Replaced `unsigned long long` with u64
- Dropped rzv2h_cpg_plldsi_clk_recalc_rate() and reused
  rzv2h_cpg_pll_clk_recalc_rate() instead
- In rzv2h_cpg_plldsi_div_set_rate() followed the same style
  of RMW-operation as done in the other functions
- Renamed rzv2h_cpg_plldsi_set_rate() to rzv2h_cpg_pll_set_rate()
- Dropped rzv2h_cpg_plldsi_clk_register() and reused
  rzv2h_cpg_pll_clk_register() instead
- Added a gaurd in renesas-rzv2h-dsi.h header

v1->v2:
- No changes
---
 drivers/clk/renesas/rzv2h-cpg.c | 497 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h |  19 +-
 include/linux/clk/renesas.h     | 145 ++++++++++
 3 files changed, 659 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 9c4c5dfd5593..3f6299b9fec0 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -14,9 +14,14 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/clk/renesas.h>
 #include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/iopoll.h>
+#include <linux/limits.h>
+#include <linux/math.h>
+#include <linux/math64.h>
+#include <linux/minmax.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -26,6 +31,7 @@
 #include <linux/refcount.h>
 #include <linux/reset-controller.h>
 #include <linux/string_choices.h>
+#include <linux/units.h>
 
 #include <dt-bindings/clock/renesas-cpg-mssr.h>
 
@@ -47,7 +53,9 @@
 
 #define CPG_PLL_STBY(x)		((x))
 #define CPG_PLL_STBY_RESETB	BIT(0)
+#define CPG_PLL_STBY_SSC_EN	BIT(2)
 #define CPG_PLL_STBY_RESETB_WEN	BIT(16)
+#define CPG_PLL_STBY_SSC_EN_WEN BIT(18)
 #define CPG_PLL_CLK1(x)		((x) + 0x004)
 #define CPG_PLL_CLK1_KDIV	GENMASK(31, 16)
 #define CPG_PLL_CLK1_MDIV	GENMASK(15, 6)
@@ -65,6 +73,22 @@
 
 #define CPG_CLKSTATUS0		(0x700)
 
+/* On RZ/G3E SoC we have two DSI PLLs */
+#define MAX_CPG_DSI_PLL		2
+
+/**
+ * struct rzv2h_pll_dsi_info - PLL DSI information, holds the limits and parameters
+ *
+ * @pll_dsi_limits: PLL DSI parameters limits
+ * @pll_dsi_parameters: Calculated PLL DSI parameters
+ * @req_pll_dsi_rate: Requested PLL DSI rate
+ */
+struct rzv2h_pll_dsi_info {
+	const struct rzv2h_pll_limits *pll_dsi_limits;
+	struct rzv2h_pll_div_pars pll_dsi_parameters;
+	unsigned long req_pll_dsi_rate;
+};
+
 /**
  * struct rzv2h_cpg_priv - Clock Pulse Generator Private Data
  *
@@ -80,6 +104,7 @@
  * @ff_mod_status_ops: Fixed Factor Module Status Clock operations
  * @mstop_count: Array of mstop values
  * @rcdev: Reset controller entity
+ * @pll_dsi_info: Array of PLL DSI information, holds the limits and parameters
  */
 struct rzv2h_cpg_priv {
 	struct device *dev;
@@ -98,6 +123,8 @@ struct rzv2h_cpg_priv {
 	atomic_t *mstop_count;
 
 	struct reset_controller_dev rcdev;
+
+	struct rzv2h_pll_dsi_info pll_dsi_info[MAX_CPG_DSI_PLL];
 };
 
 #define rcdev_to_priv(x)	container_of(x, struct rzv2h_cpg_priv, rcdev)
@@ -168,6 +195,460 @@ struct rzv2h_ff_mod_status_clk {
 #define to_rzv2h_ff_mod_status_clk(_hw) \
 	container_of(_hw, struct rzv2h_ff_mod_status_clk, fix.hw)
 
+/**
+ * struct rzv2h_plldsi_div_clk - PLL DSI DDIV clock
+ *
+ * @dtable: divider table
+ * @priv: CPG private data
+ * @hw: divider clk
+ * @ddiv: divider configuration
+ */
+struct rzv2h_plldsi_div_clk {
+	const struct clk_div_table *dtable;
+	struct rzv2h_cpg_priv *priv;
+	struct clk_hw hw;
+	struct ddiv ddiv;
+};
+
+#define to_plldsi_div_clk(_hw) \
+	container_of(_hw, struct rzv2h_plldsi_div_clk, hw)
+
+#define RZ_V2H_OSC_CLK_IN_MEGA		(24 * MEGA)
+#define RZV2H_MAX_DIV_TABLES		(16)
+
+/**
+ * rzv2h_get_pll_pars - Finds the best combination of PLL parameters
+ * for a given frequency.
+ *
+ * @limits: Pointer to the structure containing the limits for the PLL parameters
+ * @pars: Pointer to the structure where the best calculated PLL parameters values
+ * will be stored
+ * @freq_millihz: Target output frequency in millihertz
+ *
+ * This function calculates the best set of PLL parameters (M, K, P, S) to achieve
+ * the desired frequency.
+ * There is no direct formula to calculate the PLL parameters, as it's an open
+ * system of equations, therefore this function uses an iterative approach to
+ * determine the best solution. The best solution is one that minimizes the error
+ * (desired frequency - actual frequency).
+ *
+ * Return: true if a valid set of parameters values is found, false otherwise.
+ */
+bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
+			struct rzv2h_pll_pars *pars, u64 freq_millihz)
+{
+	u64 fout_min_millihz = mul_u32_u32(limits->fout.min, MILLI);
+	u64 fout_max_millihz = mul_u32_u32(limits->fout.max, MILLI);
+	struct rzv2h_pll_pars p, best;
+
+	if (freq_millihz > fout_max_millihz ||
+	    freq_millihz < fout_min_millihz)
+		return false;
+
+	/* Initialize best error to maximum possible value */
+	best.error_millihz = S64_MAX;
+
+	for (p.p = limits->p.min; p.p <= limits->p.max; p.p++) {
+		u32 fref = RZ_V2H_OSC_CLK_IN_MEGA / p.p;
+		u16 divider;
+
+		for (divider = 1 << limits->s.min, p.s = limits->s.min;
+			p.s <= limits->s.max; p.s++, divider <<= 1) {
+			for (p.m = limits->m.min; p.m <= limits->m.max; p.m++) {
+				u64 output_m, output_k_range;
+				s64 pll_k, output_k;
+				u64 fvco, output;
+
+				/*
+				 * The frequency generated by the PLL + divider
+				 * is calculated as follows:
+				 *
+				 * With:
+				 * Freq = Ffout = Ffvco / 2^(pll_s)
+				 * Ffvco = (pll_m + (pll_k / 65536)) * Ffref
+				 * Ffref = 24MHz / pll_p
+				 *
+				 * Freq can also be rewritten as:
+				 * Freq = Ffvco / 2^(pll_s)
+				 *      = ((pll_m + (pll_k / 65536)) * Ffref) / 2^(pll_s)
+				 *      = (pll_m * Ffref) / 2^(pll_s) + ((pll_k / 65536) * Ffref) / 2^(pll_s)
+				 *      = output_m + output_k
+				 *
+				 * Every parameter has been determined at this
+				 * point, but pll_k.
+				 *
+				 * Considering that:
+				 * limits->k.min <= pll_k <= limits->k.max
+				 * Then:
+				 * -0.5 <= (pll_k / 65536) < 0.5
+				 * Therefore:
+				 * -Ffref / (2 * 2^(pll_s)) <= output_k < Ffref / (2 * 2^(pll_s))
+				 */
+
+				/* Compute output M component (in mHz) */
+				output_m = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(p.m, fref) * MILLI,
+								 divider);
+				/* Compute range for output K (in mHz) */
+				output_k_range = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(fref, MILLI),
+								       2 * divider);
+				/*
+				 * No point in continuing if we can't achieve
+				 * the desired frequency
+				 */
+				if (freq_millihz <  (output_m - output_k_range) ||
+				    freq_millihz >= (output_m + output_k_range)) {
+					continue;
+				}
+
+				/*
+				 * Compute the K component
+				 *
+				 * Since:
+				 * Freq = output_m + output_k
+				 * Then:
+				 * output_k = Freq - output_m
+				 *          = ((pll_k / 65536) * Ffref) / 2^(pll_s)
+				 * Therefore:
+				 * pll_k = (output_k * 65536 * 2^(pll_s)) / Ffref
+				 */
+				output_k = freq_millihz - output_m;
+				pll_k = div_s64(output_k * 65536ULL * divider,
+						fref);
+				pll_k = DIV_S64_ROUND_CLOSEST(pll_k, MILLI);
+
+				/* Validate K value within allowed limits */
+				if (pll_k < limits->k.min ||
+				    pll_k > limits->k.max)
+					continue;
+
+				p.k = pll_k;
+
+				/* Compute (Ffvco * 65536) */
+				fvco = mul_u32_u32(p.m * 65536 + p.k, fref);
+				if (fvco < mul_u32_u32(limits->fvco.min, 65536) ||
+				    fvco > mul_u32_u32(limits->fvco.max, 65536))
+					continue;
+
+				/* PLL_M component of (output * 65536 * PLL_P) */
+				output = mul_u32_u32(p.m * 65536, RZ_V2H_OSC_CLK_IN_MEGA);
+				/* PLL_K component of (output * 65536 * PLL_P) */
+				output += p.k * RZ_V2H_OSC_CLK_IN_MEGA;
+				/* Make it in mHz */
+				output *= MILLI;
+				output = DIV_U64_ROUND_CLOSEST(output, 65536 * p.p * divider);
+
+				/* Check output frequency against limits */
+				if (output < fout_min_millihz ||
+				    output > fout_max_millihz)
+					continue;
+
+				p.error_millihz = freq_millihz - output;
+				p.freq_millihz = output;
+
+				/* If an exact match is found, return immediately */
+				if (p.error_millihz == 0) {
+					*pars = p;
+					return true;
+				}
+
+				/* Update best match if error is smaller */
+				if (abs(best.error_millihz) > abs(p.error_millihz))
+					best = p;
+			}
+		}
+	}
+
+	/* If no valid parameters were found, return false */
+	if (best.error_millihz == S64_MAX)
+		return false;
+
+	*pars = best;
+	return true;
+}
+EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_pars, "RZV2H_CPG");
+
+/*
+ * rzv2h_get_pll_divs_pars - Finds the best combination of PLL parameters
+ * and divider value for a given frequency.
+ *
+ * @limits: Pointer to the structure containing the limits for the PLL parameters
+ * @pars: Pointer to the structure where the best calculated PLL parameters and
+ * divider values will be stored
+ * @table: Pointer to the array of valid divider values
+ * @table_size: Size of the divider values array
+ * @freq_millihz: Target output frequency in millihertz
+ *
+ * This function calculates the best set of PLL parameters (M, K, P, S) and divider
+ * value to achieve the desired frequency. See rzv2h_get_pll_pars() for more details
+ * on how the PLL parameters are calculated.
+ *
+ * freq_millihz is the desired frequency generated by the PLL followed by a
+ * a gear.
+ */
+bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
+			     struct rzv2h_pll_div_pars *pars,
+			     const u8 *table, u8 table_size, u64 freq_millihz)
+{
+	struct rzv2h_pll_div_pars p, best;
+
+	best.div.error_millihz = S64_MAX;
+	p.div.error_millihz = S64_MAX;
+	for (unsigned int i = 0; i < table_size; i++) {
+		if (!rzv2h_get_pll_pars(limits, &p.pll, freq_millihz * table[i]))
+			continue;
+
+		p.div.divider_value = table[i];
+		p.div.freq_millihz = DIV_U64_ROUND_CLOSEST(p.pll.freq_millihz, table[i]);
+		p.div.error_millihz = freq_millihz - p.div.freq_millihz;
+
+		if (p.div.error_millihz == 0) {
+			*pars = p;
+			return true;
+		}
+
+		if (abs(best.div.error_millihz) > abs(p.div.error_millihz))
+			best = p;
+	}
+
+	if (best.div.error_millihz == S64_MAX)
+		return false;
+
+	*pars = best;
+	return true;
+}
+EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_divs_pars, "RZV2H_CPG");
+
+static unsigned long rzv2h_cpg_plldsi_div_recalc_rate(struct clk_hw *hw,
+						      unsigned long parent_rate)
+{
+	struct rzv2h_plldsi_div_clk *dsi_div = to_plldsi_div_clk(hw);
+	struct rzv2h_cpg_priv *priv = dsi_div->priv;
+	struct ddiv ddiv = dsi_div->ddiv;
+	u32 div;
+
+	div = readl(priv->base + ddiv.offset);
+	div >>= ddiv.shift;
+	div &= clk_div_mask(ddiv.width);
+	div = dsi_div->dtable[div].div;
+
+	return DIV_ROUND_CLOSEST_ULL(parent_rate, div);
+}
+
+static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
+					       struct clk_rate_request *req)
+{
+	struct rzv2h_plldsi_div_clk *dsi_div = to_plldsi_div_clk(hw);
+	struct pll_clk *pll_clk = to_pll(clk_hw_get_parent(hw));
+	struct rzv2h_cpg_priv *priv = dsi_div->priv;
+	u8 table[RZV2H_MAX_DIV_TABLES] = { 0 };
+	struct rzv2h_pll_div_pars *dsi_params;
+	struct rzv2h_pll_dsi_info *dsi_info;
+	const struct clk_div_table *div;
+	unsigned int i = 0;
+	u64 rate_millihz;
+
+	dsi_info = &priv->pll_dsi_info[pll_clk->pll.instance];
+	dsi_params = &dsi_info->pll_dsi_parameters;
+
+	rate_millihz = mul_u32_u32(req->rate, MILLI);
+	if (rate_millihz == dsi_params->div.error_millihz + dsi_params->div.freq_millihz)
+		goto exit_determine_rate;
+
+	for (div = dsi_div->dtable; div->div; div++) {
+		if (i >= RZV2H_MAX_DIV_TABLES)
+			return -EINVAL;
+		table[i++] = div->div;
+	}
+
+	if (!rzv2h_get_pll_divs_pars(dsi_info->pll_dsi_limits, dsi_params, table, i,
+				     rate_millihz)) {
+		dev_err(priv->dev, "failed to determine rate for req->rate: %lu\n",
+			req->rate);
+		return -EINVAL;
+	}
+
+exit_determine_rate:
+	req->rate = DIV_ROUND_CLOSEST_ULL(dsi_params->div.freq_millihz, MILLI);
+	req->best_parent_rate = req->rate * dsi_params->div.divider_value;
+	dsi_info->req_pll_dsi_rate = req->best_parent_rate;
+
+	return 0;
+}
+
+static int rzv2h_cpg_plldsi_div_set_rate(struct clk_hw *hw,
+					 unsigned long rate,
+					 unsigned long parent_rate)
+{
+	struct rzv2h_plldsi_div_clk *dsi_div = to_plldsi_div_clk(hw);
+	struct pll_clk *pll_clk = to_pll(clk_hw_get_parent(hw));
+	struct rzv2h_cpg_priv *priv = dsi_div->priv;
+	struct rzv2h_pll_div_pars *dsi_params;
+	struct rzv2h_pll_dsi_info *dsi_info;
+	struct ddiv ddiv = dsi_div->ddiv;
+	const struct clk_div_table *clkt;
+	bool divider_found = false;
+	u32 val, shift;
+
+	dsi_info = &priv->pll_dsi_info[pll_clk->pll.instance];
+	dsi_params = &dsi_info->pll_dsi_parameters;
+
+	for (clkt = dsi_div->dtable; clkt->div; clkt++) {
+		if (clkt->div == dsi_params->div.divider_value) {
+			divider_found = true;
+			break;
+		}
+	}
+
+	if (!divider_found)
+		return -EINVAL;
+
+	shift = ddiv.shift;
+	val = readl(priv->base + ddiv.offset) | DDIV_DIVCTL_WEN(shift);
+	val &= ~(clk_div_mask(ddiv.width) << shift);
+	val |= clkt->val << shift;
+	writel(val, priv->base + ddiv.offset);
+
+	return 0;
+}
+
+static const struct clk_ops rzv2h_cpg_plldsi_div_ops = {
+	.recalc_rate = rzv2h_cpg_plldsi_div_recalc_rate,
+	.determine_rate = rzv2h_cpg_plldsi_div_determine_rate,
+	.set_rate = rzv2h_cpg_plldsi_div_set_rate,
+};
+
+static struct clk * __init
+rzv2h_cpg_plldsi_div_clk_register(const struct cpg_core_clk *core,
+				  struct rzv2h_cpg_priv *priv)
+{
+	struct rzv2h_plldsi_div_clk *clk_hw_data;
+	struct clk **clks = priv->clks;
+	struct clk_init_data init;
+	const struct clk *parent;
+	const char *parent_name;
+	struct clk_hw *clk_hw;
+	int ret;
+
+	parent = clks[core->parent];
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
+	if (!clk_hw_data)
+		return ERR_PTR(-ENOMEM);
+
+	clk_hw_data->priv = priv;
+	clk_hw_data->ddiv = core->cfg.ddiv;
+	clk_hw_data->dtable = core->dtable;
+
+	parent_name = __clk_get_name(parent);
+	init.name = core->name;
+	init.ops = &rzv2h_cpg_plldsi_div_ops;
+	init.flags = core->flag;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	clk_hw = &clk_hw_data->hw;
+	clk_hw->init = &init;
+
+	ret = devm_clk_hw_register(priv->dev, clk_hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return clk_hw->clk;
+}
+
+static int rzv2h_cpg_plldsi_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
+{
+	struct pll_clk *pll_clk = to_pll(hw);
+	struct rzv2h_cpg_priv *priv = pll_clk->priv;
+	struct rzv2h_pll_dsi_info *dsi_info;
+	u64 rate_millihz;
+
+	dsi_info = &priv->pll_dsi_info[pll_clk->pll.instance];
+	/* check if the divider has already invoked the algorithm */
+	if (req->rate == dsi_info->req_pll_dsi_rate)
+		return 0;
+
+	/* If the req->rate doesn't match we do the calculation assuming there is no divider */
+	rate_millihz = mul_u32_u32(req->rate, MILLI);
+	if (!rzv2h_get_pll_pars(dsi_info->pll_dsi_limits,
+				&dsi_info->pll_dsi_parameters.pll, rate_millihz)) {
+		dev_err(priv->dev,
+			"failed to determine rate for req->rate: %lu\n",
+			req->rate);
+		return -EINVAL;
+	}
+
+	req->rate = DIV_ROUND_CLOSEST_ULL(dsi_info->pll_dsi_parameters.pll.freq_millihz, MILLI);
+	dsi_info->req_pll_dsi_rate = req->rate;
+
+	return 0;
+}
+
+static int rzv2h_cpg_pll_set_rate(struct pll_clk *pll_clk,
+				  struct rzv2h_pll_pars *params,
+				  bool ssc_disable)
+{
+	struct rzv2h_cpg_priv *priv = pll_clk->priv;
+	u16 offset = pll_clk->pll.offset;
+	u32 val;
+	int ret;
+
+	/* Put PLL into standby mode */
+	writel(CPG_PLL_STBY_RESETB_WEN, priv->base + CPG_PLL_STBY(offset));
+	ret = readl_poll_timeout_atomic(priv->base + CPG_PLL_MON(offset),
+					val, !(val & CPG_PLL_MON_LOCK),
+					100, 2000);
+	if (ret) {
+		dev_err(priv->dev, "Failed to put PLLDSI into standby mode");
+		return ret;
+	}
+
+	/* Output clock setting 1 */
+	writel(FIELD_PREP(CPG_PLL_CLK1_KDIV, (u16)params->k) |
+	       FIELD_PREP(CPG_PLL_CLK1_MDIV, params->m) |
+	       FIELD_PREP(CPG_PLL_CLK1_PDIV, params->p),
+	       priv->base + CPG_PLL_CLK1(offset));
+
+	/* Output clock setting 2 */
+	val = readl(priv->base + CPG_PLL_CLK2(offset));
+	writel((val & ~CPG_PLL_CLK2_SDIV) | FIELD_PREP(CPG_PLL_CLK2_SDIV, params->s),
+	       priv->base + CPG_PLL_CLK2(offset));
+
+	/* Put PLL to normal mode */
+	if (ssc_disable)
+		val = CPG_PLL_STBY_SSC_EN_WEN;
+	else
+		val = CPG_PLL_STBY_SSC_EN_WEN | CPG_PLL_STBY_SSC_EN;
+	writel(val | CPG_PLL_STBY_RESETB_WEN | CPG_PLL_STBY_RESETB,
+	       priv->base + CPG_PLL_STBY(offset));
+
+	/* PLL normal mode transition, output clock stability check */
+	ret = readl_poll_timeout_atomic(priv->base + CPG_PLL_MON(offset),
+					val, (val & CPG_PLL_MON_LOCK),
+					100, 2000);
+	if (ret) {
+		dev_err(priv->dev, "Failed to put PLLDSI into normal mode");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int rzv2h_cpg_plldsi_set_rate(struct clk_hw *hw, unsigned long rate,
+				     unsigned long parent_rate)
+{
+	struct pll_clk *pll_clk = to_pll(hw);
+	struct rzv2h_pll_dsi_info *dsi_info;
+	struct rzv2h_cpg_priv *priv = pll_clk->priv;
+
+	dsi_info = &priv->pll_dsi_info[pll_clk->pll.instance];
+
+	return rzv2h_cpg_pll_set_rate(pll_clk, &dsi_info->pll_dsi_parameters.pll, true);
+}
+
 static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
 {
 	struct pll_clk *pll_clk = to_pll(hw);
@@ -238,6 +719,12 @@ static unsigned long rzv2h_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 	return DIV_ROUND_CLOSEST_ULL(rate, FIELD_GET(CPG_PLL_CLK1_PDIV, clk1));
 }
 
+static const struct clk_ops rzv2h_cpg_plldsi_ops = {
+	.recalc_rate = rzv2h_cpg_pll_clk_recalc_rate,
+	.determine_rate = rzv2h_cpg_plldsi_determine_rate,
+	.set_rate = rzv2h_cpg_plldsi_set_rate,
+};
+
 static const struct clk_ops rzv2h_cpg_pll_ops = {
 	.is_enabled = rzv2h_cpg_pll_clk_is_enabled,
 	.enable = rzv2h_cpg_pll_clk_enable,
@@ -264,6 +751,10 @@ rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
 	if (!pll_clk)
 		return ERR_PTR(-ENOMEM);
 
+	if (core->type == CLK_TYPE_PLLDSI)
+		priv->pll_dsi_info[core->cfg.pll.instance].pll_dsi_limits =
+			core->cfg.pll.limits;
+
 	parent_name = __clk_get_name(parent);
 	init.name = core->name;
 	init.ops = ops;
@@ -588,6 +1079,12 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_SMUX:
 		clk = rzv2h_cpg_mux_clk_register(core, priv);
 		break;
+	case CLK_TYPE_PLLDSI:
+		clk = rzv2h_cpg_pll_clk_register(core, priv, &rzv2h_cpg_plldsi_ops);
+		break;
+	case CLK_TYPE_PLLDSI_DIV:
+		clk = rzv2h_cpg_plldsi_div_clk_register(core, priv);
+		break;
 	default:
 		goto fail;
 	}
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index fe6ab8e3cc6e..f7b4e4785d0f 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -22,15 +22,20 @@ struct pll {
 	unsigned int offset:9;
 	unsigned int has_clkn:1;
 	unsigned int instance:2;
+	const struct rzv2h_pll_limits *limits;
 };
 
-#define PLL_PACK(_offset, _has_clkn, _instance) \
+#define PLL_PACK_LIMITS(_offset, _has_clkn, _instance, _limits) \
 	((struct pll){ \
 		.offset = _offset, \
 		.has_clkn = _has_clkn, \
-		.instance = _instance \
+		.instance = _instance, \
+		.limits = _limits \
 	})
 
+#define PLL_PACK(_offset, _has_clkn, _instance) \
+	PLL_PACK_LIMITS(_offset, _has_clkn, _instance, NULL)
+
 #define PLLCA55		PLL_PACK(0x60, 1, 0)
 #define PLLGPU		PLL_PACK(0x120, 1, 0)
 
@@ -193,6 +198,8 @@ enum clk_types {
 	CLK_TYPE_PLL,
 	CLK_TYPE_DDIV,		/* Dynamic Switching Divider */
 	CLK_TYPE_SMUX,		/* Static Mux */
+	CLK_TYPE_PLLDSI,	/* PLLDSI */
+	CLK_TYPE_PLLDSI_DIV,	/* PLLDSI divider */
 };
 
 #define DEF_TYPE(_name, _id, _type...) \
@@ -223,6 +230,14 @@ enum clk_types {
 		 .num_parents = ARRAY_SIZE(_parent_names), \
 		 .flag = CLK_SET_RATE_PARENT, \
 		 .mux_flags = CLK_MUX_HIWORD_MASK)
+#define DEF_PLLDSI(_name, _id, _parent, _pll_packed) \
+	DEF_TYPE(_name, _id, CLK_TYPE_PLLDSI, .parent = _parent, .cfg.pll = _pll_packed)
+#define DEF_PLLDSI_DIV(_name, _id, _parent, _ddiv_packed, _dtable) \
+	DEF_TYPE(_name, _id, CLK_TYPE_PLLDSI_DIV, \
+		 .cfg.ddiv = _ddiv_packed, \
+		 .dtable = _dtable, \
+		 .parent = _parent, \
+		 .flag = CLK_SET_RATE_PARENT)
 
 /**
  * struct rzv2h_mod_clk - Module Clocks definitions
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index 0ebbe2f0b45e..69d8159deee3 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -10,7 +10,9 @@
 #ifndef __LINUX_CLK_RENESAS_H_
 #define __LINUX_CLK_RENESAS_H_
 
+#include <linux/clk-provider.h>
 #include <linux/types.h>
+#include <linux/units.h>
 
 struct device;
 struct device_node;
@@ -32,4 +34,147 @@ void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct device *dev);
 #define cpg_mssr_attach_dev	NULL
 #define cpg_mssr_detach_dev	NULL
 #endif
+
+/**
+ * struct rzv2h_pll_limits - PLL parameter constraints
+ *
+ * This structure defines the minimum and maximum allowed values for
+ * various parameters used to configure a PLL. These limits ensure
+ * the PLL operates within valid and stable ranges.
+ *
+ * @fout: Output frequency range (in MHz)
+ * @fout.min: Minimum allowed output frequency
+ * @fout.max: Maximum allowed output frequency
+ *
+ * @fvco: PLL oscillation frequency range (in MHz)
+ * @fvco.min: Minimum allowed VCO frequency
+ * @fvco.max: Maximum allowed VCO frequency
+ *
+ * @m: Main-divider range
+ * @m.min: Minimum main-divider value
+ * @m.max: Maximum main-divider value
+ *
+ * @p: Pre-divider range
+ * @p.min: Minimum pre-divider value
+ * @p.max: Maximum pre-divider value
+ *
+ * @s: Divider range
+ * @s.min: Minimum divider value
+ * @s.max: Maximum divider value
+ *
+ * @k: Delta-sigma modulator range (signed)
+ * @k.min: Minimum delta-sigma value
+ * @k.max: Maximum delta-sigma value
+ */
+struct rzv2h_pll_limits {
+	struct {
+		u32 min;
+		u32 max;
+	} fout;
+
+	struct {
+		u32 min;
+		u32 max;
+	} fvco;
+
+	struct {
+		u16 min;
+		u16 max;
+	} m;
+
+	struct {
+		u8 min;
+		u8 max;
+	} p;
+
+	struct {
+		u8 min;
+		u8 max;
+	} s;
+
+	struct {
+		s16 min;
+		s16 max;
+	} k;
+};
+
+/**
+ * struct rzv2h_pll_pars - PLL configuration parameters
+ *
+ * This structure contains the configuration parameters for the
+ * Phase-Locked Loop (PLL), used to achieve a specific output frequency.
+ *
+ * @m: Main divider value
+ * @p: Pre-divider value
+ * @s: Output divider value
+ * @k: Delta-sigma modulation value
+ * @freq_millihz: Calculated PLL output frequency in millihertz
+ * @error_millihz: Frequency error from target in millihertz (signed)
+ */
+struct rzv2h_pll_pars {
+	u16 m;
+	u8 p;
+	u8 s;
+	s16 k;
+	u64 freq_millihz;
+	s64 error_millihz;
+};
+
+/**
+ * struct rzv2h_pll_div_pars - PLL parameters with post-divider
+ *
+ * This structure is used for PLLs that include an additional post-divider
+ * stage after the main PLL block. It contains both the PLL configuration
+ * parameters and the resulting frequency/error values after the divider.
+ *
+ * @pll: Main PLL configuration parameters (see struct rzv2h_pll_pars)
+ *
+ * @div: Post-divider configuration and result
+ * @div.divider_value: Divider applied to the PLL output
+ * @div.freq_millihz: Output frequency after divider in millihertz
+ * @div.error_millihz: Frequency error from target in millihertz (signed)
+ */
+struct rzv2h_pll_div_pars {
+	struct rzv2h_pll_pars pll;
+	struct {
+		u8 divider_value;
+		u64 freq_millihz;
+		s64 error_millihz;
+	} div;
+};
+
+#define RZV2H_CPG_PLL_DSI_LIMITS(name)					\
+	static const struct rzv2h_pll_limits (name) = {			\
+		.fout = { .min = 25 * MEGA, .max = 375 * MEGA },	\
+		.fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },	\
+		.m = { .min = 64, .max = 533 },				\
+		.p = { .min = 1, .max = 4 },				\
+		.s = { .min = 0, .max = 6 },				\
+		.k = { .min = -32768, .max = 32767 },			\
+	}								\
+
+#ifdef CONFIG_CLK_RZV2H
+bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
+			struct rzv2h_pll_pars *pars, u64 freq_millihz);
+
+bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
+			     struct rzv2h_pll_div_pars *pars,
+			     const u8 *table, u8 table_size, u64 freq_millihz);
+#else
+static inline bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
+				      struct rzv2h_pll_pars *pars,
+				      u64 freq_millihz)
+{
+	return false;
+}
+
+static inline bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
+					   struct rzv2h_pll_div_pars *pars,
+					   const u8 *table, u8 table_size,
+					   u64 freq_millihz)
+{
+	return false;
+}
+#endif
+
 #endif
-- 
2.43.0

