Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B876E7768B0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 21:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1B310E499;
	Wed,  9 Aug 2023 19:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAFE10E0EC
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 19:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691609144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YJKCkw5GRU+YbVjpZSPkFTiO6bhoDhN5ayJUPJkRm+4=;
 b=D+IInqu3S496q2S9FaQqix0w3jH4cnPF2tWkqR0I6CF4932ZipNRtsh3oYqj5RhTjARYZt
 Yw4QvSbuIvl/6n2gVH/lmSE+TkjoCfgbcrIYHlDae5QMFevZPfgjPxn0exw+OLBynfZWcL
 HN7j5NdK98CaqvnKK63J5j+qFgpLyU0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-6NwoFkVYNZm50R216xnDgw-1; Wed, 09 Aug 2023 15:25:40 -0400
X-MC-Unique: 6NwoFkVYNZm50R216xnDgw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EA78800270;
 Wed,  9 Aug 2023 19:25:40 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 949CC492C13;
 Wed,  9 Aug 2023 19:25:38 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net
Subject: [PATCH 1/2] drm/panic: Add a drm panic handler
Date: Wed,  9 Aug 2023 21:17:28 +0200
Message-ID: <20230809192514.158062-2-jfalempe@redhat.com>
In-Reply-To: <20230809192514.158062-1-jfalempe@redhat.com>
References: <20230809192514.158062-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/Kconfig     |  11 ++
 drivers/gpu/drm/Makefile    |   1 +
 drivers/gpu/drm/drm_drv.c   |   3 +
 drivers/gpu/drm/drm_panic.c | 286 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_panic.h     |  26 ++++
 5 files changed, 327 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_panic.c
 create mode 100644 include/drm/drm_panic.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index ba3fb04bb691..cc6771351d6d 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -98,6 +98,17 @@ config DRM_KMS_HELPER
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
index a33257d2bc7f..c73dbac9c01e 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -72,6 +72,7 @@ drm-$(CONFIG_DRM_PRIVACY_SCREEN) += \
 	drm_privacy_screen_x86.o
 drm-$(CONFIG_DRM_ACCEL) += ../../accel/drm_accel.o
 obj-$(CONFIG_DRM)	+= drm.o
+drm-$(CONFIG_DRM_PANIC) += drm_panic.o
 
 obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index cee0cc522ed9..0f2d96edd86d 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -45,6 +45,7 @@
 #include <drm/drm_mode_object.h>
 #include <drm/drm_print.h>
 #include <drm/drm_privacy_screen_machine.h>
+#include <drm/drm_panic.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
@@ -1065,6 +1066,7 @@ static void drm_core_exit(void)
 	unregister_chrdev(DRM_MAJOR, "drm");
 	debugfs_remove(drm_debugfs_root);
 	drm_sysfs_destroy();
+	drm_panic_exit();
 	idr_destroy(&drm_minors_idr);
 	drm_connector_ida_destroy();
 }
@@ -1076,6 +1078,7 @@ static int __init drm_core_init(void)
 	drm_connector_ida_init();
 	idr_init(&drm_minors_idr);
 	drm_memcpy_init_early();
+	drm_panic_init();
 
 	ret = drm_sysfs_init();
 	if (ret < 0) {
diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
new file mode 100644
index 000000000000..538ca5daaebf
--- /dev/null
+++ b/drivers/gpu/drm/drm_panic.c
@@ -0,0 +1,286 @@
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
+#include <linux/slab.h>
+
+#include <drm/drm_client.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_print.h>
+
+MODULE_AUTHOR("Jocelyn Falempe");
+MODULE_DESCRIPTION("DRM PANIC");
+MODULE_LICENSE("GPL");
+
+/**
+ * This module displays a user friendly message on screen when a kernel panic
+ * occurs.
+ * It will display only one frame, so just clear it, and draw white pixels for
+ * the characters. Performance optimizations are low priority as the machine is
+ * already in an unusable state.
+ */
+
+/**
+ * List of drm clients
+ */
+struct dpanic_drm_client {
+	struct list_head head;
+	struct drm_client_dev client;
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
+	PANIC_LINE("Please reboot your computer.")
+};
+
+const struct dpanic_line logo[] = {
+	PANIC_LINE("     .--."),
+	PANIC_LINE("    |o_o |"),
+	PANIC_LINE("    |:_/ |"),
+	PANIC_LINE("   //   \\ \\"),
+	PANIC_LINE("  (|     | )"),
+	PANIC_LINE(" /'\\_   _/`\\"),
+	PANIC_LINE(" \\___)=(___/"),
+};
+
+static LIST_HEAD(dpanic_clients);
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
+			     struct drm_framebuffer *fb,
+			     struct iosys_map *map,
+			     const struct font_desc *font)
+{
+	size_t src_width, src_height, src_stride, i, dst_off;
+	const u8 *src;
+
+	src_width = font->width;
+	src_height = font->height;
+	src_stride = DIV_ROUND_UP(src_width, 8);
+
+	dst_off = x * font->width * fb->format->cpp[0] + y * font->height * fb->pitches[0];
+
+	src = font->data;
+	src += ch * src_height * src_stride;
+
+	while (src_height--) {
+		for (i = 0; i < src_width; ++i) {
+			/* only draw white pixels */
+			if (src[i / 8] & (0x80 >> (i % 8)))
+				dpanic_draw_px(map, dst_off + i * fb->format->cpp[0],
+					       fb->format->format, 0xff, 0xff, 0xff);
+		}
+		src += src_stride;
+		dst_off += fb->pitches[0];
+	}
+}
+
+static void dpanic_draw_line_centered(const struct dpanic_line *line, size_t y,
+				      struct drm_framebuffer *fb,
+				      struct iosys_map *map,
+				      const struct font_desc *font)
+{
+	size_t chars_per_line = fb->width / font->width;
+	size_t skip_left, x;
+
+	if (line->len > chars_per_line)
+		return;
+
+	skip_left = (chars_per_line - line->len) / 2;
+
+	for (x = 0; x < line->len; x++)
+		dpanic_draw_char(line->txt[x], skip_left + x, y, fb, map, font);
+}
+
+/*
+ * Draw the Tux logo at the upper left corner
+ */
+static void dpanic_draw_logo(struct drm_framebuffer *fb,
+			     struct iosys_map *map,
+			     const struct font_desc *font)
+{
+	size_t chars_per_line = fb->width / font->width;
+	size_t x, y;
+
+	for (y = 0; y < ARRAY_SIZE(logo); y++)
+		for (x = 0; x < logo[y].len && x < chars_per_line; x++)
+			dpanic_draw_char(logo[y].txt[x], x, y, fb, map, font);
+}
+
+/*
+ * Draw the panic message at the center of the screen
+ */
+static void dpanic_static_draw(struct drm_client_buffer *buffer)
+{
+	size_t y, lines, skip_top;
+	size_t len = ARRAY_SIZE(panic_msg);
+	struct iosys_map map;
+	struct drm_framebuffer *fb = buffer->fb;
+	const struct font_desc *font = get_default_font(fb->width, fb->height, 0x8080, 0x8080);
+
+	if (!font)
+		return;
+
+	if (drm_client_buffer_vmap(buffer, &map)) {
+		pr_err("VMAP failed\n");
+		return;
+	}
+	lines = fb->height / font->height;
+	skip_top = (lines - len) / 2;
+
+	/* clear screen */
+	iosys_map_memset(&map, 0, 0, fb->height * fb->pitches[0]);
+
+	for (y = 0; y < len; y++)
+		dpanic_draw_line_centered(&panic_msg[y], y + skip_top, fb, &map, font);
+
+	if (skip_top >= ARRAY_SIZE(logo))
+		dpanic_draw_logo(fb, &map, font);
+
+	drm_client_framebuffer_flush(buffer, NULL);
+}
+
+#define MAX_MODESET 8
+
+static void drm_panic_client(struct drm_client_dev *client)
+{
+	struct drm_client_buffer *buffer[MAX_MODESET];
+	int ret, n_modeset, i;
+	struct drm_mode_set *mode_set;
+
+	ret = drm_client_modeset_probe(client, 0, 0);
+	if (ret)
+		return;
+
+	n_modeset = 0;
+	drm_client_for_each_modeset(mode_set, client) {
+		struct drm_plane *primary = mode_set->crtc->primary;
+		struct drm_framebuffer *fb;
+
+		if (primary->state && primary->state->fb)
+			fb = primary->state->fb;
+		else if (primary->fb)
+			fb = primary->fb;
+		else
+			continue;
+
+		pr_debug("DRM Panic, FB width %d, height %d\n", fb->width, fb->height);
+		buffer[n_modeset] = drm_client_framebuffer_create(client, fb->width,
+								  fb->height,
+								  fb->format->format);
+
+		if (IS_ERR(buffer[n_modeset])) {
+			pr_err("DRM Panic can't allocate buffer\n");
+			continue;
+		}
+		mode_set->fb = buffer[n_modeset]->fb;
+		n_modeset++;
+		if (n_modeset == MAX_MODESET)
+			break;
+	}
+	ret = drm_client_modeset_commit_locked(client);
+	if (ret)
+		return;
+
+	for (i = 0; i < n_modeset; i++)
+		dpanic_static_draw(buffer[i]);
+}
+
+static int drm_panic(struct notifier_block *this, unsigned long event,
+		     void *ptr)
+{
+	struct dpanic_drm_client *dpanic_client;
+
+	list_for_each_entry(dpanic_client, &dpanic_clients, head) {
+		drm_panic_client(&dpanic_client->client);
+	}
+	return NOTIFY_OK;
+}
+
+struct notifier_block drm_panic_notifier = {
+	.notifier_call = drm_panic,
+};
+
+void drm_panic_init_client(struct drm_device *dev)
+{
+	struct dpanic_drm_client *new;
+	int ret;
+
+	new = kzalloc(sizeof(*new), GFP_KERNEL);
+	if (!new)
+		return;
+
+	ret = drm_client_init(dev, &new->client, "drm_panic", NULL);
+	if (ret < 0) {
+		kfree(new);
+		return;
+	}
+	drm_client_register(&new->client);
+	list_add_tail(&new->head, &dpanic_clients);
+
+	drm_info(dev, "Registered with drm panic\n");
+}
+EXPORT_SYMBOL(drm_panic_init_client);
+
+/**
+ * drm_panic_init() - Initialize drm-panic subsystem
+ *
+ * register the panic notifier
+ */
+void drm_panic_init(void)
+{
+	/* register panic handler */
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
diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
new file mode 100644
index 000000000000..a943b82324e3
--- /dev/null
+++ b/include/drm/drm_panic.h
@@ -0,0 +1,26 @@
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
+#ifdef CONFIG_DRM_PANIC
+
+void drm_panic_init(void);
+void drm_panic_exit(void);
+
+void drm_panic_init_client(struct drm_device *dev);
+#else
+
+static inline void drm_panic_init(void) {}
+static inline void drm_panic_exit(void) {}
+static inline void drm_panic_init_client(struct drm_device *dev) {}
+#endif
+
+#endif /* __DRM_LOG_H__ */
-- 
2.41.0

