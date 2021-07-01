Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 544F83B94E3
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 18:53:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92BB88995F;
	Thu,  1 Jul 2021 16:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB5F88635;
 Thu,  1 Jul 2021 16:53:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="208524743"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="208524743"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 09:53:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="426222744"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga002.jf.intel.com with ESMTP; 01 Jul 2021 09:53:25 -0700
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.146.9])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 161GrOor018728; Thu, 1 Jul 2021 17:53:24 +0100
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc: Improve GuC CTB ABI
Date: Thu,  1 Jul 2021 18:53:21 +0200
Message-Id: <20210701165321.2067-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make CTB Header explicit and separate from CTB Message.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 .../gt/uc/abi/guc_communication_ctb_abi.h     | 51 +++++++++++--------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 24 ++++-----
 2 files changed, 43 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
index e933ca02d0eb..90a86759e108 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
@@ -56,8 +56,9 @@ struct guc_ct_buffer_desc {
 } __packed;
 static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
 
+
 /**
- * DOC: CTB Message
+ * DOC: CTB Header
  *
  *  +---+-------+--------------------------------------------------------------+
  *  |   | Bits  | Description                                                  |
@@ -71,21 +72,34 @@ static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
  *  |   +-------+--------------------------------------------------------------+
  *  |   |   7:0 | **NUM_DWORDS** - length of the CTB message (w/o header)      |
  *  +---+-------+--------------------------------------------------------------+
- *  | 1 |  31:0 | optional (depends on FORMAT)                                 |
- *  +---+-------+                                                              |
- *  |...|       |                                                              |
- *  +---+-------+                                                              |
- *  | n |  31:0 |                                                              |
+ */
+
+#define GUC_CTB_HDR_LEN					1u
+#define GUC_CTB_HDR_0_FENCE				(0xffff << 16)
+#define GUC_CTB_HDR_0_FORMAT				(0xf << 12)
+#define   GUC_CTB_FORMAT_HXG				0u
+#define GUC_CTB_HDR_0_RESERVED				(0xf << 8)
+#define GUC_CTB_HDR_0_NUM_DWORDS			(0xff << 0)
+#define   GUC_CTB_MAX_DWORDS				255u
+
+/**
+ * DOC: CTB Message
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |  31:0 | `CTB Header`_                                                |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 1 |  31:0 |  +--------------------------------------------------------+  |
+ *  +---+-------+  |                                                        |  |
+ *  |...|       |  |  optional payload (depends on FORMAT)                  |  |
+ *  +---+-------+  |                                                        |  |
+ *  | n |  31:0 |  +--------------------------------------------------------+  |
  *  +---+-------+--------------------------------------------------------------+
  */
 
-#define GUC_CTB_MSG_MIN_LEN			1u
-#define GUC_CTB_MSG_MAX_LEN			256u
-#define GUC_CTB_MSG_0_FENCE			(0xffff << 16)
-#define GUC_CTB_MSG_0_FORMAT			(0xf << 12)
-#define   GUC_CTB_FORMAT_HXG			0u
-#define GUC_CTB_MSG_0_RESERVED			(0xf << 8)
-#define GUC_CTB_MSG_0_NUM_DWORDS		(0xff << 0)
+#define GUC_CTB_MSG_MIN_LEN		GUC_CTB_HDR_LEN
+#define GUC_CTB_MSG_MAX_LEN		(GUC_CTB_HDR_LEN + GUC_CTB_MAX_DWORDS)
 
 /**
  * DOC: CTB HXG Message
@@ -93,13 +107,10 @@ static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
  *  +---+-------+--------------------------------------------------------------+
  *  |   | Bits  | Description                                                  |
  *  +===+=======+==============================================================+
- *  | 0 | 31:16 | FENCE                                                        |
- *  |   +-------+--------------------------------------------------------------+
- *  |   | 15:12 | FORMAT = GUC_CTB_FORMAT_HXG_                                 |
- *  |   +-------+--------------------------------------------------------------+
- *  |   |  11:8 | RESERVED = MBZ                                               |
- *  |   +-------+--------------------------------------------------------------+
- *  |   |   7:0 | NUM_DWORDS = length (in dwords) of the embedded HXG message  |
+ *  | 0 |  31:0 | `CTB Header`_ with:                                          |
+ *  |   |       |                                                              |
+ *  |   |       |  - FORMAT = GUC_CTB_FORMAT_HXG_                              |
+ *  |   |       |  - NUM_DWORDS = **n**                                        |
  *  +---+-------+--------------------------------------------------------------+
  *  | 1 |  31:0 |  +--------------------------------------------------------+  |
  *  +---+-------+  |                                                        |  |
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 43409044528e..4236fc33d293 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -412,9 +412,9 @@ static int ct_write(struct intel_guc_ct *ct,
 	 * dw1: HXG header (including action code)
 	 * dw2+: action data
 	 */
-	header = FIELD_PREP(GUC_CTB_MSG_0_FORMAT, GUC_CTB_FORMAT_HXG) |
-		 FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len) |
-		 FIELD_PREP(GUC_CTB_MSG_0_FENCE, fence);
+	header = FIELD_PREP(GUC_CTB_HDR_0_FORMAT, GUC_CTB_FORMAT_HXG) |
+		 FIELD_PREP(GUC_CTB_HDR_0_NUM_DWORDS, len) |
+		 FIELD_PREP(GUC_CTB_HDR_0_FENCE, fence);
 
 	hxg = FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
 	      FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION |
@@ -646,7 +646,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 	head = (head + 1) % size;
 
 	/* message len with header */
-	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, header) + GUC_CTB_MSG_MIN_LEN;
+	len = FIELD_GET(GUC_CTB_HDR_0_NUM_DWORDS, header) + GUC_CTB_HDR_LEN;
 	if (unlikely(len > (u32)available)) {
 		CT_ERROR(ct, "Incomplete message %*ph %*ph %*ph\n",
 			 4, &header,
@@ -691,9 +691,9 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 
 static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *response)
 {
-	u32 len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, response->msg[0]);
-	u32 fence = FIELD_GET(GUC_CTB_MSG_0_FENCE, response->msg[0]);
-	const u32 *hxg = &response->msg[GUC_CTB_MSG_MIN_LEN];
+	u32 len = FIELD_GET(GUC_CTB_HDR_0_NUM_DWORDS, response->msg[0]);
+	u32 fence = FIELD_GET(GUC_CTB_HDR_0_FENCE, response->msg[0]);
+	const u32 *hxg = &response->msg[GUC_CTB_HDR_LEN];
 	const u32 *data = &hxg[GUC_HXG_MSG_MIN_LEN];
 	u32 datalen = len - GUC_HXG_MSG_MIN_LEN;
 	struct ct_request *req;
@@ -750,8 +750,8 @@ static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *r
 	u32 hxg_len, action, len;
 	int ret;
 
-	hxg = &request->msg[GUC_CTB_MSG_MIN_LEN];
-	hxg_len = request->size - GUC_CTB_MSG_MIN_LEN;
+	hxg = &request->msg[GUC_CTB_HDR_LEN];
+	hxg_len = request->size - GUC_CTB_HDR_LEN;
 	payload = &hxg[GUC_HXG_MSG_MIN_LEN];
 	action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, hxg[0]);
 	len = hxg_len - GUC_HXG_MSG_MIN_LEN;
@@ -818,7 +818,7 @@ static void ct_incoming_request_worker_func(struct work_struct *w)
 
 static int ct_handle_event(struct intel_guc_ct *ct, struct ct_incoming_msg *request)
 {
-	const u32 *hxg = &request->msg[GUC_CTB_MSG_MIN_LEN];
+	const u32 *hxg = &request->msg[GUC_CTB_HDR_LEN];
 	unsigned long flags;
 
 	GEM_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) != GUC_HXG_TYPE_EVENT);
@@ -840,7 +840,7 @@ static int ct_handle_hxg(struct intel_guc_ct *ct, struct ct_incoming_msg *msg)
 	if (unlikely(msg->size < GUC_CTB_HXG_MSG_MIN_LEN))
 		return -EBADMSG;
 
-	hxg = &msg->msg[GUC_CTB_MSG_MIN_LEN];
+	hxg = &msg->msg[GUC_CTB_HDR_LEN];
 
 	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]);
 	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
@@ -871,7 +871,7 @@ static int ct_handle_hxg(struct intel_guc_ct *ct, struct ct_incoming_msg *msg)
 
 static void ct_handle_msg(struct intel_guc_ct *ct, struct ct_incoming_msg *msg)
 {
-	u32 format = FIELD_GET(GUC_CTB_MSG_0_FORMAT, msg->msg[0]);
+	u32 format = FIELD_GET(GUC_CTB_HDR_0_FORMAT, msg->msg[0]);
 	int err;
 
 	if (format == GUC_CTB_FORMAT_HXG)
-- 
2.25.1

