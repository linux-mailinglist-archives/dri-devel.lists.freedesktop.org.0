Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E63583FCD
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 15:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBBF8D9AB;
	Thu, 28 Jul 2022 13:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8AAF112650
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 13:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659014251; x=1690550251;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mR1YS0CLJ52u/eAga0X8/p7jJNGOf++ZQ8iWARJ2kbM=;
 b=nJHUDgXJaheYtyEAjfbkKUj5nB+0YFr66FFTbnq8cPOqL8Jv6ohzHXki
 GARRB4hgqQ6oZ8wblVgsmAEwz/FaZSpyqGsmos0crFJa1Wo4dAFAfaJhv
 sFmj2Kt3eUarH6K3Qr+VBOgtSn0XYRolRBXcZPcOtJsaO2kHgIgG9Y55i
 EJYmQRgc/LuYUBk/8MyGZlszW3TUTl+kgB63Z+yrnxy/XLjtzY7nY+3al
 sMsW1I0T5/x/Xxb9z/qwHFPOIHNfLc6GMH1PLnqSJ+HD8lpYG6Pqu6U/l
 Exv9j3F1aEPIOMp4uny054LHFGcbPrqbzl77vqAbnVVyQMzp+urNO0I+o A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="288520351"
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="288520351"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 06:17:31 -0700
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="659722648"
Received: from jlawryno-desktop.igk.intel.com ([172.22.229.64])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 06:17:29 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v1 1/7] drm/vpu: Introduce a new DRM driver for Intel VPU
Date: Thu, 28 Jul 2022 15:17:03 +0200
Message-Id: <20220728131709.1087188-2-jacek.lawrynowicz@linux.intel.com>
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

VPU stands for Versatile Processing Unit and it's a CPU-integrated
inference accelerator for Computer Vision and Deep Learning
applications.

The VPU device consist of following componensts:
  - Buttress - provides CPU to VPU integration, interrupt, frequency and
    power management.
  - Memory Management Unit (based on ARM MMU-600) - translates VPU to
    host DMA addresses, isolates user workloads.
  - RISC based microcontroller - executes firmware that provides job
    execution API for the kernel-mode driver
  - Neural Compute Subsystem (NCS) - does the actual work, provides
    Compute and Copy engines.
  - Network on Chip (NoC) - network fabric connecting all the components

This driver supports VPU IP v2.7 integrated into Intel Meteor Lake
client CPUs (14th generation).

Module sources are at drivers/gpu/drm/vpu and module name is
"intel_vpu.ko".

This patch includes only very besic functionality:
  - module, PCI device and IRQ initialization
  - register definitions and low level register manipulation functions
  - SET/GET_PARAM ioctls
  - power up without firmware

Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 MAINTAINERS                          |    8 +
 drivers/gpu/drm/Kconfig              |    2 +
 drivers/gpu/drm/Makefile             |    1 +
 drivers/gpu/drm/vpu/Kconfig          |   12 +
 drivers/gpu/drm/vpu/Makefile         |    8 +
 drivers/gpu/drm/vpu/vpu_drv.c        |  392 ++++++++++
 drivers/gpu/drm/vpu/vpu_drv.h        |  157 ++++
 drivers/gpu/drm/vpu/vpu_hw.h         |  163 +++++
 drivers/gpu/drm/vpu/vpu_hw_mtl.c     | 1003 ++++++++++++++++++++++++++
 drivers/gpu/drm/vpu/vpu_hw_mtl_reg.h |  468 ++++++++++++
 drivers/gpu/drm/vpu/vpu_hw_reg_io.h  |  114 +++
 include/uapi/drm/vpu_drm.h           |   95 +++
 12 files changed, 2423 insertions(+)
 create mode 100644 drivers/gpu/drm/vpu/Kconfig
 create mode 100644 drivers/gpu/drm/vpu/Makefile
 create mode 100644 drivers/gpu/drm/vpu/vpu_drv.c
 create mode 100644 drivers/gpu/drm/vpu/vpu_drv.h
 create mode 100644 drivers/gpu/drm/vpu/vpu_hw.h
 create mode 100644 drivers/gpu/drm/vpu/vpu_hw_mtl.c
 create mode 100644 drivers/gpu/drm/vpu/vpu_hw_mtl_reg.h
 create mode 100644 drivers/gpu/drm/vpu/vpu_hw_reg_io.h
 create mode 100644 include/uapi/drm/vpu_drm.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 0f9366144d31..e556fa2d366b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6944,6 +6944,14 @@ F:	Documentation/devicetree/bindings/gpu/vivante,gc.yaml
 F:	drivers/gpu/drm/etnaviv/
 F:	include/uapi/drm/etnaviv_drm.h
 
+DRM DRIVERS FOR VPU
+M:	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
+M:	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
+S:	Supported
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	drivers/gpu/drm/vpu/
+F:	include/uapi/drm/vpu_drm.h
+
 DRM DRIVERS FOR XEN
 M:	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
 L:	dri-devel@lists.freedesktop.org
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 6c2256e8474b..cf2f159b3e01 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -363,6 +363,8 @@ source "drivers/gpu/drm/v3d/Kconfig"
 
 source "drivers/gpu/drm/vc4/Kconfig"
 
+source "drivers/gpu/drm/vpu/Kconfig"
+
 source "drivers/gpu/drm/etnaviv/Kconfig"
 
 source "drivers/gpu/drm/hisilicon/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index e7af358e6dda..735a12514321 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -95,6 +95,7 @@ obj-$(CONFIG_DRM_KMB_DISPLAY)  += kmb/
 obj-$(CONFIG_DRM_MGAG200) += mgag200/
 obj-$(CONFIG_DRM_V3D)  += v3d/
 obj-$(CONFIG_DRM_VC4)  += vc4/
+obj-$(CONFIG_DRM_VPU)  += vpu/
 obj-$(CONFIG_DRM_SIS)   += sis/
 obj-$(CONFIG_DRM_SAVAGE)+= savage/
 obj-$(CONFIG_DRM_VMWGFX)+= vmwgfx/
diff --git a/drivers/gpu/drm/vpu/Kconfig b/drivers/gpu/drm/vpu/Kconfig
new file mode 100644
index 000000000000..e4504c483d9d
--- /dev/null
+++ b/drivers/gpu/drm/vpu/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config DRM_VPU
+	tristate "Intel VPU for Meteor Lake and newer"
+	depends on DRM
+	depends on X86_64 && PCI
+	select SHMEM
+	help
+	  Choose this option if you have a system that has an 14th generation Intel CPU
+	  or newer. VPU stands for Versatile Processing Unit and it's a CPU-integrated
+	  inference accelerator for Computer Vision and Deep Learning applications.
+
+	  If "M" is selected, the module will be called intel_vpu.
diff --git a/drivers/gpu/drm/vpu/Makefile b/drivers/gpu/drm/vpu/Makefile
new file mode 100644
index 000000000000..5d6d2a2566cf
--- /dev/null
+++ b/drivers/gpu/drm/vpu/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright © 2022 Intel Corporation
+
+intel_vpu-y := \
+	vpu_drv.o \
+	vpu_hw_mtl.o
+
+obj-$(CONFIG_DRM_VPU) += intel_vpu.o
diff --git a/drivers/gpu/drm/vpu/vpu_drv.c b/drivers/gpu/drm/vpu/vpu_drv.c
new file mode 100644
index 000000000000..bbe7ad97a32c
--- /dev/null
+++ b/drivers/gpu/drm/vpu/vpu_drv.c
@@ -0,0 +1,392 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#include <linux/firmware.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_ioctl.h>
+
+#include "vpu_drv.h"
+#include "vpu_hw.h"
+
+#ifndef DRIVER_VERSION_STR
+#define DRIVER_VERSION_STR __stringify(DRM_VPU_DRIVER_MAJOR) "." \
+			   __stringify(DRM_VPU_DRIVER_MINOR) "."
+#endif
+
+static const struct drm_driver driver;
+
+int vpu_dbg_mask;
+module_param_named(dbg_mask, vpu_dbg_mask, int, 0644);
+MODULE_PARM_DESC(dbg_mask, "Driver debug mask. See VPU_DBG_* macros.");
+
+u8 vpu_pll_min_ratio;
+module_param_named(pll_min_ratio, vpu_pll_min_ratio, byte, 0644);
+MODULE_PARM_DESC(pll_min_ratio, "Minimum PLL ratio used to set VPU frequency");
+
+u8 vpu_pll_max_ratio = U8_MAX;
+module_param_named(pll_max_ratio, vpu_pll_max_ratio, byte, 0644);
+MODULE_PARM_DESC(pll_max_ratio, "Maximum PLL ratio used to set VPU frequency");
+
+char *vpu_platform_to_str(u32 platform)
+{
+	switch (platform) {
+	case VPU_PLATFORM_SILICON:
+		return "VPU_PLATFORM_SILICON";
+	case VPU_PLATFORM_SIMICS:
+		return "VPU_PLATFORM_SIMICS";
+	case VPU_PLATFORM_FPGA:
+		return "VPU_PLATFORM_FPGA";
+	default:
+		return "Invalid platform";
+	}
+}
+
+void vpu_file_priv_get(struct vpu_file_priv *file_priv, struct vpu_file_priv **link)
+{
+	kref_get(&file_priv->ref);
+	*link = file_priv;
+}
+
+static void file_priv_release(struct kref *ref)
+{
+	struct vpu_file_priv *file_priv = container_of(ref, struct vpu_file_priv, ref);
+
+	kfree(file_priv);
+}
+
+void vpu_file_priv_put(struct vpu_file_priv **link)
+{
+	struct vpu_file_priv *file_priv = *link;
+
+	*link = NULL;
+	kref_put(&file_priv->ref, file_priv_release);
+}
+
+static int vpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct vpu_file_priv *file_priv = file->driver_priv;
+	struct vpu_device *vdev = file_priv->vdev;
+	struct pci_dev *pdev = to_pci_dev(vdev->drm.dev);
+	struct drm_vpu_param *args = data;
+	int ret = 0;
+
+	switch (args->param) {
+	case DRM_VPU_PARAM_DEVICE_ID:
+		args->value = pdev->device;
+		break;
+	case DRM_VPU_PARAM_DEVICE_REVISION:
+		args->value = pdev->revision;
+		break;
+	case DRM_VPU_PARAM_PLATFORM_TYPE:
+		args->value = vdev->platform;
+		break;
+	case DRM_VPU_PARAM_CORE_CLOCK_RATE:
+		args->value = vpu_hw_reg_pll_freq_get(vdev);
+		break;
+	case DRM_VPU_PARAM_NUM_CONTEXTS:
+		args->value = vpu_get_context_count(vdev);
+		break;
+	case DRM_VPU_PARAM_CONTEXT_BASE_ADDRESS:
+		args->value = vdev->hw->ranges.user_low.start;
+		break;
+	case DRM_VPU_PARAM_CONTEXT_PRIORITY:
+		args->value = file_priv->priority;
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int vpu_set_param_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct vpu_file_priv *file_priv = file->driver_priv;
+	struct drm_vpu_param *args = data;
+	int ret = 0;
+
+	switch (args->param) {
+	case DRM_VPU_PARAM_CONTEXT_PRIORITY:
+		if (args->value <= DRM_VPU_CONTEXT_PRIORITY_REALTIME)
+			file_priv->priority = args->value;
+		else
+			ret = -EINVAL;
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int vpu_open(struct drm_device *dev, struct drm_file *file)
+{
+	struct vpu_device *vdev = to_vpu_dev(dev);
+	struct vpu_file_priv *file_priv;
+
+	file_priv = kzalloc(sizeof(*file_priv), GFP_KERNEL);
+	if (!file_priv)
+		return -ENOMEM;
+
+	file_priv->vdev = vdev;
+	file_priv->priority = DRM_VPU_CONTEXT_PRIORITY_NORMAL;
+
+	kref_init(&file_priv->ref);
+
+	file->driver_priv = file_priv;
+
+	return 0;
+}
+
+static void vpu_postclose(struct drm_device *dev, struct drm_file *file)
+{
+	struct vpu_file_priv *file_priv = file->driver_priv;
+
+	vpu_file_priv_put(&file_priv);
+}
+
+static const struct drm_ioctl_desc vpu_drm_ioctls[] = {
+	DRM_IOCTL_DEF_DRV(VPU_GET_PARAM, vpu_get_param_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(VPU_SET_PARAM, vpu_set_param_ioctl, DRM_RENDER_ALLOW),
+};
+
+DEFINE_DRM_GEM_FOPS(vpu_fops);
+
+int vpu_shutdown(struct vpu_device *vdev)
+{
+	int ret;
+
+	vpu_hw_irq_disable(vdev);
+
+	ret = vpu_hw_power_down(vdev);
+	if (ret)
+		vpu_warn(vdev, "Failed to power down HW: %d\n", ret);
+
+	return ret;
+}
+
+static const struct drm_driver driver = {
+	.driver_features = DRIVER_GEM | DRIVER_RENDER,
+
+	.open = vpu_open,
+	.postclose = vpu_postclose,
+
+	.ioctls = vpu_drm_ioctls,
+	.num_ioctls = ARRAY_SIZE(vpu_drm_ioctls),
+	.fops = &vpu_fops,
+
+	.name = DRIVER_NAME,
+	.desc = DRIVER_DESC,
+	.date = DRIVER_DATE,
+	.major = DRM_VPU_DRIVER_MAJOR,
+	.minor = DRM_VPU_DRIVER_MINOR,
+};
+
+static int vpu_irq_init(struct vpu_device *vdev)
+{
+	struct pci_dev *pdev = to_pci_dev(vdev->drm.dev);
+	int ret;
+
+	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI | PCI_IRQ_MSIX);
+	if (ret < 0) {
+		vpu_err(vdev, "Failed to allocate and MSI IRQ: %d\n", ret);
+		return ret;
+	}
+
+	vdev->irq = pci_irq_vector(pdev, 0);
+
+	ret = request_irq(vdev->irq, vdev->hw->ops->irq_handler, IRQF_SHARED,
+			  DRIVER_NAME, vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to request an IRQ %d\n", ret);
+		pci_free_irq_vectors(pdev);
+	}
+
+	return ret;
+}
+
+static void vpu_irq_fini(struct vpu_device *vdev)
+{
+	free_irq(vdev->irq, vdev);
+	pci_free_irq_vectors(to_pci_dev(vdev->drm.dev));
+}
+
+static int vpu_pci_init(struct vpu_device *vdev)
+{
+	struct pci_dev *pdev = to_pci_dev(vdev->drm.dev);
+	struct resource *bar0 = &pdev->resource[0];
+	struct resource *bar4 = &pdev->resource[4];
+	int ret;
+
+	vpu_dbg(MISC, "Mapping BAR0 (RegV) %pR\n", bar0);
+	vdev->regv = devm_ioremap_resource(vdev->drm.dev, bar0);
+	if (IS_ERR(vdev->regv)) {
+		vpu_err(vdev, "Failed to map bar 0\n");
+		return -ENOMEM;
+	}
+
+	vpu_dbg(MISC, "Mapping BAR4 (RegB) %pR\n", bar4);
+	vdev->regb = devm_ioremap_resource(vdev->drm.dev, bar4);
+	if (IS_ERR(vdev->regb)) {
+		vpu_err(vdev, "Failed to map bar 4\n");
+		return -ENOMEM;
+	}
+
+	ret = dma_set_mask_and_coherent(vdev->drm.dev, DMA_BIT_MASK(38));
+	if (ret) {
+		vpu_err(vdev, "Failed to set DMA mask: %d\n", ret);
+		return ret;
+	}
+
+	/* Clear any pending errors */
+	pcie_capability_clear_word(pdev, PCI_EXP_DEVSTA, 0x3f);
+
+	ret = pci_enable_device(pdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to enable PCI device: %d\n", ret);
+		return ret;
+	}
+
+	pci_set_master(pdev);
+
+	return 0;
+}
+
+static void vpu_pci_fini(struct vpu_device *vdev)
+{
+	pci_disable_device(to_pci_dev(vdev->drm.dev));
+}
+
+static int vpu_dev_init(struct vpu_device *vdev)
+{
+	int ret;
+
+	vdev->hw = devm_kzalloc(vdev->drm.dev, sizeof(*vdev->hw), GFP_KERNEL);
+	if (!vdev->hw)
+		return -ENOMEM;
+
+	vdev->hw->ops = &vpu_hw_mtl_ops;
+	vdev->platform = VPU_PLATFORM_INVALID;
+
+	xa_init_flags(&vdev->context_xa, XA_FLAGS_ALLOC);
+	vdev->context_xa_limit.min = VPU_GLOBAL_CONTEXT_MMU_SSID + 1;
+	vdev->context_xa_limit.max = VPU_CONTEXT_LIMIT;
+
+	ret = vpu_pci_init(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to initialize PCI device: %d\n", ret);
+		return ret;
+	}
+
+	ret = vpu_irq_init(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to initialize IRQs: %d\n", ret);
+		goto err_pci_fini;
+	}
+
+	ret = vpu_hw_info_init(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to initialize HW info: %d\n", ret);
+		goto err_irq_fini;
+	}
+
+	ret = vpu_hw_power_up(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to power up HW: %d\n", ret);
+		goto err_irq_fini;
+	}
+
+	return 0;
+
+err_irq_fini:
+	vpu_irq_fini(vdev);
+err_pci_fini:
+	vpu_pci_fini(vdev);
+	return ret;
+}
+
+static void vpu_dev_fini(struct vpu_device *vdev)
+{
+	vpu_shutdown(vdev);
+
+	vpu_irq_fini(vdev);
+	vpu_pci_fini(vdev);
+
+	WARN_ON(!xa_empty(&vdev->context_xa));
+	xa_destroy(&vdev->context_xa);
+}
+
+static struct pci_device_id vpu_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_MTL) },
+	{ }
+};
+MODULE_DEVICE_TABLE(pci, vpu_pci_ids);
+
+static int vpu_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	struct vpu_device *vdev;
+	int ret;
+
+	vdev = devm_drm_dev_alloc(&pdev->dev, &driver, struct vpu_device, drm);
+	if (IS_ERR(vdev))
+		return PTR_ERR(vdev);
+
+	pci_set_drvdata(pdev, vdev);
+	vdev->drm.dev_private = vdev;
+
+	ret = vpu_dev_init(vdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to initialize VPU device: %d\n", ret);
+		return ret;
+	}
+
+	ret = drm_dev_register(&vdev->drm, 0);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register DRM device: %d\n", ret);
+		vpu_dev_fini(vdev);
+	}
+
+	return ret;
+}
+
+static void vpu_remove(struct pci_dev *pdev)
+{
+	struct vpu_device *vdev = pci_get_drvdata(pdev);
+
+	drm_dev_unregister(&vdev->drm);
+	vpu_dev_fini(vdev);
+}
+
+static struct pci_driver vpu_pci_driver = {
+	.name = KBUILD_MODNAME,
+	.id_table = vpu_pci_ids,
+	.probe = vpu_probe,
+	.remove = vpu_remove,
+};
+
+static __init int vpu_init(void)
+{
+	pr_info("Intel VPU driver version: %s", DRIVER_VERSION_STR);
+
+	return pci_register_driver(&vpu_pci_driver);
+}
+
+static __exit void vpu_fini(void)
+{
+	pci_unregister_driver(&vpu_pci_driver);
+}
+
+module_init(vpu_init);
+module_exit(vpu_fini);
+
+MODULE_AUTHOR("Intel Corporation");
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_LICENSE("GPL and additional rights");
+MODULE_VERSION(DRIVER_VERSION_STR);
diff --git a/drivers/gpu/drm/vpu/vpu_drv.h b/drivers/gpu/drm/vpu/vpu_drv.h
new file mode 100644
index 000000000000..b2e7d355c0de
--- /dev/null
+++ b/drivers/gpu/drm/vpu/vpu_drv.h
@@ -0,0 +1,157 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#ifndef __VPU_DRV_H__
+#define __VPU_DRV_H__
+
+#include <drm/drm_device.h>
+#include <drm/drm_mm.h>
+#include <drm/drm_print.h>
+
+#include <linux/pci.h>
+#include <linux/xarray.h>
+#include <uapi/drm/vpu_drm.h>
+
+#define DRIVER_NAME "intel_vpu"
+#define DRIVER_DESC "Driver for Intel Versatile Processing Unit (VPU)"
+#define DRIVER_DATE "20220101"
+
+#define PCI_VENDOR_ID_INTEL 0x8086
+#define PCI_DEVICE_ID_MTL   0x7d1d
+
+#define VPU_GLOBAL_CONTEXT_MMU_SSID 0
+#define VPU_CONTEXT_LIMIT	    64
+#define VPU_NUM_ENGINES		    2
+
+#define VPU_PLATFORM_SILICON 0
+#define VPU_PLATFORM_SIMICS  2
+#define VPU_PLATFORM_FPGA    3
+#define VPU_PLATFORM_INVALID 8
+
+#define VPU_DBG_REG	BIT(0)
+#define VPU_DBG_IRQ	BIT(1)
+#define VPU_DBG_MMU	BIT(2)
+#define VPU_DBG_FILE	BIT(3)
+#define VPU_DBG_MISC	BIT(4)
+#define VPU_DBG_FW_BOOT BIT(5)
+#define VPU_DBG_PM	BIT(6)
+#define VPU_DBG_IPC	BIT(7)
+#define VPU_DBG_BO	BIT(8)
+#define VPU_DBG_JOB	BIT(9)
+#define VPU_DBG_JSM	BIT(10)
+#define VPU_DBG_KREF	BIT(11)
+
+#define vpu_err(vdev, fmt, ...) \
+	dev_err((vdev)->drm.dev, "[%s] ERROR: " fmt, __func__, ##__VA_ARGS__)
+
+#define vpu_err_ratelimited(vdev, fmt, ...) \
+	dev_err_ratelimited((vdev)->drm.dev, "[%s] ERROR: " fmt, __func__, ##__VA_ARGS__)
+
+#define vpu_warn(vdev, fmt, ...) \
+	dev_warn((vdev)->drm.dev, "[%s] WARNING: " fmt, __func__, ##__VA_ARGS__)
+
+#define vpu_warn_ratelimited(vdev, fmt, ...) \
+	dev_warn_ratelimited((vdev)->drm.dev, "[%s] WARNING: " fmt, __func__, ##__VA_ARGS__)
+
+#define vpu_info(vdev, fmt, ...) dev_info((vdev)->drm.dev, fmt, ##__VA_ARGS__)
+
+#define vpu_dbg(type, fmt, args...) do {                                       \
+	if (unlikely(VPU_DBG_##type & vpu_dbg_mask))                           \
+		dev_dbg((vdev)->drm.dev, "[%s] " fmt, #type, ##args);          \
+} while (0)
+
+#define VPU_WA(wa_name) (vdev->wa.wa_name)
+
+struct vpu_wa_table {
+	bool punit_disabled;
+	bool clear_runtime_mem;
+};
+
+struct vpu_hw_info;
+struct vpu_fw_info;
+struct vpu_ipc_info;
+struct vpu_mmu_info;
+struct vpu_pm_info;
+
+struct vpu_device {
+	struct drm_device drm; /* Must be first */
+	void __iomem *regb;
+	void __iomem *regv;
+	u32 platform;
+	u32 irq;
+
+	struct vpu_wa_table wa;
+	struct vpu_hw_info *hw;
+
+	struct xarray context_xa;
+	struct xa_limit context_xa_limit;
+
+	struct {
+		int boot;
+		int jsm;
+		int tdr;
+		int reschedule_suspend;
+	} timeout;
+};
+
+struct vpu_file_priv {
+	struct kref ref;
+	struct vpu_device *vdev;
+	u32 priority;
+};
+
+extern int vpu_dbg_mask;
+extern u8 vpu_pll_min_ratio;
+extern u8 vpu_pll_max_ratio;
+
+void vpu_file_priv_get(struct vpu_file_priv *file_priv, struct vpu_file_priv **link);
+void vpu_file_priv_put(struct vpu_file_priv **link);
+char *vpu_platform_to_str(u32 platform);
+int vpu_shutdown(struct vpu_device *vdev);
+
+static inline bool vpu_is_mtl(struct vpu_device *vdev)
+{
+	return to_pci_dev(vdev->drm.dev)->device == PCI_DEVICE_ID_MTL;
+}
+
+static inline u8 vpu_revison(struct vpu_device *vdev)
+{
+	return to_pci_dev(vdev->drm.dev)->revision;
+}
+
+static inline struct vpu_device *to_vpu_dev(struct drm_device *dev)
+{
+	return container_of(dev, struct vpu_device, drm);
+}
+
+static inline u32 vpu_get_context_count(struct vpu_device *vdev)
+{
+	struct xa_limit ctx_limit = vdev->context_xa_limit;
+
+	return (ctx_limit.max - ctx_limit.min + 1);
+}
+
+static inline u32 vpu_get_platform(struct vpu_device *vdev)
+{
+	WARN_ON_ONCE(vdev->platform == VPU_PLATFORM_INVALID);
+	return vdev->platform;
+}
+
+static inline bool vpu_is_silicon(struct vpu_device *vdev)
+{
+	return vpu_get_platform(vdev) == VPU_PLATFORM_SILICON;
+}
+
+static inline bool vpu_is_simics(struct vpu_device *vdev)
+{
+	return vpu_get_platform(vdev) == VPU_PLATFORM_SIMICS;
+}
+
+static inline bool vpu_is_fpga(struct vpu_device *vdev)
+{
+	return vpu_get_platform(vdev) == VPU_PLATFORM_FPGA;
+}
+
+#endif /* __VPU_DRV_H__ */
diff --git a/drivers/gpu/drm/vpu/vpu_hw.h b/drivers/gpu/drm/vpu/vpu_hw.h
new file mode 100644
index 000000000000..971b6a607f73
--- /dev/null
+++ b/drivers/gpu/drm/vpu/vpu_hw.h
@@ -0,0 +1,163 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#ifndef __VPU_HW_H__
+#define __VPU_HW_H__
+
+#include "vpu_drv.h"
+
+struct vpu_hw_ops {
+	int (*info_init)(struct vpu_device *vdev);
+	int (*power_up)(struct vpu_device *vdev);
+	int (*boot_fw)(struct vpu_device *vdev);
+	int (*power_down)(struct vpu_device *vdev);
+	bool (*is_idle)(struct vpu_device *vdev);
+	void (*wdt_disable)(struct vpu_device *vdev);
+	u32 (*reg_pll_freq_get)(struct vpu_device *vdev);
+	u32 (*reg_telemetry_offset_get)(struct vpu_device *vdev);
+	u32 (*reg_telemetry_size_get)(struct vpu_device *vdev);
+	u32 (*reg_telemetry_enable_get)(struct vpu_device *vdev);
+	void (*reg_db_set)(struct vpu_device *vdev, u32 db_id);
+	u32 (*reg_ipc_rx_addr_get)(struct vpu_device *vdev);
+	u32 (*reg_ipc_rx_count_get)(struct vpu_device *vdev);
+	void (*reg_ipc_tx_set)(struct vpu_device *vdev, u32 vpu_addr);
+	void (*irq_clear)(struct vpu_device *vdev);
+	void (*irq_enable)(struct vpu_device *vdev);
+	void (*irq_disable)(struct vpu_device *vdev);
+	irqreturn_t (*irq_handler)(int irq, void *ptr);
+};
+
+struct vpu_addr_range {
+	u64 start;
+	u64 end;
+};
+
+struct vpu_hw_info {
+	const struct vpu_hw_ops *ops;
+	struct {
+		struct vpu_addr_range global_low;
+		struct vpu_addr_range global_high;
+		struct vpu_addr_range user_low;
+		struct vpu_addr_range user_high;
+		struct vpu_addr_range global_aliased_pio;
+	} ranges;
+	struct {
+		u8 min_ratio;
+		u8 max_ratio;
+	} pll;
+	u32 tile_fuse;
+	u32 sku;
+	u16 config;
+};
+
+extern const struct vpu_hw_ops vpu_hw_mtl_ops;
+
+static inline int vpu_hw_info_init(struct vpu_device *vdev)
+{
+	return vdev->hw->ops->info_init(vdev);
+};
+
+static inline int vpu_hw_power_up(struct vpu_device *vdev)
+{
+	vpu_dbg(PM, "HW power up\n");
+
+	return vdev->hw->ops->power_up(vdev);
+};
+
+static inline int vpu_hw_boot_fw(struct vpu_device *vdev)
+{
+	return vdev->hw->ops->boot_fw(vdev);
+};
+
+static inline bool vpu_hw_is_idle(struct vpu_device *vdev)
+{
+	return vdev->hw->ops->is_idle(vdev);
+};
+
+static inline int vpu_hw_power_down(struct vpu_device *vdev)
+{
+	vpu_dbg(PM, "HW power down\n");
+
+	return vdev->hw->ops->power_down(vdev);
+};
+
+static inline void vpu_hw_wdt_disable(struct vpu_device *vdev)
+{
+	vdev->hw->ops->wdt_disable(vdev);
+};
+
+/* Register indirect accesses */
+static inline u32 vpu_hw_reg_pll_freq_get(struct vpu_device *vdev)
+{
+	return vdev->hw->ops->reg_pll_freq_get(vdev);
+};
+
+static inline u32 vpu_hw_reg_telemetry_offset_get(struct vpu_device *vdev)
+{
+	return vdev->hw->ops->reg_telemetry_offset_get(vdev);
+};
+
+static inline u32 vpu_hw_reg_telemetry_size_get(struct vpu_device *vdev)
+{
+	return vdev->hw->ops->reg_telemetry_size_get(vdev);
+};
+
+static inline u32 vpu_hw_reg_telemetry_enable_get(struct vpu_device *vdev)
+{
+	return vdev->hw->ops->reg_telemetry_enable_get(vdev);
+};
+
+static inline void vpu_hw_reg_db_set(struct vpu_device *vdev, u32 db_id)
+{
+	vdev->hw->ops->reg_db_set(vdev, db_id);
+};
+
+static inline u32 vpu_hw_reg_ipc_rx_addr_get(struct vpu_device *vdev)
+{
+	return vdev->hw->ops->reg_ipc_rx_addr_get(vdev);
+};
+
+static inline u32 vpu_hw_reg_ipc_rx_count_get(struct vpu_device *vdev)
+{
+	return vdev->hw->ops->reg_ipc_rx_count_get(vdev);
+};
+
+static inline void vpu_hw_reg_ipc_tx_set(struct vpu_device *vdev, u32 vpu_addr)
+{
+	vdev->hw->ops->reg_ipc_tx_set(vdev, vpu_addr);
+};
+
+static inline void vpu_hw_irq_clear(struct vpu_device *vdev)
+{
+	vdev->hw->ops->irq_clear(vdev);
+};
+
+static inline void vpu_hw_irq_enable(struct vpu_device *vdev)
+{
+	vdev->hw->ops->irq_enable(vdev);
+};
+
+static inline void vpu_hw_irq_disable(struct vpu_device *vdev)
+{
+	vdev->hw->ops->irq_disable(vdev);
+};
+
+static inline void vpu_hw_init_range(struct vpu_addr_range *range, u64 start, u64 size)
+{
+	range->start = start;
+	range->end = start + size;
+}
+
+static inline u64 vpu_hw_range_size(const struct vpu_addr_range *range)
+{
+	return range->end - range->start;
+}
+
+static inline u8 vpu_hw_get_pll_ratio_in_range(u8 pll_ratio, u8 min, u8 max)
+{
+	return min_t(u8, max_t(u8, pll_ratio, min), max);
+}
+
+#endif /* __VPU_HW_H__ */
diff --git a/drivers/gpu/drm/vpu/vpu_hw_mtl.c b/drivers/gpu/drm/vpu/vpu_hw_mtl.c
new file mode 100644
index 000000000000..bdab4b84d202
--- /dev/null
+++ b/drivers/gpu/drm/vpu/vpu_hw_mtl.c
@@ -0,0 +1,1003 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#include "vpu_drv.h"
+#include "vpu_hw_mtl_reg.h"
+#include "vpu_hw_reg_io.h"
+#include "vpu_hw.h"
+
+#define TILE_FUSE_ENABLE_BOTH	     0x0
+#define TILE_FUSE_ENABLE_LOWER	     0x1
+#define TILE_FUSE_ENABLE_UPPER	     0x2
+
+#define TILE_SKU_BOTH_MTL	     0x3630
+#define TILE_SKU_LOWER_MTL	     0x3631
+#define TILE_SKU_UPPER_MTL	     0x3632
+
+/* Work point configuration values */
+#define WP_CONFIG_1_TILE_5_3_RATIO   0x0101
+#define WP_CONFIG_1_TILE_4_3_RATIO   0x0102
+#define WP_CONFIG_2_TILE_5_3_RATIO   0x0201
+#define WP_CONFIG_2_TILE_4_3_RATIO   0x0202
+#define WP_CONFIG_0_TILE_PLL_OFF     0x0000
+
+#define PLL_REF_CLK_FREQ	     (50 * 1000000)
+#define PLL_SIMULATION_FREQ	     (10 * 1000000)
+#define PLL_RATIO_TO_FREQ(x)	     ((x) * PLL_REF_CLK_FREQ)
+#define PLL_DEFAULT_EPP_VALUE	     0x80
+
+#define TIM_SAFE_ENABLE		     0xf1d0dead
+#define TIM_WATCHDOG_RESET_VALUE     0xffffffff
+
+#define TIMEOUT_US		     (150 * USEC_PER_MSEC)
+#define PWR_ISLAND_STATUS_TIMEOUT_US (5 * USEC_PER_MSEC)
+#define PLL_TIMEOUT_US		     (1500 * USEC_PER_MSEC)
+#define IDLE_TIMEOUT_US		     (500 * USEC_PER_MSEC)
+
+#define ICB_0_IRQ_MASK ((REG_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, HOST_IPC_FIFO_INT)) | \
+			(REG_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, MMU_IRQ_0_INT)) | \
+			(REG_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, MMU_IRQ_1_INT)) | \
+			(REG_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, MMU_IRQ_2_INT)) | \
+			(REG_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, NOC_FIREWALL_INT)) | \
+			(REG_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, CPU_INT_REDIRECT_0_INT)) | \
+			(REG_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, CPU_INT_REDIRECT_1_INT)))
+
+#define ICB_1_IRQ_MASK ((REG_FLD(MTL_VPU_HOST_SS_ICB_STATUS_1, CPU_INT_REDIRECT_2_INT)) | \
+			(REG_FLD(MTL_VPU_HOST_SS_ICB_STATUS_1, CPU_INT_REDIRECT_3_INT)) | \
+			(REG_FLD(MTL_VPU_HOST_SS_ICB_STATUS_1, CPU_INT_REDIRECT_4_INT)))
+
+#define ICB_0_1_IRQ_MASK ((((u64)ICB_1_IRQ_MASK) << 32) | ICB_0_IRQ_MASK)
+
+#define BUTTRESS_IRQ_MASK ((REG_FLD(MTL_BUTTRESS_INTERRUPT_STAT, FREQ_CHANGE)) | \
+			   (REG_FLD(MTL_BUTTRESS_INTERRUPT_STAT, ATS_ERR)) | \
+			   (REG_FLD(MTL_BUTTRESS_INTERRUPT_STAT, UFI_ERR)))
+
+#define ITF_FIREWALL_VIOLATION_MASK ((REG_FLD(MTL_VPU_HOST_SS_FW_SOC_IRQ_EN, CSS_ROM_CMX)) | \
+				     (REG_FLD(MTL_VPU_HOST_SS_FW_SOC_IRQ_EN, CSS_DBG)) | \
+				     (REG_FLD(MTL_VPU_HOST_SS_FW_SOC_IRQ_EN, CSS_CTRL)) | \
+				     (REG_FLD(MTL_VPU_HOST_SS_FW_SOC_IRQ_EN, DEC400)) | \
+				     (REG_FLD(MTL_VPU_HOST_SS_FW_SOC_IRQ_EN, MSS_NCE)) | \
+				     (REG_FLD(MTL_VPU_HOST_SS_FW_SOC_IRQ_EN, MSS_MBI)) | \
+				     (REG_FLD(MTL_VPU_HOST_SS_FW_SOC_IRQ_EN, MSS_MBI_CMX)))
+
+static void vpu_hw_read_platform(struct vpu_device *vdev)
+{
+	u32 gen_ctrl = REGV_RD32(MTL_VPU_HOST_SS_GEN_CTRL);
+	u32 platform = REG_GET_FLD(MTL_VPU_HOST_SS_GEN_CTRL, PS, gen_ctrl);
+
+	if  (platform == VPU_PLATFORM_SIMICS || platform == VPU_PLATFORM_FPGA)
+		vdev->platform = platform;
+	else
+		vdev->platform = VPU_PLATFORM_SILICON;
+
+	vpu_dbg(MISC, "Platform type: %s (%d)\n",
+		vpu_platform_to_str(vdev->platform), vdev->platform);
+}
+
+static void vpu_hw_wa_init(struct vpu_device *vdev)
+{
+	vdev->wa.punit_disabled = vpu_is_fpga(vdev);
+	vdev->wa.clear_runtime_mem = true;
+}
+
+static void vpu_hw_timeouts_init(struct vpu_device *vdev)
+{
+	if (vpu_is_simics(vdev)) {
+		vdev->timeout.boot = 100000;
+		vdev->timeout.jsm = 50000;
+		vdev->timeout.tdr = 2000000;
+		vdev->timeout.reschedule_suspend = 1000;
+	} else {
+		vdev->timeout.boot = 1000;
+		vdev->timeout.jsm = 500;
+		vdev->timeout.tdr = 2000;
+		vdev->timeout.reschedule_suspend = 10;
+	}
+}
+
+static int vpu_pll_wait_for_cmd_send(struct vpu_device *vdev)
+{
+	return REGB_POLL_FLD(MTL_BUTTRESS_WP_REQ_CMD, SEND, 0, PLL_TIMEOUT_US);
+}
+
+/* Send KMD initiated workpoint change */
+static int vpu_pll_cmd_send(struct vpu_device *vdev, u16 min_ratio, u16 max_ratio,
+			    u16 target_ratio, u16 config)
+{
+	int ret;
+	u32 val;
+
+	ret = vpu_pll_wait_for_cmd_send(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to sync before WP request: %d\n", ret);
+		return ret;
+	}
+
+	val = REGB_RD32(MTL_BUTTRESS_WP_REQ_PAYLOAD0);
+	val = REG_SET_FLD_NUM(MTL_BUTTRESS_WP_REQ_PAYLOAD0, MIN_RATIO, min_ratio, val);
+	val = REG_SET_FLD_NUM(MTL_BUTTRESS_WP_REQ_PAYLOAD0, MAX_RATIO, max_ratio, val);
+	REGB_WR32(MTL_BUTTRESS_WP_REQ_PAYLOAD0, val);
+
+	val = REGB_RD32(MTL_BUTTRESS_WP_REQ_PAYLOAD1);
+	val = REG_SET_FLD_NUM(MTL_BUTTRESS_WP_REQ_PAYLOAD1, TARGET_RATIO, target_ratio, val);
+	val = REG_SET_FLD_NUM(MTL_BUTTRESS_WP_REQ_PAYLOAD1, EPP, PLL_DEFAULT_EPP_VALUE, val);
+	REGB_WR32(MTL_BUTTRESS_WP_REQ_PAYLOAD1, val);
+
+	val = REGB_RD32(MTL_BUTTRESS_WP_REQ_PAYLOAD2);
+	val = REG_SET_FLD_NUM(MTL_BUTTRESS_WP_REQ_PAYLOAD2, CONFIG, config, val);
+	REGB_WR32(MTL_BUTTRESS_WP_REQ_PAYLOAD2, val);
+
+	val = REGB_RD32(MTL_BUTTRESS_WP_REQ_CMD);
+	val = REG_SET_FLD(MTL_BUTTRESS_WP_REQ_CMD, SEND, val);
+	REGB_WR32(MTL_BUTTRESS_WP_REQ_CMD, val);
+
+	ret = vpu_pll_wait_for_cmd_send(vdev);
+	if (ret)
+		vpu_err(vdev, "Failed to sync after WP request: %d\n", ret);
+
+	return ret;
+}
+
+static int vpu_pll_wait_for_lock(struct vpu_device *vdev, bool enable)
+{
+	u32 exp_val = enable ? 0x1 : 0x0;
+
+	if (VPU_WA(punit_disabled))
+		return 0;
+
+	return REGB_POLL_FLD(MTL_BUTTRESS_PLL_STATUS, LOCK, exp_val, PLL_TIMEOUT_US);
+}
+
+static int vpu_pll_wait_for_status_ready(struct vpu_device *vdev)
+{
+	if (VPU_WA(punit_disabled))
+		return 0;
+
+	return REGB_POLL_FLD(MTL_BUTTRESS_VPU_STATUS, READY, 1, PLL_TIMEOUT_US);
+}
+
+static u16 vpu_hw_mtl_reg_pll_min_ratio_get(struct vpu_device *vdev)
+{
+	if (VPU_WA(punit_disabled))
+		return 0;
+
+	return REGB_RD32(MTL_BUTTRESS_FMIN_FUSE) & MTL_BUTTRESS_FMIN_FUSE_RATIO_MASK;
+}
+
+static u16 vpu_hw_mtl_reg_pll_max_ratio_get(struct vpu_device *vdev)
+{
+	if (VPU_WA(punit_disabled))
+		return 0;
+
+	return REGB_RD32(MTL_BUTTRESS_FMAX_FUSE) & MTL_BUTTRESS_FMAX_FUSE_RATIO_MASK;
+}
+
+static int vpu_pll_drive(struct vpu_device *vdev, bool enable)
+{
+	int ret;
+	struct vpu_hw_info *hw = vdev->hw;
+	u16 target_ratio;
+	u16 config;
+
+	if (VPU_WA(punit_disabled)) {
+		vpu_dbg(PM, "Skipping PLL request on %s\n", vpu_platform_to_str(vdev->platform));
+		return 0;
+	}
+
+	if (enable) {
+		u8 pll_hw_min_ratio = vpu_hw_mtl_reg_pll_min_ratio_get(vdev);
+		u8 pll_hw_max_ratio = vpu_hw_mtl_reg_pll_max_ratio_get(vdev);
+
+		hw->pll.max_ratio = vpu_hw_get_pll_ratio_in_range(vpu_pll_max_ratio,
+								  pll_hw_min_ratio,
+								  pll_hw_max_ratio);
+		hw->pll.min_ratio = vpu_hw_get_pll_ratio_in_range(vpu_pll_min_ratio,
+								  pll_hw_min_ratio,
+								  pll_hw_max_ratio);
+		if (hw->pll.max_ratio < hw->pll.min_ratio) {
+			vpu_err(vdev, "Invalid pll ratio values, min 0x%x max 0x%x\n",
+				hw->pll.min_ratio, hw->pll.max_ratio);
+			return -EINVAL;
+		}
+
+		target_ratio = hw->pll.min_ratio;
+		config = hw->config;
+	} else {
+		target_ratio = 0;
+		config = 0;
+	}
+
+	vpu_dbg(PM, "PLL workpoint request: %d Hz\n", PLL_RATIO_TO_FREQ(target_ratio));
+
+	ret = vpu_pll_cmd_send(vdev, hw->pll.min_ratio, hw->pll.max_ratio, target_ratio, config);
+	if (ret) {
+		vpu_err(vdev, "Failed to send PLL workpoint request: %d\n", ret);
+		return ret;
+	}
+
+	ret = vpu_pll_wait_for_lock(vdev, enable);
+	if (ret) {
+		vpu_err(vdev, "Timed out waiting for PLL lock\n");
+		return ret;
+	}
+
+	if (enable) {
+		ret = vpu_pll_wait_for_status_ready(vdev);
+		if (ret) {
+			vpu_err(vdev, "Timed out waiting for PLL ready status\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int vpu_pll_enable(struct vpu_device *vdev)
+{
+	return vpu_pll_drive(vdev, true);
+}
+
+static int vpu_pll_disable(struct vpu_device *vdev)
+{
+	return vpu_pll_drive(vdev, false);
+}
+
+static void vpu_boot_host_ss_rst_clr_assert(struct vpu_device *vdev)
+{
+	u32 val = REGV_RD32(MTL_VPU_HOST_SS_CPR_RST_CLR);
+
+	val = REG_SET_FLD(MTL_VPU_HOST_SS_CPR_RST_CLR, TOP_NOC, val);
+	val = REG_SET_FLD(MTL_VPU_HOST_SS_CPR_RST_CLR, DSS_MAS, val);
+	val = REG_SET_FLD(MTL_VPU_HOST_SS_CPR_RST_CLR, MSS_MAS, val);
+
+	REGV_WR32(MTL_VPU_HOST_SS_CPR_RST_CLR, val);
+}
+
+static void vpu_boot_host_ss_rst_drive(struct vpu_device *vdev, bool enable)
+{
+	u32 val = REGV_RD32(MTL_VPU_HOST_SS_CPR_RST_SET);
+
+	if (enable) {
+		val = REG_SET_FLD(MTL_VPU_HOST_SS_CPR_RST_SET, TOP_NOC, val);
+		val = REG_SET_FLD(MTL_VPU_HOST_SS_CPR_RST_SET, DSS_MAS, val);
+		val = REG_SET_FLD(MTL_VPU_HOST_SS_CPR_RST_SET, MSS_MAS, val);
+	} else {
+		val = REG_CLR_FLD(MTL_VPU_HOST_SS_CPR_RST_SET, TOP_NOC, val);
+		val = REG_CLR_FLD(MTL_VPU_HOST_SS_CPR_RST_SET, DSS_MAS, val);
+		val = REG_CLR_FLD(MTL_VPU_HOST_SS_CPR_RST_SET, MSS_MAS, val);
+	}
+
+	REGV_WR32(MTL_VPU_HOST_SS_CPR_RST_SET, val);
+}
+
+static void vpu_boot_host_ss_clk_drive(struct vpu_device *vdev, bool enable)
+{
+	u32 val = REGV_RD32(MTL_VPU_HOST_SS_CPR_CLK_SET);
+
+	if (enable) {
+		val = REG_SET_FLD(MTL_VPU_HOST_SS_CPR_CLK_SET, TOP_NOC, val);
+		val = REG_SET_FLD(MTL_VPU_HOST_SS_CPR_CLK_SET, DSS_MAS, val);
+		val = REG_SET_FLD(MTL_VPU_HOST_SS_CPR_CLK_SET, MSS_MAS, val);
+	} else {
+		val = REG_CLR_FLD(MTL_VPU_HOST_SS_CPR_CLK_SET, TOP_NOC, val);
+		val = REG_CLR_FLD(MTL_VPU_HOST_SS_CPR_CLK_SET, DSS_MAS, val);
+		val = REG_CLR_FLD(MTL_VPU_HOST_SS_CPR_CLK_SET, MSS_MAS, val);
+	}
+
+	REGV_WR32(MTL_VPU_HOST_SS_CPR_CLK_SET, val);
+}
+
+static int vpu_boot_noc_qreqn_check(struct vpu_device *vdev, u32 exp_val)
+{
+	u32 val = REGV_RD32(MTL_VPU_HOST_SS_NOC_QREQN);
+
+	if (!REG_TEST_FLD_NUM(MTL_VPU_HOST_SS_NOC_QREQN, TOP_SOCMMIO, exp_val, val))
+		return -EIO;
+
+	return 0;
+}
+
+static int vpu_boot_noc_qacceptn_check(struct vpu_device *vdev, u32 exp_val)
+{
+	u32 val = REGV_RD32(MTL_VPU_HOST_SS_NOC_QACCEPTN);
+
+	if (!REG_TEST_FLD_NUM(MTL_VPU_HOST_SS_NOC_QACCEPTN, TOP_SOCMMIO, exp_val, val))
+		return -EIO;
+
+	return 0;
+}
+
+static int vpu_boot_noc_qdeny_check(struct vpu_device *vdev, u32 exp_val)
+{
+	u32 val = REGV_RD32(MTL_VPU_HOST_SS_NOC_QDENY);
+
+	if (!REG_TEST_FLD_NUM(MTL_VPU_HOST_SS_NOC_QDENY, TOP_SOCMMIO, exp_val, val))
+		return -EIO;
+
+	return 0;
+}
+
+static int vpu_boot_top_noc_qrenqn_check(struct vpu_device *vdev, u32 exp_val)
+{
+	u32 val = REGV_RD32(MTL_VPU_TOP_NOC_QREQN);
+
+	if (!REG_TEST_FLD_NUM(MTL_VPU_TOP_NOC_QREQN, CPU_CTRL, exp_val, val) ||
+	    !REG_TEST_FLD_NUM(MTL_VPU_TOP_NOC_QREQN, HOSTIF_L2CACHE, exp_val, val))
+		return -EIO;
+
+	return 0;
+}
+
+static int vpu_boot_top_noc_qacceptn_check(struct vpu_device *vdev, u32 exp_val)
+{
+	u32 val = REGV_RD32(MTL_VPU_TOP_NOC_QACCEPTN);
+
+	if (!REG_TEST_FLD_NUM(MTL_VPU_TOP_NOC_QACCEPTN, CPU_CTRL, exp_val, val) ||
+	    !REG_TEST_FLD_NUM(MTL_VPU_TOP_NOC_QACCEPTN, HOSTIF_L2CACHE, exp_val, val))
+		return -EIO;
+
+	return 0;
+}
+
+static int vpu_boot_top_noc_qdeny_check(struct vpu_device *vdev, u32 exp_val)
+{
+	u32 val = REGV_RD32(MTL_VPU_TOP_NOC_QDENY);
+
+	if (!REG_TEST_FLD_NUM(MTL_VPU_TOP_NOC_QDENY, CPU_CTRL, exp_val, val) ||
+	    !REG_TEST_FLD_NUM(MTL_VPU_TOP_NOC_QDENY, HOSTIF_L2CACHE, exp_val, val))
+		return -EIO;
+
+	return 0;
+}
+
+static int vpu_boot_host_ss_configure(struct vpu_device *vdev)
+{
+	vpu_boot_host_ss_rst_clr_assert(vdev);
+
+	return vpu_boot_noc_qreqn_check(vdev, 0x0);
+}
+
+static void vpu_boot_vpu_idle_gen_disable(struct vpu_device *vdev)
+{
+	REGV_WR32(MTL_VPU_HOST_SS_AON_VPU_IDLE_GEN, 0x0);
+}
+
+static int vpu_boot_host_ss_axi_drive(struct vpu_device *vdev, bool enable)
+{
+	int ret;
+	u32 val;
+
+	val = REGV_RD32(MTL_VPU_HOST_SS_NOC_QREQN);
+	if (enable)
+		val = REG_SET_FLD(MTL_VPU_HOST_SS_NOC_QREQN, TOP_SOCMMIO, val);
+	else
+		val = REG_CLR_FLD(MTL_VPU_HOST_SS_NOC_QREQN, TOP_SOCMMIO, val);
+	REGV_WR32(MTL_VPU_HOST_SS_NOC_QREQN, val);
+
+	ret = vpu_boot_noc_qacceptn_check(vdev, enable ? 0x1 : 0x0);
+	if (ret) {
+		vpu_err(vdev, "Failed qacceptn check: %d\n", ret);
+		return ret;
+	}
+
+	ret = vpu_boot_noc_qdeny_check(vdev, 0x0);
+	if (ret)
+		vpu_err(vdev, "Failed qdeny check: %d\n", ret);
+
+	return ret;
+}
+
+static int vpu_boot_host_ss_axi_enable(struct vpu_device *vdev)
+{
+	return vpu_boot_host_ss_axi_drive(vdev, true);
+}
+
+static int vpu_boot_host_ss_axi_disable(struct vpu_device *vdev)
+{
+	return vpu_boot_host_ss_axi_drive(vdev, false);
+}
+
+static int vpu_boot_host_ss_top_noc_drive(struct vpu_device *vdev, bool enable)
+{
+	int ret;
+	u32 val;
+
+	val = REGV_RD32(MTL_VPU_TOP_NOC_QREQN);
+	if (enable) {
+		val = REG_SET_FLD(MTL_VPU_TOP_NOC_QREQN, CPU_CTRL, val);
+		val = REG_SET_FLD(MTL_VPU_TOP_NOC_QREQN, HOSTIF_L2CACHE, val);
+	} else {
+		val = REG_CLR_FLD(MTL_VPU_TOP_NOC_QREQN, CPU_CTRL, val);
+		val = REG_CLR_FLD(MTL_VPU_TOP_NOC_QREQN, HOSTIF_L2CACHE, val);
+	}
+	REGV_WR32(MTL_VPU_TOP_NOC_QREQN, val);
+
+	ret = vpu_boot_top_noc_qacceptn_check(vdev, enable ? 0x1 : 0x0);
+	if (ret) {
+		vpu_err(vdev, "Failed qacceptn check: %d\n", ret);
+		return ret;
+	}
+
+	ret = vpu_boot_top_noc_qdeny_check(vdev, 0x0);
+	if (ret)
+		vpu_err(vdev, "Failed qdeny check: %d\n", ret);
+
+	return ret;
+}
+
+static int vpu_boot_host_ss_top_noc_enable(struct vpu_device *vdev)
+{
+	return vpu_boot_host_ss_top_noc_drive(vdev, true);
+}
+
+static int vpu_boot_host_ss_top_noc_disable(struct vpu_device *vdev)
+{
+	return vpu_boot_host_ss_top_noc_drive(vdev, false);
+}
+
+static void vpu_boot_pwr_island_trickle_drive(struct vpu_device *vdev, bool enable)
+{
+	u32 val = REGV_RD32(MTL_VPU_HOST_SS_AON_PWR_ISLAND_TRICKLE_EN0);
+
+	if (enable)
+		val = REG_SET_FLD(MTL_VPU_HOST_SS_AON_PWR_ISLAND_TRICKLE_EN0, MSS_CPU, val);
+	else
+		val = REG_CLR_FLD(MTL_VPU_HOST_SS_AON_PWR_ISLAND_TRICKLE_EN0, MSS_CPU, val);
+
+	REGV_WR32(MTL_VPU_HOST_SS_AON_PWR_ISLAND_TRICKLE_EN0, val);
+}
+
+static void vpu_boot_pwr_island_drive(struct vpu_device *vdev, bool enable)
+{
+	u32 val = REGV_RD32(MTL_VPU_HOST_SS_AON_PWR_ISLAND_EN0);
+
+	if (enable)
+		val = REG_SET_FLD(MTL_VPU_HOST_SS_AON_PWR_ISLAND_EN0, MSS_CPU, val);
+	else
+		val = REG_CLR_FLD(MTL_VPU_HOST_SS_AON_PWR_ISLAND_EN0, MSS_CPU, val);
+
+	REGV_WR32(MTL_VPU_HOST_SS_AON_PWR_ISLAND_EN0, val);
+}
+
+static int vpu_boot_wait_for_pwr_island_status(struct vpu_device *vdev, u32 exp_val)
+{
+	/* FPGA model (UPF) is not power aware, skipped Power Island polling */
+	if (vpu_is_fpga(vdev))
+		return 0;
+
+	return REGV_POLL_FLD(MTL_VPU_HOST_SS_AON_PWR_ISLAND_STATUS0, MSS_CPU,
+			     exp_val, PWR_ISLAND_STATUS_TIMEOUT_US);
+}
+
+static void vpu_boot_pwr_island_isolation_drive(struct vpu_device *vdev, bool enable)
+{
+	u32 val = REGV_RD32(MTL_VPU_HOST_SS_AON_PWR_ISO_EN0);
+
+	if (enable)
+		val = REG_SET_FLD(MTL_VPU_HOST_SS_AON_PWR_ISO_EN0, MSS_CPU, val);
+	else
+		val = REG_CLR_FLD(MTL_VPU_HOST_SS_AON_PWR_ISO_EN0, MSS_CPU, val);
+
+	REGV_WR32(MTL_VPU_HOST_SS_AON_PWR_ISO_EN0, val);
+}
+
+static void vpu_boot_dpu_active_drive(struct vpu_device *vdev, bool enable)
+{
+	u32 val = REGV_RD32(MTL_VPU_HOST_SS_AON_DPU_ACTIVE);
+
+	if (enable)
+		val = REG_SET_FLD(MTL_VPU_HOST_SS_AON_DPU_ACTIVE, DPU_ACTIVE, val);
+	else
+		val = REG_CLR_FLD(MTL_VPU_HOST_SS_AON_DPU_ACTIVE, DPU_ACTIVE, val);
+
+	REGV_WR32(MTL_VPU_HOST_SS_AON_DPU_ACTIVE, val);
+}
+
+static int vpu_boot_pwr_domain_disable(struct vpu_device *vdev)
+{
+	vpu_boot_dpu_active_drive(vdev, false);
+	vpu_boot_pwr_island_isolation_drive(vdev, true);
+	vpu_boot_pwr_island_trickle_drive(vdev, false);
+	vpu_boot_pwr_island_drive(vdev, false);
+
+	return vpu_boot_wait_for_pwr_island_status(vdev, 0x0);
+}
+
+static int vpu_boot_pwr_domain_enable(struct vpu_device *vdev)
+{
+	int ret;
+
+	vpu_boot_pwr_island_trickle_drive(vdev, true);
+	vpu_boot_pwr_island_drive(vdev, true);
+
+	ret = vpu_boot_wait_for_pwr_island_status(vdev, 0x1);
+	if (ret) {
+		vpu_err(vdev, "Timed out waiting for power island status\n");
+		return ret;
+	}
+
+	ret = vpu_boot_top_noc_qrenqn_check(vdev, 0x0);
+	if (ret) {
+		vpu_err(vdev, "Failed qrenqn check %d\n", ret);
+		return ret;
+	}
+
+	vpu_boot_host_ss_clk_drive(vdev, true);
+	vpu_boot_pwr_island_isolation_drive(vdev, false);
+	vpu_boot_host_ss_rst_drive(vdev, true);
+	vpu_boot_dpu_active_drive(vdev, true);
+
+	return ret;
+}
+
+static void vpu_boot_no_snoop_enable(struct vpu_device *vdev)
+{
+	u32 val = REGV_RD32(MTL_VPU_HOST_IF_TCU_PTW_OVERRIDES);
+
+	val = REG_SET_FLD(MTL_VPU_HOST_IF_TCU_PTW_OVERRIDES, NOSNOOP_OVERRIDE_EN, val);
+	val = REG_SET_FLD(MTL_VPU_HOST_IF_TCU_PTW_OVERRIDES, AW_NOSNOOP_OVERRIDE, val);
+	val = REG_SET_FLD(MTL_VPU_HOST_IF_TCU_PTW_OVERRIDES, AR_NOSNOOP_OVERRIDE, val);
+
+	REGV_WR32(MTL_VPU_HOST_IF_TCU_PTW_OVERRIDES, val);
+}
+
+static void vpu_boot_tbu_mmu_enable(struct vpu_device *vdev)
+{
+	u32 val = REGV_RD32(MTL_VPU_HOST_IF_TBU_MMUSSIDV);
+
+	if (vpu_is_fpga(vdev)) {
+		val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU0_AWMMUSSIDV, val);
+		val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU0_ARMMUSSIDV, val);
+		val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU2_AWMMUSSIDV, val);
+		val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU2_ARMMUSSIDV, val);
+	} else {
+		val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU0_AWMMUSSIDV, val);
+		val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU0_ARMMUSSIDV, val);
+		val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU1_AWMMUSSIDV, val);
+		val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU1_ARMMUSSIDV, val);
+		val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU2_AWMMUSSIDV, val);
+		val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU2_ARMMUSSIDV, val);
+		val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU3_AWMMUSSIDV, val);
+		val = REG_SET_FLD(MTL_VPU_HOST_IF_TBU_MMUSSIDV, TBU3_ARMMUSSIDV, val);
+	}
+
+	REGV_WR32(MTL_VPU_HOST_IF_TBU_MMUSSIDV, val);
+}
+
+static void vpu_boot_soc_cpu_boot(struct vpu_device *vdev)
+{
+	u32 val;
+
+	val = REGV_RD32(MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC);
+	val = REG_SET_FLD(MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC, IRQI_RSTRUN0, val);
+
+	val = REG_CLR_FLD(MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC, IRQI_RSTVEC, val);
+	REGV_WR32(MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC, val);
+
+	val = REG_SET_FLD(MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC, IRQI_RESUME0, val);
+	REGV_WR32(MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC, val);
+
+	val = REG_CLR_FLD(MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC, IRQI_RESUME0, val);
+	REGV_WR32(MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC, val);
+}
+
+static int vpu_boot_d0i3_drive(struct vpu_device *vdev, bool enable)
+{
+	int ret;
+	u32 val;
+
+	ret = REGB_POLL_FLD(MTL_BUTTRESS_VPU_D0I3_CONTROL, INPROGRESS, 0, TIMEOUT_US);
+	if (ret) {
+		vpu_err(vdev, "Failed to sync before D0i3 tansition: %d\n", ret);
+		return ret;
+	}
+
+	val = REGB_RD32(MTL_BUTTRESS_VPU_D0I3_CONTROL);
+	if (enable)
+		val = REG_SET_FLD(MTL_BUTTRESS_VPU_D0I3_CONTROL, I3, val);
+	else
+		val = REG_CLR_FLD(MTL_BUTTRESS_VPU_D0I3_CONTROL, I3, val);
+	REGB_WR32(MTL_BUTTRESS_VPU_D0I3_CONTROL, val);
+
+	ret = REGB_POLL_FLD(MTL_BUTTRESS_VPU_D0I3_CONTROL, INPROGRESS, 0, TIMEOUT_US);
+	if (ret)
+		vpu_err(vdev, "Failed to sync after D0i3 tansition: %d\n", ret);
+
+	return ret;
+}
+
+static int vpu_hw_mtl_info_init(struct vpu_device *vdev)
+{
+	struct vpu_hw_info *hw = vdev->hw;
+	u32 tile_fuse;
+
+	tile_fuse = REGB_RD32(MTL_BUTTRESS_TILE_FUSE);
+	if (!REG_TEST_FLD(MTL_BUTTRESS_TILE_FUSE, VALID, tile_fuse))
+		vpu_warn(vdev, "Tile Fuse: Invalid (0x%x)\n", tile_fuse);
+
+	hw->tile_fuse = REG_GET_FLD(MTL_BUTTRESS_TILE_FUSE, SKU, tile_fuse);
+	switch (hw->tile_fuse) {
+	case TILE_FUSE_ENABLE_LOWER:
+		hw->sku = TILE_SKU_LOWER_MTL;
+		hw->config = WP_CONFIG_1_TILE_5_3_RATIO;
+		vpu_dbg(MISC, "Tile Fuse: Enable Lower\n");
+		break;
+	case TILE_FUSE_ENABLE_UPPER:
+		hw->sku = TILE_SKU_UPPER_MTL;
+		hw->config = WP_CONFIG_1_TILE_4_3_RATIO;
+		vpu_dbg(MISC, "Tile Fuse: Enable Upper\n");
+		break;
+	case TILE_FUSE_ENABLE_BOTH:
+		hw->sku = TILE_SKU_BOTH_MTL;
+		hw->config = WP_CONFIG_2_TILE_5_3_RATIO;
+		vpu_dbg(MISC, "Tile Fuse: Enable Both\n");
+		break;
+	default:
+		hw->config = WP_CONFIG_0_TILE_PLL_OFF;
+		vpu_dbg(MISC, "Tile Fuse: Disable\n");
+		break;
+	}
+
+	vpu_hw_init_range(&hw->ranges.global_low, 0x80000000, SZ_512M);
+	vpu_hw_init_range(&hw->ranges.global_high, 0x180000000, SZ_2M);
+	vpu_hw_init_range(&hw->ranges.user_low, 0xc0000000, 127 * SZ_1M);
+	vpu_hw_init_range(&hw->ranges.user_high, 0x180000000, SZ_2G);
+	hw->ranges.global_aliased_pio = hw->ranges.user_low;
+
+	return 0;
+}
+
+static int vpu_hw_mtl_reset(struct vpu_device *vdev)
+{
+	int ret;
+	u32 val;
+
+	if (VPU_WA(punit_disabled))
+		return 0;
+
+	ret = REGB_POLL_FLD(MTL_BUTTRESS_VPU_IP_RESET, TRIGGER, 0, TIMEOUT_US);
+	if (ret) {
+		vpu_err(vdev, "Timed out waiting for TRIGGER bit\n");
+		return ret;
+	}
+
+	val = REGB_RD32(MTL_BUTTRESS_VPU_IP_RESET);
+	val = REG_SET_FLD(MTL_BUTTRESS_VPU_IP_RESET, TRIGGER, val);
+	REGB_WR32(MTL_BUTTRESS_VPU_IP_RESET, val);
+
+	ret = REGB_POLL_FLD(MTL_BUTTRESS_VPU_IP_RESET, TRIGGER, 0, TIMEOUT_US);
+	if (ret)
+		vpu_err(vdev, "Timed out waiting for RESET completion\n");
+
+	return ret;
+}
+
+static int vpu_hw_mtl_d0i3_enable(struct vpu_device *vdev)
+{
+	int ret;
+
+	ret = vpu_boot_d0i3_drive(vdev, true);
+	if (ret)
+		vpu_err(vdev, "Failed to enable D0i3: %d\n", ret);
+
+	udelay(5); /* VPU requires 5 us to complete the transition */
+
+	return ret;
+}
+
+static int vpu_hw_mtl_d0i3_disable(struct vpu_device *vdev)
+{
+	int ret;
+
+	ret = vpu_boot_d0i3_drive(vdev, false);
+	if (ret)
+		vpu_err(vdev, "Failed to disable D0i3: %d\n", ret);
+
+	return ret;
+}
+
+static int vpu_hw_mtl_power_up(struct vpu_device *vdev)
+{
+	int ret;
+
+	vpu_hw_read_platform(vdev);
+	vpu_hw_wa_init(vdev);
+	vpu_hw_timeouts_init(vdev);
+
+	ret = vpu_hw_mtl_reset(vdev);
+	if (ret)
+		vpu_warn(vdev, "Failed to reset HW: %d\n", ret);
+
+	ret = vpu_hw_mtl_d0i3_disable(vdev);
+	if (ret)
+		vpu_warn(vdev, "Failed to disable D0I3: %d\n", ret);
+
+	ret = vpu_pll_enable(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to enable PLL: %d\n", ret);
+		return ret;
+	}
+
+	ret = vpu_boot_host_ss_configure(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to configure host SS: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * The control circuitry for vpu_idle indication logic powers up active.
+	 * To ensure unnecessary low power mode signal from LRT during bring up,
+	 * KMD disables the circuitry prior to bringing up the Main Power island.
+	 */
+	vpu_boot_vpu_idle_gen_disable(vdev);
+
+	ret = vpu_boot_pwr_domain_enable(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to enable power domain: %d\n", ret);
+		return ret;
+	}
+
+	ret = vpu_boot_host_ss_axi_enable(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to enable AXI: %d\n", ret);
+		return ret;
+	}
+
+	ret = vpu_boot_host_ss_top_noc_enable(vdev);
+	if (ret)
+		vpu_err(vdev, "Failed to enable TOP NOC: %d\n", ret);
+
+	return ret;
+}
+
+static int vpu_hw_mtl_boot_fw(struct vpu_device *vdev)
+{
+	vpu_boot_no_snoop_enable(vdev);
+	vpu_boot_tbu_mmu_enable(vdev);
+	vpu_boot_soc_cpu_boot(vdev);
+
+	return 0;
+}
+
+static bool vpu_hw_mtl_is_idle(struct vpu_device *vdev)
+{
+	u32 val;
+
+	if (VPU_WA(punit_disabled))
+		return true;
+
+	val = REGB_RD32(MTL_BUTTRESS_VPU_STATUS);
+	return REG_TEST_FLD(MTL_BUTTRESS_VPU_STATUS, READY, val) &&
+	       REG_TEST_FLD(MTL_BUTTRESS_VPU_STATUS, IDLE, val);
+}
+
+static int vpu_hw_mtl_power_down(struct vpu_device *vdev)
+{
+	int ret = 0;
+
+	/* FPGA requires manual clearing of IP_Reset bit by enabling quiescent state */
+	if (vpu_is_fpga(vdev)) {
+		if (vpu_boot_host_ss_top_noc_disable(vdev)) {
+			vpu_err(vdev, "Failed to disable TOP NOC\n");
+			ret = -EIO;
+		}
+
+		if (vpu_boot_host_ss_axi_disable(vdev)) {
+			vpu_err(vdev, "Failed to disable AXI\n");
+			ret = -EIO;
+		}
+	}
+
+	if (vpu_boot_pwr_domain_disable(vdev)) {
+		vpu_err(vdev, "Failed to disable power domain\n");
+		ret = -EIO;
+	}
+
+	if (vpu_pll_disable(vdev)) {
+		vpu_err(vdev, "Failed to disable PLL\n");
+		ret = -EIO;
+	}
+
+	if (vpu_hw_mtl_d0i3_enable(vdev))
+		vpu_warn(vdev, "Failed to enable D0I3\n");
+
+	return ret;
+}
+
+static void vpu_hw_mtl_wdt_disable(struct vpu_device *vdev)
+{
+	u32 val;
+
+	/* Enable writing and set non-zero WDT value */
+	REGV_WR32(MTL_VPU_CPU_SS_TIM_SAFE, TIM_SAFE_ENABLE);
+	REGV_WR32(MTL_VPU_CPU_SS_TIM_WATCHDOG, TIM_WATCHDOG_RESET_VALUE);
+
+	/* Enable writing and disable watchdog timer */
+	REGV_WR32(MTL_VPU_CPU_SS_TIM_SAFE, TIM_SAFE_ENABLE);
+	REGV_WR32(MTL_VPU_CPU_SS_TIM_WDOG_EN, 0);
+
+	/* Now clear the timeout interrupt */
+	val = REGV_RD32(MTL_VPU_CPU_SS_TIM_GEN_CONFIG);
+	val = REG_CLR_FLD(MTL_VPU_CPU_SS_TIM_GEN_CONFIG, WDOG_TO_INT_CLR, val);
+	REGV_WR32(MTL_VPU_CPU_SS_TIM_GEN_CONFIG, val);
+}
+
+/* Register indirect accesses */
+static u32 vpu_hw_mtl_reg_pll_freq_get(struct vpu_device *vdev)
+{
+	u32 pll_curr_ratio;
+
+	pll_curr_ratio = REGB_RD32(MTL_BUTTRESS_CURRENT_PLL);
+	pll_curr_ratio &= MTL_BUTTRESS_CURRENT_PLL_RATIO_MASK;
+
+	if (!vpu_is_silicon(vdev))
+		return PLL_SIMULATION_FREQ;
+
+	return PLL_RATIO_TO_FREQ(pll_curr_ratio);
+}
+
+static u32 vpu_hw_mtl_reg_telemetry_offset_get(struct vpu_device *vdev)
+{
+	return REGB_RD32(MTL_BUTTRESS_VPU_TELEMETRY_OFFSET);
+}
+
+static u32 vpu_hw_mtl_reg_telemetry_size_get(struct vpu_device *vdev)
+{
+	return REGB_RD32(MTL_BUTTRESS_VPU_TELEMETRY_SIZE);
+}
+
+static u32 vpu_hw_mtl_reg_telemetry_enable_get(struct vpu_device *vdev)
+{
+	return REGB_RD32(MTL_BUTTRESS_VPU_TELEMETRY_ENABLE);
+}
+
+static void vpu_hw_mtl_reg_db_set(struct vpu_device *vdev, u32 db_id)
+{
+	u32 reg_stride = MTL_VPU_CPU_SS_DOORBELL_1 - MTL_VPU_CPU_SS_DOORBELL_0;
+	u32 val = BIT(MTL_VPU_CPU_SS_DOORBELL_0_SET_OFFSET);
+
+	REGV_WR32I(MTL_VPU_CPU_SS_DOORBELL_0, reg_stride, db_id, val);
+}
+
+static u32 vpu_hw_mtl_reg_ipc_rx_addr_get(struct vpu_device *vdev)
+{
+	return REGV_RD32(MTL_VPU_HOST_SS_TIM_IPC_FIFO_ATM);
+}
+
+static u32 vpu_hw_mtl_reg_ipc_rx_count_get(struct vpu_device *vdev)
+{
+	u32 count = REGV_RD32_SILENT(MTL_VPU_HOST_SS_TIM_IPC_FIFO_STAT);
+
+	return REG_GET_FLD(MTL_VPU_HOST_SS_TIM_IPC_FIFO_STAT, FILL_LEVEL, count);
+}
+
+static void vpu_hw_mtl_reg_ipc_tx_set(struct vpu_device *vdev, u32 vpu_addr)
+{
+	REGV_WR32(MTL_VPU_CPU_SS_TIM_IPC_FIFO, vpu_addr);
+}
+
+static void vpu_hw_mtl_irq_clear(struct vpu_device *vdev)
+{
+	REGV_WR64(MTL_VPU_HOST_SS_ICB_CLEAR_0, ICB_0_1_IRQ_MASK);
+}
+
+static void vpu_hw_mtl_irq_enable(struct vpu_device *vdev)
+{
+	REGV_WR32(MTL_VPU_HOST_SS_FW_SOC_IRQ_EN, ITF_FIREWALL_VIOLATION_MASK);
+	REGV_WR64(MTL_VPU_HOST_SS_ICB_ENABLE_0, ICB_0_1_IRQ_MASK);
+	REGB_WR32(MTL_BUTTRESS_LOCAL_INT_MASK, (u32)~(BIT(1) | BIT(2)));
+	REGB_WR32(MTL_BUTTRESS_GLOBAL_INT_MASK, 0x0);
+}
+
+static void vpu_hw_mtl_irq_disable(struct vpu_device *vdev)
+{
+	REGB_WR32(MTL_BUTTRESS_GLOBAL_INT_MASK, 0x1);
+	REGB_WR32(MTL_BUTTRESS_LOCAL_INT_MASK, BUTTRESS_IRQ_MASK);
+	REGV_WR64(MTL_VPU_HOST_SS_ICB_ENABLE_0, 0x0ull);
+	REGB_WR32(MTL_VPU_HOST_SS_FW_SOC_IRQ_EN, 0x0ul);
+}
+
+static irqreturn_t vpu_hw_mtl_irq_wdt_nce_handler(struct vpu_device *vdev)
+{
+	vpu_warn_ratelimited(vdev, "WDT NCE irq\n");
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t vpu_hw_mtl_irq_wdt_mss_handler(struct vpu_device *vdev)
+{
+	vpu_warn_ratelimited(vdev, "WDT MSS irq\n");
+
+	vpu_hw_wdt_disable(vdev);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t vpu_hw_mtl_irq_noc_firewall_handler(struct vpu_device *vdev)
+{
+	vpu_warn_ratelimited(vdev, "NOC Firewall irq\n");
+
+	return IRQ_HANDLED;
+}
+
+/* Handler for IRQs from VPU core (irqV) */
+static irqreturn_t vpu_hw_mtl_irqv_handler(struct vpu_device *vdev, int irq)
+{
+	irqreturn_t ret = IRQ_HANDLED;
+	u32 status = REGV_RD32(MTL_VPU_HOST_SS_ICB_STATUS_0) & ICB_0_IRQ_MASK;
+
+	REGV_WR32(MTL_VPU_HOST_SS_ICB_CLEAR_0, status);
+
+	if (REG_TEST_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, CPU_INT_REDIRECT_0_INT, status))
+		ret &= vpu_hw_mtl_irq_wdt_mss_handler(vdev);
+
+	if (REG_TEST_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, CPU_INT_REDIRECT_1_INT, status))
+		ret &= vpu_hw_mtl_irq_wdt_nce_handler(vdev);
+
+	if (REG_TEST_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, NOC_FIREWALL_INT, status))
+		ret &= vpu_hw_mtl_irq_noc_firewall_handler(vdev);
+
+	return ret;
+}
+
+/* Handler for IRQs from Buttress core (irqB) */
+static irqreturn_t vpu_hw_mtl_irqb_handler(struct vpu_device *vdev, int irq)
+{
+	u32 status = REGB_RD32(MTL_BUTTRESS_INTERRUPT_STAT) & BUTTRESS_IRQ_MASK;
+
+	REGB_WR32(MTL_BUTTRESS_INTERRUPT_STAT, status);
+
+	if (REG_TEST_FLD(MTL_BUTTRESS_INTERRUPT_STAT, FREQ_CHANGE, status))
+		vpu_dbg(IRQ, "FREQ_CHANGE");
+
+	if (REG_TEST_FLD(MTL_BUTTRESS_INTERRUPT_STAT, ATS_ERR, status)) {
+		vpu_dbg(IRQ, "ATS_ERR 0x%016llx", REGB_RD64(MTL_BUTTRESS_ATS_ERR_LOG_0));
+		REGB_WR32(MTL_BUTTRESS_ATS_ERR_CLEAR, 0x1);
+	}
+
+	if (REG_TEST_FLD(MTL_BUTTRESS_INTERRUPT_STAT, UFI_ERR, status)) {
+		vpu_dbg(IRQ, "UFI_ERR 0x%08x", REGB_RD32(MTL_BUTTRESS_UFI_ERR_LOG));
+		REGB_WR32(MTL_BUTTRESS_UFI_ERR_CLEAR, 0x1);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t vpu_hw_mtl_irq_handler(int irq, void *ptr)
+{
+	struct vpu_device *vdev = ptr;
+	irqreturn_t ret_irqv;
+	irqreturn_t ret_irqb;
+
+	vpu_hw_mtl_irq_disable(vdev);
+
+	ret_irqv = vpu_hw_mtl_irqv_handler(vdev, irq);
+	ret_irqb = vpu_hw_mtl_irqb_handler(vdev, irq);
+
+	vpu_hw_mtl_irq_enable(vdev);
+
+	return ret_irqv & ret_irqb;
+}
+
+const struct vpu_hw_ops vpu_hw_mtl_ops = {
+	.info_init = vpu_hw_mtl_info_init,
+	.power_up = vpu_hw_mtl_power_up,
+	.is_idle = vpu_hw_mtl_is_idle,
+	.power_down = vpu_hw_mtl_power_down,
+	.boot_fw = vpu_hw_mtl_boot_fw,
+	.wdt_disable = vpu_hw_mtl_wdt_disable,
+	.reg_pll_freq_get = vpu_hw_mtl_reg_pll_freq_get,
+	.reg_telemetry_offset_get = vpu_hw_mtl_reg_telemetry_offset_get,
+	.reg_telemetry_size_get = vpu_hw_mtl_reg_telemetry_size_get,
+	.reg_telemetry_enable_get = vpu_hw_mtl_reg_telemetry_enable_get,
+	.reg_db_set = vpu_hw_mtl_reg_db_set,
+	.reg_ipc_rx_addr_get = vpu_hw_mtl_reg_ipc_rx_addr_get,
+	.reg_ipc_rx_count_get = vpu_hw_mtl_reg_ipc_rx_count_get,
+	.reg_ipc_tx_set = vpu_hw_mtl_reg_ipc_tx_set,
+	.irq_clear = vpu_hw_mtl_irq_clear,
+	.irq_enable = vpu_hw_mtl_irq_enable,
+	.irq_disable = vpu_hw_mtl_irq_disable,
+	.irq_handler = vpu_hw_mtl_irq_handler,
+};
diff --git a/drivers/gpu/drm/vpu/vpu_hw_mtl_reg.h b/drivers/gpu/drm/vpu/vpu_hw_mtl_reg.h
new file mode 100644
index 000000000000..c2881a9648c1
--- /dev/null
+++ b/drivers/gpu/drm/vpu/vpu_hw_mtl_reg.h
@@ -0,0 +1,468 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#ifndef __VPU_HW_MTL_REG_H__
+#define __VPU_HW_MTL_REG_H__
+
+#define MTL_BUTTRESS_INTERRUPT_TYPE					0x00000000u
+
+#define MTL_BUTTRESS_INTERRUPT_STAT					0x00000004u
+#define MTL_BUTTRESS_INTERRUPT_STAT_FREQ_CHANGE_SHIFT			0u
+#define MTL_BUTTRESS_INTERRUPT_STAT_FREQ_CHANGE_MASK			0x00000001u
+#define MTL_BUTTRESS_INTERRUPT_STAT_ATS_ERR_SHIFT			1u
+#define MTL_BUTTRESS_INTERRUPT_STAT_ATS_ERR_MASK			0x00000002u
+#define MTL_BUTTRESS_INTERRUPT_STAT_UFI_ERR_SHIFT			2u
+#define MTL_BUTTRESS_INTERRUPT_STAT_UFI_ERR_MASK			0x00000004u
+
+#define MTL_BUTTRESS_WP_REQ_PAYLOAD0					0x00000008u
+#define MTL_BUTTRESS_WP_REQ_PAYLOAD0_MIN_RATIO_SHIFT			0u
+#define MTL_BUTTRESS_WP_REQ_PAYLOAD0_MIN_RATIO_MASK			0x0000ffffu
+#define MTL_BUTTRESS_WP_REQ_PAYLOAD0_MAX_RATIO_SHIFT			16u
+#define MTL_BUTTRESS_WP_REQ_PAYLOAD0_MAX_RATIO_MASK			0xffff0000u
+
+#define MTL_BUTTRESS_WP_REQ_PAYLOAD1					0x0000000cu
+#define MTL_BUTTRESS_WP_REQ_PAYLOAD1_TARGET_RATIO_SHIFT			0u
+#define MTL_BUTTRESS_WP_REQ_PAYLOAD1_TARGET_RATIO_MASK			0x0000ffffu
+#define MTL_BUTTRESS_WP_REQ_PAYLOAD1_EPP_SHIFT				16u
+#define MTL_BUTTRESS_WP_REQ_PAYLOAD1_EPP_MASK				0xffff0000u
+
+#define MTL_BUTTRESS_WP_REQ_PAYLOAD2					0x00000010u
+#define MTL_BUTTRESS_WP_REQ_PAYLOAD2_CONFIG_SHIFT			0u
+#define MTL_BUTTRESS_WP_REQ_PAYLOAD2_CONFIG_MASK			0x0000ffffu
+
+#define MTL_BUTTRESS_WP_REQ_CMD						0x00000014u
+#define MTL_BUTTRESS_WP_REQ_CMD_SEND_SHIFT				0u
+#define MTL_BUTTRESS_WP_REQ_CMD_SEND_MASK				0x00000001u
+
+#define MTL_BUTTRESS_WP_DOWNLOAD					0x00000018u
+#define MTL_BUTTRESS_WP_DOWNLOAD_TARGET_RATIO_SHIFT			0u
+#define MTL_BUTTRESS_WP_DOWNLOAD_TARGET_RATIO_MASK			0x0000ffffu
+
+#define MTL_BUTTRESS_CURRENT_PLL					0x0000001cu
+#define MTL_BUTTRESS_CURRENT_PLL_RATIO_SHIFT				0u
+#define MTL_BUTTRESS_CURRENT_PLL_RATIO_MASK				0x0000ffffu
+
+#define MTL_BUTTRESS_PLL_ENABLE						0x00000020u
+
+#define MTL_BUTTRESS_FMIN_FUSE						0x00000024u
+#define MTL_BUTTRESS_FMIN_FUSE_RATIO_SHIFT				0u
+#define MTL_BUTTRESS_FMIN_FUSE_RATIO_MASK				0x0000ffffu
+
+#define MTL_BUTTRESS_FMAX_FUSE						0x00000028u
+#define MTL_BUTTRESS_FMAX_FUSE_RATIO_SHIFT				0u
+#define MTL_BUTTRESS_FMAX_FUSE_RATIO_MASK				0x0000ffffu
+
+#define MTL_BUTTRESS_TILE_FUSE						0x0000002cu
+#define MTL_BUTTRESS_TILE_FUSE_VALID_SHIFT				0u
+#define MTL_BUTTRESS_TILE_FUSE_VALID_MASK				0x00000001u
+#define MTL_BUTTRESS_TILE_FUSE_SKU_SHIFT				1u
+#define MTL_BUTTRESS_TILE_FUSE_SKU_MASK					0x00000006u
+
+#define MTL_BUTTRESS_LOCAL_INT_MASK					0x00000030u
+#define MTL_BUTTRESS_GLOBAL_INT_MASK					0x00000034u
+
+#define MTL_BUTTRESS_PLL_STATUS						0x00000040u
+#define MTL_BUTTRESS_PLL_STATUS_LOCK_SHIFT				1u
+#define MTL_BUTTRESS_PLL_STATUS_LOCK_MASK				0x00000002u
+
+#define MTL_BUTTRESS_VPU_STATUS						0x00000044u
+#define MTL_BUTTRESS_VPU_STATUS_READY_SHIFT				0u
+#define MTL_BUTTRESS_VPU_STATUS_READY_MASK				0x00000001u
+#define MTL_BUTTRESS_VPU_STATUS_IDLE_SHIFT				1u
+#define MTL_BUTTRESS_VPU_STATUS_IDLE_MASK				0x00000002u
+
+#define MTL_BUTTRESS_VPU_D0I3_CONTROL					0x00000060u
+#define MTL_BUTTRESS_VPU_D0I3_CONTROL_INPROGRESS_SHIFT			0u
+#define MTL_BUTTRESS_VPU_D0I3_CONTROL_INPROGRESS_MASK			0x00000001u
+#define MTL_BUTTRESS_VPU_D0I3_CONTROL_I3_SHIFT				2u
+#define MTL_BUTTRESS_VPU_D0I3_CONTROL_I3_MASK				0x00000004u
+
+#define MTL_BUTTRESS_VPU_IP_RESET					0x00000050u
+#define MTL_BUTTRESS_VPU_IP_RESET_TRIGGER_SHIFT				0u
+#define MTL_BUTTRESS_VPU_IP_RESET_TRIGGER_MASK				0x00000001u
+
+#define MTL_BUTTRESS_VPU_TELEMETRY_OFFSET				0x00000080u
+#define MTL_BUTTRESS_VPU_TELEMETRY_SIZE					0x00000084u
+#define MTL_BUTTRESS_VPU_TELEMETRY_ENABLE				0x00000088u
+
+#define MTL_BUTTRESS_ATS_ERR_LOG_0					0x000000a0u
+#define MTL_BUTTRESS_ATS_ERR_LOG_1					0x000000a4u
+#define MTL_BUTTRESS_ATS_ERR_CLEAR					0x000000a8u
+#define MTL_BUTTRESS_UFI_ERR_LOG					0x000000b0u
+#define MTL_BUTTRESS_UFI_ERR_CLEAR					0x000000b4u
+
+#define MTL_VPU_HOST_SS_CPR_CLK_SET					0x00000084u
+#define MTL_VPU_HOST_SS_CPR_CLK_SET_TOP_NOC_SHIFT			1u
+#define MTL_VPU_HOST_SS_CPR_CLK_SET_TOP_NOC_MASK			0x00000002u
+#define MTL_VPU_HOST_SS_CPR_CLK_SET_DSS_MAS_SHIFT			10u
+#define MTL_VPU_HOST_SS_CPR_CLK_SET_DSS_MAS_MASK			0x00000400u
+#define MTL_VPU_HOST_SS_CPR_CLK_SET_MSS_MAS_SHIFT			11u
+#define MTL_VPU_HOST_SS_CPR_CLK_SET_MSS_MAS_MASK			0x00000800u
+
+#define MTL_VPU_HOST_SS_CPR_RST_SET					0x00000094u
+#define MTL_VPU_HOST_SS_CPR_RST_SET_TOP_NOC_SHIFT			1u
+#define MTL_VPU_HOST_SS_CPR_RST_SET_TOP_NOC_MASK			0x00000002u
+#define MTL_VPU_HOST_SS_CPR_RST_SET_DSS_MAS_SHIFT			10u
+#define MTL_VPU_HOST_SS_CPR_RST_SET_DSS_MAS_MASK			0x00000400u
+#define MTL_VPU_HOST_SS_CPR_RST_SET_MSS_MAS_SHIFT			11u
+#define MTL_VPU_HOST_SS_CPR_RST_SET_MSS_MAS_MASK			0x00000800u
+
+#define MTL_VPU_HOST_SS_CPR_RST_CLR					0x00000098u
+#define MTL_VPU_HOST_SS_CPR_RST_CLR_TOP_NOC_SHIFT			1u
+#define MTL_VPU_HOST_SS_CPR_RST_CLR_TOP_NOC_MASK			0x00000002u
+#define MTL_VPU_HOST_SS_CPR_RST_CLR_DSS_MAS_SHIFT			10u
+#define MTL_VPU_HOST_SS_CPR_RST_CLR_DSS_MAS_MASK			0x00000400u
+#define MTL_VPU_HOST_SS_CPR_RST_CLR_MSS_MAS_SHIFT			11u
+#define MTL_VPU_HOST_SS_CPR_RST_CLR_MSS_MAS_MASK			0x00000800u
+
+#define MTL_VPU_HOST_SS_HW_VERSION					0x00000108u
+#define MTL_VPU_HOST_SS_HW_VERSION_SOC_REVISION_SHIFT			0u
+#define MTL_VPU_HOST_SS_HW_VERSION_SOC_REVISION_MASK			0x000000ffu
+#define MTL_VPU_HOST_SS_HW_VERSION_SOC_NUMBER_SHIFT			8u
+#define MTL_VPU_HOST_SS_HW_VERSION_SOC_NUMBER_MASK			0x0000ff00u
+#define MTL_VPU_HOST_SS_HW_VERSION_VPU_GENERATION_SHIFT			16u
+#define MTL_VPU_HOST_SS_HW_VERSION_VPU_GENERATION_MASK			0x00ff0000u
+
+#define MTL_VPU_HOST_SS_SW_VERSION					0x0000010cu
+
+#define MTL_VPU_HOST_SS_GEN_CTRL					0x00000118u
+#define MTL_VPU_HOST_SS_GEN_CTRL_PS_SHIFT				0x0000001du
+#define MTL_VPU_HOST_SS_GEN_CTRL_PS_MASK				0xe0000000u
+
+#define MTL_VPU_HOST_SS_NOC_QREQN					0x00000154u
+#define MTL_VPU_HOST_SS_NOC_QREQN_TOP_SOCMMIO_SHIFT			0u
+#define MTL_VPU_HOST_SS_NOC_QREQN_TOP_SOCMMIO_MASK			0x00000001u
+
+#define MTL_VPU_HOST_SS_NOC_QACCEPTN					0x00000158u
+#define MTL_VPU_HOST_SS_NOC_QACCEPTN_TOP_SOCMMIO_SHIFT			0u
+#define MTL_VPU_HOST_SS_NOC_QACCEPTN_TOP_SOCMMIO_MASK			0x00000001u
+
+#define MTL_VPU_HOST_SS_NOC_QDENY					0x0000015cu
+#define MTL_VPU_HOST_SS_NOC_QDENY_TOP_SOCMMIO_SHIFT			0u
+#define MTL_VPU_HOST_SS_NOC_QDENY_TOP_SOCMMIO_MASK			0x00000001u
+
+#define MTL_VPU_TOP_NOC_QREQN						0x00000160u
+#define MTL_VPU_TOP_NOC_QREQN_CPU_CTRL_SHIFT				0u
+#define MTL_VPU_TOP_NOC_QREQN_CPU_CTRL_MASK				0x00000001u
+#define MTL_VPU_TOP_NOC_QREQN_HOSTIF_L2CACHE_SHIFT			1u
+#define MTL_VPU_TOP_NOC_QREQN_HOSTIF_L2CACHE_MASK			0x00000002u
+
+#define MTL_VPU_TOP_NOC_QACCEPTN					0x00000164u
+#define MTL_VPU_TOP_NOC_QACCEPTN_CPU_CTRL_SHIFT				0u
+#define MTL_VPU_TOP_NOC_QACCEPTN_CPU_CTRL_MASK				0x00000001u
+#define MTL_VPU_TOP_NOC_QACCEPTN_HOSTIF_L2CACHE_SHIFT			1u
+#define MTL_VPU_TOP_NOC_QACCEPTN_HOSTIF_L2CACHE_MASK			0x00000002u
+
+#define MTL_VPU_TOP_NOC_QDENY						0x00000168u
+#define MTL_VPU_TOP_NOC_QDENY_CPU_CTRL_SHIFT				0u
+#define MTL_VPU_TOP_NOC_QDENY_CPU_CTRL_MASK				0x00000001u
+#define MTL_VPU_TOP_NOC_QDENY_HOSTIF_L2CACHE_SHIFT			1u
+#define MTL_VPU_TOP_NOC_QDENY_HOSTIF_L2CACHE_MASK			0x00000002u
+
+#define MTL_VPU_HOST_SS_FW_SOC_IRQ_EN					0x00000170u
+#define MTL_VPU_HOST_SS_FW_SOC_IRQ_EN_CSS_ROM_CMX_SHIFT			0u
+#define MTL_VPU_HOST_SS_FW_SOC_IRQ_EN_CSS_ROM_CMX_MASK			0x00000001u
+#define MTL_VPU_HOST_SS_FW_SOC_IRQ_EN_CSS_DBG_SHIFT			1u
+#define MTL_VPU_HOST_SS_FW_SOC_IRQ_EN_CSS_DBG_MASK			0x00000002u
+#define MTL_VPU_HOST_SS_FW_SOC_IRQ_EN_CSS_CTRL_SHIFT			2u
+#define MTL_VPU_HOST_SS_FW_SOC_IRQ_EN_CSS_CTRL_MASK			0x00000004u
+#define MTL_VPU_HOST_SS_FW_SOC_IRQ_EN_DEC400_SHIFT			3u
+#define MTL_VPU_HOST_SS_FW_SOC_IRQ_EN_DEC400_MASK			0x00000008u
+#define MTL_VPU_HOST_SS_FW_SOC_IRQ_EN_MSS_NCE_SHIFT			4u
+#define MTL_VPU_HOST_SS_FW_SOC_IRQ_EN_MSS_NCE_MASK			0x00000010u
+#define MTL_VPU_HOST_SS_FW_SOC_IRQ_EN_MSS_MBI_SHIFT			5u
+#define MTL_VPU_HOST_SS_FW_SOC_IRQ_EN_MSS_MBI_MASK			0x00000020u
+#define MTL_VPU_HOST_SS_FW_SOC_IRQ_EN_MSS_MBI_CMX_SHIFT			6u
+#define MTL_VPU_HOST_SS_FW_SOC_IRQ_EN_MSS_MBI_CMX_MASK			0x00000040u
+
+#define MTL_VPU_HOST_SS_ICB_STATUS_0					0x00010210u
+#define MTL_VPU_HOST_SS_ICB_STATUS_0_TIMER_0_INT_SHIFT			0u
+#define MTL_VPU_HOST_SS_ICB_STATUS_0_TIMER_0_INT_MASK			0x00000001u
+#define MTL_VPU_HOST_SS_ICB_STATUS_0_TIMER_1_INT_SHIFT			1u
+#define MTL_VPU_HOST_SS_ICB_STATUS_0_TIMER_1_INT_MASK			0x00000002u
+#define MTL_VPU_HOST_SS_ICB_STATUS_0_TIMER_2_INT_SHIFT			2u
+#define MTL_VPU_HOST_SS_ICB_STATUS_0_TIMER_2_INT_MASK			0x00000004u
+#define MTL_VPU_HOST_SS_ICB_STATUS_0_TIMER_3_INT_SHIFT			3u
+#define MTL_VPU_HOST_SS_ICB_STATUS_0_TIMER_3_INT_MASK			0x00000008u
+#define MTL_VPU_HOST_SS_ICB_STATUS_0_HOST_IPC_FIFO_INT_SHIFT		4u
+#define MTL_VPU_HOST_SS_ICB_STATUS_0_HOST_IPC_FIFO_INT_MASK		0x00000010u
+#define MTL_VPU_HOST_SS_ICB_STATUS_0_MMU_IRQ_0_INT_SHIFT		5u
+#define MTL_VPU_HOST_SS_ICB_STATUS_0_MMU_IRQ_0_INT_MASK			0x00000020u
+#define MTL_VPU_HOST_SS_ICB_STATUS_0_MMU_IRQ_1_INT_SHIFT		6u
+#define MTL_VPU_HOST_SS_ICB_STATUS_0_MMU_IRQ_1_INT_MASK			0x00000040u
+#define MTL_VPU_HOST_SS_ICB_STATUS_0_MMU_IRQ_2_INT_SHIFT		7u
+#define MTL_VPU_HOST_SS_ICB_STATUS_0_MMU_IRQ_2_INT_MASK			0x00000080u
+#define MTL_VPU_HOST_SS_ICB_STATUS_0_NOC_FIREWALL_INT_SHIFT		8u
+#define MTL_VPU_HOST_SS_ICB_STATUS_0_NOC_FIREWALL_INT_MASK		0x00000100u
+#define MTL_VPU_HOST_SS_ICB_STATUS_0_CPU_INT_REDIRECT_0_INT_SHIFT	30u
+#define MTL_VPU_HOST_SS_ICB_STATUS_0_CPU_INT_REDIRECT_0_INT_MASK	0x40000000u
+#define MTL_VPU_HOST_SS_ICB_STATUS_0_CPU_INT_REDIRECT_1_INT_SHIFT	31u
+#define MTL_VPU_HOST_SS_ICB_STATUS_0_CPU_INT_REDIRECT_1_INT_MASK	0x80000000u
+
+#define MTL_VPU_HOST_SS_ICB_STATUS_1					0x00010214u
+#define MTL_VPU_HOST_SS_ICB_STATUS_1_CPU_INT_REDIRECT_2_INT_SHIFT	0u
+#define MTL_VPU_HOST_SS_ICB_STATUS_1_CPU_INT_REDIRECT_2_INT_MASK	0x00000001u
+#define MTL_VPU_HOST_SS_ICB_STATUS_1_CPU_INT_REDIRECT_3_INT_SHIFT	1u
+#define MTL_VPU_HOST_SS_ICB_STATUS_1_CPU_INT_REDIRECT_3_INT_MASK	0x00000002u
+#define MTL_VPU_HOST_SS_ICB_STATUS_1_CPU_INT_REDIRECT_4_INT_SHIFT	2u
+#define MTL_VPU_HOST_SS_ICB_STATUS_1_CPU_INT_REDIRECT_4_INT_MASK	0x00000004u
+
+#define MTL_VPU_HOST_SS_ICB_CLEAR_0					0x00010220u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_0_TIMER_0_INT_SHIFT			0u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_0_TIMER_0_INT_MASK			0x00000001u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_0_TIMER_1_INT_SHIFT			1u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_0_TIMER_1_INT_MASK			0x00000002u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_0_TIMER_2_INT_SHIFT			2u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_0_TIMER_2_INT_MASK			0x00000004u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_0_TIMER_3_INT_SHIFT			3u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_0_TIMER_3_INT_MASK			0x00000008u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_0_HOST_IPC_FIFO_INT_SHIFT		4u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_0_HOST_IPC_FIFO_INT_MASK		0x00000010u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_0_MMU_IRQ_0_INT_SHIFT			5u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_0_MMU_IRQ_0_INT_MASK			0x00000020u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_0_MMU_IRQ_1_INT_SHIFT			6u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_0_MMU_IRQ_1_INT_MASK			0x00000040u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_0_MMU_IRQ_2_INT_SHIFT			7u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_0_MMU_IRQ_2_INT_MASK			0x00000080u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_0_NOC_FIREWALL_INT_SHIFT		8u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_0_NOC_FIREWALL_INT_MASK		0x00000100u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_0_CPU_INT_REDIRECT_0_INT_SHIFT	30u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_0_CPU_INT_REDIRECT_0_INT_MASK		0x40000000u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_0_CPU_INT_REDIRECT_1_INT_SHIFT	31u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_0_CPU_INT_REDIRECT_1_INT_MASK		0x80000000u
+
+#define MTL_VPU_HOST_SS_ICB_CLEAR_1					0x00010224u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_1_CPU_INT_REDIRECT_2_INT_SHIFT	0u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_1_CPU_INT_REDIRECT_2_INT_MASK		0x00000001u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_1_CPU_INT_REDIRECT_3_INT_SHIFT	1u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_1_CPU_INT_REDIRECT_3_INT_MASK		0x00000002u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_1_CPU_INT_REDIRECT_4_INT_SHIFT	2u
+#define MTL_VPU_HOST_SS_ICB_CLEAR_1_CPU_INT_REDIRECT_4_INT_MASK		0x00000004u
+
+#define MTL_VPU_HOST_SS_ICB_ENABLE_0					0x00010240u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_0_TIMER_0_INT_SHIFT			0u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_0_TIMER_0_INT_MASK			0x00000001u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_0_TIMER_1_INT_SHIFT			1u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_0_TIMER_1_INT_MASK			0x00000002u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_0_TIMER_2_INT_SHIFT			2u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_0_TIMER_2_INT_MASK			0x00000004u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_0_TIMER_3_INT_SHIFT			3u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_0_TIMER_3_INT_MASK			0x00000008u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_0_HOST_IPC_FIFO_INT_SHIFT		4u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_0_HOST_IPC_FIFO_INT_MASK		0x00000010u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_0_MMU_IRQ_0_INT_SHIFT		5u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_0_MMU_IRQ_0_INT_MASK			0x00000020u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_0_MMU_IRQ_1_INT_SHIFT		6u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_0_MMU_IRQ_1_INT_MASK			0x00000040u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_0_MMU_IRQ_2_INT_SHIFT		7u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_0_MMU_IRQ_2_INT_MASK			0x00000080u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_0_NOC_FIREWALL_INT_SHIFT		8u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_0_NOC_FIREWALL_INT_MASK		0x00000100u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_0_CPU_INT_REDIRECT_0_INT_SHIFT	30u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_0_CPU_INT_REDIRECT_0_INT_MASK	0x40000000u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_0_CPU_INT_REDIRECT_1_INT_SHIFT	31u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_0_CPU_INT_REDIRECT_1_INT_MASK	0x80000000u
+
+#define MTL_VPU_HOST_SS_ICB_ENABLE_1					0x00010244u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_1_CPU_INT_REDIRECT_2_INT_SHIFT	0u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_1_CPU_INT_REDIRECT_2_INT_MASK	0x00000001u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_1_CPU_INT_REDIRECT_3_INT_SHIFT	1u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_1_CPU_INT_REDIRECT_3_INT_MASK	0x00000002u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_1_CPU_INT_REDIRECT_4_INT_SHIFT	2u
+#define MTL_VPU_HOST_SS_ICB_ENABLE_1_CPU_INT_REDIRECT_4_INT_MASK	0x00000004u
+
+#define MTL_VPU_HOST_SS_TIM_IPC_FIFO_ATM				0x000200f4u
+
+#define MTL_VPU_HOST_SS_TIM_IPC_FIFO_STAT				0x000200fcu
+#define MTL_VPU_HOST_SS_TIM_IPC_FIFO_STAT_DEFAULT			0x00000000u
+#define MTL_VPU_HOST_SS_TIM_IPC_FIFO_STAT_READ_POINTER_SHIFT		0u
+#define MTL_VPU_HOST_SS_TIM_IPC_FIFO_STAT_READ_POINTER_MASK		0x000000ffu
+#define MTL_VPU_HOST_SS_TIM_IPC_FIFO_STAT_READ_POINTER_EFAULT		0x00000000u
+#define MTL_VPU_HOST_SS_TIM_IPC_FIFO_STAT_WRITE_POINTER_SHIFT		8u
+#define MTL_VPU_HOST_SS_TIM_IPC_FIFO_STAT_WRITE_POINTER_MASK		0x0000ff00u
+#define MTL_VPU_HOST_SS_TIM_IPC_FIFO_STAT_WRITE_POINTER_DEFAULT		0x00000000u
+#define MTL_VPU_HOST_SS_TIM_IPC_FIFO_STAT_FILL_LEVEL_SHIFT		16u
+#define MTL_VPU_HOST_SS_TIM_IPC_FIFO_STAT_FILL_LEVEL_MASK		0x00ff0000u
+#define MTL_VPU_HOST_SS_TIM_IPC_FIFO_STAT_FILL_LEVEL_DEFAULT		0x00000000u
+#define MTL_VPU_HOST_SS_TIM_IPC_FIFO_STAT_RSVD0_SHIFT			24u
+#define MTL_VPU_HOST_SS_TIM_IPC_FIFO_STAT_RSVD0_MASK			0xff000000u
+#define MTL_VPU_HOST_SS_TIM_IPC_FIFO_STAT_RSVD0_DEFAULT			0x00000000u
+
+#define MTL_VPU_HOST_SS_AON_PWR_ISO_EN0					0x00030020u
+#define MTL_VPU_HOST_SS_AON_PWR_ISO_EN0_MSS_CPU_SHIFT			3u
+#define MTL_VPU_HOST_SS_AON_PWR_ISO_EN0_MSS_CPU_MASK			0x00000008u
+
+#define MTL_VPU_HOST_SS_AON_PWR_ISLAND_EN0				0x00030024u
+#define MTL_VPU_HOST_SS_AON_PWR_ISLAND_EN0_MSS_CPU_SHIFT		3u
+#define MTL_VPU_HOST_SS_AON_PWR_ISLAND_EN0_MSS_CPU_MASK			0x00000008u
+
+#define MTL_VPU_HOST_SS_AON_PWR_ISLAND_TRICKLE_EN0			0x00030028u
+#define MTL_VPU_HOST_SS_AON_PWR_ISLAND_TRICKLE_EN0_MSS_CPU_SHIFT	3u
+#define MTL_VPU_HOST_SS_AON_PWR_ISLAND_TRICKLE_EN0_MSS_CPU_MASK		0x00000008u
+
+#define MTL_VPU_HOST_SS_AON_PWR_ISLAND_STATUS0				0x0003002cu
+#define MTL_VPU_HOST_SS_AON_PWR_ISLAND_STATUS0_MSS_CPU_SHIFT		3u
+#define MTL_VPU_HOST_SS_AON_PWR_ISLAND_STATUS0_MSS_CPU_MASK		0x00000008u
+
+#define MTL_VPU_HOST_SS_AON_VPU_IDLE_GEN				0x00030200u
+#define MTL_VPU_HOST_SS_AON_VPU_IDLE_GEN_EN_SHIFT			0u
+#define MTL_VPU_HOST_SS_AON_VPU_IDLE_GEN_EN_MASK			0x00000001u
+
+#define MTL_VPU_HOST_SS_AON_DPU_ACTIVE					0x00030204u
+#define MTL_VPU_HOST_SS_AON_DPU_ACTIVE_DPU_ACTIVE_SHIFT			0u
+#define MTL_VPU_HOST_SS_AON_DPU_ACTIVE_DPU_ACTIVE_MASK			0x00000001u
+
+#define MTL_VPU_HOST_SS_LOADING_ADDRESS_LO				0x00041040u
+#define MTL_VPU_HOST_SS_LOADING_ADDRESS_LO_DONE_SHIFT			0u
+#define MTL_VPU_HOST_SS_LOADING_ADDRESS_LO_DONE_MASK			0x00000001u
+#define MTL_VPU_HOST_SS_LOADING_ADDRESS_LO_IOSF_RS_ID_SHIFT		1u
+#define MTL_VPU_HOST_SS_LOADING_ADDRESS_LO_IOSF_RS_ID_MASK		0x00000006u
+#define MTL_VPU_HOST_SS_LOADING_ADDRESS_LO_IMAGE_LOCATION_SHIFT		3u
+#define MTL_VPU_HOST_SS_LOADING_ADDRESS_LO_IMAGE_LOCATION_MASK		0xfffffff8u
+
+#define MTL_VPU_HOST_SS_WORKPOINT_CONFIG_MIRROR				0x00082020u
+#define MTL_VPU_HOST_SS_WORKPOINT_CONFIG_MIRROR_FINAL_PLL_FREQ_SHIFT	0u
+#define MTL_VPU_HOST_SS_WORKPOINT_CONFIG_MIRROR_FINAL_PLL_FREQ_MASK	0x0000ffffu
+#define MTL_VPU_HOST_SS_WORKPOINT_CONFIG_MIRROR_CONFIG_ID_SHIFT		16u
+#define MTL_VPU_HOST_SS_WORKPOINT_CONFIG_MIRROR_CONFIG_ID_MASK		0xffff0000u
+
+#define MTL_VPU_HOST_MMU_IDR0						0x00200000u
+#define MTL_VPU_HOST_MMU_IDR1						0x00200004u
+#define MTL_VPU_HOST_MMU_IDR3						0x0020000cu
+#define MTL_VPU_HOST_MMU_IDR5						0x00200014u
+#define MTL_VPU_HOST_MMU_CR0						0x00200020u
+#define MTL_VPU_HOST_MMU_CR0ACK						0x00200024u
+#define MTL_VPU_HOST_MMU_CR1						0x00200028u
+#define MTL_VPU_HOST_MMU_CR2						0x0020002cu
+#define MTL_VPU_HOST_MMU_IRQ_CTRL					0x00200050u
+#define MTL_VPU_HOST_MMU_IRQ_CTRLACK					0x00200054u
+
+#define MTL_VPU_HOST_MMU_GERROR						0x00200060u
+#define MTL_VPU_HOST_MMU_GERROR_CMDQ_SHIFT				0u
+#define MTL_VPU_HOST_MMU_GERROR_CMDQ_MASK				0x00000001u
+#define MTL_VPU_HOST_MMU_GERROR_EVTQ_ABT_SHIFT				2u
+#define MTL_VPU_HOST_MMU_GERROR_EVTQ_ABT_MASK				0x00000004u
+#define MTL_VPU_HOST_MMU_GERROR_PRIQ_ABT_SHIFT				3u
+#define MTL_VPU_HOST_MMU_GERROR_PRIQ_ABT_MASK				0x00000008u
+#define MTL_VPU_HOST_MMU_GERROR_MSI_CMDQ_ABT_SHIFT			4u
+#define MTL_VPU_HOST_MMU_GERROR_MSI_CMDQ_ABT_MASK			0x00000010u
+#define MTL_VPU_HOST_MMU_GERROR_MSI_EVTQ_ABT_SHIFT			5u
+#define MTL_VPU_HOST_MMU_GERROR_MSI_EVTQ_ABT_MASK			0x00000020u
+#define MTL_VPU_HOST_MMU_GERROR_MSI_PRIQ_ABT_SHIFT			6u
+#define MTL_VPU_HOST_MMU_GERROR_MSI_PRIQ_ABT_MASK			0x00000040u
+#define MTL_VPU_HOST_MMU_GERROR_MSI_ABT_SHIFT				7u
+#define MTL_VPU_HOST_MMU_GERROR_MSI_ABT_MASK				0x00000080u
+#define MTL_VPU_HOST_MMU_GERROR_SFM_SHIFT				8u
+#define MTL_VPU_HOST_MMU_GERROR_SFM_MASK				0x00000100u
+#define MTL_VPU_HOST_MMU_GERRORN					0x00200064u
+
+#define MTL_VPU_HOST_MMU_STRTAB_BASE					0x00200080u
+#define MTL_VPU_HOST_MMU_STRTAB_BASE_CFG				0x00200088u
+#define MTL_VPU_HOST_MMU_CMDQ_BASE					0x00200090u
+#define MTL_VPU_HOST_MMU_CMDQ_PROD					0x00200098u
+#define MTL_VPU_HOST_MMU_CMDQ_CONS					0x0020009cu
+#define MTL_VPU_HOST_MMU_EVTQ_BASE					0x002000a0u
+#define MTL_VPU_HOST_MMU_EVTQ_PROD					0x002000a8u
+#define MTL_VPU_HOST_MMU_EVTQ_CONS					0x002000acu
+#define MTL_VPU_HOST_MMU_EVTQ_PROD_SEC					(0x002000a8u + SZ_64K)
+#define MTL_VPU_HOST_MMU_EVTQ_CONS_SEC					(0x002000acu + SZ_64K)
+
+#define MTL_VPU_HOST_IF_TCU_PTW_OVERRIDES				0x00360000u
+#define MTL_VPU_HOST_IF_TCU_PTW_OVERRIDES_CACHE_OVERRIDE_EN_SHIFT	0u
+#define MTL_VPU_HOST_IF_TCU_PTW_OVERRIDES_CACHE_OVERRIDE_EN_MASK	0x00000001u
+#define MTL_VPU_HOST_IF_TCU_PTW_OVERRIDES_AWCACHE_OVERRIDE_SHIFT	1u
+#define MTL_VPU_HOST_IF_TCU_PTW_OVERRIDES_AWCACHE_OVERRIDE_MASK		0x00000002u
+#define MTL_VPU_HOST_IF_TCU_PTW_OVERRIDES_ARCACHE_OVERRIDE_SHIFT	2u
+#define MTL_VPU_HOST_IF_TCU_PTW_OVERRIDES_ARCACHE_OVERRIDE_MASK		0x00000004u
+#define MTL_VPU_HOST_IF_TCU_PTW_OVERRIDES_NOSNOOP_OVERRIDE_EN_SHIFT	3u
+#define MTL_VPU_HOST_IF_TCU_PTW_OVERRIDES_NOSNOOP_OVERRIDE_EN_MASK	0x00000008u
+#define MTL_VPU_HOST_IF_TCU_PTW_OVERRIDES_AW_NOSNOOP_OVERRIDE_SHIFT	4u
+#define MTL_VPU_HOST_IF_TCU_PTW_OVERRIDES_AW_NOSNOOP_OVERRIDE_MASK	0x00000010u
+#define MTL_VPU_HOST_IF_TCU_PTW_OVERRIDES_AR_NOSNOOP_OVERRIDE_SHIFT	5u
+#define MTL_VPU_HOST_IF_TCU_PTW_OVERRIDES_AR_NOSNOOP_OVERRIDE_MASK	0x00000020u
+#define MTL_VPU_HOST_IF_TCU_PTW_OVERRIDES_PTW_AW_CONTEXT_FLAG_SHIFT	6u
+#define MTL_VPU_HOST_IF_TCU_PTW_OVERRIDES_PTW_AW_CONTEXT_FLAG_MASK	0x000007C0u
+#define MTL_VPU_HOST_IF_TCU_PTW_OVERRIDES_PTW_AR_CONTEXT_FLAG_SHIFT	11u
+#define MTL_VPU_HOST_IF_TCU_PTW_OVERRIDES_PTW_AR_CONTEXT_FLAG_MASK	0x0000f800u
+
+#define MTL_VPU_HOST_IF_TBU_MMUSSIDV					0x00360004u
+#define MTL_VPU_HOST_IF_TBU_MMUSSIDV_TBU0_AWMMUSSIDV_SHIFT		0u
+#define MTL_VPU_HOST_IF_TBU_MMUSSIDV_TBU0_AWMMUSSIDV_MASK		0x00000001u
+#define MTL_VPU_HOST_IF_TBU_MMUSSIDV_TBU0_ARMMUSSIDV_SHIFT		1u
+#define MTL_VPU_HOST_IF_TBU_MMUSSIDV_TBU0_ARMMUSSIDV_MASK		0x00000002u
+#define MTL_VPU_HOST_IF_TBU_MMUSSIDV_TBU1_AWMMUSSIDV_SHIFT		2u
+#define MTL_VPU_HOST_IF_TBU_MMUSSIDV_TBU1_AWMMUSSIDV_MASK		0x00000004u
+#define MTL_VPU_HOST_IF_TBU_MMUSSIDV_TBU1_ARMMUSSIDV_SHIFT		3u
+#define MTL_VPU_HOST_IF_TBU_MMUSSIDV_TBU1_ARMMUSSIDV_MASK		0x00000008u
+#define MTL_VPU_HOST_IF_TBU_MMUSSIDV_TBU2_AWMMUSSIDV_SHIFT		4u
+#define MTL_VPU_HOST_IF_TBU_MMUSSIDV_TBU2_AWMMUSSIDV_MASK		0x00000010u
+#define MTL_VPU_HOST_IF_TBU_MMUSSIDV_TBU2_ARMMUSSIDV_SHIFT		5u
+#define MTL_VPU_HOST_IF_TBU_MMUSSIDV_TBU2_ARMMUSSIDV_MASK		0x00000020u
+#define MTL_VPU_HOST_IF_TBU_MMUSSIDV_TBU3_AWMMUSSIDV_SHIFT		6u
+#define MTL_VPU_HOST_IF_TBU_MMUSSIDV_TBU3_AWMMUSSIDV_MASK		0x00000040u
+#define MTL_VPU_HOST_IF_TBU_MMUSSIDV_TBU3_ARMMUSSIDV_SHIFT		7u
+#define MTL_VPU_HOST_IF_TBU_MMUSSIDV_TBU3_ARMMUSSIDV_MASK		0x00000080u
+#define MTL_VPU_HOST_IF_TBU_MMUSSIDV_TBU4_AWMMUSSIDV_SHIFT		8u
+#define MTL_VPU_HOST_IF_TBU_MMUSSIDV_TBU4_AWMMUSSIDV_MASK		0x00000100u
+#define MTL_VPU_HOST_IF_TBU_MMUSSIDV_TBU4_ARMMUSSIDV_SHIFT		9u
+#define MTL_VPU_HOST_IF_TBU_MMUSSIDV_TBU4_ARMMUSSIDV_MASK		0x00000200u
+
+#define MTL_VPU_CPU_SS_DSU_LEON_RT_BASE					0x04000000u
+#define MTL_VPU_CPU_SS_DSU_LEON_RT_DSU_CTRL				0x04000000u
+#define MTL_VPU_CPU_SS_DSU_LEON_RT_PC_REG				0x04400010u
+#define MTL_VPU_CPU_SS_DSU_LEON_RT_NPC_REG				0x04400014u
+#define MTL_VPU_CPU_SS_DSU_LEON_RT_DSU_TRAP_REG				0x04400020u
+
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_CLK_SET				0x06010004u
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_CLK_SET_CPU_DSU_SHIFT			1u
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_CLK_SET_CPU_DSU_MASK			0x00000002u
+
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_RST_CLR				0x06010018u
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_RST_CLR_CPU_DSU_SHIFT			1u
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_RST_CLR_CPU_DSU_MASK			0x00000002u
+
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC				0x06010040u
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RSTRUN0_SHIFT	0u
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RSTRUN0_MASK		0x00000001u
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RESUME0_SHIFT	1u
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RESUME0_MASK		0x00000002u
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RSTRUN1_SHIFT	2u
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RSTRUN1_MASK		0x00000004u
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RESUME1_SHIFT	3u
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RESUME1_MASK		0x00000008u
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RSTVEC_SHIFT		4u
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RSTVEC_MASK		0xfffffff0u
+
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC				0x06010040u
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RSTRUN0_SHIFT	0u
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RSTRUN0_MASK		0x00000001u
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RESUME0_SHIFT	1u
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RESUME0_MASK		0x00000002u
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RSTRUN1_SHIFT	2u
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RSTRUN1_MASK		0x00000004u
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RESUME1_SHIFT	3u
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RESUME1_MASK		0x00000008u
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RSTVEC_SHIFT		4u
+#define MTL_VPU_CPU_SS_MSSCPU_CPR_LEON_RT_VEC_IRQI_RSTVEC_MASK		0xfffffff0u
+
+#define MTL_VPU_CPU_SS_TIM_WATCHDOG					0x0602009cu
+#define MTL_VPU_CPU_SS_TIM_WDOG_EN					0x060200a4u
+#define MTL_VPU_CPU_SS_TIM_SAFE						0x060200a8u
+
+#define MTL_VPU_CPU_SS_TIM_IPC_FIFO					0x060200f0u
+#define MTL_VPU_CPU_SS_TIM_IPC_FIFO_OF_FLAG0				0x06020100u
+#define MTL_VPU_CPU_SS_TIM_IPC_FIFO_OF_FLAG1				0x06020104u
+
+#define MTL_VPU_CPU_SS_TIM_GEN_CONFIG					0x06021008u
+#define MTL_VPU_CPU_SS_TIM_GEN_CONFIG_WDOG_TO_INT_CLR_OFFSET		9u
+#define MTL_VPU_CPU_SS_TIM_GEN_CONFIG_WDOG_TO_INT_CLR_MASK		0x00000200u
+
+#define MTL_VPU_CPU_SS_DOORBELL_0					0x06300000u
+#define MTL_VPU_CPU_SS_DOORBELL_0_SET_OFFSET				0u
+#define MTL_VPU_CPU_SS_DOORBELL_0_SET_MASK				0x00000001u
+
+#define MTL_VPU_CPU_SS_DOORBELL_1					0x06301000u
+
+#endif /* __VPU_HW_MTL_REG_H__ */
diff --git a/drivers/gpu/drm/vpu/vpu_hw_reg_io.h b/drivers/gpu/drm/vpu/vpu_hw_reg_io.h
new file mode 100644
index 000000000000..f12262553bcf
--- /dev/null
+++ b/drivers/gpu/drm/vpu/vpu_hw_reg_io.h
@@ -0,0 +1,114 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#ifndef __VPU_HW_REG_IO_H__
+#define __VPU_HW_REG_IO_H__
+
+#include <linux/bitfield.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+
+#include "vpu_drv.h"
+
+#define REG_POLL_SLEEP_US 50
+
+#define REGB_RD32(reg)          vpu_hw_reg_rd32(vdev, vdev->regb, (reg), #reg, __func__)
+#define REGB_RD32_SILENT(reg)   readl(vdev->regb + (reg))
+#define REGB_RD64(reg)          vpu_hw_reg_rd64(vdev, vdev->regb, (reg), #reg, __func__)
+#define REGB_WR32(reg, val)     vpu_hw_reg_wr32(vdev, vdev->regb, (reg), (val), #reg, __func__)
+#define REGB_WR64(reg, val)     vpu_hw_reg_wr64(vdev, vdev->regb, (reg), (val), #reg, __func__)
+
+#define REGV_RD32(reg)          vpu_hw_reg_rd32(vdev, vdev->regv, (reg), #reg, __func__)
+#define REGV_RD32_SILENT(reg)   readl(vdev->regv + (reg))
+#define REGV_RD64(reg)          vpu_hw_reg_rd64(vdev, vdev->regv, (reg), #reg, __func__)
+#define REGV_WR32(reg, val)     vpu_hw_reg_wr32(vdev, vdev->regv, (reg), (val), #reg, __func__)
+#define REGV_WR64(reg, val)     vpu_hw_reg_wr64(vdev, vdev->regv, (reg), (val), #reg, __func__)
+
+#define REGV_WR32I(reg, stride, index, val) \
+	vpu_hw_reg_wr32_index(vdev, vdev->regv, (reg), (stride), (index), (val), #reg, __func__)
+
+#define REG_FLD(REG, FLD) \
+	(REG##_##FLD##_MASK)
+#define REG_FLD_NUM(REG, FLD, num) \
+	FIELD_PREP(REG##_##FLD##_MASK, num)
+#define REG_GET_FLD(REG, FLD, val) \
+	FIELD_GET(REG##_##FLD##_MASK, val)
+#define REG_CLR_FLD(REG, FLD, val) \
+	((val) & ~(REG##_##FLD##_MASK))
+#define REG_SET_FLD(REG, FLD, val) \
+	((val) | (REG##_##FLD##_MASK))
+#define REG_SET_FLD_NUM(REG, FLD, num, val) \
+	(((val) & ~(REG##_##FLD##_MASK)) | FIELD_PREP(REG##_##FLD##_MASK, num))
+#define REG_TEST_FLD(REG, FLD, val) \
+	((REG##_##FLD##_MASK) == ((val) & (REG##_##FLD##_MASK)))
+#define REG_TEST_FLD_NUM(REG, FLD, num, val) \
+	((num) == FIELD_GET(REG##_##FLD##_MASK, val))
+
+#define REGB_POLL(reg, var, cond, timeout_us) \
+	read_poll_timeout(REGB_RD32_SILENT, var, cond, REG_POLL_SLEEP_US, timeout_us, false, reg)
+
+#define REGV_POLL(reg, var, cond, timeout_us) \
+	read_poll_timeout(REGV_RD32_SILENT, var, cond, REG_POLL_SLEEP_US, timeout_us, false, reg)
+
+#define REGB_POLL_FLD(reg, fld, val, timeout_us) \
+({ \
+	u32 var; \
+	REGB_POLL(reg, var, (FIELD_GET(reg##_##fld##_MASK, var) == (val)), timeout_us); \
+})
+
+#define REGV_POLL_FLD(reg, fld, val, timeout_us) \
+({ \
+	u32 var; \
+	REGV_POLL(reg, var, (FIELD_GET(reg##_##fld##_MASK, var) == (val)), timeout_us); \
+})
+
+static inline u32
+vpu_hw_reg_rd32(struct vpu_device *vdev, void __iomem *base, u32 reg,
+		const char *name, const char *func)
+{
+	u32 val = readl(base + reg);
+
+	vpu_dbg(REG, "%s RD: %s (0x%08x) => 0x%08x\n", func, name, reg, val);
+	return val;
+}
+
+static inline u64
+vpu_hw_reg_rd64(struct vpu_device *vdev, void __iomem *base, u32 reg,
+		const char *name, const char *func)
+{
+	u64 val = readq(base + reg);
+
+	vpu_dbg(REG, "%s RD: %s (0x%08x) => 0x%016llx\n", func, name, reg, val);
+	return val;
+}
+
+static inline void
+vpu_hw_reg_wr32(struct vpu_device *vdev, void __iomem *base, u32 reg, u32 val,
+		const char *name, const char *func)
+{
+	vpu_dbg(REG, "%s WR: %s (0x%08x) <= 0x%08x\n", func, name, reg, val);
+	writel(val, base + reg);
+}
+
+static inline void
+vpu_hw_reg_wr64(struct vpu_device *vdev, void __iomem *base, u32 reg, u64 val,
+		const char *name, const char *func)
+{
+	vpu_dbg(REG, "%s WR: %s (0x%08x) <= 0x%016llx\n", func, name, reg, val);
+	writeq(val, base + reg);
+}
+
+static inline void
+vpu_hw_reg_wr32_index(struct vpu_device *vdev, void __iomem *base, u32 reg,
+		      u32 stride, u32 index, u32 val, const char *name,
+		      const char *func)
+{
+	reg += index * stride;
+
+	vpu_dbg(REG, "%s WR: %s_%d (0x%08x) <= 0x%08x\n", func, name, index, reg, val);
+	writel(val, base + reg);
+}
+
+#endif /* __VPU_HW_REG_IO_H__ */
diff --git a/include/uapi/drm/vpu_drm.h b/include/uapi/drm/vpu_drm.h
new file mode 100644
index 000000000000..3311a36bf07b
--- /dev/null
+++ b/include/uapi/drm/vpu_drm.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#ifndef __UAPI_VPU_DRM_H__
+#define __UAPI_VPU_DRM_H__
+
+#include "drm.h"
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+#define DRM_VPU_DRIVER_MAJOR 1
+#define DRM_VPU_DRIVER_MINOR 0
+
+#define DRM_VPU_GET_PARAM		 0x00
+#define DRM_VPU_SET_PARAM		 0x01
+
+#define DRM_IOCTL_VPU_GET_PARAM                                                                    \
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_VPU_GET_PARAM, struct drm_vpu_param)
+
+#define DRM_IOCTL_VPU_SET_PARAM                                                                    \
+	DRM_IOW(DRM_COMMAND_BASE + DRM_VPU_SET_PARAM, struct drm_vpu_param)
+
+/**
+ * DOC: contexts
+ *
+ * VPU contexts have private virtual address space, job queues and priority.
+ * Each context is identified by an unique ID. Context is created on open().
+ */
+
+#define DRM_VPU_PARAM_DEVICE_ID		   0
+#define DRM_VPU_PARAM_DEVICE_REVISION	   1
+#define DRM_VPU_PARAM_PLATFORM_TYPE	   2
+#define DRM_VPU_PARAM_CORE_CLOCK_RATE	   3
+#define DRM_VPU_PARAM_NUM_CONTEXTS	   4
+#define DRM_VPU_PARAM_CONTEXT_BASE_ADDRESS 5
+#define DRM_VPU_PARAM_CONTEXT_PRIORITY	   6
+
+#define DRM_VPU_PLATFORM_TYPE_SILICON	   0
+
+#define DRM_VPU_CONTEXT_PRIORITY_IDLE	   0
+#define DRM_VPU_CONTEXT_PRIORITY_NORMAL	   1
+#define DRM_VPU_CONTEXT_PRIORITY_FOCUS	   2
+#define DRM_VPU_CONTEXT_PRIORITY_REALTIME  3
+
+/**
+ * struct drm_vpu_param - Get/Set VPU parameters
+ */
+struct drm_vpu_param {
+	/**
+	 * @param:
+	 *
+	 * Supported params:
+	 *
+	 * %DRM_VPU_PARAM_DEVICE_ID:
+	 * PCI Device ID of the VPU device (read-only)
+	 *
+	 * %DRM_VPU_PARAM_DEVICE_REVISION:
+	 * VPU device revision (read-only)
+	 *
+	 * %DRM_VPU_PARAM_PLATFORM_TYPE:
+	 * Returns %DRM_VPU_PLATFORM_TYPE_SILICON on real hardware or device specific
+	 * platform type when executing on a simulator or emulator (read-only)
+	 *
+	 * %DRM_VPU_PARAM_CORE_CLOCK_RATE:
+	 * Current PLL frequency (read-only)
+	 *
+	 * %DRM_VPU_PARAM_NUM_CONTEXTS:
+	 * Maximum number of simultaneously existing contexts (read-only)
+	 *
+	 * %DRM_VPU_PARAM_CONTEXT_BASE_ADDRESS:
+	 * Lowest VPU virtual address available in the current context (read-only)
+	 *
+	 * %DRM_VPU_PARAM_CONTEXT_PRIORITY:
+	 * Value of current context scheduling priority (read-write).
+	 * See DRM_VPU_CONTEXT_PRIORITY_* for possible values.
+	 *
+	 */
+	__u32 param;
+
+	/** @index: Index for params that have multiple instances */
+	__u32 index;
+
+	/** @value: Param value */
+	__u64 value;
+};
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* __UAPI_VPU_DRM_H__ */
-- 
2.34.1

