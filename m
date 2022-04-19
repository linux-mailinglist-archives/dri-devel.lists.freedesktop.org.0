Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEF9507366
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADD710F018;
	Tue, 19 Apr 2022 16:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95F710F018
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:40:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 84427B81A22;
 Tue, 19 Apr 2022 16:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F6BC385A5;
 Tue, 19 Apr 2022 16:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386442;
 bh=rF4AqAeeG3pFiw8ba+j1AjJKI0o8rpvYnUVlfmsd5CQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rZcwYWiPc2XajjwXFY6Hgb0z8xaKQouR3mgetcNfOG0jAxjf+wc+NkAqTEieKNj2K
 hTb4pSkBn4p6/vPrbGHHFSjrFJKYhOj58gtETWj5zjgxOpUV+N5TFkzWHrEi+oCpGA
 Z7qHH3Z4/Qz1lfbHK13P/9eVzrzGxLoE72yig5fdPb2W9JmcSPG6EbgjwxoLszNbC8
 JtYVwf2JvVtYboOyzewKz6pEaGgLg3OpWUMntuI+0iqBattNddhmtXKm3DuOkqoKaX
 6oeCBZj9AZy/bFRn3L+Ral/WFjNSaI6bmC11HJKF0hZPiK+pyR2FGR0p1wVrtmDFDN
 RN3P/E7CISDfQ==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 14/48] ARM: pxa: maybe fix gpio lookup tables
Date: Tue, 19 Apr 2022 18:37:36 +0200
Message-Id: <20220419163810.2118169-15-arnd@kernel.org>
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
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, alsa-devel@alsa-project.org,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

From inspection I found a couple of GPIO lookups that are
listed with device "gpio-pxa", but actually have a number
from a different gpio controller.

Try to rectify that here, with a guess of what the actual
device name is.

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Cc: stable@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/cm-x300.c  | 8 ++++----
 arch/arm/mach-pxa/magician.c | 2 +-
 arch/arm/mach-pxa/tosa.c     | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-pxa/cm-x300.c b/arch/arm/mach-pxa/cm-x300.c
index 09a5264a27c8..01f364a66446 100644
--- a/arch/arm/mach-pxa/cm-x300.c
+++ b/arch/arm/mach-pxa/cm-x300.c
@@ -356,13 +356,13 @@ static struct platform_device cm_x300_spi_gpio = {
 static struct gpiod_lookup_table cm_x300_spi_gpiod_table = {
 	.dev_id         = "spi_gpio",
 	.table          = {
-		GPIO_LOOKUP("gpio-pxa", GPIO_LCD_SCL,
+		GPIO_LOOKUP("pca9555.1", GPIO_LCD_SCL - GPIO_LCD_BASE,
 			    "sck", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("gpio-pxa", GPIO_LCD_DIN,
+		GPIO_LOOKUP("pca9555.1", GPIO_LCD_DIN - GPIO_LCD_BASE,
 			    "mosi", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("gpio-pxa", GPIO_LCD_DOUT,
+		GPIO_LOOKUP("pca9555.1", GPIO_LCD_DOUT - GPIO_LCD_BASE,
 			    "miso", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("gpio-pxa", GPIO_LCD_CS,
+		GPIO_LOOKUP("pca9555.1", GPIO_LCD_CS - GPIO_LCD_BASE,
 			    "cs", GPIO_ACTIVE_HIGH),
 		{ },
 	},
diff --git a/arch/arm/mach-pxa/magician.c b/arch/arm/mach-pxa/magician.c
index 20ca3e28c7fb..d105deb1e098 100644
--- a/arch/arm/mach-pxa/magician.c
+++ b/arch/arm/mach-pxa/magician.c
@@ -681,7 +681,7 @@ static struct platform_device bq24022 = {
 static struct gpiod_lookup_table bq24022_gpiod_table = {
 	.dev_id = "gpio-regulator",
 	.table = {
-		GPIO_LOOKUP("gpio-pxa", EGPIO_MAGICIAN_BQ24022_ISET2,
+		GPIO_LOOKUP("htc-egpio-0", EGPIO_MAGICIAN_BQ24022_ISET2 - MAGICIAN_EGPIO_BASE,
 			    NULL, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP("gpio-pxa", GPIO30_MAGICIAN_BQ24022_nCHARGE_EN,
 			    "enable", GPIO_ACTIVE_LOW),
diff --git a/arch/arm/mach-pxa/tosa.c b/arch/arm/mach-pxa/tosa.c
index 5af980d77d39..9476ed0f55e9 100644
--- a/arch/arm/mach-pxa/tosa.c
+++ b/arch/arm/mach-pxa/tosa.c
@@ -296,9 +296,9 @@ static struct gpiod_lookup_table tosa_mci_gpio_table = {
 	.table = {
 		GPIO_LOOKUP("gpio-pxa", TOSA_GPIO_nSD_DETECT,
 			    "cd", GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP("gpio-pxa", TOSA_GPIO_SD_WP,
+		GPIO_LOOKUP("sharp-scoop.0", TOSA_GPIO_SD_WP - TOSA_SCOOP_GPIO_BASE,
 			    "wp", GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP("gpio-pxa", TOSA_GPIO_PWR_ON,
+		GPIO_LOOKUP("sharp-scoop.0", TOSA_GPIO_PWR_ON - TOSA_SCOOP_GPIO_BASE,
 			    "power", GPIO_ACTIVE_HIGH),
 		{ },
 	},
-- 
2.29.2

