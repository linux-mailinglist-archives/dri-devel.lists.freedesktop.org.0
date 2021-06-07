Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C96B439E5B7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 19:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE226E988;
	Mon,  7 Jun 2021 17:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B5D6E983;
 Mon,  7 Jun 2021 17:46:05 +0000 (UTC)
IronPort-SDR: 52LrhCdmF7eBocKW3jy5lU0WAUBaHaCL3p78SF4rqEtDAn6aTgObzrEhvM628mRTaH2Rx3o7z9
 cxm4Q0sD0mDw==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="204695169"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="204695169"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 10:46:04 -0700
IronPort-SDR: JqdOmO1h78XWISmrL8Idv0KRVTRoqYeH9zhGShezFs8q6ENydhHjZNttnlc1V9TkJnxlFmKRTK
 1By2h1OHNbjw==
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="551970154"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 10:46:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 02/13] drm/i915/guc: Update MMIO based communication
Date: Mon,  7 Jun 2021 11:03:44 -0700
Message-Id: <20210607180356.165785-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210607180356.165785-1-matthew.brost@intel.com>
References: <20210607180356.165785-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

The MMIO based Host-to-GuC communication protocol has been
updated to use unified HXG messages.

Update our intel_guc_send_mmio() function by correctly handle
BUSY, RETRY and FAILURE replies. Also update our documentation.

GuC: 55.0.0
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com> #v3
---
 .../gt/uc/abi/guc_communication_mmio_abi.h    | 63 ++++++-------
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 92 ++++++++++++++-----
 2 files changed, 97 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
index be066a62e9e0..3f9039e3ef9d 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
@@ -7,46 +7,43 @@
 #define _ABI_GUC_COMMUNICATION_MMIO_ABI_H
 
 /**
- * DOC: MMIO based communication
+ * DOC: GuC MMIO based communication
  *
- * The MMIO based communication between Host and GuC uses software scratch
- * registers, where first register holds data treated as message header,
- * and other registers are used to hold message payload.
+ * The MMIO based communication between Host and GuC relies on special
+ * hardware registers which format could be defined by the software
+ * (so called scratch registers).
  *
- * For Gen9+, GuC uses software scratch registers 0xC180-0xC1B8,
- * but no H2G command takes more than 8 parameters and the GuC FW
- * itself uses an 8-element array to store the H2G message.
- *
- *      +-----------+---------+---------+---------+
- *      |  MMIO[0]  | MMIO[1] |   ...   | MMIO[n] |
- *      +-----------+---------+---------+---------+
- *      | header    |      optional payload       |
- *      +======+====+=========+=========+=========+
- *      | 31:28|type|         |         |         |
- *      +------+----+         |         |         |
- *      | 27:16|data|         |         |         |
- *      +------+----+         |         |         |
- *      |  15:0|code|         |         |         |
- *      +------+----+---------+---------+---------+
- *
- * The message header consists of:
- *
- * - **type**, indicates message type
- * - **code**, indicates message code, is specific for **type**
- * - **data**, indicates message data, optional, depends on **code**
+ * Each MMIO based message, both Host to GuC (H2G) and GuC to Host (G2H)
+ * messages, which maximum length depends on number of available scratch
+ * registers, is directly written into those scratch registers.
  *
- * The following message **types** are supported:
+ * For Gen9+, there are 16 software scratch registers 0xC180-0xC1B8,
+ * but no H2G command takes more than 8 parameters and the GuC firmware
+ * itself uses an 8-element array to store the H2G message.
  *
- * - **REQUEST**, indicates Host-to-GuC request, requested GuC action code
- *   must be priovided in **code** field. Optional action specific parameters
- *   can be provided in remaining payload registers or **data** field.
+ * For Gen11+, there are additional 4 registers 0x190240-0x19024C, which
+ * are, regardless on lower count, preffered over legacy ones.
  *
- * - **RESPONSE**, indicates GuC-to-Host response from earlier GuC request,
- *   action response status will be provided in **code** field. Optional
- *   response data can be returned in remaining payload registers or **data**
- *   field.
+ * The MMIO based communication is mainly used during driver initialization
+ * phase to setup the `CTB based communication`_ that will be used afterwards.
  */
 
 #define GUC_MAX_MMIO_MSG_LEN		8
 
+/**
+ * DOC: MMIO HXG Message
+ *
+ * Format of the MMIO messages follows definitions of `HXG Message`_.
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |  31:0 |  +--------------------------------------------------------+  |
+ *  +---+-------+  |                                                        |  |
+ *  |...|       |  |  Embedded `HXG Message`_                               |  |
+ *  +---+-------+  |                                                        |  |
+ *  | n |  31:0 |  +--------------------------------------------------------+  |
+ *  +---+-------+--------------------------------------------------------------+
+ */
+
 #endif /* _ABI_GUC_COMMUNICATION_MMIO_ABI_H */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index f147cb389a20..b773567cb080 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -376,29 +376,27 @@ void intel_guc_fini(struct intel_guc *guc)
 /*
  * This function implements the MMIO based host to GuC interface.
  */
-int intel_guc_send_mmio(struct intel_guc *guc, const u32 *action, u32 len,
+int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
 			u32 *response_buf, u32 response_buf_size)
 {
+	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	struct intel_uncore *uncore = guc_to_gt(guc)->uncore;
-	u32 status;
+	u32 header;
 	int i;
 	int ret;
 
 	GEM_BUG_ON(!len);
 	GEM_BUG_ON(len > guc->send_regs.count);
 
-	/* We expect only action code */
-	GEM_BUG_ON(*action & ~INTEL_GUC_MSG_CODE_MASK);
-
-	/* If CT is available, we expect to use MMIO only during init/fini */
-	GEM_BUG_ON(*action != INTEL_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER &&
-		   *action != INTEL_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER);
+	GEM_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, request[0]) != GUC_HXG_ORIGIN_HOST);
+	GEM_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_TYPE, request[0]) != GUC_HXG_TYPE_REQUEST);
 
 	mutex_lock(&guc->send_mutex);
 	intel_uncore_forcewake_get(uncore, guc->send_regs.fw_domains);
 
+retry:
 	for (i = 0; i < len; i++)
-		intel_uncore_write(uncore, guc_send_reg(guc, i), action[i]);
+		intel_uncore_write(uncore, guc_send_reg(guc, i), request[i]);
 
 	intel_uncore_posting_read(uncore, guc_send_reg(guc, i - 1));
 
@@ -410,30 +408,74 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *action, u32 len,
 	 */
 	ret = __intel_wait_for_register_fw(uncore,
 					   guc_send_reg(guc, 0),
-					   INTEL_GUC_MSG_TYPE_MASK,
-					   INTEL_GUC_MSG_TYPE_RESPONSE <<
-					   INTEL_GUC_MSG_TYPE_SHIFT,
-					   10, 10, &status);
-	/* If GuC explicitly returned an error, convert it to -EIO */
-	if (!ret && !INTEL_GUC_MSG_IS_RESPONSE_SUCCESS(status))
-		ret = -EIO;
+					   GUC_HXG_MSG_0_ORIGIN,
+					   FIELD_PREP(GUC_HXG_MSG_0_ORIGIN,
+						      GUC_HXG_ORIGIN_GUC),
+					   10, 10, &header);
+	if (unlikely(ret)) {
+timeout:
+		drm_err(&i915->drm, "mmio request %#x: no reply %x\n",
+			request[0], header);
+		goto out;
+	}
 
-	if (ret) {
-		DRM_ERROR("MMIO: GuC action %#x failed with error %d %#x\n",
-			  action[0], ret, status);
+	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) == GUC_HXG_TYPE_NO_RESPONSE_BUSY) {
+#define done ({ header = intel_uncore_read(uncore, guc_send_reg(guc, 0)); \
+		FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) != GUC_HXG_ORIGIN_GUC || \
+		FIELD_GET(GUC_HXG_MSG_0_TYPE, header) != GUC_HXG_TYPE_NO_RESPONSE_BUSY; })
+
+		ret = wait_for(done, 1000);
+		if (unlikely(ret))
+			goto timeout;
+		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
+				       GUC_HXG_ORIGIN_GUC))
+			goto proto;
+#undef done
+	}
+
+	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) == GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
+		u32 reason = FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, header);
+
+		drm_dbg(&i915->drm, "mmio request %#x: retrying, reason %u\n",
+			request[0], reason);
+		goto retry;
+	}
+
+	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) == GUC_HXG_TYPE_RESPONSE_FAILURE) {
+		u32 hint = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, header);
+		u32 error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, header);
+
+		drm_err(&i915->drm, "mmio request %#x: failure %x/%u\n",
+			request[0], error, hint);
+		ret = -ENXIO;
+		goto out;
+	}
+
+	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) != GUC_HXG_TYPE_RESPONSE_SUCCESS) {
+proto:
+		drm_err(&i915->drm, "mmio request %#x: unexpected reply %#x\n",
+			request[0], header);
+		ret = -EPROTO;
 		goto out;
 	}
 
 	if (response_buf) {
-		int count = min(response_buf_size, guc->send_regs.count - 1);
+		int count = min(response_buf_size, guc->send_regs.count);
 
-		for (i = 0; i < count; i++)
+		GEM_BUG_ON(!count);
+
+		response_buf[0] = header;
+
+		for (i = 1; i < count; i++)
 			response_buf[i] = intel_uncore_read(uncore,
-							    guc_send_reg(guc, i + 1));
-	}
+							    guc_send_reg(guc, i));
 
-	/* Use data from the GuC response as our return value */
-	ret = INTEL_GUC_MSG_TO_DATA(status);
+		/* Use number of copied dwords as our return value */
+		ret = count;
+	} else {
+		/* Use data from the GuC response as our return value */
+		ret = FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, header);
+	}
 
 out:
 	intel_uncore_forcewake_put(uncore, guc->send_regs.fw_domains);
-- 
2.28.0

