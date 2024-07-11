Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6772192EE1D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 19:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7916810EADB;
	Thu, 11 Jul 2024 17:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="bDIN2MpK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com
 [95.215.58.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E79E10E025
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 17:55:34 +0000 (UTC)
X-Envelope-To: mripard@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1720720532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2zjtF7hdlVTSTJjmI17thydLodaQQO05xyo5+5Uchd0=;
 b=bDIN2MpKJ7IX9IDSywQJnq12e2e2tnTMCVLmSHkhi04IxLjQqG3c8Uu74vDZduMFCLqPak
 348PS4D1eXSJasR42+dTm1jTkiO1Y643VRahoqIpdvd1OwuaoqK1rz5Vth1bQX1VjCAuGb
 nPTWSwhHu8rad91Ov5XWZnKK+K8+YN0=
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: sui.jingfeng@linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v3 1/1] drm/loongson: Introduce component framework support
Date: Fri, 12 Jul 2024 01:55:23 +0800
Message-ID: <20240711175523.538457-2-sui.jingfeng@linux.dev>
In-Reply-To: <20240711175523.538457-1-sui.jingfeng@linux.dev>
References: <20240711175523.538457-1-sui.jingfeng@linux.dev>
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
KMS drivers who has a dependency on external modules will suffer from
the deferral probe problem of those modules. The problem is that the
DRM driver has to tear down everything when it receives '-EPROBE_DEFER',
even though the independent part of the entire driver is not very closely
related.

For Loongson Graphics, the GPU and the display controller are two distinct
PCIe devices. Despite hardware units that come along with PCIe are actually
all ready to be driven, DRM driver still need to wait all of its dependency
ready before it can register the service to userspace.

The idea is to migrate(offload) the dependency to submodule, creating
submodule by creating platform device manually. Such submodules are
functional as agents, which will be responsible for attaching needed
external modules for the main body of entire KMS drive. It's also for
better modularity, as output hardware units are relatively standalone
IPs.

Add dummy GPU driver as a subcomponent, use the component framework to
bind those scatter software/hardware entities into one. Move DRM-related
codes into the loongson_drm_master_bind() function. Move output-related
things into the submodule, since the encoder/connector/ transcoder are
sometimes depend on external module. The display controller and GPIO-I2Cs
go with the PCIe master, as they have no dependency on external modules.

Make lsdc PCI driver as a subcomponent as well, creating a platform device
as proxy. The proxy will responsible attach the common drm routines to our
hardware, which keep the whole drm driver balanced (and fair) enough for
both the DC and GPU.

The lsdc PCI device is the haidden(implicit) parent, while the proxy is
the explicit master, which deal with drm related affairs for its parent.
The master won't bound until all submodules are ready, submodules are
responsible to return '-EPROBE_DEFER' back to the driver core if it needs
to do so.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/loongson/Makefile             |   5 +
 drivers/gpu/drm/loongson/loonggpu_pci_drv.c   | 156 ++++++++++++
 drivers/gpu/drm/loongson/loonggpu_pci_drv.h   |  33 +++
 drivers/gpu/drm/loongson/loongson_device.c    |   1 +
 drivers/gpu/drm/loongson/loongson_drv.c       | 157 ++++++++++++
 drivers/gpu/drm/loongson/loongson_module.c    |  38 ++-
 drivers/gpu/drm/loongson/loongson_module.h    |  17 ++
 drivers/gpu/drm/loongson/lsdc_drv.c           | 235 ++++++++----------
 drivers/gpu/drm/loongson/lsdc_drv.h           |  56 ++---
 drivers/gpu/drm/loongson/lsdc_i2c.c           |  43 ++--
 drivers/gpu/drm/loongson/lsdc_i2c.h           |  11 +-
 drivers/gpu/drm/loongson/lsdc_irq.c           |  21 +-
 drivers/gpu/drm/loongson/lsdc_output.c        | 208 ++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_output.h        |  36 ++-
 drivers/gpu/drm/loongson/lsdc_output_7a1000.c |   7 +-
 drivers/gpu/drm/loongson/lsdc_output_7a2000.c |  17 +-
 drivers/gpu/drm/loongson/lsdc_ttm.c           |   4 +-
 drivers/gpu/drm/loongson/lsdc_ttm.h           |   2 +-
 18 files changed, 832 insertions(+), 215 deletions(-)
 create mode 100644 drivers/gpu/drm/loongson/loonggpu_pci_drv.c
 create mode 100644 drivers/gpu/drm/loongson/loonggpu_pci_drv.h
 create mode 100644 drivers/gpu/drm/loongson/loongson_drv.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output.c

diff --git a/drivers/gpu/drm/loongson/Makefile b/drivers/gpu/drm/loongson/Makefile
index 91e72bd900c1..cdc60ec975e4 100644
--- a/drivers/gpu/drm/loongson/Makefile
+++ b/drivers/gpu/drm/loongson/Makefile
@@ -9,6 +9,7 @@ loongson-y := \
 	lsdc_gfxpll.o \
 	lsdc_i2c.o \
 	lsdc_irq.o \
+	lsdc_output.o \
 	lsdc_output_7a1000.o \
 	lsdc_output_7a2000.o \
 	lsdc_plane.o \
@@ -16,7 +17,11 @@ loongson-y := \
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
index 000000000000..a34c213171e0
--- /dev/null
+++ b/drivers/gpu/drm/loongson/loonggpu_pci_drv.c
@@ -0,0 +1,156 @@
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
+	drm_info(gpu->drm, "LoongGPU interrupted\n");
+
+	return IRQ_HANDLED;
+}
+
+static int loonggpu_component_bind(struct device *dev,
+				   struct device *master,
+				   void *data)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct drm_device *drm = data;
+	struct loonggpu_device *gpu;
+	int ret;
+
+	gpu = devm_kzalloc(dev, sizeof(*gpu), GFP_KERNEL);
+	if (!gpu)
+		return -ENOMEM;
+
+	gpu->reg_base = pcim_iomap(pdev, 0, 0);
+	if (!gpu->reg_base)
+		return -ENOMEM;
+
+	gpu->pdev = pdev;
+	gpu->drm = drm;
+
+	loonggpu_get_version(gpu);
+
+	dev_set_drvdata(dev, gpu);
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
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct loonggpu_device *gpu = dev_get_drvdata(dev);
+
+	if (gpu) {
+		pcim_iounmap(pdev, gpu->reg_base);
+		devm_kfree(dev, gpu);
+	}
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
+	int ret;
+
+	ret = pcim_enable_device(pdev);
+	if (ret)
+		return ret;
+
+	pci_set_master(pdev);
+
+	dev_info(&pdev->dev, "LoongGPU PCI driver probed\n");
+
+	return component_add(&pdev->dev, &loonggpu_component_ops);
+}
+
+static void loonggpu_pci_remove(struct pci_dev *pdev)
+{
+	component_del(&pdev->dev, &loonggpu_component_ops);
+}
+
+static const struct pci_device_id loonggpu_pci_id_list[] = {
+	{PCI_VDEVICE(LOONGSON, 0x7a25), CHIP_LS7A2000},
+	{ },
+};
+
+struct pci_driver loonggpu_pci_driver = {
+	.name = "LoongGPU",
+	.id_table = loonggpu_pci_id_list,
+	.probe = loonggpu_pci_probe,
+	.remove = loonggpu_pci_remove,
+};
+
+void loonggpu_pci_match_add(struct device *master,
+			    struct component_match **matchptr)
+{
+	struct pci_dev *gpu;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(loonggpu_pci_id_list); ++i) {
+		unsigned int did = loonggpu_pci_id_list[i].device;
+
+		gpu = pci_get_device(PCI_VENDOR_ID_LOONGSON, did, NULL);
+		if (gpu) {
+			component_match_add(master, matchptr,
+					    component_compare_dev, &gpu->dev);
+			pci_dev_put(gpu);
+
+			dev_dbg(master, "match added, name: %s, %u\n",
+				dev_name(&gpu->dev), i);
+			return;
+		}
+	}
+}
+
+MODULE_DEVICE_TABLE(pci, loonggpu_pci_id_list);
diff --git a/drivers/gpu/drm/loongson/loonggpu_pci_drv.h b/drivers/gpu/drm/loongson/loonggpu_pci_drv.h
new file mode 100644
index 000000000000..35b176ff01d0
--- /dev/null
+++ b/drivers/gpu/drm/loongson/loonggpu_pci_drv.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
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
+void loonggpu_pci_match_add(struct device *master,
+			    struct component_match **matchptr);
+
+#endif
diff --git a/drivers/gpu/drm/loongson/loongson_device.c b/drivers/gpu/drm/loongson/loongson_device.c
index 9986c8a2a255..f0e3d6544291 100644
--- a/drivers/gpu/drm/loongson/loongson_device.c
+++ b/drivers/gpu/drm/loongson/loongson_device.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/pci.h>
+#include <linux/platform_device.h>
 
 #include "lsdc_drv.h"
 
diff --git a/drivers/gpu/drm/loongson/loongson_drv.c b/drivers/gpu/drm/loongson/loongson_drv.c
new file mode 100644
index 000000000000..b5273bbf03e6
--- /dev/null
+++ b/drivers/gpu/drm/loongson/loongson_drv.c
@@ -0,0 +1,157 @@
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
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
+
+#include "loonggpu_pci_drv.h"
+#include "loongson_module.h"
+#include "lsdc_drv.h"
+#include "lsdc_gem.h"
+#include "lsdc_output.h"
+#include "lsdc_ttm.h"
+
+static struct platform_device *loongson_dev;
+
+static void loongson_device_postfini(void *data)
+{
+	struct platform_device *proxy = data;
+
+	platform_device_unregister(proxy);
+}
+
+int loongson_device_preinit(struct device *parent, void *data)
+{
+	struct platform_device *proxy;
+	int ret;
+
+	proxy = platform_device_register_resndata(parent,
+						  DRIVER_NAME,
+						  PLATFORM_DEVID_NONE,
+						  NULL, 0,
+						  data, sizeof(void *));
+	if (IS_ERR(proxy)) {
+		dev_err(parent, "failed to register loongson proxy device\n");
+		return PTR_ERR(proxy);
+	}
+
+	ret = devm_add_action_or_reset(parent, loongson_device_postfini, proxy);
+	if (ret)
+		return ret;
+
+	loongson_dev = proxy;
+
+	return 0;
+}
+
+static int loongson_drm_master_bind(struct device *dev)
+{
+	struct drm_device *ddev = dev_get_drvdata(dev->parent);
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	const struct lsdc_desc *descp = ldev->descp;
+	int num_pipe = descp->num_of_crtc;
+	int ret;
+
+	loongson_gfxpll_create(&ldev->base, &ldev->gfxpll);
+
+	ret = lsdc_mode_config_init(ddev, descp);
+	if (ret)
+		return ret;
+
+	ret = component_bind_all(dev, ddev);
+	if (ret) {
+		dev_err(dev, "master bind all failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = lsdc_modeset_init(ldev, num_pipe, descp->funcs, loongson_vblank);
+	if (ret)
+		return ret;
+
+	if (loongson_vblank) {
+		ret = drm_vblank_init(ddev, num_pipe);
+		if (ret)
+			return ret;
+	}
+
+	lsdc_gem_init(ddev);
+
+	ret = lsdc_ttm_init(ddev);
+	if (ret) {
+		drm_err(ddev, "Memory manager init failed: %d\n", ret);
+		return ret;
+	}
+
+	drm_mode_config_reset(ddev);
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
+	struct drm_device *ddev = dev_get_drvdata(dev->parent);
+
+	drm_atomic_helper_shutdown(ddev);
+
+	component_unbind_all(dev, ddev);
+}
+
+static const struct component_master_ops loongson_drm_master_ops = {
+	.bind = loongson_drm_master_bind,
+	.unbind = loongson_drm_master_unbind,
+};
+
+static int loongson_drm_driver_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct drm_device *ddev = *(void **)dev->platform_data;
+	struct component_match *matches = NULL;
+
+	dev_set_drvdata(dev, ddev);
+
+	lsdc_output_match_add(dev, &matches);
+
+	lsdc_pci_match_add(dev, &matches);
+
+	loonggpu_pci_match_add(dev, &matches);
+
+	return component_master_add_with_match(dev,
+					       &loongson_drm_master_ops,
+					       matches);
+}
+
+static void loongson_drm_driver_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	component_master_del(dev, &loongson_drm_master_ops);
+}
+
+struct platform_driver loongson_drm_platform_driver = {
+	.probe = loongson_drm_driver_probe,
+	.remove_new = loongson_drm_driver_remove,
+	.driver = {
+		.name = DRIVER_NAME,
+	},
+};
diff --git a/drivers/gpu/drm/loongson/loongson_module.c b/drivers/gpu/drm/loongson/loongson_module.c
index d2a51bd395f6..836b6a40a9f1 100644
--- a/drivers/gpu/drm/loongson/loongson_module.c
+++ b/drivers/gpu/drm/loongson/loongson_module.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/pci.h>
+#include <linux/platform_device.h>
 
 #include <video/nomodeset.h>
 
@@ -19,15 +20,50 @@ module_param_named(vblank, loongson_vblank, int, 0400);
 
 static int __init loongson_module_init(void)
 {
+	int ret;
+
 	if (!loongson_modeset || video_firmware_drivers_only())
 		return -ENODEV;
 
-	return pci_register_driver(&lsdc_pci_driver);
+	ret = pci_register_driver(&lsdc_pci_driver);
+	if (ret)
+		return ret;
+
+	ret = pci_register_driver(&loonggpu_pci_driver);
+	if (ret)
+		goto unregister_lsdc_pci_driver;
+
+	ret = platform_driver_register(&loongson_drm_platform_driver);
+	if (ret)
+		goto unregister_loonggpu_pci_driver;
+
+	ret = platform_driver_register(&lsdc_output_platform_driver);
+	if (ret)
+		goto unregister_loongson_drm_platform_driver;
+
+	return 0;
+
+unregister_loongson_drm_platform_driver:
+	platform_driver_unregister(&loongson_drm_platform_driver);
+
+unregister_loonggpu_pci_driver:
+	pci_unregister_driver(&loonggpu_pci_driver);
+
+unregister_lsdc_pci_driver:
+	pci_unregister_driver(&lsdc_pci_driver);
+
+	return ret;
 }
 module_init(loongson_module_init);
 
 static void __exit loongson_module_exit(void)
 {
+	platform_driver_unregister(&loongson_drm_platform_driver);
+
 	pci_unregister_driver(&lsdc_pci_driver);
+
+	pci_unregister_driver(&loonggpu_pci_driver);
+
+	platform_driver_unregister(&lsdc_output_platform_driver);
 }
 module_exit(loongson_module_exit);
diff --git a/drivers/gpu/drm/loongson/loongson_module.h b/drivers/gpu/drm/loongson/loongson_module.h
index 931c17521bf0..ba29eba2e7ef 100644
--- a/drivers/gpu/drm/loongson/loongson_module.h
+++ b/drivers/gpu/drm/loongson/loongson_module.h
@@ -6,7 +6,24 @@
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
 extern int loongson_vblank;
 extern struct pci_driver lsdc_pci_driver;
+extern struct pci_driver loonggpu_pci_driver;
+extern struct platform_driver lsdc_output_platform_driver;
+extern struct platform_driver loongson_drm_platform_driver;
 
 #endif
diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
index adc7344d2f80..28f8ee5c3fc5 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.c
+++ b/drivers/gpu/drm/loongson/lsdc_drv.c
@@ -3,10 +3,12 @@
  * Copyright (C) 2023 Loongson Technology Corporation Limited
  */
 
+#include <linux/aperture.h>
+#include <linux/component.h>
 #include <linux/pci.h>
+#include <linux/platform_device.h>
 #include <linux/vgaarb.h>
 
-#include <drm/drm_aperture.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
@@ -22,14 +24,6 @@
 #include "lsdc_gem.h"
 #include "lsdc_ttm.h"
 
-#define DRIVER_AUTHOR               "Sui Jingfeng <suijingfeng@loongson.cn>"
-#define DRIVER_NAME                 "loongson"
-#define DRIVER_DESC                 "drm driver for loongson graphics"
-#define DRIVER_DATE                 "20220701"
-#define DRIVER_MAJOR                1
-#define DRIVER_MINOR                0
-#define DRIVER_PATCHLEVEL           0
-
 DEFINE_DRM_GEM_FOPS(lsdc_gem_fops);
 
 static const struct drm_driver lsdc_drm_driver = {
@@ -57,41 +51,16 @@ static const struct drm_mode_config_funcs lsdc_mode_config_funcs = {
 
 /* Display related */
 
-static int lsdc_modeset_init(struct lsdc_device *ldev,
-			     unsigned int num_crtc,
-			     const struct lsdc_kms_funcs *funcs,
-			     bool has_vblank)
+int lsdc_modeset_init(struct lsdc_device *ldev,
+		      unsigned int num_crtc,
+		      const struct lsdc_kms_funcs *funcs,
+		      bool has_vblank)
 {
 	struct drm_device *ddev = &ldev->base;
 	struct lsdc_display_pipe *dispipe;
 	unsigned int i;
 	int ret;
 
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
 	for (i = 0; i < num_crtc; i++) {
 		dispipe = &ldev->dispipe[i];
 
@@ -120,8 +89,8 @@ static const struct drm_mode_config_helper_funcs lsdc_mode_config_helper_funcs =
 	.atomic_commit_tail = drm_atomic_helper_commit_tail,
 };
 
-static int lsdc_mode_config_init(struct drm_device *ddev,
-				 const struct lsdc_desc *descp)
+int lsdc_mode_config_init(struct drm_device *ddev,
+			  const struct lsdc_desc *descp)
 {
 	int ret;
 
@@ -177,9 +146,10 @@ static int lsdc_get_dedicated_vram(struct lsdc_device *ldev,
 	base = pci_resource_start(pdev_gpu, 2);
 	size = pci_resource_len(pdev_gpu, 2);
 
+	pci_dev_put(pdev_gpu);
+
 	ldev->vram_base = base;
 	ldev->vram_size = size;
-	ldev->gpu = pdev_gpu;
 
 	drm_info(ddev, "Dedicated vram start: 0x%llx, size: %uMiB\n",
 		 (u64)base, (u32)(size >> 20));
@@ -187,80 +157,62 @@ static int lsdc_get_dedicated_vram(struct lsdc_device *ldev,
 	return (size > SZ_1M) ? 0 : -ENODEV;
 }
 
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
+/* For multiple GPU driver instance co-exixt in the system */
 
-	ddev = &ldev->base;
+static unsigned int lsdc_vga_set_decode(struct pci_dev *pdev, bool state)
+{
+	return VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
+}
 
-	loongson_gfxpll_create(ddev, &ldev->gfxpll);
+static int lsdc_component_bind(struct device *dev, struct device *master, void *data)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct drm_device *drm = data;
+	struct lsdc_device *ldev = to_lsdc(drm);
+	const struct lsdc_desc *descp = ldev->descp;
+	int ret;
 
 	ret = lsdc_get_dedicated_vram(ldev, pdev, descp);
-	if (ret) {
-		drm_err(ddev, "Init VRAM failed: %d\n", ret);
-		return ERR_PTR(ret);
-	}
-
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
+	if (ret)
+		return ret;
 
-	ret = lsdc_mode_config_init(ddev, descp);
+	ret = aperture_remove_conflicting_devices(ldev->vram_base,
+						  ldev->vram_size,
+						  DRIVER_NAME);
 	if (ret)
-		return ERR_PTR(ret);
+		return ret;
 
-	ret = lsdc_modeset_init(ldev, descp->num_of_crtc, descp->funcs,
-				loongson_vblank);
+	ret = devm_request_irq(dev,
+			       pdev->irq,
+			       descp->funcs->irq_handler,
+			       IRQF_SHARED,
+			       dev_name(dev),
+			       drm);
 	if (ret)
-		return ERR_PTR(ret);
+		return ret;
 
-	drm_mode_config_reset(ddev);
+	dev_info(dev, "lsdc irq: %d\n", pdev->irq);
 
-	return ldev;
-}
+	vga_client_register(pdev, lsdc_vga_set_decode);
 
-/* For multiple GPU driver instance co-exixt in the system */
+	return 0;
+}
 
-static unsigned int lsdc_vga_set_decode(struct pci_dev *pdev, bool state)
+static void lsdc_component_unbind(struct device *dev, struct device *master, void *data)
 {
-	return VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	vga_client_unregister(pdev);
 }
 
+static const struct component_ops lsdc_component_ops = {
+	.bind = lsdc_component_bind,
+	.unbind = lsdc_component_unbind,
+};
+
 static int lsdc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	const struct lsdc_desc *descp;
-	struct drm_device *ddev;
 	struct lsdc_device *ldev;
 	int ret;
 
@@ -278,58 +230,58 @@ static int lsdc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		return ret;
 
-	dev_info(&pdev->dev, "Found %s, revision: %u",
+	dev_info(&pdev->dev, "Found %s, revision: %u\n",
 		 to_loongson_gfx(descp)->model, pdev->revision);
 
-	ldev = lsdc_create_device(pdev, descp, &lsdc_drm_driver);
+	ldev = devm_drm_dev_alloc(&pdev->dev, &lsdc_drm_driver,
+				  struct lsdc_device, base);
 	if (IS_ERR(ldev))
 		return PTR_ERR(ldev);
 
-	ddev = &ldev->base;
-
-	pci_set_drvdata(pdev, ddev);
-
-	vga_client_register(pdev, lsdc_vga_set_decode);
+	pci_set_drvdata(pdev, ldev);
+	ldev->dc = pdev;
+	ldev->descp = descp;
 
-	drm_kms_helper_poll_init(ddev);
+	/* Bar 0 of the DC device contains the MMIO register's base address */
+	ldev->reg_base = pcim_iomap(pdev, 0, 0);
+	if (!ldev->reg_base)
+		return -ENODEV;
 
-	if (loongson_vblank) {
-		ret = drm_vblank_init(ddev, descp->num_of_crtc);
-		if (ret)
-			return ret;
+	spin_lock_init(&ldev->reglock);
 
-		ret = devm_request_irq(&pdev->dev, pdev->irq,
-				       descp->funcs->irq_handler,
-				       IRQF_SHARED,
-				       dev_name(&pdev->dev), ddev);
-		if (ret) {
-			drm_err(ddev, "Failed to register interrupt: %d\n", ret);
-			return ret;
-		}
+	ret = lsdc_i2c_preinit(&pdev->dev);
+	if (ret)
+		return ret;
 
-		drm_info(ddev, "registered irq: %u\n", pdev->irq);
+	ret = lsdc_output_preinit(&pdev->dev, descp);
+	if (ret) {
+		dev_err(&pdev->dev, "Output preinit failed: %d\n", ret);
+		return ret;
 	}
 
-	ret = drm_dev_register(ddev, 0);
-	if (ret)
+	ret = component_add(&pdev->dev, &lsdc_component_ops);
+	if (ret) {
+		dev_err(&pdev->dev, "Add as a subcomponent failed: %d\n", ret);
 		return ret;
+	}
 
-	drm_fbdev_ttm_setup(ddev, 32);
+	ret = loongson_device_preinit(&pdev->dev, (void **)&ldev->base);
+	if (ret) {
+		dev_err(&pdev->dev, "Proxy drm device failed: %d\n", ret);
+		return ret;
+	}
 
 	return 0;
 }
 
 static void lsdc_pci_remove(struct pci_dev *pdev)
 {
-	struct drm_device *ddev = pci_get_drvdata(pdev);
+	struct lsdc_device *ldev = pci_get_drvdata(pdev);
+	struct drm_device *ddev = &ldev->base;
 
 	drm_dev_unregister(ddev);
-	drm_atomic_helper_shutdown(ddev);
-}
 
-static void lsdc_pci_shutdown(struct pci_dev *pdev)
-{
-	drm_atomic_helper_shutdown(pci_get_drvdata(pdev));
+	component_del(&pdev->dev, &lsdc_component_ops);
 }
 
 static int lsdc_drm_freeze(struct drm_device *ddev)
@@ -383,7 +335,8 @@ static int lsdc_drm_freeze(struct drm_device *ddev)
 static int lsdc_drm_resume(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
-	struct drm_device *ddev = pci_get_drvdata(pdev);
+	struct lsdc_device *ldev = pci_get_drvdata(pdev);
+	struct drm_device *ddev = &ldev->base;
 
 	return drm_mode_config_helper_resume(ddev);
 }
@@ -391,7 +344,8 @@ static int lsdc_drm_resume(struct device *dev)
 static int lsdc_pm_freeze(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
-	struct drm_device *ddev = pci_get_drvdata(pdev);
+	struct lsdc_device *ldev = pci_get_drvdata(pdev);
+	struct drm_device *ddev = &ldev->base;
 
 	return lsdc_drm_freeze(ddev);
 }
@@ -452,10 +406,31 @@ struct pci_driver lsdc_pci_driver = {
 	.id_table = lsdc_pciid_list,
 	.probe = lsdc_pci_probe,
 	.remove = lsdc_pci_remove,
-	.shutdown = lsdc_pci_shutdown,
 	.driver.pm = &lsdc_pm_ops,
 };
 
+void lsdc_pci_match_add(struct device *master,
+			struct component_match **matchptr)
+{
+	struct pci_dev *dc;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(lsdc_pciid_list); ++i) {
+		unsigned int did = lsdc_pciid_list[i].device;
+
+		dc = pci_get_device(PCI_VENDOR_ID_LOONGSON, did, NULL);
+		if (dc) {
+			component_match_add(master, matchptr,
+					    component_compare_dev, &dc->dev);
+			pci_dev_put(dc);
+
+			dev_dbg(master, "match added, name: %s, %u\n",
+				dev_name(&dc->dev), i);
+			return;
+		}
+	}
+}
+
 MODULE_DEVICE_TABLE(pci, lsdc_pciid_list);
 MODULE_AUTHOR(DRIVER_AUTHOR);
 MODULE_DESCRIPTION(DRIVER_DESC);
diff --git a/drivers/gpu/drm/loongson/lsdc_drv.h b/drivers/gpu/drm/loongson/lsdc_drv.h
index fbf2d760ef27..71d7e6288028 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.h
+++ b/drivers/gpu/drm/loongson/lsdc_drv.h
@@ -16,6 +16,8 @@
 #include <drm/drm_plane.h>
 #include <drm/ttm/ttm_device.h>
 
+#include "loongson_module.h"
+
 #include "lsdc_i2c.h"
 #include "lsdc_irq.h"
 #include "lsdc_gfxpll.h"
@@ -38,15 +40,17 @@
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
 
+void lsdc_pci_match_add(struct device *master,
+			struct component_match **matchptr);
+
+int lsdc_mode_config_init(struct drm_device *ddev,
+			  const struct lsdc_desc *descp);
+
+int loongson_device_preinit(struct device *parent, void *data);
+
 struct lsdc_kms_funcs;
 
 /* DC specific */
@@ -167,47 +171,23 @@ struct lsdc_cursor {
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
 
@@ -284,6 +264,7 @@ struct lsdc_device {
 	resource_size_t gtt_size;
 
 	struct lsdc_display_pipe dispipe[LSDC_NUM_CRTC];
+	struct i2c_adapter *i2c[LSDC_NUM_CRTC];
 
 	struct lsdc_gem gem;
 
@@ -341,6 +322,11 @@ int ls7a2000_cursor_plane_init(struct drm_device *ddev,
 			       struct drm_plane *plane,
 			       unsigned int index);
 
+int lsdc_modeset_init(struct lsdc_device *ldev,
+		      unsigned int num_crtc,
+		      const struct lsdc_kms_funcs *funcs,
+		      bool has_vblank);
+
 /* Registers access helpers */
 
 static inline u32 lsdc_rreg32(struct lsdc_device *ldev, u32 offset)
diff --git a/drivers/gpu/drm/loongson/lsdc_i2c.c b/drivers/gpu/drm/loongson/lsdc_i2c.c
index ce90c25536d2..0ce5007fc0e6 100644
--- a/drivers/gpu/drm/loongson/lsdc_i2c.c
+++ b/drivers/gpu/drm/loongson/lsdc_i2c.c
@@ -15,7 +15,7 @@
  */
 static void __lsdc_gpio_i2c_set(struct lsdc_i2c * const li2c, int mask, int state)
 {
-	struct lsdc_device *ldev = to_lsdc(li2c->ddev);
+	struct lsdc_device *ldev = li2c->lsdc;
 	unsigned long flags;
 	u8 val;
 
@@ -51,7 +51,7 @@ static void __lsdc_gpio_i2c_set(struct lsdc_i2c * const li2c, int mask, int stat
  */
 static int __lsdc_gpio_i2c_get(struct lsdc_i2c * const li2c, int mask)
 {
-	struct lsdc_device *ldev = to_lsdc(li2c->ddev);
+	struct lsdc_device *ldev = li2c->lsdc;
 	unsigned long flags;
 	u8 val;
 
@@ -98,7 +98,7 @@ static int lsdc_gpio_i2c_get_scl(void *i2c)
 	return __lsdc_gpio_i2c_get(li2c, li2c->scl);
 }
 
-static void lsdc_destroy_i2c(struct drm_device *ddev, void *data)
+static void lsdc_destroy_i2c(void *data)
 {
 	struct lsdc_i2c *li2c = (struct lsdc_i2c *)data;
 
@@ -114,11 +114,10 @@ static void lsdc_destroy_i2c(struct drm_device *ddev, void *data)
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
@@ -127,8 +126,6 @@ int lsdc_create_i2c_chan(struct drm_device *ddev,
 	if (!li2c)
 		return -ENOMEM;
 
-	dispipe->li2c = li2c;
-
 	if (index == 0) {
 		li2c->sda = 0x01;  /* pin 0 */
 		li2c->scl = 0x02;  /* pin 1 */
@@ -139,7 +136,7 @@ int lsdc_create_i2c_chan(struct drm_device *ddev,
 		return -ENOENT;
 	}
 
-	li2c->ddev = ddev;
+	li2c->lsdc = ldev;
 	li2c->dir_reg = ldev->reg_base + LS7A_DC_GPIO_DIR_REG;
 	li2c->dat_reg = ldev->reg_base + LS7A_DC_GPIO_DAT_REG;
 
@@ -154,7 +151,7 @@ int lsdc_create_i2c_chan(struct drm_device *ddev,
 	adapter = &li2c->adapter;
 	adapter->algo_data = &li2c->bit;
 	adapter->owner = THIS_MODULE;
-	adapter->dev.parent = ddev->dev;
+	adapter->dev.parent = parent;
 	adapter->nr = -1;
 
 	snprintf(adapter->name, sizeof(adapter->name), "lsdc-i2c%u", index);
@@ -167,12 +164,30 @@ int lsdc_create_i2c_chan(struct drm_device *ddev,
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
+int lsdc_i2c_preinit(struct device *parent)
+{
+	struct lsdc_device *ldev = dev_get_drvdata(parent);
+	const struct lsdc_desc *descp = ldev->descp;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < descp->num_of_crtc; ++i) {
+		ret = descp->funcs->create_i2c(parent, i, &ldev->i2c[i]);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/loongson/lsdc_i2c.h b/drivers/gpu/drm/loongson/lsdc_i2c.h
index 88cd1a1817a5..59ed7f90beac 100644
--- a/drivers/gpu/drm/loongson/lsdc_i2c.h
+++ b/drivers/gpu/drm/loongson/lsdc_i2c.h
@@ -9,10 +9,12 @@
 #include <linux/i2c.h>
 #include <linux/i2c-algo-bit.h>
 
+struct lsdc_device;
+
 struct lsdc_i2c {
 	struct i2c_adapter adapter;
 	struct i2c_algo_bit_data bit;
-	struct drm_device *ddev;
+	struct lsdc_device *lsdc;
 	void __iomem *dir_reg;
 	void __iomem *dat_reg;
 	/* pin bit mask */
@@ -20,10 +22,9 @@ struct lsdc_i2c {
 	u8 scl;
 };
 
-struct lsdc_display_pipe;
+int lsdc_create_i2c_chan(struct device *parent, unsigned int index,
+			 struct i2c_adapter **ppadapter);
 
-int lsdc_create_i2c_chan(struct drm_device *ddev,
-			 struct lsdc_display_pipe *dispipe,
-			 unsigned int index);
+int lsdc_i2c_preinit(struct device *parent);
 
 #endif
diff --git a/drivers/gpu/drm/loongson/lsdc_irq.c b/drivers/gpu/drm/loongson/lsdc_irq.c
index efdc4d10792d..c41b82a6e5cf 100644
--- a/drivers/gpu/drm/loongson/lsdc_irq.c
+++ b/drivers/gpu/drm/loongson/lsdc_irq.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_vblank.h>
 
+#include "loongson_module.h"
 #include "lsdc_irq.h"
 
 /*
@@ -35,11 +36,13 @@ irqreturn_t ls7a2000_dc_irq_handler(int irq, void *arg)
 	/* write "1" to clear the interrupt status */
 	lsdc_wreg32(ldev, LSDC_INT_REG, val);
 
-	if (ldev->irq_status & INT_CRTC0_VSYNC)
-		drm_handle_vblank(ddev, 0);
+	if (loongson_vblank) {
+		if (ldev->irq_status & INT_CRTC0_VSYNC)
+			drm_handle_vblank(ddev, 0);
 
-	if (ldev->irq_status & INT_CRTC1_VSYNC)
-		drm_handle_vblank(ddev, 1);
+		if (ldev->irq_status & INT_CRTC1_VSYNC)
+			drm_handle_vblank(ddev, 1);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -64,11 +67,13 @@ irqreturn_t ls7a1000_dc_irq_handler(int irq, void *arg)
 	val &= ~(INT_CRTC0_VSYNC | INT_CRTC1_VSYNC);
 	lsdc_wreg32(ldev, LSDC_INT_REG, val);
 
-	if (ldev->irq_status & INT_CRTC0_VSYNC)
-		drm_handle_vblank(ddev, 0);
+	if (loongson_vblank) {
+		if (ldev->irq_status & INT_CRTC0_VSYNC)
+			drm_handle_vblank(ddev, 0);
 
-	if (ldev->irq_status & INT_CRTC1_VSYNC)
-		drm_handle_vblank(ddev, 1);
+		if (ldev->irq_status & INT_CRTC1_VSYNC)
+			drm_handle_vblank(ddev, 1);
+	}
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/gpu/drm/loongson/lsdc_output.c b/drivers/gpu/drm/loongson/lsdc_output.c
new file mode 100644
index 000000000000..d5ae032d30d1
--- /dev/null
+++ b/drivers/gpu/drm/loongson/lsdc_output.c
@@ -0,0 +1,208 @@
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
+static struct platform_device *lsdc_output_agent[LSDC_NUM_CRTC];
+
+void lsdc_output_match_add(struct device *master,
+			   struct component_match **matchptr)
+{
+	unsigned int i;
+
+	for (i = 0; i < LSDC_NUM_CRTC; ++i) {
+		if (!lsdc_output_agent[i])
+			continue;
+
+		component_match_add(master, matchptr, component_compare_dev,
+				    &lsdc_output_agent[i]->dev);
+	}
+}
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
+		goto idx_err_out;
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
+idx_err_out:
+	return ERR_PTR(-ENODEV);
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
+		devinfo.name = "lsdc-output";
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
+
+		lsdc_output_agent[i] = agent;
+	}
+
+	return 0;
+}
+
+/*
+ * @dev: pointer to the port@0 or port@1 of the display output
+ * @master: pointer to the component master
+ * @data: pointer to the drm device control structure
+ */
+static int lsdc_output_bind(struct device *dev,
+			    struct device *master,
+			    void *data)
+{
+	struct drm_device *drm = data;
+	struct lsdc_device *ldev = to_lsdc(drm);
+	const struct lsdc_kms_funcs *kms_funcs = ldev->descp->funcs;
+	struct lsdc_output *output = dev_get_drvdata(dev);
+	unsigned int pipe = output->pipe;
+	int ret;
+
+	ret = kms_funcs->output_init(drm, output, ldev->i2c[pipe], pipe);
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
+	struct drm_device *drm = data;
+	struct lsdc_device *ldev = to_lsdc(drm);
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
+	ret = device_property_read_u32(dev, "reg", &output->pipe);
+	if (ret)
+		return ret;
+
+	ret = device_property_read_string(dev, "type", &type);
+	if (ret)
+		return ret;
+
+	output->dev = dev;
+	dev_set_drvdata(dev, output);
+
+	ret = devm_add_action_or_reset(parent, lsdc_output_destroy, output);
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
+		.name = "lsdc-output",
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
index 6fc8dd1c7d9a..edb78a19949f 100644
--- a/drivers/gpu/drm/loongson/lsdc_output_7a1000.c
+++ b/drivers/gpu/drm/loongson/lsdc_output_7a1000.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2023 Loongson Technology Corporation Limited
  */
 
+#include <linux/property.h>
+
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
@@ -140,11 +142,10 @@ static const struct drm_encoder_funcs ls7a1000_encoder_funcs[2] = {
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
@@ -162,8 +163,6 @@ int ls7a1000_output_init(struct drm_device *ddev,
 	if (ret)
 		return ret;
 
-	drm_info(ddev, "display pipe-%u has a DVO\n", index);
-
 	drm_connector_helper_add(connector, &ls7a1000_dpi_connector_helpers);
 
 	drm_connector_attach_encoder(connector, encoder);
diff --git a/drivers/gpu/drm/loongson/lsdc_output_7a2000.c b/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
index ce3dabec887e..c0e18cf85f5b 100644
--- a/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
+++ b/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
@@ -284,8 +284,7 @@ static int ls7a2000_hdmi_set_avi_infoframe(struct drm_encoder *encoder,
 					   struct drm_display_mode *mode)
 {
 	struct lsdc_output *output = encoder_to_lsdc_output(encoder);
-	struct lsdc_display_pipe *dispipe = output_to_display_pipe(output);
-	unsigned int index = dispipe->index;
+	unsigned int index = output->pipe;
 	struct drm_device *ddev = encoder->dev;
 	struct lsdc_device *ldev = to_lsdc(ddev);
 	struct hdmi_avi_infoframe infoframe;
@@ -335,8 +334,7 @@ static void ls7a2000_hdmi_atomic_disable(struct drm_encoder *encoder,
 					 struct drm_atomic_state *state)
 {
 	struct lsdc_output *output = encoder_to_lsdc_output(encoder);
-	struct lsdc_display_pipe *dispipe = output_to_display_pipe(output);
-	unsigned int index = dispipe->index;
+	unsigned int index = output->pipe;
 	struct drm_device *ddev = encoder->dev;
 	struct lsdc_device *ldev = to_lsdc(ddev);
 	u32 val;
@@ -360,8 +358,7 @@ static void ls7a2000_hdmi_atomic_enable(struct drm_encoder *encoder,
 	struct drm_device *ddev = encoder->dev;
 	struct lsdc_device *ldev = to_lsdc(ddev);
 	struct lsdc_output *output = encoder_to_lsdc_output(encoder);
-	struct lsdc_display_pipe *dispipe = output_to_display_pipe(output);
-	unsigned int index = dispipe->index;
+	unsigned int index = output->pipe;
 	u32 val;
 
 	/* datasheet say it should larger than 48 */
@@ -482,8 +479,7 @@ static void ls7a2000_hdmi_atomic_mode_set(struct drm_encoder *encoder,
 					  struct drm_connector_state *conn_state)
 {
 	struct lsdc_output *output = encoder_to_lsdc_output(encoder);
-	struct lsdc_display_pipe *dispipe = output_to_display_pipe(output);
-	unsigned int index = dispipe->index;
+	unsigned int index = output->pipe;
 	struct drm_device *ddev = encoder->dev;
 	struct lsdc_device *ldev = to_lsdc(ddev);
 	struct drm_display_mode *mode = &crtc_state->mode;
@@ -512,11 +508,10 @@ static const struct drm_encoder_helper_funcs ls7a2000_encoder_helper_funcs = {
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
@@ -536,8 +531,6 @@ int ls7a2000_output_init(struct drm_device *ddev,
 	if (ret)
 		return ret;
 
-	drm_info(ddev, "display pipe-%u has HDMI %s\n", pipe, pipe ? "" : "and/or VGA");
-
 	drm_connector_helper_add(connector, &ls7a2000_connector_helpers);
 
 	drm_connector_attach_encoder(connector, encoder);
diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongson/lsdc_ttm.c
index 465f622ac05d..72f51993d678 100644
--- a/drivers/gpu/drm/loongson/lsdc_ttm.c
+++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
@@ -539,9 +539,9 @@ static void lsdc_ttm_fini(struct drm_device *ddev, void *data)
 	drm_dbg(ddev, "ttm finished\n");
 }
 
-int lsdc_ttm_init(struct lsdc_device *ldev)
+int lsdc_ttm_init(struct drm_device *ddev)
 {
-	struct drm_device *ddev = &ldev->base;
+	struct lsdc_device *ldev = to_lsdc(ddev);
 	unsigned long num_vram_pages;
 	unsigned long num_gtt_pages;
 	int ret;
diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.h b/drivers/gpu/drm/loongson/lsdc_ttm.h
index 843e1475064e..064cf497e090 100644
--- a/drivers/gpu/drm/loongson/lsdc_ttm.h
+++ b/drivers/gpu/drm/loongson/lsdc_ttm.h
@@ -93,7 +93,7 @@ void lsdc_bo_clear(struct lsdc_bo *lbo);
 
 int lsdc_bo_evict_vram(struct drm_device *ddev);
 
-int lsdc_ttm_init(struct lsdc_device *ldev);
+int lsdc_ttm_init(struct drm_device *ddev);
 void lsdc_ttm_debugfs_init(struct lsdc_device *ldev);
 
 #endif
-- 
2.43.0

