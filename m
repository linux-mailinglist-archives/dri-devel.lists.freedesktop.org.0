Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4DA506DB3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7ACE10EF9A;
	Tue, 19 Apr 2022 13:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F6F10EF9A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:40:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 71C44B81983;
 Tue, 19 Apr 2022 13:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC917C385AE;
 Tue, 19 Apr 2022 13:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375600;
 bh=zW9EXgIwrT6e9se5HepqxV0X/iuSevgZPTTCehW8dB0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vHI0qQByX+c/7bvvFxsJDZg8Rk3Tmicri/PsugtdLSnLPggMHo6v2ctc+djyVus3N
 ui0ORHPtKfuy3WL0CumRMeBMzGHFm0UT+AP+rOrkATXgVT5fIgx6GErLIT2RrsL1Ec
 IZnzmJ8Dnh78euRrjLA7zfaPZJirZjn2+Ns06Fju3HP4p2eONLIleIC49bfNsZO5hd
 z5fjeKu5u4euWVq8Y01KsxQPT+uo12m/zcR2VMTIGaMdkSl1elVAK6Ja0/bpG1+umE
 1lBMBmTCxncgj2s+VWFf/59RsmLfL2r5TKijMH37jw/Ys1Zb+TJYoC5rYrhTKbwaRm
 wVS3j8bExN97Q==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 19/41] ARM: omap: dma: make usb support optional
Date: Tue, 19 Apr 2022 15:37:01 +0200
Message-Id: <20220419133723.1394715-20-arnd@kernel.org>
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
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Most of the plat-omap/dma.c code is specific to the USB
driver. Hide that code when it is not in use, to make it
clearer which parts are actually still required.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/plat-omap/dma.c       | 45 +++++++++++++++++-----------------
 drivers/usb/gadget/udc/Kconfig |  2 +-
 include/linux/omap-dma.h       |  5 +++-
 3 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/arch/arm/plat-omap/dma.c b/arch/arm/plat-omap/dma.c
index 700ba9b600e7..b7757864d0aa 100644
--- a/arch/arm/plat-omap/dma.c
+++ b/arch/arm/plat-omap/dma.c
@@ -66,7 +66,6 @@ enum { DMA_CHAIN_STARTED, DMA_CHAIN_NOTSTARTED };
 
 static struct omap_system_dma_plat_info *p;
 static struct omap_dma_dev_attr *d;
-static void omap_clear_dma(int lch);
 static int enable_1510_mode;
 static u32 errata;
 
@@ -90,19 +89,16 @@ static int omap_dma_reserve_channels;
 static DEFINE_SPINLOCK(dma_chan_lock);
 static struct omap_dma_lch *dma_chan;
 
-static inline void disable_lnk(int lch);
-static void omap_disable_channel_irq(int lch);
-static inline void omap_enable_channel_irq(int lch);
-
-#ifdef CONFIG_ARCH_OMAP15XX
-/* Returns 1 if the DMA module is in OMAP1510-compatible mode, 0 otherwise */
-static int omap_dma_in_1510_mode(void)
+static inline void omap_disable_channel_irq(int lch)
 {
-	return enable_1510_mode;
+	/* disable channel interrupts */
+	p->dma_write(0, CICR, lch);
+	/* Clear CSR */
+	if (dma_omap1())
+		p->dma_read(CSR, lch);
+	else
+		p->dma_write(OMAP2_DMA_CSR_CLEAR_MASK, CSR, lch);
 }
-#else
-#define omap_dma_in_1510_mode()		0
-#endif
 
 #ifdef CONFIG_ARCH_OMAP1
 static inline void set_gdma_dev(int req, int dev)
@@ -169,6 +165,17 @@ void omap_set_dma_priority(int lch, int dst_port, int priority)
 #endif
 EXPORT_SYMBOL(omap_set_dma_priority);
 
+#if IS_ENABLED(CONFIG_USB_OMAP)
+#ifdef CONFIG_ARCH_OMAP15XX
+/* Returns 1 if the DMA module is in OMAP1510-compatible mode, 0 otherwise */
+static int omap_dma_in_1510_mode(void)
+{
+	return enable_1510_mode;
+}
+#else
+#define omap_dma_in_1510_mode()		0
+#endif
+
 void omap_set_dma_transfer_params(int lch, int data_type, int elem_count,
 				  int frame_count, int sync_mode,
 				  int dma_trigger, int src_or_dst_synch)
@@ -418,17 +425,6 @@ static inline void omap_enable_channel_irq(int lch)
 	p->dma_write(dma_chan[lch].enabled_irqs, CICR, lch);
 }
 
-static inline void omap_disable_channel_irq(int lch)
-{
-	/* disable channel interrupts */
-	p->dma_write(0, CICR, lch);
-	/* Clear CSR */
-	if (dma_omap1())
-		p->dma_read(CSR, lch);
-	else
-		p->dma_write(OMAP2_DMA_CSR_CLEAR_MASK, CSR, lch);
-}
-
 void omap_disable_dma_irq(int lch, u16 bits)
 {
 	dma_chan[lch].enabled_irqs &= ~bits;
@@ -473,6 +469,7 @@ static inline void disable_lnk(int lch)
 	p->dma_write(l, CLNK_CTRL, lch);
 	dma_chan[lch].flags &= ~OMAP_DMA_ACTIVE;
 }
+#endif
 
 int omap_request_dma(int dev_id, const char *dev_name,
 		     void (*callback)(int lch, u16 ch_status, void *data),
@@ -572,6 +569,7 @@ static void omap_clear_dma(int lch)
 	local_irq_restore(flags);
 }
 
+#if IS_ENABLED(CONFIG_USB_OMAP)
 void omap_start_dma(int lch)
 {
 	u32 l;
@@ -792,6 +790,7 @@ int omap_get_dma_active_status(int lch)
 	return (p->dma_read(CCR, lch) & OMAP_DMA_CCR_EN) != 0;
 }
 EXPORT_SYMBOL(omap_get_dma_active_status);
+#endif
 
 int omap_dma_running(void)
 {
diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index cee934dce4f0..69394dc1cdfb 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -128,7 +128,7 @@ config USB_GR_UDC
 
 config USB_OMAP
 	tristate "OMAP USB Device Controller"
-	depends on ARCH_OMAP1 || (ARCH_OMAP && COMPILE_TEST)
+	depends on ARCH_OMAP1
 	depends on ISP1301_OMAP || !(MACH_OMAP_H2 || MACH_OMAP_H3)
 	help
 	   Many Texas Instruments OMAP processors have flexible full
diff --git a/include/linux/omap-dma.h b/include/linux/omap-dma.h
index 5e228428fda1..07fa58ae9902 100644
--- a/include/linux/omap-dma.h
+++ b/include/linux/omap-dma.h
@@ -299,8 +299,9 @@ extern void omap_set_dma_priority(int lch, int dst_port, int priority);
 extern int omap_request_dma(int dev_id, const char *dev_name,
 			void (*callback)(int lch, u16 ch_status, void *data),
 			void *data, int *dma_ch);
-extern void omap_disable_dma_irq(int ch, u16 irq_bits);
 extern void omap_free_dma(int ch);
+#if IS_ENABLED(CONFIG_USB_OMAP)
+extern void omap_disable_dma_irq(int ch, u16 irq_bits);
 extern void omap_start_dma(int lch);
 extern void omap_stop_dma(int lch);
 extern void omap_set_dma_transfer_params(int lch, int data_type,
@@ -326,6 +327,8 @@ extern void omap_set_dma_dest_burst_mode(int lch,
 extern dma_addr_t omap_get_dma_src_pos(int lch);
 extern dma_addr_t omap_get_dma_dst_pos(int lch);
 extern int omap_get_dma_active_status(int lch);
+#endif
+
 extern int omap_dma_running(void);
 
 #if IS_ENABLED(CONFIG_FB_OMAP)
-- 
2.29.2

