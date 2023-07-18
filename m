Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD65F757F98
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 16:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF28210E361;
	Tue, 18 Jul 2023 14:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F7910E361
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 14:32:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5E0EC615E3;
 Tue, 18 Jul 2023 14:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03CAAC433C7;
 Tue, 18 Jul 2023 14:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689690750;
 bh=eB/FeB1sGjf+0FZWSPXn/TL4skvhQzrenrp3THkJTqs=;
 h=From:To:Cc:Subject:Date:From;
 b=OpwvZzfjNPNbFB8hdrDTNUGjxZST0VETiSemlpcgT6S0ObyZQaNDKCFEFyr6wzad6
 mj8Dh7rxgfPUaLGBO5tYJyuGkoPHNSKaHtZAEuPyzBdWoYXaeDlmVUoSPBUZ2fv9Ib
 gKLeA5Rl1UqD9eTYDDfJ3xB+TnVuQwKLKALrweTlZzuhadQtjVVPx/hRaIoRmFHagG
 rc9F9ACaR+YwR+OMoTd+BGypKXSPA657ly29AIy5wESJHFbIeDySNncyLMnjGvhVYG
 ULf8yJSAl3lItzYl/8XwlhVKlZ0PHlLZUAkgy0mDjFYCW8J5LUsJLV066ViM81ulUT
 6M/GExQov1tIA==
Received: (nullmailer pid 1067250 invoked by uid 1000);
 Tue, 18 Jul 2023 14:32:28 -0000
From: Rob Herring <robh@kernel.org>
To: Helge Deller <deller@gmx.de>, Michal Simek <michal.simek@amd.com>
Subject: [PATCH v2] fb: Explicitly include correct DT includes
Date: Tue, 18 Jul 2023 08:32:26 -0600
Message-Id: <20230718143227.1067178-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Drop whitespace changes in sbuslib.c
---
 drivers/video/fbdev/bw2.c                                | 3 ++-
 drivers/video/fbdev/cg14.c                               | 3 ++-
 drivers/video/fbdev/cg3.c                                | 3 ++-
 drivers/video/fbdev/cg6.c                                | 3 ++-
 drivers/video/fbdev/ffb.c                                | 3 ++-
 drivers/video/fbdev/grvga.c                              | 3 +--
 drivers/video/fbdev/leo.c                                | 3 ++-
 drivers/video/fbdev/mb862xx/mb862xxfb_accel.c            | 4 +---
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c               | 6 +++---
 drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c | 2 +-
 drivers/video/fbdev/p9100.c                              | 3 ++-
 drivers/video/fbdev/platinumfb.c                         | 4 ++--
 drivers/video/fbdev/sbuslib.c                            | 2 +-
 drivers/video/fbdev/sunxvr1000.c                         | 3 ++-
 drivers/video/fbdev/sunxvr2500.c                         | 2 +-
 drivers/video/fbdev/sunxvr500.c                          | 2 +-
 drivers/video/fbdev/tcx.c                                | 3 ++-
 drivers/video/fbdev/xilinxfb.c                           | 5 ++---
 18 files changed, 31 insertions(+), 26 deletions(-)

diff --git a/drivers/video/fbdev/bw2.c b/drivers/video/fbdev/bw2.c
index 025d663dc6fd..39f438de0d6b 100644
--- a/drivers/video/fbdev/bw2.c
+++ b/drivers/video/fbdev/bw2.c
@@ -17,7 +17,8 @@
 #include <linux/init.h>
 #include <linux/fb.h>
 #include <linux/mm.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 #include <asm/io.h>
 #include <asm/fbio.h>
diff --git a/drivers/video/fbdev/cg14.c b/drivers/video/fbdev/cg14.c
index 832a82f45c80..90fdc9d9bf5a 100644
--- a/drivers/video/fbdev/cg14.c
+++ b/drivers/video/fbdev/cg14.c
@@ -17,7 +17,8 @@
 #include <linux/fb.h>
 #include <linux/mm.h>
 #include <linux/uaccess.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 #include <asm/io.h>
 #include <asm/fbio.h>
diff --git a/drivers/video/fbdev/cg3.c b/drivers/video/fbdev/cg3.c
index 6335cd364c74..98c60f72046a 100644
--- a/drivers/video/fbdev/cg3.c
+++ b/drivers/video/fbdev/cg3.c
@@ -17,7 +17,8 @@
 #include <linux/init.h>
 #include <linux/fb.h>
 #include <linux/mm.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 #include <asm/io.h>
 #include <asm/fbio.h>
diff --git a/drivers/video/fbdev/cg6.c b/drivers/video/fbdev/cg6.c
index 6884572efea1..6427b85f1a94 100644
--- a/drivers/video/fbdev/cg6.c
+++ b/drivers/video/fbdev/cg6.c
@@ -17,7 +17,8 @@
 #include <linux/init.h>
 #include <linux/fb.h>
 #include <linux/mm.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 #include <asm/io.h>
 #include <asm/fbio.h>
diff --git a/drivers/video/fbdev/ffb.c b/drivers/video/fbdev/ffb.c
index c6d3111dcbb0..c473841eb6ff 100644
--- a/drivers/video/fbdev/ffb.c
+++ b/drivers/video/fbdev/ffb.c
@@ -16,7 +16,8 @@
 #include <linux/fb.h>
 #include <linux/mm.h>
 #include <linux/timer.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 #include <asm/io.h>
 #include <asm/upa.h>
diff --git a/drivers/video/fbdev/grvga.c b/drivers/video/fbdev/grvga.c
index 9aa15be29ea9..d4a9a58b3691 100644
--- a/drivers/video/fbdev/grvga.c
+++ b/drivers/video/fbdev/grvga.c
@@ -12,8 +12,7 @@
 
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
-#include <linux/of_platform.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/string.h>
diff --git a/drivers/video/fbdev/leo.c b/drivers/video/fbdev/leo.c
index 3ffc0a725f89..89ca48235dbe 100644
--- a/drivers/video/fbdev/leo.c
+++ b/drivers/video/fbdev/leo.c
@@ -16,8 +16,9 @@
 #include <linux/init.h>
 #include <linux/fb.h>
 #include <linux/mm.h>
-#include <linux/of_device.h>
 #include <linux/io.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 #include <asm/fbio.h>
 
diff --git a/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c b/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c
index 61aed7fc0b8d..c35a7479fbf2 100644
--- a/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c
+++ b/drivers/video/fbdev/mb862xx/mb862xxfb_accel.c
@@ -15,9 +15,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
-#if defined(CONFIG_OF)
-#include <linux/of_platform.h>
-#endif
+
 #include "mb862xxfb.h"
 #include "mb862xx_reg.h"
 #include "mb862xxfb_accel.h"
diff --git a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
index b5c8fcab9940..9dc347d163cf 100644
--- a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
+++ b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
@@ -18,11 +18,11 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/pci.h>
-#if defined(CONFIG_OF)
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
-#endif
+#include <linux/platform_device.h>
+
 #include "mb862xxfb.h"
 #include "mb862xx_reg.h"
 
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
index ba94a0a7bd4f..77fce1223a64 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
@@ -15,12 +15,12 @@
 #include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/jiffies.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/sched/signal.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
-#include <linux/of_device.h>
 
 #include <video/omapfb_dss.h>
 #include <video/mipi_display.h>
diff --git a/drivers/video/fbdev/p9100.c b/drivers/video/fbdev/p9100.c
index 0876962c52eb..e2e747cae9b1 100644
--- a/drivers/video/fbdev/p9100.c
+++ b/drivers/video/fbdev/p9100.c
@@ -15,7 +15,8 @@
 #include <linux/init.h>
 #include <linux/fb.h>
 #include <linux/mm.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 #include <asm/io.h>
 #include <asm/fbio.h>
diff --git a/drivers/video/fbdev/platinumfb.c b/drivers/video/fbdev/platinumfb.c
index f8283fcd5edb..b27f43b3616e 100644
--- a/drivers/video/fbdev/platinumfb.c
+++ b/drivers/video/fbdev/platinumfb.c
@@ -30,9 +30,9 @@
 #include <linux/fb.h>
 #include <linux/init.h>
 #include <linux/nvram.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 
 #include "macmodes.h"
 #include "platinumfb.h"
diff --git a/drivers/video/fbdev/sbuslib.c b/drivers/video/fbdev/sbuslib.c
index 7f79db827b07..21e9fd8e69e2 100644
--- a/drivers/video/fbdev/sbuslib.c
+++ b/drivers/video/fbdev/sbuslib.c
@@ -11,7 +11,7 @@
 #include <linux/fb.h>
 #include <linux/mm.h>
 #include <linux/uaccess.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 
 #include <asm/fbio.h>
 
diff --git a/drivers/video/fbdev/sunxvr1000.c b/drivers/video/fbdev/sunxvr1000.c
index 490bd9a14763..17d61e1d11a6 100644
--- a/drivers/video/fbdev/sunxvr1000.c
+++ b/drivers/video/fbdev/sunxvr1000.c
@@ -8,7 +8,8 @@
 #include <linux/kernel.h>
 #include <linux/fb.h>
 #include <linux/init.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 struct gfb_info {
 	struct fb_info		*info;
diff --git a/drivers/video/fbdev/sunxvr2500.c b/drivers/video/fbdev/sunxvr2500.c
index 2cab4b9be68a..e64ec7d0caf9 100644
--- a/drivers/video/fbdev/sunxvr2500.c
+++ b/drivers/video/fbdev/sunxvr2500.c
@@ -10,7 +10,7 @@
 #include <linux/fb.h>
 #include <linux/pci.h>
 #include <linux/init.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 
 #include <asm/io.h>
 
diff --git a/drivers/video/fbdev/sunxvr500.c b/drivers/video/fbdev/sunxvr500.c
index 6ec358af1256..c4e01e871483 100644
--- a/drivers/video/fbdev/sunxvr500.c
+++ b/drivers/video/fbdev/sunxvr500.c
@@ -10,7 +10,7 @@
 #include <linux/fb.h>
 #include <linux/pci.h>
 #include <linux/init.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 
 #include <asm/io.h>
 
diff --git a/drivers/video/fbdev/tcx.c b/drivers/video/fbdev/tcx.c
index fc3ac2301b45..255eb57aefa2 100644
--- a/drivers/video/fbdev/tcx.c
+++ b/drivers/video/fbdev/tcx.c
@@ -17,7 +17,8 @@
 #include <linux/init.h>
 #include <linux/fb.h>
 #include <linux/mm.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 
 #include <asm/io.h>
 #include <asm/fbio.h>
diff --git a/drivers/video/fbdev/xilinxfb.c b/drivers/video/fbdev/xilinxfb.c
index 2aa3a528277f..542baddd54ad 100644
--- a/drivers/video/fbdev/xilinxfb.c
+++ b/drivers/video/fbdev/xilinxfb.c
@@ -24,14 +24,13 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
+#include <linux/platform_device.h>
 #include <linux/string.h>
 #include <linux/mm.h>
 #include <linux/fb.h>
 #include <linux/init.h>
 #include <linux/dma-mapping.h>
-#include <linux/of_device.h>
-#include <linux/of_platform.h>
-#include <linux/of_address.h>
+#include <linux/of.h>
 #include <linux/io.h>
 #include <linux/slab.h>
 
-- 
2.40.1

