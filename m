Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44499A0B5E3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 12:40:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E5D10E654;
	Mon, 13 Jan 2025 11:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VJ5G1ZNx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D089710E64E;
 Mon, 13 Jan 2025 11:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736768431; x=1768304431;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DCbKgPEarYTTcuSJ+T6hCC1BRDGf9IzjMe2rn3Bl1Tc=;
 b=VJ5G1ZNxGAts78YGtQQsJiC8Yb9GDRumZVIGHVck08YmtglyT8c7J4U3
 igMXpSwLklGvVhOLjF8NjrzcBdPrMWMlMyBtoDalRGrmiCUkc7a9n6+Ll
 1Cea39DkSEamz1u8kpc3ZiOLv1fxhJbMMDtF8pfXIrpIZm8YISzxVHt49
 79185NVavnPRU/6IIAYWonEH3CsRhwJKNlQpQ7FVjCKYqc+vC8WCwR/ek
 98dHC5DvanIRgv87SXBHlI+VWqy84Y6c6H+GnbqRUff5cNDisdlPeg9Ag
 bXZnnv0lNqmtw+hdju1tV6Q6GZl0TTtEJ1LYCfhR+LshlLwhuJhqXJDO/ Q==;
X-CSE-ConnectionGUID: lFhvQ8++SduttylGFczZtA==
X-CSE-MsgGUID: TWldU3OjS8e1xJ0eiaU2pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="36313750"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="36313750"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 03:36:42 -0800
X-CSE-ConnectionGUID: jTgLYfuVQo2nX6zdkIM57w==
X-CSE-MsgGUID: anRhnaKyQDqomSAW2m2ngA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="141741028"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 03:36:39 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>
Subject: [PATCH V7] drm/xe/mmap: Add mmap support for PCI memory barrier
Date: Mon, 13 Jan 2025 17:12:01 +0530
Message-Id: <20250113114201.3178806-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
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

IGT : https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/b2dbc6f22815128c0dd5c737504f42e1f1a6ad62
UMD : https://github.com/intel/compute-runtime/pull/772

V7:
  - Dgpu filter added
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
Acked-by: Michal Mrozek <michal.mrozek@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c     |  19 +++++-
 drivers/gpu/drm/xe/xe_bo.h     |   2 +
 drivers/gpu/drm/xe/xe_device.c | 107 ++++++++++++++++++++++++++++++++-
 include/uapi/drm/xe_drm.h      |  29 ++++++++-
 4 files changed, 154 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 3f5391d416d4..0237e1620ea8 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2263,9 +2263,26 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, args->flags))
+	if (XE_IOCTL_DBG(xe, args->flags &
+			 ~DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER))
 		return -EINVAL;
 
+	if (args->flags & DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER) {
+		if (XE_IOCTL_DBG(xe, !IS_DGFX(xe)))
+			return -EINVAL;
+
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
index d9386ab03140..04995c5ced32 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -75,6 +75,8 @@
 
 #define XE_BO_PROPS_INVALID	(-1)
 
+#define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
+
 struct sg_table;
 
 struct xe_bo *xe_bo_alloc(void);
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5cbc96b214fe..6ecbf7dd396c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -232,12 +232,117 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
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
+	struct xe_device *xe = to_xe_device(dev);
+
+	if (!IS_DGFX(xe))
+		return -EINVAL;
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
index f62689ca861a..cac607a30f6d 100644
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

