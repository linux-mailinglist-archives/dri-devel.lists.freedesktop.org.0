Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 158EC93C3A7
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 16:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D9B10E824;
	Thu, 25 Jul 2024 14:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fLvutLVR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397BD10E824;
 Thu, 25 Jul 2024 14:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721916383; x=1753452383;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EXNJFht2m6L9jHx8xAQ11am5malgd49D9k/FBuaE368=;
 b=fLvutLVReT/QNHq7P8CBJhVzXJN1erwv9JFL6O35QNIyeDXb9gKH3tJY
 FRvinKU7j30x5x83Tz7yvat1FK5wHs0UC15kjEFxC9DA0z1mso19yx8+L
 9dgilKZZBD1KReQcao5gL5Ew/iDjgid1/eEgL6akPlu9Vw8WG/0Pjs3si
 LU6c41x1RHiPuB3QJ+hHL1mC/0wc/i6QiA76qFP12wOaDMsdaYnZiekvP
 5qt8w1UDJCzwZbt6XVNnnnR3Nla8mDac94N3psfiEymp+jWVYajKZbh0F
 W5O81yFP39rCve//q//NtyEynI7F3LCyCbEhaVfSErxDLM4fK2pviGX7A g==;
X-CSE-ConnectionGUID: 7tkFRduUSiuQ8Chw0upfHQ==
X-CSE-MsgGUID: Nde/Wi38RjKFXHcxdtoB8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19504988"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="19504988"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 07:06:22 -0700
X-CSE-ConnectionGUID: 8lg2xgmsRYem3GVA7NEg5g==
X-CSE-MsgGUID: kIm5gdQmSaWRfN3P+9aV5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="53007871"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 07:06:16 -0700
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
Subject: [PATCH v3 11/12] drm/xe/spi: add on-die spi device
Date: Thu, 25 Jul 2024 16:56:56 +0300
Message-Id: <20240725135657.1061836-12-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240725135657.1061836-1-alexander.usyskin@intel.com>
References: <20240725135657.1061836-1-alexander.usyskin@intel.com>
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

Enable access to internal spi on DGFX with GSC/CSC devices
via a child device.
The spi child device is exposed via auxiliary bus.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device.c       |  3 ++
 drivers/gpu/drm/xe/xe_device_types.h |  8 +++
 drivers/gpu/drm/xe/xe_pci.c          |  5 ++
 drivers/gpu/drm/xe/xe_spi.c          | 73 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_spi.h          | 15 ++++++
 6 files changed, 105 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_spi.c
 create mode 100644 drivers/gpu/drm/xe/xe_spi.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 1ff9602a52f6..f98e26b81035 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -95,6 +95,7 @@ xe-y += xe_bb.o \
 	xe_ring_ops.o \
 	xe_sa.o \
 	xe_sched_job.o \
+	xe_spi.o \
 	xe_step.o \
 	xe_sync.o \
 	xe_tile.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1aba6f9eaa19..7b7aee91497e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -47,6 +47,7 @@
 #include "xe_pcode.h"
 #include "xe_pm.h"
 #include "xe_query.h"
+#include "xe_spi.h"
 #include "xe_sriov.h"
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
@@ -720,6 +721,7 @@ int xe_device_probe(struct xe_device *xe)
 			goto err_fini_gt;
 	}
 
+	xe_spi_init(xe);
 	xe_heci_gsc_init(xe);
 
 	err = xe_oa_init(xe);
@@ -788,6 +790,7 @@ void xe_device_remove(struct xe_device *xe)
 	xe_oa_fini(xe);
 
 	xe_heci_gsc_fini(xe);
+	xe_spi_fini(xe);
 
 	for_each_gt(gt, xe, id)
 		xe_gt_remove(gt);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 5b7292a9a66d..69bd4cbbc588 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -12,6 +12,8 @@
 #include <drm/drm_file.h>
 #include <drm/ttm/ttm_device.h>
 
+#include <linux/intel_dg_spi_aux.h>
+
 #include "xe_devcoredump_types.h"
 #include "xe_heci_gsc.h"
 #include "xe_gt_types.h"
@@ -45,6 +47,7 @@ struct xe_pat_ops;
 #define IS_DGFX(xe) ((xe)->info.is_dgfx)
 #define HAS_HECI_GSCFI(xe) ((xe)->info.has_heci_gscfi)
 #define HAS_HECI_CSCFI(xe) ((xe)->info.has_heci_cscfi)
+#define HAS_GSC_SPI(xe) ((xe)->info.has_gsc_spi)
 
 #define XE_VRAM_FLAGS_NEED64K		BIT(0)
 
@@ -292,6 +295,8 @@ struct xe_device {
 		u8 has_heci_gscfi:1;
 		/** @info.has_heci_cscfi: device has heci cscfi */
 		u8 has_heci_cscfi:1;
+		/** @info.has_gsc_spi: device has gsc spi */
+		u8 has_gsc_spi:1;
 		/** @info.skip_guc_pc: Skip GuC based PM feature init */
 		u8 skip_guc_pc:1;
 		/** @info.has_atomic_enable_pte_bit: Device has atomic enable PTE bit */
@@ -473,6 +478,9 @@ struct xe_device {
 	/** @oa: oa observation subsystem */
 	struct xe_oa oa;
 
+	/** @spi: discrete graphics spi */
+	struct intel_dg_spi_dev spi;
+
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3c4a3c91377a..c74c36ee7fa6 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -60,6 +60,7 @@ struct xe_device_desc {
 	u8 has_display:1;
 	u8 has_heci_gscfi:1;
 	u8 has_heci_cscfi:1;
+	u8 has_gsc_spi:1;
 	u8 has_llc:1;
 	u8 has_mmio_ext:1;
 	u8 has_sriov:1;
@@ -283,6 +284,7 @@ static const struct xe_device_desc dg1_desc = {
 	PLATFORM(DG1),
 	.has_display = true,
 	.has_heci_gscfi = 1,
+	.has_gsc_spi = 1,
 	.require_force_probe = true,
 };
 
@@ -294,6 +296,7 @@ static const u16 dg2_g12_ids[] = { XE_DG2_G12_IDS(NOP), 0 };
 	DGFX_FEATURES, \
 	PLATFORM(DG2), \
 	.has_heci_gscfi = 1, \
+	.has_gsc_spi = 1, \
 	.subplatforms = (const struct xe_subplatform_desc[]) { \
 		{ XE_SUBPLATFORM_DG2_G10, "G10", dg2_g10_ids }, \
 		{ XE_SUBPLATFORM_DG2_G11, "G11", dg2_g11_ids }, \
@@ -325,6 +328,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
 	PLATFORM(PVC),
 	.has_display = false,
 	.has_heci_gscfi = 1,
+	.has_gsc_spi = 1,
 	.require_force_probe = true,
 };
 
@@ -609,6 +613,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
+	xe->info.has_gsc_spi = desc->has_gsc_spi;
 	xe->info.has_llc = desc->has_llc;
 	xe->info.has_mmio_ext = desc->has_mmio_ext;
 	xe->info.has_sriov = desc->has_sriov;
diff --git a/drivers/gpu/drm/xe/xe_spi.c b/drivers/gpu/drm/xe/xe_spi.c
new file mode 100644
index 000000000000..f8ad060f97f2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_spi.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2019-2024, Intel Corporation. All rights reserved.
+ */
+
+#include <linux/intel_dg_spi_aux.h>
+#include <linux/pci.h>
+#include "xe_device_types.h"
+#include "xe_spi.h"
+
+#define GEN12_GUNIT_SPI_BASE 0x00102040
+#define GEN12_GUNIT_SPI_SIZE 0x80
+#define HECI_FW_STATUS_2_SPI_ACCESS_MODE BIT(3)
+
+static const struct intel_dg_spi_region regions[INTEL_DG_SPI_REGIONS] = {
+	[0] = { .name = "DESCRIPTOR", },
+	[2] = { .name = "GSC", },
+	[11] = { .name = "OptionROM", },
+	[12] = { .name = "DAM", },
+};
+
+static void xe_spi_release_dev(struct device *dev)
+{
+}
+
+void xe_spi_init(struct xe_device *xe)
+{
+	struct intel_dg_spi_dev *spi = &xe->spi;
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct auxiliary_device *aux_dev = &spi->aux_dev;
+	int ret;
+
+	if (!HAS_GSC_SPI(xe))
+		return;
+
+	spi->writeable_override = false;
+	spi->bar.parent = &pdev->resource[0];
+	spi->bar.start = GEN12_GUNIT_SPI_BASE + pdev->resource[0].start;
+	spi->bar.end = spi->bar.start + GEN12_GUNIT_SPI_SIZE - 1;
+	spi->bar.flags = IORESOURCE_MEM;
+	spi->bar.desc = IORES_DESC_NONE;
+	spi->regions = regions;
+
+	aux_dev->name = "spi";
+	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) |
+		       PCI_DEVID(pdev->bus->number, pdev->devfn);
+	aux_dev->dev.parent = &pdev->dev;
+	aux_dev->dev.release = xe_spi_release_dev;
+
+	ret = auxiliary_device_init(aux_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "xe-spi aux init failed %d\n", ret);
+		return;
+	}
+
+	ret = auxiliary_device_add(aux_dev);
+	if (ret) {
+		dev_err(&pdev->dev, "xe-spi aux add failed %d\n", ret);
+		auxiliary_device_uninit(aux_dev);
+		return;
+	}
+}
+
+void xe_spi_fini(struct xe_device *xe)
+{
+	struct intel_dg_spi_dev *spi = &xe->spi;
+
+	if (!HAS_GSC_SPI(xe))
+		return;
+
+	auxiliary_device_delete(&spi->aux_dev);
+	auxiliary_device_uninit(&spi->aux_dev);
+}
diff --git a/drivers/gpu/drm/xe/xe_spi.h b/drivers/gpu/drm/xe/xe_spi.h
new file mode 100644
index 000000000000..aef79893a864
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_spi.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019-2024 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __XE_SPI_H__
+#define __XE_SPI_H__
+
+struct xe_device;
+
+void xe_spi_init(struct xe_device *xe);
+
+void xe_spi_fini(struct xe_device *xe);
+
+#endif /* __XE_SPI_H__ */
-- 
2.34.1

