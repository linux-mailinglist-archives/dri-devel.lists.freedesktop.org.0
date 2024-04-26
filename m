Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 091E58B36F4
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 14:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB2C11231B;
	Fri, 26 Apr 2024 12:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PVehXAwt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696F411231B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 12:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714133491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M24GlleA0SCcE1bUbm4exGP2ZsGgoKPEivzfqvGHj74=;
 b=PVehXAwt99Uyo4zqi8G9CmR5W6sHfg1hUuEJsl3jhlJwoNHdgL8eSvTosYHje7blA/PrJ6
 efGJjzK5N70LIujV2ETYbF5ivT8EuIXLglYEKyCT39m5+UK52blmwd6VKOCtoWDRblaFHc
 KTe3dIiNXEL2j/F6lMViFVO+MMpJi9E=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-153-zzCZgsQRML2R4P_sUWrn1Q-1; Fri,
 26 Apr 2024 08:11:27 -0400
X-MC-Unique: zzCZgsQRML2R4P_sUWrn1Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D18728EC10D;
 Fri, 26 Apr 2024 12:11:27 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFCB240C122D;
 Fri, 26 Apr 2024 12:11:25 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH] drm/fb_dma: Add checks in drm_fb_dma_get_scanout_buffer()
Date: Fri, 26 Apr 2024 14:10:50 +0200
Message-ID: <20240426121121.241366-1-jfalempe@redhat.com>
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

plane->state and plane->state->fb can be NULL, so add a check before
dereferencing them.
Found by testing with the imx driver.

Fixes: 879b3b6511fe9 ("drm/fb_dma: Add generic get_scanout_buffer() for drm_panic")
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_fb_dma_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index 96e5ab960f12..d7bffde94cc5 100644
--- a/drivers/gpu/drm/drm_fb_dma_helper.c
+++ b/drivers/gpu/drm/drm_fb_dma_helper.c
@@ -167,6 +167,9 @@ int drm_fb_dma_get_scanout_buffer(struct drm_plane *plane,
 	struct drm_gem_dma_object *dma_obj;
 	struct drm_framebuffer *fb;
 
+	if (!plane->state || !plane->state->fb)
+		return -ENODEV;
+
 	fb = plane->state->fb;
 	/* Only support linear modifier */
 	if (fb->modifier != DRM_FORMAT_MOD_LINEAR)

base-commit: 2e3f08a1ac99cb9a19a5cb151593d4f9df5cc6a7
-- 
2.44.0

