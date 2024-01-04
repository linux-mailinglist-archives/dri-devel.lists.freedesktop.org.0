Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 763C78245B6
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 17:04:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2D410E4EF;
	Thu,  4 Jan 2024 16:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B3B10E502
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 16:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704384258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I76pqkOj+NHPBAtxfe7ZMwDVuCInuo/jdEnWexcixeU=;
 b=Il/Tprj2HRJhZx32l0aJoncpDuZkOsKO6hkiFhZM2ZIVXg24nCWuYQCq982V6OcNAD7fqp
 WMBGbEvRBYWbWjawulADdP75fYFZ7NNGV2M3PM6FQXWn0cD3VVOP0kN4zM9NIDulqUYyHU
 q+t2uSIpc3CqvoxsA+LA2umGQMgSUMY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-125-Qhowc9xUOyKvJSPNf0WG5g-1; Thu,
 04 Jan 2024 11:04:14 -0500
X-MC-Unique: Qhowc9xUOyKvJSPNf0WG5g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48DA13C1E9D0;
 Thu,  4 Jan 2024 16:04:14 +0000 (UTC)
Received: from hydra.bos2.lab (unknown [10.39.193.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8BCF1C060AF;
 Thu,  4 Jan 2024 16:04:12 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org
Subject: [PATCH v7 8/9] drm/ast: Add drm_panic support
Date: Thu,  4 Jan 2024 17:00:52 +0100
Message-ID: <20240104160301.185915-9-jfalempe@redhat.com>
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

Add support for the drm_panic module, which displays a message to
the screen when a kernel panic occurs.

v7
 * Use drm_for_each_primary_visible_plane()

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_drv.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 90bcb1eb9cd9..8ddce3d7fda9 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -35,6 +35,7 @@
 #include <drm/drm_fbdev_generic.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_module.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_probe_helper.h>
 
 #include "ast_drv.h"
@@ -48,6 +49,27 @@ module_param_named(modeset, ast_modeset, int, 0400);
  * DRM driver
  */
 
+static int ast_get_scanout_buffer(struct drm_device *dev,
+				  struct drm_scanout_buffer *sb)
+{
+	struct drm_plane *plane;
+	struct ast_plane *ast_plane;
+
+	drm_for_each_primary_visible_plane(plane, dev) {
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
+
 DEFINE_DRM_GEM_FOPS(ast_fops);
 
 static const struct drm_driver ast_driver = {
@@ -62,8 +84,8 @@ static const struct drm_driver ast_driver = {
 	.major = DRIVER_MAJOR,
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
-
-	DRM_GEM_SHMEM_DRIVER_OPS
+	.get_scanout_buffer = ast_get_scanout_buffer,
+	DRM_GEM_SHMEM_DRIVER_OPS,
 };
 
 /*
-- 
2.43.0

