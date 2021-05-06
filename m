Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 530DB375AA6
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 20:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F93D6ECF1;
	Thu,  6 May 2021 18:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA446ECEF;
 Thu,  6 May 2021 18:57:11 +0000 (UTC)
IronPort-SDR: OMxyhTqAuZjxQue1KRBBteHNzxqeQfsw/KsnHuBhvHJ/wHbl3G20R6bSX8OmdmLLhLqc5zE+Ta
 w4n6q++0fZ0g==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196530995"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196530995"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:11 -0700
IronPort-SDR: ITPX8GQNrCjdK3chyKiIfJIvu93xq1o29j5d87xWRmiOzkg6cwDvLKHM25yEQ7Gn0ACySVhgMA
 S0ipp1aPw9WA==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583421"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 21/97] drm/i915/guc: Update MMIO based communication
Date: Thu,  6 May 2021 12:13:35 -0700
Message-Id: <20210506191451.77768-22-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, jason.ekstrand@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

The MMIO based Host-to-GuC communication protocol has been
updated to use unified HXG messages.

Update our intel_guc_send_mmio() function by correctly handle
BUSY, RETRY and FAILURE replies. Also update our documentation.

GuC: 55.0.0
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
---
 .../gt/uc/abi/guc_communication_mmio_abi.h    | 47 ++++--------
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 75 ++++++++++++++-----
 2 files changed, 70 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
index be066a62e9e0..fef51499386b 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
@@ -7,44 +7,27 @@
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
+ * Each MMIO based message, both Host to GuC (H2G) and GuC to Host (G2H)
+ * messages, which maximum length depends on number of available scratch
+ * registers, is directly written into those scratch registers.
  *
- * The message header consists of:
- *
- * - **type**, indicates message type
- * - **code**, indicates message code, is specific for **type**
- * - **data**, indicates message data, optional, depends on **code**
+ * For Gen9+, there are 16 software scratch registers 0xC180-0xC1B8,
+ * but no H2G command takes more than 8 parameters and the GuC firmware
+ * itself uses an 8-element array to store the H2G message.
  *
- * The following message **types** are supported:
+ * For Gen11+, there are additional 4 registers 0x190240-0x19024C, which
+ * are, regardless on lower count, preffered over legacy ones.
  *
- * - **REQUEST**, indicates Host-to-GuC request, requested GuC action code
- *   must be priovided in **code** field. Optional action specific parameters
- *   can be provided in remaining payload registers or **data** field.
+ * The MMIO based communication is mainly used during driver initialization
+ * phase to setup the CTB based communication that will be used afterwards.
  *
- * - **RESPONSE**, indicates GuC-to-Host response from earlier GuC request,
- *   action response status will be provided in **code** field. Optional
- *   response data can be returned in remaining payload registers or **data**
- *   field.
+ * Format of the MMIO messages follows definitions of `HXG Message`_.
  */
 
 #define GUC_MAX_MMIO_MSG_LEN		8
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index ab2c8fe8cdfa..454c8d886499 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -385,29 +385,27 @@ void intel_guc_fini(struct intel_guc *guc)
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
 
@@ -419,17 +417,54 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *action, u32 len,
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
 
@@ -442,7 +477,7 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *action, u32 len,
 	}
 
 	/* Use data from the GuC response as our return value */
-	ret = INTEL_GUC_MSG_TO_DATA(status);
+	ret = FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, header);
 
 out:
 	intel_uncore_forcewake_put(uncore, guc->send_regs.fw_domains);
-- 
2.28.0

