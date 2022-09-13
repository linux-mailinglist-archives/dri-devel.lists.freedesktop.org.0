Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A25B5B64D4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 02:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5CA10E50F;
	Tue, 13 Sep 2022 00:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C8410E4AC;
 Tue, 13 Sep 2022 00:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663030685; x=1694566685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GlJB8aYHQ7YcSPO5Vn7wJzikK7DGw6lowmFbe4/u9LA=;
 b=ahYOiPYL998wu+vYPp1WTZlF7/gD4C9MheqauGIAuyytfdJt3Us1FWP7
 wLAK+RkMXb62GKflEZ30fVGt32Nmk3xRDscb93cTHoR+aC33KehNJHcBv
 ekthejarrXRz5LFXIJzeqwhIAgym9ThfM2oOq6Is62lZwnU/xK+KWWG8w
 d2h51CpbCF/6RpntCtg17pO3qutL01hUJKCb5LTRHEN4meYdhXEVb7JEn
 sFuqtVoA75tX0Kaall/C0zD85FnoXQ/UYctVyMk8BoKVAckNZSOXwnvl1
 GODvH5Xu1NJqvZlQPIUxA82DuyiK4phtnMC+LhtAOI+yvT1IHpEqh5oje w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="285026430"
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="285026430"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 17:58:03 -0700
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="758593557"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 17:58:03 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 09/15] drm/i915/pxp: add huc authentication and loading
 command
Date: Mon, 12 Sep 2022 17:57:33 -0700
Message-Id: <20220913005739.798337-10-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913005739.798337-1-daniele.ceraolospurio@intel.com>
References: <20220913005739.798337-1-daniele.ceraolospurio@intel.com>
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
Cc: Tomas Winkler <tomas.winkler@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomas Winkler <tomas.winkler@intel.com>

Add support for loading HuC via a pxp stream command.

V4:
1. Remove unnecessary include in intel_pxp_huc.h (Jani)
2. Adjust copyright year to 2022

Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Vitaly Lubart <vitaly.lubart@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |  3 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c      | 69 +++++++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.h      | 13 ++++
 .../drm/i915/pxp/intel_pxp_tee_interface.h    | 23 ++++++-
 4 files changed, 106 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_huc.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 26fc2f23c4e0..f8cc1eb52626 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -312,7 +312,8 @@ i915-y += i915_perf.o
 # Protected execution platform (PXP) support. Base support is required for HuC
 i915-y += \
 	pxp/intel_pxp.o \
-	pxp/intel_pxp_tee.o
+	pxp/intel_pxp_tee.o \
+	pxp/intel_pxp_huc.o
 
 i915-$(CONFIG_DRM_I915_PXP) += \
 	pxp/intel_pxp_cmd.o \
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_huc.c b/drivers/gpu/drm/i915/pxp/intel_pxp_huc.c
new file mode 100644
index 000000000000..7ec36d94e758
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_huc.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2021-2022, Intel Corporation. All rights reserved.
+ */
+
+#include "drm/i915_drm.h"
+#include "i915_drv.h"
+
+#include "gem/i915_gem_region.h"
+#include "gt/intel_gt.h"
+
+#include "intel_pxp.h"
+#include "intel_pxp_huc.h"
+#include "intel_pxp_tee.h"
+#include "intel_pxp_types.h"
+#include "intel_pxp_tee_interface.h"
+
+int intel_pxp_huc_load_and_auth(struct intel_pxp *pxp)
+{
+	struct intel_gt *gt = pxp_to_gt(pxp);
+	struct intel_huc *huc = &gt->uc.huc;
+	struct pxp_tee_start_huc_auth_in huc_in = {0};
+	struct pxp_tee_start_huc_auth_out huc_out = {0};
+	dma_addr_t huc_phys_addr;
+	u8 client_id = 0;
+	u8 fence_id = 0;
+	int err;
+
+	if (!pxp->pxp_component)
+		return -ENODEV;
+
+	huc_phys_addr = i915_gem_object_get_dma_address(huc->fw.obj, 0);
+
+	/* write the PXP message into the lmem (the sg list) */
+	huc_in.header.api_version = PXP_TEE_43_APIVER;
+	huc_in.header.command_id  = PXP_TEE_43_START_HUC_AUTH;
+	huc_in.header.status      = 0;
+	huc_in.header.buffer_len  = sizeof(huc_in.huc_base_address);
+	huc_in.huc_base_address   = huc_phys_addr;
+
+	err = intel_pxp_tee_stream_message(pxp, client_id, fence_id,
+					   &huc_in, sizeof(huc_in),
+					   &huc_out, sizeof(huc_out));
+	if (err < 0) {
+		drm_err(&gt->i915->drm,
+			"Failed to send HuC load and auth command to GSC [%d]!\n",
+			err);
+		return err;
+	}
+
+	/*
+	 * HuC does sometimes survive suspend/resume (it depends on how "deep"
+	 * a sleep state the device reaches) so we can end up here on resume
+	 * with HuC already loaded, in which case the GSC will return
+	 * PXP_STATUS_OP_NOT_PERMITTED. We can therefore consider the GuC
+	 * correctly transferred in this scenario; if the same error is ever
+	 * returned with HuC not loaded we'll still catch it when we check the
+	 * authentication bit later.
+	 */
+	if (huc_out.header.status != PXP_STATUS_SUCCESS &&
+	    huc_out.header.status != PXP_STATUS_OP_NOT_PERMITTED) {
+		drm_err(&gt->i915->drm,
+			"HuC load failed with GSC error = 0x%x\n",
+			huc_out.header.status);
+		return -EPROTO;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_huc.h b/drivers/gpu/drm/i915/pxp/intel_pxp_huc.h
new file mode 100644
index 000000000000..e40847a91c39
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_huc.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2021-2022, Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INTEL_PXP_HUC_H__
+#define __INTEL_PXP_HUC_H__
+
+struct intel_pxp;
+
+int intel_pxp_huc_load_and_auth(struct intel_pxp *pxp);
+
+#endif /* __INTEL_PXP_HUC_H__ */
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee_interface.h b/drivers/gpu/drm/i915/pxp/intel_pxp_tee_interface.h
index 36e9b0868f5c..7edc1760f142 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee_interface.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee_interface.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: MIT */
 /*
- * Copyright(c) 2020, Intel Corporation. All rights reserved.
+ * Copyright(c) 2020-2022, Intel Corporation. All rights reserved.
  */
 
 #ifndef __INTEL_PXP_TEE_INTERFACE_H__
@@ -9,8 +9,20 @@
 #include <linux/types.h>
 
 #define PXP_TEE_APIVER 0x40002
+#define PXP_TEE_43_APIVER 0x00040003
 #define PXP_TEE_ARB_CMDID 0x1e
 #define PXP_TEE_ARB_PROTECTION_MODE 0x2
+#define PXP_TEE_43_START_HUC_AUTH   0x0000003A
+
+/*
+ * there are a lot of status codes for PXP, but we only define the ones we
+ * actually can handle in the driver. other failure codes will be printed to
+ * error msg for debug.
+ */
+enum pxp_status {
+	PXP_STATUS_SUCCESS = 0x0,
+	PXP_STATUS_OP_NOT_PERMITTED = 0x4013
+};
 
 /* PXP TEE message header */
 struct pxp_tee_cmd_header {
@@ -33,4 +45,13 @@ struct pxp_tee_create_arb_out {
 	struct pxp_tee_cmd_header header;
 } __packed;
 
+struct pxp_tee_start_huc_auth_in {
+	struct pxp_tee_cmd_header header;
+	__le64                    huc_base_address;
+};
+
+struct pxp_tee_start_huc_auth_out {
+	struct pxp_tee_cmd_header header;
+};
+
 #endif /* __INTEL_PXP_TEE_INTERFACE_H__ */
-- 
2.37.2

