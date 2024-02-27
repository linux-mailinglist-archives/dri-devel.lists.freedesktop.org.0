Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB02868CE6
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 11:05:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FB710EF82;
	Tue, 27 Feb 2024 10:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Nb4saYYE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5580C10EF82
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 10:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709028341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BGmInmkpaINNZImX1xrie8a4GJNsGm8oIzZpKGG6zfk=;
 b=Nb4saYYEhHKGW0ZDX6ImQ2yY4/PRSxflXM6aJ6ii2w7gnvuOXmhb3hiJPoIDAKAwuXbjAd
 6dU1lHLj9Qx6UaX+qP2l/z2UAePD6Rv+mWVzdmT1aX0UFQ8CzriWmQnTXt1NB6ed6RX4Un
 pvEPL2fBKsvsML2Mt4oOGHHTf7kuczA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-556-0GpbotQDMIOOYIG-xhsp3A-1; Tue,
 27 Feb 2024 05:05:40 -0500
X-MC-Unique: 0GpbotQDMIOOYIG-xhsp3A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 980041C06905;
 Tue, 27 Feb 2024 10:05:39 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE27F35458;
 Tue, 27 Feb 2024 10:05:37 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org
Cc: gpiccoli@igalia.com,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v8 6/8] drm/mgag200: Add drm_panic support
Date: Tue, 27 Feb 2024 11:04:17 +0100
Message-ID: <20240227100459.194478-7-jfalempe@redhat.com>
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

Add support for the drm_panic module, which displays a message to
the screen when a kernel panic occurs.

v5:
 * Also check that the plane is visible and primary. (Thomas Zimmermann)

v7:
 * use drm_for_each_primary_visible_plane()

v8:
 * Replace get_scanout_buffer() logic with drm_panic_set_buffer()
   (Thomas Zimmermann)

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_g200.c    | 2 ++
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  | 2 ++
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c | 2 ++
 drivers/gpu/drm/mgag200/mgag200_g200er.c  | 2 ++
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  | 2 ++
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c | 2 ++
 drivers/gpu/drm/mgag200/mgag200_g200se.c  | 2 ++
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  | 2 ++
 drivers/gpu/drm/mgag200/mgag200_mode.c    | 7 +++++++
 9 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_g200.c b/drivers/gpu/drm/mgag200/mgag200_g200.c
index bf5d7fe525a3..1af71785733a 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200.c
@@ -7,6 +7,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
@@ -217,6 +218,7 @@ static int mgag200_g200_pipeline_init(struct mga_device *mdev)
 	}
 	drm_plane_helper_add(primary_plane, &mgag200_g200_primary_plane_helper_funcs);
 	drm_plane_enable_fb_damage_clips(primary_plane);
+	drm_panic_register(primary_plane);
 
 	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
 					&mgag200_g200_crtc_funcs, NULL);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
index fad62453a91d..759cff8480f7 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
@@ -7,6 +7,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
@@ -216,6 +217,7 @@ static int mgag200_g200eh_pipeline_init(struct mga_device *mdev)
 	}
 	drm_plane_helper_add(primary_plane, &mgag200_g200eh_primary_plane_helper_funcs);
 	drm_plane_enable_fb_damage_clips(primary_plane);
+	drm_panic_register(primary_plane);
 
 	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
 					&mgag200_g200eh_crtc_funcs, NULL);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
index 0f7d8112cd49..753b3292a384 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
@@ -6,6 +6,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
@@ -120,6 +121,7 @@ static int mgag200_g200eh3_pipeline_init(struct mga_device *mdev)
 	}
 	drm_plane_helper_add(primary_plane, &mgag200_g200eh3_primary_plane_helper_funcs);
 	drm_plane_enable_fb_damage_clips(primary_plane);
+	drm_panic_register(primary_plane);
 
 	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
 					&mgag200_g200eh3_crtc_funcs, NULL);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index 8d4538b71047..3dd6120bf9bb 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -7,6 +7,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
@@ -259,6 +260,7 @@ static int mgag200_g200er_pipeline_init(struct mga_device *mdev)
 	}
 	drm_plane_helper_add(primary_plane, &mgag200_g200er_primary_plane_helper_funcs);
 	drm_plane_enable_fb_damage_clips(primary_plane);
+	drm_panic_register(primary_plane);
 
 	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
 					&mgag200_g200er_crtc_funcs, NULL);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index 56e6f986bff3..28476a93c9ba 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -7,6 +7,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
@@ -260,6 +261,7 @@ static int mgag200_g200ev_pipeline_init(struct mga_device *mdev)
 	}
 	drm_plane_helper_add(primary_plane, &mgag200_g200ev_primary_plane_helper_funcs);
 	drm_plane_enable_fb_damage_clips(primary_plane);
+	drm_panic_register(primary_plane);
 
 	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
 					&mgag200_g200ev_crtc_funcs, NULL);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
index 170934414d7d..f7c17bc52afc 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
@@ -6,6 +6,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
@@ -129,6 +130,7 @@ static int mgag200_g200ew3_pipeline_init(struct mga_device *mdev)
 	}
 	drm_plane_helper_add(primary_plane, &mgag200_g200ew3_primary_plane_helper_funcs);
 	drm_plane_enable_fb_damage_clips(primary_plane);
+	drm_panic_register(primary_plane);
 
 	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
 					&mgag200_g200ew3_crtc_funcs, NULL);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index ff2b3c6622e7..3ca1f5c1ca30 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -7,6 +7,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
@@ -391,6 +392,7 @@ static int mgag200_g200se_pipeline_init(struct mga_device *mdev)
 	}
 	drm_plane_helper_add(primary_plane, &mgag200_g200se_primary_plane_helper_funcs);
 	drm_plane_enable_fb_damage_clips(primary_plane);
+	drm_panic_register(primary_plane);
 
 	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
 					&mgag200_g200se_crtc_funcs, NULL);
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index 9baa727ac6f9..7d735f6b1fc7 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -7,6 +7,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
@@ -263,6 +264,7 @@ static int mgag200_g200wb_pipeline_init(struct mga_device *mdev)
 	}
 	drm_plane_helper_add(primary_plane, &mgag200_g200wb_primary_plane_helper_funcs);
 	drm_plane_enable_fb_damage_clips(primary_plane);
+	drm_panic_register(primary_plane);
 
 	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
 					&mgag200_g200wb_crtc_funcs, NULL);
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index e17cb4c5f774..73e548143983 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -21,6 +21,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_print.h>
 
 #include "mgag200_drv.h"
@@ -510,6 +511,12 @@ void mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_rect damage;
 
+	if (old_plane_state->fb != plane_state->fb) {
+		struct iosys_map map = IOSYS_MAP_INIT_VADDR_IOMEM(mdev->vram);
+
+		drm_panic_set_buffer(plane->panic_scanout, plane->state->fb, &map);
+	}
+
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
 		mgag200_handle_damage(mdev, shadow_plane_state->data, fb, &damage);
-- 
2.43.0

