Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D358245B2
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 17:04:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115E610E4FF;
	Thu,  4 Jan 2024 16:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A6010E4FC
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 16:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704384251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fJy6TkMl36VpLoMFyo2pfKOwUQ2JBuz+x8uYmfI8KB8=;
 b=OkHTcv96J43CW8+lRGIljG5V2S3YwexZZkroyg3Y/HXvwTPR9IsMjM6CI3KHMEviQFg5Nk
 PRSUb1oeFwV86gd4QJKR7XnTEEYM3lMjl3wOVtn3AozFH0+Px3jkburwrszOHgFQ61zCXM
 MNfPyx7C5bvdX4eUZl3tHLsXPf9cTsM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-UNo63skGM9q_ZbMgJLEAQA-1; Thu, 04 Jan 2024 11:04:09 -0500
X-MC-Unique: UNo63skGM9q_ZbMgJLEAQA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7FAE85A5A3;
 Thu,  4 Jan 2024 16:04:08 +0000 (UTC)
Received: from hydra.bos2.lab (unknown [10.39.193.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 226051C060AF;
 Thu,  4 Jan 2024 16:04:07 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org
Subject: [PATCH v7 5/9] drm/fb_dma: Add generic get_scanout_buffer() for
 drm_panic
Date: Thu,  4 Jan 2024 17:00:49 +0100
Message-ID: <20240104160301.185915-6-jfalempe@redhat.com>
In-Reply-To: <20240104160301.185915-1-jfalempe@redhat.com>
References: <20240104160301.185915-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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

This was initialy done for imx6, but should work on most drivers
using drm_fb_dma_helper.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_fb_dma_helper.c | 55 +++++++++++++++++++++++++++++
 include/drm/drm_fb_dma_helper.h     |  4 +++
 2 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index 3b535ad1b07c..caed2935df4f 100644
--- a/drivers/gpu/drm/drm_fb_dma_helper.c
+++ b/drivers/gpu/drm/drm_fb_dma_helper.c
@@ -15,6 +15,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_plane.h>
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
@@ -148,3 +149,57 @@ void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
 	}
 }
 EXPORT_SYMBOL_GPL(drm_fb_dma_sync_non_coherent);
+
+#if defined(CONFIG_DRM_PANIC)
+/**
+ * @dev: DRM device
+ * @drm_scanout_buffer: scanout buffer for the panic handler
+ * Returns: 0 or negative error code
+ *
+ * Generic get_scanout_buffer() implementation, for drivers that uses the
+ * drm_fb_dma_helper.
+ */
+int drm_panic_gem_get_scanout_buffer(struct drm_device *dev,
+				     struct drm_scanout_buffer *sb)
+{
+	struct drm_plane *plane;
+	struct drm_gem_dma_object *dma_obj;
+	struct drm_framebuffer *fb;
+
+	drm_for_each_primary_visible_plane(plane, dev) {
+		fb = plane->state->fb;
+		/* Only support linear modifier */
+		if (fb->modifier != DRM_FORMAT_MOD_LINEAR)
+			continue;
+
+		/* Check if color format is supported */
+		if (!drm_panic_is_format_supported(fb->format->format))
+			continue;
+
+		dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
+
+		/* Buffer should be accessible from the CPU */
+		if (dma_obj->base.import_attach)
+			continue;
+
+		/* Buffer should be already mapped to CPU */
+		if (!dma_obj->vaddr)
+			continue;
+
+		iosys_map_set_vaddr(&sb->map, dma_obj->vaddr);
+		sb->format = fb->format;
+		sb->height = fb->height;
+		sb->width = fb->width;
+		sb->pitch = fb->pitches[0];
+		return 0;
+	}
+	return -ENODEV;
+}
+#else
+int drm_panic_gem_get_scanout_buffer(struct drm_device *dev,
+				     struct drm_scanout_buffer *sb)
+{
+	return 0;
+}
+#endif
+EXPORT_SYMBOL(drm_panic_gem_get_scanout_buffer);
diff --git a/include/drm/drm_fb_dma_helper.h b/include/drm/drm_fb_dma_helper.h
index d5e036c57801..2ae432865079 100644
--- a/include/drm/drm_fb_dma_helper.h
+++ b/include/drm/drm_fb_dma_helper.h
@@ -7,6 +7,7 @@
 struct drm_device;
 struct drm_framebuffer;
 struct drm_plane_state;
+struct drm_scanout_buffer;
 
 struct drm_gem_dma_object *drm_fb_dma_get_gem_obj(struct drm_framebuffer *fb,
 	unsigned int plane);
@@ -19,5 +20,8 @@ void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
 				  struct drm_plane_state *old_state,
 				  struct drm_plane_state *state);
 
+int drm_panic_gem_get_scanout_buffer(struct drm_device *dev,
+				     struct drm_scanout_buffer *sb);
+
 #endif
 
-- 
2.43.0

