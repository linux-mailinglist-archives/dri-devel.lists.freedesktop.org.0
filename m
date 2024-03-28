Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9AF88FEA7
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 13:07:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC14F1123FC;
	Thu, 28 Mar 2024 12:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XOFwH+O5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553481123F8
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 12:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711627634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p5BT3x60ue4qMDprSHkYDSwiyFkR5rw3puOG0iUScjY=;
 b=XOFwH+O5+bMdwWu0/Ep0uUKklsQF/Cbv/8yYoritqcOd74dL2aFQ1u3QRSHbCy01gbeL/l
 U5Yo/NEM+ok5zHanHU8LPngktXlyyzlbLBER2ZMpV4tHGRRwzBGNFNu7tVcx+uvICVj2sO
 7mtrJHm0+ayuR2AzXJ9MtpUGWNegDYY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-5hceNCXcMHufpTzuJOLZVA-1; Thu, 28 Mar 2024 08:07:08 -0400
X-MC-Unique: 5hceNCXcMHufpTzuJOLZVA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB82D101A58D;
 Thu, 28 Mar 2024 12:07:07 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 883B42024517;
 Thu, 28 Mar 2024 12:07:05 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org,
 sui.jingfeng@linux.dev
Cc: gpiccoli@igalia.com,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v11 5/9] drm/fb_dma: Add generic get_scanout_buffer() for
 drm_panic
Date: Thu, 28 Mar 2024 13:03:47 +0100
Message-ID: <20240328120638.468738-6-jfalempe@redhat.com>
In-Reply-To: <20240328120638.468738-1-jfalempe@redhat.com>
References: <20240328120638.468738-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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

This was initialy done for imx6, but should work on most drivers
using drm_fb_dma_helper.

v8:
 * Replace get_scanout_buffer() logic with drm_panic_set_buffer()
   (Thomas Zimmermann)

v9:
 * go back to get_scanout_buffer()
 * move get_scanout_buffer() to plane helper functions

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_fb_dma_helper.c | 47 +++++++++++++++++++++++++++++
 include/drm/drm_fb_dma_helper.h     |  4 +++
 2 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index 3b535ad1b07c..010327069ad4 100644
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
@@ -148,3 +149,49 @@ void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
 	}
 }
 EXPORT_SYMBOL_GPL(drm_fb_dma_sync_non_coherent);
+
+#if defined(CONFIG_DRM_PANIC)
+/**
+ * @plane: DRM primary plane
+ * @drm_scanout_buffer: scanout buffer for the panic handler
+ * Returns: 0 or negative error code
+ *
+ * Generic get_scanout_buffer() implementation, for drivers that uses the
+ * drm_fb_dma_helper.
+ */
+int drm_panic_gem_get_scanout_buffer(struct drm_plane *plane,
+				     struct drm_scanout_buffer *sb)
+{
+	struct drm_gem_dma_object *dma_obj;
+	struct drm_framebuffer *fb;
+
+	fb = plane->state->fb;
+	/* Only support linear modifier */
+	if (fb->modifier != DRM_FORMAT_MOD_LINEAR)
+		return -ENODEV;
+
+	dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
+
+	/* Buffer should be accessible from the CPU */
+	if (dma_obj->base.import_attach)
+		return -ENODEV;
+
+	/* Buffer should be already mapped to CPU */
+	if (!dma_obj->vaddr)
+		return -ENODEV;
+
+	iosys_map_set_vaddr(&sb->map, dma_obj->vaddr);
+	sb->format = fb->format;
+	sb->height = fb->height;
+	sb->width = fb->width;
+	sb->pitch = fb->pitches[0];
+	return 0;
+}
+#else
+int drm_panic_gem_get_scanout_buffer(struct drm_plane *plane,
+				     struct drm_scanout_buffer *sb)
+{
+	return -ENODEV;
+}
+#endif
+EXPORT_SYMBOL(drm_panic_gem_get_scanout_buffer);
diff --git a/include/drm/drm_fb_dma_helper.h b/include/drm/drm_fb_dma_helper.h
index d5e036c57801..61f24c2aba2f 100644
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
 
+int drm_panic_gem_get_scanout_buffer(struct drm_plane *plane,
+				     struct drm_scanout_buffer *sb);
+
 #endif
 
-- 
2.44.0

