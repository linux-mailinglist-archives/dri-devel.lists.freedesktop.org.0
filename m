Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B320507363
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FADA10EF86;
	Tue, 19 Apr 2022 16:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2891710EF86
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:40:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B1DA61851;
 Tue, 19 Apr 2022 16:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07FCC385A7;
 Tue, 19 Apr 2022 16:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386418;
 bh=6i8ruhF5Ltjl7b0QsDur4Rd2y+D+UB0Sp+r6bnt5gQ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CCsceejaZuNc9CJNA+MQ2k2xKeeJqb6phUacnpMoDIkA40dFT0MU/JGr78yh30HfS
 jaucL3U+hl7WXJevmndk2k0fPmlOU+c0kJ7DB7/bUsy+0uCdUMLNXviU9ByIrZR7Y6
 wKgZ0JWPTZOdDk8Jgq5iqtibJhz0MQ4O0TcrDj4jwYCIPMEE+WvuH24kKaFJN62tBK
 APB8S9FZ/JaVltcwc5L9kTs4pIz/sWaJ47MLKcbN+MQVQfAa7koWJGCvhCy7D2JBzQ
 2vNTGJ6CkUlZNDWaJbvfQRsr7zVHXwG1+xpUbOsvv8K0IY6V83OhdH8mzsYQEIF+TG
 4ea44N5+GI1Eg==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 11/48] ARM: pxa: move pcmcia board data into mach-pxa
Date: Tue, 19 Apr 2022 18:37:33 +0200
Message-Id: <20220419163810.2118169-12-arnd@kernel.org>
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
 Jonathan Cameron <jic23@cam.ac.uk>, Tomas Cech <sleep_walker@suse.com>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Sergey Lapin <slapin@ossfans.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The drivers/pcmcia/pxa2xx_*.c are essentially part of the
board files, but for historic reasons located in drivers/pcmcia.

Move them into the same place as the actual board file to avoid
lots of machine header inclusions.

Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Jonathan Cameron <jic23@cam.ac.uk>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/Makefile                    |  18 ++-
 .../arm/mach-pxa/balloon3-pcmcia.c            |   4 +-
 arch/arm/mach-pxa/balloon3.c                  |   2 +-
 .../mach-pxa/{include/mach => }/balloon3.h    |   2 +-
 .../arm/mach-pxa/colibri-pcmcia.c             |   2 +-
 .../arm/mach-pxa/e740-pcmcia.c                |   2 +-
 .../arm/mach-pxa/hx4700-pcmcia.c              |   2 +-
 .../arm/mach-pxa/palmld-pcmcia.c              |   2 +-
 .../arm/mach-pxa/palmtc-pcmcia.c              |   4 +-
 arch/arm/mach-pxa/palmtc.c                    |   2 +-
 arch/arm/mach-pxa/{include/mach => }/palmtc.h |   2 +-
 .../arm/mach-pxa/palmtx-pcmcia.c              |   4 +-
 arch/arm/mach-pxa/palmtx.c                    |   2 +-
 arch/arm/mach-pxa/{include/mach => }/palmtx.h |   2 +-
 .../arm/mach-pxa/trizeps4-pcmcia.c            |   4 +-
 arch/arm/mach-pxa/trizeps4.c                  |   2 +-
 .../mach-pxa/{include/mach => }/trizeps4.h    |   2 +-
 .../arm/mach-pxa/viper-pcmcia.c               |   6 +-
 .../arm/mach-pxa/viper-pcmcia.h               |   0
 arch/arm/mach-pxa/viper.c                     |   2 +-
 .../arm/mach-pxa/vpac270-pcmcia.c             |   4 +-
 arch/arm/mach-pxa/vpac270.c                   |   2 +-
 .../arm/mach-pxa/{include/mach => }/vpac270.h |   0
 arch/arm/mach-pxa/zeus.c                      |   2 +-
 drivers/pcmcia/Makefile                       |  13 --
 drivers/pcmcia/pxa2xx_sharpsl.c               |   2 +-
 drivers/pcmcia/soc_common.h                   | 120 +----------------
 include/pcmcia/soc_common.h                   | 125 ++++++++++++++++++
 28 files changed, 165 insertions(+), 169 deletions(-)
 rename drivers/pcmcia/pxa2xx_balloon3.c => arch/arm/mach-pxa/balloon3-pcmcia.c (98%)
 rename arch/arm/mach-pxa/{include/mach => }/balloon3.h (99%)
 rename drivers/pcmcia/pxa2xx_colibri.c => arch/arm/mach-pxa/colibri-pcmcia.c (99%)
 rename drivers/pcmcia/pxa2xx_e740.c => arch/arm/mach-pxa/e740-pcmcia.c (98%)
 rename drivers/pcmcia/pxa2xx_hx4700.c => arch/arm/mach-pxa/hx4700-pcmcia.c (98%)
 rename drivers/pcmcia/pxa2xx_palmld.c => arch/arm/mach-pxa/palmld-pcmcia.c (98%)
 rename drivers/pcmcia/pxa2xx_palmtc.c => arch/arm/mach-pxa/palmtc-pcmcia.c (98%)
 rename arch/arm/mach-pxa/{include/mach => }/palmtc.h (98%)
 rename drivers/pcmcia/pxa2xx_palmtx.c => arch/arm/mach-pxa/palmtx-pcmcia.c (98%)
 rename arch/arm/mach-pxa/{include/mach => }/palmtx.h (98%)
 rename drivers/pcmcia/pxa2xx_trizeps4.c => arch/arm/mach-pxa/trizeps4-pcmcia.c (98%)
 rename arch/arm/mach-pxa/{include/mach => }/trizeps4.h (99%)
 rename drivers/pcmcia/pxa2xx_viper.c => arch/arm/mach-pxa/viper-pcmcia.c (97%)
 rename include/linux/platform_data/pcmcia-pxa2xx_viper.h => arch/arm/mach-pxa/viper-pcmcia.h (100%)
 rename drivers/pcmcia/pxa2xx_vpac270.c => arch/arm/mach-pxa/vpac270-pcmcia.c (98%)
 rename arch/arm/mach-pxa/{include/mach => }/vpac270.h (100%)
 create mode 100644 include/pcmcia/soc_common.h

diff --git a/arch/arm/mach-pxa/Makefile b/arch/arm/mach-pxa/Makefile
index 68730ceb8b7c..0aec36e67dc1 100644
--- a/arch/arm/mach-pxa/Makefile
+++ b/arch/arm/mach-pxa/Makefile
@@ -37,7 +37,8 @@ obj-$(CONFIG_MACH_SAAR)		+= saar.o
 obj-$(CONFIG_ARCH_PXA_IDP)	+= idp.o
 obj-$(CONFIG_ARCH_VIPER)	+= viper.o
 obj-$(CONFIG_MACH_ARCOM_ZEUS)	+= zeus.o
-obj-$(CONFIG_MACH_BALLOON3)	+= balloon3.o
+obj-$(CONFIG_ARCOM_PCMCIA)	+= viper-pcmcia.o
+obj-$(CONFIG_MACH_BALLOON3)	+= balloon3.o balloon3-pcmcia.o
 obj-$(CONFIG_MACH_CSB726)	+= csb726.o
 obj-$(CONFIG_CSB726_CSB701)	+= csb701.o
 obj-$(CONFIG_MACH_CM_X300)      += cm-x300.o
@@ -47,18 +48,20 @@ obj-$(CONFIG_GUMSTIX_AM200EPD)	+= am200epd.o
 obj-$(CONFIG_GUMSTIX_AM300EPD)	+= am300epd.o
 obj-$(CONFIG_MACH_XCEP)         += xcep.o
 obj-$(CONFIG_MACH_TRIZEPS4)	+= trizeps4.o
+obj-$(CONFIG_TRIZEPS_PCMCIA)	+= trizeps4-pcmcia.o
 obj-$(CONFIG_MACH_LOGICPD_PXA270)	+= lpd270.o
 obj-$(CONFIG_MACH_PCM027)		+= pcm027.o
 obj-$(CONFIG_MACH_PCM990_BASEBOARD)	+= pcm990-baseboard.o
-obj-$(CONFIG_MACH_COLIBRI)			+= colibri-pxa270.o
+obj-$(CONFIG_MACH_COLIBRI)		+= colibri-pxa270.o colibri-pcmcia.o
 obj-$(CONFIG_MACH_COLIBRI_EVALBOARD)	+= colibri-evalboard.o
 obj-$(CONFIG_MACH_COLIBRI_PXA270_INCOME)	+= colibri-pxa270-income.o
 obj-$(CONFIG_MACH_COLIBRI300)	+= colibri-pxa3xx.o colibri-pxa300.o
-obj-$(CONFIG_MACH_COLIBRI320)	+= colibri-pxa3xx.o colibri-pxa320.o
-obj-$(CONFIG_MACH_VPAC270)	+= vpac270.o
+obj-$(CONFIG_MACH_COLIBRI320)	+= colibri-pxa3xx.o colibri-pxa320.o colibri-pcmcia.o
+obj-$(CONFIG_MACH_VPAC270)	+= vpac270.o vpac270-pcmcia.o
 
 # End-user Products
 obj-$(CONFIG_MACH_H4700)	+= hx4700.o
+obj-$(CONFIG_MACH_H4700)	+= hx4700-pcmcia.o
 obj-$(CONFIG_MACH_H5000)	+= h5000.o
 obj-$(CONFIG_MACH_HIMALAYA)	+= himalaya.o
 obj-$(CONFIG_MACH_MAGICIAN)	+= magician.o
@@ -66,12 +69,12 @@ obj-$(CONFIG_MACH_MIOA701)	+= mioa701.o mioa701_bootresume.o
 obj-$(CONFIG_PXA_EZX)           += ezx.o
 obj-$(CONFIG_MACH_MP900C)	+= mp900.o
 obj-$(CONFIG_MACH_PALMTE2)	+= palmte2.o
-obj-$(CONFIG_MACH_PALMTC)	+= palmtc.o
+obj-$(CONFIG_MACH_PALMTC)	+= palmtc.o palmtc-pcmcia.o
 obj-$(CONFIG_MACH_PALM27X)	+= palm27x.o
 obj-$(CONFIG_MACH_PALMT5)	+= palmt5.o
-obj-$(CONFIG_MACH_PALMTX)	+= palmtx.o
+obj-$(CONFIG_MACH_PALMTX)	+= palmtx.o palmtx-pcmcia.o
 obj-$(CONFIG_MACH_PALMZ72)	+= palmz72.o
-obj-$(CONFIG_MACH_PALMLD)	+= palmld.o
+obj-$(CONFIG_MACH_PALMLD)	+= palmld.o palmld-pcmcia.o
 obj-$(CONFIG_PALM_TREO)		+= palmtreo.o
 obj-$(CONFIG_PXA_SHARP_C7xx)	+= corgi.o sharpsl_pm.o corgi_pm.o
 obj-$(CONFIG_PXA_SHARP_Cxx00)	+= spitz.o sharpsl_pm.o spitz_pm.o
@@ -79,6 +82,7 @@ obj-$(CONFIG_MACH_POODLE)	+= poodle.o
 obj-$(CONFIG_MACH_TOSA)		+= tosa.o
 obj-$(CONFIG_MACH_ICONTROL)     += icontrol.o mxm8x10.o
 obj-$(CONFIG_ARCH_PXA_ESERIES)	+= eseries.o
+obj-$(CONFIG_MACH_E740)		+= e740-pcmcia.o
 obj-$(CONFIG_MACH_ZIPIT2)	+= z2.o
 
 obj-$(CONFIG_PXA_SYSTEMS_CPLDS)	+= pxa_cplds_irqs.o
diff --git a/drivers/pcmcia/pxa2xx_balloon3.c b/arch/arm/mach-pxa/balloon3-pcmcia.c
similarity index 98%
rename from drivers/pcmcia/pxa2xx_balloon3.c
rename to arch/arm/mach-pxa/balloon3-pcmcia.c
index 5fe1da7a50e4..6a27b76cc603 100644
--- a/drivers/pcmcia/pxa2xx_balloon3.c
+++ b/arch/arm/mach-pxa/balloon3-pcmcia.c
@@ -20,11 +20,11 @@
 #include <linux/irq.h>
 #include <linux/io.h>
 
-#include <mach/balloon3.h>
+#include "balloon3.h"
 
 #include <asm/mach-types.h>
 
-#include "soc_common.h"
+#include <pcmcia/soc_common.h>
 
 static int balloon3_pcmcia_hw_init(struct soc_pcmcia_socket *skt)
 {
diff --git a/arch/arm/mach-pxa/balloon3.c b/arch/arm/mach-pxa/balloon3.c
index 82f9299f67d3..896d47d9a8dc 100644
--- a/arch/arm/mach-pxa/balloon3.c
+++ b/arch/arm/mach-pxa/balloon3.c
@@ -40,7 +40,7 @@
 #include <asm/mach/flash.h>
 
 #include "pxa27x.h"
-#include <mach/balloon3.h>
+#include "balloon3.h"
 #include <linux/platform_data/asoc-pxa.h>
 #include <linux/platform_data/video-pxafb.h>
 #include <linux/platform_data/mmc-pxamci.h>
diff --git a/arch/arm/mach-pxa/include/mach/balloon3.h b/arch/arm/mach-pxa/balloon3.h
similarity index 99%
rename from arch/arm/mach-pxa/include/mach/balloon3.h
rename to arch/arm/mach-pxa/balloon3.h
index 04f3639c4082..f351358c0e5b 100644
--- a/arch/arm/mach-pxa/include/mach/balloon3.h
+++ b/arch/arm/mach-pxa/balloon3.h
@@ -11,7 +11,7 @@
 #ifndef ASM_ARCH_BALLOON3_H
 #define ASM_ARCH_BALLOON3_H
 
-#include "irqs.h" /* PXA_NR_BUILTIN_GPIO */
+#include <mach/irqs.h> /* PXA_NR_BUILTIN_GPIO */
 
 enum balloon3_features {
 	BALLOON3_FEATURE_OHCI,
diff --git a/drivers/pcmcia/pxa2xx_colibri.c b/arch/arm/mach-pxa/colibri-pcmcia.c
similarity index 99%
rename from drivers/pcmcia/pxa2xx_colibri.c
rename to arch/arm/mach-pxa/colibri-pcmcia.c
index f0f725e99604..9da7b478e5eb 100644
--- a/drivers/pcmcia/pxa2xx_colibri.c
+++ b/arch/arm/mach-pxa/colibri-pcmcia.c
@@ -14,7 +14,7 @@
 
 #include <asm/mach-types.h>
 
-#include "soc_common.h"
+#include <pcmcia/soc_common.h>
 
 #define	COLIBRI270_RESET_GPIO	53
 #define	COLIBRI270_PPEN_GPIO	107
diff --git a/drivers/pcmcia/pxa2xx_e740.c b/arch/arm/mach-pxa/e740-pcmcia.c
similarity index 98%
rename from drivers/pcmcia/pxa2xx_e740.c
rename to arch/arm/mach-pxa/e740-pcmcia.c
index 72caa6d05ab9..133535d7ac05 100644
--- a/drivers/pcmcia/pxa2xx_e740.c
+++ b/arch/arm/mach-pxa/e740-pcmcia.c
@@ -18,7 +18,7 @@
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
-#include "soc_common.h"
+#include <pcmcia/soc_common.h>
 
 static int e740_pcmcia_hw_init(struct soc_pcmcia_socket *skt)
 {
diff --git a/drivers/pcmcia/pxa2xx_hx4700.c b/arch/arm/mach-pxa/hx4700-pcmcia.c
similarity index 98%
rename from drivers/pcmcia/pxa2xx_hx4700.c
rename to arch/arm/mach-pxa/hx4700-pcmcia.c
index 87b6a1639d94..e8acbfc9ef6c 100644
--- a/drivers/pcmcia/pxa2xx_hx4700.c
+++ b/arch/arm/mach-pxa/hx4700-pcmcia.c
@@ -12,7 +12,7 @@
 #include <asm/mach-types.h>
 #include <mach/hx4700.h>
 
-#include "soc_common.h"
+#include <pcmcia/soc_common.h>
 
 static struct gpio gpios[] = {
 	{ GPIO114_HX4700_CF_RESET,    GPIOF_OUT_INIT_LOW,   "CF reset"        },
diff --git a/drivers/pcmcia/pxa2xx_palmld.c b/arch/arm/mach-pxa/palmld-pcmcia.c
similarity index 98%
rename from drivers/pcmcia/pxa2xx_palmld.c
rename to arch/arm/mach-pxa/palmld-pcmcia.c
index cfff41ac9ca2..07e0f7438db1 100644
--- a/drivers/pcmcia/pxa2xx_palmld.c
+++ b/arch/arm/mach-pxa/palmld-pcmcia.c
@@ -14,7 +14,7 @@
 
 #include <asm/mach-types.h>
 #include <mach/palmld.h>
-#include "soc_common.h"
+#include <pcmcia/soc_common.h>
 
 static struct gpio palmld_pcmcia_gpios[] = {
 	{ GPIO_NR_PALMLD_PCMCIA_POWER,	GPIOF_INIT_LOW,	"PCMCIA Power" },
diff --git a/drivers/pcmcia/pxa2xx_palmtc.c b/arch/arm/mach-pxa/palmtc-pcmcia.c
similarity index 98%
rename from drivers/pcmcia/pxa2xx_palmtc.c
rename to arch/arm/mach-pxa/palmtc-pcmcia.c
index 8fe05613ed04..8e3f382343fe 100644
--- a/drivers/pcmcia/pxa2xx_palmtc.c
+++ b/arch/arm/mach-pxa/palmtc-pcmcia.c
@@ -14,8 +14,8 @@
 #include <linux/delay.h>
 
 #include <asm/mach-types.h>
-#include <mach/palmtc.h>
-#include "soc_common.h"
+#include "palmtc.h"
+#include <pcmcia/soc_common.h>
 
 static struct gpio palmtc_pcmcia_gpios[] = {
 	{ GPIO_NR_PALMTC_PCMCIA_POWER1,	GPIOF_INIT_LOW,	"PCMCIA Power 1" },
diff --git a/arch/arm/mach-pxa/palmtc.c b/arch/arm/mach-pxa/palmtc.c
index c59fc76c0c3d..3054ffa397ad 100644
--- a/arch/arm/mach-pxa/palmtc.c
+++ b/arch/arm/mach-pxa/palmtc.c
@@ -30,7 +30,7 @@
 
 #include "pxa25x.h"
 #include <linux/platform_data/asoc-pxa.h>
-#include <mach/palmtc.h>
+#include "palmtc.h"
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/video-pxafb.h>
 #include <linux/platform_data/irda-pxaficp.h>
diff --git a/arch/arm/mach-pxa/include/mach/palmtc.h b/arch/arm/mach-pxa/palmtc.h
similarity index 98%
rename from arch/arm/mach-pxa/include/mach/palmtc.h
rename to arch/arm/mach-pxa/palmtc.h
index 9257a02c46e5..afec057c2857 100644
--- a/arch/arm/mach-pxa/include/mach/palmtc.h
+++ b/arch/arm/mach-pxa/palmtc.h
@@ -12,7 +12,7 @@
 #ifndef _INCLUDE_PALMTC_H_
 #define _INCLUDE_PALMTC_H_
 
-#include "irqs.h" /* PXA_GPIO_TO_IRQ */
+#include <mach/irqs.h> /* PXA_GPIO_TO_IRQ */
 
 /** HERE ARE GPIOs **/
 
diff --git a/drivers/pcmcia/pxa2xx_palmtx.c b/arch/arm/mach-pxa/palmtx-pcmcia.c
similarity index 98%
rename from drivers/pcmcia/pxa2xx_palmtx.c
rename to arch/arm/mach-pxa/palmtx-pcmcia.c
index c449ca72cb87..8c2aaad93043 100644
--- a/drivers/pcmcia/pxa2xx_palmtx.c
+++ b/arch/arm/mach-pxa/palmtx-pcmcia.c
@@ -12,8 +12,8 @@
 #include <linux/gpio.h>
 
 #include <asm/mach-types.h>
-#include <mach/palmtx.h>
-#include "soc_common.h"
+#include "palmtx.h"
+#include <pcmcia/soc_common.h>
 
 static struct gpio palmtx_pcmcia_gpios[] = {
 	{ GPIO_NR_PALMTX_PCMCIA_POWER1,	GPIOF_INIT_LOW,	"PCMCIA Power 1" },
diff --git a/arch/arm/mach-pxa/palmtx.c b/arch/arm/mach-pxa/palmtx.c
index 097b88638863..86460d6ea721 100644
--- a/arch/arm/mach-pxa/palmtx.c
+++ b/arch/arm/mach-pxa/palmtx.c
@@ -33,7 +33,7 @@
 
 #include "pxa27x.h"
 #include <linux/platform_data/asoc-pxa.h>
-#include <mach/palmtx.h>
+#include "palmtx.h"
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/video-pxafb.h>
 #include <linux/platform_data/irda-pxaficp.h>
diff --git a/arch/arm/mach-pxa/include/mach/palmtx.h b/arch/arm/mach-pxa/palmtx.h
similarity index 98%
rename from arch/arm/mach-pxa/include/mach/palmtx.h
rename to arch/arm/mach-pxa/palmtx.h
index ec88abf0fc6c..a2bb993952d9 100644
--- a/arch/arm/mach-pxa/include/mach/palmtx.h
+++ b/arch/arm/mach-pxa/palmtx.h
@@ -12,7 +12,7 @@
 #ifndef _INCLUDE_PALMTX_H_
 #define _INCLUDE_PALMTX_H_
 
-#include "irqs.h" /* PXA_GPIO_TO_IRQ */
+#include <mach/irqs.h> /* PXA_GPIO_TO_IRQ */
 
 /** HERE ARE GPIOs **/
 
diff --git a/drivers/pcmcia/pxa2xx_trizeps4.c b/arch/arm/mach-pxa/trizeps4-pcmcia.c
similarity index 98%
rename from drivers/pcmcia/pxa2xx_trizeps4.c
rename to arch/arm/mach-pxa/trizeps4-pcmcia.c
index 6db8fe880ed4..02d7bb0c538f 100644
--- a/drivers/pcmcia/pxa2xx_trizeps4.c
+++ b/arch/arm/mach-pxa/trizeps4-pcmcia.c
@@ -20,9 +20,9 @@
 #include <asm/irq.h>
 
 #include <mach/pxa2xx-regs.h>
-#include <mach/trizeps4.h>
+#include "trizeps4.h"
 
-#include "soc_common.h"
+#include <pcmcia/soc_common.h>
 
 extern void board_pcmcia_power(int power);
 
diff --git a/arch/arm/mach-pxa/trizeps4.c b/arch/arm/mach-pxa/trizeps4.c
index 1337008cc760..fadfbb40cd6c 100644
--- a/arch/arm/mach-pxa/trizeps4.c
+++ b/arch/arm/mach-pxa/trizeps4.c
@@ -40,7 +40,7 @@
 #include <asm/mach/flash.h>
 
 #include "pxa27x.h"
-#include <mach/trizeps4.h>
+#include "trizeps4.h"
 #include <linux/platform_data/asoc-pxa.h>
 #include <linux/platform_data/video-pxafb.h>
 #include <linux/platform_data/mmc-pxamci.h>
diff --git a/arch/arm/mach-pxa/include/mach/trizeps4.h b/arch/arm/mach-pxa/trizeps4.h
similarity index 99%
rename from arch/arm/mach-pxa/include/mach/trizeps4.h
rename to arch/arm/mach-pxa/trizeps4.h
index 27926629f9c6..7597b9de11e2 100644
--- a/arch/arm/mach-pxa/include/mach/trizeps4.h
+++ b/arch/arm/mach-pxa/trizeps4.h
@@ -12,7 +12,7 @@
 #define _TRIPEPS4_H_
 
 #include <mach/addr-map.h>
-#include "irqs.h" /* PXA_GPIO_TO_IRQ */
+#include <mach/irqs.h> /* PXA_GPIO_TO_IRQ */
 
 /* physical memory regions */
 #define TRIZEPS4_FLASH_PHYS	(PXA_CS0_PHYS)  /* Flash region */
diff --git a/drivers/pcmcia/pxa2xx_viper.c b/arch/arm/mach-pxa/viper-pcmcia.c
similarity index 97%
rename from drivers/pcmcia/pxa2xx_viper.c
rename to arch/arm/mach-pxa/viper-pcmcia.c
index 7ac6647d286e..26599dcc49b3 100644
--- a/drivers/pcmcia/pxa2xx_viper.c
+++ b/arch/arm/mach-pxa/viper-pcmcia.c
@@ -22,13 +22,11 @@
 #include <linux/gpio.h>
 
 #include <pcmcia/ss.h>
+#include <pcmcia/soc_common.h>
 
 #include <asm/irq.h>
 
-#include <linux/platform_data/pcmcia-pxa2xx_viper.h>
-
-#include "soc_common.h"
-#include "pxa2xx_base.h"
+#include "viper-pcmcia.h"
 
 static struct platform_device *arcom_pcmcia_dev;
 
diff --git a/include/linux/platform_data/pcmcia-pxa2xx_viper.h b/arch/arm/mach-pxa/viper-pcmcia.h
similarity index 100%
rename from include/linux/platform_data/pcmcia-pxa2xx_viper.h
rename to arch/arm/mach-pxa/viper-pcmcia.h
diff --git a/arch/arm/mach-pxa/viper.c b/arch/arm/mach-pxa/viper.c
index ac94b10bf8c1..600d9e80b00c 100644
--- a/arch/arm/mach-pxa/viper.c
+++ b/arch/arm/mach-pxa/viper.c
@@ -49,7 +49,7 @@
 #include <linux/platform_data/asoc-pxa.h>
 #include <linux/platform_data/video-pxafb.h>
 #include "regs-uart.h"
-#include <linux/platform_data/pcmcia-pxa2xx_viper.h>
+#include "viper-pcmcia.h"
 #include "viper.h"
 
 #include <asm/setup.h>
diff --git a/drivers/pcmcia/pxa2xx_vpac270.c b/arch/arm/mach-pxa/vpac270-pcmcia.c
similarity index 98%
rename from drivers/pcmcia/pxa2xx_vpac270.c
rename to arch/arm/mach-pxa/vpac270-pcmcia.c
index 3565add03a5e..9fd990c8a5fb 100644
--- a/drivers/pcmcia/pxa2xx_vpac270.c
+++ b/arch/arm/mach-pxa/vpac270-pcmcia.c
@@ -13,9 +13,9 @@
 
 #include <asm/mach-types.h>
 
-#include <mach/vpac270.h>
+#include "vpac270.h"
 
-#include "soc_common.h"
+#include <pcmcia/soc_common.h>
 
 static struct gpio vpac270_pcmcia_gpios[] = {
 	{ GPIO107_VPAC270_PCMCIA_PPEN,	GPIOF_INIT_LOW,	"PCMCIA PPEN" },
diff --git a/arch/arm/mach-pxa/vpac270.c b/arch/arm/mach-pxa/vpac270.c
index 7067d1464689..8f74bafcf1f9 100644
--- a/arch/arm/mach-pxa/vpac270.c
+++ b/arch/arm/mach-pxa/vpac270.c
@@ -30,7 +30,7 @@
 
 #include "pxa27x.h"
 #include <linux/platform_data/asoc-pxa.h>
-#include <mach/vpac270.h>
+#include "vpac270.h"
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/video-pxafb.h>
 #include <linux/platform_data/usb-ohci-pxa27x.h>
diff --git a/arch/arm/mach-pxa/include/mach/vpac270.h b/arch/arm/mach-pxa/vpac270.h
similarity index 100%
rename from arch/arm/mach-pxa/include/mach/vpac270.h
rename to arch/arm/mach-pxa/vpac270.h
diff --git a/arch/arm/mach-pxa/zeus.c b/arch/arm/mach-pxa/zeus.c
index 67396e85bb66..2e6c8d156d77 100644
--- a/arch/arm/mach-pxa/zeus.c
+++ b/arch/arm/mach-pxa/zeus.c
@@ -47,7 +47,7 @@
 #include <linux/platform_data/video-pxafb.h>
 #include "pm.h"
 #include <linux/platform_data/asoc-pxa.h>
-#include <linux/platform_data/pcmcia-pxa2xx_viper.h>
+#include "viper-pcmcia.h"
 #include "zeus.h"
 #include <mach/smemc.h>
 
diff --git a/drivers/pcmcia/Makefile b/drivers/pcmcia/Makefile
index c43267b18f55..c59ddde42007 100644
--- a/drivers/pcmcia/Makefile
+++ b/drivers/pcmcia/Makefile
@@ -50,18 +50,5 @@ sa1100_cs-$(CONFIG_SA1100_SIMPAD)		+= sa1100_simpad.o
 
 pxa2xx-obj-$(CONFIG_MACH_MAINSTONE)		+= pxa2xx_mainstone.o
 pxa2xx-obj-$(CONFIG_PXA_SHARPSL)		+= pxa2xx_sharpsl.o
-pxa2xx-obj-$(CONFIG_ARCOM_PCMCIA)		+= pxa2xx_viper.o
-pxa2xx-obj-$(CONFIG_TRIZEPS_PCMCIA)		+= pxa2xx_trizeps4.o
-pxa2xx-obj-$(CONFIG_MACH_PALMTX)		+= pxa2xx_palmtx.o
-pxa2xx-obj-$(CONFIG_MACH_PALMTC)		+= pxa2xx_palmtc.o
-pxa2xx-obj-$(CONFIG_MACH_PALMLD)		+= pxa2xx_palmld.o
-pxa2xx-obj-$(CONFIG_MACH_E740)			+= pxa2xx_e740.o
-pxa2xx-obj-$(CONFIG_MACH_VPAC270)		+= pxa2xx_vpac270.o
-pxa2xx-obj-$(CONFIG_MACH_BALLOON3)		+= pxa2xx_balloon3.o
-pxa2xx-obj-$(CONFIG_MACH_COLIBRI)		+= pxa2xx_colibri.o
-pxa2xx-obj-$(CONFIG_MACH_COLIBRI320)		+= pxa2xx_colibri.o
-pxa2xx-obj-$(CONFIG_MACH_H4700)			+= pxa2xx_hx4700.o
-
 obj-$(CONFIG_PCMCIA_PXA2XX)			+= pxa2xx_base.o $(pxa2xx-obj-y)
-
 obj-$(CONFIG_PCMCIA_XXS1500)			+= xxs1500_ss.o
diff --git a/drivers/pcmcia/pxa2xx_sharpsl.c b/drivers/pcmcia/pxa2xx_sharpsl.c
index 66fe1d1af12a..b3ba858f70cb 100644
--- a/drivers/pcmcia/pxa2xx_sharpsl.c
+++ b/drivers/pcmcia/pxa2xx_sharpsl.c
@@ -18,7 +18,7 @@
 #include <asm/irq.h>
 #include <asm/hardware/scoop.h>
 
-#include "soc_common.h"
+#include <pcmcia/soc_common.h>
 
 #define	NO_KEEP_VS 0x0001
 #define SCOOP_DEV platform_scoop_config->devs
diff --git a/drivers/pcmcia/soc_common.h b/drivers/pcmcia/soc_common.h
index 222e81c79365..17ef05aa8afe 100644
--- a/drivers/pcmcia/soc_common.h
+++ b/drivers/pcmcia/soc_common.h
@@ -13,137 +13,19 @@
 /* include the world */
 #include <linux/clk.h>
 #include <linux/cpufreq.h>
-#include <pcmcia/ss.h>
 #include <pcmcia/cistpl.h>
-
+#include <pcmcia/soc_common.h>
 
 struct device;
 struct gpio_desc;
 struct pcmcia_low_level;
 struct regulator;
 
-struct soc_pcmcia_regulator {
-	struct regulator	*reg;
-	bool			on;
-};
-
-/*
- * This structure encapsulates per-socket state which we might need to
- * use when responding to a Card Services query of some kind.
- */
-struct soc_pcmcia_socket {
-	struct pcmcia_socket	socket;
-
-	/*
-	 * Info from low level handler
-	 */
-	unsigned int		nr;
-	struct clk		*clk;
-
-	/*
-	 * Core PCMCIA state
-	 */
-	const struct pcmcia_low_level *ops;
-
-	unsigned int		status;
-	socket_state_t		cs_state;
-
-	unsigned short		spd_io[MAX_IO_WIN];
-	unsigned short		spd_mem[MAX_WIN];
-	unsigned short		spd_attr[MAX_WIN];
-
-	struct resource		res_skt;
-	struct resource		res_io;
-	struct resource		res_mem;
-	struct resource		res_attr;
-	void __iomem		*virt_io;
-
-	struct {
-		int		gpio;
-		struct gpio_desc *desc;
-		unsigned int	irq;
-		const char	*name;
-	} stat[6];
-#define SOC_STAT_CD		0	/* Card detect */
-#define SOC_STAT_BVD1		1	/* BATDEAD / IOSTSCHG */
-#define SOC_STAT_BVD2		2	/* BATWARN / IOSPKR */
-#define SOC_STAT_RDY		3	/* Ready / Interrupt */
-#define SOC_STAT_VS1		4	/* Voltage sense 1 */
-#define SOC_STAT_VS2		5	/* Voltage sense 2 */
-
-	struct gpio_desc	*gpio_reset;
-	struct gpio_desc	*gpio_bus_enable;
-	struct soc_pcmcia_regulator vcc;
-	struct soc_pcmcia_regulator vpp;
-
-	unsigned int		irq_state;
-
-#ifdef CONFIG_CPU_FREQ
-	struct notifier_block	cpufreq_nb;
-#endif
-	struct timer_list	poll_timer;
-	struct list_head	node;
-	void *driver_data;
-};
-
 struct skt_dev_info {
 	int nskt;
 	struct soc_pcmcia_socket skt[];
 };
 
-struct pcmcia_state {
-  unsigned detect: 1,
-            ready: 1,
-             bvd1: 1,
-             bvd2: 1,
-           wrprot: 1,
-            vs_3v: 1,
-            vs_Xv: 1;
-};
-
-struct pcmcia_low_level {
-	struct module *owner;
-
-	/* first socket in system */
-	int first;
-	/* nr of sockets */
-	int nr;
-
-	int (*hw_init)(struct soc_pcmcia_socket *);
-	void (*hw_shutdown)(struct soc_pcmcia_socket *);
-
-	void (*socket_state)(struct soc_pcmcia_socket *, struct pcmcia_state *);
-	int (*configure_socket)(struct soc_pcmcia_socket *, const socket_state_t *);
-
-	/*
-	 * Enable card status IRQs on (re-)initialisation.  This can
-	 * be called at initialisation, power management event, or
-	 * pcmcia event.
-	 */
-	void (*socket_init)(struct soc_pcmcia_socket *);
-
-	/*
-	 * Disable card status IRQs and PCMCIA bus on suspend.
-	 */
-	void (*socket_suspend)(struct soc_pcmcia_socket *);
-
-	/*
-	 * Hardware specific timing routines.
-	 * If provided, the get_timing routine overrides the SOC default.
-	 */
-	unsigned int (*get_timing)(struct soc_pcmcia_socket *, unsigned int, unsigned int);
-	int (*set_timing)(struct soc_pcmcia_socket *);
-	int (*show_timing)(struct soc_pcmcia_socket *, char *);
-
-#ifdef CONFIG_CPU_FREQ
-	/*
-	 * CPUFREQ support.
-	 */
-	int (*frequency_change)(struct soc_pcmcia_socket *, unsigned long, struct cpufreq_freqs *);
-#endif
-};
-
-
 struct soc_pcmcia_timing {
 	unsigned short io;
 	unsigned short mem;
diff --git a/include/pcmcia/soc_common.h b/include/pcmcia/soc_common.h
new file mode 100644
index 000000000000..26f1473a06c5
--- /dev/null
+++ b/include/pcmcia/soc_common.h
@@ -0,0 +1,125 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <pcmcia/ss.h>
+
+struct module;
+struct cpufreq_freqs;
+
+struct soc_pcmcia_regulator {
+	struct regulator	*reg;
+	bool			on;
+};
+
+struct pcmcia_state {
+  unsigned detect: 1,
+            ready: 1,
+             bvd1: 1,
+             bvd2: 1,
+           wrprot: 1,
+            vs_3v: 1,
+            vs_Xv: 1;
+};
+
+/*
+ * This structure encapsulates per-socket state which we might need to
+ * use when responding to a Card Services query of some kind.
+ */
+struct soc_pcmcia_socket {
+	struct pcmcia_socket	socket;
+
+	/*
+	 * Info from low level handler
+	 */
+	unsigned int		nr;
+	struct clk		*clk;
+
+	/*
+	 * Core PCMCIA state
+	 */
+	const struct pcmcia_low_level *ops;
+
+	unsigned int		status;
+	socket_state_t		cs_state;
+
+	unsigned short		spd_io[MAX_IO_WIN];
+	unsigned short		spd_mem[MAX_WIN];
+	unsigned short		spd_attr[MAX_WIN];
+
+	struct resource		res_skt;
+	struct resource		res_io;
+	struct resource		res_mem;
+	struct resource		res_attr;
+	void __iomem		*virt_io;
+
+	struct {
+		int		gpio;
+		struct gpio_desc *desc;
+		unsigned int	irq;
+		const char	*name;
+	} stat[6];
+#define SOC_STAT_CD		0	/* Card detect */
+#define SOC_STAT_BVD1		1	/* BATDEAD / IOSTSCHG */
+#define SOC_STAT_BVD2		2	/* BATWARN / IOSPKR */
+#define SOC_STAT_RDY		3	/* Ready / Interrupt */
+#define SOC_STAT_VS1		4	/* Voltage sense 1 */
+#define SOC_STAT_VS2		5	/* Voltage sense 2 */
+
+	struct gpio_desc	*gpio_reset;
+	struct gpio_desc	*gpio_bus_enable;
+	struct soc_pcmcia_regulator vcc;
+	struct soc_pcmcia_regulator vpp;
+
+	unsigned int		irq_state;
+
+#ifdef CONFIG_CPU_FREQ
+	struct notifier_block	cpufreq_nb;
+#endif
+	struct timer_list	poll_timer;
+	struct list_head	node;
+	void *driver_data;
+};
+
+
+struct pcmcia_low_level {
+	struct module *owner;
+
+	/* first socket in system */
+	int first;
+	/* nr of sockets */
+	int nr;
+
+	int (*hw_init)(struct soc_pcmcia_socket *);
+	void (*hw_shutdown)(struct soc_pcmcia_socket *);
+
+	void (*socket_state)(struct soc_pcmcia_socket *, struct pcmcia_state *);
+	int (*configure_socket)(struct soc_pcmcia_socket *, const socket_state_t *);
+
+	/*
+	 * Enable card status IRQs on (re-)initialisation.  This can
+	 * be called at initialisation, power management event, or
+	 * pcmcia event.
+	 */
+	void (*socket_init)(struct soc_pcmcia_socket *);
+
+	/*
+	 * Disable card status IRQs and PCMCIA bus on suspend.
+	 */
+	void (*socket_suspend)(struct soc_pcmcia_socket *);
+
+	/*
+	 * Hardware specific timing routines.
+	 * If provided, the get_timing routine overrides the SOC default.
+	 */
+	unsigned int (*get_timing)(struct soc_pcmcia_socket *, unsigned int, unsigned int);
+	int (*set_timing)(struct soc_pcmcia_socket *);
+	int (*show_timing)(struct soc_pcmcia_socket *, char *);
+
+#ifdef CONFIG_CPU_FREQ
+	/*
+	 * CPUFREQ support.
+	 */
+	int (*frequency_change)(struct soc_pcmcia_socket *, unsigned long, struct cpufreq_freqs *);
+#endif
+};
+
+
+
-- 
2.29.2

