Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE393904C4
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 17:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCCD6EA5D;
	Tue, 25 May 2021 15:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E486EA4A;
 Tue, 25 May 2021 15:11:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621955460; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PoTPLoS8j/2GtiOp33HkPuhZt4atGI/aK5hI6V7rmww=;
 b=N0RYumUZhxny4Vw6Hj3mcScvaqy3lSgZVkdnKwBMKe5tei8Bd8a96RjNg64E1B6+A2mECH
 +QpyxRRz2jdgQ0v8VRDZFXyRTCKlQhqkiLu9H44x1pf8BMyX4ft+B4NRRLzeyx2H3BJAQ4
 TqKVpLiJo47UqMfxifVpVw3RVP5Zt+c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621955460;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PoTPLoS8j/2GtiOp33HkPuhZt4atGI/aK5hI6V7rmww=;
 b=temd7cheobo/3ECB9hKHsx7XsTwlQUVRHl1zLMK5wWpN+XlFvtPX448tUGhnicErNt6mcV
 hW4FrYD0EbAqJPDg==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7E660AEFF;
 Tue, 25 May 2021 15:11:00 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 Felix.Kuehling@amd.com, nirmoy.das@amd.com
Subject: [PATCH v4 7/7] drm/ttm: Remove ttm_bo_mmap() and friends
Date: Tue, 25 May 2021 17:10:55 +0200
Message-Id: <20210525151055.8174-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525151055.8174-1-tzimmermann@suse.de>
References: <20210525151055.8174-1-tzimmermann@suse.de>
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
Cc: nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function ttm_bo_mmap is unused. Remove it and it's helpers; including
the verify_access callback in struct ttm_device_funcs.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 53 ---------------------------------
 include/drm/ttm/ttm_bo_api.h    | 13 --------
 include/drm/ttm/ttm_device.h    | 15 ----------
 3 files changed, 81 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index ff07dbc91c03..9bd15cb39145 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -560,30 +560,6 @@ static const struct vm_operations_struct ttm_bo_vm_ops = {
 	.access = ttm_bo_vm_access,
 };
 
-static struct ttm_buffer_object *ttm_bo_vm_lookup(struct ttm_device *bdev,
-						  unsigned long offset,
-						  unsigned long pages)
-{
-	struct drm_vma_offset_node *node;
-	struct ttm_buffer_object *bo = NULL;
-
-	drm_vma_offset_lock_lookup(bdev->vma_manager);
-
-	node = drm_vma_offset_lookup_locked(bdev->vma_manager, offset, pages);
-	if (likely(node)) {
-		bo = container_of(node, struct ttm_buffer_object,
-				  base.vma_node);
-		bo = ttm_bo_get_unless_zero(bo);
-	}
-
-	drm_vma_offset_unlock_lookup(bdev->vma_manager);
-
-	if (!bo)
-		pr_err("Could not find buffer object to map\n");
-
-	return bo;
-}
-
 static void ttm_bo_mmap_vma_setup(struct ttm_buffer_object *bo, struct vm_area_struct *vma)
 {
 	/*
@@ -611,35 +587,6 @@ static void ttm_bo_mmap_vma_setup(struct ttm_buffer_object *bo, struct vm_area_s
 	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
 }
 
-int ttm_bo_mmap(struct file *filp, struct vm_area_struct *vma,
-		struct ttm_device *bdev)
-{
-	struct ttm_buffer_object *bo;
-	int ret;
-
-	if (unlikely(vma->vm_pgoff < DRM_FILE_PAGE_OFFSET_START))
-		return -EINVAL;
-
-	bo = ttm_bo_vm_lookup(bdev, vma->vm_pgoff, vma_pages(vma));
-	if (unlikely(!bo))
-		return -EINVAL;
-
-	if (unlikely(!bo->bdev->funcs->verify_access)) {
-		ret = -EPERM;
-		goto out_unref;
-	}
-	ret = bo->bdev->funcs->verify_access(bo, filp);
-	if (unlikely(ret != 0))
-		goto out_unref;
-
-	ttm_bo_mmap_vma_setup(bo, vma);
-	return 0;
-out_unref:
-	ttm_bo_put(bo);
-	return ret;
-}
-EXPORT_SYMBOL(ttm_bo_mmap);
-
 int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo)
 {
 	ttm_bo_get(bo);
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 254ede97f8e3..f2a5f37c61b7 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -524,19 +524,6 @@ void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct dma_buf_map *map);
  */
 int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo);
 
-/**
- * ttm_bo_mmap - mmap out of the ttm device address space.
- *
- * @filp:      filp as input from the mmap method.
- * @vma:       vma as input from the mmap method.
- * @bdev:      Pointer to the ttm_device with the address space manager.
- *
- * This function is intended to be called by the device mmap method.
- * if the device address space is to be backed by the bo manager.
- */
-int ttm_bo_mmap(struct file *filp, struct vm_area_struct *vma,
-		struct ttm_device *bdev);
-
 /**
  * ttm_bo_io
  *
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index 7c8f87bd52d3..cd592f8e941b 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -161,21 +161,6 @@ struct ttm_device_funcs {
 		    struct ttm_resource *new_mem,
 		    struct ttm_place *hop);
 
-	/**
-	 * struct ttm_bo_driver_member verify_access
-	 *
-	 * @bo: Pointer to a buffer object.
-	 * @filp: Pointer to a struct file trying to access the object.
-	 *
-	 * Called from the map / write / read methods to verify that the
-	 * caller is permitted to access the buffer object.
-	 * This member may be set to NULL, which will refuse this kind of
-	 * access for all buffer objects.
-	 * This function should return 0 if access is granted, -EPERM otherwise.
-	 */
-	int (*verify_access)(struct ttm_buffer_object *bo,
-			     struct file *filp);
-
 	/**
 	 * Hook to notify driver about a resource delete.
 	 */
-- 
2.31.1

