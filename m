Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BFDABDD23
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 16:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8C810E04E;
	Tue, 20 May 2025 14:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A7610E04E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 14:34:07 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:2bba:d77b:9240:3c4e])
 by laurent.telenet-ops.be with cmsmtp
 id rSa32E00R4GqtyW01Sa4as; Tue, 20 May 2025 16:34:04 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.97)
 (envelope-from <geert@linux-m68k.org>) id 1uHO2R-00000002bgm-1Jt7;
 Tue, 20 May 2025 16:34:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
 (envelope-from <geert@linux-m68k.org>) id 1uHO2d-00000002Nn4-3LGJ;
 Tue, 20 May 2025 16:34:03 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] drm/sitronix: Remove broken backwards-compatibility layer
Date: Tue, 20 May 2025 16:33:59 +0200
Message-ID: <20395b14effe5e2e05a4f0856fdcda51c410329d.1747751592.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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

When moving the Sitronix DRM drivers and renaming their Kconfig symbols,
the old symbols were kept, aiming to provide a seamless migration path
when running "make olddefconfig" or "make oldconfig".

However, the old compatibility symbols are not visible.  Hence unless
they are selected by another symbol (which they are not), they can never
be enabled, and no backwards compatibility is provided.

Drop the broken mechanism and the old symbols.

Fixes: 9b8f32002cddf792 ("drm/sitronix: move tiny Sitronix drivers to their own subdir")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Drop backwards-compatibility instead of fixing it.
---
 drivers/gpu/drm/sitronix/Kconfig | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/sitronix/Kconfig b/drivers/gpu/drm/sitronix/Kconfig
index c069d0d417753bcf..25cae32e5c3ec113 100644
--- a/drivers/gpu/drm/sitronix/Kconfig
+++ b/drivers/gpu/drm/sitronix/Kconfig
@@ -10,10 +10,6 @@ config DRM_ST7571_I2C
 
 	  if M is selected the module will be called st7571-i2c.
 
-config TINYDRM_ST7586
-	tristate
-	default n
-
 config DRM_ST7586
 	tristate "DRM support for Sitronix ST7586 display panels"
 	depends on DRM && SPI
@@ -21,17 +17,12 @@ config DRM_ST7586
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_MIPI_DBI
-	default TINYDRM_ST7586
 	help
 	  DRM driver for the following Sitronix ST7586 panels:
 	  * LEGO MINDSTORMS EV3
 
 	  If M is selected the module will be called st7586.
 
-config TINYDRM_ST7735R
-	tristate
-	default n
-
 config DRM_ST7735R
 	tristate "DRM support for Sitronix ST7715R/ST7735R display panels"
 	depends on DRM && SPI
@@ -40,7 +31,6 @@ config DRM_ST7735R
 	select DRM_GEM_DMA_HELPER
 	select DRM_MIPI_DBI
 	select BACKLIGHT_CLASS_DEVICE
-	default TINYDRM_ST7735R
 	help
 	  DRM driver for Sitronix ST7715R/ST7735R with one of the following
 	  LCDs:
-- 
2.43.0

