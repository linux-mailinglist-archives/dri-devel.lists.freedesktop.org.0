Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ECB7A18FA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 10:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E3810E5CF;
	Fri, 15 Sep 2023 08:35:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0606810E5CC
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 08:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694766941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=voURBfdGwWp9sBJqQ+yGYtJnCWQnRE4G2YZCHi1KtK0=;
 b=fx/WFY4SzpLfVek9ynxY+eQV6TBNifpFpgfEPssePd/RWEIBRX7mcYc5cqj0Vx5yIL/P1m
 L+qSPpC8PaPs1RU2KBYP+81cknBzM0RStEpkkSVz0cIWWnhFsJMSdfQRh5mWNDEHES7bhY
 oNiYtu/kdXW7ho7RGsS/NhQn06pj+po=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-rYylj1znNuuMaf491gsVYQ-1; Fri, 15 Sep 2023 04:35:36 -0400
X-MC-Unique: rYylj1znNuuMaf491gsVYQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4ABEB858F19;
 Fri, 15 Sep 2023 08:35:36 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF10140C2070;
 Fri, 15 Sep 2023 08:35:34 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net
Subject: [PATCH v2 1/2] drm/panic: Add a drm panic handler
Date: Fri, 15 Sep 2023 10:28:21 +0200
Message-ID: <20230915083307.1185571-2-jfalempe@redhat.com>
In-Reply-To: <20230915083307.1185571-1-jfalempe@redhat.com>
References: <20230915083307.1185571-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>
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

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/Kconfig     |  11 ++
 drivers/gpu/drm/Makefile    |   1 +
 drivers/gpu/drm/drm_drv.c   |   3 +
 drivers/gpu/drm/drm_panic.c | 270 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_drv.h       |  14 ++
 include/drm/drm_panic.h     |  41 ++++++
 6 files changed, 340 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_panic.c
 create mode 100644 include/drm/drm_panic.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index afb3b2f5f425..98d78f865180 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -99,6 +99,17 @@ config DRM_KMS_HELPER
 	help
 	  CRTC helpers for KMS drivers.
 
+config DRM_PANIC
+	bool "Display a user-friendly message when a kernel panic occurs"
+	depends on DRM && !FRAMEBUFFER_CONSOLE
+	select FONT_SUPPORT
+	default y if DRM_SIMPLEDRM
+	help
+	  Enable a drm panic handler, which will display a user-friendly message
+	  when a kernel panic occurs. It's useful when using a user-space
+	  console instead of fbcon.
+	  It will only work if your graphic driver supports this feature.
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
index 12687dd9e1ac..0e0f1e258845 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -45,6 +45,7 @@
 #include <drm/drm_mode_object.h>
 #include <drm/drm_print.h>
 #include <drm/drm_privacy_screen_machine.h>
+#include <drm/drm_panic.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
@@ -1067,6 +1068,7 @@ static void drm_core_exit(void)
 	unregister_chrdev(DRM_MAJOR, "drm");
 	debugfs_remove(drm_debugfs_root);
 	drm_sysfs_destroy();
+	drm_panic_exit();
 	idr_destroy(&drm_minors_idr);
 	drm_connector_ida_destroy();
 }
@@ -1078,6 +1080,7 @@ static int __init drm_core_init(void)
 	drm_connector_ida_init();
 	idr_init(&drm_minors_idr);
 	drm_memcpy_init_early();
+	drm_panic_init();
 
 	ret = drm_sysfs_init();
 	if (ret < 0) {
diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
new file mode 100644
index 000000000000..32697325456f
--- /dev/null
+++ b/drivers/gpu/drm/drm_panic.c
@@ -0,0 +1,270 @@
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
+#include <drm/drm_fourcc.h>
+#include <drm/drm_panic.h>
+#include <drm/drm_print.h>
+
+
+MODULE_AUTHOR("Jocelyn Falempe");
+MODULE_DESCRIPTION("DRM PANIC");
+MODULE_LICENSE("GPL");
+
+/**
+ * DOC: DRM Panic
+ *
+ * This module displays a user friendly message on screen when a kernel panic
+ * occurs. It's useful when using a user-space console instead of fbcon.
+ * It's intended for end-user, so have minimal technical/debug information.
+ *
+ * It will display only one frame, so just clear it, and draw white pixels for
+ * the characters. Performance optimizations are low priority as the machine is
+ * already in an unusable state.
+ */
+
+/*
+ * List of active drm devices that can render a panic
+ */
+struct dpanic_drm_device {
+	struct list_head head;
+	struct drm_device *dev;
+};
+
+struct dpanic_line {
+	u32 len;
+	const char *txt;
+};
+
+#define PANIC_LINE(s) {.len = sizeof(s), .txt = s}
+
+const struct dpanic_line panic_msg[] = {
+	PANIC_LINE("KERNEL PANIC !"),
+	PANIC_LINE(""),
+	PANIC_LINE("Please reboot your computer."),
+	PANIC_LINE(""),
+};
+
+const struct dpanic_line logo[] = {
+	PANIC_LINE("     .--.        _"),
+	PANIC_LINE("    |o_o |      | |"),
+	PANIC_LINE("    |:_/ |      | |"),
+	PANIC_LINE("   //   \\ \\     |_|"),
+	PANIC_LINE("  (|     | )     _"),
+	PANIC_LINE(" /'\\_   _/`\\    (_)"),
+	PANIC_LINE(" \\___)=(___/"),
+};
+
+static LIST_HEAD(dpanic_devices);
+static DEFINE_MUTEX(dpanic_lock);
+
+#define IOSYS_WRITE8(offset, val) iosys_map_wr(screen_base, offset, u8, val)
+/*
+ * Only handle DRM_FORMAT_XRGB8888 for testing
+ */
+static inline void dpanic_draw_px(struct iosys_map *screen_base, size_t offset, u32 pixel_format,
+				  u8 r, u8 g, u8 b)
+{
+	switch (pixel_format) {
+	case DRM_FORMAT_XRGB8888:
+		IOSYS_WRITE8(offset++, b);
+		IOSYS_WRITE8(offset++, g);
+		IOSYS_WRITE8(offset++, r);
+		IOSYS_WRITE8(offset++, 0xff);
+		break;
+	default:
+		pr_err("Format not supported\n");
+		break;
+	/* TODO other format */
+	}
+}
+
+/* Draw a single character at given destination */
+static void dpanic_draw_char(char ch, size_t x, size_t y,
+			     struct drm_scanout_buffer *sb,
+			     const struct font_desc *font)
+{
+	size_t src_width, src_height, src_stride, i, dst_off;
+	const u8 *src;
+
+	src_width = font->width;
+	src_height = font->height;
+	src_stride = DIV_ROUND_UP(src_width, 8);
+
+	dst_off = x * font->width * sb->format->cpp[0] + y * font->height * sb->pitch;
+
+	src = font->data;
+	src += ch * src_height * src_stride;
+
+	while (src_height--) {
+		for (i = 0; i < src_width; ++i) {
+			/* only draw white pixels */
+			if (src[i / 8] & (0x80 >> (i % 8)))
+				dpanic_draw_px(&sb->map, dst_off + i * sb->format->cpp[0],
+					       sb->format->format, 0xff, 0xff, 0xff);
+		}
+		src += src_stride;
+		dst_off += sb->pitch;
+	}
+}
+
+static void dpanic_draw_line_centered(const struct dpanic_line *line, size_t y,
+				      struct drm_scanout_buffer *sb,
+				      const struct font_desc *font)
+{
+	size_t chars_per_line = sb->width / font->width;
+	size_t skip_left, x;
+
+	if (line->len > chars_per_line)
+		return;
+
+	skip_left = (chars_per_line - line->len) / 2;
+
+	for (x = 0; x < line->len; x++)
+		dpanic_draw_char(line->txt[x], skip_left + x, y, sb, font);
+}
+
+/*
+ * Draw the Tux logo at the upper left corner
+ */
+static void dpanic_draw_logo(struct drm_scanout_buffer *sb,
+			     const struct font_desc *font)
+{
+	size_t chars_per_line = sb->width / font->width;
+	size_t x, y;
+
+	for (y = 0; y < ARRAY_SIZE(logo); y++)
+		for (x = 0; x < logo[y].len && x < chars_per_line; x++)
+			dpanic_draw_char(logo[y].txt[x], x, y, sb, font);
+}
+
+/*
+ * Draw the panic message at the center of the screen
+ */
+static void dpanic_static_draw(struct drm_scanout_buffer *sb, const char *msg)
+{
+	size_t y, lines;
+	int skip_top;
+	size_t len = ARRAY_SIZE(panic_msg);
+	struct dpanic_line reason;
+	const struct font_desc *font = get_default_font(sb->width, sb->height, 0x8080, 0x8080);
+
+	if (!font)
+		return;
+
+	reason.len = strlen(msg);
+	reason.txt = msg;
+
+	lines = sb->height / font->height;
+	skip_top = (lines - len - 1) / 2;
+	if (skip_top < 0)
+		return;
+
+	/* clear screen */
+	iosys_map_memset(&sb->map, 0, 0, sb->height * sb->pitch);
+
+	for (y = 0; y < len; y++)
+		dpanic_draw_line_centered(&panic_msg[y], y + skip_top, sb, font);
+	dpanic_draw_line_centered(&reason, y + skip_top, sb, font);
+
+	if (skip_top >= ARRAY_SIZE(logo))
+		dpanic_draw_logo(sb, font);
+}
+
+static void drm_panic_device(struct drm_device *dev, const char *msg)
+{
+	struct drm_scanout_buffer sb;
+
+	if (dev->driver->get_scanout_buffer(dev, &sb))
+		return;
+
+	dpanic_static_draw(&sb, msg);
+}
+
+static int drm_panic(struct notifier_block *this, unsigned long event,
+		     void *ptr)
+{
+	struct dpanic_drm_device *dpanic_device;
+
+	list_for_each_entry(dpanic_device, &dpanic_devices, head) {
+		drm_panic_device(dpanic_device->dev, ptr);
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
+	struct dpanic_drm_device *new;
+
+	new = kzalloc(sizeof(*new), GFP_KERNEL);
+	if (!new)
+		return;
+
+	new->dev = dev;
+	list_add_tail(&new->head, &dpanic_devices);
+
+	drm_info(dev, "Registered with drm panic\n");
+}
+EXPORT_SYMBOL(drm_panic_register);
+
+/**
+ * drm_panic_unregister()
+ * @dev: the DRM device previously registered.
+ */
+void drm_panic_unregister(struct drm_device *dev)
+{
+	struct dpanic_drm_device *dpanic_device;
+	struct dpanic_drm_device *found = NULL;
+
+	list_for_each_entry(dpanic_device, &dpanic_devices, head) {
+		if (dpanic_device->dev == dev)
+			found = dpanic_device;
+	}
+	if (found) {
+		list_del(&found->head);
+		kfree(found);
+		drm_info(dev, "Unregistered with drm panic\n");
+	}
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
+ * drm_log_exit() - Shutdown drm-panic subsystem
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

