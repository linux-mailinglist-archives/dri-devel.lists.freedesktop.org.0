Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF8B625B44
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 14:30:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E42210E81F;
	Fri, 11 Nov 2022 13:30:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C9810E173
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 13:30:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1D222225DF;
 Fri, 11 Nov 2022 13:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668173427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jUUDnaPnRtoqB5ySgSmu0HROFe5XKl3o6/32f48ScI4=;
 b=vzY024Y1xEE+F9zliqa1bNjk+Dui5f2yhjAArPdak3phCYmWOvN45f92L32u79X0XFMg+3
 58ljIgLCb44YMh5YU/ovPbXmh0hKEABs2DpfAfXdFIqL9oIX+eqWRaneBDhufgauKCSPvJ
 HroZHzF2mPij+qibWLx3s/CzC248wWA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668173427;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jUUDnaPnRtoqB5ySgSmu0HROFe5XKl3o6/32f48ScI4=;
 b=I+FieTAgYbT6Os2QcehhCux9A1cIz/FUPtSx79BCLe+fXd0akW/Iu9Uut/rv+ggjI45712
 P9NAa+5PhL2v8gCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EB93313AE7;
 Fri, 11 Nov 2022 13:30:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OMekOHJObmPCbQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Nov 2022 13:30:26 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	daniel@ffwll.ch,
	javierm@redhat.com
Subject: [PATCH v2 1/2] drm: Move nomodeset kernel parameter to drivers/video
Date: Fri, 11 Nov 2022 14:30:23 +0100
Message-Id: <20221111133024.9897-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221111133024.9897-1-tzimmermann@suse.de>
References: <20221111133024.9897-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the nomodeset kernel parameter to drivers/video to make it
available to non-DRM drivers. Adapt the interface, but keep the DRM
interface drm_firmware_drivers_only() to avoid churn within DRM. The
function should later be inlined into callers.

The parameter disables any DRM graphics driver that would replace a
driver for firmware-provided scanout buffers. It is an option to easily
fallback to basic graphics output if the hardware's native driver is
broken. Moving it to a more prominent location wil make it available
to fbdev as well.

v2:
	* clarify the meaning of the nomodeset parameter (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 Documentation/admin-guide/kernel-parameters.txt   | 15 +++++++++------
 MAINTAINERS                                       |  2 ++
 drivers/gpu/drm/Kconfig                           |  7 +------
 drivers/gpu/drm/Makefile                          |  1 -
 drivers/video/Kconfig                             |  4 ++++
 drivers/video/Makefile                            |  1 +
 .../drm/drm_nomodeset.c => video/nomodeset.c}     | 12 +++++++-----
 include/drm/drm_drv.h                             |  8 +++++++-
 include/video/nomodeset.h                         |  8 ++++++++
 9 files changed, 39 insertions(+), 19 deletions(-)
 rename drivers/{gpu/drm/drm_nomodeset.c => video/nomodeset.c} (63%)
 create mode 100644 include/video/nomodeset.h

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a465d5242774a..88561b3ce28a4 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3777,12 +3777,15 @@
 			shutdown the other cpus.  Instead use the REBOOT_VECTOR
 			irq.
 
-	nomodeset	Disable kernel modesetting. DRM drivers will not perform
-			display-mode changes or accelerated rendering. Only the
-			system framebuffer will be available for use if this was
-			set-up by the firmware or boot loader.
-
-			Useful as fallback, or for testing and debugging.
+	nomodeset	Disable kernel modesetting. Most systems' firmware
+			sets up a display mode and provides framebuffer memory
+			for output. With nomodeset, DRM and fbdev drivers will
+			not load if they could possibly displace the pre-
+			initialized output. Only the system framebuffer will
+			be available for use. The respective drivers will not
+			perform display-mode changes or accelerated rendering.
+
+			Useful as error fallback, or for testing and debugging.
 
 	nomodule	Disable module load
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 0f624e3ef6235..84b008f5aacbc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6698,8 +6698,10 @@ F:	drivers/gpu/drm/drm_aperture.c
 F:	drivers/gpu/drm/tiny/ofdrm.c
 F:	drivers/gpu/drm/tiny/simpledrm.c
 F:	drivers/video/aperture.c
+F:	drivers/video/nomodeset.c
 F:	include/drm/drm_aperture.h
 F:	include/linux/aperture.h
+F:	include/video/nomodeset.h
 
 DRM DRIVER FOR SIS VIDEO CARDS
 S:	Orphan / Obsolete
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f30f99166531f..6b11614aecc5b 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -8,7 +8,6 @@
 menuconfig DRM
 	tristate "Direct Rendering Manager (XFree86 4.1.0 and higher DRI support)"
 	depends on (AGP || AGP=n) && !EMULATED_CMPXCHG && HAS_DMA
-	select DRM_NOMODESET
 	select DRM_PANEL_ORIENTATION_QUIRKS
 	select HDMI
 	select FB_CMDLINE
@@ -19,6 +18,7 @@ menuconfig DRM
 # gallium uses SYS_kcmp for os_same_file_description() to de-duplicate
 # device and dmabuf fd. Let's make sure that is available for our userspace.
 	select KCMP
+	select VIDEO_NOMODESET
 	help
 	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
 	  introduced in XFree86 4.0. If you say Y here, you need to select
@@ -515,11 +515,6 @@ config DRM_EXPORT_FOR_TESTS
 config DRM_PANEL_ORIENTATION_QUIRKS
 	tristate
 
-# Separate option because nomodeset parameter is global and expected built-in
-config DRM_NOMODESET
-	bool
-	default n
-
 config DRM_LIB_RANDOM
 	bool
 	default n
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index c44a54cadb618..f92cd78927110 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -72,7 +72,6 @@ drm-$(CONFIG_DRM_PRIVACY_SCREEN) += \
 	drm_privacy_screen_x86.o
 obj-$(CONFIG_DRM)	+= drm.o
 
-obj-$(CONFIG_DRM_NOMODESET) += drm_nomodeset.o
 obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 
 #
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 0587e21abad94..6d2fde6c5d11a 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -11,6 +11,10 @@ config APERTURE_HELPERS
 	  Support tracking and hand-over of aperture ownership. Required
 	  by graphics drivers for firmware-provided framebuffers.
 
+config VIDEO_NOMODESET
+	bool
+	default n
+
 if HAS_IOMEM
 
 config HAVE_FB_ATMEL
diff --git a/drivers/video/Makefile b/drivers/video/Makefile
index 5bb6b452cc83a..a50eb528ed3c3 100644
--- a/drivers/video/Makefile
+++ b/drivers/video/Makefile
@@ -2,6 +2,7 @@
 
 obj-$(CONFIG_APERTURE_HELPERS)    += aperture.o
 obj-$(CONFIG_VGASTATE)            += vgastate.o
+obj-$(CONFIG_VIDEO_NOMODESET)     += nomodeset.o
 obj-$(CONFIG_HDMI)                += hdmi.o
 
 obj-$(CONFIG_VT)		  += console/
diff --git a/drivers/gpu/drm/drm_nomodeset.c b/drivers/video/nomodeset.c
similarity index 63%
rename from drivers/gpu/drm/drm_nomodeset.c
rename to drivers/video/nomodeset.c
index f3978d5bd3a1d..13cc8b7196978 100644
--- a/drivers/gpu/drm/drm_nomodeset.c
+++ b/drivers/video/nomodeset.c
@@ -3,17 +3,19 @@
 #include <linux/module.h>
 #include <linux/types.h>
 
-static bool drm_nomodeset;
+#include <video/nomodeset.h>
 
-bool drm_firmware_drivers_only(void)
+static bool video_nomodeset;
+
+bool video_firmware_drivers_only(void)
 {
-	return drm_nomodeset;
+	return video_nomodeset;
 }
-EXPORT_SYMBOL(drm_firmware_drivers_only);
+EXPORT_SYMBOL(video_firmware_drivers_only);
 
 static int __init disable_modeset(char *str)
 {
-	drm_nomodeset = true;
+	video_nomodeset = true;
 
 	pr_warn("Booted with the nomodeset parameter. Only the system framebuffer will be available\n");
 
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index f6159acb88569..700d3857e0881 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -30,6 +30,8 @@
 #include <linux/list.h>
 #include <linux/irqreturn.h>
 
+#include <video/nomodeset.h>
+
 #include <drm/drm_device.h>
 
 struct drm_file;
@@ -602,6 +604,10 @@ static inline bool drm_drv_uses_atomic_modeset(struct drm_device *dev)
 
 int drm_dev_set_unique(struct drm_device *dev, const char *name);
 
-extern bool drm_firmware_drivers_only(void);
+/* TODO: Inline drm_firmware_drivers_only() in all its callers. */
+static inline bool drm_firmware_drivers_only(void)
+{
+	return video_firmware_drivers_only();
+}
 
 #endif
diff --git a/include/video/nomodeset.h b/include/video/nomodeset.h
new file mode 100644
index 0000000000000..8f8688b8beabe
--- /dev/null
+++ b/include/video/nomodeset.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef VIDEO_NOMODESET_H
+#define VIDEO_NOMODESET_H
+
+bool video_firmware_drivers_only(void);
+
+#endif
-- 
2.38.0

