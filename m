Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3A99D1BEA
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:37:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C364510E58C;
	Mon, 18 Nov 2024 23:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xlrrd4jk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F20710E57A;
 Mon, 18 Nov 2024 23:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731973047; x=1763509047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OtbyF2EW/P7V2LLp0ko5/zMgM1ltR8QgJg7XG/TyNAU=;
 b=Xlrrd4jkPvdC7iJr3hBIhQTfaocM17Gtt45tnXg/FbnOQafTMl+R3PCt
 bmKq5HHy2cbG8YZPw0QajO43ajMcXbLW4LGBtu9CYEllNLb3FjMlGtPz1
 jZ4QiaqIceg50v0UHn2JFCP6SpY5N2xvMl0fV1JVMrmugDQ5qq9/tBRAq
 se5WAPGiG1EolDzMCFvGqaLzANTDQ1e8f+2SE941TRnjsoVcHJaHvzJH6
 2Fx4ZV4DqstFf7l3pQpo2od1z/N3LSfxm+eEp3s45d304fXVCIef6sjd+
 zEeob3F07/OxrgTM16JKzeTY6TGsgyahLFwa47+vGUHUFvvLpFMRlOUVQ g==;
X-CSE-ConnectionGUID: YpdraNELRAGmx8pBrfe5pQ==
X-CSE-MsgGUID: esWyYkb9T+alptZ72b2I3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31878930"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31878930"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:27 -0800
X-CSE-ConnectionGUID: 3NmoZ0DZRLamvwwbTcN9eg==
X-CSE-MsgGUID: QUm4moe7SxCRkdgtRW7l4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89521716"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:26 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, christian.koenig@amd.com, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 13/29] drm/xe/mmap: Add mmap support for PCI memory barrier
Date: Mon, 18 Nov 2024 15:37:41 -0800
Message-Id: <20241118233757.2374041-14-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118233757.2374041-1-matthew.brost@intel.com>
References: <20241118233757.2374041-1-matthew.brost@intel.com>
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

From: Tejas Upadhyay <tejas.upadhyay@intel.com>

In order to avoid having userspace to use MI_MEM_FENCE,
we are adding a mechanism for userspace to generate a
PCI memory barrier with low overhead (avoiding IOCTL call
as well as writing to VRAM will adds some overhead).

This is implemented by memory-mapping a page as uncached
that is backed by MMIO on the dGPU and thus allowing userspace
to do memory write to the page without invoking an IOCTL.
We are selecting the MMIO so that it is not accessible from
the PCI bus so that the MMIO writes themselves are ignored,
but the PCI memory barrier will still take action as the MMIO
filtering will happen after the memory barrier effect.

When we detect special defined offset in mmap(), We are mapping
4K page which contains the last of page of doorbell MMIO range
to userspace for same purpose.

For user to query special offset we are adding special flag in
mmap_offset ioctl which needs to be passed as follows,
struct drm_xe_gem_mmap_offset mmo = {
        .handle = 0, /* this must be 0 */
        .flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
};
igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo);

Note: Test coverage for this is added by IGT
      https://patchwork.freedesktop.org/series/140368/  here.
      UMD implementing test, once PR is ready will attach with
      this patch.

V6(MAuld)
  - Move physical mmap to fault handler
  - Modify kernel-doc and attach UMD PR when ready
V5(MAuld)
  - Return invalid early in case of non 4K PAGE_SIZE
  - Format kernel-doc and add note for 4K PAGE_SIZE HW limit
V4(MAuld)
  - Add kernel-doc for uapi change
  - Restrict page size to 4K
V3(MAuld)
  - Remove offset defination from UAPI to be able to change later
  - Edit commit message for special flag addition
V2(MAuld)
  - Add fault handler with dummy page to handle unplug device
  - Add Build check for special offset to be below normal start page
  - Test d3hot, mapping seems to be valid in d3hot as well
  - Add more info to commit message

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c     |  16 ++++-
 drivers/gpu/drm/xe/xe_bo.h     |   2 +
 drivers/gpu/drm/xe/xe_device.c | 103 ++++++++++++++++++++++++++++++++-
 include/uapi/drm/xe_drm.h      |  29 +++++++++-
 4 files changed, 147 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 96dbc88b1f55..f948262e607f 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2138,9 +2138,23 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, args->flags))
+	if (XE_IOCTL_DBG(xe, args->flags &
+			 ~DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER))
 		return -EINVAL;
 
+	if (args->flags & DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER) {
+		if (XE_IOCTL_DBG(xe, args->handle))
+			return -EINVAL;
+
+		if (XE_IOCTL_DBG(xe, PAGE_SIZE > SZ_4K))
+			return -EINVAL;
+
+		BUILD_BUG_ON(((XE_PCI_BARRIER_MMAP_OFFSET >> XE_PTE_SHIFT) +
+			      SZ_4K) >= DRM_FILE_PAGE_OFFSET_START);
+		args->offset = XE_PCI_BARRIER_MMAP_OFFSET;
+		return 0;
+	}
+
 	gem_obj = drm_gem_object_lookup(file, args->handle);
 	if (XE_IOCTL_DBG(xe, !gem_obj))
 		return -ENOENT;
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 7fa44a0138b0..e7724965d3f1 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -63,6 +63,8 @@
 
 #define XE_BO_PROPS_INVALID	(-1)
 
+#define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
+
 struct sg_table;
 
 struct xe_bo *xe_bo_alloc(void);
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 930bb2750e2e..f6069db795e7 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -231,12 +231,113 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
 #define xe_drm_compat_ioctl NULL
 #endif
 
+static void barrier_open(struct vm_area_struct *vma)
+{
+	drm_dev_get(vma->vm_private_data);
+}
+
+static void barrier_close(struct vm_area_struct *vma)
+{
+	drm_dev_put(vma->vm_private_data);
+}
+
+static void barrier_release_dummy_page(struct drm_device *dev, void *res)
+{
+	struct page *dummy_page = (struct page *)res;
+
+	__free_page(dummy_page);
+}
+
+static vm_fault_t barrier_fault(struct vm_fault *vmf)
+{
+	struct drm_device *dev = vmf->vma->vm_private_data;
+	struct vm_area_struct *vma = vmf->vma;
+	vm_fault_t ret = VM_FAULT_NOPAGE;
+	pgprot_t prot;
+	int idx;
+
+	prot = vm_get_page_prot(vma->vm_flags);
+
+	if (drm_dev_enter(dev, &idx)) {
+		unsigned long pfn;
+
+#define LAST_DB_PAGE_OFFSET 0x7ff001
+		pfn = PHYS_PFN(pci_resource_start(to_pci_dev(dev->dev), 0) +
+				LAST_DB_PAGE_OFFSET);
+		ret = vmf_insert_pfn_prot(vma, vma->vm_start, pfn,
+					  pgprot_noncached(prot));
+		drm_dev_exit(idx);
+	} else {
+		struct page *page;
+
+		/* Allocate new dummy page to map all the VA range in this VMA to it*/
+		page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+		if (!page)
+			return VM_FAULT_OOM;
+
+		/* Set the page to be freed using drmm release action */
+		if (drmm_add_action_or_reset(dev, barrier_release_dummy_page, page))
+			return VM_FAULT_OOM;
+
+		ret = vmf_insert_pfn_prot(vma, vma->vm_start, page_to_pfn(page),
+					  prot);
+	}
+
+	return ret;
+}
+
+static const struct vm_operations_struct vm_ops_barrier = {
+	.open = barrier_open,
+	.close = barrier_close,
+	.fault = barrier_fault,
+};
+
+static int xe_pci_barrier_mmap(struct file *filp,
+			       struct vm_area_struct *vma)
+{
+	struct drm_file *priv = filp->private_data;
+	struct drm_device *dev = priv->minor->dev;
+
+	if (vma->vm_end - vma->vm_start > SZ_4K)
+		return -EINVAL;
+
+	if (is_cow_mapping(vma->vm_flags))
+		return -EINVAL;
+
+	if (vma->vm_flags & (VM_READ | VM_EXEC))
+		return -EINVAL;
+
+	vm_flags_clear(vma, VM_MAYREAD | VM_MAYEXEC);
+	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_IO);
+	vma->vm_ops = &vm_ops_barrier;
+	vma->vm_private_data = dev;
+	drm_dev_get(vma->vm_private_data);
+
+	return 0;
+}
+
+static int xe_mmap(struct file *filp, struct vm_area_struct *vma)
+{
+	struct drm_file *priv = filp->private_data;
+	struct drm_device *dev = priv->minor->dev;
+
+	if (drm_dev_is_unplugged(dev))
+		return -ENODEV;
+
+	switch (vma->vm_pgoff) {
+	case XE_PCI_BARRIER_MMAP_OFFSET >> XE_PTE_SHIFT:
+		return xe_pci_barrier_mmap(filp, vma);
+	}
+
+	return drm_gem_mmap(filp, vma);
+}
+
 static const struct file_operations xe_driver_fops = {
 	.owner = THIS_MODULE,
 	.open = drm_open,
 	.release = drm_release_noglobal,
 	.unlocked_ioctl = xe_drm_ioctl,
-	.mmap = drm_gem_mmap,
+	.mmap = xe_mmap,
 	.poll = drm_poll,
 	.read = drm_read,
 	.compat_ioctl = xe_drm_compat_ioctl,
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 4a8a4a63e99c..6490b16b1217 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -811,6 +811,32 @@ struct drm_xe_gem_create {
 
 /**
  * struct drm_xe_gem_mmap_offset - Input of &DRM_IOCTL_XE_GEM_MMAP_OFFSET
+ *
+ * The @flags can be:
+ *  - %DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER - For user to query special offset
+ *  for use in mmap ioctl. Writing to the returned mmap address will generate a
+ *  PCI memory barrier with low overhead (avoiding IOCTL call as well as writing
+ *  to VRAM which would also add overhead), acting like an MI_MEM_FENCE
+ *  instruction.
+ *
+ *  Note: The mmap size can be at most 4K, due to HW limitations. As a result
+ *  this interface is only supported on CPU architectures that support 4K page
+ *  size. The mmap_offset ioctl will detect this and gracefully return an
+ *  error, where userspace is expected to have a different fallback method for
+ *  triggering a barrier.
+ *
+ *  Roughly the usage would be as follows:
+ *
+ *  .. code-block:: C
+ *
+ *  struct drm_xe_gem_mmap_offset mmo = {
+ *	.handle = 0, // must be set to 0
+ *	.flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
+ *  };
+ *
+ *  err = ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
+ *  map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo.offset);
+ *  map[i] = 0xdeadbeaf; // issue barrier
  */
 struct drm_xe_gem_mmap_offset {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -819,7 +845,8 @@ struct drm_xe_gem_mmap_offset {
 	/** @handle: Handle for the object being mapped. */
 	__u32 handle;
 
-	/** @flags: Must be zero */
+#define DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER     (1 << 0)
+	/** @flags: Flags */
 	__u32 flags;
 
 	/** @offset: The fake offset to use for subsequent mmap call */
-- 
2.34.1

