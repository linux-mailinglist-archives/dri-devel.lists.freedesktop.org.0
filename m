Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBBBA46017
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 14:03:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3913210E903;
	Wed, 26 Feb 2025 13:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y5LOmGvq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249E410E903;
 Wed, 26 Feb 2025 13:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740575022; x=1772111022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BV5mzWnGJqWVT6+tMv9noTMr3UiDp5q+3CjaslND8uY=;
 b=Y5LOmGvqcd4BxBsLUz3WUkj2aRYDykkakZrDBUv4gm/YYCfr799qcShy
 pju6rbRtHZkVD/c31vZekwaoAOwU+yMgGPa7aJPqh2+++6OFLgtpvjf9+
 Fyvjs1sAtGr3pdZPjicx/eSb7HttRH3hUOG9dL7QYC83JR3G2IOP5M+zR
 IBxMMA4SR9fVzID192SxHc7nQLXX5y1yEVLF4FNXVF2ENMPU+JOvUvpyl
 WI2StXrZPotgq7IpjkZnv2mhYyWVWp9BpyRTQf9N5YKvXHBbDuc6iGpjk
 lxtljxMSNzHOC4RDN02SoGLhhnuUE+PJPg8FkqavTdP1TT12uYnKR3mHe w==;
X-CSE-ConnectionGUID: PzM8h9ckSsuP2lmbd4SzIA==
X-CSE-MsgGUID: MDwxcm/5SXyrPHigtwDO5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41341634"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="41341634"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 05:03:41 -0800
X-CSE-ConnectionGUID: o2wxEGl4SUSDAxBHlKbgwA==
X-CSE-MsgGUID: Bqzc97qdQpezQ7DjerdxGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="121690966"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 05:03:35 -0800
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Karthik Poosa <karthik.poosa@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
 Oren Weil <oren.jer.weil@intel.com>, linux-mtd@lists.infradead.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Tomas Winkler <tomasw@gmail.com>
Subject: [PATCH v5 08/11] drm/i915/nvm: add nvm device for discrete graphics
Date: Wed, 26 Feb 2025 14:51:40 +0200
Message-ID: <20250226125143.3791515-9-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226125143.3791515-1-alexander.usyskin@intel.com>
References: <20250226125143.3791515-1-alexander.usyskin@intel.com>
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

Enable access to internal non-volatile memory on
DGFX devices via a child device.
The nvm child device is exposed via auxiliary bus.

CC: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Co-developed-by: Tomas Winkler <tomasw@gmail.com>
Signed-off-by: Tomas Winkler <tomasw@gmail.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/i915/Makefile      |  4 ++
 drivers/gpu/drm/i915/i915_driver.c |  6 ++
 drivers/gpu/drm/i915/i915_drv.h    |  3 +
 drivers/gpu/drm/i915/i915_reg.h    |  1 +
 drivers/gpu/drm/i915/intel_nvm.c   | 92 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/intel_nvm.h   | 15 +++++
 6 files changed, 121 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/intel_nvm.c
 create mode 100644 drivers/gpu/drm/i915/intel_nvm.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 3dda9f0eda82..28835163a225 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -213,6 +213,10 @@ i915-y += \
 i915-y += \
 	gt/intel_gsc.o
 
+# graphics nvm device (DGFX) support
+i915-y += \
+	intel_nvm.o
+
 # graphics hardware monitoring (HWMON) support
 i915-$(CONFIG_HWMON) += \
 	i915_hwmon.o
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index ce163f58fd76..c58e4ca19e1d 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -81,6 +81,8 @@
 #include "soc/intel_dram.h"
 #include "soc/intel_gmch.h"
 
+#include "intel_nvm.h"
+
 #include "i915_debugfs.h"
 #include "i915_driver.h"
 #include "i915_drm_client.h"
@@ -644,6 +646,8 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
 	/* Depends on sysfs having been initialized */
 	i915_perf_register(dev_priv);
 
+	intel_nvm_init(dev_priv);
+
 	for_each_gt(gt, dev_priv, i)
 		intel_gt_driver_register(gt);
 
@@ -684,6 +688,8 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
 
 	i915_hwmon_unregister(dev_priv);
 
+	intel_nvm_fini(dev_priv);
+
 	i915_perf_unregister(dev_priv);
 	i915_pmu_unregister(dev_priv);
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index b96b8de12756..cdeec04a8545 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -67,6 +67,7 @@
 struct drm_i915_clock_gating_funcs;
 struct vlv_s0ix_state;
 struct intel_pxp;
+struct intel_dg_nvm_dev;
 
 #define GEM_QUIRK_PIN_SWIZZLED_PAGES	BIT(0)
 
@@ -315,6 +316,8 @@ struct drm_i915_private {
 
 	struct i915_perf perf;
 
+	struct intel_dg_nvm_dev *nvm;
+
 	struct i915_hwmon *hwmon;
 
 	struct intel_gt *gt[I915_MAX_GT];
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 765e6c0528fb..59b87737ac0c 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -321,6 +321,7 @@
 #define DG2_GSC_HECI2_BASE	0x00374000
 #define MTL_GSC_HECI1_BASE	0x00116000
 #define MTL_GSC_HECI2_BASE	0x00117000
+#define GEN12_GUNIT_NVM_BASE	0x00102040
 
 #define HECI_H_CSR(base)	_MMIO((base) + 0x4)
 #define   HECI_H_CSR_IE		REG_BIT(0)
diff --git a/drivers/gpu/drm/i915/intel_nvm.c b/drivers/gpu/drm/i915/intel_nvm.c
new file mode 100644
index 000000000000..75d3ebe669ff
--- /dev/null
+++ b/drivers/gpu/drm/i915/intel_nvm.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2019-2024, Intel Corporation. All rights reserved.
+ */
+
+#include <linux/intel_dg_nvm_aux.h>
+#include <linux/irq.h>
+#include "i915_reg.h"
+#include "i915_drv.h"
+#include "intel_nvm.h"
+
+#define GEN12_GUNIT_NVM_SIZE 0x80
+
+static const struct intel_dg_nvm_region regions[INTEL_DG_NVM_REGIONS] = {
+	[0] = { .name = "DESCRIPTOR", },
+	[2] = { .name = "GSC", },
+	[11] = { .name = "OptionROM", },
+	[12] = { .name = "DAM", },
+};
+
+static void i915_nvm_release_dev(struct device *dev)
+{
+}
+
+void intel_nvm_init(struct drm_i915_private *i915)
+{
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
+	struct intel_dg_nvm_dev *nvm;
+	struct auxiliary_device *aux_dev;
+	int ret;
+
+	/* Only the DGFX devices have internal NVM */
+	if (!IS_DGFX(i915))
+		return;
+
+	/* Nvm pointer should be NULL here */
+	if (WARN_ON(i915->nvm))
+		return;
+
+	i915->nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
+	if (!i915->nvm)
+		return;
+
+	nvm = i915->nvm;
+
+	nvm->writeable_override = true;
+	nvm->bar.parent = &pdev->resource[0];
+	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev->resource[0].start;
+	nvm->bar.end = nvm->bar.start + GEN12_GUNIT_NVM_SIZE - 1;
+	nvm->bar.flags = IORESOURCE_MEM;
+	nvm->bar.desc = IORES_DESC_NONE;
+	nvm->regions = regions;
+
+	aux_dev = &nvm->aux_dev;
+
+	aux_dev->name = "nvm";
+	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) |
+		       PCI_DEVID(pdev->bus->number, pdev->devfn);
+	aux_dev->dev.parent = &pdev->dev;
+	aux_dev->dev.release = i915_nvm_release_dev;
+
+	ret = auxiliary_device_init(aux_dev);
+	if (ret) {
+		drm_err(&i915->drm, "i915-nvm aux init failed %d\n", ret);
+		return;
+	}
+
+	ret = auxiliary_device_add(aux_dev);
+	if (ret) {
+		drm_err(&i915->drm, "i915-nvm aux add failed %d\n", ret);
+		auxiliary_device_uninit(aux_dev);
+		return;
+	}
+}
+
+void intel_nvm_fini(struct drm_i915_private *i915)
+{
+	struct intel_dg_nvm_dev *nvm = i915->nvm;
+
+	/* Only the DGFX devices have internal NVM */
+	if (!IS_DGFX(i915))
+		return;
+
+	/* Nvm pointer should not be NULL here */
+	if (WARN_ON(!nvm))
+		return;
+
+	auxiliary_device_delete(&nvm->aux_dev);
+	auxiliary_device_uninit(&nvm->aux_dev);
+	kfree(nvm);
+	i915->nvm = NULL;
+}
diff --git a/drivers/gpu/drm/i915/intel_nvm.h b/drivers/gpu/drm/i915/intel_nvm.h
new file mode 100644
index 000000000000..7bc3d1114a3f
--- /dev/null
+++ b/drivers/gpu/drm/i915/intel_nvm.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019-2024 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INTEL_NVM_H__
+#define __INTEL_NVM_H__
+
+struct drm_i915_private;
+
+void intel_nvm_init(struct drm_i915_private *i915);
+
+void intel_nvm_fini(struct drm_i915_private *i915);
+
+#endif /* __INTEL_NVM_H__ */
-- 
2.43.0

