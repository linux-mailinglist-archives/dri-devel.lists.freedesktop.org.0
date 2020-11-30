Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0870F2C83CA
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 13:04:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7203089DED;
	Mon, 30 Nov 2020 12:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5E589D66
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 12:04:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C506CAB63;
 Mon, 30 Nov 2020 12:04:40 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, hdegoede@redhat.com, christian.koenig@amd.com
Subject: [PATCH 7/8] drm/vram-helper: Remove vmap reference counting
Date: Mon, 30 Nov 2020 13:04:32 +0100
Message-Id: <20201130120433.7205-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201130120433.7205-1-tzimmermann@suse.de>
References: <20201130120433.7205-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Overlapping or nested mappings of the same BO are not allowed by the
semantics of the GEM vmap/vunmap operations. Concurent access to the
GEM object is prevented by reservation locks.

So we don't need the reference counter in the GEM VRAM object. Remove
it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 19 ++++---------------
 include/drm/drm_gem_vram_helper.h     | 17 +++--------------
 2 files changed, 7 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index ac0fa9da1c83..a44718dd66cb 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -113,7 +113,6 @@ static void drm_gem_vram_cleanup(struct drm_gem_vram_object *gbo)
 	 * up; only release the GEM object.
 	 */
 
-	WARN_ON(gbo->vmap_use_count);
 	WARN_ON(dma_buf_map_is_set(&gbo->map));
 
 	drm_gem_object_release(&gbo->bo.base);
@@ -384,15 +383,10 @@ static int drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
 {
 	int ret;
 
-	if (gbo->vmap_use_count > 0)
-		goto out;
-
 	ret = ttm_bo_vmap(&gbo->bo, &gbo->map);
 	if (ret)
 		return ret;
 
-out:
-	++gbo->vmap_use_count;
 	*map = gbo->map;
 
 	return 0;
@@ -403,15 +397,9 @@ static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo,
 {
 	struct drm_device *dev = gbo->bo.base.dev;
 
-	if (drm_WARN_ON_ONCE(dev, !gbo->vmap_use_count))
-		return;
-
 	if (drm_WARN_ON_ONCE(dev, !dma_buf_map_is_equal(&gbo->map, map)))
 		return; /* BUG: map not mapped from this BO */
 
-	if (--gbo->vmap_use_count > 0)
-		return;
-
 	/*
 	 * Permanently mapping and unmapping buffers adds overhead from
 	 * updating the page tables and creates debugging output. Therefore,
@@ -596,12 +584,13 @@ static void drm_gem_vram_bo_driver_move_notify(struct drm_gem_vram_object *gbo,
 					       struct ttm_resource *new_mem)
 {
 	struct ttm_buffer_object *bo = &gbo->bo;
-	struct drm_device *dev = bo->base.dev;
+	struct dma_buf_map *map = &gbo->map;
 
-	if (drm_WARN_ON_ONCE(dev, gbo->vmap_use_count))
+	if (dma_buf_map_is_null(map))
 		return;
 
-	ttm_bo_vunmap(bo, &gbo->map);
+	ttm_bo_vunmap(bo, map);
+	dma_buf_map_clear(map);
 }
 
 static int drm_gem_vram_bo_driver_move(struct drm_gem_vram_object *gbo,
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 2d22888b5754..b679349bbfb2 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -42,25 +42,14 @@ struct ww_acquire_ctx;
  * dedicated memory. The buffer object can be evicted to system memory if
  * video memory becomes scarce.
  *
- * GEM VRAM objects perform reference counting for pin and mapping
- * operations. So a buffer object that has been pinned N times with
- * drm_gem_vram_pin() must be unpinned N times with
- * drm_gem_vram_unpin(). The same applies to pairs of
- * drm_gem_vram_kmap() and drm_gem_vram_kunmap(), as well as pairs of
- * drm_gem_vram_vmap() and drm_gem_vram_vunmap().
+ * GEM VRAM objects perform reference counting for pin operations. So a
+ * buffer object that has been pinned N times with drm_gem_vram_pin() must
+ * be unpinned N times with drm_gem_vram_unpin().
  */
 struct drm_gem_vram_object {
 	struct ttm_buffer_object bo;
 	struct dma_buf_map map;
 
-	/**
-	 * @vmap_use_count:
-	 *
-	 * Reference count on the virtual address.
-	 * The address are un-mapped when the count reaches zero.
-	 */
-	unsigned int vmap_use_count;
-
 	/* Supported placements are %TTM_PL_VRAM and %TTM_PL_SYSTEM */
 	struct ttm_placement placement;
 	struct ttm_place placements[2];
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
