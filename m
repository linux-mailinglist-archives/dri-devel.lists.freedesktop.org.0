Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9E089E08E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 18:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252C1112DF9;
	Tue,  9 Apr 2024 16:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WpQXgtLW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60469112E03
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 16:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712680554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ldla56ZVVIIr7mDKApJCHifP3sFAqckOoV4eTVADU1Y=;
 b=WpQXgtLWAD1TFzyyE7K/ozw42Cb1UzjQepKTvOPPEwVfL7Wz2IHm0bfYkDrlzd8QASrLU8
 55vZNBukcrrCSNgvQkyLtd0F/19zl/WurcRZisle1d+sy7oSIDnPYdTm98YZzTOGQuicBq
 /BydvR3RyBb80BB1/oKDl5QaG3gJVNU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-694-6s9S-auPPlCqf8S1cptt0Q-1; Tue,
 09 Apr 2024 12:35:51 -0400
X-MC-Unique: 6s9S-auPPlCqf8S1cptt0Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD83B29AA3AF;
 Tue,  9 Apr 2024 16:35:50 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D174940B497A;
 Tue,  9 Apr 2024 16:35:48 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org,
 sui.jingfeng@linux.dev
Cc: gpiccoli@igalia.com,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v12 7/9] drm/mgag200: Add drm_panic support
Date: Tue,  9 Apr 2024 18:30:46 +0200
Message-ID: <20240409163432.352518-8-jfalempe@redhat.com>
In-Reply-To: <20240409163432.352518-1-jfalempe@redhat.com>
References: <20240409163432.352518-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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

Add support for the drm_panic module, which displays a message to
the screen when a kernel panic occurs.

v5:
 * Also check that the plane is visible and primary. (Thomas Zimmermann)

v7:
 * use drm_for_each_primary_visible_plane()

v8:
 * Replace get_scanout_buffer() logic with drm_panic_set_buffer()
   (Thomas Zimmermann)

v9:
 * Revert to using get_scanout_buffer() (Sima)
 * move get_scanout_buffer() to plane helper functions (Thomas Zimmermann)

v12:
 * Use array for map and pitch in struct drm_scanout_buffer
   to support multi-planar format later. (Thomas Zimmermann)

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  7 ++++++-
 drivers/gpu/drm/mgag200/mgag200_mode.c | 18 ++++++++++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 765e49fd8911..58a0e62eaf18 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -366,6 +366,7 @@ struct drm_crtc_state;
 struct drm_display_mode;
 struct drm_plane;
 struct drm_atomic_state;
+struct drm_scanout_buffer;
 
 extern const uint32_t mgag200_primary_plane_formats[];
 extern const size_t   mgag200_primary_plane_formats_size;
@@ -379,12 +380,16 @@ void mgag200_primary_plane_helper_atomic_enable(struct drm_plane *plane,
 						struct drm_atomic_state *state);
 void mgag200_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 						 struct drm_atomic_state *old_state);
+int mgag200_primary_plane_helper_get_scanout_buffer(struct drm_plane *plane,
+						    struct drm_scanout_buffer *sb);
+
 #define MGAG200_PRIMARY_PLANE_HELPER_FUNCS \
 	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS, \
 	.atomic_check = mgag200_primary_plane_helper_atomic_check, \
 	.atomic_update = mgag200_primary_plane_helper_atomic_update, \
 	.atomic_enable = mgag200_primary_plane_helper_atomic_enable, \
-	.atomic_disable = mgag200_primary_plane_helper_atomic_disable
+	.atomic_disable = mgag200_primary_plane_helper_atomic_disable, \
+	.get_scanout_buffer = mgag200_primary_plane_helper_get_scanout_buffer
 
 #define MGAG200_PRIMARY_PLANE_FUNCS \
 	.update_plane = drm_atomic_helper_update_plane, \
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index e17cb4c5f774..fc54851d3384 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -21,6 +21,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_print.h>
 
 #include "mgag200_drv.h"
@@ -546,6 +547,23 @@ void mgag200_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 	msleep(20);
 }
 
+int mgag200_primary_plane_helper_get_scanout_buffer(struct drm_plane *plane,
+						    struct drm_scanout_buffer *sb)
+{
+	struct mga_device *mdev = to_mga_device(plane->dev);
+	struct iosys_map map = IOSYS_MAP_INIT_VADDR_IOMEM(mdev->vram);
+
+	if (plane->state && plane->state->fb) {
+		sb->format = plane->state->fb->format;
+		sb->width = plane->state->fb->width;
+		sb->height = plane->state->fb->height;
+		sb->pitch[0] = plane->state->fb->pitches[0];
+		sb->map[0] = map;
+		return 0;
+	}
+	return -ENODEV;
+}
+
 /*
  * CRTC
  */
-- 
2.44.0

