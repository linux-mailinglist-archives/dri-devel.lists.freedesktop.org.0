Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1BC50735D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:39:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 255B810EF40;
	Tue, 19 Apr 2022 16:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191CD10EF40
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:39:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 75C2561490;
 Tue, 19 Apr 2022 16:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4081AC385A9;
 Tue, 19 Apr 2022 16:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386370;
 bh=J30lO8WqfsuperM5j+fzkpEnzMSTWOmcXnI9/Yhhprk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dHlt8YN7/s/0S1GyZwhEjFNdjs8+2t0nHc0YzyChuyN8vtnJ2Sd/yezar8p/GjaWS
 5g2IiCAv8TBR47KabHMttv0LxyZ/Mjp1h8LpeXXhsIzAKZ4UnXnm6n22N8xd7ct5MM
 flIBzdSS9g5FYmBko0KsV/eDAWdaEITk/3xBDruGAjzAVMQiuQySGyXcMPlkjTqnma
 MSLFq6N8Tb4gpmhv8Vqb74jbAtTV0+5k9pr0cQONvhdBj/PbiG9dwv2MMAgeiTlvpD
 Fs1YDhkpGhoEeSbwqtjUyVUnyTG7ZoQazBrn8R1+78HgzXFcMkU1ozP8f5kSHYpA9p
 EgvSgcxNNXdHw==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/48] ARM: pxa: split up mach/hardware.h
Date: Tue, 19 Apr 2022 18:37:27 +0200
Message-Id: <20220419163810.2118169-6-arnd@kernel.org>
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
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 Tomas Cech <sleep_walker@suse.com>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Marek Vasut <marek.vasut@gmail.com>,
 Paul Parsons <lost.distance@yahoo.com>, Sergey Lapin <slapin@ossfans.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, linux-input@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alsa-devel@alsa-project.org,
 Daniel Mack <daniel@zonque.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The mach/hardware.h is included in lots of places, and it provides
three different things on pxa:

- the cpu_is_pxa* macros
- an indirect inclusion of mach/addr-map.h
- the __REG() and io_pv2() helper macros

Split it up into separate <linux/soc/pxa/cpu.h> and mach/pxa-regs.h
headers, then change all the files that use mach/hardware.h to
include the exact set of those three headers that they actually
need, allowing for further more targeted cleanup.

linux/soc/pxa/cpu.h can remain permanently exported and is now in
a global location along with similar headers. pxa-regs.h and
addr-map.h are only used in a very small number of drivers now
and can be moved to arch/arm/mach-pxa/ directly when those drivers
are to pass the necessary data as resources.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Acked-by: Mark Brown <broonie@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-leds@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
Cc: linux-rtc@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Cc: linux-watchdog@vger.kernel.org
Cc: alsa-devel@alsa-project.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/common/locomo.c                      |  1 -
 arch/arm/common/sa1111.c                      |  5 +-
 arch/arm/mach-pxa/cm-x300.c                   |  2 +
 arch/arm/mach-pxa/colibri-evalboard.c         |  1 -
 arch/arm/mach-pxa/colibri-pxa270-income.c     |  1 -
 arch/arm/mach-pxa/colibri-pxa300.c            |  1 +
 arch/arm/mach-pxa/colibri-pxa3xx.c            |  1 -
 arch/arm/mach-pxa/corgi.c                     |  1 -
 arch/arm/mach-pxa/corgi_pm.c                  |  1 -
 arch/arm/mach-pxa/csb726.c                    |  1 +
 arch/arm/mach-pxa/devices.c                   |  2 +-
 arch/arm/mach-pxa/ezx.c                       |  1 -
 arch/arm/mach-pxa/generic.c                   |  3 +-
 arch/arm/mach-pxa/gumstix.c                   |  1 -
 arch/arm/mach-pxa/hx4700.c                    |  2 +-
 arch/arm/mach-pxa/idp.c                       |  1 -
 arch/arm/mach-pxa/include/mach/pxa-regs.h     | 52 ++++++++++++++++
 arch/arm/mach-pxa/include/mach/pxa2xx-regs.h  |  2 +-
 arch/arm/mach-pxa/include/mach/pxa3xx-regs.h  |  2 +-
 arch/arm/mach-pxa/include/mach/regs-ac97.h    |  2 +-
 arch/arm/mach-pxa/include/mach/regs-ost.h     |  2 +-
 arch/arm/mach-pxa/include/mach/trizeps4.h     |  1 +
 arch/arm/mach-pxa/irq.c                       |  3 +-
 arch/arm/mach-pxa/littleton.c                 |  1 -
 arch/arm/mach-pxa/lpd270.c                    |  2 +-
 arch/arm/mach-pxa/lubbock.c                   |  1 -
 arch/arm/mach-pxa/magician.c                  |  2 +-
 arch/arm/mach-pxa/mainstone.c                 |  2 +-
 arch/arm/mach-pxa/mfp-pxa2xx.c                |  1 +
 arch/arm/mach-pxa/mfp-pxa3xx.c                |  1 -
 arch/arm/mach-pxa/poodle.c                    |  1 -
 arch/arm/mach-pxa/pxa-regs.h                  |  1 +
 arch/arm/mach-pxa/pxa25x.c                    |  3 +-
 arch/arm/mach-pxa/pxa25x.h                    |  2 +-
 arch/arm/mach-pxa/pxa27x-udc.h                |  2 +
 arch/arm/mach-pxa/pxa27x.c                    |  3 +-
 arch/arm/mach-pxa/pxa27x.h                    |  2 +-
 arch/arm/mach-pxa/pxa2xx.c                    |  1 -
 arch/arm/mach-pxa/pxa300.c                    |  1 +
 arch/arm/mach-pxa/pxa320.c                    |  1 +
 arch/arm/mach-pxa/pxa3xx-ulpi.c               |  2 +-
 arch/arm/mach-pxa/pxa3xx.c                    |  3 +-
 arch/arm/mach-pxa/pxa3xx.h                    |  2 +-
 arch/arm/mach-pxa/pxa930.c                    |  1 +
 arch/arm/mach-pxa/regs-rtc.h                  |  2 +-
 arch/arm/mach-pxa/regs-uart.h                 |  2 +
 arch/arm/mach-pxa/sleep.S                     |  1 -
 arch/arm/mach-pxa/smemc.c                     |  2 +-
 arch/arm/mach-pxa/spitz_pm.c                  |  1 -
 arch/arm/mach-pxa/standby.S                   |  1 -
 arch/arm/mach-pxa/xcep.c                      |  2 +-
 arch/arm/mach-pxa/zylonite.c                  |  1 +
 arch/arm/mach-pxa/zylonite.h                  |  2 +
 arch/arm/mach-pxa/zylonite_pxa300.c           |  1 +
 arch/arm/mach-pxa/zylonite_pxa320.c           |  1 +
 drivers/clk/pxa/clk-pxa3xx.c                  |  1 +
 drivers/cpufreq/pxa2xx-cpufreq.c              |  1 +
 drivers/cpufreq/pxa3xx-cpufreq.c              |  1 +
 drivers/input/mouse/pxa930_trkball.c          |  1 -
 drivers/input/touchscreen/zylonite-wm97xx.c   |  2 +-
 drivers/leds/leds-locomo.c                    |  1 -
 drivers/mmc/host/pxamci.c                     |  2 +-
 drivers/mtd/maps/pxa2xx-flash.c               |  2 -
 drivers/pcmcia/pxa2xx_base.c                  |  2 +-
 drivers/pcmcia/pxa2xx_sharpsl.c               |  1 -
 drivers/pcmcia/sa1111_generic.c               |  1 -
 drivers/pcmcia/sa1111_lubbock.c               |  1 -
 drivers/pcmcia/soc_common.c                   |  2 -
 drivers/rtc/rtc-pxa.c                         |  2 -
 drivers/usb/host/ohci-pxa27x.c                |  3 +-
 drivers/video/fbdev/pxafb.c                   |  2 +-
 drivers/watchdog/sa1100_wdt.c                 |  1 -
 .../hardware.h => include/linux/soc/pxa/cpu.h | 61 ++-----------------
 sound/arm/pxa2xx-ac97-lib.c                   |  1 +
 sound/soc/pxa/pxa2xx-ac97.c                   |  2 +-
 sound/soc/pxa/pxa2xx-i2s.c                    |  2 +-
 sound/soc/pxa/z2.c                            |  1 -
 77 files changed, 116 insertions(+), 117 deletions(-)
 create mode 100644 arch/arm/mach-pxa/include/mach/pxa-regs.h
 create mode 100644 arch/arm/mach-pxa/pxa-regs.h
 rename arch/arm/mach-pxa/include/mach/hardware.h => include/linux/soc/pxa/cpu.h (75%)

diff --git a/arch/arm/common/locomo.c b/arch/arm/common/locomo.c
index 24d21ba63030..da30a4d4f35c 100644
--- a/arch/arm/common/locomo.c
+++ b/arch/arm/common/locomo.c
@@ -23,7 +23,6 @@
 #include <linux/spinlock.h>
 #include <linux/io.h>
 
-#include <mach/hardware.h>
 #include <asm/irq.h>
 #include <asm/mach/irq.h>
 
diff --git a/arch/arm/common/sa1111.c b/arch/arm/common/sa1111.c
index 5367f03beb46..2343e2b6214d 100644
--- a/arch/arm/common/sa1111.c
+++ b/arch/arm/common/sa1111.c
@@ -26,13 +26,16 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 
-#include <mach/hardware.h>
 #include <asm/mach/irq.h>
 #include <asm/mach-types.h>
 #include <linux/sizes.h>
 
 #include <asm/hardware/sa1111.h>
 
+#ifdef CONFIG_ARCH_SA1100
+#include <mach/hardware.h>
+#endif
+
 /* SA1111 IRQs */
 #define IRQ_GPAIN0		(0)
 #define IRQ_GPAIN1		(1)
diff --git a/arch/arm/mach-pxa/cm-x300.c b/arch/arm/mach-pxa/cm-x300.c
index 2e35354b61f5..85e2537fdc15 100644
--- a/arch/arm/mach-pxa/cm-x300.c
+++ b/arch/arm/mach-pxa/cm-x300.c
@@ -40,6 +40,8 @@
 #include <linux/spi/spi_gpio.h>
 #include <linux/spi/tdo24m.h>
 
+#include <linux/soc/pxa/cpu.h>
+
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include <asm/setup.h>
diff --git a/arch/arm/mach-pxa/colibri-evalboard.c b/arch/arm/mach-pxa/colibri-evalboard.c
index b9c173ede891..b62af07b8f96 100644
--- a/arch/arm/mach-pxa/colibri-evalboard.c
+++ b/arch/arm/mach-pxa/colibri-evalboard.c
@@ -13,7 +13,6 @@
 #include <linux/interrupt.h>
 #include <linux/gpio/machine.h>
 #include <asm/mach-types.h>
-#include <mach/hardware.h>
 #include <asm/mach/arch.h>
 #include <linux/i2c.h>
 #include <linux/platform_data/i2c-pxa.h>
diff --git a/arch/arm/mach-pxa/colibri-pxa270-income.c b/arch/arm/mach-pxa/colibri-pxa270-income.c
index e5879e8b0682..f6eaf464ca83 100644
--- a/arch/arm/mach-pxa/colibri-pxa270-income.c
+++ b/arch/arm/mach-pxa/colibri-pxa270-income.c
@@ -25,7 +25,6 @@
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
-#include <mach/hardware.h>
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/usb-ohci-pxa27x.h>
 #include "pxa27x.h"
diff --git a/arch/arm/mach-pxa/colibri-pxa300.c b/arch/arm/mach-pxa/colibri-pxa300.c
index 82052dfd96b6..4ceeea142bfd 100644
--- a/arch/arm/mach-pxa/colibri-pxa300.c
+++ b/arch/arm/mach-pxa/colibri-pxa300.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/gpio.h>
 #include <linux/interrupt.h>
+#include <linux/soc/pxa/cpu.h>
 
 #include <asm/mach-types.h>
 #include <linux/sizes.h>
diff --git a/arch/arm/mach-pxa/colibri-pxa3xx.c b/arch/arm/mach-pxa/colibri-pxa3xx.c
index 3cead80a2b37..701dfef930eb 100644
--- a/arch/arm/mach-pxa/colibri-pxa3xx.c
+++ b/arch/arm/mach-pxa/colibri-pxa3xx.c
@@ -13,7 +13,6 @@
 #include <linux/gpio.h>
 #include <linux/etherdevice.h>
 #include <asm/mach-types.h>
-#include <mach/hardware.h>
 #include <linux/sizes.h>
 #include <asm/system_info.h>
 #include <asm/mach/arch.h>
diff --git a/arch/arm/mach-pxa/corgi.c b/arch/arm/mach-pxa/corgi.c
index 44659fbc37ba..f897762c8b58 100644
--- a/arch/arm/mach-pxa/corgi.c
+++ b/arch/arm/mach-pxa/corgi.c
@@ -39,7 +39,6 @@
 #include <asm/setup.h>
 #include <asm/memory.h>
 #include <asm/mach-types.h>
-#include <mach/hardware.h>
 #include <asm/irq.h>
 
 #include <asm/mach/arch.h>
diff --git a/arch/arm/mach-pxa/corgi_pm.c b/arch/arm/mach-pxa/corgi_pm.c
index 092dcb9fced5..ff1ac9bf37cb 100644
--- a/arch/arm/mach-pxa/corgi_pm.c
+++ b/arch/arm/mach-pxa/corgi_pm.c
@@ -19,7 +19,6 @@
 
 #include <asm/irq.h>
 #include <asm/mach-types.h>
-#include <mach/hardware.h>
 
 #include <mach/corgi.h>
 #include <mach/pxa2xx-regs.h>
diff --git a/arch/arm/mach-pxa/csb726.c b/arch/arm/mach-pxa/csb726.c
index 98fcdc6e2944..d48493445ae5 100644
--- a/arch/arm/mach-pxa/csb726.c
+++ b/arch/arm/mach-pxa/csb726.c
@@ -17,6 +17,7 @@
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
+
 #include "csb726.h"
 #include "pxa27x.h"
 #include <linux/platform_data/mmc-pxamci.h>
diff --git a/arch/arm/mach-pxa/devices.c b/arch/arm/mach-pxa/devices.c
index 09b8495f3fd9..7ca97ddef6fe 100644
--- a/arch/arm/mach-pxa/devices.c
+++ b/arch/arm/mach-pxa/devices.c
@@ -9,6 +9,7 @@
 #include <linux/dmaengine.h>
 #include <linux/spi/pxa2xx_spi.h>
 #include <linux/platform_data/i2c-pxa.h>
+#include <linux/soc/pxa/cpu.h>
 
 #include "udc.h"
 #include <linux/platform_data/usb-pxa3xx-ulpi.h>
@@ -20,7 +21,6 @@
 #include <linux/platform_data/keypad-pxa27x.h>
 #include <linux/platform_data/media/camera-pxa.h>
 #include <mach/audio.h>
-#include <mach/hardware.h>
 #include <linux/platform_data/mmp_dma.h>
 #include <linux/platform_data/mtd-nand-pxa3xx.h>
 
diff --git a/arch/arm/mach-pxa/ezx.c b/arch/arm/mach-pxa/ezx.c
index eb85950e7c0e..69c2ec02a16c 100644
--- a/arch/arm/mach-pxa/ezx.c
+++ b/arch/arm/mach-pxa/ezx.c
@@ -29,7 +29,6 @@
 #include "pxa27x.h"
 #include <linux/platform_data/video-pxafb.h>
 #include <linux/platform_data/usb-ohci-pxa27x.h>
-#include <mach/hardware.h>
 #include <linux/platform_data/keypad-pxa27x.h>
 #include <linux/platform_data/media/camera-pxa.h>
 
diff --git a/arch/arm/mach-pxa/generic.c b/arch/arm/mach-pxa/generic.c
index ab7cdffd7ea8..3c3cd90bb9b4 100644
--- a/arch/arm/mach-pxa/generic.c
+++ b/arch/arm/mach-pxa/generic.c
@@ -17,11 +17,12 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/soc/pxa/cpu.h>
 
-#include <mach/hardware.h>
 #include <asm/mach/map.h>
 #include <asm/mach-types.h>
 
+#include <mach/addr-map.h>
 #include <mach/irqs.h>
 #include <mach/reset.h>
 #include <mach/smemc.h>
diff --git a/arch/arm/mach-pxa/gumstix.c b/arch/arm/mach-pxa/gumstix.c
index 49dd618b10f7..72b08a9bf0fd 100644
--- a/arch/arm/mach-pxa/gumstix.c
+++ b/arch/arm/mach-pxa/gumstix.c
@@ -28,7 +28,6 @@
 #include <asm/setup.h>
 #include <asm/memory.h>
 #include <asm/mach-types.h>
-#include <mach/hardware.h>
 #include <asm/irq.h>
 #include <linux/sizes.h>
 
diff --git a/arch/arm/mach-pxa/hx4700.c b/arch/arm/mach-pxa/hx4700.c
index e1870fbb19e7..191a6c24fe19 100644
--- a/arch/arm/mach-pxa/hx4700.c
+++ b/arch/arm/mach-pxa/hx4700.c
@@ -36,11 +36,11 @@
 #include <linux/spi/pxa2xx_spi.h>
 #include <linux/platform_data/i2c-pxa.h>
 
-#include <mach/hardware.h>
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 
 #include "pxa27x.h"
+#include <mach/addr-map.h>
 #include <mach/hx4700.h>
 #include <linux/platform_data/irda-pxaficp.h>
 
diff --git a/arch/arm/mach-pxa/idp.c b/arch/arm/mach-pxa/idp.c
index fb0850af8496..57c0511472bc 100644
--- a/arch/arm/mach-pxa/idp.c
+++ b/arch/arm/mach-pxa/idp.c
@@ -22,7 +22,6 @@
 #include <asm/setup.h>
 #include <asm/memory.h>
 #include <asm/mach-types.h>
-#include <mach/hardware.h>
 #include <asm/irq.h>
 
 #include <asm/mach/arch.h>
diff --git a/arch/arm/mach-pxa/include/mach/pxa-regs.h b/arch/arm/mach-pxa/include/mach/pxa-regs.h
new file mode 100644
index 000000000000..ba5120c06b8a
--- /dev/null
+++ b/arch/arm/mach-pxa/include/mach/pxa-regs.h
@@ -0,0 +1,52 @@
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
diff --git a/arch/arm/mach-pxa/include/mach/pxa2xx-regs.h b/arch/arm/mach-pxa/include/mach/pxa2xx-regs.h
index fa121e135915..f68b573ab4a0 100644
--- a/arch/arm/mach-pxa/include/mach/pxa2xx-regs.h
+++ b/arch/arm/mach-pxa/include/mach/pxa2xx-regs.h
@@ -11,7 +11,7 @@
 #ifndef __PXA2XX_REGS_H
 #define __PXA2XX_REGS_H
 
-#include <mach/hardware.h>
+#include "pxa-regs.h"
 
 /*
  * Power Manager
diff --git a/arch/arm/mach-pxa/include/mach/pxa3xx-regs.h b/arch/arm/mach-pxa/include/mach/pxa3xx-regs.h
index 070f6c74196e..8eb1ba533e1c 100644
--- a/arch/arm/mach-pxa/include/mach/pxa3xx-regs.h
+++ b/arch/arm/mach-pxa/include/mach/pxa3xx-regs.h
@@ -10,7 +10,7 @@
 #ifndef __ASM_ARCH_PXA3XX_REGS_H
 #define __ASM_ARCH_PXA3XX_REGS_H
 
-#include <mach/hardware.h>
+#include "pxa-regs.h"
 
 /*
  * Oscillator Configuration Register (OSCC)
diff --git a/arch/arm/mach-pxa/include/mach/regs-ac97.h b/arch/arm/mach-pxa/include/mach/regs-ac97.h
index 1db96fd4df32..ec09b9635e25 100644
--- a/arch/arm/mach-pxa/include/mach/regs-ac97.h
+++ b/arch/arm/mach-pxa/include/mach/regs-ac97.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_ARCH_REGS_AC97_H
 #define __ASM_ARCH_REGS_AC97_H
 
-#include <mach/hardware.h>
+#include "pxa-regs.h"
 
 /*
  * AC97 Controller registers
diff --git a/arch/arm/mach-pxa/include/mach/regs-ost.h b/arch/arm/mach-pxa/include/mach/regs-ost.h
index deb564ed8ee7..109d0ed264df 100644
--- a/arch/arm/mach-pxa/include/mach/regs-ost.h
+++ b/arch/arm/mach-pxa/include/mach/regs-ost.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_MACH_REGS_OST_H
 #define __ASM_MACH_REGS_OST_H
 
-#include <mach/hardware.h>
+#include "pxa-regs.h"
 
 /*
  * OS Timer & Match Registers
diff --git a/arch/arm/mach-pxa/include/mach/trizeps4.h b/arch/arm/mach-pxa/include/mach/trizeps4.h
index 3cddb1428c5e..27926629f9c6 100644
--- a/arch/arm/mach-pxa/include/mach/trizeps4.h
+++ b/arch/arm/mach-pxa/include/mach/trizeps4.h
@@ -11,6 +11,7 @@
 #ifndef _TRIPEPS4_H_
 #define _TRIPEPS4_H_
 
+#include <mach/addr-map.h>
 #include "irqs.h" /* PXA_GPIO_TO_IRQ */
 
 /* physical memory regions */
diff --git a/arch/arm/mach-pxa/irq.c b/arch/arm/mach-pxa/irq.c
index 74efc3ab595f..f25c30e8a834 100644
--- a/arch/arm/mach-pxa/irq.c
+++ b/arch/arm/mach-pxa/irq.c
@@ -17,13 +17,14 @@
 #include <linux/irq.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
+#include <linux/soc/pxa/cpu.h>
 
 #include <asm/exception.h>
 
-#include <mach/hardware.h>
 #include <mach/irqs.h>
 
 #include "generic.h"
+#include "pxa-regs.h"
 
 #define ICIP			(0x000)
 #define ICMR			(0x004)
diff --git a/arch/arm/mach-pxa/littleton.c b/arch/arm/mach-pxa/littleton.c
index 73f5953b3bb6..f98dc61e87af 100644
--- a/arch/arm/mach-pxa/littleton.c
+++ b/arch/arm/mach-pxa/littleton.c
@@ -31,7 +31,6 @@
 #include <asm/setup.h>
 #include <asm/memory.h>
 #include <asm/mach-types.h>
-#include <mach/hardware.h>
 #include <asm/irq.h>
 
 #include <asm/mach/arch.h>
diff --git a/arch/arm/mach-pxa/lpd270.c b/arch/arm/mach-pxa/lpd270.c
index 6fc40bc06910..eac32bd9e385 100644
--- a/arch/arm/mach-pxa/lpd270.c
+++ b/arch/arm/mach-pxa/lpd270.c
@@ -28,7 +28,6 @@
 #include <asm/setup.h>
 #include <asm/memory.h>
 #include <asm/mach-types.h>
-#include <mach/hardware.h>
 #include <asm/irq.h>
 #include <linux/sizes.h>
 
@@ -39,6 +38,7 @@
 
 #include "pxa27x.h"
 #include "lpd270.h"
+#include <mach/addr-map.h>
 #include <mach/audio.h>
 #include <linux/platform_data/video-pxafb.h>
 #include <linux/platform_data/mmc-pxamci.h>
diff --git a/arch/arm/mach-pxa/lubbock.c b/arch/arm/mach-pxa/lubbock.c
index e2411971422d..72816e7c206f 100644
--- a/arch/arm/mach-pxa/lubbock.c
+++ b/arch/arm/mach-pxa/lubbock.c
@@ -34,7 +34,6 @@
 #include <asm/setup.h>
 #include <asm/memory.h>
 #include <asm/mach-types.h>
-#include <mach/hardware.h>
 #include <asm/irq.h>
 #include <linux/sizes.h>
 
diff --git a/arch/arm/mach-pxa/magician.c b/arch/arm/mach-pxa/magician.c
index 200fd35168e0..345a44d15a2c 100644
--- a/arch/arm/mach-pxa/magician.c
+++ b/arch/arm/mach-pxa/magician.c
@@ -29,12 +29,12 @@
 #include <linux/regulator/machine.h>
 #include <linux/platform_data/i2c-pxa.h>
 
-#include <mach/hardware.h>
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include <asm/system_info.h>
 
 #include "pxa27x.h"
+#include <mach/addr-map.h>
 #include <mach/magician.h>
 #include <linux/platform_data/video-pxafb.h>
 #include <linux/platform_data/mmc-pxamci.h>
diff --git a/arch/arm/mach-pxa/mainstone.c b/arch/arm/mach-pxa/mainstone.c
index 997f6e502201..cf74adfe65df 100644
--- a/arch/arm/mach-pxa/mainstone.c
+++ b/arch/arm/mach-pxa/mainstone.c
@@ -35,7 +35,6 @@
 #include <asm/setup.h>
 #include <asm/memory.h>
 #include <asm/mach-types.h>
-#include <mach/hardware.h>
 #include <asm/irq.h>
 #include <linux/sizes.h>
 
@@ -52,6 +51,7 @@
 #include <linux/platform_data/irda-pxaficp.h>
 #include <linux/platform_data/usb-ohci-pxa27x.h>
 #include <linux/platform_data/keypad-pxa27x.h>
+#include <mach/addr-map.h>
 #include <mach/smemc.h>
 
 #include "generic.h"
diff --git a/arch/arm/mach-pxa/mfp-pxa2xx.c b/arch/arm/mach-pxa/mfp-pxa2xx.c
index 6a5451b186c2..6bc7206fd2ac 100644
--- a/arch/arm/mach-pxa/mfp-pxa2xx.c
+++ b/arch/arm/mach-pxa/mfp-pxa2xx.c
@@ -16,6 +16,7 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/syscore_ops.h>
+#include <linux/soc/pxa/cpu.h>
 
 #include <mach/pxa2xx-regs.h>
 #include "mfp-pxa2xx.h"
diff --git a/arch/arm/mach-pxa/mfp-pxa3xx.c b/arch/arm/mach-pxa/mfp-pxa3xx.c
index 56114df9700d..f26b5e5412cf 100644
--- a/arch/arm/mach-pxa/mfp-pxa3xx.c
+++ b/arch/arm/mach-pxa/mfp-pxa3xx.c
@@ -16,7 +16,6 @@
 #include <linux/io.h>
 #include <linux/syscore_ops.h>
 
-#include <mach/hardware.h>
 #include "mfp-pxa3xx.h"
 #include <mach/pxa3xx-regs.h>
 
diff --git a/arch/arm/mach-pxa/poodle.c b/arch/arm/mach-pxa/poodle.c
index 58cfa434afde..ca52882433d4 100644
--- a/arch/arm/mach-pxa/poodle.c
+++ b/arch/arm/mach-pxa/poodle.c
@@ -30,7 +30,6 @@
 #include <linux/mtd/sharpsl.h>
 #include <linux/memblock.h>
 
-#include <mach/hardware.h>
 #include <asm/mach-types.h>
 #include <asm/irq.h>
 #include <asm/setup.h>
diff --git a/arch/arm/mach-pxa/pxa-regs.h b/arch/arm/mach-pxa/pxa-regs.h
new file mode 100644
index 000000000000..584d2ac592cc
--- /dev/null
+++ b/arch/arm/mach-pxa/pxa-regs.h
@@ -0,0 +1 @@
+#include <mach/pxa-regs.h>
diff --git a/arch/arm/mach-pxa/pxa25x.c b/arch/arm/mach-pxa/pxa25x.c
index 0d25cc45f825..305047ebd2f1 100644
--- a/arch/arm/mach-pxa/pxa25x.c
+++ b/arch/arm/mach-pxa/pxa25x.c
@@ -26,14 +26,15 @@
 #include <linux/irq.h>
 #include <linux/irqchip.h>
 #include <linux/platform_data/mmp_dma.h>
+#include <linux/soc/pxa/cpu.h>
 
 #include <asm/mach/map.h>
 #include <asm/suspend.h>
-#include <mach/hardware.h>
 #include <mach/irqs.h>
 #include "pxa25x.h"
 #include <mach/reset.h>
 #include "pm.h"
+#include <mach/addr-map.h>
 #include <mach/smemc.h>
 
 #include "generic.h"
diff --git a/arch/arm/mach-pxa/pxa25x.h b/arch/arm/mach-pxa/pxa25x.h
index b58d0fbdb4db..403bc16c2ed2 100644
--- a/arch/arm/mach-pxa/pxa25x.h
+++ b/arch/arm/mach-pxa/pxa25x.h
@@ -2,7 +2,7 @@
 #ifndef __MACH_PXA25x_H
 #define __MACH_PXA25x_H
 
-#include <mach/hardware.h>
+#include <mach/addr-map.h>
 #include <mach/pxa2xx-regs.h>
 #include "mfp-pxa25x.h"
 #include <mach/irqs.h>
diff --git a/arch/arm/mach-pxa/pxa27x-udc.h b/arch/arm/mach-pxa/pxa27x-udc.h
index faf73804697f..2d3df3b1cb68 100644
--- a/arch/arm/mach-pxa/pxa27x-udc.h
+++ b/arch/arm/mach-pxa/pxa27x-udc.h
@@ -2,6 +2,8 @@
 #ifndef _ASM_ARCH_PXA27X_UDC_H
 #define _ASM_ARCH_PXA27X_UDC_H
 
+#include "pxa-regs.h"
+
 #ifdef _ASM_ARCH_PXA25X_UDC_H
 #error You cannot include both PXA25x and PXA27x UDC support
 #endif
diff --git a/arch/arm/mach-pxa/pxa27x.c b/arch/arm/mach-pxa/pxa27x.c
index f7e89831e85b..a81ac88ecbfd 100644
--- a/arch/arm/mach-pxa/pxa27x.c
+++ b/arch/arm/mach-pxa/pxa27x.c
@@ -23,9 +23,9 @@
 #include <linux/irq.h>
 #include <linux/platform_data/i2c-pxa.h>
 #include <linux/platform_data/mmp_dma.h>
+#include <linux/soc/pxa/cpu.h>
 
 #include <asm/mach/map.h>
-#include <mach/hardware.h>
 #include <asm/irq.h>
 #include <asm/suspend.h>
 #include <mach/irqs.h>
@@ -33,6 +33,7 @@
 #include <mach/reset.h>
 #include <linux/platform_data/usb-ohci-pxa27x.h>
 #include "pm.h"
+#include <mach/addr-map.h>
 #include <mach/smemc.h>
 
 #include "generic.h"
diff --git a/arch/arm/mach-pxa/pxa27x.h b/arch/arm/mach-pxa/pxa27x.h
index abdc02fb4f03..6c99090647d2 100644
--- a/arch/arm/mach-pxa/pxa27x.h
+++ b/arch/arm/mach-pxa/pxa27x.h
@@ -3,7 +3,7 @@
 #define __MACH_PXA27x_H
 
 #include <linux/suspend.h>
-#include <mach/hardware.h>
+#include <mach/addr-map.h>
 #include <mach/pxa2xx-regs.h>
 #include "mfp-pxa27x.h"
 #include <mach/irqs.h>
diff --git a/arch/arm/mach-pxa/pxa2xx.c b/arch/arm/mach-pxa/pxa2xx.c
index 2d26cd2afbf3..ac72acb43e26 100644
--- a/arch/arm/mach-pxa/pxa2xx.c
+++ b/arch/arm/mach-pxa/pxa2xx.c
@@ -12,7 +12,6 @@
 #include <linux/device.h>
 #include <linux/io.h>
 
-#include <mach/hardware.h>
 #include <mach/pxa2xx-regs.h>
 #include "mfp-pxa25x.h"
 #include <mach/reset.h>
diff --git a/arch/arm/mach-pxa/pxa300.c b/arch/arm/mach-pxa/pxa300.c
index 7f2f5a6a2263..f77ec118d5b9 100644
--- a/arch/arm/mach-pxa/pxa300.c
+++ b/arch/arm/mach-pxa/pxa300.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
+#include <linux/soc/pxa/cpu.h>
 
 #include "pxa300.h"
 
diff --git a/arch/arm/mach-pxa/pxa320.c b/arch/arm/mach-pxa/pxa320.c
index 78abcc741df7..e372e6c118de 100644
--- a/arch/arm/mach-pxa/pxa320.c
+++ b/arch/arm/mach-pxa/pxa320.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
+#include <linux/soc/pxa/cpu.h>
 
 #include "pxa320.h"
 
diff --git a/arch/arm/mach-pxa/pxa3xx-ulpi.c b/arch/arm/mach-pxa/pxa3xx-ulpi.c
index 4bd7da1f8657..c29a7f0fa1b0 100644
--- a/arch/arm/mach-pxa/pxa3xx-ulpi.c
+++ b/arch/arm/mach-pxa/pxa3xx-ulpi.c
@@ -21,8 +21,8 @@
 #include <linux/clk.h>
 #include <linux/usb.h>
 #include <linux/usb/otg.h>
+#include <linux/soc/pxa/cpu.h>
 
-#include <mach/hardware.h>
 #include "regs-u2d.h"
 #include <linux/platform_data/usb-pxa3xx-ulpi.h>
 
diff --git a/arch/arm/mach-pxa/pxa3xx.c b/arch/arm/mach-pxa/pxa3xx.c
index 6eb1c24d7395..fc84aed99481 100644
--- a/arch/arm/mach-pxa/pxa3xx.c
+++ b/arch/arm/mach-pxa/pxa3xx.c
@@ -24,14 +24,15 @@
 #include <linux/syscore_ops.h>
 #include <linux/platform_data/i2c-pxa.h>
 #include <linux/platform_data/mmp_dma.h>
+#include <linux/soc/pxa/cpu.h>
 
 #include <asm/mach/map.h>
 #include <asm/suspend.h>
-#include <mach/hardware.h>
 #include <mach/pxa3xx-regs.h>
 #include <mach/reset.h>
 #include <linux/platform_data/usb-ohci-pxa27x.h>
 #include "pm.h"
+#include <mach/addr-map.h>
 #include <mach/smemc.h>
 #include <mach/irqs.h>
 
diff --git a/arch/arm/mach-pxa/pxa3xx.h b/arch/arm/mach-pxa/pxa3xx.h
index 6d4502aa9d06..22ace053ea25 100644
--- a/arch/arm/mach-pxa/pxa3xx.h
+++ b/arch/arm/mach-pxa/pxa3xx.h
@@ -2,7 +2,7 @@
 #ifndef __MACH_PXA3XX_H	
 #define __MACH_PXA3XX_H
 
-#include <mach/hardware.h>
+#include <mach/addr-map.h>
 #include <mach/pxa3xx-regs.h>
 #include <mach/irqs.h>
 
diff --git a/arch/arm/mach-pxa/pxa930.c b/arch/arm/mach-pxa/pxa930.c
index bf91de4267e5..b9021a40cbd1 100644
--- a/arch/arm/mach-pxa/pxa930.c
+++ b/arch/arm/mach-pxa/pxa930.c
@@ -13,6 +13,7 @@
 #include <linux/irq.h>
 #include <linux/gpio-pxa.h>
 #include <linux/platform_device.h>
+#include <linux/soc/pxa/cpu.h>
 
 #include "pxa930.h"
 
diff --git a/arch/arm/mach-pxa/regs-rtc.h b/arch/arm/mach-pxa/regs-rtc.h
index b1f9ff14e335..96255a0f595e 100644
--- a/arch/arm/mach-pxa/regs-rtc.h
+++ b/arch/arm/mach-pxa/regs-rtc.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_MACH_REGS_RTC_H
 #define __ASM_MACH_REGS_RTC_H
 
-#include <mach/hardware.h>
+#include "pxa-regs.h"
 
 /*
  * Real Time Clock
diff --git a/arch/arm/mach-pxa/regs-uart.h b/arch/arm/mach-pxa/regs-uart.h
index 9a168f83afeb..490e9ca16297 100644
--- a/arch/arm/mach-pxa/regs-uart.h
+++ b/arch/arm/mach-pxa/regs-uart.h
@@ -2,6 +2,8 @@
 #ifndef __ASM_ARCH_REGS_UART_H
 #define __ASM_ARCH_REGS_UART_H
 
+#include "pxa-regs.h"
+
 /*
  * UARTs
  */
diff --git a/arch/arm/mach-pxa/sleep.S b/arch/arm/mach-pxa/sleep.S
index 6c5b3ffd2cd3..272efeb954f4 100644
--- a/arch/arm/mach-pxa/sleep.S
+++ b/arch/arm/mach-pxa/sleep.S
@@ -13,7 +13,6 @@
 
 #include <linux/linkage.h>
 #include <asm/assembler.h>
-#include <mach/hardware.h>
 #include <mach/smemc.h>
 #include <mach/pxa2xx-regs.h>
 
diff --git a/arch/arm/mach-pxa/smemc.c b/arch/arm/mach-pxa/smemc.c
index 32e82cc92ea5..47b99549d616 100644
--- a/arch/arm/mach-pxa/smemc.c
+++ b/arch/arm/mach-pxa/smemc.c
@@ -8,8 +8,8 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/syscore_ops.h>
+#include <linux/soc/pxa/cpu.h>
 
-#include <mach/hardware.h>
 #include <mach/smemc.h>
 
 #ifdef CONFIG_PM
diff --git a/arch/arm/mach-pxa/spitz_pm.c b/arch/arm/mach-pxa/spitz_pm.c
index 25a1f8c5a738..201dabe883b6 100644
--- a/arch/arm/mach-pxa/spitz_pm.c
+++ b/arch/arm/mach-pxa/spitz_pm.c
@@ -18,7 +18,6 @@
 
 #include <asm/irq.h>
 #include <asm/mach-types.h>
-#include <mach/hardware.h>
 
 #include <mach/spitz.h>
 #include "pxa27x.h"
diff --git a/arch/arm/mach-pxa/standby.S b/arch/arm/mach-pxa/standby.S
index eab1645bb4ad..626fecdefb1c 100644
--- a/arch/arm/mach-pxa/standby.S
+++ b/arch/arm/mach-pxa/standby.S
@@ -11,7 +11,6 @@
 
 #include <linux/linkage.h>
 #include <asm/assembler.h>
-#include <mach/hardware.h>
 
 #include <mach/pxa2xx-regs.h>
 
diff --git a/arch/arm/mach-pxa/xcep.c b/arch/arm/mach-pxa/xcep.c
index f485146b899f..e6ab428287ae 100644
--- a/arch/arm/mach-pxa/xcep.c
+++ b/arch/arm/mach-pxa/xcep.c
@@ -24,8 +24,8 @@
 #include <asm/mach/irq.h>
 #include <asm/mach/map.h>
 
-#include <mach/hardware.h>
 #include "pxa25x.h"
+#include <mach/addr-map.h>
 #include <mach/smemc.h>
 
 #include "generic.h"
diff --git a/arch/arm/mach-pxa/zylonite.c b/arch/arm/mach-pxa/zylonite.c
index 79f0025fa17a..9bcb81688201 100644
--- a/arch/arm/mach-pxa/zylonite.c
+++ b/arch/arm/mach-pxa/zylonite.c
@@ -20,6 +20,7 @@
 #include <linux/pwm.h>
 #include <linux/pwm_backlight.h>
 #include <linux/smc91x.h>
+#include <linux/soc/pxa/cpu.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
diff --git a/arch/arm/mach-pxa/zylonite.h b/arch/arm/mach-pxa/zylonite.h
index 7300ec2aac0d..afe3efcb8e04 100644
--- a/arch/arm/mach-pxa/zylonite.h
+++ b/arch/arm/mach-pxa/zylonite.h
@@ -2,6 +2,8 @@
 #ifndef __ASM_ARCH_ZYLONITE_H
 #define __ASM_ARCH_ZYLONITE_H
 
+#include <linux/soc/pxa/cpu.h>
+
 #define ZYLONITE_ETH_PHYS	0x14000000
 
 #define EXT_GPIO(x)		(128 + (x))
diff --git a/arch/arm/mach-pxa/zylonite_pxa300.c b/arch/arm/mach-pxa/zylonite_pxa300.c
index 956fec1c4940..50a8a3547dbc 100644
--- a/arch/arm/mach-pxa/zylonite_pxa300.c
+++ b/arch/arm/mach-pxa/zylonite_pxa300.c
@@ -17,6 +17,7 @@
 #include <linux/platform_data/i2c-pxa.h>
 #include <linux/platform_data/pca953x.h>
 #include <linux/gpio.h>
+#include <linux/soc/pxa/cpu.h>
 
 #include "pxa300.h"
 #include "devices.h"
diff --git a/arch/arm/mach-pxa/zylonite_pxa320.c b/arch/arm/mach-pxa/zylonite_pxa320.c
index 94cb834f36cd..67cab4f1194b 100644
--- a/arch/arm/mach-pxa/zylonite_pxa320.c
+++ b/arch/arm/mach-pxa/zylonite_pxa320.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/gpio.h>
+#include <linux/soc/pxa/cpu.h>
 
 #include "pxa320.h"
 #include "zylonite.h"
diff --git a/drivers/clk/pxa/clk-pxa3xx.c b/drivers/clk/pxa/clk-pxa3xx.c
index 60db92772e72..027b78183565 100644
--- a/drivers/clk/pxa/clk-pxa3xx.c
+++ b/drivers/clk/pxa/clk-pxa3xx.c
@@ -14,6 +14,7 @@
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
 #include <linux/of.h>
+#include <linux/soc/pxa/cpu.h>
 #include <mach/smemc.h>
 #include <mach/pxa3xx-regs.h>
 
diff --git a/drivers/cpufreq/pxa2xx-cpufreq.c b/drivers/cpufreq/pxa2xx-cpufreq.c
index f0b6f52eb2c3..0f0e676ff781 100644
--- a/drivers/cpufreq/pxa2xx-cpufreq.c
+++ b/drivers/cpufreq/pxa2xx-cpufreq.c
@@ -24,6 +24,7 @@
 #include <linux/cpufreq.h>
 #include <linux/err.h>
 #include <linux/regulator/consumer.h>
+#include <linux/soc/pxa/cpu.h>
 #include <linux/io.h>
 
 #include <mach/pxa2xx-regs.h>
diff --git a/drivers/cpufreq/pxa3xx-cpufreq.c b/drivers/cpufreq/pxa3xx-cpufreq.c
index 32f993c94675..d3b398b4aa6a 100644
--- a/drivers/cpufreq/pxa3xx-cpufreq.c
+++ b/drivers/cpufreq/pxa3xx-cpufreq.c
@@ -8,6 +8,7 @@
 #include <linux/sched.h>
 #include <linux/init.h>
 #include <linux/cpufreq.h>
+#include <linux/soc/pxa/cpu.h>
 #include <linux/slab.h>
 #include <linux/io.h>
 
diff --git a/drivers/input/mouse/pxa930_trkball.c b/drivers/input/mouse/pxa930_trkball.c
index 3332b77eef2a..f04ba12dbfa8 100644
--- a/drivers/input/mouse/pxa930_trkball.c
+++ b/drivers/input/mouse/pxa930_trkball.c
@@ -15,7 +15,6 @@
 #include <linux/io.h>
 #include <linux/slab.h>
 
-#include <mach/hardware.h>
 #include <linux/platform_data/mouse-pxa930_trkball.h>
 
 /* Trackball Controller Register Definitions */
diff --git a/drivers/input/touchscreen/zylonite-wm97xx.c b/drivers/input/touchscreen/zylonite-wm97xx.c
index 0f4ac7f844ce..f57bdf083188 100644
--- a/drivers/input/touchscreen/zylonite-wm97xx.c
+++ b/drivers/input/touchscreen/zylonite-wm97xx.c
@@ -21,9 +21,9 @@
 #include <linux/irq.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/soc/pxa/cpu.h>
 #include <linux/wm97xx.h>
 
-#include <mach/hardware.h>
 #include <mach/mfp.h>
 #include <mach/regs-ac97.h>
 
diff --git a/drivers/leds/leds-locomo.c b/drivers/leds/leds-locomo.c
index 42dc46e3f00f..9aa3fccd71fb 100644
--- a/drivers/leds/leds-locomo.c
+++ b/drivers/leds/leds-locomo.c
@@ -11,7 +11,6 @@
 #include <linux/device.h>
 #include <linux/leds.h>
 
-#include <mach/hardware.h>
 #include <asm/hardware/locomo.h>
 
 static void locomoled_brightness_set(struct led_classdev *led_cdev,
diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
index 316393c694d7..0db9490dc659 100644
--- a/drivers/mmc/host/pxamci.c
+++ b/drivers/mmc/host/pxamci.c
@@ -31,10 +31,10 @@
 #include <linux/gfp.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/soc/pxa/cpu.h>
 
 #include <linux/sizes.h>
 
-#include <mach/hardware.h>
 #include <linux/platform_data/mmc-pxamci.h>
 
 #include "pxamci.h"
diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
index 7d96758a8f04..1749dbbacc13 100644
--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -16,8 +16,6 @@
 #include <linux/mtd/partitions.h>
 
 #include <asm/io.h>
-#include <mach/hardware.h>
-
 #include <asm/mach/flash.h>
 
 #define CACHELINESIZE	32
diff --git a/drivers/pcmcia/pxa2xx_base.c b/drivers/pcmcia/pxa2xx_base.c
index d6d2f75f8f47..7cd1375d6087 100644
--- a/drivers/pcmcia/pxa2xx_base.c
+++ b/drivers/pcmcia/pxa2xx_base.c
@@ -23,8 +23,8 @@
 #include <linux/kernel.h>
 #include <linux/spinlock.h>
 #include <linux/platform_device.h>
+#include <linux/soc/pxa/cpu.h>
 
-#include <mach/hardware.h>
 #include <mach/smemc.h>
 #include <asm/io.h>
 #include <asm/irq.h>
diff --git a/drivers/pcmcia/pxa2xx_sharpsl.c b/drivers/pcmcia/pxa2xx_sharpsl.c
index 5fdd25a9e28e..66fe1d1af12a 100644
--- a/drivers/pcmcia/pxa2xx_sharpsl.c
+++ b/drivers/pcmcia/pxa2xx_sharpsl.c
@@ -15,7 +15,6 @@
 #include <linux/platform_device.h>
 
 #include <asm/mach-types.h>
-#include <mach/hardware.h>
 #include <asm/irq.h>
 #include <asm/hardware/scoop.h>
 
diff --git a/drivers/pcmcia/sa1111_generic.c b/drivers/pcmcia/sa1111_generic.c
index 29fdd174bc23..bce664bbdc98 100644
--- a/drivers/pcmcia/sa1111_generic.c
+++ b/drivers/pcmcia/sa1111_generic.c
@@ -17,7 +17,6 @@
 
 #include <pcmcia/ss.h>
 
-#include <mach/hardware.h>
 #include <asm/hardware/sa1111.h>
 #include <asm/mach-types.h>
 #include <asm/irq.h>
diff --git a/drivers/pcmcia/sa1111_lubbock.c b/drivers/pcmcia/sa1111_lubbock.c
index 7feb8d61c639..f1b5160cb8fa 100644
--- a/drivers/pcmcia/sa1111_lubbock.c
+++ b/drivers/pcmcia/sa1111_lubbock.c
@@ -17,7 +17,6 @@
 #include <linux/init.h>
 #include <linux/delay.h>
 
-#include <mach/hardware.h>
 #include <asm/hardware/sa1111.h>
 #include <asm/mach-types.h>
 
diff --git a/drivers/pcmcia/soc_common.c b/drivers/pcmcia/soc_common.c
index 3a8c84bb174d..9276a628473d 100644
--- a/drivers/pcmcia/soc_common.c
+++ b/drivers/pcmcia/soc_common.c
@@ -47,8 +47,6 @@
 #include <linux/spinlock.h>
 #include <linux/timer.h>
 
-#include <mach/hardware.h>
-
 #include "soc_common.h"
 
 static irqreturn_t soc_common_pcmcia_interrupt(int irq, void *dev);
diff --git a/drivers/rtc/rtc-pxa.c b/drivers/rtc/rtc-pxa.c
index cf8119b6d320..eeacf480cf36 100644
--- a/drivers/rtc/rtc-pxa.c
+++ b/drivers/rtc/rtc-pxa.c
@@ -16,8 +16,6 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 
-#include <mach/hardware.h>
-
 #include "rtc-sa1100.h"
 
 #define RTC_DEF_DIVIDER		(32768 - 1)
diff --git a/drivers/usb/host/ohci-pxa27x.c b/drivers/usb/host/ohci-pxa27x.c
index 54aa5c77e549..ab4f610a0140 100644
--- a/drivers/usb/host/ohci-pxa27x.c
+++ b/drivers/usb/host/ohci-pxa27x.c
@@ -36,8 +36,7 @@
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 #include <linux/usb/otg.h>
-
-#include <mach/hardware.h>
+#include <linux/soc/pxa/cpu.h>
 
 #include "ohci.h"
 
diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index f1551e00eb12..e3d1a184d2be 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -57,10 +57,10 @@
 #include <linux/console.h>
 #include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
+#include <linux/soc/pxa/cpu.h>
 #include <video/of_display_timing.h>
 #include <video/videomode.h>
 
-#include <mach/hardware.h>
 #include <asm/io.h>
 #include <asm/irq.h>
 #include <asm/div64.h>
diff --git a/drivers/watchdog/sa1100_wdt.c b/drivers/watchdog/sa1100_wdt.c
index 27846c6bdfb0..d33f0375112f 100644
--- a/drivers/watchdog/sa1100_wdt.c
+++ b/drivers/watchdog/sa1100_wdt.c
@@ -35,7 +35,6 @@
 #endif
 
 #include <mach/reset.h>
-#include <mach/hardware.h>
 
 static unsigned long oscr_freq;
 static unsigned long sa1100wdt_users;
diff --git a/arch/arm/mach-pxa/include/mach/hardware.h b/include/linux/soc/pxa/cpu.h
similarity index 75%
rename from arch/arm/mach-pxa/include/mach/hardware.h
rename to include/linux/soc/pxa/cpu.h
index ee7eab16135f..5782450ee45c 100644
--- a/arch/arm/mach-pxa/include/mach/hardware.h
+++ b/include/linux/soc/pxa/cpu.h
@@ -1,61 +1,16 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- *  arch/arm/mach-pxa/include/mach/hardware.h
- *
  *  Author:	Nicolas Pitre
  *  Created:	Jun 15, 2001
  *  Copyright:	MontaVista Software Inc.
  */
 
-#ifndef __ASM_ARCH_HARDWARE_H
-#define __ASM_ARCH_HARDWARE_H
-
-#include <mach/addr-map.h>
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
-#ifndef __ASSEMBLY__
+#ifndef __SOC_PXA_CPU_H
+#define __SOC_PXA_CPU_H
 
+#ifdef CONFIG_ARM
 #include <asm/cputype.h>
+#endif
 
 /*
  *   CPU     Stepping     CPU_ID         JTAG_ID
@@ -294,12 +249,4 @@
 		__cpu_is_pxa93x(read_cpuid_id());	\
 	 })
 
-
-/*
- * return current memory and LCD clock frequency in units of 10kHz
- */
-extern unsigned int get_memclk_frequency_10khz(void);
-
 #endif
-
-#endif  /* _ASM_ARCH_HARDWARE_H */
diff --git a/sound/arm/pxa2xx-ac97-lib.c b/sound/arm/pxa2xx-ac97-lib.c
index 58274b4a1f09..84d5f85073b9 100644
--- a/sound/arm/pxa2xx-ac97-lib.c
+++ b/sound/arm/pxa2xx-ac97-lib.c
@@ -17,6 +17,7 @@
 #include <linux/io.h>
 #include <linux/gpio.h>
 #include <linux/of_gpio.h>
+#include <linux/soc/pxa/cpu.h>
 
 #include <sound/pxa2xx-lib.h>
 
diff --git a/sound/soc/pxa/pxa2xx-ac97.c b/sound/soc/pxa/pxa2xx-ac97.c
index 58f8541ba55c..8f78c5a359c5 100644
--- a/sound/soc/pxa/pxa2xx-ac97.c
+++ b/sound/soc/pxa/pxa2xx-ac97.c
@@ -21,7 +21,7 @@
 #include <sound/pxa2xx-lib.h>
 #include <sound/dmaengine_pcm.h>
 
-#include <mach/hardware.h>
+#include <mach/pxa-regs.h>
 #include <mach/regs-ac97.h>
 #include <mach/audio.h>
 
diff --git a/sound/soc/pxa/pxa2xx-i2s.c b/sound/soc/pxa/pxa2xx-i2s.c
index 5bfc1a966532..114a33c4a064 100644
--- a/sound/soc/pxa/pxa2xx-i2s.c
+++ b/sound/soc/pxa/pxa2xx-i2s.c
@@ -21,7 +21,7 @@
 #include <sound/pxa2xx-lib.h>
 #include <sound/dmaengine_pcm.h>
 
-#include <mach/hardware.h>
+#include <mach/pxa-regs.h>
 #include <mach/audio.h>
 
 #include "pxa2xx-i2s.h"
diff --git a/sound/soc/pxa/z2.c b/sound/soc/pxa/z2.c
index edf2b9eec5b8..7e8f33d7b83f 100644
--- a/sound/soc/pxa/z2.c
+++ b/sound/soc/pxa/z2.c
@@ -21,7 +21,6 @@
 #include <sound/jack.h>
 
 #include <asm/mach-types.h>
-#include <mach/hardware.h>
 #include <mach/audio.h>
 #include <mach/z2.h>
 
-- 
2.29.2

