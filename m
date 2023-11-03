Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 500257E0515
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 15:56:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC70D10EA0C;
	Fri,  3 Nov 2023 14:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F9810EA0C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 14:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699023360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G2QnNsxEkElG0Bq93Wf9KQJuQw5qgAG9tVgEl+maCuI=;
 b=QRxx2jyqCal+JZpjaeVJIR48zoV4fR5fRROoyMFHh/S+JbjdFqcvS3tXJsIEVEu09beyR8
 JVR2VbQVUg2gzaLS5fw7/nwrgwVEi/u6op3vOjZSElyZ3tvNL6Hb55eCm5cBj1Kf36V2Tm
 n1By2TEJhu+FsII15aB74JbEPXfTqQ0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-GvOOByQBMJ2RwfJgod4-cA-1; Fri, 03 Nov 2023 10:55:54 -0400
X-MC-Unique: GvOOByQBMJ2RwfJgod4-cA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CFE88370E1;
 Fri,  3 Nov 2023 14:55:54 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEB351C060BA;
 Fri,  3 Nov 2023 14:55:51 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org
Subject: [PATCH v5 5/6] drm/ast: Add drm_panic support
Date: Fri,  3 Nov 2023 15:53:29 +0100
Message-ID: <20231103145526.628138-6-jfalempe@redhat.com>
In-Reply-To: <20231103145526.628138-1-jfalempe@redhat.com>
References: <20231103145526.628138-1-jfalempe@redhat.com>
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

Add support for the drm_panic module, which displays a message to
the screen when a kernel panic occurs.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_drv.c  |  4 ++--
 drivers/gpu/drm/ast/ast_drv.h  |  3 +++
 drivers/gpu/drm/ast/ast_mode.c | 26 ++++++++++++++++++++++++++
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index e1224ef4ad83..da60d2e237f5 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -62,8 +62,8 @@ static const struct drm_driver ast_driver = {
 	.major = DRIVER_MAJOR,
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
-
-	DRM_GEM_SHMEM_DRIVER_OPS
+	.get_scanout_buffer = ast_get_scanout_buffer,
+	DRM_GEM_SHMEM_DRIVER_OPS,
 };
 
 /*
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 848a9f1403e8..b9c62d18e14e 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -504,6 +504,9 @@ int ast_mode_config_init(struct ast_device *ast);
 #define ASTDP_1366x768_60		0x1E
 #define ASTDP_1152x864_75		0x1F
 
+int ast_get_scanout_buffer(struct drm_device *dev,
+			   struct drm_scanout_buffer *sb);
+
 int ast_mm_init(struct ast_device *ast);
 
 /* ast post */
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 32f04ec6c386..3653e65a135b 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -43,6 +43,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
@@ -1930,3 +1931,28 @@ int ast_mode_config_init(struct ast_device *ast)
 
 	return 0;
 }
+
+int ast_get_scanout_buffer(struct drm_device *dev,
+			   struct drm_scanout_buffer *sb)
+{
+	struct drm_plane *plane;
+	struct ast_plane *ast_plane;
+	struct iosys_map map;
+
+	drm_for_each_plane(plane, dev) {
+		if (!plane->state || !plane->state->visible || !plane->state->fb ||
+		    plane->type != DRM_PLANE_TYPE_PRIMARY)
+			continue;
+		ast_plane = to_ast_plane(plane);
+		if (!ast_plane->vaddr)
+			continue;
+
+		sb->format = plane->state->fb->format;
+		sb->width = plane->state->fb->width;
+		sb->height = plane->state->fb->height;
+		sb->pitch = plane->state->fb->pitches[0];
+		iosys_map_set_vaddr_iomem(&sb->map, ast_plane->vaddr);
+		return 0;
+	}
+	return -ENODEV;
+}
-- 
2.41.0

