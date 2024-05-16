Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 507A78C7A2A
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 18:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DB010E087;
	Thu, 16 May 2024 16:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Y4AzaKpn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF09010E087
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 16:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715876286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZARuOVBy+1gkd+XLbAScbxrDyGICq7f+A001UtadVJY=;
 b=Y4AzaKpnde0J9D74v21KB/cZc1rrIOAIaF7T1oilRY7d12hya/OEsL/G1RE8fPj4X04oFy
 UC4aOhiy8n+qkq+8VA5pRCaF4dkGtmPa2LRvpxVHsl1oPPGIsNBU5vVtl8borBKREDUfsC
 TOZV5WjFEXHqUzjYk3A1vvoi+VOOgx8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-523-GNh4uqFrO66vEWgqrn8_xw-1; Thu,
 16 May 2024 12:18:00 -0400
X-MC-Unique: GNh4uqFrO66vEWgqrn8_xw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FFE13800090;
 Thu, 16 May 2024 16:18:00 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23510C15BB1;
 Thu, 16 May 2024 16:17:59 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH 1/2] Revert "drm/mgag200: Add a workaround for low-latency"
Date: Thu, 16 May 2024 18:17:09 +0200
Message-ID: <20240516161751.479558-2-jfalempe@redhat.com>
In-Reply-To: <20240516161751.479558-1-jfalempe@redhat.com>
References: <20240516161751.479558-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
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

This reverts commit bfa4437fd3938ae2e186e7664b2db65bb8775670.

This workaround doesn't work reliably on all servers.
I'll replace it with an option to disable Write-Combine,
which has more impact on performance, but fix the latency
issue on all hardware.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/Kconfig        | 12 ------------
 drivers/gpu/drm/mgag200/mgag200_drv.c  | 17 -----------------
 drivers/gpu/drm/mgag200/mgag200_mode.c |  8 --------
 3 files changed, 37 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/Kconfig b/drivers/gpu/drm/mgag200/Kconfig
index 5e4d48df4854c..b28c5e4828f47 100644
--- a/drivers/gpu/drm/mgag200/Kconfig
+++ b/drivers/gpu/drm/mgag200/Kconfig
@@ -11,15 +11,3 @@ config DRM_MGAG200
 	 MGA G200 desktop chips and the server variants. It requires 0.3.0
 	 of the modesetting userspace driver, and a version of mga driver
 	 that will fail on KMS enabled devices.
-
-config DRM_MGAG200_IOBURST_WORKAROUND
-	bool "Disable buffer caching"
-	depends on DRM_MGAG200 && PREEMPT_RT && X86
-	help
-	  Enable a workaround to avoid I/O bursts within the mgag200 driver at
-	  the expense of overall display performance.
-	  It restores the <v5.10 behavior, by mapping the framebuffer in system
-	  RAM as Write-Combining, and flushing the cache after each write.
-	  This is only useful on x86_64 if you want to run processes with
-	  deterministic latency.
-	  If unsure, say N.
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 65f2ed18b31c5..3883f25ca4d8b 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -84,20 +84,6 @@ resource_size_t mgag200_probe_vram(void __iomem *mem, resource_size_t size)
 	return offset - 65536;
 }
 
-#if defined(CONFIG_DRM_MGAG200_IOBURST_WORKAROUND)
-static struct drm_gem_object *mgag200_create_object(struct drm_device *dev, size_t size)
-{
-	struct drm_gem_shmem_object *shmem;
-
-	shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
-	if (!shmem)
-		return NULL;
-
-	shmem->map_wc = true;
-	return &shmem->base;
-}
-#endif
-
 /*
  * DRM driver
  */
@@ -113,9 +99,6 @@ static const struct drm_driver mgag200_driver = {
 	.major = DRIVER_MAJOR,
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
-#if defined(CONFIG_DRM_MGAG200_IOBURST_WORKAROUND)
-	.gem_create_object = mgag200_create_object,
-#endif
 	DRM_GEM_SHMEM_DRIVER_OPS,
 };
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index fc54851d3384d..d3d820f7a77d7 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -13,7 +13,6 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_cache.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_format_helper.h>
@@ -438,13 +437,6 @@ static void mgag200_handle_damage(struct mga_device *mdev, const struct iosys_ma
 
 	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
 	drm_fb_memcpy(&dst, fb->pitches, vmap, fb, clip);
-
-	/* Flushing the cache greatly improves latency on x86_64 */
-#if defined(CONFIG_DRM_MGAG200_IOBURST_WORKAROUND)
-	if (!vmap->is_iomem)
-		drm_clflush_virt_range(vmap->vaddr + clip->y1 * fb->pitches[0],
-				       drm_rect_height(clip) * fb->pitches[0]);
-#endif
 }
 
 /*
-- 
2.45.0

