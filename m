Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D5F6070F2
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 09:24:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1997D10E5E3;
	Fri, 21 Oct 2022 07:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81CF10E031
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 17:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666288628; x=1697824628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2p5P2TxMf6hZYcQO6rj0OBHSOpKvGfUczPBtTIg/J1k=;
 b=CB2PBtgn5ObDsBakOLPn3bzjt/VQMLLWREjszcyOfO9kT38ZBF0QW8Ny
 SZXMtLO00AQ8/i6QV8XICBQc4mSOfsr2MUgIzAoXlrY3R/X/cuTz9+YpM
 Z+nAfDkTsjyE0xis1kA6LshhQ8tnq20Nz+eG2glYOFXRLcV5H33wroERt
 24C/YhcUV8Miu6mrEivzb4658G5LKh7Ouw7mtPpWMhA6CN+hK7VHMJWKm
 CEdfjyywbh2dfD8UZtQjK7tftUvVlHV43BO/pHyuGpzUs0stXRLMzicaE
 6G3XBEHox0uLsnGz+s9VAAp4xz71vCGL4jKCEABuIj04pkvZyL5Q5Pe1D w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="305528498"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="305528498"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 10:57:07 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="772516762"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="772516762"
Received: from gna-nuc-dev34.igk.intel.com ([10.102.80.34])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 10:57:03 -0700
From: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>
Subject: [PATCH v5 01/10] gna: add PCI driver module
Date: Thu, 20 Oct 2022 19:53:25 +0200
Message-Id: <20221020175334.1820519-2-maciej.kwapulinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 21 Oct 2022 07:22:31 +0000
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Tomasz Jankowski <tomasz1.jankowski@intel.com>,
 Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 Jianxun Zhang <jianxun.zhang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new PCI driver for Intel(R) Gaussian & Neural Accelerator
with basic support like module loading and unloading. The full
function of the driver will be added by further changes.

Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
Co-developed-by: Tomasz Jankowski <tomasz1.jankowski@intel.com>
Signed-off-by: Tomasz Jankowski <tomasz1.jankowski@intel.com>
Co-developed-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
---
 Documentation/gpu/drivers.rst    |  1 +
 Documentation/gpu/gna.rst        | 64 ++++++++++++++++++++++++++++++++
 MAINTAINERS                      |  6 +++
 drivers/gpu/drm/Kconfig          |  2 +
 drivers/gpu/drm/Makefile         |  1 +
 drivers/gpu/drm/gna/Kbuild       |  5 +++
 drivers/gpu/drm/gna/Kconfig      | 12 ++++++
 drivers/gpu/drm/gna/gna_device.c |  8 ++++
 drivers/gpu/drm/gna/gna_device.h |  9 +++++
 drivers/gpu/drm/gna/gna_pci.c    | 32 ++++++++++++++++
 drivers/gpu/drm/gna/gna_pci.h    | 12 ++++++
 11 files changed, 152 insertions(+)
 create mode 100644 Documentation/gpu/gna.rst
 create mode 100644 drivers/gpu/drm/gna/Kbuild
 create mode 100644 drivers/gpu/drm/gna/Kconfig
 create mode 100644 drivers/gpu/drm/gna/gna_device.c
 create mode 100644 drivers/gpu/drm/gna/gna_device.h
 create mode 100644 drivers/gpu/drm/gna/gna_pci.c
 create mode 100644 drivers/gpu/drm/gna/gna_pci.h

diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
index 3a52f48215a3..7238ddc576a2 100644
--- a/Documentation/gpu/drivers.rst
+++ b/Documentation/gpu/drivers.rst
@@ -5,6 +5,7 @@ GPU Driver Documentation
 .. toctree::
 
    amdgpu/index
+   gna
    i915
    mcde
    meson
diff --git a/Documentation/gpu/gna.rst b/Documentation/gpu/gna.rst
new file mode 100644
index 000000000000..7f3b7ce7e8f7
--- /dev/null
+++ b/Documentation/gpu/gna.rst
@@ -0,0 +1,64 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+=====================================================
+Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA)
+=====================================================
+
+Acronyms
+--------
+GNA	- Gaussian & Neural Accelerator
+GMM	- Gaussian Mixer Model
+CNN	- Convolutional Neural Network
+RNN	- Recurrent Neural Networks
+DNN	- Deep Neural Networks
+
+Introduction
+------------
+The Intel(R) GNA is an internal PCI fixed device available on several Intel platforms/SoCs.
+Feature set depends on the Intel chipset SKU.
+
+Intel(R) GNA provides hardware accelerated computation for GMMs and Neural Networks.
+It supports several layer types: affine, recurrent, and convolutional among others.
+Hardware also provides helper layer types for copying and transposing matrices.
+
+Linux Driver
+------------
+The driver also registers a DRM's render device to expose file operations via dev node.
+
+The driver probes/removes a PCI device, implements file operations, handles runtime
+power management, and interacts with hardware through MMIO registers.
+
+Multiple processes can independently file many requests to the driver. These requests are
+processed in a FIFO manner. The hardware can process one request at a time by using a FIFO
+queue.
+
+IOCTL
+-----
+Intel(R) GNA driver controls the device through IOCTL interfaces.
+Following IOCTL commands - handled by DRM framework - are supported:
+
+GNA_GET_PARAMETER gets driver and device capabilities.
+
+GNA_GEM_NEW acquires new 4KB page aligned memory region ready for DMA operations.
+
+GNA_GEM_FREE frees memory region back to system.
+
+GNA_COMPUTE submits a request to the device queue.
+            Memory regions acquired by GNA_GEM_NEW are part of request.
+
+GNA_WAIT blocks and waits on the submitted request.
+
+GNA MMU
+-------
+GNA’s MMU is being configured based on specific request memory usage. As the MMU can
+address up to 256MB a single scoring request is limited to this amount of memory being
+used.
+
+GNA Library can allocate any number of memory regions for GNA usage. Its number and total
+capacity are limited by the OSs’ resources. Due to GNA MMU restrictions, even when using
+multiple memory regions, the sum of all the memory regions used within a single inference
+request must be no larger than 256MB.
+
+At least a single GNA memory region is needed to be allocated (and can be shared by
+multiple models). At the other extreme, each GNA tensor (e.g.,
+weights/biases/inputs/outputs) could use its own, separate GNA memory region.
diff --git a/MAINTAINERS b/MAINTAINERS
index 72b9654f764c..d5b966c00155 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10174,6 +10174,12 @@ S:	Maintained
 F:	Documentation/fb/intelfb.rst
 F:	drivers/video/fbdev/intelfb/
 
+INTEL GNA PCI DRIVER
+M:	Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
+S:	Maintained
+F:	Documentation/gpu/gna.rst
+F:	drivers/gpu/drm/gna/*
+
 INTEL GPIO DRIVERS
 M:	Andy Shevchenko <andy@kernel.org>
 L:	linux-gpio@vger.kernel.org
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 6c2256e8474b..3f5720b9db1f 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -403,6 +403,8 @@ source "drivers/gpu/drm/solomon/Kconfig"
 
 source "drivers/gpu/drm/sprd/Kconfig"
 
+source "drivers/gpu/drm/gna/Kconfig"
+
 config DRM_HYPERV
 	tristate "DRM Support for Hyper-V synthetic video device"
 	depends on DRM && PCI && MMU && HYPERV
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index e7af358e6dda..e088267f349d 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -147,3 +147,4 @@ obj-y			+= gud/
 obj-$(CONFIG_DRM_HYPERV) += hyperv/
 obj-y			+= solomon/
 obj-$(CONFIG_DRM_SPRD) += sprd/
+obj-$(CONFIG_DRM_GNA) += gna/
diff --git a/drivers/gpu/drm/gna/Kbuild b/drivers/gpu/drm/gna/Kbuild
new file mode 100644
index 000000000000..00e8d6a2c49c
--- /dev/null
+++ b/drivers/gpu/drm/gna/Kbuild
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+gna-y := gna_device.o gna_pci.o
+
+obj-$(CONFIG_DRM_GNA) += gna.o
diff --git a/drivers/gpu/drm/gna/Kconfig b/drivers/gpu/drm/gna/Kconfig
new file mode 100644
index 000000000000..467f518db7fa
--- /dev/null
+++ b/drivers/gpu/drm/gna/Kconfig
@@ -0,0 +1,12 @@
+#
+# Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA)
+#
+
+config DRM_GNA
+	tristate "Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA)"
+	depends on X86 && PCI
+	help
+	  This option enables the Intel(R) Gaussian & Neural Accelerator
+	  (Intel(R) GNA) driver: gna
+	  Information about functionality is in
+	  Documentation/gpu/gna.rst
diff --git a/drivers/gpu/drm/gna/gna_device.c b/drivers/gpu/drm/gna/gna_device.c
new file mode 100644
index 000000000000..960b4341c18e
--- /dev/null
+++ b/drivers/gpu/drm/gna/gna_device.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright(c) 2017-2022 Intel Corporation
+
+#include <linux/module.h>
+
+MODULE_AUTHOR("Intel Corporation");
+MODULE_DESCRIPTION("Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA) Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/gna/gna_device.h b/drivers/gpu/drm/gna/gna_device.h
new file mode 100644
index 000000000000..4cc92f27765a
--- /dev/null
+++ b/drivers/gpu/drm/gna/gna_device.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright(c) 2017-2022 Intel Corporation */
+
+#ifndef __GNA_DEVICE_H__
+#define __GNA_DEVICE_H__
+
+#define DRIVER_NAME		"gna"
+
+#endif /* __GNA_DEVICE_H__ */
diff --git a/drivers/gpu/drm/gna/gna_pci.c b/drivers/gpu/drm/gna/gna_pci.c
new file mode 100644
index 000000000000..6bd00c66f3a7
--- /dev/null
+++ b/drivers/gpu/drm/gna/gna_pci.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright(c) 2017-2022 Intel Corporation
+
+#include <linux/module.h>
+#include <linux/pci.h>
+
+#include "gna_device.h"
+#include "gna_pci.h"
+
+int gna_pci_probe(struct pci_dev *pcidev, const struct pci_device_id *pci_id)
+{
+	int err;
+
+	err = pcim_enable_device(pcidev);
+	if (err)
+		return err;
+
+	err = pcim_iomap_regions(pcidev, BIT(0), pci_name(pcidev));
+	if (err)
+		return err;
+
+	pci_set_master(pcidev);
+
+	return 0;
+}
+
+static struct pci_driver gna_pci_driver = {
+	.name = DRIVER_NAME,
+	.probe = gna_pci_probe,
+};
+
+module_pci_driver(gna_pci_driver);
diff --git a/drivers/gpu/drm/gna/gna_pci.h b/drivers/gpu/drm/gna/gna_pci.h
new file mode 100644
index 000000000000..b651fa2e6ea1
--- /dev/null
+++ b/drivers/gpu/drm/gna/gna_pci.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright(c) 2017-2022 Intel Corporation */
+
+#ifndef __GNA_PCI_H__
+#define __GNA_PCI_H__
+
+struct pci_device_id;
+struct pci_dev;
+
+int gna_pci_probe(struct pci_dev *dev, const struct pci_device_id *id);
+
+#endif /* __GNA_PCI_H__ */
-- 
2.25.1

