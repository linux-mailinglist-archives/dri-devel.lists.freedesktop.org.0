Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 446D393B265
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 16:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3334910E6FE;
	Wed, 24 Jul 2024 14:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cvH0BRId";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BBC510E6ED;
 Wed, 24 Jul 2024 14:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721830181; x=1753366181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1UEtBVrG2X6xBW4IkFht3ceQs8CbwV3vmpqfzbwcvIg=;
 b=cvH0BRIdIv3eT3aFMMs5USUo9CWTb7YW98v4Lh8d9xWqg7VyzSPhJ3Cd
 xvn4S58DrO0plI7+HxlX/r7k0Tz30aIHMo78I4Pr7ogC+CKwJgl6fQFXC
 ItRJ/Y8aIlMT7YaE592cLJFmwqT4hLMRpZ21FjH2RJkF8ZYTF22E6A0o5
 Rbd4qKk7yDejhi40c/Aj15cN5adgmF+35ysuAHcnC9hIX/8uQkvb3jj1D
 dsGZEZGGKsUrx4NJBJREeIjBheAaHYtNLNpE5BtAzdR78WTr4s44FD9Fv
 3XpiRR8W9JFlktEmMTGWFQC71OCWvOEubyOLzm22Y8b4p6xl/76SyeQKt w==;
X-CSE-ConnectionGUID: YIpHo/D3QaKLqOr59IW/Pg==
X-CSE-MsgGUID: OIUjKkgKSkuICjKqWWMSbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="30173867"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="30173867"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 07:09:40 -0700
X-CSE-ConnectionGUID: kWadJb8ERd6QCBgKxq2kRw==
X-CSE-MsgGUID: KA09bUYqRGuVIW8v6dqdTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="83211574"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 07:09:36 -0700
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
Subject: [PATCH v2 11/12] drm/xe/spi: add on-die spi device
Date: Wed, 24 Jul 2024 17:00:13 +0300
Message-Id: <20240724140014.428991-12-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240724140014.428991-1-alexander.usyskin@intel.com>
References: <20240724140014.428991-1-alexander.usyskin@intel.com>
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
index b165bbf52aef..7dd1baa1a85f 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -130,6 +130,7 @@ xe-y += xe_bb.o \
 	xe_ring_ops.o \
 	xe_sa.o \
 	xe_sched_job.o \
+	xe_spi.o \
 	xe_step.o \
 	xe_sync.o \
 	xe_tile.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5ef9b50a20d0..8fca0ea65882 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -40,6 +40,7 @@
 #include "xe_pcode.h"
 #include "xe_pm.h"
 #include "xe_query.h"
+#include "xe_spi.h"
 #include "xe_sriov.h"
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
@@ -634,6 +635,7 @@ int xe_device_probe(struct xe_device *xe)
 			goto err_fini_gt;
 	}
 
+	xe_spi_init(xe);
 	xe_heci_gsc_init(xe);
 
 	err = xe_display_init(xe);
@@ -688,6 +690,7 @@ void xe_device_remove(struct xe_device *xe)
 	xe_display_fini(xe);
 
 	xe_heci_gsc_fini(xe);
+	xe_spi_fini(xe);
 
 	for_each_gt(gt, xe, id)
 		xe_gt_remove(gt);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 2e62450d86e1..77ffec80f3d0 100644
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
@@ -39,6 +41,7 @@ struct xe_pat_ops;
 #define MEDIA_VERx100(xe) ((xe)->info.media_verx100)
 #define IS_DGFX(xe) ((xe)->info.is_dgfx)
 #define HAS_HECI_GSCFI(xe) ((xe)->info.has_heci_gscfi)
+#define HAS_GSC_SPI(xe) ((xe)->info.has_gsc_spi)
 
 #define XE_VRAM_FLAGS_NEED64K		BIT(0)
 
@@ -279,6 +282,8 @@ struct xe_device {
 		u8 skip_pcode:1;
 		/** @info.has_heci_gscfi: device has heci gscfi */
 		u8 has_heci_gscfi:1;
+		/** @info.has_gsc_spi: device has gsc spi */
+		u8 has_gsc_spi:1;
 		/** @info.skip_guc_pc: Skip GuC based PM feature init */
 		u8 skip_guc_pc:1;
 
@@ -456,6 +461,9 @@ struct xe_device {
 	/** @heci_gsc: graphics security controller */
 	struct xe_heci_gsc heci_gsc;
 
+	/** @spi: discrete graphics spi */
+	struct intel_dg_spi_dev spi;
+
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index f326dbb1cecd..345b25c3a133 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -62,6 +62,7 @@ struct xe_device_desc {
 
 	u8 has_display:1;
 	u8 has_heci_gscfi:1;
+	u8 has_gsc_spi:1;
 	u8 has_llc:1;
 	u8 has_mmio_ext:1;
 	u8 has_sriov:1;
@@ -281,6 +282,7 @@ static const struct xe_device_desc dg1_desc = {
 	PLATFORM(XE_DG1),
 	.has_display = true,
 	.has_heci_gscfi = 1,
+	.has_gsc_spi = 1,
 	.require_force_probe = true,
 };
 
@@ -292,6 +294,7 @@ static const u16 dg2_g12_ids[] = { XE_DG2_G12_IDS(NOP), 0 };
 	DGFX_FEATURES, \
 	PLATFORM(XE_DG2), \
 	.has_heci_gscfi = 1, \
+	.has_gsc_spi = 1, \
 	.subplatforms = (const struct xe_subplatform_desc[]) { \
 		{ XE_SUBPLATFORM_DG2_G10, "G10", dg2_g10_ids }, \
 		{ XE_SUBPLATFORM_DG2_G11, "G11", dg2_g11_ids }, \
@@ -323,6 +326,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
 	PLATFORM(XE_PVC),
 	.has_display = false,
 	.has_heci_gscfi = 1,
+	.has_gsc_spi = 1,
 	.require_force_probe = true,
 };
 
@@ -560,6 +564,7 @@ static int xe_info_init_early(struct xe_device *xe,
 
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
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

