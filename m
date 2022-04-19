Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F3A506DA0
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670F810EEDA;
	Tue, 19 Apr 2022 13:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F3010EEDA
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:37:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1F6F06169F;
 Tue, 19 Apr 2022 13:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39DE8C385A8;
 Tue, 19 Apr 2022 13:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375473;
 bh=t86HMs480nJ81wDi3aXmoHW9AjEzd927cpvY7iUPkRA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q1oWQPoZS7/CENhb5OPLC7YJ2sk5BX0Sd+TR7Ne2RbCX+e8cAKq8cwuskbrP54N8y
 stQZ598/GBeuriRAogXLbe7l2++zRj9NvvKdunSnGmHIycGC7BrO0A6CdtSklsrDOc
 hCpSAcyylOign9vUpLxEd7s3xbU8j0GLafaS11OmXeTYCHwfoODc14V2+61/hy14jV
 V3DE6MU1MIbRw0VhLnmngnMuv5cH7WF6tiE/ouBgQn9Bq49QmvAKcXEu8Yo+jYH8JT
 k3XjmyW8CWF3oBmp9Ft52/Ap2qUIjZrTYHUIc5Ot7q4x0/rQS5znuTVT5ci9wr0C6Y
 uHZkXXfi0EBrQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 02/41] ARM: omap1: innovator: pass lcd control address as pdata
Date: Tue, 19 Apr 2022 15:36:44 +0200
Message-Id: <20220419133723.1394715-3-arnd@kernel.org>
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
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>,
 Paul Walmsley <paul@pwsan.com>, Jingoo Han <jingoohan1@gmail.com>,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org, alsa-devel@alsa-project.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

To avoid using the mach/omap1510.h header file, pass the correct
address as platform data.

Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/board-innovator.c  | 3 +++
 drivers/video/fbdev/omap/lcd_inn1510.c | 7 +++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap1/board-innovator.c b/arch/arm/mach-omap1/board-innovator.c
index cbe093f969d5..2425f1bacb33 100644
--- a/arch/arm/mach-omap1/board-innovator.c
+++ b/arch/arm/mach-omap1/board-innovator.c
@@ -194,6 +194,9 @@ static struct platform_device innovator1510_smc91x_device = {
 static struct platform_device innovator1510_lcd_device = {
 	.name		= "lcd_inn1510",
 	.id		= -1,
+	.dev	= {
+		.platform_data = (void __force *)OMAP1510_FPGA_LCD_PANEL_CONTROL,
+	}
 };
 
 static struct platform_device innovator1510_spi_device = {
diff --git a/drivers/video/fbdev/omap/lcd_inn1510.c b/drivers/video/fbdev/omap/lcd_inn1510.c
index 776e7f8d656e..37ed0c14aa5a 100644
--- a/drivers/video/fbdev/omap/lcd_inn1510.c
+++ b/drivers/video/fbdev/omap/lcd_inn1510.c
@@ -14,15 +14,17 @@
 
 #include "omapfb.h"
 
+static void __iomem *omap1510_fpga_lcd_panel_control;
+
 static int innovator1510_panel_enable(struct lcd_panel *panel)
 {
-	__raw_writeb(0x7, OMAP1510_FPGA_LCD_PANEL_CONTROL);
+	__raw_writeb(0x7, omap1510_fpga_lcd_panel_control);
 	return 0;
 }
 
 static void innovator1510_panel_disable(struct lcd_panel *panel)
 {
-	__raw_writeb(0x0, OMAP1510_FPGA_LCD_PANEL_CONTROL);
+	__raw_writeb(0x0, omap1510_fpga_lcd_panel_control);
 }
 
 static struct lcd_panel innovator1510_panel = {
@@ -48,6 +50,7 @@ static struct lcd_panel innovator1510_panel = {
 
 static int innovator1510_panel_probe(struct platform_device *pdev)
 {
+	omap1510_fpga_lcd_panel_control = (void __iomem *)pdev->dev.platform_data;
 	omapfb_register_panel(&innovator1510_panel);
 	return 0;
 }
-- 
2.29.2

