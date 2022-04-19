Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 065BC506DCC
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA3410F014;
	Tue, 19 Apr 2022 13:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6472A10F03F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:42:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B314EB8198D;
 Tue, 19 Apr 2022 13:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF8AC385AA;
 Tue, 19 Apr 2022 13:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375758;
 bh=3Qw/EDM2sQ0Z1WeJM+6k1TL/isGw0AUM08FQLkOT4KM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OmE/rLwny7klxOcrJmOIj7VrwmjTbGl9g7PkSxLoOrh3F1HBJFlaF8P8v64JA+vzN
 qudcdTqtbIvdmkyytHbpm/Pk2du0PqVlfv9b9jz9jOYOfmb2CzqPkGxM8u1MPsjg1g
 fZZfondchaHFAp4lbi5V3l+hIeni6/kiEIPBXKI51lviNgtI3nkoNPr9Dgr1jiECuT
 dZhsUWm1BmckYFkp5SH4MPsroC6ARie6yn0u1xTxHvUvAXJvNhFpdQ3rtLkec+dpV0
 Yuf3CxAe/vOBsJtvsbmsGe1eMRX5okKfbcaorKs/jIq5wsDl9sEi0Q3xgApe9P4N7D
 qoJPd3G+JtgOg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 40/41] [TO BE REBASED] ARM: OMAP1: clock: Convert to CCF
Date: Tue, 19 Apr 2022 15:37:22 +0200
Message-Id: <20220419133723.1394715-41-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419133723.1394715-1-arnd@kernel.org>
References: <20220419133723.1394715-1-arnd@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Janusz Krzysztofik <jmkrzyszt@gmail.com>

OMAP1 still uses its own implementation of standard clock API defined in
include/linux/clk.h.  Internals of that implementation are not visible
outside OMAP1 directory.  As a consequence, device drivers are not able to
register clocks potentially provided by peripheral devices.

Drop OMAP1 implementation of the clock API and enable common clock
framework.  Modify the remaining low level code to be compatible with
clock provider API and register the clocks with CCF.

Move initialisation of clocks to omap1_timer_init() to avoid memory
allocation issues at early setup phase from where omap1_init_early() is
called.  Register the clocks after initialization of clock I/O registers,
local clock pointers used by OMAP1 clock ops, and local .rate fields of
clocks with no local implementation of .recalc ops, so CCF structures are
populated with correct data during clock registration.  Instead of
enabling some of the registered clocks, flag them for CCF as critical.
Introduce .is_enabled op using code that verifies hardware status of clock
enablement, split out from implementation of .disable_unused op, so the
latter is actually called by CCF for not requested but hardware enabled
clocks.  Add .round_rate ops where missing so .set_rate ops are called by
CCF as expected.  Since CCF allows parallel execution of .enable/.disable
and .set_rate ops, protect registers shared among those groups of ops from
concurrent access with spinlocks.  Drop local debugfs support in favor of
that provided by CCF.

v2: flag tc2_ck as CLK_IS_CRITICAL (Aaro)
v3: rebase on top of soc/omap1-multiplatform-5.18,
  - drop no longer needed includes from arch/arm/mach-omap1/io.c

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/clock.c      | 693 +++++++++++++------------------
 arch/arm/mach-omap1/clock.h      | 139 +++----
 arch/arm/mach-omap1/clock_data.c | 483 ++++++++++-----------
 arch/arm/mach-omap1/io.c         |   7 -
 arch/arm/mach-omap1/time.c       |   5 +
 5 files changed, 563 insertions(+), 764 deletions(-)

diff --git a/arch/arm/mach-omap1/clock.c b/arch/arm/mach-omap1/clock.c
index e5bd4d3b742d..83381e23fab9 100644
--- a/arch/arm/mach-omap1/clock.c
+++ b/arch/arm/mach-omap1/clock.c
@@ -16,7 +16,9 @@
 #include <linux/io.h>
 #include <linux/clk.h>
 #include <linux/clkdev.h>
+#include <linux/clk-provider.h>
 #include <linux/soc/ti/omap1-io.h>
+#include <linux/spinlock.h>
 
 #include <asm/mach-types.h>
 
@@ -28,33 +30,37 @@
 #include "sram.h"
 
 __u32 arm_idlect1_mask;
-struct clk *api_ck_p, *ck_dpll1_p, *ck_ref_p;
+/* provide direct internal access (not via clk API) to some clocks */
+struct omap1_clk *api_ck_p, *ck_dpll1_p, *ck_ref_p;
 
-static LIST_HEAD(clocks);
-static DEFINE_MUTEX(clocks_mutex);
-static DEFINE_SPINLOCK(clockfw_lock);
+/* protect registeres shared among clk_enable/disable() and clk_set_rate() operations */
+static DEFINE_SPINLOCK(arm_ckctl_lock);
+static DEFINE_SPINLOCK(arm_idlect2_lock);
+static DEFINE_SPINLOCK(mod_conf_ctrl_0_lock);
+static DEFINE_SPINLOCK(mod_conf_ctrl_1_lock);
+static DEFINE_SPINLOCK(swd_clk_div_ctrl_sel_lock);
 
 /*
  * Omap1 specific clock functions
  */
 
-unsigned long omap1_uart_recalc(struct clk *clk)
+unsigned long omap1_uart_recalc(struct omap1_clk *clk, unsigned long p_rate)
 {
 	unsigned int val = __raw_readl(clk->enable_reg);
 	return val & 1 << clk->enable_bit ? 48000000 : 12000000;
 }
 
-unsigned long omap1_sossi_recalc(struct clk *clk)
+unsigned long omap1_sossi_recalc(struct omap1_clk *clk, unsigned long p_rate)
 {
 	u32 div = omap_readl(MOD_CONF_CTRL_1);
 
 	div = (div >> 17) & 0x7;
 	div++;
 
-	return clk->parent->rate / div;
+	return p_rate / div;
 }
 
-static void omap1_clk_allow_idle(struct clk *clk)
+static void omap1_clk_allow_idle(struct omap1_clk *clk)
 {
 	struct arm_idlect1_clk * iclk = (struct arm_idlect1_clk *)clk;
 
@@ -65,7 +71,7 @@ static void omap1_clk_allow_idle(struct clk *clk)
 		arm_idlect1_mask |= 1 << iclk->idlect_shift;
 }
 
-static void omap1_clk_deny_idle(struct clk *clk)
+static void omap1_clk_deny_idle(struct omap1_clk *clk)
 {
 	struct arm_idlect1_clk * iclk = (struct arm_idlect1_clk *)clk;
 
@@ -129,7 +135,7 @@ static __u16 verify_ckctl_value(__u16 newval)
 	return newval;
 }
 
-static int calc_dsor_exp(struct clk *clk, unsigned long rate)
+static int calc_dsor_exp(unsigned long rate, unsigned long realrate)
 {
 	/* Note: If target frequency is too low, this function will return 4,
 	 * which is invalid value. Caller must check for this value and act
@@ -142,15 +148,11 @@ static int calc_dsor_exp(struct clk *clk, unsigned long rate)
 	 * DSP_CK >= TC_CK
 	 * DSPMMU_CK >= TC_CK
 	 */
-	unsigned long realrate;
-	struct clk * parent;
 	unsigned  dsor_exp;
 
-	parent = clk->parent;
-	if (unlikely(parent == NULL))
+	if (unlikely(realrate == 0))
 		return -EIO;
 
-	realrate = parent->rate;
 	for (dsor_exp=0; dsor_exp<4; dsor_exp++) {
 		if (realrate <= rate)
 			break;
@@ -161,16 +163,50 @@ static int calc_dsor_exp(struct clk *clk, unsigned long rate)
 	return dsor_exp;
 }
 
-unsigned long omap1_ckctl_recalc(struct clk *clk)
+unsigned long omap1_ckctl_recalc(struct omap1_clk *clk, unsigned long p_rate)
 {
 	/* Calculate divisor encoded as 2-bit exponent */
 	int dsor = 1 << (3 & (omap_readw(ARM_CKCTL) >> clk->rate_offset));
 
-	return clk->parent->rate / dsor;
+	/* update locally maintained rate, required by arm_ck for omap1_show_rates() */
+	clk->rate = p_rate / dsor;
+	return clk->rate;
 }
 
-unsigned long omap1_ckctl_recalc_dsp_domain(struct clk *clk)
+static int omap1_clk_is_enabled(struct clk_hw *hw)
 {
+	struct omap1_clk *clk = to_omap1_clk(hw);
+	bool api_ck_was_enabled = true;
+	__u32 regval32;
+	int ret;
+
+	if (!clk->ops)	/* no gate -- always enabled */
+		return 1;
+
+	if (clk->ops == &clkops_dspck) {
+		api_ck_was_enabled = omap1_clk_is_enabled(&api_ck_p->hw);
+		if (!api_ck_was_enabled)
+			if (api_ck_p->ops->enable(api_ck_p) < 0)
+				return 0;
+	}
+
+	if (clk->flags & ENABLE_REG_32BIT)
+		regval32 = __raw_readl(clk->enable_reg);
+	else
+		regval32 = __raw_readw(clk->enable_reg);
+
+	ret = regval32 & (1 << clk->enable_bit);
+
+	if (!api_ck_was_enabled)
+		api_ck_p->ops->disable(api_ck_p);
+
+	return ret;
+}
+
+
+unsigned long omap1_ckctl_recalc_dsp_domain(struct omap1_clk *clk, unsigned long p_rate)
+{
+	bool api_ck_was_enabled;
 	int dsor;
 
 	/* Calculate divisor encoded as 2-bit exponent
@@ -180,15 +216,18 @@ unsigned long omap1_ckctl_recalc_dsp_domain(struct clk *clk)
 	 * Note that DSP_CKCTL virt addr = phys addr, so
 	 * we must use __raw_readw() instead of omap_readw().
 	 */
-	omap1_clk_enable(api_ck_p);
+	api_ck_was_enabled = omap1_clk_is_enabled(&api_ck_p->hw);
+	if (!api_ck_was_enabled)
+		api_ck_p->ops->enable(api_ck_p);
 	dsor = 1 << (3 & (__raw_readw(DSP_CKCTL) >> clk->rate_offset));
-	omap1_clk_disable(api_ck_p);
+	if (!api_ck_was_enabled)
+		api_ck_p->ops->disable(api_ck_p);
 
-	return clk->parent->rate / dsor;
+	return p_rate / dsor;
 }
 
 /* MPU virtual clock functions */
-int omap1_select_table_rate(struct clk *clk, unsigned long rate)
+int omap1_select_table_rate(struct omap1_clk *clk, unsigned long rate, unsigned long p_rate)
 {
 	/* Find the highest supported frequency <= rate and switch to it */
 	struct mpu_rate * ptr;
@@ -223,12 +262,12 @@ int omap1_select_table_rate(struct clk *clk, unsigned long rate)
 	return 0;
 }
 
-int omap1_clk_set_rate_dsp_domain(struct clk *clk, unsigned long rate)
+int omap1_clk_set_rate_dsp_domain(struct omap1_clk *clk, unsigned long rate, unsigned long p_rate)
 {
 	int dsor_exp;
 	u16 regval;
 
-	dsor_exp = calc_dsor_exp(clk, rate);
+	dsor_exp = calc_dsor_exp(rate, p_rate);
 	if (dsor_exp > 3)
 		dsor_exp = -EINVAL;
 	if (dsor_exp < 0)
@@ -238,42 +277,51 @@ int omap1_clk_set_rate_dsp_domain(struct clk *clk, unsigned long rate)
 	regval &= ~(3 << clk->rate_offset);
 	regval |= dsor_exp << clk->rate_offset;
 	__raw_writew(regval, DSP_CKCTL);
-	clk->rate = clk->parent->rate / (1 << dsor_exp);
+	clk->rate = p_rate / (1 << dsor_exp);
 
 	return 0;
 }
 
-long omap1_clk_round_rate_ckctl_arm(struct clk *clk, unsigned long rate)
+long omap1_clk_round_rate_ckctl_arm(struct omap1_clk *clk, unsigned long rate,
+				    unsigned long *p_rate)
 {
-	int dsor_exp = calc_dsor_exp(clk, rate);
+	int dsor_exp = calc_dsor_exp(rate, *p_rate);
+
 	if (dsor_exp < 0)
 		return dsor_exp;
 	if (dsor_exp > 3)
 		dsor_exp = 3;
-	return clk->parent->rate / (1 << dsor_exp);
+	return *p_rate / (1 << dsor_exp);
 }
 
-int omap1_clk_set_rate_ckctl_arm(struct clk *clk, unsigned long rate)
+int omap1_clk_set_rate_ckctl_arm(struct omap1_clk *clk, unsigned long rate, unsigned long p_rate)
 {
+	unsigned long flags;
 	int dsor_exp;
 	u16 regval;
 
-	dsor_exp = calc_dsor_exp(clk, rate);
+	dsor_exp = calc_dsor_exp(rate, p_rate);
 	if (dsor_exp > 3)
 		dsor_exp = -EINVAL;
 	if (dsor_exp < 0)
 		return dsor_exp;
 
+	/* protect ARM_CKCTL register from concurrent access via clk_enable/disable() */
+	spin_lock_irqsave(&arm_ckctl_lock, flags);
+
 	regval = omap_readw(ARM_CKCTL);
 	regval &= ~(3 << clk->rate_offset);
 	regval |= dsor_exp << clk->rate_offset;
 	regval = verify_ckctl_value(regval);
 	omap_writew(regval, ARM_CKCTL);
-	clk->rate = clk->parent->rate / (1 << dsor_exp);
+	clk->rate = p_rate / (1 << dsor_exp);
+
+	spin_unlock_irqrestore(&arm_ckctl_lock, flags);
+
 	return 0;
 }
 
-long omap1_round_to_table_rate(struct clk *clk, unsigned long rate)
+long omap1_round_to_table_rate(struct omap1_clk *clk, unsigned long rate, unsigned long *p_rate)
 {
 	/* Find the highest supported frequency <= rate */
 	struct mpu_rate * ptr;
@@ -324,26 +372,40 @@ static unsigned calc_ext_dsor(unsigned long rate)
 }
 
 /* XXX Only needed on 1510 */
-int omap1_set_uart_rate(struct clk *clk, unsigned long rate)
+long omap1_round_uart_rate(struct omap1_clk *clk, unsigned long rate, unsigned long *p_rate)
 {
+	return rate > 24000000 ? 48000000 : 12000000;
+}
+
+int omap1_set_uart_rate(struct omap1_clk *clk, unsigned long rate, unsigned long p_rate)
+{
+	unsigned long flags;
 	unsigned int val;
 
-	val = __raw_readl(clk->enable_reg);
 	if (rate == 12000000)
-		val &= ~(1 << clk->enable_bit);
+		val = 0;
 	else if (rate == 48000000)
-		val |= (1 << clk->enable_bit);
+		val = 1 << clk->enable_bit;
 	else
 		return -EINVAL;
+
+	/* protect MOD_CONF_CTRL_0 register from concurrent access via clk_enable/disable() */
+	spin_lock_irqsave(&mod_conf_ctrl_0_lock, flags);
+
+	val |= __raw_readl(clk->enable_reg) & ~(1 << clk->enable_bit);
 	__raw_writel(val, clk->enable_reg);
+
+	spin_unlock_irqrestore(&mod_conf_ctrl_0_lock, flags);
+
 	clk->rate = rate;
 
 	return 0;
 }
 
 /* External clock (MCLK & BCLK) functions */
-int omap1_set_ext_clk_rate(struct clk *clk, unsigned long rate)
+int omap1_set_ext_clk_rate(struct omap1_clk *clk, unsigned long rate, unsigned long p_rate)
 {
+	unsigned long flags;
 	unsigned dsor;
 	__u16 ratio_bits;
 
@@ -354,25 +416,53 @@ int omap1_set_ext_clk_rate(struct clk *clk, unsigned long rate)
 	else
 		ratio_bits = (dsor - 2) << 2;
 
+	/* protect SWD_CLK_DIV_CTRL_SEL register from concurrent access via clk_enable/disable() */
+	spin_lock_irqsave(&swd_clk_div_ctrl_sel_lock, flags);
+
 	ratio_bits |= __raw_readw(clk->enable_reg) & ~0xfd;
 	__raw_writew(ratio_bits, clk->enable_reg);
 
+	spin_unlock_irqrestore(&swd_clk_div_ctrl_sel_lock, flags);
+
 	return 0;
 }
 
-int omap1_set_sossi_rate(struct clk *clk, unsigned long rate)
+static int calc_div_sossi(unsigned long rate, unsigned long p_rate)
 {
-	u32 l;
 	int div;
-	unsigned long p_rate;
 
-	p_rate = clk->parent->rate;
 	/* Round towards slower frequency */
 	div = (p_rate + rate - 1) / rate;
-	div--;
+
+	return --div;
+}
+
+long omap1_round_sossi_rate(struct omap1_clk *clk, unsigned long rate, unsigned long *p_rate)
+{
+	int div;
+
+	div = calc_div_sossi(rate, *p_rate);
+	if (div < 0)
+		div = 0;
+	else if (div > 7)
+		div = 7;
+
+	return *p_rate / (div + 1);
+}
+
+int omap1_set_sossi_rate(struct omap1_clk *clk, unsigned long rate, unsigned long p_rate)
+{
+	unsigned long flags;
+	u32 l;
+	int div;
+
+	div = calc_div_sossi(rate, p_rate);
 	if (div < 0 || div > 7)
 		return -EINVAL;
 
+	/* protect MOD_CONF_CTRL_1 register from concurrent access via clk_enable/disable() */
+	spin_lock_irqsave(&mod_conf_ctrl_1_lock, flags);
+
 	l = omap_readl(MOD_CONF_CTRL_1);
 	l &= ~(7 << 17);
 	l |= div << 17;
@@ -380,15 +470,17 @@ int omap1_set_sossi_rate(struct clk *clk, unsigned long rate)
 
 	clk->rate = p_rate / (div + 1);
 
+	spin_unlock_irqrestore(&mod_conf_ctrl_1_lock, flags);
+
 	return 0;
 }
 
-long omap1_round_ext_clk_rate(struct clk *clk, unsigned long rate)
+long omap1_round_ext_clk_rate(struct omap1_clk *clk, unsigned long rate, unsigned long *p_rate)
 {
 	return 96000000 / calc_ext_dsor(rate);
 }
 
-void omap1_init_ext_clk(struct clk *clk)
+int omap1_init_ext_clk(struct omap1_clk *clk)
 {
 	unsigned dsor;
 	__u16 ratio_bits;
@@ -404,59 +496,59 @@ void omap1_init_ext_clk(struct clk *clk)
 		dsor = ratio_bits + 2;
 
 	clk-> rate = 96000000 / dsor;
+
+	return 0;
 }
 
-int omap1_clk_enable(struct clk *clk)
+static int omap1_clk_enable(struct clk_hw *hw)
 {
+	struct omap1_clk *clk = to_omap1_clk(hw), *parent = to_omap1_clk(clk_hw_get_parent(hw));
 	int ret = 0;
 
-	if (clk->usecount++ == 0) {
-		if (clk->parent) {
-			ret = omap1_clk_enable(clk->parent);
-			if (ret)
-				goto err;
-
-			if (clk->flags & CLOCK_NO_IDLE_PARENT)
-				omap1_clk_deny_idle(clk->parent);
-		}
+	if (parent && clk->flags & CLOCK_NO_IDLE_PARENT)
+		omap1_clk_deny_idle(parent);
 
+	if (clk->ops && !(WARN_ON(!clk->ops->enable)))
 		ret = clk->ops->enable(clk);
-		if (ret) {
-			if (clk->parent)
-				omap1_clk_disable(clk->parent);
-			goto err;
-		}
-	}
-	return ret;
 
-err:
-	clk->usecount--;
 	return ret;
 }
 
-void omap1_clk_disable(struct clk *clk)
+static void omap1_clk_disable(struct clk_hw *hw)
 {
-	if (clk->usecount > 0 && !(--clk->usecount)) {
+	struct omap1_clk *clk = to_omap1_clk(hw), *parent = to_omap1_clk(clk_hw_get_parent(hw));
+
+	if (clk->ops && !(WARN_ON(!clk->ops->disable)))
 		clk->ops->disable(clk);
-		if (likely(clk->parent)) {
-			omap1_clk_disable(clk->parent);
-			if (clk->flags & CLOCK_NO_IDLE_PARENT)
-				omap1_clk_allow_idle(clk->parent);
-		}
-	}
+
+	if (likely(parent) && clk->flags & CLOCK_NO_IDLE_PARENT)
+		omap1_clk_allow_idle(parent);
 }
 
-static int omap1_clk_enable_generic(struct clk *clk)
+static int omap1_clk_enable_generic(struct omap1_clk *clk)
 {
+	unsigned long flags;
 	__u16 regval16;
 	__u32 regval32;
 
 	if (unlikely(clk->enable_reg == NULL)) {
 		printk(KERN_ERR "clock.c: Enable for %s without enable code\n",
-		       clk->name);
+		       clk_hw_get_name(&clk->hw));
 		return -EINVAL;
 	}
 
+	/* protect clk->enable_reg from concurrent access via clk_set_rate() */
+	if (clk->enable_reg == OMAP1_IO_ADDRESS(ARM_CKCTL))
+		spin_lock_irqsave(&arm_ckctl_lock, flags);
+	else if (clk->enable_reg == OMAP1_IO_ADDRESS(ARM_IDLECT2))
+		spin_lock_irqsave(&arm_idlect2_lock, flags);
+	else if (clk->enable_reg == OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0))
+		spin_lock_irqsave(&mod_conf_ctrl_0_lock, flags);
+	else if (clk->enable_reg == OMAP1_IO_ADDRESS(MOD_CONF_CTRL_1))
+		spin_lock_irqsave(&mod_conf_ctrl_1_lock, flags);
+	else if (clk->enable_reg == OMAP1_IO_ADDRESS(SWD_CLK_DIV_CTRL_SEL))
+		spin_lock_irqsave(&swd_clk_div_ctrl_sel_lock, flags);
+
 	if (clk->flags & ENABLE_REG_32BIT) {
 		regval32 = __raw_readl(clk->enable_reg);
 		regval32 |= (1 << clk->enable_bit);
@@ -467,17 +559,41 @@ static int omap1_clk_enable_generic(struct clk *clk)
 		__raw_writew(regval16, clk->enable_reg);
 	}
 
+	if (clk->enable_reg == OMAP1_IO_ADDRESS(ARM_CKCTL))
+		spin_unlock_irqrestore(&arm_ckctl_lock, flags);
+	else if (clk->enable_reg == OMAP1_IO_ADDRESS(ARM_IDLECT2))
+		spin_unlock_irqrestore(&arm_idlect2_lock, flags);
+	else if (clk->enable_reg == OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0))
+		spin_unlock_irqrestore(&mod_conf_ctrl_0_lock, flags);
+	else if (clk->enable_reg == OMAP1_IO_ADDRESS(MOD_CONF_CTRL_1))
+		spin_unlock_irqrestore(&mod_conf_ctrl_1_lock, flags);
+	else if (clk->enable_reg == OMAP1_IO_ADDRESS(SWD_CLK_DIV_CTRL_SEL))
+		spin_unlock_irqrestore(&swd_clk_div_ctrl_sel_lock, flags);
+
 	return 0;
 }
 
-static void omap1_clk_disable_generic(struct clk *clk)
+static void omap1_clk_disable_generic(struct omap1_clk *clk)
 {
+	unsigned long flags;
 	__u16 regval16;
 	__u32 regval32;
 
 	if (clk->enable_reg == NULL)
 		return;
 
+	/* protect clk->enable_reg from concurrent access via clk_set_rate() */
+	if (clk->enable_reg == OMAP1_IO_ADDRESS(ARM_CKCTL))
+		spin_lock_irqsave(&arm_ckctl_lock, flags);
+	else if (clk->enable_reg == OMAP1_IO_ADDRESS(ARM_IDLECT2))
+		spin_lock_irqsave(&arm_idlect2_lock, flags);
+	else if (clk->enable_reg == OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0))
+		spin_lock_irqsave(&mod_conf_ctrl_0_lock, flags);
+	else if (clk->enable_reg == OMAP1_IO_ADDRESS(MOD_CONF_CTRL_1))
+		spin_lock_irqsave(&mod_conf_ctrl_1_lock, flags);
+	else if (clk->enable_reg == OMAP1_IO_ADDRESS(SWD_CLK_DIV_CTRL_SEL))
+		spin_lock_irqsave(&swd_clk_div_ctrl_sel_lock, flags);
+
 	if (clk->flags & ENABLE_REG_32BIT) {
 		regval32 = __raw_readl(clk->enable_reg);
 		regval32 &= ~(1 << clk->enable_bit);
@@ -487,6 +603,17 @@ static void omap1_clk_disable_generic(struct clk *clk)
 		regval16 &= ~(1 << clk->enable_bit);
 		__raw_writew(regval16, clk->enable_reg);
 	}
+
+	if (clk->enable_reg == OMAP1_IO_ADDRESS(ARM_CKCTL))
+		spin_unlock_irqrestore(&arm_ckctl_lock, flags);
+	else if (clk->enable_reg == OMAP1_IO_ADDRESS(ARM_IDLECT2))
+		spin_unlock_irqrestore(&arm_idlect2_lock, flags);
+	else if (clk->enable_reg == OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0))
+		spin_unlock_irqrestore(&mod_conf_ctrl_0_lock, flags);
+	else if (clk->enable_reg == OMAP1_IO_ADDRESS(MOD_CONF_CTRL_1))
+		spin_unlock_irqrestore(&mod_conf_ctrl_1_lock, flags);
+	else if (clk->enable_reg == OMAP1_IO_ADDRESS(SWD_CLK_DIV_CTRL_SEL))
+		spin_unlock_irqrestore(&swd_clk_div_ctrl_sel_lock, flags);
 }
 
 const struct clkops clkops_generic = {
@@ -494,25 +621,38 @@ const struct clkops clkops_generic = {
 	.disable	= omap1_clk_disable_generic,
 };
 
-static int omap1_clk_enable_dsp_domain(struct clk *clk)
+static int omap1_clk_enable_dsp_domain(struct omap1_clk *clk)
 {
-	int retval;
+	bool api_ck_was_enabled;
+	int retval = 0;
+
+	api_ck_was_enabled = omap1_clk_is_enabled(&api_ck_p->hw);
+	if (!api_ck_was_enabled)
+		retval = api_ck_p->ops->enable(api_ck_p);
 
-	retval = omap1_clk_enable(api_ck_p);
 	if (!retval) {
 		retval = omap1_clk_enable_generic(clk);
-		omap1_clk_disable(api_ck_p);
+
+		if (!api_ck_was_enabled)
+			api_ck_p->ops->disable(api_ck_p);
 	}
 
 	return retval;
 }
 
-static void omap1_clk_disable_dsp_domain(struct clk *clk)
+static void omap1_clk_disable_dsp_domain(struct omap1_clk *clk)
 {
-	if (omap1_clk_enable(api_ck_p) == 0) {
-		omap1_clk_disable_generic(clk);
-		omap1_clk_disable(api_ck_p);
-	}
+	bool api_ck_was_enabled;
+
+	api_ck_was_enabled = omap1_clk_is_enabled(&api_ck_p->hw);
+	if (!api_ck_was_enabled)
+		if (api_ck_p->ops->enable(api_ck_p) < 0)
+			return;
+
+	omap1_clk_disable_generic(clk);
+
+	if (!api_ck_was_enabled)
+		api_ck_p->ops->disable(api_ck_p);
 }
 
 const struct clkops clkops_dspck = {
@@ -521,7 +661,7 @@ const struct clkops clkops_dspck = {
 };
 
 /* XXX SYSC register handling does not belong in the clock framework */
-static int omap1_clk_enable_uart_functional_16xx(struct clk *clk)
+static int omap1_clk_enable_uart_functional_16xx(struct omap1_clk *clk)
 {
 	int ret;
 	struct uart_clk *uclk;
@@ -538,7 +678,7 @@ static int omap1_clk_enable_uart_functional_16xx(struct clk *clk)
 }
 
 /* XXX SYSC register handling does not belong in the clock framework */
-static void omap1_clk_disable_uart_functional_16xx(struct clk *clk)
+static void omap1_clk_disable_uart_functional_16xx(struct omap1_clk *clk)
 {
 	struct uart_clk *uclk;
 
@@ -555,20 +695,33 @@ const struct clkops clkops_uart_16xx = {
 	.disable	= omap1_clk_disable_uart_functional_16xx,
 };
 
-long omap1_clk_round_rate(struct clk *clk, unsigned long rate)
+static unsigned long omap1_clk_recalc_rate(struct clk_hw *hw, unsigned long p_rate)
 {
-	if (clk->round_rate != NULL)
-		return clk->round_rate(clk, rate);
+	struct omap1_clk *clk = to_omap1_clk(hw);
+
+	if (clk->recalc)
+		return clk->recalc(clk, p_rate);
 
 	return clk->rate;
 }
 
-int omap1_clk_set_rate(struct clk *clk, unsigned long rate)
+static long omap1_clk_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *p_rate)
+{
+	struct omap1_clk *clk = to_omap1_clk(hw);
+
+	if (clk->round_rate != NULL)
+		return clk->round_rate(clk, rate, p_rate);
+
+	return omap1_clk_recalc_rate(hw, *p_rate);
+}
+
+static int omap1_clk_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long p_rate)
 {
+	struct omap1_clk *clk = to_omap1_clk(hw);
 	int  ret = -EINVAL;
 
 	if (clk->set_rate)
-		ret = clk->set_rate(clk, rate);
+		ret = clk->set_rate(clk, rate, p_rate);
 	return ret;
 }
 
@@ -576,243 +729,105 @@ int omap1_clk_set_rate(struct clk *clk, unsigned long rate)
  * Omap1 clock reset and init functions
  */
 
+static int omap1_clk_init_op(struct clk_hw *hw)
+{
+	struct omap1_clk *clk = to_omap1_clk(hw);
+
+	if (clk->init)
+		return clk->init(clk);
+
+	return 0;
+}
+
 #ifdef CONFIG_OMAP_RESET_CLOCKS
 
-void omap1_clk_disable_unused(struct clk *clk)
+static void omap1_clk_disable_unused(struct clk_hw *hw)
 {
-	__u32 regval32;
+	struct omap1_clk *clk = to_omap1_clk(hw);
+	const char *name = clk_hw_get_name(hw);
 
 	/* Clocks in the DSP domain need api_ck. Just assume bootloader
 	 * has not enabled any DSP clocks */
 	if (clk->enable_reg == DSP_IDLECT2) {
-		pr_info("Skipping reset check for DSP domain clock \"%s\"\n",
-			clk->name);
+		pr_info("Skipping reset check for DSP domain clock \"%s\"\n", name);
 		return;
 	}
 
-	/* Is the clock already disabled? */
-	if (clk->flags & ENABLE_REG_32BIT)
-		regval32 = __raw_readl(clk->enable_reg);
-	else
-		regval32 = __raw_readw(clk->enable_reg);
-
-	if ((regval32 & (1 << clk->enable_bit)) == 0)
-		return;
-
-	printk(KERN_INFO "Disabling unused clock \"%s\"... ", clk->name);
-	clk->ops->disable(clk);
+	pr_info("Disabling unused clock \"%s\"... ", name);
+	omap1_clk_disable(hw);
 	printk(" done\n");
 }
 
 #endif
 
+const struct clk_ops omap1_clk_gate_ops = {
+	.enable		= omap1_clk_enable,
+	.disable	= omap1_clk_disable,
+	.is_enabled	= omap1_clk_is_enabled,
+#ifdef CONFIG_OMAP_RESET_CLOCKS
+	.disable_unused	= omap1_clk_disable_unused,
+#endif
+};
 
-int clk_enable(struct clk *clk)
-{
-	unsigned long flags;
-	int ret;
-
-	if (IS_ERR_OR_NULL(clk))
-		return -EINVAL;
-
-	spin_lock_irqsave(&clockfw_lock, flags);
-	ret = omap1_clk_enable(clk);
-	spin_unlock_irqrestore(&clockfw_lock, flags);
-
-	return ret;
-}
-EXPORT_SYMBOL(clk_enable);
-
-void clk_disable(struct clk *clk)
-{
-	unsigned long flags;
-
-	if (IS_ERR_OR_NULL(clk))
-		return;
-
-	spin_lock_irqsave(&clockfw_lock, flags);
-	if (clk->usecount == 0) {
-		pr_err("Trying disable clock %s with 0 usecount\n",
-		       clk->name);
-		WARN_ON(1);
-		goto out;
-	}
-
-	omap1_clk_disable(clk);
-
-out:
-	spin_unlock_irqrestore(&clockfw_lock, flags);
-}
-EXPORT_SYMBOL(clk_disable);
-
-unsigned long clk_get_rate(struct clk *clk)
-{
-	unsigned long flags;
-	unsigned long ret;
-
-	if (IS_ERR_OR_NULL(clk))
-		return 0;
-
-	spin_lock_irqsave(&clockfw_lock, flags);
-	ret = clk->rate;
-	spin_unlock_irqrestore(&clockfw_lock, flags);
-
-	return ret;
-}
-EXPORT_SYMBOL(clk_get_rate);
-
-/*
- * Optional clock functions defined in include/linux/clk.h
- */
-
-long clk_round_rate(struct clk *clk, unsigned long rate)
-{
-	unsigned long flags;
-	long ret;
-
-	if (IS_ERR_OR_NULL(clk))
-		return 0;
-
-	spin_lock_irqsave(&clockfw_lock, flags);
-	ret = omap1_clk_round_rate(clk, rate);
-	spin_unlock_irqrestore(&clockfw_lock, flags);
-
-	return ret;
-}
-EXPORT_SYMBOL(clk_round_rate);
-
-int clk_set_rate(struct clk *clk, unsigned long rate)
-{
-	unsigned long flags;
-	int ret = -EINVAL;
-
-	if (IS_ERR_OR_NULL(clk))
-		return ret;
-
-	spin_lock_irqsave(&clockfw_lock, flags);
-	ret = omap1_clk_set_rate(clk, rate);
-	if (ret == 0)
-		propagate_rate(clk);
-	spin_unlock_irqrestore(&clockfw_lock, flags);
-
-	return ret;
-}
-EXPORT_SYMBOL(clk_set_rate);
-
-int clk_set_parent(struct clk *clk, struct clk *parent)
-{
-	WARN_ONCE(1, "clk_set_parent() not implemented for OMAP1\n");
-
-	return -EINVAL;
-}
-EXPORT_SYMBOL(clk_set_parent);
+const struct clk_ops omap1_clk_rate_ops = {
+	.recalc_rate	= omap1_clk_recalc_rate,
+	.round_rate	= omap1_clk_round_rate,
+	.set_rate	= omap1_clk_set_rate,
+	.init		= omap1_clk_init_op,
+};
 
-struct clk *clk_get_parent(struct clk *clk)
-{
-	return clk->parent;
-}
-EXPORT_SYMBOL(clk_get_parent);
+const struct clk_ops omap1_clk_full_ops = {
+	.enable		= omap1_clk_enable,
+	.disable	= omap1_clk_disable,
+	.is_enabled	= omap1_clk_is_enabled,
+#ifdef CONFIG_OMAP_RESET_CLOCKS
+	.disable_unused	= omap1_clk_disable_unused,
+#endif
+	.recalc_rate	= omap1_clk_recalc_rate,
+	.round_rate	= omap1_clk_round_rate,
+	.set_rate	= omap1_clk_set_rate,
+	.init		= omap1_clk_init_op,
+};
 
 /*
  * OMAP specific clock functions shared between omap1 and omap2
  */
 
 /* Used for clocks that always have same value as the parent clock */
-unsigned long followparent_recalc(struct clk *clk)
+unsigned long followparent_recalc(struct omap1_clk *clk, unsigned long p_rate)
 {
-	return clk->parent->rate;
+	return p_rate;
 }
 
 /*
  * Used for clocks that have the same value as the parent clock,
  * divided by some factor
  */
-unsigned long omap_fixed_divisor_recalc(struct clk *clk)
+unsigned long omap_fixed_divisor_recalc(struct omap1_clk *clk, unsigned long p_rate)
 {
 	WARN_ON(!clk->fixed_div);
 
-	return clk->parent->rate / clk->fixed_div;
+	return p_rate / clk->fixed_div;
 }
 
 /* Propagate rate to children */
-void propagate_rate(struct clk *tclk)
+void propagate_rate(struct omap1_clk *tclk)
 {
 	struct clk *clkp;
 
-	list_for_each_entry(clkp, &tclk->children, sibling) {
-		if (clkp->recalc)
-			clkp->rate = clkp->recalc(clkp);
-		propagate_rate(clkp);
-	}
-}
-
-static LIST_HEAD(root_clks);
-
-/**
- * clk_preinit - initialize any fields in the struct clk before clk init
- * @clk: struct clk * to initialize
- *
- * Initialize any struct clk fields needed before normal clk initialization
- * can run.  No return value.
- */
-void clk_preinit(struct clk *clk)
-{
-	INIT_LIST_HEAD(&clk->children);
-}
-
-int clk_register(struct clk *clk)
-{
-	if (IS_ERR_OR_NULL(clk))
-		return -EINVAL;
-
-	/*
-	 * trap out already registered clocks
-	 */
-	if (clk->node.next || clk->node.prev)
-		return 0;
-
-	mutex_lock(&clocks_mutex);
-	if (clk->parent)
-		list_add(&clk->sibling, &clk->parent->children);
-	else
-		list_add(&clk->sibling, &root_clks);
-
-	list_add(&clk->node, &clocks);
-	if (clk->init)
-		clk->init(clk);
-	mutex_unlock(&clocks_mutex);
-
-	return 0;
-}
-EXPORT_SYMBOL(clk_register);
-
-void clk_unregister(struct clk *clk)
-{
-	if (IS_ERR_OR_NULL(clk))
+	/* depend on CCF ability to recalculate new rates across whole clock subtree */
+	if (WARN_ON(!(clk_hw_get_flags(&tclk->hw) & CLK_GET_RATE_NOCACHE)))
 		return;
 
-	mutex_lock(&clocks_mutex);
-	list_del(&clk->sibling);
-	list_del(&clk->node);
-	mutex_unlock(&clocks_mutex);
-}
-EXPORT_SYMBOL(clk_unregister);
-
-/*
- * Low level helpers
- */
-static int clkll_enable_null(struct clk *clk)
-{
-	return 0;
-}
+	clkp = clk_get_sys(NULL, clk_hw_get_name(&tclk->hw));
+	if (WARN_ON(!clkp))
+		return;
 
-static void clkll_disable_null(struct clk *clk)
-{
+	clk_get_rate(clkp);
+	clk_put(clkp);
 }
 
-const struct clkops clkops_null = {
-	.enable		= clkll_enable_null,
-	.disable	= clkll_disable_null,
+const struct clk_ops omap1_clk_null_ops = {
 };
 
 /*
@@ -820,114 +835,6 @@ const struct clkops clkops_null = {
  *
  * Used for clock aliases that are needed on some OMAPs, but not others
  */
-struct clk dummy_ck = {
-	.name	= "dummy",
-	.ops	= &clkops_null,
+struct omap1_clk dummy_ck __refdata = {
+	.hw.init	= CLK_HW_INIT_NO_PARENT("dummy", &omap1_clk_null_ops, 0),
 };
-
-/*
- *
- */
-
-#ifdef CONFIG_OMAP_RESET_CLOCKS
-/*
- * Disable any unused clocks left on by the bootloader
- */
-static int __init clk_disable_unused(void)
-{
-	struct clk *ck;
-	unsigned long flags;
-
-	pr_info("clock: disabling unused clocks to save power\n");
-
-	spin_lock_irqsave(&clockfw_lock, flags);
-	list_for_each_entry(ck, &clocks, node) {
-		if (ck->ops == &clkops_null)
-			continue;
-
-		if (ck->usecount > 0 || !ck->enable_reg)
-			continue;
-
-		omap1_clk_disable_unused(ck);
-	}
-	spin_unlock_irqrestore(&clockfw_lock, flags);
-
-	return 0;
-}
-late_initcall(clk_disable_unused);
-#endif
-
-#if defined(CONFIG_PM_DEBUG) && defined(CONFIG_DEBUG_FS)
-/*
- *	debugfs support to trace clock tree hierarchy and attributes
- */
-
-#include <linux/debugfs.h>
-#include <linux/seq_file.h>
-
-static struct dentry *clk_debugfs_root;
-
-static int debug_clock_show(struct seq_file *s, void *unused)
-{
-	struct clk *c;
-	struct clk *pa;
-
-	mutex_lock(&clocks_mutex);
-	seq_printf(s, "%-30s %-30s %-10s %s\n",
-		   "clock-name", "parent-name", "rate", "use-count");
-
-	list_for_each_entry(c, &clocks, node) {
-		pa = c->parent;
-		seq_printf(s, "%-30s %-30s %-10lu %d\n",
-			   c->name, pa ? pa->name : "none", c->rate,
-			   c->usecount);
-	}
-	mutex_unlock(&clocks_mutex);
-
-	return 0;
-}
-
-DEFINE_SHOW_ATTRIBUTE(debug_clock);
-
-static void clk_debugfs_register_one(struct clk *c)
-{
-	struct dentry *d;
-	struct clk *pa = c->parent;
-
-	d = debugfs_create_dir(c->name, pa ? pa->dent : clk_debugfs_root);
-	c->dent = d;
-
-	debugfs_create_u8("usecount", S_IRUGO, c->dent, &c->usecount);
-	debugfs_create_ulong("rate", S_IRUGO, c->dent, &c->rate);
-	debugfs_create_x8("flags", S_IRUGO, c->dent, &c->flags);
-}
-
-static void clk_debugfs_register(struct clk *c)
-{
-	struct clk *pa = c->parent;
-
-	if (pa && !pa->dent)
-		clk_debugfs_register(pa);
-
-	if (!c->dent)
-		clk_debugfs_register_one(c);
-}
-
-static int __init clk_debugfs_init(void)
-{
-	struct clk *c;
-	struct dentry *d;
-
-	d = debugfs_create_dir("clock", NULL);
-	clk_debugfs_root = d;
-
-	list_for_each_entry(c, &clocks, node)
-		clk_debugfs_register(c);
-
-	debugfs_create_file("summary", S_IRUGO, d, NULL, &debug_clock_fops);
-
-	return 0;
-}
-late_initcall(clk_debugfs_init);
-
-#endif /* defined(CONFIG_PM_DEBUG) && defined(CONFIG_DEBUG_FS) */
diff --git a/arch/arm/mach-omap1/clock.h b/arch/arm/mach-omap1/clock.h
index 8025e4a22469..16cfb2e86ee4 100644
--- a/arch/arm/mach-omap1/clock.h
+++ b/arch/arm/mach-omap1/clock.h
@@ -11,12 +11,11 @@
 #define __ARCH_ARM_MACH_OMAP1_CLOCK_H
 
 #include <linux/clk.h>
-#include <linux/list.h>
-
 #include <linux/clkdev.h>
+#include <linux/clk-provider.h>
 
 struct module;
-struct clk;
+struct omap1_clk;
 
 struct omap_clk {
 	u16				cpu;
@@ -29,7 +28,7 @@ struct omap_clk {
 		.lk = {			\
 			.dev_id = dev,	\
 			.con_id = con,	\
-			.clk = ck,	\
+			.clk_hw = ck,	\
 		},			\
 	}
 
@@ -40,10 +39,6 @@ struct omap_clk {
 #define CK_16XX		(1 << 3)	/* 16xx, 17xx, 5912 */
 #define CK_1710		(1 << 4)	/* 1710 extra for rate selection */
 
-
-/* Temporary, needed during the common clock framework conversion */
-#define __clk_get_name(clk)	(clk->name)
-
 /**
  * struct clkops - some clock function pointers
  * @enable: fn ptr that enables the current clock in hardware
@@ -51,8 +46,8 @@ struct omap_clk {
  * @allow_idle: fn ptr that enables autoidle for the current clock in hardware
  */
 struct clkops {
-	int			(*enable)(struct clk *);
-	void			(*disable)(struct clk *);
+	int			(*enable)(struct omap1_clk *clk);
+	void			(*disable)(struct omap1_clk *clk);
 };
 
 /*
@@ -65,13 +60,9 @@ struct clkops {
 #define CLOCK_NO_IDLE_PARENT	(1 << 2)
 
 /**
- * struct clk - OMAP struct clk
- * @node: list_head connecting this clock into the full clock list
+ * struct omap1_clk - OMAP1 struct clk
+ * @hw: struct clk_hw for common clock framework integration
  * @ops: struct clkops * for this clock
- * @name: the name of the clock in the hardware (used in hwmod data and debug)
- * @parent: pointer to this clock's parent struct clk
- * @children: list_head connecting to the child clks' @sibling list_heads
- * @sibling: list_head connecting this clk to its parent clk's @children
  * @rate: current clock rate
  * @enable_reg: register to write to enable the clock (see @enable_bit)
  * @recalc: fn ptr that returns the clock's current rate
@@ -79,102 +70,65 @@ struct clkops {
  * @round_rate: fn ptr that can round the clock's current rate
  * @init: fn ptr to do clock-specific initialization
  * @enable_bit: bitshift to write to enable/disable the clock (see @enable_reg)
- * @usecount: number of users that have requested this clock to be enabled
  * @fixed_div: when > 0, this clock's rate is its parent's rate / @fixed_div
  * @flags: see "struct clk.flags possibilities" above
  * @rate_offset: bitshift for rate selection bitfield (OMAP1 only)
- *
- * XXX @rate_offset should probably be removed and OMAP1
- * clock code converted to use clksel.
- *
- * XXX @usecount is poorly named.  It should be "enable_count" or
- * something similar.  "users" in the description refers to kernel
- * code (core code or drivers) that have called clk_enable() and not
- * yet called clk_disable(); the usecount of parent clocks is also
- * incremented by the clock code when clk_enable() is called on child
- * clocks and decremented by the clock code when clk_disable() is
- * called on child clocks.
- *
- * XXX @usecount, @children, @sibling should be marked for
- * internal use only.
- *
- * @children and @sibling are used to optimize parent-to-child clock
- * tree traversals.  (child-to-parent traversals use @parent.)
- *
- * XXX The notion of the clock's current rate probably needs to be
- * separated from the clock's target rate.
  */
-struct clk {
-	struct list_head	node;
+struct omap1_clk {
+	struct clk_hw		hw;
 	const struct clkops	*ops;
-	const char		*name;
-	struct clk		*parent;
-	struct list_head	children;
-	struct list_head	sibling;	/* node for children */
 	unsigned long		rate;
 	void __iomem		*enable_reg;
-	unsigned long		(*recalc)(struct clk *);
-	int			(*set_rate)(struct clk *, unsigned long);
-	long			(*round_rate)(struct clk *, unsigned long);
-	void			(*init)(struct clk *);
+	unsigned long		(*recalc)(struct omap1_clk *clk, unsigned long rate);
+	int			(*set_rate)(struct omap1_clk *clk, unsigned long rate,
+					    unsigned long p_rate);
+	long			(*round_rate)(struct omap1_clk *clk, unsigned long rate,
+					      unsigned long *p_rate);
+	int			(*init)(struct omap1_clk *clk);
 	u8			enable_bit;
-	s8			usecount;
 	u8			fixed_div;
 	u8			flags;
 	u8			rate_offset;
-#if defined(CONFIG_PM_DEBUG) && defined(CONFIG_DEBUG_FS)
-	struct dentry		*dent;	/* For visible tree hierarchy */
-#endif
 };
+#define to_omap1_clk(_hw)	container_of(_hw, struct omap1_clk, hw)
 
-extern void clk_preinit(struct clk *clk);
-extern int clk_register(struct clk *clk);
-extern void clk_unregister(struct clk *clk);
-extern void propagate_rate(struct clk *clk);
-extern unsigned long followparent_recalc(struct clk *clk);
-unsigned long omap_fixed_divisor_recalc(struct clk *clk);
+void propagate_rate(struct omap1_clk *clk);
+unsigned long followparent_recalc(struct omap1_clk *clk, unsigned long p_rate);
+unsigned long omap_fixed_divisor_recalc(struct omap1_clk *clk, unsigned long p_rate);
 
-extern const struct clkops clkops_null;
-
-extern struct clk dummy_ck;
+extern struct omap1_clk dummy_ck;
 
 int omap1_clk_init(void);
 void omap1_clk_late_init(void);
-extern int omap1_clk_enable(struct clk *clk);
-extern void omap1_clk_disable(struct clk *clk);
-extern long omap1_clk_round_rate(struct clk *clk, unsigned long rate);
-extern int omap1_clk_set_rate(struct clk *clk, unsigned long rate);
-extern unsigned long omap1_ckctl_recalc(struct clk *clk);
-extern int omap1_set_sossi_rate(struct clk *clk, unsigned long rate);
-extern unsigned long omap1_sossi_recalc(struct clk *clk);
-extern unsigned long omap1_ckctl_recalc_dsp_domain(struct clk *clk);
-extern int omap1_clk_set_rate_dsp_domain(struct clk *clk, unsigned long rate);
-extern int omap1_set_uart_rate(struct clk *clk, unsigned long rate);
-extern unsigned long omap1_uart_recalc(struct clk *clk);
-extern int omap1_set_ext_clk_rate(struct clk *clk, unsigned long rate);
-extern long omap1_round_ext_clk_rate(struct clk *clk, unsigned long rate);
-extern void omap1_init_ext_clk(struct clk *clk);
-extern int omap1_select_table_rate(struct clk *clk, unsigned long rate);
-extern long omap1_round_to_table_rate(struct clk *clk, unsigned long rate);
-extern int omap1_clk_set_rate_ckctl_arm(struct clk *clk, unsigned long rate);
-extern long omap1_clk_round_rate_ckctl_arm(struct clk *clk, unsigned long rate);
-
-#ifdef CONFIG_OMAP_RESET_CLOCKS
-extern void omap1_clk_disable_unused(struct clk *clk);
-#else
-#define omap1_clk_disable_unused	NULL
-#endif
+unsigned long omap1_ckctl_recalc(struct omap1_clk *clk, unsigned long p_rate);
+long omap1_round_sossi_rate(struct omap1_clk *clk, unsigned long rate, unsigned long *p_rate);
+int omap1_set_sossi_rate(struct omap1_clk *clk, unsigned long rate, unsigned long p_rate);
+unsigned long omap1_sossi_recalc(struct omap1_clk *clk, unsigned long p_rate);
+unsigned long omap1_ckctl_recalc_dsp_domain(struct omap1_clk *clk, unsigned long p_rate);
+int omap1_clk_set_rate_dsp_domain(struct omap1_clk *clk, unsigned long rate,
+				  unsigned long p_rate);
+long omap1_round_uart_rate(struct omap1_clk *clk, unsigned long rate, unsigned long *p_rate);
+int omap1_set_uart_rate(struct omap1_clk *clk, unsigned long rate, unsigned long p_rate);
+unsigned long omap1_uart_recalc(struct omap1_clk *clk, unsigned long p_rate);
+int omap1_set_ext_clk_rate(struct omap1_clk *clk, unsigned long rate, unsigned long p_rate);
+long omap1_round_ext_clk_rate(struct omap1_clk *clk, unsigned long rate, unsigned long *p_rate);
+int omap1_init_ext_clk(struct omap1_clk *clk);
+int omap1_select_table_rate(struct omap1_clk *clk, unsigned long rate, unsigned long p_rate);
+long omap1_round_to_table_rate(struct omap1_clk *clk, unsigned long rate, unsigned long *p_rate);
+int omap1_clk_set_rate_ckctl_arm(struct omap1_clk *clk, unsigned long rate, unsigned long p_rate);
+long omap1_clk_round_rate_ckctl_arm(struct omap1_clk *clk, unsigned long rate,
+				    unsigned long *p_rate);
 
 struct uart_clk {
-	struct clk	clk;
-	unsigned long	sysc_addr;
+	struct omap1_clk	clk;
+	unsigned long		sysc_addr;
 };
 
 /* Provide a method for preventing idling some ARM IDLECT clocks */
 struct arm_idlect1_clk {
-	struct clk	clk;
-	unsigned long	no_idle_count;
-	__u8		idlect_shift;
+	struct omap1_clk	clk;
+	unsigned long		no_idle_count;
+	__u8			idlect_shift;
 };
 
 /* ARM_CKCTL bit shifts */
@@ -224,7 +178,7 @@ struct arm_idlect1_clk {
 #define SOFT_REQ_REG2		0xfffe0880
 
 extern __u32 arm_idlect1_mask;
-extern struct clk *api_ck_p, *ck_dpll1_p, *ck_ref_p;
+extern struct omap1_clk *api_ck_p, *ck_dpll1_p, *ck_ref_p;
 
 extern const struct clkops clkops_dspck;
 extern const struct clkops clkops_uart_16xx;
@@ -233,4 +187,9 @@ extern const struct clkops clkops_generic;
 /* used for passing SoC type to omap1_{select,round_to}_table_rate() */
 extern u32 cpu_mask;
 
+extern const struct clk_ops omap1_clk_null_ops;
+extern const struct clk_ops omap1_clk_gate_ops;
+extern const struct clk_ops omap1_clk_rate_ops;
+extern const struct clk_ops omap1_clk_full_ops;
+
 #endif
diff --git a/arch/arm/mach-omap1/clock_data.c b/arch/arm/mach-omap1/clock_data.c
index 9b9c9fcc61c2..0b42a6e3f8ea 100644
--- a/arch/arm/mach-omap1/clock_data.c
+++ b/arch/arm/mach-omap1/clock_data.c
@@ -14,6 +14,8 @@
 #include <linux/kernel.h>
 #include <linux/io.h>
 #include <linux/clk.h>
+#include <linux/clkdev.h>
+#include <linux/clk-provider.h>
 #include <linux/cpufreq.h>
 #include <linux/delay.h>
 #include <linux/soc/ti/omap1-io.h>
@@ -71,16 +73,18 @@
  * Omap1 clocks
  */
 
-static struct clk ck_ref = {
-	.name		= "ck_ref",
-	.ops		= &clkops_null,
+static struct omap1_clk ck_ref = {
+	.hw.init	= CLK_HW_INIT_NO_PARENT("ck_ref", &omap1_clk_rate_ops, 0),
 	.rate		= 12000000,
 };
 
-static struct clk ck_dpll1 = {
-	.name		= "ck_dpll1",
-	.ops		= &clkops_null,
-	.parent		= &ck_ref,
+static struct omap1_clk ck_dpll1 = {
+	.hw.init	= CLK_HW_INIT("ck_dpll1", "ck_ref", &omap1_clk_rate_ops,
+				      /*
+				       * force recursive refresh of rates of the clock
+				       * and its children when clk_get_rate() is called
+				       */
+				      CLK_GET_RATE_NOCACHE),
 };
 
 /*
@@ -89,32 +93,28 @@ static struct clk ck_dpll1 = {
  */
 static struct arm_idlect1_clk ck_dpll1out = {
 	.clk = {
-		.name		= "ck_dpll1out",
+		.hw.init	= CLK_HW_INIT("ck_dpll1out", "ck_dpll1", &omap1_clk_gate_ops, 0),
 		.ops		= &clkops_generic,
-		.parent		= &ck_dpll1,
 		.flags		= CLOCK_IDLE_CONTROL | ENABLE_REG_32BIT,
 		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 		.enable_bit	= EN_CKOUT_ARM,
-		.recalc		= &followparent_recalc,
 	},
 	.idlect_shift	= IDL_CLKOUT_ARM_SHIFT,
 };
 
-static struct clk sossi_ck = {
-	.name		= "ck_sossi",
+static struct omap1_clk sossi_ck = {
+	.hw.init	= CLK_HW_INIT("ck_sossi", "ck_dpll1out", &omap1_clk_full_ops, 0),
 	.ops		= &clkops_generic,
-	.parent		= &ck_dpll1out.clk,
 	.flags		= CLOCK_NO_IDLE_PARENT | ENABLE_REG_32BIT,
 	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_1),
 	.enable_bit	= CONF_MOD_SOSSI_CLK_EN_R,
 	.recalc		= &omap1_sossi_recalc,
+	.round_rate	= &omap1_round_sossi_rate,
 	.set_rate	= &omap1_set_sossi_rate,
 };
 
-static struct clk arm_ck = {
-	.name		= "arm_ck",
-	.ops		= &clkops_null,
-	.parent		= &ck_dpll1,
+static struct omap1_clk arm_ck = {
+	.hw.init	= CLK_HW_INIT("arm_ck", "ck_dpll1", &omap1_clk_rate_ops, 0),
 	.rate_offset	= CKCTL_ARMDIV_OFFSET,
 	.recalc		= &omap1_ckctl_recalc,
 	.round_rate	= omap1_clk_round_rate_ckctl_arm,
@@ -123,9 +123,9 @@ static struct clk arm_ck = {
 
 static struct arm_idlect1_clk armper_ck = {
 	.clk = {
-		.name		= "armper_ck",
+		.hw.init	= CLK_HW_INIT("armper_ck", "ck_dpll1", &omap1_clk_full_ops,
+					      CLK_IS_CRITICAL),
 		.ops		= &clkops_generic,
-		.parent		= &ck_dpll1,
 		.flags		= CLOCK_IDLE_CONTROL,
 		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 		.enable_bit	= EN_PERCK,
@@ -141,46 +141,41 @@ static struct arm_idlect1_clk armper_ck = {
  * FIXME: This clock seems to be necessary but no-one has asked for its
  * activation.  [ GPIO code for 1510 ]
  */
-static struct clk arm_gpio_ck = {
-	.name		= "ick",
+static struct omap1_clk arm_gpio_ck = {
+	.hw.init	= CLK_HW_INIT("ick", "ck_dpll1", &omap1_clk_gate_ops, CLK_IS_CRITICAL),
 	.ops		= &clkops_generic,
-	.parent		= &ck_dpll1,
 	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 	.enable_bit	= EN_GPIOCK,
-	.recalc		= &followparent_recalc,
 };
 
 static struct arm_idlect1_clk armxor_ck = {
 	.clk = {
-		.name		= "armxor_ck",
+		.hw.init	= CLK_HW_INIT("armxor_ck", "ck_ref", &omap1_clk_gate_ops,
+					      CLK_IS_CRITICAL),
 		.ops		= &clkops_generic,
-		.parent		= &ck_ref,
 		.flags		= CLOCK_IDLE_CONTROL,
 		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 		.enable_bit	= EN_XORPCK,
-		.recalc		= &followparent_recalc,
 	},
 	.idlect_shift	= IDLXORP_ARM_SHIFT,
 };
 
 static struct arm_idlect1_clk armtim_ck = {
 	.clk = {
-		.name		= "armtim_ck",
+		.hw.init	= CLK_HW_INIT("armtim_ck", "ck_ref", &omap1_clk_gate_ops,
+					      CLK_IS_CRITICAL),
 		.ops		= &clkops_generic,
-		.parent		= &ck_ref,
 		.flags		= CLOCK_IDLE_CONTROL,
 		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 		.enable_bit	= EN_TIMCK,
-		.recalc		= &followparent_recalc,
 	},
 	.idlect_shift	= IDLTIM_ARM_SHIFT,
 };
 
 static struct arm_idlect1_clk armwdt_ck = {
 	.clk = {
-		.name		= "armwdt_ck",
+		.hw.init	= CLK_HW_INIT("armwdt_ck", "ck_ref", &omap1_clk_full_ops, 0),
 		.ops		= &clkops_generic,
-		.parent		= &ck_ref,
 		.flags		= CLOCK_IDLE_CONTROL,
 		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 		.enable_bit	= EN_WDTCK,
@@ -190,11 +185,8 @@ static struct arm_idlect1_clk armwdt_ck = {
 	.idlect_shift	= IDLWDT_ARM_SHIFT,
 };
 
-static struct clk arminth_ck16xx = {
-	.name		= "arminth_ck",
-	.ops		= &clkops_null,
-	.parent		= &arm_ck,
-	.recalc		= &followparent_recalc,
+static struct omap1_clk arminth_ck16xx = {
+	.hw.init	= CLK_HW_INIT("arminth_ck", "arm_ck", &omap1_clk_null_ops, 0),
 	/* Note: On 16xx the frequency can be divided by 2 by programming
 	 * ARM_CKCTL:ARM_INTHCK_SEL(14) to 1
 	 *
@@ -202,10 +194,9 @@ static struct clk arminth_ck16xx = {
 	 */
 };
 
-static struct clk dsp_ck = {
-	.name		= "dsp_ck",
+static struct omap1_clk dsp_ck = {
+	.hw.init	= CLK_HW_INIT("dsp_ck", "ck_dpll1", &omap1_clk_full_ops, 0),
 	.ops		= &clkops_generic,
-	.parent		= &ck_dpll1,
 	.enable_reg	= OMAP1_IO_ADDRESS(ARM_CKCTL),
 	.enable_bit	= EN_DSPCK,
 	.rate_offset	= CKCTL_DSPDIV_OFFSET,
@@ -214,20 +205,17 @@ static struct clk dsp_ck = {
 	.set_rate	= omap1_clk_set_rate_ckctl_arm,
 };
 
-static struct clk dspmmu_ck = {
-	.name		= "dspmmu_ck",
-	.ops		= &clkops_null,
-	.parent		= &ck_dpll1,
+static struct omap1_clk dspmmu_ck = {
+	.hw.init	= CLK_HW_INIT("dspmmu_ck", "ck_dpll1", &omap1_clk_rate_ops, 0),
 	.rate_offset	= CKCTL_DSPMMUDIV_OFFSET,
 	.recalc		= &omap1_ckctl_recalc,
 	.round_rate	= omap1_clk_round_rate_ckctl_arm,
 	.set_rate	= omap1_clk_set_rate_ckctl_arm,
 };
 
-static struct clk dspper_ck = {
-	.name		= "dspper_ck",
+static struct omap1_clk dspper_ck = {
+	.hw.init	= CLK_HW_INIT("dspper_ck", "ck_dpll1", &omap1_clk_full_ops, 0),
 	.ops		= &clkops_dspck,
-	.parent		= &ck_dpll1,
 	.enable_reg	= DSP_IDLECT2,
 	.enable_bit	= EN_PERCK,
 	.rate_offset	= CKCTL_PERDIV_OFFSET,
@@ -236,29 +224,23 @@ static struct clk dspper_ck = {
 	.set_rate	= &omap1_clk_set_rate_dsp_domain,
 };
 
-static struct clk dspxor_ck = {
-	.name		= "dspxor_ck",
+static struct omap1_clk dspxor_ck = {
+	.hw.init	= CLK_HW_INIT("dspxor_ck", "ck_ref", &omap1_clk_gate_ops, 0),
 	.ops		= &clkops_dspck,
-	.parent		= &ck_ref,
 	.enable_reg	= DSP_IDLECT2,
 	.enable_bit	= EN_XORPCK,
-	.recalc		= &followparent_recalc,
 };
 
-static struct clk dsptim_ck = {
-	.name		= "dsptim_ck",
+static struct omap1_clk dsptim_ck = {
+	.hw.init	= CLK_HW_INIT("dsptim_ck", "ck_ref", &omap1_clk_gate_ops, 0),
 	.ops		= &clkops_dspck,
-	.parent		= &ck_ref,
 	.enable_reg	= DSP_IDLECT2,
 	.enable_bit	= EN_DSPTIMCK,
-	.recalc		= &followparent_recalc,
 };
 
 static struct arm_idlect1_clk tc_ck = {
 	.clk = {
-		.name		= "tc_ck",
-		.ops		= &clkops_null,
-		.parent		= &ck_dpll1,
+		.hw.init	= CLK_HW_INIT("tc_ck", "ck_dpll1", &omap1_clk_rate_ops, 0),
 		.flags		= CLOCK_IDLE_CONTROL,
 		.rate_offset	= CKCTL_TCDIV_OFFSET,
 		.recalc		= &omap1_ckctl_recalc,
@@ -268,116 +250,88 @@ static struct arm_idlect1_clk tc_ck = {
 	.idlect_shift	= IDLIF_ARM_SHIFT,
 };
 
-static struct clk arminth_ck1510 = {
-	.name		= "arminth_ck",
-	.ops		= &clkops_null,
-	.parent		= &tc_ck.clk,
-	.recalc		= &followparent_recalc,
+static struct omap1_clk arminth_ck1510 = {
+	.hw.init	= CLK_HW_INIT("arminth_ck", "tc_ck", &omap1_clk_null_ops, 0),
 	/* Note: On 1510 the frequency follows TC_CK
 	 *
 	 * 16xx version is in MPU clocks.
 	 */
 };
 
-static struct clk tipb_ck = {
+static struct omap1_clk tipb_ck = {
 	/* No-idle controlled by "tc_ck" */
-	.name		= "tipb_ck",
-	.ops		= &clkops_null,
-	.parent		= &tc_ck.clk,
-	.recalc		= &followparent_recalc,
+	.hw.init	= CLK_HW_INIT("tipb_ck", "tc_ck", &omap1_clk_null_ops, 0),
 };
 
-static struct clk l3_ocpi_ck = {
+static struct omap1_clk l3_ocpi_ck = {
 	/* No-idle controlled by "tc_ck" */
-	.name		= "l3_ocpi_ck",
+	.hw.init	= CLK_HW_INIT("l3_ocpi_ck", "tc_ck", &omap1_clk_gate_ops, 0),
 	.ops		= &clkops_generic,
-	.parent		= &tc_ck.clk,
 	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT3),
 	.enable_bit	= EN_OCPI_CK,
-	.recalc		= &followparent_recalc,
 };
 
-static struct clk tc1_ck = {
-	.name		= "tc1_ck",
+static struct omap1_clk tc1_ck = {
+	.hw.init	= CLK_HW_INIT("tc1_ck", "tc_ck", &omap1_clk_gate_ops, 0),
 	.ops		= &clkops_generic,
-	.parent		= &tc_ck.clk,
 	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT3),
 	.enable_bit	= EN_TC1_CK,
-	.recalc		= &followparent_recalc,
 };
 
 /*
  * FIXME: This clock seems to be necessary but no-one has asked for its
  * activation.  [ pm.c (SRAM), CCP, Camera ]
  */
-static struct clk tc2_ck = {
-	.name		= "tc2_ck",
+
+static struct omap1_clk tc2_ck = {
+	.hw.init	= CLK_HW_INIT("tc2_ck", "tc_ck", &omap1_clk_gate_ops, CLK_IS_CRITICAL),
 	.ops		= &clkops_generic,
-	.parent		= &tc_ck.clk,
 	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT3),
 	.enable_bit	= EN_TC2_CK,
-	.recalc		= &followparent_recalc,
 };
 
-static struct clk dma_ck = {
+static struct omap1_clk dma_ck = {
 	/* No-idle controlled by "tc_ck" */
-	.name		= "dma_ck",
-	.ops		= &clkops_null,
-	.parent		= &tc_ck.clk,
-	.recalc		= &followparent_recalc,
+	.hw.init	= CLK_HW_INIT("dma_ck", "tc_ck", &omap1_clk_null_ops, 0),
 };
 
-static struct clk dma_lcdfree_ck = {
-	.name		= "dma_lcdfree_ck",
-	.ops		= &clkops_null,
-	.parent		= &tc_ck.clk,
-	.recalc		= &followparent_recalc,
+static struct omap1_clk dma_lcdfree_ck = {
+	.hw.init	= CLK_HW_INIT("dma_lcdfree_ck", "tc_ck", &omap1_clk_null_ops, 0),
 };
 
 static struct arm_idlect1_clk api_ck = {
 	.clk = {
-		.name		= "api_ck",
+		.hw.init	= CLK_HW_INIT("api_ck", "tc_ck", &omap1_clk_gate_ops, 0),
 		.ops		= &clkops_generic,
-		.parent		= &tc_ck.clk,
 		.flags		= CLOCK_IDLE_CONTROL,
 		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 		.enable_bit	= EN_APICK,
-		.recalc		= &followparent_recalc,
 	},
 	.idlect_shift	= IDLAPI_ARM_SHIFT,
 };
 
 static struct arm_idlect1_clk lb_ck = {
 	.clk = {
-		.name		= "lb_ck",
+		.hw.init	= CLK_HW_INIT("lb_ck", "tc_ck", &omap1_clk_gate_ops, 0),
 		.ops		= &clkops_generic,
-		.parent		= &tc_ck.clk,
 		.flags		= CLOCK_IDLE_CONTROL,
 		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 		.enable_bit	= EN_LBCK,
-		.recalc		= &followparent_recalc,
 	},
 	.idlect_shift	= IDLLB_ARM_SHIFT,
 };
 
-static struct clk rhea1_ck = {
-	.name		= "rhea1_ck",
-	.ops		= &clkops_null,
-	.parent		= &tc_ck.clk,
-	.recalc		= &followparent_recalc,
+static struct omap1_clk rhea1_ck = {
+	.hw.init	= CLK_HW_INIT("rhea1_ck", "tc_ck", &omap1_clk_null_ops, 0),
 };
 
-static struct clk rhea2_ck = {
-	.name		= "rhea2_ck",
-	.ops		= &clkops_null,
-	.parent		= &tc_ck.clk,
-	.recalc		= &followparent_recalc,
+static struct omap1_clk rhea2_ck = {
+	.hw.init	= CLK_HW_INIT("rhea2_ck", "tc_ck", &omap1_clk_null_ops, 0),
 };
 
-static struct clk lcd_ck_16xx = {
-	.name		= "lcd_ck",
+static struct omap1_clk lcd_ck_16xx = {
+	.hw.init	= CLK_HW_INIT("lcd_ck", "ck_dpll1", &omap1_clk_full_ops, 0),
 	.ops		= &clkops_generic,
-	.parent		= &ck_dpll1,
 	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 	.enable_bit	= EN_LCDCK,
 	.rate_offset	= CKCTL_LCDDIV_OFFSET,
@@ -388,9 +342,8 @@ static struct clk lcd_ck_16xx = {
 
 static struct arm_idlect1_clk lcd_ck_1510 = {
 	.clk = {
-		.name		= "lcd_ck",
+		.hw.init	= CLK_HW_INIT("lcd_ck", "ck_dpll1", &omap1_clk_full_ops, 0),
 		.ops		= &clkops_generic,
-		.parent		= &ck_dpll1,
 		.flags		= CLOCK_IDLE_CONTROL,
 		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 		.enable_bit	= EN_LCDCK,
@@ -402,37 +355,35 @@ static struct arm_idlect1_clk lcd_ck_1510 = {
 	.idlect_shift	= OMAP1510_IDLLCD_ARM_SHIFT,
 };
 
+
 /*
  * XXX The enable_bit here is misused - it simply switches between 12MHz
- * and 48MHz.  Reimplement with clksel.
+ * and 48MHz.  Reimplement with clk_mux.
  *
  * XXX does this need SYSC register handling?
  */
-static struct clk uart1_1510 = {
-	.name		= "uart1_ck",
-	.ops		= &clkops_null,
+static struct omap1_clk uart1_1510 = {
 	/* Direct from ULPD, no real parent */
-	.parent		= &armper_ck.clk,
-	.rate		= 12000000,
+	.hw.init	= CLK_HW_INIT("uart1_ck", "armper_ck", &omap1_clk_full_ops, 0),
 	.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
 	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
 	.enable_bit	= CONF_MOD_UART1_CLK_MODE_R,
+	.round_rate	= &omap1_round_uart_rate,
 	.set_rate	= &omap1_set_uart_rate,
 	.recalc		= &omap1_uart_recalc,
 };
 
 /*
  * XXX The enable_bit here is misused - it simply switches between 12MHz
- * and 48MHz.  Reimplement with clksel.
+ * and 48MHz.  Reimplement with clk_mux.
  *
  * XXX SYSC register handling does not belong in the clock framework
  */
 static struct uart_clk uart1_16xx = {
 	.clk	= {
-		.name		= "uart1_ck",
 		.ops		= &clkops_uart_16xx,
 		/* Direct from ULPD, no real parent */
-		.parent		= &armper_ck.clk,
+		.hw.init	= CLK_HW_INIT("uart1_ck", "armper_ck", &omap1_clk_full_ops, 0),
 		.rate		= 48000000,
 		.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
 		.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
@@ -443,54 +394,49 @@ static struct uart_clk uart1_16xx = {
 
 /*
  * XXX The enable_bit here is misused - it simply switches between 12MHz
- * and 48MHz.  Reimplement with clksel.
+ * and 48MHz.  Reimplement with clk_mux.
  *
  * XXX does this need SYSC register handling?
  */
-static struct clk uart2_ck = {
-	.name		= "uart2_ck",
-	.ops		= &clkops_null,
+static struct omap1_clk uart2_ck = {
 	/* Direct from ULPD, no real parent */
-	.parent		= &armper_ck.clk,
-	.rate		= 12000000,
+	.hw.init	= CLK_HW_INIT("uart2_ck", "armper_ck", &omap1_clk_full_ops, 0),
 	.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
 	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
 	.enable_bit	= CONF_MOD_UART2_CLK_MODE_R,
+	.round_rate	= &omap1_round_uart_rate,
 	.set_rate	= &omap1_set_uart_rate,
 	.recalc		= &omap1_uart_recalc,
 };
 
 /*
  * XXX The enable_bit here is misused - it simply switches between 12MHz
- * and 48MHz.  Reimplement with clksel.
+ * and 48MHz.  Reimplement with clk_mux.
  *
  * XXX does this need SYSC register handling?
  */
-static struct clk uart3_1510 = {
-	.name		= "uart3_ck",
-	.ops		= &clkops_null,
+static struct omap1_clk uart3_1510 = {
 	/* Direct from ULPD, no real parent */
-	.parent		= &armper_ck.clk,
-	.rate		= 12000000,
+	.hw.init	= CLK_HW_INIT("uart3_ck", "armper_ck", &omap1_clk_full_ops, 0),
 	.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
 	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
 	.enable_bit	= CONF_MOD_UART3_CLK_MODE_R,
+	.round_rate	= &omap1_round_uart_rate,
 	.set_rate	= &omap1_set_uart_rate,
 	.recalc		= &omap1_uart_recalc,
 };
 
 /*
  * XXX The enable_bit here is misused - it simply switches between 12MHz
- * and 48MHz.  Reimplement with clksel.
+ * and 48MHz.  Reimplement with clk_mux.
  *
  * XXX SYSC register handling does not belong in the clock framework
  */
 static struct uart_clk uart3_16xx = {
 	.clk	= {
-		.name		= "uart3_ck",
 		.ops		= &clkops_uart_16xx,
 		/* Direct from ULPD, no real parent */
-		.parent		= &armper_ck.clk,
+		.hw.init	= CLK_HW_INIT("uart3_ck", "armper_ck", &omap1_clk_full_ops, 0),
 		.rate		= 48000000,
 		.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
 		.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
@@ -499,30 +445,30 @@ static struct uart_clk uart3_16xx = {
 	.sysc_addr	= 0xfffb9854,
 };
 
-static struct clk usb_clko = {	/* 6 MHz output on W4_USB_CLKO */
-	.name		= "usb_clko",
+static struct omap1_clk usb_clko = {	/* 6 MHz output on W4_USB_CLKO */
 	.ops		= &clkops_generic,
 	/* Direct from ULPD, no parent */
+	.hw.init	= CLK_HW_INIT_NO_PARENT("usb_clko", &omap1_clk_full_ops, 0),
 	.rate		= 6000000,
 	.flags		= ENABLE_REG_32BIT,
 	.enable_reg	= OMAP1_IO_ADDRESS(ULPD_CLOCK_CTRL),
 	.enable_bit	= USB_MCLK_EN_BIT,
 };
 
-static struct clk usb_hhc_ck1510 = {
-	.name		= "usb_hhc_ck",
+static struct omap1_clk usb_hhc_ck1510 = {
 	.ops		= &clkops_generic,
 	/* Direct from ULPD, no parent */
+	.hw.init	= CLK_HW_INIT_NO_PARENT("usb_hhc_ck", &omap1_clk_full_ops, 0),
 	.rate		= 48000000, /* Actually 2 clocks, 12MHz and 48MHz */
 	.flags		= ENABLE_REG_32BIT,
 	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
 	.enable_bit	= USB_HOST_HHC_UHOST_EN,
 };
 
-static struct clk usb_hhc_ck16xx = {
-	.name		= "usb_hhc_ck",
+static struct omap1_clk usb_hhc_ck16xx = {
 	.ops		= &clkops_generic,
 	/* Direct from ULPD, no parent */
+	.hw.init	= CLK_HW_INIT_NO_PARENT("usb_hhc_ck", &omap1_clk_full_ops, 0),
 	.rate		= 48000000,
 	/* OTG_SYSCON_2.OTG_PADEN == 0 (not 1510-compatible) */
 	.flags		= ENABLE_REG_32BIT,
@@ -530,46 +476,46 @@ static struct clk usb_hhc_ck16xx = {
 	.enable_bit	= OTG_SYSCON_2_UHOST_EN_SHIFT
 };
 
-static struct clk usb_dc_ck = {
-	.name		= "usb_dc_ck",
+static struct omap1_clk usb_dc_ck = {
 	.ops		= &clkops_generic,
 	/* Direct from ULPD, no parent */
+	.hw.init	= CLK_HW_INIT_NO_PARENT("usb_dc_ck", &omap1_clk_full_ops, 0),
 	.rate		= 48000000,
 	.enable_reg	= OMAP1_IO_ADDRESS(SOFT_REQ_REG),
 	.enable_bit	= SOFT_USB_OTG_DPLL_REQ_SHIFT,
 };
 
-static struct clk uart1_7xx = {
-	.name		= "uart1_ck",
+static struct omap1_clk uart1_7xx = {
 	.ops		= &clkops_generic,
 	/* Direct from ULPD, no parent */
+	.hw.init	= CLK_HW_INIT_NO_PARENT("uart1_ck", &omap1_clk_full_ops, 0),
 	.rate		= 12000000,
 	.enable_reg	= OMAP1_IO_ADDRESS(SOFT_REQ_REG),
 	.enable_bit	= 9,
 };
 
-static struct clk uart2_7xx = {
-	.name		= "uart2_ck",
+static struct omap1_clk uart2_7xx = {
 	.ops		= &clkops_generic,
 	/* Direct from ULPD, no parent */
+	.hw.init	= CLK_HW_INIT_NO_PARENT("uart2_ck", &omap1_clk_full_ops, 0),
 	.rate		= 12000000,
 	.enable_reg	= OMAP1_IO_ADDRESS(SOFT_REQ_REG),
 	.enable_bit	= 11,
 };
 
-static struct clk mclk_1510 = {
-	.name		= "mclk",
+static struct omap1_clk mclk_1510 = {
 	.ops		= &clkops_generic,
 	/* Direct from ULPD, no parent. May be enabled by ext hardware. */
+	.hw.init	= CLK_HW_INIT_NO_PARENT("mclk", &omap1_clk_full_ops, 0),
 	.rate		= 12000000,
 	.enable_reg	= OMAP1_IO_ADDRESS(SOFT_REQ_REG),
 	.enable_bit	= SOFT_COM_MCKO_REQ_SHIFT,
 };
 
-static struct clk mclk_16xx = {
-	.name		= "mclk",
+static struct omap1_clk mclk_16xx = {
 	.ops		= &clkops_generic,
 	/* Direct from ULPD, no parent. May be enabled by ext hardware. */
+	.hw.init	= CLK_HW_INIT_NO_PARENT("mclk", &omap1_clk_full_ops, 0),
 	.enable_reg	= OMAP1_IO_ADDRESS(COM_CLK_DIV_CTRL_SEL),
 	.enable_bit	= COM_ULPD_PLL_CLK_REQ,
 	.set_rate	= &omap1_set_ext_clk_rate,
@@ -577,17 +523,16 @@ static struct clk mclk_16xx = {
 	.init		= &omap1_init_ext_clk,
 };
 
-static struct clk bclk_1510 = {
-	.name		= "bclk",
-	.ops		= &clkops_generic,
+static struct omap1_clk bclk_1510 = {
 	/* Direct from ULPD, no parent. May be enabled by ext hardware. */
+	.hw.init	= CLK_HW_INIT_NO_PARENT("bclk", &omap1_clk_rate_ops, 0),
 	.rate		= 12000000,
 };
 
-static struct clk bclk_16xx = {
-	.name		= "bclk",
+static struct omap1_clk bclk_16xx = {
 	.ops		= &clkops_generic,
 	/* Direct from ULPD, no parent. May be enabled by ext hardware. */
+	.hw.init	= CLK_HW_INIT_NO_PARENT("bclk", &omap1_clk_full_ops, 0),
 	.enable_reg	= OMAP1_IO_ADDRESS(SWD_CLK_DIV_CTRL_SEL),
 	.enable_bit	= SWD_ULPD_PLL_CLK_REQ,
 	.set_rate	= &omap1_set_ext_clk_rate,
@@ -595,11 +540,10 @@ static struct clk bclk_16xx = {
 	.init		= &omap1_init_ext_clk,
 };
 
-static struct clk mmc1_ck = {
-	.name		= "mmc1_ck",
+static struct omap1_clk mmc1_ck = {
 	.ops		= &clkops_generic,
 	/* Functional clock is direct from ULPD, interface clock is ARMPER */
-	.parent		= &armper_ck.clk,
+	.hw.init	= CLK_HW_INIT("mmc1_ck", "armper_ck", &omap1_clk_full_ops, 0),
 	.rate		= 48000000,
 	.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
 	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
@@ -610,32 +554,29 @@ static struct clk mmc1_ck = {
  * XXX MOD_CONF_CTRL_0 bit 20 is defined in the 1510 TRM as
  * CONF_MOD_MCBSP3_AUXON ??
  */
-static struct clk mmc2_ck = {
-	.name		= "mmc2_ck",
+static struct omap1_clk mmc2_ck = {
 	.ops		= &clkops_generic,
 	/* Functional clock is direct from ULPD, interface clock is ARMPER */
-	.parent		= &armper_ck.clk,
+	.hw.init	= CLK_HW_INIT("mmc2_ck", "armper_ck", &omap1_clk_full_ops, 0),
 	.rate		= 48000000,
 	.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
 	.enable_reg	= OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0),
 	.enable_bit	= 20,
 };
 
-static struct clk mmc3_ck = {
-	.name		= "mmc3_ck",
+static struct omap1_clk mmc3_ck = {
 	.ops		= &clkops_generic,
 	/* Functional clock is direct from ULPD, interface clock is ARMPER */
-	.parent		= &armper_ck.clk,
+	.hw.init	= CLK_HW_INIT("mmc3_ck", "armper_ck", &omap1_clk_full_ops, 0),
 	.rate		= 48000000,
 	.flags		= ENABLE_REG_32BIT | CLOCK_NO_IDLE_PARENT,
 	.enable_reg	= OMAP1_IO_ADDRESS(SOFT_REQ_REG),
 	.enable_bit	= SOFT_MMC_DPLL_REQ_SHIFT,
 };
 
-static struct clk virtual_ck_mpu = {
-	.name		= "mpu",
-	.ops		= &clkops_null,
-	.parent		= &arm_ck, /* Is smarter alias for */
+static struct omap1_clk virtual_ck_mpu = {
+	/* Is smarter alias for arm_ck */
+	.hw.init	= CLK_HW_INIT("mpu", "arm_ck", &omap1_clk_rate_ops, 0),
 	.recalc		= &followparent_recalc,
 	.set_rate	= &omap1_select_table_rate,
 	.round_rate	= &omap1_round_to_table_rate,
@@ -643,20 +584,14 @@ static struct clk virtual_ck_mpu = {
 
 /* virtual functional clock domain for I2C. Just for making sure that ARMXOR_CK
 remains active during MPU idle whenever this is enabled */
-static struct clk i2c_fck = {
-	.name		= "i2c_fck",
-	.ops		= &clkops_null,
+static struct omap1_clk i2c_fck = {
+	.hw.init	= CLK_HW_INIT("i2c_fck", "armxor_ck", &omap1_clk_gate_ops, 0),
 	.flags		= CLOCK_NO_IDLE_PARENT,
-	.parent		= &armxor_ck.clk,
-	.recalc		= &followparent_recalc,
 };
 
-static struct clk i2c_ick = {
-	.name		= "i2c_ick",
-	.ops		= &clkops_null,
+static struct omap1_clk i2c_ick = {
+	.hw.init	= CLK_HW_INIT("i2c_ick", "armper_ck", &omap1_clk_gate_ops, 0),
 	.flags		= CLOCK_NO_IDLE_PARENT,
-	.parent		= &armper_ck.clk,
-	.recalc		= &followparent_recalc,
 };
 
 /*
@@ -665,81 +600,81 @@ static struct clk i2c_ick = {
 
 static struct omap_clk omap_clks[] = {
 	/* non-ULPD clocks */
-	CLK(NULL,	"ck_ref",	&ck_ref,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
-	CLK(NULL,	"ck_dpll1",	&ck_dpll1,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
+	CLK(NULL,	"ck_ref",	&ck_ref.hw,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
+	CLK(NULL,	"ck_dpll1",	&ck_dpll1.hw,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
 	/* CK_GEN1 clocks */
-	CLK(NULL,	"ck_dpll1out",	&ck_dpll1out.clk, CK_16XX),
-	CLK(NULL,	"ck_sossi",	&sossi_ck,	CK_16XX),
-	CLK(NULL,	"arm_ck",	&arm_ck,	CK_16XX | CK_1510 | CK_310),
-	CLK(NULL,	"armper_ck",	&armper_ck.clk,	CK_16XX | CK_1510 | CK_310),
-	CLK("omap_gpio.0", "ick",	&arm_gpio_ck,	CK_1510 | CK_310),
-	CLK(NULL,	"armxor_ck",	&armxor_ck.clk,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
-	CLK(NULL,	"armtim_ck",	&armtim_ck.clk,	CK_16XX | CK_1510 | CK_310),
-	CLK("omap_wdt",	"fck",		&armwdt_ck.clk,	CK_16XX | CK_1510 | CK_310),
-	CLK("omap_wdt",	"ick",		&armper_ck.clk,	CK_16XX),
-	CLK("omap_wdt", "ick",		&dummy_ck,	CK_1510 | CK_310),
-	CLK(NULL,	"arminth_ck",	&arminth_ck1510, CK_1510 | CK_310),
-	CLK(NULL,	"arminth_ck",	&arminth_ck16xx, CK_16XX),
+	CLK(NULL,	"ck_dpll1out",	&ck_dpll1out.clk.hw, CK_16XX),
+	CLK(NULL,	"ck_sossi",	&sossi_ck.hw,	CK_16XX),
+	CLK(NULL,	"arm_ck",	&arm_ck.hw,	CK_16XX | CK_1510 | CK_310),
+	CLK(NULL,	"armper_ck",	&armper_ck.clk.hw, CK_16XX | CK_1510 | CK_310),
+	CLK("omap_gpio.0", "ick",	&arm_gpio_ck.hw, CK_1510 | CK_310),
+	CLK(NULL,	"armxor_ck",	&armxor_ck.clk.hw, CK_16XX | CK_1510 | CK_310 | CK_7XX),
+	CLK(NULL,	"armtim_ck",	&armtim_ck.clk.hw, CK_16XX | CK_1510 | CK_310),
+	CLK("omap_wdt",	"fck",		&armwdt_ck.clk.hw, CK_16XX | CK_1510 | CK_310),
+	CLK("omap_wdt",	"ick",		&armper_ck.clk.hw, CK_16XX),
+	CLK("omap_wdt", "ick",		&dummy_ck.hw,	CK_1510 | CK_310),
+	CLK(NULL,	"arminth_ck",	&arminth_ck1510.hw, CK_1510 | CK_310),
+	CLK(NULL,	"arminth_ck",	&arminth_ck16xx.hw, CK_16XX),
 	/* CK_GEN2 clocks */
-	CLK(NULL,	"dsp_ck",	&dsp_ck,	CK_16XX | CK_1510 | CK_310),
-	CLK(NULL,	"dspmmu_ck",	&dspmmu_ck,	CK_16XX | CK_1510 | CK_310),
-	CLK(NULL,	"dspper_ck",	&dspper_ck,	CK_16XX | CK_1510 | CK_310),
-	CLK(NULL,	"dspxor_ck",	&dspxor_ck,	CK_16XX | CK_1510 | CK_310),
-	CLK(NULL,	"dsptim_ck",	&dsptim_ck,	CK_16XX | CK_1510 | CK_310),
+	CLK(NULL,	"dsp_ck",	&dsp_ck.hw,	CK_16XX | CK_1510 | CK_310),
+	CLK(NULL,	"dspmmu_ck",	&dspmmu_ck.hw,	CK_16XX | CK_1510 | CK_310),
+	CLK(NULL,	"dspper_ck",	&dspper_ck.hw,	CK_16XX | CK_1510 | CK_310),
+	CLK(NULL,	"dspxor_ck",	&dspxor_ck.hw,	CK_16XX | CK_1510 | CK_310),
+	CLK(NULL,	"dsptim_ck",	&dsptim_ck.hw,	CK_16XX | CK_1510 | CK_310),
 	/* CK_GEN3 clocks */
-	CLK(NULL,	"tc_ck",	&tc_ck.clk,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
-	CLK(NULL,	"tipb_ck",	&tipb_ck,	CK_1510 | CK_310),
-	CLK(NULL,	"l3_ocpi_ck",	&l3_ocpi_ck,	CK_16XX | CK_7XX),
-	CLK(NULL,	"tc1_ck",	&tc1_ck,	CK_16XX),
-	CLK(NULL,	"tc2_ck",	&tc2_ck,	CK_16XX),
-	CLK(NULL,	"dma_ck",	&dma_ck,	CK_16XX | CK_1510 | CK_310),
-	CLK(NULL,	"dma_lcdfree_ck", &dma_lcdfree_ck, CK_16XX),
-	CLK(NULL,	"api_ck",	&api_ck.clk,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
-	CLK(NULL,	"lb_ck",	&lb_ck.clk,	CK_1510 | CK_310),
-	CLK(NULL,	"rhea1_ck",	&rhea1_ck,	CK_16XX),
-	CLK(NULL,	"rhea2_ck",	&rhea2_ck,	CK_16XX),
-	CLK(NULL,	"lcd_ck",	&lcd_ck_16xx,	CK_16XX | CK_7XX),
-	CLK(NULL,	"lcd_ck",	&lcd_ck_1510.clk, CK_1510 | CK_310),
+	CLK(NULL,	"tc_ck",	&tc_ck.clk.hw,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
+	CLK(NULL,	"tipb_ck",	&tipb_ck.hw,	CK_1510 | CK_310),
+	CLK(NULL,	"l3_ocpi_ck",	&l3_ocpi_ck.hw,	CK_16XX | CK_7XX),
+	CLK(NULL,	"tc1_ck",	&tc1_ck.hw,	CK_16XX),
+	CLK(NULL,	"tc2_ck",	&tc2_ck.hw,	CK_16XX),
+	CLK(NULL,	"dma_ck",	&dma_ck.hw,	CK_16XX | CK_1510 | CK_310),
+	CLK(NULL,	"dma_lcdfree_ck", &dma_lcdfree_ck.hw, CK_16XX),
+	CLK(NULL,	"api_ck",	&api_ck.clk.hw,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
+	CLK(NULL,	"lb_ck",	&lb_ck.clk.hw,	CK_1510 | CK_310),
+	CLK(NULL,	"rhea1_ck",	&rhea1_ck.hw,	CK_16XX),
+	CLK(NULL,	"rhea2_ck",	&rhea2_ck.hw,	CK_16XX),
+	CLK(NULL,	"lcd_ck",	&lcd_ck_16xx.hw, CK_16XX | CK_7XX),
+	CLK(NULL,	"lcd_ck",	&lcd_ck_1510.clk.hw, CK_1510 | CK_310),
 	/* ULPD clocks */
-	CLK(NULL,	"uart1_ck",	&uart1_1510,	CK_1510 | CK_310),
-	CLK(NULL,	"uart1_ck",	&uart1_16xx.clk, CK_16XX),
-	CLK(NULL,	"uart1_ck",	&uart1_7xx,	CK_7XX),
-	CLK(NULL,	"uart2_ck",	&uart2_ck,	CK_16XX | CK_1510 | CK_310),
-	CLK(NULL,	"uart2_ck",	&uart2_7xx,	CK_7XX),
-	CLK(NULL,	"uart3_ck",	&uart3_1510,	CK_1510 | CK_310),
-	CLK(NULL,	"uart3_ck",	&uart3_16xx.clk, CK_16XX),
-	CLK(NULL,	"usb_clko",	&usb_clko,	CK_16XX | CK_1510 | CK_310),
-	CLK(NULL,	"usb_hhc_ck",	&usb_hhc_ck1510, CK_1510 | CK_310),
-	CLK(NULL,	"usb_hhc_ck",	&usb_hhc_ck16xx, CK_16XX),
-	CLK(NULL,	"usb_dc_ck",	&usb_dc_ck,	CK_16XX | CK_7XX),
-	CLK(NULL,	"mclk",		&mclk_1510,	CK_1510 | CK_310),
-	CLK(NULL,	"mclk",		&mclk_16xx,	CK_16XX),
-	CLK(NULL,	"bclk",		&bclk_1510,	CK_1510 | CK_310),
-	CLK(NULL,	"bclk",		&bclk_16xx,	CK_16XX),
-	CLK("mmci-omap.0", "fck",	&mmc1_ck,	CK_16XX | CK_1510 | CK_310),
-	CLK("mmci-omap.0", "fck",	&mmc3_ck,	CK_7XX),
-	CLK("mmci-omap.0", "ick",	&armper_ck.clk,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
-	CLK("mmci-omap.1", "fck",	&mmc2_ck,	CK_16XX),
-	CLK("mmci-omap.1", "ick",	&armper_ck.clk,	CK_16XX),
+	CLK(NULL,	"uart1_ck",	&uart1_1510.hw,	CK_1510 | CK_310),
+	CLK(NULL,	"uart1_ck",	&uart1_16xx.clk.hw, CK_16XX),
+	CLK(NULL,	"uart1_ck",	&uart1_7xx.hw,	CK_7XX),
+	CLK(NULL,	"uart2_ck",	&uart2_ck.hw,	CK_16XX | CK_1510 | CK_310),
+	CLK(NULL,	"uart2_ck",	&uart2_7xx.hw,	CK_7XX),
+	CLK(NULL,	"uart3_ck",	&uart3_1510.hw,	CK_1510 | CK_310),
+	CLK(NULL,	"uart3_ck",	&uart3_16xx.clk.hw, CK_16XX),
+	CLK(NULL,	"usb_clko",	&usb_clko.hw,	CK_16XX | CK_1510 | CK_310),
+	CLK(NULL,	"usb_hhc_ck",	&usb_hhc_ck1510.hw, CK_1510 | CK_310),
+	CLK(NULL,	"usb_hhc_ck",	&usb_hhc_ck16xx.hw, CK_16XX),
+	CLK(NULL,	"usb_dc_ck",	&usb_dc_ck.hw,	CK_16XX | CK_7XX),
+	CLK(NULL,	"mclk",		&mclk_1510.hw,	CK_1510 | CK_310),
+	CLK(NULL,	"mclk",		&mclk_16xx.hw,	CK_16XX),
+	CLK(NULL,	"bclk",		&bclk_1510.hw,	CK_1510 | CK_310),
+	CLK(NULL,	"bclk",		&bclk_16xx.hw,	CK_16XX),
+	CLK("mmci-omap.0", "fck",	&mmc1_ck.hw,	CK_16XX | CK_1510 | CK_310),
+	CLK("mmci-omap.0", "fck",	&mmc3_ck.hw,	CK_7XX),
+	CLK("mmci-omap.0", "ick",	&armper_ck.clk.hw, CK_16XX | CK_1510 | CK_310 | CK_7XX),
+	CLK("mmci-omap.1", "fck",	&mmc2_ck.hw,	CK_16XX),
+	CLK("mmci-omap.1", "ick",	&armper_ck.clk.hw, CK_16XX),
 	/* Virtual clocks */
-	CLK(NULL,	"mpu",		&virtual_ck_mpu, CK_16XX | CK_1510 | CK_310),
-	CLK("omap_i2c.1", "fck",	&i2c_fck,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
-	CLK("omap_i2c.1", "ick",	&i2c_ick,	CK_16XX),
-	CLK("omap_i2c.1", "ick",	&dummy_ck,	CK_1510 | CK_310 | CK_7XX),
-	CLK("omap1_spi100k.1", "fck",	&dummy_ck,	CK_7XX),
-	CLK("omap1_spi100k.1", "ick",	&dummy_ck,	CK_7XX),
-	CLK("omap1_spi100k.2", "fck",	&dummy_ck,	CK_7XX),
-	CLK("omap1_spi100k.2", "ick",	&dummy_ck,	CK_7XX),
-	CLK("omap_uwire", "fck",	&armxor_ck.clk,	CK_16XX | CK_1510 | CK_310),
-	CLK("omap-mcbsp.1", "ick",	&dspper_ck,	CK_16XX),
-	CLK("omap-mcbsp.1", "ick",	&dummy_ck,	CK_1510 | CK_310),
-	CLK("omap-mcbsp.2", "ick",	&armper_ck.clk,	CK_16XX),
-	CLK("omap-mcbsp.2", "ick",	&dummy_ck,	CK_1510 | CK_310),
-	CLK("omap-mcbsp.3", "ick",	&dspper_ck,	CK_16XX),
-	CLK("omap-mcbsp.3", "ick",	&dummy_ck,	CK_1510 | CK_310),
-	CLK("omap-mcbsp.1", "fck",	&dspxor_ck,	CK_16XX | CK_1510 | CK_310),
-	CLK("omap-mcbsp.2", "fck",	&armper_ck.clk,	CK_16XX | CK_1510 | CK_310),
-	CLK("omap-mcbsp.3", "fck",	&dspxor_ck,	CK_16XX | CK_1510 | CK_310),
+	CLK(NULL,	"mpu",		&virtual_ck_mpu.hw, CK_16XX | CK_1510 | CK_310),
+	CLK("omap_i2c.1", "fck",	&i2c_fck.hw,	CK_16XX | CK_1510 | CK_310 | CK_7XX),
+	CLK("omap_i2c.1", "ick",	&i2c_ick.hw,	CK_16XX),
+	CLK("omap_i2c.1", "ick",	&dummy_ck.hw,	CK_1510 | CK_310 | CK_7XX),
+	CLK("omap1_spi100k.1", "fck",	&dummy_ck.hw,	CK_7XX),
+	CLK("omap1_spi100k.1", "ick",	&dummy_ck.hw,	CK_7XX),
+	CLK("omap1_spi100k.2", "fck",	&dummy_ck.hw,	CK_7XX),
+	CLK("omap1_spi100k.2", "ick",	&dummy_ck.hw,	CK_7XX),
+	CLK("omap_uwire", "fck",	&armxor_ck.clk.hw, CK_16XX | CK_1510 | CK_310),
+	CLK("omap-mcbsp.1", "ick",	&dspper_ck.hw,	CK_16XX),
+	CLK("omap-mcbsp.1", "ick",	&dummy_ck.hw,	CK_1510 | CK_310),
+	CLK("omap-mcbsp.2", "ick",	&armper_ck.clk.hw, CK_16XX),
+	CLK("omap-mcbsp.2", "ick",	&dummy_ck.hw,	CK_1510 | CK_310),
+	CLK("omap-mcbsp.3", "ick",	&dspper_ck.hw,	CK_16XX),
+	CLK("omap-mcbsp.3", "ick",	&dummy_ck.hw,	CK_1510 | CK_310),
+	CLK("omap-mcbsp.1", "fck",	&dspxor_ck.hw,	CK_16XX | CK_1510 | CK_310),
+	CLK("omap-mcbsp.2", "fck",	&armper_ck.clk.hw, CK_16XX | CK_1510 | CK_310),
+	CLK("omap-mcbsp.3", "fck",	&dspxor_ck.hw,	CK_16XX | CK_1510 | CK_310),
 };
 
 /*
@@ -778,9 +713,6 @@ int __init omap1_clk_init(void)
 	/* By default all idlect1 clocks are allowed to idle */
 	arm_idlect1_mask = ~0;
 
-	for (c = omap_clks; c < omap_clks + ARRAY_SIZE(omap_clks); c++)
-		clk_preinit(c->lk.clk);
-
 	cpu_mask = 0;
 	if (cpu_is_omap1710())
 		cpu_mask |= CK_1710;
@@ -793,16 +725,10 @@ int __init omap1_clk_init(void)
 	if (cpu_is_omap310())
 		cpu_mask |= CK_310;
 
-	for (c = omap_clks; c < omap_clks + ARRAY_SIZE(omap_clks); c++)
-		if (c->cpu & cpu_mask) {
-			clkdev_add(&c->lk);
-			clk_register(c->lk.clk);
-		}
-
 	/* Pointers to these clocks are needed by code in clock.c */
-	api_ck_p = clk_get(NULL, "api_ck");
-	ck_dpll1_p = clk_get(NULL, "ck_dpll1");
-	ck_ref_p = clk_get(NULL, "ck_ref");
+	api_ck_p = &api_ck.clk;
+	ck_dpll1_p = &ck_dpll1;
+	ck_ref_p = &ck_ref;
 
 	if (cpu_is_omap7xx())
 		ck_ref.rate = 13000000;
@@ -844,10 +770,7 @@ int __init omap1_clk_init(void)
 			}
 		}
 	}
-	propagate_rate(&ck_dpll1);
-	/* Cache rates for clocks connected to ck_ref (not dpll1) */
-	propagate_rate(&ck_ref);
-	omap1_show_rates();
+
 	if (machine_is_omap_perseus2() || machine_is_omap_fsample()) {
 		/* Select slicer output as OMAP input clock */
 		omap_writew(omap_readw(OMAP7XX_PCC_UPLD_CTRL) & ~0x1,
@@ -879,16 +802,28 @@ int __init omap1_clk_init(void)
 	 */
 	omap_writew(0x0000, ARM_IDLECT2);	/* Turn LCD clock off also */
 
-	/*
-	 * Only enable those clocks we will need, let the drivers
-	 * enable other clocks as necessary
-	 */
-	clk_enable(&armper_ck.clk);
-	clk_enable(&armxor_ck.clk);
-	clk_enable(&armtim_ck.clk); /* This should be done by timer code */
+	for (c = omap_clks; c < omap_clks + ARRAY_SIZE(omap_clks); c++) {
+		if (!(c->cpu & cpu_mask))
+			continue;
+
+		if (c->lk.clk_hw->init) { /* NULL if provider already registered */
+			const struct clk_init_data *init = c->lk.clk_hw->init;
+			const char *name = c->lk.clk_hw->init->name;
+			int err;
+
+			err = clk_hw_register(NULL, c->lk.clk_hw);
+			if (err < 0) {
+				pr_err("failed to register clock \"%s\"! (%d)\n", name, err);
+				/* may be tried again, restore init data */
+				c->lk.clk_hw->init = init;
+				continue;
+			}
+		}
+
+		clk_hw_register_clkdev(c->lk.clk_hw, c->lk.con_id, c->lk.dev_id);
+	}
 
-	if (cpu_is_omap15xx())
-		clk_enable(&arm_gpio_ck);
+	omap1_show_rates();
 
 	return 0;
 }
@@ -900,7 +835,7 @@ void __init omap1_clk_late_init(void)
 	unsigned long rate = ck_dpll1.rate;
 
 	/* Find the highest supported frequency and enable it */
-	if (omap1_select_table_rate(&virtual_ck_mpu, ~0)) {
+	if (omap1_select_table_rate(&virtual_ck_mpu, ~0, arm_ck.rate)) {
 		pr_err("System frequencies not set, using default. Check your config.\n");
 		/*
 		 * Reprogramming the DPLL is tricky, it must be done from SRAM.
diff --git a/arch/arm/mach-omap1/io.c b/arch/arm/mach-omap1/io.c
index 05ee260918fa..d2db9b8aed3f 100644
--- a/arch/arm/mach-omap1/io.c
+++ b/arch/arm/mach-omap1/io.c
@@ -15,10 +15,8 @@
 #include <asm/mach/map.h>
 
 #include "tc.h"
-#include "mux.h"
 #include "iomap.h"
 #include "common.h"
-#include "clock.h"
 
 /*
  * The machine specific code may provide the extra mapping besides the
@@ -125,11 +123,6 @@ void __init omap1_init_early(void)
 	 */
 	omap_writew(0x0, MPU_PUBLIC_TIPB_CNTL);
 	omap_writew(0x0, MPU_PRIVATE_TIPB_CNTL);
-
-	/* Must init clocks early to assure that timer interrupt works
-	 */
-	omap1_clk_init();
-	omap1_mux_init();
 }
 
 void __init omap1_init_late(void)
diff --git a/arch/arm/mach-omap1/time.c b/arch/arm/mach-omap1/time.c
index c34b9af00566..d5e127851dc7 100644
--- a/arch/arm/mach-omap1/time.c
+++ b/arch/arm/mach-omap1/time.c
@@ -51,8 +51,10 @@
 #include <asm/mach/time.h>
 
 #include "hardware.h"
+#include "mux.h"
 #include "iomap.h"
 #include "common.h"
+#include "clock.h"
 
 #ifdef CONFIG_OMAP_MPU_TIMER
 
@@ -224,6 +226,9 @@ static inline void omap_mpu_timer_init(void)
  */
 void __init omap1_timer_init(void)
 {
+	omap1_clk_init();
+	omap1_mux_init();
+
 	if (omap_32k_timer_init() != 0)
 		omap_mpu_timer_init();
 }
-- 
2.29.2

