Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6405743CA9A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 15:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD8689EA6;
	Wed, 27 Oct 2021 13:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0D189EA6;
 Wed, 27 Oct 2021 13:27:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF32260E8B;
 Wed, 27 Oct 2021 13:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635341258;
 bh=qGGtvga8O1y2g6sWEld8AJp0sUrc5VDqNDJOBbnVFRA=;
 h=From:To:Cc:Subject:Date:From;
 b=tx4BDkkYm1SRvdcDon9KgichU1wvJJaXGNP3U7ewpBTsSMFErXR32NiRSIovtbqmo
 iUdK02QhRwrxWR7gImHML3L8nJ3Hu3DmGLx2Tp0CGZXfZP8oulQwxznvmmSZWLv053
 s8yspSHvgs2T0bryjeX1TUt6hHbeZE2OFLuM3Hu8P5jsRpe9WzAutzBnODMUFZUl88
 JlLaatbU8csbbXYqQpraLQYEqRtXyxgV7bjxROkkdz0ixS95td5p8zNTTy3cBHcxKb
 vS2nkdJoQlyIL2gdYgYeuqzld55B7kU7LZCjF3lolqJf5h6mmkDDo7YVZZbBUwQmPw
 kxSUhjiP5weAQ==
From: Arnd Bergmann <arnd@kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] fbdev: rework FB_DDC dependencies
Date: Wed, 27 Oct 2021 15:27:12 +0200
Message-Id: <20211027132732.3993279-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Selecting FB_DDC currently turns on CONFIG_I2C implicitly,
which is often not desired and can lead to circular dependencies.

Change this to a 'depends on' and change all drivers that
rely on FB_DDC to have an appropriate I2C dependency as well.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/fbdev/Kconfig | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 6ed5e608dd04..c187a93c9a16 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -62,9 +62,8 @@ config FIRMWARE_EDID
 
 config FB_DDC
 	tristate
-	depends on FB
+	depends on FB && I2C
 	select I2C_ALGOBIT
-	select I2C
 
 config FB_BOOT_VESA_SUPPORT
 	bool
@@ -356,6 +355,7 @@ config FB_CYBER2000
 config FB_CYBER2000_DDC
 	bool "DDC for CyberPro support"
 	depends on FB_CYBER2000
+	depends on I2C=y || I2C=FB_CYBER2000
 	select FB_DDC
 	default y
 	help
@@ -894,6 +894,7 @@ config FB_NVIDIA
 config FB_NVIDIA_I2C
 	bool "Enable DDC Support"
 	depends on FB_NVIDIA
+	depends on I2C=y || I2C=FB_NVIDIA
 	select FB_DDC
 	help
 	  This enables I2C support for nVidia Chipsets.  This is used
@@ -940,6 +941,7 @@ config FB_RIVA
 config FB_RIVA_I2C
 	bool "Enable DDC Support"
 	depends on FB_RIVA
+	depends on I2C=y || I2C=FB_RIVA
 	select FB_DDC
 	help
 	  This enables I2C support for nVidia Chipsets.  This is used
@@ -967,7 +969,7 @@ config FB_RIVA_BACKLIGHT
 
 config FB_I740
 	tristate "Intel740 support"
-	depends on FB && PCI
+	depends on FB && PCI && I2C
 	select FB_MODE_HELPERS
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
@@ -1021,6 +1023,7 @@ config FB_I810_GTF
 config FB_I810_I2C
 	bool "Enable DDC Support"
 	depends on FB_I810 && FB_I810_GTF
+	depends on I2C=y || I2C=FB_I810
 	select FB_DDC
 	help
 	  Add DDC/I2C support for i810fb.  This will allow the driver to get
@@ -1076,6 +1079,7 @@ config FB_INTEL_DEBUG
 config FB_INTEL_I2C
 	bool "DDC/I2C for Intel framebuffer support"
 	depends on FB_INTEL
+	depends on I2C=y || I2C=FB_INTEL
 	select FB_DDC
 	default y
 	help
@@ -1155,6 +1159,7 @@ config FB_MATROX_G
 config FB_MATROX_I2C
 	tristate "Matrox I2C support"
 	depends on FB_MATROX
+	depends on I2C=y || I2C=FB_MATROX
 	select FB_DDC
 	help
 	  This drivers creates I2C buses which are needed for accessing the
@@ -1220,6 +1225,7 @@ config FB_RADEON
 config FB_RADEON_I2C
 	bool "DDC/I2C for ATI Radeon support"
 	depends on FB_RADEON
+	depends on I2C=y || I2C=FB_RADEON
 	select FB_DDC
 	default y
 	help
@@ -1329,6 +1335,7 @@ config FB_S3
 config FB_S3_DDC
 	bool "DDC for S3 support"
 	depends on FB_S3
+	depends on I2C=y || I2C=FB_S3
 	select FB_DDC
 	default y
 	help
@@ -1354,6 +1361,7 @@ config FB_SAVAGE
 config FB_SAVAGE_I2C
 	bool "Enable DDC2 Support"
 	depends on FB_SAVAGE
+	depends on I2C=y || I2C=FB_SAVAGE
 	select FB_DDC
 	help
 	  This enables I2C support for S3 Savage Chipsets.  This is used
@@ -1493,6 +1501,7 @@ config FB_3DFX_ACCEL
 config FB_3DFX_I2C
 	bool "Enable DDC/I2C support"
 	depends on FB_3DFX
+	depends on I2C=y || I2C=FB_3DFX
 	select FB_DDC
 	default y
 	help
@@ -1532,7 +1541,7 @@ config FB_VT8623
 
 config FB_TRIDENT
 	tristate "Trident/CyberXXX/CyberBlade support"
-	depends on FB && PCI
+	depends on FB && PCI && I2C
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
-- 
2.29.2

