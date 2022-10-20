Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3953A6070ED
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 09:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BC810E5D6;
	Fri, 21 Oct 2022 07:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54EB110E031
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 17:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666288633; x=1697824633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8YfEEm+GMUs76QMVN1GO8XUlQ3blycuQYlNJnbxkN2o=;
 b=hmAJuhqo6GfKaSKMRGzLm7GcrWV5kpKD82hwT84EJM5FxPz5tM7qM7z1
 sUL4iQK75nMv8Fwv/axhwrfh618KgoZjFx/KQi89Jn0TQ8HlzL4wiwTcj
 H/3eMmbBr6VBWJtGMNK4cqJ0t/L+Mcp1SjVMjQXxyuOofyHs7lAzc/186
 PWfRLDGiD9qMTDJh+aiWd5NE1dLe3nPI6fcMyYr/bYzRAI+IufX41/6Ui
 yU9LG4UxZP16SrocLjSozr/OqVEqEG5qdBosFgIKGEoPvNe26M+S11r6v
 dwL/3L0o1tEn5HPCOb9fM2lH8uy5lP+WiP8SB6uxV9Dvmr6TsQFdT/8zd Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="305528515"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="305528515"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 10:57:12 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="772516806"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="772516806"
Received: from gna-nuc-dev34.igk.intel.com ([10.102.80.34])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 10:57:07 -0700
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
Subject: [PATCH v5 02/10] gna: add GNA DRM device
Date: Thu, 20 Oct 2022 19:53:26 +0200
Message-Id: <20221020175334.1820519-3-maciej.kwapulinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
MIME-Version: 1.0
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
Cc: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
---
 drivers/gpu/drm/gna/Kconfig      |  1 +
 drivers/gpu/drm/gna/gna_device.c | 65 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/gna/gna_device.h | 21 +++++++++++
 drivers/gpu/drm/gna/gna_hw.h     | 17 +++++++++
 drivers/gpu/drm/gna/gna_pci.c    | 11 ++++++
 5 files changed, 115 insertions(+)
 create mode 100644 drivers/gpu/drm/gna/gna_hw.h

diff --git a/drivers/gpu/drm/gna/Kconfig b/drivers/gpu/drm/gna/Kconfig
index 467f518db7fa..820dc8424045 100644
--- a/drivers/gpu/drm/gna/Kconfig
+++ b/drivers/gpu/drm/gna/Kconfig
@@ -5,6 +5,7 @@
 config DRM_GNA
 	tristate "Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA)"
 	depends on X86 && PCI
+	depends on DRM
 	help
 	  This option enables the Intel(R) Gaussian & Neural Accelerator
 	  (Intel(R) GNA) driver: gna
diff --git a/drivers/gpu/drm/gna/gna_device.c b/drivers/gpu/drm/gna/gna_device.c
index 960b4341c18e..b8620b7da205 100644
--- a/drivers/gpu/drm/gna/gna_device.c
+++ b/drivers/gpu/drm/gna/gna_device.c
@@ -1,8 +1,73 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright(c) 2017-2022 Intel Corporation
 
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+#include <drm/drm_managed.h>
+
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
 #include <linux/module.h>
 
+#include "gna_device.h"
+
+static void gna_drm_dev_fini(struct drm_device *dev, void *ptr)
+{
+	drm_dev_unregister(dev);
+}
+
+static int gna_drm_dev_init(struct drm_device *dev)
+{
+	int err;
+
+	err = drm_dev_register(dev, 0);
+	if (err)
+		return err;
+
+	return drmm_add_action_or_reset(dev, gna_drm_dev_fini, NULL);
+}
+
+static const struct drm_driver gna_drm_driver = {
+	.driver_features = DRIVER_RENDER,
+
+	.name = DRIVER_NAME,
+	.desc = DRIVER_DESC,
+	.date = DRIVER_DATE,
+	.major = DRIVER_MAJOR,
+	.minor = DRIVER_MINOR,
+	.patchlevel = DRIVER_PATCHLEVEL,
+};
+
+int gna_probe(struct device *parent, struct gna_dev_info *dev_info, void __iomem *iobase)
+{
+	struct gna_device *gna_priv;
+	struct drm_device *drm_dev;
+	int err;
+
+	gna_priv = devm_drm_dev_alloc(parent, &gna_drm_driver, struct gna_device, drm);
+	if (IS_ERR(gna_priv))
+		return PTR_ERR(gna_priv);
+
+	drm_dev = &gna_priv->drm;
+	gna_priv->iobase = iobase;
+	gna_priv->info = *dev_info;
+
+	if (!(sizeof(dma_addr_t) > 4) ||
+		dma_set_mask(parent, DMA_BIT_MASK(64))) {
+		err = dma_set_mask(parent, DMA_BIT_MASK(32));
+		if (err)
+			return err;
+	}
+
+	dev_set_drvdata(parent, drm_dev);
+
+	err = gna_drm_dev_init(drm_dev);
+	if (err)
+		return err;
+
+	return 0;
+}
+
 MODULE_AUTHOR("Intel Corporation");
 MODULE_DESCRIPTION("Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA) Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/gna/gna_device.h b/drivers/gpu/drm/gna/gna_device.h
index 4cc92f27765a..d269f7da5c5e 100644
--- a/drivers/gpu/drm/gna/gna_device.h
+++ b/drivers/gpu/drm/gna/gna_device.h
@@ -4,6 +4,27 @@
 #ifndef __GNA_DEVICE_H__
 #define __GNA_DEVICE_H__
 
+#include <drm/drm_device.h>
+
+#include "gna_hw.h"
+
 #define DRIVER_NAME		"gna"
+#define DRIVER_DESC		"Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA)"
+#define DRIVER_DATE		"20211201"
+
+#define DRIVER_MAJOR		1
+#define DRIVER_MINOR		0
+#define DRIVER_PATCHLEVEL	0
+
+struct device;
+
+struct gna_device {
+	struct drm_device drm;
+
+	/* device related resources */
+	void __iomem *iobase;
+	struct gna_dev_info info;
+};
 
+int gna_probe(struct device *parent, struct gna_dev_info *dev_info, void __iomem *iobase);
 #endif /* __GNA_DEVICE_H__ */
diff --git a/drivers/gpu/drm/gna/gna_hw.h b/drivers/gpu/drm/gna/gna_hw.h
new file mode 100644
index 000000000000..3ca801096fd1
--- /dev/null
+++ b/drivers/gpu/drm/gna/gna_hw.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright(c) 2017-2022 Intel Corporation */
+
+#ifndef __GNA_HW_H__
+#define __GNA_HW_H__
+
+#include <linux/mm_types.h>
+
+struct gna_dev_info {
+	u32 hwid;
+	u32 num_pagetables;
+	u32 num_page_entries;
+	u32 max_layer_count;
+	u64 max_hw_mem;
+};
+
+#endif // __GNA_HW_H__
diff --git a/drivers/gpu/drm/gna/gna_pci.c b/drivers/gpu/drm/gna/gna_pci.c
index 6bd00c66f3a7..14f8b34e5f5c 100644
--- a/drivers/gpu/drm/gna/gna_pci.c
+++ b/drivers/gpu/drm/gna/gna_pci.c
@@ -5,10 +5,13 @@
 #include <linux/pci.h>
 
 #include "gna_device.h"
+#include "gna_hw.h"
 #include "gna_pci.h"
 
 int gna_pci_probe(struct pci_dev *pcidev, const struct pci_device_id *pci_id)
 {
+	struct gna_dev_info *dev_info;
+	void __iomem *iobase;
 	int err;
 
 	err = pcim_enable_device(pcidev);
@@ -19,8 +22,16 @@ int gna_pci_probe(struct pci_dev *pcidev, const struct pci_device_id *pci_id)
 	if (err)
 		return err;
 
+	iobase = pcim_iomap_table(pcidev)[0];
+
 	pci_set_master(pcidev);
 
+	dev_info = (struct gna_dev_info *)pci_id->driver_data;
+
+	err = gna_probe(&pcidev->dev, dev_info, iobase);
+	if (err)
+		return err;
+
 	return 0;
 }
 
-- 
2.25.1

