Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C91E1A044F8
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 16:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FACF10EB1A;
	Tue,  7 Jan 2025 15:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BasfI4SI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F5A10E710;
 Tue,  7 Jan 2025 15:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736264562; x=1767800562;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9HQXochbOO8bhM+YUVYwc7dQOS72+c1SHopORFBCcWA=;
 b=BasfI4SIhOCzqzk/OLLGCv57ljneaNrT6qoIBsIrTB8lLX1neRkdc8TG
 koMBwpjftvvtnKInmgkiDwoMila/L85NsD7BEmmJvnn8vYrhelgUGtK5T
 xMQayl0iOpmUX44cOL+IM8zn26KsqRTQvchalDCrw1EejyM9ndisLrmBG
 RGQm4W3GM6CV1Tz6r0ho/MsQYKPg/mLDqUYOEuS3ivRBcBzDvJklCOsbc
 uI8QR6yxvgIO2qvtsLhCchL1xoppoMEw5mfXqpuZYePDu/lMrj9MJIbYB
 55ZA89HF98NNVGojQgCH8181wH9grhE0v6M9YY6X8vz1FHslADbm9P8aT g==;
X-CSE-ConnectionGUID: Ideh0TAzRtaYRmML1NLxjA==
X-CSE-MsgGUID: YUUL+elkRYatI5gSJ9qnfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="46950253"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="46950253"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 07:42:41 -0800
X-CSE-ConnectionGUID: nnAfeXiTRTGxa63I2wNJbQ==
X-CSE-MsgGUID: kVQHOatNSUeYjCfnW5aMTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="102867511"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 07:42:38 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>
Subject: [PATCH V6 1/1] drm/xe/mmap: Add mmap support for PCI memory barrier
Date: Tue,  7 Jan 2025 21:17:50 +0530
Message-Id: <20250107154750.2942358-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107154750.2942358-1-tejas.upadhyay@intel.com>
References: <20250107154750.2942358-1-tejas.upadhyay@intel.com>
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

Test-with: 20241118113606.1490397-1-tejas.upadhyay@intel.com
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c     |  16 ++++-
 drivers/gpu/drm/xe/xe_bo.h     |   2 +
 drivers/gpu/drm/xe/xe_device.c | 103 ++++++++++++++++++++++++++++++++-
 include/uapi/drm/xe_drm.h      |  29 +++++++++-
 4 files changed, 147 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index e6c896ad5602..86f2c00a0afd 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2263,9 +2263,23 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
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
index 7f021ec5f8e7..bacfeec9dc0b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -232,12 +232,113 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
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

