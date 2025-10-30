Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1768BC1F3A0
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 10:16:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAED10E8FF;
	Thu, 30 Oct 2025 09:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GOH4PVPS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D009210E8FF
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 09:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761815803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E03zS2Y7hXOgIIAm99WDrDNWEtg53fgISfyTZXXcoGk=;
 b=GOH4PVPST+IgfFMDDxVm8g4yyyKDRnypgTGYchH0nLQ0vXIEA0rAaOobhVEkUXe7c6NWW7
 73ZekTw2C8Y4B3kY8g2dAnjz50v09xOchbMqRmBOAWE6CVYLs8+kRbddbf35Xw3vLPZVuo
 8Jg4Z2ExWpTLM7ZaH0d7XfX0EEzlblE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-275-jvLGbC1nMi6k5n3aayUlwQ-1; Thu,
 30 Oct 2025 05:16:39 -0400
X-MC-Unique: jvLGbC1nMi6k5n3aayUlwQ-1
X-Mimecast-MFC-AGG-ID: jvLGbC1nMi6k5n3aayUlwQ_1761815798
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 170201801A13; Thu, 30 Oct 2025 09:16:38 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.44.32.119])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 408FF1954128; Thu, 30 Oct 2025 09:16:33 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v2] drm/ast: Handle framebuffer from dma-buf
Date: Thu, 30 Oct 2025 10:14:11 +0100
Message-ID: <20251030091627.340780-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EFPRD_8qWrxUEZqTQWh-qeWphcloYfRo7SyAHimUJl0_1761815798
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

In the atomic update callback, ast should call
drm_gem_fb_begin_cpu_access() to make sure it can read the
framebuffer from the CPU, otherwise the data might not be there due
to cache, and synchronization.

Tested on a Lenovo SE100, while rendering on the ArrowLake GPU with
i915 driver, and using ast for display.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

v2:
 * If begin_cpu_access() failed, skip the damage copy, but update the
   pitch register (Thomas Zimmermann)

 drivers/gpu/drm/ast/ast_mode.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 9ce874dba69c..77d6c2dcfc40 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -556,9 +556,14 @@ static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
 		ast_set_vbios_color_reg(ast, fb->format, ast_crtc_state->vmode);
 	}
 
-	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
-	drm_atomic_for_each_plane_damage(&iter, &damage) {
-		ast_handle_damage(ast_plane, shadow_plane_state->data, fb, &damage);
+	/* if the buffer comes from another device */
+	if (drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE) == 0) {
+		drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
+		drm_atomic_for_each_plane_damage(&iter, &damage) {
+			ast_handle_damage(ast_plane, shadow_plane_state->data, fb, &damage);
+		}
+
+		drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 	}
 
 	/*

base-commit: 4f9ffd2c80a2fa09dcc8dfa0482cb7e0fb6fcf6c
-- 
2.51.0

