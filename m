Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91428874A9E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 10:20:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE5610F343;
	Thu,  7 Mar 2024 09:20:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="U3Mmv2dB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C9E10F686
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 09:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709803198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4z0fp8oasZ5GN7oEGwCaBENh4Hq/e3MLjr21fI2+NvM=;
 b=U3Mmv2dBZA6FpLj8lRD9Il2eRuZIdLqtr1YF4gvPv1+J4Sx0l1KR7ogG/cboXmKmgCdOBI
 zBcngQ9DZIjMPONAtBE5TF+UPtSd6m4wha2G77h8S7kTI2OOc0xAIcZp5zzup+UrR9MiBW
 j19UCx3d3m7z6LaYEVwMrtXEcDAJcqY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-12-k_YXgZwwOpOmn5xGTn57vQ-1; Thu,
 07 Mar 2024 04:19:51 -0500
X-MC-Unique: k_YXgZwwOpOmn5xGTn57vQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CF743801F59;
 Thu,  7 Mar 2024 09:19:51 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23BFE111DCF5;
 Thu,  7 Mar 2024 09:19:49 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org
Cc: gpiccoli@igalia.com,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v9 3/9] drm/panic: Add a drm panic handler
Date: Thu,  7 Mar 2024 10:14:45 +0100
Message-ID: <20240307091936.576689-4-jfalempe@redhat.com>
In-Reply-To: <20240307091936.576689-1-jfalempe@redhat.com>
References: <20240307091936.576689-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

This module displays a user friendly message when a kernel panic
occurs. It currently doesn't contain any debug information,
but that can be added later.

v2
 * Use get_scanout_buffer() instead of the drm client API.
  (Thomas Zimmermann)
 * Add the panic reason to the panic message (Nerdopolis)
 * Add an exclamation mark (Nerdopolis)

v3
 * Rework the drawing functions, to write the pixels line by line and
 to use the drm conversion helper to support other formats.
 (Thomas Zimmermann)

v4
 * Use drm_fb_r1_to_32bit for fonts (Thomas Zimmermann)
 * Remove the default y to DRM_PANIC config option (Thomas Zimmermann)
 * Add foreground/background color config option
 * Fix the bottom lines not painted if the framebuffer height
   is not a multiple of the font height.
 * Automatically register the device to drm_panic, if the function
   get_scanout_buffer exists. (Thomas Zimmermann)

v5
 * Change the drawing API, use drm_fb_blit_from_r1() to draw the font.
 * Also add drm_fb_fill() to fill area with background color.
 * Add draw_pixel_xy() API for drivers that can't provide a linear buffer.
 * Add a flush() callback for drivers that needs to synchronize the buffer.
 * Add a void *private field, so drivers can pass private data to
   draw_pixel_xy() and flush().

v6
 * Fix sparse warning for panic_msg and logo.

v7
 * Add select DRM_KMS_HELPER for the color conversion functions.

v8
 * Register directly each plane to the panic notifier (Sima)
 * Add raw_spinlock to properly handle concurrency (Sima)
 * Register plane instead of device, to avoid looping through plane
   list, and simplify code.
 * Replace get_scanout_buffer() logic with drm_panic_set_buffer()
  (Thomas Zimmermann)
 * Removed the draw_pixel_xy() API, will see later if it can be added back.

v9
 * Revert to using get_scanout_buffer() (Sima)
 * Move get_scanout_buffer() and panic_flush() to the plane helper
   functions (Thomas Zimmermann)
 * Register all planes with get_scanout_buffer() to the panic notifier
 * Use drm_panic_lock() to protect against race (Sima)

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 Documentation/gpu/drm-kms.rst            |  12 +
 drivers/gpu/drm/Kconfig                  |  23 ++
 drivers/gpu/drm/Makefile                 |   1 +
 drivers/gpu/drm/drm_drv.c                |   4 +
 drivers/gpu/drm/drm_panic.c              | 322 +++++++++++++++++++++++
 drivers/gpu/drm/drm_plane.c              |   1 +
 include/drm/drm_modeset_helper_vtables.h |  37 +++
 include/drm/drm_panic.h                  |  52 ++++
 include/drm/drm_plane.h                  |   5 +
 9 files changed, 457 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_panic.c

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index 13d3627d8bc0..b64334661aeb 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -398,6 +398,18 @@ Plane Damage Tracking Functions Reference
 .. kernel-doc:: include/drm/drm_damage_helper.h
    :internal:
 
+Plane Panic Feature
+-------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_panic.c
+   :doc: overview
+
+Plane Panic Functions Reference
+-------------------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_panic.c
+   :export:
+
 Display Modes Function Reference
 ================================
 
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 16029435b750..f07ca38d3f98 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -102,6 +102,29 @@ config DRM_KMS_HELPER
 	help
 	  CRTC helpers for KMS drivers.
 
+config DRM_PANIC
+	bool "Display a user-friendly message when a kernel panic occurs"
+	depends on DRM && !FRAMEBUFFER_CONSOLE
+	select DRM_KMS_HELPER
+	select FONT_SUPPORT
+	help
+	  Enable a drm panic handler, which will display a user-friendly message
+	  when a kernel panic occurs. It's useful when using a user-space
+	  console instead of fbcon.
+	  It will only work if your graphic driver supports this feature.
+	  To support Hi-DPI Display, you can enable bigger fonts like
+	  FONT_TER16x32
+
+config DRM_PANIC_FOREGROUND_COLOR
+	hex "Drm panic screen foreground color, in RGB"
+	depends on DRM_PANIC
+	default 0xffffff
+
+config DRM_PANIC_BACKGROUND_COLOR
+	hex "Drm panic screen background color, in RGB"
+	depends on DRM_PANIC
+	default 0x000000
+
 config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
         bool "Enable refcount backtrace history in the DP MST helpers"
 	depends on STACKTRACE_SUPPORT
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index a73c04d2d7a3..f9ca4f8fa6c5 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -88,6 +88,7 @@ drm-$(CONFIG_DRM_PRIVACY_SCREEN) += \
 	drm_privacy_screen.o \
 	drm_privacy_screen_x86.o
 drm-$(CONFIG_DRM_ACCEL) += ../../accel/drm_accel.o
+drm-$(CONFIG_DRM_PANIC) += drm_panic.o
 obj-$(CONFIG_DRM)	+= drm.o
 
 obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index c157500b3135..535b624d4c9d 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -43,6 +43,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_mode_object.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_print.h>
 #include <drm/drm_privacy_screen_machine.h>
 
@@ -944,6 +945,7 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 		if (ret)
 			goto err_unload;
 	}
+	drm_panic_register(dev);
 
 	DRM_INFO("Initialized %s %d.%d.%d %s for %s on minor %d\n",
 		 driver->name, driver->major, driver->minor,
@@ -988,6 +990,8 @@ void drm_dev_unregister(struct drm_device *dev)
 {
 	dev->registered = false;
 
+	drm_panic_unregister(dev);
+
 	drm_client_dev_unregister(dev);
 
 	if (drm_core_check_feature(dev, DRIVER_MODESET))
diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
new file mode 100644
index 000000000000..2e2a033d1267
--- /dev/null
+++ b/drivers/gpu/drm/drm_panic.c
@@ -0,0 +1,322 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/*
+ * Copyright (c) 2023 Red Hat.
+ * Author: Jocelyn Falempe <jfalempe@redhat.com>
+ * inspired by the drm_log driver from David Herrmann <dh.herrmann@gmail.com>
+ * Tux Ascii art taken from cowsay written by Tony Monroe
+ */
+
+#include <linux/font.h>
+#include <linux/iosys-map.h>
+#include <linux/kdebug.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/panic_notifier.h>
+#include <linux/types.h>
+
+#include <drm/drm_drv.h>
+#include <drm/drm_format_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_panic.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_print.h>
+
+
+MODULE_AUTHOR("Jocelyn Falempe");
+MODULE_DESCRIPTION("DRM panic handler");
+MODULE_LICENSE("GPL");
+
+/**
+ * DOC: overview
+ *
+ * To enable DRM panic for a driver, the primary plane must implement a
+ * get_scanout_buffer() helper function. It is then automatically registered to
+ * the drm panic handler.
+ * When a panic occurs, the get_scanout_buffer() will be called, and the driver
+ * can provide a framebuffer so the panic handler can draw the panic screen on
+ * it. The buffer provided must be linear, and use a supported color format.
+ * Optionally the driver can also provide a panic_flush() callback, that will
+ * be called after that, to send additional commands to the hardware to make the
+ * scanout buffer visible.
+ */
+
+/*
+ * This module displays a user friendly message on screen when a kernel panic
+ * occurs. This is conflicting with fbcon, so you can only enable it when fbcon
+ * is disabled.
+ * It's intended for end-user, so have minimal technical/debug information.
+ *
+ * Implementation details:
+ *
+ * It is a panic handler, so it can't take lock, allocate memory, run tasks/irq,
+ * or attempt to sleep. It's a best effort, and it may not be able to display
+ * the message in all situations (like if the panic occurs in the middle of a
+ * modesetting).
+ * It will display only one static frame, so performance optimizations are low
+ * priority as the machine is already in an unusable state.
+ */
+
+static inline struct drm_plane *to_drm_plane(struct notifier_block *nb)
+{
+	return container_of(nb, struct drm_plane, panic_notifier);
+}
+
+struct drm_panic_line {
+	u32 len;
+	const char *txt;
+};
+
+#define PANIC_LINE(s) {.len = sizeof(s) - 1, .txt = s}
+
+static struct drm_panic_line panic_msg[] = {
+	PANIC_LINE("KERNEL PANIC !"),
+	PANIC_LINE(""),
+	PANIC_LINE("Please reboot your computer."),
+	PANIC_LINE(""),
+	PANIC_LINE(""), /* overwritten with panic reason */
+};
+
+static const struct drm_panic_line logo[] = {
+	PANIC_LINE("     .--.        _"),
+	PANIC_LINE("    |o_o |      | |"),
+	PANIC_LINE("    |:_/ |      | |"),
+	PANIC_LINE("   //   \\ \\     |_|"),
+	PANIC_LINE("  (|     | )     _"),
+	PANIC_LINE(" /'\\_   _/`\\    (_)"),
+	PANIC_LINE(" \\___)=(___/"),
+};
+
+static void draw_empty_line(struct drm_scanout_buffer *sb, size_t top, size_t height, u32 color)
+{
+	struct iosys_map dst = sb->map;
+
+	iosys_map_incr(&dst, top * sb->pitch);
+	drm_fb_fill(&dst, sb->pitch, height, sb->width, color, sb->format->cpp[0]);
+}
+
+static void draw_txt_line(const struct drm_panic_line *msg, size_t left, size_t top,
+			      struct drm_scanout_buffer *sb, u32 fg_color, u32 bg_color,
+			      const struct font_desc *font)
+{
+	size_t i;
+	const u8 *src;
+	size_t src_stride = DIV_ROUND_UP(font->width, 8);
+	struct iosys_map dst = sb->map;
+	size_t end_text;
+	unsigned int px_width = sb->format->cpp[0];
+
+	iosys_map_incr(&dst, top * sb->pitch);
+	drm_fb_fill(&dst, sb->pitch, font->height, left, bg_color, px_width);
+	iosys_map_incr(&dst, left * px_width);
+	for (i = 0; i < msg->len; i++) {
+		src = font->data + (msg->txt[i] * font->height) * src_stride;
+		drm_fb_blit_from_r1(&dst, sb->pitch, src, src_stride, font->height, font->width,
+				    fg_color, bg_color, px_width);
+		iosys_map_incr(&dst, font->width * px_width);
+	}
+	end_text = (msg->len * font->width) + left;
+	if (sb->width > end_text)
+		drm_fb_fill(&dst, sb->pitch, font->height, sb->width - end_text,
+			    bg_color, px_width);
+}
+
+
+static size_t panic_msg_needed_lines(size_t chars_per_line)
+{
+	size_t msg_len = ARRAY_SIZE(panic_msg);
+	size_t lines = 0;
+	size_t i;
+
+	for (i = 0; i < msg_len; i++)
+		lines += panic_msg[i].len ? DIV_ROUND_UP(panic_msg[i].len, chars_per_line) : 1;
+	return lines;
+}
+
+static bool can_draw_logo(size_t chars_per_line, size_t lines, size_t msg_lines)
+{
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(logo); i++) {
+		if (logo[i].len > chars_per_line)
+			return false;
+	}
+	if (lines < msg_lines + ARRAY_SIZE(logo))
+		return false;
+	return true;
+}
+
+static size_t get_start_line(size_t lines, size_t msg_lines, bool draw_logo)
+{
+	size_t remaining;
+	size_t logo_len = ARRAY_SIZE(logo);
+
+	if (lines < msg_lines)
+		return 0;
+	remaining = lines - msg_lines;
+	if (draw_logo && remaining / 2 <= logo_len)
+		return logo_len + (remaining - logo_len) / 4;
+	return remaining / 2;
+}
+
+/*
+ * Draw the panic message at the center of the screen
+ */
+static void draw_panic_static(struct drm_scanout_buffer *sb, const char *msg)
+{
+	size_t lines, msg_lines, l, msg_start_line, remaining, msgi;
+	size_t chars_per_line;
+	bool draw_logo;
+	struct drm_panic_line panic_line;
+	size_t msg_len = ARRAY_SIZE(panic_msg);
+	size_t logo_len = ARRAY_SIZE(logo);
+	u32 fg_color = CONFIG_DRM_PANIC_FOREGROUND_COLOR;
+	u32 bg_color = CONFIG_DRM_PANIC_BACKGROUND_COLOR;
+	const struct font_desc *font = get_default_font(sb->width, sb->height,
+							0x80808080, 0x80808080);
+
+	if (!font)
+		return;
+
+	/* Set the panic reason */
+	panic_msg[msg_len - 1].len = strlen(msg);
+	panic_msg[msg_len - 1].txt = msg;
+
+	lines = sb->height / font->height;
+	chars_per_line = sb->width / font->width;
+
+	msg_lines = panic_msg_needed_lines(chars_per_line);
+	draw_logo = can_draw_logo(chars_per_line, lines, msg_lines);
+	msg_start_line = get_start_line(lines, msg_lines, draw_logo);
+
+	fg_color = drm_fb_convert_from_xrgb8888(fg_color, sb->format->format);
+	bg_color = drm_fb_convert_from_xrgb8888(bg_color, sb->format->format);
+
+	msgi = 0;
+	panic_line.len = 0;
+	for (l = 0; l < lines; l++) {
+		if (draw_logo && l < logo_len)
+			draw_txt_line(&logo[l], 0, l * font->height, sb, fg_color, bg_color, font);
+		else if (l >= msg_start_line && msgi < msg_len) {
+			if (!panic_line.len) {
+				panic_line.txt = panic_msg[msgi].txt;
+				panic_line.len = panic_msg[msgi].len;
+			}
+			if (!panic_line.len) {
+				draw_empty_line(sb, l * font->height, font->height, bg_color);
+				msgi++;
+			} else if (panic_line.len > chars_per_line) {
+				remaining = panic_line.len - chars_per_line;
+				panic_line.len = chars_per_line;
+				draw_txt_line(&panic_line, 0, l * font->height, sb, fg_color,
+					      bg_color, font);
+				panic_line.txt += chars_per_line;
+				panic_line.len = remaining;
+			} else {
+				draw_txt_line(&panic_line,
+					      font->width * (chars_per_line - panic_line.len) / 2,
+					      l * font->height, sb, fg_color, bg_color, font);
+				panic_line.len = 0;
+				msgi++;
+			}
+		} else {
+			draw_empty_line(sb, l * font->height, font->height, bg_color);
+		}
+	}
+	/* Fill the bottom of the screen, if sb->height is not a multiple of font->height */
+	if (sb->height % font->height)
+		draw_empty_line(sb, l * font->height, sb->height - l * font->height, bg_color);
+}
+
+/*
+ * drm_panic_is_format_supported()
+ * @format: a fourcc color code
+ * Returns: true if supported, false otherwise.
+ *
+ * Check if drm_panic will be able to use this color format.
+ */
+static bool drm_panic_is_format_supported(u32 format)
+{
+	return drm_fb_convert_from_xrgb8888(0xffffff, format) != 0;
+}
+
+static void draw_panic_plane(struct drm_plane *plane, const char *msg)
+{
+	struct drm_scanout_buffer sb;
+	int ret;
+
+	if (!drm_panic_trylock(plane->dev))
+		return;
+
+	ret = plane->helper_private->get_scanout_buffer(plane, &sb);
+
+
+	if (!ret && drm_panic_is_format_supported(sb.format->format)) {
+		draw_panic_static(&sb, msg);
+		if (plane->helper_private->panic_flush)
+			plane->helper_private->panic_flush(plane);
+	}
+	drm_panic_unlock(plane->dev);
+}
+
+static int drm_panic(struct notifier_block *this, unsigned long event,
+		     void *ptr)
+{
+	struct drm_plane *plane = to_drm_plane(this);
+
+	draw_panic_plane(plane, ptr);
+
+	return NOTIFY_OK;
+}
+
+/**
+ * drm_panic_register() - Initialize DRM panic for a device
+ * @dev: the drm device on which the panic screen will be displayed.
+ */
+void drm_panic_register(struct drm_device *dev)
+{
+	struct drm_plane *plane;
+	int registered_plane = 0;
+
+	if (!dev->mode_config.num_total_plane)
+		return;
+
+	drm_for_each_plane(plane, dev) {
+		if (!plane->helper_private || !plane->helper_private->get_scanout_buffer)
+			continue;
+		plane->panic_notifier.notifier_call = drm_panic;
+		plane->panic_notifier.priority = -5;
+		if (atomic_notifier_chain_register(&panic_notifier_list,
+						   &plane->panic_notifier)) {
+			drm_warn(dev, "Failed to register panic handler\n");
+		} else {
+			registered_plane++;
+		}
+	}
+	if (registered_plane)
+		drm_info(dev, "Registered %d planes with drm panic\n", registered_plane);
+}
+EXPORT_SYMBOL(drm_panic_register);
+
+/**
+ * drm_panic_unregister()
+ * @dev: the drm device previously registered.
+ */
+void drm_panic_unregister(struct drm_device *dev)
+{
+	struct drm_plane *plane;
+
+	if (!dev->mode_config.num_total_plane)
+		return;
+
+	drm_for_each_plane(plane, dev) {
+		if (!plane->helper_private || !plane->helper_private->get_scanout_buffer)
+			continue;
+
+		atomic_notifier_chain_unregister(&panic_notifier_list,
+						 &plane->panic_notifier);
+	}
+}
+EXPORT_SYMBOL(drm_panic_unregister);
+
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 672c655c7a8e..18af71792e58 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -31,6 +31,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_vblank.h>
 
 #include "drm_crtc_internal.h"
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index 881b03e4dc28..bd4752b1ce3f 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -48,6 +48,7 @@
  * To make this clear all the helper vtables are pulled together in this location here.
  */
 
+struct drm_scanout_buffer;
 struct drm_writeback_connector;
 struct drm_writeback_job;
 
@@ -1442,6 +1443,42 @@ struct drm_plane_helper_funcs {
 	 */
 	void (*atomic_async_update)(struct drm_plane *plane,
 				    struct drm_atomic_state *state);
+
+	/**
+	 * @get_scanout_buffer:
+	 *
+	 * Get the current scanout buffer, to display a message with drm_panic.
+	 * The driver should do the minimum changes to provide a linear buffer,
+	 * that can be used to display the panic screen.
+	 * The device dev->mode_config.panic_lock is taken before calling this
+	 * function, so you can safely access the plane->state
+	 * It is called from a panic callback, and must follow its restrictions.
+	 * (no locks, no memory allocation, no sleep, no thread/workqueue, ...)
+	 * It's a best effort mode, so it's expected that in some complex cases
+	 * the panic screen won't be displayed.
+	 * The returned scanout_buffer->map must be valid if no error code is
+	 * returned.
+	 *
+	 * Returns:
+	 *
+	 * Zero on success, negative errno on failure.
+	 */
+	int (*get_scanout_buffer)(struct drm_plane *plane,
+				  struct drm_scanout_buffer *sb);
+
+	/**
+	 * @panic_flush:
+	 *
+	 * It is used by drm_panic, and is called after the panic screen is
+	 * drawn to the scanout buffer. In this function, the driver
+	 * can send additional commands to the hardware, to make the scanout
+	 * buffer visible.
+	 * The device dev->mode_config.panic_lock is taken before calling this
+	 * function, so you can safely access the plane->state
+	 * It is called from a panic callback, and must follow its restrictions.
+	 * (no locks, no memory allocation, no sleep, no thread/workqueue, ...)
+	 */
+	void (*panic_flush)(struct drm_plane *plane);
 };
 
 /**
diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
index f2135d03f1eb..e19adbd0a71a 100644
--- a/include/drm/drm_panic.h
+++ b/include/drm/drm_panic.h
@@ -2,11 +2,51 @@
 #ifndef __DRM_PANIC_H__
 #define __DRM_PANIC_H__
 
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/iosys-map.h>
+
 #include <drm/drm_device.h>
 /*
  * Copyright (c) 2024 Intel
  */
 
+/**
+ * struct drm_scanout_buffer - DRM scanout buffer
+ *
+ * This structure holds the information necessary for drm_panic to draw the
+ * panic screen, and display it.
+ */
+struct drm_scanout_buffer {
+	/**
+	 * @format:
+	 *
+	 * drm format of the scanout buffer.
+	 */
+	const struct drm_format_info *format;
+	/**
+	 * @map:
+	 *
+	 * Virtual address of the scanout buffer, either in memory or iomem.
+	 * The scanout buffer should be in linear format, and can be directly
+	 * sent to the display hardware. Tearing is not an issue for the panic
+	 * screen.
+	 */
+	struct iosys_map map;
+	/**
+	 * @width: Width of the scanout buffer, in pixels.
+	 */
+	unsigned int width;
+	/**
+	 * @height: Height of the scanout buffer, in pixels.
+	 */
+	unsigned int height;
+	/**
+	 * @pitch: Length in bytes between the start of two consecutive lines.
+	 */
+	unsigned int pitch;
+};
+
 /**
  * drm_panic_trylock - try to enter the panic printing critical section
  * @dev: struct drm_device
@@ -96,4 +136,16 @@ static inline void drm_panic_unlock(struct drm_device *dev)
 	raw_spin_unlock(&dev->mode_config.panic_lock);
 }
 
+#ifdef CONFIG_DRM_PANIC
+
+void drm_panic_register(struct drm_device *dev);
+void drm_panic_unregister(struct drm_device *dev);
+
+#else
+
+static inline void drm_panic_register(struct drm_device *dev) {}
+static inline void drm_panic_unregister(struct drm_device *dev) {}
+
+#endif
+
 #endif /* __DRM_PANIC_H__ */
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 641fe298052d..c7119a1c47fe 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -779,6 +779,11 @@ struct drm_plane {
 	 * @hotspot_y_property: property to set mouse hotspot y offset.
 	 */
 	struct drm_property *hotspot_y_property;
+
+	/**
+	 * @panic_notifier: Used to register a panic notifier for this plane
+	 */
+	struct notifier_block panic_notifier;
 };
 
 #define obj_to_plane(x) container_of(x, struct drm_plane, base)
-- 
2.43.2

