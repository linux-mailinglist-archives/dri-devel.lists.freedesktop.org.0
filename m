Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A9723E045
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 20:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C416E8FE;
	Thu,  6 Aug 2020 18:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D796E8FE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 18:24:14 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B54DA22DFA;
 Thu,  6 Aug 2020 18:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596738254;
 bh=q0Pq7sku/SPnT1ET/sh9AlOCKdsVzE0QJaA7REl2uZc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lbnFsT+RK21lf+oxqJcNK5WoPzIsFQIKPbttWKD/ePu2G5vaMQthIMK+LQEjlNX9Y
 dfWUuV5fzbZ2AS8hKo0KIju4Mv80xKGVaMlqySdCiM44wWj2SC2vss+Eg41vIlGynt
 vYo5scp9YnJ2YgnUU9o3weD6TbTnPt68bwvVLaL0=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 33/41] fbdev: s3c2410fb: remove mach header dependency
Date: Thu,  6 Aug 2020 20:20:50 +0200
Message-Id: <20200806182059.2431-33-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
References: <20200806181932.2253-1-krzk@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The s3c2410fb driver is too deeply intertwined with the s3c24xx
platform code. Change it in a way that avoids the use of platform
header files but having all interface data in a platform_data
header, and the private register definitions next to the driver
itself.

One ugly bit here is that the driver pokes directly into gpio
registers, which are owned by another driver. Passing the
mapped addresses in platform_data is somewhat suboptimal, but
it is a small improvement over the previous version.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/mach-s3c24xx/include/mach/fb.h       |  2 --
 arch/arm/mach-s3c24xx/mach-amlm5900.c         |  7 ++--
 arch/arm/mach-s3c24xx/mach-anubis.c           |  1 -
 arch/arm/mach-s3c24xx/mach-at2440evb.c        |  3 +-
 arch/arm/mach-s3c24xx/mach-bast.c             |  3 +-
 arch/arm/mach-s3c24xx/mach-gta02.c            |  2 +-
 arch/arm/mach-s3c24xx/mach-h1940.c            |  7 ++--
 arch/arm/mach-s3c24xx/mach-jive.c             | 10 ++++--
 arch/arm/mach-s3c24xx/mach-mini2440.c         |  9 +++--
 arch/arm/mach-s3c24xx/mach-n30.c              |  3 +-
 arch/arm/mach-s3c24xx/mach-osiris.c           |  1 -
 arch/arm/mach-s3c24xx/mach-qt2410.c           |  3 +-
 arch/arm/mach-s3c24xx/mach-rx1950.c           |  8 +++--
 arch/arm/mach-s3c24xx/mach-rx3715.c           |  7 ++--
 arch/arm/mach-s3c24xx/mach-smdk2413.c         |  3 +-
 arch/arm/mach-s3c24xx/mach-smdk2416.c         |  1 -
 arch/arm/mach-s3c24xx/mach-smdk2440.c         |  8 +++--
 arch/arm/mach-s3c24xx/mach-smdk2443.c         |  3 +-
 arch/arm/mach-s3c24xx/mach-vstms.c            |  3 +-
 arch/arm/plat-samsung/devs.c                  |  2 +-
 .../video/fbdev/s3c2410fb-regs-lcd.h          | 28 ++++------------
 drivers/video/fbdev/s3c2410fb.c               | 16 +++++----
 .../linux/platform_data}/fb-s3c2410.h         | 33 ++++++++++++++++++-
 23 files changed, 98 insertions(+), 65 deletions(-)
 delete mode 100644 arch/arm/mach-s3c24xx/include/mach/fb.h
 rename arch/arm/mach-s3c24xx/include/mach/regs-lcd.h => drivers/video/fbdev/s3c2410fb-regs-lcd.h (84%)
 rename {arch/arm/plat-samsung/include/plat => include/linux/platform_data}/fb-s3c2410.h (57%)

diff --git a/arch/arm/mach-s3c24xx/include/mach/fb.h b/arch/arm/mach-s3c24xx/include/mach/fb.h
deleted file mode 100644
index 4e539cb8b884..000000000000
--- a/arch/arm/mach-s3c24xx/include/mach/fb.h
+++ /dev/null
@@ -1,2 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include <plat/fb-s3c2410.h>
diff --git a/arch/arm/mach-s3c24xx/mach-amlm5900.c b/arch/arm/mach-s3c24xx/mach-amlm5900.c
index 1a2a9259b4b6..f04eb9aa29ac 100644
--- a/arch/arm/mach-s3c24xx/mach-amlm5900.c
+++ b/arch/arm/mach-s3c24xx/mach-amlm5900.c
@@ -29,9 +29,8 @@
 
 #include <asm/irq.h>
 #include <asm/mach-types.h>
-#include <mach/fb.h>
+#include <linux/platform_data/fb-s3c2410.h>
 
-#include <mach/regs-lcd.h>
 #include <mach/regs-gpio.h>
 #include <mach/gpio-samsung.h>
 
@@ -191,13 +190,17 @@ static struct s3c2410fb_mach_info __initdata amlm5900_fb_info = {
 
 	.gpccon =	0xaaaaaaaa,
 	.gpccon_mask =	0xffffffff,
+	.gpccon_reg =	S3C2410_GPCCON,
 	.gpcup =	0x0000ffff,
 	.gpcup_mask =	0xffffffff,
+	.gpcup_reg =	S3C2410_GPCUP,
 
 	.gpdcon =	0xaaaaaaaa,
 	.gpdcon_mask =	0xffffffff,
+	.gpdcon_reg =	S3C2410_GPDCON,
 	.gpdup =	0x0000ffff,
 	.gpdup_mask =	0xffffffff,
+	.gpdup_reg =	S3C2410_GPDUP,
 };
 #endif
 
diff --git a/arch/arm/mach-s3c24xx/mach-anubis.c b/arch/arm/mach-s3c24xx/mach-anubis.c
index 753a314f4493..15cab0976941 100644
--- a/arch/arm/mach-s3c24xx/mach-anubis.c
+++ b/arch/arm/mach-s3c24xx/mach-anubis.c
@@ -28,7 +28,6 @@
 #include <asm/mach-types.h>
 
 #include <mach/regs-gpio.h>
-#include <mach/regs-lcd.h>
 #include <mach/gpio-samsung.h>
 #include <linux/platform_data/mtd-nand-s3c2410.h>
 #include <linux/platform_data/i2c-s3c2410.h>
diff --git a/arch/arm/mach-s3c24xx/mach-at2440evb.c b/arch/arm/mach-s3c24xx/mach-at2440evb.c
index a2693246b3ca..7fcb24a49ad8 100644
--- a/arch/arm/mach-s3c24xx/mach-at2440evb.c
+++ b/arch/arm/mach-s3c24xx/mach-at2440evb.c
@@ -24,12 +24,11 @@
 #include <asm/mach/map.h>
 #include <asm/mach/irq.h>
 
-#include <mach/fb.h>
+#include <linux/platform_data/fb-s3c2410.h>
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
 #include <mach/regs-gpio.h>
-#include <mach/regs-lcd.h>
 #include <mach/gpio-samsung.h>
 #include <linux/platform_data/mtd-nand-s3c2410.h>
 #include <linux/platform_data/i2c-s3c2410.h>
diff --git a/arch/arm/mach-s3c24xx/mach-bast.c b/arch/arm/mach-s3c24xx/mach-bast.c
index 9eef0f80175f..306891235f73 100644
--- a/arch/arm/mach-s3c24xx/mach-bast.c
+++ b/arch/arm/mach-s3c24xx/mach-bast.c
@@ -40,9 +40,8 @@
 #include <asm/mach/irq.h>
 #include <asm/mach-types.h>
 
-#include <mach/fb.h>
+#include <linux/platform_data/fb-s3c2410.h>
 #include <mach/regs-gpio.h>
-#include <mach/regs-lcd.h>
 #include <mach/gpio-samsung.h>
 
 #include <plat/cpu.h>
diff --git a/arch/arm/mach-s3c24xx/mach-gta02.c b/arch/arm/mach-s3c24xx/mach-gta02.c
index c023e261a240..a28e92142b04 100644
--- a/arch/arm/mach-s3c24xx/mach-gta02.c
+++ b/arch/arm/mach-s3c24xx/mach-gta02.c
@@ -57,8 +57,8 @@
 #include <linux/platform_data/touchscreen-s3c2410.h>
 #include <linux/platform_data/usb-ohci-s3c2410.h>
 #include <linux/platform_data/usb-s3c2410_udc.h>
+#include <linux/platform_data/fb-s3c2410.h>
 
-#include <mach/fb.h>
 #include <mach/regs-gpio.h>
 #include <mach/regs-irq.h>
 #include <mach/gpio-samsung.h>
diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
index e9b3b048a96d..d45825898835 100644
--- a/arch/arm/mach-s3c24xx/mach-h1940.c
+++ b/arch/arm/mach-s3c24xx/mach-h1940.c
@@ -47,11 +47,10 @@
 
 #include <sound/uda1380.h>
 
-#include <mach/fb.h>
+#include <linux/platform_data/fb-s3c2410.h>
 #include <mach/hardware.h>
 #include <mach/regs-clock.h>
 #include <mach/regs-gpio.h>
-#include <mach/regs-lcd.h>
 #include <mach/gpio-samsung.h>
 
 #include <plat/cpu.h>
@@ -210,12 +209,16 @@ static struct s3c2410fb_mach_info h1940_fb_info __initdata = {
 	.lpcsel =	0x02,
 	.gpccon =	0xaa940659,
 	.gpccon_mask =	0xffffc0f0,
+	.gpccon_reg =	S3C2410_GPCCON,
 	.gpcup =	0x0000ffff,
 	.gpcup_mask =	0xffffffff,
+	.gpcup_reg =	S3C2410_GPCUP,
 	.gpdcon =	0xaa84aaa0,
 	.gpdcon_mask =	0xffffffff,
+	.gpdcon_reg =	S3C2410_GPDCON,
 	.gpdup =	0x0000faff,
 	.gpdup_mask =	0xffffffff,
+	.gpdup_reg =	S3C2410_GPDUP,
 };
 
 static int power_supply_init(struct device *dev)
diff --git a/arch/arm/mach-s3c24xx/mach-jive.c b/arch/arm/mach-s3c24xx/mach-jive.c
index 2c630ade08bb..ec6c40ea8f86 100644
--- a/arch/arm/mach-s3c24xx/mach-jive.c
+++ b/arch/arm/mach-s3c24xx/mach-jive.c
@@ -32,8 +32,7 @@
 #include <linux/platform_data/i2c-s3c2410.h>
 
 #include <mach/regs-gpio.h>
-#include <mach/regs-lcd.h>
-#include <mach/fb.h>
+#include <linux/platform_data/fb-s3c2410.h>
 #include <mach/gpio-samsung.h>
 
 #include <asm/mach-types.h>
@@ -320,6 +319,7 @@ static struct s3c2410fb_mach_info jive_lcd_config = {
 	 * data. */
 
 	.gpcup		= (0xf << 1) | (0x3f << 10),
+	.gpcup_reg	= S3C2410_GPCUP,
 
 	.gpccon		= (S3C2410_GPC1_VCLK   | S3C2410_GPC2_VLINE |
 			   S3C2410_GPC3_VFRAME | S3C2410_GPC4_VM |
@@ -333,8 +333,12 @@ static struct s3c2410fb_mach_info jive_lcd_config = {
 			   S3C2410_GPCCON_MASK(12) | S3C2410_GPCCON_MASK(13) |
 			   S3C2410_GPCCON_MASK(14) | S3C2410_GPCCON_MASK(15)),
 
+	.gpccon_reg	= S3C2410_GPCCON,
+
 	.gpdup		= (0x3f << 2) | (0x3f << 10),
 
+	.gpdup_reg	= S3C2410_GPDUP,
+
 	.gpdcon		= (S3C2410_GPD2_VD10  | S3C2410_GPD3_VD11 |
 			   S3C2410_GPD4_VD12  | S3C2410_GPD5_VD13 |
 			   S3C2410_GPD6_VD14  | S3C2410_GPD7_VD15 |
@@ -348,6 +352,8 @@ static struct s3c2410fb_mach_info jive_lcd_config = {
 			   S3C2410_GPDCON_MASK(10) | S3C2410_GPDCON_MASK(11)|
 			   S3C2410_GPDCON_MASK(12) | S3C2410_GPDCON_MASK(13)|
 			   S3C2410_GPDCON_MASK(14) | S3C2410_GPDCON_MASK(15)),
+
+	.gpdcon_reg	= S3C2410_GPDCON,
 };
 
 /* ILI9320 support. */
diff --git a/arch/arm/mach-s3c24xx/mach-mini2440.c b/arch/arm/mach-s3c24xx/mach-mini2440.c
index d3cc0141f58c..6f58a3404b36 100644
--- a/arch/arm/mach-s3c24xx/mach-mini2440.c
+++ b/arch/arm/mach-s3c24xx/mach-mini2440.c
@@ -30,12 +30,11 @@
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include <mach/fb.h>
+#include <linux/platform_data/fb-s3c2410.h>
 #include <asm/mach-types.h>
 
 #include <mach/regs-gpio.h>
 #include <linux/platform_data/leds-s3c24xx.h>
-#include <mach/regs-lcd.h>
 #include <mach/irqs.h>
 #include <mach/gpio-samsung.h>
 #include <linux/platform_data/mtd-nand-s3c2410.h>
@@ -213,6 +212,9 @@ static struct s3c2410fb_mach_info mini2440_fb_info __initdata = {
 			   S3C2410_GPCCON_MASK(12) | S3C2410_GPCCON_MASK(13) |
 			   S3C2410_GPCCON_MASK(14) | S3C2410_GPCCON_MASK(15)),
 
+	.gpccon_reg	= S3C2410_GPCCON,
+	.gpcup_reg	= S3C2410_GPCUP,
+
 	.gpdup		= (0x3f << 2) | (0x3f << 10),
 
 	.gpdcon		= (S3C2410_GPD2_VD10  | S3C2410_GPD3_VD11 |
@@ -228,6 +230,9 @@ static struct s3c2410fb_mach_info mini2440_fb_info __initdata = {
 			   S3C2410_GPDCON_MASK(10) | S3C2410_GPDCON_MASK(11)|
 			   S3C2410_GPDCON_MASK(12) | S3C2410_GPDCON_MASK(13)|
 			   S3C2410_GPDCON_MASK(14) | S3C2410_GPDCON_MASK(15)),
+
+	.gpdcon_reg	= S3C2410_GPDCON,
+	.gpdup_reg	= S3C2410_GPDUP,
 };
 
 /* MMC/SD  */
diff --git a/arch/arm/mach-s3c24xx/mach-n30.c b/arch/arm/mach-s3c24xx/mach-n30.c
index 24e97646b068..a3c1315f5ffb 100644
--- a/arch/arm/mach-s3c24xx/mach-n30.c
+++ b/arch/arm/mach-s3c24xx/mach-n30.c
@@ -31,10 +31,9 @@
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
-#include <mach/fb.h>
+#include <linux/platform_data/fb-s3c2410.h>
 #include <linux/platform_data/leds-s3c24xx.h>
 #include <mach/regs-gpio.h>
-#include <mach/regs-lcd.h>
 #include <mach/gpio-samsung.h>
 #include <plat/gpio-cfg.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-osiris.c b/arch/arm/mach-s3c24xx/mach-osiris.c
index 03595144126b..ed10a32e26b8 100644
--- a/arch/arm/mach-s3c24xx/mach-osiris.c
+++ b/arch/arm/mach-s3c24xx/mach-osiris.c
@@ -42,7 +42,6 @@
 #include <plat/gpio-cfg.h>
 
 #include <mach/regs-gpio.h>
-#include <mach/regs-lcd.h>
 #include <mach/gpio-samsung.h>
 
 #include "common.h"
diff --git a/arch/arm/mach-s3c24xx/mach-qt2410.c b/arch/arm/mach-s3c24xx/mach-qt2410.c
index b21f7fbcadf9..1ccad4e9e437 100644
--- a/arch/arm/mach-s3c24xx/mach-qt2410.c
+++ b/arch/arm/mach-s3c24xx/mach-qt2410.c
@@ -32,8 +32,7 @@
 #include <asm/mach-types.h>
 
 #include <linux/platform_data/leds-s3c24xx.h>
-#include <mach/regs-lcd.h>
-#include <mach/fb.h>
+#include <linux/platform_data/fb-s3c2410.h>
 #include <linux/platform_data/mtd-nand-s3c2410.h>
 #include <linux/platform_data/usb-s3c2410_udc.h>
 #include <linux/platform_data/i2c-s3c2410.h>
diff --git a/arch/arm/mach-s3c24xx/mach-rx1950.c b/arch/arm/mach-s3c24xx/mach-rx1950.c
index aa91785a95b5..2513ce7fa026 100644
--- a/arch/arm/mach-s3c24xx/mach-rx1950.c
+++ b/arch/arm/mach-s3c24xx/mach-rx1950.c
@@ -42,12 +42,11 @@
 #include <linux/platform_data/mtd-nand-s3c2410.h>
 #include <linux/platform_data/touchscreen-s3c2410.h>
 #include <linux/platform_data/usb-s3c2410_udc.h>
+#include <linux/platform_data/fb-s3c2410.h>
 
 #include <sound/uda1380.h>
 
-#include <mach/fb.h>
 #include <mach/regs-gpio.h>
-#include <mach/regs-lcd.h>
 #include <mach/gpio-samsung.h>
 
 #include <plat/cpu.h>
@@ -360,14 +359,17 @@ static struct s3c2410fb_mach_info rx1950_lcd_cfg = {
 	.lpcsel = 0x02,
 	.gpccon = 0xaa9556a9,
 	.gpccon_mask = 0xffc003fc,
+	.gpccon_reg = S3C2410_GPCCON,
 	.gpcup = 0x0000ffff,
 	.gpcup_mask = 0xffffffff,
+	.gpcup_reg = S3C2410_GPCUP,
 
 	.gpdcon = 0xaa90aaa1,
 	.gpdcon_mask = 0xffc0fff0,
+	.gpdcon_reg = S3C2410_GPDCON,
 	.gpdup = 0x0000fcfd,
 	.gpdup_mask = 0xffffffff,
-
+	.gpdup_reg = S3C2410_GPDUP,
 };
 
 static struct pwm_lookup rx1950_pwm_lookup[] = {
diff --git a/arch/arm/mach-s3c24xx/mach-rx3715.c b/arch/arm/mach-s3c24xx/mach-rx3715.c
index fc197cee77a0..0eb45f13f0c4 100644
--- a/arch/arm/mach-s3c24xx/mach-rx3715.c
+++ b/arch/arm/mach-s3c24xx/mach-rx3715.c
@@ -30,13 +30,12 @@
 #include <asm/mach/map.h>
 
 #include <linux/platform_data/mtd-nand-s3c2410.h>
+#include <linux/platform_data/fb-s3c2410.h>
 
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
-#include <mach/fb.h>
 #include <mach/regs-gpio.h>
-#include <mach/regs-lcd.h>
 #include <mach/gpio-samsung.h>
 #include <plat/gpio-cfg.h>
 
@@ -124,13 +123,17 @@ static struct s3c2410fb_mach_info rx3715_fb_info __initdata = {
 
 	.gpccon =	0xaa955699,
 	.gpccon_mask =	0xffc003cc,
+	.gpccon_reg =	S3C2410_GPCCON,
 	.gpcup =	0x0000ffff,
 	.gpcup_mask =	0xffffffff,
+	.gpcup_reg =	S3C2410_GPCUP,
 
 	.gpdcon =	0xaa95aaa1,
 	.gpdcon_mask =	0xffc0fff0,
+	.gpdcon_reg =	S3C2410_GPDCON,
 	.gpdup =	0x0000faff,
 	.gpdup_mask =	0xffffffff,
+	.gpdup_reg =	S3C2410_GPDUP,
 };
 
 static struct mtd_partition __initdata rx3715_nand_part[] = {
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2413.c b/arch/arm/mach-s3c24xx/mach-smdk2413.c
index 287bd502a030..4604ec89f06e 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2413.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2413.c
@@ -31,12 +31,11 @@
 
 //#include <asm/debug-ll.h>
 #include <mach/regs-gpio.h>
-#include <mach/regs-lcd.h>
 
 #include <linux/platform_data/usb-s3c2410_udc.h>
 #include <linux/platform_data/i2c-s3c2410.h>
+#include <linux/platform_data/fb-s3c2410.h>
 #include <mach/gpio-samsung.h>
-#include <mach/fb.h>
 #include <plat/gpio-cfg.h>
 
 #include <plat/devs.h>
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2416.c b/arch/arm/mach-s3c24xx/mach-smdk2416.c
index f98feb45568d..217401b2238d 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2416.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2416.c
@@ -30,7 +30,6 @@
 #include <asm/mach-types.h>
 
 #include <mach/regs-gpio.h>
-#include <mach/regs-lcd.h>
 #include <mach/regs-s3c2443-clock.h>
 #include <mach/gpio-samsung.h>
 
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2440.c b/arch/arm/mach-s3c24xx/mach-smdk2440.c
index 5939372ecec2..a0116cff6e4e 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2440.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2440.c
@@ -27,11 +27,10 @@
 #include <asm/mach-types.h>
 
 #include <mach/regs-gpio.h>
-#include <mach/regs-lcd.h>
 #include <mach/gpio-samsung.h>
 #include <plat/gpio-cfg.h>
 
-#include <mach/fb.h>
+#include <linux/platform_data/fb-s3c2410.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 
 #include <plat/devs.h>
@@ -137,6 +136,11 @@ static struct s3c2410fb_mach_info smdk2440_fb_info __initdata = {
 	.gpdcon_mask	= 0xffffffff,
 	.gpdup		= 0x0000faff,
 	.gpdup_mask	= 0xffffffff,
+
+	.gpccon_reg	= S3C2410_GPCCON,
+	.gpcup_reg	= S3C2410_GPCUP,
+	.gpdcon_reg	= S3C2410_GPDCON,
+	.gpdup_reg	= S3C2410_GPDUP,
 #endif
 
 	.lpcsel		= ((0xCE6) & ~7) | 1<<4,
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2443.c b/arch/arm/mach-s3c24xx/mach-smdk2443.c
index 8a1f2580c6c7..1c2fa7c3feb8 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2443.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2443.c
@@ -26,9 +26,8 @@
 #include <asm/mach-types.h>
 
 #include <mach/regs-gpio.h>
-#include <mach/regs-lcd.h>
 
-#include <mach/fb.h>
+#include <linux/platform_data/fb-s3c2410.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 
 #include <plat/devs.h>
diff --git a/arch/arm/mach-s3c24xx/mach-vstms.c b/arch/arm/mach-s3c24xx/mach-vstms.c
index c6e777aab24e..ff3fa0017494 100644
--- a/arch/arm/mach-s3c24xx/mach-vstms.c
+++ b/arch/arm/mach-s3c24xx/mach-vstms.c
@@ -29,11 +29,10 @@
 #include <asm/mach-types.h>
 
 #include <mach/regs-gpio.h>
-#include <mach/regs-lcd.h>
 #include <mach/gpio-samsung.h>
 #include <plat/gpio-cfg.h>
 
-#include <mach/fb.h>
+#include <linux/platform_data/fb-s3c2410.h>
 
 #include <linux/platform_data/i2c-s3c2410.h>
 #include <linux/platform_data/mtd-nand-s3c2410.h>
diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index b16be04c0169..e23204132b27 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -52,7 +52,7 @@
 #include <linux/soc/samsung/s3c-adc.h>
 #include <linux/platform_data/ata-samsung_cf.h>
 #include <plat/fb.h>
-#include <plat/fb-s3c2410.h>
+#include <linux/platform_data/fb-s3c2410.h>
 #include <linux/platform_data/hwmon-s3c.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 #include <plat/keypad.h>
diff --git a/arch/arm/mach-s3c24xx/include/mach/regs-lcd.h b/drivers/video/fbdev/s3c2410fb-regs-lcd.h
similarity index 84%
rename from arch/arm/mach-s3c24xx/include/mach/regs-lcd.h
rename to drivers/video/fbdev/s3c2410fb-regs-lcd.h
index 4c3434f261bb..1e46f7a788e5 100644
--- a/arch/arm/mach-s3c24xx/include/mach/regs-lcd.h
+++ b/drivers/video/fbdev/s3c2410fb-regs-lcd.h
@@ -7,6 +7,13 @@
 #ifndef ___ASM_ARCH_REGS_LCD_H
 #define ___ASM_ARCH_REGS_LCD_H
 
+/*
+ * a couple of values are used as platform data in
+ * include/linux/platform_data/fb-s3c2410.h and not
+ * duplicated here.
+ */
+#include <linux/platform_data/fb-s3c2410.h>
+
 #define S3C2410_LCDREG(x)	(x)
 
 /* LCD control registers */
@@ -29,13 +36,6 @@
 #define S3C2410_LCDCON1_STN8BPP	   (3<<1)
 #define S3C2410_LCDCON1_STN12BPP   (4<<1)
 
-#define S3C2410_LCDCON1_TFT1BPP	   (8<<1)
-#define S3C2410_LCDCON1_TFT2BPP	   (9<<1)
-#define S3C2410_LCDCON1_TFT4BPP	   (10<<1)
-#define S3C2410_LCDCON1_TFT8BPP	   (11<<1)
-#define S3C2410_LCDCON1_TFT16BPP   (12<<1)
-#define S3C2410_LCDCON1_TFT24BPP   (13<<1)
-
 #define S3C2410_LCDCON1_ENVID	   (1)
 
 #define S3C2410_LCDCON1_MODEMASK    0x1E
@@ -66,20 +66,6 @@
 
 #define S3C2410_LCDCON4_GET_HSPW(x) ( ((x) >>  0) & 0xFF)
 
-#define S3C2410_LCDCON5_BPP24BL	    (1<<12)
-#define S3C2410_LCDCON5_FRM565	    (1<<11)
-#define S3C2410_LCDCON5_INVVCLK	    (1<<10)
-#define S3C2410_LCDCON5_INVVLINE    (1<<9)
-#define S3C2410_LCDCON5_INVVFRAME   (1<<8)
-#define S3C2410_LCDCON5_INVVD	    (1<<7)
-#define S3C2410_LCDCON5_INVVDEN	    (1<<6)
-#define S3C2410_LCDCON5_INVPWREN    (1<<5)
-#define S3C2410_LCDCON5_INVLEND	    (1<<4)
-#define S3C2410_LCDCON5_PWREN	    (1<<3)
-#define S3C2410_LCDCON5_ENLEND	    (1<<2)
-#define S3C2410_LCDCON5_BSWP	    (1<<1)
-#define S3C2410_LCDCON5_HWSWP	    (1<<0)
-
 /* framebuffer start addressed */
 #define S3C2410_LCDSADDR1   S3C2410_LCDREG(0x14)
 #define S3C2410_LCDSADDR2   S3C2410_LCDREG(0x18)
diff --git a/drivers/video/fbdev/s3c2410fb.c b/drivers/video/fbdev/s3c2410fb.c
index 6f8fa501583f..d8ae5258de46 100644
--- a/drivers/video/fbdev/s3c2410fb.c
+++ b/drivers/video/fbdev/s3c2410fb.c
@@ -29,19 +29,18 @@
 #include <linux/clk.h>
 #include <linux/cpufreq.h>
 #include <linux/io.h>
+#include <linux/platform_data/fb-s3c2410.h>
 
 #include <asm/div64.h>
 
 #include <asm/mach/map.h>
-#include <mach/regs-lcd.h>
-#include <mach/regs-gpio.h>
-#include <mach/fb.h>
 
 #ifdef CONFIG_PM
 #include <linux/pm.h>
 #endif
 
 #include "s3c2410fb.h"
+#include "s3c2410fb-regs-lcd.h"
 
 /* Debugging stuff */
 static int debug = IS_BUILTIN(CONFIG_FB_S3C2410_DEBUG);
@@ -672,6 +671,9 @@ static inline void modify_gpio(void __iomem *reg,
 {
 	unsigned long tmp;
 
+	if (!reg)
+		return;
+
 	tmp = readl(reg) & ~mask;
 	writel(tmp | set, reg);
 }
@@ -702,10 +704,10 @@ static int s3c2410fb_init_registers(struct fb_info *info)
 
 	/* modify the gpio(s) with interrupts set (bjd) */
 
-	modify_gpio(S3C2410_GPCUP,  mach_info->gpcup,  mach_info->gpcup_mask);
-	modify_gpio(S3C2410_GPCCON, mach_info->gpccon, mach_info->gpccon_mask);
-	modify_gpio(S3C2410_GPDUP,  mach_info->gpdup,  mach_info->gpdup_mask);
-	modify_gpio(S3C2410_GPDCON, mach_info->gpdcon, mach_info->gpdcon_mask);
+	modify_gpio(mach_info->gpcup_reg,  mach_info->gpcup,  mach_info->gpcup_mask);
+	modify_gpio(mach_info->gpccon_reg, mach_info->gpccon, mach_info->gpccon_mask);
+	modify_gpio(mach_info->gpdup_reg,  mach_info->gpdup,  mach_info->gpdup_mask);
+	modify_gpio(mach_info->gpdcon_reg, mach_info->gpdcon, mach_info->gpdcon_mask);
 
 	local_irq_restore(flags);
 
diff --git a/arch/arm/plat-samsung/include/plat/fb-s3c2410.h b/include/linux/platform_data/fb-s3c2410.h
similarity index 57%
rename from arch/arm/plat-samsung/include/plat/fb-s3c2410.h
rename to include/linux/platform_data/fb-s3c2410.h
index 614240d768b4..10c11e6316d6 100644
--- a/arch/arm/plat-samsung/include/plat/fb-s3c2410.h
+++ b/include/linux/platform_data/fb-s3c2410.h
@@ -8,6 +8,8 @@
 #ifndef __ASM_PLAT_FB_S3C2410_H
 #define __ASM_PLAT_FB_S3C2410_H __FILE__
 
+#include <linux/compiler_types.h>
+
 struct s3c2410fb_hw {
 	unsigned long	lcdcon1;
 	unsigned long	lcdcon2;
@@ -20,6 +22,17 @@ struct s3c2410fb_hw {
 struct s3c2410fb_display {
 	/* LCD type */
 	unsigned type;
+#define S3C2410_LCDCON1_DSCAN4	   (0<<5)
+#define S3C2410_LCDCON1_STN4	   (1<<5)
+#define S3C2410_LCDCON1_STN8	   (2<<5)
+#define S3C2410_LCDCON1_TFT	   (3<<5)
+
+#define S3C2410_LCDCON1_TFT1BPP	   (8<<1)
+#define S3C2410_LCDCON1_TFT2BPP	   (9<<1)
+#define S3C2410_LCDCON1_TFT4BPP	   (10<<1)
+#define S3C2410_LCDCON1_TFT8BPP	   (11<<1)
+#define S3C2410_LCDCON1_TFT16BPP   (12<<1)
+#define S3C2410_LCDCON1_TFT24BPP   (13<<1)
 
 	/* Screen size */
 	unsigned short width;
@@ -40,6 +53,19 @@ struct s3c2410fb_display {
 
 	/* lcd configuration registers */
 	unsigned long	lcdcon5;
+#define S3C2410_LCDCON5_BPP24BL	    (1<<12)
+#define S3C2410_LCDCON5_FRM565	    (1<<11)
+#define S3C2410_LCDCON5_INVVCLK	    (1<<10)
+#define S3C2410_LCDCON5_INVVLINE    (1<<9)
+#define S3C2410_LCDCON5_INVVFRAME   (1<<8)
+#define S3C2410_LCDCON5_INVVD	    (1<<7)
+#define S3C2410_LCDCON5_INVVDEN	    (1<<6)
+#define S3C2410_LCDCON5_INVPWREN    (1<<5)
+#define S3C2410_LCDCON5_INVLEND	    (1<<4)
+#define S3C2410_LCDCON5_PWREN	    (1<<3)
+#define S3C2410_LCDCON5_ENLEND	    (1<<2)
+#define S3C2410_LCDCON5_BSWP	    (1<<1)
+#define S3C2410_LCDCON5_HWSWP	    (1<<0)
 };
 
 struct s3c2410fb_mach_info {
@@ -59,10 +85,15 @@ struct s3c2410fb_mach_info {
 	unsigned long	gpdcon;
 	unsigned long	gpdcon_mask;
 
+	void __iomem *  gpccon_reg;
+	void __iomem *  gpcup_reg;
+	void __iomem *  gpdcon_reg;
+	void __iomem *  gpdup_reg;
+
 	/* lpc3600 control register */
 	unsigned long	lpcsel;
 };
 
-extern void __init s3c24xx_fb_set_platdata(struct s3c2410fb_mach_info *);
+extern void s3c24xx_fb_set_platdata(struct s3c2410fb_mach_info *);
 
 #endif /* __ASM_PLAT_FB_S3C2410_H */
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
