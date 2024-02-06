Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFA184BFF1
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 23:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 347B7112EDE;
	Tue,  6 Feb 2024 22:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ac9Ueyf/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58472112EDF
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 22:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707258133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WqEhj17JG5O0lz/abOgvRVfEOlIkJKfQzOcyuZ3wckM=;
 b=ac9Ueyf/HiTClyZAnV/1OkCGwGrZ2P26X8tHE/e4g9re1jIbJI/qz5UKNzC50ptVpMWCQk
 bRjs18xv/KREzKiFraQTQQC3dkXeE+nA7pVm0WUIce4OEGxK3fAtn1v7G3kmUIwtViuMTO
 LS4eNM7giBML7G5tzmLFeoPw/QR7fyI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-SfRxDkSkN42EW6u7vBka9w-1; Tue, 06 Feb 2024 17:22:10 -0500
X-MC-Unique: SfRxDkSkN42EW6u7vBka9w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5920101FA34;
 Tue,  6 Feb 2024 22:22:09 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D542C2166B33;
 Tue,  6 Feb 2024 22:22:08 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, airlied@redhat.com, tzimmermann@suse.de,
 daniel@ffwll.ch
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH] drm/mgag200: Add a workaround for low-latency
Date: Tue,  6 Feb 2024 23:21:26 +0100
Message-ID: <20240206222203.347626-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
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

We found a regression in v5.10 on real-time server, using the
rt-kernel and the mgag200 driver. It's some really specialized
workload, with <10us latency expectation on isolated core.
After the v5.10, the real time tasks missed their <10us latency
when something prints on the screen (fbcon or printk)

The regression has been bisected to 2 commits:
commit 0b34d58b6c32 ("drm/mgag200: Enable caching for SHMEM pages")
commit 4862ffaec523 ("drm/mgag200: Move vmap out of commit tail")

The first one changed the system memory framebuffer from Write-Combine
to the default caching.
Before the second commit, the mgag200 driver used to unmap the
framebuffer after each frame, which implicitly does a cache flush.
Both regressions are fixed by this commit, which restore WC mapping
for the framebuffer in system memory, and add a cache flush.
This is only needed on x86_64, for low-latency workload,
so the new kconfig DRM_MGAG200_LATENCY_WORKAROUND depends on
PREEMPT_RT and X86.

For more context, the whole thread can be found here:
https://lore.kernel.org/dri-devel/20231019135655.313759-1-jfalempe@redhat.com/

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/Kconfig        | 10 ++++++++++
 drivers/gpu/drm/mgag200/mgag200_drv.c  | 17 +++++++++++++++++
 drivers/gpu/drm/mgag200/mgag200_mode.c |  8 ++++++++
 3 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/Kconfig b/drivers/gpu/drm/mgag200/Kconfig
index b28c5e4828f4..73e4feba743a 100644
--- a/drivers/gpu/drm/mgag200/Kconfig
+++ b/drivers/gpu/drm/mgag200/Kconfig
@@ -11,3 +11,13 @@ config DRM_MGAG200
 	 MGA G200 desktop chips and the server variants. It requires 0.3.0
 	 of the modesetting userspace driver, and a version of mga driver
 	 that will fail on KMS enabled devices.
+
+config DRM_MGAG200_LATENCY_WORKAROUND
+	bool "Enable workaround for low latency server"
+	depends on DRM_MGAG200 && PREEMPT_RT && X86
+	help
+	  Enable a workaround to have better latency with mgag200 driver.
+	  It restores the <v5.10 behavior, by mapping the framebuffer in system
+	  RAM as Write-Combining, and flushing the cache after each write.
+	  This is only needed on x86_64 and if you want low-latency.
+	  If unsure, say N.
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 54fce00e2136..3fdef8b580cc 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -84,6 +84,20 @@ resource_size_t mgag200_probe_vram(void __iomem *mem, resource_size_t size)
 	return offset - 65536;
 }
 
+#if defined(CONFIG_DRM_MGAG200_LATENCY_WORKAROUND)
+static struct drm_gem_object *mgag200_create_object(struct drm_device *dev, size_t size)
+{
+	struct drm_gem_shmem_object *shmem;
+
+	shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
+	if (!shmem)
+		return NULL;
+
+	shmem->map_wc = true;
+	return &shmem->base;
+}
+#endif
+
 /*
  * DRM driver
  */
@@ -99,6 +113,9 @@ static const struct drm_driver mgag200_driver = {
 	.major = DRIVER_MAJOR,
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
+#if defined(CONFIG_DRM_MGAG200_LATENCY_WORKAROUND)
+	.gem_create_object = mgag200_create_object,
+#endif
 	DRM_GEM_SHMEM_DRIVER_OPS,
 };
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 0eb769dd76ce..34ef9fb6e96c 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -13,6 +13,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_cache.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_format_helper.h>
@@ -436,6 +437,13 @@ static void mgag200_handle_damage(struct mga_device *mdev, const struct iosys_ma
 
 	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
 	drm_fb_memcpy(&dst, fb->pitches, vmap, fb, clip);
+
+	/* Flushing the cache greatly improves latency on x86_64 */
+#if defined(CONFIG_DRM_MGAG200_LATENCY_WORKAROUND)
+	if (!vmap->is_iomem)
+		drm_clflush_virt_range(vmap->vaddr + clip->y1 * fb->pitches[0],
+				       drm_rect_height(clip) * fb->pitches[0]);
+#endif
 }
 
 /*

base-commit: 1f36d634670d8001a45fe2f2dcae546819f9c7d8
-- 
2.43.0

