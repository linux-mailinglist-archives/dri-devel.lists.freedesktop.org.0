Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC45506DA6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 628C689FFD;
	Tue, 19 Apr 2022 13:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C189189F41
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:38:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3F24B616B4;
 Tue, 19 Apr 2022 13:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34216C385AF;
 Tue, 19 Apr 2022 13:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375511;
 bh=Np8s2Gyq1pdxV543cfr46FIWCXKZK9Cd/nCYrVx5ojg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u5Gaksw3FT9LBCaZ1FZNe8UJOhDf4P4PqbufxWi5GEe7OYntcB42H8c3bgHyO62oB
 YAdwuypnRsFBzvZg/CQTzl0wpdrX8smgAmy4Xvzmeeb+gSSG7VJHhtngUJtirQ4aQE
 kwOJRGQhqx1bnHTdmxQ9qWFSM1cfG749KVfrvCdIABwperZeQJ/HBUXbNskkLz5tWu
 HhZFFoyzK0SPPg2WPkbJsQ35m2A5fj9NvteJg7sZ7/2EkTy16rcBdWSylBLHQPT42w
 3ZiJ+HedXTHY49GMokr8k6po2meO2DCSaIcFBOZ4tfeeJFIP4Xetmxwter86nvYge4
 1E6rtQNCe70CQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 07/41] ARM: omap1: move mach/usb.h to include/linux/soc
Date: Tue, 19 Apr 2022 15:36:49 +0200
Message-Id: <20220419133723.1394715-8-arnd@kernel.org>
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
 dmaengine@vger.kernel.org, alsa-devel@alsa-project.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The register definitions in this header are used in at least four
different places, with little hope of completely cleaning that up.

Split up the file into a portion that becomes a linux-wide header
under include/linux/soc/ti/, and the parts that are actually only
needed by board files.

Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/board-ams-delta.c         |  2 +-
 arch/arm/mach-omap1/board-generic.c           |  2 +-
 arch/arm/mach-omap1/board-h2.c                |  2 +-
 arch/arm/mach-omap1/board-h3.c                |  2 +-
 arch/arm/mach-omap1/board-htcherald.c         |  2 +-
 arch/arm/mach-omap1/board-innovator.c         |  2 +-
 arch/arm/mach-omap1/board-nokia770.c          |  2 +-
 arch/arm/mach-omap1/board-osk.c               |  2 +-
 arch/arm/mach-omap1/board-palmte.c            |  2 +-
 arch/arm/mach-omap1/board-palmtt.c            |  2 +-
 arch/arm/mach-omap1/board-palmz71.c           |  2 +-
 arch/arm/mach-omap1/board-sx1.c               |  2 +-
 arch/arm/mach-omap1/clock_data.c              |  2 +-
 arch/arm/mach-omap1/usb.c                     |  2 +-
 arch/arm/mach-omap1/usb.h                     | 25 +++++++++++++++++
 drivers/usb/gadget/udc/omap_udc.c             |  3 +-
 drivers/usb/host/ohci-omap.c                  |  4 +--
 drivers/usb/phy/phy-isp1301-omap.c            |  2 +-
 .../usb.h => include/linux/soc/ti/omap1-usb.h | 28 ++++++-------------
 19 files changed, 52 insertions(+), 38 deletions(-)
 create mode 100644 arch/arm/mach-omap1/usb.h
 rename arch/arm/mach-omap1/include/mach/usb.h => include/linux/soc/ti/omap1-usb.h (86%)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index 12d61ad98395..5b0e99319990 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -38,7 +38,7 @@
 #include <mach/mux.h>
 
 #include <mach/hardware.h>
-#include <mach/usb.h>
+#include "usb.h"
 
 #include "ams-delta-fiq.h"
 #include "board-ams-delta.h"
diff --git a/arch/arm/mach-omap1/board-generic.c b/arch/arm/mach-omap1/board-generic.c
index c62554990115..8ef0a9b17e92 100644
--- a/arch/arm/mach-omap1/board-generic.c
+++ b/arch/arm/mach-omap1/board-generic.c
@@ -21,7 +21,7 @@
 
 #include <mach/mux.h>
 
-#include <mach/usb.h>
+#include "usb.h"
 
 #include "common.h"
 
diff --git a/arch/arm/mach-omap1/board-h2.c b/arch/arm/mach-omap1/board-h2.c
index 977b0b744c22..b8cf0d84f8ab 100644
--- a/arch/arm/mach-omap1/board-h2.c
+++ b/arch/arm/mach-omap1/board-h2.c
@@ -42,7 +42,7 @@
 #include "flash.h"
 
 #include <mach/hardware.h>
-#include <mach/usb.h>
+#include "usb.h"
 
 #include "common.h"
 #include "board-h2.h"
diff --git a/arch/arm/mach-omap1/board-h3.c b/arch/arm/mach-omap1/board-h3.c
index 4249984f9c30..86260498c344 100644
--- a/arch/arm/mach-omap1/board-h3.c
+++ b/arch/arm/mach-omap1/board-h3.c
@@ -45,7 +45,7 @@
 
 #include <mach/hardware.h>
 #include <mach/irqs.h>
-#include <mach/usb.h>
+#include "usb.h"
 
 #include "common.h"
 #include "board-h3.h"
diff --git a/arch/arm/mach-omap1/board-htcherald.c b/arch/arm/mach-omap1/board-htcherald.c
index 258304edf23e..f7220b60eb61 100644
--- a/arch/arm/mach-omap1/board-htcherald.c
+++ b/arch/arm/mach-omap1/board-htcherald.c
@@ -31,7 +31,7 @@
 #include "mmc.h"
 
 #include <mach/irqs.h>
-#include <mach/usb.h>
+#include "usb.h"
 
 #include "common.h"
 
diff --git a/arch/arm/mach-omap1/board-innovator.c b/arch/arm/mach-omap1/board-innovator.c
index 2425f1bacb33..e7d6735d4701 100644
--- a/arch/arm/mach-omap1/board-innovator.c
+++ b/arch/arm/mach-omap1/board-innovator.c
@@ -34,7 +34,7 @@
 #include <linux/platform_data/keypad-omap.h>
 
 #include <mach/hardware.h>
-#include <mach/usb.h>
+#include "usb.h"
 
 #include "iomap.h"
 #include "common.h"
diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/board-nokia770.c
index 11511ae2e0a2..e43c852103f5 100644
--- a/arch/arm/mach-omap1/board-nokia770.c
+++ b/arch/arm/mach-omap1/board-nokia770.c
@@ -31,7 +31,7 @@
 #include <mach/mux.h>
 
 #include <mach/hardware.h>
-#include <mach/usb.h>
+#include "usb.h"
 
 #include "common.h"
 #include "clock.h"
diff --git a/arch/arm/mach-omap1/board-osk.c b/arch/arm/mach-omap1/board-osk.c
index e18b6f13300e..b627a4351cf0 100644
--- a/arch/arm/mach-omap1/board-osk.c
+++ b/arch/arm/mach-omap1/board-osk.c
@@ -52,7 +52,7 @@
 #include <mach/tc.h>
 
 #include <mach/hardware.h>
-#include <mach/usb.h>
+#include "usb.h"
 
 #include "common.h"
 
diff --git a/arch/arm/mach-omap1/board-palmte.c b/arch/arm/mach-omap1/board-palmte.c
index ce6f0fcd9d12..4ac981c5cf74 100644
--- a/arch/arm/mach-omap1/board-palmte.c
+++ b/arch/arm/mach-omap1/board-palmte.c
@@ -38,7 +38,7 @@
 #include <linux/platform_data/keypad-omap.h>
 
 #include <mach/hardware.h>
-#include <mach/usb.h>
+#include "usb.h"
 
 #include "mmc.h"
 #include "common.h"
diff --git a/arch/arm/mach-omap1/board-palmtt.c b/arch/arm/mach-omap1/board-palmtt.c
index 8a08311c4e05..e48ae5fbe1b1 100644
--- a/arch/arm/mach-omap1/board-palmtt.c
+++ b/arch/arm/mach-omap1/board-palmtt.c
@@ -38,7 +38,7 @@
 #include <linux/platform_data/keypad-omap.h>
 
 #include <mach/hardware.h>
-#include <mach/usb.h>
+#include "usb.h"
 
 #include "common.h"
 
diff --git a/arch/arm/mach-omap1/board-palmz71.c b/arch/arm/mach-omap1/board-palmz71.c
index 034e5bc6a029..37db0ab31528 100644
--- a/arch/arm/mach-omap1/board-palmz71.c
+++ b/arch/arm/mach-omap1/board-palmz71.c
@@ -40,7 +40,7 @@
 #include <linux/platform_data/keypad-omap.h>
 
 #include <mach/hardware.h>
-#include <mach/usb.h>
+#include "usb.h"
 
 #include "common.h"
 
diff --git a/arch/arm/mach-omap1/board-sx1.c b/arch/arm/mach-omap1/board-sx1.c
index bb9ec345e204..0965b1b689ec 100644
--- a/arch/arm/mach-omap1/board-sx1.c
+++ b/arch/arm/mach-omap1/board-sx1.c
@@ -38,7 +38,7 @@
 #include "board-sx1.h"
 
 #include <mach/hardware.h>
-#include <mach/usb.h>
+#include "usb.h"
 
 #include "common.h"
 
diff --git a/arch/arm/mach-omap1/clock_data.c b/arch/arm/mach-omap1/clock_data.c
index 3ebcd96efbff..ef46c5f67cf9 100644
--- a/arch/arm/mach-omap1/clock_data.c
+++ b/arch/arm/mach-omap1/clock_data.c
@@ -22,7 +22,7 @@
 #include "soc.h"
 
 #include <mach/hardware.h>
-#include <mach/usb.h>   /* for OTG_BASE */
+#include "usb.h"   /* for OTG_BASE */
 
 #include "iomap.h"
 #include "clock.h"
diff --git a/arch/arm/mach-omap1/usb.c b/arch/arm/mach-omap1/usb.c
index e60831c82b78..fa658054fc57 100644
--- a/arch/arm/mach-omap1/usb.c
+++ b/arch/arm/mach-omap1/usb.c
@@ -17,7 +17,7 @@
 
 #include <mach/mux.h>
 
-#include <mach/usb.h>
+#include "usb.h"
 
 #include "common.h"
 
diff --git a/arch/arm/mach-omap1/usb.h b/arch/arm/mach-omap1/usb.h
new file mode 100644
index 000000000000..08c9344c46e3
--- /dev/null
+++ b/arch/arm/mach-omap1/usb.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * fixme correct answer depends on hmc_mode,
+ * as does (on omap1) any nonzero value for config->otg port number
+ */
+#include <linux/platform_data/usb-omap1.h>
+#include <linux/soc/ti/omap1-usb.h>
+
+#if IS_ENABLED(CONFIG_USB_OMAP)
+#define	is_usb0_device(config)	1
+#else
+#define	is_usb0_device(config)	0
+#endif
+
+#if IS_ENABLED(CONFIG_USB_SUPPORT)
+void omap1_usb_init(struct omap_usb_config *pdata);
+#else
+static inline void omap1_usb_init(struct omap_usb_config *pdata)
+{
+}
+#endif
+
+#define OMAP1_OHCI_BASE			0xfffba000
+#define OMAP2_OHCI_BASE			0x4805e000
+#define OMAP_OHCI_BASE			OMAP1_OHCI_BASE
diff --git a/drivers/usb/gadget/udc/omap_udc.c b/drivers/usb/gadget/udc/omap_udc.c
index 2d9815dad2ff..b1da584585cf 100644
--- a/drivers/usb/gadget/udc/omap_udc.c
+++ b/drivers/usb/gadget/udc/omap_udc.c
@@ -40,8 +40,9 @@
 #include <asm/mach-types.h>
 
 #include <linux/omap-dma.h>
+#include <linux/platform_data/usb-omap1.h>
 
-#include <mach/usb.h>
+#include <linux/soc/ti/omap1-usb.h>
 
 #include "omap_udc.h"
 
diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
index 45dcf8292072..7be1ffefc40e 100644
--- a/drivers/usb/host/ohci-omap.c
+++ b/drivers/usb/host/ohci-omap.c
@@ -25,6 +25,8 @@
 #include <linux/module.h>
 #include <linux/usb/otg.h>
 #include <linux/platform_device.h>
+#include <linux/platform_data/usb-omap1.h>
+#include <linux/soc/ti/omap1-usb.h>
 #include <linux/signal.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
@@ -37,8 +39,6 @@
 #include <mach/mux.h>
 
 #include <mach/hardware.h>
-#include <mach/usb.h>
-
 
 #define DRIVER_DESC "OHCI OMAP driver"
 
diff --git a/drivers/usb/phy/phy-isp1301-omap.c b/drivers/usb/phy/phy-isp1301-omap.c
index 190699b38b41..88aade82b82b 100644
--- a/drivers/usb/phy/phy-isp1301-omap.c
+++ b/drivers/usb/phy/phy-isp1301-omap.c
@@ -25,7 +25,7 @@
 
 #include <mach/mux.h>
 
-#include <mach/usb.h>
+#include <linux/soc/ti/omap1-usb.h>
 
 #undef VERBOSE
 
diff --git a/arch/arm/mach-omap1/include/mach/usb.h b/include/linux/soc/ti/omap1-usb.h
similarity index 86%
rename from arch/arm/mach-omap1/include/mach/usb.h
rename to include/linux/soc/ti/omap1-usb.h
index 5429d86c7190..67488698601a 100644
--- a/arch/arm/mach-omap1/include/mach/usb.h
+++ b/include/linux/soc/ti/omap1-usb.h
@@ -1,34 +1,20 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __SOC_TI_OMAP1_USB
+#define __SOC_TI_OMAP1_USB
 /*
- * FIXME correct answer depends on hmc_mode,
- * as does (on omap1) any nonzero value for config->otg port number
+ * Constants in this file are used all over the place, in platform
+ * code, as well as the udc, phy and ohci drivers.
+ * This is not a great design, but unlikely to get fixed after
+ * such a long time. Don't do this elsewhere.
  */
-#if IS_ENABLED(CONFIG_USB_OMAP)
-#define	is_usb0_device(config)	1
-#else
-#define	is_usb0_device(config)	0
-#endif
-
-#include <linux/platform_data/usb-omap1.h>
-
-#if IS_ENABLED(CONFIG_USB_SUPPORT)
-void omap1_usb_init(struct omap_usb_config *pdata);
-#else
-static inline void omap1_usb_init(struct omap_usb_config *pdata)
-{
-}
-#endif
 
 #define OMAP1_OTG_BASE			0xfffb0400
 #define OMAP1_UDC_BASE			0xfffb4000
-#define OMAP1_OHCI_BASE			0xfffba000
 
-#define OMAP2_OHCI_BASE			0x4805e000
 #define OMAP2_UDC_BASE			0x4805e200
 #define OMAP2_OTG_BASE			0x4805e300
 #define OTG_BASE			OMAP1_OTG_BASE
 #define UDC_BASE			OMAP1_UDC_BASE
-#define OMAP_OHCI_BASE			OMAP1_OHCI_BASE
 
 /*
  * OTG and transceiver registers, for OMAPs starting with ARM926
@@ -126,3 +112,5 @@ static inline void omap1_usb_init(struct omap_usb_config *pdata)
 #	define	CONF_USB0_ISOLATE_R	(1 << 3)
 #	define	CONF_USB_PWRDN_DM_R	(1 << 2)
 #	define	CONF_USB_PWRDN_DP_R	(1 << 1)
+
+#endif
-- 
2.29.2

