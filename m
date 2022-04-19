Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C67550738B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5801610F11D;
	Tue, 19 Apr 2022 16:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D205210F11D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:45:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8343FB81BDE;
 Tue, 19 Apr 2022 16:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEE24C385A5;
 Tue, 19 Apr 2022 16:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386699;
 bh=TQPO8Eb4DXbuBVjH4snBze/CPXLx8hYfj8F7j3GxU9A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PkE+S9qLLt/uVvjmX7SVYzOD8H0A2jnCwpUediQL9CiEFuo2XQ7+fzVe5orFR/j+B
 1Kn0644vK/CRT07rVNiayly/tbCE5RPqmVa3sV7YLFN50VR4KOu5kwLyvCKy7UdWrd
 PpC3+mfHHUpdHO2H25Am/SucJvYtHlNwTKkTuKmcMj5yZ3LlaeFsGLmcsHCxsrNU/J
 cXPXnNTaI9aPH1OycStlSzavEF+2HEuf5KBubApJxMqmt5vWDdLpCukXObZY00wvyD
 QUu8InZhgmCtgAChwTU5DZn/0HRUIttBKkcHuZWOka//Ki7ysvaMnLhCuX+trrjXmv
 KfputJ5rHCapw==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 47/48] ARM: pxa: remove support for MTD_XIP
Date: Tue, 19 Apr 2022 18:38:09 +0200
Message-Id: <20220419163810.2118169-48-arnd@kernel.org>
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

Using MTD-XIP does not work on multiplatform kernels because
it requires SoC specific register accesses to be done from
low-level flash handling functions in RAM while the rest of the
kernel sits in flash.

I found no evidence of anyone still actually using this feature,
so remove it from PXA to avoid spending a lot of time on
actually making it work.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig                         |  1 -
 arch/arm/mach-pxa/include/mach/mtd-xip.h | 36 ------------------------
 2 files changed, 37 deletions(-)
 delete mode 100644 arch/arm/mach-pxa/include/mach/mtd-xip.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index eef8cbf20045..ace6c08c8ae2 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -413,7 +413,6 @@ config ARCH_DOVE
 
 config ARCH_PXA
 	bool "PXA2xx/PXA3xx-based"
-	select ARCH_MTD_XIP
 	select ARM_CPU_SUSPEND if PM
 	select AUTO_ZRELADDR
 	select COMMON_CLK
diff --git a/arch/arm/mach-pxa/include/mach/mtd-xip.h b/arch/arm/mach-pxa/include/mach/mtd-xip.h
deleted file mode 100644
index 4b31bef9e50a..000000000000
--- a/arch/arm/mach-pxa/include/mach/mtd-xip.h
+++ /dev/null
@@ -1,36 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * MTD primitives for XIP support. Architecture specific functions
- *
- * Do not include this file directly. It's included from linux/mtd/xip.h
- * 
- * Author:	Nicolas Pitre
- * Created:	Nov 2, 2004
- * Copyright:	(C) 2004 MontaVista Software, Inc.
- */
-
-#ifndef __ARCH_PXA_MTD_XIP_H__
-#define __ARCH_PXA_MTD_XIP_H__
-
-#include <mach/regs-ost.h>
-
-/* restored July 2017, this did not build since 2011! */
-
-#define ICIP			io_p2v(0x40d00000)
-#define ICMR			io_p2v(0x40d00004)
-#define xip_irqpending()	(readl(ICIP) & readl(ICMR))
-
-/* we sample OSCR and convert desired delta to usec (1/4 ~= 1000000/3686400) */
-#define xip_currtime()		readl(OSCR)
-#define xip_elapsed_since(x)	(signed)((readl(OSCR) - (x)) / 4)
-
-/*
- * xip_cpu_idle() is used when waiting for a delay equal or larger than
- * the system timer tick period.  This should put the CPU into idle mode
- * to save power and to be woken up only when some interrupts are pending.
- * As above, this should not rely upon standard kernel code.
- */
-
-#define xip_cpu_idle()  asm volatile ("mcr p14, 0, %0, c7, c0, 0" :: "r" (1))
-
-#endif /* __ARCH_PXA_MTD_XIP_H__ */
-- 
2.29.2

