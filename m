Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7527B6B66
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 16:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013EB10E18A;
	Tue,  3 Oct 2023 14:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8369210E0E3
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 14:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696343129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tf0HM2RM64+NdcYmmidtzQT3X8M6I2zwS4Bef0q9mVo=;
 b=FiEXtP+9USQgwK81bsGEu5rzF5SU2qmn05hYFkSzcyYipwED8+Q77KrjlH3FDS4jpRt1hr
 aGAcZQlf3MjorL+Kti+U1qB6IfvT4tni2PXf6OZjB0TqxlChaB6rp64yAHlXxBPaDjDsrk
 wJu+eJboWW0PSEqXwTL2OXWxzJG33+4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-Nam_8rHmOpGeG078y5SeAQ-1; Tue, 03 Oct 2023 10:25:25 -0400
X-MC-Unique: Nam_8rHmOpGeG078y5SeAQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C16D6101B040;
 Tue,  3 Oct 2023 14:25:24 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22DDB2156701;
 Tue,  3 Oct 2023 14:25:23 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net
Subject: [PATCH v4 2/4] drm/panic: Add a drm panic handler
Date: Tue,  3 Oct 2023 16:22:45 +0200
Message-ID: <20231003142508.190246-3-jfalempe@redhat.com>
In-Reply-To: <20231003142508.190246-1-jfalempe@redhat.com>
References: <20231003142508.190246-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Cc: gpiccoli@igalia.com, Jocelyn Falempe <jfalempe@redhat.com>
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

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/Kconfig     |  22 ++
 drivers/gpu/drm/Makefile    |   1 +
 drivers/gpu/drm/drm_drv.c   |   8 +
 drivers/gpu/drm/drm_panic.c | 413 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_drv.h       |  14 ++
 include/drm/drm_panic.h     |  41 ++++
 6 files changed, 499 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_panic.c
 create mode 100644 include/drm/drm_panic.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index afb3b2f5f425..17986f630a86 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -99,6 +99,28 @@ config DRM_KMS_HELPER
 	help
 	  CRTC helpers for KMS drivers.
 
+config DRM_PANIC
+	bool "Display a user-friendly message when a kernel panic occurs"
+	depends on DRM && !FRAMEBUFFER_CONSOLE
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
index 7a09a89b493b..a525dd9a2751 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -72,6 +72,7 @@ drm-$(CONFIG_DRM_PRIVACY_SCREEN) += \
 	drm_privacy_screen_x86.o
 drm-$(CONFIG_DRM_ACCEL) += ../../accel/drm_accel.o
 obj-$(CONFIG_DRM)	+= drm.o
+drm-$(CONFIG_DRM_PANIC) += drm_panic.o
 
 obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 12687dd9e1ac..41e211aadb15 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -43,6 +43,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_mode_object.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_print.h>
 #include <drm/drm_privacy_screen_machine.h>
 
@@ -943,6 +944,9 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 	if (drm_core_check_feature(dev, DRIVER_MODESET))
 		drm_modeset_register_all(dev);
 
+	if (driver->get_scanout_buffer)
+		drm_panic_register(dev);
+
 	DRM_INFO("Initialized %s %d.%d.%d %s for %s on minor %d\n",
 		 driver->name, driver->major, driver->minor,
 		 driver->patchlevel, driver->date,
@@ -986,6 +990,8 @@ void drm_dev_unregister(struct drm_device *dev)
 
 	dev->registered = false;
 
+	drm_panic_unregister(dev);
+
 	drm_client_dev_unregister(dev);
 
 	if (drm_core_check_feature(dev, DRIVER_MODESET))
@@ -1067,6 +1073,7 @@ static void drm_core_exit(void)
 	unregister_chrdev(DRM_MAJOR, "drm");
 	debugfs_remove(drm_debugfs_root);
 	drm_sysfs_destroy();
+	drm_panic_exit();
 	idr_destroy(&drm_minors_idr);
 	drm_connector_ida_destroy();
 }
@@ -1078,6 +1085,7 @@ static int __init drm_core_init(void)
 	drm_connector_ida_init();
 	idr_init(&drm_minors_idr);
 	drm_memcpy_init_early();
+	drm_panic_init();
 
 	ret = drm_sysfs_init();
 	if (ret < 0) {
diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
new file mode 100644
index 000000000000..1b7ba7ebe725
--- /dev/null
+++ b/drivers/gpu/drm/drm_panic.c
@@ -0,0 +1,413 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/*
+ * Copyright (c) 2023 Jocelyn Falempe <jfalempe@redhat.com>
+ * inspired by the drm_log driver from David Herrmann <dh.herrmann@gmail.com>
+ * Tux Ascii art taken from cowsay written by Tony Monroe
+ */
+
+#include <linux/font.h>
+#include <linux/iosys-map.h>
+#include <linux/kdebug.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/panic_notifier.h>
+#include <linux/types.h>
+
+#include <drm/drm_drv.h>
+#include <drm/drm_format_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_panic.h>
+#include <drm/drm_print.h>
+
+
+MODULE_AUTHOR("Jocelyn Falempe");
+MODULE_DESCRIPTION("DRM panic handler");
+MODULE_LICENSE("GPL");
+
+/**
+ * DOC: DRM Panic
+ *
+ * This module displays a user friendly message on screen when a kernel panic
+ * occurs. This is conflicting with fbcon, so you can only enable it when fbcon
+ * is disabled.
+ * It's intended for end-user, so have minimal technical/debug information.
+ */
+
+/*
+ * Implementation details:
+ *
+ * It is a panic handler, so it can't take lock, allocate memory, run tasks/irq,
+ * or attempt to sleep. It's a best effort, and it may not be able to display
+ * the message in all situations (like if the panic occurs in the middle of a
+ * modesetting).
+ * It will display only one static frame, so performance optimizations are low
+ * priority as the machine is already in an unusable state.
+ * The frame is drawn line by line, to allow easier conversion to the fb format.
+ */
+
+/*
+ * List of active drm devices that can render a panic
+ */
+struct drm_panic_device {
+	struct list_head head;
+	struct drm_device *dev;
+};
+
+struct drm_panic_line {
+	u32 len;
+	const char *txt;
+};
+
+#define PANIC_LINE(s) {.len = sizeof(s) - 1, .txt = s}
+
+struct drm_panic_line panic_msg[] = {
+	PANIC_LINE("KERNEL PANIC !"),
+	PANIC_LINE(""),
+	PANIC_LINE("Please reboot your computer."),
+	PANIC_LINE(""),
+	PANIC_LINE(""), /* overwritten with panic reason */
+};
+
+const struct drm_panic_line logo[] = {
+	PANIC_LINE("     .--.        _"),
+	PANIC_LINE("    |o_o |      | |"),
+	PANIC_LINE("    |:_/ |      | |"),
+	PANIC_LINE("   //   \\ \\     |_|"),
+	PANIC_LINE("  (|     | )     _"),
+	PANIC_LINE(" /'\\_   _/`\\    (_)"),
+	PANIC_LINE(" \\___)=(___/"),
+};
+
+static LIST_HEAD(drm_panic_devices);
+static DEFINE_MUTEX(drm_panic_lock);
+
+/*
+ * This buffer is used to convert xrgb8888 to the scanout buffer format.
+ * It is allocated when the first client register, and freed when the last client
+ * unregisters.
+ * There is no need for mutex, as the panic garantee that only 1 CPU is still
+ * running, and preemption is disabled.
+ */
+#define DRM_PANIC_MAX_WIDTH 8096
+static u32 *drm_panic_line_buf;
+
+static u32 fg_color;
+static u32 bg_color;
+
+static void draw_line(const struct drm_panic_line *msg, size_t left_margin,
+		      size_t l, size_t width, const struct font_desc *font)
+{
+	size_t x, i;
+	const u8 *src;
+	size_t src_stride = DIV_ROUND_UP(font->width, 8);
+	u32 *dst = drm_panic_line_buf;
+
+	for (x = 0; x < left_margin * font->width; x++)
+		*dst++ = bg_color;
+
+	for (i = 0; i < msg->len; i++) {
+		src = font->data + (msg->txt[i] * font->height + l) * src_stride;
+		drm_fb_r1_to_32bit_line(dst, src, font->width, fg_color, bg_color);
+		dst += font->width;
+	}
+	for (x = (left_margin + msg->len) * font->width; x < width ; x++)
+		*dst++ = bg_color;
+}
+
+static void draw_txt_line(const struct drm_panic_line *msg, size_t left_margin, size_t y,
+			  struct drm_scanout_buffer *sb,
+			  const struct font_desc *font,
+			  void (*convert)(void *dbuf, const void *sbuf, unsigned int npixels))
+{
+	size_t dst_off;
+	size_t l;
+
+	for (l = 0; l < font->height; l++) {
+		draw_line(msg, left_margin, l, sb->width, font);
+		if (convert)
+			convert(drm_panic_line_buf, drm_panic_line_buf, sb->width);
+
+		dst_off = (y * font->height + l) * sb->pitch;
+		iosys_map_memcpy_to(&sb->map, dst_off, drm_panic_line_buf,
+				    sb->width * sb->format->cpp[0]);
+	}
+}
+
+static void draw_empty_lines(struct drm_scanout_buffer *sb,
+			     size_t start_line,
+			     size_t len,
+			     void (*convert)(void *dbuf, const void *sbuf, unsigned int npixels))
+{
+	size_t i, dst_off;
+	u32 *dst = drm_panic_line_buf;
+
+	for (i = 0; i < sb->width; i++)
+		*dst++ = bg_color;
+
+	if (convert)
+		convert(drm_panic_line_buf, drm_panic_line_buf, sb->width);
+
+	for (i = 0; i < len; i++) {
+		dst_off = (start_line + i) * sb->pitch;
+		iosys_map_memcpy_to(&sb->map, dst_off, drm_panic_line_buf,
+				    sb->width * sb->format->cpp[0]);
+	}
+}
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
+ * Return the function to convert xrgb8888 to the scanout buffer format
+ * NULL if no conversion is needed, and ERR_PTR if format can't be converted.
+ * Also set fg_color and bg_color accordingly.
+ */
+static void (*get_convert_func(const struct drm_format_info *format))
+	    (void *, const void *, unsigned int)
+{
+	/* reset colors, this are le32 value as it's what drm_fb_xxxx_to_xxx() expect */
+	fg_color = CONFIG_DRM_PANIC_FOREGROUND_COLOR;
+	bg_color = CONFIG_DRM_PANIC_BACKGROUND_COLOR;
+
+	switch (format->format) {
+	/* 16 bit format */
+	case DRM_FORMAT_RGB565:
+		return drm_fb_xrgb8888_to_rgb565_line;
+	case DRM_FORMAT_RGBA5551:
+		return drm_fb_xrgb8888_to_rgba5551_line;
+	case DRM_FORMAT_XRGB1555:
+		return drm_fb_xrgb8888_to_xrgb1555_line;
+	case DRM_FORMAT_ARGB1555:
+		return drm_fb_xrgb8888_to_argb1555_line;
+	/* 24 bit format */
+	case DRM_FORMAT_RGB888:
+		return drm_fb_xrgb8888_to_rgb888_line;
+	/* 32 bit format: convert the fg_color and bg_color */
+	case DRM_FORMAT_XRGB8888:
+		return NULL;
+	case DRM_FORMAT_ARGB8888:
+		fg_color = fg_color | 0xff000000;
+		bg_color = bg_color | 0xff000000;
+		return NULL;
+	case DRM_FORMAT_XBGR8888:
+		fg_color = swab32(fg_color) >> 8;
+		bg_color = swab32(bg_color) >> 8;
+		return NULL;
+	case DRM_FORMAT_ABGR8888:
+		fg_color = (swab32(fg_color) >> 8) | 0xff000000;
+		bg_color = (swab32(bg_color) >> 8) | 0xff000000;
+		return NULL;
+	case DRM_FORMAT_XRGB2101010:
+		drm_fb_xrgb8888_to_xrgb2101010_line(&fg_color, &fg_color, 1);
+		drm_fb_xrgb8888_to_xrgb2101010_line(&bg_color, &bg_color, 1);
+		return NULL;
+	case DRM_FORMAT_ARGB2101010:
+		drm_fb_xrgb8888_to_argb2101010_line(&fg_color, &fg_color, 1);
+		drm_fb_xrgb8888_to_argb2101010_line(&bg_color, &bg_color, 1);
+		return NULL;
+	default:
+		return ERR_PTR(EINVAL);
+	}
+}
+
+/*
+ * Draw the panic message at the center of the screen
+ */
+static void draw_panic_static(struct drm_scanout_buffer *sb, const char *msg)
+{
+	size_t lines, msg_lines, l, msg_start_line, msgi;
+	size_t center, chars_per_line;
+	bool draw_logo;
+	struct drm_panic_line panic_line;
+	size_t msg_len = ARRAY_SIZE(panic_msg);
+	size_t logo_len = ARRAY_SIZE(logo);
+	void (*convert)(void *dbuf, const void *sbuf, unsigned int npixels);
+	const struct font_desc *font = get_default_font(sb->width, sb->height, 0x8080, 0x8080);
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
+	convert = get_convert_func(sb->format);
+	if (IS_ERR(convert))
+		return;
+
+	msgi = 0;
+	panic_line.len = 0;
+	for (l = 0; l < lines; l++) {
+		if (draw_logo && l < logo_len)
+			draw_txt_line(&logo[l], 0, l, sb, font, convert);
+		else if (l >= msg_start_line && msgi < msg_len) {
+			if (!panic_line.len) {
+				panic_line.txt = panic_msg[msgi].txt;
+				panic_line.len = panic_msg[msgi].len;
+			}
+			if (!panic_line.len)
+				draw_empty_lines(sb, l * font->height, font->height, convert);
+			else {
+				center = panic_line.len > chars_per_line ?
+					 0 : (chars_per_line - panic_line.len) / 2;
+				draw_txt_line(&panic_line, center, l, sb, font, convert);
+			}
+			if (panic_line.len > chars_per_line) {
+				panic_line.len -= chars_per_line;
+				panic_line.txt += chars_per_line;
+			} else {
+				panic_line.len = 0;
+				msgi++;
+			}
+		} else {
+			draw_empty_lines(sb, l * font->height, font->height, convert);
+		}
+	}
+	/* Fill the bottom of the screen, if sb->height is not a multiple of font->height */
+	draw_empty_lines(sb, lines * font->height, sb->height - lines * font->height, convert);
+}
+
+static void draw_panic_device(struct drm_device *dev, const char *msg)
+{
+	struct drm_scanout_buffer sb;
+
+	if (dev->driver->get_scanout_buffer(dev, &sb))
+		return;
+	if (!drm_panic_line_buf)
+		return;
+
+	/* to avoid buffer overflow on drm_panic_line_buf */
+	if (sb.width > DRM_PANIC_MAX_WIDTH)
+		sb.width = DRM_PANIC_MAX_WIDTH;
+
+	draw_panic_static(&sb, msg);
+}
+
+static int drm_panic(struct notifier_block *this, unsigned long event,
+		     void *ptr)
+{
+	struct drm_panic_device *drm_panic_device;
+
+	list_for_each_entry(drm_panic_device, &drm_panic_devices, head) {
+		draw_panic_device(drm_panic_device->dev, ptr);
+	}
+	return NOTIFY_OK;
+}
+
+struct notifier_block drm_panic_notifier = {
+	.notifier_call = drm_panic,
+};
+
+/**
+ * drm_panic_register() - Initialize DRM panic for a device
+ * @dev: the DRM device on which the panic screen will be displayed.
+ */
+void drm_panic_register(struct drm_device *dev)
+{
+	struct drm_panic_device *new;
+
+	new = kzalloc(sizeof(*new), GFP_KERNEL);
+	if (!new)
+		return;
+
+	new->dev = dev;
+	mutex_lock(&drm_panic_lock);
+	if (!drm_panic_line_buf)
+		drm_panic_line_buf = kmalloc(DRM_PANIC_MAX_WIDTH * sizeof(u32), GFP_KERNEL);
+	if (!drm_panic_line_buf)
+		goto unlock;
+	list_add_tail(&new->head, &drm_panic_devices);
+	drm_info(dev, "Registered with drm panic\n");
+unlock:
+	mutex_unlock(&drm_panic_lock);
+}
+EXPORT_SYMBOL(drm_panic_register);
+
+/**
+ * drm_panic_unregister()
+ * @dev: the DRM device previously registered.
+ */
+void drm_panic_unregister(struct drm_device *dev)
+{
+	struct drm_panic_device *drm_panic_device;
+	struct drm_panic_device *found = NULL;
+
+	mutex_lock(&drm_panic_lock);
+	list_for_each_entry(drm_panic_device, &drm_panic_devices, head) {
+		if (drm_panic_device->dev == dev)
+			found = drm_panic_device;
+	}
+	if (found) {
+		list_del(&found->head);
+		kfree(found);
+		drm_info(dev, "Unregistered with drm panic\n");
+	}
+	if (drm_panic_line_buf && list_empty(&drm_panic_devices)) {
+		kfree(drm_panic_line_buf);
+		drm_panic_line_buf = NULL;
+	}
+	mutex_unlock(&drm_panic_lock);
+}
+EXPORT_SYMBOL(drm_panic_unregister);
+
+/**
+ * drm_panic_init() - Initialize drm-panic subsystem
+ *
+ * register the panic notifier
+ */
+void drm_panic_init(void)
+{
+	atomic_notifier_chain_register(&panic_notifier_list,
+				       &drm_panic_notifier);
+}
+
+/**
+ * drm_panic_exit() - Shutdown drm-panic subsystem
+ */
+void drm_panic_exit(void)
+{
+	atomic_notifier_chain_unregister(&panic_notifier_list,
+					 &drm_panic_notifier);
+}
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 89e2706cac56..e538c87116d3 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -43,6 +43,7 @@ struct dma_buf_attachment;
 struct drm_display_mode;
 struct drm_mode_create_dumb;
 struct drm_printer;
+struct drm_scanout_buffer;
 struct sg_table;
 
 /**
@@ -408,6 +409,19 @@ struct drm_driver {
 	 */
 	void (*show_fdinfo)(struct drm_printer *p, struct drm_file *f);
 
+	/**
+	 * @get_scanout_buffer:
+	 *
+	 * Get the current scanout buffer, to display a panic message with drm_panic.
+	 * It is called from a panic callback, and must follow its restrictions.
+	 *
+	 * Returns:
+	 *
+	 * Zero on success, negative errno on failure.
+	 */
+	int (*get_scanout_buffer)(struct drm_device *dev,
+				  struct drm_scanout_buffer *sb);
+
 	/** @major: driver major number */
 	int major;
 	/** @minor: driver minor number */
diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
new file mode 100644
index 000000000000..db430b8dfbb2
--- /dev/null
+++ b/include/drm/drm_panic.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+#ifndef __DRM_PANIC_H__
+#define __DRM_PANIC_H__
+
+/*
+ * Copyright (c) 2023 Jocelyn Falempe <jfalempe@redhat.com>
+ */
+
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/iosys-map.h>
+
+struct drm_device;
+
+struct drm_scanout_buffer {
+	const struct drm_format_info *format;
+	struct iosys_map map;
+	unsigned int pitch;
+	unsigned int width;
+	unsigned int height;
+};
+
+#ifdef CONFIG_DRM_PANIC
+
+void drm_panic_init(void);
+void drm_panic_exit(void);
+
+void drm_panic_register(struct drm_device *dev);
+void drm_panic_unregister(struct drm_device *dev);
+
+#else
+
+static inline void drm_panic_init(void) {}
+static inline void drm_panic_exit(void) {}
+
+static inline void drm_panic_register(struct drm_device *dev) {}
+static inline void drm_panic_unregister(struct drm_device *dev) {}
+
+#endif
+
+#endif /* __DRM_LOG_H__ */
-- 
2.41.0

