Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83724B959BB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 13:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A9B10E076;
	Tue, 23 Sep 2025 11:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fg9pznQu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F9310E076
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 11:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758626346; x=1790162346;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vn2YS3XzECgggJ0Mil4PQBYCV2iW9iOpJ7T3AzgmiQY=;
 b=Fg9pznQuejW9AreQGjOu4VMJDLgFDAh12ipwTaxvrD213PV2Lo9sRwhF
 r81TIxAOuIv7V5tYerQdB84Z8NNItJwYpQeNI5k9v0OZzyBjOzd3KfXff
 mZh2Mc8YXE/7e+n6Ky9bK+Cnb32yvY2KDzaodPA7KHqeyRQZphqE9Pv57
 lqbpFhXtaFtjz+V4bEMMlGMFiTq2vfWmXriLdqPLq5eMyEtwz3fvCCSGG
 HtZAIBHG3wLEobksV4CH5cIC8Uhc1N0ZKdQ+lU2wPvthjWyfeRVFrZGTp
 JDBINMsk0QN5KBU/ulf4MsVLOgosxMioId++dzskbRiS0zNuauypik+YI Q==;
X-CSE-ConnectionGUID: CfnkFn5TR2WwJVF2Mx6WFA==
X-CSE-MsgGUID: ce6JuU+HQ9+2ErUIRGLLRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60827512"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="60827512"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 04:19:05 -0700
X-CSE-ConnectionGUID: 63fiaYemSiK6DnX20IK9XQ==
X-CSE-MsgGUID: qkw0+QAaR9Wnlqv7+VRnxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="177118625"
Received: from pl-npu-pc-kwachow.igk.intel.com ([10.91.220.239])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 04:19:04 -0700
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: [PATCH v1] accel/ivpu: Split FW runtime and global memory buffers
Date: Tue, 23 Sep 2025 13:18:55 +0200
Message-ID: <20250923111855.1112087-1-karol.wachowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Split firmware boot parameters (4KB) and FW version (4KB) into dedicated
buffer objects, separating them from the FW runtime memory buffer. This
creates three distinct buffers with independent allocation control.

This enables future modifications, particularly allowing the FW
image memory to be moved into a read-only buffer.

Fix user range starting address from incorrect 0x88000000 (2GB + 128MB)
overlapping global aperture on 37XX to intended 0xa0000000 (2GB + 512MB).
This caused no issues as FW aligned this range to 512MB anyway, but
corrected for consistency.

Convert ivpu_hw_range_init() from inline helper to function with overflow
validation to prevent potential security issues from address range
arithmetic overflows.

Improve readability of ivpu_fw_parse() function, remove unrelated constant
defines and validate firmware header values based on vdev->hw->ranges.

Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
---
v0 -> v1:
Removed duplicate if statement for 37XX in memory_ranges_init().

---
 drivers/accel/ivpu/ivpu_drv.c         |   3 +-
 drivers/accel/ivpu/ivpu_fw.c          | 151 ++++++++++++++++----------
 drivers/accel/ivpu/ivpu_fw.h          |   7 ++
 drivers/accel/ivpu/ivpu_gem.c         |  16 +++
 drivers/accel/ivpu/ivpu_gem.h         |   1 +
 drivers/accel/ivpu/ivpu_hw.c          |  36 ++++--
 drivers/accel/ivpu/ivpu_hw.h          |   9 +-
 drivers/accel/ivpu/ivpu_mmu_context.c |   2 +-
 drivers/accel/ivpu/ivpu_pm.c          |   2 +-
 9 files changed, 152 insertions(+), 75 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index a08f99c3ba4a..1792d0bbec71 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -380,8 +380,7 @@ int ivpu_boot(struct ivpu_device *vdev)
 	drm_WARN_ON(&vdev->drm, atomic_read(&vdev->job_timeout_counter));
 	drm_WARN_ON(&vdev->drm, !xa_empty(&vdev->submitted_jobs_xa));
 
-	/* Update boot params located at first 4KB of FW memory */
-	ivpu_fw_boot_params_setup(vdev, ivpu_bo_vaddr(vdev->fw->mem));
+	ivpu_fw_boot_params_setup(vdev, ivpu_bo_vaddr(vdev->fw->mem_bp));
 
 	ret = ivpu_hw_boot_fw(vdev);
 	if (ret) {
diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 32f513499829..812e1948a8c0 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -17,14 +17,7 @@
 #include "ivpu_ipc.h"
 #include "ivpu_pm.h"
 
-#define FW_GLOBAL_MEM_START	(2ull * SZ_1G)
-#define FW_GLOBAL_MEM_END	(3ull * SZ_1G)
-#define FW_SHARED_MEM_SIZE	SZ_256M /* Must be aligned to FW_SHARED_MEM_ALIGNMENT */
-#define FW_SHARED_MEM_ALIGNMENT	SZ_128K /* VPU MTRR limitation */
-#define FW_RUNTIME_MAX_SIZE	SZ_512M
 #define FW_SHAVE_NN_MAX_SIZE	SZ_2M
-#define FW_RUNTIME_MIN_ADDR	(FW_GLOBAL_MEM_START)
-#define FW_RUNTIME_MAX_ADDR	(FW_GLOBAL_MEM_END - FW_SHARED_MEM_SIZE)
 #define FW_FILE_IMAGE_OFFSET	(VPU_FW_HEADER_SIZE + FW_VERSION_HEADER_SIZE)
 #define FW_PREEMPT_BUF_MIN_SIZE SZ_4K
 #define FW_PREEMPT_BUF_MAX_SIZE SZ_32M
@@ -133,9 +126,14 @@ ivpu_fw_check_api_ver_lt(struct ivpu_device *vdev, const struct vpu_firmware_hea
 	return false;
 }
 
-static bool is_within_range(u64 addr, size_t size, u64 range_start, size_t range_size)
+bool ivpu_is_within_range(u64 addr, size_t size, struct ivpu_addr_range *range)
 {
-	if (addr < range_start || addr + size > range_start + range_size)
+	u64 addr_end;
+
+	if (!range || check_add_overflow(addr, size, &addr_end))
+		return false;
+
+	if (addr < range->start || addr_end > range->end)
 		return false;
 
 	return true;
@@ -198,7 +196,11 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
 {
 	struct ivpu_fw_info *fw = vdev->fw;
 	const struct vpu_firmware_header *fw_hdr = (const void *)fw->file->data;
-	u64 runtime_addr, image_load_addr, runtime_size, image_size;
+	struct ivpu_addr_range fw_image_range;
+	u64 boot_params_addr, boot_params_size;
+	u64 fw_version_addr, fw_version_size;
+	u64 runtime_addr, runtime_size;
+	u64 image_load_addr, image_size;
 
 	if (fw->file->size <= FW_FILE_IMAGE_OFFSET) {
 		ivpu_err(vdev, "Firmware file is too small: %zu\n", fw->file->size);
@@ -210,18 +212,37 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
 		return -EINVAL;
 	}
 
-	runtime_addr = fw_hdr->boot_params_load_address;
-	runtime_size = fw_hdr->runtime_size;
-	image_load_addr = fw_hdr->image_load_address;
-	image_size = fw_hdr->image_size;
+	boot_params_addr = fw_hdr->boot_params_load_address;
+	boot_params_size = SZ_4K;
 
-	if (runtime_addr < FW_RUNTIME_MIN_ADDR || runtime_addr > FW_RUNTIME_MAX_ADDR) {
-		ivpu_err(vdev, "Invalid firmware runtime address: 0x%llx\n", runtime_addr);
+	if (!ivpu_is_within_range(boot_params_addr, boot_params_size, &vdev->hw->ranges.runtime)) {
+		ivpu_err(vdev, "Invalid boot params address: 0x%llx\n", boot_params_addr);
 		return -EINVAL;
 	}
 
-	if (runtime_size < fw->file->size || runtime_size > FW_RUNTIME_MAX_SIZE) {
-		ivpu_err(vdev, "Invalid firmware runtime size: %llu\n", runtime_size);
+	fw_version_addr = fw_hdr->firmware_version_load_address;
+	fw_version_size = ALIGN(fw_hdr->firmware_version_size, SZ_4K);
+
+	if (fw_version_size != SZ_4K) {
+		ivpu_err(vdev, "Invalid firmware version size: %u\n",
+			 fw_hdr->firmware_version_size);
+		return -EINVAL;
+	}
+
+	if (!ivpu_is_within_range(fw_version_addr, fw_version_size, &vdev->hw->ranges.runtime)) {
+		ivpu_err(vdev, "Invalid firmware version address: 0x%llx\n", fw_version_addr);
+		return -EINVAL;
+	}
+
+	runtime_addr = fw_hdr->image_load_address;
+	runtime_size = fw_hdr->runtime_size - boot_params_size - fw_version_size;
+
+	image_load_addr = fw_hdr->image_load_address;
+	image_size = fw_hdr->image_size;
+
+	if (!ivpu_is_within_range(runtime_addr, runtime_size, &vdev->hw->ranges.runtime)) {
+		ivpu_err(vdev, "Invalid firmware runtime address: 0x%llx and size %llu\n",
+			 runtime_addr, runtime_size);
 		return -EINVAL;
 	}
 
@@ -230,23 +251,25 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
 		return -EINVAL;
 	}
 
-	if (image_load_addr < runtime_addr ||
-	    image_load_addr + image_size > runtime_addr + runtime_size) {
-		ivpu_err(vdev, "Invalid firmware load address size: 0x%llx and size %llu\n",
+	if (!ivpu_is_within_range(image_load_addr, image_size, &vdev->hw->ranges.runtime)) {
+		ivpu_err(vdev, "Invalid firmware load address: 0x%llx and size %llu\n",
 			 image_load_addr, image_size);
 		return -EINVAL;
 	}
 
-	if (fw_hdr->shave_nn_fw_size > FW_SHAVE_NN_MAX_SIZE) {
-		ivpu_err(vdev, "SHAVE NN firmware is too big: %u\n", fw_hdr->shave_nn_fw_size);
+	fw_image_range.start = image_load_addr;
+	fw_image_range.end = image_load_addr + image_size;
+
+	if (!ivpu_is_within_range(fw_hdr->entry_point, 0, &fw_image_range)) {
+		ivpu_err(vdev, "Invalid entry point: 0x%llx\n", fw_hdr->entry_point);
 		return -EINVAL;
 	}
 
-	if (fw_hdr->entry_point < image_load_addr ||
-	    fw_hdr->entry_point >= image_load_addr + image_size) {
-		ivpu_err(vdev, "Invalid entry point: 0x%llx\n", fw_hdr->entry_point);
+	if (fw_hdr->shave_nn_fw_size > FW_SHAVE_NN_MAX_SIZE) {
+		ivpu_err(vdev, "SHAVE NN firmware is too big: %u\n", fw_hdr->shave_nn_fw_size);
 		return -EINVAL;
 	}
+
 	ivpu_dbg(vdev, FW_BOOT, "Header version: 0x%x, format 0x%x\n",
 		 fw_hdr->header_version, fw_hdr->image_format);
 
@@ -260,6 +283,10 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
 	if (IVPU_FW_CHECK_API_COMPAT(vdev, fw_hdr, JSM, 3))
 		return -EINVAL;
 
+	fw->boot_params_addr = boot_params_addr;
+	fw->boot_params_size = boot_params_size;
+	fw->fw_version_addr = fw_version_addr;
+	fw->fw_version_size = fw_version_size;
 	fw->runtime_addr = runtime_addr;
 	fw->runtime_size = runtime_size;
 	fw->image_load_offset = image_load_addr - runtime_addr;
@@ -282,10 +309,9 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
 	ivpu_dbg(vdev, FW_BOOT, "Mid-inference preemption %s supported\n",
 		 ivpu_fw_preempt_buf_size(vdev) ? "is" : "is not");
 
-	if (fw_hdr->ro_section_start_address && !is_within_range(fw_hdr->ro_section_start_address,
-								 fw_hdr->ro_section_size,
-								 fw_hdr->image_load_address,
-								 fw_hdr->image_size)) {
+	if (fw_hdr->ro_section_start_address &&
+	    !ivpu_is_within_range(fw_hdr->ro_section_start_address, fw_hdr->ro_section_size,
+				  &fw_image_range)) {
 		ivpu_err(vdev, "Invalid read-only section: start address 0x%llx, size %u\n",
 			 fw_hdr->ro_section_start_address, fw_hdr->ro_section_size);
 		return -EINVAL;
@@ -294,12 +320,18 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
 	fw->read_only_addr = fw_hdr->ro_section_start_address;
 	fw->read_only_size = fw_hdr->ro_section_size;
 
-	ivpu_dbg(vdev, FW_BOOT, "Size: file %lu image %u runtime %u shavenn %u\n",
-		 fw->file->size, fw->image_size, fw->runtime_size, fw->shave_nn_size);
-	ivpu_dbg(vdev, FW_BOOT, "Address: runtime 0x%llx, load 0x%llx, entry point 0x%llx\n",
-		 fw->runtime_addr, image_load_addr, fw->entry_point);
+	ivpu_dbg(vdev, FW_BOOT, "Boot params: address 0x%llx, size %llu\n",
+		 fw->boot_params_addr, fw->boot_params_size);
+	ivpu_dbg(vdev, FW_BOOT, "FW version:  address 0x%llx, size %llu\n",
+		 fw->fw_version_addr, fw->fw_version_size);
+	ivpu_dbg(vdev, FW_BOOT, "Runtime:     address 0x%llx, size %u\n",
+		 fw->runtime_addr, fw->runtime_size);
+	ivpu_dbg(vdev, FW_BOOT, "Image load offset: 0x%llx, size %u\n",
+		 fw->image_load_offset, fw->image_size);
 	ivpu_dbg(vdev, FW_BOOT, "Read-only section: address 0x%llx, size %u\n",
 		 fw->read_only_addr, fw->read_only_size);
+	ivpu_dbg(vdev, FW_BOOT, "FW entry point: 0x%llx\n", fw->entry_point);
+	ivpu_dbg(vdev, FW_BOOT, "SHAVE NN size: %u\n", fw->shave_nn_size);
 
 	return 0;
 }
@@ -326,39 +358,33 @@ ivpu_fw_init_wa(struct ivpu_device *vdev)
 	IVPU_PRINT_WA(disable_d0i3_msg);
 }
 
-static int ivpu_fw_update_global_range(struct ivpu_device *vdev)
-{
-	struct ivpu_fw_info *fw = vdev->fw;
-	u64 start = ALIGN(fw->runtime_addr + fw->runtime_size, FW_SHARED_MEM_ALIGNMENT);
-	u64 size = FW_SHARED_MEM_SIZE;
-
-	if (start + size > FW_GLOBAL_MEM_END) {
-		ivpu_err(vdev, "No space for shared region, start %lld, size %lld\n", start, size);
-		return -EINVAL;
-	}
-
-	ivpu_hw_range_init(&vdev->hw->ranges.global, start, size);
-	return 0;
-}
-
 static int ivpu_fw_mem_init(struct ivpu_device *vdev)
 {
 	struct ivpu_fw_info *fw = vdev->fw;
-	struct ivpu_addr_range fw_range;
 	int log_verb_size;
 	int ret;
 
-	ret = ivpu_fw_update_global_range(vdev);
-	if (ret)
-		return ret;
+	fw->mem_bp = ivpu_bo_create_runtime(vdev, fw->boot_params_addr, fw->boot_params_size,
+					    DRM_IVPU_BO_WC | DRM_IVPU_BO_MAPPABLE);
+	if (!fw->mem_bp) {
+		ivpu_err(vdev, "Failed to create firmware boot params memory buffer\n");
+		return -ENOMEM;
+	}
 
-	fw_range.start = fw->runtime_addr;
-	fw_range.end = fw->runtime_addr + fw->runtime_size;
-	fw->mem = ivpu_bo_create(vdev, &vdev->gctx, &fw_range, fw->runtime_size,
-				 DRM_IVPU_BO_WC | DRM_IVPU_BO_MAPPABLE);
+	fw->mem_fw_ver = ivpu_bo_create_runtime(vdev, fw->fw_version_addr, fw->fw_version_size,
+						DRM_IVPU_BO_WC | DRM_IVPU_BO_MAPPABLE);
+	if (!fw->mem_fw_ver) {
+		ivpu_err(vdev, "Failed to create firmware version memory buffer\n");
+		ret = -ENOMEM;
+		goto err_free_bp;
+	}
+
+	fw->mem = ivpu_bo_create_runtime(vdev, fw->runtime_addr, fw->runtime_size,
+					 DRM_IVPU_BO_WC | DRM_IVPU_BO_MAPPABLE);
 	if (!fw->mem) {
 		ivpu_err(vdev, "Failed to create firmware runtime memory buffer\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_free_fw_ver;
 	}
 
 	ret = ivpu_mmu_context_set_pages_ro(vdev, &vdev->gctx, fw->read_only_addr,
@@ -407,6 +433,10 @@ static int ivpu_fw_mem_init(struct ivpu_device *vdev)
 	ivpu_bo_free(fw->mem_log_crit);
 err_free_fw_mem:
 	ivpu_bo_free(fw->mem);
+err_free_fw_ver:
+	ivpu_bo_free(fw->mem_fw_ver);
+err_free_bp:
+	ivpu_bo_free(fw->mem_bp);
 	return ret;
 }
 
@@ -422,10 +452,14 @@ static void ivpu_fw_mem_fini(struct ivpu_device *vdev)
 	ivpu_bo_free(fw->mem_log_verb);
 	ivpu_bo_free(fw->mem_log_crit);
 	ivpu_bo_free(fw->mem);
+	ivpu_bo_free(fw->mem_fw_ver);
+	ivpu_bo_free(fw->mem_bp);
 
 	fw->mem_log_verb = NULL;
 	fw->mem_log_crit = NULL;
 	fw->mem = NULL;
+	fw->mem_fw_ver = NULL;
+	fw->mem_bp = NULL;
 }
 
 int ivpu_fw_init(struct ivpu_device *vdev)
@@ -598,6 +632,7 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
 		return;
 	}
 
+	memset(boot_params, 0, sizeof(*boot_params));
 	vdev->pm->is_warmboot = false;
 
 	boot_params->magic = VPU_BOOT_PARAMS_MAGIC;
diff --git a/drivers/accel/ivpu/ivpu_fw.h b/drivers/accel/ivpu/ivpu_fw.h
index 6fe2917abda6..00945892b55e 100644
--- a/drivers/accel/ivpu/ivpu_fw.h
+++ b/drivers/accel/ivpu/ivpu_fw.h
@@ -19,10 +19,16 @@ struct ivpu_fw_info {
 	const struct firmware *file;
 	const char *name;
 	char version[FW_VERSION_STR_SIZE];
+	struct ivpu_bo *mem_bp;
+	struct ivpu_bo *mem_fw_ver;
 	struct ivpu_bo *mem;
 	struct ivpu_bo *mem_shave_nn;
 	struct ivpu_bo *mem_log_crit;
 	struct ivpu_bo *mem_log_verb;
+	u64 boot_params_addr;
+	u64 boot_params_size;
+	u64 fw_version_addr;
+	u64 fw_version_size;
 	u64 runtime_addr;
 	u32 runtime_size;
 	u64 image_load_offset;
@@ -42,6 +48,7 @@ struct ivpu_fw_info {
 	u64 last_heartbeat;
 };
 
+bool ivpu_is_within_range(u64 addr, size_t size, struct ivpu_addr_range *range);
 int ivpu_fw_init(struct ivpu_device *vdev);
 void ivpu_fw_fini(struct ivpu_device *vdev);
 void ivpu_fw_load(struct ivpu_device *vdev);
diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index 59cfcf3eaded..cceb07232e12 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -15,6 +15,7 @@
 #include <drm/drm_utils.h>
 
 #include "ivpu_drv.h"
+#include "ivpu_fw.h"
 #include "ivpu_gem.h"
 #include "ivpu_hw.h"
 #include "ivpu_mmu.h"
@@ -391,6 +392,21 @@ ivpu_bo_create(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 	return NULL;
 }
 
+struct ivpu_bo *ivpu_bo_create_runtime(struct ivpu_device *vdev, u64 addr, u64 size, u32 flags)
+{
+	struct ivpu_addr_range range;
+
+	if (!ivpu_is_within_range(addr, size, &vdev->hw->ranges.runtime)) {
+		ivpu_err(vdev, "Invalid runtime BO address 0x%llx size %llu\n", addr, size);
+		return NULL;
+	}
+
+	if (ivpu_hw_range_init(vdev, &range, addr, size))
+		return NULL;
+
+	return ivpu_bo_create(vdev, &vdev->gctx, &range, size, flags);
+}
+
 struct ivpu_bo *ivpu_bo_create_global(struct ivpu_device *vdev, u64 size, u32 flags)
 {
 	return ivpu_bo_create(vdev, &vdev->gctx, &vdev->hw->ranges.global, size, flags);
diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
index 3ee996d503b2..3a208f3bf0a6 100644
--- a/drivers/accel/ivpu/ivpu_gem.h
+++ b/drivers/accel/ivpu/ivpu_gem.h
@@ -31,6 +31,7 @@ struct drm_gem_object *ivpu_gem_create_object(struct drm_device *dev, size_t siz
 struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf);
 struct ivpu_bo *ivpu_bo_create(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 			       struct ivpu_addr_range *range, u64 size, u32 flags);
+struct ivpu_bo *ivpu_bo_create_runtime(struct ivpu_device *vdev, u64 addr, u64 size, u32 flags);
 struct ivpu_bo *ivpu_bo_create_global(struct ivpu_device *vdev, u64 size, u32 flags);
 void ivpu_bo_free(struct ivpu_bo *bo);
 
diff --git a/drivers/accel/ivpu/ivpu_hw.c b/drivers/accel/ivpu/ivpu_hw.c
index 08dcc31b56f4..8dbf8780920a 100644
--- a/drivers/accel/ivpu/ivpu_hw.c
+++ b/drivers/accel/ivpu/ivpu_hw.c
@@ -20,6 +20,8 @@ module_param_named_unsafe(fail_hw, ivpu_fail_hw, charp, 0444);
 MODULE_PARM_DESC(fail_hw, "<interval>,<probability>,<space>,<times>");
 #endif
 
+#define FW_SHARED_MEM_ALIGNMENT	SZ_512K /* VPU MTRR limitation */
+
 static char *platform_to_str(u32 platform)
 {
 	switch (platform) {
@@ -147,19 +149,39 @@ static void priority_bands_init(struct ivpu_device *vdev)
 	vdev->hw->hws.process_quantum[VPU_JOB_SCHEDULING_PRIORITY_BAND_REALTIME] = 200000;
 }
 
+int ivpu_hw_range_init(struct ivpu_device *vdev, struct ivpu_addr_range *range, u64 start, u64 size)
+{
+	u64 end;
+
+	if (!range || check_add_overflow(start, size, &end)) {
+		ivpu_err(vdev, "Invalid range: start 0x%llx size %llu\n", start, size);
+		return -EINVAL;
+	}
+
+	range->start = start;
+	range->end = end;
+
+	return 0;
+}
+
 static void memory_ranges_init(struct ivpu_device *vdev)
 {
 	if (ivpu_hw_ip_gen(vdev) == IVPU_HW_IP_37XX) {
-		ivpu_hw_range_init(&vdev->hw->ranges.global, 0x80000000, SZ_512M);
-		ivpu_hw_range_init(&vdev->hw->ranges.user,   0x88000000, 511 * SZ_1M);
-		ivpu_hw_range_init(&vdev->hw->ranges.shave, 0x180000000, SZ_2G);
-		ivpu_hw_range_init(&vdev->hw->ranges.dma,   0x200000000, SZ_128G);
+		ivpu_hw_range_init(vdev, &vdev->hw->ranges.runtime, 0x84800000, SZ_64M);
+		ivpu_hw_range_init(vdev, &vdev->hw->ranges.global,  0x90000000, SZ_256M);
+		ivpu_hw_range_init(vdev, &vdev->hw->ranges.user,    0xa0000000, 511 * SZ_1M);
+		ivpu_hw_range_init(vdev, &vdev->hw->ranges.shave,  0x180000000, SZ_2G);
+		ivpu_hw_range_init(vdev, &vdev->hw->ranges.dma,    0x200000000, SZ_128G);
 	} else {
-		ivpu_hw_range_init(&vdev->hw->ranges.global, 0x80000000, SZ_512M);
-		ivpu_hw_range_init(&vdev->hw->ranges.shave,  0x80000000, SZ_2G);
-		ivpu_hw_range_init(&vdev->hw->ranges.user,  0x100000000, SZ_256G);
+		ivpu_hw_range_init(vdev, &vdev->hw->ranges.runtime, 0x80000000, SZ_64M);
+		ivpu_hw_range_init(vdev, &vdev->hw->ranges.global,  0x90000000, SZ_256M);
+		ivpu_hw_range_init(vdev, &vdev->hw->ranges.shave,   0x80000000, SZ_2G);
+		ivpu_hw_range_init(vdev, &vdev->hw->ranges.user,   0x100000000, SZ_256G);
 		vdev->hw->ranges.dma = vdev->hw->ranges.user;
 	}
+
+	drm_WARN_ON(&vdev->drm, !IS_ALIGNED(vdev->hw->ranges.global.start,
+					    FW_SHARED_MEM_ALIGNMENT));
 }
 
 static int wp_enable(struct ivpu_device *vdev)
diff --git a/drivers/accel/ivpu/ivpu_hw.h b/drivers/accel/ivpu/ivpu_hw.h
index d79668fe1609..511a1a29f7f6 100644
--- a/drivers/accel/ivpu/ivpu_hw.h
+++ b/drivers/accel/ivpu/ivpu_hw.h
@@ -21,6 +21,7 @@ struct ivpu_hw_info {
 		bool (*ip_irq_handler)(struct ivpu_device *vdev, int irq);
 	} irq;
 	struct {
+		struct ivpu_addr_range runtime;
 		struct ivpu_addr_range global;
 		struct ivpu_addr_range user;
 		struct ivpu_addr_range shave;
@@ -51,6 +52,8 @@ struct ivpu_hw_info {
 };
 
 int ivpu_hw_init(struct ivpu_device *vdev);
+int ivpu_hw_range_init(struct ivpu_device *vdev, struct ivpu_addr_range *range, u64 start,
+		       u64 size);
 int ivpu_hw_power_up(struct ivpu_device *vdev);
 int ivpu_hw_power_down(struct ivpu_device *vdev);
 int ivpu_hw_reset(struct ivpu_device *vdev);
@@ -71,12 +74,6 @@ static inline u32 ivpu_hw_ip_irq_handler(struct ivpu_device *vdev, int irq)
 	return vdev->hw->irq.ip_irq_handler(vdev, irq);
 }
 
-static inline void ivpu_hw_range_init(struct ivpu_addr_range *range, u64 start, u64 size)
-{
-	range->start = start;
-	range->end = start + size;
-}
-
 static inline u64 ivpu_hw_range_size(const struct ivpu_addr_range *range)
 {
 	return range->end - range->start;
diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
index f0267efa55aa..4ffc783426be 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.c
+++ b/drivers/accel/ivpu/ivpu_mmu_context.c
@@ -568,7 +568,7 @@ void ivpu_mmu_context_init(struct ivpu_device *vdev, struct ivpu_mmu_context *ct
 	mutex_init(&ctx->lock);
 
 	if (!context_id) {
-		start = vdev->hw->ranges.global.start;
+		start = vdev->hw->ranges.runtime.start;
 		end = vdev->hw->ranges.shave.end;
 	} else {
 		start = min_t(u64, vdev->hw->ranges.user.start, vdev->hw->ranges.shave.start);
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 475ddc94f1cf..7514f580eef4 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -54,7 +54,7 @@ static void ivpu_pm_prepare_cold_boot(struct ivpu_device *vdev)
 static void ivpu_pm_prepare_warm_boot(struct ivpu_device *vdev)
 {
 	struct ivpu_fw_info *fw = vdev->fw;
-	struct vpu_boot_params *bp = ivpu_bo_vaddr(fw->mem);
+	struct vpu_boot_params *bp = ivpu_bo_vaddr(fw->mem_bp);
 
 	if (!bp->save_restore_ret_address) {
 		ivpu_pm_prepare_cold_boot(vdev);
-- 
2.43.0

