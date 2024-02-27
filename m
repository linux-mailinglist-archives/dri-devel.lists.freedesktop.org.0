Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ADF868CE8
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 11:06:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD7010F2D5;
	Tue, 27 Feb 2024 10:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Pxebyuyg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A04B10F2CD
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 10:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709028348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FgZ4XMRKqEoBvch7muKogk7aZ5cshe+lV0i9UU8j50U=;
 b=PxebyuygXIaBp0IoAbB+dUzHi3tLmYISEVrpSJPXHsnVQC8Ku0bowmsGg3hxKg19QZe238
 wcU7kiGFh9zfjQ3xaAOTaUJDf7jzethwIPc0xjHJKTqULCd6+xppb5pTVguJ0uIei7v+b3
 q4XerPUEDEFf30SfhsDCpgqQd1J52nQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-116-s8WNrcPHPE-yUnQNaZMO-Q-1; Tue,
 27 Feb 2024 05:05:45 -0500
X-MC-Unique: s8WNrcPHPE-yUnQNaZMO-Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99A1E1C0690B;
 Tue, 27 Feb 2024 10:05:44 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D223E39CAC;
 Tue, 27 Feb 2024 10:05:42 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org
Cc: gpiccoli@igalia.com,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v8 8/8] drm/ast: Add drm_panic support
Date: Tue, 27 Feb 2024 11:04:19 +0100
Message-ID: <20240227100459.194478-9-jfalempe@redhat.com>
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

v7
 * Use drm_for_each_primary_visible_plane()

v8:
 * Replace get_scanout_buffer() logic with drm_panic_set_buffer()
   (Thomas Zimmermann)

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index a718646a66b8..3d6d4c71bc34 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -43,6 +43,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
@@ -656,9 +657,13 @@ static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
 		struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 		struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
 		struct ast_vbios_mode_info *vbios_mode_info = &ast_crtc_state->vbios_mode_info;
+		struct iosys_map map;
 
 		ast_set_color_reg(ast, fb->format);
 		ast_set_vbios_color_reg(ast, fb->format, vbios_mode_info);
+
+		iosys_map_set_vaddr_iomem(&map, ast_plane->vaddr);
+		drm_panic_set_buffer(plane->panic_scanout, fb, &map);
 	}
 
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
@@ -736,6 +741,7 @@ static int ast_primary_plane_init(struct ast_device *ast)
 	}
 	drm_plane_helper_add(primary_plane, &ast_primary_plane_helper_funcs);
 	drm_plane_enable_fb_damage_clips(primary_plane);
+	drm_panic_register(primary_plane);
 
 	return 0;
 }
-- 
2.43.0

