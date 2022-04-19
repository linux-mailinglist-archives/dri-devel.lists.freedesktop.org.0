Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC48507377
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B6B10F0DB;
	Tue, 19 Apr 2022 16:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE2810F0DB
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:42:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9F6556185D;
 Tue, 19 Apr 2022 16:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB59C385AE;
 Tue, 19 Apr 2022 16:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386567;
 bh=XRVRts6/PmPxgnBeeTopOk8hsXuEnYK24eY44iFBTjY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SrYcNU0XHeFfz9FFmwRnhtwk5VI3KPUyVVYDZ1vZsf/9ibd4zLruL0iYjAxUyiwgp
 zmOuXhLr4WTdOB1309oLHotg6wtk/R/duI+zVweeCWm3uDXswBZIZxB7bVKunqu/CC
 EdMhLyLGmp315u6yW24LoEVof2mtuD5mi09URRw/1IqaKVlqShBeopuwMcloOvibS8
 PU5fwThkpiXRfLrjJtNm+iH3D7eSCFQGuRvIg5P1RDAEYLIRMmxDeXbThxhNRZi323
 coE08BVk9QZsh8XR9qGt6reyxhJbZKJAWfaiL1ui30TgqLeVpFNIO7Y6/vA2Fm0la6
 XCHr2bVGVwWJA==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 30/48] Input: wm97xx - get rid of irq_enable method in
 wm97xx_mach_ops
Date: Tue, 19 Apr 2022 18:37:52 +0200
Message-Id: <20220419163810.2118169-31-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 Tomas Cech <sleep_walker@suse.com>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Marek Vasut <marek.vasut@gmail.com>,
 Paul Parsons <lost.distance@yahoo.com>, Sergey Lapin <slapin@ossfans.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linux-input@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Manuel Lauss <manuel.lauss@gmail.com>, alsa-devel@alsa-project.org,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Now that we are using oneshot threaded IRQ this method is not used anymore.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
[arnd: add the db1300 change as well]
Cc: Manuel Lauss <manuel.lauss@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/alchemy/devboards/db1300.c         | 9 ---------
 drivers/input/touchscreen/mainstone-wm97xx.c | 9 ---------
 drivers/input/touchscreen/zylonite-wm97xx.c  | 9 ---------
 include/linux/wm97xx.h                       | 3 ---
 4 files changed, 30 deletions(-)

diff --git a/arch/mips/alchemy/devboards/db1300.c b/arch/mips/alchemy/devboards/db1300.c
index cd72eaa1168f..e70e529ddd91 100644
--- a/arch/mips/alchemy/devboards/db1300.c
+++ b/arch/mips/alchemy/devboards/db1300.c
@@ -732,16 +732,7 @@ static struct platform_device db1300_lcd_dev = {
 /**********************************************************************/
 
 #if IS_ENABLED(CONFIG_TOUCHSCREEN_WM97XX)
-static void db1300_wm97xx_irqen(struct wm97xx *wm, int enable)
-{
-	if (enable)
-		enable_irq(DB1300_AC97_PEN_INT);
-	else
-		disable_irq_nosync(DB1300_AC97_PEN_INT);
-}
-
 static struct wm97xx_mach_ops db1300_wm97xx_ops = {
-	.irq_enable	= db1300_wm97xx_irqen,
 	.irq_gpio	= WM97XX_GPIO_3,
 };
 
diff --git a/drivers/input/touchscreen/mainstone-wm97xx.c b/drivers/input/touchscreen/mainstone-wm97xx.c
index 8f6fe68f1f99..c39f49720fe4 100644
--- a/drivers/input/touchscreen/mainstone-wm97xx.c
+++ b/drivers/input/touchscreen/mainstone-wm97xx.c
@@ -246,21 +246,12 @@ static void wm97xx_acc_shutdown(struct wm97xx *wm)
 	}
 }
 
-static void wm97xx_irq_enable(struct wm97xx *wm, int enable)
-{
-	if (enable)
-		enable_irq(wm->pen_irq);
-	else
-		disable_irq_nosync(wm->pen_irq);
-}
-
 static struct wm97xx_mach_ops mainstone_mach_ops = {
 	.acc_enabled	= 1,
 	.acc_pen_up	= wm97xx_acc_pen_up,
 	.acc_pen_down	= wm97xx_acc_pen_down,
 	.acc_startup	= wm97xx_acc_startup,
 	.acc_shutdown	= wm97xx_acc_shutdown,
-	.irq_enable	= wm97xx_irq_enable,
 	.irq_gpio	= WM97XX_GPIO_2,
 };
 
diff --git a/drivers/input/touchscreen/zylonite-wm97xx.c b/drivers/input/touchscreen/zylonite-wm97xx.c
index ed7eae638713..a70fe4abe520 100644
--- a/drivers/input/touchscreen/zylonite-wm97xx.c
+++ b/drivers/input/touchscreen/zylonite-wm97xx.c
@@ -160,20 +160,11 @@ static int wm97xx_acc_startup(struct wm97xx *wm)
 	return 0;
 }
 
-static void wm97xx_irq_enable(struct wm97xx *wm, int enable)
-{
-	if (enable)
-		enable_irq(wm->pen_irq);
-	else
-		disable_irq_nosync(wm->pen_irq);
-}
-
 static struct wm97xx_mach_ops zylonite_mach_ops = {
 	.acc_enabled	= 1,
 	.acc_pen_up	= wm97xx_acc_pen_up,
 	.acc_pen_down	= wm97xx_acc_pen_down,
 	.acc_startup	= wm97xx_acc_startup,
-	.irq_enable	= wm97xx_irq_enable,
 	.irq_gpio	= WM97XX_GPIO_2,
 };
 
diff --git a/include/linux/wm97xx.h b/include/linux/wm97xx.h
index 85bd8dd3caea..332d2b0f29b9 100644
--- a/include/linux/wm97xx.h
+++ b/include/linux/wm97xx.h
@@ -254,9 +254,6 @@ struct wm97xx_mach_ops {
 	int (*acc_startup) (struct wm97xx *);
 	void (*acc_shutdown) (struct wm97xx *);
 
-	/* interrupt mask control - required for accelerated operation */
-	void (*irq_enable) (struct wm97xx *, int enable);
-
 	/* GPIO pin used for accelerated operation */
 	int irq_gpio;
 
-- 
2.29.2

