Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0DC903B69
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 14:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A9210E5F7;
	Tue, 11 Jun 2024 12:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gcSZvJK/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7999C10E5DF
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 12:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718107493; x=1749643493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hLEq75itDMQbl6PdMSaJ1kcW7KAZ8hiTPL+E6Gvor64=;
 b=gcSZvJK/cxDha3AvvzQJR5BT7K08LQfIpYuMLLjAFfhNifyz7VDD2nox
 0AcVnMiI6QzLJvEhGEbAf6XoHKchm4G4dWrLRCi3IPaHXvGiSowpHAcBW
 AYR4mH5TE8nRI5K31Dw3T3q3yPnO36bF5OhBbeCxanOOSNtqQu9K5dlvZ
 iFVYrInpjenjZzMqKLA4p7wqAXS0jOB5XZJ+0oCG8i8vfxyaYFgRDWdu+
 DcqUg0V3UCO61xiit9B0SttPuUCP4SMXZLWhZBLxC2JTqBpe7qzoeY9bh
 0FGLxemkxQPgDtZwKT2n4M8vNwX0v2a/3jJJ9GtNt6X+sC/sNpWezzUP6 g==;
X-CSE-ConnectionGUID: ncj7xC5GQTaa8V3p/6Afmw==
X-CSE-MsgGUID: bQJc+krMRR6KgYyzlLNWEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="32296070"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="32296070"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:04:52 -0700
X-CSE-ConnectionGUID: hTtF4bRbTJenZdRNNZhBqg==
X-CSE-MsgGUID: D+FFTS+lQBGnPrakYd+u1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39877122"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:04:50 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 "Wachowski, Karol" <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 09/15] accel/ivpu: Make parts of FW image read-only
Date: Tue, 11 Jun 2024 14:04:26 +0200
Message-ID: <20240611120433.1012423-10-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240611120433.1012423-1-jacek.lawrynowicz@linux.intel.com>
References: <20240611120433.1012423-1-jacek.lawrynowicz@linux.intel.com>
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

From: "Wachowski, Karol" <karol.wachowski@intel.com>

Implement setting specified buffer ranges as read-only.
In case if specified range is not 64K aligned and 64K contiguous
MMU600 pages are turned on, split 64K mapping to allow 4K granularity
for read-only configuration.

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_fw.c          | 31 +++++++++-
 drivers/accel/ivpu/ivpu_fw.h          |  2 +
 drivers/accel/ivpu/ivpu_mmu_context.c | 86 +++++++++++++++++++++++++++
 drivers/accel/ivpu/ivpu_mmu_context.h |  2 +
 4 files changed, 120 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 1fc4befe7461..de3d66116375 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2020-2023 Intel Corporation
+ * Copyright (C) 2020-2024 Intel Corporation
  */
 
 #include <linux/firmware.h>
@@ -123,6 +123,14 @@ ivpu_fw_check_api_ver_lt(struct ivpu_device *vdev, const struct vpu_firmware_hea
 	return false;
 }
 
+static bool is_within_range(u64 addr, size_t size, u64 range_start, size_t range_size)
+{
+	if (addr < range_start || addr + size > range_start + range_size)
+		return false;
+
+	return true;
+}
+
 static int ivpu_fw_parse(struct ivpu_device *vdev)
 {
 	struct ivpu_fw_info *fw = vdev->fw;
@@ -205,10 +213,24 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
 	fw->primary_preempt_buf_size = fw_hdr->preemption_buffer_1_size;
 	fw->secondary_preempt_buf_size = fw_hdr->preemption_buffer_2_size;
 
+	if (fw_hdr->ro_section_start_address && !is_within_range(fw_hdr->ro_section_start_address,
+								 fw_hdr->ro_section_size,
+								 fw_hdr->image_load_address,
+								 fw_hdr->image_size)) {
+		ivpu_err(vdev, "Invalid read-only section: start address 0x%llx, size %u\n",
+			 fw_hdr->ro_section_start_address, fw_hdr->ro_section_size);
+		return -EINVAL;
+	}
+
+	fw->read_only_addr = fw_hdr->ro_section_start_address;
+	fw->read_only_size = fw_hdr->ro_section_size;
+
 	ivpu_dbg(vdev, FW_BOOT, "Size: file %lu image %u runtime %u shavenn %u\n",
 		 fw->file->size, fw->image_size, fw->runtime_size, fw->shave_nn_size);
 	ivpu_dbg(vdev, FW_BOOT, "Address: runtime 0x%llx, load 0x%llx, entry point 0x%llx\n",
 		 fw->runtime_addr, image_load_addr, fw->entry_point);
+	ivpu_dbg(vdev, FW_BOOT, "Read-only section: address 0x%llx, size %u\n",
+		 fw->read_only_addr, fw->read_only_size);
 
 	return 0;
 }
@@ -270,6 +292,13 @@ static int ivpu_fw_mem_init(struct ivpu_device *vdev)
 		return -ENOMEM;
 	}
 
+	ret = ivpu_mmu_context_set_pages_ro(vdev, &vdev->gctx, fw->read_only_addr,
+					    fw->read_only_size);
+	if (ret) {
+		ivpu_err(vdev, "Failed to set firmware image read-only\n");
+		goto err_free_fw_mem;
+	}
+
 	fw->mem_log_crit = ivpu_bo_create_global(vdev, IVPU_FW_CRITICAL_BUFFER_SIZE,
 						 DRM_IVPU_BO_CACHED | DRM_IVPU_BO_MAPPABLE);
 	if (!fw->mem_log_crit) {
diff --git a/drivers/accel/ivpu/ivpu_fw.h b/drivers/accel/ivpu/ivpu_fw.h
index 66fc7da3ab0f..40d9d17be3f5 100644
--- a/drivers/accel/ivpu/ivpu_fw.h
+++ b/drivers/accel/ivpu/ivpu_fw.h
@@ -30,6 +30,8 @@ struct ivpu_fw_info {
 	u32 dvfs_mode;
 	u32 primary_preempt_buf_size;
 	u32 secondary_preempt_buf_size;
+	u64 read_only_addr;
+	u32 read_only_size;
 };
 
 int ivpu_fw_init(struct ivpu_device *vdev);
diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
index 128aef8e5a19..bbe652a7019d 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.c
+++ b/drivers/accel/ivpu/ivpu_mmu_context.c
@@ -24,6 +24,7 @@
 #define IVPU_MMU_ENTRY_FLAG_CONT         BIT(52)
 #define IVPU_MMU_ENTRY_FLAG_NG           BIT(11)
 #define IVPU_MMU_ENTRY_FLAG_AF           BIT(10)
+#define IVPU_MMU_ENTRY_FLAG_RO           BIT(7)
 #define IVPU_MMU_ENTRY_FLAG_USER         BIT(6)
 #define IVPU_MMU_ENTRY_FLAG_LLC_COHERENT BIT(2)
 #define IVPU_MMU_ENTRY_FLAG_TYPE_PAGE    BIT(1)
@@ -319,6 +320,91 @@ ivpu_mmu_context_map_pages(struct ivpu_device *vdev, struct ivpu_mmu_context *ct
 	return 0;
 }
 
+static void ivpu_mmu_context_set_page_ro(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
+					 u64 vpu_addr)
+{
+	int pgd_idx = FIELD_GET(IVPU_MMU_PGD_INDEX_MASK, vpu_addr);
+	int pud_idx = FIELD_GET(IVPU_MMU_PUD_INDEX_MASK, vpu_addr);
+	int pmd_idx = FIELD_GET(IVPU_MMU_PMD_INDEX_MASK, vpu_addr);
+	int pte_idx = FIELD_GET(IVPU_MMU_PTE_INDEX_MASK, vpu_addr);
+
+	ctx->pgtable.pte_ptrs[pgd_idx][pud_idx][pmd_idx][pte_idx] |= IVPU_MMU_ENTRY_FLAG_RO;
+}
+
+static void ivpu_mmu_context_split_page(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
+					u64 vpu_addr)
+{
+	int pgd_idx = FIELD_GET(IVPU_MMU_PGD_INDEX_MASK, vpu_addr);
+	int pud_idx = FIELD_GET(IVPU_MMU_PUD_INDEX_MASK, vpu_addr);
+	int pmd_idx = FIELD_GET(IVPU_MMU_PMD_INDEX_MASK, vpu_addr);
+	int pte_idx = FIELD_GET(IVPU_MMU_PTE_INDEX_MASK, vpu_addr);
+
+	ctx->pgtable.pte_ptrs[pgd_idx][pud_idx][pmd_idx][pte_idx] &= ~IVPU_MMU_ENTRY_FLAG_CONT;
+}
+
+static void ivpu_mmu_context_split_64k_page(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
+					    u64 vpu_addr)
+{
+	u64 start = ALIGN_DOWN(vpu_addr, IVPU_MMU_CONT_PAGES_SIZE);
+	u64 end = ALIGN(vpu_addr, IVPU_MMU_CONT_PAGES_SIZE);
+	u64 offset = 0;
+
+	ivpu_dbg(vdev, MMU_MAP, "Split 64K page ctx: %u vpu_addr: 0x%llx\n", ctx->id, vpu_addr);
+
+	while (start + offset < end) {
+		ivpu_mmu_context_split_page(vdev, ctx, start + offset);
+		offset += IVPU_MMU_PAGE_SIZE;
+	}
+}
+
+int
+ivpu_mmu_context_set_pages_ro(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx, u64 vpu_addr,
+			      size_t size)
+{
+	u64 end = vpu_addr + size;
+	size_t size_left = size;
+	int ret;
+
+	if (size == 0)
+		return 0;
+
+	if (drm_WARN_ON(&vdev->drm, !IS_ALIGNED(vpu_addr | size, IVPU_MMU_PAGE_SIZE)))
+		return -EINVAL;
+
+	mutex_lock(&ctx->lock);
+
+	ivpu_dbg(vdev, MMU_MAP, "Set read-only pages ctx: %u vpu_addr: 0x%llx size: %lu\n",
+		 ctx->id, vpu_addr, size);
+
+	if (!ivpu_disable_mmu_cont_pages) {
+		/* Split 64K contiguous page at the beginning if needed */
+		if (!IS_ALIGNED(vpu_addr, IVPU_MMU_CONT_PAGES_SIZE))
+			ivpu_mmu_context_split_64k_page(vdev, ctx, vpu_addr);
+
+		/* Split 64K contiguous page at the end if needed */
+		if (!IS_ALIGNED(vpu_addr + size, IVPU_MMU_CONT_PAGES_SIZE))
+			ivpu_mmu_context_split_64k_page(vdev, ctx, vpu_addr + size);
+	}
+
+	while (size_left) {
+		if (vpu_addr < end)
+			ivpu_mmu_context_set_page_ro(vdev, ctx, vpu_addr);
+
+		vpu_addr += IVPU_MMU_PAGE_SIZE;
+		size_left -= IVPU_MMU_PAGE_SIZE;
+	}
+
+	/* Ensure page table modifications are flushed from wc buffers to memory */
+	wmb();
+
+	mutex_unlock(&ctx->lock);
+	ret = ivpu_mmu_invalidate_tlb(vdev, ctx->id);
+	if (ret)
+		ivpu_err(vdev, "Failed to invalidate TLB for ctx %u: %d\n", ctx->id, ret);
+
+	return 0;
+}
+
 static void ivpu_mmu_context_unmap_pages(struct ivpu_mmu_context *ctx, u64 vpu_addr, size_t size)
 {
 	while (size) {
diff --git a/drivers/accel/ivpu/ivpu_mmu_context.h b/drivers/accel/ivpu/ivpu_mmu_context.h
index 535db3a1fc74..7f9aaf3d10c2 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.h
+++ b/drivers/accel/ivpu/ivpu_mmu_context.h
@@ -46,5 +46,7 @@ int ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *
 			     u64 vpu_addr, struct sg_table *sgt, bool llc_coherent);
 void ivpu_mmu_context_unmap_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 				u64 vpu_addr, struct sg_table *sgt);
+int ivpu_mmu_context_set_pages_ro(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
+				  u64 vpu_addr, size_t size);
 
 #endif /* __IVPU_MMU_CONTEXT_H__ */
-- 
2.45.1

