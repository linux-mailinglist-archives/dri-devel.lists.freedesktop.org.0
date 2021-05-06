Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70025375B22
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 21:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEABC6ED83;
	Thu,  6 May 2021 18:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB7E6ED02;
 Thu,  6 May 2021 18:57:13 +0000 (UTC)
IronPort-SDR: VmbgNqsl9BaJZHBRnt4xdB5ukW3vfJegItLvnQy8DXL2N6qU/EjdJrma5/n+4opNQ53NW69uJR
 b+7j9PveviLg==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="198195439"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="198195439"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:11 -0700
IronPort-SDR: xFGiO3nvi+RbwFbxonRBRznAigbVu6ZhvoWEl6gnELBk80crwg/R28dmizXvUb2EIkzbAmDk6C
 L9XImVYnVLvQ==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583424"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 22/97] drm/i915/guc: Update CTB response status
Date: Thu,  6 May 2021 12:13:36 -0700
Message-Id: <20210506191451.77768-23-matthew.brost@intel.com>
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

Format of the STATUS dword in CTB response message now follows
definition of the HXG header. Update our code and remove any
obsolete legacy definitions.

GuC: 55.0.0
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h |  1 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c       | 12 ++++++------
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h     | 17 -----------------
 3 files changed, 6 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
index 488b6061ee89..2030896857d5 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
@@ -7,7 +7,6 @@
 #define _ABI_GUC_ERRORS_ABI_H
 
 enum intel_guc_response_status {
-	INTEL_GUC_RESPONSE_STATUS_SUCCESS = 0x0,
 	INTEL_GUC_RESPONSE_STATUS_GENERIC_FAIL = 0xF000,
 };
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index a174978c6a27..1afdeac683b5 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -455,7 +455,7 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
 	 */
 	timeout = max(10, CONFIG_DRM_I915_HEARTBEAT_INTERVAL);
 
-#define done INTEL_GUC_MSG_IS_RESPONSE(READ_ONCE(req->status))
+#define done (FIELD_GET(GUC_HXG_MSG_0_ORIGIN, READ_ONCE(req->status)) == GUC_HXG_ORIGIN_GUC)
 	err = wait_for_us(done, 10);
 	if (err)
 		err = wait_for(done, timeout);
@@ -510,21 +510,21 @@ static int ct_send(struct intel_guc_ct *ct,
 	if (unlikely(err))
 		goto unlink;
 
-	if (!INTEL_GUC_MSG_IS_RESPONSE_SUCCESS(*status)) {
+	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, *status) != GUC_HXG_TYPE_RESPONSE_SUCCESS) {
 		err = -EIO;
 		goto unlink;
 	}
 
 	if (response_buf) {
 		/* There shall be no data in the status */
-		WARN_ON(INTEL_GUC_MSG_TO_DATA(request.status));
+		WARN_ON(FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, request.status));
 		/* Return actual response len */
 		err = request.response_len;
 	} else {
 		/* There shall be no response payload */
 		WARN_ON(request.response_len);
 		/* Return data decoded from the status dword */
-		err = INTEL_GUC_MSG_TO_DATA(*status);
+		err = FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, *status);
 	}
 
 unlink:
@@ -719,8 +719,8 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
 	status = response->msg[2];
 	datalen = len - 2;
 
-	/* Format of the status follows RESPONSE message */
-	if (unlikely(!INTEL_GUC_MSG_IS_RESPONSE(status))) {
+	/* Format of the status dword follows HXG header */
+	if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, status) != GUC_HXG_ORIGIN_GUC)) {
 		CT_ERROR(ct, "Corrupted response (status %#x)\n", status);
 		return -EPROTO;
 	}
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 9bf35240e723..d445f6b77db4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -388,23 +388,6 @@ struct guc_shared_ctx_data {
 	struct guc_ctx_report preempt_ctx_report[GUC_MAX_ENGINES_NUM];
 } __packed;
 
-#define __INTEL_GUC_MSG_GET(T, m) \
-	(((m) & INTEL_GUC_MSG_ ## T ## _MASK) >> INTEL_GUC_MSG_ ## T ## _SHIFT)
-#define INTEL_GUC_MSG_TO_TYPE(m)	__INTEL_GUC_MSG_GET(TYPE, m)
-#define INTEL_GUC_MSG_TO_DATA(m)	__INTEL_GUC_MSG_GET(DATA, m)
-#define INTEL_GUC_MSG_TO_CODE(m)	__INTEL_GUC_MSG_GET(CODE, m)
-
-#define __INTEL_GUC_MSG_TYPE_IS(T, m) \
-	(INTEL_GUC_MSG_TO_TYPE(m) == INTEL_GUC_MSG_TYPE_ ## T)
-#define INTEL_GUC_MSG_IS_REQUEST(m)	__INTEL_GUC_MSG_TYPE_IS(REQUEST, m)
-#define INTEL_GUC_MSG_IS_RESPONSE(m)	__INTEL_GUC_MSG_TYPE_IS(RESPONSE, m)
-
-#define INTEL_GUC_MSG_IS_RESPONSE_SUCCESS(m) \
-	 (typecheck(u32, (m)) && \
-	  ((m) & (INTEL_GUC_MSG_TYPE_MASK | INTEL_GUC_MSG_CODE_MASK)) == \
-	  ((INTEL_GUC_MSG_TYPE_RESPONSE << INTEL_GUC_MSG_TYPE_SHIFT) | \
-	   (INTEL_GUC_RESPONSE_STATUS_SUCCESS << INTEL_GUC_MSG_CODE_SHIFT)))
-
 /* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
 enum intel_guc_recv_message {
 	INTEL_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
-- 
2.28.0

