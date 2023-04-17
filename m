Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3882C6E5389
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 23:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA4810E5CA;
	Mon, 17 Apr 2023 21:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51FB10E5CA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 21:02:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4CDDA62A8F;
 Mon, 17 Apr 2023 21:02:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4189DC4339B;
 Mon, 17 Apr 2023 21:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681765339;
 bh=M+0Wkonx6xgqnpncRO7OGIWleTNT95JSdoH0jUPeOZ4=;
 h=From:To:Cc:Subject:Date:From;
 b=MpAkNO0krwEsoJPAt7dNl0COD7+wh03WF2d3c1EKXmjLKM6OZnBMcSPbqYKub1jR7
 hLsZp9CBdvceZrM2gfDGyMn9PkVoXBAL79G6J7/YShxy9ffLlPz804Z+P1rbTnR6ON
 lVAuh9boHMbLX0yd7BASNMdQ/UoeAigySsBqyZpCcHYQXBP4ght0vdteUdZk65f2Yn
 nAzuq70pEK34nvCo/eIP5nTE2nuy0HdxCLQfbNdZ2JZBgLX6A9YuSWdR3RhBEHQPhF
 7wSvaXvV+60Ho5gRttq68P2dag6QhODix4Fwf3XeCFMSCO2y5qiXGWRa8RGDfaO7fU
 Bees4prCuY2WQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Lee Jones <lee@kernel.org>
Subject: [PATCH] backlight: corgi_lcd: fix missing prototype
Date: Mon, 17 Apr 2023 23:02:13 +0200
Message-Id: <20230417210213.2385912-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The corgi_lcd_limit_intensity() function is called from platform
and defined in a driver, but the driver does not see the declaration:

drivers/video/backlight/corgi_lcd.c:434:6: error: no previous prototype for 'corgi_lcd_limit_intensity' [-Werror=missing-prototypes]
  434 | void corgi_lcd_limit_intensity(int limit)

Move the prototype into a header that can be included from both
sides to shut up the warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/sharpsl_pm.h | 1 -
 arch/arm/mach-pxa/spitz_pm.c   | 1 +
 include/linux/spi/corgi_lcd.h  | 2 ++
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-pxa/sharpsl_pm.h b/arch/arm/mach-pxa/sharpsl_pm.h
index 9429900db0bb..eff9a74e787f 100644
--- a/arch/arm/mach-pxa/sharpsl_pm.h
+++ b/arch/arm/mach-pxa/sharpsl_pm.h
@@ -105,5 +105,4 @@ void sharpsl_pm_led(int val);
 #define MAX1111_ACIN_VOLT   6u
 int sharpsl_pm_pxa_read_max1111(int channel);
 
-void corgi_lcd_limit_intensity(int limit);
 #endif
diff --git a/arch/arm/mach-pxa/spitz_pm.c b/arch/arm/mach-pxa/spitz_pm.c
index c783696e13b9..9571f2b5b118 100644
--- a/arch/arm/mach-pxa/spitz_pm.c
+++ b/arch/arm/mach-pxa/spitz_pm.c
@@ -15,6 +15,7 @@
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
 #include <linux/apm-emulation.h>
+#include <linux/spi/corgi_lcd.h>
 
 #include <asm/irq.h>
 #include <asm/mach-types.h>
diff --git a/include/linux/spi/corgi_lcd.h b/include/linux/spi/corgi_lcd.h
index 0b857616919c..fc6c1515dc54 100644
--- a/include/linux/spi/corgi_lcd.h
+++ b/include/linux/spi/corgi_lcd.h
@@ -15,4 +15,6 @@ struct corgi_lcd_platform_data {
 	void (*kick_battery)(void);
 };
 
+void corgi_lcd_limit_intensity(int limit);
+
 #endif /* __LINUX_SPI_CORGI_LCD_H */
-- 
2.39.2

