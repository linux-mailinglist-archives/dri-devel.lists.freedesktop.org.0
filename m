Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C54F4506DB6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862AB10EFA1;
	Tue, 19 Apr 2022 13:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E849510EFA1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:40:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8302BB81986;
 Tue, 19 Apr 2022 13:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32FFC385A5;
 Tue, 19 Apr 2022 13:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375623;
 bh=R5zRvKa0SoyT3N6cs+9ATf3vspiQLolbMLlEiLA/7fA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h4qvsRlCqc1+D/Un3T++kg9XOlylFj9tu57mNt8nm00hUNQ6OKBJwfaNIy8CUc5b/
 qlJ5Qll9E9CFFYZxtIhDJzmK+qDlqq4+ArAd2BBXudLqHYrCpKgbUoCnwsfLaR2pgk
 Q7EkW4bPFi3bk0l1eRnod+7F8TcxdVYbp1x3X1kd6GHmuGnsuLz3ITS24UVsnNzXdg
 x/K6BdB+SIi+C9NttQpeR53oMsrljIEQWrLP8CdiwfvAVwJt/CIv2ZT1IB0hwp9ZMU
 YhjJTR86Ah4hamcr5wDfPSVrUyclrlzsHDyDQ4lgL5SrWli+rzKao8UrzltowcxyNH
 vWiGzLOvfg/Eg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 22/41] ARM: omap1: move plat/dma.c to mach/omap-dma.c
Date: Tue, 19 Apr 2022 15:37:04 +0200
Message-Id: <20220419133723.1394715-23-arnd@kernel.org>
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

Most of the interface functions in plat/dma.c are only used from the
USB driver, which is practically OMAP1 specific, except for compile
testing.

The omap_get_plat_info(), omap_request_dma() and omap_free_dma()
functions are never called on omap2 because of runtime checks.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/Makefile                        | 2 +-
 arch/arm/{plat-omap/dma.c => mach-omap1/omap-dma.c} | 0
 arch/arm/plat-omap/Makefile                         | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/arm/{plat-omap/dma.c => mach-omap1/omap-dma.c} (100%)

diff --git a/arch/arm/mach-omap1/Makefile b/arch/arm/mach-omap1/Makefile
index 450bbf552b57..0615cb0ba580 100644
--- a/arch/arm/mach-omap1/Makefile
+++ b/arch/arm/mach-omap1/Makefile
@@ -5,7 +5,7 @@
 
 # Common support
 obj-y := io.o id.o sram-init.o sram.o time.o irq.o mux.o flash.o \
-	 serial.o devices.o dma.o fb.o
+	 serial.o devices.o dma.o omap-dma.o fb.o
 obj-y += clock.o clock_data.o opp_data.o reset.o pm_bus.o timer.o
 
 ifneq ($(CONFIG_SND_SOC_OMAP_MCBSP),)
diff --git a/arch/arm/plat-omap/dma.c b/arch/arm/mach-omap1/omap-dma.c
similarity index 100%
rename from arch/arm/plat-omap/dma.c
rename to arch/arm/mach-omap1/omap-dma.c
diff --git a/arch/arm/plat-omap/Makefile b/arch/arm/plat-omap/Makefile
index 68ccec9de106..5d55295a14ee 100644
--- a/arch/arm/plat-omap/Makefile
+++ b/arch/arm/plat-omap/Makefile
@@ -6,4 +6,4 @@
 ccflags-$(CONFIG_ARCH_MULTIPLATFORM) := -I$(srctree)/arch/arm/plat-omap/include
 
 # Common support
-obj-y := sram.o dma.o
+obj-y := sram.o
-- 
2.29.2

