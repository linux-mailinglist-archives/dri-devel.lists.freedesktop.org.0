Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA00BDE991
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 15:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B02010E7CA;
	Wed, 15 Oct 2025 13:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="iuLg67uH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E7E10E7BD
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 13:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760533274;
 bh=TxWDJK1oKmwJOQdX8wSxPpBNAqlDHKh9mNoGY3gorj4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iuLg67uHOd6EL1gP/17ybWWDAPXsrXqIdIDmdszLmZ1HZQ0yIhFR/dXE6RP3wOL76
 PTNTUG5ccH8i9IF4oyO6GX1yRXnxk0YHUI+Kx+v80qMSylMVsmWpDPjGYIxafTlIyk
 RDXr3/bwbq9yEfL7QUNHTFf20srFnrB5ZKZpDlHsoups+DnATj8Aq+r4a6IZs0lF2c
 M53rVngkd7G7vLRHnD8CLpd8GxxE9wtBRUNebDMmJobpvmj+zbROXc8uhS91HOEz6C
 CTZa0K4RX5BR7nEHChOdnAR4Uc3ljMIhqpvP0tsQPCnR7EDmOo9xDxX9tna0MhF1rc
 6IE6JZOZVNswg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 584FA17E13A5;
 Wed, 15 Oct 2025 15:01:14 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com
Subject: [PATCH v3 02/14] drm/gem: Add a drm_gem_object_funcs::sync() and a
 drm_gem_sync() helper
Date: Wed, 15 Oct 2025 15:00:51 +0200
Message-ID: <20251015130103.3634560-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015130103.3634560-1-boris.brezillon@collabora.com>
References: <20251015130103.3634560-1-boris.brezillon@collabora.com>
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

Prepare things for standardizing synchronization around CPU accesses
of GEM buffers. This will be used to provide default
drm_gem_dmabuf_{begin,end}_cpu_access() implementations, and provide
a way for drivers to add their own ioctls to synchronize CPU
writes/reads when they can't do it directly from userland.

v2:
- New commit

v3:
- No changes

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/drm_gem.c | 10 +++++++++
 include/drm/drm_gem.h     | 45 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index a1a9c828938b..a1431e4f2404 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1333,6 +1333,16 @@ void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
 }
 EXPORT_SYMBOL(drm_gem_vunmap);
 
+int drm_gem_sync(struct drm_gem_object *obj, size_t offset, size_t size,
+		 enum drm_gem_object_access_flags access)
+{
+	if (obj->funcs->sync)
+		return obj->funcs->sync(obj, offset, size, access);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_gem_sync);
+
 /**
  * drm_gem_lock_reservations - Sets up the ww context and acquires
  * the lock on an array of GEM objects.
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 8d48d2af2649..1c33e59ab305 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -66,6 +66,33 @@ enum drm_gem_object_status {
 	DRM_GEM_OBJECT_ACTIVE    = BIT(2),
 };
 
+/**
+ * enum drm_gem_object_status - bitmask describing GEM access types to prepare for
+ */
+enum drm_gem_object_access_flags {
+	/** @DRM_GEM_OBJECT_CPU_ACCESS: Prepare for a CPU access. */
+	DRM_GEM_OBJECT_CPU_ACCESS = 0,
+
+	/** @DRM_GEM_OBJECT_DEV_ACCESS: Prepare for a device access. */
+	DRM_GEM_OBJECT_DEV_ACCESS = BIT(0),
+
+	/** @DRM_GEM_OBJECT_ACCESSOR_MASK: Mask used to check the entity doing the access. */
+	DRM_GEM_OBJECT_ACCESSOR_MASK = BIT(0),
+
+	/** @DRM_GEM_OBJECT_READ_ACCESS: Prepare for read-only accesses. */
+	DRM_GEM_OBJECT_READ_ACCESS = BIT(1),
+
+	/** @DRM_GEM_OBJECT_WRITE_ACCESS: Prepare for write-only accesses. */
+	DRM_GEM_OBJECT_WRITE_ACCESS = BIT(2),
+
+	/** @DRM_GEM_OBJECT_RW_ACCESS: Prepare for a read/write accesses. */
+	DRM_GEM_OBJECT_RW_ACCESS = DRM_GEM_OBJECT_READ_ACCESS |
+				   DRM_GEM_OBJECT_WRITE_ACCESS,
+
+	/** @DRM_GEM_OBJECT_ACCESS_TYPE_MASK: Mask used to check the access type. */
+	DRM_GEM_OBJECT_ACCESS_TYPE_MASK = DRM_GEM_OBJECT_RW_ACCESS,
+};
+
 /**
  * struct drm_gem_object_funcs - GEM object functions
  */
@@ -191,6 +218,21 @@ struct drm_gem_object_funcs {
 	 */
 	int (*mmap)(struct drm_gem_object *obj, struct vm_area_struct *vma);
 
+	/**
+	 * @sync:
+	 *
+	 * Prepare for CPU/device access. This can involve migration of
+	 * a buffer to the system-RAM/VRAM, or for UMA, flushing/invalidating
+	 * the CPU caches. The range can be used to optimize the synchronization
+	 * when possible.
+	 *
+	 * Returns 0 on success, -errno otherwise.
+	 *
+	 * This callback is optional.
+	 */
+	int (*sync)(struct drm_gem_object *obj, size_t offset, size_t size,
+		    enum drm_gem_object_access_flags access);
+
 	/**
 	 * @evict:
 	 *
@@ -559,6 +601,9 @@ void drm_gem_unlock(struct drm_gem_object *obj);
 int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map);
 void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
 
+int drm_gem_sync(struct drm_gem_object *obj, size_t offset, size_t size,
+		 enum drm_gem_object_access_flags access);
+
 int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 			   int count, struct drm_gem_object ***objs_out);
 struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);
-- 
2.51.0

