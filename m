Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E805FADCE92
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 16:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145B310E71B;
	Tue, 17 Jun 2025 14:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k1s7HqCk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E5D10E719;
 Tue, 17 Jun 2025 14:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750168800; x=1781704800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AcC0NG4hsKbguskxsYFmplOm6kj9faB0tBx/chwtYD0=;
 b=k1s7HqCkmhjCfsPRE/7QWi9MaPhf8zFYFRXZ7LJDG4TFj3fXBhXnG1qq
 ACY0unIYAPS1xKMq9yD3S+LWCTh2B5Qb4qVpZjObxAEJ2TBMJB2KKDIue
 r475uQV8ryTsx/qYULN041hk7IMZIAcVGLdcvBwZVRLw0p0XiHniewOlI
 /R4xreFgrZfz/JJQ/8NsNoVLjYMFjYvzd4Jv2HMRS//H0V0iQuf4Jkj0n
 RThuID7ioIX9Vr1WhpKDRx1C48A3nYKNKjxa+FjppVAeKM2tBpk51u/B/
 bWp4bB/e2Fso2lDcuTvAQLl5N2Z0NxR6VMWCLc/ij1OP1wmJiyiw56l/0 Q==;
X-CSE-ConnectionGUID: u8owiFMVTJ6nb21nMgvVVA==
X-CSE-MsgGUID: SeW/j50BQw+B8IcYfxm+AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="56026608"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="56026608"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 06:59:56 -0700
X-CSE-ConnectionGUID: PlO27p/oRZ6QGAZWGHdizg==
X-CSE-MsgGUID: Hg1wsBAwTziLWjcbUu5edg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="153739575"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 06:59:49 -0700
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
 Karthik Poosa <karthik.poosa@intel.com>, Raag Jadav <raag.jadav@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>, linux-mtd@lists.infradead.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH v13 08/10] drm/xe/nvm: add on-die non-volatile memory device
Date: Tue, 17 Jun 2025 16:45:30 +0300
Message-ID: <20250617134532.3768283-9-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617134532.3768283-1-alexander.usyskin@intel.com>
References: <20250617134532.3768283-1-alexander.usyskin@intel.com>
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
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_device.c       |   5 ++
 drivers/gpu/drm/xe/xe_device_types.h |   6 ++
 drivers/gpu/drm/xe/xe_nvm.c          | 107 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_nvm.h          |  15 ++++
 drivers/gpu/drm/xe/xe_pci.c          |   6 ++
 6 files changed, 140 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_nvm.c
 create mode 100644 drivers/gpu/drm/xe/xe_nvm.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index f5f5775acdc0..7c039caefd00 100644
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
index 7e87344943cd..c7d50b098b5c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -46,6 +46,7 @@
 #include "xe_memirq.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
+#include "xe_nvm.h"
 #include "xe_oa.h"
 #include "xe_observation.h"
 #include "xe_pat.h"
@@ -881,6 +882,8 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
+	xe_nvm_init(xe);
+
 	err = xe_heci_gsc_init(xe);
 	if (err)
 		return err;
@@ -938,6 +941,8 @@ void xe_device_remove(struct xe_device *xe)
 {
 	xe_display_unregister(xe);
 
+	xe_nvm_fini(xe);
+
 	drm_dev_unplug(&xe->drm);
 
 	xe_bo_pci_dev_remove_all(xe);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 003afb279a5e..6aca4b1a2824 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -32,6 +32,7 @@
 
 struct dram_info;
 struct intel_display;
+struct intel_dg_nvm_dev;
 struct xe_ggtt;
 struct xe_pat_ops;
 struct xe_pxp;
@@ -316,6 +317,8 @@ struct xe_device {
 		u8 has_fan_control:1;
 		/** @info.has_flat_ccs: Whether flat CCS metadata is used */
 		u8 has_flat_ccs:1;
+		/** @info.has_gsc_nvm: Device has gsc non-volatile memory */
+		u8 has_gsc_nvm:1;
 		/** @info.has_heci_cscfi: device has heci cscfi */
 		u8 has_heci_cscfi:1;
 		/** @info.has_heci_gscfi: device has heci gscfi */
@@ -549,6 +552,9 @@ struct xe_device {
 	/** @heci_gsc: graphics security controller */
 	struct xe_heci_gsc heci_gsc;
 
+	/** @nvm: discrete graphics non-volatile memory */
+	struct intel_dg_nvm_dev *nvm;
+
 	/** @oa: oa observation subsystem */
 	struct xe_oa oa;
 
diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
new file mode 100644
index 000000000000..33ba635ce116
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_nvm.c
@@ -0,0 +1,107 @@
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
+	[9] = { .name = "PADDING", },
+	[11] = { .name = "OptionROM", },
+	[12] = { .name = "DAM", },
+};
+
+static void xe_nvm_release_dev(struct device *dev)
+{
+}
+
+int xe_nvm_init(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct auxiliary_device *aux_dev;
+	struct intel_dg_nvm_dev *nvm;
+	int ret;
+
+	if (!xe->info.has_gsc_nvm)
+		return 0;
+
+	/* No access to internal NVM from VFs */
+	if (IS_SRIOV_VF(xe))
+		return 0;
+
+	/* Nvm pointer should be NULL here */
+	if (WARN_ON(xe->nvm))
+		return -EFAULT;
+
+	xe->nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
+	if (!xe->nvm)
+		return -ENOMEM;
+
+	nvm = xe->nvm;
+
+	nvm->writable_override = false;
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
+	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) | pci_dev_id(pdev);
+	aux_dev->dev.parent = &pdev->dev;
+	aux_dev->dev.release = xe_nvm_release_dev;
+
+	ret = auxiliary_device_init(aux_dev);
+	if (ret) {
+		drm_err(&xe->drm, "xe-nvm aux init failed %d\n", ret);
+		goto err;
+	}
+
+	ret = auxiliary_device_add(aux_dev);
+	if (ret) {
+		drm_err(&xe->drm, "xe-nvm aux add failed %d\n", ret);
+		auxiliary_device_uninit(aux_dev);
+		goto err;
+	}
+	return 0;
+
+err:
+	kfree(nvm);
+	xe->nvm = NULL;
+	return ret;
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
index 000000000000..7f3d5f57bed0
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
+int xe_nvm_init(struct xe_device *xe);
+
+void xe_nvm_fini(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 5d24cc320d72..367d2b2c2ded 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -63,6 +63,7 @@ struct xe_device_desc {
 
 	u8 has_display:1;
 	u8 has_fan_control:1;
+	u8 has_gsc_nvm:1;
 	u8 has_heci_gscfi:1;
 	u8 has_heci_cscfi:1;
 	u8 has_llc:1;
@@ -273,6 +274,7 @@ static const struct xe_device_desc dg1_desc = {
 	PLATFORM(DG1),
 	.dma_mask_size = 39,
 	.has_display = true,
+	.has_gsc_nvm = 1,
 	.has_heci_gscfi = 1,
 	.require_force_probe = true,
 };
@@ -284,6 +286,7 @@ static const u16 dg2_g12_ids[] = { INTEL_DG2_G12_IDS(NOP), 0 };
 #define DG2_FEATURES \
 	DGFX_FEATURES, \
 	PLATFORM(DG2), \
+	.has_gsc_nvm = 1, \
 	.has_heci_gscfi = 1, \
 	.subplatforms = (const struct xe_subplatform_desc[]) { \
 		{ XE_SUBPLATFORM_DG2_G10, "G10", dg2_g10_ids }, \
@@ -321,6 +324,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
 	PLATFORM(PVC),
 	.dma_mask_size = 52,
 	.has_display = false,
+	.has_gsc_nvm = 1,
 	.has_heci_gscfi = 1,
 	.max_remote_tiles = 1,
 	.require_force_probe = true,
@@ -351,6 +355,7 @@ static const struct xe_device_desc bmg_desc = {
 	.has_display = true,
 	.has_fan_control = true,
 	.has_mbx_power_limits = true,
+	.has_gsc_nvm = 1,
 	.has_heci_cscfi = 1,
 	.needs_scratch = true,
 };
@@ -595,6 +600,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_fan_control = desc->has_fan_control;
 	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
+	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
 	xe->info.has_llc = desc->has_llc;
-- 
2.43.0

