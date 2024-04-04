Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73884897F15
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 07:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97556112C12;
	Thu,  4 Apr 2024 05:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3C64310F583
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 05:10:28 +0000 (UTC)
Received: from SIOS1075.ysato.name (al128006.dynamic.ppp.asahi-net.or.jp
 [111.234.128.6])
 by sakura.ysato.name (Postfix) with ESMTPSA id 2C4031C05D4;
 Thu,  4 Apr 2024 14:01:03 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Lee Jones <lee@kernel.org>, Helge Deller <deller@gmx.de>,
 Heiko Stuebner <heiko.stuebner@cherry.de>, Shawn Guo <shawnguo@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 David Rientjes <rientjes@google.com>, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Vlastimil Babka <vbabka@suse.cz>, Baoquan He <bhe@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Javier Martinez Canillas <javierm@redhat.com>, Guo Ren <guoren@kernel.org>,
 Azeem Shaikh <azeemshaikh38@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Jacky Huang <ychuang3@nuvoton.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v7 15/37] clk: renesas: Add SH7750/7751 CPG Driver
Date: Thu,  4 Apr 2024 13:59:46 +0900
Message-Id: <0a30dbe6d096c38d612279349293162a2ccca149.1712205900.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712205900.git.ysato@users.sourceforge.jp>
References: <cover.1712205900.git.ysato@users.sourceforge.jp>
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

Renesas SH7750 and SH7751 series CPG driver.
This driver supported frequency control and clock gating.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 drivers/clk/renesas/Kconfig      |  13 +-
 drivers/clk/renesas/Makefile     |   1 +
 drivers/clk/renesas/clk-sh7750.c | 480 +++++++++++++++++++++++++++++++
 3 files changed, 491 insertions(+), 3 deletions(-)
 create mode 100644 drivers/clk/renesas/clk-sh7750.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index d252150402e8..482efcb6e76e 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
 config CLK_RENESAS
-	bool "Renesas SoC clock support" if COMPILE_TEST && !ARCH_RENESAS
-	default y if ARCH_RENESAS
+	bool "Renesas SoC clock support" if COMPILE_TEST && !ARCH_RENESAS && !SUPERH
+	default y if ARCH_RENESAS || SUPERH
 	select CLK_EMEV2 if ARCH_EMEV2
 	select CLK_RZA1 if ARCH_R7S72100
 	select CLK_R7S9210 if ARCH_R7S9210
@@ -41,6 +41,9 @@ config CLK_RENESAS
 	select CLK_R9A08G045 if ARCH_R9A08G045
 	select CLK_R9A09G011 if ARCH_R9A09G011
 	select CLK_SH73A0 if ARCH_SH73A0
+	select CLK_SH7750 if CPU_SUBTYPE_SH7750 || CPU_SUBTYPE_SH7750S || \
+	                     CPU_SUBTYPE_SH7750R || CPU_SUBTYPE_SH7751 || \
+			     CPU_SUBTYPE_SH7751R
 
 if CLK_RENESAS
 
@@ -198,7 +201,6 @@ config CLK_SH73A0
 	select CLK_RENESAS_CPG_MSTP
 	select CLK_RENESAS_DIV6
 
-
 # Family
 config CLK_RCAR_CPG_LIB
 	bool "CPG/MSSR library functions" if COMPILE_TEST
@@ -228,6 +230,11 @@ config CLK_RZG2L
 	bool "Renesas RZ/{G2L,G2UL,G3S,V2L} family clock support" if COMPILE_TEST
 	select RESET_CONTROLLER
 
+config CLK_SH7750
+	bool "Renesas SH7750/7751 family clock support" if COMPILE_TEST
+	help
+	  This is a driver for SH7750 / SH7751 CPG.
+
 # Generic
 config CLK_RENESAS_CPG_MSSR
 	bool "CPG/MSSR clock support" if COMPILE_TEST
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index f7e18679c3b8..ea0ffa8d59c4 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -38,6 +38,7 @@ obj-$(CONFIG_CLK_R9A07G054)		+= r9a07g044-cpg.o
 obj-$(CONFIG_CLK_R9A08G045)		+= r9a08g045-cpg.o
 obj-$(CONFIG_CLK_R9A09G011)		+= r9a09g011-cpg.o
 obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
+obj-$(CONFIG_CLK_SH7750)		+= clk-sh7750.o
 
 # Family
 obj-$(CONFIG_CLK_RCAR_CPG_LIB)		+= rcar-cpg-lib.o
diff --git a/drivers/clk/renesas/clk-sh7750.c b/drivers/clk/renesas/clk-sh7750.c
new file mode 100644
index 000000000000..043269d31200
--- /dev/null
+++ b/drivers/clk/renesas/clk-sh7750.c
@@ -0,0 +1,480 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas SH7750/51 CPG driver
+ *
+ * Copyright 2023 Yoshinori Sato <ysato@users.sourceforge.jp>
+ */
+
+#include <linux/clkdev.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+
+/* PCLK divide rate selector */
+static const struct clk_div_table pdiv_table[] = {
+	{ .val = 0, .div = 2, },
+	{ .val = 1, .div = 3, },
+	{ .val = 2, .div = 4, },
+	{ .val = 3, .div = 6, },
+	{ .val = 4, .div = 8, },
+	{ }
+};
+
+/* ICLK and BCLK divide rate selector */
+static const struct clk_div_table div_table[] = {
+	{ .val = 0, .div = 1, },
+	{ .val = 1, .div = 2, },
+	{ .val = 2, .div = 3, },
+	{ .val = 3, .div = 4, },
+	{ .val = 4, .div = 6, },
+	{ .val = 5, .div = 8, },
+	{ }
+};
+
+struct cpg_priv {
+	struct clk_hw hw;
+	spinlock_t clklock;
+	void __iomem *frqcr;
+	void __iomem *clkstp00;
+	u32 mode;
+	u32 feat;
+};
+
+/* CPG feature flag */
+#define CPG_DIV1	BIT(0)	/* 7750, 7750S, 7751 */
+#define MSTP_CR2	BIT(1)	/* 7750S, 7750R, 7751, 7751R */
+#define MSTP_CLKSTP	BIT(2)	/* 7750R, 7751, 7751R */
+#define MSTP_CSTP2	BIT(3)	/* 7751, 7751R */
+
+enum {
+	CPG_SH7750,
+	CPG_SH7750S,
+	CPG_SH7750R,
+	CPG_SH7751,
+	CPG_SH7751R,
+};
+
+static const u32 cpg_feature[] = {
+	[CPG_SH7750]  = CPG_DIV1,
+	[CPG_SH7750S] = CPG_DIV1 | MSTP_CR2,
+	[CPG_SH7750R] = MSTP_CR2 | MSTP_CLKSTP,
+	[CPG_SH7751]  = CPG_DIV1 | MSTP_CR2 | MSTP_CLKSTP | MSTP_CSTP2,
+	[CPG_SH7751R] = MSTP_CR2 | MSTP_CLKSTP | MSTP_CSTP2,
+};
+
+enum clk_type {CLK_DIV, CLK_STBCR, CLK_STBCR2, CLK_CLKSTP00};
+
+enum {
+	FRQCR = 0,
+	STBCR = 4,
+	WTCNT = 8,
+	WTCSR = 12,
+	STBCR2 = 16,
+	CLKSTP00 = 0,
+	CLKSTPCLR00 = 8,
+};
+
+static struct cpg_priv *cpg_data;
+
+#define to_priv(_hw) container_of(_hw, struct cpg_priv, hw)
+
+#define FRQCR_PLL1EN BIT(10)
+static const unsigned int pll1mult[] = { 12, 12, 6, 12, 6, 12, 1};
+
+static unsigned long pll_recalc_rate(struct clk_hw *hw,
+				      unsigned long parent_rate)
+{
+	struct cpg_priv *cpg = to_priv(hw);
+	unsigned long rate = parent_rate;
+	u16 frqcr;
+
+	frqcr = ioread16(cpg->frqcr);
+	if (frqcr & FRQCR_PLL1EN) {
+		rate *= pll1mult[cpg->mode];
+		if (cpg->mode < 6 && (cpg->feat & CPG_DIV1))
+			rate /= 2;
+	}
+	return rate;
+}
+
+static void get_round_rate(struct cpg_priv *cpg,
+			   unsigned long *out, bool *pllen,
+			   unsigned long rate, unsigned long prate)
+{
+	long pllout, res;
+	bool pll;
+
+	if (cpg->mode < 6 && (cpg->feat & CPG_DIV1))
+		prate /= 2;
+
+	pllout = prate * pll1mult[cpg->mode];
+	if (abs(pllout - rate) > abs(prate - rate)) {
+		res = prate;
+		pll = false;
+	} else {
+		res = pllout;
+		pll = true;
+	}
+	if (out)
+		*out = res;
+	if (pllen)
+		*pllen = pll;
+}
+
+static int pll_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	struct cpg_priv *cpg = to_priv(hw);
+
+	get_round_rate(cpg, &req->rate, NULL, req->rate, req->best_parent_rate);
+	return 0;
+}
+
+static int pll_set_rate(struct clk_hw *hw,
+			unsigned long rate, unsigned long prate)
+{
+	struct cpg_priv *cpg = to_priv(hw);
+	bool oldpll, newpll;
+	u16 frqcr;
+
+	frqcr = ioread16(cpg->frqcr);
+	get_round_rate(cpg, NULL, &newpll, rate, prate);
+	oldpll = frqcr & FRQCR_PLL1EN;
+	frqcr &= ~FRQCR_PLL1EN;
+
+	if (newpll) {
+		frqcr |= FRQCR_PLL1EN;
+		if (!oldpll) {
+			/* set PLL wakeup delay time */
+			iowrite16(0xa500, cpg->frqcr + WTCNT);
+			iowrite16(0xa507, cpg->frqcr + WTCNT);
+			iowrite16(0x5a00, cpg->frqcr + WTCSR);
+		}
+	}
+	iowrite16(frqcr, cpg->frqcr);
+
+	/* Test for new PLL state */
+	frqcr = ioread16(cpg->frqcr);
+	oldpll = frqcr & FRQCR_PLL1EN;
+	return !(oldpll == newpll);
+}
+
+static const struct clk_ops pll_ops = {
+	.recalc_rate = pll_recalc_rate,
+	.determine_rate = pll_determine_rate,
+	.set_rate = pll_set_rate,
+};
+
+#define PLLOUT "pllout"
+
+static int register_pll(struct device_node *node, struct cpg_priv *cpg)
+{
+	const char *clk_name = node->name;
+	const char *parent_name;
+	struct clk_init_data init = {
+		.name = PLLOUT,
+		.ops = &pll_ops,
+		.flags = 0,
+		.num_parents = 1,
+	};
+	int ret;
+
+	parent_name = of_clk_get_parent_name(node, 0);
+	init.parent_names = &parent_name;
+	cpg->hw.init = &init;
+
+	ret = of_clk_hw_register(node, &cpg->hw);
+	if (ret < 0)
+		pr_err("%pOF: failed to add provider %s (%d)\n",
+		       node, clk_name, ret);
+	return ret;
+}
+
+static void clkstp00_sw(struct clk_hw *hw, bool on)
+{
+	u32 val;
+	struct clk_gate *gate = to_clk_gate(hw);
+
+	val = BIT(gate->bit_idx);
+	if (on)
+		writel(val, gate->reg + CLKSTPCLR00);
+	else
+		writel(val, gate->reg);
+}
+
+static int clkstp00_enable(struct clk_hw *hw)
+{
+	clkstp00_sw(hw, true);
+	return 0;
+}
+
+static void clkstp00_disable(struct clk_hw *hw)
+{
+	clkstp00_sw(hw, false);
+}
+
+static int clkstp00_is_enabled(struct clk_hw *hw)
+{
+	u8 val;
+	struct clk_gate *gate = to_clk_gate(hw);
+
+	val = readb(gate->reg);
+	val &= 1 << gate->bit_idx;
+	return val == 0;
+}
+
+static const struct clk_ops gate_clkstp00_ops = {
+	.enable = clkstp00_enable,
+	.disable = clkstp00_disable,
+	.is_enabled = clkstp00_is_enabled,
+};
+
+static struct clk_hw *clk_hw_register_clkstp(struct device_node *node,
+					     const char *name,
+					     const char *parent,
+					     void __iomem *reg, int bit,
+					     spinlock_t *lock)
+{
+	struct clk_gate *gate;
+	struct clk_init_data init = {
+		.name = name,
+		.ops = &gate_clkstp00_ops,
+		.flags = 0,
+		.parent_names = &parent,
+		.num_parents = 1,
+	};
+	struct clk_hw *hw;
+	int ret;
+
+	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
+	if (gate == NULL)
+		goto error;
+	gate->reg = reg;
+	gate->bit_idx = bit;
+	gate->flags = 0;
+	gate->lock = lock;
+	gate->hw.init = &init;
+	hw = &gate->hw;
+	ret = of_clk_hw_register(node, hw);
+	if (ret < 0)
+		goto error;
+	return hw;
+error:
+	kfree(gate);
+	return ERR_PTR(ret);
+}
+
+#define STBCR_BASE 5
+#define CLKSTP_BASE 2
+static int register_div(struct device_node *node, struct cpg_priv *cpg)
+{
+	static const char * const divout[] = {
+		"fck", "bck", "ick",
+	};
+	static const char * const stbcrout[] = {
+		"sci_clk", "rtc_clk", "tmu012_clk",	/* STBCR */
+		"scif_clk", "dmac_clk",			/* STBCR */
+		"ubc_clk", "sq_clk",			/* STBCR2 */
+	};
+	static const char * const clkstpout[] = {
+		"intc_clk", "tmu34_clk", "pcic_clk",	/* CLKSTP00 */
+	};
+
+	int num_clk = ARRAY_SIZE(divout) + ARRAY_SIZE(stbcrout) + ARRAY_SIZE(clkstpout);
+	struct clk_hw_onecell_data *data;
+	struct clk_hw *reg_hw;
+	unsigned int i, n;
+	int ret;
+
+	data = kzalloc(struct_size(data, hws, num_clk + 1), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	num_clk = 0;
+	for (i = 0; i < ARRAY_SIZE(divout); i++) {
+		reg_hw = __clk_hw_register_divider(NULL, node, divout[i],
+						   PLLOUT, NULL, NULL,
+						   0, cpg->frqcr, i * 3, 3,
+						   CLK_DIVIDER_REG_16BIT,
+						   (i == 0) ? pdiv_table : div_table,
+						   &cpg->clklock);
+		if (IS_ERR(reg_hw)) {
+			ret = PTR_ERR(reg_hw);
+			goto error;
+		}
+		data->hws[num_clk++] = reg_hw;
+	}
+
+	n = (cpg->feat & MSTP_CR2) ? ARRAY_SIZE(stbcrout) : STBCR_BASE;
+	for (i = 0; i < n; i++) {
+		u32 off =  (i < (ARRAY_SIZE(stbcrout) - 2)) ? STBCR : STBCR2;
+
+		reg_hw = __clk_hw_register_gate(NULL, node, stbcrout[i],
+						divout[0], NULL, NULL,
+						0, cpg->frqcr + off, i % STBCR_BASE,
+						CLK_GATE_REG_8BIT | CLK_GATE_SET_TO_DISABLE,
+						&cpg->clklock);
+		if (IS_ERR(reg_hw)) {
+			ret = PTR_ERR(reg_hw);
+			goto error;
+		}
+		data->hws[num_clk++] = reg_hw;
+	}
+
+	if (cpg->feat & MSTP_CLKSTP) {
+		n = (cpg->feat & MSTP_CSTP2) ? ARRAY_SIZE(clkstpout) : CLKSTP_BASE;
+		for (i = 0; i < n; i++) {
+			reg_hw = clk_hw_register_clkstp(node, clkstpout[i],
+							divout[0], cpg->clkstp00,
+							i, &cpg->clklock);
+			if (IS_ERR(reg_hw)) {
+				ret = PTR_ERR(reg_hw);
+				goto error;
+			}
+			data->hws[num_clk++] = reg_hw;
+		}
+	}
+
+	data->num = num_clk;
+	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, data);
+	if (ret < 0)
+		goto error;
+	return 0;
+
+error:
+	pr_err("%pOF: failed to register clock (%d)\n",
+		       node, ret);
+	for (num_clk--; num_clk >= 0; num_clk--)
+		kfree(data->hws[num_clk]);
+	kfree(data);
+	return ret;
+}
+
+#define NR_CLKMODE 7
+static int sh7750_cpg_setup(struct device_node *node, u32 feat)
+{
+	struct cpg_priv *cpg;
+	u32 mode = NR_CLKMODE;
+	int ret = 0;
+
+	cpg_data = NULL;
+
+	of_property_read_u32_index(node, "renesas,mode", 0, &mode);
+	if (mode >= NR_CLKMODE) {
+		pr_err("%s: Invalid clock mode setting (%u)\n",
+		       node->name, mode);
+		return -EINVAL;
+	}
+
+	cpg = kzalloc(sizeof(struct cpg_priv), GFP_KERNEL);
+	if (!cpg)
+		return -ENOMEM;
+
+	cpg->frqcr = of_iomap(node, 0);
+	if (cpg->frqcr == NULL) {
+		pr_err("%pOF: failed to map divide register", node);
+		ret = -ENODEV;
+		goto cpg_free;
+	}
+
+	if (feat & MSTP_CLKSTP) {
+		cpg->clkstp00 = of_iomap(node, 1);
+		if (cpg->clkstp00 == NULL) {
+			pr_err("%pOF: failed to map clkstp00 register", node);
+			ret = -ENODEV;
+			goto unmap_frqcr;
+		}
+	}
+	cpg->feat = feat;
+	cpg->mode = mode;
+
+	ret = register_pll(node, cpg);
+	if (ret < 0)
+		goto unmap_clkstp00;
+
+	ret = register_div(node, cpg);
+	if (ret < 0)
+		goto unmap_clkstp00;
+
+	cpg_data = cpg;
+	return 0;
+
+unmap_clkstp00:
+	iounmap(cpg->clkstp00);
+unmap_frqcr:
+	iounmap(cpg->frqcr);
+cpg_free:
+	kfree(cpg);
+	return ret;
+}
+
+static void __init sh7750_cpg_init(struct device_node *node)
+{
+	sh7750_cpg_setup(node, cpg_feature[CPG_SH7750]);
+}
+
+static void __init sh7750s_cpg_init(struct device_node *node)
+{
+	sh7750_cpg_setup(node, cpg_feature[CPG_SH7750S]);
+}
+
+static void __init sh7750r_cpg_init(struct device_node *node)
+{
+	sh7750_cpg_setup(node, cpg_feature[CPG_SH7750R]);
+}
+
+static void __init sh7751_cpg_init(struct device_node *node)
+{
+	sh7750_cpg_setup(node, cpg_feature[CPG_SH7751]);
+}
+
+static void __init sh7751r_cpg_init(struct device_node *node)
+{
+	sh7750_cpg_setup(node, cpg_feature[CPG_SH7751R]);
+}
+
+CLK_OF_DECLARE_DRIVER(sh7750_cpg, "renesas,sh7750-cpg",
+		      sh7750_cpg_init);
+CLK_OF_DECLARE_DRIVER(sh7750s_cpg, "renesas,sh7750s-cpg",
+		      sh7750s_cpg_init);
+CLK_OF_DECLARE_DRIVER(sh7750r_cpg, "renesas,sh7750r-cpg",
+		      sh7750r_cpg_init);
+CLK_OF_DECLARE_DRIVER(sh7751_cpg, "renesas,sh7751-cpg",
+		      sh7751_cpg_init);
+CLK_OF_DECLARE_DRIVER(sh7751r_cpg, "renesas,sh7751r-cpg",
+		      sh7751r_cpg_init);
+
+static int sh7750_cpg_probe(struct platform_device *pdev)
+{
+	u32 feature;
+
+	if (cpg_data)
+		return 0;
+	feature = *(u32 *)of_device_get_match_data(&pdev->dev);
+	return sh7750_cpg_setup(pdev->dev.of_node, feature);
+}
+
+static const struct of_device_id sh7750_cpg_of_match[] = {
+	{ .compatible = "renesas,sh7750-cpg",
+	  .data = &cpg_feature[CPG_SH7750] },
+	{ .compatible = "renesas,sh7750s-cpg",
+	  .data = &cpg_feature[CPG_SH7750S] },
+	{ .compatible = "renesas,sh7750r-cpg",
+	  .data = &cpg_feature[CPG_SH7750R] },
+	{ .compatible = "renesas,sh7751-cpg",
+	  .data = &cpg_feature[CPG_SH7751] },
+	{ .compatible = "renesas,sh7751r-cpg",
+	  .data = &cpg_feature[CPG_SH7751R] },
+	{ }
+};
+
+static struct platform_driver sh7750_cpg_driver = {
+	.probe  = sh7750_cpg_probe,
+	.driver = {
+		.name = "sh7750-cpg",
+		.of_match_table = sh7750_cpg_of_match,
+	},
+};
+builtin_platform_driver(sh7750_cpg_driver);
-- 
2.39.2

