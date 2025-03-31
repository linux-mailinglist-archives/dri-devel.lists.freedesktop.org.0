Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E4FA76B75
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 17:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1930B10E449;
	Mon, 31 Mar 2025 15:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 375C510E43E
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 15:59:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A397C1F46E;
 Mon, 31 Mar 2025 15:59:01 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 69C1E13A1F;
 Mon, 31 Mar 2025 15:59:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cPeYGMW76mfdVQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 31 Mar 2025 15:59:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jani.nikula@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 04/18] drm: Move sysfb drivers into separate subdirectory
Date: Mon, 31 Mar 2025 17:52:07 +0200
Message-ID: <20250331155538.1173333-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331155538.1173333-1-tzimmermann@suse.de>
References: <20250331155538.1173333-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: A397C1F46E
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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

The ofdrm and simpledrm drivers are special as they operate on
externally provided framebuffers. Move them into their own sub-
directory. Will let them share common code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 MAINTAINERS                                 |  3 +-
 drivers/gpu/drm/Kconfig                     |  2 ++
 drivers/gpu/drm/Makefile                    |  1 +
 drivers/gpu/drm/sysfb/Kconfig               | 38 +++++++++++++++++++++
 drivers/gpu/drm/sysfb/Makefile              |  4 +++
 drivers/gpu/drm/{tiny => sysfb}/ofdrm.c     |  0
 drivers/gpu/drm/{tiny => sysfb}/simpledrm.c |  0
 drivers/gpu/drm/tiny/Kconfig                | 32 -----------------
 drivers/gpu/drm/tiny/Makefile               |  2 --
 9 files changed, 46 insertions(+), 36 deletions(-)
 create mode 100644 drivers/gpu/drm/sysfb/Kconfig
 create mode 100644 drivers/gpu/drm/sysfb/Makefile
 rename drivers/gpu/drm/{tiny => sysfb}/ofdrm.c (100%)
 rename drivers/gpu/drm/{tiny => sysfb}/simpledrm.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9262d878ed330..e47481b93e3fa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7251,8 +7251,7 @@ M:	Javier Martinez Canillas <javierm@redhat.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-F:	drivers/gpu/drm/tiny/ofdrm.c
-F:	drivers/gpu/drm/tiny/simpledrm.c
+F:	drivers/gpu/drm/sysfb/
 F:	drivers/video/aperture.c
 F:	drivers/video/nomodeset.c
 F:	include/linux/aperture.h
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index d32d70c3ddf14..3921772ae6121 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -264,6 +264,8 @@ config DRM_SCHED
 	tristate
 	depends on DRM
 
+source "drivers/gpu/drm/sysfb/Kconfig"
+
 source "drivers/gpu/drm/arm/Kconfig"
 
 source "drivers/gpu/drm/radeon/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 72176ea895e75..b5d5561bbe5fd 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -205,6 +205,7 @@ obj-$(CONFIG_DRM_FSL_DCU) += fsl-dcu/
 obj-$(CONFIG_DRM_ETNAVIV) += etnaviv/
 obj-y			+= hisilicon/
 obj-y			+= mxsfb/
+obj-y			+= sysfb/
 obj-y			+= tiny/
 obj-$(CONFIG_DRM_PL111) += pl111/
 obj-$(CONFIG_DRM_TVE200) += tve200/
diff --git a/drivers/gpu/drm/sysfb/Kconfig b/drivers/gpu/drm/sysfb/Kconfig
new file mode 100644
index 0000000000000..9eafc06b7192e
--- /dev/null
+++ b/drivers/gpu/drm/sysfb/Kconfig
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+menu "Drivers for system framebuffers"
+	depends on DRM
+
+config DRM_OFDRM
+	tristate "Open Firmware display driver"
+	depends on DRM && MMU && OF && (PPC || COMPILE_TEST)
+	select APERTURE_HELPERS
+	select DRM_CLIENT_SELECTION
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_KMS_HELPER
+	help
+	  DRM driver for Open Firmware framebuffers.
+
+	  This driver assumes that the display hardware has been initialized
+	  by the Open Firmware before the kernel boots. Scanout buffer, size,
+	  and display format must be provided via device tree.
+
+config DRM_SIMPLEDRM
+	tristate "Simple framebuffer driver"
+	depends on DRM && MMU
+	select APERTURE_HELPERS
+	select DRM_CLIENT_SELECTION
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_KMS_HELPER
+	help
+	  DRM driver for simple platform-provided framebuffers.
+
+	  This driver assumes that the display hardware has been initialized
+	  by the firmware or bootloader before the kernel boots. Scanout
+	  buffer, size, and display format must be provided via device tree,
+	  UEFI, VESA, etc.
+
+	  On x86 BIOS or UEFI systems, you should also select SYSFB_SIMPLEFB
+	  to use UEFI and VESA framebuffers.
+
+endmenu
diff --git a/drivers/gpu/drm/sysfb/Makefile b/drivers/gpu/drm/sysfb/Makefile
new file mode 100644
index 0000000000000..f6c03629accb1
--- /dev/null
+++ b/drivers/gpu/drm/sysfb/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_DRM_OFDRM)		+= ofdrm.o
+obj-$(CONFIG_DRM_SIMPLEDRM)	+= simpledrm.o
diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/sysfb/ofdrm.c
similarity index 100%
rename from drivers/gpu/drm/tiny/ofdrm.c
rename to drivers/gpu/drm/sysfb/ofdrm.c
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
similarity index 100%
rename from drivers/gpu/drm/tiny/simpledrm.c
rename to drivers/gpu/drm/sysfb/simpledrm.c
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 54c84c9801c19..95c1457d77309 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -65,20 +65,6 @@ config DRM_GM12U320
 	 This is a KMS driver for projectors which use the GM12U320 chipset
 	 for video transfer over USB2/3, such as the Acer C120 mini projector.
 
-config DRM_OFDRM
-	tristate "Open Firmware display driver"
-	depends on DRM && MMU && OF && (PPC || COMPILE_TEST)
-	select APERTURE_HELPERS
-	select DRM_CLIENT_SELECTION
-	select DRM_GEM_SHMEM_HELPER
-	select DRM_KMS_HELPER
-	help
-	  DRM driver for Open Firmware framebuffers.
-
-	  This driver assumes that the display hardware has been initialized
-	  by the Open Firmware before the kernel boots. Scanout buffer, size,
-	  and display format must be provided via device tree.
-
 config DRM_PANEL_MIPI_DBI
 	tristate "DRM support for MIPI DBI compatible panels"
 	depends on DRM && SPI
@@ -95,24 +81,6 @@ config DRM_PANEL_MIPI_DBI
 	  https://github.com/notro/panel-mipi-dbi/wiki.
 	  To compile this driver as a module, choose M here.
 
-config DRM_SIMPLEDRM
-	tristate "Simple framebuffer driver"
-	depends on DRM && MMU
-	select APERTURE_HELPERS
-	select DRM_CLIENT_SELECTION
-	select DRM_GEM_SHMEM_HELPER
-	select DRM_KMS_HELPER
-	help
-	  DRM driver for simple platform-provided framebuffers.
-
-	  This driver assumes that the display hardware has been initialized
-	  by the firmware or bootloader before the kernel boots. Scanout
-	  buffer, size, and display format must be provided via device tree,
-	  UEFI, VESA, etc.
-
-	  On x86 BIOS or UEFI systems, you should also select SYSFB_SIMPLEFB
-	  to use UEFI and VESA framebuffers.
-
 config TINYDRM_HX8357D
 	tristate "DRM support for HX8357D display panels"
 	depends on DRM && SPI
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 0a3a7837a58b2..ba4a60bb72bdf 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -5,9 +5,7 @@ obj-$(CONFIG_DRM_ARCPGU)		+= arcpgu.o
 obj-$(CONFIG_DRM_BOCHS)			+= bochs.o
 obj-$(CONFIG_DRM_CIRRUS_QEMU)		+= cirrus-qemu.o
 obj-$(CONFIG_DRM_GM12U320)		+= gm12u320.o
-obj-$(CONFIG_DRM_OFDRM)			+= ofdrm.o
 obj-$(CONFIG_DRM_PANEL_MIPI_DBI)	+= panel-mipi-dbi.o
-obj-$(CONFIG_DRM_SIMPLEDRM)		+= simpledrm.o
 obj-$(CONFIG_TINYDRM_HX8357D)		+= hx8357d.o
 obj-$(CONFIG_TINYDRM_ILI9163)		+= ili9163.o
 obj-$(CONFIG_TINYDRM_ILI9225)		+= ili9225.o
-- 
2.49.0

