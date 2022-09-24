Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7803D5E8DBD
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 17:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF1F10E615;
	Sat, 24 Sep 2022 15:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7545010E607
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 15:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664032324; x=1695568324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EnpHeTbsS4bwMTDPM0xyIAX58Zgo83wqFikskr7UCFs=;
 b=RaDblXqANjgBBiGQaV1LP8Bp7+CvJghH/0NEmBN6KU1HO5f3zfWYkf6B
 nvg9ub3IcV1jj0SH5dX9vB9wMVx0HnZV0DUtfH8UV6ARhPt50DUDo06Hi
 e3XBsM3onRrxEX3zMC7gV1dwUANQ7lqxjEjabx9/2k49Qz9UsLunaMqBO
 ZFhZ/bSIicJqVePDwHDkl3gPmRvjcRIPcTXYKB5TLmX2MWrkxKg72sST/
 wWf46vt5Z4E+0chhNJxDhW9VlATM4cXK7ViY7qu7sQfzikV2Ja3Pr1+MO
 QcsL0s2GGDPRwRNVBeyMU+PkbjgdvK2sUtZFA41elNRncztruAJH6FKDV g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10480"; a="298383673"
X-IronPort-AV: E=Sophos;i="5.93,342,1654585200"; d="scan'208";a="298383673"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2022 08:12:04 -0700
X-IronPort-AV: E=Sophos;i="5.93,342,1654585200"; d="scan'208";a="571707880"
Received: from jlawryno-desktop.igk.intel.com ([172.22.229.64])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2022 08:12:02 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH v3 5/7] drm/ivpu: Implement firmware parsing and booting
Date: Sat, 24 Sep 2022 17:11:47 +0200
Message-Id: <20220924151149.323622-6-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220924151149.323622-1-jacek.lawrynowicz@linux.intel.com>
References: <20220924151149.323622-1-jacek.lawrynowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: andrzej.kacprowski@linux.intel.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Read, parse and boot VPU firmware image.

Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/gpu/drm/ivpu/Makefile       |   1 +
 drivers/gpu/drm/ivpu/ivpu_drv.c     | 122 +++++++-
 drivers/gpu/drm/ivpu/ivpu_drv.h     |  10 +
 drivers/gpu/drm/ivpu/ivpu_fw.c      | 422 ++++++++++++++++++++++++++++
 drivers/gpu/drm/ivpu/ivpu_fw.h      |  38 +++
 drivers/gpu/drm/ivpu/ivpu_hw_mtl.c  |  11 +
 drivers/gpu/drm/ivpu/vpu_boot_api.h | 241 ++++++++++++++++
 include/uapi/drm/ivpu_drm.h         |  21 ++
 8 files changed, 865 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_fw.c
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_fw.h
 create mode 100644 drivers/gpu/drm/ivpu/vpu_boot_api.h

diff --git a/drivers/gpu/drm/ivpu/Makefile b/drivers/gpu/drm/ivpu/Makefile
index 4e33860c0dc4..8e9b3ae1a4cc 100644
--- a/drivers/gpu/drm/ivpu/Makefile
+++ b/drivers/gpu/drm/ivpu/Makefile
@@ -3,6 +3,7 @@
 
 intel_vpu-y := \
 	ivpu_drv.o \
+	ivpu_fw.o \
 	ivpu_gem.o \
 	ivpu_hw_mtl.o \
 	ivpu_ipc.o \
diff --git a/drivers/gpu/drm/ivpu/ivpu_drv.c b/drivers/gpu/drm/ivpu/ivpu_drv.c
index b7e2bc54897a..67384671092e 100644
--- a/drivers/gpu/drm/ivpu/ivpu_drv.c
+++ b/drivers/gpu/drm/ivpu/ivpu_drv.c
@@ -13,10 +13,13 @@
 #include <drm/drm_ioctl.h>
 #include <drm/drm_prime.h>
 
+#include "vpu_boot_api.h"
 #include "ivpu_drv.h"
+#include "ivpu_fw.h"
 #include "ivpu_gem.h"
 #include "ivpu_hw.h"
 #include "ivpu_ipc.h"
+#include "ivpu_jsm_msg.h"
 #include "ivpu_mmu.h"
 #include "ivpu_mmu_context.h"
 
@@ -31,6 +34,10 @@ int ivpu_dbg_mask;
 module_param_named(dbg_mask, ivpu_dbg_mask, int, 0644);
 MODULE_PARM_DESC(dbg_mask, "Driver debug mask. See IVPU_DBG_* macros.");
 
+int ivpu_test_mode;
+module_param_named_unsafe(test_mode, ivpu_test_mode, int, 0644);
+MODULE_PARM_DESC(test_mode, "Test mode: 0 - normal operation, 1 - fw unit test, 2 - null hw");
+
 u8 ivpu_pll_min_ratio;
 module_param_named(pll_min_ratio, ivpu_pll_min_ratio, byte, 0644);
 MODULE_PARM_DESC(pll_min_ratio, "Minimum PLL ratio used to set VPU frequency");
@@ -126,6 +133,28 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
 	case DRM_IVPU_PARAM_CONTEXT_ID:
 		args->value = file_priv->ctx.id;
 		break;
+	case DRM_IVPU_PARAM_FW_API_VERSION:
+		if (args->index < VPU_FW_API_VER_NUM) {
+			struct vpu_firmware_header *fw_hdr;
+
+			fw_hdr = (struct vpu_firmware_header *)vdev->fw->file->data;
+			args->value = fw_hdr->api_version[args->index];
+		} else {
+			ret = -EINVAL;
+		}
+		break;
+	case DRM_IVPU_PARAM_ENGINE_HEARTBEAT:
+		ret = ivpu_jsm_get_heartbeat(vdev, args->index, &args->value);
+		break;
+	case DRM_IVPU_PARAM_UNIQUE_INFERENCE_ID:
+		args->value = (u64)atomic64_inc_return(&vdev->unique_id_counter);
+		break;
+	case DRM_IVPU_PARAM_TILE_CONFIG:
+		args->value = vdev->hw->tile_fuse;
+		break;
+	case DRM_IVPU_PARAM_SKU:
+		args->value = vdev->hw->sku;
+		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -197,6 +226,70 @@ static const struct drm_ioctl_desc ivpu_drm_ioctls[] = {
 
 DEFINE_DRM_GEM_FOPS(ivpu_fops);
 
+static int ivpu_wait_for_ready(struct ivpu_device *vdev)
+{
+	struct ivpu_ipc_consumer cons;
+	struct ivpu_ipc_hdr ipc_hdr;
+	unsigned long timeout;
+	int ret;
+
+	if (ivpu_test_mode == IVPU_TEST_MODE_FW_TEST)
+		return 0;
+
+	ivpu_ipc_consumer_add(vdev, &cons, IVPU_IPC_CHAN_BOOT_MSG);
+
+	timeout = jiffies + msecs_to_jiffies(vdev->timeout.boot);
+	while (1) {
+		if (ivpu_ipc_irq_handler(vdev) != IRQ_HANDLED) {
+			ret = -EIO;
+			break;
+		}
+		ret = ivpu_ipc_receive(vdev, &cons, &ipc_hdr, NULL, 0);
+		if (ret != -ETIMEDOUT || time_after_eq(jiffies, timeout))
+			break;
+
+		cond_resched();
+	}
+
+	ivpu_ipc_consumer_del(vdev, &cons);
+
+	if (!ret && ipc_hdr.data_addr != IVPU_IPC_BOOT_MSG_DATA_ADDR) {
+		ivpu_err(vdev, "Invalid VPU ready message: 0x%x\n",
+			 ipc_hdr.data_addr);
+		return -EIO;
+	}
+
+	if (!ret)
+		ivpu_info(vdev, "VPU ready message received successfully\n");
+
+	return ret;
+}
+
+int ivpu_boot(struct ivpu_device *vdev)
+{
+	int ret;
+
+	/* Update boot params located at first 4KB of FW memory */
+	ivpu_fw_boot_params_setup(vdev, vdev->fw->mem->kvaddr);
+
+	ret = ivpu_hw_boot_fw(vdev);
+	if (ret) {
+		ivpu_err(vdev, "Failed to start the firmware: %d\n", ret);
+		return ret;
+	}
+
+	ret = ivpu_wait_for_ready(vdev);
+	if (ret) {
+		ivpu_err(vdev, "Failed to boot the firmware: %d\n", ret);
+		return ret;
+	}
+
+	ivpu_hw_irq_clear(vdev);
+	ivpu_hw_irq_enable(vdev);
+	ivpu_ipc_enable(vdev);
+	return 0;
+}
+
 int ivpu_shutdown(struct ivpu_device *vdev)
 {
 	int ret;
@@ -320,6 +413,10 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	if (!vdev->mmu)
 		return -ENOMEM;
 
+	vdev->fw = devm_kzalloc(vdev->drm.dev, sizeof(*vdev->fw), GFP_KERNEL);
+	if (!vdev->fw)
+		return -ENOMEM;
+
 	vdev->ipc = devm_kzalloc(vdev->drm.dev, sizeof(*vdev->ipc), GFP_KERNEL);
 	if (!vdev->ipc)
 		return -ENOMEM;
@@ -331,6 +428,8 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	vdev->context_xa_limit.min = IVPU_GLOBAL_CONTEXT_MMU_SSID + 1;
 	vdev->context_xa_limit.max = IVPU_CONTEXT_LIMIT;
 
+	atomic64_set(&vdev->unique_id_counter, 0);
+
 	ret = ivpu_pci_init(vdev);
 	if (ret) {
 		ivpu_err(vdev, "Failed to initialize PCI device: %d\n", ret);
@@ -367,14 +466,34 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 		goto err_mmu_gctx_fini;
 	}
 
+	ret = ivpu_fw_init(vdev);
+	if (ret) {
+		ivpu_err(vdev, "Failed to initialize firmware: %d\n", ret);
+		goto err_mmu_fini;
+	}
+
 	ret = ivpu_ipc_init(vdev);
 	if (ret) {
 		ivpu_err(vdev, "Failed to initialize IPC: %d\n", ret);
-		goto err_mmu_fini;
+		goto err_fw_fini;
+	}
+
+	ret = ivpu_fw_load(vdev);
+	if (ret) {
+		ivpu_err(vdev, "Failed to load firmware: %d\n", ret);
+		goto err_fw_fini;
+	}
+
+	ret = ivpu_boot(vdev);
+	if (ret) {
+		ivpu_err(vdev, "Failed to boot: %d\n", ret);
+		goto err_fw_fini;
 	}
 
 	return 0;
 
+err_fw_fini:
+	ivpu_fw_fini(vdev);
 err_mmu_fini:
 	ivpu_mmu_fini(vdev);
 err_mmu_gctx_fini:
@@ -393,6 +512,7 @@ static void ivpu_dev_fini(struct ivpu_device *vdev)
 	ivpu_shutdown(vdev);
 
 	ivpu_ipc_fini(vdev);
+	ivpu_fw_fini(vdev);
 	ivpu_mmu_fini(vdev);
 	ivpu_mmu_global_context_fini(vdev);
 	ivpu_irq_fini(vdev);
diff --git a/drivers/gpu/drm/ivpu/ivpu_drv.h b/drivers/gpu/drm/ivpu/ivpu_drv.h
index 48e5ed442f71..a8ba32f76739 100644
--- a/drivers/gpu/drm/ivpu/ivpu_drv.h
+++ b/drivers/gpu/drm/ivpu/ivpu_drv.h
@@ -73,6 +73,7 @@ struct ivpu_wa_table {
 
 struct ivpu_hw_info;
 struct ivpu_mmu_info;
+struct ivpu_fw_info;
 struct ivpu_ipc_info;
 
 struct ivpu_device {
@@ -85,12 +86,15 @@ struct ivpu_device {
 	struct ivpu_wa_table wa;
 	struct ivpu_hw_info *hw;
 	struct ivpu_mmu_info *mmu;
+	struct ivpu_fw_info *fw;
 	struct ivpu_ipc_info *ipc;
 
 	struct ivpu_mmu_context gctx;
 	struct xarray context_xa;
 	struct xa_limit context_xa_limit;
 
+	atomic64_t unique_id_counter;
+
 	struct {
 		int boot;
 		int jsm;
@@ -111,9 +115,15 @@ extern int ivpu_dbg_mask;
 extern u8 ivpu_pll_min_ratio;
 extern u8 ivpu_pll_max_ratio;
 
+#define IVPU_TEST_MODE_DISABLED  0
+#define IVPU_TEST_MODE_FW_TEST   1
+#define IVPU_TEST_MODE_NULL_HW   2
+extern int ivpu_test_mode;
+
 void ivpu_file_priv_get(struct ivpu_file_priv *file_priv, struct ivpu_file_priv **link);
 void ivpu_file_priv_put(struct ivpu_file_priv **link);
 char *ivpu_platform_to_str(u32 platform);
+int ivpu_boot(struct ivpu_device *vdev);
 int ivpu_shutdown(struct ivpu_device *vdev);
 
 static inline bool ivpu_is_mtl(struct ivpu_device *vdev)
diff --git a/drivers/gpu/drm/ivpu/ivpu_fw.c b/drivers/gpu/drm/ivpu/ivpu_fw.c
new file mode 100644
index 000000000000..d55f13f2daed
--- /dev/null
+++ b/drivers/gpu/drm/ivpu/ivpu_fw.c
@@ -0,0 +1,422 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#include <linux/firmware.h>
+#include <linux/highmem.h>
+#include <linux/moduleparam.h>
+#include <linux/pci.h>
+
+#include "vpu_boot_api.h"
+#include "ivpu_drv.h"
+#include "ivpu_fw.h"
+#include "ivpu_gem.h"
+#include "ivpu_hw.h"
+#include "ivpu_ipc.h"
+
+#define FW_MAX_NAMES		3
+#define FW_GLOBAL_MEM_START	(2ull * SZ_1G)
+#define FW_GLOBAL_MEM_END	(3ull * SZ_1G)
+#define FW_SHARED_MEM_SIZE	SZ_256M /* Must be aligned to FW_SHARED_MEM_ALIGNMENT */
+#define FW_SHARED_MEM_ALIGNMENT	SZ_128K /* VPU MTRR limitation */
+#define FW_RUNTIME_MAX_SIZE	SZ_512M
+#define FW_SHAVE_NN_MAX_SIZE	SZ_2M
+#define FW_RUNTIME_MIN_ADDR	(FW_GLOBAL_MEM_START)
+#define FW_RUNTIME_MAX_ADDR	(FW_GLOBAL_MEM_END - FW_SHARED_MEM_SIZE)
+#define FW_VERSION_HEADER_SIZE	SZ_4K
+#define FW_FILE_IMAGE_OFFSET	(VPU_FW_HEADER_SIZE + FW_VERSION_HEADER_SIZE)
+
+#define WATCHDOG_MSS_REDIRECT	32
+#define WATCHDOG_NCE_REDIRECT	33
+
+#define ADDR_TO_L2_CACHE_CFG(addr) ((addr) >> 31)
+
+#define IVPU_FW_CHECK_API(vdev, fw_hdr, name) ivpu_fw_check_api(vdev, fw_hdr, #name, \
+								  VPU_##name##_API_VER_INDEX, \
+								  VPU_##name##_API_VER_MAJOR, \
+								  VPU_##name##_API_VER_MINOR)
+
+static char *ivpu_firmware;
+module_param_named_unsafe(firmware, ivpu_firmware, charp, 0644);
+MODULE_PARM_DESC(firmware, "VPU firmware binary in /lib/firmware/..");
+
+static int ivpu_fw_request(struct ivpu_device *vdev)
+{
+	const char *fw_names[FW_MAX_NAMES] = {
+		ivpu_firmware,
+		"mtl_vpu.bin",
+		"intel/vpu/mtl_vpu_v0.0.bin"
+	};
+	int ret = -ENOENT;
+	int i;
+
+	for (i = 0; i < FW_MAX_NAMES; i++) {
+		ret = firmware_request_nowarn(&vdev->fw->file, fw_names[i], vdev->drm.dev);
+		if (!ret)
+			return 0;
+	}
+
+	/*
+	 * ENOENT will be returned if KMD is built-in statically and probe happens
+	 * before Root FS is mounted & accessible (before init), KMD will DEFER
+	 * the probe.
+	 */
+	if (ret == -ENOENT)
+		return -EPROBE_DEFER;
+
+	ivpu_err(vdev, "Failed to request firmware: %d\n", ret);
+
+	return ret;
+}
+
+static void
+ivpu_fw_check_api(struct ivpu_device *vdev, const struct vpu_firmware_header *fw_hdr,
+		  const char *str, int index, u16 expected_major, u16 expected_minor)
+{
+	u16 major = (u16)(fw_hdr->api_version[index] >> 16);
+	u16 minor = (u16)(fw_hdr->api_version[index]);
+
+	if (major != expected_major) {
+		ivpu_warn(vdev, "Incompatible FW %s API version: %d.%d (expected %d.%d)\n",
+			  str, major, minor, expected_major, expected_minor);
+	}
+	ivpu_dbg(FW_BOOT, "FW %s API version: %d.%d (expected %d.%d)\n",
+		 str, major, minor, expected_major, expected_minor);
+}
+
+static int ivpu_fw_parse(struct ivpu_device *vdev)
+{
+	struct ivpu_fw_info *fw = vdev->fw;
+	const struct vpu_firmware_header *fw_hdr = (const void *)fw->file->data;
+	u64 runtime_addr, image_load_addr, runtime_size, image_size;
+
+	if (fw->file->size <= FW_FILE_IMAGE_OFFSET) {
+		ivpu_err(vdev, "Firmware file is too small: %zu\n", fw->file->size);
+		return -EINVAL;
+	}
+
+	if (fw_hdr->header_version != VPU_FW_HEADER_VERSION) {
+		ivpu_err(vdev, "Invalid firmware header version: %u\n", fw_hdr->header_version);
+		return -EINVAL;
+	}
+
+	runtime_addr = fw_hdr->boot_params_load_address;
+	runtime_size = fw_hdr->runtime_size;
+	image_load_addr = fw_hdr->image_load_address;
+	image_size = fw_hdr->image_size;
+
+	if (runtime_addr < FW_RUNTIME_MIN_ADDR || runtime_addr > FW_RUNTIME_MAX_ADDR) {
+		ivpu_err(vdev, "Invalid firmware runtime address: 0x%llx\n", runtime_addr);
+		return -EINVAL;
+	}
+
+	if (runtime_size < fw->file->size || runtime_size > FW_RUNTIME_MAX_SIZE) {
+		ivpu_err(vdev, "Invalid firmware runtime size: %llu\n", runtime_size);
+		return -EINVAL;
+	}
+
+	if (FW_FILE_IMAGE_OFFSET + image_size > fw->file->size) {
+		ivpu_err(vdev, "Invalid image size: %llu\n", image_size);
+		return -EINVAL;
+	}
+
+	if (image_load_addr < runtime_addr ||
+	    image_load_addr + image_size > runtime_addr + runtime_size) {
+		ivpu_err(vdev, "Invalid firmware load address size: 0x%llx and size %llu\n",
+			 image_load_addr, image_size);
+		return -EINVAL;
+	}
+
+	if (fw_hdr->shave_nn_fw_size > FW_SHAVE_NN_MAX_SIZE) {
+		ivpu_err(vdev, "SHAVE NN firmware is too big: %u\n", fw_hdr->shave_nn_fw_size);
+		return -EINVAL;
+	}
+
+	if (fw_hdr->entry_point < image_load_addr ||
+	    fw_hdr->entry_point >= image_load_addr + image_size) {
+		ivpu_err(vdev, "Invalid entry point: 0x%llx\n", fw_hdr->entry_point);
+		return -EINVAL;
+	}
+
+	fw->runtime_addr = runtime_addr;
+	fw->runtime_size = runtime_size;
+	fw->image_load_offset = image_load_addr - runtime_addr;
+	fw->image_size = image_size;
+	fw->shave_nn_size = PAGE_ALIGN(fw_hdr->shave_nn_fw_size);
+
+	fw->cold_boot_entry_point = fw_hdr->entry_point;
+	fw->entry_point = fw->cold_boot_entry_point;
+
+	ivpu_dbg(FW_BOOT, "Header version: 0x%x, format 0x%x\n",
+		 fw_hdr->header_version, fw_hdr->image_format);
+	ivpu_dbg(FW_BOOT, "Size: file %lu image %u runtime %u shavenn %u\n",
+		 fw->file->size, fw->image_size, fw->runtime_size, fw->shave_nn_size);
+	ivpu_dbg(FW_BOOT, "Address: runtime 0x%llx, load 0x%llx, entry point 0x%llx\n",
+		 fw->runtime_addr, image_load_addr, fw->entry_point);
+	ivpu_dbg(FW_BOOT, "FW version: %s\n", (char *)fw_hdr + VPU_FW_HEADER_SIZE);
+
+	IVPU_FW_CHECK_API(vdev, fw_hdr, BOOT);
+	IVPU_FW_CHECK_API(vdev, fw_hdr, JSM);
+
+	return 0;
+}
+
+static void ivpu_fw_release(struct ivpu_device *vdev)
+{
+	release_firmware(vdev->fw->file);
+}
+
+static int ivpu_fw_update_global_range(struct ivpu_device *vdev)
+{
+	struct ivpu_fw_info *fw = vdev->fw;
+	u64 start = ALIGN(fw->runtime_addr + fw->runtime_size, FW_SHARED_MEM_ALIGNMENT);
+	u64 size = FW_SHARED_MEM_SIZE;
+
+	if (start + size > FW_GLOBAL_MEM_END) {
+		ivpu_err(vdev, "No space for shared region, start %lld, size %lld\n", start, size);
+		return -EINVAL;
+	}
+
+	ivpu_hw_init_range(&vdev->hw->ranges.global_low, start, size);
+	return 0;
+}
+
+static int ivpu_fw_mem_init(struct ivpu_device *vdev)
+{
+	struct ivpu_fw_info *fw = vdev->fw;
+	int ret;
+
+	ret = ivpu_fw_update_global_range(vdev);
+	if (ret)
+		return ret;
+
+	fw->mem = ivpu_bo_alloc_internal(vdev, fw->runtime_addr, fw->runtime_size, DRM_IVPU_BO_WC);
+	if (!fw->mem) {
+		ivpu_err(vdev, "Failed to allocate firmware runtime memory\n");
+		return -ENOMEM;
+	}
+
+	if (fw->shave_nn_size) {
+		fw->mem_shave_nn = ivpu_bo_alloc_internal(vdev, vdev->hw->ranges.global_high.start,
+							  fw->shave_nn_size, DRM_IVPU_BO_UNCACHED);
+		if (!fw->mem_shave_nn) {
+			ivpu_err(vdev, "Failed to allocate shavenn buffer\n");
+			ivpu_bo_free_internal(fw->mem);
+			return -ENOMEM;
+		}
+	}
+
+	return 0;
+}
+
+static void ivpu_fw_mem_fini(struct ivpu_device *vdev)
+{
+	struct ivpu_fw_info *fw = vdev->fw;
+
+	if (fw->mem_shave_nn) {
+		ivpu_bo_free_internal(fw->mem_shave_nn);
+		fw->mem_shave_nn = NULL;
+	}
+
+	ivpu_bo_free_internal(fw->mem);
+	fw->mem = NULL;
+}
+
+int ivpu_fw_init(struct ivpu_device *vdev)
+{
+	int ret;
+
+	ret = ivpu_fw_request(vdev);
+	if (ret)
+		return ret;
+
+	ret = ivpu_fw_parse(vdev);
+	if (ret)
+		goto err_fw_release;
+
+	ret = ivpu_fw_mem_init(vdev);
+	if (ret)
+		goto err_fw_release;
+
+	return 0;
+
+err_fw_release:
+	ivpu_fw_release(vdev);
+	return ret;
+}
+
+void ivpu_fw_fini(struct ivpu_device *vdev)
+{
+	ivpu_fw_mem_fini(vdev);
+	ivpu_fw_release(vdev);
+}
+
+int ivpu_fw_load(struct ivpu_device *vdev)
+{
+	struct ivpu_fw_info *fw = vdev->fw;
+	u64 image_end_offset = fw->image_load_offset + fw->image_size;
+
+	memset(fw->mem->kvaddr, 0, fw->image_load_offset);
+	memcpy(fw->mem->kvaddr + fw->image_load_offset,
+	       fw->file->data + FW_FILE_IMAGE_OFFSET, fw->image_size);
+
+	if (IVPU_WA(clear_runtime_mem)) {
+		u8 *start = fw->mem->kvaddr + image_end_offset;
+		u64 size = fw->mem->base.size - image_end_offset;
+
+		memset(start, 0, size);
+	}
+
+	wmb(); /* Flush WC buffers after writing fw->mem */
+
+	return 0;
+}
+
+static void ivpu_fw_boot_params_print(struct ivpu_device *vdev, struct vpu_boot_params *boot_params)
+{
+	ivpu_dbg(FW_BOOT, "boot_params.magic = 0x%x\n",
+		 boot_params->magic);
+	ivpu_dbg(FW_BOOT, "boot_params.vpu_id = 0x%x\n",
+		 boot_params->vpu_id);
+	ivpu_dbg(FW_BOOT, "boot_params.vpu_count = 0x%x\n",
+		 boot_params->vpu_count);
+	ivpu_dbg(FW_BOOT, "boot_params.frequency = %u\n",
+		 boot_params->frequency);
+	ivpu_dbg(FW_BOOT, "boot_params.perf_clk_frequency = %u\n",
+		 boot_params->perf_clk_frequency);
+
+	ivpu_dbg(FW_BOOT, "boot_params.ipc_header_area_start = 0x%llx\n",
+		 boot_params->ipc_header_area_start);
+	ivpu_dbg(FW_BOOT, "boot_params.ipc_header_area_size = 0x%x\n",
+		 boot_params->ipc_header_area_size);
+	ivpu_dbg(FW_BOOT, "boot_params.shared_region_base = 0x%llx\n",
+		 boot_params->shared_region_base);
+	ivpu_dbg(FW_BOOT, "boot_params.shared_region_size = 0x%x\n",
+		 boot_params->shared_region_size);
+	ivpu_dbg(FW_BOOT, "boot_params.ipc_payload_area_start = 0x%llx\n",
+		 boot_params->ipc_payload_area_start);
+	ivpu_dbg(FW_BOOT, "boot_params.ipc_payload_area_size = 0x%x\n",
+		 boot_params->ipc_payload_area_size);
+	ivpu_dbg(FW_BOOT, "boot_params.global_aliased_pio_base = 0x%llx\n",
+		 boot_params->global_aliased_pio_base);
+	ivpu_dbg(FW_BOOT, "boot_params.global_aliased_pio_size = 0x%x\n",
+		 boot_params->global_aliased_pio_size);
+
+	ivpu_dbg(FW_BOOT, "boot_params.autoconfig = 0x%x\n",
+		 boot_params->autoconfig);
+
+	ivpu_dbg(FW_BOOT, "boot_params.cache_defaults[VPU_BOOT_L2_CACHE_CFG_NN].use = 0x%x\n",
+		 boot_params->cache_defaults[VPU_BOOT_L2_CACHE_CFG_NN].use);
+	ivpu_dbg(FW_BOOT, "boot_params.cache_defaults[VPU_BOOT_L2_CACHE_CFG_NN].cfg = 0x%x\n",
+		 boot_params->cache_defaults[VPU_BOOT_L2_CACHE_CFG_NN].cfg);
+
+	ivpu_dbg(FW_BOOT, "boot_params.global_memory_allocator_base = 0x%llx\n",
+		 boot_params->global_memory_allocator_base);
+	ivpu_dbg(FW_BOOT, "boot_params.global_memory_allocator_size = 0x%x\n",
+		 boot_params->global_memory_allocator_size);
+
+	ivpu_dbg(FW_BOOT, "boot_params.shave_nn_fw_base = 0x%llx\n",
+		 boot_params->shave_nn_fw_base);
+
+	ivpu_dbg(FW_BOOT, "boot_params.watchdog_irq_mss = 0x%x\n",
+		 boot_params->watchdog_irq_mss);
+	ivpu_dbg(FW_BOOT, "boot_params.watchdog_irq_nce = 0x%x\n",
+		 boot_params->watchdog_irq_nce);
+	ivpu_dbg(FW_BOOT, "boot_params.host_to_vpu_irq = 0x%x\n",
+		 boot_params->host_to_vpu_irq);
+	ivpu_dbg(FW_BOOT, "boot_params.job_done_irq = 0x%x\n",
+		 boot_params->job_done_irq);
+
+	ivpu_dbg(FW_BOOT, "boot_params.host_version_id = 0x%x\n",
+		 boot_params->host_version_id);
+	ivpu_dbg(FW_BOOT, "boot_params.si_stepping = 0x%x\n",
+		 boot_params->si_stepping);
+	ivpu_dbg(FW_BOOT, "boot_params.vdev_id = 0x%llx\n",
+		 boot_params->device_id);
+	ivpu_dbg(FW_BOOT, "boot_params.feature_exclusion = 0x%llx\n",
+		 boot_params->feature_exclusion);
+	ivpu_dbg(FW_BOOT, "boot_params.sku = 0x%llx\n",
+		 boot_params->sku);
+	ivpu_dbg(FW_BOOT, "boot_params.min_freq_pll_ratio = 0x%x\n",
+		 boot_params->min_freq_pll_ratio);
+	ivpu_dbg(FW_BOOT, "boot_params.max_freq_pll_ratio = 0x%x\n",
+		 boot_params->max_freq_pll_ratio);
+	ivpu_dbg(FW_BOOT, "boot_params.default_trace_level = 0x%x\n",
+		 boot_params->default_trace_level);
+	ivpu_dbg(FW_BOOT, "boot_params.tracing_buff_message_format_mask = 0x%llx\n",
+		 boot_params->tracing_buff_message_format_mask);
+	ivpu_dbg(FW_BOOT, "boot_params.trace_destination_mask = 0x%x\n",
+		 boot_params->trace_destination_mask);
+	ivpu_dbg(FW_BOOT, "boot_params.trace_hw_component_mask = 0x%llx\n",
+		 boot_params->trace_hw_component_mask);
+	ivpu_dbg(FW_BOOT, "boot_params.boot_type = 0x%x\n",
+		 boot_params->boot_type);
+	ivpu_dbg(FW_BOOT, "boot_params.punit_telemetry_sram_base = 0x%llx\n",
+		 boot_params->punit_telemetry_sram_base);
+	ivpu_dbg(FW_BOOT, "boot_params.punit_telemetry_sram_size = 0x%llx\n",
+		 boot_params->punit_telemetry_sram_size);
+	ivpu_dbg(FW_BOOT, "boot_params.vpu_telemetry_enable = 0x%x\n",
+		 boot_params->vpu_telemetry_enable);
+}
+
+void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params *boot_params)
+{
+	struct ivpu_bo *ipc_mem_rx = vdev->ipc->mem_rx;
+
+	/* In case of warm boot we only have to reset the entrypoint addr */
+	if (!ivpu_fw_is_cold_boot(vdev)) {
+		boot_params->save_restore_ret_address = 0;
+		return;
+	}
+
+	boot_params->magic = VPU_BOOT_PARAMS_MAGIC;
+	boot_params->vpu_id = to_pci_dev(vdev->drm.dev)->bus->number;
+	boot_params->frequency = ivpu_hw_reg_pll_freq_get(vdev);
+
+	/*
+	 * Uncached region of VPU address space, covers IPC buffers, job queues
+	 * and log buffers, programmable to L2$ Uncached by VPU MTRR
+	 */
+	boot_params->shared_region_base = vdev->hw->ranges.global_low.start;
+	boot_params->shared_region_size = vdev->hw->ranges.global_low.end -
+					  vdev->hw->ranges.global_low.start;
+
+	boot_params->ipc_header_area_start = ipc_mem_rx->vpu_addr;
+	boot_params->ipc_header_area_size = ipc_mem_rx->base.size / 2;
+
+	boot_params->ipc_payload_area_start = ipc_mem_rx->vpu_addr + ipc_mem_rx->base.size / 2;
+	boot_params->ipc_payload_area_size = ipc_mem_rx->base.size / 2;
+
+	boot_params->global_aliased_pio_base =
+		vdev->hw->ranges.global_aliased_pio.start;
+	boot_params->global_aliased_pio_size =
+		ivpu_hw_range_size(&vdev->hw->ranges.global_aliased_pio);
+
+	/* Allow configuration for L2C_PAGE_TABLE with boot param value */
+	boot_params->autoconfig = 1;
+
+	/* Enable L2 cache for first 2GB of high memory */
+	boot_params->cache_defaults[VPU_BOOT_L2_CACHE_CFG_NN].use = 1;
+	boot_params->cache_defaults[VPU_BOOT_L2_CACHE_CFG_NN].cfg =
+		ADDR_TO_L2_CACHE_CFG(vdev->hw->ranges.global_high.start);
+
+	if (vdev->fw->mem_shave_nn)
+		boot_params->shave_nn_fw_base = vdev->fw->mem_shave_nn->vpu_addr;
+
+	boot_params->watchdog_irq_mss = WATCHDOG_MSS_REDIRECT;
+	boot_params->watchdog_irq_nce = WATCHDOG_NCE_REDIRECT;
+	boot_params->feature_exclusion = vdev->hw->tile_fuse;
+	boot_params->sku = vdev->hw->sku;
+
+	boot_params->min_freq_pll_ratio = vdev->hw->pll.min_ratio;
+	boot_params->max_freq_pll_ratio = vdev->hw->pll.max_ratio;
+
+	boot_params->punit_telemetry_sram_base = ivpu_hw_reg_telemetry_offset_get(vdev);
+	boot_params->punit_telemetry_sram_size = ivpu_hw_reg_telemetry_size_get(vdev);
+	boot_params->vpu_telemetry_enable = ivpu_hw_reg_telemetry_enable_get(vdev);
+
+	wmb(); /* Flush WC buffers after writing bootparams */
+
+	ivpu_fw_boot_params_print(vdev, boot_params);
+}
diff --git a/drivers/gpu/drm/ivpu/ivpu_fw.h b/drivers/gpu/drm/ivpu/ivpu_fw.h
new file mode 100644
index 000000000000..8358eb179c4e
--- /dev/null
+++ b/drivers/gpu/drm/ivpu/ivpu_fw.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#ifndef __IVPU_FW_H__
+#define __IVPU_FW_H__
+
+struct ivpu_device;
+struct ivpu_bo;
+struct vpu_boot_params;
+
+struct ivpu_fw_info {
+	const struct firmware *file;
+	struct ivpu_bo *mem;
+	struct ivpu_bo *mem_shave_nn;
+	struct ivpu_bo *mem_log_crit;
+	struct ivpu_bo *mem_log_verb;
+	u64 runtime_addr;
+	u32 runtime_size;
+	u64 image_load_offset;
+	u32 image_size;
+	u32 shave_nn_size;
+	u64 entry_point; /* Cold or warm boot entry point for next boot */
+	u64 cold_boot_entry_point;
+};
+
+int ivpu_fw_init(struct ivpu_device *vdev);
+void ivpu_fw_fini(struct ivpu_device *vdev);
+int ivpu_fw_load(struct ivpu_device *vdev);
+void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params *bp);
+
+static inline bool ivpu_fw_is_cold_boot(struct ivpu_device *vdev)
+{
+	return vdev->fw->entry_point == vdev->fw->cold_boot_entry_point;
+}
+
+#endif /* __IVPU_FW_H__ */
diff --git a/drivers/gpu/drm/ivpu/ivpu_hw_mtl.c b/drivers/gpu/drm/ivpu/ivpu_hw_mtl.c
index 5e31aec36bfa..e20bd839290b 100644
--- a/drivers/gpu/drm/ivpu/ivpu_hw_mtl.c
+++ b/drivers/gpu/drm/ivpu/ivpu_hw_mtl.c
@@ -4,6 +4,7 @@
  */
 
 #include "ivpu_drv.h"
+#include "ivpu_fw.h"
 #include "ivpu_hw_mtl_reg.h"
 #include "ivpu_hw_reg_io.h"
 #include "ivpu_hw.h"
@@ -583,6 +584,16 @@ static void ivpu_boot_soc_cpu_boot(struct ivpu_device *vdev)
 
 	val = REG_CLR_FLD(MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC, IRQI_RESUME0, val);
 	REGV_WR32(MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC, val);
+
+	val = vdev->fw->entry_point >> 9;
+	REGV_WR32(MTL_VPU_HOST_SS_LOADING_ADDRESS_LO, val);
+
+	val = REG_SET_FLD(MTL_VPU_HOST_SS_LOADING_ADDRESS_LO, DONE, val);
+	REGV_WR32(MTL_VPU_HOST_SS_LOADING_ADDRESS_LO, val);
+
+	ivpu_dbg(PM, "Booting firmware, mode: %s\n",
+		 vdev->fw->entry_point == vdev->fw->cold_boot_entry_point ?
+		 "cold boot" : "resume");
 }
 
 static int ivpu_boot_d0i3_drive(struct ivpu_device *vdev, bool enable)
diff --git a/drivers/gpu/drm/ivpu/vpu_boot_api.h b/drivers/gpu/drm/ivpu/vpu_boot_api.h
new file mode 100644
index 000000000000..bef6e93fc492
--- /dev/null
+++ b/drivers/gpu/drm/ivpu/vpu_boot_api.h
@@ -0,0 +1,241 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#ifndef VPU_BOOT_API_H
+#define VPU_BOOT_API_H
+
+/*
+ * =========== FW API version information beginning ================
+ * The below values will be used to construct the version info this way:
+ * fw_bin_header->api_version[VPU_BOOT_API_VER_ID] = (VPU_BOOT_API_VER_MAJOR << 16) |
+ * VPU_BOOT_API_VER_MINOR; VPU_BOOT_API_VER_PATCH will be ignored.
+ */
+
+/*
+ * Major version changes that break backward compatibility.
+ * Major version must start from 1 and can only be incremented.
+ */
+#define VPU_BOOT_API_VER_MAJOR 3
+
+/*
+ * Minor version changes when API backward compatibility is preserved.
+ * Resets to 0 if Major version is incremented.
+ */
+#define VPU_BOOT_API_VER_MINOR 11
+
+/*
+ * API header changed (field names, documentation, formatting) but API itself has not been changed
+ */
+#define VPU_BOOT_API_VER_PATCH 1
+
+/*
+ * Index in the API version table
+ * Must be unique for each API
+ */
+#define VPU_BOOT_API_VER_INDEX 0
+/* ------------ FW API version information end ---------------------*/
+
+#pragma pack(push, 1)
+
+/* Firmware image header format */
+#define VPU_FW_HEADER_SIZE    4096
+#define VPU_FW_HEADER_VERSION 0x1
+#define VPU_FW_VERSION_SIZE   32
+#define VPU_FW_API_VER_NUM    16
+
+struct vpu_firmware_header {
+	u32 header_version;
+	u32 image_format;
+	u64 image_load_address;
+	u32 image_size;
+	u64 entry_point;
+	u8 vpu_version[VPU_FW_VERSION_SIZE];
+	u32 compression_type;
+	u64 firmware_version_load_address;
+	u32 firmware_version_size;
+	u64 boot_params_load_address;
+	u32 api_version[VPU_FW_API_VER_NUM];
+	/* Size of memory require for firmware execution */
+	u32 runtime_size;
+	u32 shave_nn_fw_size;
+};
+
+/* Firmware boot parameters format */
+#define VPU_BOOT_PLL_COUNT     3
+#define VPU_BOOT_PLL_OUT_COUNT 4
+
+/* Values for boot_type field */
+#define VPU_BOOT_TYPE_COLDBOOT 0
+#define VPU_BOOT_TYPE_WARMBOOT 1
+
+/* Value for magic filed */
+#define VPU_BOOT_PARAMS_MAGIC 0x10000
+
+/* VPU scheduling mode. By default, OS scheduling is used. */
+#define VPU_SCHEDULING_MODE_OS 0
+#define VPU_SCHEDULING_MODE_HW 1
+
+enum VPU_BOOT_L2_CACHE_CFG_TYPE {
+	VPU_BOOT_L2_CACHE_CFG_UPA = 0,
+	VPU_BOOT_L2_CACHE_CFG_NN = 1,
+	VPU_BOOT_L2_CACHE_CFG_NUM = 2
+};
+
+/**
+ * Logging destinations.
+ *
+ * Logging output can be directed to different logging destinations. This enum
+ * defines the list of logging destinations supported by the VPU firmware (NOTE:
+ * a specific VPU FW binary may support only a subset of such output
+ * destinations, depending on the target platform and compile options).
+ */
+enum vpu_trace_destination {
+	VPU_TRACE_DESTINATION_PIPEPRINT = 0x1,
+	VPU_TRACE_DESTINATION_VERBOSE_TRACING = 0x2,
+	VPU_TRACE_DESTINATION_NORTH_PEAK = 0x4,
+};
+
+struct vpu_boot_l2_cache_config {
+	u8 use;
+	u8 cfg;
+};
+
+struct vpu_warm_boot_section {
+	u32 src;
+	u32 dst;
+	u32 size;
+	u32 core_id;
+	u32 is_clear_op;
+};
+
+struct vpu_boot_params {
+	u32 magic;
+	u32 vpu_id;
+	u32 vpu_count;
+	u32 pad0[5];
+	/* Clock frequencies: 0x20 - 0xFF */
+	u32 frequency;
+	u32 pll[VPU_BOOT_PLL_COUNT][VPU_BOOT_PLL_OUT_COUNT];
+	u32 perf_clk_frequency;
+	u32 pad1[42];
+	/* Memory regions: 0x100 - 0x1FF */
+	u64 ipc_header_area_start;
+	u32 ipc_header_area_size;
+	u64 shared_region_base;
+	u32 shared_region_size;
+	u64 ipc_payload_area_start;
+	u32 ipc_payload_area_size;
+	u64 global_aliased_pio_base;
+	u32 global_aliased_pio_size;
+	u32 autoconfig;
+	struct vpu_boot_l2_cache_config cache_defaults[VPU_BOOT_L2_CACHE_CFG_NUM];
+	u64 global_memory_allocator_base;
+	u32 global_memory_allocator_size;
+	/*
+	 * ShaveNN FW section VPU base address
+	 * On VPU2.7 HW this address must be within 2GB range starting from L2C_PAGE_TABLE base
+	 */
+	u64 shave_nn_fw_base;
+	u64 save_restore_ret_address; /* stores the address of FW's restore entry point */
+	u32 pad2[43];
+	/* IRQ re-direct numbers: 0x200 - 0x2FF */
+	s32 watchdog_irq_mss;
+	s32 watchdog_irq_nce;
+	/* ARM -> VPU doorbell interrupt. ARM is notifying VPU of async command or compute job. */
+	u32 host_to_vpu_irq;
+	/* VPU -> ARM job done interrupt. VPU is notifying ARM of compute job completion. */
+	u32 job_done_irq;
+	/* VPU -> ARM IRQ line to use to request MMU update. */
+	u32 mmu_update_request_irq;
+	/* ARM -> VPU IRQ line to use to notify of MMU update completion. */
+	u32 mmu_update_done_irq;
+	/* ARM -> VPU IRQ line to use to request power level change. */
+	u32 set_power_level_irq;
+	/* VPU -> ARM IRQ line to use to notify of power level change completion. */
+	u32 set_power_level_done_irq;
+	/* VPU -> ARM IRQ line to use to notify of VPU idle state change */
+	u32 set_vpu_idle_update_irq;
+	/* VPU -> ARM IRQ line to use to request counter reset. */
+	u32 metric_query_event_irq;
+	/* ARM -> VPU IRQ line to use to notify of counter reset completion. */
+	u32 metric_query_event_done_irq;
+	/* VPU -> ARM IRQ line to use to notify of preemption completion. */
+	u32 preemption_done_irq;
+	/* Padding. */
+	u32 pad3[52];
+	/* Silicon information: 0x300 - 0x3FF */
+	u32 host_version_id;
+	u32 si_stepping;
+	u64 device_id;
+	u64 feature_exclusion;
+	u64 sku;
+	u32 min_freq_pll_ratio;
+	u32 max_freq_pll_ratio;
+	/**
+	 * Initial log level threshold (messages with log level severity less than
+	 * the threshold will not be logged); applies to every enabled logging
+	 * destination and loggable HW component. See 'mvLog_t' enum for acceptable
+	 * values.
+	 */
+	u32 default_trace_level;
+	u32 boot_type;
+	u64 punit_telemetry_sram_base;
+	u64 punit_telemetry_sram_size;
+	u32 vpu_telemetry_enable;
+	u64 crit_tracing_buff_addr;
+	u32 crit_tracing_buff_size;
+	u64 verbose_tracing_buff_addr;
+	u32 verbose_tracing_buff_size;
+	u64 verbose_tracing_sw_component_mask; /* TO BE REMOVED */
+	/**
+	 * Mask of destinations to which logging messages are delivered; bitwise OR
+	 * of values defined in vpu_trace_destination enum.
+	 */
+	u32 trace_destination_mask;
+	/**
+	 * Mask of hardware components for which logging is enabled; bitwise OR of
+	 * bits defined by the VPU_TRACE_PROC_BIT_* macros.
+	 */
+	u64 trace_hw_component_mask;
+	/** Mask of trace message formats supported by the driver */
+	u64 tracing_buff_message_format_mask;
+	u64 trace_reserved_1[2];
+	/**
+	 * Period at which the VPU reads the temp sensor values into MMIO, on
+	 * platforms where that is necessary (in ms). 0 to disable reads.
+	 */
+	u32 temp_sensor_period_ms;
+	u32 pad4[29];
+	/* Warm boot information: 0x400 - 0x43F */
+	u32 warm_boot_sections_count;
+	u32 warm_boot_start_address_reference;
+	u32 warm_boot_section_info_address_offset;
+	u32 pad5[13];
+	/* Power States transitions timestamps: 0x440 - 0x46F*/
+	struct {
+		/* VPU_IDLE -> VPU_ACTIVE transition initiated timestamp */
+		u64 vpu_active_state_requested;
+		/* VPU_IDLE -> VPU_ACTIVE transition completed timestamp */
+		u64 vpu_active_state_achieved;
+		/* VPU_ACTIVE -> VPU_IDLE transition initiated timestamp */
+		u64 vpu_idle_state_requested;
+		/* VPU_ACTIVE -> VPU_IDLE transition completed timestamp */
+		u64 vpu_idle_state_achieved;
+		/* VPU_IDLE -> VPU_STANDBY transition initiated timestamp */
+		u64 vpu_standby_state_requested;
+		/* VPU_IDLE -> VPU_STANDBY transition completed timestamp */
+		u64 vpu_standby_state_achieved;
+	} power_states_timestamps;
+	/* VPU scheduling mode. Values defined by VPU_SCHEDULING_MODE_* macros. */
+	u32 vpu_scheduling_mode;
+	/* Present call period in milliseconds. */
+	u32 vpu_focus_present_timer_ms;
+	/* Unused/reserved: 0x478 - 0xFFF */
+	u32 pad6[738];
+};
+
+#pragma pack(pop)
+
+#endif
diff --git a/include/uapi/drm/ivpu_drm.h b/include/uapi/drm/ivpu_drm.h
index 388e0d1df906..8d7f5d34c0f5 100644
--- a/include/uapi/drm/ivpu_drm.h
+++ b/include/uapi/drm/ivpu_drm.h
@@ -51,6 +51,11 @@ extern "C" {
 #define DRM_IVPU_PARAM_CONTEXT_BASE_ADDRESS 5
 #define DRM_IVPU_PARAM_CONTEXT_PRIORITY	    6
 #define DRM_IVPU_PARAM_CONTEXT_ID	    7
+#define DRM_IVPU_PARAM_FW_API_VERSION	    8
+#define DRM_IVPU_PARAM_ENGINE_HEARTBEAT	    9
+#define DRM_IVPU_PARAM_UNIQUE_INFERENCE_ID  10
+#define DRM_IVPU_PARAM_TILE_CONFIG	    11
+#define DRM_IVPU_PARAM_SKU		    12
 
 #define DRM_IVPU_PLATFORM_TYPE_SILICON	    0
 
@@ -94,6 +99,22 @@ struct drm_ivpu_param {
 	 * %DRM_IVPU_PARAM_CONTEXT_ID:
 	 * Current context ID, always greater than 0 (read-only)
 	 *
+	 * %DRM_IVPU_PARAM_FW_API_VERSION:
+	 * Firmware API version array (read-only)
+	 *
+	 * %DRM_IVPU_PARAM_ENGINE_HEARTBEAT:
+	 * Heartbeat value from an engine (read-only).
+	 * Engine ID (i.e. DRM_IVPU_ENGINE_COMPUTE) is given via index.
+	 *
+	 * %DRM_IVPU_PARAM_UNIQUE_INFERENCE_ID:
+	 * Device-unique inference ID (read-only)
+	 *
+	 * %DRM_IVPU_PARAM_TILE_CONFIG:
+	 * VPU tile configuration  (read-only)
+	 *
+	 * %DRM_IVPU_PARAM_SKU:
+	 * VPU SKU ID (read-only)
+	 *
 	 */
 	__u32 param;
 
-- 
2.34.1

