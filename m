Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE68506DB0
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B556610EF91;
	Tue, 19 Apr 2022 13:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC2410EF7B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:39:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C299F616BF;
 Tue, 19 Apr 2022 13:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95D2C385B7;
 Tue, 19 Apr 2022 13:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375577;
 bh=/1rRcvDuoUNuJnmYPxOkUtRPrNjTWfgWCQQLuGK0bF0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HzTn7rZS28K28plwPgCJQ1ghRASliQgI+2FNpVIvzNFzUi1UMK5PsDjZfQF3E1zqt
 mnS9gOUBto2VoRVRCx4Yuj8lbyW2OmCu+xl6Yg/lQSI7z3yCggGhd8SZLzhUTKkV0G
 4ogMF4OyTC9vLOk3qkrtZxw01Hx1kngOU7CkWOkrZ7irrMS32QrmiusUzBa73hEit/
 zPGdRbq5Q5uW64+CqYtjA3PCCVDipYSV0x3AONDo7ffgU5sraeCgGnABr+zWsns3bI
 fd00kWQV003loXXb9YePqTFuhXdVkfreFhqu2YPTGCtBIjFiNHdyrGAFpEfaT8V4vz
 PhMvBlCy/tvnA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 16/41] ARM: omap1: innovator: move ohci phy power handling to
 board file
Date: Tue, 19 Apr 2022 15:36:58 +0200
Message-Id: <20220419133723.1394715-17-arnd@kernel.org>
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

The innovator board needs a special case for its phy control.

Move the corresponding code into the board file and out of the
common code by adding another callback.

Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/board-innovator.c   | 19 +++++++++++++++
 drivers/usb/host/ohci-omap.c            | 31 ++++---------------------
 include/linux/platform_data/usb-omap1.h |  2 ++
 3 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/arm/mach-omap1/board-innovator.c b/arch/arm/mach-omap1/board-innovator.c
index e7d6735d4701..f169e172421d 100644
--- a/arch/arm/mach-omap1/board-innovator.c
+++ b/arch/arm/mach-omap1/board-innovator.c
@@ -290,6 +290,23 @@ static void __init innovator_init_smc91x(void)
 }
 
 #ifdef CONFIG_ARCH_OMAP15XX
+/*
+ * Board specific gang-switched transceiver power on/off.
+ */
+static int innovator_omap_ohci_transceiver_power(int on)
+{
+	if (on)
+		__raw_writeb(__raw_readb(INNOVATOR_FPGA_CAM_USB_CONTROL)
+				| ((1 << 5/*usb1*/) | (1 << 3/*usb2*/)),
+			       INNOVATOR_FPGA_CAM_USB_CONTROL);
+	else
+		__raw_writeb(__raw_readb(INNOVATOR_FPGA_CAM_USB_CONTROL)
+				& ~((1 << 5/*usb1*/) | (1 << 3/*usb2*/)),
+			       INNOVATOR_FPGA_CAM_USB_CONTROL);
+
+	return 0;
+}
+
 static struct omap_usb_config innovator1510_usb_config __initdata = {
 	/* for bundled non-standard host and peripheral cables */
 	.hmc_mode	= 4,
@@ -300,6 +317,8 @@ static struct omap_usb_config innovator1510_usb_config __initdata = {
 
 	.register_dev	= 1,
 	.pins[0]	= 2,
+
+	.transceiver_power = innovator_omap_ohci_transceiver_power,
 };
 
 static const struct omap_lcd_config innovator1510_lcd_config __initconst = {
diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
index 750a90c41a0a..069791d25abb 100644
--- a/drivers/usb/host/ohci-omap.c
+++ b/drivers/usb/host/ohci-omap.c
@@ -67,31 +67,6 @@ static void omap_ohci_clock_power(struct ohci_omap_priv *priv, int on)
 	}
 }
 
-/*
- * Board specific gang-switched transceiver power on/off.
- * NOTE:  OSK supplies power from DC, not battery.
- */
-static int omap_ohci_transceiver_power(struct ohci_omap_priv *priv, int on)
-{
-	if (on) {
-		if (machine_is_omap_innovator() && cpu_is_omap1510())
-			__raw_writeb(__raw_readb(INNOVATOR_FPGA_CAM_USB_CONTROL)
-				| ((1 << 5/*usb1*/) | (1 << 3/*usb2*/)),
-			       INNOVATOR_FPGA_CAM_USB_CONTROL);
-		else if (priv->power)
-			gpiod_set_value_cansleep(priv->power, 0);
-	} else {
-		if (machine_is_omap_innovator() && cpu_is_omap1510())
-			__raw_writeb(__raw_readb(INNOVATOR_FPGA_CAM_USB_CONTROL)
-				& ~((1 << 5/*usb1*/) | (1 << 3/*usb2*/)),
-			       INNOVATOR_FPGA_CAM_USB_CONTROL);
-		else if (priv->power)
-			gpiod_set_value_cansleep(priv->power, 1);
-	}
-
-	return 0;
-}
-
 #ifdef	CONFIG_USB_OTG
 
 static void start_hnp(struct ohci_hcd *ohci)
@@ -202,7 +177,11 @@ static int ohci_omap_reset(struct usb_hcd *hcd)
 	}
 
 	/* FIXME hub_wq hub requests should manage power switching */
-	omap_ohci_transceiver_power(priv, 1);
+	if (config->transceiver_power)
+		return config->transceiver_power(1);
+
+	if (priv->power)
+		gpiod_set_value_cansleep(priv->power, 0);
 
 	/* board init will have already handled HMC and mux setup.
 	 * any external transceiver should already be initialized
diff --git a/include/linux/platform_data/usb-omap1.h b/include/linux/platform_data/usb-omap1.h
index 878e572a78bf..e7b8dc92a269 100644
--- a/include/linux/platform_data/usb-omap1.h
+++ b/include/linux/platform_data/usb-omap1.h
@@ -50,6 +50,8 @@ struct omap_usb_config {
 	int (*ocpi_enable)(void);
 
 	void (*lb_reset)(void);
+
+	int (*transceiver_power)(int on);
 };
 
 #endif /* __LINUX_USB_OMAP1_H */
-- 
2.29.2

