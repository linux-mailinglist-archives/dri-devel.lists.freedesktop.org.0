Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E56E8D2F1B
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 10:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A733E113431;
	Wed, 29 May 2024 08:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id 984E4113447
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 08:01:44 +0000 (UTC)
Received: from SIOS1075.ysato.name (al128006.dynamic.ppp.asahi-net.or.jp
 [111.234.128.6])
 by sakura.ysato.name (Postfix) with ESMTPSA id 642931C06B7;
 Wed, 29 May 2024 17:01:42 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>, Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Baoquan He <bhe@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Azeem Shaikh <azeemshaikh38@gmail.com>, Guo Ren <guoren@kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Anup Patel <apatel@ventanamicro.com>, Jacky Huang <ychuang3@nuvoton.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: [DO NOT MERGE v8 08/36] clocksource: sh_tmu: CLOCKSOURCE support.
Date: Wed, 29 May 2024 17:00:54 +0900
Message-Id: <f40e91e3f010880b0cf7a1c3a18d0c57bb55d93a.1716965617.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1716965617.git.ysato@users.sourceforge.jp>
References: <cover.1716965617.git.ysato@users.sourceforge.jp>
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

Allows initialization as CLOCKSOURCE.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 drivers/clocksource/sh_tmu.c | 198 +++++++++++++++++++++++------------
 1 file changed, 132 insertions(+), 66 deletions(-)

diff --git a/drivers/clocksource/sh_tmu.c b/drivers/clocksource/sh_tmu.c
index beffff81c00f..ce3004a73dcb 100644
--- a/drivers/clocksource/sh_tmu.c
+++ b/drivers/clocksource/sh_tmu.c
@@ -17,6 +17,8 @@
 #include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
@@ -51,6 +53,7 @@ struct sh_tmu_channel {
 
 struct sh_tmu_device {
 	struct platform_device *pdev;
+	struct device_node *np;
 
 	void __iomem *mapbase;
 	struct clk *clk;
@@ -65,6 +68,7 @@ struct sh_tmu_device {
 
 	bool has_clockevent;
 	bool has_clocksource;
+	const char *name;
 };
 
 #define TSTR -1 /* shared register */
@@ -148,8 +152,8 @@ static int __sh_tmu_enable(struct sh_tmu_channel *ch)
 	/* enable clock */
 	ret = clk_enable(ch->tmu->clk);
 	if (ret) {
-		dev_err(&ch->tmu->pdev->dev, "ch%u: cannot enable clock\n",
-			ch->index);
+		pr_err("%s ch%u: cannot enable clock\n",
+		       ch->tmu->name, ch->index);
 		return ret;
 	}
 
@@ -174,9 +178,10 @@ static int sh_tmu_enable(struct sh_tmu_channel *ch)
 	if (ch->enable_count++ > 0)
 		return 0;
 
-	pm_runtime_get_sync(&ch->tmu->pdev->dev);
-	dev_pm_syscore_device(&ch->tmu->pdev->dev, true);
-
+	if (ch->tmu->pdev) {
+		pm_runtime_get_sync(&ch->tmu->pdev->dev);
+		dev_pm_syscore_device(&ch->tmu->pdev->dev, true);
+	}
 	return __sh_tmu_enable(ch);
 }
 
@@ -202,8 +207,10 @@ static void sh_tmu_disable(struct sh_tmu_channel *ch)
 
 	__sh_tmu_disable(ch);
 
-	dev_pm_syscore_device(&ch->tmu->pdev->dev, false);
-	pm_runtime_put(&ch->tmu->pdev->dev);
+	if (ch->tmu->pdev) {
+		dev_pm_syscore_device(&ch->tmu->pdev->dev, false);
+		pm_runtime_put(&ch->tmu->pdev->dev);
+	}
 }
 
 static void sh_tmu_set_next(struct sh_tmu_channel *ch, unsigned long delta,
@@ -245,7 +252,7 @@ static irqreturn_t sh_tmu_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static struct sh_tmu_channel *cs_to_sh_tmu(struct clocksource *cs)
+static inline struct sh_tmu_channel *cs_to_sh_tmu(struct clocksource *cs)
 {
 	return container_of(cs, struct sh_tmu_channel, cs);
 }
@@ -292,7 +299,8 @@ static void sh_tmu_clocksource_suspend(struct clocksource *cs)
 
 	if (--ch->enable_count == 0) {
 		__sh_tmu_disable(ch);
-		dev_pm_genpd_suspend(&ch->tmu->pdev->dev);
+		if (ch->tmu->pdev)
+			dev_pm_genpd_suspend(&ch->tmu->pdev->dev);
 	}
 }
 
@@ -304,7 +312,8 @@ static void sh_tmu_clocksource_resume(struct clocksource *cs)
 		return;
 
 	if (ch->enable_count++ == 0) {
-		dev_pm_genpd_resume(&ch->tmu->pdev->dev);
+		if (ch->tmu->pdev)
+			dev_pm_genpd_resume(&ch->tmu->pdev->dev);
 		__sh_tmu_enable(ch);
 	}
 }
@@ -324,14 +333,14 @@ static int sh_tmu_register_clocksource(struct sh_tmu_channel *ch,
 	cs->mask = CLOCKSOURCE_MASK(32);
 	cs->flags = CLOCK_SOURCE_IS_CONTINUOUS;
 
-	dev_info(&ch->tmu->pdev->dev, "ch%u: used as clock source\n",
-		 ch->index);
+	pr_info("%s ch%u: used as clock source\n",
+		ch->tmu->name, ch->index);
 
 	clocksource_register_hz(cs, ch->tmu->rate);
 	return 0;
 }
 
-static struct sh_tmu_channel *ced_to_sh_tmu(struct clock_event_device *ced)
+static inline struct sh_tmu_channel *ced_to_sh_tmu(struct clock_event_device *ced)
 {
 	return container_of(ced, struct sh_tmu_channel, ced);
 }
@@ -364,8 +373,8 @@ static int sh_tmu_clock_event_set_state(struct clock_event_device *ced,
 	if (clockevent_state_oneshot(ced) || clockevent_state_periodic(ced))
 		sh_tmu_disable(ch);
 
-	dev_info(&ch->tmu->pdev->dev, "ch%u: used for %s clock events\n",
-		 ch->index, periodic ? "periodic" : "oneshot");
+	pr_info("%s ch%u: used for %s clock events\n",
+		ch->tmu->name, ch->index, periodic ? "periodic" : "oneshot");
 	sh_tmu_clock_event_start(ch, periodic);
 	return 0;
 }
@@ -417,20 +426,22 @@ static void sh_tmu_register_clockevent(struct sh_tmu_channel *ch,
 	ced->set_state_shutdown = sh_tmu_clock_event_shutdown;
 	ced->set_state_periodic = sh_tmu_clock_event_set_periodic;
 	ced->set_state_oneshot = sh_tmu_clock_event_set_oneshot;
-	ced->suspend = sh_tmu_clock_event_suspend;
-	ced->resume = sh_tmu_clock_event_resume;
+	if (ch->tmu->pdev) {
+		ced->suspend = sh_tmu_clock_event_suspend;
+		ced->resume = sh_tmu_clock_event_resume;
+	}
 
-	dev_info(&ch->tmu->pdev->dev, "ch%u: used for clock events\n",
-		 ch->index);
+	pr_info("%s ch%u: used for clock events\n",
+		ch->tmu->name, ch->index);
 
 	clockevents_config_and_register(ced, ch->tmu->rate, 0x300, 0xffffffff);
 
 	ret = request_irq(ch->irq, sh_tmu_interrupt,
 			  IRQF_TIMER | IRQF_IRQPOLL | IRQF_NOBALANCING,
-			  dev_name(&ch->tmu->pdev->dev), ch);
+			  ch->tmu->name, ch);
 	if (ret) {
-		dev_err(&ch->tmu->pdev->dev, "ch%u: failed to request irq %d\n",
-			ch->index, ch->irq);
+		pr_err("%s ch%u: failed to request irq %d\n",
+		       ch->tmu->name, ch->index, ch->irq);
 		return;
 	}
 }
@@ -465,28 +476,36 @@ static int sh_tmu_channel_setup(struct sh_tmu_channel *ch, unsigned int index,
 	else
 		ch->base = tmu->mapbase + 8 + ch->index * 12;
 
-	ch->irq = platform_get_irq(tmu->pdev, index);
+	if (tmu->np)
+		ch->irq = of_irq_get(tmu->np, index);
+	else if (tmu->pdev)
+		ch->irq = platform_get_irq(tmu->pdev, index);
+
 	if (ch->irq < 0)
 		return ch->irq;
 
 	ch->cs_enabled = false;
 	ch->enable_count = 0;
 
-	return sh_tmu_register(ch, dev_name(&tmu->pdev->dev),
-			       clockevent, clocksource);
+	return sh_tmu_register(ch, tmu->name, clockevent, clocksource);
 }
 
 static int sh_tmu_map_memory(struct sh_tmu_device *tmu)
 {
 	struct resource *res;
 
-	res = platform_get_resource(tmu->pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&tmu->pdev->dev, "failed to get I/O memory\n");
-		return -ENXIO;
+	if (tmu->pdev) {
+		res = platform_get_resource(tmu->pdev, IORESOURCE_MEM, 0);
+		if (!res) {
+			pr_err("sh_tmu failed to get I/O memory\n");
+			return -ENXIO;
+		}
+
+		tmu->mapbase = ioremap(res->start, resource_size(res));
 	}
+	if (tmu->np)
+		tmu->mapbase = of_iomap(tmu->np, 0);
 
-	tmu->mapbase = ioremap(res->start, resource_size(res));
 	if (tmu->mapbase == NULL)
 		return -ENXIO;
 
@@ -495,53 +514,25 @@ static int sh_tmu_map_memory(struct sh_tmu_device *tmu)
 
 static int sh_tmu_parse_dt(struct sh_tmu_device *tmu)
 {
-	struct device_node *np = tmu->pdev->dev.of_node;
-
 	tmu->model = SH_TMU;
 	tmu->num_channels = 3;
 
-	of_property_read_u32(np, "#renesas,channels", &tmu->num_channels);
+	of_property_read_u32(tmu->np, "#renesas,channels", &tmu->num_channels);
 
 	if (tmu->num_channels != 2 && tmu->num_channels != 3) {
-		dev_err(&tmu->pdev->dev, "invalid number of channels %u\n",
-			tmu->num_channels);
+		pr_err("%s: invalid number of channels %u\n",
+		       tmu->name, tmu->num_channels);
 		return -EINVAL;
 	}
 
 	return 0;
 }
 
-static int sh_tmu_setup(struct sh_tmu_device *tmu, struct platform_device *pdev)
+static int sh_tmu_setup(struct sh_tmu_device *tmu)
 {
 	unsigned int i;
 	int ret;
 
-	tmu->pdev = pdev;
-
-	raw_spin_lock_init(&tmu->lock);
-
-	if (IS_ENABLED(CONFIG_OF) && pdev->dev.of_node) {
-		ret = sh_tmu_parse_dt(tmu);
-		if (ret < 0)
-			return ret;
-	} else if (pdev->dev.platform_data) {
-		const struct platform_device_id *id = pdev->id_entry;
-		struct sh_timer_config *cfg = pdev->dev.platform_data;
-
-		tmu->model = id->driver_data;
-		tmu->num_channels = hweight8(cfg->channels_mask);
-	} else {
-		dev_err(&tmu->pdev->dev, "missing platform data\n");
-		return -ENXIO;
-	}
-
-	/* Get hold of clock. */
-	tmu->clk = clk_get(&tmu->pdev->dev, "fck");
-	if (IS_ERR(tmu->clk)) {
-		dev_err(&tmu->pdev->dev, "cannot get clock\n");
-		return PTR_ERR(tmu->clk);
-	}
-
 	ret = clk_prepare(tmu->clk);
 	if (ret < 0)
 		goto err_clk_put;
@@ -557,7 +548,7 @@ static int sh_tmu_setup(struct sh_tmu_device *tmu, struct platform_device *pdev)
 	/* Map the memory resource. */
 	ret = sh_tmu_map_memory(tmu);
 	if (ret < 0) {
-		dev_err(&tmu->pdev->dev, "failed to remap I/O memory\n");
+		pr_err("%s: failed to remap I/O memory\n", tmu->name);
 		goto err_clk_unprepare;
 	}
 
@@ -580,8 +571,6 @@ static int sh_tmu_setup(struct sh_tmu_device *tmu, struct platform_device *pdev)
 			goto err_unmap;
 	}
 
-	platform_set_drvdata(pdev, tmu);
-
 	return 0;
 
 err_unmap:
@@ -594,6 +583,40 @@ static int sh_tmu_setup(struct sh_tmu_device *tmu, struct platform_device *pdev)
 	return ret;
 }
 
+static int sh_tmu_setup_pdev(struct sh_tmu_device *tmu, struct platform_device *pdev)
+{
+	int ret;
+
+	tmu->pdev = pdev;
+
+	raw_spin_lock_init(&tmu->lock);
+
+	if (IS_ENABLED(CONFIG_OF) && pdev->dev.of_node) {
+		tmu->np = pdev->dev.of_node;
+		ret = sh_tmu_parse_dt(tmu);
+		if (ret < 0)
+			return ret;
+	} else if (pdev->dev.platform_data) {
+		const struct platform_device_id *id = pdev->id_entry;
+		struct sh_timer_config *cfg = pdev->dev.platform_data;
+
+		tmu->model = id->driver_data;
+		tmu->num_channels = hweight8(cfg->channels_mask);
+	} else {
+		dev_err(&tmu->pdev->dev, "missing platform data\n");
+		return -ENXIO;
+	}
+
+	tmu->name = dev_name(&pdev->dev);
+	tmu->clk = clk_get(&tmu->pdev->dev, "fck");
+	if (IS_ERR(tmu->clk)) {
+		dev_err(&tmu->pdev->dev, "cannot get clock\n");
+		return PTR_ERR(tmu->clk);
+	}
+
+	return sh_tmu_setup(tmu);
+}
+
 static int sh_tmu_probe(struct platform_device *pdev)
 {
 	struct sh_tmu_device *tmu = platform_get_drvdata(pdev);
@@ -613,12 +636,13 @@ static int sh_tmu_probe(struct platform_device *pdev)
 	if (tmu == NULL)
 		return -ENOMEM;
 
-	ret = sh_tmu_setup(tmu, pdev);
+	ret = sh_tmu_setup_pdev(tmu, pdev);
 	if (ret) {
 		kfree(tmu);
 		pm_runtime_idle(&pdev->dev);
 		return ret;
 	}
+	platform_set_drvdata(pdev, tmu);
 
 	if (is_sh_early_platform_device(pdev))
 		return 0;
@@ -632,6 +656,47 @@ static int sh_tmu_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int sh_tmu_setup_of(struct sh_tmu_device *tmu, struct device_node *np)
+{
+	int ret;
+
+	tmu->np = np;
+	raw_spin_lock_init(&tmu->lock);
+
+	ret = sh_tmu_parse_dt(tmu);
+	if (ret < 0)
+		return ret;
+
+	tmu->clk = of_clk_get(np, 0);
+	tmu->name = of_node_full_name(np);
+
+	if (IS_ERR(tmu->clk)) {
+		pr_err("%pOF: cannot get clock\n", np);
+		return PTR_ERR(tmu->clk);
+	}
+
+	return sh_tmu_setup(tmu);
+}
+
+static int __init sh_tmu_of_register(struct device_node *np)
+{
+	struct sh_tmu_device *tmu;
+	int ret;
+
+	tmu = kzalloc(sizeof(*tmu), GFP_KERNEL);
+	if (tmu == NULL)
+		return -ENOMEM;
+
+	ret = sh_tmu_setup_of(tmu, np);
+	if (ret) {
+		kfree(tmu);
+		pr_warn("%pOF: Timer register failed (%d)", np, ret);
+	} else
+		of_node_set_flag(np, OF_POPULATED);
+
+	return ret;
+}
+
 static const struct platform_device_id sh_tmu_id_table[] = {
 	{ "sh-tmu", SH_TMU },
 	{ "sh-tmu-sh3", SH_TMU_SH3 },
@@ -665,6 +730,7 @@ static void __exit sh_tmu_exit(void)
 	platform_driver_unregister(&sh_tmu_device_driver);
 }
 
+TIMER_OF_DECLARE(sh_tmu, "renesas,tmu", sh_tmu_of_register);
 #ifdef CONFIG_SUPERH
 sh_early_platform_init("earlytimer", &sh_tmu_device_driver);
 #endif
-- 
2.39.2

