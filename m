Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 624F5375AB4
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 20:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0096EDBD;
	Thu,  6 May 2021 18:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3FB6ED08;
 Thu,  6 May 2021 18:57:13 +0000 (UTC)
IronPort-SDR: DMadxe8GNJ3I3seOswWHSUhiyBsOLS/55XYVvksOrXKzn1+VJA1roSvuzkQlK4D0DuWSIdR1T5
 tLh5NdyrxNug==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="198195443"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="198195443"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:11 -0700
IronPort-SDR: 8DlV76Y7YMS7c9MxcxA0ZaLyyv3QBGEihJlYXwH2ZguM4co5dQIQ+VEXDJ8n6a/cA7X8AKl8DQ
 i0D0+sjOksaA==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583441"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 27/97] drm/i915/guc: New CTB based communication
Date: Thu,  6 May 2021 12:13:41 -0700
Message-Id: <20210506191451.77768-28-matthew.brost@intel.com>
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

Format of the CTB messages has changed:
 - support for multiple formats
 - message fence is now part of the header
 - reuse of unified HXG message formats

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 .../gt/uc/abi/guc_communication_ctb_abi.h     |  56 +++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 193 +++++++-----------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |   2 +-
 3 files changed, 134 insertions(+), 117 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
index 127b256a662c..92660726c094 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
@@ -60,6 +60,62 @@ struct guc_ct_buffer_desc {
 } __packed;
 static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
 
+/**
+ * DOC: CTB Message
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 | 31:16 | **FENCE** - message identifier                               |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 15:12 | **FORMAT** - format of the CTB message                       |
+ *  |   |       |  - _`GUC_CTB_FORMAT_HXG` = 0 - see `CTB HXG Message`_        |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  11:8 | **RESERVED**                                                 |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |   7:0 | **NUM_DWORDS** - length of the CTB message (w/o header)      |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 1 |  31:0 | optional (depends on FORMAT)                                 |
+ *  +---+-------+                                                              |
+ *  |...|       |                                                              |
+ *  +---+-------+                                                              |
+ *  | n |  31:0 |                                                              |
+ *  +---+-------+--------------------------------------------------------------+
+ */
+
+#define GUC_CTB_MSG_MIN_LEN			1u
+#define GUC_CTB_MSG_MAX_LEN			256u
+#define GUC_CTB_MSG_0_FENCE			(0xffff << 16)
+#define GUC_CTB_MSG_0_FORMAT			(0xf << 12)
+#define   GUC_CTB_FORMAT_HXG			0u
+#define GUC_CTB_MSG_0_RESERVED			(0xf << 8)
+#define GUC_CTB_MSG_0_NUM_DWORDS		(0xff << 0)
+
+/**
+ * DOC: CTB HXG Message
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 | 31:16 | FENCE                                                        |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 15:12 | FORMAT = GUC_CTB_FORMAT_HXG_                                 |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  11:8 | RESERVED = MBZ                                               |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |   7:0 | NUM_DWORDS = length (in dwords) of the embedded HXG message  |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 1 |  31:0 |  +--------------------------------------------------------+  |
+ *  +---+-------+  |                                                        |  |
+ *  |...|       |  |  Embedded `HXG Message`_                               |  |
+ *  +---+-------+  |                                                        |  |
+ *  | n |  31:0 |  +--------------------------------------------------------+  |
+ *  +---+-------+--------------------------------------------------------------+
+ */
+
+#define GUC_CTB_HXG_MSG_MIN_LEN		(GUC_CTB_MSG_MIN_LEN + GUC_HXG_MSG_MIN_LEN)
+#define GUC_CTB_HXG_MSG_MAX_LEN		GUC_CTB_MSG_MAX_LEN
+
 /**
  * DOC: CTB based communication
  *
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index e25b49a45107..217ab3ebd1af 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -343,24 +343,6 @@ static u32 ct_get_next_fence(struct intel_guc_ct *ct)
 	return ++ct->requests.last_fence;
 }
 
-/**
- * DOC: CTB Host to GuC request
- *
- * Format of the CTB Host to GuC request message is as follows::
- *
- *      +------------+---------+---------+---------+---------+
- *      |   msg[0]   |   [1]   |   [2]   |   ...   |  [n-1]  |
- *      +------------+---------+---------+---------+---------+
- *      |   MESSAGE  |       MESSAGE PAYLOAD                 |
- *      +   HEADER   +---------+---------+---------+---------+
- *      |            |    0    |    1    |   ...   |    n    |
- *      +============+=========+=========+=========+=========+
- *      |  len >= 1  |  FENCE  |     request specific data   |
- *      +------+-----+---------+---------+---------+---------+
- *
- *                   ^-----------------len-------------------^
- */
-
 static int ct_write(struct intel_guc_ct *ct,
 		    const u32 *action,
 		    u32 len /* in dwords */,
@@ -373,6 +355,7 @@ static int ct_write(struct intel_guc_ct *ct,
 	u32 size = ctb->size;
 	u32 used;
 	u32 header;
+	u32 hxg;
 	u32 *cmds = ctb->cmds;
 	unsigned int i;
 
@@ -403,22 +386,24 @@ static int ct_write(struct intel_guc_ct *ct,
 		return -ENOSPC;
 
 	/*
-	 * Write the message. The format is the following:
-	 * DW0: header (including action code)
-	 * DW1: fence
-	 * DW2+: action data
+	 * dw0: CT header (including fence)
+	 * dw1: HXG header
 	 */
-	header = (len << GUC_CT_MSG_LEN_SHIFT) |
-		 GUC_CT_MSG_SEND_STATUS |
-		 (action[0] << GUC_CT_MSG_ACTION_SHIFT);
+	header = FIELD_PREP(GUC_CTB_MSG_0_FORMAT, GUC_CTB_FORMAT_HXG) |
+		 FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len) |
+		 FIELD_PREP(GUC_CTB_MSG_0_FENCE, fence);
+
+	hxg = FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
+	      FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION |
+			 GUC_HXG_REQUEST_MSG_0_DATA0, action[0]);
 
-	CT_DEBUG(ct, "writing %*ph %*ph %*ph\n",
-		 4, &header, 4, &fence, 4 * (len - 1), &action[1]);
+	CT_DEBUG(ct, "writing (tail %u) %*ph %*ph %*ph\n",
+		 tail, 4, &header, 4, &hxg, 4 * (len - 1), &action[1]);
 
 	cmds[tail] = header;
 	tail = (tail + 1) % size;
 
-	cmds[tail] = fence;
+	cmds[tail] = hxg;
 	tail = (tail + 1) % size;
 
 	for (i = 1; i < len; i++) {
@@ -574,21 +559,6 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
 	return ret;
 }
 
-static inline unsigned int ct_header_get_len(u32 header)
-{
-	return (header >> GUC_CT_MSG_LEN_SHIFT) & GUC_CT_MSG_LEN_MASK;
-}
-
-static inline unsigned int ct_header_get_action(u32 header)
-{
-	return (header >> GUC_CT_MSG_ACTION_SHIFT) & GUC_CT_MSG_ACTION_MASK;
-}
-
-static inline bool ct_header_is_response(u32 header)
-{
-	return !!(header & GUC_CT_MSG_IS_RESPONSE);
-}
-
 static struct ct_incoming_msg *ct_alloc_msg(u32 num_dwords)
 {
 	struct ct_incoming_msg *msg;
@@ -651,7 +621,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 	head = (head + 1) % size;
 
 	/* message len with header */
-	len = ct_header_get_len(header) + 1;
+	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, header) + GUC_CTB_MSG_MIN_LEN;
 	if (unlikely(len > (u32)available)) {
 		CT_ERROR(ct, "Incomplete message %*ph %*ph %*ph\n",
 			 4, &header,
@@ -694,55 +664,24 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 	return -EPIPE;
 }
 
-/**
- * DOC: CTB GuC to Host response
- *
- * Format of the CTB GuC to Host response message is as follows::
- *
- *      +------------+---------+---------+---------+---------+---------+
- *      |   msg[0]   |   [1]   |   [2]   |   [3]   |   ...   |  [n-1]  |
- *      +------------+---------+---------+---------+---------+---------+
- *      |   MESSAGE  |       MESSAGE PAYLOAD                           |
- *      +   HEADER   +---------+---------+---------+---------+---------+
- *      |            |    0    |    1    |    2    |   ...   |    n    |
- *      +============+=========+=========+=========+=========+=========+
- *      |  len >= 2  |  FENCE  |  STATUS |   response specific data    |
- *      +------+-----+---------+---------+---------+---------+---------+
- *
- *                   ^-----------------------len-----------------------^
- */
-
 static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *response)
 {
-	u32 header = response->msg[0];
-	u32 len = ct_header_get_len(header);
-	u32 fence;
-	u32 status;
-	u32 datalen;
+	u32 len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, response->msg[0]);
+	u32 fence = FIELD_GET(GUC_CTB_MSG_0_FENCE, response->msg[0]);
+	const u32 *hxg = &response->msg[GUC_CTB_MSG_MIN_LEN];
+	const u32 *data = &hxg[GUC_HXG_MSG_MIN_LEN];
+	u32 datalen = len - GUC_HXG_MSG_MIN_LEN;
 	struct ct_request *req;
 	unsigned long flags;
 	bool found = false;
 	int err = 0;
 
-	GEM_BUG_ON(!ct_header_is_response(header));
+	GEM_BUG_ON(len < GUC_HXG_MSG_MIN_LEN);
+	GEM_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]) != GUC_HXG_ORIGIN_GUC);
+	GEM_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) != GUC_HXG_TYPE_RESPONSE_SUCCESS &&
+		   FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) != GUC_HXG_TYPE_RESPONSE_FAILURE);
 
-	/* Response payload shall at least include fence and status */
-	if (unlikely(len < 2)) {
-		CT_ERROR(ct, "Corrupted response (len %u)\n", len);
-		return -EPROTO;
-	}
-
-	fence = response->msg[1];
-	status = response->msg[2];
-	datalen = len - 2;
-
-	/* Format of the status dword follows HXG header */
-	if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, status) != GUC_HXG_ORIGIN_GUC)) {
-		CT_ERROR(ct, "Corrupted response (status %#x)\n", status);
-		return -EPROTO;
-	}
-
-	CT_DEBUG(ct, "response fence %u status %#x\n", fence, status);
+	CT_DEBUG(ct, "response fence %u status %#x\n", fence, hxg[0]);
 
 	spin_lock_irqsave(&ct->requests.lock, flags);
 	list_for_each_entry(req, &ct->requests.pending, link) {
@@ -758,9 +697,9 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
 			err = -EMSGSIZE;
 		}
 		if (datalen)
-			memcpy(req->response_buf, response->msg + 3, 4 * datalen);
+			memcpy(req->response_buf, data, 4 * datalen);
 		req->response_len = datalen;
-		WRITE_ONCE(req->status, status);
+		WRITE_ONCE(req->status, hxg[0]);
 		found = true;
 		break;
 	}
@@ -781,14 +720,15 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
 static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *request)
 {
 	struct intel_guc *guc = ct_to_guc(ct);
-	u32 header, action, len;
+	const u32 *hxg;
 	const u32 *payload;
+	u32 action, len;
 	int ret;
 
-	header = request->msg[0];
-	payload = &request->msg[1];
-	action = ct_header_get_action(header);
-	len = ct_header_get_len(header);
+	hxg = &request->msg[GUC_CTB_MSG_MIN_LEN];
+	payload = &hxg[GUC_HXG_MSG_MIN_LEN];
+	action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, hxg[0]);
+	len = request->size - GUC_CTB_HXG_MSG_MIN_LEN;
 
 	CT_DEBUG(ct, "request %x %*ph\n", action, 4 * len, payload);
 
@@ -850,29 +790,12 @@ static void ct_incoming_request_worker_func(struct work_struct *w)
 		queue_work(system_unbound_wq, &ct->requests.worker);
 }
 
-/**
- * DOC: CTB GuC to Host request
- *
- * Format of the CTB GuC to Host request message is as follows::
- *
- *      +------------+---------+---------+---------+---------+---------+
- *      |   msg[0]   |   [1]   |   [2]   |   [3]   |   ...   |  [n-1]  |
- *      +------------+---------+---------+---------+---------+---------+
- *      |   MESSAGE  |       MESSAGE PAYLOAD                           |
- *      +   HEADER   +---------+---------+---------+---------+---------+
- *      |            |    0    |    1    |    2    |   ...   |    n    |
- *      +============+=========+=========+=========+=========+=========+
- *      |     len    |            request specific data                |
- *      +------+-----+---------+---------+---------+---------+---------+
- *
- *                   ^-----------------------len-----------------------^
- */
-
-static int ct_handle_request(struct intel_guc_ct *ct, struct ct_incoming_msg *request)
+static int ct_handle_event(struct intel_guc_ct *ct, struct ct_incoming_msg *request)
 {
+	const u32 *hxg = &request->msg[GUC_CTB_MSG_MIN_LEN];
 	unsigned long flags;
 
-	GEM_BUG_ON(ct_header_is_response(request->msg[0]));
+	GEM_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) != GUC_HXG_TYPE_EVENT);
 
 	spin_lock_irqsave(&ct->requests.lock, flags);
 	list_add_tail(&request->link, &ct->requests.incoming);
@@ -882,15 +805,53 @@ static int ct_handle_request(struct intel_guc_ct *ct, struct ct_incoming_msg *re
 	return 0;
 }
 
-static void ct_handle_msg(struct intel_guc_ct *ct, struct ct_incoming_msg *msg)
+static int ct_handle_hxg(struct intel_guc_ct *ct, struct ct_incoming_msg *msg)
 {
-	u32 header = msg->msg[0];
+	u32 origin, type;
+	u32 *hxg;
 	int err;
 
-	if (ct_header_is_response(header))
+	if (unlikely(msg->size < GUC_CTB_HXG_MSG_MIN_LEN))
+		return -EBADMSG;
+
+	hxg = &msg->msg[GUC_CTB_MSG_MIN_LEN];
+
+	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]);
+	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
+		err = -EPROTO;
+		goto failed;
+	}
+
+	type = FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]);
+	switch (type) {
+	case GUC_HXG_TYPE_EVENT:
+		err = ct_handle_event(ct, msg);
+		break;
+	case GUC_HXG_TYPE_RESPONSE_SUCCESS:
+	case GUC_HXG_TYPE_RESPONSE_FAILURE:
 		err = ct_handle_response(ct, msg);
+		break;
+	default:
+		err = -EOPNOTSUPP;
+	}
+
+	if (unlikely(err)) {
+failed:
+		CT_ERROR(ct, "Failed to handle HXG message (%pe) %*ph\n",
+			 ERR_PTR(err), 4 * GUC_HXG_MSG_MIN_LEN, hxg);
+	}
+	return err;
+}
+
+static void ct_handle_msg(struct intel_guc_ct *ct, struct ct_incoming_msg *msg)
+{
+	u32 format = FIELD_GET(GUC_CTB_MSG_0_FORMAT, msg->msg[0]);
+	int err;
+
+	if (format == GUC_CTB_FORMAT_HXG)
+		err = ct_handle_hxg(ct, msg);
 	else
-		err = ct_handle_request(ct, msg);
+		err = -EOPNOTSUPP;
 
 	if (unlikely(err)) {
 		CT_ERROR(ct, "Failed to process CT message (%pe) %*ph\n",
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
index 905202caaad3..1ae2dde6db93 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
@@ -61,7 +61,7 @@ struct intel_guc_ct {
 	struct tasklet_struct receive_tasklet;
 
 	struct {
-		u32 last_fence; /* last fence used to send request */
+		u16 last_fence; /* last fence used to send request */
 
 		spinlock_t lock; /* protects pending requests list */
 		struct list_head pending; /* requests waiting for response */
-- 
2.28.0

