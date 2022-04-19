Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF56506DC4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063AE10EFF6;
	Tue, 19 Apr 2022 13:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C7610EFF6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:41:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AB37F616DA;
 Tue, 19 Apr 2022 13:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BEDAC385A7;
 Tue, 19 Apr 2022 13:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375715;
 bh=G7R/+rDcrqJrNt8dUwADm5Egv0xkIUTxO8ciErqFtk0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YHGoZlohuS2JgLOhYhCZMFxaUN1Y+HHoJ/YVPLZp7vCduTgmqkayQKXajDhUPyzKd
 Zw+VuabZI/Z/zUnS9e+NNz9Ez4+ZtPDkOL4OLlhLrloQ+AJvPS0QO1iYDv8tI5bLRf
 nuSKDdKTYFPVL4xbBFv9TGc44BTfEff9oQ5RrIpvKqT0SOIjiF7Dfl3kq0BalXCprk
 NWFSU4pjGWpfaAp9OzYmoO11yKu8KADVKnLEUwtNUeAGga8OA9KsCxXCO6pNJmXp3Z
 cjM+2jNEsAjQu5ecXU/0xHR8UqdU5JPwhpNVuo62gjAo3uWz7YFbqRe7SKVD5IsdtH
 qbq82O/KVjaWw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 34/41] ARM: OMAP1: clock: Remove noop code
Date: Tue, 19 Apr 2022 15:37:16 +0200
Message-Id: <20220419133723.1394715-35-arnd@kernel.org>
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

There are some OMAP1 clock code bits that have no effect:
- crystal_type variable is set to 0 but never changed, then
  crystal_type == 2 condition is never true and ck_ref.rate never set to
  19200000,
- clk->ops->allow_idle() is called from omap_clk_enable_autoidle_all() but
  that op is not configured for any clock, then the function does nothing
  and the op field is not needed,
- ENABLE_ON_INIT flag is set for some clocks but is never checked by any
  code, then not needed.
Drop that code.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/clock.c      | 17 -----------------
 arch/arm/mach-omap1/clock.h      |  3 ---
 arch/arm/mach-omap1/clock_data.c |  8 +-------
 3 files changed, 1 insertion(+), 27 deletions(-)

diff --git a/arch/arm/mach-omap1/clock.c b/arch/arm/mach-omap1/clock.c
index 5ea8ec026a85..e5bd4d3b742d 100644
--- a/arch/arm/mach-omap1/clock.c
+++ b/arch/arm/mach-omap1/clock.c
@@ -798,22 +798,6 @@ void clk_unregister(struct clk *clk)
 }
 EXPORT_SYMBOL(clk_unregister);
 
-int omap_clk_enable_autoidle_all(void)
-{
-	struct clk *c;
-	unsigned long flags;
-
-	spin_lock_irqsave(&clockfw_lock, flags);
-
-	list_for_each_entry(c, &clocks, node)
-		if (c->ops->allow_idle)
-			c->ops->allow_idle(c);
-
-	spin_unlock_irqrestore(&clockfw_lock, flags);
-
-	return 0;
-}
-
 /*
  * Low level helpers
  */
@@ -871,7 +855,6 @@ static int __init clk_disable_unused(void)
 	return 0;
 }
 late_initcall(clk_disable_unused);
-late_initcall(omap_clk_enable_autoidle_all);
 #endif
 
 #if defined(CONFIG_PM_DEBUG) && defined(CONFIG_DEBUG_FS)
diff --git a/arch/arm/mach-omap1/clock.h b/arch/arm/mach-omap1/clock.h
index 7bebd488f1be..8025e4a22469 100644
--- a/arch/arm/mach-omap1/clock.h
+++ b/arch/arm/mach-omap1/clock.h
@@ -53,7 +53,6 @@ struct omap_clk {
 struct clkops {
 	int			(*enable)(struct clk *);
 	void			(*disable)(struct clk *);
-	void			(*allow_idle)(struct clk *);
 };
 
 /*
@@ -64,7 +63,6 @@ struct clkops {
 #define ENABLE_REG_32BIT	(1 << 0)	/* Use 32-bit access */
 #define CLOCK_IDLE_CONTROL	(1 << 1)
 #define CLOCK_NO_IDLE_PARENT	(1 << 2)
-#define ENABLE_ON_INIT		(1 << 3)	/* Enable upon framework init */
 
 /**
  * struct clk - OMAP struct clk
@@ -135,7 +133,6 @@ extern void clk_unregister(struct clk *clk);
 extern void propagate_rate(struct clk *clk);
 extern unsigned long followparent_recalc(struct clk *clk);
 unsigned long omap_fixed_divisor_recalc(struct clk *clk);
-extern int omap_clk_enable_autoidle_all(void);
 
 extern const struct clkops clkops_null;
 
diff --git a/arch/arm/mach-omap1/clock_data.c b/arch/arm/mach-omap1/clock_data.c
index 57d3752babf8..9b9c9fcc61c2 100644
--- a/arch/arm/mach-omap1/clock_data.c
+++ b/arch/arm/mach-omap1/clock_data.c
@@ -92,8 +92,7 @@ static struct arm_idlect1_clk ck_dpll1out = {
 		.name		= "ck_dpll1out",
 		.ops		= &clkops_generic,
 		.parent		= &ck_dpll1,
-		.flags		= CLOCK_IDLE_CONTROL | ENABLE_REG_32BIT |
-				  ENABLE_ON_INIT,
+		.flags		= CLOCK_IDLE_CONTROL | ENABLE_REG_32BIT,
 		.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 		.enable_bit	= EN_CKOUT_ARM,
 		.recalc		= &followparent_recalc,
@@ -146,7 +145,6 @@ static struct clk arm_gpio_ck = {
 	.name		= "ick",
 	.ops		= &clkops_generic,
 	.parent		= &ck_dpll1,
-	.flags		= ENABLE_ON_INIT,
 	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT2),
 	.enable_bit	= EN_GPIOCK,
 	.recalc		= &followparent_recalc,
@@ -316,7 +314,6 @@ static struct clk tc2_ck = {
 	.name		= "tc2_ck",
 	.ops		= &clkops_generic,
 	.parent		= &tc_ck.clk,
-	.flags		= ENABLE_ON_INIT,
 	.enable_reg	= OMAP1_IO_ADDRESS(ARM_IDLECT3),
 	.enable_bit	= EN_TC2_CK,
 	.recalc		= &followparent_recalc,
@@ -762,7 +759,6 @@ u32 cpu_mask;
 int __init omap1_clk_init(void)
 {
 	struct omap_clk *c;
-	int crystal_type = 0; /* Default 12 MHz */
 	u32 reg;
 
 #ifdef CONFIG_DEBUG_LL
@@ -810,8 +806,6 @@ int __init omap1_clk_init(void)
 
 	if (cpu_is_omap7xx())
 		ck_ref.rate = 13000000;
-	if (cpu_is_omap16xx() && crystal_type == 2)
-		ck_ref.rate = 19200000;
 
 	pr_info("Clocks: ARM_SYSST: 0x%04x DPLL_CTL: 0x%04x ARM_CKCTL: 0x%04x\n",
 		omap_readw(ARM_SYSST), omap_readw(DPLL_CTL),
-- 
2.29.2

