Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F2687CFF2
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 16:14:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B621122EA;
	Fri, 15 Mar 2024 15:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="c5PnoInC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6D710F024
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 15:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710515658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h2AkIqJSa4dza4ZAZc+GTuwImI2621s2M23X3TU8uWA=;
 b=c5PnoInCEiAupuAJiY3fW5x0y8l1mzsq3ICbQagX+TDKec7udpOlhnB1r3/1sVIMkV2Tzu
 lUpS1nGOh3dEkUtzgYb99qN6OutETHpuSCEwS0PAOD3GoJlNCJUqm68v+lHZmksebNhyE1
 oGOHdJHd4o50PNuQrGP2Gr+KtTAiqts=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-dEKcAd4TPNKf5yhiK2PCFA-1; Fri, 15 Mar 2024 11:14:12 -0400
X-MC-Unique: dEKcAd4TPNKf5yhiK2PCFA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F215857F42;
 Fri, 15 Mar 2024 15:14:11 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B53F4492BCB;
 Fri, 15 Mar 2024 15:14:09 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org,
 sui.jingfeng@linux.dev
Cc: gpiccoli@igalia.com,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v10 9/9] drm/ast: Add drm_panic support
Date: Fri, 15 Mar 2024 16:11:01 +0100
Message-ID: <20240315151317.857684-10-jfalempe@redhat.com>
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
2.44.0

