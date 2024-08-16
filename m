Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB563954A98
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 14:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E3810E64A;
	Fri, 16 Aug 2024 12:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fbHRSPpo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD4310E639
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 12:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723813016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F/MOPVwxc7R10I/XAlBVnjT2thFoQFjbtBAnrLgVe/U=;
 b=fbHRSPpo0tEOi3mQsKtCoxJYdtlGGERGqplwbhxraI/v4OtHk+JWZAkzwHNJ9jisT8CmN5
 QDpcl+vFdnzawC0xUhQvNK7Rz9RbX7PwshE/zczMuuDpMLInRQTRkqDd4VTmsO4aq49Xie
 SEHoor5qCmt8aB0xi5jYqhmxKFt7Uew=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-504-1z0J8M7CMSC5e_AFngVXFg-1; Fri,
 16 Aug 2024 08:56:52 -0400
X-MC-Unique: 1z0J8M7CMSC5e_AFngVXFg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BE61D1955D58; Fri, 16 Aug 2024 12:56:49 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.28])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6A8AE19560A3; Fri, 16 Aug 2024 12:56:45 +0000 (UTC)
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
Subject: [PATCH v2 3/5] drm/log: Introduce a new boot logger to draw the kmsg
 on the screen
Date: Fri, 16 Aug 2024 14:52:35 +0200
Message-ID: <20240816125612.1003295-4-jfalempe@redhat.com>
In-Reply-To: <20240816125612.1003295-1-jfalempe@redhat.com>
References: <20240816125612.1003295-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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

drm_log is a simple logger that uses the drm_client API to print the
kmsg boot log on the screen. This is not a full replacement to fbcon,
as it will only print the kmsg. It will never handle user input, or a
terminal because this is better done in userspace.

Design decisions:
 * It uses the drm_client API, so it should work on all drm drivers
   from the start.
 * It doesn't scroll the message, that way it doesn't need to redraw
   the whole screen for each new message.
   It also means it doesn't have to keep drawn messages in memory, to
   redraw them when scrolling.
 * It uses a circular buffer so the console->write() callback is very
   quick, and will never stall.
 * Drawing is done asynchronously using a workqueue.
 * drm_log can only be built-in (and drm must be built-in too).
   The reason is that, if you build it as a module, then a userspace
   application will be more appropriate than this module.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

v2:
 * Use vmap_local() api, with that change, I've tested it successfully on simpledrm, virtio-gpu, amdgpu, and nouveau.
 * Use deferred probe. Only do the probe the first time there is a log to draw. With this, if you boot with quiet, drm_log won't do any modeset.
 * Add build dependency on  disabling the fbdev emulation, as they are both drm_client, and there is no way to choose which one gets the focus.

 drivers/gpu/drm/Kconfig   |  14 ++
 drivers/gpu/drm/Makefile  |   2 +
 drivers/gpu/drm/drm_drv.c |   2 +
 drivers/gpu/drm/drm_log.c | 495 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_log.h |  11 +
 5 files changed, 524 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_log.c
 create mode 100644 drivers/gpu/drm/drm_log.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index fafb3884106a..cbebafc5bbf5 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -185,6 +185,20 @@ config DRM_PANIC_SCREEN_QR_VERSION
 	  Smaller QR code are easier to read, but will contain less debugging
 	  data. Default is 40.
 
+config DRM_LOG
+	bool "Print the kernel boot message on the screen"
+	depends on DRM=y
+	depends on !DRM_FBDEV_EMULATION
+	select DRM_DRAW
+	help
+	  This enable a drm logger, that will print the kernel messages to the
+	  screen until the userspace is ready to take over.
+	  It only makes sense to have it built-in, because otherwise it would
+	  be loaded after userspace.
+
+	  If you only need logs, but no terminal, or if you prefer userspace
+	  terminal, say "Y".
+
 config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
         bool "Enable refcount backtrace history in the DP MST helpers"
 	depends on STACKTRACE_SUPPORT
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 632247cddac9..ac06b6f2aa10 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -149,6 +149,8 @@ drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
 drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
 obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
 
+obj-$(CONFIG_DRM_LOG) += drm_log.o
+
 #
 # Drivers and the rest
 #
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 27007b53a8c8..471960a6c0c9 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -48,6 +48,7 @@
 #include <drm/drm_privacy_screen_machine.h>
 
 #include "drm_crtc_internal.h"
+#include "drm_log.h"
 #include "drm_internal.h"
 
 MODULE_AUTHOR("Gareth Hughes, Leif Delgass, José Fonseca, Jon Smirl");
@@ -946,6 +947,7 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 			goto err_unload;
 	}
 	drm_panic_register(dev);
+	drm_log_register(dev);
 
 	DRM_INFO("Initialized %s %d.%d.%d for %s on minor %d\n",
 		 driver->name, driver->major, driver->minor,
diff --git a/drivers/gpu/drm/drm_log.c b/drivers/gpu/drm/drm_log.c
new file mode 100644
index 000000000000..0739a4c72bb7
--- /dev/null
+++ b/drivers/gpu/drm/drm_log.c
@@ -0,0 +1,495 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/*
+ * Copyright (c) 2024 Red Hat.
+ * Author: Jocelyn Falempe <jfalempe@redhat.com>
+ */
+
+#include <linux/circ_buf.h>
+#include <linux/console.h>
+#include <linux/font.h>
+#include <linux/init.h>
+#include <linux/iosys-map.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#include <drm/drm_client.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_print.h>
+
+#include "drm_draw.h"
+#include "drm_log.h"
+
+MODULE_AUTHOR("Jocelyn Falempe");
+MODULE_DESCRIPTION("DRM boot logger");
+MODULE_LICENSE("GPL");
+
+/**
+ * DOC: overview
+ *
+ * This is a simple graphic logger, to print the kernel message on screen, until
+ * a userspace application is able to take over.
+ * It is only for debugging purpose.
+ */
+
+struct drm_log_scanout {
+	struct drm_client_buffer *buffer;
+	const struct font_desc *font;
+	u32 rows;
+	u32 columns;
+	u32 line;
+	u32 format;
+	u32 px_width;
+	u32 front_color;
+};
+
+struct drm_log_client {
+	struct list_head head;
+	struct drm_client_dev client;
+	bool probed;
+	u32 n_scanout;
+	struct drm_log_scanout *scanout;
+};
+
+static LIST_HEAD(drm_log_clients);
+static DEFINE_MUTEX(drm_log_lock);
+
+/*
+ * A circular buffer, with the last kmsg logs to print.
+ * 8K is more than what can be drawn on most monitors.
+ */
+#define CIRC_BUF_SIZE	(1 << 13)
+#define CIRC_BUF_MASK	(CIRC_BUF_SIZE - 1)
+struct circ_buf drm_log_buf;
+static DEFINE_SPINLOCK(drm_log_writer_lock);
+static DEFINE_SPINLOCK(drm_log_reader_lock);
+
+/*
+ * Circular buffer functions
+ */
+
+/* Read one line of kmsg, and update the tail pointer */
+static unsigned int drm_log_buf_read(char *s, unsigned int size)
+{
+	spin_lock(&drm_log_reader_lock);
+	/* Read index before reading contents at that index. */
+	unsigned long head = smp_load_acquire(&drm_log_buf.head);
+	unsigned long tail = drm_log_buf.tail;
+	unsigned int len = 0;
+	unsigned int i;
+
+	if (CIRC_CNT(head, tail, CIRC_BUF_SIZE) >= 1) {
+		/* take one line of text */
+		for (i = 0; ((i + tail) & CIRC_BUF_MASK) != head && len < size; i++) {
+			char c = drm_log_buf.buf[(i + tail) & CIRC_BUF_MASK];
+
+			if (c == '\n') {
+				i++;
+				break;
+			}
+			s[i] = c;
+			len++;
+		}
+		/* Finish reading descriptor before incrementing tail. */
+		smp_store_release(&drm_log_buf.tail,
+				  (tail + i) & CIRC_BUF_MASK);
+	}
+	spin_unlock(&drm_log_reader_lock);
+	return len;
+}
+
+/* Move the tail pointer at least len bytes, to make room */
+static void drm_log_buf_drop(unsigned int len)
+{
+	spin_lock(&drm_log_reader_lock);
+	/* Read index before reading contents at that index. */
+	unsigned long head = smp_load_acquire(&drm_log_buf.head);
+	unsigned long tail = drm_log_buf.tail;
+	unsigned long count = CIRC_CNT(head, tail, CIRC_BUF_SIZE);
+	int i;
+
+	/* Drop the oldest logs, stop at line boundary if possible */
+	for (i = len; i < count; i++) {
+		char c = drm_log_buf.buf[(i + tail) & CIRC_BUF_MASK];
+
+		if (c == '\n') {
+			i++;
+			break;
+		}
+	}
+	/* Finish reading descriptor before incrementing tail. */
+	smp_store_release(&drm_log_buf.tail,
+			  (tail + i) & CIRC_BUF_MASK);
+
+	spin_unlock(&drm_log_reader_lock);
+}
+
+static bool drm_log_buf_write(const char *s, unsigned int len)
+{
+	bool written = false;
+
+	spin_lock(&drm_log_writer_lock);
+	unsigned long head = drm_log_buf.head;
+	/* The spin_unlock() and next spin_lock() provide needed ordering. */
+	unsigned long tail = READ_ONCE(drm_log_buf.tail);
+
+	if (CIRC_SPACE(head, tail, CIRC_BUF_SIZE) >= len) {
+		int i;
+
+		for (i = 0; i < len; i++)
+			drm_log_buf.buf[(head + i) & CIRC_BUF_MASK] = s[i];
+
+		/* Update the head pointer, and make sure it is visible before releasing the lock */
+		smp_store_release(&drm_log_buf.head,
+				  (head + len) & CIRC_BUF_MASK);
+		written = true;
+	}
+	spin_unlock(&drm_log_writer_lock);
+	return written;
+}
+
+static void drm_log_blit(struct iosys_map *dst, unsigned int dst_pitch,
+			 const u8 *src, unsigned int src_pitch,
+			 u32 height, u32 width, u32 scale, u32 px_width, u32 color)
+{
+	switch (px_width) {
+	case 2:
+		drm_draw_blit16(dst, dst_pitch, src, src_pitch, height, width, scale, color);
+		break;
+	case 3:
+		drm_draw_blit24(dst, dst_pitch, src, src_pitch, height, width, scale, color);
+		break;
+	case 4:
+		drm_draw_blit32(dst, dst_pitch, src, src_pitch, height, width, scale, color);
+		break;
+	default:
+		WARN_ONCE(1, "Can't blit with pixel width %d\n", px_width);
+	}
+}
+
+static void drm_log_clear_line(struct drm_log_scanout *scanout, u32 line)
+{
+	struct drm_framebuffer *fb = scanout->buffer->fb;
+	unsigned long height = scanout->font->height;
+	struct iosys_map map;
+	struct drm_rect r = DRM_RECT_INIT(0, line * height, fb->width, height);
+
+	if (drm_client_buffer_vmap_local(scanout->buffer, &map))
+		return;
+	iosys_map_memset(&map, r.y1 * fb->pitches[0], 0, height * fb->pitches[0]);
+	drm_client_buffer_vunmap_local(scanout->buffer);
+	drm_client_framebuffer_flush(scanout->buffer, &r);
+}
+
+static void drm_log_draw_line(struct drm_log_scanout *scanout, const char *s,
+			      unsigned int len)
+{
+	struct drm_framebuffer *fb = scanout->buffer->fb;
+	struct iosys_map map;
+	const struct font_desc *font = scanout->font;
+	size_t font_pitch = DIV_ROUND_UP(font->width, 8);
+	const u8 *src;
+	u32 px_width = fb->format->cpp[0];
+	struct drm_rect r = DRM_RECT_INIT(0, scanout->line * font->height,
+					  fb->width, (scanout->line + 1) * font->height);
+	u32 i;
+
+	if (drm_client_buffer_vmap_local(scanout->buffer, &map))
+		return;
+
+	iosys_map_incr(&map, r.y1 * fb->pitches[0]);
+	for (i = 0; i < len && i < scanout->columns; i++) {
+		src = drm_draw_get_char_bitmap(font, s[i], font_pitch);
+		drm_log_blit(&map, fb->pitches[0], src, font_pitch, font->height, font->width,
+			     1, px_width, scanout->front_color);
+		iosys_map_incr(&map, font->width * px_width);
+	}
+
+	scanout->line++;
+	if (scanout->line >= scanout->rows)
+		scanout->line = 0;
+	drm_client_buffer_vunmap_local(scanout->buffer);
+	drm_client_framebuffer_flush(scanout->buffer, &r);
+}
+
+static void drm_log_draw_new_line(struct drm_log_scanout *scanout,
+				  const char *s, unsigned int len)
+{
+	if (scanout->line == 0) {
+		drm_log_clear_line(scanout, 0);
+		drm_log_clear_line(scanout, 1);
+		drm_log_clear_line(scanout, 2);
+	} else if (scanout->line + 2 < scanout->rows)
+		drm_log_clear_line(scanout, scanout->line + 2);
+
+	drm_log_draw_line(scanout, s, len);
+}
+
+static void drm_log_draw_kmsg_record(struct drm_log_scanout *scanout,
+				     const char *s, unsigned int len)
+{
+
+	while (len > scanout->columns) {
+		drm_log_draw_new_line(scanout, s, scanout->columns);
+		s += scanout->columns;
+		len -= scanout->columns;
+	}
+	if (len)
+		drm_log_draw_new_line(scanout, s, len);
+}
+
+static u32 drm_log_find_usable_format(struct drm_plane *plane)
+{
+	int i;
+
+	for (i = 0; i < plane->format_count; i++)
+		if (drm_draw_color_from_xrgb8888(0xffffff, plane->format_types[i]) != 0)
+			return plane->format_types[i];
+	return DRM_FORMAT_INVALID;
+}
+
+static int drm_log_setup_modeset(struct drm_client_dev *client,
+				 struct drm_mode_set *mode_set,
+				 struct drm_log_scanout *scanout)
+{
+	struct drm_crtc *crtc = mode_set->crtc;
+	u32 width = mode_set->mode->hdisplay;
+	u32 height = mode_set->mode->vdisplay;
+	u32 format;
+
+	scanout->font = get_default_font(width, height, NULL, NULL);
+	if (!scanout->font)
+		return -ENOENT;
+
+	format = drm_log_find_usable_format(crtc->primary);
+	if (format == DRM_FORMAT_INVALID)
+		return -EINVAL;
+
+	scanout->buffer = drm_client_framebuffer_create(client, width, height, format);
+	if (IS_ERR(scanout->buffer)) {
+		drm_warn(client->dev, "drm_log can't create framebuffer %d %d %p4cc\n",
+			 width, height, &format);
+		return -ENOMEM;
+	}
+	mode_set->fb = scanout->buffer->fb;
+	scanout->rows = height / scanout->font->height;
+	scanout->columns = width / scanout->font->width;
+	scanout->front_color = drm_draw_color_from_xrgb8888(0xffffff, format);
+	return 0;
+}
+
+static int drm_log_count_modeset(struct drm_client_dev *client)
+{
+	struct drm_mode_set *mode_set;
+	int count = 0;
+
+	mutex_lock(&client->modeset_mutex);
+	drm_client_for_each_modeset(mode_set, client)
+		count++;
+	mutex_unlock(&client->modeset_mutex);
+	return count;
+}
+
+static void drm_log_init_client(struct drm_log_client *dclient)
+{
+	struct drm_client_dev *client = &dclient->client;
+	struct drm_mode_set *mode_set;
+	int i, max_modeset;
+	int n_modeset = 0;
+
+	if (drm_client_modeset_probe(client, 0, 0))
+		return;
+
+	max_modeset = drm_log_count_modeset(client);
+	if (!max_modeset)
+		return;
+
+	dclient->scanout = kcalloc(max_modeset, sizeof(*dclient->scanout), GFP_KERNEL);
+	if (!dclient->scanout)
+		return;
+
+	mutex_lock(&client->modeset_mutex);
+	drm_client_for_each_modeset(mode_set, client) {
+		if (!mode_set->mode)
+			continue;
+		if (drm_log_setup_modeset(client, mode_set, &dclient->scanout[n_modeset]))
+			continue;
+		n_modeset++;
+	}
+	mutex_unlock(&client->modeset_mutex);
+	if (n_modeset == 0)
+		goto err_nomodeset;
+
+	if (drm_client_modeset_commit(client))
+		goto err_failed_commit;
+
+	dclient->n_scanout = n_modeset;
+	return;
+
+err_failed_commit:
+	for (i = 0; i < n_modeset; i++)
+		drm_client_framebuffer_delete(dclient->scanout[i].buffer);
+
+err_nomodeset:
+	kfree(dclient->scanout);
+	dclient->scanout = NULL;
+}
+
+static void drm_log_draw_all(const char *s, unsigned int len)
+{
+	struct drm_log_client *dclient;
+	int i;
+
+	mutex_lock(&drm_log_lock);
+	list_for_each_entry(dclient, &drm_log_clients, head) {
+		if (!dclient->probed) {
+			drm_log_init_client(dclient);
+			dclient->probed = true;
+		}
+		for (i = 0; i < dclient->n_scanout; i++)
+			drm_log_draw_kmsg_record(&dclient->scanout[i], s, len);
+	}
+	mutex_unlock(&drm_log_lock);
+}
+
+static bool drm_log_active_output(void)
+{
+	struct drm_log_client *dclient;
+	bool active = false;
+
+	mutex_lock(&drm_log_lock);
+	list_for_each_entry(dclient, &drm_log_clients, head)
+		if (dclient->n_scanout || !dclient->probed)
+			active = true;
+
+	mutex_unlock(&drm_log_lock);
+	return active;
+}
+
+static bool drm_log_work_draw(void)
+{
+	unsigned int len;
+	char buf[512];
+
+	len = drm_log_buf_read(buf, sizeof(buf));
+	if (len)
+		drm_log_draw_all(buf, len);
+	return len != 0;
+}
+
+static void drm_log_work_fn(struct work_struct *work);
+DECLARE_WORK(drm_log_work, drm_log_work_fn);
+
+static void drm_log_work_fn(struct work_struct *work)
+{
+	if (!drm_log_active_output())
+		return;
+
+	if (drm_log_work_draw())
+		schedule_work(&drm_log_work);
+}
+
+static struct drm_log_client *to_drm_log_client(struct drm_client_dev *client)
+{
+	return container_of(client, struct drm_log_client, client);
+}
+
+static void drm_log_free_scanout(struct drm_client_dev *client)
+{
+	struct drm_log_client *dclient = to_drm_log_client(client);
+	int i;
+
+	if (dclient->n_scanout) {
+		for (i = 0; i < dclient->n_scanout; i++)
+			drm_client_framebuffer_delete(dclient->scanout[i].buffer);
+		dclient->n_scanout = 0;
+		kfree(dclient->scanout);
+		dclient->scanout = NULL;
+	}
+}
+
+static void drm_log_client_unregister(struct drm_client_dev *client)
+{
+	struct drm_log_client *dclient = to_drm_log_client(client);
+	struct drm_device *dev = client->dev;
+
+	mutex_lock(&drm_log_lock);
+	drm_log_free_scanout(client);
+	list_del(&dclient->head);
+	mutex_unlock(&drm_log_lock);
+
+	drm_client_release(client);
+	kfree(dclient);
+	drm_info(dev, "Unregistered with drm log\n");
+}
+
+static int drm_log_client_hotplug(struct drm_client_dev *client)
+{
+	struct drm_log_client *dclient = to_drm_log_client(client);
+
+	mutex_lock(&drm_log_lock);
+	drm_log_free_scanout(client);
+	dclient->probed = false;
+	mutex_unlock(&drm_log_lock);
+	return 0;
+}
+
+static const struct drm_client_funcs drm_log_client_funcs = {
+	.owner		= THIS_MODULE,
+	.unregister	= drm_log_client_unregister,
+	.hotplug	= drm_log_client_hotplug,
+};
+
+/**
+ * drm_log_register() - Register a drm device to drm_log
+ * @dev: the drm device to register.
+ */
+void drm_log_register(struct drm_device *dev)
+{
+	struct drm_log_client *new;
+
+	new = kzalloc(sizeof(*new), GFP_KERNEL);
+	if (!new)
+		return;
+
+	if (drm_client_init(dev, &new->client, "drm_log", &drm_log_client_funcs)) {
+		kfree(new);
+		return;
+	}
+	drm_client_register(&new->client);
+	mutex_lock(&drm_log_lock);
+	list_add(&new->head, &drm_log_clients);
+	mutex_unlock(&drm_log_lock);
+	drm_info(dev, "Registered with drm log\n");
+	/* Kick the worker thread, as the circular buffer can already contain some messages */
+	schedule_work(&drm_log_work);
+}
+
+static void drm_log_con_write(struct console *con, const char *s, unsigned int len)
+{
+	while (!drm_log_buf_write(s, len))
+		drm_log_buf_drop(len);
+	schedule_work(&drm_log_work);
+}
+
+static struct console drm_log_console = {
+	.name		= "drm_log",
+	.write		= drm_log_con_write,
+	.flags		= CON_PRINTBUFFER,
+	.index		= -1,
+};
+
+static __init int drm_log_init(void)
+{
+	drm_log_buf.buf = kmalloc(CIRC_BUF_SIZE, GFP_KERNEL);
+	if (!drm_log_buf.buf)
+		return -ENOMEM;
+
+	register_console(&drm_log_console);
+	return 0;
+}
+
+module_init(drm_log_init);
diff --git a/drivers/gpu/drm/drm_log.h b/drivers/gpu/drm/drm_log.h
new file mode 100644
index 000000000000..3a4ea8150947
--- /dev/null
+++ b/drivers/gpu/drm/drm_log.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+#ifndef __DRM_LOG_H__
+#define __DRM_LOG_H__
+
+#ifdef CONFIG_DRM_LOG
+void drm_log_register(struct drm_device *dev);
+#else
+static inline void drm_log_register(struct drm_device *dev) {}
+#endif
+
+#endif
-- 
2.46.0

