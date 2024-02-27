Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C7D868CEA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 11:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977E410F2E0;
	Tue, 27 Feb 2024 10:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PLfHrMuU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E23E10EF1A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 10:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709028339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=muO4scGfp5hzN4LwY9z4VCoP0RmGrXrbkWS1jH3ydoo=;
 b=PLfHrMuUlfQIeaWB7jZxyrz4Fz0iN5cuvCi1z/IPKuWZRNLnUUOpxLkOgvo1E0Yd66NtnI
 EyDgF7Aj0Orq7lGMTfPpd12yjiRyBYU4Eg1buPZEp9kqWZJ4qGNEtpqEmgsU6ltVfAR8b2
 /V6qEd+YxQFQGGODC1eiFVEz4qnFlZ8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-dCSiBWfvMCirrkuQgeBhpw-1; Tue, 27 Feb 2024 05:05:36 -0500
X-MC-Unique: dCSiBWfvMCirrkuQgeBhpw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 996E3185A782;
 Tue, 27 Feb 2024 10:05:35 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1B9135458;
 Tue, 27 Feb 2024 10:05:33 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org
Cc: gpiccoli@igalia.com,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v8 4/8] drm/fb_dma: Add generic set_scanout_buffer() for
 drm_panic
Date: Tue, 27 Feb 2024 11:04:15 +0100
Message-ID: <20240227100459.194478-5-jfalempe@redhat.com>
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

This was initialy done for imx6, but should work on most drivers
using drm_fb_dma_helper.

v8:
 * Replace get_scanout_buffer() logic with drm_panic_set_buffer()
   (Thomas Zimmermann)

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_fb_dma_helper.c | 37 +++++++++++++++++++++++++++++
 include/drm/drm_fb_dma_helper.h     |  4 ++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index 3b535ad1b07c..31ba71644e2b 100644
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
@@ -148,3 +149,39 @@ void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
 	}
 }
 EXPORT_SYMBOL_GPL(drm_fb_dma_sync_non_coherent);
+
+#if defined(CONFIG_DRM_PANIC)
+/**
+ * drm_panic_gem_set_scanout_buffer - helper around drm_panic_set_buffer()
+ *
+ * @plane: primary plane registered to drm_panic
+ * @fb: framebuffer attached to the plane state
+ *
+ * Update plane->panic_scanout with the new framebuffer.
+ */
+void drm_panic_gem_set_scanout_buffer(struct drm_plane *plane,
+				      struct drm_framebuffer *fb)
+{
+	struct drm_gem_dma_object *dma_obj;
+	struct iosys_map map;
+
+	if (!plane->panic_scanout)
+		return;
+
+	if (fb->modifier == DRM_FORMAT_MOD_LINEAR) {
+		dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
+		if (dma_obj && dma_obj->vaddr) {
+			iosys_map_set_vaddr(&map, dma_obj->vaddr);
+			drm_panic_set_buffer(plane->panic_scanout, fb, &map);
+			return;
+		}
+	}
+	drm_panic_unset_buffer(plane->panic_scanout);
+}
+#else
+void drm_panic_gem_set_scanout_buffer(struct drm_plane *plane,
+				      struct drm_framebuffer *fb)
+{
+}
+#endif
+EXPORT_SYMBOL(drm_panic_gem_set_scanout_buffer);
diff --git a/include/drm/drm_fb_dma_helper.h b/include/drm/drm_fb_dma_helper.h
index d5e036c57801..9f9ec11343cd 100644
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
 
+void drm_panic_gem_set_scanout_buffer(struct drm_plane *plane,
+				     struct drm_framebuffer *fb);
+
 #endif
 
-- 
2.43.0

