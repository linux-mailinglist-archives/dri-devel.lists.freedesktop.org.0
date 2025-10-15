Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC97BDF88C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 18:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374F910E878;
	Wed, 15 Oct 2025 16:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SszFhMPe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E82B10E862
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760544224;
 bh=4vKeItnyAuKIfMd6LK1jhmVv3D+zjb96r2USaGHsaW4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SszFhMPeScev4oHRjgWhaqoG/8VBdegl1XSID81kby6ZeAc9Ux+JodLoGObB11ExY
 RIXU6xDVvaT2rrpdrDcBopOSG6mZsRPZUH63oGLqU0UsEXuR9rzbDaRPPVRl1tvQ1R
 FyQ3xYQfTnPFMeHAgKSdf3+vkQT/5TC9V+U6uLTZGsi6ckT70PEnGtdhHAaZx3U2fi
 PFrPi1wuf87ybrw4GtZQPMCaMzpA5BlO/mdTP5bDPZZz4lshr57O/zbR02fftvtFYi
 zqQoXnIdxympfDqFhYZRT3Y9YCtRZGuN1uaD1D022bZGF5pNJX+lxgFSWugjtRAWaY
 PsHqzDmDDHZ8w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B419217E1392;
 Wed, 15 Oct 2025 18:03:43 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v4 13/14] drm/panfrost: Add flag to map GEM object Write-Back
 Cacheable
Date: Wed, 15 Oct 2025 18:03:25 +0200
Message-ID: <20251015160326.3657287-14-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015160326.3657287-1-boris.brezillon@collabora.com>
References: <20251015160326.3657287-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Faith Ekstrand <faith.ekstrand@collabora.com>

Will be used by the UMD to optimize CPU accesses to buffers
that are frequently read by the CPU, or on which the access
pattern makes non-cacheable mappings inefficient.

Mapping buffers CPU-cached implies taking care of the CPU
cache maintenance in the UMD, unless the GPU is IO coherent.

v2:
- Add more to the commit message

v3:
- No changes

v4:
- Fix the map_wc test in panfrost_ioctl_query_bo_info()

Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 10 ++++++++--
 drivers/gpu/drm/panfrost/panfrost_gem.c |  3 +++
 include/uapi/drm/panfrost_drm.h         |  1 +
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 00c0881fa2f0..9ca08d148f56 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -125,6 +125,10 @@ static int panfrost_ioctl_get_param(struct drm_device *ddev, void *data, struct
 	return 0;
 }
 
+#define PANFROST_BO_FLAGS	(PANFROST_BO_NOEXEC | \
+				 PANFROST_BO_HEAP | \
+				 PANFROST_BO_WB_MMAP)
+
 static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
 		struct drm_file *file)
 {
@@ -134,8 +138,7 @@ static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
 	struct panfrost_gem_mapping *mapping;
 	int ret;
 
-	if (!args->size || args->pad ||
-	    (args->flags & ~(PANFROST_BO_NOEXEC | PANFROST_BO_HEAP)))
+	if (!args->size || args->pad || (args->flags & ~PANFROST_BO_FLAGS))
 		return -EINVAL;
 
 	/* Heaps should never be executable */
@@ -661,6 +664,9 @@ static int panfrost_ioctl_query_bo_info(struct drm_device *dev, void *data,
 
 		if (bo->is_heap)
 			args->create_flags |= PANFROST_BO_HEAP;
+
+		if (!bo->base.map_wc)
+			args->create_flags |= PANFROST_BO_WB_MMAP;
 	}
 
 	drm_gem_object_put(gem_obj);
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index da0362202d94..0e8028ee9d1f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -320,6 +320,9 @@ panfrost_gem_create(struct drm_device *dev, size_t size, u32 flags)
 	bo->noexec = !!(flags & PANFROST_BO_NOEXEC);
 	bo->is_heap = !!(flags & PANFROST_BO_HEAP);
 
+	if (flags & PANFROST_BO_WB_MMAP)
+		bo->base.map_wc = false;
+
 	return bo;
 }
 
diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index e7d01e744efd..244d2f96c2d7 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -104,6 +104,7 @@ struct drm_panfrost_wait_bo {
 /* Valid flags to pass to drm_panfrost_create_bo */
 #define PANFROST_BO_NOEXEC	1
 #define PANFROST_BO_HEAP	2
+#define PANFROST_BO_WB_MMAP	4
 
 /**
  * struct drm_panfrost_create_bo - ioctl argument for creating Panfrost BOs.
-- 
2.51.0

