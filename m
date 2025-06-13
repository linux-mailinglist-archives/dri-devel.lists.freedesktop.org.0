Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E96B8AD8D7C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 15:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB89C10E9B8;
	Fri, 13 Jun 2025 13:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A6D10E9AD;
 Fri, 13 Jun 2025 13:45:47 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [RFC PATCH 5/8] drm/xe: Add support for IAF devices.
Date: Fri, 13 Jun 2025 15:45:24 +0200
Message-ID: <20250613134520.2458175-15-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613134520.2458175-10-dev@lankhorst.se>
References: <20250613134520.2458175-10-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Use the AUX bus interface to connect to the intel fabric device.
This code is based on intel-gpu-backports tag
I915_25WW18.2_1099.17_25.1.17_250113.16

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  23 ++
 drivers/gpu/drm/xe/xe_device.c       |  12 +-
 drivers/gpu/drm/xe/xe_device_types.h |   3 +
 drivers/gpu/drm/xe/xe_gt_types.h     |   3 +
 drivers/gpu/drm/xe/xe_iaf.c          | 405 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_iaf.h          |  57 ++++
 drivers/gpu/drm/xe/xe_irq.c          |  16 +-
 drivers/gpu/drm/xe/xe_vram.c         |   4 +-
 9 files changed, 520 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_iaf.c
 create mode 100644 drivers/gpu/drm/xe/xe_iaf.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 7b6fee7fd1a65..a83f3c775f3a5 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -74,6 +74,7 @@ xe-y += xe_bb.o \
 	xe_hw_engine_class_sysfs.o \
 	xe_hw_engine_group.o \
 	xe_hw_fence.o \
+	xe_iaf.o \
 	xe_irq.o \
 	xe_lrc.o \
 	xe_migrate.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 5cd5ab8529c5c..0d436947ff81f 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -85,6 +85,11 @@
 #define XE2_GAMREQSTRM_CTRL			XE_REG_MCR(0x4194)
 #define   CG_DIS_CNTLBUS			REG_BIT(6)
 
+#define PKG_ADDR_RANGE				XE_REG(0x41B0)
+#define   PKG_ADDR_RANGE_RANGE_SHIFT		20
+#define   PKG_ADDR_RANGE_BASE_SHIFT		1
+#define   PKG_ADDR_RANGE_ENABLE			1
+
 #define CCS_AUX_INV				XE_REG(0x4208)
 
 #define VD0_AUX_INV				XE_REG(0x4218)
@@ -96,6 +101,11 @@
 #define XE2_LMEM_CFG				XE_REG(0x48b0)
 
 #define XEHP_TILE_ADDR_RANGE(_idx)		XE_REG_MCR(0x4900 + (_idx) * 4)
+#define   XEHP_TILE_LMEM_RANGE_SHIFT            8
+#define   XEHP_TILE_LMEM_BASE_SHIFT             1
+#define   XEHP_TILE_LMEM_BASE_MASK              REG_GENMASK(7, 1)
+#define   XEHP_TILE_LMEM_RANGE_MASK             REG_GENMASK(14, 8)
+
 #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
 #define XEHP_FLAT_CCS_PTR			REG_GENMASK(31, 8)
 
@@ -560,6 +570,11 @@
 #define   CCS_MODE_CSLICE(cslice, ccs) \
 	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
 
+#define PKG_ADDR_BASE				XE_REG(0x108390)
+#define   PKG_ADDR_BASE_RANGE_SHIFT		20
+#define   PKG_ADDR_BASE_BASE_SHIFT		1
+#define   PKG_ADDR_BASE_ENABLE			1
+
 #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
 
 /* Applicable for all FORCEWAKE_DOMAIN and FORCEWAKE_ACK_DOMAIN regs */
@@ -594,4 +609,12 @@
 
 #define SFC_DONE(n)				XE_REG(0x1cc000 + (n) * 0x1000)
 
+#define PUNIT_MMIO_CR_POC_STRAPS		XE_REG(0x281078)
+#define NUM_TILES_MASK				REG_GENMASK(1, 0)
+#define CD_ALIVE				REG_BIT(2)
+#define SOCKET_ID_MASK				REG_GENMASK(7, 3)
+
+#define CD_BASE_OFFSET				0x291000
+#define CD_BAR_LENGTH				0x40000
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c7d50b098b5cb..9d4a3f3f3bbf1 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright © 2021 Intel Corporation
+ * Copyright © 2021 - 2025 Intel Corporation
  */
 
 #include "xe_device.h"
@@ -43,6 +43,7 @@
 #include "xe_hw_engine_group.h"
 #include "xe_hwmon.h"
 #include "xe_irq.h"
+#include "xe_iaf.h"
 #include "xe_memirq.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
@@ -841,6 +842,11 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	/* Needs to be called before xe_vram_probe() */
+	err = xe_iaf_init(xe);
+	if (err)
+		return err;
+
 	err = xe_vram_probe(xe);
 	if (err)
 		return err;
@@ -918,6 +924,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	err = xe_iaf_init_aux(xe);
+	if (err)
+		goto err_unregister_display;
+
 	xe_debugfs_register(xe);
 
 	err = xe_hwmon_register(xe);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6bb8f5487c3a0..6998ee0b1a220 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -590,6 +590,9 @@ struct xe_device {
 	u8 vm_inject_error_position;
 #endif
 
+	/** @iaf: Fabric specific struct */
+	struct xe_iaf *iaf;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 7def0959da35d..331b726f7c562 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -445,6 +445,9 @@ struct xe_gt {
 
 	/** @eu_stall: EU stall counters subsystem per gt info */
 	struct xe_eu_stall_gt *eu_stall;
+
+	/** @iaf_irq: IRQ value for IAF interrupts to be raised */
+	int iaf_irq;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_iaf.c b/drivers/gpu/drm/xe/xe_iaf.c
new file mode 100644
index 0000000000000..d93b13d30fbcd
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_iaf.c
@@ -0,0 +1,405 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+#include <linux/auxiliary_bus.h>
+#include <linux/firmware.h>
+#include <linux/irq.h>
+#include <linux/xarray.h>
+
+#include <drm/intel/intel_iaf_platform.h>
+#include <drm/drm_managed.h>
+
+#include "xe_device.h"
+#include "xe_iaf.h"
+#include "xe_mmio.h"
+#include "xe_gt_mcr.h"
+#include "regs/xe_reg_defs.h"
+#include "regs/xe_gt_regs.h"
+#include "regs/xe_bars.h"
+
+/* Xarray of fabric devices */
+static DEFINE_XARRAY_ALLOC(intel_fdevs);
+
+struct xe_iaf {
+	/** @ops: shared interface operations */
+	const struct iaf_ops *ops;
+	/** @handle: IAF device handle */
+	void *handle;
+	/** @pd: platform data needed for auxiliary bus */
+	struct iaf_pdata pd;
+
+	/** @dpa: base device physical address */
+	u64 dpa;
+	/** @irq_base: base IRQ for multi tile devices */
+	int irq_base;
+	/** @index: internal index for xe devices */
+	int index;
+	/** @fabric_id: IAF id generated by the IAF device */
+	u32 fabric_id;
+	/** @socket_id: socket from certain platforms */
+	u8 socket_id;
+};
+
+static int register_dev(void *parent, void *handle, u32 fabric_id,
+			const struct iaf_ops *ops)
+{
+	struct xe_device *xe = parent;
+
+	WARN(xe->iaf->ops, "IAF: already registered");
+
+	xe->iaf->handle = handle;
+	xe->iaf->fabric_id = fabric_id;
+	xe->iaf->ops = ops;
+
+	drm_info(&xe->drm, "IAF: registered: 0x%x\n", fabric_id);
+
+	return 0;
+}
+
+static void unregister_dev(void *parent, const void *handle)
+{
+	struct xe_device *xe = parent;
+
+	WARN(xe->iaf->handle != handle, "IAF: invalid handle");
+
+	drm_info(&xe->drm, "IAF: unregistered: 0x%x\n",
+		 xe->iaf->fabric_id);
+	xe->iaf->handle = NULL;
+	xe->iaf->ops = NULL;
+}
+
+static int dev_event(void *parent, const void *handle, enum iaf_dev_event event,
+		     void *event_data)
+{
+	return 0;
+}
+
+static void init_pd(struct xe_device *xe, struct iaf_pdata *pd)
+{
+	u32 reg;
+
+	pd->version = IAF_VERSION;
+	pd->parent = xe;
+	pd->product = IAF_PONTEVECCHIO;
+	pd->index = xe->iaf->index & 0xFFFF;
+	pd->sd_cnt = xe->info.tile_count;
+	pd->socket_id = xe->iaf->socket_id;
+	pd->slot = PCI_SLOT(to_pci_dev(xe->drm.dev)->devfn);
+
+	pd->resources = NULL;
+	pd->num_resources = 0;
+	pd->register_dev = register_dev;
+	pd->unregister_dev = unregister_dev;
+	pd->dev_event = dev_event;
+
+	/*
+	 * Calculate the actual DPA offset and size (in GB) for the device.
+	 * Each tile will have the same amount of memory, so we only need to
+	 * read the first one.
+	 */
+	reg = xe_gt_mcr_unicast_read_any(xe_device_get_root_tile(xe)->primary_gt,
+					 XEHP_TILE_ADDR_RANGE(0)) & XEHP_TILE_LMEM_RANGE_MASK;
+
+	// TILE0 is < 8Gb, PVC needs 8GB, so fake it.
+	if (reg >> XEHP_TILE_LMEM_RANGE_SHIFT < 8) {
+		drm_err(&xe->drm, "XEHP_TILE0_ADDR_RANGE: %x\n", reg);
+		reg = 8 << XEHP_TILE_LMEM_RANGE_SHIFT;
+	}
+	pd->dpa.pkg_offset = (u32)xe->iaf->index * MAX_DPA_SIZE;
+	pd->dpa.pkg_size = (reg >> XEHP_TILE_LMEM_RANGE_SHIFT) * pd->sd_cnt;
+}
+
+/**
+ * init_resource - Create the resource array, and apply the appropriate data
+ * @xe: valid xe instance
+ * @res_cnt: pointer to return number of allocated resources
+ *
+ * First resource [0] is for the IRQ(s).  Each device gets 1 IRQ. Subsequent
+ * resources describe the IO memory space for the device(s).
+ *
+ * Make sure to set the gt->iaf_irq value.
+ *
+ * Return:
+ * * res - Initialized resource array
+ * * NULL - Allocaction failure
+ */
+static struct resource *init_resource(struct xe_device *xe,
+				      u32 *res_cnt)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct xe_tile *tile;
+	struct resource *res_base, *res;
+	u32 cnt = xe->info.tile_count * 2;
+	unsigned int i;
+
+	/* Each sd gets one resource for IRQ and one for MEM */
+	res_base = drmm_kcalloc(&xe->drm, cnt, sizeof(*res_base), GFP_KERNEL);
+	if (!res_base)
+		return NULL;
+
+	res = res_base;
+	for_each_tile(tile, xe, i) {
+		struct xe_gt *gt = tile->primary_gt;
+
+		res->start = xe->iaf->irq_base + i;
+		res->end = xe->iaf->irq_base + i;
+		res->flags = IORESOURCE_IRQ;
+		res++;
+
+		res->start = pci_resource_start(pdev, GTTMMADR_BAR) + CD_BASE_OFFSET +
+			     (tile->mmio.regs - xe->mmio.regs);
+		res->end = res->start + CD_BAR_LENGTH - 1;
+		res->flags = IORESOURCE_MEM;
+		drm_info(&xe->drm, "IAF: mem_resource = %pR\n", res);
+		res++;
+		gt->iaf_irq = xe->iaf->irq_base + i;
+	}
+
+	*res_cnt = cnt;
+	return res_base;
+}
+
+/**
+ * xe_irq_mask - Null callback.  Masking/unmasking happens in the parent
+ * driver
+ * @d: Valid irq_data information
+ */
+static void iaf_irq_mask(struct irq_data *d)
+{
+}
+
+static void iaf_irq_unmask(struct irq_data *d)
+{
+}
+
+static struct irq_chip iaf_irq_chip = {
+	.name = "iaf_irq_chip",
+	.irq_mask = iaf_irq_mask,
+	.irq_unmask = iaf_irq_unmask,
+};
+
+/**
+ * init_irq_desc - Allocate IRQ descriptors to use for the fabric
+ * @xe: Valid xe instance
+ *
+ * Allocate the required IRQ descriptor(s) and initialize the
+ * appropriate state.
+ *
+ * Return:
+ * * 0 - Success
+ * * errno - Error that occurred
+ */
+static int init_irq_desc(struct xe_device *xe)
+{
+	unsigned int num_subdevs = xe->info.tile_count;
+	int err;
+	int irq;
+	int irq_base;
+
+	irq_base = irq_alloc_descs(-1, 0, num_subdevs, 0);
+	if (irq_base < 0) {
+		err = irq_base;
+		goto cleanup;
+	}
+
+	err = 0;
+	for (irq = irq_base; !err && irq < irq_base + num_subdevs; irq++) {
+		irq_set_chip_and_handler_name(irq, &iaf_irq_chip,
+					      handle_simple_irq,
+					      "iaf_irq_handler");
+		err = irq_set_chip_data(irq, xe);
+	}
+
+	if (err) {
+		irq_free_descs(irq_base, num_subdevs);
+		goto cleanup;
+	}
+
+	drm_info(&xe->drm, "IAF: IRQ base: %d  cnt: %d\n", irq_base,
+		 num_subdevs);
+
+	xe->iaf->irq_base = irq_base;
+
+	return 0;
+
+cleanup:
+	drm_err(&xe->drm, "IAF: Failed to allocate IRQ data: %d\n", err);
+	return err;
+}
+
+static void iaf_remove(struct drm_device *drm, void *arg)
+{
+	struct xe_device *xe = to_xe_device(drm);
+
+	xa_erase(&intel_fdevs, xe->iaf->index);
+	irq_free_descs(xe->iaf->irq_base, xe->info.tile_count);
+}
+
+/**
+ * xe_iaf_init - Allocate device index and complete initial HW setup
+ * @xe: valid device instance
+ *
+ * NOTE: index is zero inited.  If the IAF is not present, or an error occurs
+ * during setup, this must be 0 for the range registers.
+ *
+ */
+int xe_iaf_init(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	static u32 last_id;
+	unsigned int i;
+	u32 index = 0;
+	u32 range;
+	u32 base;
+	int err;
+
+	if (xe->info.platform != XE_PVC)
+		return 0;
+
+	u32 poc_straps = xe_mmio_read32(xe_root_tile_mmio(xe), PUNIT_MMIO_CR_POC_STRAPS);
+	if (!REG_FIELD_GET(CD_ALIVE, poc_straps)) {
+		drm_info(&xe->drm, "IAF unavailable\n");
+		goto set_range;
+	}
+
+	xe->iaf = drmm_kzalloc(&xe->drm, sizeof(*xe->iaf), GFP_KERNEL);
+	if (!xe->iaf)
+		return -ENOMEM;
+
+	xe->iaf->socket_id = REG_FIELD_GET(SOCKET_ID_MASK, poc_straps);
+	drm_info(&xe->drm, "IAF available\n");
+
+	err = init_irq_desc(xe);
+	if (err)
+		return err;
+
+	/*
+	 * Try the socket id first.  Systems with this feature, will
+	 * get a deterministic value.  If not, try with the cyclic.
+	 */
+	err = xa_insert(&intel_fdevs, xe->iaf->socket_id, xe,
+			GFP_KERNEL);
+	if (!err)
+		index = xe->iaf->socket_id;
+
+	/* socket_id is not available */
+	if (err == -EBUSY) {
+		/*
+		 * NOTE: index is only updated on success i.e. >= 0
+		 * < 0 err, 0 ok, > 0 wrapped
+		 */
+		err = xa_alloc_cyclic(&intel_fdevs, &index, xe,
+				      XA_LIMIT(0, MAX_DEVICE_COUNT - 1),
+				      &last_id, GFP_KERNEL);
+	}
+	if (err < 0) {
+		index = 0;
+		drm_err(&xe->drm,
+			"IAF: Failed to allocate index: %d\n",
+			err);
+		irq_free_descs(xe->iaf->irq_base,
+			       xe->info.tile_count);
+		return err;
+	}
+	xe->iaf->index = index;
+	xe->iaf->dpa = (u64)index * MAX_DPA_SIZE * SZ_1G;
+	drm_info(&xe->drm, "IAF: [dpa 0x%llx-0x%llx\n", xe->iaf->dpa,
+		 ((u64)index + 1) * MAX_DPA_SIZE * SZ_1G - 1);
+
+	/*
+	 * Set range has to be done for all devices that support device
+	 * address space, regardless of presence or error.
+	 */
+set_range:
+	/* Set GAM address range registers */
+	range = index * MAX_DPA_SIZE << PKG_ADDR_RANGE_BASE_SHIFT;
+	range |= MAX_DPA_SIZE << PKG_ADDR_RANGE_RANGE_SHIFT;
+	range |= PKG_ADDR_RANGE_ENABLE;
+
+	/* set SGunit address range register */
+	base = index * MAX_DPA_SIZE << PKG_ADDR_BASE_BASE_SHIFT;
+	base |= MAX_DPA_SIZE << PKG_ADDR_BASE_RANGE_SHIFT;
+	base |= PKG_ADDR_BASE_ENABLE;
+
+	/* Needs to be set for each gt */
+	for_each_gt(gt, xe, i) {
+		xe_mmio_write32(&gt->mmio, PKG_ADDR_RANGE, range);
+		xe_mmio_write32(&gt->mmio, PKG_ADDR_BASE, base);
+	}
+
+	if (!xe->iaf)
+		return 0;
+
+	return drmm_add_action_or_reset(&xe->drm, iaf_remove, NULL);
+}
+
+static void iaf_remove_aux(struct drm_device *drm, void *arg)
+{
+	struct xe_device *xe = to_xe_device(drm);
+
+	auxiliary_device_delete(&xe->iaf->pd.aux_dev);
+	auxiliary_device_uninit(&xe->iaf->pd.aux_dev);
+	xe->iaf->ops = NULL;
+}
+
+/* Handled through drmm */
+static void xe_iaf_release_dev(struct device *dev)
+{ }
+
+/**
+ * xe_iaf_init_aux - Initialize resources and add auxiliary bus interface
+ * @xe: valid xe instance
+ *
+ */
+int xe_iaf_init_aux(struct xe_device *xe)
+{
+	struct device *dev = &to_pci_dev(xe->drm.dev)->dev;
+	struct resource *res = NULL;
+	struct iaf_pdata *pd;
+	int err = -ENOMEM;
+	u32 res_cnt;
+
+	if (!xe->iaf)
+		return 0;
+
+	pd = &xe->iaf->pd;
+	init_pd(xe, pd);
+
+	res = init_resource(xe, &res_cnt);
+	if (!res)
+		goto fail;
+
+	pd->resources = res;
+	pd->num_resources = res_cnt;
+
+	pd->aux_dev.name = "iaf";
+	pd->aux_dev.id = pd->index;
+	pd->aux_dev.dev.parent = dev;
+	pd->aux_dev.dev.release = xe_iaf_release_dev;
+
+	err = auxiliary_device_init(&pd->aux_dev);
+	if (err)
+		goto fail;
+
+	err = auxiliary_device_add(&pd->aux_dev);
+	if (err) {
+		auxiliary_device_uninit(&pd->aux_dev);
+		goto fail;
+	}
+
+	return drmm_add_action_or_reset(&xe->drm, iaf_remove_aux, NULL);
+
+fail:
+	drm_err(&xe->drm, "IAF: Failed to initialize err: %d\n", err);
+	return err;
+}
+
+u64 xe_iaf_dpa_base(struct xe_device *xe)
+{
+	if (!xe->iaf)
+		return 0ULL;
+
+	return xe->iaf->dpa;
+}
+
diff --git a/drivers/gpu/drm/xe/xe_iaf.h b/drivers/gpu/drm/xe/xe_iaf.h
new file mode 100644
index 0000000000000..78d7cca447983
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_iaf.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_IAF_H_
+#define _XE_IAF_H_
+
+#include <linux/types.h>
+
+/*
+ * Define the maximum number of devices instances based on the amount of
+ * FID space.
+ *
+ * XARRAY limits are "inclusive", but using this value as a range check
+ * outside of xarray, makes the exclusive upper bound a little easier to
+ * deal with.
+ *
+ * I.e.:
+ * [0 - 256)
+ *
+ * Less than HW supports, but more than will be currently possible.
+ *
+ */
+#define MAX_DEVICE_COUNT 256
+
+/* Fixed Device Physical Address (DPA) size for a device/package (in GB) */
+#define MAX_DPA_SIZE 128
+
+struct xe_device;
+
+#if IS_ENABLED(CONFIG_DRM_INTEL_FABRIC)
+
+int xe_iaf_init(struct xe_device *xe);
+int xe_iaf_init_aux(struct xe_device *xe);
+u64 xe_iaf_dpa_base(struct xe_device *xe);
+
+#else
+
+static inline int xe_iaf_init(struct xe_device *xe)
+{
+	return 0;
+}
+
+static inline int xe_iaf_init_aux(struct xe_device *xe)
+{
+	return 0;
+}
+
+static inline u64 xe_iaf_dpa_base(struct xe_device *xe)
+{
+	return 0ULL;
+}
+
+#endif
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 5362d3174b060..439748987168e 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -1,10 +1,11 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright © 2021 Intel Corporation
+ * Copyright © 2021 - 2025 Intel Corporation
  */
 
 #include "xe_irq.h"
 
+#include <linux/irq.h>
 #include <linux/sched/clock.h>
 
 #include <drm/drm_managed.h>
@@ -31,6 +32,9 @@
 #define IIR(offset)				XE_REG(offset + 0x8)
 #define IER(offset)				XE_REG(offset + 0xc)
 
+#define GEN12_IAF_IRQ BIT(8)
+#define CPORT_MBDB_INT_ENABLE_MASK		XE_REG(0x297008)
+
 static int xe_irq_msix_init(struct xe_device *xe);
 static void xe_irq_msix_free(struct xe_device *xe);
 static int xe_irq_msix_request_irqs(struct xe_device *xe);
@@ -419,6 +423,12 @@ static void dg1_intr_enable(struct xe_device *xe, bool stall)
 		xe_mmio_read32(mmio, DG1_MSTR_TILE_INTR);
 }
 
+static void iaf_irq_handler(struct xe_gt *gt, const u32 master_ctl)
+{
+	if (master_ctl & GEN12_IAF_IRQ)
+		generic_handle_irq(gt->iaf_irq);
+}
+
 /*
  * Top-level interrupt handler for Xe_LP+ and beyond.  These platforms have
  * a "master tile" interrupt register which must be consulted before the
@@ -478,6 +488,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 			xe_display_irq_handler(xe, master_ctl);
 			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
 		}
+		iaf_irq_handler(tile->primary_gt, master_ctl);
 	}
 
 	dg1_intr_enable(xe, false);
@@ -534,6 +545,9 @@ static void gt_irq_reset(struct xe_tile *tile)
 	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_MASK,  ~0);
 	xe_mmio_write32(mmio, GUC_SG_INTR_ENABLE,	 0);
 	xe_mmio_write32(mmio, GUC_SG_INTR_MASK,		~0);
+
+	if (tile_to_xe(tile)->iaf)
+		xe_mmio_write32(mmio, CPORT_MBDB_INT_ENABLE_MASK, 0);
 }
 
 static void xelp_irq_reset(struct xe_tile *tile)
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index e421a74fb87c6..e4e4fdb62c82a 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -16,6 +16,7 @@
 #include "xe_force_wake.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_sriov_vf.h"
+#include "xe_iaf.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_sriov.h"
@@ -152,8 +153,7 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 	if (!xe->mem.vram.io_size)
 		return -EIO;
 
-	/* XXX: Need to change when xe link code is ready */
-	xe->mem.vram.dpa_base = 0;
+	xe->mem.vram.dpa_base = xe_iaf_dpa_base(xe);
 
 	/* set up a map to the total memory area. */
 	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
-- 
2.45.2

