Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0495B6CD5
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 14:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A85C10E6C1;
	Tue, 13 Sep 2022 12:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F56910E6B6
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 12:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663071016; x=1694607016;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+dmzw5pyhIwfom3LI2+dkZoULHsjXnZ4iFTW4UavzNo=;
 b=QQs7wk8gEL8BRzBnjPJc1qXl/GpHlNyqKkTkPkju8nBezlf9j9AebUH7
 rg2aFT0T4tZXNB40+UK4QQU1TT5WboJS4QXa+NIOnmyf3nA2aTWnSyMJL
 GertoYSRLJl8okf7glyYowvYmGwnEtwDeSI4OmMft/eQGA1kHXyc0Flee
 00PZEQi1n3JNrA/qCcXAecQlYpPUsi4l77VRRI9ZV+Ub61uD9x8xphv6p
 qQBNxEAvyeeJy1h0diNQvn/Jb4g5x1qtReZiVXG8AVJdQE1XUqiA3071r
 2+shsCkl1G6WB5sTx3dQro4Y3cILkc+F0jEi7FtppL5g9Y5FyMwKJ3E1/ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="278511721"
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; d="scan'208";a="278511721"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 05:10:15 -0700
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; d="scan'208";a="649633608"
Received: from jlawryno-desktop.igk.intel.com ([172.22.229.64])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 05:10:13 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v2 2/7] drm/ivpu: Add Intel VPU MMU support
Date: Tue, 13 Sep 2022 14:10:12 +0200
Message-Id: <20220913121017.993825-3-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220913121017.993825-1-jacek.lawrynowicz@linux.intel.com>
References: <20220913121017.993825-1-jacek.lawrynowicz@linux.intel.com>
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

VPU Memory Management Unit is based on ARM MMU-600.
It allows to create multiple virtual address spaces for the device and
map noncontinuous host memory (there is no dedicated memory on the VPU).

Address space is implemented as a struct ivpu_mmu_context, it has an ID,
drm_mm allocator for VPU addresses and struct ivpu_mmu_pgtable that holds
actual 3-level, 4KB page table.
Context with ID 0 (global context) is created upon driver initialization
and it's mainly used for mapping memory required to execute
the firmware.
Contexts with non-zero IDs are user contexts allocated each time
the devices is open()-ed and they map command buffers and other
workload-related memory.
Workloads executing in a given contexts have access only
to the memory mapped in this context.

This patch is has to main files:
  - ivpu_mmu_context.c handles MMU page tables and memory mapping
  - ivpu_mmu.c implements a driver that programs the MMU device

Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/gpu/drm/ivpu/Makefile           |   4 +-
 drivers/gpu/drm/ivpu/ivpu_drv.c         |  59 +-
 drivers/gpu/drm/ivpu/ivpu_drv.h         |   7 +
 drivers/gpu/drm/ivpu/ivpu_hw_mtl.c      |  10 +
 drivers/gpu/drm/ivpu/ivpu_mmu.c         | 883 ++++++++++++++++++++++++
 drivers/gpu/drm/ivpu/ivpu_mmu.h         |  53 ++
 drivers/gpu/drm/ivpu/ivpu_mmu_context.c | 419 +++++++++++
 drivers/gpu/drm/ivpu/ivpu_mmu_context.h |  49 ++
 include/uapi/drm/ivpu_drm.h             |   4 +
 9 files changed, 1485 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_mmu.c
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_mmu.h
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_mmu_context.c
 create mode 100644 drivers/gpu/drm/ivpu/ivpu_mmu_context.h

diff --git a/drivers/gpu/drm/ivpu/Makefile b/drivers/gpu/drm/ivpu/Makefile
index e59dc65abe6a..95bb04f26296 100644
--- a/drivers/gpu/drm/ivpu/Makefile
+++ b/drivers/gpu/drm/ivpu/Makefile
@@ -3,6 +3,8 @@
 
 intel_vpu-y := \
 	ivpu_drv.o \
-	ivpu_hw_mtl.o
+	ivpu_hw_mtl.o \
+	ivpu_mmu.o \
+	ivpu_mmu_context.o
 
 obj-$(CONFIG_DRM_IVPU) += intel_vpu.o
diff --git a/drivers/gpu/drm/ivpu/ivpu_drv.c b/drivers/gpu/drm/ivpu/ivpu_drv.c
index a01c7244f6e5..cbeb9a801a31 100644
--- a/drivers/gpu/drm/ivpu/ivpu_drv.c
+++ b/drivers/gpu/drm/ivpu/ivpu_drv.c
@@ -14,6 +14,8 @@
 
 #include "ivpu_drv.h"
 #include "ivpu_hw.h"
+#include "ivpu_mmu.h"
+#include "ivpu_mmu_context.h"
 
 #ifndef DRIVER_VERSION_STR
 #define DRIVER_VERSION_STR __stringify(DRM_IVPU_DRIVER_MAJOR) "." \
@@ -50,6 +52,11 @@ char *ivpu_platform_to_str(u32 platform)
 
 void ivpu_file_priv_get(struct ivpu_file_priv *file_priv, struct ivpu_file_priv **link)
 {
+	struct ivpu_device *vdev = file_priv->vdev;
+
+	ivpu_dbg(KREF, "file_priv get: ctx %u refcount %u\n",
+		 file_priv->ctx.id, kref_read(&file_priv->ref));
+
 	kref_get(&file_priv->ref);
 	*link = file_priv;
 }
@@ -57,6 +64,12 @@ void ivpu_file_priv_get(struct ivpu_file_priv *file_priv, struct ivpu_file_priv
 static void file_priv_release(struct kref *ref)
 {
 	struct ivpu_file_priv *file_priv = container_of(ref, struct ivpu_file_priv, ref);
+	struct ivpu_device *vdev = file_priv->vdev;
+
+	ivpu_dbg(FILE, "file_priv release: ctx %u\n", file_priv->ctx.id);
+
+	if (file_priv->ctx.id)
+		ivpu_mmu_user_context_fini(file_priv);
 
 	kfree(file_priv);
 }
@@ -64,6 +77,10 @@ static void file_priv_release(struct kref *ref)
 void ivpu_file_priv_put(struct ivpu_file_priv **link)
 {
 	struct ivpu_file_priv *file_priv = *link;
+	struct ivpu_device *vdev = file_priv->vdev;
+
+	ivpu_dbg(KREF, "file_priv put: ctx %u refcount %u\n",
+		 file_priv->ctx.id, kref_read(&file_priv->ref));
 
 	*link = NULL;
 	kref_put(&file_priv->ref, file_priv_release);
@@ -75,7 +92,11 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
 	struct ivpu_device *vdev = file_priv->vdev;
 	struct pci_dev *pdev = to_pci_dev(vdev->drm.dev);
 	struct drm_ivpu_param *args = data;
-	int ret = 0;
+	int ret;
+
+	ret = ivpu_mmu_user_context_init(file_priv);
+	if (ret)
+		return ret;
 
 	switch (args->param) {
 	case DRM_IVPU_PARAM_DEVICE_ID:
@@ -99,6 +120,9 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
 	case DRM_IVPU_PARAM_CONTEXT_PRIORITY:
 		args->value = file_priv->priority;
 		break;
+	case DRM_IVPU_PARAM_CONTEXT_ID:
+		args->value = file_priv->ctx.id;
+		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -110,7 +134,11 @@ static int ivpu_set_param_ioctl(struct drm_device *dev, void *data, struct drm_f
 {
 	struct ivpu_file_priv *file_priv = file->driver_priv;
 	struct drm_ivpu_param *args = data;
-	int ret = 0;
+	int ret;
+
+	ret = ivpu_mmu_user_context_init(file_priv);
+	if (ret)
+		return ret;
 
 	switch (args->param) {
 	case DRM_IVPU_PARAM_CONTEXT_PRIORITY:
@@ -139,9 +167,13 @@ static int ivpu_open(struct drm_device *dev, struct drm_file *file)
 	file_priv->priority = DRM_IVPU_CONTEXT_PRIORITY_NORMAL;
 
 	kref_init(&file_priv->ref);
+	mutex_init(&file_priv->lock);
 
 	file->driver_priv = file_priv;
 
+	ivpu_dbg(FILE, "file_priv alloc: process %s pid %d\n",
+		 current->comm, task_pid_nr(current));
+
 	return 0;
 }
 
@@ -164,6 +196,7 @@ int ivpu_shutdown(struct ivpu_device *vdev)
 	int ret;
 
 	ivpu_hw_irq_disable(vdev);
+	ivpu_mmu_disable(vdev);
 
 	ret = ivpu_hw_power_down(vdev);
 	if (ret)
@@ -272,6 +305,10 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	if (!vdev->hw)
 		return -ENOMEM;
 
+	vdev->mmu = devm_kzalloc(vdev->drm.dev, sizeof(*vdev->mmu), GFP_KERNEL);
+	if (!vdev->mmu)
+		return -ENOMEM;
+
 	vdev->hw->ops = &ivpu_hw_mtl_ops;
 	vdev->platform = IVPU_PLATFORM_INVALID;
 
@@ -303,8 +340,24 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 		goto err_irq_fini;
 	}
 
+	ret = ivpu_mmu_global_context_init(vdev);
+	if (ret) {
+		ivpu_err(vdev, "Failed to initialize global MMU context: %d\n", ret);
+		goto err_power_down;
+	}
+
+	ret = ivpu_mmu_init(vdev);
+	if (ret) {
+		ivpu_err(vdev, "Failed to initialize MMU device: %d\n", ret);
+		goto err_mmu_gctx_fini;
+	}
+
 	return 0;
 
+err_mmu_gctx_fini:
+	ivpu_mmu_global_context_fini(vdev);
+err_power_down:
+	ivpu_hw_power_down(vdev);
 err_irq_fini:
 	ivpu_irq_fini(vdev);
 err_pci_fini:
@@ -316,6 +369,8 @@ static void ivpu_dev_fini(struct ivpu_device *vdev)
 {
 	ivpu_shutdown(vdev);
 
+	ivpu_mmu_fini(vdev);
+	ivpu_mmu_global_context_fini(vdev);
 	ivpu_irq_fini(vdev);
 	ivpu_pci_fini(vdev);
 
diff --git a/drivers/gpu/drm/ivpu/ivpu_drv.h b/drivers/gpu/drm/ivpu/ivpu_drv.h
index 43dfa78544c6..6eec3eb76c2f 100644
--- a/drivers/gpu/drm/ivpu/ivpu_drv.h
+++ b/drivers/gpu/drm/ivpu/ivpu_drv.h
@@ -14,6 +14,8 @@
 #include <linux/xarray.h>
 #include <uapi/drm/ivpu_drm.h>
 
+#include "ivpu_mmu_context.h"
+
 #define DRIVER_NAME "intel_vpu"
 #define DRIVER_DESC "Driver for Intel Versatile Processing Unit (VPU)"
 #define DRIVER_DATE "20220913"
@@ -70,6 +72,7 @@ struct ivpu_wa_table {
 };
 
 struct ivpu_hw_info;
+struct ivpu_mmu_info;
 
 struct ivpu_device {
 	struct drm_device drm; /* Must be first */
@@ -80,7 +83,9 @@ struct ivpu_device {
 
 	struct ivpu_wa_table wa;
 	struct ivpu_hw_info *hw;
+	struct ivpu_mmu_info *mmu;
 
+	struct ivpu_mmu_context gctx;
 	struct xarray context_xa;
 	struct xa_limit context_xa_limit;
 
@@ -95,6 +100,8 @@ struct ivpu_device {
 struct ivpu_file_priv {
 	struct kref ref;
 	struct ivpu_device *vdev;
+	struct mutex lock;
+	struct ivpu_mmu_context ctx;
 	u32 priority;
 };
 
diff --git a/drivers/gpu/drm/ivpu/ivpu_hw_mtl.c b/drivers/gpu/drm/ivpu/ivpu_hw_mtl.c
index 17fc8e1104df..525b57c4029c 100644
--- a/drivers/gpu/drm/ivpu/ivpu_hw_mtl.c
+++ b/drivers/gpu/drm/ivpu/ivpu_hw_mtl.c
@@ -7,6 +7,7 @@
 #include "ivpu_hw_mtl_reg.h"
 #include "ivpu_hw_reg_io.h"
 #include "ivpu_hw.h"
+#include "ivpu_mmu.h"
 
 #define TILE_FUSE_ENABLE_BOTH	     0x0
 #define TILE_FUSE_ENABLE_UPPER	     0x1
@@ -930,6 +931,15 @@ static irqreturn_t ivpu_hw_mtl_irqv_handler(struct ivpu_device *vdev, int irq)
 
 	REGV_WR32(MTL_VPU_HOST_SS_ICB_CLEAR_0, status);
 
+	if (REG_TEST_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, MMU_IRQ_0_INT, status))
+		ret &= ivpu_mmu_irq_evtq_handler(vdev);
+
+	if (REG_TEST_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, MMU_IRQ_1_INT, status))
+		ivpu_dbg(IRQ, "MMU sync complete\n");
+
+	if (REG_TEST_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, MMU_IRQ_2_INT, status))
+		ret &= ivpu_mmu_irq_gerr_handler(vdev);
+
 	if (REG_TEST_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, CPU_INT_REDIRECT_0_INT, status))
 		ret &= ivpu_hw_mtl_irq_wdt_mss_handler(vdev);
 
diff --git a/drivers/gpu/drm/ivpu/ivpu_mmu.c b/drivers/gpu/drm/ivpu/ivpu_mmu.c
new file mode 100644
index 000000000000..b9f225a83c45
--- /dev/null
+++ b/drivers/gpu/drm/ivpu/ivpu_mmu.c
@@ -0,0 +1,883 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#include <linux/highmem.h>
+#include <linux/circ_buf.h>
+
+#include "ivpu_drv.h"
+#include "ivpu_hw_mtl_reg.h"
+#include "ivpu_hw_reg_io.h"
+#include "ivpu_mmu.h"
+#include "ivpu_mmu_context.h"
+
+#define IVPU_MMU_IDR0_REF		0x080f3e0f
+#define IVPU_MMU_IDR0_REF_SIMICS	0x080f3e1f
+#define IVPU_MMU_IDR1_REF		0x0e739d18
+#define IVPU_MMU_IDR3_REF		0x0000003c
+#define IVPU_MMU_IDR5_REF		0x00040070
+#define IVPU_MMU_IDR5_REF_SIMICS	0x00000075
+#define IVPU_MMU_IDR5_REF_FPGA		0x00800075
+
+#define IVPU_MMU_CDTAB_ENT_SIZE		64
+#define IVPU_MMU_CDTAB_ENT_COUNT_LOG2	8 /* 256 entries */
+#define IVPU_MMU_CDTAB_ENT_COUNT	((u32)1 << IVPU_MMU_CDTAB_ENT_COUNT_LOG2)
+
+#define IVPU_MMU_STREAM_ID0		0
+#define IVPU_MMU_STREAM_ID3		3
+
+#define IVPU_MMU_STRTAB_ENT_SIZE	64
+#define IVPU_MMU_STRTAB_ENT_COUNT	4
+#define IVPU_MMU_STRTAB_CFG_LOG2SIZE	2
+#define IVPU_MMU_STRTAB_CFG		IVPU_MMU_STRTAB_CFG_LOG2SIZE
+
+#define IVPU_MMU_Q_COUNT_LOG2		4 /* 16 entries */
+#define IVPU_MMU_Q_COUNT		((u32)1 << IVPU_MMU_Q_COUNT_LOG2)
+#define IVPU_MMU_Q_WRAP_BIT		(IVPU_MMU_Q_COUNT << 1)
+#define IVPU_MMU_Q_WRAP_MASK		(IVPU_MMU_Q_WRAP_BIT - 1)
+#define IVPU_MMU_Q_IDX_MASK		(IVPU_MMU_Q_COUNT - 1)
+#define IVPU_MMU_Q_IDX(val)		((val) & IVPU_MMU_Q_IDX_MASK)
+
+#define IVPU_MMU_CMDQ_CMD_SIZE		16
+#define IVPU_MMU_CMDQ_SIZE		(IVPU_MMU_Q_COUNT * IVPU_MMU_CMDQ_CMD_SIZE)
+
+#define IVPU_MMU_EVTQ_CMD_SIZE		32
+#define IVPU_MMU_EVTQ_SIZE		(IVPU_MMU_Q_COUNT * IVPU_MMU_EVTQ_CMD_SIZE)
+
+#define IVPU_MMU_CMD_OPCODE		GENMASK(8, 0)
+
+#define IVPU_MMU_CMD_SYNC_0_CS		GENMASK(13, 12)
+#define IVPU_MMU_CMD_SYNC_0_MSH		GENMASK(23, 22)
+#define IVPU_MMU_CMD_SYNC_0_MSI_ATTR	GENMASK(27, 24)
+#define IVPU_MMU_CMD_SYNC_0_MSI_ATTR	GENMASK(27, 24)
+#define IVPU_MMU_CMD_SYNC_0_MSI_DATA	GENMASK(63, 32)
+
+#define IVPU_MMU_CMD_CFGI_0_SSEC	BIT(10)
+#define IVPU_MMU_CMD_CFGI_0_SSV		BIT(11)
+#define IVPU_MMU_CMD_CFGI_0_SSID	GENMASK(31, 12)
+#define IVPU_MMU_CMD_CFGI_0_SID		GENMASK(63, 32)
+#define IVPU_MMU_CMD_CFGI_1_RANGE	GENMASK(4, 0)
+
+#define IVPU_MMU_CMD_TLBI_0_ASID	GENMASK(63, 48)
+#define IVPU_MMU_CMD_TLBI_0_VMID	GENMASK(47, 32)
+
+#define CMD_PREFETCH_CFG		0x1
+#define CMD_CFGI_STE			0x3
+#define CMD_CFGI_ALL			0x4
+#define CMD_CFGI_CD			0x5
+#define CMD_CFGI_CD_ALL			0x6
+#define CMD_TLBI_NH_ASID		0x11
+#define CMD_TLBI_EL2_ALL		0x20
+#define CMD_TLBI_NSNH_ALL		0x30
+#define CMD_SYNC			0x46
+
+#define IVPU_MMU_EVT_F_UUT		0x01
+#define IVPU_MMU_EVT_C_BAD_STREAMID	0x02
+#define IVPU_MMU_EVT_F_STE_FETCH	0x03
+#define IVPU_MMU_EVT_C_BAD_STE		0x04
+#define IVPU_MMU_EVT_F_BAD_ATS_TREQ	0x05
+#define IVPU_MMU_EVT_F_STREAM_DISABLED	0x06
+#define IVPU_MMU_EVT_F_TRANSL_FORBIDDEN	0x07
+#define IVPU_MMU_EVT_C_BAD_SUBSTREAMID	0x08
+#define IVPU_MMU_EVT_F_CD_FETCH		0x09
+#define IVPU_MMU_EVT_C_BAD_CD		0x0a
+#define IVPU_MMU_EVT_F_WALK_EABT	0x0b
+#define IVPU_MMU_EVT_F_TRANSLATION	0x10
+#define IVPU_MMU_EVT_F_ADDR_SIZE	0x11
+#define IVPU_MMU_EVT_F_ACCESS		0x12
+#define IVPU_MMU_EVT_F_PERMISSION	0x13
+#define IVPU_MMU_EVT_F_TLB_CONFLICT	0x20
+#define IVPU_MMU_EVT_F_CFG_CONFLICT	0x21
+#define IVPU_MMU_EVT_E_PAGE_REQUEST	0x24
+#define IVPU_MMU_EVT_F_VMS_FETCH	0x25
+
+#define IVPU_MMU_EVTS_MAX		8
+
+#define IVPU_MMU_EVT_OP_MASK		GENMASK_ULL(7, 0)
+#define IVPU_MMU_EVT_SSID_MASK		GENMASK_ULL(31, 12)
+
+#define IVPU_MMU_Q_BASE_RWA		BIT(62)
+#define IVPU_MMU_Q_BASE_ADDR_MASK	GENMASK_ULL(51, 5)
+#define IVPU_MMU_STRTAB_BASE_RA		BIT(62)
+#define IVPU_MMU_STRTAB_BASE_ADDR_MASK	GENMASK_ULL(51, 6)
+
+#define IVPU_MMU_IRQ_EVTQ_EN		BIT(2)
+#define IVPU_MMU_IRQ_GERROR_EN		BIT(0)
+
+#define IVPU_MMU_CR0_ATSCHK		BIT(4)
+#define IVPU_MMU_CR0_CMDQEN		BIT(3)
+#define IVPU_MMU_CR0_EVTQEN		BIT(2)
+#define IVPU_MMU_CR0_PRIQEN		BIT(1)
+#define IVPU_MMU_CR0_SMMUEN		BIT(0)
+
+#define IVPU_MMU_CR1_TABLE_SH		GENMASK(11, 10)
+#define IVPU_MMU_CR1_TABLE_OC		GENMASK(9, 8)
+#define IVPU_MMU_CR1_TABLE_IC		GENMASK(7, 6)
+#define IVPU_MMU_CR1_QUEUE_SH		GENMASK(5, 4)
+#define IVPU_MMU_CR1_QUEUE_OC		GENMASK(3, 2)
+#define IVPU_MMU_CR1_QUEUE_IC		GENMASK(1, 0)
+#define IVPU_MMU_CACHE_NC		0
+#define IVPU_MMU_CACHE_WB		1
+#define IVPU_MMU_CACHE_WT		2
+#define IVPU_MMU_SH_NSH			0
+#define IVPU_MMU_SH_OSH			2
+#define IVPU_MMU_SH_ISH			3
+
+#define IVPU_MMU_CMDQ_OP		GENMASK_ULL(7, 0)
+
+#define IVPU_MMU_CD_0_TCR_T0SZ		GENMASK_ULL(5, 0)
+#define IVPU_MMU_CD_0_TCR_TG0		GENMASK_ULL(7, 6)
+#define IVPU_MMU_CD_0_TCR_IRGN0		GENMASK_ULL(9, 8)
+#define IVPU_MMU_CD_0_TCR_ORGN0		GENMASK_ULL(11, 10)
+#define IVPU_MMU_CD_0_TCR_SH0		GENMASK_ULL(13, 12)
+#define IVPU_MMU_CD_0_TCR_EPD0		BIT_ULL(14)
+#define IVPU_MMU_CD_0_TCR_EPD1		BIT_ULL(30)
+#define IVPU_MMU_CD_0_ENDI		BIT(15)
+#define IVPU_MMU_CD_0_V			BIT(31)
+#define IVPU_MMU_CD_0_TCR_IPS		GENMASK_ULL(34, 32)
+#define IVPU_MMU_CD_0_TCR_TBI0		BIT_ULL(38)
+#define IVPU_MMU_CD_0_AA64		BIT(41)
+#define IVPU_MMU_CD_0_S			BIT(44)
+#define IVPU_MMU_CD_0_R			BIT(45)
+#define IVPU_MMU_CD_0_A			BIT(46)
+#define IVPU_MMU_CD_0_ASET		BIT(47)
+#define IVPU_MMU_CD_0_ASID		GENMASK_ULL(63, 48)
+
+#define IVPU_MMU_CD_1_TTB0_MASK		GENMASK_ULL(51, 4)
+
+#define IVPU_MMU_STE_0_S1CDMAX		GENMASK_ULL(63, 59)
+#define IVPU_MMU_STE_0_S1FMT		GENMASK_ULL(5, 4)
+#define IVPU_MMU_STE_0_S1FMT_LINEAR	0
+#define IVPU_MMU_STE_DWORDS		8
+#define IVPU_MMU_STE_0_CFG_S1_TRANS	5
+#define IVPU_MMU_STE_0_CFG		GENMASK_ULL(3, 1)
+#define IVPU_MMU_STE_0_S1CTXPTR_MASK	GENMASK_ULL(51, 6)
+#define IVPU_MMU_STE_0_V			BIT(0)
+
+#define IVPU_MMU_STE_1_STRW_NSEL1	0ul
+#define IVPU_MMU_STE_1_CONT		GENMASK_ULL(16, 13)
+#define IVPU_MMU_STE_1_STRW		GENMASK_ULL(31, 30)
+#define IVPU_MMU_STE_1_PRIVCFG		GENMASK_ULL(49, 48)
+#define IVPU_MMU_STE_1_PRIVCFG_UNPRIV	2ul
+#define IVPU_MMU_STE_1_INSTCFG		GENMASK_ULL(51, 50)
+#define IVPU_MMU_STE_1_INSTCFG_DATA	2ul
+#define IVPU_MMU_STE_1_MEV		BIT(19)
+#define IVPU_MMU_STE_1_S1STALLD		BIT(27)
+#define IVPU_MMU_STE_1_S1C_CACHE_NC	0ul
+#define IVPU_MMU_STE_1_S1C_CACHE_WBRA	1ul
+#define IVPU_MMU_STE_1_S1C_CACHE_WT	2ul
+#define IVPU_MMU_STE_1_S1C_CACHE_WB	3ul
+#define IVPU_MMU_STE_1_S1CIR		GENMASK_ULL(3, 2)
+#define IVPU_MMU_STE_1_S1COR		GENMASK_ULL(5, 4)
+#define IVPU_MMU_STE_1_S1CSH		GENMASK_ULL(7, 6)
+#define IVPU_MMU_STE_1_S1DSS		GENMASK_ULL(1, 0)
+#define IVPU_MMU_STE_1_S1DSS_TERMINATE	0x0
+
+#define IVPU_MMU_REG_TIMEOUT_US		(10 * USEC_PER_MSEC)
+#define IVPU_MMU_QUEUE_TIMEOUT_US	(100 * USEC_PER_MSEC)
+
+#define IVPU_MMU_GERROR_ERR_MASK ((REG_FLD(MTL_VPU_HOST_MMU_GERROR, CMDQ)) | \
+				  (REG_FLD(MTL_VPU_HOST_MMU_GERROR, EVTQ_ABT)) | \
+				  (REG_FLD(MTL_VPU_HOST_MMU_GERROR, PRIQ_ABT)) | \
+				  (REG_FLD(MTL_VPU_HOST_MMU_GERROR, MSI_CMDQ_ABT)) | \
+				  (REG_FLD(MTL_VPU_HOST_MMU_GERROR, MSI_EVTQ_ABT)) | \
+				  (REG_FLD(MTL_VPU_HOST_MMU_GERROR, MSI_PRIQ_ABT)) | \
+				  (REG_FLD(MTL_VPU_HOST_MMU_GERROR, MSI_ABT)) | \
+				  (REG_FLD(MTL_VPU_HOST_MMU_GERROR, SFM)))
+
+static char *ivpu_mmu_evt_to_str(u32 cmd)
+{
+	switch (cmd) {
+	case IVPU_MMU_EVT_F_UUT:
+		return "Unsupported Upstream Transaction";
+	case IVPU_MMU_EVT_C_BAD_STREAMID:
+		return "Transaction StreamID out of range";
+	case IVPU_MMU_EVT_F_STE_FETCH:
+		return "Fetch of STE caused external abort";
+	case IVPU_MMU_EVT_C_BAD_STE:
+		return "Used STE invalid";
+	case IVPU_MMU_EVT_F_BAD_ATS_TREQ:
+		return "Address Request disallowed for a StreamID";
+	case IVPU_MMU_EVT_F_STREAM_DISABLED:
+		return "Transaction marks non-substream disabled";
+	case IVPU_MMU_EVT_F_TRANSL_FORBIDDEN:
+		return "MMU bypass is disallowed for this StreamID";
+	case IVPU_MMU_EVT_C_BAD_SUBSTREAMID:
+		return "Invalid StreamID";
+	case IVPU_MMU_EVT_F_CD_FETCH:
+		return "Fetch of CD caused external abort";
+	case IVPU_MMU_EVT_C_BAD_CD:
+		return "Fetched CD invalid";
+	case IVPU_MMU_EVT_F_WALK_EABT:
+		return " An external abort occurred fetching a TLB";
+	case IVPU_MMU_EVT_F_TRANSLATION:
+		return "Translation fault";
+	case IVPU_MMU_EVT_F_ADDR_SIZE:
+		return " Output address caused address size fault";
+	case IVPU_MMU_EVT_F_ACCESS:
+		return "Access flag fault";
+	case IVPU_MMU_EVT_F_PERMISSION:
+		return "Permission fault occurred on page access";
+	case IVPU_MMU_EVT_F_TLB_CONFLICT:
+		return "A TLB conflict";
+	case IVPU_MMU_EVT_F_CFG_CONFLICT:
+		return "A configuration cache conflict";
+	case IVPU_MMU_EVT_E_PAGE_REQUEST:
+		return "Page request hint from a client device";
+	case IVPU_MMU_EVT_F_VMS_FETCH:
+		return "Fetch of VMS caused external abort";
+	default:
+		return "Unknown CMDQ command";
+	}
+}
+
+static int ivpu_mmu_config_check(struct ivpu_device *vdev)
+{
+	u32 val_ref;
+	u32 val;
+
+	if (ivpu_is_simics(vdev))
+		val_ref = IVPU_MMU_IDR0_REF_SIMICS;
+	else
+		val_ref = IVPU_MMU_IDR0_REF;
+
+	val = REGV_RD32(MTL_VPU_HOST_MMU_IDR0);
+	if (val != val_ref)
+		ivpu_err(vdev, "IDR0 0x%x != IDR0_REF 0x%x\n", val, val_ref);
+
+	val = REGV_RD32(MTL_VPU_HOST_MMU_IDR1);
+	if (val != IVPU_MMU_IDR1_REF)
+		ivpu_warn(vdev, "IDR1 0x%x != IDR1_REF 0x%x\n", val, IVPU_MMU_IDR1_REF);
+
+	val = REGV_RD32(MTL_VPU_HOST_MMU_IDR3);
+	if (val != IVPU_MMU_IDR3_REF)
+		ivpu_warn(vdev, "IDR3 0x%x != IDR3_REF 0x%x\n", val, IVPU_MMU_IDR3_REF);
+
+	if (ivpu_is_simics(vdev))
+		val_ref = IVPU_MMU_IDR5_REF_SIMICS;
+	else if (ivpu_is_fpga(vdev))
+		val_ref = IVPU_MMU_IDR5_REF_FPGA;
+	else
+		val_ref = IVPU_MMU_IDR5_REF;
+
+	val = REGV_RD32(MTL_VPU_HOST_MMU_IDR5);
+	if (val != val_ref)
+		ivpu_warn(vdev, "IDR5 0x%x != IDR5_REF 0x%x\n", val, val_ref);
+
+	return 0;
+}
+
+static int ivpu_mmu_cdtab_alloc(struct ivpu_device *vdev)
+{
+	struct ivpu_mmu_info *mmu = vdev->mmu;
+	struct ivpu_mmu_cdtab *cdtab = &mmu->cdtab;
+	size_t size = IVPU_MMU_CDTAB_ENT_COUNT * IVPU_MMU_CDTAB_ENT_SIZE;
+
+	cdtab->base = dmam_alloc_coherent(vdev->drm.dev, size, &cdtab->dma, GFP_KERNEL);
+	if (!cdtab->base)
+		return -ENOMEM;
+
+	ivpu_dbg(MMU, "CDTAB alloc: dma=%pad size=%zu\n", &cdtab->dma, size);
+
+	return 0;
+}
+
+static int ivpu_mmu_strtab_alloc(struct ivpu_device *vdev)
+{
+	struct ivpu_mmu_info *mmu = vdev->mmu;
+	struct ivpu_mmu_strtab *strtab = &mmu->strtab;
+	size_t size = IVPU_MMU_STRTAB_ENT_COUNT * IVPU_MMU_STRTAB_ENT_SIZE;
+
+	strtab->base = dmam_alloc_coherent(vdev->drm.dev, size, &strtab->dma, GFP_KERNEL);
+	if (!strtab->base)
+		return -ENOMEM;
+
+	strtab->base_cfg = IVPU_MMU_STRTAB_CFG;
+	strtab->dma_q = IVPU_MMU_STRTAB_BASE_RA;
+	strtab->dma_q |= strtab->dma & IVPU_MMU_STRTAB_BASE_ADDR_MASK;
+
+	ivpu_dbg(MMU, "STRTAB alloc: dma=%pad dma_q=%pad size=%zu\n",
+		 &strtab->dma, &strtab->dma_q, size);
+
+	return 0;
+}
+
+static int ivpu_mmu_cmdq_alloc(struct ivpu_device *vdev)
+{
+	struct ivpu_mmu_info *mmu = vdev->mmu;
+	struct ivpu_mmu_queue *q = &mmu->cmdq;
+
+	q->base = dmam_alloc_coherent(vdev->drm.dev, IVPU_MMU_CMDQ_SIZE, &q->dma, GFP_KERNEL);
+	if (!q->base)
+		return -ENOMEM;
+
+	q->dma_q = IVPU_MMU_Q_BASE_RWA;
+	q->dma_q |= q->dma & IVPU_MMU_Q_BASE_ADDR_MASK;
+	q->dma_q |= IVPU_MMU_Q_COUNT_LOG2;
+
+	ivpu_dbg(MMU, "CMDQ alloc: dma=%pad dma_q=%pad size=%u\n",
+		 &q->dma, &q->dma_q, IVPU_MMU_CMDQ_SIZE);
+
+	return 0;
+}
+
+static int ivpu_mmu_evtq_alloc(struct ivpu_device *vdev)
+{
+	struct ivpu_mmu_info *mmu = vdev->mmu;
+	struct ivpu_mmu_queue *q = &mmu->evtq;
+
+	q->base = dmam_alloc_coherent(vdev->drm.dev, IVPU_MMU_EVTQ_SIZE, &q->dma, GFP_KERNEL);
+	if (!q->base)
+		return -ENOMEM;
+
+	q->dma_q = IVPU_MMU_Q_BASE_RWA;
+	q->dma_q |= q->dma & IVPU_MMU_Q_BASE_ADDR_MASK;
+	q->dma_q |= IVPU_MMU_Q_COUNT_LOG2;
+
+	ivpu_dbg(MMU, "EVTQ alloc: dma=%pad dma_q=%pad size=%u\n",
+		 &q->dma, &q->dma_q, IVPU_MMU_EVTQ_SIZE);
+
+	return 0;
+}
+
+static int ivpu_mmu_structs_alloc(struct ivpu_device *vdev)
+{
+	int ret;
+
+	ret = ivpu_mmu_cdtab_alloc(vdev);
+	if (ret) {
+		ivpu_err(vdev, "Failed to allocate cdtab: %d\n", ret);
+		return ret;
+	}
+
+	ret = ivpu_mmu_strtab_alloc(vdev);
+	if (ret) {
+		ivpu_err(vdev, "Failed to allocate strtab: %d\n", ret);
+		return ret;
+	}
+
+	ret = ivpu_mmu_cmdq_alloc(vdev);
+	if (ret) {
+		ivpu_err(vdev, "Failed to allocate cmdq: %d\n", ret);
+		return ret;
+	}
+
+	ret = ivpu_mmu_evtq_alloc(vdev);
+	if (ret)
+		ivpu_err(vdev, "Failed to allocate evtq: %d\n", ret);
+
+	return ret;
+}
+
+static int ivpu_mmu_reg_write(struct ivpu_device *vdev, u32 reg, u32 val)
+{
+	u32 reg_ack = reg + 4; /* ACK register is 4B after base register */
+	u32 val_ack;
+	int ret;
+
+	REGV_WR32(reg, val);
+
+	ret = REGV_POLL(reg_ack, val_ack, (val == val_ack), IVPU_MMU_REG_TIMEOUT_US);
+	if (ret)
+		ivpu_err(vdev, "Failed to write register 0x%x\n", reg);
+
+	return ret;
+}
+
+static int ivpu_mmu_irqs_setup(struct ivpu_device *vdev)
+{
+	u32 irq_ctrl = IVPU_MMU_IRQ_EVTQ_EN | IVPU_MMU_IRQ_GERROR_EN;
+	int ret;
+
+	ret = ivpu_mmu_reg_write(vdev, MTL_VPU_HOST_MMU_IRQ_CTRL, 0);
+	if (ret)
+		return ret;
+
+	return ivpu_mmu_reg_write(vdev, MTL_VPU_HOST_MMU_IRQ_CTRL, irq_ctrl);
+}
+
+static int ivpu_mmu_cmdq_wait_for_cons(struct ivpu_device *vdev)
+{
+	struct ivpu_mmu_queue *cmdq = &vdev->mmu->cmdq;
+
+	return REGV_POLL(MTL_VPU_HOST_MMU_CMDQ_CONS, cmdq->cons, (cmdq->prod == cmdq->cons),
+			 IVPU_MMU_QUEUE_TIMEOUT_US);
+}
+
+static int ivpu_mmu_cmdq_cmd_write(struct ivpu_device *vdev, const char *name, u64 data0, u64 data1)
+{
+	struct ivpu_mmu_queue *q = &vdev->mmu->cmdq;
+	u64 *queue_buffer = q->base;
+	int idx = IVPU_MMU_Q_IDX(q->prod) * (IVPU_MMU_CMDQ_CMD_SIZE / sizeof(*queue_buffer));
+
+	if (!CIRC_SPACE(IVPU_MMU_Q_IDX(q->prod), IVPU_MMU_Q_IDX(q->cons), IVPU_MMU_Q_COUNT)) {
+		ivpu_err(vdev, "Failed to write MMU CMD %s\n", name);
+		return -EBUSY;
+	}
+
+	queue_buffer[idx] = data0;
+	queue_buffer[idx + 1] = data1;
+	q->prod = (q->prod + 1) & IVPU_MMU_Q_WRAP_MASK;
+
+	ivpu_dbg(MMU, "CMD write: %s data: 0x%llx 0x%llx\n", name, data0, data1);
+
+	return 0;
+}
+
+static int ivpu_mmu_cmdq_sync(struct ivpu_device *vdev)
+{
+	struct ivpu_mmu_queue *q = &vdev->mmu->cmdq;
+	u64 val;
+	int ret;
+
+	val = FIELD_PREP(IVPU_MMU_CMD_OPCODE, CMD_SYNC) |
+	      FIELD_PREP(IVPU_MMU_CMD_SYNC_0_CS, 0x2) |
+	      FIELD_PREP(IVPU_MMU_CMD_SYNC_0_MSH, 0x3) |
+	      FIELD_PREP(IVPU_MMU_CMD_SYNC_0_MSI_ATTR, 0xf);
+
+	ret = ivpu_mmu_cmdq_cmd_write(vdev, "SYNC", val, 0);
+	if (ret)
+		return ret;
+
+	clflush_cache_range(q->base, IVPU_MMU_CMDQ_SIZE);
+	REGV_WR32(MTL_VPU_HOST_MMU_CMDQ_PROD, q->prod);
+
+	ret = ivpu_mmu_cmdq_wait_for_cons(vdev);
+	if (ret)
+		ivpu_err(vdev, "Timed out waiting for consumer: %d\n", ret);
+
+	return ret;
+}
+
+static int ivpu_mmu_cmdq_write_cfgi_all(struct ivpu_device *vdev)
+{
+	u64 data0 = FIELD_PREP(IVPU_MMU_CMD_OPCODE, CMD_CFGI_ALL);
+	u64 data1 = FIELD_PREP(IVPU_MMU_CMD_CFGI_1_RANGE, 0x1f);
+
+	return ivpu_mmu_cmdq_cmd_write(vdev, "CFGI_ALL", data0, data1);
+}
+
+static int ivpu_mmu_cmdq_write_tlbi_nh_asid(struct ivpu_device *vdev, u16 ssid)
+{
+	u64 val = FIELD_PREP(IVPU_MMU_CMD_OPCODE, CMD_TLBI_NH_ASID) |
+		  FIELD_PREP(IVPU_MMU_CMD_TLBI_0_ASID, ssid);
+
+	return ivpu_mmu_cmdq_cmd_write(vdev, "TLBI_NH_ASID", val, 0);
+}
+
+static int ivpu_mmu_cmdq_write_tlbi_nsnh_all(struct ivpu_device *vdev)
+{
+	u64 val = FIELD_PREP(IVPU_MMU_CMD_OPCODE, CMD_TLBI_NSNH_ALL);
+
+	return ivpu_mmu_cmdq_cmd_write(vdev, "TLBI_NSNH_ALL", val, 0);
+}
+
+static int ivpu_mmu_reset(struct ivpu_device *vdev)
+{
+	struct ivpu_mmu_info *mmu = vdev->mmu;
+	u32 val;
+	int ret;
+
+	memset(mmu->cmdq.base, 0, IVPU_MMU_CMDQ_SIZE);
+	clflush_cache_range(mmu->cmdq.base, IVPU_MMU_CMDQ_SIZE);
+	mmu->cmdq.prod = 0;
+	mmu->cmdq.cons = 0;
+
+	memset(mmu->evtq.base, 0, IVPU_MMU_EVTQ_SIZE);
+	clflush_cache_range(mmu->evtq.base, IVPU_MMU_EVTQ_SIZE);
+	mmu->evtq.prod = 0;
+	mmu->evtq.cons = 0;
+
+	ret = ivpu_mmu_reg_write(vdev, MTL_VPU_HOST_MMU_CR0, 0);
+	if (ret)
+		return ret;
+
+	val = FIELD_PREP(IVPU_MMU_CR1_TABLE_SH, IVPU_MMU_SH_ISH) |
+	      FIELD_PREP(IVPU_MMU_CR1_TABLE_OC, IVPU_MMU_CACHE_WB) |
+	      FIELD_PREP(IVPU_MMU_CR1_TABLE_IC, IVPU_MMU_CACHE_WB) |
+	      FIELD_PREP(IVPU_MMU_CR1_QUEUE_SH, IVPU_MMU_SH_ISH) |
+	      FIELD_PREP(IVPU_MMU_CR1_QUEUE_OC, IVPU_MMU_CACHE_WB) |
+	      FIELD_PREP(IVPU_MMU_CR1_QUEUE_IC, IVPU_MMU_CACHE_WB);
+	REGV_WR32(MTL_VPU_HOST_MMU_CR1, val);
+
+	REGV_WR64(MTL_VPU_HOST_MMU_STRTAB_BASE, mmu->strtab.dma_q);
+	REGV_WR32(MTL_VPU_HOST_MMU_STRTAB_BASE_CFG, mmu->strtab.base_cfg);
+
+	REGV_WR64(MTL_VPU_HOST_MMU_CMDQ_BASE, mmu->cmdq.dma_q);
+	REGV_WR32(MTL_VPU_HOST_MMU_CMDQ_PROD, 0);
+	REGV_WR32(MTL_VPU_HOST_MMU_CMDQ_CONS, 0);
+
+	val = IVPU_MMU_CR0_CMDQEN;
+	ret = ivpu_mmu_reg_write(vdev, MTL_VPU_HOST_MMU_CR0, val);
+	if (ret)
+		return ret;
+
+	ret = ivpu_mmu_cmdq_write_cfgi_all(vdev);
+	if (ret)
+		return ret;
+
+	ret = ivpu_mmu_cmdq_write_tlbi_nsnh_all(vdev);
+	if (ret)
+		return ret;
+
+	ret = ivpu_mmu_cmdq_sync(vdev);
+	if (ret)
+		return ret;
+
+	REGV_WR64(MTL_VPU_HOST_MMU_EVTQ_BASE, mmu->evtq.dma_q);
+	REGV_WR32(MTL_VPU_HOST_MMU_EVTQ_PROD_SEC, 0);
+	REGV_WR32(MTL_VPU_HOST_MMU_EVTQ_CONS_SEC, 0);
+
+	val |= IVPU_MMU_CR0_EVTQEN;
+	ret = ivpu_mmu_reg_write(vdev, MTL_VPU_HOST_MMU_CR0, val);
+	if (ret)
+		return ret;
+
+	val |= IVPU_MMU_CR0_ATSCHK;
+	ret = ivpu_mmu_reg_write(vdev, MTL_VPU_HOST_MMU_CR0, val);
+	if (ret)
+		return ret;
+
+	ret = ivpu_mmu_irqs_setup(vdev);
+	if (ret)
+		return ret;
+
+	val |= IVPU_MMU_CR0_SMMUEN;
+	return ivpu_mmu_reg_write(vdev, MTL_VPU_HOST_MMU_CR0, val);
+}
+
+static void ivpu_mmu_strtab_link_cd(struct ivpu_device *vdev, u32 sid)
+{
+	struct ivpu_mmu_info *mmu = vdev->mmu;
+	struct ivpu_mmu_strtab *strtab = &mmu->strtab;
+	struct ivpu_mmu_cdtab *cdtab = &mmu->cdtab;
+	u64 *entry = strtab->base + (sid * IVPU_MMU_STRTAB_ENT_SIZE);
+	u64 str[2];
+
+	str[0] = FIELD_PREP(IVPU_MMU_STE_0_CFG, IVPU_MMU_STE_0_CFG_S1_TRANS) |
+		 FIELD_PREP(IVPU_MMU_STE_0_S1CDMAX, IVPU_MMU_CDTAB_ENT_COUNT_LOG2) |
+		 FIELD_PREP(IVPU_MMU_STE_0_S1FMT, IVPU_MMU_STE_0_S1FMT_LINEAR) |
+		 IVPU_MMU_STE_0_V |
+		 (cdtab->dma & IVPU_MMU_STE_0_S1CTXPTR_MASK);
+
+	str[1] = FIELD_PREP(IVPU_MMU_STE_1_S1DSS, IVPU_MMU_STE_1_S1DSS_TERMINATE) |
+		 FIELD_PREP(IVPU_MMU_STE_1_S1CIR, IVPU_MMU_STE_1_S1C_CACHE_NC) |
+		 FIELD_PREP(IVPU_MMU_STE_1_S1COR, IVPU_MMU_STE_1_S1C_CACHE_NC) |
+		 FIELD_PREP(IVPU_MMU_STE_1_S1CSH, IVPU_MMU_SH_NSH) |
+		 FIELD_PREP(IVPU_MMU_STE_1_PRIVCFG, IVPU_MMU_STE_1_PRIVCFG_UNPRIV) |
+		 FIELD_PREP(IVPU_MMU_STE_1_INSTCFG, IVPU_MMU_STE_1_INSTCFG_DATA) |
+		 FIELD_PREP(IVPU_MMU_STE_1_STRW, IVPU_MMU_STE_1_STRW_NSEL1) |
+		 FIELD_PREP(IVPU_MMU_STE_1_CONT, IVPU_MMU_STRTAB_CFG_LOG2SIZE) |
+		 IVPU_MMU_STE_1_MEV |
+		 IVPU_MMU_STE_1_S1STALLD;
+
+	WRITE_ONCE(entry[1], str[1]);
+	WRITE_ONCE(entry[0], str[0]);
+
+	clflush_cache_range(entry, IVPU_MMU_STRTAB_ENT_SIZE);
+
+	ivpu_dbg(MMU, "STRTAB write entry (SSID=%u): 0x%llx, 0x%llx\n",
+		 sid, str[0], str[1]);
+}
+
+static int ivpu_mmu_strtab_init(struct ivpu_device *vdev)
+{
+	ivpu_mmu_strtab_link_cd(vdev, IVPU_MMU_STREAM_ID0);
+	ivpu_mmu_strtab_link_cd(vdev, IVPU_MMU_STREAM_ID3);
+
+	return 0;
+}
+
+int ivpu_mmu_invalidate_tlb(struct ivpu_device *vdev, u16 ssid)
+{
+	struct ivpu_mmu_info *mmu = vdev->mmu;
+	int ret;
+
+	if (mutex_lock_interruptible(&mmu->lock))
+		return -EINTR;
+
+	if (!mmu->on) {
+		ret = 0;
+		goto unlock;
+	}
+
+	ret = ivpu_mmu_cmdq_write_tlbi_nh_asid(vdev, ssid);
+	if (ret)
+		goto unlock;
+
+	ret = ivpu_mmu_cmdq_sync(vdev);
+unlock:
+	mutex_unlock(&mmu->lock);
+	return ret;
+}
+
+static int ivpu_mmu_cd_add(struct ivpu_device *vdev, u32 ssid, u64 cd_dma)
+{
+	struct ivpu_mmu_info *mmu = vdev->mmu;
+	struct ivpu_mmu_cdtab *cdtab = &mmu->cdtab;
+	u64 *entry;
+	u64 cd[4];
+	int ret;
+
+	if (ssid > IVPU_MMU_CDTAB_ENT_COUNT)
+		return -EINVAL;
+
+	if (mutex_lock_interruptible(&mmu->lock))
+		return -EINTR;
+
+	entry = cdtab->base + (ssid * IVPU_MMU_CDTAB_ENT_SIZE);
+
+	if (cd_dma != 0) {
+		cd[0] = FIELD_PREP(IVPU_MMU_CD_0_TCR_T0SZ, 26) |
+			FIELD_PREP(IVPU_MMU_CD_0_TCR_TG0, 0) |
+			FIELD_PREP(IVPU_MMU_CD_0_TCR_IRGN0, 0) |
+			FIELD_PREP(IVPU_MMU_CD_0_TCR_ORGN0, 0) |
+			FIELD_PREP(IVPU_MMU_CD_0_TCR_SH0, 0) |
+			FIELD_PREP(IVPU_MMU_CD_0_TCR_IPS, 3) |
+			FIELD_PREP(IVPU_MMU_CD_0_ASID, ssid) |
+			IVPU_MMU_CD_0_TCR_EPD1 |
+			IVPU_MMU_CD_0_AA64 |
+			IVPU_MMU_CD_0_R |
+			IVPU_MMU_CD_0_A |
+			IVPU_MMU_CD_0_ASET |
+			IVPU_MMU_CD_0_V;
+		cd[1] = cd_dma & IVPU_MMU_CD_1_TTB0_MASK;
+		cd[2] = 0;
+		cd[3] = 0x0000000000007444;
+	} else {
+		memset(cd, 0, sizeof(cd));
+	}
+
+	WRITE_ONCE(entry[1], cd[1]);
+	WRITE_ONCE(entry[2], cd[2]);
+	WRITE_ONCE(entry[3], cd[3]);
+	WRITE_ONCE(entry[0], cd[0]);
+
+	clflush_cache_range(entry, IVPU_MMU_CDTAB_ENT_SIZE);
+
+	ivpu_dbg(MMU, "CDTAB %s entry (SSID=%u, dma=%pad): 0x%llx, 0x%llx, 0x%llx, 0x%llx\n",
+		 cd_dma ? "write" : "clear", ssid, &cd_dma, cd[0], cd[1], cd[2], cd[3]);
+
+	if (!mmu->on) {
+		ret = 0;
+		goto unlock;
+	}
+
+	ret = ivpu_mmu_cmdq_write_cfgi_all(vdev);
+	if (ret)
+		goto unlock;
+
+	ret = ivpu_mmu_cmdq_sync(vdev);
+unlock:
+	mutex_unlock(&mmu->lock);
+	return ret;
+}
+
+static int ivpu_mmu_cd_add_gbl(struct ivpu_device *vdev)
+{
+	int ret;
+
+	ret = ivpu_mmu_cd_add(vdev, 0, vdev->gctx.pgtable.pgd_dma);
+	if (ret)
+		ivpu_err(vdev, "Failed to add global CD entry: %d\n", ret);
+
+	return ret;
+}
+
+static int ivpu_mmu_cd_add_user(struct ivpu_device *vdev, u32 ssid, dma_addr_t cd_dma)
+{
+	int ret;
+
+	if (ssid == 0) {
+		ivpu_err(vdev, "Invalid SSID: %u\n", ssid);
+		return -EINVAL;
+	}
+
+	ret = ivpu_mmu_cd_add(vdev, ssid, cd_dma);
+	if (ret)
+		ivpu_err(vdev, "Failed to add CD entry SSID=%u: %d\n", ssid, ret);
+
+	return ret;
+}
+
+void ivpu_mmu_fini(struct ivpu_device *vdev)
+{
+	mutex_destroy(&vdev->mmu->lock);
+}
+
+int ivpu_mmu_init(struct ivpu_device *vdev)
+{
+	struct ivpu_mmu_info *mmu = vdev->mmu;
+	int ret;
+
+	ivpu_dbg(MMU, "Init..\n");
+
+	mutex_init(&mmu->lock);
+
+	ret = ivpu_mmu_config_check(vdev);
+	if (ret)
+		goto err;
+
+	ret = ivpu_mmu_structs_alloc(vdev);
+	if (ret)
+		goto err;
+
+	ret = ivpu_mmu_strtab_init(vdev);
+	if (ret) {
+		ivpu_err(vdev, "Failed to initialize strtab: %d\n", ret);
+		goto err;
+	}
+
+	ret = ivpu_mmu_cd_add_gbl(vdev);
+	if (ret) {
+		ivpu_err(vdev, "Failed to initialize strtab: %d\n", ret);
+		goto err;
+	}
+
+	ret = ivpu_mmu_enable(vdev);
+	if (ret) {
+		ivpu_err(vdev, "Failed to resume MMU: %d\n", ret);
+		goto err;
+	}
+
+	ivpu_dbg(MMU, "Init done\n");
+
+	return 0;
+
+err:
+	ivpu_mmu_fini(vdev);
+	return ret;
+}
+
+int ivpu_mmu_enable(struct ivpu_device *vdev)
+{
+	struct ivpu_mmu_info *mmu = vdev->mmu;
+	int ret;
+
+	mutex_lock(&mmu->lock);
+
+	mmu->on = true;
+
+	ret = ivpu_mmu_reset(vdev);
+	if (ret) {
+		ivpu_err(vdev, "Failed to reset MMU: %d\n", ret);
+		goto err;
+	}
+
+	ret = ivpu_mmu_cmdq_write_cfgi_all(vdev);
+	if (ret)
+		goto err;
+
+	ret = ivpu_mmu_cmdq_write_tlbi_nsnh_all(vdev);
+	if (ret)
+		goto err;
+
+	ret = ivpu_mmu_cmdq_sync(vdev);
+	if (ret)
+		goto err;
+
+	mutex_unlock(&mmu->lock);
+
+	return 0;
+err:
+	mmu->on = false;
+	mutex_unlock(&mmu->lock);
+	return ret;
+}
+
+void ivpu_mmu_disable(struct ivpu_device *vdev)
+{
+	struct ivpu_mmu_info *mmu = vdev->mmu;
+
+	mutex_lock(&mmu->lock);
+	mmu->on = false;
+	mutex_unlock(&mmu->lock);
+}
+
+irqreturn_t ivpu_mmu_irq_evtq_handler(struct ivpu_device *vdev)
+{
+	struct ivpu_mmu_queue *evtq = &vdev->mmu->evtq;
+	u64 in_addr, fetch_addr;
+	u32 *evt, op, ssid, sid, counter = 0;
+
+	ivpu_dbg(IRQ, "MMU event queue\n");
+
+	do {
+		evt = (evtq->base + (IVPU_MMU_Q_IDX(evtq->cons) * IVPU_MMU_EVTQ_CMD_SIZE));
+		clflush_cache_range(evt, IVPU_MMU_EVTQ_CMD_SIZE);
+
+		op = FIELD_GET(IVPU_MMU_EVT_OP_MASK, evt[0]);
+		ssid = FIELD_GET(IVPU_MMU_EVT_SSID_MASK, evt[0]);
+		sid = evt[1];
+		in_addr = ((u64)evt[5]) << 32 | evt[4];
+		fetch_addr = ((u64)evt[7]) << 32 | evt[6];
+
+		ivpu_err(vdev, "MMU EVTQ: 0x%x (%s) SSID: %d SID: %d, e[2] %08x, e[3] %08x, in addr: 0x%llx, fetch addr: 0x%llx\n",
+			 op, ivpu_mmu_evt_to_str(op), ssid, sid, evt[2], evt[3],
+			 in_addr, fetch_addr);
+		evtq->cons = (evtq->cons + 1) & IVPU_MMU_Q_WRAP_MASK;
+
+		REGV_WR32(MTL_VPU_HOST_MMU_EVTQ_CONS_SEC, evtq->cons);
+
+		evtq->prod = REGV_RD32(MTL_VPU_HOST_MMU_EVTQ_PROD_SEC);
+
+		if (counter++ >= IVPU_MMU_EVTS_MAX)
+			break;
+
+	} while (evtq->prod != evtq->cons);
+
+	return IRQ_HANDLED;
+}
+
+irqreturn_t ivpu_mmu_irq_gerr_handler(struct ivpu_device *vdev)
+{
+	u32 gerror_val, gerrorn_val, active;
+
+	ivpu_dbg(IRQ, "MMU error\n");
+
+	gerror_val = REGV_RD32(MTL_VPU_HOST_MMU_GERROR);
+	gerrorn_val = REGV_RD32(MTL_VPU_HOST_MMU_GERRORN);
+
+	active = gerror_val ^ gerrorn_val;
+	if (!(active & IVPU_MMU_GERROR_ERR_MASK))
+		return IRQ_NONE;
+
+	if (REG_TEST_FLD(MTL_VPU_HOST_MMU_GERROR, SFM, active))
+		ivpu_err_ratelimited(vdev, "MMU has entered service failure mode\n");
+
+	if (REG_TEST_FLD(MTL_VPU_HOST_MMU_GERROR, MSI_ABT, active))
+		ivpu_warn_ratelimited(vdev, "MMU MSI ABT write aborted\n");
+
+	if (REG_TEST_FLD(MTL_VPU_HOST_MMU_GERROR, MSI_PRIQ_ABT, active))
+		ivpu_warn_ratelimited(vdev, "MMU PRIQ MSI ABT write aborted\n");
+
+	if (REG_TEST_FLD(MTL_VPU_HOST_MMU_GERROR, MSI_EVTQ_ABT, active))
+		ivpu_warn_ratelimited(vdev, "MMU EVTQ MSI ABT write aborted\n");
+
+	if (REG_TEST_FLD(MTL_VPU_HOST_MMU_GERROR, MSI_CMDQ_ABT, active))
+		ivpu_warn_ratelimited(vdev, "MMU CMDQ MSI ABT write aborted\n");
+
+	if (REG_TEST_FLD(MTL_VPU_HOST_MMU_GERROR, PRIQ_ABT, active))
+		ivpu_err_ratelimited(vdev, "MMU PRIQ write aborted\n");
+
+	if (REG_TEST_FLD(MTL_VPU_HOST_MMU_GERROR, EVTQ_ABT, active))
+		ivpu_err_ratelimited(vdev, "MMU EVTQ write aborted\n");
+
+	if (REG_TEST_FLD(MTL_VPU_HOST_MMU_GERROR, CMDQ, active))
+		ivpu_err_ratelimited(vdev, "MMU CMDQ write aborted\n");
+
+	REGV_WR32(MTL_VPU_HOST_MMU_GERRORN, gerror_val);
+
+	return IRQ_HANDLED;
+}
+
+int ivpu_mmu_set_pgtable(struct ivpu_device *vdev, int ssid, struct ivpu_mmu_pgtable *pgtable)
+{
+	return ivpu_mmu_cd_add_user(vdev, ssid, pgtable->pgd_dma);
+}
+
+void ivpu_mmu_clear_pgtable(struct ivpu_device *vdev, int ssid)
+{
+	ivpu_mmu_cd_add_user(vdev, ssid, 0); /* 0 will clear CD entry */
+}
diff --git a/drivers/gpu/drm/ivpu/ivpu_mmu.h b/drivers/gpu/drm/ivpu/ivpu_mmu.h
new file mode 100644
index 000000000000..af671c312e63
--- /dev/null
+++ b/drivers/gpu/drm/ivpu/ivpu_mmu.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#ifndef __IVPU_MMU_H__
+#define __IVPU_MMU_H__
+
+#include <linux/irqreturn.h>
+
+struct ivpu_device;
+
+struct ivpu_mmu_cdtab {
+	void *base;
+	dma_addr_t dma;
+};
+
+struct ivpu_mmu_strtab {
+	void *base;
+	dma_addr_t dma;
+	u64 dma_q;
+	u32 base_cfg;
+};
+
+struct ivpu_mmu_queue {
+	void *base;
+	dma_addr_t dma;
+	u64 dma_q;
+	u32 prod;
+	u32 cons;
+};
+
+struct ivpu_mmu_info {
+	struct mutex lock; /* Protects cdtab, strtab, cmdq, on */
+	struct ivpu_mmu_cdtab cdtab;
+	struct ivpu_mmu_strtab strtab;
+	struct ivpu_mmu_queue cmdq;
+	struct ivpu_mmu_queue evtq;
+	bool on;
+};
+
+int ivpu_mmu_init(struct ivpu_device *vdev);
+void ivpu_mmu_fini(struct ivpu_device *vdev);
+void ivpu_mmu_disable(struct ivpu_device *vdev);
+int ivpu_mmu_enable(struct ivpu_device *vdev);
+int ivpu_mmu_set_pgtable(struct ivpu_device *vdev, int ssid, struct ivpu_mmu_pgtable *pgtable);
+void ivpu_mmu_clear_pgtable(struct ivpu_device *vdev, int ssid);
+int ivpu_mmu_invalidate_tlb(struct ivpu_device *vdev, u16 ssid);
+
+irqreturn_t ivpu_mmu_irq_evtq_handler(struct ivpu_device *vdev);
+irqreturn_t ivpu_mmu_irq_gerr_handler(struct ivpu_device *vdev);
+
+#endif /* __IVPU_MMU_H__ */
diff --git a/drivers/gpu/drm/ivpu/ivpu_mmu_context.c b/drivers/gpu/drm/ivpu/ivpu_mmu_context.c
new file mode 100644
index 000000000000..3849ff200450
--- /dev/null
+++ b/drivers/gpu/drm/ivpu/ivpu_mmu_context.c
@@ -0,0 +1,419 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#include <linux/bitfield.h>
+#include <linux/highmem.h>
+
+#include "ivpu_drv.h"
+#include "ivpu_hw.h"
+#include "ivpu_mmu.h"
+#include "ivpu_mmu_context.h"
+
+#define IVPU_MMU_PGD_INDEX_MASK          GENMASK(38, 30)
+#define IVPU_MMU_PMD_INDEX_MASK          GENMASK(29, 21)
+#define IVPU_MMU_PTE_INDEX_MASK          GENMASK(20, 12)
+#define IVPU_MMU_ENTRY_FLAGS_MASK        GENMASK(11, 0)
+#define IVPU_MMU_ENTRY_FLAG_NG           BIT(11)
+#define IVPU_MMU_ENTRY_FLAG_AF           BIT(10)
+#define IVPU_MMU_ENTRY_FLAG_USER         BIT(6)
+#define IVPU_MMU_ENTRY_FLAG_LLC_COHERENT BIT(2)
+#define IVPU_MMU_ENTRY_FLAG_TYPE_PAGE    BIT(1)
+#define IVPU_MMU_ENTRY_FLAG_VALID        BIT(0)
+
+#define IVPU_MMU_PAGE_SIZE    SZ_4K
+#define IVPU_MMU_PTE_MAP_SIZE (IVPU_MMU_PGTABLE_ENTRIES * IVPU_MMU_PAGE_SIZE)
+#define IVPU_MMU_PMD_MAP_SIZE (IVPU_MMU_PGTABLE_ENTRIES * IVPU_MMU_PTE_MAP_SIZE)
+#define IVPU_MMU_PGTABLE_SIZE (IVPU_MMU_PGTABLE_ENTRIES * sizeof(u64))
+
+#define IVPU_MMU_DUMMY_ADDRESS 0xdeadb000
+#define IVPU_MMU_ENTRY_VALID   (IVPU_MMU_ENTRY_FLAG_TYPE_PAGE | IVPU_MMU_ENTRY_FLAG_VALID)
+#define IVPU_MMU_ENTRY_INVALID (IVPU_MMU_DUMMY_ADDRESS & ~IVPU_MMU_ENTRY_FLAGS_MASK)
+#define IVPU_MMU_ENTRY_MAPPED  (IVPU_MMU_ENTRY_FLAG_AF | IVPU_MMU_ENTRY_FLAG_USER | \
+				IVPU_MMU_ENTRY_FLAG_NG | IVPU_MMU_ENTRY_VALID)
+
+static int ivpu_mmu_pgtable_init(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable)
+{
+	dma_addr_t pgd_dma;
+	u64 *pgd;
+
+	pgd = dma_alloc_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, &pgd_dma, GFP_KERNEL);
+	if (!pgd)
+		return -ENOMEM;
+
+	pgtable->pgd = pgd;
+	pgtable->pgd_dma = pgd_dma;
+
+	return 0;
+}
+
+static void ivpu_mmu_pgtable_free(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable)
+{
+	int pgd_index, pmd_index;
+
+	for (pgd_index = 0; pgd_index < IVPU_MMU_PGTABLE_ENTRIES; ++pgd_index) {
+		u64 **pmd_entries = pgtable->pgd_cpu_entries[pgd_index];
+		u64 *pmd = pgtable->pgd_entries[pgd_index];
+
+		if (!pmd_entries)
+			continue;
+
+		for (pmd_index = 0; pmd_index < IVPU_MMU_PGTABLE_ENTRIES; ++pmd_index) {
+			if (pmd_entries[pmd_index])
+				dma_free_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE,
+					    pmd_entries[pmd_index],
+					    pmd[pmd_index] & ~IVPU_MMU_ENTRY_FLAGS_MASK);
+		}
+
+		kfree(pmd_entries);
+		dma_free_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, pgtable->pgd_entries[pgd_index],
+			    pgtable->pgd[pgd_index] & ~IVPU_MMU_ENTRY_FLAGS_MASK);
+	}
+
+	dma_free_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, pgtable->pgd,
+		    pgtable->pgd_dma & ~IVPU_MMU_ENTRY_FLAGS_MASK);
+}
+
+static u64*
+ivpu_mmu_ensure_pmd(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable, u64 pgd_index)
+{
+	u64 **pmd_entries;
+	dma_addr_t pmd_dma;
+	u64 *pmd;
+
+	if (pgtable->pgd_entries[pgd_index])
+		return pgtable->pgd_entries[pgd_index];
+
+	pmd = dma_alloc_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, &pmd_dma, GFP_KERNEL);
+	if (!pmd)
+		return NULL;
+
+	pmd_entries = kzalloc(IVPU_MMU_PGTABLE_SIZE, GFP_KERNEL);
+	if (!pmd_entries)
+		goto err_free_pgd;
+
+	pgtable->pgd_entries[pgd_index] = pmd;
+	pgtable->pgd_cpu_entries[pgd_index] = pmd_entries;
+	pgtable->pgd[pgd_index] = pmd_dma | IVPU_MMU_ENTRY_VALID;
+
+	return pmd;
+
+err_free_pgd:
+	dma_free_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, pmd, pmd_dma);
+	return NULL;
+}
+
+static u64*
+ivpu_mmu_ensure_pte(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable,
+		    int pgd_index, int pmd_index)
+{
+	dma_addr_t pte_dma;
+	u64 *pte;
+
+	if (pgtable->pgd_cpu_entries[pgd_index][pmd_index])
+		return pgtable->pgd_cpu_entries[pgd_index][pmd_index];
+
+	pte = dma_alloc_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, &pte_dma, GFP_KERNEL);
+	if (!pte)
+		return NULL;
+
+	pgtable->pgd_cpu_entries[pgd_index][pmd_index] = pte;
+	pgtable->pgd_entries[pgd_index][pmd_index] = pte_dma | IVPU_MMU_ENTRY_VALID;
+
+	return pte;
+}
+
+static int
+ivpu_mmu_context_map_page(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
+			  u64 vpu_addr, dma_addr_t dma_addr, int prot)
+{
+	u64 *pte;
+	int pgd_index = FIELD_GET(IVPU_MMU_PGD_INDEX_MASK, vpu_addr);
+	int pmd_index = FIELD_GET(IVPU_MMU_PMD_INDEX_MASK, vpu_addr);
+	int pte_index = FIELD_GET(IVPU_MMU_PTE_INDEX_MASK, vpu_addr);
+
+	/* Allocate PMD - second level page table if needed */
+	if (!ivpu_mmu_ensure_pmd(vdev, &ctx->pgtable, pgd_index))
+		return -ENOMEM;
+
+	/* Allocate PTE - third level page table if needed */
+	pte = ivpu_mmu_ensure_pte(vdev, &ctx->pgtable, pgd_index, pmd_index);
+	if (!pte)
+		return -ENOMEM;
+
+	/* Update PTE - third level page table with DMA address */
+	pte[pte_index] = dma_addr | prot;
+
+	return 0;
+}
+
+static void ivpu_mmu_context_unmap_page(struct ivpu_mmu_context *ctx, u64 vpu_addr)
+{
+	int pgd_index = FIELD_GET(IVPU_MMU_PGD_INDEX_MASK, vpu_addr);
+	int pmd_index = FIELD_GET(IVPU_MMU_PMD_INDEX_MASK, vpu_addr);
+	int pte_index = FIELD_GET(IVPU_MMU_PTE_INDEX_MASK, vpu_addr);
+
+	/* Update PTE with dummy physical address and clear flags */
+	ctx->pgtable.pgd_cpu_entries[pgd_index][pmd_index][pte_index] = IVPU_MMU_ENTRY_INVALID;
+}
+
+static void
+ivpu_mmu_context_flush_page_tables(struct ivpu_mmu_context *ctx, u64 vpu_addr, size_t size)
+{
+	u64 end_addr = vpu_addr + size;
+	u64 *pgd = ctx->pgtable.pgd;
+
+	/* Align to PMD entry (2 MB) */
+	vpu_addr &= ~(IVPU_MMU_PTE_MAP_SIZE - 1);
+
+	while (vpu_addr < end_addr) {
+		int pgd_index = FIELD_GET(IVPU_MMU_PGD_INDEX_MASK, vpu_addr);
+		u64 pmd_end = (pgd_index + 1) * (u64)IVPU_MMU_PMD_MAP_SIZE;
+		u64 *pmd = ctx->pgtable.pgd_entries[pgd_index];
+
+		while (vpu_addr < end_addr && vpu_addr < pmd_end) {
+			int pmd_index = FIELD_GET(IVPU_MMU_PMD_INDEX_MASK, vpu_addr);
+			u64 *pte = ctx->pgtable.pgd_cpu_entries[pgd_index][pmd_index];
+
+			clflush_cache_range(pte, IVPU_MMU_PGTABLE_SIZE);
+			vpu_addr += IVPU_MMU_PTE_MAP_SIZE;
+		}
+		clflush_cache_range(pmd, IVPU_MMU_PGTABLE_SIZE);
+	}
+	clflush_cache_range(pgd, IVPU_MMU_PGTABLE_SIZE);
+}
+
+static int
+ivpu_mmu_context_map_pages(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
+			   u64 vpu_addr, dma_addr_t dma_addr, size_t size, int prot)
+{
+	while (size) {
+		int ret = ivpu_mmu_context_map_page(vdev, ctx, vpu_addr, dma_addr, prot);
+
+		if (ret)
+			return ret;
+
+		vpu_addr += IVPU_MMU_PAGE_SIZE;
+		dma_addr += IVPU_MMU_PAGE_SIZE;
+		size -= IVPU_MMU_PAGE_SIZE;
+	}
+
+	return 0;
+}
+
+static void ivpu_mmu_context_unmap_pages(struct ivpu_mmu_context *ctx, u64 vpu_addr, size_t size)
+{
+	while (size) {
+		ivpu_mmu_context_unmap_page(ctx, vpu_addr);
+		vpu_addr += IVPU_MMU_PAGE_SIZE;
+		size -= IVPU_MMU_PAGE_SIZE;
+	}
+}
+
+int
+ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
+			 u64 vpu_addr, struct sg_table *sgt,  bool llc_coherent)
+{
+	struct scatterlist *sg;
+	int prot;
+	int ret;
+	u64 i;
+
+	if (!IS_ALIGNED(vpu_addr, IVPU_MMU_PAGE_SIZE))
+		return -EINVAL;
+	/*
+	 * VPU is only 32 bit, but DMA engine is 38 bit
+	 * Ranges < 2 GB are reserved for VPU internal registers
+	 * Limit range to 8 GB
+	 */
+	if (vpu_addr < SZ_2G || vpu_addr > SZ_8G)
+		return -EINVAL;
+
+	prot = IVPU_MMU_ENTRY_MAPPED;
+	if (llc_coherent)
+		prot |= IVPU_MMU_ENTRY_FLAG_LLC_COHERENT;
+
+	mutex_lock(&ctx->lock);
+
+	for_each_sgtable_dma_sg(sgt, sg, i) {
+		u64 dma_addr = sg_dma_address(sg) - sg->offset;
+		size_t size = sg_dma_len(sg) + sg->offset;
+
+		ret = ivpu_mmu_context_map_pages(vdev, ctx, vpu_addr, dma_addr, size, prot);
+		if (ret) {
+			ivpu_err(vdev, "Failed to map context pages\n");
+			mutex_unlock(&ctx->lock);
+			return ret;
+		}
+		ivpu_mmu_context_flush_page_tables(ctx, vpu_addr, size);
+		vpu_addr += size;
+	}
+
+	mutex_unlock(&ctx->lock);
+
+	ret = ivpu_mmu_invalidate_tlb(vdev, ctx->id);
+	if (ret)
+		ivpu_err(vdev, "Failed to invalidate TLB for ctx %u: %d\n", ctx->id, ret);
+	return ret;
+}
+
+void
+ivpu_mmu_context_unmap_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
+			   u64 vpu_addr, struct sg_table *sgt)
+{
+	struct scatterlist *sg;
+	int ret;
+	u64 i;
+
+	if (!IS_ALIGNED(vpu_addr, IVPU_MMU_PAGE_SIZE))
+		ivpu_warn(vdev, "Unaligned vpu_addr: 0x%llx\n", vpu_addr);
+
+	mutex_lock(&ctx->lock);
+
+	for_each_sgtable_dma_sg(sgt, sg, i) {
+		size_t size = sg_dma_len(sg) + sg->offset;
+
+		ivpu_mmu_context_unmap_pages(ctx, vpu_addr, size);
+		ivpu_mmu_context_flush_page_tables(ctx, vpu_addr, size);
+		vpu_addr += size;
+	}
+
+	mutex_unlock(&ctx->lock);
+
+	ret = ivpu_mmu_invalidate_tlb(vdev, ctx->id);
+	if (ret)
+		ivpu_warn(vdev, "Failed to invalidate TLB for ctx %u: %d\n", ctx->id, ret);
+}
+
+int
+ivpu_mmu_context_insert_node_locked(struct ivpu_mmu_context *ctx,
+				    const struct ivpu_addr_range *range,
+				    u64 size, struct drm_mm_node *node)
+{
+	lockdep_assert_held(&ctx->lock);
+
+	return drm_mm_insert_node_in_range(&ctx->mm, node, size, IVPU_MMU_PAGE_SIZE,
+					  0, range->start, range->end, DRM_MM_INSERT_BEST);
+}
+
+void
+ivpu_mmu_context_remove_node_locked(struct ivpu_mmu_context *ctx, struct drm_mm_node *node)
+{
+	lockdep_assert_held(&ctx->lock);
+
+	drm_mm_remove_node(node);
+}
+
+static int
+ivpu_mmu_context_init(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx, u32 context_id)
+{
+	u64 start, end;
+	int ret;
+
+	mutex_init(&ctx->lock);
+	INIT_LIST_HEAD(&ctx->bo_list);
+
+	ret = ivpu_mmu_pgtable_init(vdev, &ctx->pgtable);
+	if (ret)
+		return ret;
+
+	if (!context_id) {
+		start = vdev->hw->ranges.global_low.start;
+		end = vdev->hw->ranges.global_high.end;
+	} else {
+		start = vdev->hw->ranges.user_low.start;
+		end = vdev->hw->ranges.user_high.end;
+	}
+
+	drm_mm_init(&ctx->mm, start, end - start);
+	ctx->id = context_id;
+
+	return 0;
+}
+
+static void ivpu_mmu_context_fini(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx)
+{
+	WARN_ON(!ctx->pgtable.pgd);
+
+	mutex_destroy(&ctx->lock);
+	ivpu_mmu_pgtable_free(vdev, &ctx->pgtable);
+	drm_mm_takedown(&ctx->mm);
+}
+
+int ivpu_mmu_global_context_init(struct ivpu_device *vdev)
+{
+	return ivpu_mmu_context_init(vdev, &vdev->gctx, IVPU_GLOBAL_CONTEXT_MMU_SSID);
+}
+
+void ivpu_mmu_global_context_fini(struct ivpu_device *vdev)
+{
+	return ivpu_mmu_context_fini(vdev, &vdev->gctx);
+}
+
+int ivpu_mmu_user_context_init(struct ivpu_file_priv *file_priv)
+{
+	struct ivpu_device *vdev = file_priv->vdev;
+	u32 context_id;
+	void *old;
+	int ret;
+
+	mutex_lock(&file_priv->lock);
+
+	if (file_priv->ctx.id)
+		goto unlock;
+
+	ret = xa_alloc(&vdev->context_xa, &context_id, NULL, vdev->context_xa_limit, GFP_KERNEL);
+	if (ret) {
+		ivpu_err(vdev, "Failed to allocate context_id\n");
+		goto err_unlock;
+	}
+
+	ret = ivpu_mmu_context_init(vdev, &file_priv->ctx, context_id);
+	if (ret) {
+		ivpu_err(vdev, "Failed to initialize context\n");
+		goto err_erase_context_id;
+	}
+
+	ret = ivpu_mmu_set_pgtable(vdev, context_id, &file_priv->ctx.pgtable);
+	if (ret) {
+		ivpu_err(vdev, "Failed to set page table\n");
+		goto err_context_fini;
+	}
+
+	old = xa_store(&vdev->context_xa, context_id, file_priv, GFP_KERNEL);
+	if (xa_is_err(old)) {
+		ret = xa_err(old);
+		ivpu_err(vdev, "Failed to store context %u: %d\n", context_id, ret);
+		goto err_clear_pgtable;
+	}
+
+	ivpu_dbg(FILE, "file_priv context init: id %u process %s pid %d\n",
+		 context_id, current->comm, task_pid_nr(current));
+
+unlock:
+	mutex_unlock(&file_priv->lock);
+	return 0;
+
+err_clear_pgtable:
+	ivpu_mmu_clear_pgtable(vdev, context_id);
+err_context_fini:
+	ivpu_mmu_context_fini(vdev, &file_priv->ctx);
+err_erase_context_id:
+	xa_erase(&vdev->context_xa, context_id);
+err_unlock:
+	mutex_unlock(&file_priv->lock);
+	return ret;
+}
+
+void ivpu_mmu_user_context_fini(struct ivpu_file_priv *file_priv)
+{
+	struct ivpu_device *vdev = file_priv->vdev;
+
+	WARN_ON(!file_priv->ctx.id);
+
+	xa_store(&vdev->context_xa, file_priv->ctx.id,  NULL, GFP_KERNEL);
+	ivpu_mmu_clear_pgtable(vdev, file_priv->ctx.id);
+	ivpu_mmu_context_fini(vdev, &file_priv->ctx);
+	xa_erase(&vdev->context_xa, file_priv->ctx.id);
+}
diff --git a/drivers/gpu/drm/ivpu/ivpu_mmu_context.h b/drivers/gpu/drm/ivpu/ivpu_mmu_context.h
new file mode 100644
index 000000000000..af163dfb0e04
--- /dev/null
+++ b/drivers/gpu/drm/ivpu/ivpu_mmu_context.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#ifndef __IVPU_MMU_CONTEXT_H__
+#define __IVPU_MMU_CONTEXT_H__
+
+#include <drm/drm_mm.h>
+
+struct ivpu_device;
+struct ivpu_file_priv;
+struct ivpu_addr_range;
+
+#define IVPU_MMU_PGTABLE_ENTRIES	512
+
+struct ivpu_mmu_pgtable {
+	u64             **pgd_cpu_entries[IVPU_MMU_PGTABLE_ENTRIES];
+	u64		*pgd_entries[IVPU_MMU_PGTABLE_ENTRIES];
+	u64		*pgd;
+	dma_addr_t	pgd_dma;
+};
+
+struct ivpu_mmu_context {
+	struct mutex lock; /* protects: mm, pgtable, bo_list */
+	struct drm_mm mm;
+	struct ivpu_mmu_pgtable pgtable;
+	struct list_head bo_list;
+	u32 id;
+};
+
+int ivpu_mmu_global_context_init(struct ivpu_device *vdev);
+void ivpu_mmu_global_context_fini(struct ivpu_device *vdev);
+
+int ivpu_mmu_user_context_init(struct ivpu_file_priv *file_priv);
+void ivpu_mmu_user_context_fini(struct ivpu_file_priv *file_priv);
+
+int ivpu_mmu_context_insert_node_locked(struct ivpu_mmu_context *ctx,
+					const struct ivpu_addr_range *range,
+				       u64 size, struct drm_mm_node *node);
+void ivpu_mmu_context_remove_node_locked(struct ivpu_mmu_context *ctx,
+					 struct drm_mm_node *node);
+
+int ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
+			     u64 vpu_addr, struct sg_table *sgt, bool llc_coherent);
+void ivpu_mmu_context_unmap_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
+				u64 vpu_addr, struct sg_table *sgt);
+
+#endif /* __IVPU_MMU_CONTEXT_H__ */
diff --git a/include/uapi/drm/ivpu_drm.h b/include/uapi/drm/ivpu_drm.h
index 7a7dbe2f521b..cb48d6118412 100644
--- a/include/uapi/drm/ivpu_drm.h
+++ b/include/uapi/drm/ivpu_drm.h
@@ -38,6 +38,7 @@ extern "C" {
 #define DRM_IVPU_PARAM_NUM_CONTEXTS	    4
 #define DRM_IVPU_PARAM_CONTEXT_BASE_ADDRESS 5
 #define DRM_IVPU_PARAM_CONTEXT_PRIORITY	    6
+#define DRM_IVPU_PARAM_CONTEXT_ID	    7
 
 #define DRM_IVPU_PLATFORM_TYPE_SILICON	    0
 
@@ -78,6 +79,9 @@ struct drm_ivpu_param {
 	 * Value of current context scheduling priority (read-write).
 	 * See DRM_IVPU_CONTEXT_PRIORITY_* for possible values.
 	 *
+	 * %DRM_IVPU_PARAM_CONTEXT_ID:
+	 * Current context ID, always greater than 0 (read-only)
+	 *
 	 */
 	__u32 param;
 
-- 
2.34.1

