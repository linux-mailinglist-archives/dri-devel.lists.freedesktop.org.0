Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CFB5990E8
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 01:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DA710F092;
	Thu, 18 Aug 2022 23:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3767F10E174;
 Thu, 18 Aug 2022 23:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660863803; x=1692399803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6p8w2CDIhqhxeFprGf4RkpdlIic3fzr8tWQaO9rxjNw=;
 b=Er+kuAi8Q6C6CXVBxxoq6jiVUM45ZdCMr+t+cniVwvAcTslZTxEug3ei
 CnMKE1ddxmpRbbKcl0qFJxp0jU2ODThuFwrF3GLGa/rpaiLN+vn80YvD1
 ay5WecYuENtXYAI6tn7zSOYT0VisilrEKhgdB+bQPEe8qlNopVrgNWeVU
 QTzHOKnu+9HZiUNPUKKBJifQpJSbpsVns+bH1ylXG22KHP6+NM2KakZhE
 OP4zbNcuKGHOsCOHt7X3KP9/X21yqNO0kQnu1r+KP6L5j2vZABwpAvAmH
 1+rSlvJyTzFK+3QXbo6JuZrpWO6YEU017NwKfLveP1U3WWjl4Y7S84/w1 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="293677566"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="293677566"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:03:23 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="641042871"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:03:22 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 09/15] drm/i915/pxp: add huc authentication and loading
 command
Date: Thu, 18 Aug 2022 16:02:37 -0700
Message-Id: <20220818230243.3921066-10-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220818230243.3921066-1-daniele.ceraolospurio@intel.com>
References: <20220818230243.3921066-1-daniele.ceraolospurio@intel.com>
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

Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Vitaly Lubart <vitaly.lubart@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |  3 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c      | 69 +++++++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.h      | 15 ++++
 .../drm/i915/pxp/intel_pxp_tee_interface.h    | 21 ++++++
 4 files changed, 107 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_huc.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 589823ad62ed..5bee787d3c2a 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -310,7 +310,8 @@ i915-y += i915_perf.o
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
index 000000000000..6d25f436f329
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_huc.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2021, Intel Corporation. All rights reserved.
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
index 000000000000..6cf2d00548c0
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_huc.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2021, Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INTEL_PXP_HUC_H__
+#define __INTEL_PXP_HUC_H__
+
+#include <linux/types.h>
+
+struct intel_pxp;
+
+int intel_pxp_huc_load_and_auth(struct intel_pxp *pxp);
+
+#endif /* __INTEL_PXP_HUC_H__ */
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee_interface.h b/drivers/gpu/drm/i915/pxp/intel_pxp_tee_interface.h
index 36e9b0868f5c..1de98959a89d 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee_interface.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee_interface.h
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

