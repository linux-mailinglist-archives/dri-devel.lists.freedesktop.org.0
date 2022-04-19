Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE67507375
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A30510F0D3;
	Tue, 19 Apr 2022 16:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAD610F0D3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:42:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ED60461870;
 Tue, 19 Apr 2022 16:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A777C385AC;
 Tue, 19 Apr 2022 16:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386551;
 bh=ZitIFNWOGNclnWEkC5k5wKgP8LZADBB8lqdOWZNB8wQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M+b/M4GGqpVoZ/vtuDGOrUAXIOp7QmnE+sliunl9FKuasZGbZF8J7WC0f5+dwHIfV
 QC+dZIBkk7Hf4pg+kZCT8EC/A41AqH2ENGG3vZIkxJLPpRBM+Aex4V3HjClb5ZY2s8
 QXyUz7wFF1e86cNx2J/LH32cIfYAT9jRVz/3EZvQYWNJDZXGGvuD5wmAvR7FCCQYz2
 NZPv5X3QIar8bWv9pUOFMdDuQHRolS5csdfPn4P7i2wmWxafJsowCMdw66MeqUo3e4
 4cfMCEif39tK7z2xRA3fIStlRIiOkBAdJrgnC88utYEWooh/HHVaMdBdkWFUYWuz/m
 6oQTHQqp34oXw==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 28/48] Input: touchscreen: use wrapper for pxa2xx ac97
 registers
Date: Tue, 19 Apr 2022 18:37:50 +0200
Message-Id: <20220419163810.2118169-29-arnd@kernel.org>
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
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

To avoid a dependency on the pxa platform header files with
hardcoded registers, change the driver to call a wrapper
in the pxa2xx-ac97-lib that encapsulates all the other
ac97 stuff.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-input@vger.kernel.org
Cc: alsa-devel@alsa-project.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/touchscreen/Kconfig            |  2 ++
 drivers/input/touchscreen/mainstone-wm97xx.c | 16 ++++++++--------
 drivers/input/touchscreen/zylonite-wm97xx.c  | 12 ++++++------
 include/sound/pxa2xx-lib.h                   |  4 ++++
 sound/arm/pxa2xx-ac97-lib.c                  | 12 ++++++++++++
 5 files changed, 32 insertions(+), 14 deletions(-)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 43c7d6e5bdc0..2d70c945b20a 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -902,6 +902,7 @@ config TOUCHSCREEN_WM9713
 config TOUCHSCREEN_WM97XX_MAINSTONE
 	tristate "WM97xx Mainstone/Palm accelerated touch"
 	depends on TOUCHSCREEN_WM97XX && ARCH_PXA
+	depends on SND_PXA2XX_LIB_AC97
 	help
 	  Say Y here for support for streaming mode with WM97xx touchscreens
 	  on Mainstone, Palm Tungsten T5, TX and LifeDrive systems.
@@ -914,6 +915,7 @@ config TOUCHSCREEN_WM97XX_MAINSTONE
 config TOUCHSCREEN_WM97XX_ZYLONITE
 	tristate "Zylonite accelerated touch"
 	depends on TOUCHSCREEN_WM97XX && MACH_ZYLONITE
+	depends on SND_PXA2XX_LIB_AC97
 	select TOUCHSCREEN_WM9713
 	help
 	  Say Y here for support for streaming mode with the touchscreen
diff --git a/drivers/input/touchscreen/mainstone-wm97xx.c b/drivers/input/touchscreen/mainstone-wm97xx.c
index 940d3c92b1f8..8f6fe68f1f99 100644
--- a/drivers/input/touchscreen/mainstone-wm97xx.c
+++ b/drivers/input/touchscreen/mainstone-wm97xx.c
@@ -28,7 +28,7 @@
 #include <linux/soc/pxa/cpu.h>
 #include <linux/wm97xx.h>
 
-#include <mach/regs-ac97.h>
+#include <sound/pxa2xx-lib.h>
 
 #include <asm/mach-types.h>
 
@@ -104,11 +104,11 @@ static void wm97xx_acc_pen_up(struct wm97xx *wm)
 	msleep(1);
 
 	if (cpu_is_pxa27x()) {
-		while (MISR & (1 << 2))
-			MODR;
+		while (pxa2xx_ac97_read_misr() & (1 << 2))
+			pxa2xx_ac97_read_modr();
 	} else if (cpu_is_pxa3xx()) {
 		for (count = 0; count < 16; count++)
-			MODR;
+			pxa2xx_ac97_read_modr();
 	}
 }
 
@@ -130,7 +130,7 @@ static int wm97xx_acc_pen_down(struct wm97xx *wm)
 		return RC_PENUP;
 	}
 
-	x = MODR;
+	x = pxa2xx_ac97_read_modr();
 	if (x == last) {
 		tries++;
 		return RC_AGAIN;
@@ -138,10 +138,10 @@ static int wm97xx_acc_pen_down(struct wm97xx *wm)
 	last = x;
 	do {
 		if (reads)
-			x = MODR;
-		y = MODR;
+			x = pxa2xx_ac97_read_modr();
+		y = pxa2xx_ac97_read_modr();
 		if (pressure)
-			p = MODR;
+			p = pxa2xx_ac97_read_modr();
 
 		dev_dbg(wm->dev, "Raw coordinates: x=%x, y=%x, p=%x\n",
 			x, y, p);
diff --git a/drivers/input/touchscreen/zylonite-wm97xx.c b/drivers/input/touchscreen/zylonite-wm97xx.c
index cabdd6e3c6f8..ed7eae638713 100644
--- a/drivers/input/touchscreen/zylonite-wm97xx.c
+++ b/drivers/input/touchscreen/zylonite-wm97xx.c
@@ -24,7 +24,7 @@
 #include <linux/soc/pxa/cpu.h>
 #include <linux/wm97xx.h>
 
-#include <mach/regs-ac97.h>
+#include <sound/pxa2xx-lib.h>
 
 struct continuous {
 	u16 id;    /* codec id */
@@ -79,7 +79,7 @@ static void wm97xx_acc_pen_up(struct wm97xx *wm)
 	msleep(1);
 
 	for (i = 0; i < 16; i++)
-		MODR;
+		pxa2xx_ac97_read_modr();
 }
 
 static int wm97xx_acc_pen_down(struct wm97xx *wm)
@@ -100,7 +100,7 @@ static int wm97xx_acc_pen_down(struct wm97xx *wm)
 		return RC_PENUP;
 	}
 
-	x = MODR;
+	x = pxa2xx_ac97_read_modr();
 	if (x == last) {
 		tries++;
 		return RC_AGAIN;
@@ -108,10 +108,10 @@ static int wm97xx_acc_pen_down(struct wm97xx *wm)
 	last = x;
 	do {
 		if (reads)
-			x = MODR;
-		y = MODR;
+			x = pxa2xx_ac97_read_modr();
+		y = pxa2xx_ac97_read_modr();
 		if (pressure)
-			p = MODR;
+			p = pxa2xx_ac97_read_modr();
 
 		dev_dbg(wm->dev, "Raw coordinates: x=%x, y=%x, p=%x\n",
 			x, y, p);
diff --git a/include/sound/pxa2xx-lib.h b/include/sound/pxa2xx-lib.h
index 95100cff25d1..0a6f8dabf8c4 100644
--- a/include/sound/pxa2xx-lib.h
+++ b/include/sound/pxa2xx-lib.h
@@ -52,4 +52,8 @@ extern int pxa2xx_ac97_hw_resume(void);
 extern int pxa2xx_ac97_hw_probe(struct platform_device *dev);
 extern void pxa2xx_ac97_hw_remove(struct platform_device *dev);
 
+/* modem registers, used by touchscreen driver */
+u32 pxa2xx_ac97_read_modr(void);
+u32 pxa2xx_ac97_read_misr(void);
+
 #endif
diff --git a/sound/arm/pxa2xx-ac97-lib.c b/sound/arm/pxa2xx-ac97-lib.c
index 8c79d224f03b..572b73d73762 100644
--- a/sound/arm/pxa2xx-ac97-lib.c
+++ b/sound/arm/pxa2xx-ac97-lib.c
@@ -428,6 +428,18 @@ void pxa2xx_ac97_hw_remove(struct platform_device *dev)
 }
 EXPORT_SYMBOL_GPL(pxa2xx_ac97_hw_remove);
 
+u32 pxa2xx_ac97_read_modr(void)
+{
+	return MODR;
+}
+EXPORT_SYMBOL_GPL(pxa2xx_ac97_read_modr);
+
+u32 pxa2xx_ac97_read_misr(void)
+{
+	return MISR;
+}
+EXPORT_SYMBOL_GPL(pxa2xx_ac97_read_misr);
+
 MODULE_AUTHOR("Nicolas Pitre");
 MODULE_DESCRIPTION("Intel/Marvell PXA sound library");
 MODULE_LICENSE("GPL");
-- 
2.29.2

