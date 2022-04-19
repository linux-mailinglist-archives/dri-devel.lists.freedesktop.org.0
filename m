Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7627E50738A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6556910F11B;
	Tue, 19 Apr 2022 16:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5802110F11D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:44:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A71DCB81BB6;
 Tue, 19 Apr 2022 16:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F49C385AE;
 Tue, 19 Apr 2022 16:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386691;
 bh=Q+hKS3gu9ozJQemd2cebipFlCYB+OBJ4+1494EInzlc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uVJA17DW8g6LLXA9uZBkgJXYGqfW/DR9m7+0LIbHwLFkDMVhfXjDo7GE3E6G5cIvH
 A7I3WEQ3j7r7KlVhCylo5SdgM+WjxsqW+v02JiImfKAs88RDNenRIsFTxNd5Ds1ZlR
 7CMUSoWIIpMvcga6dpE19EzA+Jbj4t3qxa1e+1xa/nH51R0T1WWTdB9otegZVrCmyF
 YzLNohYe40975YvkQ4TLRjT3AAjSHpMt4ltJ0YgjfVmI7Crq+6vBYj+b4nhb84w828
 Dyq9p11+OjYw5iVNo5voSaUAwITvDg4qoYd5lYi2KFxQncIdymitm0Soxfw1sTzvWC
 4KulWEnXqufog==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 46/48] ARM: pxa: move mach/*.h to mach-pxa/
Date: Tue, 19 Apr 2022 18:38:08 +0200
Message-Id: <20220419163810.2118169-47-arnd@kernel.org>
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

None of the headers are included from outside of the mach-pxa
directory, so move them all in there.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/am300epd.c                  |  2 +-
 arch/arm/mach-pxa/balloon3.h                  |  2 +-
 arch/arm/mach-pxa/colibri-pxa3xx.c            |  2 +-
 arch/arm/mach-pxa/colibri.h                   |  2 +-
 arch/arm/mach-pxa/corgi.h                     |  2 +-
 arch/arm/mach-pxa/corgi_pm.c                  |  2 +-
 arch/arm/mach-pxa/csb726.c                    |  2 +-
 arch/arm/mach-pxa/csb726.h                    |  2 +-
 arch/arm/mach-pxa/devices.c                   |  6 +--
 arch/arm/mach-pxa/e740-pcmcia.c               |  2 +-
 .../{include/mach => }/eseries-gpio.h         |  0
 arch/arm/mach-pxa/eseries.c                   |  2 +-
 arch/arm/mach-pxa/generic.c                   |  8 +--
 arch/arm/mach-pxa/gumstix.h                   |  2 +-
 arch/arm/mach-pxa/h5000.c                     |  2 +-
 arch/arm/mach-pxa/hx4700.h                    |  2 +-
 arch/arm/mach-pxa/idp.h                       |  2 +-
 arch/arm/mach-pxa/include/mach/pxa-regs.h     | 52 ------------------
 arch/arm/mach-pxa/irq.c                       |  2 +-
 arch/arm/mach-pxa/{include/mach => }/irqs.h   |  0
 arch/arm/mach-pxa/lpd270.c                    |  2 +-
 arch/arm/mach-pxa/lubbock.c                   |  2 +-
 arch/arm/mach-pxa/lubbock.h                   |  2 +-
 arch/arm/mach-pxa/magician.c                  |  2 +-
 .../mach-pxa/{include/mach => }/magician.h    |  2 +-
 arch/arm/mach-pxa/mainstone.c                 |  2 +-
 arch/arm/mach-pxa/mainstone.h                 |  2 +-
 arch/arm/mach-pxa/mfp-pxa2xx.c                |  2 +-
 arch/arm/mach-pxa/mfp-pxa3xx.c                |  2 +-
 arch/arm/mach-pxa/{include/mach => }/mfp.h    |  0
 arch/arm/mach-pxa/mioa701.c                   |  2 +-
 arch/arm/mach-pxa/palmld.h                    |  2 +-
 arch/arm/mach-pxa/palmt5.h                    |  2 +-
 arch/arm/mach-pxa/palmtc.h                    |  2 +-
 arch/arm/mach-pxa/palmtreo.c                  |  2 +-
 arch/arm/mach-pxa/palmtx.h                    |  2 +-
 arch/arm/mach-pxa/pcm027.h                    |  2 +-
 arch/arm/mach-pxa/pcm990_baseboard.h          |  2 +-
 arch/arm/mach-pxa/poodle.h                    |  2 +-
 arch/arm/mach-pxa/pxa-dt.c                    |  2 +-
 arch/arm/mach-pxa/pxa-regs.h                  | 53 ++++++++++++++++++-
 arch/arm/mach-pxa/pxa25x.c                    |  6 +--
 arch/arm/mach-pxa/pxa25x.h                    |  4 +-
 arch/arm/mach-pxa/pxa27x.c                    |  6 +--
 arch/arm/mach-pxa/pxa27x.h                    |  4 +-
 .../mach-pxa/{include/mach => }/pxa2xx-regs.h |  0
 arch/arm/mach-pxa/pxa2xx.c                    |  6 +--
 .../mach-pxa/{include/mach => }/pxa3xx-regs.h |  0
 arch/arm/mach-pxa/pxa3xx.c                    |  8 +--
 arch/arm/mach-pxa/pxa3xx.h                    |  4 +-
 .../mach-pxa/{include/mach => }/regs-ost.h    |  0
 arch/arm/mach-pxa/reset.c                     |  6 +--
 arch/arm/mach-pxa/{include/mach => }/reset.h  |  0
 arch/arm/mach-pxa/sharpsl_pm.c                |  2 +-
 arch/arm/mach-pxa/sleep.S                     |  4 +-
 arch/arm/mach-pxa/smemc.c                     |  2 +-
 arch/arm/mach-pxa/{include/mach => }/smemc.h  |  0
 arch/arm/mach-pxa/spitz.c                     |  4 +-
 arch/arm/mach-pxa/spitz.h                     |  2 +-
 arch/arm/mach-pxa/standby.S                   |  2 +-
 arch/arm/mach-pxa/tosa.c                      |  6 +--
 arch/arm/mach-pxa/{include/mach => }/tosa.h   |  0
 arch/arm/mach-pxa/trizeps4-pcmcia.c           |  2 +-
 arch/arm/mach-pxa/trizeps4.c                  |  2 +-
 arch/arm/mach-pxa/trizeps4.h                  |  2 +-
 arch/arm/mach-pxa/xcep.c                      |  2 +-
 arch/arm/mach-pxa/z2.c                        |  2 +-
 arch/arm/mach-pxa/{include/mach => }/z2.h     |  0
 arch/arm/mach-pxa/zeus.c                      |  2 +-
 arch/arm/mach-pxa/zylonite.c                  |  2 +-
 70 files changed, 133 insertions(+), 134 deletions(-)
 rename arch/arm/mach-pxa/{include/mach => }/eseries-gpio.h (100%)
 delete mode 100644 arch/arm/mach-pxa/include/mach/pxa-regs.h
 rename arch/arm/mach-pxa/{include/mach => }/irqs.h (100%)
 rename arch/arm/mach-pxa/{include/mach => }/magician.h (99%)
 rename arch/arm/mach-pxa/{include/mach => }/mfp.h (100%)
 rename arch/arm/mach-pxa/{include/mach => }/pxa2xx-regs.h (100%)
 rename arch/arm/mach-pxa/{include/mach => }/pxa3xx-regs.h (100%)
 rename arch/arm/mach-pxa/{include/mach => }/regs-ost.h (100%)
 rename arch/arm/mach-pxa/{include/mach => }/reset.h (100%)
 rename arch/arm/mach-pxa/{include/mach => }/smemc.h (100%)
 rename arch/arm/mach-pxa/{include/mach => }/tosa.h (100%)
 rename arch/arm/mach-pxa/{include/mach => }/z2.h (100%)

diff --git a/arch/arm/mach-pxa/am300epd.c b/arch/arm/mach-pxa/am300epd.c
index 17d08abeeb17..4b55bc89db8f 100644
--- a/arch/arm/mach-pxa/am300epd.c
+++ b/arch/arm/mach-pxa/am300epd.c
@@ -30,7 +30,7 @@
 
 #include "gumstix.h"
 #include "mfp-pxa25x.h"
-#include <mach/irqs.h>
+#include "irqs.h"
 #include <linux/platform_data/video-pxafb.h>
 
 #include "generic.h"
diff --git a/arch/arm/mach-pxa/balloon3.h b/arch/arm/mach-pxa/balloon3.h
index f351358c0e5b..04f3639c4082 100644
--- a/arch/arm/mach-pxa/balloon3.h
+++ b/arch/arm/mach-pxa/balloon3.h
@@ -11,7 +11,7 @@
 #ifndef ASM_ARCH_BALLOON3_H
 #define ASM_ARCH_BALLOON3_H
 
-#include <mach/irqs.h> /* PXA_NR_BUILTIN_GPIO */
+#include "irqs.h" /* PXA_NR_BUILTIN_GPIO */
 
 enum balloon3_features {
 	BALLOON3_FEATURE_OHCI,
diff --git a/arch/arm/mach-pxa/colibri-pxa3xx.c b/arch/arm/mach-pxa/colibri-pxa3xx.c
index 701dfef930eb..77d6ef5fa42d 100644
--- a/arch/arm/mach-pxa/colibri-pxa3xx.c
+++ b/arch/arm/mach-pxa/colibri-pxa3xx.c
@@ -17,7 +17,7 @@
 #include <asm/system_info.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/irq.h>
-#include <mach/pxa3xx-regs.h>
+#include "pxa3xx-regs.h"
 #include "mfp-pxa300.h"
 #include "colibri.h"
 #include <linux/platform_data/mmc-pxamci.h>
diff --git a/arch/arm/mach-pxa/colibri.h b/arch/arm/mach-pxa/colibri.h
index 85525d49e321..01a46f36cc1f 100644
--- a/arch/arm/mach-pxa/colibri.h
+++ b/arch/arm/mach-pxa/colibri.h
@@ -3,7 +3,7 @@
 #define _COLIBRI_H_
 
 #include <net/ax88796.h>
-#include <mach/mfp.h>
+#include "mfp.h"
 
 /*
  * base board glue for PXA270 module
diff --git a/arch/arm/mach-pxa/corgi.h b/arch/arm/mach-pxa/corgi.h
index fe2fcf6532b9..b565ca7b8cda 100644
--- a/arch/arm/mach-pxa/corgi.h
+++ b/arch/arm/mach-pxa/corgi.h
@@ -9,7 +9,7 @@
 #ifndef __ASM_ARCH_CORGI_H
 #define __ASM_ARCH_CORGI_H  1
 
-#include <mach/irqs.h> /* PXA_NR_BUILTIN_GPIO */
+#include "irqs.h" /* PXA_NR_BUILTIN_GPIO */
 
 /*
  * Corgi (Non Standard) GPIO Definitions
diff --git a/arch/arm/mach-pxa/corgi_pm.c b/arch/arm/mach-pxa/corgi_pm.c
index c6ddfc737644..555a5c1afd96 100644
--- a/arch/arm/mach-pxa/corgi_pm.c
+++ b/arch/arm/mach-pxa/corgi_pm.c
@@ -21,7 +21,7 @@
 #include <asm/mach-types.h>
 
 #include "corgi.h"
-#include <mach/pxa2xx-regs.h>
+#include "pxa2xx-regs.h"
 #include "sharpsl_pm.h"
 
 #include "generic.h"
diff --git a/arch/arm/mach-pxa/csb726.c b/arch/arm/mach-pxa/csb726.c
index 88f2f1d96c7b..410b1af87d55 100644
--- a/arch/arm/mach-pxa/csb726.c
+++ b/arch/arm/mach-pxa/csb726.c
@@ -23,7 +23,7 @@
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/usb-ohci-pxa27x.h>
 #include <linux/platform_data/asoc-pxa.h>
-#include <mach/smemc.h>
+#include "smemc.h"
 
 #include "generic.h"
 #include "devices.h"
diff --git a/arch/arm/mach-pxa/csb726.h b/arch/arm/mach-pxa/csb726.h
index 30d7cf926b84..628928743bd5 100644
--- a/arch/arm/mach-pxa/csb726.h
+++ b/arch/arm/mach-pxa/csb726.h
@@ -7,7 +7,7 @@
 #ifndef CSB726_H
 #define CSB726_H
 
-#include <mach/irqs.h> /* PXA_GPIO_TO_IRQ */
+#include "irqs.h" /* PXA_GPIO_TO_IRQ */
 
 #define CSB726_GPIO_IRQ_LAN	52
 #define CSB726_GPIO_IRQ_SM501	53
diff --git a/arch/arm/mach-pxa/devices.c b/arch/arm/mach-pxa/devices.c
index 12f78636045f..a7b92dd1ca9e 100644
--- a/arch/arm/mach-pxa/devices.c
+++ b/arch/arm/mach-pxa/devices.c
@@ -16,7 +16,7 @@
 #include <linux/platform_data/video-pxafb.h>
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/irda-pxaficp.h>
-#include <mach/irqs.h>
+#include "irqs.h"
 #include <linux/platform_data/usb-ohci-pxa27x.h>
 #include <linux/platform_data/keypad-pxa27x.h>
 #include <linux/platform_data/media/camera-pxa.h>
@@ -24,8 +24,8 @@
 #include <linux/platform_data/mmp_dma.h>
 #include <linux/platform_data/mtd-nand-pxa3xx.h>
 
-#include <mach/regs-ost.h>
-#include <mach/reset.h>
+#include "regs-ost.h"
+#include "reset.h"
 #include "devices.h"
 #include "generic.h"
 
diff --git a/arch/arm/mach-pxa/e740-pcmcia.c b/arch/arm/mach-pxa/e740-pcmcia.c
index 133535d7ac05..11a2c5d42920 100644
--- a/arch/arm/mach-pxa/e740-pcmcia.c
+++ b/arch/arm/mach-pxa/e740-pcmcia.c
@@ -13,7 +13,7 @@
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
 
-#include <mach/eseries-gpio.h>
+#include "eseries-gpio.h"
 
 #include <asm/irq.h>
 #include <asm/mach-types.h>
diff --git a/arch/arm/mach-pxa/include/mach/eseries-gpio.h b/arch/arm/mach-pxa/eseries-gpio.h
similarity index 100%
rename from arch/arm/mach-pxa/include/mach/eseries-gpio.h
rename to arch/arm/mach-pxa/eseries-gpio.h
diff --git a/arch/arm/mach-pxa/eseries.c b/arch/arm/mach-pxa/eseries.c
index 2643a2a72408..c441a299b1ac 100644
--- a/arch/arm/mach-pxa/eseries.c
+++ b/arch/arm/mach-pxa/eseries.c
@@ -33,7 +33,7 @@
 #include <asm/mach-types.h>
 
 #include "pxa25x.h"
-#include <mach/eseries-gpio.h>
+#include "eseries-gpio.h"
 #include "eseries-irq.h"
 #include <linux/platform_data/asoc-pxa.h>
 #include <linux/platform_data/video-pxafb.h>
diff --git a/arch/arm/mach-pxa/generic.c b/arch/arm/mach-pxa/generic.c
index 91ea063dc54d..02fdde7e3e34 100644
--- a/arch/arm/mach-pxa/generic.c
+++ b/arch/arm/mach-pxa/generic.c
@@ -25,10 +25,10 @@
 #include <asm/mach-types.h>
 
 #include "addr-map.h"
-#include <mach/irqs.h>
-#include <mach/reset.h>
-#include <mach/smemc.h>
-#include <mach/pxa3xx-regs.h>
+#include "irqs.h"
+#include "reset.h"
+#include "smemc.h"
+#include "pxa3xx-regs.h"
 
 #include "generic.h"
 #include <clocksource/pxa.h>
diff --git a/arch/arm/mach-pxa/gumstix.h b/arch/arm/mach-pxa/gumstix.h
index 470250cdee16..9005b3c0aabd 100644
--- a/arch/arm/mach-pxa/gumstix.h
+++ b/arch/arm/mach-pxa/gumstix.h
@@ -3,7 +3,7 @@
  *  arch/arm/mach-pxa/include/mach/gumstix.h
  */
 
-#include <mach/irqs.h> /* PXA_GPIO_TO_IRQ */
+#include "irqs.h" /* PXA_GPIO_TO_IRQ */
 
 /* BTRESET - Reset line to Bluetooth module, active low signal. */
 #define GPIO_GUMSTIX_BTRESET          7
diff --git a/arch/arm/mach-pxa/h5000.c b/arch/arm/mach-pxa/h5000.c
index ece1e71c90a9..212efe24aedb 100644
--- a/arch/arm/mach-pxa/h5000.c
+++ b/arch/arm/mach-pxa/h5000.c
@@ -29,7 +29,7 @@
 #include "pxa25x.h"
 #include "h5000.h"
 #include "udc.h"
-#include <mach/smemc.h>
+#include "smemc.h"
 
 #include "generic.h"
 
diff --git a/arch/arm/mach-pxa/hx4700.h b/arch/arm/mach-pxa/hx4700.h
index ce2db33989e1..0c30e6d9c660 100644
--- a/arch/arm/mach-pxa/hx4700.h
+++ b/arch/arm/mach-pxa/hx4700.h
@@ -10,7 +10,7 @@
 
 #include <linux/gpio.h>
 #include <linux/mfd/asic3.h>
-#include <mach/irqs.h> /* PXA_NR_BUILTIN_GPIO */
+#include "irqs.h" /* PXA_NR_BUILTIN_GPIO */
 
 #define HX4700_ASIC3_GPIO_BASE	PXA_NR_BUILTIN_GPIO
 #define HX4700_EGPIO_BASE	(HX4700_ASIC3_GPIO_BASE + ASIC3_NUM_GPIOS)
diff --git a/arch/arm/mach-pxa/idp.h b/arch/arm/mach-pxa/idp.h
index a89e6723b1a1..81b9bd9ba754 100644
--- a/arch/arm/mach-pxa/idp.h
+++ b/arch/arm/mach-pxa/idp.h
@@ -20,7 +20,7 @@
  * IDP hardware.
  */
 
-#include <mach/irqs.h> /* PXA_GPIO_TO_IRQ */
+#include "irqs.h" /* PXA_GPIO_TO_IRQ */
 
 #define IDP_FLASH_PHYS		(PXA_CS0_PHYS)
 #define IDP_ALT_FLASH_PHYS	(PXA_CS1_PHYS)
diff --git a/arch/arm/mach-pxa/include/mach/pxa-regs.h b/arch/arm/mach-pxa/include/mach/pxa-regs.h
deleted file mode 100644
index ba5120c06b8a..000000000000
--- a/arch/arm/mach-pxa/include/mach/pxa-regs.h
+++ /dev/null
@@ -1,52 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- *  Author:	Nicolas Pitre
- *  Created:	Jun 15, 2001
- *  Copyright:	MontaVista Software Inc.
- */
-#ifndef __ASM_MACH_PXA_REGS_H
-#define __ASM_MACH_PXA_REGS_H
-
-/*
- * Workarounds for at least 2 errata so far require this.
- * The mapping is set in mach-pxa/generic.c.
- */
-#define UNCACHED_PHYS_0		0xfe000000
-#define UNCACHED_PHYS_0_SIZE	0x00100000
-
-/*
- * Intel PXA2xx internal register mapping:
- *
- * 0x40000000 - 0x41ffffff <--> 0xf2000000 - 0xf3ffffff
- * 0x44000000 - 0x45ffffff <--> 0xf4000000 - 0xf5ffffff
- * 0x48000000 - 0x49ffffff <--> 0xf6000000 - 0xf7ffffff
- * 0x4c000000 - 0x4dffffff <--> 0xf8000000 - 0xf9ffffff
- * 0x50000000 - 0x51ffffff <--> 0xfa000000 - 0xfbffffff
- * 0x54000000 - 0x55ffffff <--> 0xfc000000 - 0xfdffffff
- * 0x58000000 - 0x59ffffff <--> 0xfe000000 - 0xffffffff
- *
- * Note that not all PXA2xx chips implement all those addresses, and the
- * kernel only maps the minimum needed range of this mapping.
- */
-#define io_v2p(x) (0x3c000000 + ((x) & 0x01ffffff) + (((x) & 0x0e000000) << 1))
-#define io_p2v(x) IOMEM(0xf2000000 + ((x) & 0x01ffffff) + (((x) & 0x1c000000) >> 1))
-
-#ifndef __ASSEMBLY__
-# define __REG(x)	(*((volatile u32 __iomem *)io_p2v(x)))
-
-/* With indexed regs we don't want to feed the index through io_p2v()
-   especially if it is a variable, otherwise horrible code will result. */
-# define __REG2(x,y)	\
-	(*(volatile u32 __iomem*)((u32)&__REG(x) + (y)))
-
-# define __PREG(x)	(io_v2p((u32)&(x)))
-
-#else
-
-# define __REG(x)	io_p2v(x)
-# define __PREG(x)	io_v2p(x)
-
-#endif
-
-
-#endif
diff --git a/arch/arm/mach-pxa/irq.c b/arch/arm/mach-pxa/irq.c
index f25c30e8a834..96f33ef1d9ea 100644
--- a/arch/arm/mach-pxa/irq.c
+++ b/arch/arm/mach-pxa/irq.c
@@ -21,7 +21,7 @@
 
 #include <asm/exception.h>
 
-#include <mach/irqs.h>
+#include "irqs.h"
 
 #include "generic.h"
 #include "pxa-regs.h"
diff --git a/arch/arm/mach-pxa/include/mach/irqs.h b/arch/arm/mach-pxa/irqs.h
similarity index 100%
rename from arch/arm/mach-pxa/include/mach/irqs.h
rename to arch/arm/mach-pxa/irqs.h
diff --git a/arch/arm/mach-pxa/lpd270.c b/arch/arm/mach-pxa/lpd270.c
index e03436710752..0e4123c5fd42 100644
--- a/arch/arm/mach-pxa/lpd270.c
+++ b/arch/arm/mach-pxa/lpd270.c
@@ -44,7 +44,7 @@
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/irda-pxaficp.h>
 #include <linux/platform_data/usb-ohci-pxa27x.h>
-#include <mach/smemc.h>
+#include "smemc.h"
 
 #include "generic.h"
 #include "devices.h"
diff --git a/arch/arm/mach-pxa/lubbock.c b/arch/arm/mach-pxa/lubbock.c
index 201f89f49642..4f0944f3b262 100644
--- a/arch/arm/mach-pxa/lubbock.c
+++ b/arch/arm/mach-pxa/lubbock.c
@@ -52,7 +52,7 @@
 #include <linux/platform_data/video-pxafb.h>
 #include <linux/platform_data/mmc-pxamci.h>
 #include "pm.h"
-#include <mach/smemc.h>
+#include "smemc.h"
 
 #include "generic.h"
 #include "devices.h"
diff --git a/arch/arm/mach-pxa/lubbock.h b/arch/arm/mach-pxa/lubbock.h
index 8e3ff7d57121..55cf91e22ae2 100644
--- a/arch/arm/mach-pxa/lubbock.h
+++ b/arch/arm/mach-pxa/lubbock.h
@@ -5,7 +5,7 @@
  *  Copyright:	MontaVista Software Inc.
  */
 
-#include <mach/irqs.h>
+#include "irqs.h"
 
 #define LUBBOCK_ETH_PHYS	PXA_CS3_PHYS
 
diff --git a/arch/arm/mach-pxa/magician.c b/arch/arm/mach-pxa/magician.c
index 598c977a8ae6..20456a55c4c5 100644
--- a/arch/arm/mach-pxa/magician.c
+++ b/arch/arm/mach-pxa/magician.c
@@ -35,7 +35,7 @@
 
 #include "pxa27x.h"
 #include "addr-map.h"
-#include <mach/magician.h>
+#include "magician.h"
 #include <linux/platform_data/video-pxafb.h>
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/irda-pxaficp.h>
diff --git a/arch/arm/mach-pxa/include/mach/magician.h b/arch/arm/mach-pxa/magician.h
similarity index 99%
rename from arch/arm/mach-pxa/include/mach/magician.h
rename to arch/arm/mach-pxa/magician.h
index 7d3af561af6f..e1e4f9f6b22b 100644
--- a/arch/arm/mach-pxa/include/mach/magician.h
+++ b/arch/arm/mach-pxa/magician.h
@@ -9,7 +9,7 @@
 #define _MAGICIAN_H_
 
 #include <linux/gpio.h>
-#include <mach/irqs.h>
+#include "irqs.h"
 
 /*
  * PXA GPIOs
diff --git a/arch/arm/mach-pxa/mainstone.c b/arch/arm/mach-pxa/mainstone.c
index 599736c93163..fd386f1c414c 100644
--- a/arch/arm/mach-pxa/mainstone.c
+++ b/arch/arm/mach-pxa/mainstone.c
@@ -52,7 +52,7 @@
 #include <linux/platform_data/usb-ohci-pxa27x.h>
 #include <linux/platform_data/keypad-pxa27x.h>
 #include "addr-map.h"
-#include <mach/smemc.h>
+#include "smemc.h"
 
 #include "generic.h"
 #include "devices.h"
diff --git a/arch/arm/mach-pxa/mainstone.h b/arch/arm/mach-pxa/mainstone.h
index ba003742e003..f116c56cf5d9 100644
--- a/arch/arm/mach-pxa/mainstone.h
+++ b/arch/arm/mach-pxa/mainstone.h
@@ -8,7 +8,7 @@
 #ifndef ASM_ARCH_MAINSTONE_H
 #define ASM_ARCH_MAINSTONE_H
 
-#include <mach/irqs.h>
+#include "irqs.h"
 
 #define MST_ETH_PHYS		PXA_CS4_PHYS
 
diff --git a/arch/arm/mach-pxa/mfp-pxa2xx.c b/arch/arm/mach-pxa/mfp-pxa2xx.c
index 6bc7206fd2ac..57b0782880de 100644
--- a/arch/arm/mach-pxa/mfp-pxa2xx.c
+++ b/arch/arm/mach-pxa/mfp-pxa2xx.c
@@ -18,7 +18,7 @@
 #include <linux/syscore_ops.h>
 #include <linux/soc/pxa/cpu.h>
 
-#include <mach/pxa2xx-regs.h>
+#include "pxa2xx-regs.h"
 #include "mfp-pxa2xx.h"
 
 #include "generic.h"
diff --git a/arch/arm/mach-pxa/mfp-pxa3xx.c b/arch/arm/mach-pxa/mfp-pxa3xx.c
index f26b5e5412cf..d16ab7451efe 100644
--- a/arch/arm/mach-pxa/mfp-pxa3xx.c
+++ b/arch/arm/mach-pxa/mfp-pxa3xx.c
@@ -17,7 +17,7 @@
 #include <linux/syscore_ops.h>
 
 #include "mfp-pxa3xx.h"
-#include <mach/pxa3xx-regs.h>
+#include "pxa3xx-regs.h"
 
 #ifdef CONFIG_PM
 /*
diff --git a/arch/arm/mach-pxa/include/mach/mfp.h b/arch/arm/mach-pxa/mfp.h
similarity index 100%
rename from arch/arm/mach-pxa/include/mach/mfp.h
rename to arch/arm/mach-pxa/mfp.h
diff --git a/arch/arm/mach-pxa/mioa701.c b/arch/arm/mach-pxa/mioa701.c
index 907cd7b5f58c..d08f962ffb04 100644
--- a/arch/arm/mach-pxa/mioa701.c
+++ b/arch/arm/mach-pxa/mioa701.c
@@ -42,7 +42,7 @@
 #include "pxa27x-udc.h"
 #include <linux/platform_data/media/camera-pxa.h>
 #include <linux/platform_data/asoc-pxa.h>
-#include <mach/smemc.h>
+#include "smemc.h"
 
 #include "mioa701.h"
 
diff --git a/arch/arm/mach-pxa/palmld.h b/arch/arm/mach-pxa/palmld.h
index ee3bc15b71a2..99a6d8b3a1e3 100644
--- a/arch/arm/mach-pxa/palmld.h
+++ b/arch/arm/mach-pxa/palmld.h
@@ -9,7 +9,7 @@
 #ifndef _INCLUDE_PALMLD_H_
 #define _INCLUDE_PALMLD_H_
 
-#include <mach/irqs.h> /* PXA_GPIO_TO_IRQ */
+#include "irqs.h" /* PXA_GPIO_TO_IRQ */
 
 /** HERE ARE GPIOs **/
 
diff --git a/arch/arm/mach-pxa/palmt5.h b/arch/arm/mach-pxa/palmt5.h
index 1fb1da7c8da3..cf84aedca717 100644
--- a/arch/arm/mach-pxa/palmt5.h
+++ b/arch/arm/mach-pxa/palmt5.h
@@ -11,7 +11,7 @@
 #ifndef _INCLUDE_PALMT5_H_
 #define _INCLUDE_PALMT5_H_
 
-#include <mach/irqs.h> /* PXA_GPIO_TO_IRQ */
+#include "irqs.h" /* PXA_GPIO_TO_IRQ */
 
 /** HERE ARE GPIOs **/
 
diff --git a/arch/arm/mach-pxa/palmtc.h b/arch/arm/mach-pxa/palmtc.h
index afec057c2857..9257a02c46e5 100644
--- a/arch/arm/mach-pxa/palmtc.h
+++ b/arch/arm/mach-pxa/palmtc.h
@@ -12,7 +12,7 @@
 #ifndef _INCLUDE_PALMTC_H_
 #define _INCLUDE_PALMTC_H_
 
-#include <mach/irqs.h> /* PXA_GPIO_TO_IRQ */
+#include "irqs.h" /* PXA_GPIO_TO_IRQ */
 
 /** HERE ARE GPIOs **/
 
diff --git a/arch/arm/mach-pxa/palmtreo.c b/arch/arm/mach-pxa/palmtreo.c
index d6d5b90d9578..238a31f32cba 100644
--- a/arch/arm/mach-pxa/palmtreo.c
+++ b/arch/arm/mach-pxa/palmtreo.c
@@ -37,7 +37,7 @@
 #include <linux/platform_data/keypad-pxa27x.h>
 #include "udc.h"
 #include <linux/platform_data/usb-ohci-pxa27x.h>
-#include <mach/pxa2xx-regs.h>
+#include "pxa2xx-regs.h"
 #include <linux/platform_data/asoc-palm27x.h>
 #include <linux/platform_data/media/camera-pxa.h>
 #include "palm27x.h"
diff --git a/arch/arm/mach-pxa/palmtx.h b/arch/arm/mach-pxa/palmtx.h
index a2bb993952d9..ec88abf0fc6c 100644
--- a/arch/arm/mach-pxa/palmtx.h
+++ b/arch/arm/mach-pxa/palmtx.h
@@ -12,7 +12,7 @@
 #ifndef _INCLUDE_PALMTX_H_
 #define _INCLUDE_PALMTX_H_
 
-#include <mach/irqs.h> /* PXA_GPIO_TO_IRQ */
+#include "irqs.h" /* PXA_GPIO_TO_IRQ */
 
 /** HERE ARE GPIOs **/
 
diff --git a/arch/arm/mach-pxa/pcm027.h b/arch/arm/mach-pxa/pcm027.h
index 0c4ab636ce4e..58ade4ad6ba3 100644
--- a/arch/arm/mach-pxa/pcm027.h
+++ b/arch/arm/mach-pxa/pcm027.h
@@ -10,7 +10,7 @@
  * Definitions of CPU card resources only
  */
 
-#include <mach/irqs.h> /* PXA_GPIO_TO_IRQ */
+#include "irqs.h" /* PXA_GPIO_TO_IRQ */
 
 /* phyCORE-PXA270 (PCM027) Interrupts */
 #define PCM027_IRQ(x)          (IRQ_BOARD_START + (x))
diff --git a/arch/arm/mach-pxa/pcm990_baseboard.h b/arch/arm/mach-pxa/pcm990_baseboard.h
index 5be11d1b7019..18cf71decb03 100644
--- a/arch/arm/mach-pxa/pcm990_baseboard.h
+++ b/arch/arm/mach-pxa/pcm990_baseboard.h
@@ -7,7 +7,7 @@
  */
 
 #include "pcm027.h"
-#include <mach/irqs.h> /* PXA_GPIO_TO_IRQ */
+#include "irqs.h" /* PXA_GPIO_TO_IRQ */
 
 /*
  * definitions relevant only when the PCM-990
diff --git a/arch/arm/mach-pxa/poodle.h b/arch/arm/mach-pxa/poodle.h
index e675a3d1aa18..00798b44f204 100644
--- a/arch/arm/mach-pxa/poodle.h
+++ b/arch/arm/mach-pxa/poodle.h
@@ -15,7 +15,7 @@
 #ifndef __ASM_ARCH_POODLE_H
 #define __ASM_ARCH_POODLE_H  1
 
-#include <mach/irqs.h> /* PXA_GPIO_TO_IRQ */
+#include "irqs.h" /* PXA_GPIO_TO_IRQ */
 
 /*
  * GPIOs
diff --git a/arch/arm/mach-pxa/pxa-dt.c b/arch/arm/mach-pxa/pxa-dt.c
index d32d5c8e966f..5e5d543fdf46 100644
--- a/arch/arm/mach-pxa/pxa-dt.c
+++ b/arch/arm/mach-pxa/pxa-dt.c
@@ -11,7 +11,7 @@
 #include <linux/of_platform.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/time.h>
-#include <mach/irqs.h>
+#include "irqs.h"
 
 #include "generic.h"
 
diff --git a/arch/arm/mach-pxa/pxa-regs.h b/arch/arm/mach-pxa/pxa-regs.h
index 584d2ac592cc..ba5120c06b8a 100644
--- a/arch/arm/mach-pxa/pxa-regs.h
+++ b/arch/arm/mach-pxa/pxa-regs.h
@@ -1 +1,52 @@
-#include <mach/pxa-regs.h>
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *  Author:	Nicolas Pitre
+ *  Created:	Jun 15, 2001
+ *  Copyright:	MontaVista Software Inc.
+ */
+#ifndef __ASM_MACH_PXA_REGS_H
+#define __ASM_MACH_PXA_REGS_H
+
+/*
+ * Workarounds for at least 2 errata so far require this.
+ * The mapping is set in mach-pxa/generic.c.
+ */
+#define UNCACHED_PHYS_0		0xfe000000
+#define UNCACHED_PHYS_0_SIZE	0x00100000
+
+/*
+ * Intel PXA2xx internal register mapping:
+ *
+ * 0x40000000 - 0x41ffffff <--> 0xf2000000 - 0xf3ffffff
+ * 0x44000000 - 0x45ffffff <--> 0xf4000000 - 0xf5ffffff
+ * 0x48000000 - 0x49ffffff <--> 0xf6000000 - 0xf7ffffff
+ * 0x4c000000 - 0x4dffffff <--> 0xf8000000 - 0xf9ffffff
+ * 0x50000000 - 0x51ffffff <--> 0xfa000000 - 0xfbffffff
+ * 0x54000000 - 0x55ffffff <--> 0xfc000000 - 0xfdffffff
+ * 0x58000000 - 0x59ffffff <--> 0xfe000000 - 0xffffffff
+ *
+ * Note that not all PXA2xx chips implement all those addresses, and the
+ * kernel only maps the minimum needed range of this mapping.
+ */
+#define io_v2p(x) (0x3c000000 + ((x) & 0x01ffffff) + (((x) & 0x0e000000) << 1))
+#define io_p2v(x) IOMEM(0xf2000000 + ((x) & 0x01ffffff) + (((x) & 0x1c000000) >> 1))
+
+#ifndef __ASSEMBLY__
+# define __REG(x)	(*((volatile u32 __iomem *)io_p2v(x)))
+
+/* With indexed regs we don't want to feed the index through io_p2v()
+   especially if it is a variable, otherwise horrible code will result. */
+# define __REG2(x,y)	\
+	(*(volatile u32 __iomem*)((u32)&__REG(x) + (y)))
+
+# define __PREG(x)	(io_v2p((u32)&(x)))
+
+#else
+
+# define __REG(x)	io_p2v(x)
+# define __PREG(x)	io_v2p(x)
+
+#endif
+
+
+#endif
diff --git a/arch/arm/mach-pxa/pxa25x.c b/arch/arm/mach-pxa/pxa25x.c
index 8d21c7eef1d2..6b34d7c169ea 100644
--- a/arch/arm/mach-pxa/pxa25x.c
+++ b/arch/arm/mach-pxa/pxa25x.c
@@ -30,12 +30,12 @@
 
 #include <asm/mach/map.h>
 #include <asm/suspend.h>
-#include <mach/irqs.h>
+#include "irqs.h"
 #include "pxa25x.h"
-#include <mach/reset.h>
+#include "reset.h"
 #include "pm.h"
 #include "addr-map.h"
-#include <mach/smemc.h>
+#include "smemc.h"
 
 #include "generic.h"
 #include "devices.h"
diff --git a/arch/arm/mach-pxa/pxa25x.h b/arch/arm/mach-pxa/pxa25x.h
index 4699ebf7b486..eaaa87666324 100644
--- a/arch/arm/mach-pxa/pxa25x.h
+++ b/arch/arm/mach-pxa/pxa25x.h
@@ -3,8 +3,8 @@
 #define __MACH_PXA25x_H
 
 #include "addr-map.h"
-#include <mach/pxa2xx-regs.h>
+#include "pxa2xx-regs.h"
 #include "mfp-pxa25x.h"
-#include <mach/irqs.h>
+#include "irqs.h"
 
 #endif /* __MACH_PXA25x_H */
diff --git a/arch/arm/mach-pxa/pxa27x.c b/arch/arm/mach-pxa/pxa27x.c
index c36a9784fab8..afbf6ace954f 100644
--- a/arch/arm/mach-pxa/pxa27x.c
+++ b/arch/arm/mach-pxa/pxa27x.c
@@ -28,13 +28,13 @@
 #include <asm/mach/map.h>
 #include <asm/irq.h>
 #include <asm/suspend.h>
-#include <mach/irqs.h>
+#include "irqs.h"
 #include "pxa27x.h"
-#include <mach/reset.h>
+#include "reset.h"
 #include <linux/platform_data/usb-ohci-pxa27x.h>
 #include "pm.h"
 #include "addr-map.h"
-#include <mach/smemc.h>
+#include "smemc.h"
 
 #include "generic.h"
 #include "devices.h"
diff --git a/arch/arm/mach-pxa/pxa27x.h b/arch/arm/mach-pxa/pxa27x.h
index bf2755561fe5..ede96f3f7214 100644
--- a/arch/arm/mach-pxa/pxa27x.h
+++ b/arch/arm/mach-pxa/pxa27x.h
@@ -4,9 +4,9 @@
 
 #include <linux/suspend.h>
 #include "addr-map.h"
-#include <mach/pxa2xx-regs.h>
+#include "pxa2xx-regs.h"
 #include "mfp-pxa27x.h"
-#include <mach/irqs.h>
+#include "irqs.h"
 
 #define ARB_CNTRL	__REG(0x48000048)  /* Arbiter Control Register */
 
diff --git a/arch/arm/mach-pxa/include/mach/pxa2xx-regs.h b/arch/arm/mach-pxa/pxa2xx-regs.h
similarity index 100%
rename from arch/arm/mach-pxa/include/mach/pxa2xx-regs.h
rename to arch/arm/mach-pxa/pxa2xx-regs.h
diff --git a/arch/arm/mach-pxa/pxa2xx.c b/arch/arm/mach-pxa/pxa2xx.c
index f583759ac00d..84712a688e5c 100644
--- a/arch/arm/mach-pxa/pxa2xx.c
+++ b/arch/arm/mach-pxa/pxa2xx.c
@@ -12,10 +12,10 @@
 #include <linux/device.h>
 #include <linux/io.h>
 
-#include <mach/pxa2xx-regs.h>
+#include "pxa2xx-regs.h"
 #include "mfp-pxa25x.h"
-#include <mach/reset.h>
-#include <mach/smemc.h>
+#include "reset.h"
+#include "smemc.h"
 #include <linux/platform_data/irda-pxaficp.h>
 
 void pxa2xx_clear_reset_status(unsigned int mask)
diff --git a/arch/arm/mach-pxa/include/mach/pxa3xx-regs.h b/arch/arm/mach-pxa/pxa3xx-regs.h
similarity index 100%
rename from arch/arm/mach-pxa/include/mach/pxa3xx-regs.h
rename to arch/arm/mach-pxa/pxa3xx-regs.h
diff --git a/arch/arm/mach-pxa/pxa3xx.c b/arch/arm/mach-pxa/pxa3xx.c
index d486efb79dcd..979642aa7ffe 100644
--- a/arch/arm/mach-pxa/pxa3xx.c
+++ b/arch/arm/mach-pxa/pxa3xx.c
@@ -29,13 +29,13 @@
 
 #include <asm/mach/map.h>
 #include <asm/suspend.h>
-#include <mach/pxa3xx-regs.h>
-#include <mach/reset.h>
+#include "pxa3xx-regs.h"
+#include "reset.h"
 #include <linux/platform_data/usb-ohci-pxa27x.h>
 #include "pm.h"
 #include "addr-map.h"
-#include <mach/smemc.h>
-#include <mach/irqs.h>
+#include "smemc.h"
+#include "irqs.h"
 
 #include "generic.h"
 #include "devices.h"
diff --git a/arch/arm/mach-pxa/pxa3xx.h b/arch/arm/mach-pxa/pxa3xx.h
index 6b424d328680..81825f7ad258 100644
--- a/arch/arm/mach-pxa/pxa3xx.h
+++ b/arch/arm/mach-pxa/pxa3xx.h
@@ -3,7 +3,7 @@
 #define __MACH_PXA3XX_H
 
 #include "addr-map.h"
-#include <mach/pxa3xx-regs.h>
-#include <mach/irqs.h>
+#include "pxa3xx-regs.h"
+#include "irqs.h"
 
 #endif /* __MACH_PXA3XX_H */
diff --git a/arch/arm/mach-pxa/include/mach/regs-ost.h b/arch/arm/mach-pxa/regs-ost.h
similarity index 100%
rename from arch/arm/mach-pxa/include/mach/regs-ost.h
rename to arch/arm/mach-pxa/regs-ost.h
diff --git a/arch/arm/mach-pxa/reset.c b/arch/arm/mach-pxa/reset.c
index fcb791c5ae3e..f0be90573ad3 100644
--- a/arch/arm/mach-pxa/reset.c
+++ b/arch/arm/mach-pxa/reset.c
@@ -7,9 +7,9 @@
 #include <asm/proc-fns.h>
 #include <asm/system_misc.h>
 
-#include <mach/regs-ost.h>
-#include <mach/reset.h>
-#include <mach/smemc.h>
+#include "regs-ost.h"
+#include "reset.h"
+#include "smemc.h"
 
 static void do_hw_reset(void);
 
diff --git a/arch/arm/mach-pxa/include/mach/reset.h b/arch/arm/mach-pxa/reset.h
similarity index 100%
rename from arch/arm/mach-pxa/include/mach/reset.h
rename to arch/arm/mach-pxa/reset.h
diff --git a/arch/arm/mach-pxa/sharpsl_pm.c b/arch/arm/mach-pxa/sharpsl_pm.c
index 83cfbb882a2d..a829baf8d922 100644
--- a/arch/arm/mach-pxa/sharpsl_pm.c
+++ b/arch/arm/mach-pxa/sharpsl_pm.c
@@ -24,7 +24,7 @@
 
 #include <asm/mach-types.h>
 #include "pm.h"
-#include <mach/pxa2xx-regs.h>
+#include "pxa2xx-regs.h"
 #include "regs-rtc.h"
 #include "sharpsl_pm.h"
 
diff --git a/arch/arm/mach-pxa/sleep.S b/arch/arm/mach-pxa/sleep.S
index ab50fe2cf923..d58cf52e3848 100644
--- a/arch/arm/mach-pxa/sleep.S
+++ b/arch/arm/mach-pxa/sleep.S
@@ -13,8 +13,8 @@
 
 #include <linux/linkage.h>
 #include <asm/assembler.h>
-#include <mach/smemc.h>
-#include <mach/pxa2xx-regs.h>
+#include "smemc.h"
+#include "pxa2xx-regs.h"
 
 #define MDREFR_KDIV	0x200a4000	// all banks
 #define CCCR_SLEEP	0x00000107	// L=7 2N=2 A=0 PPDIS=0 CPDIS=0
diff --git a/arch/arm/mach-pxa/smemc.c b/arch/arm/mach-pxa/smemc.c
index da0eeafdb5a0..3ea8daf1a7f1 100644
--- a/arch/arm/mach-pxa/smemc.c
+++ b/arch/arm/mach-pxa/smemc.c
@@ -10,7 +10,7 @@
 #include <linux/syscore_ops.h>
 #include <linux/soc/pxa/cpu.h>
 
-#include <mach/smemc.h>
+#include "smemc.h"
 
 #ifdef CONFIG_PM
 static unsigned long msc[2];
diff --git a/arch/arm/mach-pxa/include/mach/smemc.h b/arch/arm/mach-pxa/smemc.h
similarity index 100%
rename from arch/arm/mach-pxa/include/mach/smemc.h
rename to arch/arm/mach-pxa/smemc.h
diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index cd8f00945373..dd88953adc9d 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -39,14 +39,14 @@
 
 #include "pxa27x.h"
 #include "pxa27x-udc.h"
-#include <mach/reset.h>
+#include "reset.h"
 #include <linux/platform_data/irda-pxaficp.h>
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/usb-ohci-pxa27x.h>
 #include <linux/platform_data/video-pxafb.h>
 #include "spitz.h"
 #include "sharpsl_pm.h"
-#include <mach/smemc.h>
+#include "smemc.h"
 
 #include "generic.h"
 #include "devices.h"
diff --git a/arch/arm/mach-pxa/spitz.h b/arch/arm/mach-pxa/spitz.h
index f97e3ebd762d..04828d8918aa 100644
--- a/arch/arm/mach-pxa/spitz.h
+++ b/arch/arm/mach-pxa/spitz.h
@@ -11,7 +11,7 @@
 #define __ASM_ARCH_SPITZ_H  1
 #endif
 
-#include <mach/irqs.h> /* PXA_NR_BUILTIN_GPIO, PXA_GPIO_TO_IRQ */
+#include "irqs.h" /* PXA_NR_BUILTIN_GPIO, PXA_GPIO_TO_IRQ */
 #include <linux/fb.h>
 
 /* Spitz/Akita GPIOs */
diff --git a/arch/arm/mach-pxa/standby.S b/arch/arm/mach-pxa/standby.S
index 626fecdefb1c..938310b708a0 100644
--- a/arch/arm/mach-pxa/standby.S
+++ b/arch/arm/mach-pxa/standby.S
@@ -12,7 +12,7 @@
 #include <linux/linkage.h>
 #include <asm/assembler.h>
 
-#include <mach/pxa2xx-regs.h>
+#include "pxa2xx-regs.h"
 
 		.text
 
diff --git a/arch/arm/mach-pxa/tosa.c b/arch/arm/mach-pxa/tosa.c
index 19fe79518aaf..62626cc2a2c5 100644
--- a/arch/arm/mach-pxa/tosa.c
+++ b/arch/arm/mach-pxa/tosa.c
@@ -40,16 +40,16 @@
 #include <asm/mach-types.h>
 
 #include "pxa25x.h"
-#include <mach/reset.h>
+#include "reset.h"
 #include <linux/platform_data/irda-pxaficp.h>
 #include <linux/platform_data/mmc-pxamci.h>
 #include "udc.h"
 #include "tosa_bt.h"
 #include <linux/platform_data/asoc-pxa.h>
-#include <mach/smemc.h>
+#include "smemc.h"
 
 #include <asm/mach/arch.h>
-#include <mach/tosa.h>
+#include "tosa.h"
 
 #include <asm/hardware/scoop.h>
 #include <asm/mach/sharpsl_param.h>
diff --git a/arch/arm/mach-pxa/include/mach/tosa.h b/arch/arm/mach-pxa/tosa.h
similarity index 100%
rename from arch/arm/mach-pxa/include/mach/tosa.h
rename to arch/arm/mach-pxa/tosa.h
diff --git a/arch/arm/mach-pxa/trizeps4-pcmcia.c b/arch/arm/mach-pxa/trizeps4-pcmcia.c
index 02d7bb0c538f..25e363770565 100644
--- a/arch/arm/mach-pxa/trizeps4-pcmcia.c
+++ b/arch/arm/mach-pxa/trizeps4-pcmcia.c
@@ -19,7 +19,7 @@
 #include <asm/mach-types.h>
 #include <asm/irq.h>
 
-#include <mach/pxa2xx-regs.h>
+#include "pxa2xx-regs.h"
 #include "trizeps4.h"
 
 #include <pcmcia/soc_common.h>
diff --git a/arch/arm/mach-pxa/trizeps4.c b/arch/arm/mach-pxa/trizeps4.c
index fadfbb40cd6c..716cce885379 100644
--- a/arch/arm/mach-pxa/trizeps4.c
+++ b/arch/arm/mach-pxa/trizeps4.c
@@ -46,7 +46,7 @@
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/irda-pxaficp.h>
 #include <linux/platform_data/usb-ohci-pxa27x.h>
-#include <mach/smemc.h>
+#include "smemc.h"
 
 #include "generic.h"
 #include "devices.h"
diff --git a/arch/arm/mach-pxa/trizeps4.h b/arch/arm/mach-pxa/trizeps4.h
index e0f37c0ff06f..b6c19d155ef9 100644
--- a/arch/arm/mach-pxa/trizeps4.h
+++ b/arch/arm/mach-pxa/trizeps4.h
@@ -12,7 +12,7 @@
 #define _TRIPEPS4_H_
 
 #include "addr-map.h"
-#include <mach/irqs.h> /* PXA_GPIO_TO_IRQ */
+#include "irqs.h" /* PXA_GPIO_TO_IRQ */
 
 /* physical memory regions */
 #define TRIZEPS4_FLASH_PHYS	(PXA_CS0_PHYS)  /* Flash region */
diff --git a/arch/arm/mach-pxa/xcep.c b/arch/arm/mach-pxa/xcep.c
index 7389e0199144..6bb02b65fb82 100644
--- a/arch/arm/mach-pxa/xcep.c
+++ b/arch/arm/mach-pxa/xcep.c
@@ -26,7 +26,7 @@
 
 #include "pxa25x.h"
 #include "addr-map.h"
-#include <mach/smemc.h>
+#include "smemc.h"
 
 #include "generic.h"
 #include "devices.h"
diff --git a/arch/arm/mach-pxa/z2.c b/arch/arm/mach-pxa/z2.c
index bb854e903c8f..d03520555497 100644
--- a/arch/arm/mach-pxa/z2.c
+++ b/arch/arm/mach-pxa/z2.c
@@ -34,7 +34,7 @@
 
 #include "pxa27x.h"
 #include "mfp-pxa27x.h"
-#include <mach/z2.h>
+#include "z2.h"
 #include <linux/platform_data/video-pxafb.h>
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/keypad-pxa27x.h>
diff --git a/arch/arm/mach-pxa/include/mach/z2.h b/arch/arm/mach-pxa/z2.h
similarity index 100%
rename from arch/arm/mach-pxa/include/mach/z2.h
rename to arch/arm/mach-pxa/z2.h
diff --git a/arch/arm/mach-pxa/zeus.c b/arch/arm/mach-pxa/zeus.c
index 2e6c8d156d77..1fdef9426784 100644
--- a/arch/arm/mach-pxa/zeus.c
+++ b/arch/arm/mach-pxa/zeus.c
@@ -49,7 +49,7 @@
 #include <linux/platform_data/asoc-pxa.h>
 #include "viper-pcmcia.h"
 #include "zeus.h"
-#include <mach/smemc.h>
+#include "smemc.h"
 
 #include "generic.h"
 
diff --git a/arch/arm/mach-pxa/zylonite.c b/arch/arm/mach-pxa/zylonite.c
index ba6dc86da855..8ed75ac29b1a 100644
--- a/arch/arm/mach-pxa/zylonite.c
+++ b/arch/arm/mach-pxa/zylonite.c
@@ -32,7 +32,7 @@
 #include <linux/platform_data/usb-ohci-pxa27x.h>
 #include <linux/platform_data/keypad-pxa27x.h>
 #include <linux/platform_data/mtd-nand-pxa3xx.h>
-#include <mach/mfp.h>
+#include "mfp.h"
 
 #include "devices.h"
 #include "generic.h"
-- 
2.29.2

