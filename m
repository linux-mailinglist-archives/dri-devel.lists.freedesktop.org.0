Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C76804EB9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 10:52:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760BF10E4B7;
	Tue,  5 Dec 2023 09:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758F810E4C3
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 09:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701769932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I9vVLOtOaghc21f2rqDPtW7+MNCTMp6FcDCeWCzQJro=;
 b=cQ5AHZHTgOt3h2VhU0zYEv62zMCJGKS3GL4XTvO2XSCBhzrjDbuFlu+cogfcuCCOM/ECSM
 0shjVHt1wgtzUzI7tJBPgVMOBlZP86u0UR9/Rlc5FilBO/TwPJt+LJRAU8URQZ3tQ721Nk
 mG5ca6JkARo9EfyFJe+iXDf/h1mRzD8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-DGtoeGqdMr2hmExgMyFwfg-1; Tue, 05 Dec 2023 04:52:10 -0500
X-MC-Unique: DGtoeGqdMr2hmExgMyFwfg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0541D8DA707;
 Tue,  5 Dec 2023 09:52:10 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.195.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 685D0492BC6;
 Tue,  5 Dec 2023 09:52:08 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org
Subject: [PATCH v6 5/5] drm/ast: Add drm_panic support
Date: Tue,  5 Dec 2023 10:48:27 +0100
Message-ID: <20231205095051.269841-6-jfalempe@redhat.com>
In-Reply-To: <20231205095051.269841-1-jfalempe@redhat.com>
References: <20231205095051.269841-1-jfalempe@redhat.com>
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
Cc: gpiccoli@igalia.com, Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the drm_panic module, which displays a message to
the screen when a kernel panic occurs.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_drv.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 90bcb1eb9cd9..bb49e89dbd3c 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -35,6 +35,7 @@
 #include <drm/drm_fbdev_generic.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_module.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_probe_helper.h>
 
 #include "ast_drv.h"
@@ -48,6 +49,30 @@ module_param_named(modeset, ast_modeset, int, 0400);
  * DRM driver
  */
 
+static int ast_get_scanout_buffer(struct drm_device *dev,
+				  struct drm_scanout_buffer *sb)
+{
+	struct drm_plane *plane;
+	struct ast_plane *ast_plane;
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
+
 DEFINE_DRM_GEM_FOPS(ast_fops);
 
 static const struct drm_driver ast_driver = {
@@ -62,8 +87,8 @@ static const struct drm_driver ast_driver = {
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
2.42.0

