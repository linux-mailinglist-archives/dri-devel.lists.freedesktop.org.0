Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4704B506DBE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E05910EFE0;
	Tue, 19 Apr 2022 13:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0843610EFE4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:41:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 89B76616A8;
 Tue, 19 Apr 2022 13:41:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA99C385AC;
 Tue, 19 Apr 2022 13:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375675;
 bh=Zu+s/Y6CPoLWnIUPjVgATnzi0v1z3Jhkw2fBKn8V10M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U5cHM84vrLY3O3eyj59RLMY2m4fa/fIXcrDCJ9kjqXW9XoISe3lQxXTO6L1dAaoQk
 oQoOecRjFl/5jFqnm0E7okbJ6ifMuDNAdWBOnlrkhp25WpgKIJYVTtI7PuyR0j44Wt
 7VsEFwWnvRKUEPainDkDn9AuVbG7J1W7AlpltYmSzKoWeF58QXmvv/f82nxuMT/W8N
 aPUFb2G2ez74e0BV9D2X9qJaN5aJ9wiK14osJsk3UfjTmuRqz6tm7WcpnIOvwfOH1f
 Xlf8Y8XE35dK5tWzEayPKnnm9LQnhR2Mue+H9vmhX/9J78LZeH0skpwslSkMEsZyAj
 DLN5B2SpMEUCQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 29/41] ARM: omap1: fix build with no SoC selected
Date: Tue, 19 Apr 2022 15:37:11 +0200
Message-Id: <20220419133723.1394715-30-arnd@kernel.org>
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

In a multiplatform randconfig kernel, one can have
CONFIG_ARCH_OMAP1 enabled, but none of the specific SoCs.
This leads to some build issues as the code is not
meant to deal with this configuration at the moment:

arch/arm/mach-omap1/io.c:86:20: error: unused function 'omap1_map_common_io' [-Werror,-Wunused-function]
arch/arm/mach-omap1/pm.h:113:2: error: "Power management for this processor not implemented yet" [-Werror,-W#warnings]

Use the same trick as on OMAP2 and guard the actual compilation
of platform code with another Makefile ifdef check based
on an option that depends on having at least one SoC enabled.

The io.c file still needs to get compiled to allow building
device drivers with a dependency on CONFIG_ARCH_OMAP1.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig                | 1 -
 arch/arm/mach-omap1/Kconfig     | 4 ++++
 arch/arm/mach-omap1/Makefile    | 4 ++++
 include/linux/soc/ti/omap1-io.h | 4 ++--
 4 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index fb6afa6bbc8f..a65f2c05f01c 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -485,7 +485,6 @@ config ARCH_S3C24XX
 
 config ARCH_OMAP1
 	bool "TI OMAP1"
-	select ARCH_OMAP
 	select CLKSRC_MMIO
 	select FORCE_PCI if PCCARD
 	select GENERIC_IRQ_CHIP
diff --git a/arch/arm/mach-omap1/Kconfig b/arch/arm/mach-omap1/Kconfig
index 93ea86954a84..d4b0cd91a4f9 100644
--- a/arch/arm/mach-omap1/Kconfig
+++ b/arch/arm/mach-omap1/Kconfig
@@ -28,6 +28,10 @@ config ARCH_OMAP16XX
 	select CPU_ARM926T
 	select OMAP_DM_TIMER
 
+config ARCH_OMAP1_ANY
+	select ARCH_OMAP
+	def_bool ARCH_OMAP730 || ARCH_OMAP850 || ARCH_OMAP15XX || ARCH_OMAP16XX
+
 config ARCH_OMAP
 	bool
 
diff --git a/arch/arm/mach-omap1/Makefile b/arch/arm/mach-omap1/Makefile
index 0615cb0ba580..506074b86333 100644
--- a/arch/arm/mach-omap1/Makefile
+++ b/arch/arm/mach-omap1/Makefile
@@ -3,6 +3,8 @@
 # Makefile for the linux kernel.
 #
 
+ifdef CONFIG_ARCH_OMAP1_ANY
+
 # Common support
 obj-y := io.o id.o sram-init.o sram.o time.o irq.o mux.o flash.o \
 	 serial.o devices.o dma.o omap-dma.o fb.o
@@ -57,3 +59,5 @@ obj-$(CONFIG_ARCH_OMAP730)		+= gpio7xx.o
 obj-$(CONFIG_ARCH_OMAP850)		+= gpio7xx.o
 obj-$(CONFIG_ARCH_OMAP15XX)		+= gpio15xx.o
 obj-$(CONFIG_ARCH_OMAP16XX)		+= gpio16xx.o
+
+endif
diff --git a/include/linux/soc/ti/omap1-io.h b/include/linux/soc/ti/omap1-io.h
index 9332c92690f4..f7f12728d4a6 100644
--- a/include/linux/soc/ti/omap1-io.h
+++ b/include/linux/soc/ti/omap1-io.h
@@ -5,7 +5,7 @@
 #ifndef __ASSEMBLER__
 #include <linux/types.h>
 
-#if defined(CONFIG_ARCH_OMAP) && defined(CONFIG_ARCH_OMAP1)
+#ifdef CONFIG_ARCH_OMAP1_ANY
 /*
  * NOTE: Please use ioremap + __raw_read/write where possible instead of these
  */
@@ -15,7 +15,7 @@ extern u32 omap_readl(u32 pa);
 extern void omap_writeb(u8 v, u32 pa);
 extern void omap_writew(u16 v, u32 pa);
 extern void omap_writel(u32 v, u32 pa);
-#elif defined(CONFIG_COMPILE_TEST)
+#else
 static inline u8 omap_readb(u32 pa)  { return 0; }
 static inline u16 omap_readw(u32 pa) { return 0; }
 static inline u32 omap_readl(u32 pa) { return 0; }
-- 
2.29.2

