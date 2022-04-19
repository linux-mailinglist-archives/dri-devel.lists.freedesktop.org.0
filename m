Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB1750738C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9034110F128;
	Tue, 19 Apr 2022 16:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B0910F120
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:45:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 92135B81C00;
 Tue, 19 Apr 2022 16:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DAF6C385AD;
 Tue, 19 Apr 2022 16:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386706;
 bh=oNd2jzd1ZgiC1U71slXEuF0Jw0poX3XVV+5BeDbbYa8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eVv/JxXnBMI8H1rNYcDgRe1YKiI3MroWqCXwupYAZyfp6Y8ukHiHF/5kn5Mx/+I5y
 j/799pOJ+F/pj3wyOtKsICgAU+YeAfXm1ukGhaRazluTHJ4IcIEdlRxQPgmpSCuPm1
 ogEIbzAt5lZDtm97mHkQdDrFBzdy9VafLDkJLSKgUTURMmhufcftKDQ+baPjnPexl2
 8jHrEZ02A8VZOBE9lEopc2ie/OYNHyzj/pLzbIv452shuanbP3xk00G5QWu60CjSRY
 NBgn+0C1lnZL16WegiUAVIjrVxIf8VVvn8wl8O1aHfsK4yRsJmWPebcAU9BlGYxb27
 ad7YKwZ1K48JQ==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 48/48] ARM: pxa: convert to multiplatform
Date: Tue, 19 Apr 2022 18:38:10 +0200
Message-Id: <20220419163810.2118169-49-arnd@kernel.org>
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

PXA is now ready to be built into a single kernel with all the
other ARMv5 platforms, so change the Kconfig bit to finish it
off. The mach/uncompress.h support is the last bit that goes away,
getting replaced with the normal DEBUG_LL based approach.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig                            | 17 -----
 arch/arm/configs/am200epdkit_defconfig      |  1 +
 arch/arm/configs/cm_x300_defconfig          |  1 +
 arch/arm/configs/colibri_pxa270_defconfig   |  1 +
 arch/arm/configs/colibri_pxa300_defconfig   |  1 +
 arch/arm/configs/corgi_defconfig            |  1 +
 arch/arm/configs/eseries_pxa_defconfig      |  1 +
 arch/arm/configs/ezx_defconfig              |  1 +
 arch/arm/configs/h5000_defconfig            |  1 +
 arch/arm/configs/imote2_defconfig           |  1 +
 arch/arm/configs/lpd270_defconfig           |  1 +
 arch/arm/configs/lubbock_defconfig          |  1 +
 arch/arm/configs/magician_defconfig         |  1 +
 arch/arm/configs/mainstone_defconfig        |  1 +
 arch/arm/configs/palmz72_defconfig          |  1 +
 arch/arm/configs/pcm027_defconfig           |  1 +
 arch/arm/configs/pxa255-idp_defconfig       |  1 +
 arch/arm/configs/pxa3xx_defconfig           |  1 +
 arch/arm/configs/pxa_defconfig              |  1 +
 arch/arm/configs/spitz_defconfig            |  1 +
 arch/arm/configs/trizeps4_defconfig         |  1 +
 arch/arm/configs/viper_defconfig            |  1 +
 arch/arm/configs/xcep_defconfig             |  1 +
 arch/arm/configs/zeus_defconfig             |  1 +
 arch/arm/mach-pxa/Kconfig                   | 14 +++++
 arch/arm/mach-pxa/Makefile.boot             |  3 -
 arch/arm/mach-pxa/include/mach/uncompress.h | 70 ---------------------
 27 files changed, 37 insertions(+), 90 deletions(-)
 delete mode 100644 arch/arm/mach-pxa/Makefile.boot
 delete mode 100644 arch/arm/mach-pxa/include/mach/uncompress.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ace6c08c8ae2..001f77e0058c 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -411,23 +411,6 @@ config ARCH_DOVE
 	help
 	  Support for the Marvell Dove SoC 88AP510
 
-config ARCH_PXA
-	bool "PXA2xx/PXA3xx-based"
-	select ARM_CPU_SUSPEND if PM
-	select AUTO_ZRELADDR
-	select COMMON_CLK
-	select CLKSRC_PXA
-	select CLKSRC_MMIO
-	select TIMER_OF
-	select CPU_XSCALE if !CPU_XSC3
-	select GPIO_PXA
-	select GPIOLIB
-	select IRQ_DOMAIN
-	select PLAT_PXA
-	select SPARSE_IRQ
-	help
-	  Support for Intel/Marvell's PXA2xx/PXA3xx processor line.
-
 config ARCH_RPC
 	bool "RiscPC"
 	depends on !CC_IS_CLANG && GCC_VERSION < 90100 && GCC_VERSION >= 60000
diff --git a/arch/arm/configs/am200epdkit_defconfig b/arch/arm/configs/am200epdkit_defconfig
index 4e49d6cb2f62..9252ce0e722b 100644
--- a/arch/arm/configs/am200epdkit_defconfig
+++ b/arch/arm/configs/am200epdkit_defconfig
@@ -10,6 +10,7 @@ CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
+# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_ARCH_GUMSTIX=y
 CONFIG_PCCARD=y
diff --git a/arch/arm/configs/cm_x300_defconfig b/arch/arm/configs/cm_x300_defconfig
index 45769d0ddd4e..bb0fcd82d2a7 100644
--- a/arch/arm/configs/cm_x300_defconfig
+++ b/arch/arm/configs/cm_x300_defconfig
@@ -10,6 +10,7 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
+# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_GPIO_PCA953X=y
 CONFIG_MACH_CM_X300=y
diff --git a/arch/arm/configs/colibri_pxa270_defconfig b/arch/arm/configs/colibri_pxa270_defconfig
index 52bad9a544a0..b29898fd6a12 100644
--- a/arch/arm/configs/colibri_pxa270_defconfig
+++ b/arch/arm/configs/colibri_pxa270_defconfig
@@ -16,6 +16,7 @@ CONFIG_MODULE_FORCE_UNLOAD=y
 CONFIG_MODVERSIONS=y
 CONFIG_MODULE_SRCVERSION_ALL=y
 # CONFIG_BLK_DEV_BSG is not set
+# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_MACH_COLIBRI=y
 CONFIG_PREEMPT=y
diff --git a/arch/arm/configs/colibri_pxa300_defconfig b/arch/arm/configs/colibri_pxa300_defconfig
index 26e5a67f8e2d..f9d110294644 100644
--- a/arch/arm/configs/colibri_pxa300_defconfig
+++ b/arch/arm/configs/colibri_pxa300_defconfig
@@ -1,6 +1,7 @@
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
+# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_MACH_COLIBRI300=y
 CONFIG_AEABI=y
diff --git a/arch/arm/configs/corgi_defconfig b/arch/arm/configs/corgi_defconfig
index 15b749f6996d..96c677c98bc7 100644
--- a/arch/arm/configs/corgi_defconfig
+++ b/arch/arm/configs/corgi_defconfig
@@ -9,6 +9,7 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
+# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_PXA_SHARPSL=y
 CONFIG_MACH_POODLE=y
diff --git a/arch/arm/configs/eseries_pxa_defconfig b/arch/arm/configs/eseries_pxa_defconfig
index 046f4dc2e18e..2146adc1825e 100644
--- a/arch/arm/configs/eseries_pxa_defconfig
+++ b/arch/arm/configs/eseries_pxa_defconfig
@@ -9,6 +9,7 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
+# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_ARCH_PXA_ESERIES=y
 # CONFIG_ARM_THUMB is not set
diff --git a/arch/arm/configs/ezx_defconfig b/arch/arm/configs/ezx_defconfig
index 0788a892e160..5d000c8be44e 100644
--- a/arch/arm/configs/ezx_defconfig
+++ b/arch/arm/configs/ezx_defconfig
@@ -14,6 +14,7 @@ CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
 CONFIG_MODVERSIONS=y
 # CONFIG_BLK_DEV_BSG is not set
+# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_PXA_EZX=y
 CONFIG_NO_HZ=y
diff --git a/arch/arm/configs/h5000_defconfig b/arch/arm/configs/h5000_defconfig
index f5a338fefda8..a67d6020aee5 100644
--- a/arch/arm/configs/h5000_defconfig
+++ b/arch/arm/configs/h5000_defconfig
@@ -10,6 +10,7 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
+# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_MACH_H5000=y
 CONFIG_AEABI=y
diff --git a/arch/arm/configs/imote2_defconfig b/arch/arm/configs/imote2_defconfig
index 015b7ef237de..c056fe29d300 100644
--- a/arch/arm/configs/imote2_defconfig
+++ b/arch/arm/configs/imote2_defconfig
@@ -13,6 +13,7 @@ CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
 CONFIG_MODVERSIONS=y
 # CONFIG_BLK_DEV_BSG is not set
+# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_MACH_INTELMOTE2=y
 CONFIG_NO_HZ=y
diff --git a/arch/arm/configs/lpd270_defconfig b/arch/arm/configs/lpd270_defconfig
index 3a4d0e64cd6e..5c0a671ed294 100644
--- a/arch/arm/configs/lpd270_defconfig
+++ b/arch/arm/configs/lpd270_defconfig
@@ -2,6 +2,7 @@ CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_SLAB=y
 CONFIG_MODULES=y
+# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_MACH_LOGICPD_PXA270=y
 # CONFIG_ARM_THUMB is not set
diff --git a/arch/arm/configs/lubbock_defconfig b/arch/arm/configs/lubbock_defconfig
index 4ce2da2e76fa..cf49dc1629a7 100644
--- a/arch/arm/configs/lubbock_defconfig
+++ b/arch/arm/configs/lubbock_defconfig
@@ -1,6 +1,7 @@
 CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_MODULES=y
+# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_ARCH_LUBBOCK=y
 # CONFIG_ARM_THUMB is not set
diff --git a/arch/arm/configs/magician_defconfig b/arch/arm/configs/magician_defconfig
index abde1fb23b20..13da808ffa13 100644
--- a/arch/arm/configs/magician_defconfig
+++ b/arch/arm/configs/magician_defconfig
@@ -9,6 +9,7 @@ CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
+# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_MACH_H4700=y
 CONFIG_MACH_MAGICIAN=y
diff --git a/arch/arm/configs/mainstone_defconfig b/arch/arm/configs/mainstone_defconfig
index 26499b697f9f..03b4c61bdadd 100644
--- a/arch/arm/configs/mainstone_defconfig
+++ b/arch/arm/configs/mainstone_defconfig
@@ -1,6 +1,7 @@
 CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_MODULES=y
+# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_MACH_MAINSTONE=y
 # CONFIG_ARM_THUMB is not set
diff --git a/arch/arm/configs/palmz72_defconfig b/arch/arm/configs/palmz72_defconfig
index b47c8abe85bc..e6acb1d588e2 100644
--- a/arch/arm/configs/palmz72_defconfig
+++ b/arch/arm/configs/palmz72_defconfig
@@ -7,6 +7,7 @@ CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
+# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_ARCH_PXA_PALM=y
 # CONFIG_MACH_PALMTX is not set
diff --git a/arch/arm/configs/pcm027_defconfig b/arch/arm/configs/pcm027_defconfig
index e97a158081fc..106d5bef48e2 100644
--- a/arch/arm/configs/pcm027_defconfig
+++ b/arch/arm/configs/pcm027_defconfig
@@ -13,6 +13,7 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
+# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_MACH_PCM027=y
 CONFIG_MACH_PCM990_BASEBOARD=y
diff --git a/arch/arm/configs/pxa255-idp_defconfig b/arch/arm/configs/pxa255-idp_defconfig
index 4a383afa5e87..5663245e9534 100644
--- a/arch/arm/configs/pxa255-idp_defconfig
+++ b/arch/arm/configs/pxa255-idp_defconfig
@@ -1,6 +1,7 @@
 CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_MODULES=y
+# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_ARCH_PXA_IDP=y
 # CONFIG_ARM_THUMB is not set
diff --git a/arch/arm/configs/pxa3xx_defconfig b/arch/arm/configs/pxa3xx_defconfig
index f0c34017f2aa..228d4271748b 100644
--- a/arch/arm/configs/pxa3xx_defconfig
+++ b/arch/arm/configs/pxa3xx_defconfig
@@ -6,6 +6,7 @@ CONFIG_KALLSYMS_ALL=y
 CONFIG_SLAB=y
 CONFIG_MODULES=y
 # CONFIG_BLK_DEV_BSG is not set
+# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_MACH_LITTLETON=y
 CONFIG_MACH_TAVOREVB=y
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index 29b1f192afbb..1db70dfd32d2 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -23,6 +23,7 @@ CONFIG_MODULE_SRCVERSION_ALL=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_LDM_PARTITION=y
 CONFIG_CMDLINE_PARTITION=y
+# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_ARCH_LUBBOCK=y
 CONFIG_MACH_MAINSTONE=y
diff --git a/arch/arm/configs/spitz_defconfig b/arch/arm/configs/spitz_defconfig
index f42c7a502b6e..43d079ee342a 100644
--- a/arch/arm/configs/spitz_defconfig
+++ b/arch/arm/configs/spitz_defconfig
@@ -9,6 +9,7 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
+# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_PXA_SHARPSL=y
 CONFIG_MACH_AKITA=y
diff --git a/arch/arm/configs/trizeps4_defconfig b/arch/arm/configs/trizeps4_defconfig
index d66f0c287d41..baeba4667e9b 100644
--- a/arch/arm/configs/trizeps4_defconfig
+++ b/arch/arm/configs/trizeps4_defconfig
@@ -14,6 +14,7 @@ CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
 CONFIG_MODVERSIONS=y
 CONFIG_MODULE_SRCVERSION_ALL=y
+# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_TRIZEPS_PXA=y
 CONFIG_MACH_TRIZEPS4=y
diff --git a/arch/arm/configs/viper_defconfig b/arch/arm/configs/viper_defconfig
index c28539bfd128..7c1029716ea5 100644
--- a/arch/arm/configs/viper_defconfig
+++ b/arch/arm/configs/viper_defconfig
@@ -9,6 +9,7 @@ CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
+# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_ARCH_VIPER=y
 CONFIG_IWMMXT=y
diff --git a/arch/arm/configs/xcep_defconfig b/arch/arm/configs/xcep_defconfig
index 4d8e7f2eaef7..3752672f980e 100644
--- a/arch/arm/configs/xcep_defconfig
+++ b/arch/arm/configs/xcep_defconfig
@@ -19,6 +19,7 @@ CONFIG_MODULE_UNLOAD=y
 CONFIG_MODVERSIONS=y
 CONFIG_MODULE_SRCVERSION_ALL=y
 # CONFIG_BLOCK is not set
+# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_MACH_XCEP=y
 CONFIG_IWMMXT=y
diff --git a/arch/arm/configs/zeus_defconfig b/arch/arm/configs/zeus_defconfig
index 25bb6995f105..03a12fb51259 100644
--- a/arch/arm/configs/zeus_defconfig
+++ b/arch/arm/configs/zeus_defconfig
@@ -4,6 +4,7 @@ CONFIG_LOG_BUF_SHIFT=13
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
+# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_MACH_ARCOM_ZEUS=y
 CONFIG_PCCARD=m
diff --git a/arch/arm/mach-pxa/Kconfig b/arch/arm/mach-pxa/Kconfig
index 57f0be4065c1..d2cea239fe13 100644
--- a/arch/arm/mach-pxa/Kconfig
+++ b/arch/arm/mach-pxa/Kconfig
@@ -1,4 +1,18 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menuconfig ARCH_PXA
+	bool "PXA2xx/PXA3xx-based"
+	depends on ARCH_MULTI_V5
+	select ARM_CPU_SUSPEND if PM
+	select CLKSRC_PXA
+	select CLKSRC_MMIO
+	select TIMER_OF
+	select CPU_XSCALE if !CPU_XSC3
+	select GPIO_PXA
+	select GPIOLIB
+	select PLAT_PXA
+	help
+	  Support for Intel/Marvell's PXA2xx/PXA3xx processor line.
+
 if ARCH_PXA
 
 menu "Intel PXA2xx/PXA3xx Implementations"
diff --git a/arch/arm/mach-pxa/Makefile.boot b/arch/arm/mach-pxa/Makefile.boot
deleted file mode 100644
index bb6e353ecf06..000000000000
--- a/arch/arm/mach-pxa/Makefile.boot
+++ /dev/null
@@ -1,3 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-   zreladdr-y	+= 0xa0008000
-
diff --git a/arch/arm/mach-pxa/include/mach/uncompress.h b/arch/arm/mach-pxa/include/mach/uncompress.h
deleted file mode 100644
index 1ed629e38ce6..000000000000
--- a/arch/arm/mach-pxa/include/mach/uncompress.h
+++ /dev/null
@@ -1,70 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * arch/arm/mach-pxa/include/mach/uncompress.h
- *
- * Author:	Nicolas Pitre
- * Copyright:	(C) 2001 MontaVista Software Inc.
- */
-
-#include <linux/serial_reg.h>
-#include <asm/mach-types.h>
-
-#define FFUART_BASE	(0x40100000)
-#define BTUART_BASE	(0x40200000)
-#define STUART_BASE	(0x40700000)
-
-unsigned long uart_base;
-unsigned int uart_shift;
-unsigned int uart_is_pxa;
-
-static inline unsigned char uart_read(int offset)
-{
-	return *(volatile unsigned char *)(uart_base + (offset << uart_shift));
-}
-
-static inline void uart_write(unsigned char val, int offset)
-{
-	*(volatile unsigned char *)(uart_base + (offset << uart_shift)) = val;
-}
-
-static inline int uart_is_enabled(void)
-{
-	/* assume enabled by default for non-PXA uarts */
-	return uart_is_pxa ? uart_read(UART_IER) & UART_IER_UUE : 1;
-}
-
-static inline void putc(char c)
-{
-	if (!uart_is_enabled())
-		return;
-
-	while (!(uart_read(UART_LSR) & UART_LSR_THRE))
-		barrier();
-
-	uart_write(c, UART_TX);
-}
-
-/*
- * This does not append a newline
- */
-static inline void flush(void)
-{
-}
-
-static inline void arch_decomp_setup(void)
-{
-	/* initialize to default */
-	uart_base = FFUART_BASE;
-	uart_shift = 2;
-	uart_is_pxa = 1;
-
-	if (machine_is_littleton() ||  machine_is_csb726() ||
-	    machine_is_cm_x300() || machine_is_balloon3())
-		uart_base = STUART_BASE;
-
-	if (machine_is_arcom_zeus()) {
-		uart_base = 0x10000000;	/* nCS4 */
-		uart_shift = 1;
-		uart_is_pxa = 0;
-	}
-}
-- 
2.29.2

