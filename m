Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9307D225885
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 09:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5194189FDD;
	Mon, 20 Jul 2020 07:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.al2klimov.de (smtp.al2klimov.de
 [IPv6:2a01:4f8:c0c:1465::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C185289D9B
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 20:37:28 +0000 (UTC)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
 by smtp.al2klimov.de (Postfix) with ESMTPA id 2B803BC063;
 Sun, 19 Jul 2020 20:37:20 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: b.zolnierkie@samsung.com, corbet@lwn.net, sam@ravnborg.org, arnd@arndb.de,
 sashal@kernel.org, weh@microsoft.com, michal.simek@xilinx.com,
 paul@crapouillou.net, masahiroy@kernel.org, daniel.vetter@ffwll.ch,
 rdunlap@infradead.org, jani.nikula@intel.com, viresh.kumar@linaro.org,
 Julia.Lawall@inria.fr, linus.walleij@linaro.org, yuehaibing@huawei.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
Subject: [PATCH for v5.9] video: fbdev: Replace HTTP links with HTTPS ones
Date: Sun, 19 Jul 2020 22:37:14 +0200
Message-Id: <20200719203714.61745-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam-Level: *****
Authentication-Results: smtp.al2klimov.de;
 auth=pass smtp.auth=aklimov@al2klimov.de
 smtp.mailfrom=grandmaster@al2klimov.de
X-Mailman-Approved-At: Mon, 20 Jul 2020 07:30:37 +0000
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
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely
 or at least not (just) HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.

 Sorry again to all maintainers who complained about subject lines.
 Now I realized that you want an actually perfect prefixes,
 not just subsystem ones.
 I tried my best...
 And yes, *I could* (at least half-)automate it.
 Impossible is nothing! :)


 Documentation/fb/ep93xx-fb.rst                    | 2 +-
 drivers/video/fbdev/Kconfig                       | 8 ++++----
 drivers/video/fbdev/core/fbmon.c                  | 4 ++--
 drivers/video/fbdev/ep93xx-fb.c                   | 2 +-
 drivers/video/fbdev/grvga.c                       | 2 +-
 drivers/video/fbdev/macfb.c                       | 2 +-
 drivers/video/fbdev/metronomefb.c                 | 2 +-
 drivers/video/fbdev/omap2/omapfb/dss/Kconfig      | 4 ++--
 drivers/video/fbdev/omap2/omapfb/dss/hdmi.h       | 2 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c      | 2 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c | 2 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.h | 2 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.h | 2 +-
 drivers/video/fbdev/sa1100fb.c                    | 2 +-
 14 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/Documentation/fb/ep93xx-fb.rst b/Documentation/fb/ep93xx-fb.rst
index 6f7767926d1a..1dd67f4688c7 100644
--- a/Documentation/fb/ep93xx-fb.rst
+++ b/Documentation/fb/ep93xx-fb.rst
@@ -127,7 +127,7 @@ At least on the EP9315 there is a silicon bug which causes bit 27 of
 the VIDSCRNPAGE (framebuffer physical offset) to be tied low. There is
 an unofficial errata for this bug at::
 
-	http://marc.info/?l=linux-arm-kernel&m=110061245502000&w=2
+	https://marc.info/?l=linux-arm-kernel&m=110061245502000&w=2
 
 By default the EP93xx framebuffer driver checks if the allocated physical
 address has bit 27 set. If it does, then the memory is freed and an
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 0f559aeaf469..f12e390941b8 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -844,7 +844,7 @@ config FB_OPENCORES
 	  systems (e.g. Altera socfpga or Xilinx Zynq) on FPGAs.
 
 	  The source code and specification for the core is available at
-	  <http://opencores.org/project,vga_lcd>
+	  <https://opencores.org/project,vga_lcd>
 
 config FB_S1D13XXX
 	tristate "Epson S1D13XXX framebuffer support"
@@ -855,7 +855,7 @@ config FB_S1D13XXX
 	help
 	  Support for S1D13XXX framebuffer device family (currently only
 	  working with S1D13806). Product specs at
-	  <http://vdc.epson.com/>
+	  <https://vdc.epson.com/>
 
 config FB_ATMEL
 	tristate "AT91 LCD Controller support"
@@ -1213,7 +1213,7 @@ config FB_RADEON
 	  don't need to choose this to run the Radeon in plain VGA mode.
 
 	  There is a product page at
-	  http://products.amd.com/en-us/GraphicCardResult.aspx
+	  https://products.amd.com/en-us/GraphicCardResult.aspx
 
 config FB_RADEON_I2C
 	bool "DDC/I2C for ATI Radeon support"
@@ -1381,7 +1381,7 @@ config FB_SIS
 	help
 	  This is the frame buffer device driver for the SiS 300, 315, 330
 	  and 340 series as well as XGI V3XT, V5, V8, Z7 graphics chipsets.
-	  Specs available at <http://www.sis.com> and <http://www.xgitech.com>.
+	  Specs available at <https://www.sis.com> and <http://www.xgitech.com>.
 
 	  To compile this driver as a module, choose M here; the module
 	  will be called sisfb.
diff --git a/drivers/video/fbdev/core/fbmon.c b/drivers/video/fbdev/core/fbmon.c
index d62a1e43864e..1bf82dbc9e3c 100644
--- a/drivers/video/fbdev/core/fbmon.c
+++ b/drivers/video/fbdev/core/fbmon.c
@@ -19,7 +19,7 @@
  * Generalized Timing Formula is derived from:
  *
  *      GTF Spreadsheet by Andy Morrish (1/5/97)
- *      available at http://www.vesa.org
+ *      available at https://www.vesa.org
  *
  * This file is subject to the terms and conditions of the GNU General Public
  * License.  See the file COPYING in the main directory of this archive
@@ -1201,7 +1201,7 @@ static void fb_timings_dclk(struct __fb_timings *timings)
  * ignored and @var will be filled with the calculated timings.
  *
  * All calculations are based on the VESA GTF Spreadsheet
- * available at VESA's public ftp (http://www.vesa.org).
+ * available at VESA's public ftp (https://www.vesa.org).
  *
  * NOTES:
  * The timings generated by the GTF will be different from VESA
diff --git a/drivers/video/fbdev/ep93xx-fb.c b/drivers/video/fbdev/ep93xx-fb.c
index cda2ef337423..ba33b4dce0df 100644
--- a/drivers/video/fbdev/ep93xx-fb.c
+++ b/drivers/video/fbdev/ep93xx-fb.c
@@ -430,7 +430,7 @@ static int ep93xxfb_alloc_videomem(struct fb_info *info)
 	/*
 	 * There is a bug in the ep93xx framebuffer which causes problems
 	 * if bit 27 of the physical address is set.
-	 * See: http://marc.info/?l=linux-arm-kernel&m=110061245502000&w=2
+	 * See: https://marc.info/?l=linux-arm-kernel&m=110061245502000&w=2
 	 * There does not seem to be any official errata for this, but I
 	 * have confirmed the problem exists on my hardware (ep9315) at
 	 * least.
diff --git a/drivers/video/fbdev/grvga.c b/drivers/video/fbdev/grvga.c
index 07dda03e0957..24818b276241 100644
--- a/drivers/video/fbdev/grvga.c
+++ b/drivers/video/fbdev/grvga.c
@@ -5,7 +5,7 @@
  * 2011 (c) Aeroflex Gaisler AB
  *
  * Full documentation of the core can be found here:
- * http://www.gaisler.com/products/grlib/grip.pdf
+ * https://www.gaisler.com/products/grlib/grip.pdf
  *
  * Contributors: Kristoffer Glembo <kristoffer@gaisler.com>
  */
diff --git a/drivers/video/fbdev/macfb.c b/drivers/video/fbdev/macfb.c
index e05a97662ca8..312e35c9aa6c 100644
--- a/drivers/video/fbdev/macfb.c
+++ b/drivers/video/fbdev/macfb.c
@@ -478,7 +478,7 @@ static int macfb_setcolreg(unsigned regno, unsigned red, unsigned green,
 			break;
 		/*
 		 * 24-bit colour almost doesn't exist on 68k Macs --
-		 * http://support.apple.com/kb/TA28634 (Old Article: 10992)
+		 * https://support.apple.com/kb/TA28634 (Old Article: 10992)
 		 */
 		case 24:
 		case 32:
diff --git a/drivers/video/fbdev/metronomefb.c b/drivers/video/fbdev/metronomefb.c
index a42e2eceee48..952826557a0c 100644
--- a/drivers/video/fbdev/metronomefb.c
+++ b/drivers/video/fbdev/metronomefb.c
@@ -10,7 +10,7 @@
  * Layout is based on skeletonfb.c by James Simmons and Geert Uytterhoeven.
  *
  * This work was made possible by help and equipment support from E-Ink
- * Corporation. http://www.eink.com/
+ * Corporation. https://www.eink.com/
  *
  * This driver is written to be used with the Metronome display controller.
  * It is intended to be architecture independent. A board specific driver
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/Kconfig b/drivers/video/fbdev/omap2/omapfb/dss/Kconfig
index 36b97fee2d57..cc81a19537d2 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/Kconfig
+++ b/drivers/video/fbdev/omap2/omapfb/dss/Kconfig
@@ -60,7 +60,7 @@ config FB_OMAP5_DSS_HDMI
 	select FB_OMAP2_DSS_HDMI_COMMON
 	help
 	  HDMI Interface for OMAP5 and similar cores. This adds the High
-	  Definition Multimedia Interface. See http://www.hdmi.org/ for HDMI
+	  Definition Multimedia Interface. See https://www.hdmi.org/ for HDMI
 	  specification.
 
 config FB_OMAP2_DSS_SDI
@@ -79,7 +79,7 @@ config FB_OMAP2_DSS_DSI
 	  DSI is a high speed half-duplex serial interface between the host
 	  processor and a peripheral, such as a display or a framebuffer chip.
 
-	  See http://www.mipi.org/ for DSI specifications.
+	  See https://www.mipi.org/ for DSI specifications.
 
 config FB_OMAP2_DSS_MIN_FCK_PER_PCK
 	int "Minimum FCK/PCK ratio (for scaling)"
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi.h b/drivers/video/fbdev/omap2/omapfb/dss/hdmi.h
index b9d4480ecfad..9a7253355f6d 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi.h
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi.h
@@ -2,7 +2,7 @@
 /*
  * HDMI driver definition for TI OMAP4 Processor.
  *
- * Copyright (C) 2010-2011 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2010-2011 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 #ifndef _HDMI_H
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
index 7060ae56c062..63262ec06921 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * HDMI interface DSS driver for TI's OMAP4 family of SoCs.
- * Copyright (C) 2010-2011 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2010-2011 Texas Instruments Incorporated - https://www.ti.com/
  * Authors: Yong Zhi
  *	Mythri pk <mythripk@ti.com>
  */
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c
index 6b79b52d5fad..7ca1803bf161 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c
@@ -3,7 +3,7 @@
  * ti_hdmi_4xxx_ip.c
  *
  * HDMI TI81xx, TI38xx, TI OMAP4 etc IP driver Library
- * Copyright (C) 2010-2011 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2010-2011 Texas Instruments Incorporated - https://www.ti.com/
  * Authors: Yong Zhi
  *	Mythri pk <mythripk@ti.com>
  */
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.h b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.h
index f066d1f69132..b5c35277f06e 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.h
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.h
@@ -2,7 +2,7 @@
 /*
  * HDMI header definition for OMAP4 HDMI core IP
  *
- * Copyright (C) 2010-2011 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2010-2011 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 #ifndef _HDMI4_CORE_H_
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.h b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.h
index f10b8a283011..192c9b6e2f7b 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.h
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.h
@@ -2,7 +2,7 @@
 /*
  * HDMI driver definition for TI OMAP5 processors.
  *
- * Copyright (C) 2011-2012 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2011-2012 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 #ifndef _HDMI5_CORE_H_
diff --git a/drivers/video/fbdev/sa1100fb.c b/drivers/video/fbdev/sa1100fb.c
index 3e6e13f7a831..bda6cc313c8b 100644
--- a/drivers/video/fbdev/sa1100fb.c
+++ b/drivers/video/fbdev/sa1100fb.c
@@ -18,7 +18,7 @@
  * Clean patches should be sent to the ARM Linux Patch System.  Please see the
  * following web page for more information:
  *
- *	http://www.arm.linux.org.uk/developer/patches/info.shtml
+ *	https://www.arm.linux.org.uk/developer/patches/info.shtml
  *
  * Thank you.
  *
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
