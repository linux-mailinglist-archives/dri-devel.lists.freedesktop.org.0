Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE44DC15348
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 15:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DAAF10E105;
	Tue, 28 Oct 2025 14:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gmxGinpP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F422A10E105
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 14:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761662572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jINzY1eKMTsEzpanBU/3SeBVOq8kVs8ymSHoAbLxP9o=;
 b=gmxGinpP3kZk3WfjuI6x4XIP3Of5ptLbgIkafviMiTZZas1RvEKZDTrpXWIHGhjTwumjnI
 i8Kh7Ns0vSXLn1IBicZw8ETc0L9q9cOqkkActlhDaqs1vyVanAaQZdS1ZBO9flz0BEO7fI
 nm0Z1IHD9UNgbwVKPXpewmn1l3LISs8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-401-w8_R1vuNN-iYQbkZltCmqg-1; Tue,
 28 Oct 2025 10:42:47 -0400
X-MC-Unique: w8_R1vuNN-iYQbkZltCmqg-1
X-Mimecast-MFC-AGG-ID: w8_R1vuNN-iYQbkZltCmqg_1761662566
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DB9DE19560AF; Tue, 28 Oct 2025 14:42:45 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.44.32.119])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4FBD419560AD; Tue, 28 Oct 2025 14:42:43 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH] drm/ast: Handle framebuffer from dma-buf
Date: Tue, 28 Oct 2025 15:42:06 +0100
Message-ID: <20251028144226.171593-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 59euS-J_LFGeSju8HQcYrW38MKqBoHl_fTMU7uoRNCA_1761662566
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
 drivers/gpu/drm/ast/ast_mode.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 9ce874dba69c..68da4544d92d 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -556,11 +556,17 @@ static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
 		ast_set_vbios_color_reg(ast, fb->format, ast_crtc_state->vmode);
 	}
 
+	/* if the buffer comes from another device */
+	if (!drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE))
+		return;
+
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
 		ast_handle_damage(ast_plane, shadow_plane_state->data, fb, &damage);
 	}
 
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+
 	/*
 	 * Some BMCs stop scanning out the video signal after the driver
 	 * reprogrammed the offset. This stalls display output for several

base-commit: 4f9ffd2c80a2fa09dcc8dfa0482cb7e0fb6fcf6c
-- 
2.51.0

