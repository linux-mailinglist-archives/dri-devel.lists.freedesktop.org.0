Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 179F497A355
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 15:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F5910E379;
	Mon, 16 Sep 2024 13:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KSm4cmP8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE6D610E379;
 Mon, 16 Sep 2024 13:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726495052; x=1758031052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oP9fekxxhgLh5eDAfrpQ0Wb4R1ndMDvhopfdC546kPM=;
 b=KSm4cmP8yIS/qeQWyJ8aaKbX/aHnNEQeHkyXGOiWcKneNSFdtyoRhd7j
 qFMNJEWieGc/hyhevNc+SEIZJZ/2fDs6tsDDNi8+cC9mEAuq3lOWWGgTU
 gJBdZKsjdc5W2NcEwFGol+Td6X9Ota3y55rIBt2JzMBLHeRORbyPFPTxu
 0Lpp9Hlwm2ch12ZGn77GGTus1mr0u0YB+9qzuN/Ir7cfAlBGESM0+5usC
 AzriK76KHey3EfuwLwwFdYTv1wTwZMOh91mUrFz1Sq/wYgnRc/9klFEIy
 tPHA0oOmiWQPR9ggtprl97EWtpVR1lHxNAa7eqnxnmz3U5izc9Z6nmmg5 g==;
X-CSE-ConnectionGUID: pP0rW1KOQjKCNzNjjlP3gg==
X-CSE-MsgGUID: TvEmQmZnSguGrb/T5ETT6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="36666773"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="36666773"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 06:57:31 -0700
X-CSE-ConnectionGUID: c8Q9oLFVQaaVBMZZAxpaTQ==
X-CSE-MsgGUID: DVCQM+5+RD6VUi/JG/MB4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="68837281"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 06:57:27 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Mark Brown <broonie@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Tomas Winkler <tomas.winkler@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 01/12] spi: add driver for intel graphics on-die spi device
Date: Mon, 16 Sep 2024 16:49:17 +0300
Message-Id: <20240916134928.3654054-2-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240916134928.3654054-1-alexander.usyskin@intel.com>
References: <20240916134928.3654054-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
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

Add auxiliary driver for intel discrete graphics
on-die spi device.

CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 MAINTAINERS                      |   7 ++
 drivers/spi/Kconfig              |  11 +++
 drivers/spi/Makefile             |   1 +
 drivers/spi/spi-intel-dg.c       | 142 +++++++++++++++++++++++++++++++
 include/linux/intel_dg_spi_aux.h |  27 ++++++
 5 files changed, 188 insertions(+)
 create mode 100644 drivers/spi/spi-intel-dg.c
 create mode 100644 include/linux/intel_dg_spi_aux.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 333ed0718175..b2c1aa743bc6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11214,6 +11214,13 @@ L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	arch/x86/include/asm/intel-family.h
 
+INTEL DISCRETE GRAPHIC SPI FLASH DRIVER
+M:	Alexander Usyskin <alexander.usyskin@intel.com>
+L:	linux-spi@vger.kernel.org
+S:	Supported
+F:	drivers/spi/spi-intel-dg.c
+F:	include/linux/intel_dg_spi_aux.h
+
 INTEL DRM DISPLAY FOR XE AND I915 DRIVERS
 M:	Jani Nikula <jani.nikula@linux.intel.com>
 M:	Rodrigo Vivi <rodrigo.vivi@intel.com>
diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index ec1550c698d5..95d6667dc127 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -524,6 +524,17 @@ config SPI_INTEL_PLATFORM
 	  To compile this driver as a module, choose M here: the module
 	  will be called spi-intel-platform.
 
+config SPI_INTEL_DG
+	tristate "Intel Discrete Graphic SPI flash driver"
+	depends on AUXILIARY_BUS
+	depends on MTD
+	help
+	  This enables support for Intel Discrete Graphic SPI
+	  auxiliary device.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called spi-intel-dg.
+
 config SPI_JCORE
 	tristate "J-Core SPI Master"
 	depends on OF && (SUPERH || COMPILE_TEST)
diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
index a9b1bc259b68..ae8398930f3b 100644
--- a/drivers/spi/Makefile
+++ b/drivers/spi/Makefile
@@ -71,6 +71,7 @@ obj-$(CONFIG_SPI_INGENIC)		+= spi-ingenic.o
 obj-$(CONFIG_SPI_INTEL)			+= spi-intel.o
 obj-$(CONFIG_SPI_INTEL_PCI)		+= spi-intel-pci.o
 obj-$(CONFIG_SPI_INTEL_PLATFORM)	+= spi-intel-platform.o
+obj-$(CONFIG_SPI_INTEL_DG)		+= spi-intel-dg.o
 obj-$(CONFIG_SPI_LANTIQ_SSC)		+= spi-lantiq-ssc.o
 obj-$(CONFIG_SPI_JCORE)			+= spi-jcore.o
 obj-$(CONFIG_SPI_LJCA)			+= spi-ljca.o
diff --git a/drivers/spi/spi-intel-dg.c b/drivers/spi/spi-intel-dg.c
new file mode 100644
index 000000000000..4e302957f077
--- /dev/null
+++ b/drivers/spi/spi-intel-dg.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright(c) 2019-2024, Intel Corporation. All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/intel_dg_spi_aux.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/string.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+struct intel_dg_spi {
+	struct kref refcnt;
+	void __iomem *base;
+	size_t size;
+	unsigned int nregions;
+	struct {
+		const char *name;
+		u8 id;
+		u64 offset;
+		u64 size;
+	} regions[];
+};
+
+static void intel_dg_spi_release(struct kref *kref)
+{
+	struct intel_dg_spi *spi = container_of(kref, struct intel_dg_spi, refcnt);
+	int i;
+
+	pr_debug("freeing spi memory\n");
+	for (i = 0; i < spi->nregions; i++)
+		kfree(spi->regions[i].name);
+	kfree(spi);
+}
+
+static int intel_dg_spi_probe(struct auxiliary_device *aux_dev,
+			      const struct auxiliary_device_id *aux_dev_id)
+{
+	struct intel_dg_spi_dev *ispi = auxiliary_dev_to_intel_dg_spi_dev(aux_dev);
+	struct device *device;
+	struct intel_dg_spi *spi;
+	unsigned int nregions;
+	unsigned int i, n;
+	size_t size;
+	char *name;
+	size_t name_size;
+	int ret;
+
+	device = &aux_dev->dev;
+
+	/* count available regions */
+	for (nregions = 0, i = 0; i < INTEL_DG_SPI_REGIONS; i++) {
+		if (ispi->regions[i].name)
+			nregions++;
+	}
+
+	if (!nregions) {
+		dev_err(device, "no regions defined\n");
+		return -ENODEV;
+	}
+
+	size = sizeof(*spi) + sizeof(spi->regions[0]) * nregions;
+	spi = kzalloc(size, GFP_KERNEL);
+	if (!spi)
+		return -ENOMEM;
+
+	kref_init(&spi->refcnt);
+
+	spi->nregions = nregions;
+	for (n = 0, i = 0; i < INTEL_DG_SPI_REGIONS; i++) {
+		if (ispi->regions[i].name) {
+			name_size = strlen(dev_name(&aux_dev->dev)) +
+				    strlen(ispi->regions[i].name) + 2; /* for point */
+			name = kzalloc(name_size, GFP_KERNEL);
+			if (!name)
+				continue;
+			snprintf(name, name_size, "%s.%s",
+				 dev_name(&aux_dev->dev), ispi->regions[i].name);
+			spi->regions[n].name = name;
+			spi->regions[n].id = i;
+			n++;
+		}
+	}
+
+	spi->base = devm_ioremap_resource(device, &ispi->bar);
+	if (IS_ERR(spi->base)) {
+		dev_err(device, "mmio not mapped\n");
+		ret = PTR_ERR(spi->base);
+		goto err;
+	}
+
+	dev_set_drvdata(&aux_dev->dev, spi);
+
+	return 0;
+
+err:
+	kref_put(&spi->refcnt, intel_dg_spi_release);
+	return ret;
+}
+
+static void intel_dg_spi_remove(struct auxiliary_device *aux_dev)
+{
+	struct intel_dg_spi *spi = dev_get_drvdata(&aux_dev->dev);
+
+	if (!spi)
+		return;
+
+	dev_set_drvdata(&aux_dev->dev, NULL);
+
+	kref_put(&spi->refcnt, intel_dg_spi_release);
+}
+
+static const struct auxiliary_device_id intel_dg_spi_id_table[] = {
+	{
+		.name = "i915.spi",
+	},
+	{
+		.name = "xe.spi",
+	},
+	{
+		/* sentinel */
+	}
+};
+MODULE_DEVICE_TABLE(auxiliary, intel_dg_spi_id_table);
+
+static struct auxiliary_driver intel_dg_spi_driver = {
+	.probe  = intel_dg_spi_probe,
+	.remove = intel_dg_spi_remove,
+	.driver = {
+		/* auxiliary_driver_register() sets .name to be the modname */
+	},
+	.id_table = intel_dg_spi_id_table
+};
+
+module_auxiliary_driver(intel_dg_spi_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Intel Corporation");
+MODULE_DESCRIPTION("Intel DGFX SPI driver");
diff --git a/include/linux/intel_dg_spi_aux.h b/include/linux/intel_dg_spi_aux.h
new file mode 100644
index 000000000000..d4c3830d56d6
--- /dev/null
+++ b/include/linux/intel_dg_spi_aux.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019-2024, Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INTEL_DG_SPI_AUX_H__
+#define __INTEL_DG_SPI_AUX_H__
+
+#include <linux/auxiliary_bus.h>
+
+#define INTEL_DG_SPI_REGIONS 13
+
+struct intel_dg_spi_region {
+	const char *name;
+};
+
+struct intel_dg_spi_dev {
+	struct auxiliary_device aux_dev;
+	bool writeable_override;
+	struct resource bar;
+	const struct intel_dg_spi_region *regions;
+};
+
+#define auxiliary_dev_to_intel_dg_spi_dev(auxiliary_dev) \
+	container_of(auxiliary_dev, struct intel_dg_spi_dev, aux_dev)
+
+#endif /* __INTEL_DG_SPI_AUX_H__ */
-- 
2.34.1

