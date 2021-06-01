Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 556523904BE
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 17:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054D06EA52;
	Tue, 25 May 2021 15:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640EB6E40C;
 Tue, 25 May 2021 15:11:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621955459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sre4zmdHXYljzUQtsp8iSwo/02uAwnOB5tZVsADMy1Q=;
 b=mkmr0tWUL2Kj0LdgQoWo0EWEpmTWgk0INgc1q8jq9s/qx6oBHTs/DfEGR3dC1PNbk75JcP
 DdhNQlBn5OTp6rWsVpNLAHYe0OGnJ0hDgl/IntT+KMu2eoLPA0SjFsLwDJkwOLpTEwbvgh
 CW9t/jAp9qA4v1xxeCT/PZKJ+NkhICk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621955459;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sre4zmdHXYljzUQtsp8iSwo/02uAwnOB5tZVsADMy1Q=;
 b=j8bWjfez3k/3ED556mNyeDx/gY0rmP12AF2Bmmc7wKhBMzQ332SDg6S9tklrKgOjWe+xX3
 WUIxlubN+QSaXRAQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D81ABAED6;
 Tue, 25 May 2021 15:10:58 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 Felix.Kuehling@amd.com, nirmoy.das@amd.com
Subject: [PATCH v4 3/7] drm/radeon: Implement mmap as GEM object function
Date: Tue, 25 May 2021 17:10:51 +0200
Message-Id: <20210525151055.8174-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525151055.8174-1-tzimmermann@suse.de>
References: <20210525151055.8174-1-tzimmermann@suse.de>
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
Cc: nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Moving the driver-specific mmap code into a GEM object function allows
for using DRM helpers for various mmap callbacks.

This change also allows to support prime-based mmap via DRM's helper
drm_gem_prime_mmap().

Permission checks are implemented by drm_gem_mmap(), with an additional
check for radeon_ttm_tt_has_userptr() in the GEM object function. The
function radeon_verify_access() is now unused and has thus been removed.

As a side effect, radeon_ttm_vm_ops and radeon_ttm_fault() are now
implemented in amdgpu's GEM code.

v3:
	* remove unnecessary checks from mmap (Christian)
v2:
	* rename radeon_ttm_vm_ops and radeon_ttm_fault() to
	  radeon_gem_vm_ops and radeon_gem_fault() (Christian)
	* fix commit description (Alex)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/radeon/radeon_drv.c |  3 +-
 drivers/gpu/drm/radeon/radeon_gem.c | 49 ++++++++++++++++++++++
 drivers/gpu/drm/radeon/radeon_ttm.c | 65 -----------------------------
 drivers/gpu/drm/radeon/radeon_ttm.h |  1 -
 4 files changed, 51 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 31d3dd0e5258..8cd135fa6dcd 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -545,7 +545,7 @@ static const struct file_operations radeon_driver_kms_fops = {
 	.open = drm_open,
 	.release = drm_release,
 	.unlocked_ioctl = radeon_drm_ioctl,
-	.mmap = radeon_mmap,
+	.mmap = drm_gem_mmap,
 	.poll = drm_poll,
 	.read = drm_read,
 #ifdef CONFIG_COMPAT
@@ -620,6 +620,7 @@ static const struct drm_driver kms_driver = {
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = radeon_gem_prime_import_sg_table,
+	.gem_prime_mmap = drm_gem_prime_mmap,
 
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 05ea2f39f626..ff8849827d61 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -44,6 +44,42 @@ void radeon_gem_prime_unpin(struct drm_gem_object *obj);
 
 const struct drm_gem_object_funcs radeon_gem_object_funcs;
 
+static vm_fault_t radeon_gem_fault(struct vm_fault *vmf)
+{
+	struct ttm_buffer_object *bo = vmf->vma->vm_private_data;
+	struct radeon_device *rdev = radeon_get_rdev(bo->bdev);
+	vm_fault_t ret;
+
+	down_read(&rdev->pm.mclk_lock);
+
+	ret = ttm_bo_vm_reserve(bo, vmf);
+	if (ret)
+		goto unlock_mclk;
+
+	ret = radeon_bo_fault_reserve_notify(bo);
+	if (ret)
+		goto unlock_resv;
+
+	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
+				       TTM_BO_VM_NUM_PREFAULT, 1);
+	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
+		goto unlock_mclk;
+
+unlock_resv:
+	dma_resv_unlock(bo->base.resv);
+
+unlock_mclk:
+	up_read(&rdev->pm.mclk_lock);
+	return ret;
+}
+
+static const struct vm_operations_struct radeon_gem_vm_ops = {
+	.fault = radeon_gem_fault,
+	.open = ttm_bo_vm_open,
+	.close = ttm_bo_vm_close,
+	.access = ttm_bo_vm_access
+};
+
 static void radeon_gem_object_free(struct drm_gem_object *gobj)
 {
 	struct radeon_bo *robj = gem_to_radeon_bo(gobj);
@@ -226,6 +262,17 @@ static int radeon_gem_handle_lockup(struct radeon_device *rdev, int r)
 	return r;
 }
 
+static int radeon_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	struct radeon_bo *bo = gem_to_radeon_bo(obj);
+	struct radeon_device *rdev = radeon_get_rdev(bo->tbo.bdev);
+
+	if (radeon_ttm_tt_has_userptr(rdev, bo->tbo.ttm))
+		return -EPERM;
+
+	return drm_gem_ttm_mmap(obj, vma);
+}
+
 const struct drm_gem_object_funcs radeon_gem_object_funcs = {
 	.free = radeon_gem_object_free,
 	.open = radeon_gem_object_open,
@@ -236,6 +283,8 @@ const struct drm_gem_object_funcs radeon_gem_object_funcs = {
 	.get_sg_table = radeon_gem_prime_get_sg_table,
 	.vmap = drm_gem_ttm_vmap,
 	.vunmap = drm_gem_ttm_vunmap,
+	.mmap = radeon_gem_object_mmap,
+	.vm_ops = &radeon_gem_vm_ops,
 };
 
 /*
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 3361d11769a2..a71d94f7067b 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -135,17 +135,6 @@ static void radeon_evict_flags(struct ttm_buffer_object *bo,
 	*placement = rbo->placement;
 }
 
-static int radeon_verify_access(struct ttm_buffer_object *bo, struct file *filp)
-{
-	struct radeon_bo *rbo = container_of(bo, struct radeon_bo, tbo);
-	struct radeon_device *rdev = radeon_get_rdev(bo->bdev);
-
-	if (radeon_ttm_tt_has_userptr(rdev, bo->ttm))
-		return -EPERM;
-	return drm_vma_node_verify_access(&rbo->tbo.base.vma_node,
-					  filp->private_data);
-}
-
 static int radeon_move_blit(struct ttm_buffer_object *bo,
 			bool evict,
 			struct ttm_resource *new_mem,
@@ -703,7 +692,6 @@ static struct ttm_device_funcs radeon_bo_driver = {
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = &radeon_evict_flags,
 	.move = &radeon_bo_move,
-	.verify_access = &radeon_verify_access,
 	.delete_mem_notify = &radeon_bo_delete_mem_notify,
 	.io_mem_reserve = &radeon_ttm_io_mem_reserve,
 };
@@ -800,59 +788,6 @@ void radeon_ttm_set_active_vram_size(struct radeon_device *rdev, u64 size)
 	man->size = size >> PAGE_SHIFT;
 }
 
-static vm_fault_t radeon_ttm_fault(struct vm_fault *vmf)
-{
-	struct ttm_buffer_object *bo = vmf->vma->vm_private_data;
-	struct radeon_device *rdev = radeon_get_rdev(bo->bdev);
-	vm_fault_t ret;
-
-	down_read(&rdev->pm.mclk_lock);
-
-	ret = ttm_bo_vm_reserve(bo, vmf);
-	if (ret)
-		goto unlock_mclk;
-
-	ret = radeon_bo_fault_reserve_notify(bo);
-	if (ret)
-		goto unlock_resv;
-
-	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
-				       TTM_BO_VM_NUM_PREFAULT, 1);
-	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
-		goto unlock_mclk;
-
-unlock_resv:
-	dma_resv_unlock(bo->base.resv);
-
-unlock_mclk:
-	up_read(&rdev->pm.mclk_lock);
-	return ret;
-}
-
-static const struct vm_operations_struct radeon_ttm_vm_ops = {
-	.fault = radeon_ttm_fault,
-	.open = ttm_bo_vm_open,
-	.close = ttm_bo_vm_close,
-	.access = ttm_bo_vm_access
-};
-
-int radeon_mmap(struct file *filp, struct vm_area_struct *vma)
-{
-	int r;
-	struct drm_file *file_priv = filp->private_data;
-	struct radeon_device *rdev = file_priv->minor->dev->dev_private;
-
-	if (rdev == NULL)
-		return -EINVAL;
-
-	r = ttm_bo_mmap(filp, vma, &rdev->mman.bdev);
-	if (unlikely(r != 0))
-		return r;
-
-	vma->vm_ops = &radeon_ttm_vm_ops;
-	return 0;
-}
-
 #if defined(CONFIG_DEBUG_FS)
 
 static int radeon_mm_vram_dump_table_show(struct seq_file *m, void *unused)
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.h b/drivers/gpu/drm/radeon/radeon_ttm.h
index 4d7b90ee2774..91ea7141bc81 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.h
+++ b/drivers/gpu/drm/radeon/radeon_ttm.h
@@ -32,6 +32,5 @@ struct radeon_device;
 
 int radeon_ttm_init(struct radeon_device *rdev);
 void radeon_ttm_fini(struct radeon_device *rdev);
-int radeon_mmap(struct file *filp, struct vm_area_struct *vma);
 
 #endif				/* __RADEON_TTM_H__ */
-- 
2.31.1

