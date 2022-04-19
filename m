Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E578E506DAC
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12A410EF3A;
	Tue, 19 Apr 2022 13:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA4810EF3A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:39:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C313A61481;
 Tue, 19 Apr 2022 13:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2380AC385A8;
 Tue, 19 Apr 2022 13:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375549;
 bh=vO/bPd1PQ9hX0L2CV68DjG3d21RjoFDCbeNW9JFFn4s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i/7k/0F4r+E1Ur3z329l1Cj5g6ftB8oHQwHSKR1c5qv5Sg7DTH6Yfai9kN/3xqIG2
 6IN+CC95Vy2J9Ecwiqu9jWLiRWHVIRsEYbraSEFksjcs4ejGoj4CLQt1bPvfSrevg1
 Yq0O4PA1y1h2ip/jGL8GEaPuT5rLYGT2eKrRRFBMDLn3T+XmQZzgJHZaYZjmp5Ifqh
 zPEF1FobgULdceNOjlrrAVUkcHB8AklSGR/iVkkqLtnOeADz098ACszzEAEOTLv0jD
 wNQhDFHsfHDookQXljdeMUAjhviMzHxOZBk30q/fEeERal0vp7CC5caie0j1VqHLTj
 MLWQvzBYRx05A==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 12/41] usb: omap: avoid mach/*.h headers
Date: Tue, 19 Apr 2022 15:36:54 +0200
Message-Id: <20220419133723.1394715-13-arnd@kernel.org>
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
 Felipe Balbi <felipe.balbi@linux.intel.com>, Kevin Hilman <khilman@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>,
 Paul Walmsley <paul@pwsan.com>, Jingoo Han <jingoohan1@gmail.com>,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The omap usb drivers still rely on mach/*.h headers that
are explicitly or implicitly included, but all the required
definitions are now in include/linux/soc/ti/, so use those
instead and allow compile-testing on other architectures.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/usb/gadget/udc/Kconfig     | 2 +-
 drivers/usb/gadget/udc/omap_udc.c  | 2 ++
 drivers/usb/host/Kconfig           | 2 +-
 drivers/usb/host/ohci-omap.c       | 7 +++----
 drivers/usb/phy/Kconfig            | 3 ++-
 drivers/usb/phy/phy-isp1301-omap.c | 4 ++--
 6 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index 69394dc1cdfb..cee934dce4f0 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -128,7 +128,7 @@ config USB_GR_UDC
 
 config USB_OMAP
 	tristate "OMAP USB Device Controller"
-	depends on ARCH_OMAP1
+	depends on ARCH_OMAP1 || (ARCH_OMAP && COMPILE_TEST)
 	depends on ISP1301_OMAP || !(MACH_OMAP_H2 || MACH_OMAP_H3)
 	help
 	   Many Texas Instruments OMAP processors have flexible full
diff --git a/drivers/usb/gadget/udc/omap_udc.c b/drivers/usb/gadget/udc/omap_udc.c
index b1da584585cf..5096d24915ce 100644
--- a/drivers/usb/gadget/udc/omap_udc.c
+++ b/drivers/usb/gadget/udc/omap_udc.c
@@ -43,6 +43,8 @@
 #include <linux/platform_data/usb-omap1.h>
 
 #include <linux/soc/ti/omap1-usb.h>
+#include <linux/soc/ti/omap1-soc.h>
+#include <linux/soc/ti/omap1-io.h>
 
 #include "omap_udc.h"
 
diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 57ca5f97a3dc..682b3d2da623 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -214,7 +214,7 @@ config USB_EHCI_HCD_NPCM7XX
 
 config USB_EHCI_HCD_OMAP
 	tristate "EHCI support for OMAP3 and later chips"
-	depends on ARCH_OMAP
+	depends on ARCH_OMAP || COMPILE_TEST
 	depends on NOP_USB_XCEIV
 	default y
 	help
diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
index 7be1ffefc40e..750a90c41a0a 100644
--- a/drivers/usb/host/ohci-omap.c
+++ b/drivers/usb/host/ohci-omap.c
@@ -27,6 +27,9 @@
 #include <linux/platform_device.h>
 #include <linux/platform_data/usb-omap1.h>
 #include <linux/soc/ti/omap1-usb.h>
+#include <linux/soc/ti/omap1-mux.h>
+#include <linux/soc/ti/omap1-soc.h>
+#include <linux/soc/ti/omap1-io.h>
 #include <linux/signal.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
@@ -36,10 +39,6 @@
 #include <asm/io.h>
 #include <asm/mach-types.h>
 
-#include <mach/mux.h>
-
-#include <mach/hardware.h>
-
 #define DRIVER_DESC "OHCI OMAP driver"
 
 struct ohci_omap_priv {
diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
index 52eebcb88c1f..2acbe41fbf7e 100644
--- a/drivers/usb/phy/Kconfig
+++ b/drivers/usb/phy/Kconfig
@@ -30,7 +30,8 @@ config FSL_USB2_OTG
 
 config ISP1301_OMAP
 	tristate "Philips ISP1301 with OMAP OTG"
-	depends on I2C && ARCH_OMAP_OTG
+	depends on I2C
+	depends on ARCH_OMAP_OTG || (ARM && COMPILE_TEST)
 	depends on USB
 	depends on USB_GADGET || !USB_GADGET # if USB_GADGET=m, this can't be 'y'
 	select USB_PHY
diff --git a/drivers/usb/phy/phy-isp1301-omap.c b/drivers/usb/phy/phy-isp1301-omap.c
index 88aade82b82b..f8bd93fe69cd 100644
--- a/drivers/usb/phy/phy-isp1301-omap.c
+++ b/drivers/usb/phy/phy-isp1301-omap.c
@@ -23,9 +23,9 @@
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
-#include <mach/mux.h>
-
+#include <linux/soc/ti/omap1-mux.h>
 #include <linux/soc/ti/omap1-usb.h>
+#include <linux/soc/ti/omap1-io.h>
 
 #undef VERBOSE
 
-- 
2.29.2

