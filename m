Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A48375A9E
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 20:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5AA6EDBB;
	Thu,  6 May 2021 18:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DD76ECF1;
 Thu,  6 May 2021 18:57:12 +0000 (UTC)
IronPort-SDR: ZkwDia+APrA71Q28kzVKlNvmUsu8DqofJwZoABOFerhLeZwqxknpooM0UEq76VPvuOpAXCfT4M
 wFqYIrKTsZYg==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196530994"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196530994"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:11 -0700
IronPort-SDR: B007oCzRrgjTZs76i5fgrEGmiQ7mRafGI6wNY5mt9Xz/o61suckKtrCNGRKZ0C3FaZMKF5zz+0
 uzDAwBpsirBg==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583414"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 19/97] drm/i915/guc: Always copy CT message to new
 allocation
Date: Thu,  6 May 2021 12:13:33 -0700
Message-Id: <20210506191451.77768-20-matthew.brost@intel.com>
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

Since most of future CT traffic will be based on G2H requests,
instead of copying incoming CT message to static buffer and then
create new allocation for such request, always copy incoming CT
message to new allocation. Also by doing it while reading CT
header, we can safely fallback if that atomic allocation fails.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 180 ++++++++++++++--------
 1 file changed, 120 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index d630ec32decf..a174978c6a27 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -72,8 +72,9 @@ struct ct_request {
 	u32 *response_buf;
 };
 
-struct ct_incoming_request {
+struct ct_incoming_msg {
 	struct list_head link;
+	u32 size;
 	u32 msg[];
 };
 
@@ -575,7 +576,26 @@ static inline bool ct_header_is_response(u32 header)
 	return !!(header & GUC_CT_MSG_IS_RESPONSE);
 }
 
-static int ct_read(struct intel_guc_ct *ct, u32 *data)
+static struct ct_incoming_msg *ct_alloc_msg(u32 num_dwords)
+{
+	struct ct_incoming_msg *msg;
+
+	msg = kmalloc(sizeof(*msg) + sizeof(u32) * num_dwords, GFP_ATOMIC);
+	if (msg)
+		msg->size = num_dwords;
+	return msg;
+}
+
+static void ct_free_msg(struct ct_incoming_msg *msg)
+{
+	kfree(msg);
+}
+
+/*
+ * Return: number available remaining dwords to read (0 if empty)
+ *         or a negative error code on failure
+ */
+static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 {
 	struct intel_guc_ct_buffer *ctb = &ct->ctbs.recv;
 	struct guc_ct_buffer_desc *desc = ctb->desc;
@@ -586,6 +606,7 @@ static int ct_read(struct intel_guc_ct *ct, u32 *data)
 	s32 available;
 	unsigned int len;
 	unsigned int i;
+	u32 header;
 
 	if (unlikely(desc->is_in_error))
 		return -EPIPE;
@@ -601,8 +622,10 @@ static int ct_read(struct intel_guc_ct *ct, u32 *data)
 
 	/* tail == head condition indicates empty */
 	available = tail - head;
-	if (unlikely(available == 0))
-		return -ENODATA;
+	if (unlikely(available == 0)) {
+		*msg = NULL;
+		return 0;
+	}
 
 	/* beware of buffer wrap case */
 	if (unlikely(available < 0))
@@ -610,14 +633,14 @@ static int ct_read(struct intel_guc_ct *ct, u32 *data)
 	CT_DEBUG(ct, "available %d (%u:%u)\n", available, head, tail);
 	GEM_BUG_ON(available < 0);
 
-	data[0] = cmds[head];
+	header = cmds[head];
 	head = (head + 1) % size;
 
 	/* message len with header */
-	len = ct_header_get_len(data[0]) + 1;
+	len = ct_header_get_len(header) + 1;
 	if (unlikely(len > (u32)available)) {
 		CT_ERROR(ct, "Incomplete message %*ph %*ph %*ph\n",
-			 4, data,
+			 4, &header,
 			 4 * (head + available - 1 > size ?
 			      size - head : available - 1), &cmds[head],
 			 4 * (head + available - 1 > size ?
@@ -625,11 +648,24 @@ static int ct_read(struct intel_guc_ct *ct, u32 *data)
 		goto corrupted;
 	}
 
+	*msg = ct_alloc_msg(len);
+	if (!*msg) {
+		CT_ERROR(ct, "No memory for message %*ph %*ph %*ph\n",
+			 4, &header,
+			 4 * (head + available - 1 > size ?
+			      size - head : available - 1), &cmds[head],
+			 4 * (head + available - 1 > size ?
+			      available - 1 - size + head : 0), &cmds[0]);
+		return available;
+	}
+
+	(*msg)->msg[0] = header;
+
 	for (i = 1; i < len; i++) {
-		data[i] = cmds[head];
+		(*msg)->msg[i] = cmds[head];
 		head = (head + 1) % size;
 	}
-	CT_DEBUG(ct, "received %*ph\n", 4 * len, data);
+	CT_DEBUG(ct, "received %*ph\n", 4 * len, (*msg)->msg);
 
 	desc->head = head * 4;
 	return available - len;
@@ -659,33 +695,33 @@ static int ct_read(struct intel_guc_ct *ct, u32 *data)
  *                   ^-----------------------len-----------------------^
  */
 
-static int ct_handle_response(struct intel_guc_ct *ct, const u32 *msg)
+static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *response)
 {
-	u32 header = msg[0];
+	u32 header = response->msg[0];
 	u32 len = ct_header_get_len(header);
-	u32 msgsize = (len + 1) * sizeof(u32); /* msg size in bytes w/header */
 	u32 fence;
 	u32 status;
 	u32 datalen;
 	struct ct_request *req;
 	unsigned long flags;
 	bool found = false;
+	int err = 0;
 
 	GEM_BUG_ON(!ct_header_is_response(header));
 
 	/* Response payload shall at least include fence and status */
 	if (unlikely(len < 2)) {
-		CT_ERROR(ct, "Corrupted response %*ph\n", msgsize, msg);
+		CT_ERROR(ct, "Corrupted response (len %u)\n", len);
 		return -EPROTO;
 	}
 
-	fence = msg[1];
-	status = msg[2];
+	fence = response->msg[1];
+	status = response->msg[2];
 	datalen = len - 2;
 
 	/* Format of the status follows RESPONSE message */
 	if (unlikely(!INTEL_GUC_MSG_IS_RESPONSE(status))) {
-		CT_ERROR(ct, "Corrupted response %*ph\n", msgsize, msg);
+		CT_ERROR(ct, "Corrupted response (status %#x)\n", status);
 		return -EPROTO;
 	}
 
@@ -699,12 +735,13 @@ static int ct_handle_response(struct intel_guc_ct *ct, const u32 *msg)
 			continue;
 		}
 		if (unlikely(datalen > req->response_len)) {
-			CT_ERROR(ct, "Response for %u is too long %*ph\n",
-				 req->fence, msgsize, msg);
-			datalen = 0;
+			CT_ERROR(ct, "Response %u too long (datalen %u > %u)\n",
+				 req->fence, datalen, req->response_len);
+			datalen = min(datalen, req->response_len);
+			err = -EMSGSIZE;
 		}
 		if (datalen)
-			memcpy(req->response_buf, msg + 3, 4 * datalen);
+			memcpy(req->response_buf, response->msg + 3, 4 * datalen);
 		req->response_len = datalen;
 		WRITE_ONCE(req->status, status);
 		found = true;
@@ -712,45 +749,61 @@ static int ct_handle_response(struct intel_guc_ct *ct, const u32 *msg)
 	}
 	spin_unlock_irqrestore(&ct->requests.lock, flags);
 
-	if (!found)
-		CT_ERROR(ct, "Unsolicited response %*ph\n", msgsize, msg);
+	if (!found) {
+		CT_ERROR(ct, "Unsolicited response (fence %u)\n", fence);
+		return -ENOKEY;
+	}
+
+	if (unlikely(err))
+		return err;
+
+	ct_free_msg(response);
 	return 0;
 }
 
-static void ct_process_request(struct intel_guc_ct *ct,
-			       u32 action, u32 len, const u32 *payload)
+static int ct_process_request(struct intel_guc_ct *ct, struct ct_incoming_msg *request)
 {
 	struct intel_guc *guc = ct_to_guc(ct);
+	u32 header, action, len;
+	const u32 *payload;
 	int ret;
 
+	header = request->msg[0];
+	payload = &request->msg[1];
+	action = ct_header_get_action(header);
+	len = ct_header_get_len(header);
+
 	CT_DEBUG(ct, "request %x %*ph\n", action, 4 * len, payload);
 
 	switch (action) {
 	case INTEL_GUC_ACTION_DEFAULT:
 		ret = intel_guc_to_host_process_recv_msg(guc, payload, len);
-		if (unlikely(ret))
-			goto fail_unexpected;
 		break;
-
 	default:
-fail_unexpected:
-		CT_ERROR(ct, "Unexpected request %x %*ph\n",
-			 action, 4 * len, payload);
+		ret = -EOPNOTSUPP;
 		break;
 	}
+
+	if (unlikely(ret)) {
+		CT_ERROR(ct, "Failed to process request %04x (%pe)\n",
+			 action, ERR_PTR(ret));
+		return ret;
+	}
+
+	ct_free_msg(request);
+	return 0;
 }
 
 static bool ct_process_incoming_requests(struct intel_guc_ct *ct)
 {
 	unsigned long flags;
-	struct ct_incoming_request *request;
-	u32 header;
-	u32 *payload;
+	struct ct_incoming_msg *request;
 	bool done;
+	int err;
 
 	spin_lock_irqsave(&ct->requests.lock, flags);
 	request = list_first_entry_or_null(&ct->requests.incoming,
-					   struct ct_incoming_request, link);
+					   struct ct_incoming_msg, link);
 	if (request)
 		list_del(&request->link);
 	done = !!list_empty(&ct->requests.incoming);
@@ -759,14 +812,13 @@ static bool ct_process_incoming_requests(struct intel_guc_ct *ct)
 	if (!request)
 		return true;
 
-	header = request->msg[0];
-	payload = &request->msg[1];
-	ct_process_request(ct,
-			   ct_header_get_action(header),
-			   ct_header_get_len(header),
-			   payload);
+	err = ct_process_request(ct, request);
+	if (unlikely(err)) {
+		CT_ERROR(ct, "Failed to process CT message (%pe) %*ph\n",
+			 ERR_PTR(err), 4 * request->size, request->msg);
+		ct_free_msg(request);
+	}
 
-	kfree(request);
 	return done;
 }
 
@@ -799,22 +851,11 @@ static void ct_incoming_request_worker_func(struct work_struct *w)
  *                   ^-----------------------len-----------------------^
  */
 
-static int ct_handle_request(struct intel_guc_ct *ct, const u32 *msg)
+static int ct_handle_request(struct intel_guc_ct *ct, struct ct_incoming_msg *request)
 {
-	u32 header = msg[0];
-	u32 len = ct_header_get_len(header);
-	u32 msgsize = (len + 1) * sizeof(u32); /* msg size in bytes w/header */
-	struct ct_incoming_request *request;
 	unsigned long flags;
 
-	GEM_BUG_ON(ct_header_is_response(header));
-
-	request = kmalloc(sizeof(*request) + msgsize, GFP_ATOMIC);
-	if (unlikely(!request)) {
-		CT_ERROR(ct, "Dropping request %*ph\n", msgsize, msg);
-		return 0; /* XXX: -ENOMEM ? */
-	}
-	memcpy(request->msg, msg, msgsize);
+	GEM_BUG_ON(ct_header_is_response(request->msg[0]));
 
 	spin_lock_irqsave(&ct->requests.lock, flags);
 	list_add_tail(&request->link, &ct->requests.incoming);
@@ -824,22 +865,41 @@ static int ct_handle_request(struct intel_guc_ct *ct, const u32 *msg)
 	return 0;
 }
 
+static void ct_handle_msg(struct intel_guc_ct *ct, struct ct_incoming_msg *msg)
+{
+	u32 header = msg->msg[0];
+	int err;
+
+	if (ct_header_is_response(header))
+		err = ct_handle_response(ct, msg);
+	else
+		err = ct_handle_request(ct, msg);
+
+	if (unlikely(err)) {
+		CT_ERROR(ct, "Failed to process CT message (%pe) %*ph\n",
+			 ERR_PTR(err), 4 * msg->size, msg->msg);
+		ct_free_msg(msg);
+	}
+}
+
+/*
+ * Return: number available remaining dwords to read (0 if empty)
+ *         or a negative error code on failure
+ */
 static int ct_receive(struct intel_guc_ct *ct)
 {
-	u32 msg[GUC_CT_MSG_LEN_MASK + 1]; /* one extra dw for the header */
+	struct ct_incoming_msg *msg = NULL;
 	unsigned long flags;
 	int ret;
 
 	spin_lock_irqsave(&ct->ctbs.recv.lock, flags);
-	ret = ct_read(ct, msg);
+	ret = ct_read(ct, &msg);
 	spin_unlock_irqrestore(&ct->ctbs.recv.lock, flags);
 	if (ret < 0)
 		return ret;
 
-	if (ct_header_is_response(msg[0]))
-		ct_handle_response(ct, msg);
-	else
-		ct_handle_request(ct, msg);
+	if (msg)
+		ct_handle_msg(ct, msg);
 
 	return ret;
 }
-- 
2.28.0

