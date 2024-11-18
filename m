Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0119D1BF1
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095F810E593;
	Mon, 18 Nov 2024 23:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qkr9qi3C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568B210E579;
 Mon, 18 Nov 2024 23:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731973047; x=1763509047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W3SqTgfgG3QPnrc77lM8aiyB5CANE1eeVgHOl+hET5E=;
 b=Qkr9qi3C+s7UwahgC2OAksHsduiKaQZKLZmgv3aGKQX2cCQwBoiTCo9N
 ZvMoOp1T5dfmMRuIvW+DrcmznD8K/1exciC3pw1I9lElrm6yqjPoJUwJF
 pMQUeNXnHiBXCD+XOvGRx57SPu7ckY1iwdHUUG2i3lM9XqSHpBxlq7jU/
 q7J9tXEL0PbJevNRVNurJt6DSGtJAqG34gIVypmgzavHmBeLdyHsYXYTr
 m8X6WQ1kqCbZwdZK4m875kXok20ynJFeL6DxvvBjl3+UHp18D8DsMThV2
 0L44b9oIh1xObwfhTsL9MFxEswtCK1kh5QsDoM0EY2p1+YXaHdrRTtdm9 Q==;
X-CSE-ConnectionGUID: NFDRLiliQJ2s4eDebGGbYA==
X-CSE-MsgGUID: 2+HmnKDHS/+4wVhhZzeA8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31878936"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31878936"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:27 -0800
X-CSE-ConnectionGUID: zjz0fL1/S/WUnW7Hydwq8w==
X-CSE-MsgGUID: yoiOjRK5QZaqZAcOiZLHng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89521720"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:27 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, christian.koenig@amd.com, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 14/29] drm/xe: Add support for mmapping doorbells to user
 space
Date: Mon, 18 Nov 2024 15:37:42 -0800
Message-Id: <20241118233757.2374041-15-matthew.brost@intel.com>
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

Doorbells need to be mapped to user space for UMD direct submisssion,
add support for this.

FIXME: Wildly insecure as anyone can pick MMIO doorbell offset, will
need to randomize and tie unique offset to FD. Can be done in later revs
before upstreaming.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h     |  3 ++
 drivers/gpu/drm/xe/xe_device.c | 73 ++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index e7724965d3f1..2772d42ac057 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -64,6 +64,9 @@
 #define XE_BO_PROPS_INVALID	(-1)
 
 #define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
+#define XE_MMIO_DOORBELL_MMAP_OFFSET	(0x100 << XE_PTE_SHIFT)
+#define XE_MMIO_DOORBELL_PFN_START	(SZ_4M >> XE_PTE_SHIFT)
+#define XE_MMIO_DOORBELL_PFN_COUNT	(256)
 
 struct sg_table;
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f6069db795e7..bbdff4308b2e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -316,6 +316,75 @@ static int xe_pci_barrier_mmap(struct file *filp,
 	return 0;
 }
 
+static vm_fault_t doorbell_fault(struct vm_fault *vmf)
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
+		pfn = PHYS_PFN(pci_resource_start(to_pci_dev(dev->dev), 0) +
+			       (XE_MMIO_DOORBELL_PFN_START << XE_PTE_SHIFT));
+		pfn += vma->vm_pgoff & (XE_MMIO_DOORBELL_PFN_COUNT - 1);
+
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
+static const struct vm_operations_struct vm_ops_doorbell = {
+	.open = barrier_open,
+	.close = barrier_close,
+	.fault = doorbell_fault,
+};
+
+static int xe_mmio_doorbell_mmap(struct file *filp,
+				 struct vm_area_struct *vma)
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
+	if (vma->vm_flags & VM_EXEC)
+		return -EINVAL;
+
+	vm_flags_clear(vma, VM_MAYEXEC);
+	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_IO);
+	vma->vm_ops = &vm_ops_doorbell;
+	vma->vm_private_data = dev;
+	drm_dev_get(vma->vm_private_data);
+
+	return 0;
+}
+
 static int xe_mmap(struct file *filp, struct vm_area_struct *vma)
 {
 	struct drm_file *priv = filp->private_data;
@@ -327,6 +396,10 @@ static int xe_mmap(struct file *filp, struct vm_area_struct *vma)
 	switch (vma->vm_pgoff) {
 	case XE_PCI_BARRIER_MMAP_OFFSET >> XE_PTE_SHIFT:
 		return xe_pci_barrier_mmap(filp, vma);
+	case (XE_MMIO_DOORBELL_MMAP_OFFSET >> XE_PTE_SHIFT) ...
+		((XE_MMIO_DOORBELL_MMAP_OFFSET >> XE_PTE_SHIFT) +
+		XE_MMIO_DOORBELL_PFN_COUNT - 1):
+		return xe_mmio_doorbell_mmap(filp, vma);
 	}
 
 	return drm_gem_mmap(filp, vma);
-- 
2.34.1

