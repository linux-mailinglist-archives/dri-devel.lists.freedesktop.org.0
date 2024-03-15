Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8957587CFEE
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 16:14:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA63310F17F;
	Fri, 15 Mar 2024 15:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="W2B8YNcX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77AEB10FC70
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 15:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710515651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ll0ouAtnV6fyPKcpItxmW030i3zwXf6N1HpZ6UZRYMU=;
 b=W2B8YNcX/oCm2j3fCZgSySG1s0DIgziGjSSlOaiBLxT6qzZimdJGlD/S5biTwV39MHS8Pv
 UccNfTJkEhLl5avkyb/D2E8xXo0e6dnoUHuF6+OrkHmFI9jRjzTCtZ1wKhT9Rv+sY42j5Y
 02rcL7+UMPelcjuWKGnwSTgBdz1aLUU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-FY_r5PcmNua13ssDpbfzAw-1; Fri, 15 Mar 2024 11:14:08 -0400
X-MC-Unique: FY_r5PcmNua13ssDpbfzAw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EF00822487;
 Fri, 15 Mar 2024 15:14:07 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 784F5492BCC;
 Fri, 15 Mar 2024 15:14:05 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org,
 sui.jingfeng@linux.dev
Cc: gpiccoli@igalia.com,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v10 7/9] drm/mgag200: Add drm_panic support
Date: Fri, 15 Mar 2024 16:10:59 +0100
Message-ID: <20240315151317.857684-8-jfalempe@redhat.com>
In-Reply-To: <20240315151317.857684-1-jfalempe@redhat.com>
References: <20240315151317.857684-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
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
index e17cb4c5f774..8f368ecca4d4 100644
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
+		sb->pitch = plane->state->fb->pitches[0];
+		sb->map = map;
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

