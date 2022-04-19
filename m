Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A47F0506DC3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D5410EFEA;
	Tue, 19 Apr 2022 13:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5901410EFEA
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:41:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D3389B8198C;
 Tue, 19 Apr 2022 13:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A03C385A5;
 Tue, 19 Apr 2022 13:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375707;
 bh=3d8hQQYJeFpKX8pM/nmgqQ/4ffqN3s9vC3fM43FF4LQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qP8I/7IjLNHnIxdZMDT+yA2K5NEenvoISo3rfqIyaqmVL/syVL1Af1yW4xmfo5OTq
 0050KsjlGouKbz8SeOfzYaurqQqoIMoSMZE77b4coQHVObLPgAtp9Pec6WqtWsRD1J
 XiZb0nJ1jd7NGwc12yc+O5kv2vfFTcuiOb0xT4bxXaUWwR1ihjoyp7gu31XjWOF3eF
 IKyK+PInmQtqZQTYI/POC0HKANYKUWOUjOFqkX948o+jIQJOVENuCm+v4n8l8qR4Ac
 4oXnrj11oRQ16CFnG9VAeeghAM/xB2gXZyJmRDVf3MRvw9B+HuQRtbKj7wu0uJlOMR
 JJsyPb6uzLAgg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 33/41] ARM: OMAP1: clock: Remove unused code
Date: Tue, 19 Apr 2022 15:37:15 +0200
Message-Id: <20220419133723.1394715-34-arnd@kernel.org>
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

The code of OMAP1 clocks contains quite a few unused elements:
- functions and function like macros never called: clk_reparent(),
  recalculate_root_clocks(), clk_enable_init_clocks(),
  omap_clk_get_by_name(), omap_clk_disable_autoidle_all(),
  __clk_get_parent(clk), __clk_get_rate(),
- unused structure fields:
  - clkops: .find_idlest(), .find_companion(), .deny_idle(),
  - clk: .src_offset, as well as .clkdm -- no longer present but still
    mentioned in comments,
- definitions of unused flags: INVERT_ENABLE, CLOCK_CLKOUTX2,
- definitions of unused data types: struct clk_functions,
- prototypes of functions with no implementation: clk_init(),
  omap1_watchdog_recalc().
- declarations of never defined global variables: clkops_dummy.
Drop them.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/clock.c | 81 -------------------------------------
 arch/arm/mach-omap1/clock.h | 53 +-----------------------
 2 files changed, 2 insertions(+), 132 deletions(-)

diff --git a/arch/arm/mach-omap1/clock.c b/arch/arm/mach-omap1/clock.c
index 42e094e781ce..5ea8ec026a85 100644
--- a/arch/arm/mach-omap1/clock.c
+++ b/arch/arm/mach-omap1/clock.c
@@ -734,17 +734,6 @@ unsigned long omap_fixed_divisor_recalc(struct clk *clk)
 	return clk->parent->rate / clk->fixed_div;
 }
 
-void clk_reparent(struct clk *child, struct clk *parent)
-{
-	list_del_init(&child->sibling);
-	if (parent)
-		list_add(&child->sibling, &parent->children);
-	child->parent = parent;
-
-	/* now do the debugfs renaming to reattach the child
-	   to the proper parent */
-}
-
 /* Propagate rate to children */
 void propagate_rate(struct clk *tclk)
 {
@@ -759,24 +748,6 @@ void propagate_rate(struct clk *tclk)
 
 static LIST_HEAD(root_clks);
 
-/**
- * recalculate_root_clocks - recalculate and propagate all root clocks
- *
- * Recalculates all root clocks (clocks with no parent), which if the
- * clock's .recalc is set correctly, should also propagate their rates.
- * Called at init.
- */
-void recalculate_root_clocks(void)
-{
-	struct clk *clkp;
-
-	list_for_each_entry(clkp, &root_clks, sibling) {
-		if (clkp->recalc)
-			clkp->rate = clkp->recalc(clkp);
-		propagate_rate(clkp);
-	}
-}
-
 /**
  * clk_preinit - initialize any fields in the struct clk before clk init
  * @clk: struct clk * to initialize
@@ -827,42 +798,6 @@ void clk_unregister(struct clk *clk)
 }
 EXPORT_SYMBOL(clk_unregister);
 
-void clk_enable_init_clocks(void)
-{
-	struct clk *clkp;
-
-	list_for_each_entry(clkp, &clocks, node)
-		if (clkp->flags & ENABLE_ON_INIT)
-			clk_enable(clkp);
-}
-
-/**
- * omap_clk_get_by_name - locate OMAP struct clk by its name
- * @name: name of the struct clk to locate
- *
- * Locate an OMAP struct clk by its name.  Assumes that struct clk
- * names are unique.  Returns NULL if not found or a pointer to the
- * struct clk if found.
- */
-struct clk *omap_clk_get_by_name(const char *name)
-{
-	struct clk *c;
-	struct clk *ret = NULL;
-
-	mutex_lock(&clocks_mutex);
-
-	list_for_each_entry(c, &clocks, node) {
-		if (!strcmp(c->name, name)) {
-			ret = c;
-			break;
-		}
-	}
-
-	mutex_unlock(&clocks_mutex);
-
-	return ret;
-}
-
 int omap_clk_enable_autoidle_all(void)
 {
 	struct clk *c;
@@ -879,22 +814,6 @@ int omap_clk_enable_autoidle_all(void)
 	return 0;
 }
 
-int omap_clk_disable_autoidle_all(void)
-{
-	struct clk *c;
-	unsigned long flags;
-
-	spin_lock_irqsave(&clockfw_lock, flags);
-
-	list_for_each_entry(c, &clocks, node)
-		if (c->ops->deny_idle)
-			c->ops->deny_idle(c);
-
-	spin_unlock_irqrestore(&clockfw_lock, flags);
-
-	return 0;
-}
-
 /*
  * Low level helpers
  */
diff --git a/arch/arm/mach-omap1/clock.h b/arch/arm/mach-omap1/clock.h
index f3b8811f5ac0..7bebd488f1be 100644
--- a/arch/arm/mach-omap1/clock.h
+++ b/arch/arm/mach-omap1/clock.h
@@ -43,56 +43,28 @@ struct omap_clk {
 
 /* Temporary, needed during the common clock framework conversion */
 #define __clk_get_name(clk)	(clk->name)
-#define __clk_get_parent(clk)	(clk->parent)
-#define __clk_get_rate(clk)	(clk->rate)
 
 /**
  * struct clkops - some clock function pointers
  * @enable: fn ptr that enables the current clock in hardware
  * @disable: fn ptr that enables the current clock in hardware
- * @find_idlest: function returning the IDLEST register for the clock's IP blk
- * @find_companion: function returning the "companion" clk reg for the clock
  * @allow_idle: fn ptr that enables autoidle for the current clock in hardware
- * @deny_idle: fn ptr that disables autoidle for the current clock in hardware
- *
- * A "companion" clk is an accompanying clock to the one being queried
- * that must be enabled for the IP module connected to the clock to
- * become accessible by the hardware.  Neither @find_idlest nor
- * @find_companion should be needed; that information is IP
- * block-specific; the hwmod code has been created to handle this, but
- * until hwmod data is ready and drivers have been converted to use PM
- * runtime calls in place of clk_enable()/clk_disable(), @find_idlest and
- * @find_companion must, unfortunately, remain.
  */
 struct clkops {
 	int			(*enable)(struct clk *);
 	void			(*disable)(struct clk *);
-	void			(*find_idlest)(struct clk *, void __iomem **,
-					       u8 *, u8 *);
-	void			(*find_companion)(struct clk *, void __iomem **,
-						  u8 *);
 	void			(*allow_idle)(struct clk *);
-	void			(*deny_idle)(struct clk *);
 };
 
 /*
  * struct clk.flags possibilities
  *
  * XXX document the rest of the clock flags here
- *
- * CLOCK_CLKOUTX2: (OMAP4 only) DPLL CLKOUT and CLKOUTX2 GATE_CTRL
- *     bits share the same register.  This flag allows the
- *     omap4_dpllmx*() code to determine which GATE_CTRL bit field
- *     should be used.  This is a temporary solution - a better approach
- *     would be to associate clock type-specific data with the clock,
- *     similar to the struct dpll_data approach.
  */
 #define ENABLE_REG_32BIT	(1 << 0)	/* Use 32-bit access */
 #define CLOCK_IDLE_CONTROL	(1 << 1)
 #define CLOCK_NO_IDLE_PARENT	(1 << 2)
 #define ENABLE_ON_INIT		(1 << 3)	/* Enable upon framework init */
-#define INVERT_ENABLE		(1 << 4)	/* 0 enables, 1 disables */
-#define CLOCK_CLKOUTX2		(1 << 5)
 
 /**
  * struct clk - OMAP struct clk
@@ -113,9 +85,8 @@ struct clkops {
  * @fixed_div: when > 0, this clock's rate is its parent's rate / @fixed_div
  * @flags: see "struct clk.flags possibilities" above
  * @rate_offset: bitshift for rate selection bitfield (OMAP1 only)
- * @src_offset: bitshift for source selection bitfield (OMAP1 only)
  *
- * XXX @rate_offset, @src_offset should probably be removed and OMAP1
+ * XXX @rate_offset should probably be removed and OMAP1
  * clock code converted to use clksel.
  *
  * XXX @usecount is poorly named.  It should be "enable_count" or
@@ -126,7 +97,7 @@ struct clkops {
  * clocks and decremented by the clock code when clk_disable() is
  * called on child clocks.
  *
- * XXX @clkdm, @usecount, @children, @sibling should be marked for
+ * XXX @usecount, @children, @sibling should be marked for
  * internal use only.
  *
  * @children and @sibling are used to optimize parent-to-child clock
@@ -153,36 +124,18 @@ struct clk {
 	u8			fixed_div;
 	u8			flags;
 	u8			rate_offset;
-	u8			src_offset;
 #if defined(CONFIG_PM_DEBUG) && defined(CONFIG_DEBUG_FS)
 	struct dentry		*dent;	/* For visible tree hierarchy */
 #endif
 };
 
-struct clk_functions {
-	int		(*clk_enable)(struct clk *clk);
-	void		(*clk_disable)(struct clk *clk);
-	long		(*clk_round_rate)(struct clk *clk, unsigned long rate);
-	int		(*clk_set_rate)(struct clk *clk, unsigned long rate);
-	int		(*clk_set_parent)(struct clk *clk, struct clk *parent);
-	void		(*clk_allow_idle)(struct clk *clk);
-	void		(*clk_deny_idle)(struct clk *clk);
-	void		(*clk_disable_unused)(struct clk *clk);
-};
-
-extern int clk_init(struct clk_functions *custom_clocks);
 extern void clk_preinit(struct clk *clk);
 extern int clk_register(struct clk *clk);
-extern void clk_reparent(struct clk *child, struct clk *parent);
 extern void clk_unregister(struct clk *clk);
 extern void propagate_rate(struct clk *clk);
-extern void recalculate_root_clocks(void);
 extern unsigned long followparent_recalc(struct clk *clk);
-extern void clk_enable_init_clocks(void);
 unsigned long omap_fixed_divisor_recalc(struct clk *clk);
-extern struct clk *omap_clk_get_by_name(const char *name);
 extern int omap_clk_enable_autoidle_all(void);
-extern int omap_clk_disable_autoidle_all(void);
 
 extern const struct clkops clkops_null;
 
@@ -208,7 +161,6 @@ extern int omap1_select_table_rate(struct clk *clk, unsigned long rate);
 extern long omap1_round_to_table_rate(struct clk *clk, unsigned long rate);
 extern int omap1_clk_set_rate_ckctl_arm(struct clk *clk, unsigned long rate);
 extern long omap1_clk_round_rate_ckctl_arm(struct clk *clk, unsigned long rate);
-extern unsigned long omap1_watchdog_recalc(struct clk *clk);
 
 #ifdef CONFIG_OMAP_RESET_CLOCKS
 extern void omap1_clk_disable_unused(struct clk *clk);
@@ -278,7 +230,6 @@ extern __u32 arm_idlect1_mask;
 extern struct clk *api_ck_p, *ck_dpll1_p, *ck_ref_p;
 
 extern const struct clkops clkops_dspck;
-extern const struct clkops clkops_dummy;
 extern const struct clkops clkops_uart_16xx;
 extern const struct clkops clkops_generic;
 
-- 
2.29.2

