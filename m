Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317F4874AA4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 10:20:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806B8112231;
	Thu,  7 Mar 2024 09:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IjCJ/RPu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29AB51129E6
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 09:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709803211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=077ianc6Gc9hapDkuur+B4yAhaXRAd7mZi+bghuU2ZQ=;
 b=IjCJ/RPue1MGHSL3cZdiqCFERdorG76fkIL8VLRbXPDB07s5Wv50C0BNWRnoT9u8GI7tFm
 0U9YiNSeoyUnhHQWcueFHe8KsF2pKFz9Kbbgi59DU9C9DgQj7eHpqK6s0WcbWo9ijMmDRp
 UM+NPJcIRGMyrrA6qeAlHQ3pISh/k5w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-Nv7gL__kMQWqoUPWxOAF9w-1; Thu, 07 Mar 2024 04:20:04 -0500
X-MC-Unique: Nv7gL__kMQWqoUPWxOAF9w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70E9A8007B5;
 Thu,  7 Mar 2024 09:20:04 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5693C111DCF3;
 Thu,  7 Mar 2024 09:20:02 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org
Cc: gpiccoli@igalia.com,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v9 9/9] drm/ast: Add drm_panic support
Date: Thu,  7 Mar 2024 10:14:51 +0100
Message-ID: <20240307091936.576689-10-jfalempe@redhat.com>
In-Reply-To: <20240307091936.576689-1-jfalempe@redhat.com>
References: <20240307091936.576689-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index a718646a66b8..49f2d8bd3377 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -43,6 +43,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
@@ -700,12 +701,29 @@ static void ast_primary_plane_helper_atomic_disable(struct drm_plane *plane,
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
+		sb->pitch = plane->state->fb->pitches[0];
+		iosys_map_set_vaddr_iomem(&sb->map, ast_plane->vaddr);
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
2.43.2

