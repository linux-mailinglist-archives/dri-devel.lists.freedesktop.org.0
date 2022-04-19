Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 106CB507364
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC41110F01E;
	Tue, 19 Apr 2022 16:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4556610F01E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:40:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BA9EB6182B;
 Tue, 19 Apr 2022 16:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDD0FC385A5;
 Tue, 19 Apr 2022 16:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386426;
 bh=ptMtOudbQ5loXUIBoTxa9Js2NvWZa4r2mq6O40yUHH0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sn7fnX8rRkBuqtQMfRkdqeTmIHa3aEVyEQqy3ea6Rcph7o5+q2+oJQtgfayzkGgGD
 pBrobPc0a288Jt5l21HSNaRfaU6aAdkHaECQNojqoW85epuPmw1VvMwvkSO6N07k/3
 115Wizs7BJeOANhRCBPtn5ETmJ1DN/7eD9VqdGz01zYvnNHqGUiTr7Xr5IQ32fnJKz
 73a5FySo1/OXZDPRM/Hg6r35U+vs89tmssHNWG7O1Y8buOzXQepqwD84VLvP022GvN
 c6H9ZVfE372WNIs8vRZiLFyLD+Hr6zPSL7rCagmKzA+O8wvtPs7NCaSk+bRoY9berF
 uj9Ak7o458yOA==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 12/48] ARM: pxa: make addr-map.h header local
Date: Tue, 19 Apr 2022 18:37:34 +0200
Message-Id: <20220419163810.2118169-13-arnd@kernel.org>
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

Drivers should not rely on the contents of this file, so
move it into the platform directory directly.

Cc: Philipp Zabel <philipp.zabel@gmail.com>
Cc: Paul Parsons <lost.distance@yahoo.com>

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/lkml/87mudkmx8g.fsf@belgarion.home/
---
 arch/arm/mach-pxa/{include/mach => }/addr-map.h | 0
 arch/arm/mach-pxa/generic.c                     | 2 +-
 arch/arm/mach-pxa/hx4700.c                      | 2 +-
 arch/arm/mach-pxa/lpd270.c                      | 2 +-
 arch/arm/mach-pxa/magician.c                    | 2 +-
 arch/arm/mach-pxa/mainstone.c                   | 2 +-
 arch/arm/mach-pxa/pxa25x.c                      | 2 +-
 arch/arm/mach-pxa/pxa25x.h                      | 2 +-
 arch/arm/mach-pxa/pxa27x.c                      | 2 +-
 arch/arm/mach-pxa/pxa27x.h                      | 2 +-
 arch/arm/mach-pxa/pxa3xx.c                      | 2 +-
 arch/arm/mach-pxa/pxa3xx.h                      | 2 +-
 arch/arm/mach-pxa/trizeps4.h                    | 2 +-
 arch/arm/mach-pxa/xcep.c                        | 2 +-
 14 files changed, 13 insertions(+), 13 deletions(-)
 rename arch/arm/mach-pxa/{include/mach => }/addr-map.h (100%)

diff --git a/arch/arm/mach-pxa/include/mach/addr-map.h b/arch/arm/mach-pxa/addr-map.h
similarity index 100%
rename from arch/arm/mach-pxa/include/mach/addr-map.h
rename to arch/arm/mach-pxa/addr-map.h
diff --git a/arch/arm/mach-pxa/generic.c b/arch/arm/mach-pxa/generic.c
index 3c3cd90bb9b4..f9083c4f0aea 100644
--- a/arch/arm/mach-pxa/generic.c
+++ b/arch/arm/mach-pxa/generic.c
@@ -22,7 +22,7 @@
 #include <asm/mach/map.h>
 #include <asm/mach-types.h>
 
-#include <mach/addr-map.h>
+#include "addr-map.h"
 #include <mach/irqs.h>
 #include <mach/reset.h>
 #include <mach/smemc.h>
diff --git a/arch/arm/mach-pxa/hx4700.c b/arch/arm/mach-pxa/hx4700.c
index 191a6c24fe19..140a44cb2989 100644
--- a/arch/arm/mach-pxa/hx4700.c
+++ b/arch/arm/mach-pxa/hx4700.c
@@ -40,7 +40,7 @@
 #include <asm/mach/arch.h>
 
 #include "pxa27x.h"
-#include <mach/addr-map.h>
+#include "addr-map.h"
 #include <mach/hx4700.h>
 #include <linux/platform_data/irda-pxaficp.h>
 
diff --git a/arch/arm/mach-pxa/lpd270.c b/arch/arm/mach-pxa/lpd270.c
index 7f10b86f85fd..e03436710752 100644
--- a/arch/arm/mach-pxa/lpd270.c
+++ b/arch/arm/mach-pxa/lpd270.c
@@ -38,7 +38,7 @@
 
 #include "pxa27x.h"
 #include "lpd270.h"
-#include <mach/addr-map.h>
+#include "addr-map.h"
 #include <linux/platform_data/asoc-pxa.h>
 #include <linux/platform_data/video-pxafb.h>
 #include <linux/platform_data/mmc-pxamci.h>
diff --git a/arch/arm/mach-pxa/magician.c b/arch/arm/mach-pxa/magician.c
index 345a44d15a2c..20ca3e28c7fb 100644
--- a/arch/arm/mach-pxa/magician.c
+++ b/arch/arm/mach-pxa/magician.c
@@ -34,7 +34,7 @@
 #include <asm/system_info.h>
 
 #include "pxa27x.h"
-#include <mach/addr-map.h>
+#include "addr-map.h"
 #include <mach/magician.h>
 #include <linux/platform_data/video-pxafb.h>
 #include <linux/platform_data/mmc-pxamci.h>
diff --git a/arch/arm/mach-pxa/mainstone.c b/arch/arm/mach-pxa/mainstone.c
index c8200fc2159d..f0072e63b456 100644
--- a/arch/arm/mach-pxa/mainstone.c
+++ b/arch/arm/mach-pxa/mainstone.c
@@ -51,7 +51,7 @@
 #include <linux/platform_data/irda-pxaficp.h>
 #include <linux/platform_data/usb-ohci-pxa27x.h>
 #include <linux/platform_data/keypad-pxa27x.h>
-#include <mach/addr-map.h>
+#include "addr-map.h"
 #include <mach/smemc.h>
 
 #include "generic.h"
diff --git a/arch/arm/mach-pxa/pxa25x.c b/arch/arm/mach-pxa/pxa25x.c
index dfc90b41fba3..8d21c7eef1d2 100644
--- a/arch/arm/mach-pxa/pxa25x.c
+++ b/arch/arm/mach-pxa/pxa25x.c
@@ -34,7 +34,7 @@
 #include "pxa25x.h"
 #include <mach/reset.h>
 #include "pm.h"
-#include <mach/addr-map.h>
+#include "addr-map.h"
 #include <mach/smemc.h>
 
 #include "generic.h"
diff --git a/arch/arm/mach-pxa/pxa25x.h b/arch/arm/mach-pxa/pxa25x.h
index 403bc16c2ed2..4699ebf7b486 100644
--- a/arch/arm/mach-pxa/pxa25x.h
+++ b/arch/arm/mach-pxa/pxa25x.h
@@ -2,7 +2,7 @@
 #ifndef __MACH_PXA25x_H
 #define __MACH_PXA25x_H
 
-#include <mach/addr-map.h>
+#include "addr-map.h"
 #include <mach/pxa2xx-regs.h>
 #include "mfp-pxa25x.h"
 #include <mach/irqs.h>
diff --git a/arch/arm/mach-pxa/pxa27x.c b/arch/arm/mach-pxa/pxa27x.c
index 38fdd22c4dc5..c36a9784fab8 100644
--- a/arch/arm/mach-pxa/pxa27x.c
+++ b/arch/arm/mach-pxa/pxa27x.c
@@ -33,7 +33,7 @@
 #include <mach/reset.h>
 #include <linux/platform_data/usb-ohci-pxa27x.h>
 #include "pm.h"
-#include <mach/addr-map.h>
+#include "addr-map.h"
 #include <mach/smemc.h>
 
 #include "generic.h"
diff --git a/arch/arm/mach-pxa/pxa27x.h b/arch/arm/mach-pxa/pxa27x.h
index 6c99090647d2..bf2755561fe5 100644
--- a/arch/arm/mach-pxa/pxa27x.h
+++ b/arch/arm/mach-pxa/pxa27x.h
@@ -3,7 +3,7 @@
 #define __MACH_PXA27x_H
 
 #include <linux/suspend.h>
-#include <mach/addr-map.h>
+#include "addr-map.h"
 #include <mach/pxa2xx-regs.h>
 #include "mfp-pxa27x.h"
 #include <mach/irqs.h>
diff --git a/arch/arm/mach-pxa/pxa3xx.c b/arch/arm/mach-pxa/pxa3xx.c
index 7c569fa2a6da..7881888107c7 100644
--- a/arch/arm/mach-pxa/pxa3xx.c
+++ b/arch/arm/mach-pxa/pxa3xx.c
@@ -32,7 +32,7 @@
 #include <mach/reset.h>
 #include <linux/platform_data/usb-ohci-pxa27x.h>
 #include "pm.h"
-#include <mach/addr-map.h>
+#include "addr-map.h"
 #include <mach/smemc.h>
 #include <mach/irqs.h>
 
diff --git a/arch/arm/mach-pxa/pxa3xx.h b/arch/arm/mach-pxa/pxa3xx.h
index 22ace053ea25..6b424d328680 100644
--- a/arch/arm/mach-pxa/pxa3xx.h
+++ b/arch/arm/mach-pxa/pxa3xx.h
@@ -2,7 +2,7 @@
 #ifndef __MACH_PXA3XX_H	
 #define __MACH_PXA3XX_H
 
-#include <mach/addr-map.h>
+#include "addr-map.h"
 #include <mach/pxa3xx-regs.h>
 #include <mach/irqs.h>
 
diff --git a/arch/arm/mach-pxa/trizeps4.h b/arch/arm/mach-pxa/trizeps4.h
index 7597b9de11e2..e0f37c0ff06f 100644
--- a/arch/arm/mach-pxa/trizeps4.h
+++ b/arch/arm/mach-pxa/trizeps4.h
@@ -11,7 +11,7 @@
 #ifndef _TRIPEPS4_H_
 #define _TRIPEPS4_H_
 
-#include <mach/addr-map.h>
+#include "addr-map.h"
 #include <mach/irqs.h> /* PXA_GPIO_TO_IRQ */
 
 /* physical memory regions */
diff --git a/arch/arm/mach-pxa/xcep.c b/arch/arm/mach-pxa/xcep.c
index e6ab428287ae..7389e0199144 100644
--- a/arch/arm/mach-pxa/xcep.c
+++ b/arch/arm/mach-pxa/xcep.c
@@ -25,7 +25,7 @@
 #include <asm/mach/map.h>
 
 #include "pxa25x.h"
-#include <mach/addr-map.h>
+#include "addr-map.h"
 #include <mach/smemc.h>
 
 #include "generic.h"
-- 
2.29.2

