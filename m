Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF316583FDB
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 15:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4097B90AC3;
	Thu, 28 Jul 2022 13:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9889D2A2AA
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 13:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659014253; x=1690550253;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LKBinXQZ35QsV0NDJzadyZBnBnSPbs56V2XYCAogypw=;
 b=S+OUhjVz8U6Cn5s4L6tniJwkiVi8IDo48MnPNXRzVr5FqaNqF4aHQXFC
 DoNJOKnECOXkUQPA5NEc+6rYC5Fl12eZAvDQvdYngglGcKz2/SEiftYAN
 wdwUqCRzFKN1t6htakI5jGdcidODzjv+Mqm0wuqYEoBFBbFtxLMXjnWtW
 7O3tfsFq0S8f4JRyLPwR+BnoUI6ozlipWnvep9nIhQedQv6B3EKXxcv4G
 lpU5DYQLlUnqsq8vTBuv3y/9CAt2ZHg7u7zxWrYlB3vW9DkpUFT3+QMI8
 Cb2UlQGnvawUNSGzU/swjeEVwmfKAbn7quOG7p91R1kO2fbpCM3VrJ17K A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="288520357"
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="288520357"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 06:17:33 -0700
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="659722656"
Received: from jlawryno-desktop.igk.intel.com ([172.22.229.64])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 06:17:31 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v1 2/7] drm/vpu: Add Intel VPU MMU support
Date: Thu, 28 Jul 2022 15:17:04 +0200
Message-Id: <20220728131709.1087188-3-jacek.lawrynowicz@linux.intel.com>
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

VPU Memory Management Unit is based on ARM MMU-600.
It allows to create multiple virtual address spaces for the device and
map noncontinuous host memory (there is no dedicated memory on the VPU).

Address space is implemented as a struct vpu_mmu_context, it has an ID,
drm_mm allocator for VPU addresses and struct vpu_mmu_pgtable that holds
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
  - vpu_mmu_context.c handles MMU page tables and memory mapping
  - vpu_mmu.c implements a driver that programs the MMU device

Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/gpu/drm/vpu/Makefile          |   4 +-
 drivers/gpu/drm/vpu/vpu_drv.c         |  59 +-
 drivers/gpu/drm/vpu/vpu_drv.h         |   6 +
 drivers/gpu/drm/vpu/vpu_hw_mtl.c      |  10 +
 drivers/gpu/drm/vpu/vpu_mmu.c         | 940 ++++++++++++++++++++++++++
 drivers/gpu/drm/vpu/vpu_mmu.h         |  53 ++
 drivers/gpu/drm/vpu/vpu_mmu_context.c | 418 ++++++++++++
 drivers/gpu/drm/vpu/vpu_mmu_context.h |  49 ++
 include/uapi/drm/vpu_drm.h            |   4 +
 9 files changed, 1540 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/vpu/vpu_mmu.c
 create mode 100644 drivers/gpu/drm/vpu/vpu_mmu.h
 create mode 100644 drivers/gpu/drm/vpu/vpu_mmu_context.c
 create mode 100644 drivers/gpu/drm/vpu/vpu_mmu_context.h

diff --git a/drivers/gpu/drm/vpu/Makefile b/drivers/gpu/drm/vpu/Makefile
index 5d6d2a2566cf..b789e3a6ed22 100644
--- a/drivers/gpu/drm/vpu/Makefile
+++ b/drivers/gpu/drm/vpu/Makefile
@@ -3,6 +3,8 @@
 
 intel_vpu-y := \
 	vpu_drv.o \
-	vpu_hw_mtl.o
+	vpu_hw_mtl.o \
+	vpu_mmu.o \
+	vpu_mmu_context.o
 
 obj-$(CONFIG_DRM_VPU) += intel_vpu.o
diff --git a/drivers/gpu/drm/vpu/vpu_drv.c b/drivers/gpu/drm/vpu/vpu_drv.c
index bbe7ad97a32c..75ec1fe9c3e2 100644
--- a/drivers/gpu/drm/vpu/vpu_drv.c
+++ b/drivers/gpu/drm/vpu/vpu_drv.c
@@ -14,6 +14,8 @@
 
 #include "vpu_drv.h"
 #include "vpu_hw.h"
+#include "vpu_mmu.h"
+#include "vpu_mmu_context.h"
 
 #ifndef DRIVER_VERSION_STR
 #define DRIVER_VERSION_STR __stringify(DRM_VPU_DRIVER_MAJOR) "." \
@@ -50,6 +52,11 @@ char *vpu_platform_to_str(u32 platform)
 
 void vpu_file_priv_get(struct vpu_file_priv *file_priv, struct vpu_file_priv **link)
 {
+	struct vpu_device *vdev = file_priv->vdev;
+
+	vpu_dbg(KREF, "file_priv get: ctx %u refcount %u\n",
+		file_priv->ctx.id, kref_read(&file_priv->ref));
+
 	kref_get(&file_priv->ref);
 	*link = file_priv;
 }
@@ -57,6 +64,12 @@ void vpu_file_priv_get(struct vpu_file_priv *file_priv, struct vpu_file_priv **l
 static void file_priv_release(struct kref *ref)
 {
 	struct vpu_file_priv *file_priv = container_of(ref, struct vpu_file_priv, ref);
+	struct vpu_device *vdev = file_priv->vdev;
+
+	vpu_dbg(FILE, "file_priv release: ctx %u\n", file_priv->ctx.id);
+
+	if (file_priv->ctx.id)
+		vpu_mmu_user_context_fini(file_priv);
 
 	kfree(file_priv);
 }
@@ -64,6 +77,10 @@ static void file_priv_release(struct kref *ref)
 void vpu_file_priv_put(struct vpu_file_priv **link)
 {
 	struct vpu_file_priv *file_priv = *link;
+	struct vpu_device *vdev = file_priv->vdev;
+
+	vpu_dbg(KREF, "file_priv put: ctx %u refcount %u\n",
+		file_priv->ctx.id, kref_read(&file_priv->ref));
 
 	*link = NULL;
 	kref_put(&file_priv->ref, file_priv_release);
@@ -75,7 +92,11 @@ static int vpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_fi
 	struct vpu_device *vdev = file_priv->vdev;
 	struct pci_dev *pdev = to_pci_dev(vdev->drm.dev);
 	struct drm_vpu_param *args = data;
-	int ret = 0;
+	int ret;
+
+	ret = vpu_mmu_user_context_init(file_priv);
+	if (ret)
+		return ret;
 
 	switch (args->param) {
 	case DRM_VPU_PARAM_DEVICE_ID:
@@ -99,6 +120,9 @@ static int vpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_fi
 	case DRM_VPU_PARAM_CONTEXT_PRIORITY:
 		args->value = file_priv->priority;
 		break;
+	case DRM_VPU_PARAM_CONTEXT_ID:
+		args->value = file_priv->ctx.id;
+		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -110,7 +134,11 @@ static int vpu_set_param_ioctl(struct drm_device *dev, void *data, struct drm_fi
 {
 	struct vpu_file_priv *file_priv = file->driver_priv;
 	struct drm_vpu_param *args = data;
-	int ret = 0;
+	int ret;
+
+	ret = vpu_mmu_user_context_init(file_priv);
+	if (ret)
+		return ret;
 
 	switch (args->param) {
 	case DRM_VPU_PARAM_CONTEXT_PRIORITY:
@@ -139,9 +167,13 @@ static int vpu_open(struct drm_device *dev, struct drm_file *file)
 	file_priv->priority = DRM_VPU_CONTEXT_PRIORITY_NORMAL;
 
 	kref_init(&file_priv->ref);
+	mutex_init(&file_priv->lock);
 
 	file->driver_priv = file_priv;
 
+	vpu_dbg(FILE, "file_priv alloc: process %s pid %d\n",
+		current->comm, task_pid_nr(current));
+
 	return 0;
 }
 
@@ -164,6 +196,7 @@ int vpu_shutdown(struct vpu_device *vdev)
 	int ret;
 
 	vpu_hw_irq_disable(vdev);
+	vpu_mmu_disable(vdev);
 
 	ret = vpu_hw_power_down(vdev);
 	if (ret)
@@ -272,6 +305,10 @@ static int vpu_dev_init(struct vpu_device *vdev)
 	if (!vdev->hw)
 		return -ENOMEM;
 
+	vdev->mmu = devm_kzalloc(vdev->drm.dev, sizeof(*vdev->mmu), GFP_KERNEL);
+	if (!vdev->mmu)
+		return -ENOMEM;
+
 	vdev->hw->ops = &vpu_hw_mtl_ops;
 	vdev->platform = VPU_PLATFORM_INVALID;
 
@@ -303,8 +340,24 @@ static int vpu_dev_init(struct vpu_device *vdev)
 		goto err_irq_fini;
 	}
 
+	ret = vpu_mmu_global_context_init(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to initialize global MMU context: %d\n", ret);
+		goto err_power_down;
+	}
+
+	ret = vpu_mmu_init(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to initialize MMU device: %d\n", ret);
+		goto err_mmu_gctx_fini;
+	}
+
 	return 0;
 
+err_mmu_gctx_fini:
+	vpu_mmu_global_context_fini(vdev);
+err_power_down:
+	vpu_hw_power_down(vdev);
 err_irq_fini:
 	vpu_irq_fini(vdev);
 err_pci_fini:
@@ -316,6 +369,8 @@ static void vpu_dev_fini(struct vpu_device *vdev)
 {
 	vpu_shutdown(vdev);
 
+	vpu_mmu_fini(vdev);
+	vpu_mmu_global_context_fini(vdev);
 	vpu_irq_fini(vdev);
 	vpu_pci_fini(vdev);
 
diff --git a/drivers/gpu/drm/vpu/vpu_drv.h b/drivers/gpu/drm/vpu/vpu_drv.h
index b2e7d355c0de..a9f3ad0c5f67 100644
--- a/drivers/gpu/drm/vpu/vpu_drv.h
+++ b/drivers/gpu/drm/vpu/vpu_drv.h
@@ -14,6 +14,8 @@
 #include <linux/xarray.h>
 #include <uapi/drm/vpu_drm.h>
 
+#include "vpu_mmu_context.h"
+
 #define DRIVER_NAME "intel_vpu"
 #define DRIVER_DESC "Driver for Intel Versatile Processing Unit (VPU)"
 #define DRIVER_DATE "20220101"
@@ -84,7 +86,9 @@ struct vpu_device {
 
 	struct vpu_wa_table wa;
 	struct vpu_hw_info *hw;
+	struct vpu_mmu_info *mmu;
 
+	struct vpu_mmu_context gctx;
 	struct xarray context_xa;
 	struct xa_limit context_xa_limit;
 
@@ -99,6 +103,8 @@ struct vpu_device {
 struct vpu_file_priv {
 	struct kref ref;
 	struct vpu_device *vdev;
+	struct mutex lock;
+	struct vpu_mmu_context ctx;
 	u32 priority;
 };
 
diff --git a/drivers/gpu/drm/vpu/vpu_hw_mtl.c b/drivers/gpu/drm/vpu/vpu_hw_mtl.c
index bdab4b84d202..901ec5c40de9 100644
--- a/drivers/gpu/drm/vpu/vpu_hw_mtl.c
+++ b/drivers/gpu/drm/vpu/vpu_hw_mtl.c
@@ -7,6 +7,7 @@
 #include "vpu_hw_mtl_reg.h"
 #include "vpu_hw_reg_io.h"
 #include "vpu_hw.h"
+#include "vpu_mmu.h"
 
 #define TILE_FUSE_ENABLE_BOTH	     0x0
 #define TILE_FUSE_ENABLE_LOWER	     0x1
@@ -930,6 +931,15 @@ static irqreturn_t vpu_hw_mtl_irqv_handler(struct vpu_device *vdev, int irq)
 
 	REGV_WR32(MTL_VPU_HOST_SS_ICB_CLEAR_0, status);
 
+	if (REG_TEST_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, MMU_IRQ_0_INT, status))
+		ret &= vpu_mmu_irq_evtq_handler(vdev);
+
+	if (REG_TEST_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, MMU_IRQ_1_INT, status))
+		vpu_dbg(IRQ, "MMU sync complete\n");
+
+	if (REG_TEST_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, MMU_IRQ_2_INT, status))
+		ret &= vpu_mmu_irq_gerr_handler(vdev);
+
 	if (REG_TEST_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, CPU_INT_REDIRECT_0_INT, status))
 		ret &= vpu_hw_mtl_irq_wdt_mss_handler(vdev);
 
diff --git a/drivers/gpu/drm/vpu/vpu_mmu.c b/drivers/gpu/drm/vpu/vpu_mmu.c
new file mode 100644
index 000000000000..ace91ee5a857
--- /dev/null
+++ b/drivers/gpu/drm/vpu/vpu_mmu.c
@@ -0,0 +1,940 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#include <linux/highmem.h>
+#include <linux/circ_buf.h>
+
+#include "vpu_drv.h"
+#include "vpu_hw_mtl_reg.h"
+#include "vpu_hw_reg_io.h"
+#include "vpu_mmu.h"
+#include "vpu_mmu_context.h"
+
+#define VPU_MMU_IDR0_REF		0x080f3e0f
+#define VPU_MMU_IDR0_REF_SIMICS		0x080f3e1f
+#define VPU_MMU_IDR1_REF		0x0e739d18
+#define VPU_MMU_IDR3_REF		0x0000003c
+#define VPU_MMU_IDR5_REF		0x00040070
+#define VPU_MMU_IDR5_REF_SIMICS		0x00000075
+#define VPU_MMU_IDR5_REF_FPGA		0x00800075
+
+#define VPU_MMU_CDTAB_ENT_SIZE		64
+#define VPU_MMU_CDTAB_ENT_COUNT_LOG2	8 /* 256 entries */
+#define VPU_MMU_CDTAB_ENT_COUNT		((u32)1 << VPU_MMU_CDTAB_ENT_COUNT_LOG2)
+
+#define VPU_MMU_STRTAB_ENT_SIZE		64
+#define VPU_MMU_STRTAB_ENT_COUNT	4
+#define VPU_MMU_STRTAB_CFG		0x2
+
+#define VPU_MMU_Q_COUNT_LOG2		4 /* 16 entries */
+#define VPU_MMU_Q_COUNT			((u32)1 << VPU_MMU_Q_COUNT_LOG2)
+#define VPU_MMU_Q_WRAP_BIT		(VPU_MMU_Q_COUNT << 1)
+#define VPU_MMU_Q_WRAP_MASK		(VPU_MMU_Q_WRAP_BIT - 1)
+#define VPU_MMU_Q_IDX_MASK		(VPU_MMU_Q_COUNT - 1)
+#define VPU_MMU_Q_IDX(val)		((val) & VPU_MMU_Q_IDX_MASK)
+
+#define VPU_MMU_CMDQ_CMD_SIZE		16
+#define VPU_MMU_CMDQ_SIZE		(VPU_MMU_Q_COUNT * VPU_MMU_CMDQ_CMD_SIZE)
+
+#define VPU_MMU_EVTQ_CMD_SIZE		32
+#define VPU_MMU_EVTQ_SIZE		(VPU_MMU_Q_COUNT * VPU_MMU_EVTQ_CMD_SIZE)
+
+#define VPU_MMU_CMD_OPCODE		GENMASK(8, 0)
+
+#define VPU_MMU_CMD_SYNC_0_CS		GENMASK(13, 12)
+#define VPU_MMU_CMD_SYNC_0_MSH		GENMASK(23, 22)
+#define VPU_MMU_CMD_SYNC_0_MSI_ATTR	GENMASK(27, 24)
+#define VPU_MMU_CMD_SYNC_0_MSI_ATTR	GENMASK(27, 24)
+#define VPU_MMU_CMD_SYNC_0_MSI_DATA	GENMASK(63, 32)
+
+#define VPU_MMU_CMD_CFGI_0_SSEC		BIT(10)
+#define VPU_MMU_CMD_CFGI_0_SSV		BIT(11)
+#define VPU_MMU_CMD_CFGI_0_SSID		GENMASK(31, 12)
+#define VPU_MMU_CMD_CFGI_0_SID		GENMASK(63, 32)
+#define VPU_MMU_CMD_CFGI_1_RANGE	GENMASK(4, 0)
+
+#define VPU_MMU_CMD_TLBI_0_ASID		GENMASK(63, 48)
+#define VPU_MMU_CMD_TLBI_0_VMID		GENMASK(47, 32)
+
+#define CMD_PREFETCH_CFG		0x1
+#define CMD_CFGI_STE			0x3
+#define CMD_CFGI_ALL			0x4
+#define CMD_CFGI_CD_ALL			0x6
+#define CMD_TLBI_NH_ASID		0x11
+#define CMD_TLBI_EL2_ALL		0x20
+#define CMD_TLBI_NSNH_ALL		0x30
+#define CMD_SYNC			0x46
+
+#define VPU_MMU_EVT_F_UUT		0x01
+#define VPU_MMU_EVT_C_BAD_STREAMID	0x02
+#define VPU_MMU_EVT_F_STE_FETCH		0x03
+#define VPU_MMU_EVT_C_BAD_STE		0x04
+#define VPU_MMU_EVT_F_BAD_ATS_TREQ	0x05
+#define VPU_MMU_EVT_F_STREAM_DISABLED	0x06
+#define VPU_MMU_EVT_F_TRANSL_FORBIDDEN	0x07
+#define VPU_MMU_EVT_C_BAD_SUBSTREAMID	0x08
+#define VPU_MMU_EVT_F_CD_FETCH		0x09
+#define VPU_MMU_EVT_C_BAD_CD		0x0a
+#define VPU_MMU_EVT_F_WALK_EABT		0x0b
+#define VPU_MMU_EVT_F_TRANSLATION	0x10
+#define VPU_MMU_EVT_F_ADDR_SIZE		0x11
+#define VPU_MMU_EVT_F_ACCESS		0x12
+#define VPU_MMU_EVT_F_PERMISSION	0x13
+#define VPU_MMU_EVT_F_TLB_CONFLICT	0x20
+#define VPU_MMU_EVT_F_CFG_CONFLICT	0x21
+#define VPU_MMU_EVT_E_PAGE_REQUEST	0x24
+#define VPU_MMU_EVT_F_VMS_FETCH		0x25
+
+#define VPU_MMU_EVTS_MAX		8
+
+#define VPU_MMU_EVT_OP_MASK		GENMASK_ULL(7, 0)
+#define VPU_MMU_EVT_SSID_MASK		GENMASK_ULL(31, 12)
+
+#define VPU_MMU_Q_BASE_RWA		BIT(62)
+#define VPU_MMU_Q_BASE_ADDR_MASK	GENMASK_ULL(51, 5)
+#define VPU_MMU_STRTAB_BASE_RA		BIT(62)
+#define VPU_MMU_STRTAB_BASE_ADDR_MASK	GENMASK_ULL(51, 6)
+
+#define VPU_MMU_IRQ_EVTQ_EN		BIT(2)
+#define VPU_MMU_IRQ_GERROR_EN		BIT(0)
+
+#define VPU_MMU_CR0_ATSCHK		BIT(4)
+#define VPU_MMU_CR0_CMDQEN		BIT(3)
+#define VPU_MMU_CR0_EVTQEN		BIT(2)
+#define VPU_MMU_CR0_PRIQEN		BIT(1)
+#define VPU_MMU_CR0_SMMUEN		BIT(0)
+
+#define VPU_MMU_CR1_TABLE_SH		GENMASK(11, 10)
+#define VPU_MMU_CR1_TABLE_OC		GENMASK(9, 8)
+#define VPU_MMU_CR1_TABLE_IC		GENMASK(7, 6)
+#define VPU_MMU_CR1_QUEUE_SH		GENMASK(5, 4)
+#define VPU_MMU_CR1_QUEUE_OC		GENMASK(3, 2)
+#define VPU_MMU_CR1_QUEUE_IC		GENMASK(1, 0)
+#define VPU_MMU_CACHE_NC		0
+#define VPU_MMU_CACHE_WB		1
+#define VPU_MMU_CACHE_WT		2
+#define VPU_MMU_SH_NSH			0
+#define VPU_MMU_SH_OSH			2
+#define VPU_MMU_SH_ISH			3
+
+#define VPU_MMU_CMDQ_OP			GENMASK_ULL(7, 0)
+
+#define VPU_MMU_CD_0_TCR_T0SZ		GENMASK_ULL(5, 0)
+#define VPU_MMU_CD_0_TCR_TG0		GENMASK_ULL(7, 6)
+#define VPU_MMU_CD_0_TCR_IRGN0		GENMASK_ULL(9, 8)
+#define VPU_MMU_CD_0_TCR_ORGN0		GENMASK_ULL(11, 10)
+#define VPU_MMU_CD_0_TCR_SH0		GENMASK_ULL(13, 12)
+#define VPU_MMU_CD_0_TCR_EPD0		BIT_ULL(14)
+#define VPU_MMU_CD_0_TCR_EPD1		BIT_ULL(30)
+#define VPU_MMU_CD_0_ENDI		BIT(15)
+#define VPU_MMU_CD_0_V			BIT(31)
+#define VPU_MMU_CD_0_TCR_IPS		GENMASK_ULL(34, 32)
+#define VPU_MMU_CD_0_TCR_TBI0		BIT_ULL(38)
+#define VPU_MMU_CD_0_AA64		BIT(41)
+#define VPU_MMU_CD_0_S			BIT(44)
+#define VPU_MMU_CD_0_R			BIT(45)
+#define VPU_MMU_CD_0_A			BIT(46)
+#define VPU_MMU_CD_0_ASET		BIT(47)
+#define VPU_MMU_CD_0_ASID		GENMASK_ULL(63, 48)
+
+#define VPU_MMU_CD_1_TTB0_MASK		GENMASK_ULL(51, 4)
+
+#define VPU_MMU_STE_0_S1CDMAX		GENMASK_ULL(63, 59)
+#define VPU_MMU_STE_0_S1FMT		GENMASK_ULL(5, 4)
+#define VPU_MMU_STE_0_S1FMT_LINEAR	0
+#define VPU_MMU_STE_DWORDS		8
+#define VPU_MMU_STE_0_CFG_S1_TRANS	5
+#define VPU_MMU_STE_0_CFG		GENMASK_ULL(3, 1)
+#define VPU_MMU_STE_0_S1CTXPTR_MASK	GENMASK_ULL(51, 6)
+#define VPU_MMU_STE_0_V			BIT(0)
+
+#define VPU_MMU_STE_1_STRW_NSEL1	0ul
+#define VPU_MMU_STE_1_STRW		GENMASK_ULL(31, 30)
+#define VPU_MMU_STE_1_PRIVCFG		GENMASK_ULL(49, 48)
+#define VPU_MMU_STE_1_PRIVCFG_UNPRIV	2ul
+#define VPU_MMU_STE_1_INSTCFG		GENMASK_ULL(51, 50)
+#define VPU_MMU_STE_1_INSTCFG_DATA	2ul
+#define VPU_MMU_STE_1_MEV		BIT(19)
+#define VPU_MMU_STE_1_S1STALLD		BIT(27)
+#define VPU_MMU_STE_1_S1C_CACHE_NC	0ul
+#define VPU_MMU_STE_1_S1C_CACHE_WBRA	1ul
+#define VPU_MMU_STE_1_S1C_CACHE_WT	2ul
+#define VPU_MMU_STE_1_S1C_CACHE_WB	3ul
+#define VPU_MMU_STE_1_S1CIR		GENMASK_ULL(3, 2)
+#define VPU_MMU_STE_1_S1COR		GENMASK_ULL(5, 4)
+#define VPU_MMU_STE_1_S1CSH		GENMASK_ULL(7, 6)
+#define VPU_MMU_STE_1_S1DSS		GENMASK_ULL(1, 0)
+#define VPU_MMU_STE_1_S1DSS_TERMINATE	0x0
+
+#define VPU_MMU_REG_TIMEOUT_US		(10 * USEC_PER_MSEC)
+#define VPU_MMU_QUEUE_TIMEOUT_US	(100 * USEC_PER_MSEC)
+
+#define VPU_MMU_GERROR_ERR_MASK ((REG_FLD(MTL_VPU_HOST_MMU_GERROR, CMDQ)) | \
+				 (REG_FLD(MTL_VPU_HOST_MMU_GERROR, EVTQ_ABT)) | \
+				 (REG_FLD(MTL_VPU_HOST_MMU_GERROR, PRIQ_ABT)) | \
+				 (REG_FLD(MTL_VPU_HOST_MMU_GERROR, MSI_CMDQ_ABT)) | \
+				 (REG_FLD(MTL_VPU_HOST_MMU_GERROR, MSI_EVTQ_ABT)) | \
+				 (REG_FLD(MTL_VPU_HOST_MMU_GERROR, MSI_PRIQ_ABT)) | \
+				 (REG_FLD(MTL_VPU_HOST_MMU_GERROR, MSI_ABT)) | \
+				 (REG_FLD(MTL_VPU_HOST_MMU_GERROR, SFM)))
+
+static char *vpu_mmu_evt_to_str(u32 cmd)
+{
+	switch (cmd) {
+	case VPU_MMU_EVT_F_UUT:
+		return "Unsupported Upstream Transaction";
+	case VPU_MMU_EVT_C_BAD_STREAMID:
+		return "Transaction StreamID out of range";
+	case VPU_MMU_EVT_F_STE_FETCH:
+		return "Fetch of STE caused external abort";
+	case VPU_MMU_EVT_C_BAD_STE:
+		return "Used STE invalid";
+	case VPU_MMU_EVT_F_BAD_ATS_TREQ:
+		return "Address Request disallowed for a StreamID";
+	case VPU_MMU_EVT_F_STREAM_DISABLED:
+		return "Transaction marks non-substream disabled";
+	case VPU_MMU_EVT_F_TRANSL_FORBIDDEN:
+		return "MMU bypass is disallowed for this StreamID";
+	case VPU_MMU_EVT_C_BAD_SUBSTREAMID:
+		return "Invalid StreamID";
+	case VPU_MMU_EVT_F_CD_FETCH:
+		return "Fetch of CD caused external abort";
+	case VPU_MMU_EVT_C_BAD_CD:
+		return "Fetched CD invalid";
+	case VPU_MMU_EVT_F_WALK_EABT:
+		return " An external abort occurred fetching a TLB";
+	case VPU_MMU_EVT_F_TRANSLATION:
+		return "Translation fault";
+	case VPU_MMU_EVT_F_ADDR_SIZE:
+		return " Output address caused address size fault";
+	case VPU_MMU_EVT_F_ACCESS:
+		return "Access flag fault";
+	case VPU_MMU_EVT_F_PERMISSION:
+		return "Permission fault occurred on page access";
+	case VPU_MMU_EVT_F_TLB_CONFLICT:
+		return "A TLB conflict";
+	case VPU_MMU_EVT_F_CFG_CONFLICT:
+		return "A configuration cache conflict";
+	case VPU_MMU_EVT_E_PAGE_REQUEST:
+		return "Page request hint from a client device";
+	case VPU_MMU_EVT_F_VMS_FETCH:
+		return "Fetch of VMS caused external abort";
+	default:
+		return "Unknown CMDQ command";
+	}
+}
+
+static int vpu_mmu_config_check(struct vpu_device *vdev)
+{
+	u32 val_ref;
+	u32 val;
+
+	if (vpu_is_simics(vdev))
+		val_ref = VPU_MMU_IDR0_REF_SIMICS;
+	else
+		val_ref = VPU_MMU_IDR0_REF;
+
+	val = REGV_RD32(MTL_VPU_HOST_MMU_IDR0);
+	if (val != val_ref)
+		vpu_err(vdev, "IDR0 0x%x != IDR0_REF 0x%x\n", val, val_ref);
+
+	val = REGV_RD32(MTL_VPU_HOST_MMU_IDR1);
+	if (val != VPU_MMU_IDR1_REF)
+		vpu_warn(vdev, "IDR1 0x%x != IDR1_REF 0x%x\n", val, VPU_MMU_IDR1_REF);
+
+	val = REGV_RD32(MTL_VPU_HOST_MMU_IDR3);
+	if (val != VPU_MMU_IDR3_REF)
+		vpu_warn(vdev, "IDR3 0x%x != IDR3_REF 0x%x\n", val, VPU_MMU_IDR3_REF);
+
+	if (vpu_is_simics(vdev))
+		val_ref = VPU_MMU_IDR5_REF_SIMICS;
+	else if (vpu_is_fpga(vdev))
+		val_ref = VPU_MMU_IDR5_REF_FPGA;
+	else
+		val_ref = VPU_MMU_IDR5_REF;
+
+	val = REGV_RD32(MTL_VPU_HOST_MMU_IDR5);
+	if (val != val_ref)
+		vpu_warn(vdev, "IDR5 0x%x != IDR5_REF 0x%x\n", val, val_ref);
+
+	return 0;
+}
+
+static int vpu_mmu_cdtab_alloc(struct vpu_device *vdev)
+{
+	struct vpu_mmu_info *mmu = vdev->mmu;
+	struct vpu_mmu_cdtab *cdtab = &mmu->cdtab;
+	size_t size = VPU_MMU_CDTAB_ENT_COUNT * VPU_MMU_CDTAB_ENT_SIZE;
+
+	cdtab->base = dmam_alloc_coherent(vdev->drm.dev, size, &cdtab->dma, GFP_KERNEL);
+	if (!cdtab->base)
+		return -ENOMEM;
+
+	vpu_dbg(MMU, "CDTAB alloc: dma=%pad size=%zu\n", &cdtab->dma, size);
+
+	return 0;
+}
+
+static int vpu_mmu_strtab_alloc(struct vpu_device *vdev)
+{
+	struct vpu_mmu_info *mmu = vdev->mmu;
+	struct vpu_mmu_strtab *strtab = &mmu->strtab;
+	size_t size = VPU_MMU_STRTAB_ENT_COUNT * VPU_MMU_STRTAB_ENT_SIZE;
+
+	strtab->base = dmam_alloc_coherent(vdev->drm.dev, size, &strtab->dma, GFP_KERNEL);
+	if (!strtab->base)
+		return -ENOMEM;
+
+	strtab->base_cfg = VPU_MMU_STRTAB_CFG;
+	strtab->dma_q = VPU_MMU_STRTAB_BASE_RA;
+	strtab->dma_q |= strtab->dma & VPU_MMU_STRTAB_BASE_ADDR_MASK;
+
+	vpu_dbg(MMU, "STRTAB alloc: dma=%pad dma_q=%pad size=%zu\n",
+		&strtab->dma, &strtab->dma_q, size);
+
+	return 0;
+}
+
+static int vpu_mmu_cmdq_alloc(struct vpu_device *vdev)
+{
+	struct vpu_mmu_info *mmu = vdev->mmu;
+	struct vpu_mmu_queue *q = &mmu->cmdq;
+
+	q->base = dmam_alloc_coherent(vdev->drm.dev, VPU_MMU_CMDQ_SIZE, &q->dma, GFP_KERNEL);
+	if (!q->base)
+		return -ENOMEM;
+
+	q->dma_q = VPU_MMU_Q_BASE_RWA;
+	q->dma_q |= q->dma & VPU_MMU_Q_BASE_ADDR_MASK;
+	q->dma_q |= VPU_MMU_Q_COUNT_LOG2;
+
+	vpu_dbg(MMU, "CMDQ alloc: dma=%pad dma_q=%pad size=%u\n",
+		&q->dma, &q->dma_q, VPU_MMU_CMDQ_SIZE);
+
+	return 0;
+}
+
+static int vpu_mmu_evtq_alloc(struct vpu_device *vdev)
+{
+	struct vpu_mmu_info *mmu = vdev->mmu;
+	struct vpu_mmu_queue *q = &mmu->evtq;
+
+	q->base = dmam_alloc_coherent(vdev->drm.dev, VPU_MMU_EVTQ_SIZE, &q->dma, GFP_KERNEL);
+	if (!q->base)
+		return -ENOMEM;
+
+	q->dma_q = VPU_MMU_Q_BASE_RWA;
+	q->dma_q |= q->dma & VPU_MMU_Q_BASE_ADDR_MASK;
+	q->dma_q |= VPU_MMU_Q_COUNT_LOG2;
+
+	vpu_dbg(MMU, "EVTQ alloc: dma=%pad dma_q=%pad size=%u\n",
+		&q->dma, &q->dma_q, VPU_MMU_EVTQ_SIZE);
+
+	return 0;
+}
+
+static int vpu_mmu_structs_alloc(struct vpu_device *vdev)
+{
+	int ret;
+
+	ret = vpu_mmu_cdtab_alloc(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to allocate cdtab: %d\n", ret);
+		return ret;
+	}
+
+	ret = vpu_mmu_strtab_alloc(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to allocate strtab: %d\n", ret);
+		return ret;
+	}
+
+	ret = vpu_mmu_cmdq_alloc(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to allocate cmdq: %d\n", ret);
+		return ret;
+	}
+
+	ret = vpu_mmu_evtq_alloc(vdev);
+	if (ret)
+		vpu_err(vdev, "Failed to allocate evtq: %d\n", ret);
+
+	return ret;
+}
+
+static int vpu_mmu_reg_write(struct vpu_device *vdev, u32 reg, u32 val)
+{
+	u32 reg_ack = reg + 4; /* ACK register is 4B after base register */
+	u32 val_ack;
+	int ret;
+
+	REGV_WR32(reg, val);
+
+	ret = REGV_POLL(reg_ack, val_ack, (val == val_ack), VPU_MMU_REG_TIMEOUT_US);
+	if (ret)
+		vpu_err(vdev, "Failed to write register 0x%x\n", reg);
+
+	return ret;
+}
+
+static int vpu_mmu_irqs_setup(struct vpu_device *vdev)
+{
+	u32 irq_ctrl = VPU_MMU_IRQ_EVTQ_EN | VPU_MMU_IRQ_GERROR_EN;
+	int ret;
+
+	ret = vpu_mmu_reg_write(vdev, MTL_VPU_HOST_MMU_IRQ_CTRL, 0);
+	if (ret)
+		return ret;
+
+	return vpu_mmu_reg_write(vdev, MTL_VPU_HOST_MMU_IRQ_CTRL, irq_ctrl);
+}
+
+static int vpu_mmu_cmdq_wait_for_cons(struct vpu_device *vdev)
+{
+	struct vpu_mmu_queue *cmdq = &vdev->mmu->cmdq;
+
+	return REGV_POLL(MTL_VPU_HOST_MMU_CMDQ_CONS, cmdq->cons, (cmdq->prod == cmdq->cons),
+			 VPU_MMU_QUEUE_TIMEOUT_US);
+}
+
+static int vpu_mmu_cmdq_cmd_write(struct vpu_device *vdev, const char *name, u64 data0, u64 data1)
+{
+	struct vpu_mmu_queue *q = &vdev->mmu->cmdq;
+	u64 *queue_buffer = q->base;
+	int idx = VPU_MMU_Q_IDX(q->prod) * (VPU_MMU_CMDQ_CMD_SIZE / sizeof(*queue_buffer));
+
+	if (!CIRC_SPACE(VPU_MMU_Q_IDX(q->prod), VPU_MMU_Q_IDX(q->cons), VPU_MMU_Q_COUNT)) {
+		vpu_err(vdev, "Failed to write MMU CMD %s\n", name);
+		return -EBUSY;
+	}
+
+	queue_buffer[idx] = data0;
+	queue_buffer[idx + 1] = data1;
+	q->prod = (q->prod + 1) & VPU_MMU_Q_WRAP_MASK;
+
+	vpu_dbg(MMU, "CMD write: %s data: 0x%llx 0x%llx\n", name, data0, data1);
+
+	return 0;
+}
+
+static int vpu_mmu_cmdq_sync(struct vpu_device *vdev)
+{
+	struct vpu_mmu_queue *q = &vdev->mmu->cmdq;
+	u64 val;
+	int ret;
+
+	val = FIELD_PREP(VPU_MMU_CMD_OPCODE, CMD_SYNC) |
+	      FIELD_PREP(VPU_MMU_CMD_SYNC_0_CS, 0x2) |
+	      FIELD_PREP(VPU_MMU_CMD_SYNC_0_MSH, 0x3) |
+	      FIELD_PREP(VPU_MMU_CMD_SYNC_0_MSI_ATTR, 0xf);
+
+	ret = vpu_mmu_cmdq_cmd_write(vdev, "SYNC", val, 0);
+	if (ret)
+		return ret;
+
+	clflush_cache_range(q->base, VPU_MMU_CMDQ_SIZE);
+	REGV_WR32(MTL_VPU_HOST_MMU_CMDQ_PROD, q->prod);
+
+	ret = vpu_mmu_cmdq_wait_for_cons(vdev);
+	if (ret)
+		vpu_err(vdev, "Timed out waiting for consumer: %d\n", ret);
+
+	return ret;
+}
+
+static int
+vpu_mmu_cmdq_write_cmd_to_each_sid(struct vpu_device *vdev, const char *name, u64 data0, u64 data1)
+{
+	const int VPU_MMU_SID_COUNT = 4;
+	int ret;
+	int i;
+
+	for (i = 0; i < VPU_MMU_SID_COUNT; i++) {
+		data0 |= FIELD_PREP(VPU_MMU_CMD_CFGI_0_SID, i);
+
+		ret = vpu_mmu_cmdq_cmd_write(vdev, name, data0, data1);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int vpu_mmu_cmdq_write_prefetch_cfg(struct vpu_device *vdev)
+{
+	u64 val = FIELD_PREP(VPU_MMU_CMD_OPCODE, CMD_PREFETCH_CFG);
+
+	return vpu_mmu_cmdq_write_cmd_to_each_sid(vdev, "PREFETCH_CFG", val, 0);
+}
+
+static int vpu_mmu_cmdq_write_cfgi_ste(struct vpu_device *vdev)
+{
+	u64 val = FIELD_PREP(VPU_MMU_CMD_OPCODE, CMD_CFGI_STE);
+
+	return vpu_mmu_cmdq_write_cmd_to_each_sid(vdev, "CFGI_STE", val, 0);
+}
+
+static int vpu_mmu_cmdq_write_cfgi_cd_all(struct vpu_device *vdev)
+{
+	u64 val = FIELD_PREP(VPU_MMU_CMD_OPCODE, CMD_CFGI_CD_ALL);
+
+	return vpu_mmu_cmdq_write_cmd_to_each_sid(vdev, "CFGI_CD_ALL", val, 0);
+}
+
+static int vpu_mmu_cmdq_write_cfgi_all(struct vpu_device *vdev)
+{
+	u64 data0 = FIELD_PREP(VPU_MMU_CMD_OPCODE, CMD_CFGI_ALL);
+	u64 data1 = FIELD_PREP(VPU_MMU_CMD_CFGI_1_RANGE, 0x1f);
+
+	return vpu_mmu_cmdq_cmd_write(vdev, "CFGI_ALL", data0, data1);
+}
+
+static int vpu_mmu_cmdq_write_tlbi_nh_asid(struct vpu_device *vdev, u16 ssid)
+{
+	u64 val = FIELD_PREP(VPU_MMU_CMD_OPCODE, CMD_TLBI_NH_ASID) |
+		  FIELD_PREP(VPU_MMU_CMD_TLBI_0_ASID, ssid);
+
+	return vpu_mmu_cmdq_cmd_write(vdev, "TLBI_NH_ASID", val, 0);
+}
+
+static int vpu_mmu_cmdq_write_tlbi_el2_all(struct vpu_device *vdev)
+{
+	u64 val = FIELD_PREP(VPU_MMU_CMD_OPCODE, CMD_TLBI_EL2_ALL);
+
+	return vpu_mmu_cmdq_cmd_write(vdev, "TLBI_EL2_ALL", val, 0);
+}
+
+static int vpu_mmu_cmdq_write_tlbi_nsnh_all(struct vpu_device *vdev)
+{
+	u64 val = FIELD_PREP(VPU_MMU_CMD_OPCODE, CMD_TLBI_NSNH_ALL);
+
+	return vpu_mmu_cmdq_cmd_write(vdev, "TLBI_NSNH_ALL", val, 0);
+}
+
+static int vpu_mmu_reset(struct vpu_device *vdev)
+{
+	struct vpu_mmu_info *mmu = vdev->mmu;
+	u32 val;
+	int ret;
+
+	memset(mmu->cmdq.base, 0, VPU_MMU_CMDQ_SIZE);
+	clflush_cache_range(mmu->cmdq.base, VPU_MMU_CMDQ_SIZE);
+	mmu->cmdq.prod = 0;
+	mmu->cmdq.cons = 0;
+
+	memset(mmu->evtq.base, 0, VPU_MMU_EVTQ_SIZE);
+	clflush_cache_range(mmu->evtq.base, VPU_MMU_EVTQ_SIZE);
+	mmu->evtq.prod = 0;
+	mmu->evtq.cons = 0;
+
+	ret = vpu_mmu_reg_write(vdev, MTL_VPU_HOST_MMU_CR0, 0);
+	if (ret)
+		return ret;
+
+	val = FIELD_PREP(VPU_MMU_CR1_TABLE_SH, VPU_MMU_SH_ISH) |
+	      FIELD_PREP(VPU_MMU_CR1_TABLE_OC, VPU_MMU_CACHE_WB) |
+	      FIELD_PREP(VPU_MMU_CR1_TABLE_IC, VPU_MMU_CACHE_WB) |
+	      FIELD_PREP(VPU_MMU_CR1_QUEUE_SH, VPU_MMU_SH_ISH) |
+	      FIELD_PREP(VPU_MMU_CR1_QUEUE_OC, VPU_MMU_CACHE_WB) |
+	      FIELD_PREP(VPU_MMU_CR1_QUEUE_IC, VPU_MMU_CACHE_WB);
+	REGV_WR32(MTL_VPU_HOST_MMU_CR1, val);
+
+	REGV_WR64(MTL_VPU_HOST_MMU_STRTAB_BASE, mmu->strtab.dma_q);
+	REGV_WR32(MTL_VPU_HOST_MMU_STRTAB_BASE_CFG, mmu->strtab.base_cfg);
+
+	REGV_WR64(MTL_VPU_HOST_MMU_CMDQ_BASE, mmu->cmdq.dma_q);
+	REGV_WR32(MTL_VPU_HOST_MMU_CMDQ_PROD, 0);
+	REGV_WR32(MTL_VPU_HOST_MMU_CMDQ_CONS, 0);
+
+	val = VPU_MMU_CR0_CMDQEN;
+	ret = vpu_mmu_reg_write(vdev, MTL_VPU_HOST_MMU_CR0, val);
+	if (ret)
+		return ret;
+
+	ret = vpu_mmu_cmdq_write_cfgi_all(vdev);
+	if (ret)
+		return ret;
+
+	ret = vpu_mmu_cmdq_write_tlbi_el2_all(vdev);
+	if (ret)
+		return ret;
+
+	ret = vpu_mmu_cmdq_write_tlbi_nsnh_all(vdev);
+	if (ret)
+		return ret;
+
+	ret = vpu_mmu_cmdq_sync(vdev);
+	if (ret)
+		return ret;
+
+	REGV_WR64(MTL_VPU_HOST_MMU_EVTQ_BASE, mmu->evtq.dma_q);
+	REGV_WR32(MTL_VPU_HOST_MMU_EVTQ_PROD_SEC, 0);
+	REGV_WR32(MTL_VPU_HOST_MMU_EVTQ_CONS_SEC, 0);
+
+	val |= VPU_MMU_CR0_EVTQEN;
+	ret = vpu_mmu_reg_write(vdev, MTL_VPU_HOST_MMU_CR0, val);
+	if (ret)
+		return ret;
+
+	val |= VPU_MMU_CR0_ATSCHK;
+	ret = vpu_mmu_reg_write(vdev, MTL_VPU_HOST_MMU_CR0, val);
+	if (ret)
+		return ret;
+
+	ret = vpu_mmu_irqs_setup(vdev);
+	if (ret)
+		return ret;
+
+	val |= VPU_MMU_CR0_SMMUEN;
+	return vpu_mmu_reg_write(vdev, MTL_VPU_HOST_MMU_CR0, val);
+}
+
+static void vpu_mmu_strtab_link_cd(struct vpu_device *vdev, u32 sid)
+{
+	struct vpu_mmu_info *mmu = vdev->mmu;
+	struct vpu_mmu_strtab *strtab = &mmu->strtab;
+	struct vpu_mmu_cdtab *cdtab = &mmu->cdtab;
+	u64 *entry = strtab->base + (sid * VPU_MMU_STRTAB_ENT_SIZE);
+	u64 str[2];
+
+	str[0] = FIELD_PREP(VPU_MMU_STE_0_CFG, VPU_MMU_STE_0_CFG_S1_TRANS) |
+		 FIELD_PREP(VPU_MMU_STE_0_S1CDMAX, VPU_MMU_CDTAB_ENT_COUNT_LOG2) |
+		 FIELD_PREP(VPU_MMU_STE_0_S1FMT, VPU_MMU_STE_0_S1FMT_LINEAR) |
+		 VPU_MMU_STE_0_V |
+		 (cdtab->dma & VPU_MMU_STE_0_S1CTXPTR_MASK);
+
+	str[1] = FIELD_PREP(VPU_MMU_STE_1_S1DSS, VPU_MMU_STE_1_S1DSS_TERMINATE) |
+		 FIELD_PREP(VPU_MMU_STE_1_S1CIR, VPU_MMU_STE_1_S1C_CACHE_NC) |
+		 FIELD_PREP(VPU_MMU_STE_1_S1COR, VPU_MMU_STE_1_S1C_CACHE_NC) |
+		 FIELD_PREP(VPU_MMU_STE_1_S1CSH, VPU_MMU_SH_NSH) |
+		 FIELD_PREP(VPU_MMU_STE_1_PRIVCFG, VPU_MMU_STE_1_PRIVCFG_UNPRIV) |
+		 FIELD_PREP(VPU_MMU_STE_1_INSTCFG, VPU_MMU_STE_1_INSTCFG_DATA) |
+		 FIELD_PREP(VPU_MMU_STE_1_STRW, VPU_MMU_STE_1_STRW_NSEL1) |
+		 VPU_MMU_STE_1_MEV |
+		 VPU_MMU_STE_1_S1STALLD;
+
+	WRITE_ONCE(entry[1], str[1]);
+	WRITE_ONCE(entry[0], str[0]);
+
+	clflush_cache_range(entry, VPU_MMU_STRTAB_ENT_SIZE);
+
+	vpu_dbg(MMU, "STRTAB write entry (SSID=%u): 0x%llx, 0x%llx\n",
+		sid, str[0], str[1]);
+}
+
+static int vpu_mmu_strtab_init(struct vpu_device *vdev)
+{
+	int i;
+
+	for (i = 0; i < VPU_MMU_STRTAB_ENT_COUNT; i++)
+		vpu_mmu_strtab_link_cd(vdev, i);
+
+	return 0;
+}
+
+int vpu_mmu_invalidate_tlb(struct vpu_device *vdev, u16 ssid)
+{
+	struct vpu_mmu_info *mmu = vdev->mmu;
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
+	ret = vpu_mmu_cmdq_write_tlbi_nh_asid(vdev, ssid);
+	if (ret)
+		goto unlock;
+
+	ret = vpu_mmu_cmdq_sync(vdev);
+unlock:
+	mutex_unlock(&mmu->lock);
+	return ret;
+}
+
+static int vpu_mmu_cd_add(struct vpu_device *vdev, u32 ssid, u64 cd_dma)
+{
+	struct vpu_mmu_info *mmu = vdev->mmu;
+	struct vpu_mmu_cdtab *cdtab = &mmu->cdtab;
+	u64 *entry;
+	u64 cd[4];
+	int ret;
+
+	if (ssid > VPU_MMU_CDTAB_ENT_COUNT)
+		return -EINVAL;
+
+	if (mutex_lock_interruptible(&mmu->lock))
+		return -EINTR;
+
+	entry = cdtab->base + (ssid * VPU_MMU_CDTAB_ENT_SIZE);
+
+	if (cd_dma != 0) {
+		cd[0] = FIELD_PREP(VPU_MMU_CD_0_TCR_T0SZ, 26) |
+			FIELD_PREP(VPU_MMU_CD_0_TCR_TG0, 0) |
+			FIELD_PREP(VPU_MMU_CD_0_TCR_IRGN0, 0) |
+			FIELD_PREP(VPU_MMU_CD_0_TCR_ORGN0, 0) |
+			FIELD_PREP(VPU_MMU_CD_0_TCR_SH0, 0) |
+			FIELD_PREP(VPU_MMU_CD_0_TCR_IPS, 3) |
+			FIELD_PREP(VPU_MMU_CD_0_ASID, ssid) |
+			VPU_MMU_CD_0_TCR_EPD1 |
+			VPU_MMU_CD_0_AA64 |
+			VPU_MMU_CD_0_R |
+			VPU_MMU_CD_0_A |
+			VPU_MMU_CD_0_ASET |
+			VPU_MMU_CD_0_V;
+		cd[1] = cd_dma & VPU_MMU_CD_1_TTB0_MASK;
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
+	clflush_cache_range(entry, VPU_MMU_CDTAB_ENT_SIZE);
+
+	vpu_dbg(MMU, "CDTAB %s entry (SSID=%u, dma=%pad): 0x%llx, 0x%llx, 0x%llx, 0x%llx\n",
+		cd_dma ? "write" : "clear", ssid, &cd_dma, cd[0], cd[1], cd[2], cd[3]);
+
+	if (!mmu->on) {
+		ret = 0;
+		goto unlock;
+	}
+
+	ret = vpu_mmu_cmdq_write_cfgi_cd_all(vdev);
+	if (ret)
+		goto unlock;
+
+	ret = vpu_mmu_cmdq_write_tlbi_nh_asid(vdev, ssid);
+	if (ret)
+		goto unlock;
+
+	ret = vpu_mmu_cmdq_sync(vdev);
+unlock:
+	mutex_unlock(&mmu->lock);
+	return ret;
+}
+
+static int vpu_mmu_cd_add_gbl(struct vpu_device *vdev)
+{
+	int ret;
+
+	ret = vpu_mmu_cd_add(vdev, 0, vdev->gctx.pgtable.pgd_dma);
+	if (ret)
+		vpu_err(vdev, "Failed to add global CD entry: %d\n", ret);
+
+	return ret;
+}
+
+static int vpu_mmu_cd_add_user(struct vpu_device *vdev, u32 ssid, dma_addr_t cd_dma)
+{
+	int ret;
+
+	if (ssid == 0) {
+		vpu_err(vdev, "Invalid SSID: %u\n", ssid);
+		return -EINVAL;
+	}
+
+	ret = vpu_mmu_cd_add(vdev, ssid, cd_dma);
+	if (ret)
+		vpu_err(vdev, "Failed to add CD entry SSID=%u: %d\n", ssid, ret);
+
+	return ret;
+}
+
+void vpu_mmu_fini(struct vpu_device *vdev)
+{
+	mutex_destroy(&vdev->mmu->lock);
+}
+
+int vpu_mmu_init(struct vpu_device *vdev)
+{
+	struct vpu_mmu_info *mmu = vdev->mmu;
+	int ret;
+
+	vpu_dbg(MMU, "Init..\n");
+
+	mutex_init(&mmu->lock);
+
+	ret = vpu_mmu_config_check(vdev);
+	if (ret)
+		goto err;
+
+	ret = vpu_mmu_structs_alloc(vdev);
+	if (ret)
+		goto err;
+
+	ret = vpu_mmu_strtab_init(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to initialize strtab: %d\n", ret);
+		goto err;
+	}
+
+	ret = vpu_mmu_cd_add_gbl(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to initialize strtab: %d\n", ret);
+		goto err;
+	}
+
+	ret = vpu_mmu_enable(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to resume MMU: %d\n", ret);
+		goto err;
+	}
+
+	vpu_dbg(MMU, "Init done\n");
+
+	return 0;
+
+err:
+	vpu_mmu_fini(vdev);
+	return ret;
+}
+
+int vpu_mmu_enable(struct vpu_device *vdev)
+{
+	struct vpu_mmu_info *mmu = vdev->mmu;
+	int ret;
+
+	mutex_lock(&mmu->lock);
+
+	mmu->on = true;
+
+	ret = vpu_mmu_reset(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to reset MMU: %d\n", ret);
+		goto err;
+	}
+
+	ret = vpu_mmu_cmdq_write_cfgi_ste(vdev);
+	if (ret)
+		goto err;
+
+	ret = vpu_mmu_cmdq_write_prefetch_cfg(vdev);
+	if (ret)
+		goto err;
+
+	ret = vpu_mmu_cmdq_write_cfgi_cd_all(vdev);
+	if (ret)
+		goto err;
+
+	ret = vpu_mmu_cmdq_write_tlbi_nsnh_all(vdev);
+	if (ret)
+		goto err;
+
+	ret = vpu_mmu_cmdq_sync(vdev);
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
+void vpu_mmu_disable(struct vpu_device *vdev)
+{
+	struct vpu_mmu_info *mmu = vdev->mmu;
+
+	mutex_lock(&mmu->lock);
+	mmu->on = false;
+	mutex_unlock(&mmu->lock);
+}
+
+irqreturn_t vpu_mmu_irq_evtq_handler(struct vpu_device *vdev)
+{
+	struct vpu_mmu_queue *evtq = &vdev->mmu->evtq;
+	u64 in_addr, fetch_addr;
+	u32 *evt, op, ssid, sid, counter = 0;
+
+	vpu_dbg(IRQ, "MMU event queue\n");
+
+	do {
+		evt = (evtq->base + (VPU_MMU_Q_IDX(evtq->cons) * VPU_MMU_EVTQ_CMD_SIZE));
+		clflush_cache_range(evt, VPU_MMU_EVTQ_CMD_SIZE);
+
+		op = FIELD_GET(VPU_MMU_EVT_OP_MASK, evt[0]);
+		ssid = FIELD_GET(VPU_MMU_EVT_SSID_MASK, evt[0]);
+		sid = evt[1];
+		in_addr = ((u64)evt[5]) << 32 | evt[4];
+		fetch_addr = ((u64)evt[7]) << 32 | evt[6];
+
+		vpu_err(vdev, "MMU EVTQ: 0x%x (%s) SSID: %d SID: %d, e[2] %08x, e[3] %08x, in addr: 0x%llx, fetch addr: 0x%llx\n",
+			op, vpu_mmu_evt_to_str(op), ssid, sid, evt[2], evt[3], in_addr, fetch_addr);
+		evtq->cons = (evtq->cons + 1) & VPU_MMU_Q_WRAP_MASK;
+
+		REGV_WR32(MTL_VPU_HOST_MMU_EVTQ_CONS_SEC, evtq->cons);
+
+		evtq->prod = REGV_RD32(MTL_VPU_HOST_MMU_EVTQ_PROD_SEC);
+
+		if (counter++ >= VPU_MMU_EVTS_MAX)
+			break;
+
+	} while (evtq->prod != evtq->cons);
+
+	return IRQ_HANDLED;
+}
+
+irqreturn_t vpu_mmu_irq_gerr_handler(struct vpu_device *vdev)
+{
+	u32 gerror_val, gerrorn_val, active;
+
+	vpu_dbg(IRQ, "MMU error\n");
+
+	gerror_val = REGV_RD32(MTL_VPU_HOST_MMU_GERROR);
+	gerrorn_val = REGV_RD32(MTL_VPU_HOST_MMU_GERRORN);
+
+	active = gerror_val ^ gerrorn_val;
+	if (!(active & VPU_MMU_GERROR_ERR_MASK))
+		return IRQ_NONE;
+
+	if (REG_TEST_FLD(MTL_VPU_HOST_MMU_GERROR, SFM, active)) {
+		vpu_err_ratelimited(vdev, "MMU has entered service failure mode\n");
+	}
+
+	if (REG_TEST_FLD(MTL_VPU_HOST_MMU_GERROR, MSI_ABT, active))
+		vpu_warn_ratelimited(vdev, "MMU MSI ABT write aborted\n");
+
+	if (REG_TEST_FLD(MTL_VPU_HOST_MMU_GERROR, MSI_PRIQ_ABT, active))
+		vpu_warn_ratelimited(vdev, "MMU PRIQ MSI ABT write aborted\n");
+
+	if (REG_TEST_FLD(MTL_VPU_HOST_MMU_GERROR, MSI_EVTQ_ABT, active))
+		vpu_warn_ratelimited(vdev, "MMU EVTQ MSI ABT write aborted\n");
+
+	if (REG_TEST_FLD(MTL_VPU_HOST_MMU_GERROR, MSI_CMDQ_ABT, active))
+		vpu_warn_ratelimited(vdev, "MMU CMDQ MSI ABT write aborted\n");
+
+	if (REG_TEST_FLD(MTL_VPU_HOST_MMU_GERROR, PRIQ_ABT, active))
+		vpu_err_ratelimited(vdev, "MMU PRIQ write aborted\n");
+
+	if (REG_TEST_FLD(MTL_VPU_HOST_MMU_GERROR, EVTQ_ABT, active))
+		vpu_err_ratelimited(vdev, "MMU EVTQ write aborted\n");
+
+	if (REG_TEST_FLD(MTL_VPU_HOST_MMU_GERROR, CMDQ, active))
+		vpu_err_ratelimited(vdev, "MMU CMDQ write aborted\n");
+
+	REGV_WR32(MTL_VPU_HOST_MMU_GERRORN, gerror_val);
+
+	return IRQ_HANDLED;
+}
+
+int vpu_mmu_set_pgtable(struct vpu_device *vdev, int ssid, struct vpu_mmu_pgtable *pgtable)
+{
+	return vpu_mmu_cd_add_user(vdev, ssid, pgtable->pgd_dma);
+}
+
+void vpu_mmu_clear_pgtable(struct vpu_device *vdev, int ssid)
+{
+	vpu_mmu_cd_add_user(vdev, ssid, 0); /* 0 will clear CD entry */
+}
diff --git a/drivers/gpu/drm/vpu/vpu_mmu.h b/drivers/gpu/drm/vpu/vpu_mmu.h
new file mode 100644
index 000000000000..c113446044ec
--- /dev/null
+++ b/drivers/gpu/drm/vpu/vpu_mmu.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#ifndef __VPU_MMU_H__
+#define __VPU_MMU_H__
+
+#include <linux/irqreturn.h>
+
+struct vpu_device;
+
+struct vpu_mmu_cdtab {
+	void *base;
+	dma_addr_t dma;
+};
+
+struct vpu_mmu_strtab {
+	void *base;
+	dma_addr_t dma;
+	u64 dma_q;
+	u32 base_cfg;
+};
+
+struct vpu_mmu_queue {
+	void *base;
+	dma_addr_t dma;
+	u64 dma_q;
+	u32 prod;
+	u32 cons;
+};
+
+struct vpu_mmu_info {
+	struct mutex lock; /* Protects cdtab, strtab, cmdq, on */
+	struct vpu_mmu_cdtab cdtab;
+	struct vpu_mmu_strtab strtab;
+	struct vpu_mmu_queue cmdq;
+	struct vpu_mmu_queue evtq;
+	bool on;
+};
+
+int vpu_mmu_init(struct vpu_device *vdev);
+void vpu_mmu_fini(struct vpu_device *vdev);
+void vpu_mmu_disable(struct vpu_device *vdev);
+int vpu_mmu_enable(struct vpu_device *vdev);
+int vpu_mmu_set_pgtable(struct vpu_device *vdev, int ssid, struct vpu_mmu_pgtable *pgtable);
+void vpu_mmu_clear_pgtable(struct vpu_device *vdev, int ssid);
+int vpu_mmu_invalidate_tlb(struct vpu_device *vdev, u16 ssid);
+
+irqreturn_t vpu_mmu_irq_evtq_handler(struct vpu_device *vdev);
+irqreturn_t vpu_mmu_irq_gerr_handler(struct vpu_device *vdev);
+
+#endif /* __VPU_MMU_H__ */
diff --git a/drivers/gpu/drm/vpu/vpu_mmu_context.c b/drivers/gpu/drm/vpu/vpu_mmu_context.c
new file mode 100644
index 000000000000..43e0f06b7c4e
--- /dev/null
+++ b/drivers/gpu/drm/vpu/vpu_mmu_context.c
@@ -0,0 +1,418 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#include <linux/bitfield.h>
+#include <linux/highmem.h>
+
+#include "vpu_drv.h"
+#include "vpu_hw.h"
+#include "vpu_mmu.h"
+#include "vpu_mmu_context.h"
+
+#define VPU_MMU_PGD_INDEX_MASK          GENMASK(38, 30)
+#define VPU_MMU_PMD_INDEX_MASK          GENMASK(29, 21)
+#define VPU_MMU_PTE_INDEX_MASK          GENMASK(20, 12)
+#define VPU_MMU_ENTRY_FLAGS_MASK        GENMASK(11, 0)
+#define VPU_MMU_ENTRY_FLAG_NG           BIT(11)
+#define VPU_MMU_ENTRY_FLAG_AF           BIT(10)
+#define VPU_MMU_ENTRY_FLAG_USER         BIT(6)
+#define VPU_MMU_ENTRY_FLAG_LLC_COHERENT BIT(2)
+#define VPU_MMU_ENTRY_FLAG_TYPE_PAGE    BIT(1)
+#define VPU_MMU_ENTRY_FLAG_VALID        BIT(0)
+
+#define VPU_MMU_PAGE_SIZE    SZ_4K
+#define VPU_MMU_PTE_MAP_SIZE (VPU_MMU_PGTABLE_ENTRIES * VPU_MMU_PAGE_SIZE)
+#define VPU_MMU_PMD_MAP_SIZE (VPU_MMU_PGTABLE_ENTRIES * VPU_MMU_PTE_MAP_SIZE)
+#define VPU_MMU_PGTABLE_SIZE (VPU_MMU_PGTABLE_ENTRIES * sizeof(u64))
+
+#define VPU_MMU_DUMMY_ADDRESS 0xdeadb000
+#define VPU_MMU_ENTRY_VALID   (VPU_MMU_ENTRY_FLAG_TYPE_PAGE | VPU_MMU_ENTRY_FLAG_VALID)
+#define VPU_MMU_ENTRY_INVALID (VPU_MMU_DUMMY_ADDRESS & ~VPU_MMU_ENTRY_FLAGS_MASK)
+#define VPU_MMU_ENTRY_MAPPED  (VPU_MMU_ENTRY_FLAG_AF | VPU_MMU_ENTRY_FLAG_USER | \
+			       VPU_MMU_ENTRY_FLAG_NG | VPU_MMU_ENTRY_VALID)
+
+static int vpu_mmu_pgtable_init(struct vpu_device *vdev, struct vpu_mmu_pgtable *pgtable)
+{
+	dma_addr_t pgd_dma;
+	u64 *pgd;
+
+	pgd = dma_alloc_wc(vdev->drm.dev, VPU_MMU_PGTABLE_SIZE, &pgd_dma, GFP_KERNEL);
+	if (!pgd)
+		return -ENOMEM;
+
+	pgtable->pgd = pgd;
+	pgtable->pgd_dma = pgd_dma;
+
+	return 0;
+}
+
+static void vpu_mmu_pgtable_free(struct vpu_device *vdev, struct vpu_mmu_pgtable *pgtable)
+{
+	int pgd_index, pmd_index;
+
+	for (pgd_index = 0; pgd_index < VPU_MMU_PGTABLE_ENTRIES; ++pgd_index) {
+		u64 **pmd_entries = pgtable->pgd_cpu_entries[pgd_index];
+		u64 *pmd = pgtable->pgd_entries[pgd_index];
+
+		if (!pmd_entries)
+			continue;
+
+		for (pmd_index = 0; pmd_index < VPU_MMU_PGTABLE_ENTRIES; ++pmd_index) {
+			if (pmd_entries[pmd_index])
+				dma_free_wc(vdev->drm.dev, VPU_MMU_PGTABLE_SIZE,
+					    pmd_entries[pmd_index],
+					    pmd[pmd_index] & ~VPU_MMU_ENTRY_FLAGS_MASK);
+		}
+
+		kfree(pmd_entries);
+		dma_free_wc(vdev->drm.dev, VPU_MMU_PGTABLE_SIZE, pgtable->pgd_entries[pgd_index],
+			    pgtable->pgd[pgd_index] & ~VPU_MMU_ENTRY_FLAGS_MASK);
+	}
+
+	dma_free_wc(vdev->drm.dev, VPU_MMU_PGTABLE_SIZE, pgtable->pgd,
+		    pgtable->pgd_dma & ~VPU_MMU_ENTRY_FLAGS_MASK);
+}
+
+static u64*
+vpu_mmu_ensure_pmd(struct vpu_device *vdev, struct vpu_mmu_pgtable *pgtable, u64 pgd_index)
+{
+	u64 **pmd_entries;
+	dma_addr_t pmd_dma;
+	u64 *pmd;
+
+	if (pgtable->pgd_entries[pgd_index])
+		return pgtable->pgd_entries[pgd_index];
+
+	pmd = dma_alloc_wc(vdev->drm.dev, VPU_MMU_PGTABLE_SIZE, &pmd_dma, GFP_KERNEL);
+	if (!pmd)
+		return NULL;
+
+	pmd_entries = kzalloc(VPU_MMU_PGTABLE_SIZE, GFP_KERNEL);
+	if (!pmd_entries)
+		goto err_free_pgd;
+
+	pgtable->pgd_entries[pgd_index] = pmd;
+	pgtable->pgd_cpu_entries[pgd_index] = pmd_entries;
+	pgtable->pgd[pgd_index] = pmd_dma | VPU_MMU_ENTRY_VALID;
+
+	return pmd;
+
+err_free_pgd:
+	dma_free_wc(vdev->drm.dev, VPU_MMU_PGTABLE_SIZE, pmd, pmd_dma);
+	return NULL;
+}
+
+static u64*
+vpu_mmu_ensure_pte(struct vpu_device *vdev, struct vpu_mmu_pgtable *pgtable,
+		   int pgd_index, int pmd_index)
+{
+	dma_addr_t pte_dma;
+	u64 *pte;
+
+	if (pgtable->pgd_cpu_entries[pgd_index][pmd_index])
+		return pgtable->pgd_cpu_entries[pgd_index][pmd_index];
+
+	pte = dma_alloc_wc(vdev->drm.dev, VPU_MMU_PGTABLE_SIZE, &pte_dma, GFP_KERNEL);
+	if (!pte)
+		return NULL;
+
+	pgtable->pgd_cpu_entries[pgd_index][pmd_index] = pte;
+	pgtable->pgd_entries[pgd_index][pmd_index] = pte_dma | VPU_MMU_ENTRY_VALID;
+
+	return pte;
+}
+
+static int
+vpu_mmu_context_map_page(struct vpu_device *vdev, struct vpu_mmu_context *ctx,
+			 u64 vpu_addr, dma_addr_t dma_addr, int prot)
+{
+	u64 *pte;
+	int pgd_index = FIELD_GET(VPU_MMU_PGD_INDEX_MASK, vpu_addr);
+	int pmd_index = FIELD_GET(VPU_MMU_PMD_INDEX_MASK, vpu_addr);
+	int pte_index = FIELD_GET(VPU_MMU_PTE_INDEX_MASK, vpu_addr);
+
+	/* Allocate PMD - second level page table if needed */
+	if (!vpu_mmu_ensure_pmd(vdev, &ctx->pgtable, pgd_index))
+		return -ENOMEM;
+
+	/* Allocate PTE - third level page table if needed */
+	pte = vpu_mmu_ensure_pte(vdev, &ctx->pgtable, pgd_index, pmd_index);
+	if (!pte)
+		return -ENOMEM;
+
+	/* Update PTE - third level page table with DMA address */
+	pte[pte_index] = dma_addr | prot;
+
+	return 0;
+}
+
+static void vpu_mmu_context_unmap_page(struct vpu_mmu_context *ctx, u64 vpu_addr)
+{
+	int pgd_index = FIELD_GET(VPU_MMU_PGD_INDEX_MASK, vpu_addr);
+	int pmd_index = FIELD_GET(VPU_MMU_PMD_INDEX_MASK, vpu_addr);
+	int pte_index = FIELD_GET(VPU_MMU_PTE_INDEX_MASK, vpu_addr);
+
+	/* Update PTE with dummy physical address and clear flags */
+	ctx->pgtable.pgd_cpu_entries[pgd_index][pmd_index][pte_index] = VPU_MMU_ENTRY_INVALID;
+}
+
+static void
+vpu_mmu_context_flush_page_tables(struct vpu_mmu_context *ctx, u64 vpu_addr, size_t size)
+{
+	u64 end_addr = vpu_addr + size;
+	u64 *pgd = ctx->pgtable.pgd;
+
+	/* Align to PMD entry (2 MB) */
+	vpu_addr &= ~(VPU_MMU_PTE_MAP_SIZE - 1);
+
+	while (vpu_addr < end_addr) {
+		int pgd_index = FIELD_GET(VPU_MMU_PGD_INDEX_MASK, vpu_addr);
+		u64 pmd_end = (pgd_index + 1) * (u64)VPU_MMU_PMD_MAP_SIZE;
+		u64 *pmd = ctx->pgtable.pgd_entries[pgd_index];
+
+		while (vpu_addr < end_addr && vpu_addr < pmd_end) {
+			int pmd_index = FIELD_GET(VPU_MMU_PMD_INDEX_MASK, vpu_addr);
+			u64 *pte = ctx->pgtable.pgd_cpu_entries[pgd_index][pmd_index];
+
+			clflush_cache_range(pte, VPU_MMU_PGTABLE_SIZE);
+			vpu_addr += VPU_MMU_PTE_MAP_SIZE;
+		}
+		clflush_cache_range(pmd, VPU_MMU_PGTABLE_SIZE);
+	}
+	clflush_cache_range(pgd, VPU_MMU_PGTABLE_SIZE);
+}
+
+static int
+vpu_mmu_context_map_pages(struct vpu_device *vdev, struct vpu_mmu_context *ctx,
+			  u64 vpu_addr, dma_addr_t dma_addr, size_t size, int prot)
+{
+	while (size) {
+		int ret = vpu_mmu_context_map_page(vdev, ctx, vpu_addr, dma_addr, prot);
+
+		if (ret)
+			return ret;
+
+		vpu_addr += VPU_MMU_PAGE_SIZE;
+		dma_addr += VPU_MMU_PAGE_SIZE;
+		size -= VPU_MMU_PAGE_SIZE;
+	}
+
+	return 0;
+}
+
+static void vpu_mmu_context_unmap_pages(struct vpu_mmu_context *ctx, u64 vpu_addr, size_t size)
+{
+	while (size) {
+		vpu_mmu_context_unmap_page(ctx, vpu_addr);
+		vpu_addr += VPU_MMU_PAGE_SIZE;
+		size -= VPU_MMU_PAGE_SIZE;
+	}
+}
+
+int
+vpu_mmu_context_map_sgt(struct vpu_device *vdev, struct vpu_mmu_context *ctx,
+			u64 vpu_addr, struct sg_table *sgt,  bool llc_coherent)
+{
+	struct scatterlist *sg;
+	int prot;
+	int ret;
+	u64 i;
+
+	if (!IS_ALIGNED(vpu_addr, VPU_MMU_PAGE_SIZE))
+		return -EINVAL;
+	/*
+	 * VPU is only 32 bit, but DMA engine is 38 bit
+	 * Ranges < 2 GB are reserved for VPU internal registers
+	 * Limit range to 8 GB
+	 */
+	if (vpu_addr < SZ_2G || vpu_addr > SZ_8G)
+		return -EINVAL;
+
+	prot = VPU_MMU_ENTRY_MAPPED;
+	if (llc_coherent)
+		prot |= VPU_MMU_ENTRY_FLAG_LLC_COHERENT;
+
+	mutex_lock(&ctx->lock);
+
+	for_each_sgtable_dma_sg(sgt, sg, i) {
+		u64 dma_addr = sg_dma_address(sg) - sg->offset;
+		size_t size = sg_dma_len(sg) + sg->offset;
+
+		ret = vpu_mmu_context_map_pages(vdev, ctx, vpu_addr, dma_addr, size, prot);
+		if (ret) {
+			vpu_err(vdev, "Failed to map context pages\n");
+			mutex_unlock(&ctx->lock);
+			return ret;
+		}
+		vpu_mmu_context_flush_page_tables(ctx, vpu_addr, size);
+		vpu_addr += size;
+	}
+
+	mutex_unlock(&ctx->lock);
+
+	ret = vpu_mmu_invalidate_tlb(vdev, ctx->id);
+	if (ret)
+		vpu_err(vdev, "Failed to invalidate TLB for ctx %u: %d\n", ctx->id, ret);
+	return ret;
+}
+
+void
+vpu_mmu_context_unmap_sgt(struct vpu_device *vdev, struct vpu_mmu_context *ctx,
+			  u64 vpu_addr, struct sg_table *sgt)
+{
+	struct scatterlist *sg;
+	int ret;
+	u64 i;
+
+	if (!IS_ALIGNED(vpu_addr, VPU_MMU_PAGE_SIZE))
+		vpu_warn(vdev, "Unaligned vpu_addr: 0x%llx\n", vpu_addr);
+
+	mutex_lock(&ctx->lock);
+
+	for_each_sgtable_dma_sg(sgt, sg, i) {
+		size_t size = sg_dma_len(sg) + sg->offset;
+
+		vpu_mmu_context_unmap_pages(ctx, vpu_addr, size);
+		vpu_mmu_context_flush_page_tables(ctx, vpu_addr, size);
+		vpu_addr += size;
+	}
+
+	mutex_unlock(&ctx->lock);
+
+	ret = vpu_mmu_invalidate_tlb(vdev, ctx->id);
+	if (ret)
+		vpu_warn(vdev, "Failed to invalidate TLB for ctx %u: %d\n", ctx->id, ret);
+}
+
+int
+vpu_mmu_context_insert_node_locked(struct vpu_mmu_context *ctx, const struct vpu_addr_range *range,
+				   u64 size, struct drm_mm_node *node)
+{
+	lockdep_assert_held(&ctx->lock);
+
+	return drm_mm_insert_node_in_range(&ctx->mm, node, size, VPU_MMU_PAGE_SIZE,
+					  0, range->start, range->end, DRM_MM_INSERT_BEST);
+}
+
+void
+vpu_mmu_context_remove_node_locked(struct vpu_mmu_context *ctx, struct drm_mm_node *node)
+{
+	lockdep_assert_held(&ctx->lock);
+
+	drm_mm_remove_node(node);
+}
+
+static int
+vpu_mmu_context_init(struct vpu_device *vdev, struct vpu_mmu_context *ctx, u32 context_id)
+{
+	u64 start, end;
+	int ret;
+
+	mutex_init(&ctx->lock);
+	INIT_LIST_HEAD(&ctx->bo_list);
+
+	ret = vpu_mmu_pgtable_init(vdev, &ctx->pgtable);
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
+static void vpu_mmu_context_fini(struct vpu_device *vdev, struct vpu_mmu_context *ctx)
+{
+	WARN_ON(!ctx->pgtable.pgd);
+
+	mutex_destroy(&ctx->lock);
+	vpu_mmu_pgtable_free(vdev, &ctx->pgtable);
+	drm_mm_takedown(&ctx->mm);
+}
+
+int vpu_mmu_global_context_init(struct vpu_device *vdev)
+{
+	return vpu_mmu_context_init(vdev, &vdev->gctx, VPU_GLOBAL_CONTEXT_MMU_SSID);
+}
+
+void vpu_mmu_global_context_fini(struct vpu_device *vdev)
+{
+	return vpu_mmu_context_fini(vdev, &vdev->gctx);
+}
+
+int vpu_mmu_user_context_init(struct vpu_file_priv *file_priv)
+{
+	struct vpu_device *vdev = file_priv->vdev;
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
+		vpu_err(vdev, "Failed to allocate context_id\n");
+		goto err_unlock;
+	}
+
+	ret = vpu_mmu_context_init(vdev, &file_priv->ctx, context_id);
+	if (ret) {
+		vpu_err(vdev, "Failed to initialize context\n");
+		goto err_erase_context_id;
+	}
+
+	ret = vpu_mmu_set_pgtable(vdev, context_id, &file_priv->ctx.pgtable);
+	if (ret) {
+		vpu_err(vdev, "Failed to set page table\n");
+		goto err_context_fini;
+	}
+
+	old = xa_store(&vdev->context_xa, context_id, file_priv, GFP_KERNEL);
+	if (xa_is_err(old)) {
+		ret = xa_err(old);
+		vpu_err(vdev, "Failed to store context %u: %d\n", context_id, ret);
+		goto err_clear_pgtable;
+	}
+
+	vpu_dbg(FILE, "file_priv context init: id %u process %s pid %d\n",
+		context_id, current->comm, task_pid_nr(current));
+
+unlock:
+	mutex_unlock(&file_priv->lock);
+	return 0;
+
+err_clear_pgtable:
+	vpu_mmu_clear_pgtable(vdev, context_id);
+err_context_fini:
+	vpu_mmu_context_fini(vdev, &file_priv->ctx);
+err_erase_context_id:
+	xa_erase(&vdev->context_xa, context_id);
+err_unlock:
+	mutex_unlock(&file_priv->lock);
+	return ret;
+}
+
+void vpu_mmu_user_context_fini(struct vpu_file_priv *file_priv)
+{
+	struct vpu_device *vdev = file_priv->vdev;
+
+	WARN_ON(!file_priv->ctx.id);
+
+	xa_store(&vdev->context_xa, file_priv->ctx.id,  NULL, GFP_KERNEL);
+	vpu_mmu_clear_pgtable(vdev, file_priv->ctx.id);
+	vpu_mmu_context_fini(vdev, &file_priv->ctx);
+	xa_erase(&vdev->context_xa, file_priv->ctx.id);
+}
diff --git a/drivers/gpu/drm/vpu/vpu_mmu_context.h b/drivers/gpu/drm/vpu/vpu_mmu_context.h
new file mode 100644
index 000000000000..04b54457624b
--- /dev/null
+++ b/drivers/gpu/drm/vpu/vpu_mmu_context.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#ifndef __VPU_MMU_CONTEXT_H__
+#define __VPU_MMU_CONTEXT_H__
+
+#include <drm/drm_mm.h>
+
+struct vpu_device;
+struct vpu_file_priv;
+struct vpu_addr_range;
+
+#define VPU_MMU_PGTABLE_ENTRIES	512
+
+struct vpu_mmu_pgtable {
+	u64             **pgd_cpu_entries[VPU_MMU_PGTABLE_ENTRIES];
+	u64		*pgd_entries[VPU_MMU_PGTABLE_ENTRIES];
+	u64		*pgd;
+	dma_addr_t	pgd_dma;
+};
+
+struct vpu_mmu_context {
+	struct mutex lock; /* protects: mm, pgtable, bo_list */
+	struct drm_mm mm;
+	struct vpu_mmu_pgtable pgtable;
+	struct list_head bo_list;
+	u32 id;
+};
+
+int vpu_mmu_global_context_init(struct vpu_device *vdev);
+void vpu_mmu_global_context_fini(struct vpu_device *vdev);
+
+int vpu_mmu_user_context_init(struct vpu_file_priv *file_priv);
+void vpu_mmu_user_context_fini(struct vpu_file_priv *file_priv);
+
+int vpu_mmu_context_insert_node_locked(struct vpu_mmu_context *ctx,
+				       const struct vpu_addr_range *range,
+				       u64 size, struct drm_mm_node *node);
+void vpu_mmu_context_remove_node_locked(struct vpu_mmu_context *ctx,
+					struct drm_mm_node *node);
+
+int vpu_mmu_context_map_sgt(struct vpu_device *vdev, struct vpu_mmu_context *ctx,
+			    u64 vpu_addr, struct sg_table *sgt, bool llc_coherent);
+void vpu_mmu_context_unmap_sgt(struct vpu_device *vdev, struct vpu_mmu_context *ctx,
+			       u64 vpu_addr, struct sg_table *sgt);
+
+#endif /* __VPU_MMU_CONTEXT_H__ */
diff --git a/include/uapi/drm/vpu_drm.h b/include/uapi/drm/vpu_drm.h
index 3311a36bf07b..8e3b852d78a1 100644
--- a/include/uapi/drm/vpu_drm.h
+++ b/include/uapi/drm/vpu_drm.h
@@ -38,6 +38,7 @@ extern "C" {
 #define DRM_VPU_PARAM_NUM_CONTEXTS	   4
 #define DRM_VPU_PARAM_CONTEXT_BASE_ADDRESS 5
 #define DRM_VPU_PARAM_CONTEXT_PRIORITY	   6
+#define DRM_VPU_PARAM_CONTEXT_ID	   7
 
 #define DRM_VPU_PLATFORM_TYPE_SILICON	   0
 
@@ -78,6 +79,9 @@ struct drm_vpu_param {
 	 * Value of current context scheduling priority (read-write).
 	 * See DRM_VPU_CONTEXT_PRIORITY_* for possible values.
 	 *
+	 * %DRM_VPU_PARAM_CONTEXT_ID:
+	 * Current context ID, always greater than 0 (read-only)
+	 *
 	 */
 	__u32 param;
 
-- 
2.34.1

