Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D302EF3B3
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 15:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA816E07B;
	Fri,  8 Jan 2021 14:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159616E822
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 14:08:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A345CB73E;
 Fri,  8 Jan 2021 14:08:11 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mripard@kernel.org,
	eric@anholt.net,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 1/3] drm/vc4: Use drm_gem_cma_vmap() directly
Date: Fri,  8 Jan 2021 15:08:06 +0100
Message-Id: <20210108140808.25775-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210108140808.25775-1-tzimmermann@suse.de>
References: <20210108140808.25775-1-tzimmermann@suse.de>
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

Validated shaders cannot be exported. There's no need for testing this in
the BO's vmap implementation. Call drm_gem_cma_vmap() directly instead.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vc4/vc4_bo.c  | 14 +-------------
 drivers/gpu/drm/vc4/vc4_drv.h |  1 -
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index dc316cb79e00..eff12be616b0 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -386,7 +386,7 @@ static const struct drm_gem_object_funcs vc4_gem_object_funcs = {
 	.free = vc4_free_object,
 	.export = vc4_prime_export,
 	.get_sg_table = drm_gem_cma_get_sg_table,
-	.vmap = vc4_prime_vmap,
+	.vmap = drm_gem_cma_vmap,
 	.vm_ops = &vc4_vm_ops,
 };
 
@@ -785,18 +785,6 @@ int vc4_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 	return drm_gem_prime_mmap(obj, vma);
 }
 
-int vc4_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map)
-{
-	struct vc4_bo *bo = to_vc4_bo(obj);
-
-	if (bo->validated_shader) {
-		DRM_DEBUG("mmaping of shader BOs not allowed.\n");
-		return -EINVAL;
-	}
-
-	return drm_gem_cma_vmap(obj, map);
-}
-
 struct drm_gem_object *
 vc4_prime_import_sg_table(struct drm_device *dev,
 			  struct dma_buf_attachment *attach,
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 051ad4e31e52..61848c6f85ad 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -808,7 +808,6 @@ int vc4_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 struct drm_gem_object *vc4_prime_import_sg_table(struct drm_device *dev,
 						 struct dma_buf_attachment *attach,
 						 struct sg_table *sgt);
-int vc4_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
 int vc4_bo_cache_init(struct drm_device *dev);
 int vc4_bo_inc_usecnt(struct vc4_bo *bo);
 void vc4_bo_dec_usecnt(struct vc4_bo *bo);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
