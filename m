Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 023DB507360
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B57210EF6D;
	Tue, 19 Apr 2022 16:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0864310EF68
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:39:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A9254B81BED;
 Tue, 19 Apr 2022 16:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B3DC385A5;
 Tue, 19 Apr 2022 16:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386394;
 bh=hFjukvDjrGmDvm4krCMb+MU1l1A2h39IWiElATYXAZM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lw6cz36jNJbw7uXSplFymJG+YYC214yKxF6jaNLG32GXhdt0Xp1Iv9XNJKThc4ame
 9m5IbTOvGXgyUoBaYsmhIbsImLWjW8Zzoudc5fIeQKQm6o9EWWfrIWNDmvly1Me3nA
 hkxpQEAZRwl97Jk566xVc0It5Jnx+8gBPuAV+8W6cFsvApSsFk3hpsqb3HYANtM4gn
 4o2gbRGCwzgZfCiW/d+Yo6XPlZ75THdr882ZNtbbK/pSv62iFmjbTZ/WWiVqJPdvQT
 o6RWdFWodHhhvVLXb64hmn3Q8X1pTVVTcGZrGVZBBNv7XV2AmUCzRAmRyDP6gZplnF
 X0wvsWgyj2gZQ==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 08/48] ARM: pxa: move regs-lcd.h into driver
Date: Tue, 19 Apr 2022 18:37:30 +0200
Message-Id: <20220419163810.2118169-9-arnd@kernel.org>
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
 Helge Deller <deller@gmx.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
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

Only the pxafb driver uses this header, so move it into the
same directory. The SMART_* macros are required by some
platform data definitions and can go into the
linux/platform_data/video-pxafb.h header.

Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../video/fbdev/pxa3xx-regs.h                 | 19 ----------------
 drivers/video/fbdev/pxafb.c                   |  1 +
 include/linux/platform_data/video-pxafb.h     | 22 ++++++++++++++++++-
 3 files changed, 22 insertions(+), 20 deletions(-)
 rename arch/arm/mach-pxa/include/mach/regs-lcd.h => drivers/video/fbdev/pxa3xx-regs.h (90%)

diff --git a/arch/arm/mach-pxa/include/mach/regs-lcd.h b/drivers/video/fbdev/pxa3xx-regs.h
similarity index 90%
rename from arch/arm/mach-pxa/include/mach/regs-lcd.h
rename to drivers/video/fbdev/pxa3xx-regs.h
index 6a434675f84a..6a96610ef9b5 100644
--- a/arch/arm/mach-pxa/include/mach/regs-lcd.h
+++ b/drivers/video/fbdev/pxa3xx-regs.h
@@ -177,23 +177,4 @@
 #define PRSR_ST_OK	(1 << 9)	/* Status OK */
 #define PRSR_CON_NT	(1 << 10)	/* Continue to Next Command */
 
-#define SMART_CMD_A0			 (0x1 << 8)
-#define SMART_CMD_READ_STATUS_REG	 (0x0 << 9)
-#define SMART_CMD_READ_FRAME_BUFFER	((0x0 << 9) | SMART_CMD_A0)
-#define SMART_CMD_WRITE_COMMAND		 (0x1 << 9)
-#define SMART_CMD_WRITE_DATA		((0x1 << 9) | SMART_CMD_A0)
-#define SMART_CMD_WRITE_FRAME		((0x2 << 9) | SMART_CMD_A0)
-#define SMART_CMD_WAIT_FOR_VSYNC	 (0x3 << 9)
-#define SMART_CMD_NOOP			 (0x4 << 9)
-#define SMART_CMD_INTERRUPT		 (0x5 << 9)
-
-#define SMART_CMD(x)	(SMART_CMD_WRITE_COMMAND | ((x) & 0xff))
-#define SMART_DAT(x)	(SMART_CMD_WRITE_DATA | ((x) & 0xff))
-
-/* SMART_DELAY() is introduced for software controlled delay primitive which
- * can be inserted between command sequences, unused command 0x6 is used here
- * and delay ranges from 0ms ~ 255ms
- */
-#define SMART_CMD_DELAY		(0x6 << 9)
-#define SMART_DELAY(ms)		(SMART_CMD_DELAY | ((ms) & 0xff))
 #endif /* __ASM_ARCH_REGS_LCD_H */
diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index edf080f64a8c..ab5bc8272d8e 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -72,6 +72,7 @@
 #define DEBUG_VAR 1
 
 #include "pxafb.h"
+#include "pxa3xx-regs.h"
 
 /* Bits which should not be set in machine configuration structures */
 #define LCCR0_INVALID_CONFIG_MASK	(LCCR0_OUM | LCCR0_BM | LCCR0_QDM |\
diff --git a/include/linux/platform_data/video-pxafb.h b/include/linux/platform_data/video-pxafb.h
index b3d574778326..6333bac166a5 100644
--- a/include/linux/platform_data/video-pxafb.h
+++ b/include/linux/platform_data/video-pxafb.h
@@ -8,7 +8,6 @@
  */
 
 #include <linux/fb.h>
-#include <mach/regs-lcd.h>
 
 /*
  * Supported LCD connections
@@ -153,6 +152,27 @@ struct pxafb_mach_info {
 void pxa_set_fb_info(struct device *, struct pxafb_mach_info *);
 unsigned long pxafb_get_hsync_time(struct device *dev);
 
+/* smartpanel related */
+#define SMART_CMD_A0			 (0x1 << 8)
+#define SMART_CMD_READ_STATUS_REG	 (0x0 << 9)
+#define SMART_CMD_READ_FRAME_BUFFER	((0x0 << 9) | SMART_CMD_A0)
+#define SMART_CMD_WRITE_COMMAND		 (0x1 << 9)
+#define SMART_CMD_WRITE_DATA		((0x1 << 9) | SMART_CMD_A0)
+#define SMART_CMD_WRITE_FRAME		((0x2 << 9) | SMART_CMD_A0)
+#define SMART_CMD_WAIT_FOR_VSYNC	 (0x3 << 9)
+#define SMART_CMD_NOOP			 (0x4 << 9)
+#define SMART_CMD_INTERRUPT		 (0x5 << 9)
+
+#define SMART_CMD(x)	(SMART_CMD_WRITE_COMMAND | ((x) & 0xff))
+#define SMART_DAT(x)	(SMART_CMD_WRITE_DATA | ((x) & 0xff))
+
+/* SMART_DELAY() is introduced for software controlled delay primitive which
+ * can be inserted between command sequences, unused command 0x6 is used here
+ * and delay ranges from 0ms ~ 255ms
+ */
+#define SMART_CMD_DELAY		(0x6 << 9)
+#define SMART_DELAY(ms)		(SMART_CMD_DELAY | ((ms) & 0xff))
+
 #ifdef CONFIG_FB_PXA_SMARTPANEL
 extern int pxafb_smart_queue(struct fb_info *info, uint16_t *cmds, int);
 extern int pxafb_smart_flush(struct fb_info *info);
-- 
2.29.2

