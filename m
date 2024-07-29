Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC5793F049
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 10:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271C110E357;
	Mon, 29 Jul 2024 08:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ESfAX37d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D374910E356;
 Mon, 29 Jul 2024 08:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722243152; x=1753779152;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C80lflxrNHtqvajVDZlHbHbK1vtaBE682PltPOrdB0A=;
 b=ESfAX37dqfYrRzrahmQYQHnY07wscbcyYqz9fwE8rWz8LwM/rVACmGfC
 aqpaU+QVhuaMlL5oQ36qhGnacKb7VWI46Rvt5rE/4oOIGVcm9g7fayVGK
 9EFJjjarspJee1y59Ivt25Zg/S8DU2tKvle05/KwaHzqLeZBy5Zo615Nt
 qfEY/WFWQxksD2T/QtwG/UrwNOYKLIqVOO0MaUs5sv/4rm9TWzX2FQzYP
 i7xEzjf0XRRSgREM7vQsFyf/gZwHDkXRcfnQakjR+bo1GqhOC4Uz1Jd1g
 +1wnjk6JdUItYVKqiAuQcqI8wcefEfePLULOAtLET6JG5MK1i/4qEUd4p Q==;
X-CSE-ConnectionGUID: /gS80eD4R82b2TfBUS+T8w==
X-CSE-MsgGUID: l6gcOeG5RZ6UAKg9Y5Ms4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="20129866"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="20129866"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 01:52:32 -0700
X-CSE-ConnectionGUID: V9I7XHY2QxiCfxufKHSvdQ==
X-CSE-MsgGUID: 8zXgPc1hTs+tl+R5WKlkBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="54708560"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 01:52:27 -0700
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
Subject: [PATCH v5 08/12] drm/i915/spi: add spi device for discrete graphics
Date: Mon, 29 Jul 2024 11:43:22 +0300
Message-Id: <20240729084326.2278014-9-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729084326.2278014-1-alexander.usyskin@intel.com>
References: <20240729084326.2278014-1-alexander.usyskin@intel.com>
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

From: Tomas Winkler <tomas.winkler@intel.com>

Enable access to internal spi on DGFX devices via a child device.
The spi child device is exposed via auxiliary bus.

CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/i915/Makefile        |  4 ++
 drivers/gpu/drm/i915/i915_driver.c   |  6 +++
 drivers/gpu/drm/i915/i915_drv.h      |  4 ++
 drivers/gpu/drm/i915/i915_reg.h      |  1 +
 drivers/gpu/drm/i915/spi/intel_spi.c | 68 ++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/spi/intel_spi.h | 15 ++++++
 6 files changed, 98 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/spi/intel_spi.c
 create mode 100644 drivers/gpu/drm/i915/spi/intel_spi.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index c63fa2133ccb..02a9faf049a7 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -211,6 +211,10 @@ i915-y += \
 i915-y += \
 	gt/intel_gsc.o
 
+# graphics spi device (DGFX) support
+i915-y += \
+	spi/intel_spi.o
+
 # graphics hardware monitoring (HWMON) support
 i915-$(CONFIG_HWMON) += \
 	i915_hwmon.o
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 161b21eff694..49916a586dac 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -81,6 +81,8 @@
 #include "soc/intel_dram.h"
 #include "soc/intel_gmch.h"
 
+#include "spi/intel_spi.h"
+
 #include "i915_debugfs.h"
 #include "i915_driver.h"
 #include "i915_drm_client.h"
@@ -619,6 +621,8 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
 	/* Depends on sysfs having been initialized */
 	i915_perf_register(dev_priv);
 
+	intel_spi_init(dev_priv);
+
 	for_each_gt(gt, dev_priv, i)
 		intel_gt_driver_register(gt);
 
@@ -662,6 +666,8 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
 
 	i915_hwmon_unregister(dev_priv);
 
+	intel_spi_fini(dev_priv);
+
 	i915_perf_unregister(dev_priv);
 	i915_pmu_unregister(dev_priv);
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index d1d21d433766..dd48fae4efe0 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -34,6 +34,8 @@
 
 #include <linux/pm_qos.h>
 
+#include <linux/intel_dg_spi_aux.h>
+
 #include <drm/ttm/ttm_device.h>
 
 #include "display/intel_display_limits.h"
@@ -315,6 +317,8 @@ struct drm_i915_private {
 
 	struct i915_perf perf;
 
+	struct intel_dg_spi_dev spi;
+
 	struct i915_hwmon *hwmon;
 
 	struct intel_gt *gt[I915_MAX_GT];
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 8e4478194d11..50dc19c58666 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -323,6 +323,7 @@
 #define DG2_GSC_HECI2_BASE	0x00374000
 #define MTL_GSC_HECI1_BASE	0x00116000
 #define MTL_GSC_HECI2_BASE	0x00117000
+#define GEN12_GUNIT_SPI_BASE	0x00102040
 
 #define HECI_H_CSR(base)	_MMIO((base) + 0x4)
 #define   HECI_H_CSR_IE		REG_BIT(0)
diff --git a/drivers/gpu/drm/i915/spi/intel_spi.c b/drivers/gpu/drm/i915/spi/intel_spi.c
new file mode 100644
index 000000000000..4b90e42b0f86
--- /dev/null
+++ b/drivers/gpu/drm/i915/spi/intel_spi.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2019-2024, Intel Corporation. All rights reserved.
+ */
+
+#include <linux/intel_dg_spi_aux.h>
+#include <linux/irq.h>
+#include "i915_reg.h"
+#include "i915_drv.h"
+#include "spi/intel_spi.h"
+
+#define GEN12_GUNIT_SPI_SIZE 0x80
+
+static void i915_spi_release_dev(struct device *dev)
+{
+}
+
+void intel_spi_init(struct drm_i915_private *dev_priv)
+{
+	struct intel_dg_spi_dev *spi = &dev_priv->spi;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
+	struct auxiliary_device *aux_dev = &spi->aux_dev;
+	int ret;
+
+	/* Only the DGFX devices have internal SPI */
+	if (!IS_DGFX(dev_priv))
+		return;
+
+	spi->bar.parent = &pdev->resource[0];
+	spi->bar.start = GEN12_GUNIT_SPI_BASE + pdev->resource[0].start;
+	spi->bar.end = spi->bar.start + GEN12_GUNIT_SPI_SIZE - 1;
+	spi->bar.flags = IORESOURCE_MEM;
+	spi->bar.desc = IORES_DESC_NONE;
+
+	aux_dev->name = "spi";
+	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) |
+		       PCI_DEVID(pdev->bus->number, pdev->devfn);
+	aux_dev->dev.parent = &pdev->dev;
+	aux_dev->dev.release = i915_spi_release_dev;
+
+	ret = auxiliary_device_init(aux_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "i915-spi aux init failed %d\n", ret);
+		return;
+	}
+
+	ret = auxiliary_device_add(aux_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "i915-spi aux add failed %d\n", ret);
+		auxiliary_device_uninit(aux_dev);
+		return;
+	}
+}
+
+void intel_spi_fini(struct drm_i915_private *dev_priv)
+{
+	struct intel_dg_spi_dev *spi = &dev_priv->spi;
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
+
+	/* Only the DGFX devices have internal SPI */
+	if (!IS_DGFX(dev_priv))
+		return;
+
+	dev_dbg(&pdev->dev, "removing i915-spi cell\n");
+
+	auxiliary_device_delete(&spi->aux_dev);
+	auxiliary_device_uninit(&spi->aux_dev);
+}
diff --git a/drivers/gpu/drm/i915/spi/intel_spi.h b/drivers/gpu/drm/i915/spi/intel_spi.h
new file mode 100644
index 000000000000..ed4153401f5d
--- /dev/null
+++ b/drivers/gpu/drm/i915/spi/intel_spi.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019-2024 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INTEL_SPI_H__
+#define __INTEL_SPI_H__
+
+struct drm_i915_private;
+
+void intel_spi_init(struct drm_i915_private *i915);
+
+void intel_spi_fini(struct drm_i915_private *i915);
+
+#endif /* __INTEL_SPI_H__ */
-- 
2.34.1

