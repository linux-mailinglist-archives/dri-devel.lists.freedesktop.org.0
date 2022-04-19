Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EA3506DBB
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657B710EFD7;
	Tue, 19 Apr 2022 13:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB74F10EFD7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:40:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2A52F616A7;
 Tue, 19 Apr 2022 13:40:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD49CC385AA;
 Tue, 19 Apr 2022 13:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375652;
 bh=++wgzzP18IgZjv9gq3IHjeFk3mw3AxMESGKM1bss8GE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t77plAsS6dzi52zALntxTrIsGvlZ7TVWnBbbBL6BHh9HDB22Vsg+GSU1TUGr/L7yo
 4VED/jnUp/m/iprQbhEzkF/oCLBhn5mjye8/COB4ccOhKBk+sJixyUn/j4z5hhYvAS
 fOMPXYC1p6lswgiO83CT8qRkpbcih1isQSb5qwxzvrTQT+MaBaR+iH3FJlzRpZeFL+
 xLv4MH8XhKivg2WwM9SJ6+BOtF2fIbLSMuGDS0PC2ZNc4r0d6HSPSj40prxX3RgJXN
 wDqi6ESmFTYAF/uvoZWrHFUtV7uChc7cszyCFCMHFQ8dub8SswJUKqRzrKaa1+D2F9
 cs9GhVWEGvR5A==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 26/41] ARM: omap1: relocate static I/O mapping
Date: Tue, 19 Apr 2022 15:37:08 +0200
Message-Id: <20220419133723.1394715-27-arnd@kernel.org>
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

The address range 0xfee00000-0xfeffffff is used for PCI and
PCMCIA I/O port mappings, but OMAP1 has its static mappings
there as well.

Move the OMAP1 addresses a little higher to avoid crashing
at boot.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig.debug                      | 6 +++---
 arch/arm/mach-omap1/include/mach/hardware.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 0c9497d549e3..f57b449000f7 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1837,9 +1837,9 @@ config DEBUG_UART_VIRT
 	default 0xfec00000 if ARCH_IXP4XX && !CPU_BIG_ENDIAN
 	default 0xfec00003 if ARCH_IXP4XX && CPU_BIG_ENDIAN
 	default 0xfef36000 if DEBUG_HIGHBANK_UART
-	default 0xfefb0000 if DEBUG_OMAP1UART1 || DEBUG_OMAP7XXUART1
-	default 0xfefb0800 if DEBUG_OMAP1UART2 || DEBUG_OMAP7XXUART2
-	default 0xfefb9800 if DEBUG_OMAP1UART3 || DEBUG_OMAP7XXUART3
+	default 0xff000000 if DEBUG_OMAP1UART1 || DEBUG_OMAP7XXUART1
+	default 0xff000800 if DEBUG_OMAP1UART2 || DEBUG_OMAP7XXUART2
+	default 0xff009800 if DEBUG_OMAP1UART3 || DEBUG_OMAP7XXUART3
 	default 0xffd01000 if DEBUG_HIP01_UART
 	default DEBUG_UART_PHYS if !MMU
 	depends on DEBUG_LL_UART_8250 || DEBUG_LL_UART_PL01X || \
diff --git a/arch/arm/mach-omap1/include/mach/hardware.h b/arch/arm/mach-omap1/include/mach/hardware.h
index 05c5cd3e95f4..e3522e601ccd 100644
--- a/arch/arm/mach-omap1/include/mach/hardware.h
+++ b/arch/arm/mach-omap1/include/mach/hardware.h
@@ -63,7 +63,7 @@ static inline u32 omap_cs3_phys(void)
 
 #endif	/* ifndef __ASSEMBLER__ */
 
-#define OMAP1_IO_OFFSET		0x01000000	/* Virtual IO = 0xfefb0000 */
+#define OMAP1_IO_OFFSET		0x00fb0000	/* Virtual IO = 0xff000000 */
 #define OMAP1_IO_ADDRESS(pa)	IOMEM((pa) - OMAP1_IO_OFFSET)
 
 #include <mach/serial.h>
-- 
2.29.2

