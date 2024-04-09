Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F05C89E090
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 18:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27388112E03;
	Tue,  9 Apr 2024 16:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="E2o9KXnx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C117F112E19
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 16:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712680560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YEDpwUxC7Ri7HB5W1m/nzHIPqqw5w8wVyN2qm7NWU3w=;
 b=E2o9KXnxSm+m57AD4nXqc4FayEj7baAzk2drGdeKbem9rHG8Zo93SxBucQANHc7eO5lFI5
 v5oi0IcLEnjNh+oVxbBMesc1Q31omTRX78HiEV8FnAtNDc/Tic0E0SQw59xcgq7fhV2TcQ
 jMfVAxC2v376rLN7JBH8BhJghueKZWE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-452-29HL4XPINEyTf0yfOL1Uqw-1; Tue,
 09 Apr 2024 12:35:56 -0400
X-MC-Unique: 29HL4XPINEyTf0yfOL1Uqw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12B761C0C647;
 Tue,  9 Apr 2024 16:35:56 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2835040B497B;
 Tue,  9 Apr 2024 16:35:54 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org,
 sui.jingfeng@linux.dev
Cc: gpiccoli@igalia.com,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v12 9/9] drm/ast: Add drm_panic support
Date: Tue,  9 Apr 2024 18:30:48 +0200
Message-ID: <20240409163432.352518-10-jfalempe@redhat.com>
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

v7
 * Use drm_for_each_primary_visible_plane()

v8:
 * Replace get_scanout_buffer() logic with drm_panic_set_buffer()
   (Thomas Zimmermann)
v9:
 * Revert to using get_scanout_buffer() (Sima)
 * move get_scanout_buffer() to plane helper functions

v12:
 * Use array for map and pitch in struct drm_scanout_buffer
   to support multi-planar format later. (Thomas Zimmermann)

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>
Tested-by: Sui Jingfeng <sui.jingfeng@linux.dev>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index bb9b66aba9ee..417b111d90fa 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -43,6 +43,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
@@ -701,12 +702,29 @@ static void ast_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 	ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x1, 0xdf, 0x20);
 }
 
+static int ast_primary_plane_helper_get_scanout_buffer(struct drm_plane *plane,
+						       struct drm_scanout_buffer *sb)
+{
+	struct ast_plane *ast_plane = to_ast_plane(plane);
+
+	if (plane->state && plane->state->fb && ast_plane->vaddr) {
+		sb->format = plane->state->fb->format;
+		sb->width = plane->state->fb->width;
+		sb->height = plane->state->fb->height;
+		sb->pitch[0] = plane->state->fb->pitches[0];
+		iosys_map_set_vaddr_iomem(&sb->map[0], ast_plane->vaddr);
+		return 0;
+	}
+	return -ENODEV;
+}
+
 static const struct drm_plane_helper_funcs ast_primary_plane_helper_funcs = {
 	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
 	.atomic_check = ast_primary_plane_helper_atomic_check,
 	.atomic_update = ast_primary_plane_helper_atomic_update,
 	.atomic_enable = ast_primary_plane_helper_atomic_enable,
 	.atomic_disable = ast_primary_plane_helper_atomic_disable,
+	.get_scanout_buffer = ast_primary_plane_helper_get_scanout_buffer,
 };
 
 static const struct drm_plane_funcs ast_primary_plane_funcs = {
-- 
2.44.0

