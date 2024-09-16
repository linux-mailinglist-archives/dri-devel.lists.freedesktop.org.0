Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CC397A374
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 15:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3071310E394;
	Mon, 16 Sep 2024 13:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VEEyDZNW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A840910E37A;
 Mon, 16 Sep 2024 13:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726495140; x=1758031140;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=glTurFySDgUymCmwWl34En+NVKpa+Ov3zTIvYkIgX38=;
 b=VEEyDZNWKo2z+EQsoyGXPWffjoElFOYu+56mpJ53u3YE31Pnm6U296z7
 /M0XLx4ajefzTgnpJmVVNftCAvDGw6kIeRefxCklquCLihZjZ3hoj9TqX
 TeH12Bcxh5pcOZW2t5PvXTCnzmsTBLX+MPgh+N2edxa54a9sBnogwU4C9
 mddm4w0cwxAgpHaQ+Jy472pN0WQf7ynw3SK3w/LZGLNDjp4cuEHJ9vr3W
 tZ5XBBFNNVvLMZc63k5lvSogj6c7GNY0brkUvYqAvazsDWzLPc7das2U+
 ExZBpZg00f2rzLysnCqM4X4bSzP9D+OBSFQGTwmedCFsyITucZlc0Krlw w==;
X-CSE-ConnectionGUID: 1RxbZJnLRj65ZD9XdMayBw==
X-CSE-MsgGUID: YWv7fqBLSJO+Cif9A3kNBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="36666936"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="36666936"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 06:58:23 -0700
X-CSE-ConnectionGUID: VRfkCdksTYStnht5ELVKvA==
X-CSE-MsgGUID: Kx8WEA6RSAOoBmZF675r6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="68837506"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 06:58:18 -0700
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
Subject: [PATCH v6 11/12] drm/xe/spi: add on-die spi device
Date: Mon, 16 Sep 2024 16:49:27 +0300
Message-Id: <20240916134928.3654054-12-alexander.usyskin@intel.com>
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

Enable access to internal spi on DGFX with GSC/CSC devices
via a child device.
The spi child device is exposed via auxiliary bus.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device.c       |  3 +
 drivers/gpu/drm/xe/xe_device_types.h |  8 +++
 drivers/gpu/drm/xe/xe_pci.c          |  5 ++
 drivers/gpu/drm/xe/xe_spi.c          | 82 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_spi.h          | 15 +++++
 6 files changed, 114 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_spi.c
 create mode 100644 drivers/gpu/drm/xe/xe_spi.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index edfd812e0f41..90f995b04479 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -93,6 +93,7 @@ xe-y += xe_bb.o \
 	xe_ring_ops.o \
 	xe_sa.o \
 	xe_sched_job.o \
+	xe_spi.o \
 	xe_step.o \
 	xe_sync.o \
 	xe_tile.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4d3c794f134c..25ca0b53c5c1 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -48,6 +48,7 @@
 #include "xe_pcode.h"
 #include "xe_pm.h"
 #include "xe_query.h"
+#include "xe_spi.h"
 #include "xe_sriov.h"
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
@@ -734,6 +735,7 @@ int xe_device_probe(struct xe_device *xe)
 			goto err_fini_gt;
 	}
 
+	xe_spi_init(xe);
 	xe_heci_gsc_init(xe);
 
 	err = xe_oa_init(xe);
@@ -802,6 +804,7 @@ void xe_device_remove(struct xe_device *xe)
 	xe_oa_fini(xe);
 
 	xe_heci_gsc_fini(xe);
+	xe_spi_fini(xe);
 
 	for_each_gt(gt, xe, id)
 		xe_gt_remove(gt);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c92df0a2423f..dfc0183cabe0 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -12,6 +12,8 @@
 #include <drm/drm_file.h>
 #include <drm/ttm/ttm_device.h>
 
+#include <linux/intel_dg_spi_aux.h>
+
 #include "xe_devcoredump_types.h"
 #include "xe_heci_gsc.h"
 #include "xe_lmtt_types.h"
@@ -44,6 +46,7 @@ struct xe_pat_ops;
 #define IS_DGFX(xe) ((xe)->info.is_dgfx)
 #define HAS_HECI_GSCFI(xe) ((xe)->info.has_heci_gscfi)
 #define HAS_HECI_CSCFI(xe) ((xe)->info.has_heci_cscfi)
+#define HAS_GSC_SPI(xe) ((xe)->info.has_gsc_spi)
 
 #define XE_VRAM_FLAGS_NEED64K		BIT(0)
 
@@ -331,6 +334,8 @@ struct xe_device {
 		u8 has_heci_gscfi:1;
 		/** @info.has_heci_cscfi: device has heci cscfi */
 		u8 has_heci_cscfi:1;
+		/** @info.has_gsc_spi: device has gsc spi */
+		u8 has_gsc_spi:1;
 		/** @info.skip_guc_pc: Skip GuC based PM feature init */
 		u8 skip_guc_pc:1;
 		/** @info.has_atomic_enable_pte_bit: Device has atomic enable PTE bit */
@@ -499,6 +504,9 @@ struct xe_device {
 	/** @heci_gsc: graphics security controller */
 	struct xe_heci_gsc heci_gsc;
 
+	/** @spi: discrete graphics spi */
+	struct intel_dg_spi_dev spi;
+
 	/** @oa: oa observation subsystem */
 	struct xe_oa oa;
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index a1d08e20cd34..45be73ccf274 100644
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
@@ -282,6 +283,7 @@ static const struct xe_device_desc dg1_desc = {
 	PLATFORM(DG1),
 	.has_display = true,
 	.has_heci_gscfi = 1,
+	.has_gsc_spi = 1,
 	.require_force_probe = true,
 };
 
@@ -293,6 +295,7 @@ static const u16 dg2_g12_ids[] = { XE_DG2_G12_IDS(NOP), 0 };
 	DGFX_FEATURES, \
 	PLATFORM(DG2), \
 	.has_heci_gscfi = 1, \
+	.has_gsc_spi = 1, \
 	.subplatforms = (const struct xe_subplatform_desc[]) { \
 		{ XE_SUBPLATFORM_DG2_G10, "G10", dg2_g10_ids }, \
 		{ XE_SUBPLATFORM_DG2_G11, "G11", dg2_g11_ids }, \
@@ -324,6 +327,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
 	PLATFORM(PVC),
 	.has_display = false,
 	.has_heci_gscfi = 1,
+	.has_gsc_spi = 1,
 	.require_force_probe = true,
 };
 
@@ -613,6 +617,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
+	xe->info.has_gsc_spi = desc->has_gsc_spi;
 	xe->info.has_llc = desc->has_llc;
 	xe->info.has_mmio_ext = desc->has_mmio_ext;
 	xe->info.has_sriov = desc->has_sriov;
diff --git a/drivers/gpu/drm/xe/xe_spi.c b/drivers/gpu/drm/xe/xe_spi.c
new file mode 100644
index 000000000000..37080b82e9ae
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_spi.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2019-2024, Intel Corporation. All rights reserved.
+ */
+
+#include <linux/intel_dg_spi_aux.h>
+#include <linux/pci.h>
+#include "xe_device_types.h"
+#include "xe_spi.h"
+#include "xe_sriov.h"
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
+	/* No access to internal SPI from VFs */
+	if (IS_SRIOV_VF(xe))
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
+	/* No access to internal SPI from VFs */
+	if (IS_SRIOV_VF(xe))
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

