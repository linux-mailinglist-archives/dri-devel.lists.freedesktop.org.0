Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 695CE507319
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0619310EEAD;
	Tue, 19 Apr 2022 16:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D2810EEAD
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:39:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B7B116182A;
 Tue, 19 Apr 2022 16:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39045C385AD;
 Tue, 19 Apr 2022 16:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386338;
 bh=KbcdSb50IQLQ5D4tI3ok5xmRy9ObZ3/EmRI64VTM1Ss=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QdhTX8pdRbp03NZ9vJpKvlEH0f/LQ43kdIDE3RiWKCHCHI1TeOSV/h2lIhOb318AW
 qWgSeA57UjCVL2jEug5iXpiU3mmK/354NQ7BZZIb9uPi9MiVkVOeUEGuZsTOgD41GY
 JfVGfCCTpEMKv6X6RuFhSjWrhsQPeXXxyjFo/OdB8ASzElshH+x6UD5qpMCTWmAYC7
 AXB9H/drECTb92IRbZrdKrOOpeSOW8QoqDJbS5crGpQ7xd/widOORb3SdNeLR9EN9S
 ElsaYiojOripJNV5hRBJsghB+2VBpHBksg2eN/ab95uYvn/xZ0GoVDa0g9fnVVshoW
 6HGGo/JgU6q3A==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 01/48] ARM: pxa: split mach/generic.h
Date: Tue, 19 Apr 2022 18:37:23 +0200
Message-Id: <20220419163810.2118169-2-arnd@kernel.org>
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

Only one declaration from this header is actually used in drivers,
so move that one into the global location and leave everything else
private.

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/generic.h              | 6 +-----
 arch/arm/mach-pxa/include/mach/generic.h | 6 +++++-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-pxa/generic.h b/arch/arm/mach-pxa/generic.h
index 3b7873f8e1f8..67925d3ea026 100644
--- a/arch/arm/mach-pxa/generic.h
+++ b/arch/arm/mach-pxa/generic.h
@@ -7,6 +7,7 @@
  */
 
 #include <linux/reboot.h>
+#include <mach/generic.h>
 
 struct irq_data;
 
@@ -71,8 +72,3 @@ extern unsigned pxa25x_get_clk_frequency_khz(int);
 #define pxa27x_get_clk_frequency_khz(x)		(0)
 #endif
 
-#ifdef CONFIG_PXA3xx
-extern unsigned	pxa3xx_get_clk_frequency_khz(int);
-#else
-#define pxa3xx_get_clk_frequency_khz(x)		(0)
-#endif
diff --git a/arch/arm/mach-pxa/include/mach/generic.h b/arch/arm/mach-pxa/include/mach/generic.h
index 665542e0c9e2..613f6a299d0d 100644
--- a/arch/arm/mach-pxa/include/mach/generic.h
+++ b/arch/arm/mach-pxa/include/mach/generic.h
@@ -1 +1,5 @@
-#include "../../generic.h"
+#ifdef CONFIG_PXA3xx
+extern unsigned	pxa3xx_get_clk_frequency_khz(int);
+#else
+#define pxa3xx_get_clk_frequency_khz(x)		(0)
+#endif
-- 
2.29.2

