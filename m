Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8564C93A66F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 20:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5481F89A77;
	Tue, 23 Jul 2024 18:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="nDNAJrf8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com
 [95.215.58.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0475D10E620
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 18:35:05 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1721759703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ILe9B/9Mphu0o7nKQGRaAxF7ht3JAsgY6SSklUtvM5Q=;
 b=nDNAJrf8Jj1ZHD/xnXW3tIBzYP/cKBmHUg9JNCpFeqL7QZB+UHvS6wx+VqPmDF+/np29Ay
 njQeqaP3E3G+BMNBFILnx3GGv1wNj3l/fRXJuX/ZofbKexE+XUOdUPP9xu/RsH8AySNd1o
 1TR3hdKFkYxKGP3zazy9pWyQ7REj8Tg=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Markus Elfring <elfring@users.sourceforge.net>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v4 1/1] drm/loongson: Introduce component framework support
Date: Wed, 24 Jul 2024 02:34:36 +0800
Message-ID: <20240723183436.216670-2-sui.jingfeng@linux.dev>
In-Reply-To: <20240723183436.216670-1-sui.jingfeng@linux.dev>
References: <20240723183436.216670-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

In some display subsystems, the functionality of a PCIe device may too
complex to be managed by a single driver. A split of the functionality
into child devices can help to achieve better modularity. For example,
KMS drivers who have dependencies on external modules will suffer from
the deferral probe problem. The problem is that the DRM driver has to
tear down everything when it receives '-EPROBE_DEFER', even though the
independent part of the driver is not related to this error.

Loongson Graphics are PCIe multifunctional devices, the GPU and the
display controller are two distinct devices. Despite all hardware units
that come along with PCIe are actually ready to be driven by the time
of the dirver is loaded, drm/loongson driver still need to wait all of
its dependencies ready before it can register the service to userspace.

The idea is to migrate (offload) the dependency to submodules, creating
submodule by creating platform devices manually during driverload time.
Submodules are functional as agents, which will be responsible for
attaching needed external modules for the main body of the whole KMS
driver. Submodules are also responsible for returning '-EPROBE_DEFER'
to the driver core if it needs to do so.

Add a dummy GPU driver as a subcomponent, make LSDC PCI driver as a
subcomponent as well. Introduce the component framework to bind those
scatter software and/or hardware entities into one. Creating a platform
device as a DRM proxy, which will attach the common drm routines to our
hardware after all submodules bound. The proxy is the explicit executant
working at the foreground, while the LSDC PCIe device is the master.

Move DRM-related codes into the loongson_drm_master_bind(), move output
related things into the submodule, because the output hardware units are
relatively standalone IPs and the encoder/connector/transcoder may depend
on external modules. While the display controller itself and GPIO-I2Cs
have no dependency on external modules, therefore go with the LSDC PCIe
device. Also assign GFX PLL, TTM memory manager part, and power management
part to loongson drm proxy, as they do not belong to the LSDC itself.

While at it, also do some cleanups.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/loongson/Makefile             |   6 +
 drivers/gpu/drm/loongson/loonggpu_pci_drv.c   | 163 ++++++++
 drivers/gpu/drm/loongson/loonggpu_pci_drv.h   |  35 ++
 drivers/gpu/drm/loongson/loongson_device.c    |  30 ++
 drivers/gpu/drm/loongson/loongson_drv.c       | 293 +++++++++++++
 drivers/gpu/drm/loongson/loongson_drv.h       |  90 ++++
 drivers/gpu/drm/loongson/loongson_module.c    |  84 +++-
 drivers/gpu/drm/loongson/loongson_module.h    |  32 ++
 drivers/gpu/drm/loongson/lsdc_benchmark.c     |  12 +-
 drivers/gpu/drm/loongson/lsdc_benchmark.h     |   2 +-
 drivers/gpu/drm/loongson/lsdc_component.c     | 159 +++++++
 drivers/gpu/drm/loongson/lsdc_crtc.c          |   4 +-
 drivers/gpu/drm/loongson/lsdc_debugfs.c       |  44 +-
 drivers/gpu/drm/loongson/lsdc_drv.c           | 394 ++----------------
 drivers/gpu/drm/loongson/lsdc_drv.h           |  83 +---
 drivers/gpu/drm/loongson/lsdc_gem.c           |  44 +-
 drivers/gpu/drm/loongson/lsdc_gem.h           |  19 +-
 drivers/gpu/drm/loongson/lsdc_gfxpll.c        |  29 +-
 drivers/gpu/drm/loongson/lsdc_gfxpll.h        |   3 +-
 drivers/gpu/drm/loongson/lsdc_i2c.c           |  43 +-
 drivers/gpu/drm/loongson/lsdc_i2c.h           |  12 +-
 drivers/gpu/drm/loongson/lsdc_output.c        | 183 ++++++++
 drivers/gpu/drm/loongson/lsdc_output.h        |  36 +-
 drivers/gpu/drm/loongson/lsdc_output_7a1000.c |  14 +-
 drivers/gpu/drm/loongson/lsdc_output_7a2000.c |  20 +-
 drivers/gpu/drm/loongson/lsdc_plane.c         |   4 +-
 drivers/gpu/drm/loongson/lsdc_ttm.c           |  84 ++--
 drivers/gpu/drm/loongson/lsdc_ttm.h           |   4 +-
 28 files changed, 1318 insertions(+), 608 deletions(-)
 create mode 100644 drivers/gpu/drm/loongson/loonggpu_pci_drv.c
 create mode 100644 drivers/gpu/drm/loongson/loonggpu_pci_drv.h
 create mode 100644 drivers/gpu/drm/loongson/loongson_drv.c
 create mode 100644 drivers/gpu/drm/loongson/loongson_drv.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_component.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output.c

diff --git a/drivers/gpu/drm/loongson/Makefile b/drivers/gpu/drm/loongson/Makefile
index 91e72bd900c1..1c496713baa9 100644
--- a/drivers/gpu/drm/loongson/Makefile
+++ b/drivers/gpu/drm/loongson/Makefile
@@ -2,6 +2,7 @@
 
 loongson-y := \
 	lsdc_benchmark.o \
+	lsdc_component.o \
 	lsdc_crtc.o \
 	lsdc_debugfs.o \
 	lsdc_drv.o \
@@ -9,6 +10,7 @@ loongson-y := \
 	lsdc_gfxpll.o \
 	lsdc_i2c.o \
 	lsdc_irq.o \
+	lsdc_output.o \
 	lsdc_output_7a1000.o \
 	lsdc_output_7a2000.o \
 	lsdc_plane.o \
@@ -16,7 +18,11 @@ loongson-y := \
 	lsdc_probe.o \
 	lsdc_ttm.o
 
+loongson-y += \
+	loonggpu_pci_drv.o
+
 loongson-y += loongson_device.o \
+	      loongson_drv.o \
 	      loongson_module.o
 
 obj-$(CONFIG_DRM_LOONGSON) += loongson.o
diff --git a/drivers/gpu/drm/loongson/loonggpu_pci_drv.c b/drivers/gpu/drm/loongson/loonggpu_pci_drv.c
new file mode 100644
index 000000000000..44c5fd93a69a
--- /dev/null
+++ b/drivers/gpu/drm/loongson/loonggpu_pci_drv.c
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Authors:
+ *      Sui Jingfeng <sui.jingfeng@linux.dev>
+ */
+
+#include <linux/component.h>
+#include <linux/pci.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_print.h>
+
+#include "loongson_drv.h"
+#include "loongson_module.h"
+#include "loonggpu_pci_drv.h"
+
+static int loonggpu_get_version(struct loonggpu_device *gpu)
+{
+	u32 hw_info = loong_rreg32(gpu, 0x8C);
+	u8 host_id;
+	u8 revision;
+
+	/* LoongGPU hardware info */
+	gpu->ver_major = (hw_info >> 8) & 0x0F;
+	gpu->ver_minor = (hw_info & 0xF0) >> 4;
+	revision = hw_info & 0x0F;
+	host_id = (hw_info >> 16) & 0xFF;
+
+	drm_info(gpu->drm, "LoongGPU(TM): LG%x%x0, revision: %x, Host: %s\n",
+		 gpu->ver_major, gpu->ver_minor, revision,
+		 host_id ? "LS2K2000" : "LS7A2000");
+
+	return 0;
+}
+
+static irqreturn_t loonggpu_irq_handler(int irq, void *arg)
+{
+	struct loonggpu_device *gpu = arg;
+
+	drm_dbg(gpu->drm, "LoongGPU interrupted\n");
+
+	return IRQ_HANDLED;
+}
+
+static int loonggpu_component_bind(struct device *dev,
+				   struct device *master,
+				   void *data)
+{
+	struct loonggpu_device *gpu = dev_get_drvdata(dev);
+	struct drm_device *drm = data;
+	struct loongson_drm *ldrm = to_loongson_drm(drm);
+	struct pci_dev *pdev = to_pci_dev(dev);
+	int ret;
+
+	gpu->drm = drm;
+	ldrm->loonggpu = gpu;
+
+	loonggpu_get_version(gpu);
+
+	ret = devm_request_irq(dev,
+			       pdev->irq,
+			       loonggpu_irq_handler,
+			       IRQF_SHARED,
+			       dev_name(dev),
+			       gpu);
+	if (ret)
+		return ret;
+
+	drm_info(gpu->drm, "LoongGPU irq: %d\n", pdev->irq);
+
+	return 0;
+}
+
+static void loonggpu_component_unbind(struct device *dev,
+				      struct device *master,
+				      void *data)
+{
+	dev_dbg(dev, "LoongGPU unbind\n");
+}
+
+static const struct component_ops loonggpu_component_ops = {
+	.bind = loonggpu_component_bind,
+	.unbind = loonggpu_component_unbind,
+};
+
+static int loonggpu_pci_probe(struct pci_dev *pdev,
+			      const struct pci_device_id *ent)
+{
+	struct loonggpu_device *gpu;
+	int ret;
+
+	ret = pcim_enable_device(pdev);
+	if (ret)
+		return ret;
+
+	pci_set_master(pdev);
+
+	gpu = devm_kzalloc(&pdev->dev, sizeof(*gpu), GFP_KERNEL);
+	if (!gpu)
+		return -ENOMEM;
+
+	gpu->pdev = pdev;
+
+	gpu->reg_base = pcim_iomap(pdev, 0, 0);
+	if (!gpu->reg_base)
+		return -ENOMEM;
+
+	pci_set_drvdata(pdev, gpu);
+
+	dev_info(&pdev->dev, "LoongGPU(TM) PCI driver probed\n");
+
+	return component_add(&pdev->dev, &loonggpu_component_ops);
+}
+
+static void loonggpu_pci_remove(struct pci_dev *pdev)
+{
+	component_del(&pdev->dev, &loonggpu_component_ops);
+}
+
+static int loonggpu_pm_suspend(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	pci_save_state(pdev);
+	pci_disable_device(pdev);
+	pci_set_power_state(pdev, PCI_D3hot);
+
+	return 0;
+}
+
+static int loonggpu_pm_resume(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	pci_set_power_state(pdev, PCI_D0);
+	pci_restore_state(pdev);
+
+	if (pcim_enable_device(pdev))
+		return -EIO;
+
+	return 0;
+}
+
+static const struct dev_pm_ops loonggpu_pm_ops = {
+	.suspend = loonggpu_pm_suspend,
+	.resume = loonggpu_pm_resume,
+};
+
+static const struct pci_device_id loonggpu_pci_id_list[] = {
+	{PCI_VDEVICE(LOONGSON, 0x7a25), CHIP_LS7A2000},
+	{ },
+};
+
+struct pci_driver loonggpu_pci_driver = {
+	.name = "loongson.loonggpu",
+	.id_table = loonggpu_pci_id_list,
+	.probe = loonggpu_pci_probe,
+	.remove = loonggpu_pci_remove,
+	.driver.pm = &loonggpu_pm_ops,
+};
+
+MODULE_DEVICE_TABLE(pci, loonggpu_pci_id_list);
diff --git a/drivers/gpu/drm/loongson/loonggpu_pci_drv.h b/drivers/gpu/drm/loongson/loonggpu_pci_drv.h
new file mode 100644
index 000000000000..1ba64ef12835
--- /dev/null
+++ b/drivers/gpu/drm/loongson/loonggpu_pci_drv.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Authors:
+ *      Sui Jingfeng <sui.jingfeng@linux.dev>
+ */
+
+#ifndef __LOONGGPU_PCI_DRV_H__
+#define __LOONGGPU_PCI_DRV_H__
+
+#include <linux/component.h>
+#include <linux/pci.h>
+
+struct loonggpu_device {
+	struct pci_dev *pdev;
+	struct drm_device *drm;
+
+	void __iomem *reg_base;
+	int irq;
+
+	u32 ver_major;
+	u32 ver_minor;
+	u32 revision;
+};
+
+static inline u32 loong_rreg32(struct loonggpu_device *ldev, u32 offset)
+{
+	return readl(ldev->reg_base + offset);
+}
+
+static inline void loong_wreg32(struct loonggpu_device *ldev, u32 offset, u32 val)
+{
+	writel(val, ldev->reg_base + offset);
+}
+
+#endif
diff --git a/drivers/gpu/drm/loongson/loongson_device.c b/drivers/gpu/drm/loongson/loongson_device.c
index 9986c8a2a255..364b4bdbf0c5 100644
--- a/drivers/gpu/drm/loongson/loongson_device.c
+++ b/drivers/gpu/drm/loongson/loongson_device.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/pci.h>
+#include <linux/platform_device.h>
 
 #include "lsdc_drv.h"
 
@@ -100,3 +101,32 @@ lsdc_device_probe(struct pci_dev *pdev, enum loongson_chip_id chip_id)
 {
 	return __chip_id_desc_table[chip_id];
 }
+
+static void loongson_device_postfini(void *data)
+{
+	struct platform_device *proxy = data;
+
+	platform_device_unregister(proxy);
+}
+
+int loongson_device_preinit(struct device *parent)
+{
+	struct platform_device *proxy;
+	int ret;
+
+	proxy = platform_device_register_resndata(parent,
+						  "loongson",
+						  PLATFORM_DEVID_NONE,
+						  NULL, 0,
+						  NULL, 0);
+	if (IS_ERR(proxy)) {
+		dev_err(parent, "failed to register loongson proxy device\n");
+		return PTR_ERR(proxy);
+	}
+
+	ret = devm_add_action_or_reset(parent, loongson_device_postfini, proxy);
+	if (ret)
+		return ret;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/loongson/loongson_drv.c b/drivers/gpu/drm/loongson/loongson_drv.c
new file mode 100644
index 000000000000..346a06e80f91
--- /dev/null
+++ b/drivers/gpu/drm/loongson/loongson_drv.c
@@ -0,0 +1,293 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Authors:
+ *      Sui Jingfeng <sui.jingfeng@linux.dev>
+ */
+
+#include <linux/component.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_aperture.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fbdev_ttm.h>
+#include <drm/drm_ioctl.h>
+#include <drm/drm_probe_helper.h>
+
+#include "loonggpu_pci_drv.h"
+#include "loongson_drv.h"
+#include "loongson_module.h"
+#include "lsdc_drv.h"
+#include "lsdc_gem.h"
+#include "lsdc_output.h"
+#include "lsdc_ttm.h"
+
+DEFINE_DRM_GEM_FOPS(loongson_gem_fops);
+
+static const struct drm_driver loongson_drm_driver = {
+	.driver_features = DRIVER_MODESET | DRIVER_RENDER | DRIVER_GEM |
+			   DRIVER_ATOMIC,
+	.fops = &loongson_gem_fops,
+	.name = DRIVER_NAME,
+	.desc = DRIVER_DESC,
+	.date = DRIVER_DATE,
+	.major = DRIVER_MAJOR,
+	.minor = DRIVER_MINOR,
+	.patchlevel = DRIVER_PATCHLEVEL,
+	.debugfs_init = loongson_debugfs_init,
+	.dumb_create = lsdc_dumb_create,
+	.dumb_map_offset = lsdc_dumb_map_offset,
+	.gem_prime_import_sg_table = lsdc_prime_import_sg_table,
+};
+
+/*
+ * The GPU and display controller in the LS7A1000/LS7A2000/LS2K2000 are
+ * separated PCIE devices. They are two devices, not one. Bar 2 of the GPU
+ * device contains the base address and size of the VRAM, both the GPU and
+ * the DC could access the on-board VRAM.
+ */
+static int loongson_drm_get_dedicated_vram(struct drm_device *drm)
+{
+	struct loongson_drm *ldrm = to_loongson_drm(drm);
+	struct pci_dev *pdev_gpu;
+	resource_size_t base, size;
+
+	/*
+	 * The GPU has 00:06.0 as its BDF, this is true at least for
+	 * LS7A1000, LS7A2000 and LS2K2000.
+	 */
+	pdev_gpu = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(6, 0));
+	if (!pdev_gpu) {
+		drm_err(drm, "No GPU device, then no VRAM\n");
+		return -ENODEV;
+	}
+
+	base = pci_resource_start(pdev_gpu, 2);
+	size = pci_resource_len(pdev_gpu, 2);
+
+	pci_dev_put(pdev_gpu);
+
+	ldrm->vram_base = base;
+	ldrm->vram_size = size;
+
+	drm_info(drm, "Dedicated vram start: 0x%llx, size: %uMiB\n",
+		 (u64)base, (u32)(size >> 20));
+
+	return (size > SZ_1M) ? 0 : -ENODEV;
+}
+
+static int loongson_drm_master_bind(struct device *dev)
+{
+	struct loongson_drm *ldrm = dev_get_drvdata(dev);
+	struct drm_device *ddev = &ldrm->ddev;
+	int ret;
+
+	loongson_drm_get_dedicated_vram(ddev);
+
+	loongson_gfxpll_preinit(ddev);
+
+	ret = drmm_mode_config_init(ddev);
+	if (ret)
+		return ret;
+
+	ret = component_bind_all(dev, ddev);
+	if (ret) {
+		dev_err(dev, "master bind all failed: %d\n", ret);
+		return ret;
+	}
+
+	drm_mode_config_reset(ddev);
+
+	lsdc_gem_init(ddev);
+
+	ret = lsdc_ttm_init(ddev);
+	if (ret) {
+		drm_err(ddev, "Memory manager init failed: %d\n", ret);
+		return ret;
+	}
+
+	drmm_kms_helper_poll_init(ddev);
+
+	ret = drm_dev_register(ddev, 0);
+	if (ret)
+		return ret;
+
+	drm_fbdev_ttm_setup(ddev, 32);
+
+	return 0;
+}
+
+static void loongson_drm_master_unbind(struct device *dev)
+{
+	struct loongson_drm *ldrm = dev_get_drvdata(dev);
+	struct drm_device *ddev = &ldrm->ddev;
+
+	drm_atomic_helper_shutdown(ddev);
+
+	drm_dev_unregister(ddev);
+
+	component_unbind_all(dev, ddev);
+}
+
+static const struct component_master_ops loongson_drm_master_ops = {
+	.bind = loongson_drm_master_bind,
+	.unbind = loongson_drm_master_unbind,
+};
+
+static int loongson_drm_freeze(struct drm_device *ddev)
+{
+	struct loongson_drm *ldrm = to_loongson_drm(ddev);
+	struct lsdc_bo *lbo;
+	int ret;
+
+	/* unpin all of buffers in the VRAM */
+	mutex_lock(&ldrm->gem.mutex);
+	list_for_each_entry(lbo, &ldrm->gem.objects, list) {
+		struct ttm_buffer_object *tbo = &lbo->tbo;
+		struct ttm_resource *resource = tbo->resource;
+		unsigned int pin_count = tbo->pin_count;
+
+		drm_dbg(ddev, "bo[%p], size: %zuKiB, type: %s, pin count: %u\n",
+			lbo, lsdc_bo_size(lbo) >> 10,
+			lsdc_mem_type_to_str(resource->mem_type), pin_count);
+
+		if (!pin_count)
+			continue;
+
+		if (resource->mem_type == TTM_PL_VRAM) {
+			ret = lsdc_bo_reserve(lbo);
+			if (unlikely(ret)) {
+				drm_err(ddev, "bo reserve failed: %d\n", ret);
+				continue;
+			}
+
+			do {
+				lsdc_bo_unpin(lbo);
+				--pin_count;
+			} while (pin_count);
+
+			lsdc_bo_unreserve(lbo);
+		}
+	}
+	mutex_unlock(&ldrm->gem.mutex);
+
+	lsdc_bo_evict_vram(ddev);
+
+	ret = drm_mode_config_helper_suspend(ddev);
+	if (unlikely(ret)) {
+		drm_err(ddev, "Freeze error: %d", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int loongson_drm_pm_suspend(struct platform_device *pdev, pm_message_t state)
+{
+	struct loongson_drm *ldrm = platform_get_drvdata(pdev);
+
+	return loongson_drm_freeze(&ldrm->ddev);
+}
+
+static int loongson_drm_pm_resume(struct platform_device *pdev)
+{
+	struct loongson_drm *ldrm = platform_get_drvdata(pdev);
+
+	return drm_mode_config_helper_resume(&ldrm->ddev);
+}
+
+static void loongson_add_pci_match(struct device *master,
+				   struct device_driver *driver,
+				   struct component_match **matchptr)
+{
+	struct pci_driver *pdriver = to_pci_driver(driver);
+	const struct pci_device_id *id_table = pdriver->id_table;
+	unsigned int i = 0;
+	struct pci_dev *pdev;
+
+	while (id_table[i].vendor == PCI_VENDOR_ID_LOONGSON) {
+		pdev = pci_get_device(PCI_VENDOR_ID_LOONGSON,
+				      id_table[i].device,
+				      NULL);
+		if (!pdev) {
+			++i;
+			continue;
+		}
+
+		component_match_add(master, matchptr, component_compare_dev,
+				    &pdev->dev);
+		pci_dev_put(pdev);
+		return;
+	}
+}
+
+static void loongson_add_platform_match(struct device *master,
+					struct device_driver *driver,
+					struct component_match **matchptr)
+{
+	struct device *dev = NULL;
+
+	while ((dev = platform_find_device_by_driver(dev, driver))) {
+		component_match_add(master, matchptr, component_compare_dev, dev);
+		put_device(dev);
+	}
+}
+
+static void loongson_matches_add(struct device *master,
+				 struct component_match **pptr)
+{
+	const struct loongson_driver_info *ldi;
+
+	ldi = loongson_get_driver_info_array(NULL);
+	while (ldi->driver) {
+		if (ldi->type == LOONGSON_DRIVER_TYPE_PCI)
+			loongson_add_pci_match(master, ldi->driver, pptr);
+		else if (ldi->type == LOONGSON_DRIVER_TYPE_PLATFORM)
+			loongson_add_platform_match(master, ldi->driver, pptr);
+
+		++ldi;
+	}
+}
+
+static int loongson_drm_driver_probe(struct platform_device *pdev)
+{
+	struct lsdc_device *lsdc = dev_get_drvdata(pdev->dev.parent);
+	struct component_match *matches = NULL;
+	struct loongson_drm *ldrm;
+
+	ldrm = devm_drm_dev_alloc(pdev->dev.parent,
+				  &loongson_drm_driver,
+				  struct loongson_drm, ddev);
+	if (IS_ERR(ldrm))
+		return PTR_ERR(ldrm);
+
+	ldrm->lsdc = lsdc;
+	ldrm->gfxinfo = to_loongson_gfx(lsdc->descp);
+	platform_set_drvdata(pdev, ldrm);
+
+	loongson_matches_add(&pdev->dev, &matches);
+
+	dev_info(&pdev->dev, "drm proxy probed\n");
+
+	return component_master_add_with_match(&pdev->dev,
+					       &loongson_drm_master_ops,
+					       matches);
+}
+
+static void loongson_drm_driver_remove(struct platform_device *pdev)
+{
+	component_master_del(&pdev->dev, &loongson_drm_master_ops);
+}
+
+struct platform_driver loongson_drm_platform_driver = {
+	.driver = {
+		.name = DRIVER_NAME,
+	},
+	.probe = loongson_drm_driver_probe,
+	.remove_new = loongson_drm_driver_remove,
+	.suspend = loongson_drm_pm_suspend,
+	.resume = loongson_drm_pm_resume,
+};
diff --git a/drivers/gpu/drm/loongson/loongson_drv.h b/drivers/gpu/drm/loongson/loongson_drv.h
new file mode 100644
index 000000000000..e8875af66e12
--- /dev/null
+++ b/drivers/gpu/drm/loongson/loongson_drv.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Authors:
+ *      Sui Jingfeng <sui.jingfeng@linux.dev>
+ */
+
+#ifndef __LOONGSON_DRV_H__
+#define __LOONGSON_DRV_H__
+
+#include <drm/drm_device.h>
+#include <drm/drm_file.h>
+#include <drm/ttm/ttm_device.h>
+
+#include "loongson_module.h"
+#include "lsdc_gem.h"
+#include "lsdc_gfxpll.h"
+
+struct loongson_drm {
+	struct drm_device ddev;
+
+	struct device *dev;
+
+	/* submodules */
+	struct lsdc_device *lsdc;
+	struct loonggpu_device *loonggpu;
+
+	const struct loongson_gfx_desc *gfxinfo;
+
+	struct loongson_gfxpll gfxpll;
+
+	/* memory manager */
+	struct ttm_device bdev;
+	resource_size_t vram_base;
+	resource_size_t vram_size;
+	resource_size_t gtt_base;
+	resource_size_t gtt_size;
+
+	struct loongson_gem gem;
+
+	/* tracking pinned memory */
+	size_t vram_pinned_size;
+	size_t gtt_pinned_size;
+};
+
+static inline struct loongson_drm *
+to_loongson_drm(struct drm_device *drm)
+{
+	return container_of(drm, struct loongson_drm, ddev);
+}
+
+static inline struct lsdc_device *
+to_lsdc(struct drm_device *drm)
+{
+	return to_loongson_drm(drm)->lsdc;
+}
+
+static inline struct loonggpu_device *
+to_loongpu(struct drm_device *drm)
+{
+	return to_loongson_drm(drm)->loonggpu;
+}
+
+static inline resource_size_t
+loongson_drm_vram_base(struct drm_device *drm)
+{
+	return to_loongson_drm(drm)->vram_base;
+}
+
+static inline resource_size_t
+loongson_drm_vram_size(struct drm_device *drm)
+{
+	return to_loongson_drm(drm)->vram_size;
+}
+
+static inline struct loongson_gem *
+to_loongson_gem(struct drm_device *drm)
+{
+	return &(to_loongson_drm(drm)->gem);
+}
+
+static inline struct loongson_drm *
+tdev_to_ldrm(struct ttm_device *tdev)
+{
+	return container_of(tdev, struct loongson_drm, bdev);
+}
+
+int loongson_device_preinit(struct device *parent);
+void loongson_debugfs_init(struct drm_minor *minor);
+
+#endif
diff --git a/drivers/gpu/drm/loongson/loongson_module.c b/drivers/gpu/drm/loongson/loongson_module.c
index d2a51bd395f6..a152146f5553 100644
--- a/drivers/gpu/drm/loongson/loongson_module.c
+++ b/drivers/gpu/drm/loongson/loongson_module.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/pci.h>
+#include <linux/platform_device.h>
 
 #include <video/nomodeset.h>
 
@@ -17,17 +18,96 @@ int loongson_vblank = 1;
 MODULE_PARM_DESC(vblank, "Disable/Enable hw vblank support");
 module_param_named(vblank, loongson_vblank, int, 0400);
 
+static const struct loongson_driver_info loongson_driver_array[] = {
+	{
+		.driver = &lsdc_output_platform_driver.driver,
+		.type = LOONGSON_DRIVER_TYPE_PLATFORM,
+	},
+	{
+		.driver = &lsdc_pci_driver.driver,
+		.type = LOONGSON_DRIVER_TYPE_PCI,
+	},
+	{
+		.driver = &loonggpu_pci_driver.driver,
+		.type = LOONGSON_DRIVER_TYPE_PCI,
+	},
+	{
+		.driver = &loongson_drm_platform_driver.driver,
+		.type = LOONGSON_DRIVER_TYPE_PLATFORM | LOONGSON_DRIVER_TYPE_DRM_MASTER,
+	},
+	{
+		.driver = NULL,
+		.type = LOONGSON_DRIVER_TYPE_UNKNOWN,
+	},
+};
+
+const struct loongson_driver_info *loongson_get_driver_info_array(int *num)
+{
+	if (num)
+		*num = ARRAY_SIZE(loongson_driver_array) - 1;
+
+	return loongson_driver_array;
+}
+
+static inline void loongson_unregister_driver(int count)
+{
+	const struct loongson_driver_info *ldi;
+	struct device_driver *driver;
+
+	while (count-- > 0) {
+		ldi = &loongson_driver_array[count];
+		driver = ldi->driver;
+		if (!driver)
+			continue;
+
+		if (ldi->type & LOONGSON_DRIVER_TYPE_PCI)
+			pci_unregister_driver(to_pci_driver(driver));
+		else if (ldi->type & LOONGSON_DRIVER_TYPE_PLATFORM)
+			platform_driver_unregister(to_platform_driver(driver));
+	}
+}
+
 static int __init loongson_module_init(void)
 {
+	const struct loongson_driver_info *ldi = loongson_driver_array;
+	int count = 0;
+	int ret;
+
 	if (!loongson_modeset || video_firmware_drivers_only())
 		return -ENODEV;
 
-	return pci_register_driver(&lsdc_pci_driver);
+	while (ldi->driver) {
+		if (ldi->type & LOONGSON_DRIVER_TYPE_PCI) {
+			ret = pci_register_driver(to_pci_driver(ldi->driver));
+			if (ret)
+				goto register_driver_err;
+			goto register_driver_ok;
+		}
+
+		if (ldi->type & LOONGSON_DRIVER_TYPE_PLATFORM) {
+			ret = platform_driver_register(to_platform_driver(ldi->driver));
+			if (ret)
+				goto register_driver_err;
+			goto register_driver_ok;
+		}
+
+register_driver_ok:
+		++count;
+		++ldi;
+	}
+
+	pr_info("loongson: total %d drivers registered\n", count);
+	return 0;
+
+register_driver_err:
+	loongson_unregister_driver(count);
+
+	return ret;
 }
 module_init(loongson_module_init);
 
 static void __exit loongson_module_exit(void)
 {
-	pci_unregister_driver(&lsdc_pci_driver);
+	loongson_unregister_driver(ARRAY_SIZE(loongson_driver_array) - 1);
 }
 module_exit(loongson_module_exit);
diff --git a/drivers/gpu/drm/loongson/loongson_module.h b/drivers/gpu/drm/loongson/loongson_module.h
index 931c17521bf0..592c10158588 100644
--- a/drivers/gpu/drm/loongson/loongson_module.h
+++ b/drivers/gpu/drm/loongson/loongson_module.h
@@ -6,7 +6,39 @@
 #ifndef __LOONGSON_MODULE_H__
 #define __LOONGSON_MODULE_H__
 
+#define DRIVER_AUTHOR               "Sui Jingfeng <sui.jingfeng@linux.dev>"
+#define DRIVER_NAME                 "loongson"
+#define DRIVER_DESC                 "drm driver for loongson graphics"
+#define DRIVER_DATE                 "20220701"
+#define DRIVER_MAJOR                1
+#define DRIVER_MINOR                0
+#define DRIVER_PATCHLEVEL           0
+
+enum loongson_chip_id {
+	CHIP_LS7A1000 = 0,
+	CHIP_LS7A2000 = 1,
+	CHIP_LS_LAST,
+};
+
+enum loongson_driver_type {
+	LOONGSON_DRIVER_TYPE_UNKNOWN = 0,
+	LOONGSON_DRIVER_TYPE_DRM_MASTER = 1,
+	LOONGSON_DRIVER_TYPE_PCI = 2,
+	LOONGSON_DRIVER_TYPE_PLATFORM = 4,
+};
+
+struct loongson_driver_info {
+	struct device_driver *driver;
+	u64 type;
+};
+
+const struct loongson_driver_info *loongson_get_driver_info_array(int *num);
+
 extern int loongson_vblank;
+
 extern struct pci_driver lsdc_pci_driver;
+extern struct pci_driver loonggpu_pci_driver;
+extern struct platform_driver lsdc_output_platform_driver;
+extern struct platform_driver loongson_drm_platform_driver;
 
 #endif
diff --git a/drivers/gpu/drm/loongson/lsdc_benchmark.c b/drivers/gpu/drm/loongson/lsdc_benchmark.c
index b088646a2ff9..b3f2fde5d345 100644
--- a/drivers/gpu/drm/loongson/lsdc_benchmark.c
+++ b/drivers/gpu/drm/loongson/lsdc_benchmark.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_debugfs.h>
 
+#include "loongson_drv.h"
 #include "lsdc_benchmark.h"
 #include "lsdc_drv.h"
 #include "lsdc_gem.h"
@@ -60,7 +61,7 @@ static void lsdc_copy_gtt_to_gtt_cpu(struct lsdc_bo *src_bo,
 	lsdc_bo_kunmap(dst_bo);
 }
 
-static void lsdc_benchmark_copy(struct lsdc_device *ldev,
+static void lsdc_benchmark_copy(struct drm_device *ddev,
 				unsigned int size,
 				unsigned int n,
 				u32 src_domain,
@@ -68,7 +69,6 @@ static void lsdc_benchmark_copy(struct lsdc_device *ldev,
 				lsdc_copy_proc_t copy_proc,
 				struct drm_printer *p)
 {
-	struct drm_device *ddev = &ldev->base;
 	struct lsdc_bo *src_bo;
 	struct lsdc_bo *dst_bo;
 	unsigned long start_jiffies;
@@ -100,12 +100,12 @@ static void lsdc_benchmark_copy(struct lsdc_device *ldev,
 		   time, throughput);
 }
 
-int lsdc_show_benchmark_copy(struct lsdc_device *ldev, struct drm_printer *p)
+int lsdc_show_benchmark_copy(struct drm_device *ddev, struct drm_printer *p)
 {
 	unsigned int buffer_size = 1920 * 1080 * 4;
 	unsigned int iteration = 60;
 
-	lsdc_benchmark_copy(ldev,
+	lsdc_benchmark_copy(ddev,
 			    buffer_size,
 			    iteration,
 			    LSDC_GEM_DOMAIN_GTT,
@@ -113,7 +113,7 @@ int lsdc_show_benchmark_copy(struct lsdc_device *ldev, struct drm_printer *p)
 			    lsdc_copy_gtt_to_gtt_cpu,
 			    p);
 
-	lsdc_benchmark_copy(ldev,
+	lsdc_benchmark_copy(ddev,
 			    buffer_size,
 			    iteration,
 			    LSDC_GEM_DOMAIN_GTT,
@@ -121,7 +121,7 @@ int lsdc_show_benchmark_copy(struct lsdc_device *ldev, struct drm_printer *p)
 			    lsdc_copy_gtt_to_vram_cpu,
 			    p);
 
-	lsdc_benchmark_copy(ldev,
+	lsdc_benchmark_copy(ddev,
 			    buffer_size,
 			    iteration,
 			    LSDC_GEM_DOMAIN_VRAM,
diff --git a/drivers/gpu/drm/loongson/lsdc_benchmark.h b/drivers/gpu/drm/loongson/lsdc_benchmark.h
index 36110278237e..432213189044 100644
--- a/drivers/gpu/drm/loongson/lsdc_benchmark.h
+++ b/drivers/gpu/drm/loongson/lsdc_benchmark.h
@@ -8,6 +8,6 @@
 
 #include "lsdc_drv.h"
 
-int lsdc_show_benchmark_copy(struct lsdc_device *ldev, struct drm_printer *p);
+int lsdc_show_benchmark_copy(struct drm_device *ddev, struct drm_printer *p);
 
 #endif
diff --git a/drivers/gpu/drm/loongson/lsdc_component.c b/drivers/gpu/drm/loongson/lsdc_component.c
new file mode 100644
index 000000000000..2ae3b594c3d3
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_component.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Authors:
+ *      Sui Jingfeng <sui.jingfeng@linux.dev>
+ */
+
+#include <linux/aperture.h>
+#include <linux/component.h>
+#include <linux/pci.h>
+#include <linux/vgaarb.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_modeset_helper.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
+
+#include "loongson_module.h"
+#include "loongson_drv.h"
+#include "lsdc_drv.h"
+
+/* For multiple GPU devices co-exixt in the system */
+
+static unsigned int lsdc_vga_set_decode(struct pci_dev *pdev, bool state)
+{
+	return VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
+}
+
+static const struct drm_mode_config_funcs lsdc_mode_config_funcs = {
+	.fb_create = drm_gem_fb_create,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+static int lsdc_modeset_init(struct lsdc_device *ldev,
+			     unsigned int num_crtc,
+			     const struct lsdc_kms_funcs *funcs,
+			     bool has_vblank)
+{
+	struct drm_device *ddev = ldev->drm;
+	struct lsdc_display_pipe *dispipe;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < num_crtc; i++) {
+		dispipe = &ldev->dispipe[i];
+
+		ret = funcs->primary_plane_init(ddev, &dispipe->primary.base, i);
+		if (ret)
+			return ret;
+
+		ret = funcs->cursor_plane_init(ddev, &dispipe->cursor.base, i);
+		if (ret)
+			return ret;
+
+		ret = funcs->crtc_init(ddev, &dispipe->crtc.base,
+				       &dispipe->primary.base,
+				       &dispipe->cursor.base,
+				       i, has_vblank);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct drm_mode_config_helper_funcs lsdc_mode_config_helper_funcs = {
+	.atomic_commit_tail = drm_atomic_helper_commit_tail,
+};
+
+static int lsdc_mode_config_init(struct drm_device *ddev,
+				 const struct lsdc_desc *descp)
+{
+	ddev->mode_config.funcs = &lsdc_mode_config_funcs;
+	ddev->mode_config.min_width = 1;
+	ddev->mode_config.min_height = 1;
+	ddev->mode_config.max_width = descp->max_width * LSDC_NUM_CRTC;
+	ddev->mode_config.max_height = descp->max_height * LSDC_NUM_CRTC;
+	ddev->mode_config.preferred_depth = 24;
+	ddev->mode_config.prefer_shadow = 1;
+
+	ddev->mode_config.cursor_width = descp->hw_cursor_h;
+	ddev->mode_config.cursor_height = descp->hw_cursor_h;
+
+	ddev->mode_config.helper_private = &lsdc_mode_config_helper_funcs;
+
+	if (descp->has_vblank_counter)
+		ddev->max_vblank_count = 0xffffffff;
+
+	return 0;
+}
+
+static int lsdc_pci_component_bind(struct device *dev,
+				   struct device *master,
+				   void *data)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct drm_device *drm = data;
+	struct loongson_drm *ldrm = to_loongson_drm(drm);
+	struct lsdc_device *lsdc = dev_get_drvdata(dev);
+	const struct lsdc_desc *descp = lsdc->descp;
+	int num_pipe = descp->num_of_crtc;
+	int ret;
+
+	ldrm->lsdc = lsdc;
+	lsdc->drm = drm;
+
+	ret = aperture_remove_conflicting_devices(ldrm->vram_base,
+						  ldrm->vram_size,
+						  DRIVER_NAME);
+	if (ret)
+		return ret;
+
+	ret = lsdc_mode_config_init(drm, descp);
+	if (ret)
+		return ret;
+
+	ret = lsdc_modeset_init(lsdc, num_pipe, descp->funcs, loongson_vblank);
+	if (ret)
+		return ret;
+
+	if (loongson_vblank) {
+		ret = drm_vblank_init(drm, num_pipe);
+		if (ret)
+			return ret;
+	}
+
+	ret = devm_request_irq(dev,
+			       pdev->irq,
+			       descp->funcs->irq_handler,
+			       IRQF_SHARED,
+			       dev_name(dev),
+			       drm);
+	if (ret)
+		return ret;
+
+	dev_info(dev, "lsdc irq: %d\n", pdev->irq);
+
+	vga_client_register(pdev, lsdc_vga_set_decode);
+
+	return 0;
+}
+
+static void lsdc_pci_component_unbind(struct device *dev,
+				      struct device *master,
+				      void *data)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	vga_client_unregister(pdev);
+}
+
+const struct component_ops lsdc_pci_component_ops = {
+	.bind = lsdc_pci_component_bind,
+	.unbind = lsdc_pci_component_unbind,
+};
diff --git a/drivers/gpu/drm/loongson/lsdc_crtc.c b/drivers/gpu/drm/loongson/lsdc_crtc.c
index 03958b79f251..76f5269a3efa 100644
--- a/drivers/gpu/drm/loongson/lsdc_crtc.c
+++ b/drivers/gpu/drm/loongson/lsdc_crtc.c
@@ -84,7 +84,7 @@ static void lsdc_crtc0_enable(struct lsdc_crtc *lcrtc)
 	 * something if it happens.
 	 */
 	if (val & CRTC_ANCHORED) {
-		drm_warn(&ldev->base, "%s stall\n", lcrtc->base.name);
+		drm_warn(ldev->drm, "%s stall\n", lcrtc->base.name);
 		return lsdc_crtc0_soft_reset(lcrtc);
 	}
 
@@ -112,7 +112,7 @@ static void lsdc_crtc1_enable(struct lsdc_crtc *lcrtc)
 	 */
 	val = lsdc_rreg32(ldev, LSDC_CRTC1_CFG_REG);
 	if (val & CRTC_ANCHORED) {
-		drm_warn(&ldev->base, "%s stall\n", lcrtc->base.name);
+		drm_warn(ldev->drm, "%s stall\n", lcrtc->base.name);
 		return lsdc_crtc1_soft_reset(lcrtc);
 	}
 
diff --git a/drivers/gpu/drm/loongson/lsdc_debugfs.c b/drivers/gpu/drm/loongson/lsdc_debugfs.c
index b9c2e6b1701f..d0b5e2951c03 100644
--- a/drivers/gpu/drm/loongson/lsdc_debugfs.c
+++ b/drivers/gpu/drm/loongson/lsdc_debugfs.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_debugfs.h>
 
+#include "loongson_drv.h"
 #include "lsdc_benchmark.h"
 #include "lsdc_drv.h"
 #include "lsdc_gem.h"
@@ -16,8 +17,7 @@
 static int lsdc_identify(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct lsdc_device *ldev = (struct lsdc_device *)node->info_ent->data;
-	const struct loongson_gfx_desc *gfx = to_loongson_gfx(ldev->descp);
+	struct loongson_drm *ldrm = (struct loongson_drm *)node->info_ent->data;
 	u8 impl, rev;
 
 	loongson_cpu_get_prid(&impl, &rev);
@@ -25,7 +25,7 @@ static int lsdc_identify(struct seq_file *m, void *arg)
 	seq_printf(m, "Running on cpu 0x%x, cpu revision: 0x%x\n",
 		   impl, rev);
 
-	seq_printf(m, "Contained in: %s\n", gfx->model);
+	seq_printf(m, "Contained in: %s\n", ldrm->gfxinfo->model);
 
 	return 0;
 }
@@ -44,9 +44,9 @@ static int lsdc_show_mm(struct seq_file *m, void *arg)
 static int lsdc_show_gfxpll_clock(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct lsdc_device *ldev = (struct lsdc_device *)node->info_ent->data;
+	struct loongson_drm *ldrm = (struct loongson_drm *)node->info_ent->data;
 	struct drm_printer printer = drm_seq_file_printer(m);
-	struct loongson_gfxpll *gfxpll = ldev->gfxpll;
+	struct loongson_gfxpll *gfxpll = &ldrm->gfxpll;
 
 	gfxpll->funcs->print(gfxpll, &printer, true);
 
@@ -56,31 +56,10 @@ static int lsdc_show_gfxpll_clock(struct seq_file *m, void *arg)
 static int lsdc_show_benchmark(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct lsdc_device *ldev = (struct lsdc_device *)node->info_ent->data;
+	struct drm_device *ddev = node->minor->dev;
 	struct drm_printer printer = drm_seq_file_printer(m);
 
-	lsdc_show_benchmark_copy(ldev, &printer);
-
-	return 0;
-}
-
-static int lsdc_pdev_enable_io_mem(struct seq_file *m, void *arg)
-{
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct lsdc_device *ldev = (struct lsdc_device *)node->info_ent->data;
-	u16 cmd;
-
-	pci_read_config_word(ldev->dc, PCI_COMMAND, &cmd);
-
-	seq_printf(m, "PCI_COMMAND: 0x%x\n", cmd);
-
-	cmd |= PCI_COMMAND_MEMORY | PCI_COMMAND_IO;
-
-	pci_write_config_word(ldev->dc, PCI_COMMAND, cmd);
-
-	pci_read_config_word(ldev->dc, PCI_COMMAND, &cmd);
-
-	seq_printf(m, "PCI_COMMAND: 0x%x\n", cmd);
+	lsdc_show_benchmark_copy(ddev, &printer);
 
 	return 0;
 }
@@ -90,21 +69,20 @@ static struct drm_info_list lsdc_debugfs_list[] = {
 	{ "bos",         lsdc_show_buffer_object, 0, NULL },
 	{ "chips",       lsdc_identify, 0, NULL },
 	{ "clocks",      lsdc_show_gfxpll_clock, 0, NULL },
-	{ "dc_enable",   lsdc_pdev_enable_io_mem, 0, NULL },
 	{ "mm",          lsdc_show_mm, 0, NULL },
 };
 
-void lsdc_debugfs_init(struct drm_minor *minor)
+void loongson_debugfs_init(struct drm_minor *minor)
 {
 	struct drm_device *ddev = minor->dev;
-	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct loongson_drm *ldrm = to_loongson_drm(ddev);
 	unsigned int n = ARRAY_SIZE(lsdc_debugfs_list);
 	unsigned int i;
 
 	for (i = 0; i < n; ++i)
-		lsdc_debugfs_list[i].data = ldev;
+		lsdc_debugfs_list[i].data = ldrm;
 
 	drm_debugfs_create_files(lsdc_debugfs_list, n, minor->debugfs_root, minor);
 
-	lsdc_ttm_debugfs_init(ldev);
+	lsdc_ttm_debugfs_init(ddev);
 }
diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
index adc7344d2f80..6ba9287f8e6d 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.c
+++ b/drivers/gpu/drm/loongson/lsdc_drv.c
@@ -3,265 +3,21 @@
  * Copyright (C) 2023 Loongson Technology Corporation Limited
  */
 
+#include <linux/aperture.h>
+#include <linux/component.h>
 #include <linux/pci.h>
 #include <linux/vgaarb.h>
 
-#include <drm/drm_aperture.h>
-#include <drm/drm_atomic.h>
-#include <drm/drm_atomic_helper.h>
-#include <drm/drm_drv.h>
-#include <drm/drm_fbdev_ttm.h>
-#include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_ioctl.h>
-#include <drm/drm_modeset_helper.h>
-#include <drm/drm_probe_helper.h>
-#include <drm/drm_vblank.h>
-
 #include "loongson_module.h"
+#include "loongson_drv.h"
 #include "lsdc_drv.h"
-#include "lsdc_gem.h"
-#include "lsdc_ttm.h"
-
-#define DRIVER_AUTHOR               "Sui Jingfeng <suijingfeng@loongson.cn>"
-#define DRIVER_NAME                 "loongson"
-#define DRIVER_DESC                 "drm driver for loongson graphics"
-#define DRIVER_DATE                 "20220701"
-#define DRIVER_MAJOR                1
-#define DRIVER_MINOR                0
-#define DRIVER_PATCHLEVEL           0
-
-DEFINE_DRM_GEM_FOPS(lsdc_gem_fops);
-
-static const struct drm_driver lsdc_drm_driver = {
-	.driver_features = DRIVER_MODESET | DRIVER_RENDER | DRIVER_GEM | DRIVER_ATOMIC,
-	.fops = &lsdc_gem_fops,
-
-	.name = DRIVER_NAME,
-	.desc = DRIVER_DESC,
-	.date = DRIVER_DATE,
-	.major = DRIVER_MAJOR,
-	.minor = DRIVER_MINOR,
-	.patchlevel = DRIVER_PATCHLEVEL,
-
-	.debugfs_init = lsdc_debugfs_init,
-	.dumb_create = lsdc_dumb_create,
-	.dumb_map_offset = lsdc_dumb_map_offset,
-	.gem_prime_import_sg_table = lsdc_prime_import_sg_table,
-};
-
-static const struct drm_mode_config_funcs lsdc_mode_config_funcs = {
-	.fb_create = drm_gem_fb_create,
-	.atomic_check = drm_atomic_helper_check,
-	.atomic_commit = drm_atomic_helper_commit,
-};
-
-/* Display related */
-
-static int lsdc_modeset_init(struct lsdc_device *ldev,
-			     unsigned int num_crtc,
-			     const struct lsdc_kms_funcs *funcs,
-			     bool has_vblank)
-{
-	struct drm_device *ddev = &ldev->base;
-	struct lsdc_display_pipe *dispipe;
-	unsigned int i;
-	int ret;
-
-	for (i = 0; i < num_crtc; i++) {
-		dispipe = &ldev->dispipe[i];
-
-		/* We need an index before crtc is initialized */
-		dispipe->index = i;
-
-		ret = funcs->create_i2c(ddev, dispipe, i);
-		if (ret)
-			return ret;
-	}
-
-	for (i = 0; i < num_crtc; i++) {
-		struct i2c_adapter *ddc = NULL;
-
-		dispipe = &ldev->dispipe[i];
-		if (dispipe->li2c)
-			ddc = &dispipe->li2c->adapter;
-
-		ret = funcs->output_init(ddev, dispipe, ddc, i);
-		if (ret)
-			return ret;
-
-		ldev->num_output++;
-	}
-
-	for (i = 0; i < num_crtc; i++) {
-		dispipe = &ldev->dispipe[i];
-
-		ret = funcs->primary_plane_init(ddev, &dispipe->primary.base, i);
-		if (ret)
-			return ret;
-
-		ret = funcs->cursor_plane_init(ddev, &dispipe->cursor.base, i);
-		if (ret)
-			return ret;
-
-		ret = funcs->crtc_init(ddev, &dispipe->crtc.base,
-				       &dispipe->primary.base,
-				       &dispipe->cursor.base,
-				       i, has_vblank);
-		if (ret)
-			return ret;
-	}
-
-	drm_info(ddev, "Total %u outputs\n", ldev->num_output);
-
-	return 0;
-}
-
-static const struct drm_mode_config_helper_funcs lsdc_mode_config_helper_funcs = {
-	.atomic_commit_tail = drm_atomic_helper_commit_tail,
-};
-
-static int lsdc_mode_config_init(struct drm_device *ddev,
-				 const struct lsdc_desc *descp)
-{
-	int ret;
-
-	ret = drmm_mode_config_init(ddev);
-	if (ret)
-		return ret;
-
-	ddev->mode_config.funcs = &lsdc_mode_config_funcs;
-	ddev->mode_config.min_width = 1;
-	ddev->mode_config.min_height = 1;
-	ddev->mode_config.max_width = descp->max_width * LSDC_NUM_CRTC;
-	ddev->mode_config.max_height = descp->max_height * LSDC_NUM_CRTC;
-	ddev->mode_config.preferred_depth = 24;
-	ddev->mode_config.prefer_shadow = 1;
-
-	ddev->mode_config.cursor_width = descp->hw_cursor_h;
-	ddev->mode_config.cursor_height = descp->hw_cursor_h;
-
-	ddev->mode_config.helper_private = &lsdc_mode_config_helper_funcs;
-
-	if (descp->has_vblank_counter)
-		ddev->max_vblank_count = 0xffffffff;
-
-	return ret;
-}
-
-/*
- * The GPU and display controller in the LS7A1000/LS7A2000/LS2K2000 are
- * separated PCIE devices. They are two devices, not one. Bar 2 of the GPU
- * device contains the base address and size of the VRAM, both the GPU and
- * the DC could access the on-board VRAM.
- */
-static int lsdc_get_dedicated_vram(struct lsdc_device *ldev,
-				   struct pci_dev *pdev_dc,
-				   const struct lsdc_desc *descp)
-{
-	struct drm_device *ddev = &ldev->base;
-	struct pci_dev *pdev_gpu;
-	resource_size_t base, size;
-
-	/*
-	 * The GPU has 00:06.0 as its BDF, while the DC has 00:06.1
-	 * This is true for the LS7A1000, LS7A2000 and LS2K2000.
-	 */
-	pdev_gpu = pci_get_domain_bus_and_slot(pci_domain_nr(pdev_dc->bus),
-					       pdev_dc->bus->number,
-					       PCI_DEVFN(6, 0));
-	if (!pdev_gpu) {
-		drm_err(ddev, "No GPU device, then no VRAM\n");
-		return -ENODEV;
-	}
-
-	base = pci_resource_start(pdev_gpu, 2);
-	size = pci_resource_len(pdev_gpu, 2);
-
-	ldev->vram_base = base;
-	ldev->vram_size = size;
-	ldev->gpu = pdev_gpu;
-
-	drm_info(ddev, "Dedicated vram start: 0x%llx, size: %uMiB\n",
-		 (u64)base, (u32)(size >> 20));
-
-	return (size > SZ_1M) ? 0 : -ENODEV;
-}
-
-static struct lsdc_device *
-lsdc_create_device(struct pci_dev *pdev,
-		   const struct lsdc_desc *descp,
-		   const struct drm_driver *driver)
-{
-	struct lsdc_device *ldev;
-	struct drm_device *ddev;
-	int ret;
-
-	ldev = devm_drm_dev_alloc(&pdev->dev, driver, struct lsdc_device, base);
-	if (IS_ERR(ldev))
-		return ldev;
-
-	ldev->dc = pdev;
-	ldev->descp = descp;
-
-	ddev = &ldev->base;
-
-	loongson_gfxpll_create(ddev, &ldev->gfxpll);
-
-	ret = lsdc_get_dedicated_vram(ldev, pdev, descp);
-	if (ret) {
-		drm_err(ddev, "Init VRAM failed: %d\n", ret);
-		return ERR_PTR(ret);
-	}
 
-	ret = drm_aperture_remove_conflicting_framebuffers(ldev->vram_base,
-							   ldev->vram_size,
-							   driver);
-	if (ret) {
-		drm_err(ddev, "Remove firmware framebuffers failed: %d\n", ret);
-		return ERR_PTR(ret);
-	}
-
-	ret = lsdc_ttm_init(ldev);
-	if (ret) {
-		drm_err(ddev, "Memory manager init failed: %d\n", ret);
-		return ERR_PTR(ret);
-	}
-
-	lsdc_gem_init(ddev);
-
-	/* Bar 0 of the DC device contains the MMIO register's base address */
-	ldev->reg_base = pcim_iomap(pdev, 0, 0);
-	if (!ldev->reg_base)
-		return ERR_PTR(-ENODEV);
-
-	spin_lock_init(&ldev->reglock);
-
-	ret = lsdc_mode_config_init(ddev, descp);
-	if (ret)
-		return ERR_PTR(ret);
-
-	ret = lsdc_modeset_init(ldev, descp->num_of_crtc, descp->funcs,
-				loongson_vblank);
-	if (ret)
-		return ERR_PTR(ret);
-
-	drm_mode_config_reset(ddev);
-
-	return ldev;
-}
-
-/* For multiple GPU driver instance co-exixt in the system */
-
-static unsigned int lsdc_vga_set_decode(struct pci_dev *pdev, bool state)
-{
-	return VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
-}
+extern const struct component_ops lsdc_pci_component_ops;
 
 static int lsdc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	const struct lsdc_desc *descp;
-	struct drm_device *ddev;
-	struct lsdc_device *ldev;
+	struct lsdc_device *lsdc;
 	int ret;
 
 	descp = lsdc_device_probe(pdev, ent->driver_data);
@@ -278,137 +34,50 @@ static int lsdc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		return ret;
 
-	dev_info(&pdev->dev, "Found %s, revision: %u",
+	dev_info(&pdev->dev, "Found %s, revision: %u\n",
 		 to_loongson_gfx(descp)->model, pdev->revision);
 
-	ldev = lsdc_create_device(pdev, descp, &lsdc_drm_driver);
-	if (IS_ERR(ldev))
-		return PTR_ERR(ldev);
-
-	ddev = &ldev->base;
-
-	pci_set_drvdata(pdev, ddev);
-
-	vga_client_register(pdev, lsdc_vga_set_decode);
+	lsdc = devm_kzalloc(&pdev->dev, sizeof(*lsdc), GFP_KERNEL);
+	if (!lsdc)
+		return -ENOMEM;
 
-	drm_kms_helper_poll_init(ddev);
-
-	if (loongson_vblank) {
-		ret = drm_vblank_init(ddev, descp->num_of_crtc);
-		if (ret)
-			return ret;
+	/* Bar 0 of the DC device contains the MMIO register's base address */
+	lsdc->reg_base = pcim_iomap(pdev, 0, 0);
+	if (!lsdc->reg_base)
+		return -ENODEV;
 
-		ret = devm_request_irq(&pdev->dev, pdev->irq,
-				       descp->funcs->irq_handler,
-				       IRQF_SHARED,
-				       dev_name(&pdev->dev), ddev);
-		if (ret) {
-			drm_err(ddev, "Failed to register interrupt: %d\n", ret);
-			return ret;
-		}
+	lsdc->descp = descp;
+	spin_lock_init(&lsdc->reglock);
 
-		drm_info(ddev, "registered irq: %u\n", pdev->irq);
-	}
+	pci_set_drvdata(pdev, lsdc);
 
-	ret = drm_dev_register(ddev, 0);
+	ret = lsdc_i2c_preinit(&pdev->dev, descp);
 	if (ret)
 		return ret;
 
-	drm_fbdev_ttm_setup(ddev, 32);
-
-	return 0;
-}
-
-static void lsdc_pci_remove(struct pci_dev *pdev)
-{
-	struct drm_device *ddev = pci_get_drvdata(pdev);
-
-	drm_dev_unregister(ddev);
-	drm_atomic_helper_shutdown(ddev);
-}
-
-static void lsdc_pci_shutdown(struct pci_dev *pdev)
-{
-	drm_atomic_helper_shutdown(pci_get_drvdata(pdev));
-}
-
-static int lsdc_drm_freeze(struct drm_device *ddev)
-{
-	struct lsdc_device *ldev = to_lsdc(ddev);
-	struct lsdc_bo *lbo;
-	int ret;
-
-	/* unpin all of buffers in the VRAM */
-	mutex_lock(&ldev->gem.mutex);
-	list_for_each_entry(lbo, &ldev->gem.objects, list) {
-		struct ttm_buffer_object *tbo = &lbo->tbo;
-		struct ttm_resource *resource = tbo->resource;
-		unsigned int pin_count = tbo->pin_count;
-
-		drm_dbg(ddev, "bo[%p], size: %zuKiB, type: %s, pin count: %u\n",
-			lbo, lsdc_bo_size(lbo) >> 10,
-			lsdc_mem_type_to_str(resource->mem_type), pin_count);
-
-		if (!pin_count)
-			continue;
-
-		if (resource->mem_type == TTM_PL_VRAM) {
-			ret = lsdc_bo_reserve(lbo);
-			if (unlikely(ret)) {
-				drm_err(ddev, "bo reserve failed: %d\n", ret);
-				continue;
-			}
-
-			do {
-				lsdc_bo_unpin(lbo);
-				--pin_count;
-			} while (pin_count);
-
-			lsdc_bo_unreserve(lbo);
-		}
-	}
-	mutex_unlock(&ldev->gem.mutex);
+	ret = component_add(&pdev->dev, &lsdc_pci_component_ops);
+	if (ret)
+		return ret;
 
-	lsdc_bo_evict_vram(ddev);
+	ret = lsdc_output_preinit(&pdev->dev, descp);
+	if (ret)
+		return ret;
 
-	ret = drm_mode_config_helper_suspend(ddev);
-	if (unlikely(ret)) {
-		drm_err(ddev, "Freeze error: %d", ret);
+	ret = loongson_device_preinit(&pdev->dev);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
 
-static int lsdc_drm_resume(struct device *dev)
-{
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct drm_device *ddev = pci_get_drvdata(pdev);
-
-	return drm_mode_config_helper_resume(ddev);
-}
-
-static int lsdc_pm_freeze(struct device *dev)
-{
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct drm_device *ddev = pci_get_drvdata(pdev);
-
-	return lsdc_drm_freeze(ddev);
-}
-
-static int lsdc_pm_thaw(struct device *dev)
+static void lsdc_pci_remove(struct pci_dev *pdev)
 {
-	return lsdc_drm_resume(dev);
+	component_del(&pdev->dev, &lsdc_pci_component_ops);
 }
 
 static int lsdc_pm_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
-	int error;
-
-	error = lsdc_pm_freeze(dev);
-	if (error)
-		return error;
 
 	pci_save_state(pdev);
 	/* Shut down the device */
@@ -429,16 +98,12 @@ static int lsdc_pm_resume(struct device *dev)
 	if (pcim_enable_device(pdev))
 		return -EIO;
 
-	return lsdc_pm_thaw(dev);
+	return 0;
 }
 
 static const struct dev_pm_ops lsdc_pm_ops = {
 	.suspend = lsdc_pm_suspend,
 	.resume = lsdc_pm_resume,
-	.freeze = lsdc_pm_freeze,
-	.thaw = lsdc_pm_thaw,
-	.poweroff = lsdc_pm_freeze,
-	.restore = lsdc_pm_resume,
 };
 
 static const struct pci_device_id lsdc_pciid_list[] = {
@@ -448,11 +113,10 @@ static const struct pci_device_id lsdc_pciid_list[] = {
 };
 
 struct pci_driver lsdc_pci_driver = {
-	.name = DRIVER_NAME,
+	.name = "loongson.lsdc",
 	.id_table = lsdc_pciid_list,
 	.probe = lsdc_pci_probe,
 	.remove = lsdc_pci_remove,
-	.shutdown = lsdc_pci_shutdown,
 	.driver.pm = &lsdc_pm_ops,
 };
 
diff --git a/drivers/gpu/drm/loongson/lsdc_drv.h b/drivers/gpu/drm/loongson/lsdc_drv.h
index fbf2d760ef27..71cd65352f5b 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.h
+++ b/drivers/gpu/drm/loongson/lsdc_drv.h
@@ -14,11 +14,12 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_file.h>
 #include <drm/drm_plane.h>
-#include <drm/ttm/ttm_device.h>
+
+#include "loongson_module.h"
+#include "loongson_drv.h"
 
 #include "lsdc_i2c.h"
 #include "lsdc_irq.h"
-#include "lsdc_gfxpll.h"
 #include "lsdc_output.h"
 #include "lsdc_pixpll.h"
 #include "lsdc_regs.h"
@@ -38,12 +39,6 @@
  * display pipe 1 = crtc1 + dvo1 + encoder1 + connectro1 + cursor1 + primary1
  */
 
-enum loongson_chip_id {
-	CHIP_LS7A1000 = 0,
-	CHIP_LS7A2000 = 1,
-	CHIP_LS_LAST,
-};
-
 const struct lsdc_desc *
 lsdc_device_probe(struct pci_dev *pdev, enum loongson_chip_id chip);
 
@@ -167,47 +162,23 @@ struct lsdc_cursor {
 	struct lsdc_device *ldev;
 };
 
-struct lsdc_output {
-	struct drm_encoder encoder;
-	struct drm_connector connector;
-};
-
-static inline struct lsdc_output *
-connector_to_lsdc_output(struct drm_connector *connector)
-{
-	return container_of(connector, struct lsdc_output, connector);
-}
-
-static inline struct lsdc_output *
-encoder_to_lsdc_output(struct drm_encoder *encoder)
-{
-	return container_of(encoder, struct lsdc_output, encoder);
-}
-
 struct lsdc_display_pipe {
 	struct lsdc_crtc crtc;
 	struct lsdc_primary primary;
 	struct lsdc_cursor cursor;
-	struct lsdc_output output;
-	struct lsdc_i2c *li2c;
+	struct lsdc_output *output;
 	unsigned int index;
 };
 
-static inline struct lsdc_display_pipe *
-output_to_display_pipe(struct lsdc_output *output)
-{
-	return container_of(output, struct lsdc_display_pipe, output);
-}
-
 struct lsdc_kms_funcs {
 	irqreturn_t (*irq_handler)(int irq, void *arg);
 
-	int (*create_i2c)(struct drm_device *ddev,
-			  struct lsdc_display_pipe *dispipe,
-			  unsigned int index);
+	int (*create_i2c)(struct device *parent,
+			  unsigned int index,
+			  struct i2c_adapter **ppadapter);
 
 	int (*output_init)(struct drm_device *ddev,
-			   struct lsdc_display_pipe *dispipe,
+			   struct lsdc_output *output,
 			   struct i2c_adapter *ddc,
 			   unsigned int index);
 
@@ -256,55 +227,31 @@ struct lsdc_crtc_state {
 	struct lsdc_pixpll_parms pparms;
 };
 
-struct lsdc_gem {
-	/* @mutex: protect objects list */
-	struct mutex mutex;
-	struct list_head objects;
-};
-
 struct lsdc_device {
-	struct drm_device base;
-	struct ttm_device bdev;
+	struct drm_device *drm;
 
 	/* @descp: features description of the DC variant */
 	const struct lsdc_desc *descp;
-	struct pci_dev *dc;
-	struct pci_dev *gpu;
-
-	struct loongson_gfxpll *gfxpll;
 
 	/* @reglock: protects concurrent access */
 	spinlock_t reglock;
-
 	void __iomem *reg_base;
-	resource_size_t vram_base;
-	resource_size_t vram_size;
-
-	resource_size_t gtt_base;
-	resource_size_t gtt_size;
 
+	struct i2c_adapter *i2c[LSDC_NUM_CRTC];
 	struct lsdc_display_pipe dispipe[LSDC_NUM_CRTC];
 
-	struct lsdc_gem gem;
-
 	u32 irq_status;
 
-	/* tracking pinned memory */
-	size_t vram_pinned_size;
-	size_t gtt_pinned_size;
-
 	/* @num_output: count the number of active display pipe */
 	unsigned int num_output;
 };
 
-static inline struct lsdc_device *tdev_to_ldev(struct ttm_device *bdev)
+static inline unsigned int
+lsdc_pitch_align_requirement(struct drm_device *drm, unsigned int pitch)
 {
-	return container_of(bdev, struct lsdc_device, bdev);
-}
+	struct lsdc_device *lsdc = to_lsdc(drm);
 
-static inline struct lsdc_device *to_lsdc(struct drm_device *ddev)
-{
-	return container_of(ddev, struct lsdc_device, base);
+	return ALIGN(pitch, lsdc->descp->pitch_align);
 }
 
 static inline struct lsdc_crtc_state *
@@ -313,8 +260,6 @@ to_lsdc_crtc_state(struct drm_crtc_state *base)
 	return container_of(base, struct lsdc_crtc_state, base);
 }
 
-void lsdc_debugfs_init(struct drm_minor *minor);
-
 int ls7a1000_crtc_init(struct drm_device *ddev,
 		       struct drm_crtc *crtc,
 		       struct drm_plane *primary,
diff --git a/drivers/gpu/drm/loongson/lsdc_gem.c b/drivers/gpu/drm/loongson/lsdc_gem.c
index a720d8f53209..723145336384 100644
--- a/drivers/gpu/drm/loongson/lsdc_gem.c
+++ b/drivers/gpu/drm/loongson/lsdc_gem.c
@@ -10,10 +10,29 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_prime.h>
 
+#include "loongson_drv.h"
 #include "lsdc_drv.h"
 #include "lsdc_gem.h"
 #include "lsdc_ttm.h"
 
+void lsdc_gem_list_add_lbo(struct drm_device *ddev, struct lsdc_bo *lbo)
+{
+	struct loongson_gem *lgem = to_loongson_gem(ddev);
+
+	mutex_lock(&lgem->mutex);
+	list_add_tail(&lbo->list, &lgem->objects);
+	mutex_unlock(&lgem->mutex);
+}
+
+void lsdc_gem_list_rm_lbo(struct drm_device *ddev, struct lsdc_bo *lbo)
+{
+	struct loongson_gem *lgem = to_loongson_gem(ddev);
+
+	mutex_lock(&lgem->mutex);
+	list_del(&lbo->list);
+	mutex_unlock(&lgem->mutex);
+}
+
 static int lsdc_gem_prime_pin(struct drm_gem_object *obj)
 {
 	struct lsdc_bo *lbo = gem_to_lsdc_bo(obj);
@@ -144,7 +163,6 @@ struct drm_gem_object *lsdc_gem_object_create(struct drm_device *ddev,
 					      struct sg_table *sg,
 					      struct dma_resv *resv)
 {
-	struct lsdc_device *ldev = to_lsdc(ddev);
 	struct drm_gem_object *gobj;
 	struct lsdc_bo *lbo;
 	int ret;
@@ -164,9 +182,7 @@ struct drm_gem_object *lsdc_gem_object_create(struct drm_device *ddev,
 	gobj->funcs = &lsdc_gem_object_funcs;
 
 	/* tracking the BOs we created */
-	mutex_lock(&ldev->gem.mutex);
-	list_add_tail(&lbo->list, &ldev->gem.objects);
-	mutex_unlock(&ldev->gem.mutex);
+	lsdc_gem_list_add_lbo(ddev, lbo);
 
 	return gobj;
 }
@@ -197,11 +213,10 @@ lsdc_prime_import_sg_table(struct drm_device *ddev,
 	return gobj;
 }
 
-int lsdc_dumb_create(struct drm_file *file, struct drm_device *ddev,
+int lsdc_dumb_create(struct drm_file *file,
+		     struct drm_device *ddev,
 		     struct drm_mode_create_dumb *args)
 {
-	struct lsdc_device *ldev = to_lsdc(ddev);
-	const struct lsdc_desc *descp = ldev->descp;
 	u32 domain = LSDC_GEM_DOMAIN_VRAM;
 	struct drm_gem_object *gobj;
 	size_t size;
@@ -215,13 +230,12 @@ int lsdc_dumb_create(struct drm_file *file, struct drm_device *ddev,
 	if (args->bpp != 32 && args->bpp != 16)
 		return -EINVAL;
 
-	pitch = args->width * args->bpp / 8;
-	pitch = ALIGN(pitch, descp->pitch_align);
+	pitch = lsdc_pitch_align_requirement(ddev, args->width * args->bpp / 8);
 	size = pitch * args->height;
 	size = ALIGN(size, PAGE_SIZE);
 
 	/* Maximum single bo size allowed is the half vram size available */
-	if (size > ldev->vram_size / 2) {
+	if (size > loongson_drm_vram_size(ddev) / 2) {
 		drm_err(ddev, "Requesting(%zuMiB) failed\n", size >> 20);
 		return -ENOMEM;
 	}
@@ -247,7 +261,7 @@ int lsdc_dumb_create(struct drm_file *file, struct drm_device *ddev,
 }
 
 int lsdc_dumb_map_offset(struct drm_file *filp, struct drm_device *ddev,
-			 u32 handle, uint64_t *offset)
+			     u32 handle, uint64_t *offset)
 {
 	struct drm_gem_object *gobj;
 
@@ -264,17 +278,17 @@ int lsdc_dumb_map_offset(struct drm_file *filp, struct drm_device *ddev,
 
 void lsdc_gem_init(struct drm_device *ddev)
 {
-	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct loongson_gem *lgem = to_loongson_gem(ddev);
 
-	mutex_init(&ldev->gem.mutex);
-	INIT_LIST_HEAD(&ldev->gem.objects);
+	mutex_init(&lgem->mutex);
+	INIT_LIST_HEAD(&lgem->objects);
 }
 
 int lsdc_show_buffer_object(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = (struct drm_info_node *)m->private;
 	struct drm_device *ddev = node->minor->dev;
-	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct loongson_drm *ldev = to_loongson_drm(ddev);
 	struct lsdc_bo *lbo;
 	unsigned int i;
 
diff --git a/drivers/gpu/drm/loongson/lsdc_gem.h b/drivers/gpu/drm/loongson/lsdc_gem.h
index 92cbb10e6e13..baf9184cbaaa 100644
--- a/drivers/gpu/drm/loongson/lsdc_gem.h
+++ b/drivers/gpu/drm/loongson/lsdc_gem.h
@@ -6,18 +6,31 @@
 #ifndef __LSDC_GEM_H__
 #define __LSDC_GEM_H__
 
+#include <linux/types.h>
+
 #include <drm/drm_device.h>
 #include <drm/drm_gem.h>
 
+struct loongson_gem {
+	/* @mutex: protect objects list */
+	struct mutex mutex;
+	struct list_head objects;
+};
+
+struct lsdc_bo;
+
+void lsdc_gem_list_add_lbo(struct drm_device *ddev, struct lsdc_bo *lbo);
+void lsdc_gem_list_rm_lbo(struct drm_device *ddev, struct lsdc_bo *lbo);
+
 struct drm_gem_object *
 lsdc_prime_import_sg_table(struct drm_device *ddev,
 			   struct dma_buf_attachment *attach,
 			   struct sg_table *sg);
 
 int lsdc_dumb_map_offset(struct drm_file *file,
-			 struct drm_device *dev,
-			 u32 handle,
-			 uint64_t *offset);
+			     struct drm_device *dev,
+			     u32 handle,
+			     uint64_t *offset);
 
 int lsdc_dumb_create(struct drm_file *file,
 		     struct drm_device *ddev,
diff --git a/drivers/gpu/drm/loongson/lsdc_gfxpll.c b/drivers/gpu/drm/loongson/lsdc_gfxpll.c
index 249c09d703ad..c16ffd20f885 100644
--- a/drivers/gpu/drm/loongson/lsdc_gfxpll.c
+++ b/drivers/gpu/drm/loongson/lsdc_gfxpll.c
@@ -10,6 +10,7 @@
 #include <drm/drm_print.h>
 
 #include "lsdc_drv.h"
+#include "lsdc_gfxpll.h"
 
 /*
  * GFX PLL is the PLL used by DC, GMC and GPU, the structure of the GFX PLL
@@ -143,8 +144,6 @@ static void loongson_gfxpll_fini(struct drm_device *ddev, void *data)
 	struct loongson_gfxpll *this = (struct loongson_gfxpll *)data;
 
 	iounmap(this->mmio);
-
-	kfree(this);
 }
 
 static int loongson_gfxpll_init(struct loongson_gfxpll * const this)
@@ -160,7 +159,7 @@ static int loongson_gfxpll_init(struct loongson_gfxpll * const this)
 
 	this->funcs->print(this, &printer, false);
 
-	return 0;
+	return drmm_add_action_or_reset(this->ddev, loongson_gfxpll_fini, this);
 }
 
 static const struct loongson_gfxpll_funcs lsdc_gmc_gpu_funcs = {
@@ -170,30 +169,16 @@ static const struct loongson_gfxpll_funcs lsdc_gmc_gpu_funcs = {
 	.print = loongson_gfxpll_print,
 };
 
-int loongson_gfxpll_create(struct drm_device *ddev,
-			   struct loongson_gfxpll **ppout)
+int loongson_gfxpll_preinit(struct drm_device *ddev)
 {
-	struct lsdc_device *ldev = to_lsdc(ddev);
-	const struct loongson_gfx_desc *gfx = to_loongson_gfx(ldev->descp);
-	struct loongson_gfxpll *this;
-	int ret;
-
-	this = kzalloc(sizeof(*this), GFP_KERNEL);
-	if (IS_ERR_OR_NULL(this))
-		return -ENOMEM;
+	struct loongson_drm *ldrm = to_loongson_drm(ddev);
+	const struct loongson_gfx_desc *gfx = ldrm->gfxinfo;
+	struct loongson_gfxpll *this = &ldrm->gfxpll;
 
 	this->ddev = ddev;
 	this->reg_size = gfx->gfxpll.reg_size;
 	this->reg_base = gfx->conf_reg_base + gfx->gfxpll.reg_offset;
 	this->funcs = &lsdc_gmc_gpu_funcs;
 
-	ret = this->funcs->init(this);
-	if (unlikely(ret)) {
-		kfree(this);
-		return ret;
-	}
-
-	*ppout = this;
-
-	return drmm_add_action_or_reset(ddev, loongson_gfxpll_fini, this);
+	return this->funcs->init(this);
 }
diff --git a/drivers/gpu/drm/loongson/lsdc_gfxpll.h b/drivers/gpu/drm/loongson/lsdc_gfxpll.h
index 9d59cbfc145d..470e20ec51bf 100644
--- a/drivers/gpu/drm/loongson/lsdc_gfxpll.h
+++ b/drivers/gpu/drm/loongson/lsdc_gfxpll.h
@@ -46,7 +46,6 @@ struct loongson_gfxpll {
 	struct loongson_gfxpll_parms parms;
 };
 
-int loongson_gfxpll_create(struct drm_device *ddev,
-			   struct loongson_gfxpll **ppout);
+int loongson_gfxpll_preinit(struct drm_device *ddev);
 
 #endif
diff --git a/drivers/gpu/drm/loongson/lsdc_i2c.c b/drivers/gpu/drm/loongson/lsdc_i2c.c
index ce90c25536d2..295e16589680 100644
--- a/drivers/gpu/drm/loongson/lsdc_i2c.c
+++ b/drivers/gpu/drm/loongson/lsdc_i2c.c
@@ -6,6 +6,7 @@
 #include <drm/drm_managed.h>
 
 #include "lsdc_drv.h"
+#include "lsdc_i2c.h"
 #include "lsdc_output.h"
 
 /*
@@ -15,7 +16,7 @@
  */
 static void __lsdc_gpio_i2c_set(struct lsdc_i2c * const li2c, int mask, int state)
 {
-	struct lsdc_device *ldev = to_lsdc(li2c->ddev);
+	struct lsdc_device *ldev = li2c->lsdc;
 	unsigned long flags;
 	u8 val;
 
@@ -51,7 +52,7 @@ static void __lsdc_gpio_i2c_set(struct lsdc_i2c * const li2c, int mask, int stat
  */
 static int __lsdc_gpio_i2c_get(struct lsdc_i2c * const li2c, int mask)
 {
-	struct lsdc_device *ldev = to_lsdc(li2c->ddev);
+	struct lsdc_device *ldev = li2c->lsdc;
 	unsigned long flags;
 	u8 val;
 
@@ -98,7 +99,7 @@ static int lsdc_gpio_i2c_get_scl(void *i2c)
 	return __lsdc_gpio_i2c_get(li2c, li2c->scl);
 }
 
-static void lsdc_destroy_i2c(struct drm_device *ddev, void *data)
+static void lsdc_destroy_i2c(void *data)
 {
 	struct lsdc_i2c *li2c = (struct lsdc_i2c *)data;
 
@@ -114,11 +115,10 @@ static void lsdc_destroy_i2c(struct drm_device *ddev, void *data)
  * @reg_base: gpio reg base
  * @index: output channel index, 0 for PIPE0, 1 for PIPE1
  */
-int lsdc_create_i2c_chan(struct drm_device *ddev,
-			 struct lsdc_display_pipe *dispipe,
-			 unsigned int index)
+int lsdc_create_i2c_chan(struct device *parent, unsigned int index,
+			 struct i2c_adapter **ppadapter)
 {
-	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct lsdc_device *ldev = dev_get_drvdata(parent);
 	struct i2c_adapter *adapter;
 	struct lsdc_i2c *li2c;
 	int ret;
@@ -127,8 +127,6 @@ int lsdc_create_i2c_chan(struct drm_device *ddev,
 	if (!li2c)
 		return -ENOMEM;
 
-	dispipe->li2c = li2c;
-
 	if (index == 0) {
 		li2c->sda = 0x01;  /* pin 0 */
 		li2c->scl = 0x02;  /* pin 1 */
@@ -139,7 +137,7 @@ int lsdc_create_i2c_chan(struct drm_device *ddev,
 		return -ENOENT;
 	}
 
-	li2c->ddev = ddev;
+	li2c->lsdc = ldev;
 	li2c->dir_reg = ldev->reg_base + LS7A_DC_GPIO_DIR_REG;
 	li2c->dat_reg = ldev->reg_base + LS7A_DC_GPIO_DAT_REG;
 
@@ -154,7 +152,7 @@ int lsdc_create_i2c_chan(struct drm_device *ddev,
 	adapter = &li2c->adapter;
 	adapter->algo_data = &li2c->bit;
 	adapter->owner = THIS_MODULE;
-	adapter->dev.parent = ddev->dev;
+	adapter->dev.parent = parent;
 	adapter->nr = -1;
 
 	snprintf(adapter->name, sizeof(adapter->name), "lsdc-i2c%u", index);
@@ -167,12 +165,29 @@ int lsdc_create_i2c_chan(struct drm_device *ddev,
 		return ret;
 	}
 
-	ret = drmm_add_action_or_reset(ddev, lsdc_destroy_i2c, li2c);
+	ret = devm_add_action_or_reset(parent, lsdc_destroy_i2c, li2c);
 	if (ret)
 		return ret;
 
-	drm_info(ddev, "%s(sda pin mask=%u, scl pin mask=%u) created\n",
-		 adapter->name, li2c->sda, li2c->scl);
+	*ppadapter = adapter;
+
+	dev_info(parent, "%s(sda pin mask=%u, scl pin mask=%u) created\n",
+		 dev_name(&adapter->dev), li2c->sda, li2c->scl);
+
+	return 0;
+}
+
+int lsdc_i2c_preinit(struct device *parent, const struct lsdc_desc *descp)
+{
+	struct lsdc_device *lsdc = dev_get_drvdata(parent);
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < descp->num_of_crtc; ++i) {
+		ret = descp->funcs->create_i2c(parent, i, &lsdc->i2c[i]);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/loongson/lsdc_i2c.h b/drivers/gpu/drm/loongson/lsdc_i2c.h
index 88cd1a1817a5..20ef1bdfc4a4 100644
--- a/drivers/gpu/drm/loongson/lsdc_i2c.h
+++ b/drivers/gpu/drm/loongson/lsdc_i2c.h
@@ -9,10 +9,13 @@
 #include <linux/i2c.h>
 #include <linux/i2c-algo-bit.h>
 
+struct lsdc_device;
+struct lsdc_desc;
+
 struct lsdc_i2c {
 	struct i2c_adapter adapter;
 	struct i2c_algo_bit_data bit;
-	struct drm_device *ddev;
+	struct lsdc_device *lsdc;
 	void __iomem *dir_reg;
 	void __iomem *dat_reg;
 	/* pin bit mask */
@@ -20,10 +23,9 @@ struct lsdc_i2c {
 	u8 scl;
 };
 
-struct lsdc_display_pipe;
+int lsdc_create_i2c_chan(struct device *parent, unsigned int index,
+			 struct i2c_adapter **ppadapter);
 
-int lsdc_create_i2c_chan(struct drm_device *ddev,
-			 struct lsdc_display_pipe *dispipe,
-			 unsigned int index);
+int lsdc_i2c_preinit(struct device *parent, const struct lsdc_desc *descp);
 
 #endif
diff --git a/drivers/gpu/drm/loongson/lsdc_output.c b/drivers/gpu/drm/loongson/lsdc_output.c
new file mode 100644
index 000000000000..f439f4e493f4
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_output.c
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Authors:
+ *      Sui Jingfeng <sui.jingfeng@linux.dev>
+ */
+
+#include <linux/delay.h>
+#include <linux/component.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "lsdc_drv.h"
+#include "lsdc_output.h"
+
+static struct property_entry ls7a1000_output_port_properties[LSDC_NUM_CRTC][3] = {
+	{
+		PROPERTY_ENTRY_STRING("type", "DVO"),
+		PROPERTY_ENTRY_U32("reg", 0),
+		{ },
+	},
+	{
+		PROPERTY_ENTRY_STRING("type", "DVO"),
+		PROPERTY_ENTRY_U32("reg", 1),
+		{ },
+	},
+};
+
+static struct property_entry ls7a2000_output_port_properties[LSDC_NUM_CRTC][3] = {
+	{
+		PROPERTY_ENTRY_STRING("type", "HDMI-or-VGA"),
+		PROPERTY_ENTRY_U32("reg", 0),
+		{ },
+	},
+	{
+		PROPERTY_ENTRY_STRING("type", "HDMI"),
+		PROPERTY_ENTRY_U32("reg", 1),
+		{ },
+	},
+};
+
+static struct property_entry *
+lsdc_output_get_property_entry(const struct lsdc_desc *descp,
+			       unsigned int index)
+{
+	if (index >= LSDC_NUM_CRTC)
+		return NULL;
+
+	switch (to_loongson_gfx(descp)->chip_id) {
+	case CHIP_LS7A1000:
+		return &ls7a1000_output_port_properties[index][0];
+	case CHIP_LS7A2000:
+		return &ls7a2000_output_port_properties[index][0];
+	default:
+		break;
+	};
+
+	return NULL;
+}
+
+static void lsdc_output_postfini(void *data)
+{
+	struct platform_device *agent = data;
+
+	platform_device_unregister(agent);
+}
+
+int lsdc_output_preinit(struct device *parent, const struct lsdc_desc *descp)
+{
+	unsigned int i;
+
+	for (i = 0; i < descp->num_of_crtc; ++i) {
+		struct platform_device_info devinfo = {};
+		struct platform_device *agent;
+		int ret;
+
+		devinfo.parent = parent;
+		devinfo.name = "loongson.output.agent";
+		devinfo.id = i;
+		devinfo.properties = lsdc_output_get_property_entry(descp, i);
+
+		agent = platform_device_register_full(&devinfo);
+		if (IS_ERR(agent)) {
+			dev_err(parent, "failed to register output agent\n");
+			return PTR_ERR(agent);
+		}
+
+		ret = devm_add_action_or_reset(parent, lsdc_output_postfini, agent);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int lsdc_output_bind(struct device *dev,
+			    struct device *master,
+			    void *data)
+{
+	struct drm_device *drm = data;
+	struct lsdc_device *ldev = dev_get_drvdata(dev->parent);
+	const struct lsdc_kms_funcs *lkmsfun = ldev->descp->funcs;
+	struct lsdc_output *output = dev_get_drvdata(dev);
+	unsigned int pipe = output->pipe;
+	int ret;
+
+	ret = lkmsfun->output_init(drm, output, ldev->i2c[pipe], pipe);
+	if (ret)
+		return ret;
+
+	ldev->dispipe[pipe].output = output;
+	ldev->num_output++;
+
+	return 0;
+}
+
+static void lsdc_output_unbind(struct device *dev,
+			       struct device *master,
+			       void *data)
+{
+	struct lsdc_device *ldev = dev_get_drvdata(dev->parent);
+	struct lsdc_output *output = dev_get_drvdata(dev);
+	unsigned int pipe = output->pipe;
+
+	ldev->dispipe[pipe].output = NULL;
+}
+
+static const struct component_ops lsdc_output_component_ops = {
+	.bind = lsdc_output_bind,
+	.unbind = lsdc_output_unbind,
+};
+
+static void lsdc_output_destroy(void *data)
+{
+	struct lsdc_output *output = (struct lsdc_output *)data;
+
+	kfree(output);
+}
+
+static int lsdc_output_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device *parent = dev->parent;
+	struct lsdc_output *output;
+	const char *type;
+	int ret;
+
+	output = kzalloc(sizeof(*output), GFP_KERNEL);
+	if (!output)
+		return -ENOMEM;
+
+	ret = devm_add_action_or_reset(parent, lsdc_output_destroy, output);
+	if (ret)
+		return ret;
+
+	output->dev = dev;
+	dev_set_drvdata(dev, output);
+
+	ret = device_property_read_u32(dev, "reg", &output->pipe);
+	if (ret)
+		return ret;
+
+	ret = device_property_read_string(dev, "type", &type);
+	if (ret)
+		return ret;
+
+	dev_info(parent, "%s probed, type: %s\n", dev_name(dev), type);
+
+	return component_add(dev, &lsdc_output_component_ops);
+}
+
+static void lsdc_output_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &lsdc_output_component_ops);
+}
+
+struct platform_driver lsdc_output_platform_driver = {
+	.driver = {
+		.name = "loongson.output.agent",
+	},
+	.probe = lsdc_output_probe,
+	.remove_new = lsdc_output_remove,
+};
diff --git a/drivers/gpu/drm/loongson/lsdc_output.h b/drivers/gpu/drm/loongson/lsdc_output.h
index 097789051a1d..c7f0933695af 100644
--- a/drivers/gpu/drm/loongson/lsdc_output.h
+++ b/drivers/gpu/drm/loongson/lsdc_output.h
@@ -6,16 +6,46 @@
 #ifndef __LSDC_OUTPUT_H__
 #define __LSDC_OUTPUT_H__
 
-#include "lsdc_drv.h"
+#include <linux/component.h>
+
+#include <drm/drm_encoder.h>
+#include <drm/drm_connector.h>
+
+struct lsdc_desc;
+
+struct lsdc_output {
+	struct device *dev;
+	struct drm_encoder encoder;
+	struct drm_connector connector;
+	unsigned int pipe;
+};
+
+static inline struct lsdc_output *
+connector_to_lsdc_output(struct drm_connector *connector)
+{
+	return container_of(connector, struct lsdc_output, connector);
+}
+
+static inline struct lsdc_output *
+encoder_to_lsdc_output(struct drm_encoder *encoder)
+{
+	return container_of(encoder, struct lsdc_output, encoder);
+}
 
 int ls7a1000_output_init(struct drm_device *ddev,
-			 struct lsdc_display_pipe *dispipe,
+			 struct lsdc_output *output,
 			 struct i2c_adapter *ddc,
 			 unsigned int index);
 
 int ls7a2000_output_init(struct drm_device *ldev,
-			 struct lsdc_display_pipe *dispipe,
+			 struct lsdc_output *output,
 			 struct i2c_adapter *ddc,
 			 unsigned int index);
 
+int lsdc_output_preinit(struct device *parent,
+			const struct lsdc_desc *descp);
+
+void lsdc_output_match_add(struct device *parent,
+			   struct component_match **matchptr);
+
 #endif
diff --git a/drivers/gpu/drm/loongson/lsdc_output_7a1000.c b/drivers/gpu/drm/loongson/lsdc_output_7a1000.c
index 600ed4fb0884..260712fe452f 100644
--- a/drivers/gpu/drm/loongson/lsdc_output_7a1000.c
+++ b/drivers/gpu/drm/loongson/lsdc_output_7a1000.c
@@ -3,10 +3,13 @@
  * Copyright (C) 2023 Loongson Technology Corporation Limited
  */
 
+#include <linux/property.h>
+
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
 
+#include "loongson_drv.h"
 #include "lsdc_drv.h"
 #include "lsdc_output.h"
 
@@ -101,8 +104,7 @@ static const struct drm_connector_funcs ls7a1000_dpi_connector_funcs = {
 
 static void ls7a1000_pipe0_encoder_reset(struct drm_encoder *encoder)
 {
-	struct drm_device *ddev = encoder->dev;
-	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct lsdc_device *ldev = to_lsdc(encoder->dev);
 
 	/*
 	 * We need this for S3 support, screen will not lightup if don't set
@@ -114,8 +116,7 @@ static void ls7a1000_pipe0_encoder_reset(struct drm_encoder *encoder)
 
 static void ls7a1000_pipe1_encoder_reset(struct drm_encoder *encoder)
 {
-	struct drm_device *ddev = encoder->dev;
-	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct lsdc_device *ldev = to_lsdc(encoder->dev);
 
 	/*
 	 * We need this for S3 support, screen will not lightup if don't set
@@ -139,11 +140,10 @@ static const struct drm_encoder_funcs ls7a1000_encoder_funcs[2] = {
 };
 
 int ls7a1000_output_init(struct drm_device *ddev,
-			 struct lsdc_display_pipe *dispipe,
+			 struct lsdc_output *output,
 			 struct i2c_adapter *ddc,
 			 unsigned int index)
 {
-	struct lsdc_output *output = &dispipe->output;
 	struct drm_encoder *encoder = &output->encoder;
 	struct drm_connector *connector = &output->connector;
 	int ret;
@@ -161,8 +161,6 @@ int ls7a1000_output_init(struct drm_device *ddev,
 	if (ret)
 		return ret;
 
-	drm_info(ddev, "display pipe-%u has a DVO\n", index);
-
 	drm_connector_helper_add(connector, &ls7a1000_dpi_connector_helpers);
 
 	drm_connector_attach_encoder(connector, encoder);
diff --git a/drivers/gpu/drm/loongson/lsdc_output_7a2000.c b/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
index 2bd797a9b9ff..2cb7ffaf8265 100644
--- a/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
+++ b/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
@@ -10,6 +10,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
 
+#include "loongson_drv.h"
 #include "lsdc_drv.h"
 #include "lsdc_output.h"
 
@@ -283,8 +284,7 @@ static int ls7a2000_hdmi_set_avi_infoframe(struct drm_encoder *encoder,
 					   struct drm_display_mode *mode)
 {
 	struct lsdc_output *output = encoder_to_lsdc_output(encoder);
-	struct lsdc_display_pipe *dispipe = output_to_display_pipe(output);
-	unsigned int index = dispipe->index;
+	unsigned int index = output->pipe;
 	struct drm_device *ddev = encoder->dev;
 	struct lsdc_device *ldev = to_lsdc(ddev);
 	struct hdmi_avi_infoframe infoframe;
@@ -334,8 +334,7 @@ static void ls7a2000_hdmi_atomic_disable(struct drm_encoder *encoder,
 					 struct drm_atomic_state *state)
 {
 	struct lsdc_output *output = encoder_to_lsdc_output(encoder);
-	struct lsdc_display_pipe *dispipe = output_to_display_pipe(output);
-	unsigned int index = dispipe->index;
+	unsigned int index = output->pipe;
 	struct drm_device *ddev = encoder->dev;
 	struct lsdc_device *ldev = to_lsdc(ddev);
 	u32 val;
@@ -359,8 +358,7 @@ static void ls7a2000_hdmi_atomic_enable(struct drm_encoder *encoder,
 	struct drm_device *ddev = encoder->dev;
 	struct lsdc_device *ldev = to_lsdc(ddev);
 	struct lsdc_output *output = encoder_to_lsdc_output(encoder);
-	struct lsdc_display_pipe *dispipe = output_to_display_pipe(output);
-	unsigned int index = dispipe->index;
+	unsigned int index = output->pipe;
 	u32 val;
 
 	/* datasheet say it should larger than 48 */
@@ -414,7 +412,7 @@ static void ls7a2000_hdmi_phy_pll_config(struct lsdc_device *ldev,
 					 int fin,
 					 unsigned int index)
 {
-	struct drm_device *ddev = &ldev->base;
+	struct drm_device *ddev = ldev->drm;
 	int count = 0;
 	u32 val;
 
@@ -481,8 +479,7 @@ static void ls7a2000_hdmi_atomic_mode_set(struct drm_encoder *encoder,
 					  struct drm_connector_state *conn_state)
 {
 	struct lsdc_output *output = encoder_to_lsdc_output(encoder);
-	struct lsdc_display_pipe *dispipe = output_to_display_pipe(output);
-	unsigned int index = dispipe->index;
+	unsigned int index = output->pipe;
 	struct drm_device *ddev = encoder->dev;
 	struct lsdc_device *ldev = to_lsdc(ddev);
 	struct drm_display_mode *mode = &crtc_state->mode;
@@ -511,11 +508,10 @@ static const struct drm_encoder_helper_funcs ls7a2000_encoder_helper_funcs = {
  * writing hdmi register do no harms.
  */
 int ls7a2000_output_init(struct drm_device *ddev,
-			 struct lsdc_display_pipe *dispipe,
+			 struct lsdc_output *output,
 			 struct i2c_adapter *ddc,
 			 unsigned int pipe)
 {
-	struct lsdc_output *output = &dispipe->output;
 	struct drm_encoder *encoder = &output->encoder;
 	struct drm_connector *connector = &output->connector;
 	int ret;
@@ -535,8 +531,6 @@ int ls7a2000_output_init(struct drm_device *ddev,
 	if (ret)
 		return ret;
 
-	drm_info(ddev, "display pipe-%u has HDMI %s\n", pipe, pipe ? "" : "and/or VGA");
-
 	drm_connector_helper_add(connector, &ls7a2000_connector_helpers);
 
 	drm_connector_attach_encoder(connector, encoder);
diff --git a/drivers/gpu/drm/loongson/lsdc_plane.c b/drivers/gpu/drm/loongson/lsdc_plane.c
index d227a2c1dcf1..c25e13184107 100644
--- a/drivers/gpu/drm/loongson/lsdc_plane.c
+++ b/drivers/gpu/drm/loongson/lsdc_plane.c
@@ -10,6 +10,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 
+#include "loongson_drv.h"
 #include "lsdc_drv.h"
 #include "lsdc_regs.h"
 #include "lsdc_ttm.h"
@@ -40,10 +41,9 @@ static unsigned int lsdc_get_fb_offset(struct drm_framebuffer *fb,
 
 static u64 lsdc_fb_base_addr(struct drm_framebuffer *fb)
 {
-	struct lsdc_device *ldev = to_lsdc(fb->dev);
 	struct lsdc_bo *lbo = gem_to_lsdc_bo(fb->obj[0]);
 
-	return lsdc_bo_gpu_offset(lbo) + ldev->vram_base;
+	return lsdc_bo_gpu_offset(lbo) + loongson_drm_vram_base(fb->dev);
 }
 
 static int lsdc_primary_atomic_check(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongson/lsdc_ttm.c
index 465f622ac05d..248dd01e8f8c 100644
--- a/drivers/gpu/drm/loongson/lsdc_ttm.c
+++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
@@ -9,6 +9,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_prime.h>
 
+#include "loongson_drv.h"
 #include "lsdc_drv.h"
 #include "lsdc_ttm.h"
 
@@ -219,7 +220,7 @@ static int lsdc_bo_move(struct ttm_buffer_object *tbo,
 static int lsdc_bo_reserve_io_mem(struct ttm_device *bdev,
 				  struct ttm_resource *mem)
 {
-	struct lsdc_device *ldev = tdev_to_ldev(bdev);
+	struct loongson_drm *ldrm = tdev_to_ldrm(bdev);
 
 	switch (mem->mem_type) {
 	case TTM_PL_SYSTEM:
@@ -227,7 +228,7 @@ static int lsdc_bo_reserve_io_mem(struct ttm_device *bdev,
 	case TTM_PL_TT:
 		break;
 	case TTM_PL_VRAM:
-		mem->bus.offset = (mem->start << PAGE_SHIFT) + ldev->vram_base;
+		mem->bus.offset = (mem->start << PAGE_SHIFT) + ldrm->vram_base;
 		mem->bus.is_iomem = true;
 		mem->bus.caching = ttm_write_combined;
 		break;
@@ -287,7 +288,7 @@ int lsdc_bo_pin(struct lsdc_bo *lbo, u32 domain, u64 *gpu_addr)
 {
 	struct ttm_operation_ctx ctx = { false, false };
 	struct ttm_buffer_object *tbo = &lbo->tbo;
-	struct lsdc_device *ldev = tdev_to_ldev(tbo->bdev);
+	struct loongson_drm *ldrm = tdev_to_ldrm(tbo->bdev);
 	int ret;
 
 	if (tbo->pin_count)
@@ -301,14 +302,14 @@ int lsdc_bo_pin(struct lsdc_bo *lbo, u32 domain, u64 *gpu_addr)
 
 	ret = ttm_bo_validate(tbo, &lbo->placement, &ctx);
 	if (unlikely(ret)) {
-		drm_err(&ldev->base, "%p validate failed: %d\n", lbo, ret);
+		drm_err(&ldrm->ddev, "%p validate failed: %d\n", lbo, ret);
 		return ret;
 	}
 
 	if (domain == LSDC_GEM_DOMAIN_VRAM)
-		ldev->vram_pinned_size += lsdc_bo_size(lbo);
+		ldrm->vram_pinned_size += lsdc_bo_size(lbo);
 	else if (domain == LSDC_GEM_DOMAIN_GTT)
-		ldev->gtt_pinned_size += lsdc_bo_size(lbo);
+		ldrm->gtt_pinned_size += lsdc_bo_size(lbo);
 
 bo_pinned:
 	ttm_bo_pin(tbo);
@@ -322,10 +323,10 @@ int lsdc_bo_pin(struct lsdc_bo *lbo, u32 domain, u64 *gpu_addr)
 void lsdc_bo_unpin(struct lsdc_bo *lbo)
 {
 	struct ttm_buffer_object *tbo = &lbo->tbo;
-	struct lsdc_device *ldev = tdev_to_ldev(tbo->bdev);
+	struct loongson_drm *ldrm = tdev_to_ldrm(tbo->bdev);
 
 	if (unlikely(!tbo->pin_count)) {
-		drm_dbg(&ldev->base, "%p unpin is not necessary\n", lbo);
+		drm_dbg(&ldrm->ddev, "%p unpin is not necessary\n", lbo);
 		return;
 	}
 
@@ -333,9 +334,9 @@ void lsdc_bo_unpin(struct lsdc_bo *lbo)
 
 	if (!tbo->pin_count) {
 		if (tbo->resource->mem_type == TTM_PL_VRAM)
-			ldev->vram_pinned_size -= lsdc_bo_size(lbo);
+			ldrm->vram_pinned_size -= lsdc_bo_size(lbo);
 		else if (tbo->resource->mem_type == TTM_PL_TT)
-			ldev->gtt_pinned_size -= lsdc_bo_size(lbo);
+			ldrm->gtt_pinned_size -= lsdc_bo_size(lbo);
 	}
 }
 
@@ -405,27 +406,25 @@ void lsdc_bo_clear(struct lsdc_bo *lbo)
 
 int lsdc_bo_evict_vram(struct drm_device *ddev)
 {
-	struct lsdc_device *ldev = to_lsdc(ddev);
-	struct ttm_device *bdev = &ldev->bdev;
+	struct loongson_drm *ldrm = to_loongson_drm(ddev);
+	struct ttm_device *tdev = &ldrm->bdev;
 	struct ttm_resource_manager *man;
 
-	man = ttm_manager_type(bdev, TTM_PL_VRAM);
+	man = ttm_manager_type(tdev, TTM_PL_VRAM);
 	if (unlikely(!man))
 		return 0;
 
-	return ttm_resource_manager_evict_all(bdev, man);
+	return ttm_resource_manager_evict_all(tdev, man);
 }
 
 static void lsdc_bo_destroy(struct ttm_buffer_object *tbo)
 {
-	struct lsdc_device *ldev = tdev_to_ldev(tbo->bdev);
+	struct drm_gem_object *gobj = &tbo->base;
 	struct lsdc_bo *lbo = to_lsdc_bo(tbo);
 
-	mutex_lock(&ldev->gem.mutex);
-	list_del_init(&lbo->list);
-	mutex_unlock(&ldev->gem.mutex);
+	lsdc_gem_list_rm_lbo(gobj->dev, lbo);
 
-	drm_gem_object_release(&tbo->base);
+	drm_gem_object_release(gobj);
 
 	kfree(lbo);
 }
@@ -437,8 +436,8 @@ struct lsdc_bo *lsdc_bo_create(struct drm_device *ddev,
 			       struct sg_table *sg,
 			       struct dma_resv *resv)
 {
-	struct lsdc_device *ldev = to_lsdc(ddev);
-	struct ttm_device *bdev = &ldev->bdev;
+	struct loongson_drm *ldrm = to_loongson_drm(ddev);
+	struct ttm_device *tdev = &ldrm->bdev;
 	struct ttm_buffer_object *tbo;
 	struct lsdc_bo *lbo;
 	enum ttm_bo_type bo_type;
@@ -464,7 +463,7 @@ struct lsdc_bo *lsdc_bo_create(struct drm_device *ddev,
 		return ERR_PTR(ret);
 	}
 
-	tbo->bdev = bdev;
+	tbo->bdev = tdev;
 
 	if (kernel)
 		bo_type = ttm_bo_type_kernel;
@@ -476,7 +475,7 @@ struct lsdc_bo *lsdc_bo_create(struct drm_device *ddev,
 	lsdc_bo_set_placement(lbo, domain);
 	lbo->size = size;
 
-	ret = ttm_bo_init_validate(bdev, tbo, bo_type, &lbo->placement, 0,
+	ret = ttm_bo_init_validate(tdev, tbo, bo_type, &lbo->placement, 0,
 				   false, sg, resv, lsdc_bo_destroy);
 	if (ret) {
 		kfree(lbo);
@@ -529,62 +528,65 @@ void lsdc_bo_free_kernel_pinned(struct lsdc_bo *lbo)
 
 static void lsdc_ttm_fini(struct drm_device *ddev, void *data)
 {
-	struct lsdc_device *ldev = (struct lsdc_device *)data;
+	struct loongson_drm *ldrm = data;
+	struct ttm_device *bdev = &ldrm->bdev;
 
-	ttm_range_man_fini(&ldev->bdev, TTM_PL_VRAM);
-	ttm_range_man_fini(&ldev->bdev, TTM_PL_TT);
+	ttm_range_man_fini(bdev, TTM_PL_VRAM);
+	ttm_range_man_fini(bdev, TTM_PL_TT);
 
-	ttm_device_fini(&ldev->bdev);
+	ttm_device_fini(bdev);
 
 	drm_dbg(ddev, "ttm finished\n");
 }
 
-int lsdc_ttm_init(struct lsdc_device *ldev)
+int lsdc_ttm_init(struct drm_device *ddev)
 {
-	struct drm_device *ddev = &ldev->base;
+	struct loongson_drm *ldrm = to_loongson_drm(ddev);
+	struct ttm_device *tdev = &ldrm->bdev;
 	unsigned long num_vram_pages;
 	unsigned long num_gtt_pages;
 	int ret;
 
-	ret = ttm_device_init(&ldev->bdev, &lsdc_bo_driver, ddev->dev,
+	ret = ttm_device_init(tdev, &lsdc_bo_driver, ddev->dev,
 			      ddev->anon_inode->i_mapping,
 			      ddev->vma_offset_manager, false, true);
 	if (ret)
 		return ret;
 
-	num_vram_pages = ldev->vram_size >> PAGE_SHIFT;
+	num_vram_pages = ldrm->vram_size >> PAGE_SHIFT;
 
-	ret = ttm_range_man_init(&ldev->bdev, TTM_PL_VRAM, false, num_vram_pages);
+	ret = ttm_range_man_init(tdev, TTM_PL_VRAM, false, num_vram_pages);
 	if (unlikely(ret))
 		return ret;
 
 	drm_info(ddev, "VRAM: %lu pages ready\n", num_vram_pages);
 
 	/* 512M is far enough for us now */
-	ldev->gtt_size = 512 << 20;
+	ldrm->gtt_size = 512 << 20;
 
-	num_gtt_pages = ldev->gtt_size >> PAGE_SHIFT;
+	num_gtt_pages = ldrm->gtt_size >> PAGE_SHIFT;
 
-	ret = ttm_range_man_init(&ldev->bdev, TTM_PL_TT, true, num_gtt_pages);
+	ret = ttm_range_man_init(tdev, TTM_PL_TT, true, num_gtt_pages);
 	if (unlikely(ret))
 		return ret;
 
 	drm_info(ddev, "GTT: %lu pages ready\n", num_gtt_pages);
 
-	return drmm_add_action_or_reset(ddev, lsdc_ttm_fini, ldev);
+	return drmm_add_action_or_reset(ddev, lsdc_ttm_fini, ldrm);
 }
 
-void lsdc_ttm_debugfs_init(struct lsdc_device *ldev)
+void lsdc_ttm_debugfs_init(struct drm_device *ddev)
 {
-	struct ttm_device *bdev = &ldev->bdev;
-	struct drm_device *ddev = &ldev->base;
+	struct loongson_drm *ldrm = to_loongson_drm(ddev);
+	struct ttm_device *tdev = &ldrm->bdev;
+
 	struct drm_minor *minor = ddev->primary;
 	struct dentry *root = minor->debugfs_root;
 	struct ttm_resource_manager *vram_man;
 	struct ttm_resource_manager *gtt_man;
 
-	vram_man = ttm_manager_type(bdev, TTM_PL_VRAM);
-	gtt_man = ttm_manager_type(bdev, TTM_PL_TT);
+	vram_man = ttm_manager_type(tdev, TTM_PL_VRAM);
+	gtt_man = ttm_manager_type(tdev, TTM_PL_TT);
 
 	ttm_resource_manager_create_debugfs(vram_man, root, "vram_mm");
 	ttm_resource_manager_create_debugfs(gtt_man, root, "gtt_mm");
diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.h b/drivers/gpu/drm/loongson/lsdc_ttm.h
index 843e1475064e..2825cec82172 100644
--- a/drivers/gpu/drm/loongson/lsdc_ttm.h
+++ b/drivers/gpu/drm/loongson/lsdc_ttm.h
@@ -93,7 +93,7 @@ void lsdc_bo_clear(struct lsdc_bo *lbo);
 
 int lsdc_bo_evict_vram(struct drm_device *ddev);
 
-int lsdc_ttm_init(struct lsdc_device *ldev);
-void lsdc_ttm_debugfs_init(struct lsdc_device *ldev);
+int lsdc_ttm_init(struct drm_device *ddev);
+void lsdc_ttm_debugfs_init(struct drm_device *ddev);
 
 #endif
-- 
2.43.0

