Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A43865EDB7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 14:47:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B5510E730;
	Thu,  5 Jan 2023 13:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2A310E731
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 13:47:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BE04AB81AEB;
 Thu,  5 Jan 2023 13:47:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F226C433EF;
 Thu,  5 Jan 2023 13:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672926464;
 bh=hvYlZun1V9ia6MvbkglHwpnSsKWMQMEdGZSkjARxpus=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pslL6VhveSNnnvoa7GN/G2CXo4AomFZlhKE8+BqKSIwC5tmQD9zS4Y+nwwxF5BVtP
 lcqEtw9oqeh5GcYfq4YW2vz2b9AvXqHVrdwrM9458+wvEU/hS3EfE2zSy4kn1ryPT6
 gA9yzsWM+6dP0bmIP5XU8uKQSbUXZITHxFwSlC57wcTB7yJlZyMiTtImnOGGVAD1/z
 kFnYmpms6I4BZnOR96m9jRbh5ZPBjjv+6ONSzRff6bdvDaLIdWhgI0Aa2xvfgkSL60
 Ww1z89/t2uJslv6fWyoO57RjlrRdpd5jd1qUs12568hlG0iHgyLgnN61e3tV6ki+Wk
 nqokI4NmcDWIg==
From: Arnd Bergmann <arnd@kernel.org>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH 23/27] fbdev: remove w100fb driver
Date: Thu,  5 Jan 2023 14:46:18 +0100
Message-Id: <20230105134622.254560-24-arnd@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105134622.254560-1-arnd@kernel.org>
References: <20230105134622.254560-1-arnd@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Daniel Mack <daniel@zonque.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The w100fb was used on various PXA based pocketpc machines,
all of which are now removed, so remove this dirver sd well.

Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/fbdev/Kconfig  |   17 -
 drivers/video/fbdev/Makefile |    1 -
 drivers/video/fbdev/w100fb.c | 1644 ----------------------------------
 drivers/video/fbdev/w100fb.h |  924 -------------------
 include/video/w100fb.h       |  147 ---
 5 files changed, 2733 deletions(-)
 delete mode 100644 drivers/video/fbdev/w100fb.c
 delete mode 100644 drivers/video/fbdev/w100fb.h
 delete mode 100644 include/video/w100fb.h

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 3152f1a06a39..2f5219cc36b4 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1841,23 +1841,6 @@ config FB_FSL_DIU
 	help
 	  Framebuffer driver for the Freescale SoC DIU
 
-config FB_W100
-	tristate "W100 frame buffer support"
-	depends on FB && HAS_IOMEM && (ARCH_PXA || COMPILE_TEST)
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
-	help
-	  Frame buffer driver for the w100 as found on the Sharp SL-Cxx series.
-	  It can also drive the w3220 chip found on iPAQ hx4700.
-
-	  This driver is also available as a module ( = code which can be
-	  inserted and removed from the running kernel whenever you want). The
-	  module will be called w100fb. If you want to compile it as a module,
-	  say M here and read <file:Documentation/kbuild/modules.rst>.
-
-	  If unsure, say N.
-
 config FB_SH_MOBILE_LCDC
 	tristate "SuperH Mobile LCDC framebuffer support"
 	depends on FB && HAVE_CLK && HAS_IOMEM
diff --git a/drivers/video/fbdev/Makefile b/drivers/video/fbdev/Makefile
index e5206c3331d6..e6b0ae094b8b 100644
--- a/drivers/video/fbdev/Makefile
+++ b/drivers/video/fbdev/Makefile
@@ -84,7 +84,6 @@ obj-$(CONFIG_FB_PXA)		  += pxafb.o
 obj-$(CONFIG_FB_PXA168)		  += pxa168fb.o
 obj-$(CONFIG_PXA3XX_GCU)	  += pxa3xx-gcu.o
 obj-$(CONFIG_MMP_DISP)           += mmp/
-obj-$(CONFIG_FB_W100)		  += w100fb.o
 obj-$(CONFIG_FB_AU1100)		  += au1100fb.o
 obj-$(CONFIG_FB_AU1200)		  += au1200fb.o
 obj-$(CONFIG_FB_VT8500)		  += vt8500lcdfb.o
diff --git a/drivers/video/fbdev/w100fb.c b/drivers/video/fbdev/w100fb.c
deleted file mode 100644
index 4e641a780726..000000000000
diff --git a/drivers/video/fbdev/w100fb.h b/drivers/video/fbdev/w100fb.h
deleted file mode 100644
index 52c96d155b4c..000000000000
diff --git a/include/video/w100fb.h b/include/video/w100fb.h
deleted file mode 100644
index a614654d8598..000000000000
-- 
2.39.0

