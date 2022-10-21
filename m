Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B63FE60803E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 22:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EEE710E234;
	Fri, 21 Oct 2022 20:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C7F10E234
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 20:50:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 14E1161F0B;
 Fri, 21 Oct 2022 20:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233C9C433C1;
 Fri, 21 Oct 2022 20:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666385443;
 bh=QMX5heUyLImd+6hJQe5kHvBC9IDbbrmFRJqR9+d5odE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O4IU4IsPwf2qskLIG5MIdhKmMnn0pHcs7KK60yXRWra3j8cmhMAffwBPEz9G6cqye
 M8To5Y0WzATvdGpdLwpLwhU/QvfGx0dId/V5ZrhxxKjNhKvx8YZ0r0q1iUrocaHknl
 tllYiU6DcuJ0MdGhGzGhUtU/ZJ614RLNdiYsLX/tpDSw/8wz5z1l8GhxEA9yikMjOT
 yaqK0CcRQdPfpUbquVCdgAZ/5ah33PE8M6jY3q14U1sBtm+xUvqJlNMT6wGKhta/O6
 wHrS7UeTwer73/+Af8ndFtI+AAbmHpCUSVMm1P5RfKXkwBhL9FdMlKpKJHpCUelRlH
 HxT4bVi8w+4UQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH 16/21] fbdev: remove s3c2410 framebuffer
Date: Fri, 21 Oct 2022 22:27:49 +0200
Message-Id: <20221021203329.4143397-16-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20221021202254.4142411-1-arnd@kernel.org>
References: <20221021202254.4142411-1-arnd@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Ben Dooks <ben-linux@fluff.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Simtec Linux Team <linux@simtec.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The s3c24xx platform was removed, so the framebuffer driver is no longer
needed.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/fbdev/Kconfig              |   33 +-
 drivers/video/fbdev/Makefile             |    1 -
 drivers/video/fbdev/s3c2410fb-regs-lcd.h |  143 ---
 drivers/video/fbdev/s3c2410fb.c          | 1142 ----------------------
 drivers/video/fbdev/s3c2410fb.h          |   48 -
 include/linux/platform_data/fb-s3c2410.h |   99 --
 6 files changed, 4 insertions(+), 1462 deletions(-)
 delete mode 100644 drivers/video/fbdev/s3c2410fb-regs-lcd.h
 delete mode 100644 drivers/video/fbdev/s3c2410fb.c
 delete mode 100644 drivers/video/fbdev/s3c2410fb.h
 delete mode 100644 include/linux/platform_data/fb-s3c2410.h

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index d1d74269075a..fa5bdbf82d59 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1822,19 +1822,17 @@ config FB_SH_MOBILE_LCDC
 config FB_S3C
 	tristate "Samsung S3C framebuffer support"
 	depends on FB && HAVE_CLK && HAS_IOMEM
-	depends on (CPU_S3C2416 || ARCH_S3C64XX) || COMPILE_TEST
+	depends on ARCH_S3C64XX || COMPILE_TEST
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
 	help
 	  Frame buffer driver for the built-in FB controller in the Samsung
-	  SoC line from the S3C2443 onwards, including the S3C2416, S3C2450,
-	  and the S3C64XX series such as the S3C6400 and S3C6410.
+	  SoC line such as the S3C6400 and S3C6410.
 
 	  These chips all have the same basic framebuffer design with the
-	  actual capabilities depending on the chip. For instance the S3C6400
-	  and S3C6410 support 4 hardware windows whereas the S3C24XX series
-	  currently only have two.
+	  actual capabilities depending on the chip. The S3C6400
+	  and S3C6410 support 4 hardware windows.
 
 	  Currently the support is only for the S3C6400 and S3C6410 SoCs.
 
@@ -1844,29 +1842,6 @@ config FB_S3C_DEBUG_REGWRITE
 	help
 	  Show all register writes via pr_debug()
 
-config FB_S3C2410
-	tristate "S3C2410 LCD framebuffer support"
-	depends on FB && ARCH_S3C24XX
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
-	help
-	  Frame buffer driver for the built-in LCD controller in the Samsung
-	  S3C2410 processor.
-
-	  This driver is also available as a module ( = code which can be
-	  inserted and removed from the running kernel whenever you want). The
-	  module will be called s3c2410fb. If you want to compile it as a module,
-	  say M here and read <file:Documentation/kbuild/modules.rst>.
-
-	  If unsure, say N.
-config FB_S3C2410_DEBUG
-	bool "S3C2410 lcd debug messages"
-	depends on FB_S3C2410
-	help
-	  Turn on debugging messages. Note that you can set/unset at run time
-	  through sysfs
-
 config FB_SM501
 	tristate "Silicon Motion SM501 framebuffer support"
 	depends on FB && MFD_SM501
diff --git a/drivers/video/fbdev/Makefile b/drivers/video/fbdev/Makefile
index 279cb0066aec..e6b0ae094b8b 100644
--- a/drivers/video/fbdev/Makefile
+++ b/drivers/video/fbdev/Makefile
@@ -98,7 +98,6 @@ obj-$(CONFIG_FB_S1D13XXX)	  += s1d13xxxfb.o
 obj-$(CONFIG_FB_SH7760)		  += sh7760fb.o
 obj-$(CONFIG_FB_IMX)              += imxfb.o
 obj-$(CONFIG_FB_S3C)		  += s3c-fb.o
-obj-$(CONFIG_FB_S3C2410)	  += s3c2410fb.o
 obj-$(CONFIG_FB_FSL_DIU)	  += fsl-diu-fb.o
 obj-$(CONFIG_FB_COBALT)           += cobalt_lcdfb.o
 obj-$(CONFIG_FB_IBM_GXT4500)	  += gxt4500.o
diff --git a/drivers/video/fbdev/s3c2410fb-regs-lcd.h b/drivers/video/fbdev/s3c2410fb-regs-lcd.h
deleted file mode 100644
index 1e46f7a788e5..000000000000
diff --git a/drivers/video/fbdev/s3c2410fb.c b/drivers/video/fbdev/s3c2410fb.c
deleted file mode 100644
index d8ae5258de46..000000000000
diff --git a/drivers/video/fbdev/s3c2410fb.h b/drivers/video/fbdev/s3c2410fb.h
deleted file mode 100644
index cdd11e2f8859..000000000000
diff --git a/include/linux/platform_data/fb-s3c2410.h b/include/linux/platform_data/fb-s3c2410.h
deleted file mode 100644
index 10c11e6316d6..000000000000
-- 
2.29.2

