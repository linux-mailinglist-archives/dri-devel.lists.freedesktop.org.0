Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 667EF583FD0
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 15:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFC114B2EB;
	Thu, 28 Jul 2022 13:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9762C9A685
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 13:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659014258; x=1690550258;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=64kB/3MRqpIXrIheYtlXPIUl6teKO7BzEahOWcI5bsw=;
 b=SoeBChvEik0XVUikQto2FJEDxNzmEwC/9HgIElz1C5NzKSoQNAZr9T+q
 tFWOKp7u/tEODsVhyyrUeF8E79St/Fj1UfIuZPqIIrAHkLdinxH/DaQBu
 pCcS431xmyqdE5gntJ37C6/0HgjkdqkCWgLtPnN6jE5hc5gmW7M77FslL
 cRo0nK6H7yNJWMRMGB7PUDOsYX1hhJKELfaRu4/ixRBB82XwJ1MEDqXnF
 pQVC7DegGYLzmml+sELs+gFVrNwiUkkAAdAKI6sUd/cRTf4O2PWkkEJVk
 XdBRXgNqVI8sOW+8xyEkB4+F967mNeDDKu4NRh42j2sqm7SK8rVLXXvwO Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="288520389"
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="288520389"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 06:17:38 -0700
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="659722675"
Received: from jlawryno-desktop.igk.intel.com ([172.22.229.64])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 06:17:36 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v1 5/7] drm/vpu: Implement firmware parsing and booting
Date: Thu, 28 Jul 2022 15:17:07 +0200
Message-Id: <20220728131709.1087188-6-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220728131709.1087188-1-jacek.lawrynowicz@linux.intel.com>
References: <20220728131709.1087188-1-jacek.lawrynowicz@linux.intel.com>
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
 drivers/gpu/drm/vpu/Makefile       |   1 +
 drivers/gpu/drm/vpu/vpu_boot_api.h | 222 ++++++++++++++++
 drivers/gpu/drm/vpu/vpu_drv.c      | 123 ++++++++-
 drivers/gpu/drm/vpu/vpu_drv.h      |   9 +
 drivers/gpu/drm/vpu/vpu_fw.c       | 413 +++++++++++++++++++++++++++++
 drivers/gpu/drm/vpu/vpu_fw.h       |  38 +++
 drivers/gpu/drm/vpu/vpu_hw_mtl.c   |  11 +
 include/uapi/drm/vpu_drm.h         |  21 ++
 8 files changed, 837 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/vpu/vpu_boot_api.h
 create mode 100644 drivers/gpu/drm/vpu/vpu_fw.c
 create mode 100644 drivers/gpu/drm/vpu/vpu_fw.h

diff --git a/drivers/gpu/drm/vpu/Makefile b/drivers/gpu/drm/vpu/Makefile
index 43cede47c75f..995a3a9c6777 100644
--- a/drivers/gpu/drm/vpu/Makefile
+++ b/drivers/gpu/drm/vpu/Makefile
@@ -3,6 +3,7 @@
 
 intel_vpu-y := \
 	vpu_drv.o \
+	vpu_fw.o \
 	vpu_gem.o \
 	vpu_hw_mtl.o \
 	vpu_ipc.o \
diff --git a/drivers/gpu/drm/vpu/vpu_boot_api.h b/drivers/gpu/drm/vpu/vpu_boot_api.h
new file mode 100644
index 000000000000..b8ab30979b8a
--- /dev/null
+++ b/drivers/gpu/drm/vpu/vpu_boot_api.h
@@ -0,0 +1,222 @@
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
+#define VPU_BOOT_API_VER_MINOR 7
+
+/*
+ * API header changed (field names, documentation, formatting) but API itself has not been changed
+ */
+#define VPU_BOOT_API_VER_PATCH 2
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
+	u32 pad1[43];
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
+	u32 host_to_vpu_irq;
+	u32 vpu_to_host_irq;
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
+	u32 pad3[53];
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
+	u32 pad4[30];
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
+	/* Unused/reserved: 0x470 - 0xFFF */
+	u32 pad6[740];
+};
+
+#pragma pack(pop)
+
+#endif
diff --git a/drivers/gpu/drm/vpu/vpu_drv.c b/drivers/gpu/drm/vpu/vpu_drv.c
index 48551c147a1c..d0cdbb791e1f 100644
--- a/drivers/gpu/drm/vpu/vpu_drv.c
+++ b/drivers/gpu/drm/vpu/vpu_drv.c
@@ -13,10 +13,13 @@
 #include <drm/drm_ioctl.h>
 #include <drm/drm_prime.h>
 
+#include "vpu_boot_api.h"
 #include "vpu_drv.h"
+#include "vpu_fw.h"
 #include "vpu_gem.h"
 #include "vpu_hw.h"
 #include "vpu_ipc.h"
+#include "vpu_jsm_msg.h"
 #include "vpu_mmu.h"
 #include "vpu_mmu_context.h"
 
@@ -31,6 +34,10 @@ int vpu_dbg_mask;
 module_param_named(dbg_mask, vpu_dbg_mask, int, 0644);
 MODULE_PARM_DESC(dbg_mask, "Driver debug mask. See VPU_DBG_* macros.");
 
+int vpu_test_mode;
+module_param_named_unsafe(test_mode, vpu_test_mode, int, 0644);
+MODULE_PARM_DESC(test_mode, "Test mode: 0 - normal operation, 1 - fw unit test, 2 - null hw");
+
 u8 vpu_pll_min_ratio;
 module_param_named(pll_min_ratio, vpu_pll_min_ratio, byte, 0644);
 MODULE_PARM_DESC(pll_min_ratio, "Minimum PLL ratio used to set VPU frequency");
@@ -126,6 +133,28 @@ static int vpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_fi
 	case DRM_VPU_PARAM_CONTEXT_ID:
 		args->value = file_priv->ctx.id;
 		break;
+	case DRM_VPU_PARAM_FW_API_VERSION:
+		if (args->index < VPU_FW_API_VER_NUM) {
+			struct vpu_firmware_header *fw_hdr;
+
+			fw_hdr = (struct vpu_firmware_header *)vdev->fw->file->data;
+			args->value = fw_hdr->api_version[args->index];
+		} else {
+			ret = -EINVAL;
+		}
+		break;
+	case DRM_VPU_PARAM_ENGINE_HEARTBEAT:
+		ret = vpu_jsm_get_heartbeat(vdev, args->index, &args->value);
+		break;
+	case DRM_VPU_PARAM_UNIQUE_INFERENCE_ID:
+		args->value = (u64)atomic64_inc_return(&vdev->unique_id_counter);
+		break;
+	case DRM_VPU_PARAM_TILE_CONFIG:
+		args->value = vdev->hw->tile_fuse;
+		break;
+	case DRM_VPU_PARAM_SKU:
+		args->value = vdev->hw->sku;
+		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -197,6 +226,71 @@ static const struct drm_ioctl_desc vpu_drm_ioctls[] = {
 
 DEFINE_DRM_GEM_FOPS(vpu_fops);
 
+static int vpu_wait_for_ready(struct vpu_device *vdev)
+{
+	struct vpu_ipc_consumer cons;
+	struct vpu_ipc_hdr ipc_hdr;
+	unsigned long timeout;
+	int ret;
+
+	if (vpu_test_mode == VPU_TEST_MODE_FW_TEST)
+		return 0;
+
+	vpu_ipc_consumer_add(vdev, &cons, VPU_IPC_CHAN_BOOT_MSG);
+
+	timeout = jiffies + msecs_to_jiffies(vdev->timeout.boot);
+	while (1) {
+		vpu_ipc_irq_handler(vdev);
+		ret = vpu_ipc_receive(vdev, &cons, &ipc_hdr, NULL, 0);
+		if (ret != -ETIMEDOUT || time_after_eq(jiffies, timeout))
+			break;
+
+		cond_resched();
+		if (signal_pending(current)) {
+			ret = -EINTR;
+			break;
+		}
+	}
+
+	vpu_ipc_consumer_del(vdev, &cons);
+
+	if (!ret && ipc_hdr.data_addr != VPU_IPC_BOOT_MSG_DATA_ADDR) {
+		vpu_err(vdev, "Invalid VPU ready message: 0x%x\n",
+			ipc_hdr.data_addr);
+		return -EIO;
+	}
+
+	if (!ret)
+		vpu_info(vdev, "VPU ready message received successfully\n");
+
+	return ret;
+}
+
+int vpu_boot(struct vpu_device *vdev)
+{
+	int ret;
+
+	/* Update boot params located at first 4KB of FW memory */
+	vpu_fw_boot_params_setup(vdev, vdev->fw->mem->kvaddr);
+
+	ret = vpu_hw_boot_fw(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to start the firmware: %d\n", ret);
+		return ret;
+	}
+
+	ret = vpu_wait_for_ready(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to boot the firmware: %d\n", ret);
+		return ret;
+	}
+
+	vpu_hw_irq_clear(vdev);
+	vpu_hw_irq_enable(vdev);
+	vpu_ipc_enable(vdev);
+	return 0;
+}
+
 int vpu_shutdown(struct vpu_device *vdev)
 {
 	int ret;
@@ -320,6 +414,10 @@ static int vpu_dev_init(struct vpu_device *vdev)
 	if (!vdev->mmu)
 		return -ENOMEM;
 
+	vdev->fw = devm_kzalloc(vdev->drm.dev, sizeof(*vdev->fw), GFP_KERNEL);
+	if (!vdev->fw)
+		return -ENOMEM;
+
 	vdev->ipc = devm_kzalloc(vdev->drm.dev, sizeof(*vdev->ipc), GFP_KERNEL);
 	if (!vdev->ipc)
 		return -ENOMEM;
@@ -331,6 +429,8 @@ static int vpu_dev_init(struct vpu_device *vdev)
 	vdev->context_xa_limit.min = VPU_GLOBAL_CONTEXT_MMU_SSID + 1;
 	vdev->context_xa_limit.max = VPU_CONTEXT_LIMIT;
 
+	atomic64_set(&vdev->unique_id_counter, 0);
+
 	ret = vpu_pci_init(vdev);
 	if (ret) {
 		vpu_err(vdev, "Failed to initialize PCI device: %d\n", ret);
@@ -367,14 +467,34 @@ static int vpu_dev_init(struct vpu_device *vdev)
 		goto err_mmu_gctx_fini;
 	}
 
+	ret = vpu_fw_init(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to initialize firmware: %d\n", ret);
+		goto err_mmu_fini;
+	}
+
 	ret = vpu_ipc_init(vdev);
 	if (ret) {
 		vpu_err(vdev, "Failed to initialize IPC: %d\n", ret);
-		goto err_mmu_fini;
+		goto err_fw_fini;
+	}
+
+	ret = vpu_fw_load(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to load firmware: %d\n", ret);
+		goto err_fw_fini;
+	}
+
+	ret = vpu_boot(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to boot: %d\n", ret);
+		goto err_fw_fini;
 	}
 
 	return 0;
 
+err_fw_fini:
+	vpu_fw_fini(vdev);
 err_mmu_fini:
 	vpu_mmu_fini(vdev);
 err_mmu_gctx_fini:
@@ -393,6 +513,7 @@ static void vpu_dev_fini(struct vpu_device *vdev)
 	vpu_shutdown(vdev);
 
 	vpu_ipc_fini(vdev);
+	vpu_fw_fini(vdev);
 	vpu_mmu_fini(vdev);
 	vpu_mmu_global_context_fini(vdev);
 	vpu_irq_fini(vdev);
diff --git a/drivers/gpu/drm/vpu/vpu_drv.h b/drivers/gpu/drm/vpu/vpu_drv.h
index ddb83aeaf6d3..94c8712396a6 100644
--- a/drivers/gpu/drm/vpu/vpu_drv.h
+++ b/drivers/gpu/drm/vpu/vpu_drv.h
@@ -87,12 +87,15 @@ struct vpu_device {
 	struct vpu_wa_table wa;
 	struct vpu_hw_info *hw;
 	struct vpu_mmu_info *mmu;
+	struct vpu_fw_info *fw;
 	struct vpu_ipc_info *ipc;
 
 	struct vpu_mmu_context gctx;
 	struct xarray context_xa;
 	struct xa_limit context_xa_limit;
 
+	atomic64_t unique_id_counter;
+
 	struct {
 		int boot;
 		int jsm;
@@ -113,9 +116,15 @@ extern int vpu_dbg_mask;
 extern u8 vpu_pll_min_ratio;
 extern u8 vpu_pll_max_ratio;
 
+#define VPU_TEST_MODE_DISABLED  0
+#define VPU_TEST_MODE_FW_TEST   1
+#define VPU_TEST_MODE_NULL_HW   2
+extern int vpu_test_mode;
+
 void vpu_file_priv_get(struct vpu_file_priv *file_priv, struct vpu_file_priv **link);
 void vpu_file_priv_put(struct vpu_file_priv **link);
 char *vpu_platform_to_str(u32 platform);
+int vpu_boot(struct vpu_device *vdev);
 int vpu_shutdown(struct vpu_device *vdev);
 
 static inline bool vpu_is_mtl(struct vpu_device *vdev)
diff --git a/drivers/gpu/drm/vpu/vpu_fw.c b/drivers/gpu/drm/vpu/vpu_fw.c
new file mode 100644
index 000000000000..153aafcf3423
--- /dev/null
+++ b/drivers/gpu/drm/vpu/vpu_fw.c
@@ -0,0 +1,413 @@
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
+#include "vpu_drv.h"
+#include "vpu_fw.h"
+#include "vpu_gem.h"
+#include "vpu_hw.h"
+#include "vpu_ipc.h"
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
+#define VPU_FW_CHECK_API(vdev, fw_hdr, name) vpu_fw_check_api(vdev, fw_hdr, #name, \
+								  VPU_##name##_API_VER_INDEX, \
+								  VPU_##name##_API_VER_MAJOR, \
+								  VPU_##name##_API_VER_MINOR)
+
+static char *vpu_firmware;
+module_param_named_unsafe(firmware, vpu_firmware, charp, 0644);
+MODULE_PARM_DESC(firmware, "VPU firmware binary in /lib/firmware/..");
+
+static int vpu_fw_request(struct vpu_device *vdev)
+{
+	const char *fw_names[FW_MAX_NAMES] = {
+		vpu_firmware,
+		"mtl_vpu.bin",
+		"intel/vpu/mtl_vpu_v0.0.bin"
+	};
+	int ret = -ENOENT;
+	int i;
+
+	for (i = 0; i < FW_MAX_NAMES; i++) {
+		ret = request_firmware(&vdev->fw->file, fw_names[i], vdev->drm.dev);
+		if (!ret)
+			return 0;
+	}
+
+	vpu_err(vdev, "Failed to request firmware: %d\n", ret);
+	return ret;
+}
+
+static void
+vpu_fw_check_api(struct vpu_device *vdev, const struct vpu_firmware_header *fw_hdr,
+		 const char *str, int index, u16 expected_major, u16 expected_minor)
+{
+	u16 major = (u16)(fw_hdr->api_version[index] >> 16);
+	u16 minor = (u16)(fw_hdr->api_version[index]);
+
+	if (major != expected_major) {
+		vpu_warn(vdev, "Incompatible FW %s API version: %d.%d (expected %d.%d)\n",
+			 str, major, minor, expected_major, expected_minor);
+	}
+	vpu_dbg(FW_BOOT, "FW %s API version: %d.%d (expected %d.%d)\n",
+		str, major, minor, expected_major, expected_minor);
+}
+
+static int vpu_fw_parse(struct vpu_device *vdev)
+{
+	struct vpu_fw_info *fw = vdev->fw;
+	const struct vpu_firmware_header *fw_hdr = (const void *)fw->file->data;
+	u64 runtime_addr, image_load_addr, runtime_size, image_size;
+
+	if (fw->file->size <= FW_FILE_IMAGE_OFFSET) {
+		vpu_err(vdev, "Firmware file is too small: %zu\n", fw->file->size);
+		return -EINVAL;
+	}
+
+	if (fw_hdr->header_version != VPU_FW_HEADER_VERSION) {
+		vpu_err(vdev, "Invalid firmware header version: %u\n", fw_hdr->header_version);
+		return -EINVAL;
+	}
+
+	runtime_addr = fw_hdr->boot_params_load_address;
+	runtime_size = fw_hdr->runtime_size;
+	image_load_addr = fw_hdr->image_load_address;
+	image_size = fw_hdr->image_size;
+
+	if (runtime_addr < FW_RUNTIME_MIN_ADDR || runtime_addr > FW_RUNTIME_MAX_ADDR) {
+		vpu_err(vdev, "Invalid firmware runtime address: 0x%llx\n", runtime_addr);
+		return -EINVAL;
+	}
+
+	if (runtime_size < fw->file->size || runtime_size > FW_RUNTIME_MAX_SIZE) {
+		vpu_err(vdev, "Invalid firmware runtime size: %llu\n", runtime_size);
+		return -EINVAL;
+	}
+
+	if (FW_FILE_IMAGE_OFFSET + image_size > fw->file->size) {
+		vpu_err(vdev, "Invalid image size: %llu\n", image_size);
+		return -EINVAL;
+	}
+
+	if (image_load_addr < runtime_addr ||
+	    image_load_addr + image_size > runtime_addr + runtime_size) {
+		vpu_err(vdev, "Invalid firmware load address size: 0x%llx and size %llu\n",
+			image_load_addr, image_size);
+		return -EINVAL;
+	}
+
+	if (fw_hdr->shave_nn_fw_size > FW_SHAVE_NN_MAX_SIZE) {
+		vpu_err(vdev, "SHAVE NN firmware is too big: %u\n", fw_hdr->shave_nn_fw_size);
+		return -EINVAL;
+	}
+
+	if (fw_hdr->entry_point < image_load_addr ||
+	    fw_hdr->entry_point >= image_load_addr + image_size) {
+		vpu_err(vdev, "Invalid entry point: 0x%llx\n", fw_hdr->entry_point);
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
+	vpu_dbg(FW_BOOT, "Header version: 0x%x, format 0x%x\n",
+		fw_hdr->header_version, fw_hdr->image_format);
+	vpu_dbg(FW_BOOT, "Size: file %lu image %u runtime %u shavenn %u\n",
+		fw->file->size, fw->image_size, fw->runtime_size, fw->shave_nn_size);
+	vpu_dbg(FW_BOOT, "Address: runtime 0x%llx, load 0x%llx, entry point 0x%llx\n",
+		fw->runtime_addr, image_load_addr, fw->entry_point);
+	vpu_dbg(FW_BOOT, "FW version: %s\n", (char *)fw_hdr + VPU_FW_HEADER_SIZE);
+
+	VPU_FW_CHECK_API(vdev, fw_hdr, BOOT);
+	VPU_FW_CHECK_API(vdev, fw_hdr, JSM);
+
+	return 0;
+}
+
+static void vpu_fw_release(struct vpu_device *vdev)
+{
+	release_firmware(vdev->fw->file);
+}
+
+static int vpu_fw_update_global_range(struct vpu_device *vdev)
+{
+	struct vpu_fw_info *fw = vdev->fw;
+	u64 start = ALIGN(fw->runtime_addr + fw->runtime_size, FW_SHARED_MEM_ALIGNMENT);
+	u64 size = FW_SHARED_MEM_SIZE;
+
+	if (start + size > FW_GLOBAL_MEM_END) {
+		vpu_err(vdev, "No space for shared region, start %lld, size %lld\n", start, size);
+		return -EINVAL;
+	}
+
+	vpu_hw_init_range(&vdev->hw->ranges.global_low, start, size);
+	return 0;
+}
+
+static int vpu_fw_mem_init(struct vpu_device *vdev)
+{
+	struct vpu_fw_info *fw = vdev->fw;
+	int ret;
+
+	ret = vpu_fw_update_global_range(vdev);
+	if (ret)
+		return ret;
+
+	fw->mem = vpu_bo_alloc_internal(vdev, fw->runtime_addr, fw->runtime_size, false);
+	if (!fw->mem) {
+		vpu_err(vdev, "Failed to allocate firmware runtime memory\n");
+		return -ENOMEM;
+	}
+
+	if (fw->shave_nn_size) {
+		fw->mem_shave_nn = vpu_bo_alloc_internal(vdev, vdev->hw->ranges.global_high.start,
+							 fw->shave_nn_size, false);
+		if (!fw->mem_shave_nn) {
+			vpu_err(vdev, "Failed to allocate shavenn buffer\n");
+			vpu_bo_free_internal(fw->mem);
+			return -ENOMEM;
+		}
+	}
+
+	return 0;
+}
+
+static void vpu_fw_mem_fini(struct vpu_device *vdev)
+{
+	struct vpu_fw_info *fw = vdev->fw;
+
+	if (fw->mem_shave_nn) {
+		vpu_bo_free_internal(fw->mem_shave_nn);
+		fw->mem_shave_nn = NULL;
+	}
+
+	vpu_bo_free_internal(fw->mem);
+	fw->mem = NULL;
+}
+
+int vpu_fw_init(struct vpu_device *vdev)
+{
+	int ret;
+
+	ret = vpu_fw_request(vdev);
+	if (ret)
+		return ret;
+
+	ret = vpu_fw_parse(vdev);
+	if (ret)
+		goto err_fw_release;
+
+	ret = vpu_fw_mem_init(vdev);
+	if (ret)
+		goto err_fw_release;
+
+	return 0;
+
+err_fw_release:
+	vpu_fw_release(vdev);
+	return ret;
+}
+
+void vpu_fw_fini(struct vpu_device *vdev)
+{
+	vpu_fw_mem_fini(vdev);
+	vpu_fw_release(vdev);
+}
+
+int vpu_fw_load(struct vpu_device *vdev)
+{
+	struct vpu_fw_info *fw = vdev->fw;
+	u64 image_end_offset = fw->image_load_offset + fw->image_size;
+	int ret;
+
+	ret = vpu_bo_vremap_internal(vdev, fw->mem, true);
+	if (ret)
+		return ret;
+
+	memset(fw->mem->kvaddr, 0, fw->image_load_offset);
+	memcpy(fw->mem->kvaddr + fw->image_load_offset,
+	       fw->file->data + FW_FILE_IMAGE_OFFSET, fw->image_size);
+	clflush_cache_range(fw->mem->kvaddr, image_end_offset);
+
+	if (VPU_WA(clear_runtime_mem)) {
+		u8 *start = fw->mem->kvaddr + image_end_offset;
+		u64 size = fw->mem->base.size - image_end_offset;
+
+		memset(start, 0, size);
+		clflush_cache_range(start, size);
+	}
+
+	return vpu_bo_vremap_internal(vdev, fw->mem, false);
+}
+
+static void vpu_fw_boot_params_print(struct vpu_device *vdev, struct vpu_boot_params *boot_params)
+{
+	vpu_dbg(FW_BOOT, "boot_params.magic = 0x%x\n",
+		boot_params->magic);
+	vpu_dbg(FW_BOOT, "boot_params.vpu_id = 0x%x\n",
+		boot_params->vpu_id);
+	vpu_dbg(FW_BOOT, "boot_params.vpu_count = 0x%x\n",
+		boot_params->vpu_count);
+	vpu_dbg(FW_BOOT, "boot_params.frequency = %u\n",
+		boot_params->frequency);
+
+	vpu_dbg(FW_BOOT, "boot_params.ipc_header_area_start = 0x%llx\n",
+		boot_params->ipc_header_area_start);
+	vpu_dbg(FW_BOOT, "boot_params.ipc_header_area_size = 0x%x\n",
+		boot_params->ipc_header_area_size);
+	vpu_dbg(FW_BOOT, "boot_params.shared_region_base = 0x%llx\n",
+		boot_params->shared_region_base);
+	vpu_dbg(FW_BOOT, "boot_params.shared_region_size = 0x%x\n",
+		boot_params->shared_region_size);
+	vpu_dbg(FW_BOOT, "boot_params.ipc_payload_area_start = 0x%llx\n",
+		boot_params->ipc_payload_area_start);
+	vpu_dbg(FW_BOOT, "boot_params.ipc_payload_area_size = 0x%x\n",
+		boot_params->ipc_payload_area_size);
+	vpu_dbg(FW_BOOT, "boot_params.global_aliased_pio_base = 0x%llx\n",
+		boot_params->global_aliased_pio_base);
+	vpu_dbg(FW_BOOT, "boot_params.global_aliased_pio_size = 0x%x\n",
+		boot_params->global_aliased_pio_size);
+
+	vpu_dbg(FW_BOOT, "boot_params.autoconfig = 0x%x\n",
+		boot_params->autoconfig);
+
+	vpu_dbg(FW_BOOT, "boot_params.cache_defaults[VPU_BOOT_L2_CACHE_CFG_NN].use = 0x%x\n",
+		boot_params->cache_defaults[VPU_BOOT_L2_CACHE_CFG_NN].use);
+	vpu_dbg(FW_BOOT, "boot_params.cache_defaults[VPU_BOOT_L2_CACHE_CFG_NN].cfg = 0x%x\n",
+		boot_params->cache_defaults[VPU_BOOT_L2_CACHE_CFG_NN].cfg);
+
+	vpu_dbg(FW_BOOT, "boot_params.global_memory_allocator_base = 0x%llx\n",
+		boot_params->global_memory_allocator_base);
+	vpu_dbg(FW_BOOT, "boot_params.global_memory_allocator_size = 0x%x\n",
+		boot_params->global_memory_allocator_size);
+
+	vpu_dbg(FW_BOOT, "boot_params.shave_nn_fw_base = 0x%llx\n",
+		boot_params->shave_nn_fw_base);
+
+	vpu_dbg(FW_BOOT, "boot_params.watchdog_irq_mss = 0x%x\n",
+		boot_params->watchdog_irq_mss);
+	vpu_dbg(FW_BOOT, "boot_params.watchdog_irq_nce = 0x%x\n",
+		boot_params->watchdog_irq_nce);
+	vpu_dbg(FW_BOOT, "boot_params.host_to_vpu_irq = 0x%x\n",
+		boot_params->host_to_vpu_irq);
+	vpu_dbg(FW_BOOT, "boot_params.vpu_to_host_irq = 0x%x\n",
+		boot_params->vpu_to_host_irq);
+
+	vpu_dbg(FW_BOOT, "boot_params.host_version_id = 0x%x\n",
+		boot_params->host_version_id);
+	vpu_dbg(FW_BOOT, "boot_params.si_stepping = 0x%x\n",
+		boot_params->si_stepping);
+	vpu_dbg(FW_BOOT, "boot_params.vdev_id = 0x%llx\n",
+		boot_params->device_id);
+	vpu_dbg(FW_BOOT, "boot_params.feature_exclusion = 0x%llx\n",
+		boot_params->feature_exclusion);
+	vpu_dbg(FW_BOOT, "boot_params.sku = %lld\n",
+		boot_params->sku);
+	vpu_dbg(FW_BOOT, "boot_params.min_freq_pll_ratio = 0x%x\n",
+		boot_params->min_freq_pll_ratio);
+	vpu_dbg(FW_BOOT, "boot_params.max_freq_pll_ratio = 0x%x\n",
+		boot_params->max_freq_pll_ratio);
+	vpu_dbg(FW_BOOT, "boot_params.default_trace_level = 0x%x\n",
+		boot_params->default_trace_level);
+	vpu_dbg(FW_BOOT, "boot_params.tracing_buff_message_format_mask = 0x%llx\n",
+		boot_params->tracing_buff_message_format_mask);
+	vpu_dbg(FW_BOOT, "boot_params.trace_destination_mask = 0x%x\n",
+		boot_params->trace_destination_mask);
+	vpu_dbg(FW_BOOT, "boot_params.trace_hw_component_mask = 0x%llx\n",
+		boot_params->trace_hw_component_mask);
+	vpu_dbg(FW_BOOT, "boot_params.boot_type = 0x%x\n",
+		boot_params->boot_type);
+	vpu_dbg(FW_BOOT, "boot_params.punit_telemetry_sram_base = 0x%llx\n",
+		boot_params->punit_telemetry_sram_base);
+	vpu_dbg(FW_BOOT, "boot_params.punit_telemetry_sram_size = 0x%llx\n",
+		boot_params->punit_telemetry_sram_size);
+	vpu_dbg(FW_BOOT, "boot_params.vpu_telemetry_enable = 0x%x\n",
+		boot_params->vpu_telemetry_enable);
+}
+
+void vpu_fw_boot_params_setup(struct vpu_device *vdev, struct vpu_boot_params *boot_params)
+{
+	struct vpu_bo *ipc_mem_rx = vdev->ipc->mem_rx;
+
+	/* In case of warm boot we only have to reset the entrypoint addr */
+	if (!vpu_fw_is_cold_boot(vdev)) {
+		boot_params->save_restore_ret_address = 0;
+		return;
+	}
+
+	boot_params->magic = VPU_BOOT_PARAMS_MAGIC;
+	boot_params->vpu_id = to_pci_dev(vdev->drm.dev)->bus->number;
+	boot_params->frequency = vpu_hw_reg_pll_freq_get(vdev);
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
+		vpu_hw_range_size(&vdev->hw->ranges.global_aliased_pio);
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
+	boot_params->sku = vdev->hw->sku;
+
+	boot_params->min_freq_pll_ratio = vdev->hw->pll.min_ratio;
+	boot_params->max_freq_pll_ratio = vdev->hw->pll.max_ratio;
+
+	boot_params->punit_telemetry_sram_base = vpu_hw_reg_telemetry_offset_get(vdev);
+	boot_params->punit_telemetry_sram_size = vpu_hw_reg_telemetry_size_get(vdev);
+	boot_params->vpu_telemetry_enable = vpu_hw_reg_telemetry_enable_get(vdev);
+
+	vpu_fw_boot_params_print(vdev, boot_params);
+}
diff --git a/drivers/gpu/drm/vpu/vpu_fw.h b/drivers/gpu/drm/vpu/vpu_fw.h
new file mode 100644
index 000000000000..932bae42ca41
--- /dev/null
+++ b/drivers/gpu/drm/vpu/vpu_fw.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#ifndef __VPU_FW_H__
+#define __VPU_FW_H__
+
+struct vpu_device;
+struct vpu_bo;
+struct vpu_boot_params;
+
+struct vpu_fw_info {
+	const struct firmware *file;
+	struct vpu_bo *mem;
+	struct vpu_bo *mem_shave_nn;
+	struct vpu_bo *mem_log_crit;
+	struct vpu_bo *mem_log_verb;
+	u64 runtime_addr;
+	u32 runtime_size;
+	u64 image_load_offset;
+	u32 image_size;
+	u32 shave_nn_size;
+	u64 entry_point; /* Cold or warm boot entry point for next boot */
+	u64 cold_boot_entry_point;
+};
+
+int vpu_fw_init(struct vpu_device *vdev);
+void vpu_fw_fini(struct vpu_device *vdev);
+int vpu_fw_load(struct vpu_device *vdev);
+void vpu_fw_boot_params_setup(struct vpu_device *vdev, struct vpu_boot_params *bp);
+
+static inline bool vpu_fw_is_cold_boot(struct vpu_device *vdev)
+{
+	return vdev->fw->entry_point == vdev->fw->cold_boot_entry_point;
+}
+
+#endif /* __VPU_FW_H__ */
diff --git a/drivers/gpu/drm/vpu/vpu_hw_mtl.c b/drivers/gpu/drm/vpu/vpu_hw_mtl.c
index b53ec7b9cc4d..ba24dc29f962 100644
--- a/drivers/gpu/drm/vpu/vpu_hw_mtl.c
+++ b/drivers/gpu/drm/vpu/vpu_hw_mtl.c
@@ -4,6 +4,7 @@
  */
 
 #include "vpu_drv.h"
+#include "vpu_fw.h"
 #include "vpu_hw_mtl_reg.h"
 #include "vpu_hw_reg_io.h"
 #include "vpu_hw.h"
@@ -583,6 +584,16 @@ static void vpu_boot_soc_cpu_boot(struct vpu_device *vdev)
 
 	val = REG_CLR_FLD(MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC, IRQI_RESUME0, val);
 	REGV_WR32(MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC, val);
+
+	val = vdev->fw->entry_point >> 9;
+	REGV_WR32(MTL_VPU_HOST_SS_LOADING_ADDRESS_LO, val);
+
+	val = REG_SET_FLD(MTL_VPU_HOST_SS_LOADING_ADDRESS_LO, DONE, val);
+	REGV_WR32(MTL_VPU_HOST_SS_LOADING_ADDRESS_LO, val);
+
+	vpu_dbg(PM, "Booting firmware, mode: %s\n",
+		vdev->fw->entry_point == vdev->fw->cold_boot_entry_point ?
+		"cold boot" : "resume");
 }
 
 static int vpu_boot_d0i3_drive(struct vpu_device *vdev, bool enable)
diff --git a/include/uapi/drm/vpu_drm.h b/include/uapi/drm/vpu_drm.h
index 8793ed06bfa9..b0492225433d 100644
--- a/include/uapi/drm/vpu_drm.h
+++ b/include/uapi/drm/vpu_drm.h
@@ -51,6 +51,11 @@ extern "C" {
 #define DRM_VPU_PARAM_CONTEXT_BASE_ADDRESS 5
 #define DRM_VPU_PARAM_CONTEXT_PRIORITY	   6
 #define DRM_VPU_PARAM_CONTEXT_ID	   7
+#define DRM_VPU_PARAM_FW_API_VERSION	   8
+#define DRM_VPU_PARAM_ENGINE_HEARTBEAT	   9
+#define DRM_VPU_PARAM_UNIQUE_INFERENCE_ID  10
+#define DRM_VPU_PARAM_TILE_CONFIG	   11
+#define DRM_VPU_PARAM_SKU		   12
 
 #define DRM_VPU_PLATFORM_TYPE_SILICON	   0
 
@@ -94,6 +99,22 @@ struct drm_vpu_param {
 	 * %DRM_VPU_PARAM_CONTEXT_ID:
 	 * Current context ID, always greater than 0 (read-only)
 	 *
+	 * %DRM_VPU_PARAM_FW_API_VERSION:
+	 * Firmware API version array (read-only)
+	 *
+	 * %DRM_VPU_PARAM_ENGINE_HEARTBEAT:
+	 * Heartbeat value from an engine (read-only).
+	 * Engine ID (i.e. DRM_VPU_ENGINE_COMPUTE) is given via index.
+	 *
+	 * %DRM_VPU_PARAM_UNIQUE_INFERENCE_ID:
+	 * Device-unique inference ID (read-only)
+	 *
+	 * %DRM_VPU_PARAM_TILE_CONFIG:
+	 * VPU tile configuration  (read-only)
+	 *
+	 * %DRM_VPU_PARAM_SKU:
+	 * VPU SKU ID (read-only)
+	 *
 	 */
 	__u32 param;
 
-- 
2.34.1

