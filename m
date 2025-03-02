Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D32A4B22A
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 15:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF7C10E327;
	Sun,  2 Mar 2025 14:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJc4G1P1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D0310E327;
 Sun,  2 Mar 2025 14:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740925296; x=1772461296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7euSt/kjCuMQkkaQNF2BgbWiqhiqKrlEFQcwMV0MGGc=;
 b=LJc4G1P1F93AGqRdYES/JHo7169+WKJYGVkNf5YLXmvwE8+zDzO9ZBl4
 o92rRjwYdCeLc8sTqjE+w5vSVA1pUrhgE3f8nz0nV2fJj657dVXjadA9l
 M+356DR7GylJgVVe/hlsNWS877TreTesQx1lBmXL8jmM25MdEvZHH6dyz
 GSe21QJ8eMHx8Ow9/lAU81GWAZPXAsWzBKKV7bXJTX4R6r2aF/tVazmBP
 9vcCnp7y4OJsr/Y4g/AwvSeU9dDMoQ69EkdjvCcW255GwE7uG53DH0oq8
 VW1xTCaMF37ZUbl6h27yJ4GVegFIKPdKczBbB8FzBmIiOIlmHZNcib8Np A==;
X-CSE-ConnectionGUID: QSv46hrzSECLsnbraept9Q==
X-CSE-MsgGUID: yVx+qJSISsiqfLlZlw9IzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="67176503"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; d="scan'208";a="67176503"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2025 06:21:35 -0800
X-CSE-ConnectionGUID: S8ZAWG9sSaWJzRgTqVo4gg==
X-CSE-MsgGUID: awtbU0AjTqi71z6l/uWS8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; d="scan'208";a="122737392"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2025 06:21:28 -0800
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
 Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH v6 10/11] drm/xe/nvm: add on-die non-volatile memory device
Date: Sun,  2 Mar 2025 16:09:20 +0200
Message-ID: <20250302140921.504304-11-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250302140921.504304-1-alexander.usyskin@intel.com>
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
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

Enable access to internal non-volatile memory on DGFX
with GSC/CSC devices via a child device.
The nvm child device is exposed via auxiliary bus.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_device.c       |   5 ++
 drivers/gpu/drm/xe/xe_device_types.h |   6 ++
 drivers/gpu/drm/xe/xe_nvm.c          | 101 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_nvm.h          |  15 ++++
 drivers/gpu/drm/xe/xe_pci.c          |   6 ++
 6 files changed, 134 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_nvm.c
 create mode 100644 drivers/gpu/drm/xe/xe_nvm.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 856b14fe1c4d..3d1f1192ad4a 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -80,6 +80,7 @@ xe-y += xe_bb.o \
 	xe_mmio.o \
 	xe_mocs.o \
 	xe_module.o \
+	xe_nvm.o \
 	xe_oa.o \
 	xe_observation.o \
 	xe_pat.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9454b51f7ad8..76cb988afa1a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -52,6 +52,7 @@
 #include "xe_pmu.h"
 #include "xe_pxp.h"
 #include "xe_query.h"
+#include "xe_nvm.h"
 #include "xe_sriov.h"
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
@@ -854,6 +855,8 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
+	xe_nvm_init(xe);
+
 	err = xe_heci_gsc_init(xe);
 	if (err)
 		return err;
@@ -907,6 +910,8 @@ void xe_device_remove(struct xe_device *xe)
 {
 	xe_display_unregister(xe);
 
+	xe_nvm_fini(xe);
+
 	drm_dev_unplug(&xe->drm);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 833c29fed3a3..5caa9daeee6b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -35,6 +35,7 @@
 #include "intel_display_device.h"
 #endif
 
+struct intel_dg_nvm_dev;
 struct xe_ggtt;
 struct xe_pat_ops;
 struct xe_pxp;
@@ -302,6 +303,8 @@ struct xe_device {
 		u8 has_device_atomics_on_smem:1;
 		/** @info.has_flat_ccs: Whether flat CCS metadata is used */
 		u8 has_flat_ccs:1;
+		/** @info.has_gsc_nvm: Device has gsc non-volatile memory */
+		u8 has_gsc_nvm:1;
 		/** @info.has_heci_cscfi: device has heci cscfi */
 		u8 has_heci_cscfi:1;
 		/** @info.has_heci_gscfi: device has heci gscfi */
@@ -508,6 +511,9 @@ struct xe_device {
 	/** @heci_gsc: graphics security controller */
 	struct xe_heci_gsc heci_gsc;
 
+	/** @nvm: discrete graphics non-volatile memory */
+	struct intel_dg_nvm_dev *nvm;
+
 	/** @oa: oa observation subsystem */
 	struct xe_oa oa;
 
diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
new file mode 100644
index 000000000000..26de7d4472c8
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_nvm.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2019-2025, Intel Corporation. All rights reserved.
+ */
+
+#include <linux/intel_dg_nvm_aux.h>
+#include <linux/pci.h>
+
+#include "xe_device_types.h"
+#include "xe_nvm.h"
+#include "xe_sriov.h"
+
+#define GEN12_GUNIT_NVM_BASE 0x00102040
+#define GEN12_GUNIT_NVM_SIZE 0x80
+#define HECI_FW_STATUS_2_NVM_ACCESS_MODE BIT(3)
+
+static const struct intel_dg_nvm_region regions[INTEL_DG_NVM_REGIONS] = {
+	[0] = { .name = "DESCRIPTOR", },
+	[2] = { .name = "GSC", },
+	[11] = { .name = "OptionROM", },
+	[12] = { .name = "DAM", },
+};
+
+static void xe_nvm_release_dev(struct device *dev)
+{
+}
+
+void xe_nvm_init(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct intel_dg_nvm_dev *nvm;
+	struct auxiliary_device *aux_dev;
+	int ret;
+
+	if (!xe->info.has_gsc_nvm)
+		return;
+
+	/* No access to internal NVM from VFs */
+	if (IS_SRIOV_VF(xe))
+		return;
+
+	/* Nvm pointer should be NULL here */
+	if (WARN_ON(xe->nvm))
+		return;
+
+	xe->nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
+	if (!xe->nvm)
+		return;
+
+	nvm = xe->nvm;
+
+	nvm->writeable_override = false;
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
+	aux_dev->dev.release = xe_nvm_release_dev;
+
+	ret = auxiliary_device_init(aux_dev);
+	if (ret) {
+		drm_err(&xe->drm, "xe-nvm aux init failed %d\n", ret);
+		return;
+	}
+
+	ret = auxiliary_device_add(aux_dev);
+	if (ret) {
+		drm_err(&xe->drm, "xe-nvm aux add failed %d\n", ret);
+		auxiliary_device_uninit(aux_dev);
+		return;
+	}
+}
+
+void xe_nvm_fini(struct xe_device *xe)
+{
+	struct intel_dg_nvm_dev *nvm = xe->nvm;
+
+	if (!xe->info.has_gsc_nvm)
+		return;
+
+	/* No access to internal NVM from VFs */
+	if (IS_SRIOV_VF(xe))
+		return;
+
+	/* Nvm pointer should not be NULL here */
+	if (WARN_ON(!nvm))
+		return;
+
+	auxiliary_device_delete(&nvm->aux_dev);
+	auxiliary_device_uninit(&nvm->aux_dev);
+	kfree(nvm);
+	xe->nvm = NULL;
+}
diff --git a/drivers/gpu/drm/xe/xe_nvm.h b/drivers/gpu/drm/xe/xe_nvm.h
new file mode 100644
index 000000000000..5487764c180f
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_nvm.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2019-2025 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __XE_NVM_H__
+#define __XE_NVM_H__
+
+struct xe_device;
+
+void xe_nvm_init(struct xe_device *xe);
+
+void xe_nvm_fini(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 8b6658b214be..51a729d1ef98 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -62,6 +62,7 @@ struct xe_device_desc {
 	u8 is_dgfx:1;
 
 	u8 has_display:1;
+	u8 has_gsc_nvm:1;
 	u8 has_heci_gscfi:1;
 	u8 has_heci_cscfi:1;
 	u8 has_llc:1;
@@ -285,6 +286,7 @@ static const struct xe_device_desc dg1_desc = {
 	PLATFORM(DG1),
 	.dma_mask_size = 39,
 	.has_display = true,
+	.has_gsc_nvm = 1,
 	.has_heci_gscfi = 1,
 	.require_force_probe = true,
 };
@@ -296,6 +298,7 @@ static const u16 dg2_g12_ids[] = { INTEL_DG2_G12_IDS(NOP), 0 };
 #define DG2_FEATURES \
 	DGFX_FEATURES, \
 	PLATFORM(DG2), \
+	.has_gsc_nvm = 1, \
 	.has_heci_gscfi = 1, \
 	.subplatforms = (const struct xe_subplatform_desc[]) { \
 		{ XE_SUBPLATFORM_DG2_G10, "G10", dg2_g10_ids }, \
@@ -330,6 +333,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
 	PLATFORM(PVC),
 	.dma_mask_size = 52,
 	.has_display = false,
+	.has_gsc_nvm = 1,
 	.has_heci_gscfi = 1,
 	.max_remote_tiles = 1,
 	.require_force_probe = true,
@@ -356,6 +360,7 @@ static const struct xe_device_desc bmg_desc = {
 	PLATFORM(BATTLEMAGE),
 	.dma_mask_size = 46,
 	.has_display = true,
+	.has_gsc_nvm = 1,
 	.has_heci_cscfi = 1,
 };
 
@@ -631,6 +636,7 @@ static int xe_info_init_early(struct xe_device *xe,
 
 	xe->info.dma_mask_size = desc->dma_mask_size;
 	xe->info.is_dgfx = desc->is_dgfx;
+	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
 	xe->info.has_llc = desc->has_llc;
-- 
2.43.0

