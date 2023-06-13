Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBD472E0B6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 13:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3D110E38D;
	Tue, 13 Jun 2023 11:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C51D10E373
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 11:10:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 206FB1FDB8;
 Tue, 13 Jun 2023 11:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686654607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4fsDwK3/MzhO/+4V6RVPaJy4VYKnZ6Si9bcp6FJanXE=;
 b=ejpVMux/b1QuE5CJU6PidS4DSV7XpXpptL73BBmKjZGHoVUoCLKEqBaQWRtkjAhQ61y1Pp
 qa2g7rJnvYOL7o74S/7RQsaur4g1DY3M1VvCeiMisUuC41kue4jW0NG16qV8nrARnawUHp
 pB/d21/T1XNPywj8DQb8SVxigC6P5VI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686654607;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4fsDwK3/MzhO/+4V6RVPaJy4VYKnZ6Si9bcp6FJanXE=;
 b=eOd/H7swFJ8KgbTzvhB+A/cbC2LClWf584d8eN8j0pTCDq86IAYSI+ISMpWCOFnbaXBrdH
 ni1jqg3WGf3hZUDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BFE8413A47;
 Tue, 13 Jun 2023 11:10:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6GEALo5OiGR8CQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Jun 2023 11:10:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, dan.carpenter@linaro.org, michael.j.ruhl@intel.com
Subject: [PATCH v3 33/38] fbdev/core: Move framebuffer and backlight helpers
 into separate files
Date: Tue, 13 Jun 2023 13:07:08 +0200
Message-ID: <20230613110953.24176-34-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230613110953.24176-1-tzimmermann@suse.de>
References: <20230613110953.24176-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move framebuffer and backlight helpers into separate files. Leave
fbsysfs.c to sysfs-related code. No functional changes.

The framebuffer helpers are not in fbmem.c because they are under
GPL-2.0-or-later copyright, while fbmem.c is GPL-2.0.

v2:
	* include <linux/mutex.h> (Sam)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/fbdev/core/Makefile       |   4 +-
 drivers/video/fbdev/core/fb_backlight.c |  33 +++++++
 drivers/video/fbdev/core/fb_info.c      |  78 +++++++++++++++++
 drivers/video/fbdev/core/fbsysfs.c      | 110 +-----------------------
 4 files changed, 115 insertions(+), 110 deletions(-)
 create mode 100644 drivers/video/fbdev/core/fb_backlight.c
 create mode 100644 drivers/video/fbdev/core/fb_info.c

diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
index 8f0060160ffb7..eee3295bc2252 100644
--- a/drivers/video/fbdev/core/Makefile
+++ b/drivers/video/fbdev/core/Makefile
@@ -1,7 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
 obj-$(CONFIG_FB)                  += fb.o
-fb-y                              := fbmem.o fbmon.o fbcmap.o fbsysfs.o \
+fb-y                              := fb_backlight.o \
+                                     fb_info.o \
+                                     fbmem.o fbmon.o fbcmap.o fbsysfs.o \
                                      modedb.o fbcvt.o fb_cmdline.o fb_io_fops.o
 fb-$(CONFIG_FB_DEFERRED_IO)       += fb_defio.o
 
diff --git a/drivers/video/fbdev/core/fb_backlight.c b/drivers/video/fbdev/core/fb_backlight.c
new file mode 100644
index 0000000000000..e2d3b3adc870f
--- /dev/null
+++ b/drivers/video/fbdev/core/fb_backlight.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/export.h>
+#include <linux/fb.h>
+#include <linux/mutex.h>
+
+#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
+/*
+ * This function generates a linear backlight curve
+ *
+ *     0: off
+ *   1-7: min
+ * 8-127: linear from min to max
+ */
+void fb_bl_default_curve(struct fb_info *fb_info, u8 off, u8 min, u8 max)
+{
+	unsigned int i, flat, count, range = (max - min);
+
+	mutex_lock(&fb_info->bl_curve_mutex);
+
+	fb_info->bl_curve[0] = off;
+
+	for (flat = 1; flat < (FB_BACKLIGHT_LEVELS / 16); ++flat)
+		fb_info->bl_curve[flat] = min;
+
+	count = FB_BACKLIGHT_LEVELS * 15 / 16;
+	for (i = 0; i < count; ++i)
+		fb_info->bl_curve[flat + i] = min + (range * (i + 1) / count);
+
+	mutex_unlock(&fb_info->bl_curve_mutex);
+}
+EXPORT_SYMBOL_GPL(fb_bl_default_curve);
+#endif
diff --git a/drivers/video/fbdev/core/fb_info.c b/drivers/video/fbdev/core/fb_info.c
new file mode 100644
index 0000000000000..8bdbefdd4b701
--- /dev/null
+++ b/drivers/video/fbdev/core/fb_info.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/export.h>
+#include <linux/fb.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+
+/**
+ * framebuffer_alloc - creates a new frame buffer info structure
+ *
+ * @size: size of driver private data, can be zero
+ * @dev: pointer to the device for this fb, this can be NULL
+ *
+ * Creates a new frame buffer info structure. Also reserves @size bytes
+ * for driver private data (info->par). info->par (if any) will be
+ * aligned to sizeof(long).
+ *
+ * Returns the new structure, or NULL if an error occurred.
+ *
+ */
+struct fb_info *framebuffer_alloc(size_t size, struct device *dev)
+{
+#define BYTES_PER_LONG (BITS_PER_LONG/8)
+#define PADDING (BYTES_PER_LONG - (sizeof(struct fb_info) % BYTES_PER_LONG))
+	int fb_info_size = sizeof(struct fb_info);
+	struct fb_info *info;
+	char *p;
+
+	if (size)
+		fb_info_size += PADDING;
+
+	p = kzalloc(fb_info_size + size, GFP_KERNEL);
+
+	if (!p)
+		return NULL;
+
+	info = (struct fb_info *) p;
+
+	if (size)
+		info->par = p + fb_info_size;
+
+	info->device = dev;
+	info->fbcon_rotate_hint = -1;
+
+#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
+	mutex_init(&info->bl_curve_mutex);
+#endif
+
+	return info;
+#undef PADDING
+#undef BYTES_PER_LONG
+}
+EXPORT_SYMBOL(framebuffer_alloc);
+
+/**
+ * framebuffer_release - marks the structure available for freeing
+ *
+ * @info: frame buffer info structure
+ *
+ * Drop the reference count of the device embedded in the
+ * framebuffer info structure.
+ *
+ */
+void framebuffer_release(struct fb_info *info)
+{
+	if (!info)
+		return;
+
+	if (WARN_ON(refcount_read(&info->count)))
+		return;
+
+#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
+	mutex_destroy(&info->bl_curve_mutex);
+#endif
+
+	kfree(info);
+}
+EXPORT_SYMBOL(framebuffer_release);
diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
index 0c33c4adcd798..849073f1ca067 100644
--- a/drivers/video/fbdev/core/fbsysfs.c
+++ b/drivers/video/fbdev/core/fbsysfs.c
@@ -5,93 +5,12 @@
  * Copyright (c) 2004 James Simmons <jsimmons@infradead.org>
  */
 
-/*
- * Note:  currently there's only stubs for framebuffer_alloc and
- * framebuffer_release here.  The reson for that is that until all drivers
- * are converted to use it a sysfsification will open OOPSable races.
- */
-
-#include <linux/kernel.h>
-#include <linux/slab.h>
+#include <linux/console.h>
 #include <linux/fb.h>
 #include <linux/fbcon.h>
-#include <linux/console.h>
-#include <linux/module.h>
 
 #define FB_SYSFS_FLAG_ATTR 1
 
-/**
- * framebuffer_alloc - creates a new frame buffer info structure
- *
- * @size: size of driver private data, can be zero
- * @dev: pointer to the device for this fb, this can be NULL
- *
- * Creates a new frame buffer info structure. Also reserves @size bytes
- * for driver private data (info->par). info->par (if any) will be
- * aligned to sizeof(long).
- *
- * Returns the new structure, or NULL if an error occurred.
- *
- */
-struct fb_info *framebuffer_alloc(size_t size, struct device *dev)
-{
-#define BYTES_PER_LONG (BITS_PER_LONG/8)
-#define PADDING (BYTES_PER_LONG - (sizeof(struct fb_info) % BYTES_PER_LONG))
-	int fb_info_size = sizeof(struct fb_info);
-	struct fb_info *info;
-	char *p;
-
-	if (size)
-		fb_info_size += PADDING;
-
-	p = kzalloc(fb_info_size + size, GFP_KERNEL);
-
-	if (!p)
-		return NULL;
-
-	info = (struct fb_info *) p;
-
-	if (size)
-		info->par = p + fb_info_size;
-
-	info->device = dev;
-	info->fbcon_rotate_hint = -1;
-
-#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
-	mutex_init(&info->bl_curve_mutex);
-#endif
-
-	return info;
-#undef PADDING
-#undef BYTES_PER_LONG
-}
-EXPORT_SYMBOL(framebuffer_alloc);
-
-/**
- * framebuffer_release - marks the structure available for freeing
- *
- * @info: frame buffer info structure
- *
- * Drop the reference count of the device embedded in the
- * framebuffer info structure.
- *
- */
-void framebuffer_release(struct fb_info *info)
-{
-	if (!info)
-		return;
-
-	if (WARN_ON(refcount_read(&info->count)))
-		return;
-
-#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
-	mutex_destroy(&info->bl_curve_mutex);
-#endif
-
-	kfree(info);
-}
-EXPORT_SYMBOL(framebuffer_release);
-
 static int activate(struct fb_info *fb_info, struct fb_var_screeninfo *var)
 {
 	int err;
@@ -551,30 +470,3 @@ void fb_cleanup_device(struct fb_info *fb_info)
 		fb_info->class_flag &= ~FB_SYSFS_FLAG_ATTR;
 	}
 }
-
-#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
-/* This function generates a linear backlight curve
- *
- *     0: off
- *   1-7: min
- * 8-127: linear from min to max
- */
-void fb_bl_default_curve(struct fb_info *fb_info, u8 off, u8 min, u8 max)
-{
-	unsigned int i, flat, count, range = (max - min);
-
-	mutex_lock(&fb_info->bl_curve_mutex);
-
-	fb_info->bl_curve[0] = off;
-
-	for (flat = 1; flat < (FB_BACKLIGHT_LEVELS / 16); ++flat)
-		fb_info->bl_curve[flat] = min;
-
-	count = FB_BACKLIGHT_LEVELS * 15 / 16;
-	for (i = 0; i < count; ++i)
-		fb_info->bl_curve[flat + i] = min + (range * (i + 1) / count);
-
-	mutex_unlock(&fb_info->bl_curve_mutex);
-}
-EXPORT_SYMBOL_GPL(fb_bl_default_curve);
-#endif
-- 
2.41.0

