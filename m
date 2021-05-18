Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D793873F9
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 10:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379E06EAD3;
	Tue, 18 May 2021 08:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B31E6EAD0;
 Tue, 18 May 2021 08:28:02 +0000 (UTC)
IronPort-SDR: y+9s6mM3I2pg0+IVD0x8qDFZVsoYlI1PC1HM/VJ3zuO3O/BekQVhCyBIPixqUvOjzNNR5G4ziO
 +UWDRj4pBa8w==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="197572752"
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="197572752"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 01:28:01 -0700
IronPort-SDR: PGtJGSW+ryNfDCOqxBwzF9/K0cJGktMp0svDuN0FaB8rT8o+R874x3JN6Z46xqrIYCKydi6II7
 iSUsSHP+aA/A==
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="611892397"
Received: from cmutgix-mobl.gar.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.195])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 01:27:49 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 13/15] drm/ttm: Add BO and offset arguments for vm_access
 and vm_fault ttm handlers.
Date: Tue, 18 May 2021 10:26:59 +0200
Message-Id: <20210518082701.997251-14-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

This allows other drivers that may not setup the vma in the same way
to use the ttm bo helpers.

Also clarify the documentation a bit, especially related to VM_FAULT_RETRY.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  4 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c      |  4 +-
 drivers/gpu/drm/radeon/radeon_ttm.c        |  4 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c            | 84 +++++++++++++---------
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c |  8 ++-
 include/drm/ttm/ttm_bo_api.h               |  9 ++-
 6 files changed, 75 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index d5a9d7a88315..89dafe14f828 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1919,7 +1919,9 @@ static vm_fault_t amdgpu_ttm_fault(struct vm_fault *vmf)
 	if (ret)
 		goto unlock;
 
-	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
+	ret = ttm_bo_vm_fault_reserved(bo, vmf,
+				       drm_vma_node_start(&bo->base.vma_node),
+				       vmf->vma->vm_page_prot,
 				       TTM_BO_VM_NUM_PREFAULT, 1);
 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index b81ae90b8449..555fb6d8be8b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -144,7 +144,9 @@ static vm_fault_t nouveau_ttm_fault(struct vm_fault *vmf)
 
 	nouveau_bo_del_io_reserve_lru(bo);
 	prot = vm_get_page_prot(vma->vm_flags);
-	ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT, 1);
+	ret = ttm_bo_vm_fault_reserved(bo, vmf,
+				       drm_vma_node_start(&bo->base.vma_node),
+				       prot, TTM_BO_VM_NUM_PREFAULT, 1);
 	nouveau_bo_add_io_reserve_lru(bo);
 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
 		return ret;
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 3361d11769a2..ba48a2acdef0 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -816,7 +816,9 @@ static vm_fault_t radeon_ttm_fault(struct vm_fault *vmf)
 	if (ret)
 		goto unlock_resv;
 
-	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
+	ret = ttm_bo_vm_fault_reserved(bo, vmf,
+				       drm_vma_node_start(&bo->base.vma_node),
+				       vmf->vma->vm_page_prot,
 				       TTM_BO_VM_NUM_PREFAULT, 1);
 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
 		goto unlock_mclk;
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index b31b18058965..ed00ccf1376e 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -42,7 +42,7 @@
 #include <linux/mem_encrypt.h>
 
 static vm_fault_t ttm_bo_vm_fault_idle(struct ttm_buffer_object *bo,
-				struct vm_fault *vmf)
+				       struct vm_fault *vmf)
 {
 	vm_fault_t ret = 0;
 	int err = 0;
@@ -122,7 +122,8 @@ static unsigned long ttm_bo_io_mem_pfn(struct ttm_buffer_object *bo,
  * Return:
  *    0 on success and the bo was reserved.
  *    VM_FAULT_RETRY if blocking wait.
- *    VM_FAULT_NOPAGE if blocking wait and retrying was not allowed.
+ *    VM_FAULT_NOPAGE if blocking wait and retrying was not allowed, or wait interrupted.
+ *    VM_FAULT_SIGBUS if wait on bo->moving failed for reason other than a signal.
  */
 vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
 			     struct vm_fault *vmf)
@@ -254,7 +255,9 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fault *vmf,
 
 /**
  * ttm_bo_vm_fault_reserved - TTM fault helper
+ * @bo: The buffer object
  * @vmf: The struct vm_fault given as argument to the fault callback
+ * @mmap_base: The base of the mmap, to which the @vmf fault is relative to.
  * @prot: The page protection to be used for this memory area.
  * @num_prefault: Maximum number of prefault pages. The caller may want to
  * specify this based on madvice settings and the size of the GPU object
@@ -265,19 +268,28 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fault *vmf,
  * memory backing the buffer object, and then returns a return code
  * instructing the caller to retry the page access.
  *
+ * This function ensures any pipelined wait is finished.
+ *
+ * WARNING:
+ * On VM_FAULT_RETRY, the bo will be unlocked by this function when
+ * #FAULT_FLAG_RETRY_NOWAIT is not set inside @vmf->flags. In this
+ * case, the caller should not unlock the @bo.
+ *
  * Return:
- *   VM_FAULT_NOPAGE on success or pending signal
+ *   0 on success.
+ *   VM_FAULT_NOPAGE on pending signal
  *   VM_FAULT_SIGBUS on unspecified error
  *   VM_FAULT_OOM on out-of-memory
- *   VM_FAULT_RETRY if retryable wait
+ *   VM_FAULT_RETRY if retryable wait, see WARNING above.
  */
-vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
+vm_fault_t ttm_bo_vm_fault_reserved(struct ttm_buffer_object *bo,
+				    struct vm_fault *vmf,
+				    unsigned long mmap_base,
 				    pgprot_t prot,
 				    pgoff_t num_prefault,
 				    pgoff_t fault_page_size)
 {
 	struct vm_area_struct *vma = vmf->vma;
-	struct ttm_buffer_object *bo = vma->vm_private_data;
 	struct ttm_device *bdev = bo->bdev;
 	unsigned long page_offset;
 	unsigned long page_last;
@@ -286,15 +298,11 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 	struct page *page;
 	int err;
 	pgoff_t i;
-	vm_fault_t ret = VM_FAULT_NOPAGE;
+	vm_fault_t ret;
 	unsigned long address = vmf->address;
 
-	/*
-	 * Wait for buffer data in transit, due to a pipelined
-	 * move.
-	 */
 	ret = ttm_bo_vm_fault_idle(bo, vmf);
-	if (unlikely(ret != 0))
+	if (ret)
 		return ret;
 
 	err = ttm_mem_io_reserve(bdev, &bo->mem);
@@ -302,9 +310,8 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 		return VM_FAULT_SIGBUS;
 
 	page_offset = ((address - vma->vm_start) >> PAGE_SHIFT) +
-		vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node);
-	page_last = vma_pages(vma) + vma->vm_pgoff -
-		drm_vma_node_start(&bo->base.vma_node);
+		vma->vm_pgoff - mmap_base;
+	page_last = vma_pages(vma) + vma->vm_pgoff - mmap_base;
 
 	if (unlikely(page_offset >= bo->mem.num_pages))
 		return VM_FAULT_SIGBUS;
@@ -344,8 +351,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 			} else if (unlikely(!page)) {
 				break;
 			}
-			page->index = drm_vma_node_start(&bo->base.vma_node) +
-				page_offset;
+			page->index = mmap_base + page_offset;
 			pfn = page_to_pfn(page);
 		}
 
@@ -392,7 +398,10 @@ vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
 		return ret;
 
 	prot = vma->vm_page_prot;
-	ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT, 1);
+	ret = ttm_bo_vm_fault_reserved(bo, vmf,
+				       drm_vma_node_start(&bo->base.vma_node),
+				       prot, TTM_BO_VM_NUM_PREFAULT, 1);
+
 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
 		return ret;
 
@@ -460,22 +469,16 @@ static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
 	return len;
 }
 
-int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
-		     void *buf, int len, int write)
+int ttm_bo_vm_access_reserved(struct ttm_buffer_object *bo,
+			      struct vm_area_struct *vma,
+			      unsigned long offset,
+			      void *buf, int len, int write)
 {
-	struct ttm_buffer_object *bo = vma->vm_private_data;
-	unsigned long offset = (addr) - vma->vm_start +
-		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
-		 << PAGE_SHIFT);
 	int ret;
 
 	if (len < 1 || (offset + len) >> PAGE_SHIFT > bo->mem.num_pages)
 		return -EIO;
 
-	ret = ttm_bo_reserve(bo, true, false, NULL);
-	if (ret)
-		return ret;
-
 	switch (bo->mem.mem_type) {
 	case TTM_PL_SYSTEM:
 		if (unlikely(bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
@@ -485,16 +488,33 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 		}
 		fallthrough;
 	case TTM_PL_TT:
-		ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
-		break;
+		return ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
 	default:
 		if (bo->bdev->funcs->access_memory)
-			ret = bo->bdev->funcs->access_memory(
+			return bo->bdev->funcs->access_memory(
 				bo, offset, buf, len, write);
 		else
-			ret = -EIO;
+			return -EIO;
 	}
 
+	return ret;
+}
+EXPORT_SYMBOL(ttm_bo_vm_access_reserved);
+
+int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
+		     void *buf, int len, int write)
+{
+	struct ttm_buffer_object *bo = vma->vm_private_data;
+	unsigned long offset = (addr) - vma->vm_start +
+		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
+		 << PAGE_SHIFT);
+	int ret;
+
+	ret = ttm_bo_reserve(bo, true, false, NULL);
+	if (ret)
+		return ret;
+
+	ret = ttm_bo_vm_access_reserved(bo, vma, offset, buf, len, write);
 	ttm_bo_unreserve(bo);
 
 	return ret;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
index 45c9c6a7f1d6..56ecace0cf5c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
@@ -477,7 +477,9 @@ vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf)
 	else
 		prot = vm_get_page_prot(vma->vm_flags);
 
-	ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault, 1);
+	ret = ttm_bo_vm_fault_reserved(bo, vmf,
+				       drm_vma_node_start(&bo->base.vma_node),
+				       prot, num_prefault, 1);
 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
 		return ret;
 
@@ -546,7 +548,9 @@ vm_fault_t vmw_bo_vm_huge_fault(struct vm_fault *vmf,
 		prot = vm_get_page_prot(vma->vm_flags);
 	}
 
-	ret = ttm_bo_vm_fault_reserved(vmf, prot, 1, fault_page_size);
+	ret = ttm_bo_vm_fault_reserved(bo, vmf,
+				       drm_vma_node_start(&bo->base.vma_node),
+				       prot, 1, fault_page_size);
 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
 		return ret;
 
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 639521880c29..434f91f1fdbf 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -605,7 +605,9 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
 			     struct vm_fault *vmf);
 
-vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
+vm_fault_t ttm_bo_vm_fault_reserved(struct ttm_buffer_object *bo,
+				    struct vm_fault *vmf,
+				    unsigned long mmap_base,
 				    pgprot_t prot,
 				    pgoff_t num_prefault,
 				    pgoff_t fault_page_size);
@@ -616,6 +618,11 @@ void ttm_bo_vm_open(struct vm_area_struct *vma);
 
 void ttm_bo_vm_close(struct vm_area_struct *vma);
 
+int ttm_bo_vm_access_reserved(struct ttm_buffer_object *bo,
+			      struct vm_area_struct *vma,
+			      unsigned long offset,
+			      void *buf, int len, int write);
+
 int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 		     void *buf, int len, int write);
 bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
-- 
2.31.1

