Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C773A692DC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 16:17:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B00410E534;
	Wed, 19 Mar 2025 15:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="FX5Die6z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2101110E534
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 15:16:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742397387; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ntFeWacIa8Pm5kBFyE9gDw3v520b38EyCPJz1PEWj1GHDtxq6c6tNkqBJL5A7cLFUZbZecXqTif0Ycp870+8YRyOLldFzLj7jqLbZJW/Wux4Uo1YlbkkdBCzMw0F61lNm9iyRKRLCZ2nb5AjuEE3UM8/vUcnrxLdUKH3svYRyn4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742397387;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=OoIHyEJ5O0a0xme8HtC057nmgMH3xihc2B6OzxWGjfE=; 
 b=JycvFkmuUFsnxqSUFtlLhzaP6YSc2jRsdiTwh1R0xCexdfJdzaNoyVUZoqjZJ+tQGtiNwJTojh4DE0Gldt5OdbU+5RIp4x9z13ZAWqzz7UxSbUgEwcvqX37SCvpRU4q4MDFJAC/26vKXBV0I/r6Wg+6FVZjDtTFH6jA/h5i2dHc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742397387; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=OoIHyEJ5O0a0xme8HtC057nmgMH3xihc2B6OzxWGjfE=;
 b=FX5Die6z2YofTaMsB+hrV171mcc66RGPrTlMeiT5OKfVTZn8G0vvObF5YPDckoAv
 a0aoOxXcCEuzaT9Y++RUKhQGrd9otLAN9d9zy9UWYnqYX6Njh1W8M2+Bo3JjL//41Fc
 spYz9Vn8sy2Qkao6dlLIddEpcQ/1vbL8NyeVfk8Y=
Received: by mx.zohomail.com with SMTPS id 17423973850171005.418058365657;
 Wed, 19 Mar 2025 08:16:25 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] drm/panthor: Display heap chunk entries in DebugFS
 GEMS file
Date: Wed, 19 Mar 2025 15:03:19 +0000
Message-ID: <20250319150953.1634322-5-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319150953.1634322-1-adrian.larumbe@collabora.com>
References: <20250319150953.1634322-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Expand the driver's DebugFS GEMS file to display entries for the heap
chunks' GEM objects, both those allocated at heap creation time through an
ioctl(), or in response to a tiler OOM event.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_gem.c  | 22 +++++++++++-----------
 drivers/gpu/drm/panthor/panthor_gem.h  |  2 ++
 drivers/gpu/drm/panthor/panthor_heap.c |  3 +++
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index f7eb413d88e7..252979473fdf 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -22,16 +22,6 @@ static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo)
 	get_task_comm(bo->gems.creator.process_name, current->group_leader);
 }
 
-static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
-{
-	struct panthor_device *ptdev =  container_of(bo->base.base.dev,
-						     struct panthor_device, base);
-
-	mutex_lock(&ptdev->gems.lock);
-	list_add_tail(&bo->gems.node, &ptdev->gems.node);
-	mutex_unlock(&ptdev->gems.lock);
-}
-
 static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
 {
 	struct panthor_device *ptdev = container_of(bo->base.base.dev,
@@ -44,10 +34,20 @@ static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
 	list_del_init(&bo->gems.node);
 	mutex_unlock(&ptdev->gems.lock);
 }
+
+void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
+{
+	struct panthor_device *ptdev =  container_of(bo->base.base.dev,
+						     struct panthor_device, base);
+
+	mutex_lock(&ptdev->gems.lock);
+	list_add_tail(&bo->gems.node, &ptdev->gems.node);
+	mutex_unlock(&ptdev->gems.lock);
+}
 #else
 static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo) {}
-static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo) {}
 static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo) {}
+void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo) {}
 #endif
 
 static void panthor_gem_free_object(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 7c896ec35801..e132f14bbef8 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -132,6 +132,8 @@ panthor_gem_create_with_handle(struct drm_file *file,
 void panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label);
 void panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label);
 
+void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo);
+
 static inline u64
 panthor_kernel_bo_gpuva(struct panthor_kernel_bo *bo)
 {
diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index db0285ce5812..73cf43eb4a7b 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -180,6 +180,9 @@ static int panthor_alloc_heap_chunk(struct panthor_device *ptdev,
 	heap->chunk_count++;
 	mutex_unlock(&heap->lock);
 
+	panthor_gem_kernel_bo_set_label(chunk->bo, "\"Tiler heap chunk\"");
+	panthor_gem_debugfs_bo_add(to_panthor_bo(chunk->bo->obj));
+
 	return 0;
 
 err_destroy_bo:
-- 
2.48.1

