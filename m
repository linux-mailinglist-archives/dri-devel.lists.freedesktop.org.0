Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7F69448FE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 12:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3329310E8E7;
	Thu,  1 Aug 2024 10:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fQwC+68i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922BB10E8E7
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 10:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722506826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5mLl/zDnyb6BNAC7mlJBei2SirdOlUVWUVKIwRncsHg=;
 b=fQwC+68iCUl+ZoBDlTzwo2g6WLDqQdXZKWhqKOEuzqz81Y2vwg0Si6IGGVFUn04tqbYj6F
 Dzl4LgHGzWmwkiJsfXbrAwKgPtOV0EoPlByk4RFYVoXx9PtRF/hUvNnoiPdDjWbtBNAAz6
 J+47YLIuyrmRx+0QTNIwjXBX2c30KyI=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-553-lcELWr0hPeSkDLJAyQbkCw-1; Thu,
 01 Aug 2024 06:07:03 -0400
X-MC-Unique: lcELWr0hPeSkDLJAyQbkCw-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2DB961955D4A; Thu,  1 Aug 2024 10:07:01 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.214])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4C64319560AE; Thu,  1 Aug 2024 10:06:56 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [RFC PATCH 1/3] [NOT FOR REVIEW] drm/panic: Squash of pending series
Date: Thu,  1 Aug 2024 12:04:23 +0200
Message-ID: <20240801100640.462606-2-jfalempe@redhat.com>
In-Reply-To: <20240801100640.462606-1-jfalempe@redhat.com>
References: <20240801100640.462606-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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

This is a squashed patch of:
https://patchwork.freedesktop.org/series/136377/
https://patchwork.freedesktop.org/series/135944/

This is to avoid to rebase when they are merged.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/Kconfig             |   31 +
 drivers/gpu/drm/Makefile            |    1 +
 drivers/gpu/drm/drm_crtc_internal.h |    8 +
 drivers/gpu/drm/drm_drv.c           |    3 +
 drivers/gpu/drm/drm_panic.c         |  367 ++++++++--
 drivers/gpu/drm/drm_panic_qr.rs     | 1003 +++++++++++++++++++++++++++
 include/drm/drm_panic.h             |   21 +-
 include/drm/drm_rect.h              |   15 +
 8 files changed, 1389 insertions(+), 60 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_panic_qr.rs

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index b6ea88d228e1..b3ab3ace7f8e 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -149,6 +149,37 @@ config DRM_PANIC_SCREEN
 	  or by writing to /sys/module/drm/parameters/panic_screen sysfs entry
 	  Default is "user"
 
+config DRM_PANIC_SCREEN_QR_CODE
+	bool "Add a panic screen with a QR code"
+	depends on DRM_PANIC && RUST
+	help
+	  This option adds a QR code generator, and a panic screen with a QR
+	  code. The QR code will contain the last lines of kmsg and other debug
+	  information. This should be easier for the user to report a kernel
+	  panic, with all debug information available.
+	  To use this panic screen, also set DRM_PANIC_SCREEN to "qr_code"
+
+config DRM_PANIC_SCREEN_QR_CODE_URL
+	string "Base URL of the QR code in the panic screen"
+	depends on DRM_PANIC_SCREEN_QR_CODE
+	help
+	  This option sets the base URL to report the kernel panic. If it's set
+	  the QR code will contain the URL and the kmsg compressed with zlib as
+	  a URL parameter. If it's empty, the QR code will contain the kmsg as
+	  uncompressed text only.
+	  There is a demo code in javascript, to decode and uncompress the kmsg
+	  data from the URL parameter at https://github.com/kdj0c/panic_report
+
+config DRM_PANIC_SCREEN_QR_VERSION
+	int "Maximum version (size) of the QR code."
+	depends on DRM_PANIC_SCREEN_QR_CODE
+	default 40
+	help
+	  This option limits the version (or size) of the QR code. QR code
+	  version ranges from Version 1 (21x21) to Version 40 (177x177).
+	  Smaller QR code are easier to read, but will contain less debugging
+	  data. Default is 40.
+
 config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
         bool "Enable refcount backtrace history in the DP MST helpers"
 	depends on STACKTRACE_SUPPORT
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 68cc9258ffc4..c62339b89d46 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -89,6 +89,7 @@ drm-$(CONFIG_DRM_PRIVACY_SCREEN) += \
 	drm_privacy_screen_x86.o
 drm-$(CONFIG_DRM_ACCEL) += ../../accel/drm_accel.o
 drm-$(CONFIG_DRM_PANIC) += drm_panic.o
+drm-$(CONFIG_DRM_PANIC_SCREEN_QR_CODE) += drm_panic_qr.o
 obj-$(CONFIG_DRM)	+= drm.o
 
 obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 061436361998..89706aa8232f 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -318,8 +318,16 @@ drm_edid_load_firmware(struct drm_connector *connector)
 /* drm_panic.c */
 #ifdef CONFIG_DRM_PANIC
 bool drm_panic_is_enabled(struct drm_device *dev);
+void drm_panic_register(struct drm_device *dev);
+void drm_panic_unregister(struct drm_device *dev);
+void drm_panic_init(void);
+void drm_panic_exit(void);
 #else
 static inline bool drm_panic_is_enabled(struct drm_device *dev) { return false; }
+static inline void drm_panic_register(struct drm_device *dev) {}
+static inline void drm_panic_unregister(struct drm_device *dev) {}
+static inline void drm_panic_init(void) {}
+static inline void drm_panic_exit(void) {}
 #endif
 
 #endif /* __DRM_CRTC_INTERNAL_H__ */
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 93543071a500..27007b53a8c8 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -1067,6 +1067,7 @@ static const struct file_operations drm_stub_fops = {
 static void drm_core_exit(void)
 {
 	drm_privacy_screen_lookup_exit();
+	drm_panic_exit();
 	accel_core_exit();
 	unregister_chrdev(DRM_MAJOR, "drm");
 	debugfs_remove(drm_debugfs_root);
@@ -1099,6 +1100,8 @@ static int __init drm_core_init(void)
 	if (ret < 0)
 		goto error;
 
+	drm_panic_init();
+
 	drm_privacy_screen_lookup_init();
 
 	drm_core_init_complete = true;
diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 072752b658f0..ec708ff9c40c 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -18,6 +18,8 @@
 #include <linux/overflow.h>
 #include <linux/printk.h>
 #include <linux/types.h>
+#include <linux/utsname.h>
+#include <linux/zlib.h>
 
 #include <drm/drm_drv.h>
 #include <drm/drm_fourcc.h>
@@ -26,6 +28,7 @@
 #include <drm/drm_panic.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_print.h>
+#include <drm/drm_rect.h>
 
 #include "drm_crtc_internal.h"
 
@@ -78,10 +81,13 @@ struct drm_panic_line {
 #define PANIC_LINE(s) {.len = sizeof(s) - 1, .txt = s}
 
 static struct drm_panic_line panic_msg[] = {
-	PANIC_LINE("KERNEL PANIC !"),
+	PANIC_LINE("KERNEL PANIC!"),
 	PANIC_LINE(""),
 	PANIC_LINE("Please reboot your computer."),
+	PANIC_LINE(""),
+	PANIC_LINE(""), /* will be replaced by the panic description */
 };
+static const int panic_msg_lines = ARRAY_SIZE(panic_msg);
 
 static const struct drm_panic_line logo_ascii[] = {
 	PANIC_LINE("     .--.        _"),
@@ -92,6 +98,7 @@ static const struct drm_panic_line logo_ascii[] = {
 	PANIC_LINE(" /'\\_   _/`\\    (_)"),
 	PANIC_LINE(" \\___)=(___/"),
 };
+static const int logo_ascii_lines = ARRAY_SIZE(logo_ascii);
 
 #if defined(CONFIG_LOGO) && !defined(MODULE)
 static const struct linux_logo *logo_mono;
@@ -251,20 +258,20 @@ static bool drm_panic_is_pixel_fg(const u8 *sbuf8, unsigned int spitch, int x, i
 static void drm_panic_blit16(struct iosys_map *dmap, unsigned int dpitch,
 			     const u8 *sbuf8, unsigned int spitch,
 			     unsigned int height, unsigned int width,
-			     u16 fg16)
+			     unsigned int scale, u16 fg16)
 {
 	unsigned int y, x;
 
 	for (y = 0; y < height; y++)
 		for (x = 0; x < width; x++)
-			if (drm_panic_is_pixel_fg(sbuf8, spitch, x, y))
+			if (drm_panic_is_pixel_fg(sbuf8, spitch, x / scale, y / scale))
 				iosys_map_wr(dmap, y * dpitch + x * sizeof(u16), u16, fg16);
 }
 
 static void drm_panic_blit24(struct iosys_map *dmap, unsigned int dpitch,
 			     const u8 *sbuf8, unsigned int spitch,
 			     unsigned int height, unsigned int width,
-			     u32 fg32)
+			     unsigned int scale, u32 fg32)
 {
 	unsigned int y, x;
 
@@ -272,7 +279,7 @@ static void drm_panic_blit24(struct iosys_map *dmap, unsigned int dpitch,
 		for (x = 0; x < width; x++) {
 			u32 off = y * dpitch + x * 3;
 
-			if (drm_panic_is_pixel_fg(sbuf8, spitch, x, y)) {
+			if (drm_panic_is_pixel_fg(sbuf8, spitch, x / scale, y / scale)) {
 				/* write blue-green-red to output in little endianness */
 				iosys_map_wr(dmap, off, u8, (fg32 & 0x000000FF) >> 0);
 				iosys_map_wr(dmap, off + 1, u8, (fg32 & 0x0000FF00) >> 8);
@@ -285,24 +292,25 @@ static void drm_panic_blit24(struct iosys_map *dmap, unsigned int dpitch,
 static void drm_panic_blit32(struct iosys_map *dmap, unsigned int dpitch,
 			     const u8 *sbuf8, unsigned int spitch,
 			     unsigned int height, unsigned int width,
-			     u32 fg32)
+			     unsigned int scale, u32 fg32)
 {
 	unsigned int y, x;
 
 	for (y = 0; y < height; y++)
 		for (x = 0; x < width; x++)
-			if (drm_panic_is_pixel_fg(sbuf8, spitch, x, y))
+			if (drm_panic_is_pixel_fg(sbuf8, spitch, x / scale, y / scale))
 				iosys_map_wr(dmap, y * dpitch + x * sizeof(u32), u32, fg32);
 }
 
 static void drm_panic_blit_pixel(struct drm_scanout_buffer *sb, struct drm_rect *clip,
-				 const u8 *sbuf8, unsigned int spitch, u32 fg_color)
+				 const u8 *sbuf8, unsigned int spitch, unsigned int scale,
+				 u32 fg_color)
 {
 	unsigned int y, x;
 
 	for (y = 0; y < drm_rect_height(clip); y++)
 		for (x = 0; x < drm_rect_width(clip); x++)
-			if (drm_panic_is_pixel_fg(sbuf8, spitch, x, y))
+			if (drm_panic_is_pixel_fg(sbuf8, spitch, x / scale, y / scale))
 				sb->set_pixel(sb, clip->x1 + x, clip->y1 + y, fg_color);
 }
 
@@ -312,18 +320,22 @@ static void drm_panic_blit_pixel(struct drm_scanout_buffer *sb, struct drm_rect
  * @clip: destination rectangle
  * @sbuf8: source buffer, in monochrome format, 8 pixels per byte.
  * @spitch: source pitch in bytes
+ * @scale: integer scale, source buffer is scale time smaller than destination
+ *         rectangle
  * @fg_color: foreground color, in destination format
  *
  * This can be used to draw a font character, which is a monochrome image, to a
  * framebuffer in other supported format.
  */
 static void drm_panic_blit(struct drm_scanout_buffer *sb, struct drm_rect *clip,
-			   const u8 *sbuf8, unsigned int spitch, u32 fg_color)
+			   const u8 *sbuf8, unsigned int spitch,
+			   unsigned int scale, u32 fg_color)
+
 {
 	struct iosys_map map;
 
 	if (sb->set_pixel)
-		return drm_panic_blit_pixel(sb, clip, sbuf8, spitch, fg_color);
+		return drm_panic_blit_pixel(sb, clip, sbuf8, spitch, scale, fg_color);
 
 	map = sb->map[0];
 	iosys_map_incr(&map, clip->y1 * sb->pitch[0] + clip->x1 * sb->format->cpp[0]);
@@ -331,15 +343,15 @@ static void drm_panic_blit(struct drm_scanout_buffer *sb, struct drm_rect *clip,
 	switch (sb->format->cpp[0]) {
 	case 2:
 		drm_panic_blit16(&map, sb->pitch[0], sbuf8, spitch,
-				 drm_rect_height(clip), drm_rect_width(clip), fg_color);
+				 drm_rect_height(clip), drm_rect_width(clip), scale, fg_color);
 	break;
 	case 3:
 		drm_panic_blit24(&map, sb->pitch[0], sbuf8, spitch,
-				 drm_rect_height(clip), drm_rect_width(clip), fg_color);
+				 drm_rect_height(clip), drm_rect_width(clip), scale, fg_color);
 	break;
 	case 4:
 		drm_panic_blit32(&map, sb->pitch[0], sbuf8, spitch,
-				 drm_rect_height(clip), drm_rect_width(clip), fg_color);
+				 drm_rect_height(clip), drm_rect_width(clip), scale, fg_color);
 	break;
 	default:
 		WARN_ONCE(1, "Can't blit with pixel width %d\n", sb->format->cpp[0]);
@@ -479,39 +491,51 @@ static void draw_txt_rectangle(struct drm_scanout_buffer *sb,
 		for (j = 0; j < line_len; j++) {
 			src = get_char_bitmap(font, msg[i].txt[j], font_pitch);
 			rec.x2 = rec.x1 + font->width;
-			drm_panic_blit(sb, &rec, src, font_pitch, color);
+			drm_panic_blit(sb, &rec, src, font_pitch, 1, color);
 			rec.x1 += font->width;
 		}
 	}
 }
 
+static void drm_panic_logo_rect(struct drm_rect *rect, const struct font_desc *font)
+{
+	if (logo_mono)
+		drm_rect_init(rect, 0, 0, logo_mono->width, logo_mono->height);
+	else {
+		int logo_width = get_max_line_len(logo_ascii, logo_ascii_lines) * font->width;
+
+		drm_rect_init(rect, 0, 0, logo_width, logo_ascii_lines * font->height);
+	}
+}
+
+static void drm_panic_logo_draw(struct drm_scanout_buffer *sb, struct drm_rect *rect,
+				const struct font_desc *font, u32 fg_color)
+{
+	if (logo_mono)
+		drm_panic_blit(sb, rect, logo_mono->data,
+			       DIV_ROUND_UP(drm_rect_width(rect), 8), 1, fg_color);
+	else
+		draw_txt_rectangle(sb, font, logo_ascii, logo_ascii_lines, false, rect,
+				   fg_color);
+}
+
 static void draw_panic_static_user(struct drm_scanout_buffer *sb)
 {
-	size_t msg_lines = ARRAY_SIZE(panic_msg);
-	size_t logo_ascii_lines = ARRAY_SIZE(logo_ascii);
 	u32 fg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR, sb->format->format);
 	u32 bg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR, sb->format->format);
 	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
 	struct drm_rect r_screen, r_logo, r_msg;
-	unsigned int logo_width, logo_height;
+	unsigned int panic_msg_width;
 
 	if (!font)
 		return;
 
 	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
-
-	if (logo_mono) {
-		logo_width = logo_mono->width;
-		logo_height = logo_mono->height;
-	} else {
-		logo_width = get_max_line_len(logo_ascii, logo_ascii_lines) * font->width;
-		logo_height = logo_ascii_lines * font->height;
-	}
-
-	r_logo = DRM_RECT_INIT(0, 0, logo_width, logo_height);
+	drm_panic_logo_rect(&r_logo, font);
+	panic_msg_width = get_max_line_len(panic_msg, panic_msg_lines) * font->width;
 	r_msg = DRM_RECT_INIT(0, 0,
-			      min(get_max_line_len(panic_msg, msg_lines) * font->width, sb->width),
-			      min(msg_lines * font->height, sb->height));
+			      min(panic_msg_width, sb->width),
+			      min(panic_msg_lines * font->height, sb->height));
 
 	/* Center the panic message */
 	drm_rect_translate(&r_msg, (sb->width - r_msg.x2) / 2, (sb->height - r_msg.y2) / 2);
@@ -519,16 +543,10 @@ static void draw_panic_static_user(struct drm_scanout_buffer *sb)
 	/* Fill with the background color, and draw text on top */
 	drm_panic_fill(sb, &r_screen, bg_color);
 
-	if ((r_msg.x1 >= logo_width || r_msg.y1 >= logo_height) &&
-	    logo_width <= sb->width && logo_height <= sb->height) {
-		if (logo_mono)
-			drm_panic_blit(sb, &r_logo, logo_mono->data, DIV_ROUND_UP(logo_width, 8),
-				       fg_color);
-		else
-			draw_txt_rectangle(sb, font, logo_ascii, logo_ascii_lines, false, &r_logo,
-					   fg_color);
-	}
-	draw_txt_rectangle(sb, font, panic_msg, msg_lines, true, &r_msg, fg_color);
+	if (!drm_rect_overlap(&r_logo, &r_msg))
+		drm_panic_logo_draw(sb, &r_logo, font, fg_color);
+
+	draw_txt_rectangle(sb, font, panic_msg, panic_msg_lines, true, &r_msg, fg_color);
 }
 
 /*
@@ -610,6 +628,234 @@ static void draw_panic_static_kmsg(struct drm_scanout_buffer *sb)
 	}
 }
 
+#if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
+/*
+ * It is unwise to allocate memory in the panic callback, so the buffers are
+ * pre-allocated. Only 2 buffers and the zlib workspace are needed.
+ * Two buffers are enough, using the following buffer usage:
+ * 1) kmsg messages are dumped in buffer1
+ * 2) kmsg is zlib-compressed into buffer2
+ * 3) compressed kmsg is encoded as QR-code Numeric stream in buffer1
+ * 4) QR-code image is generated in buffer2
+ * The Max QR code size is V40, 177x177, 4071 bytes for image, 2956 bytes for
+ * data segments.
+ *
+ * Typically, ~7500 bytes of kmsg, are compressed into 2800 bytes, which fits in
+ * a V40 QR-code (177x177).
+ *
+ * If CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL is not set, the kmsg data will be put
+ * directly in the QR code.
+ * 1) kmsg messages are dumped in buffer1
+ * 2) kmsg message is encoded as byte stream in buffer2
+ * 3) QR-code image is generated in buffer1
+ */
+
+static uint panic_qr_version = CONFIG_DRM_PANIC_SCREEN_QR_VERSION;
+module_param(panic_qr_version, uint, 0644);
+MODULE_PARM_DESC(panic_qr_version, "maximum version (size) of the QR code");
+
+#define MAX_QR_DATA 2956
+#define MAX_ZLIB_RATIO 3
+#define QR_BUFFER1_SIZE (MAX_ZLIB_RATIO * MAX_QR_DATA) /* Must also be > 4071  */
+#define QR_BUFFER2_SIZE 4096
+#define QR_MARGIN	4	/* 4 modules of foreground color around the qr code */
+
+/* Compression parameters */
+#define COMPR_LEVEL 6
+#define WINDOW_BITS 12
+#define MEM_LEVEL 4
+
+static char *qrbuf1;
+static char *qrbuf2;
+static struct z_stream_s stream;
+
+static void __init drm_panic_qr_init(void)
+{
+	qrbuf1 = kmalloc(QR_BUFFER1_SIZE, GFP_KERNEL);
+	qrbuf2 = kmalloc(QR_BUFFER2_SIZE, GFP_KERNEL);
+	stream.workspace = kmalloc(zlib_deflate_workspacesize(WINDOW_BITS, MEM_LEVEL),
+				   GFP_KERNEL);
+}
+
+static void drm_panic_qr_exit(void)
+{
+	kfree(qrbuf1);
+	qrbuf1 = NULL;
+	kfree(qrbuf2);
+	qrbuf2 = NULL;
+	kfree(stream.workspace);
+	stream.workspace = NULL;
+}
+
+extern size_t drm_panic_qr_max_data_size(u8 version, size_t url_len);
+
+extern u8 drm_panic_qr_generate(const char *url, u8 *data, size_t data_len, size_t data_size,
+				u8 *tmp, size_t tmp_size);
+
+static int drm_panic_get_qr_code_url(u8 **qr_image)
+{
+	struct kmsg_dump_iter iter;
+	char url[256];
+	size_t kmsg_len, max_kmsg_size;
+	char *kmsg;
+	int max_qr_data_size, url_len;
+
+	url_len = snprintf(url, sizeof(url), CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL "?a=%s&v=%s&zl=",
+			   utsname()->machine, utsname()->release);
+
+	max_qr_data_size = drm_panic_qr_max_data_size(panic_qr_version, url_len);
+	max_kmsg_size = min(MAX_ZLIB_RATIO * max_qr_data_size, QR_BUFFER1_SIZE);
+
+	/* get kmsg to buffer 1 */
+	kmsg_dump_rewind(&iter);
+	kmsg_dump_get_buffer(&iter, false, qrbuf1, max_kmsg_size, &kmsg_len);
+
+	if (!kmsg_len)
+		return -ENODATA;
+	kmsg = qrbuf1;
+
+try_again:
+	if (zlib_deflateInit2(&stream, COMPR_LEVEL, Z_DEFLATED, WINDOW_BITS,
+			      MEM_LEVEL, Z_DEFAULT_STRATEGY) != Z_OK)
+		return -EINVAL;
+
+	stream.next_in = kmsg;
+	stream.avail_in = kmsg_len;
+	stream.total_in = 0;
+	stream.next_out = qrbuf2;
+	stream.avail_out = QR_BUFFER2_SIZE;
+	stream.total_out = 0;
+
+	if (zlib_deflate(&stream, Z_FINISH) != Z_STREAM_END)
+		return -EINVAL;
+
+	if (zlib_deflateEnd(&stream) != Z_OK)
+		return -EINVAL;
+
+	if (stream.total_out > max_qr_data_size) {
+		/* too much data for the QR code, so skip the first line and try again */
+		kmsg = strchr(kmsg, '\n');
+		if (!kmsg)
+			return -EINVAL;
+		/* skip the first \n */
+		kmsg += 1;
+		kmsg_len = strlen(kmsg);
+		goto try_again;
+	}
+	*qr_image = qrbuf2;
+
+	/* generate qr code image in buffer2 */
+	return drm_panic_qr_generate(url, qrbuf2, stream.total_out, QR_BUFFER2_SIZE,
+				     qrbuf1, QR_BUFFER1_SIZE);
+}
+
+static int drm_panic_get_qr_code_raw(u8 **qr_image)
+{
+	struct kmsg_dump_iter iter;
+	size_t kmsg_len;
+	size_t max_kmsg_size = min(drm_panic_qr_max_data_size(panic_qr_version, 0),
+				   QR_BUFFER1_SIZE);
+
+	kmsg_dump_rewind(&iter);
+	kmsg_dump_get_buffer(&iter, false, qrbuf1, max_kmsg_size, &kmsg_len);
+	if (!kmsg_len)
+		return -ENODATA;
+
+	*qr_image = qrbuf1;
+	return drm_panic_qr_generate(NULL, qrbuf1, kmsg_len, QR_BUFFER1_SIZE,
+				     qrbuf2, QR_BUFFER2_SIZE);
+}
+
+static int drm_panic_get_qr_code(u8 **qr_image)
+{
+	if (strlen(CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL) > 0)
+		return drm_panic_get_qr_code_url(qr_image);
+	else
+		return drm_panic_get_qr_code_raw(qr_image);
+}
+
+/*
+ * Draw the panic message at the center of the screen, with a QR Code
+ */
+static int _draw_panic_static_qr_code(struct drm_scanout_buffer *sb)
+{
+	u32 fg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR, sb->format->format);
+	u32 bg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR, sb->format->format);
+	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
+	struct drm_rect r_screen, r_logo, r_msg, r_qr, r_qr_canvas;
+	size_t max_qr_size, scale;
+	unsigned int panic_msg_width, qr_width, qr_canvas_width, v_margin;
+	u8 *qr_image;
+	unsigned int qr_pitch;
+
+	if (!font || !qrbuf1 || !qrbuf2 || !stream.workspace)
+		return -ENOMEM;
+
+	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
+
+	drm_panic_logo_rect(&r_logo, font);
+
+	panic_msg_width = get_max_line_len(panic_msg, panic_msg_lines) * font->width;
+	r_msg = DRM_RECT_INIT(0, 0,
+			      min(panic_msg_width, sb->width),
+			      min(panic_msg_lines * font->height, sb->height));
+
+	max_qr_size = min(3 * sb->width / 4, 3 * sb->height / 4);
+
+	qr_width = drm_panic_get_qr_code(&qr_image);
+	if (qr_width <= 0)
+		return -ENOSPC;
+
+	qr_canvas_width = qr_width + QR_MARGIN * 2;
+	scale = max_qr_size / qr_canvas_width;
+	/* QR code is not readable if not scaled at least by 2 */
+	if (scale < 2)
+		return -ENOSPC;
+
+	pr_debug("QR width %d and scale %zu\n", qr_width, scale);
+	r_qr_canvas = DRM_RECT_INIT(0, 0, qr_canvas_width * scale, qr_canvas_width * scale);
+
+	v_margin = (sb->height - drm_rect_height(&r_qr_canvas) - drm_rect_height(&r_msg)) / 5;
+
+	drm_rect_translate(&r_qr_canvas, (sb->width - r_qr_canvas.x2) / 2, 2 * v_margin);
+	r_qr = DRM_RECT_INIT(r_qr_canvas.x1 + QR_MARGIN * scale, r_qr_canvas.y1 + QR_MARGIN * scale,
+			     qr_width * scale, qr_width * scale);
+
+	/* Center the panic message */
+	drm_rect_translate(&r_msg, (sb->width - r_msg.x2) / 2,
+			   3 * v_margin + drm_rect_height(&r_qr_canvas));
+
+	/* Fill with the background color, and draw text on top */
+	drm_panic_fill(sb, &r_screen, bg_color);
+
+	if (!drm_rect_overlap(&r_logo, &r_msg) && !drm_rect_overlap(&r_logo, &r_qr))
+		drm_panic_logo_draw(sb, &r_logo, font, fg_color);
+
+	draw_txt_rectangle(sb, font, panic_msg, panic_msg_lines, true, &r_msg, fg_color);
+
+	/* Draw the qr code */
+	qr_pitch = DIV_ROUND_UP(qr_width, 8);
+	drm_panic_fill(sb, &r_qr_canvas, fg_color);
+	drm_panic_fill(sb, &r_qr, bg_color);
+	drm_panic_blit(sb, &r_qr, qr_image, qr_pitch, scale, fg_color);
+	return 0;
+}
+
+static void draw_panic_static_qr_code(struct drm_scanout_buffer *sb)
+{
+	if (_draw_panic_static_qr_code(sb))
+		draw_panic_static_user(sb);
+}
+#else
+static void draw_panic_static_qr_code(struct drm_scanout_buffer *sb)
+{
+	draw_panic_static_user(sb);
+}
+static void drm_panic_qr_init(void) {};
+static void drm_panic_qr_exit(void) {};
+#endif
+
+
 /*
  * drm_panic_is_format_supported()
  * @format: a fourcc color code
@@ -628,12 +874,27 @@ static void draw_panic_dispatch(struct drm_scanout_buffer *sb)
 {
 	if (!strcmp(drm_panic_screen, "kmsg")) {
 		draw_panic_static_kmsg(sb);
+	} else if (!strcmp(drm_panic_screen, "qr_code")) {
+		draw_panic_static_qr_code(sb);
 	} else {
 		draw_panic_static_user(sb);
 	}
 }
 
-static void draw_panic_plane(struct drm_plane *plane)
+static void drm_panic_set_description(const char *description)
+{
+	u32 len;
+	if (description) {
+		panic_msg[4].txt = description;
+		len = strlen(description);
+		/* ignore the last newline character */
+		if (len && description[len - 1] == '\n')
+			len -= 1;
+		panic_msg[4].len = len;
+	}
+}
+
+static void draw_panic_plane(struct drm_plane *plane, const char *description)
 {
 	struct drm_scanout_buffer sb = { };
 	int ret;
@@ -642,6 +903,8 @@ static void draw_panic_plane(struct drm_plane *plane)
 	if (!drm_panic_trylock(plane->dev, flags))
 		return;
 
+	drm_panic_set_description(description);
+
 	ret = plane->helper_private->get_scanout_buffer(plane, &sb);
 
 	if (!ret && drm_panic_is_format_supported(sb.format)) {
@@ -662,7 +925,7 @@ static void drm_panic(struct kmsg_dumper *dumper, struct kmsg_dump_detail *detai
 	struct drm_plane *plane = to_drm_plane(dumper);
 
 	if (detail->reason == KMSG_DUMP_PANIC)
-		draw_panic_plane(plane);
+		draw_panic_plane(plane, detail->description);
 }
 
 
@@ -682,7 +945,7 @@ static ssize_t debugfs_trigger_write(struct file *file, const char __user *user_
 	if (kstrtobool_from_user(user_buf, count, &run) == 0 && run) {
 		struct drm_plane *plane = file->private_data;
 
-		draw_panic_plane(plane);
+		draw_panic_plane(plane, "Test from debugfs");
 	}
 	return count;
 }
@@ -752,7 +1015,6 @@ void drm_panic_register(struct drm_device *dev)
 	if (registered_plane)
 		drm_info(dev, "Registered %d planes with drm panic\n", registered_plane);
 }
-EXPORT_SYMBOL(drm_panic_register);
 
 /**
  * drm_panic_unregister()
@@ -771,4 +1033,19 @@ void drm_panic_unregister(struct drm_device *dev)
 		kmsg_dump_unregister(&plane->kmsg_panic);
 	}
 }
-EXPORT_SYMBOL(drm_panic_unregister);
+
+/**
+ * drm_panic_init() - initialize DRM panic.
+ */
+void __init drm_panic_init(void)
+{
+	drm_panic_qr_init();
+}
+
+/**
+ * drm_panic_exit() - Free the resources taken by drm_panic_exit()
+ */
+void drm_panic_exit(void)
+{
+	drm_panic_qr_exit();
+}
diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
new file mode 100644
index 000000000000..1ef56cb07dfb
--- /dev/null
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -0,0 +1,1003 @@
+// SPDX-License-Identifier: MIT
+
+//! This is a simple QR encoder for DRM panic.
+//!
+//! It is called from a panic handler, so it should't allocate memory and
+//! does all the work on the stack or on the provided buffers. For
+//! simplification, it only supports low error correction, and applies the
+//! first mask (checkerboard). It will draw the smallest QRcode that can
+//! contain the string passed as parameter. To get the most compact
+//! QR code, the start of the URL is encoded as binary, and the
+//! compressed kmsg is encoded as numeric.
+//!
+//! The binary data must be a valid URL parameter, so the easiest way is
+//! to use base64 encoding. But this wastes 25% of data space, so the
+//! whole stack trace won't fit in the QR code. So instead it encodes
+//! every 13bits of input into 4 decimal digits, and then uses the
+//! efficient numeric encoding, that encode 3 decimal digits into
+//! 10bits. This makes 39bits of compressed data into 12 decimal digits,
+//! into 40bits in the QR code, so wasting only 2.5%. And the numbers are
+//! valid URL parameter, so the website can do the reverse, to get the
+//! binary data.
+//!
+//! Inspired by these 3 projects, all under MIT license:
+//!
+//! * <https://github.com/kennytm/qrcode-rust>
+//! * <https://github.com/erwanvivien/fast_qr>
+//! * <https://github.com/bjguillot/qr>
+
+use core::cmp;
+use kernel::str::CStr;
+
+#[derive(Debug, Clone, Copy, PartialEq, Eq, Ord, PartialOrd)]
+struct Version(usize);
+
+// Generator polynomials for ECC, only those that are needed for low quality.
+const P7: [u8; 7] = [87, 229, 146, 149, 238, 102, 21];
+const P10: [u8; 10] = [251, 67, 46, 61, 118, 70, 64, 94, 32, 45];
+const P15: [u8; 15] = [
+    8, 183, 61, 91, 202, 37, 51, 58, 58, 237, 140, 124, 5, 99, 105,
+];
+const P18: [u8; 18] = [
+    215, 234, 158, 94, 184, 97, 118, 170, 79, 187, 152, 148, 252, 179, 5, 98, 96, 153,
+];
+const P20: [u8; 20] = [
+    17, 60, 79, 50, 61, 163, 26, 187, 202, 180, 221, 225, 83, 239, 156, 164, 212, 212, 188, 190,
+];
+const P22: [u8; 22] = [
+    210, 171, 247, 242, 93, 230, 14, 109, 221, 53, 200, 74, 8, 172, 98, 80, 219, 134, 160, 105,
+    165, 231,
+];
+const P24: [u8; 24] = [
+    229, 121, 135, 48, 211, 117, 251, 126, 159, 180, 169, 152, 192, 226, 228, 218, 111, 0, 117,
+    232, 87, 96, 227, 21,
+];
+const P26: [u8; 26] = [
+    173, 125, 158, 2, 103, 182, 118, 17, 145, 201, 111, 28, 165, 53, 161, 21, 245, 142, 13, 102,
+    48, 227, 153, 145, 218, 70,
+];
+const P28: [u8; 28] = [
+    168, 223, 200, 104, 224, 234, 108, 180, 110, 190, 195, 147, 205, 27, 232, 201, 21, 43, 245, 87,
+    42, 195, 212, 119, 242, 37, 9, 123,
+];
+const P30: [u8; 30] = [
+    41, 173, 145, 152, 216, 31, 179, 182, 50, 48, 110, 86, 239, 96, 222, 125, 42, 173, 226, 193,
+    224, 130, 156, 37, 251, 216, 238, 40, 192, 180,
+];
+
+/// QR Code parameters for Low quality ECC:
+/// - Error Correction polynomial.
+/// - Number of blocks in group 1.
+/// - Number of blocks in group 2.
+/// - Block size in group 1.
+///
+/// (Block size in group 2 is one more than group 1).
+struct VersionParameter(&'static [u8], u8, u8, u8);
+const VPARAM: [VersionParameter; 40] = [
+    VersionParameter(&P7, 1, 0, 19),    // V1
+    VersionParameter(&P10, 1, 0, 34),   // V2
+    VersionParameter(&P15, 1, 0, 55),   // V3
+    VersionParameter(&P20, 1, 0, 80),   // V4
+    VersionParameter(&P26, 1, 0, 108),  // V5
+    VersionParameter(&P18, 2, 0, 68),   // V6
+    VersionParameter(&P20, 2, 0, 78),   // V7
+    VersionParameter(&P24, 2, 0, 97),   // V8
+    VersionParameter(&P30, 2, 0, 116),  // V9
+    VersionParameter(&P18, 2, 2, 68),   // V10
+    VersionParameter(&P20, 4, 0, 81),   // V11
+    VersionParameter(&P24, 2, 2, 92),   // V12
+    VersionParameter(&P26, 4, 0, 107),  // V13
+    VersionParameter(&P30, 3, 1, 115),  // V14
+    VersionParameter(&P22, 5, 1, 87),   // V15
+    VersionParameter(&P24, 5, 1, 98),   // V16
+    VersionParameter(&P28, 1, 5, 107),  // V17
+    VersionParameter(&P30, 5, 1, 120),  // V18
+    VersionParameter(&P28, 3, 4, 113),  // V19
+    VersionParameter(&P28, 3, 5, 107),  // V20
+    VersionParameter(&P28, 4, 4, 116),  // V21
+    VersionParameter(&P28, 2, 7, 111),  // V22
+    VersionParameter(&P30, 4, 5, 121),  // V23
+    VersionParameter(&P30, 6, 4, 117),  // V24
+    VersionParameter(&P26, 8, 4, 106),  // V25
+    VersionParameter(&P28, 10, 2, 114), // V26
+    VersionParameter(&P30, 8, 4, 122),  // V27
+    VersionParameter(&P30, 3, 10, 117), // V28
+    VersionParameter(&P30, 7, 7, 116),  // V29
+    VersionParameter(&P30, 5, 10, 115), // V30
+    VersionParameter(&P30, 13, 3, 115), // V31
+    VersionParameter(&P30, 17, 0, 115), // V32
+    VersionParameter(&P30, 17, 1, 115), // V33
+    VersionParameter(&P30, 13, 6, 115), // V34
+    VersionParameter(&P30, 12, 7, 121), // V35
+    VersionParameter(&P30, 6, 14, 121), // V36
+    VersionParameter(&P30, 17, 4, 122), // V37
+    VersionParameter(&P30, 4, 18, 122), // V38
+    VersionParameter(&P30, 20, 4, 117), // V39
+    VersionParameter(&P30, 19, 6, 118), // V40
+];
+
+const MAX_EC_SIZE: usize = 30;
+const MAX_BLK_SIZE: usize = 123;
+
+/// Position of the alignment pattern grid.
+const ALIGNMENT_PATTERNS: [&[u8]; 40] = [
+    &[],
+    &[6, 18],
+    &[6, 22],
+    &[6, 26],
+    &[6, 30],
+    &[6, 34],
+    &[6, 22, 38],
+    &[6, 24, 42],
+    &[6, 26, 46],
+    &[6, 28, 50],
+    &[6, 30, 54],
+    &[6, 32, 58],
+    &[6, 34, 62],
+    &[6, 26, 46, 66],
+    &[6, 26, 48, 70],
+    &[6, 26, 50, 74],
+    &[6, 30, 54, 78],
+    &[6, 30, 56, 82],
+    &[6, 30, 58, 86],
+    &[6, 34, 62, 90],
+    &[6, 28, 50, 72, 94],
+    &[6, 26, 50, 74, 98],
+    &[6, 30, 54, 78, 102],
+    &[6, 28, 54, 80, 106],
+    &[6, 32, 58, 84, 110],
+    &[6, 30, 58, 86, 114],
+    &[6, 34, 62, 90, 118],
+    &[6, 26, 50, 74, 98, 122],
+    &[6, 30, 54, 78, 102, 126],
+    &[6, 26, 52, 78, 104, 130],
+    &[6, 30, 56, 82, 108, 134],
+    &[6, 34, 60, 86, 112, 138],
+    &[6, 30, 58, 86, 114, 142],
+    &[6, 34, 62, 90, 118, 146],
+    &[6, 30, 54, 78, 102, 126, 150],
+    &[6, 24, 50, 76, 102, 128, 154],
+    &[6, 28, 54, 80, 106, 132, 158],
+    &[6, 32, 58, 84, 110, 136, 162],
+    &[6, 26, 54, 82, 110, 138, 166],
+    &[6, 30, 58, 86, 114, 142, 170],
+];
+
+/// Version information for format V7-V40.
+const VERSION_INFORMATION: [u32; 34] = [
+    0b00_0111_1100_1001_0100,
+    0b00_1000_0101_1011_1100,
+    0b00_1001_1010_1001_1001,
+    0b00_1010_0100_1101_0011,
+    0b00_1011_1011_1111_0110,
+    0b00_1100_0111_0110_0010,
+    0b00_1101_1000_0100_0111,
+    0b00_1110_0110_0000_1101,
+    0b00_1111_1001_0010_1000,
+    0b01_0000_1011_0111_1000,
+    0b01_0001_0100_0101_1101,
+    0b01_0010_1010_0001_0111,
+    0b01_0011_0101_0011_0010,
+    0b01_0100_1001_1010_0110,
+    0b01_0101_0110_1000_0011,
+    0b01_0110_1000_1100_1001,
+    0b01_0111_0111_1110_1100,
+    0b01_1000_1110_1100_0100,
+    0b01_1001_0001_1110_0001,
+    0b01_1010_1111_1010_1011,
+    0b01_1011_0000_1000_1110,
+    0b01_1100_1100_0001_1010,
+    0b01_1101_0011_0011_1111,
+    0b01_1110_1101_0111_0101,
+    0b01_1111_0010_0101_0000,
+    0b10_0000_1001_1101_0101,
+    0b10_0001_0110_1111_0000,
+    0b10_0010_1000_1011_1010,
+    0b10_0011_0111_1001_1111,
+    0b10_0100_1011_0000_1011,
+    0b10_0101_0100_0010_1110,
+    0b10_0110_1010_0110_0100,
+    0b10_0111_0101_0100_0001,
+    0b10_1000_1100_0110_1001,
+];
+
+/// Format info for low quality ECC.
+const FORMAT_INFOS_QR_L: [u16; 8] = [
+    0x77c4, 0x72f3, 0x7daa, 0x789d, 0x662f, 0x6318, 0x6c41, 0x6976,
+];
+
+impl Version {
+    /// Returns the smallest QR version than can hold these segments.
+    fn from_segments(segments: &[&Segment<'_>]) -> Option<Version> {
+        for v in (1..=40).map(|k| Version(k)) {
+            if v.max_data() * 8 >= segments.iter().map(|s| s.total_size_bits(v)).sum() {
+                return Some(v);
+            }
+        }
+        None
+    }
+
+    fn width(&self) -> u8 {
+        (self.0 as u8) * 4 + 17
+    }
+
+    fn max_data(&self) -> usize {
+        self.g1_blk_size() * self.g1_blocks() + (self.g1_blk_size() + 1) * self.g2_blocks()
+    }
+
+    fn ec_size(&self) -> usize {
+        VPARAM[self.0 - 1].0.len()
+    }
+
+    fn g1_blocks(&self) -> usize {
+        VPARAM[self.0 - 1].1 as usize
+    }
+
+    fn g2_blocks(&self) -> usize {
+        VPARAM[self.0 - 1].2 as usize
+    }
+
+    fn g1_blk_size(&self) -> usize {
+        VPARAM[self.0 - 1].3 as usize
+    }
+
+    fn alignment_pattern(&self) -> &'static [u8] {
+        &ALIGNMENT_PATTERNS[self.0 - 1]
+    }
+
+    fn poly(&self) -> &'static [u8] {
+        VPARAM[self.0 - 1].0
+    }
+
+    fn version_info(&self) -> u32 {
+        if *self >= Version(7) {
+            VERSION_INFORMATION[self.0 - 7]
+        } else {
+            0
+        }
+    }
+}
+
+/// Exponential table for Galois Field GF(256).
+const EXP_TABLE: [u8; 256] = [
+    1, 2, 4, 8, 16, 32, 64, 128, 29, 58, 116, 232, 205, 135, 19, 38, 76, 152, 45, 90, 180, 117,
+    234, 201, 143, 3, 6, 12, 24, 48, 96, 192, 157, 39, 78, 156, 37, 74, 148, 53, 106, 212, 181,
+    119, 238, 193, 159, 35, 70, 140, 5, 10, 20, 40, 80, 160, 93, 186, 105, 210, 185, 111, 222, 161,
+    95, 190, 97, 194, 153, 47, 94, 188, 101, 202, 137, 15, 30, 60, 120, 240, 253, 231, 211, 187,
+    107, 214, 177, 127, 254, 225, 223, 163, 91, 182, 113, 226, 217, 175, 67, 134, 17, 34, 68, 136,
+    13, 26, 52, 104, 208, 189, 103, 206, 129, 31, 62, 124, 248, 237, 199, 147, 59, 118, 236, 197,
+    151, 51, 102, 204, 133, 23, 46, 92, 184, 109, 218, 169, 79, 158, 33, 66, 132, 21, 42, 84, 168,
+    77, 154, 41, 82, 164, 85, 170, 73, 146, 57, 114, 228, 213, 183, 115, 230, 209, 191, 99, 198,
+    145, 63, 126, 252, 229, 215, 179, 123, 246, 241, 255, 227, 219, 171, 75, 150, 49, 98, 196, 149,
+    55, 110, 220, 165, 87, 174, 65, 130, 25, 50, 100, 200, 141, 7, 14, 28, 56, 112, 224, 221, 167,
+    83, 166, 81, 162, 89, 178, 121, 242, 249, 239, 195, 155, 43, 86, 172, 69, 138, 9, 18, 36, 72,
+    144, 61, 122, 244, 245, 247, 243, 251, 235, 203, 139, 11, 22, 44, 88, 176, 125, 250, 233, 207,
+    131, 27, 54, 108, 216, 173, 71, 142, 1,
+];
+
+/// Reverse exponential table for Galois Field GF(256).
+const LOG_TABLE: [u8; 256] = [
+    175, 0, 1, 25, 2, 50, 26, 198, 3, 223, 51, 238, 27, 104, 199, 75, 4, 100, 224, 14, 52, 141,
+    239, 129, 28, 193, 105, 248, 200, 8, 76, 113, 5, 138, 101, 47, 225, 36, 15, 33, 53, 147, 142,
+    218, 240, 18, 130, 69, 29, 181, 194, 125, 106, 39, 249, 185, 201, 154, 9, 120, 77, 228, 114,
+    166, 6, 191, 139, 98, 102, 221, 48, 253, 226, 152, 37, 179, 16, 145, 34, 136, 54, 208, 148,
+    206, 143, 150, 219, 189, 241, 210, 19, 92, 131, 56, 70, 64, 30, 66, 182, 163, 195, 72, 126,
+    110, 107, 58, 40, 84, 250, 133, 186, 61, 202, 94, 155, 159, 10, 21, 121, 43, 78, 212, 229, 172,
+    115, 243, 167, 87, 7, 112, 192, 247, 140, 128, 99, 13, 103, 74, 222, 237, 49, 197, 254, 24,
+    227, 165, 153, 119, 38, 184, 180, 124, 17, 68, 146, 217, 35, 32, 137, 46, 55, 63, 209, 91, 149,
+    188, 207, 205, 144, 135, 151, 178, 220, 252, 190, 97, 242, 86, 211, 171, 20, 42, 93, 158, 132,
+    60, 57, 83, 71, 109, 65, 162, 31, 45, 67, 216, 183, 123, 164, 118, 196, 23, 73, 236, 127, 12,
+    111, 246, 108, 161, 59, 82, 41, 157, 85, 170, 251, 96, 134, 177, 187, 204, 62, 90, 203, 89, 95,
+    176, 156, 169, 160, 81, 11, 245, 22, 235, 122, 117, 44, 215, 79, 174, 213, 233, 230, 231, 173,
+    232, 116, 214, 244, 234, 168, 80, 88, 175,
+];
+
+// 4 bits segment header.
+const MODE_STOP: u16 = 0;
+const MODE_NUMERIC: u16 = 1;
+const MODE_BINARY: u16 = 4;
+/// Padding bytes.
+const PADDING: [u8; 2] = [236, 17];
+
+/// Get the next 13 bits of data, starting at specified offset (in bits).
+fn get_next_13b(data: &[u8], offset: usize) -> Option<(u16, usize)> {
+    if offset < data.len() * 8 {
+        let size = cmp::min(13, data.len() * 8 - offset);
+        let byte_off = offset / 8;
+        let bit_off = offset % 8;
+        // `b` is 20 at max (`bit_off` <= 7 and `size` <= 13).
+        let b = (bit_off + size) as u16;
+
+        let first_byte = (data[byte_off] << bit_off >> bit_off) as u16;
+
+        let number = match b {
+            0..=8 => first_byte >> (8 - b),
+            9..=16 => (first_byte << (b - 8)) + (data[byte_off + 1] >> (16 - b)) as u16,
+            _ => {
+                (first_byte << (b - 8))
+                    + ((data[byte_off + 1] as u16) << (b - 16))
+                    + (data[byte_off + 2] >> (24 - b)) as u16
+            }
+        };
+        Some((number, size))
+    } else {
+        None
+    }
+}
+
+/// Number of bits to encode characters in numeric mode.
+const NUM_CHARS_BITS: [usize; 4] = [0, 4, 7, 10];
+const POW10: [u16; 4] = [1, 10, 100, 1000];
+
+enum Segment<'a> {
+    Numeric(&'a [u8]),
+    Binary(&'a [u8]),
+}
+
+impl Segment<'_> {
+    fn get_header(&self) -> (u16, usize) {
+        match self {
+            Segment::Binary(_) => (MODE_BINARY, 4),
+            Segment::Numeric(_) => (MODE_NUMERIC, 4),
+        }
+    }
+
+    // Returns the size of the length field in bits, depending on QR Version.
+    fn length_bits_count(&self, version: Version) -> usize {
+        let Version(v) = version;
+        match self {
+            Segment::Binary(_) => match v {
+                1..=9 => 8,
+                _ => 16,
+            },
+            Segment::Numeric(_) => match v {
+                1..=9 => 10,
+                10..=26 => 12,
+                _ => 14,
+            },
+        }
+    }
+
+    // Number of characters in the segment.
+    fn character_count(&self) -> usize {
+        match self {
+            Segment::Binary(data) => data.len(),
+            Segment::Numeric(data) => {
+                let data_bits = data.len() * 8;
+                let last_chars = match data_bits % 13 {
+                    1 => 1,
+                    k => (k + 1) / 3,
+                };
+                // 4 decimal numbers per 13bits + remainder.
+                4 * (data_bits / 13) + last_chars
+            }
+        }
+    }
+
+    fn get_length_field(&self, version: Version) -> (u16, usize) {
+        (
+            self.character_count() as u16,
+            self.length_bits_count(version),
+        )
+    }
+
+    fn total_size_bits(&self, version: Version) -> usize {
+        let data_size = match self {
+            Segment::Binary(data) => data.len() * 8,
+            Segment::Numeric(_) => {
+                let digits = self.character_count();
+                10 * (digits / 3) + NUM_CHARS_BITS[digits % 3]
+            }
+        };
+        // header + length + data.
+        4 + self.length_bits_count(version) + data_size
+    }
+
+    fn iter(&self) -> SegmentIterator<'_> {
+        SegmentIterator {
+            segment: self,
+            offset: 0,
+            carry: 0,
+            carry_len: 0,
+        }
+    }
+}
+
+struct SegmentIterator<'a> {
+    segment: &'a Segment<'a>,
+    offset: usize,
+    carry: u16,
+    carry_len: usize,
+}
+
+impl Iterator for SegmentIterator<'_> {
+    type Item = (u16, usize);
+
+    fn next(&mut self) -> Option<Self::Item> {
+        match self.segment {
+            Segment::Binary(data) => {
+                if self.offset < data.len() {
+                    let byte = data[self.offset] as u16;
+                    self.offset += 1;
+                    Some((byte, 8))
+                } else {
+                    None
+                }
+            }
+            Segment::Numeric(data) => {
+                if self.carry_len == 3 {
+                    let out = (self.carry, NUM_CHARS_BITS[self.carry_len]);
+                    self.carry_len = 0;
+                    self.carry = 0;
+                    Some(out)
+                } else if let Some((bits, size)) = get_next_13b(data, self.offset) {
+                    self.offset += size;
+                    let new_chars = match size {
+                        1 => 1,
+                        k => (k + 1) / 3,
+                    };
+                    if self.carry_len + new_chars > 3 {
+                        self.carry_len = new_chars + self.carry_len - 3;
+                        let out = (
+                            self.carry * POW10[new_chars - self.carry_len]
+                                + bits / POW10[self.carry_len],
+                            NUM_CHARS_BITS[3],
+                        );
+                        self.carry = bits % POW10[self.carry_len];
+                        Some(out)
+                    } else {
+                        let out = (
+                            self.carry * POW10[new_chars] + bits,
+                            NUM_CHARS_BITS[self.carry_len + new_chars],
+                        );
+                        self.carry_len = 0;
+                        Some(out)
+                    }
+                } else if self.carry_len > 0 {
+                    let out = (self.carry, NUM_CHARS_BITS[self.carry_len]);
+                    self.carry_len = 0;
+                    Some(out)
+                } else {
+                    None
+                }
+            }
+        }
+    }
+}
+
+struct EncodedMsg<'a> {
+    data: &'a mut [u8],
+    ec_size: usize,
+    g1_blocks: usize,
+    g2_blocks: usize,
+    g1_blk_size: usize,
+    g2_blk_size: usize,
+    poly: &'static [u8],
+    version: Version,
+}
+
+/// Data to be put in the QR code, with correct segment encoding, padding, and
+/// Error Code Correction.
+impl EncodedMsg<'_> {
+    fn new<'a, 'b>(segments: &[&Segment<'b>], data: &'a mut [u8]) -> Option<EncodedMsg<'a>> {
+        let version = Version::from_segments(segments)?;
+        let ec_size = version.ec_size();
+        let g1_blocks = version.g1_blocks();
+        let g2_blocks = version.g2_blocks();
+        let g1_blk_size = version.g1_blk_size();
+        let g2_blk_size = g1_blk_size + 1;
+        let poly = version.poly();
+
+        // clear the output.
+        data.fill(0);
+
+        let mut em = EncodedMsg {
+            data: data,
+            ec_size,
+            g1_blocks,
+            g2_blocks,
+            g1_blk_size,
+            g2_blk_size,
+            poly,
+            version,
+        };
+        em.encode(segments);
+        Some(em)
+    }
+
+    /// Push bits of data at an offset (in bits).
+    fn push(&mut self, offset: &mut usize, bits: (u16, usize)) {
+        let (number, len_bits) = bits;
+        let byte_off = *offset / 8;
+        let bit_off = *offset % 8;
+        let b = bit_off + len_bits;
+
+        match (bit_off, b) {
+            (0, 0..=8) => {
+                self.data[byte_off] = (number << (8 - b)) as u8;
+            }
+            (0, _) => {
+                self.data[byte_off] = (number >> (b - 8)) as u8;
+                self.data[byte_off + 1] = (number << (16 - b)) as u8;
+            }
+            (_, 0..=8) => {
+                self.data[byte_off] |= (number << (8 - b)) as u8;
+            }
+            (_, 9..=16) => {
+                self.data[byte_off] |= (number >> (b - 8)) as u8;
+                self.data[byte_off + 1] = (number << (16 - b)) as u8;
+            }
+            _ => {
+                self.data[byte_off] |= (number >> (b - 8)) as u8;
+                self.data[byte_off + 1] = (number >> (b - 16)) as u8;
+                self.data[byte_off + 2] = (number << (24 - b)) as u8;
+            }
+        }
+        *offset += len_bits;
+    }
+
+    fn add_segments(&mut self, segments: &[&Segment<'_>]) {
+        let mut offset: usize = 0;
+
+        for s in segments.iter() {
+            self.push(&mut offset, s.get_header());
+            self.push(&mut offset, s.get_length_field(self.version));
+            for bits in s.iter() {
+                self.push(&mut offset, bits);
+            }
+        }
+        self.push(&mut offset, (MODE_STOP, 4));
+
+        let pad_offset = (offset + 7) / 8;
+        for i in pad_offset..self.version.max_data() {
+            self.data[i] = PADDING[(i & 1) ^ (pad_offset & 1)];
+        }
+    }
+
+    fn error_code_for_blocks(&mut self, offset: usize, size: usize, ec_offset: usize) {
+        let mut tmp: [u8; MAX_BLK_SIZE + MAX_EC_SIZE] = [0; MAX_BLK_SIZE + MAX_EC_SIZE];
+
+        tmp[0..size].copy_from_slice(&self.data[offset..offset + size]);
+        for i in 0..size {
+            let lead_coeff = tmp[i] as usize;
+            if lead_coeff == 0 {
+                continue;
+            }
+            let log_lead_coeff = usize::from(LOG_TABLE[lead_coeff]);
+            for (u, &v) in tmp[i + 1..].iter_mut().zip(self.poly.iter()) {
+                *u ^= EXP_TABLE[(usize::from(v) + log_lead_coeff) % 255];
+            }
+        }
+        self.data[ec_offset..ec_offset + self.ec_size]
+            .copy_from_slice(&tmp[size..size + self.ec_size]);
+    }
+
+    fn compute_error_code(&mut self) {
+        let mut offset = 0;
+        let mut ec_offset = self.g1_blocks * self.g1_blk_size + self.g2_blocks * self.g2_blk_size;
+
+        for _ in 0..self.g1_blocks {
+            self.error_code_for_blocks(offset, self.g1_blk_size, ec_offset);
+            offset += self.g1_blk_size;
+            ec_offset += self.ec_size;
+        }
+        for _ in 0..self.g2_blocks {
+            self.error_code_for_blocks(offset, self.g2_blk_size, ec_offset);
+            offset += self.g2_blk_size;
+            ec_offset += self.ec_size;
+        }
+    }
+
+    fn encode(&mut self, segments: &[&Segment<'_>]) {
+        self.add_segments(segments);
+        self.compute_error_code();
+    }
+
+    fn iter(&self) -> EncodedMsgIterator<'_> {
+        EncodedMsgIterator {
+            em: self,
+            offset: 0,
+        }
+    }
+}
+
+/// Iterator, to retrieve the data in the interleaved order needed by QR code.
+struct EncodedMsgIterator<'a> {
+    em: &'a EncodedMsg<'a>,
+    offset: usize,
+}
+
+impl Iterator for EncodedMsgIterator<'_> {
+    type Item = u8;
+
+    // Send the bytes in interleaved mode, first byte of first block of group1,
+    // then first byte of second block of group1, ...
+    fn next(&mut self) -> Option<Self::Item> {
+        let em = self.em;
+        let blocks = em.g1_blocks + em.g2_blocks;
+        let g1_end = em.g1_blocks * em.g1_blk_size;
+        let g2_end = g1_end + em.g2_blocks * em.g2_blk_size;
+        let ec_end = g2_end + em.ec_size * blocks;
+
+        if self.offset >= ec_end {
+            return None;
+        }
+
+        let offset = if self.offset < em.g1_blk_size * blocks {
+            // group1 and group2 interleaved
+            let blk = self.offset % blocks;
+            let blk_off = self.offset / blocks;
+            if blk < em.g1_blocks {
+                blk * em.g1_blk_size + blk_off
+            } else {
+                g1_end + em.g2_blk_size * (blk - em.g1_blocks) + blk_off
+            }
+        } else if self.offset < g2_end {
+            // last byte of group2 blocks
+            let blk2 = self.offset - blocks * em.g1_blk_size;
+            em.g1_blk_size * em.g1_blocks + blk2 * em.g2_blk_size + em.g2_blk_size - 1
+        } else {
+            // EC blocks
+            let ec_offset = self.offset - g2_end;
+            let blk = ec_offset % blocks;
+            let blk_off = ec_offset / blocks;
+
+            g2_end + blk * em.ec_size + blk_off
+        };
+        self.offset += 1;
+        Some(em.data[offset])
+    }
+}
+
+/// A QR code image, encoded as a linear binary framebuffer.
+/// 1 bit per module (pixel), each new line start at next byte boundary.
+/// Max width is 177 for V40 QR code, so `u8` is enough for coordinate.
+struct QrImage<'a> {
+    data: &'a mut [u8],
+    width: u8,
+    stride: u8,
+    version: Version,
+}
+
+impl QrImage<'_> {
+    fn new<'a, 'b>(em: &'b EncodedMsg<'b>, qrdata: &'a mut [u8]) -> QrImage<'a> {
+        let width = em.version.width();
+        let stride = (width + 7) / 8;
+        let data = qrdata;
+
+        let mut qr_image = QrImage {
+            data,
+            width,
+            stride,
+            version: em.version,
+        };
+        qr_image.draw_all(em.iter());
+        qr_image
+    }
+
+    fn clear(&mut self) {
+        self.data.fill(0);
+    }
+
+    // Set pixel to light color.
+    fn set(&mut self, x: u8, y: u8) {
+        let off = y as usize * self.stride as usize + x as usize / 8;
+        let mut v = self.data[off];
+        v |= 0x80 >> (x % 8);
+        self.data[off] = v;
+    }
+
+    // Invert a module color.
+    fn xor(&mut self, x: u8, y: u8) {
+        let off = y as usize * self.stride as usize + x as usize / 8;
+        self.data[off] ^= 0x80 >> (x % 8);
+    }
+
+    // Draw a light square at (x, y) top left corner.
+    fn draw_square(&mut self, x: u8, y: u8, size: u8) {
+        for k in 0..size {
+            self.set(x + k, y);
+            self.set(x, y + k + 1);
+            self.set(x + size, y + k);
+            self.set(x + k + 1, y + size);
+        }
+    }
+
+    // Finder pattern: 3 8x8 square at the corners.
+    fn draw_finders(&mut self) {
+        self.draw_square(1, 1, 4);
+        self.draw_square(self.width - 6, 1, 4);
+        self.draw_square(1, self.width - 6, 4);
+        for k in 0..8 {
+            self.set(k, 7);
+            self.set(self.width - k - 1, 7);
+            self.set(k, self.width - 8);
+        }
+        for k in 0..7 {
+            self.set(7, k);
+            self.set(self.width - 8, k);
+            self.set(7, self.width - 1 - k);
+        }
+    }
+
+    fn is_finder(&self, x: u8, y: u8) -> bool {
+        let end = self.width - 8;
+        (x < 8 && y < 8) || (x < 8 && y >= end) || (x >= end && y < 8)
+    }
+
+    // Alignment pattern: 5x5 squares in a grid.
+    fn draw_alignments(&mut self) {
+        let positions = self.version.alignment_pattern();
+        for &x in positions.iter() {
+            for &y in positions.iter() {
+                if !self.is_finder(x, y) {
+                    self.draw_square(x - 1, y - 1, 2);
+                }
+            }
+        }
+    }
+
+    fn is_alignment(&self, x: u8, y: u8) -> bool {
+        let positions = self.version.alignment_pattern();
+        for &ax in positions.iter() {
+            for &ay in positions.iter() {
+                if self.is_finder(ax, ay) {
+                    continue;
+                }
+                if x >= ax - 2 && x <= ax + 2 && y >= ay - 2 && y <= ay + 2 {
+                    return true;
+                }
+            }
+        }
+        false
+    }
+
+    // Timing pattern: 2 dotted line between the finder patterns.
+    fn draw_timing_patterns(&mut self) {
+        let end = self.width - 8;
+
+        for x in (9..end).step_by(2) {
+            self.set(x, 6);
+            self.set(6, x);
+        }
+    }
+
+    fn is_timing(&self, x: u8, y: u8) -> bool {
+        x == 6 || y == 6
+    }
+
+    // Mask info: 15 bits around the finders, written twice for redundancy.
+    fn draw_maskinfo(&mut self) {
+        let info: u16 = FORMAT_INFOS_QR_L[0];
+        let mut skip = 0;
+
+        for k in 0..7 {
+            if k == 6 {
+                skip = 1;
+            }
+            if info & (1 << (14 - k)) == 0 {
+                self.set(k + skip, 8);
+                self.set(8, self.width - 1 - k);
+            }
+        }
+        skip = 0;
+        for k in 0..8 {
+            if k == 2 {
+                skip = 1;
+            }
+            if info & (1 << (7 - k)) == 0 {
+                self.set(8, 8 - skip - k);
+                self.set(self.width - 8 + k, 8);
+            }
+        }
+    }
+
+    fn is_maskinfo(&self, x: u8, y: u8) -> bool {
+        let end = self.width - 8;
+        // Count the dark module as mask info.
+        (x <= 8 && y == 8) || (y <= 8 && x == 8) || (x == 8 && y >= end) || (x >= end && y == 8)
+    }
+
+    // Version info: 18bits written twice, close to the finders.
+    fn draw_version_info(&mut self) {
+        let vinfo = self.version.version_info();
+        let pos = self.width - 11;
+
+        if vinfo != 0 {
+            for x in 0..3 {
+                for y in 0..6 {
+                    if vinfo & (1 << (x + y * 3)) == 0 {
+                        self.set(x + pos, y);
+                        self.set(y, x + pos);
+                    }
+                }
+            }
+        }
+    }
+
+    fn is_version_info(&self, x: u8, y: u8) -> bool {
+        let vinfo = self.version.version_info();
+        let pos = self.width - 11;
+
+        vinfo != 0 && ((x >= pos && x < pos + 3 && y < 6) || (y >= pos && y < pos + 3 && x < 6))
+    }
+
+    // Returns true if the module is reserved (Not usable for data and EC).
+    fn is_reserved(&self, x: u8, y: u8) -> bool {
+        self.is_alignment(x, y)
+            || self.is_finder(x, y)
+            || self.is_timing(x, y)
+            || self.is_maskinfo(x, y)
+            || self.is_version_info(x, y)
+    }
+
+    // Last module to draw, at bottom left corner.
+    fn is_last(&self, x: u8, y: u8) -> bool {
+        x == 0 && y == self.width - 1
+    }
+
+    // Move to the next module according to QR code order.
+    // From bottom right corner, to bottom left corner.
+    fn next(&self, x: u8, y: u8) -> (u8, u8) {
+        let x_adj = if x <= 6 { x + 1 } else { x };
+        let column_type = (self.width - x_adj) % 4;
+
+        match column_type {
+            2 if y > 0 => (x + 1, y - 1),
+            0 if y < self.width - 1 => (x + 1, y + 1),
+            0 | 2 if x == 7 => (x - 2, y),
+            _ => (x - 1, y),
+        }
+    }
+
+    // Find next module that can hold data.
+    fn next_available(&self, x: u8, y: u8) -> (u8, u8) {
+        let (mut x, mut y) = self.next(x, y);
+        while self.is_reserved(x, y) && !self.is_last(x, y) {
+            (x, y) = self.next(x, y);
+        }
+        (x, y)
+    }
+
+    fn draw_data(&mut self, data: impl Iterator<Item = u8>) {
+        let (mut x, mut y) = (self.width - 1, self.width - 1);
+        for byte in data {
+            for s in 0..8 {
+                if byte & (0x80 >> s) == 0 {
+                    self.set(x, y);
+                }
+                (x, y) = self.next_available(x, y);
+            }
+        }
+        // Set the remaining modules (0, 3 or 7 depending on version).
+        // because 0 correspond to a light module.
+        while !self.is_last(x, y) {
+            if !self.is_reserved(x, y) {
+                self.set(x, y);
+            }
+            (x, y) = self.next(x, y);
+        }
+    }
+
+    // Apply checkerboard mask to all non-reserved modules.
+    fn apply_mask(&mut self) {
+        for x in 0..self.width {
+            for y in 0..self.width {
+                if (x ^ y) % 2 == 0 && !self.is_reserved(x, y) {
+                    self.xor(x, y);
+                }
+            }
+        }
+    }
+
+    // Draw the QR code with the provided data iterator.
+    fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
+        // First clear the table, as it may have already some data.
+        self.clear();
+        self.draw_finders();
+        self.draw_alignments();
+        self.draw_timing_patterns();
+        self.draw_version_info();
+        self.draw_data(data);
+        self.draw_maskinfo();
+        self.apply_mask();
+    }
+}
+
+/// C entry point for the rust QR Code generator.
+///
+/// Write the QR code image in the data buffer, and return the QR code width,
+/// or 0, if the data doesn't fit in a QR code.
+///
+/// * `url`: The base URL of the QR code. It will be encoded as Binary segment.
+/// * `data`: A pointer to the binary data, to be encoded. if URL is NULL, it
+///    will be encoded as binary segment, otherwise it will be encoded
+///    efficiently as a numeric segment, and appended to the URL.
+/// * `data_len`: Length of the data, that needs to be encoded, must be less
+///    than data_size.
+/// * `data_size`: Size of data buffer, it should be at least 4071 bytes to hold
+///    a V40 QR code. It will then be overwritten with the QR code image.
+/// * `tmp`: A temporary buffer that the QR code encoder will use, to write the
+///    segments and ECC.
+/// * `tmp_size`: Size of the temporary buffer, it must be at least 3706 bytes
+///    long for V40.
+///
+/// # Safety
+///
+/// * `url` must be null or point at a nul-terminated string.
+/// * `data` must be valid for reading and writing for `data_size` bytes.
+/// * `tmp` must be valid for reading and writing for `tmp_size` bytes.
+///
+/// They must remain valid for the duration of the function call.
+
+#[no_mangle]
+pub unsafe extern "C" fn drm_panic_qr_generate(
+    url: *const i8,
+    data: *mut u8,
+    data_len: usize,
+    data_size: usize,
+    tmp: *mut u8,
+    tmp_size: usize,
+) -> u8 {
+    if data_size < 4071 || tmp_size < 3706 || data_len > data_size {
+        return 0;
+    }
+    // SAFETY: The caller ensures that `data` is a valid pointer for reading and
+    // writing `data_size` bytes.
+    let data_slice: &mut [u8] = unsafe { core::slice::from_raw_parts_mut(data, data_size) };
+    // SAFETY: The caller ensures that `tmp` is a valid pointer for reading and
+    // writing `tmp_size` bytes.
+    let tmp_slice: &mut [u8] = unsafe { core::slice::from_raw_parts_mut(tmp, tmp_size) };
+    if url.is_null() {
+        match EncodedMsg::new(&[&Segment::Binary(&data_slice[0..data_len])], tmp_slice) {
+            None => 0,
+            Some(em) => {
+                let qr_image = QrImage::new(&em, data_slice);
+                qr_image.width
+            }
+        }
+    } else {
+        // SAFETY: The caller ensures that `url` is a valid pointer to a
+        // nul-terminated string.
+        let url_cstr: &CStr = unsafe { CStr::from_char_ptr(url) };
+        let segments = &[
+            &Segment::Binary(url_cstr.as_bytes()),
+            &Segment::Numeric(&data_slice[0..data_len]),
+        ];
+        match EncodedMsg::new(segments, tmp_slice) {
+            None => 0,
+            Some(em) => {
+                let qr_image = QrImage::new(&em, data_slice);
+                qr_image.width
+            }
+        }
+    }
+}
+
+/// Returns the maximum data size that can fit in a QR code of this version.
+/// * `version`: QR code version, between 1-40.
+/// * `url_len`: Length of the URL.
+///
+/// * If `url_len` > 0, remove the 2 segments header/length and also count the
+/// conversion to numeric segments.
+/// * If `url_len` = 0, only removes 3 bytes for 1 binary segment.
+#[no_mangle]
+pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {
+    if version < 1 || version > 40 {
+        return 0;
+    }
+    let max_data = Version(version as usize).max_data();
+
+    if url_len > 0 {
+        // Binary segment (URL) 4 + 16 bits, numeric segment (kmsg) 4 + 12 bits => 5 bytes.
+        if url_len + 5 >= max_data {
+            0
+        } else {
+            let max = max_data - url_len - 5;
+            (max * 39) / 40
+        }
+    } else {
+        // Remove 3 bytes for the binary segment (header 4 bits, length 16 bits, stop 4bits).
+        max_data - 3
+    }
+}
diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
index 73bb3f3d9ed9..54085d5d05c3 100644
--- a/include/drm/drm_panic.h
+++ b/include/drm/drm_panic.h
@@ -1,4 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0 or MIT */
+
+/*
+ * Copyright (c) 2024 Intel
+ * Copyright (c) 2024 Red Hat
+ */
+
 #ifndef __DRM_PANIC_H__
 #define __DRM_PANIC_H__
 
@@ -8,9 +14,6 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_fourcc.h>
-/*
- * Copyright (c) 2024 Intel
- */
 
 /**
  * struct drm_scanout_buffer - DRM scanout buffer
@@ -146,16 +149,4 @@ struct drm_scanout_buffer {
 #define drm_panic_unlock(dev, flags) \
 	raw_spin_unlock_irqrestore(&(dev)->mode_config.panic_lock, flags)
 
-#ifdef CONFIG_DRM_PANIC
-
-void drm_panic_register(struct drm_device *dev);
-void drm_panic_unregister(struct drm_device *dev);
-
-#else
-
-static inline void drm_panic_register(struct drm_device *dev) {}
-static inline void drm_panic_unregister(struct drm_device *dev) {}
-
-#endif
-
 #endif /* __DRM_PANIC_H__ */
diff --git a/include/drm/drm_rect.h b/include/drm/drm_rect.h
index 73fcb899a01d..7bafde747d56 100644
--- a/include/drm/drm_rect.h
+++ b/include/drm/drm_rect.h
@@ -238,6 +238,21 @@ static inline void drm_rect_fp_to_int(struct drm_rect *dst,
 		      drm_rect_height(src) >> 16);
 }
 
+/**
+ * drm_rect_overlap - Check if two rectangles overlap
+ * @r1: first rectangle
+ * @r2: second rectangle
+ *
+ * RETURNS:
+ * %true if the rectangles overlap, %false otherwise.
+ */
+static inline bool drm_rect_overlap(const struct drm_rect *r1,
+				    const struct drm_rect *r2)
+{
+	return (r1->x2 > r2->x1 && r2->x2 > r1->x1 &&
+		r1->y2 > r2->y1 && r2->y2 > r1->y1);
+}
+
 bool drm_rect_intersect(struct drm_rect *r, const struct drm_rect *clip);
 bool drm_rect_clip_scaled(struct drm_rect *src, struct drm_rect *dst,
 			  const struct drm_rect *clip);
-- 
2.45.2

