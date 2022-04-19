Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70293506DB7
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744C810EFAC;
	Tue, 19 Apr 2022 13:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9752610EFCD
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:40:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F10C06169B;
 Tue, 19 Apr 2022 13:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA25C385AF;
 Tue, 19 Apr 2022 13:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375630;
 bh=Y28p7Ny9YomGZamqZAIMduIfzMd9ilwbgGj96GOTejs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eUHAFjoiHuXtqZ4ZQCCCjrNWBObk3OpvdAoRndhAbYTT/dWpoD2ncZTLJ89QVYpaG
 E3ATSEWOwtxhMgdoVM3aoUvIYenIeLY8VecZ74Q1zfAO0JlMqhoBixhEDM2LhMCyTM
 Bg8EvhbdgtMjbcznvJxbbq6hNISkYGTTR4Tv2UoKdlOSU7hMkR/ruvdJ/iC72Zem7f
 i9ZFFfE2l05LHOqtf8V/dIsD5stadiF0iLdtFAAfv026f+K1DHAgxo/HxMLDoMG0LJ
 KlL7TLBkRPDFumi0yT4sk8TbBxJfJ8Zsfkwpvwn7UIjjyX9tWqdiDl36pA3xGyphWy
 6yb1hp9ibLpEg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 23/41] ARM: omap: split up arch/arm/plat-omap/Kconfig
Date: Tue, 19 Apr 2022 15:37:05 +0200
Message-Id: <20220419133723.1394715-24-arnd@kernel.org>
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

From: Arnd Bergmann <arnd@arndb.de>

All the remaining features in here are either omap1
or omap2plus specific, so move them into the respective
Kconfig files.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig            |  2 -
 arch/arm/mach-omap1/Kconfig | 37 +++++++++++++++
 arch/arm/mach-omap2/Kconfig | 49 ++++++++++++++++++++
 arch/arm/plat-omap/Kconfig  | 92 -------------------------------------
 4 files changed, 86 insertions(+), 94 deletions(-)
 delete mode 100644 arch/arm/plat-omap/Kconfig

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 2e8091e2d8a8..700655e31b04 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -656,8 +656,6 @@ source "arch/arm/mach-npcm/Kconfig"
 
 source "arch/arm/mach-nspire/Kconfig"
 
-source "arch/arm/plat-omap/Kconfig"
-
 source "arch/arm/mach-omap1/Kconfig"
 
 source "arch/arm/mach-omap2/Kconfig"
diff --git a/arch/arm/mach-omap1/Kconfig b/arch/arm/mach-omap1/Kconfig
index 04155b5ce978..93ea86954a84 100644
--- a/arch/arm/mach-omap1/Kconfig
+++ b/arch/arm/mach-omap1/Kconfig
@@ -28,6 +28,11 @@ config ARCH_OMAP16XX
 	select CPU_ARM926T
 	select OMAP_DM_TIMER
 
+config ARCH_OMAP
+	bool
+
+comment "OMAP Feature Selections"
+
 config OMAP_MUX
 	bool "OMAP multiplexing support"
 	default y
@@ -69,6 +74,38 @@ config OMAP_32K_TIMER
 	  The actual timer selection is done in the board file
 	  through the (DT_)MACHINE_START structure.
 
+config OMAP_MPU_TIMER
+	bool "Use mpu timer"
+	depends on ARCH_OMAP1
+	help
+	  Select this option if you want to use the OMAP mpu timer. This
+	  timer provides more intra-tick resolution than the 32KHz timer,
+	  but consumes more power.
+
+config OMAP_SERIAL_WAKE
+	bool "Enable wake-up events for serial ports"
+	depends on ARCH_OMAP1 && OMAP_MUX
+	default y
+	help
+	  Select this option if you want to have your system wake up
+	  to data on the serial RX line. This allows you to wake the
+	  system from serial console.
+
+config OMAP_RESET_CLOCKS
+	bool "Reset unused clocks during boot"
+	depends on ARCH_OMAP
+	help
+	  Say Y if you want to reset unused clocks during boot.
+	  This option saves power, but assumes all drivers are
+	  using the clock framework. Broken drivers that do not
+	  yet use clock framework may not work with this option.
+	  If you are booting from another operating system, you
+	  probably do not want this option enabled until your
+	  device drivers work properly.
+
+config ARCH_OMAP_OTG
+	bool
+
 comment "OMAP Board Type"
 
 config MACH_OMAP_INNOVATOR
diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
index 02c253de9b6e..a8adbb4d478a 100644
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -123,6 +123,8 @@ config OMAP_INTERCONNECT_BARRIER
 	bool
 	select ARM_HEAVY_MB
 	
+config ARCH_OMAP
+	bool
 
 if ARCH_OMAP2PLUS
 
@@ -153,6 +155,53 @@ config SOC_HAS_REALTIME_COUNTER
 	depends on SOC_OMAP5 || SOC_DRA7XX
 	default y
 
+config POWER_AVS_OMAP
+	bool "AVS(Adaptive Voltage Scaling) support for OMAP IP versions 1&2"
+	depends on (ARCH_OMAP3 || ARCH_OMAP4) && PM
+	select POWER_SUPPLY
+	help
+	  Say Y to enable AVS(Adaptive Voltage Scaling)
+	  support on OMAP containing the version 1 or
+	  version 2 of the SmartReflex IP.
+	  V1 is the 65nm version used in OMAP3430.
+	  V2 is the update for the 45nm version of the IP used in OMAP3630
+	  and OMAP4430
+
+	  Please note, that by default SmartReflex is only
+	  initialized and not enabled. To enable the automatic voltage
+	  compensation for vdd mpu and vdd core from user space,
+	  user must write 1 to
+		/debug/smartreflex/sr_<X>/autocomp,
+	  where X is mpu_iva or core for OMAP3.
+	  Optionally autocompensation can be enabled in the kernel
+	  by default during system init via the enable_on_init flag
+	  which an be passed as platform data to the smartreflex driver.
+
+config POWER_AVS_OMAP_CLASS3
+	bool "Class 3 mode of Smartreflex Implementation"
+	depends on POWER_AVS_OMAP && TWL4030_CORE
+	help
+	  Say Y to enable Class 3 implementation of Smartreflex
+
+	  Class 3 implementation of Smartreflex employs continuous hardware
+	  voltage calibration.
+
+config OMAP3_L2_AUX_SECURE_SAVE_RESTORE
+	bool "OMAP3 HS/EMU save and restore for L2 AUX control register"
+	depends on ARCH_OMAP3 && PM
+	help
+	  Without this option, L2 Auxiliary control register contents are
+	  lost during off-mode entry on HS/EMU devices. This feature
+	  requires support from PPA / boot-loader in HS/EMU devices, which
+	  currently does not exist by default.
+
+config OMAP3_L2_AUX_SECURE_SERVICE_SET_ID
+	int "Service ID for the support routine to set L2 AUX control"
+	depends on OMAP3_L2_AUX_SECURE_SAVE_RESTORE
+	default 43
+	help
+	  PPA routine service ID for setting L2 auxiliary control register.
+
 comment "OMAP Core Type"
 	depends on ARCH_OMAP2
 
diff --git a/arch/arm/plat-omap/Kconfig b/arch/arm/plat-omap/Kconfig
deleted file mode 100644
index dc53ea8e5bbb..000000000000
--- a/arch/arm/plat-omap/Kconfig
+++ /dev/null
@@ -1,92 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-config ARCH_OMAP
-	bool
-
-if ARCH_OMAP
-
-menu "TI OMAP Common Features"
-
-config ARCH_OMAP_OTG
-	bool
-
-comment "OMAP Feature Selections"
-
-config POWER_AVS_OMAP
-	bool "AVS(Adaptive Voltage Scaling) support for OMAP IP versions 1&2"
-	depends on (ARCH_OMAP3 || ARCH_OMAP4) && PM
-	select POWER_SUPPLY
-	help
-	  Say Y to enable AVS(Adaptive Voltage Scaling)
-	  support on OMAP containing the version 1 or
-	  version 2 of the SmartReflex IP.
-	  V1 is the 65nm version used in OMAP3430.
-	  V2 is the update for the 45nm version of the IP used in OMAP3630
-	  and OMAP4430
-
-	  Please note, that by default SmartReflex is only
-	  initialized and not enabled. To enable the automatic voltage
-	  compensation for vdd mpu and vdd core from user space,
-	  user must write 1 to
-		/debug/smartreflex/sr_<X>/autocomp,
-	  where X is mpu_iva or core for OMAP3.
-	  Optionally autocompensation can be enabled in the kernel
-	  by default during system init via the enable_on_init flag
-	  which an be passed as platform data to the smartreflex driver.
-
-config POWER_AVS_OMAP_CLASS3
-	bool "Class 3 mode of Smartreflex Implementation"
-	depends on POWER_AVS_OMAP && TWL4030_CORE
-	help
-	  Say Y to enable Class 3 implementation of Smartreflex
-
-	  Class 3 implementation of Smartreflex employs continuous hardware
-	  voltage calibration.
-
-config OMAP_RESET_CLOCKS
-	bool "Reset unused clocks during boot"
-	depends on ARCH_OMAP
-	help
-	  Say Y if you want to reset unused clocks during boot.
-	  This option saves power, but assumes all drivers are
-	  using the clock framework. Broken drivers that do not
-	  yet use clock framework may not work with this option.
-	  If you are booting from another operating system, you
-	  probably do not want this option enabled until your
-	  device drivers work properly.
-
-config OMAP_MPU_TIMER
-	bool "Use mpu timer"
-	depends on ARCH_OMAP1
-	help
-	  Select this option if you want to use the OMAP mpu timer. This
-	  timer provides more intra-tick resolution than the 32KHz timer,
-	  but consumes more power.
-
-config OMAP3_L2_AUX_SECURE_SAVE_RESTORE
-	bool "OMAP3 HS/EMU save and restore for L2 AUX control register"
-	depends on ARCH_OMAP3 && PM
-	help
-	  Without this option, L2 Auxiliary control register contents are
-	  lost during off-mode entry on HS/EMU devices. This feature
-	  requires support from PPA / boot-loader in HS/EMU devices, which
-	  currently does not exist by default.
-
-config OMAP3_L2_AUX_SECURE_SERVICE_SET_ID
-	int "Service ID for the support routine to set L2 AUX control"
-	depends on OMAP3_L2_AUX_SECURE_SAVE_RESTORE
-	default 43
-	help
-	  PPA routine service ID for setting L2 auxiliary control register.
-
-config OMAP_SERIAL_WAKE
-	bool "Enable wake-up events for serial ports"
-	depends on ARCH_OMAP1 && OMAP_MUX
-	default y
-	help
-	  Select this option if you want to have your system wake up
-	  to data on the serial RX line. This allows you to wake the
-	  system from serial console.
-
-endmenu
-
-endif
-- 
2.29.2

