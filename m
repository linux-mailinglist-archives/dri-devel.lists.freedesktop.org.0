Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 517ED897F7D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 07:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8306112F5A;
	Thu,  4 Apr 2024 05:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8A0BC112F2D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 05:15:25 +0000 (UTC)
Received: from SIOS1075.ysato.name (al128006.dynamic.ppp.asahi-net.or.jp
 [111.234.128.6])
 by sakura.ysato.name (Postfix) with ESMTPSA id 14BDF1C0FE0;
 Thu,  4 Apr 2024 14:15:23 +0900 (JST)
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
Subject: [RESEND v7 16/37] irqchip: Add SH7751 INTC driver
Date: Thu,  4 Apr 2024 14:14:27 +0900
Message-Id: <82bf86c5804460fd61eb6725c6222ad1cbd7d846.1712207606.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712207606.git.ysato@users.sourceforge.jp>
References: <cover.1712207606.git.ysato@users.sourceforge.jp>
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

Renesas SH7751 Internal interrupt controller driver.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 drivers/irqchip/Kconfig              |   8 +
 drivers/irqchip/Makefile             |   1 +
 drivers/irqchip/irq-renesas-sh7751.c | 282 +++++++++++++++++++++++++++
 3 files changed, 291 insertions(+)
 create mode 100644 drivers/irqchip/irq-renesas-sh7751.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 72c07a12f5e1..33badb5b4f00 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -690,4 +690,12 @@ config SUNPLUS_SP7021_INTC
 	  chained controller, routing all interrupt source in P-Chip to
 	  the primary controller on C-Chip.
 
+config RENESAS_SH7751_INTC
+	bool "Renesas SH7751 Interrupt Controller"
+	depends on SH_DEVICE_TREE || COMPILE_TEST
+	select IRQ_DOMAIN_HIERARCHY
+	help
+	  Support for the Renesas SH7751 On-chip interrupt controller.
+	  And external interrupt encoder for some targets.
+
 endmenu
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index ec4a18380998..51855034a895 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -121,3 +121,4 @@ obj-$(CONFIG_IRQ_IDT3243X)		+= irq-idt3243x.o
 obj-$(CONFIG_APPLE_AIC)			+= irq-apple-aic.o
 obj-$(CONFIG_MCHP_EIC)			+= irq-mchp-eic.o
 obj-$(CONFIG_SUNPLUS_SP7021_INTC)	+= irq-sp7021-intc.o
+obj-$(CONFIG_RENESAS_SH7751_INTC)	+= irq-renesas-sh7751.o
diff --git a/drivers/irqchip/irq-renesas-sh7751.c b/drivers/irqchip/irq-renesas-sh7751.c
new file mode 100644
index 000000000000..91d6dc3ed04c
--- /dev/null
+++ b/drivers/irqchip/irq-renesas-sh7751.c
@@ -0,0 +1,282 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas SH7751 interrupt controller driver
+ *
+ * Copyright 2023 Yoshinori Sato <ysato@users.sourceforge.jp>
+ */
+
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/of.h>
+#include <linux/io.h>
+#include <dt-bindings/interrupt-controller/renesas,sh7751-intc.h>
+
+struct ipr {
+	u16 off;
+	u16 idx;
+};
+
+struct sh7751_intc_priv {
+	const struct ipr *iprmap;
+	void __iomem *base;
+	void __iomem *intpri00;
+	bool	     irlm;
+};
+
+enum {
+	R_ICR         = 0x00,
+	R_IPR         = 0x04,
+	R_INTPRI00    = 0x00,
+	R_INTREQ00    = 0x20,
+	R_INTMSK00    = 0x40,
+	R_INTMSKCLR00 = 0x60,
+};
+
+#define ICR_IRLM BIT(7)
+
+/*
+ * SH7751 IRQ mapping
+ *  IRQ16 - 63: Group0 - IPRA to IPRD
+ *   IRQ16 - 31: external IRL input (ICR.IRLM is 0)
+ *  IRQ80 - 92: Group1 - INTPRI00
+ */
+#define IRQ_START	16
+#define MAX_IRL		(IRQ_START + NR_IRL)
+#define GRP0_IRQ_END	63
+#define GRP1_IRQ_START	80
+#define IRQ_END		92
+
+#define NR_IPRMAP0	(GRP0_IRQ_END - IRQ_START + 1)
+#define NR_IPRMAP1	(IRQ_END - GRP1_IRQ_START)
+#define IPR_PRI_MASK	0x000f
+
+#define IPRA			0
+#define IPRB			4
+#define IPRC			8
+#define IPRD			12
+#define INTPRI00		256
+#define IPR_B12			12
+#define IPR_B8			8
+#define IPR_B4			4
+#define IPR_B0			0
+
+/* SH7751 EVT to IPR mapping table */
+static const struct ipr sh7751_iprmap[] = {
+	[evt2irq(0x240)] = {IPRD, IPR_B12},	/* IRL0 (ICR.IRLM=1) */
+	[evt2irq(0x2a0)] = {IPRD, IPR_B8},	/* IRL1 (ICR.IRLM=1) */
+	[evt2irq(0x300)] = {IPRD, IPR_B4},	/* IRL2 (ICR.IRLM=1) */
+	[evt2irq(0x360)] = {IPRD, IPR_B0},	/* IRL3 (ICR.IRLM=1) */
+	[evt2irq(0x400)] = {IPRA, IPR_B12},	/* TMU0 */
+	[evt2irq(0x420)] = {IPRA, IPR_B8},	/* TMU1 */
+	[evt2irq(0x440)] = {IPRA, IPR_B4},	/* TMU2 TNUI */
+	[evt2irq(0x460)] = {IPRA, IPR_B4},	/* TMU2 TICPI */
+	[evt2irq(0x480)] = {IPRA, IPR_B0},	/* RTC ATI */
+	[evt2irq(0x4a0)] = {IPRA, IPR_B0},	/* RTC PRI */
+	[evt2irq(0x4c0)] = {IPRA, IPR_B0},	/* RTC CUI */
+	[evt2irq(0x4e0)] = {IPRB, IPR_B4},	/* SCI ERI */
+	[evt2irq(0x500)] = {IPRB, IPR_B4},	/* SCI RXI */
+	[evt2irq(0x520)] = {IPRB, IPR_B4},	/* SCI TXI */
+	[evt2irq(0x540)] = {IPRB, IPR_B4},	/* SCI TEI */
+	[evt2irq(0x560)] = {IPRB, IPR_B12},	/* WDT */
+	[evt2irq(0x580)] = {IPRB, IPR_B8},	/* REF RCMI */
+	[evt2irq(0x5a0)] = {IPRB, IPR_B4},	/* REF ROVI */
+	[evt2irq(0x600)] = {IPRC, IPR_B0},	/* H-UDI */
+	[evt2irq(0x620)] = {IPRC, IPR_B12},	/* GPIO */
+	[evt2irq(0x640)] = {IPRC, IPR_B8},	/* DMAC DMTE0 */
+	[evt2irq(0x660)] = {IPRC, IPR_B8},	/* DMAC DMTE1 */
+	[evt2irq(0x680)] = {IPRC, IPR_B8},	/* DMAC DMTE2 */
+	[evt2irq(0x6a0)] = {IPRC, IPR_B8},	/* DMAC DMTE3 */
+	[evt2irq(0x6c0)] = {IPRC, IPR_B8},	/* DMAC DMAE */
+	[evt2irq(0x700)] = {IPRC, IPR_B4},	/* SCIF ERI */
+	[evt2irq(0x720)] = {IPRC, IPR_B4},	/* SCIF RXI */
+	[evt2irq(0x740)] = {IPRC, IPR_B4},	/* SCIF BRI */
+	[evt2irq(0x760)] = {IPRC, IPR_B4},	/* SCIF TXI */
+	[evt2irq(0x780)] = {IPRC, IPR_B8},	/* DMAC DMTE4 */
+	[evt2irq(0x7a0)] = {IPRC, IPR_B8},	/* DMAC DMTE5 */
+	[evt2irq(0x7c0)] = {IPRC, IPR_B8},	/* DMAC DMTE6 */
+	[evt2irq(0x7e0)] = {IPRC, IPR_B8},	/* DMAC DMTE7 */
+	[evt2irq(0xa00)] = {INTPRI00, IPR_B0},	/* PCIC PCISERR */
+	[evt2irq(0xa20)] = {INTPRI00, IPR_B4},	/* PCIC PCIDMA3 */
+	[evt2irq(0xa40)] = {INTPRI00, IPR_B4},	/* PCIC PCIDMA2 */
+	[evt2irq(0xa60)] = {INTPRI00, IPR_B4},	/* PCIC PCIDMA1 */
+	[evt2irq(0xa80)] = {INTPRI00, IPR_B4},	/* PCIC PCIDMA0 */
+	[evt2irq(0xaa0)] = {INTPRI00, IPR_B4},	/* PCIC PCIPWON */
+	[evt2irq(0xac0)] = {INTPRI00, IPR_B4},	/* PCIC PCIPWDWN */
+	[evt2irq(0xae0)] = {INTPRI00, IPR_B4},	/* PCIC PCIERR */
+	[evt2irq(0xb00)] = {INTPRI00, IPR_B8},	/* TMU3 */
+	[evt2irq(0xb80)] = {INTPRI00, IPR_B12},	/* TMU4 */
+};
+
+/*
+ * IPR registers have 4bit priority x 4 entry (16bits)
+ */
+static void update_ipr(struct sh7751_intc_priv *priv, unsigned int irq, u16 pri)
+{
+	const struct ipr *ipr = NULL;
+	void __iomem *ipr_base;
+	unsigned int offset;
+	u16 mask;
+
+	ipr = priv->iprmap + irq;
+	if (irq < GRP1_IRQ_START) {
+		/* Group0 */
+		ipr_base = priv->base + R_IPR;
+		offset = ipr->off;
+	} else {
+		/* Group1 */
+		ipr_base = priv->intpri00;
+		offset = ipr->off - INTPRI00;
+	}
+	mask = ~(IPR_PRI_MASK << ipr->idx);
+	pri = (pri & IPR_PRI_MASK) << ipr->idx;
+	mask &= __raw_readw(ipr_base + offset);
+	__raw_writew(mask | pri, ipr_base + offset);
+}
+
+static inline bool is_valid_irq(unsigned int irq)
+{
+	/* IRQ16 - 63 */
+	if (irq >= IRQ_START && irq < IRQ_START + NR_IPRMAP0)
+		return true;
+	/* IRQ80 - 92 */
+	if (irq >= GRP1_IRQ_START && irq <= IRQ_END)
+		return true;
+	return false;
+}
+
+static inline struct sh7751_intc_priv *irq_data_to_priv(struct irq_data *data)
+{
+	return data->domain->host_data;
+}
+
+/* Interrupt unmask priority is 1, mask priority is 0 */
+#define PRI_ENABLE  1
+#define PRI_DISABLE 0
+static void endisable_irq(struct irq_data *data, bool enable)
+{
+	struct sh7751_intc_priv *priv;
+	unsigned int irq;
+
+	priv = irq_data_to_priv(data);
+
+	irq = irqd_to_hwirq(data);
+	if (!is_valid_irq(irq)) {
+		/* IRQ out of range */
+		pr_warn_once("%s: IRQ %u is out of range\n", __FILE__, irq);
+		return;
+	}
+
+	if (irq <= MAX_IRL && !priv->irlm) {
+		/* IRL encoded external interrupt */
+		/* enable and disable from SR.IMASK */
+		update_sr_imask(irq - IRQ_START, enable);
+	} else {
+		/* Internal peripheral interrupt */
+		/* enable and disable from interrupt priority */
+		update_ipr(priv, irq, enable ? PRI_ENABLE : PRI_DISABLE);
+	}
+}
+
+static void sh7751_mask_irq(struct irq_data *data)
+{
+	endisable_irq(data, false);
+}
+
+static void sh7751_unmask_irq(struct irq_data *data)
+{
+	endisable_irq(data, true);
+}
+
+static const struct irq_chip sh7751_irq_chip = {
+	.name		= "SH7751-INTC",
+	.irq_unmask	= sh7751_unmask_irq,
+	.irq_mask	= sh7751_mask_irq,
+};
+
+static int irq_sh7751_map(struct irq_domain *h, unsigned int virq,
+			  irq_hw_number_t hw_irq_num)
+{
+	irq_set_chip_and_handler(virq, &sh7751_irq_chip, handle_level_irq);
+	irq_get_irq_data(virq)->chip_data = h->host_data;
+	irq_modify_status(virq, IRQ_NOREQUEST, IRQ_NOPROBE);
+	return 0;
+}
+
+static int irq_sh7751_xlate(struct irq_domain *d, struct device_node *ctrlr,
+			     const u32 *intspec, unsigned int intsize,
+			     unsigned long *out_hwirq, unsigned int *out_type)
+{
+	if (WARN_ON(intsize < 1))
+		return -EINVAL;
+	*out_hwirq = evt2irq(intspec[0]);
+	*out_type = IRQ_TYPE_NONE;
+	return 0;
+}
+
+static const struct irq_domain_ops irq_ops = {
+	.map    = irq_sh7751_map,
+	.xlate  = irq_sh7751_xlate,
+};
+
+static int __init shintc_of_init(struct device_node *intc, struct device_node *parent,
+				 const struct ipr *iprmap)
+{
+	struct sh7751_intc_priv *priv;
+	void __iomem *base, *base2;
+	struct irq_domain *domain;
+	u16 icr;
+	int ret;
+
+	priv = kzalloc(sizeof(struct sh7751_intc_priv), GFP_KERNEL);
+	if (priv == NULL)
+		return -ENOMEM;
+
+	base = of_iomap(intc, 0);
+	base2 = of_iomap(intc, 1);
+	if (!base || !base2) {
+		pr_err("%pOFP: Invalid register definition\n", intc);
+		ret = -EINVAL;
+		goto error;
+	}
+
+	priv->base = base;
+	priv->intpri00 = base2;
+	priv->iprmap = iprmap;
+
+	if (of_property_read_bool(intc, "renesas,irlm")) {
+		priv->irlm = true;
+		icr = __raw_readw(priv->base + R_ICR);
+		icr |= ICR_IRLM;
+		__raw_writew(icr, priv->base + R_ICR);
+	}
+
+	domain = irq_domain_add_linear(intc, NR_IRQS, &irq_ops, priv);
+	if (domain == NULL) {
+		pr_err("%pOFP: cannot initialize irq domain\n", intc);
+		ret = -ENOMEM;
+		goto error;
+	}
+
+	irq_set_default_host(domain);
+	pr_info("%pOFP: SH7751 Interrupt controller (%s external IRQ)",
+		intc, priv->irlm ? "4 lines" : "15 level");
+	return 0;
+
+error:
+	if (base)
+		iounmap(base);
+	if (base2)
+		iounmap(base);
+	kfree(priv);
+	return ret;
+}
+
+static int __init sh7751_intc_of_init(struct device_node *intc,
+				      struct device_node *parent)
+{
+	return shintc_of_init(intc, parent, sh7751_iprmap);
+}
+
+IRQCHIP_DECLARE(sh_7751_intc, "renesas,sh7751-intc", sh7751_intc_of_init);
-- 
2.39.2

