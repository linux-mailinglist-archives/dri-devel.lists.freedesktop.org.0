Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5F0868CE4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 11:05:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E573510EEA7;
	Tue, 27 Feb 2024 10:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FjRUq2vE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB8410EEA7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 10:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709028335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tetytB+GBZgzl0nelZ/2IDk2rPDs1ShAqHs3SXGXklM=;
 b=FjRUq2vEwuqAO8o6ewEsIGzxTagmybMfgcIREYLOHn3W+rXeeFH+ra6ZhE+qsm5Ciu02ms
 WqEJX9LJNM8b7ARespuklxCUFkbmF+aq3Jrp/A5vQDkN34fT90TUQJufJtroJ3dAEkCIl1
 hpbqW24ImfcBImANEL7Bg1CW56hMMJM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-402-YEu_DepgMXmFzYEvxd6XKQ-1; Tue,
 27 Feb 2024 05:05:32 -0500
X-MC-Unique: YEu_DepgMXmFzYEvxd6XKQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C83B1C0690E;
 Tue, 27 Feb 2024 10:05:31 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B935B39CCE;
 Tue, 27 Feb 2024 10:05:29 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org
Cc: gpiccoli@igalia.com,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v8 2/8] drm/panic: Add a drm panic handler
Date: Tue, 27 Feb 2024 11:04:13 +0100
Message-ID: <20240227100459.194478-3-jfalempe@redhat.com>
In-Reply-To: <20240227100459.194478-1-jfalempe@redhat.com>
References: <20240227100459.194478-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 Documentation/gpu/drm-kms.rst            |  12 +
 drivers/gpu/drm/Kconfig                  |  23 ++
 drivers/gpu/drm/Makefile                 |   1 +
 drivers/gpu/drm/drm_panic.c              | 400 +++++++++++++++++++++++
 drivers/gpu/drm/drm_plane.c              |   3 +
 include/drm/drm_modeset_helper_vtables.h |  11 +
 include/drm/drm_panic.h                  |  37 +++
 include/drm/drm_plane.h                  |  17 +
 8 files changed, 504 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_panic.c
 create mode 100644 include/drm/drm_panic.h

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
index 872edb47bb53..c17d8a8f6877 100644
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
index 104b42df2e95..49905b7e333f 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -60,6 +60,7 @@ drm-$(CONFIG_DRM_PRIVACY_SCREEN) += \
 	drm_privacy_screen.o \
 	drm_privacy_screen_x86.o
 drm-$(CONFIG_DRM_ACCEL) += ../../accel/drm_accel.o
+drm-$(CONFIG_DRM_PANIC) += drm_panic.o
 obj-$(CONFIG_DRM)	+= drm.o
 
 obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
new file mode 100644
index 000000000000..c9f386476ef9
--- /dev/null
+++ b/drivers/gpu/drm/drm_panic.c
@@ -0,0 +1,400 @@
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
+ * To enable DRM panic for a driver, you should register the primary plane
+ * with drm_panic_register(). Then when a scanout buffer is set for this plane,
+ * call drm_panic_set_buffer(), so if a panic occurs, it will draw to this.
+ * Make sure to update it when the scanout buffer changes. Also you should call
+ * drm_panic_unset_buffer() when the plane is disabled, or when the scanout
+ * buffer is no more accessible.
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
+/**
+ * struct drm_scanout_buffer - DRM scanout buffer
+ *
+ * This structure holds the information necessary for drm_panic to draw the
+ * panic screen, and display it.
+ */
+struct drm_scanout_buffer {
+	/**
+	 * @lock:
+	 *
+	 * a raw spinlock to make sure that when the panic handler is running
+	 * the data in this struct is valid.
+	 */
+	struct raw_spinlock lock;
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
+	struct drm_scanout_buffer *sb = plane->panic_scanout;
+
+	if (!sb)
+		return;
+
+	if (!raw_spin_trylock(&sb->lock))
+		return;
+
+	if (!iosys_map_is_null(&sb->map) && drm_panic_is_format_supported(sb->format->format)) {
+		draw_panic_static(sb, msg);
+		if (plane->helper_private->panic_flush)
+			plane->helper_private->panic_flush(plane);
+	}
+	raw_spin_unlock(&sb->lock);
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
+/**
+ * drm_panic_set_buffer()
+ *
+ * @sb: The scanout_buffer to set.
+ * @fb: The current drm_framebuffer struct (only format, height, width and
+ *      pitches[0]) is used.
+ * @map: The iosys_map pointing to the current scanout buffer.
+ *
+ * Set the scanout buffer, that will be used if a panic occurs.
+ * Make sure to update it before the iosysmap is no longer valid.
+ */
+void drm_panic_set_buffer(struct drm_scanout_buffer *sb,
+			  struct drm_framebuffer *fb,
+			  struct iosys_map *map)
+{
+	if (!sb)
+		return;
+
+	raw_spin_lock(&sb->lock);
+	sb->map = *map;
+	sb->format = fb->format;
+	sb->height = fb->height;
+	sb->width = fb->width;
+	sb->pitch = fb->pitches[0];
+	raw_spin_unlock(&sb->lock);
+}
+EXPORT_SYMBOL(drm_panic_set_buffer);
+
+/**
+ * drm_panic_unset_buffer()
+ *
+ * Unset the scanout buffer before it is no longer accessible.
+ * @sb: the scanout_buffer to be cleared.
+ *
+ * After calling this function, if a panic occurs, it won't be displayed on this
+ * plane.
+ */
+void drm_panic_unset_buffer(struct drm_scanout_buffer *sb)
+{
+	if (!sb)
+		return;
+
+	raw_spin_lock(&sb->lock);
+	iosys_map_clear(&sb->map);
+	sb->format = NULL;
+	raw_spin_unlock(&sb->lock);
+}
+EXPORT_SYMBOL(drm_panic_unset_buffer);
+
+/**
+ * drm_panic_register() - Initialize DRM panic for a primary plane
+ * @plane: the plane on which the panic screen will be displayed.
+ */
+void drm_panic_register(struct drm_plane *plane)
+{
+	struct drm_scanout_buffer *sb;
+
+	sb = kzalloc(sizeof(*sb), GFP_KERNEL);
+	if (!sb)
+		return;
+
+	raw_spin_lock_init(&sb->lock);
+	plane->panic_scanout = sb;
+	plane->panic_notifier.notifier_call = drm_panic;
+	plane->panic_notifier.priority = -5;
+	if (atomic_notifier_chain_register(&panic_notifier_list,
+					   &plane->panic_notifier)) {
+		drm_warn(plane->dev, "Failed to register panic handler\n");
+		plane->panic_scanout = NULL;
+		kfree(sb);
+	} else
+		drm_info(plane->dev, "Registered with drm panic\n");
+}
+EXPORT_SYMBOL(drm_panic_register);
+
+/**
+ * drm_panic_unregister()
+ * @plane: the plane previously registered.
+ */
+void drm_panic_unregister(struct drm_plane *plane)
+{
+	if (plane->panic_scanout) {
+		atomic_notifier_chain_unregister(&panic_notifier_list,
+						 &plane->panic_notifier);
+		kfree(plane->panic_scanout);
+		plane->panic_scanout = NULL;
+	}
+}
+EXPORT_SYMBOL(drm_panic_unregister);
+
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 672c655c7a8e..aee5a9bd3a98 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -31,6 +31,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_vblank.h>
 
 #include "drm_crtc_internal.h"
@@ -644,6 +645,8 @@ void drm_plane_cleanup(struct drm_plane *plane)
 	kfree(plane->modifiers);
 	drm_mode_object_unregister(dev, &plane->base);
 
+	drm_panic_unregister(plane);
+
 	BUG_ON(list_empty(&plane->head));
 
 	/* Note that the plane_list is considered to be static; should we
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index 881b03e4dc28..d5643ff6a54b 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1442,6 +1442,17 @@ struct drm_plane_helper_funcs {
 	 */
 	void (*atomic_async_update)(struct drm_plane *plane,
 				    struct drm_atomic_state *state);
+	/**
+	 * @panic_flush:
+	 *
+	 * It is used by drm_panic, and is called after the panic screen is
+	 * drawn to the scanout buffer. In this function, the driver
+	 * can send additional commands to the hardware, to make the scanout
+	 * buffer visible.
+	 * It is called from panic context, so this function should follow the
+	 * panic restrictions, and not allocate or lock.
+	 */
+	void (*panic_flush)(struct drm_plane *plane);
 };
 
 /**
diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
new file mode 100644
index 000000000000..c9f5c5577eaf
--- /dev/null
+++ b/include/drm/drm_panic.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+#ifndef __DRM_PANIC_H__
+#define __DRM_PANIC_H__
+
+/*
+ * Copyright (c) 2023 Red Hat.
+ * Author: Jocelyn Falempe <jfalempe@redhat.com>
+ */
+
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/iosys-map.h>
+
+struct drm_plane;
+
+#ifdef CONFIG_DRM_PANIC
+
+void drm_panic_register(struct drm_plane *plane);
+void drm_panic_unregister(struct drm_plane *plane);
+
+void drm_panic_set_buffer(struct drm_scanout_buffer *sb,
+			  struct drm_framebuffer *fb,
+			  struct iosys_map *map);
+void drm_panic_unset_buffer(struct drm_scanout_buffer *sb);
+#else
+
+static inline void drm_panic_register(struct drm_plane *plane) {}
+static inline void drm_panic_unregister(struct drm_plane *plane) {}
+
+static inline void drm_panic_set_buffer(struct drm_scanout_buffer *sb,
+				 struct drm_framebuffer *fb,
+				 struct iosys_map *map) {}
+static inline void drm_panic_unset_buffer(struct drm_scanout_buffer *sb) {}
+
+#endif
+
+#endif /* __DRM_PANIC_H__ */
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 641fe298052d..ebe1844e5f22 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -34,6 +34,7 @@
 struct drm_crtc;
 struct drm_printer;
 struct drm_modeset_acquire_ctx;
+struct drm_scanout_buffer;
 
 enum drm_scaling_filter {
 	DRM_SCALING_FILTER_DEFAULT,
@@ -779,6 +780,22 @@ struct drm_plane {
 	 * @hotspot_y_property: property to set mouse hotspot y offset.
 	 */
 	struct drm_property *hotspot_y_property;
+
+	/**
+	 * @panic_notifier: Used to register a panic notifier for this plane
+	 */
+	struct notifier_block panic_notifier;
+
+	/**
+	 * @panic_scanout:
+	 *
+	 * Optional Panic scanout data, it is allocated when calling
+	 * drm_panic_register() for this plane.
+	 * This will be used by drm panic when a panic occurs.
+	 * Don't access it directly, only use drm_panic_set_buffer() and
+	 * drm_panic_unset_buffer() if there is no scanout buffer available.
+	 */
+	struct drm_scanout_buffer *panic_scanout;
 };
 
 #define obj_to_plane(x) container_of(x, struct drm_plane, base)
-- 
2.43.0

