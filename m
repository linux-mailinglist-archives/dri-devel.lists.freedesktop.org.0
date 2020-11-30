Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C1C2C83CB
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 13:04:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9ED89DB9;
	Mon, 30 Nov 2020 12:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27B089D66
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 12:04:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 45ECEABD2;
 Mon, 30 Nov 2020 12:04:41 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, hdegoede@redhat.com, christian.koenig@amd.com
Subject: [PATCH 8/8] drm/vram-helper: Simplify vmap implementation
Date: Mon, 30 Nov 2020 13:04:33 +0100
Message-Id: <20201130120433.7205-9-tzimmermann@suse.de>
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

After removing the pinning operations, the vmap/vunmap code as been
reduced to what used to be an internal helper. Inline the helper to
simplify the implementation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 57 +++++++++++----------------
 1 file changed, 23 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index a44718dd66cb..10d89c01990f 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -378,36 +378,6 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
 }
 EXPORT_SYMBOL(drm_gem_vram_unpin);
 
-static int drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
-				    struct dma_buf_map *map)
-{
-	int ret;
-
-	ret = ttm_bo_vmap(&gbo->bo, &gbo->map);
-	if (ret)
-		return ret;
-
-	*map = gbo->map;
-
-	return 0;
-}
-
-static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo,
-				       struct dma_buf_map *map)
-{
-	struct drm_device *dev = gbo->bo.base.dev;
-
-	if (drm_WARN_ON_ONCE(dev, !dma_buf_map_is_equal(&gbo->map, map)))
-		return; /* BUG: map not mapped from this BO */
-
-	/*
-	 * Permanently mapping and unmapping buffers adds overhead from
-	 * updating the page tables and creates debugging output. Therefore,
-	 * we delay the actual unmap operation until the BO gets evicted
-	 * from memory. See drm_gem_vram_bo_driver_move_notify().
-	 */
-}
-
 /**
  * drm_gem_vram_vmap() - Pins and maps a GEM VRAM object into kernel address
  *                       space
@@ -426,9 +396,17 @@ static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo,
  */
 int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map)
 {
+	int ret;
+
 	dma_resv_assert_held(gbo->bo.base.resv);
 
-	return drm_gem_vram_kmap_locked(gbo, map);
+	ret = ttm_bo_vmap(&gbo->bo, &gbo->map);
+	if (ret)
+		return ret;
+
+	*map = gbo->map;
+
+	return 0;
 }
 EXPORT_SYMBOL(drm_gem_vram_vmap);
 
@@ -442,8 +420,19 @@ EXPORT_SYMBOL(drm_gem_vram_vmap);
  */
 void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map)
 {
+	struct drm_device *dev = gbo->bo.base.dev;
+
 	dma_resv_assert_held(gbo->bo.base.resv);
-	drm_gem_vram_kunmap_locked(gbo, map);
+
+	if (drm_WARN_ON_ONCE(dev, !dma_buf_map_is_equal(&gbo->map, map)))
+		return; /* BUG: map not mapped from this BO */
+
+	/*
+	 * Permanently mapping and unmapping buffers adds overhead from
+	 * updating the page tables and creates debugging output. Therefore,
+	 * we delay the actual unmap operation until the BO gets evicted
+	 * from memory. See drm_gem_vram_bo_driver_move_notify().
+	 */
 }
 EXPORT_SYMBOL(drm_gem_vram_vunmap);
 
@@ -471,7 +460,7 @@ int drm_gem_vram_vmap_unlocked(struct drm_gem_vram_object *gbo, struct dma_buf_m
 	if (ret)
 		return ret;
 
-	ret = drm_gem_vram_kmap_locked(gbo, map);
+	ret = drm_gem_vram_vmap(gbo, map);
 	if (ret)
 		goto err_ttm_bo_unreserve;
 
@@ -494,7 +483,7 @@ EXPORT_SYMBOL(drm_gem_vram_vmap_unlocked);
  */
 void drm_gem_vram_vunmap_unlocked(struct drm_gem_vram_object *gbo, struct dma_buf_map *map)
 {
-	drm_gem_vram_kunmap_locked(gbo, map);
+	drm_gem_vram_vunmap(gbo, map);
 	ttm_bo_unreserve(&gbo->bo);
 }
 EXPORT_SYMBOL(drm_gem_vram_vunmap_unlocked);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
