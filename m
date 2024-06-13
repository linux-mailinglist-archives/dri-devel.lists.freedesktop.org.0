Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB3190849D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 09:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5E310EC40;
	Fri, 14 Jun 2024 07:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="ryD8a5o1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEA910E289
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 08:29:04 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1718266947; bh=EYPrXibjqzr1cOcpS355eq4N5LbPHyM+DDixYl3JHZg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ryD8a5o1joviLB6kT2A/KAVL6CFfAjHcOsp2GtQdQp4EWEDZ8Irze51L5z3cmE8pd
 IKoSRGMQfXQBmM2JNdD4M+l2uJBU26fAWg0v6clGp735O+tom+OWKmBZf9llFkhVS3
 hoALxRQ8vewjmlVQW0nnZQbFKDB5PuV8JYwg3gue7S1nnCyagcrXS/xh/PI5jd1XbX
 su6sluke0gbh9xd24g9F5iaej3/4kgGTNNJXSlRzSe+uMvGFxyB/Wnk1rQ8IaruXP3
 R+yoekozkcoPnB3Y4JhCKKvebSfAIB6MEcOrvy/N9s42PWRqe+LjWvvUvXbL5WM3Fe
 YE+wfn8LpPJaw==
Received: from oshpigelman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by oshpigelman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTP id 45D8M8hZ1440009; Thu, 13 Jun 2024 11:22:08 +0300
From: Omer Shpigelman <oshpigelman@habana.ai>
To: linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: ogabbay@kernel.org, oshpigelman@habana.ai, zyehudai@habana.ai
Subject: [PATCH 04/15] net: hbl_cn: QP state machine
Date: Thu, 13 Jun 2024 11:21:57 +0300
Message-Id: <20240613082208.1439968-5-oshpigelman@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613082208.1439968-1-oshpigelman@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 14 Jun 2024 07:24:52 +0000
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

Add a common QP state machine which handles the moving for a QP from one
state to another including performing necessary checks, draining
in-flight transactions, invalidating caches and error reporting.

Signed-off-by: Omer Shpigelman <oshpigelman@habana.ai>
Co-developed-by: Abhilash K V <kvabhilash@habana.ai>
Signed-off-by: Abhilash K V <kvabhilash@habana.ai>
Co-developed-by: Andrey Agranovich <aagranovich@habana.ai>
Signed-off-by: Andrey Agranovich <aagranovich@habana.ai>
Co-developed-by: Bharat Jauhari <bjauhari@habana.ai>
Signed-off-by: Bharat Jauhari <bjauhari@habana.ai>
Co-developed-by: David Meriin <dmeriin@habana.ai>
Signed-off-by: David Meriin <dmeriin@habana.ai>
Co-developed-by: Sagiv Ozeri <sozeri@habana.ai>
Signed-off-by: Sagiv Ozeri <sozeri@habana.ai>
Co-developed-by: Zvika Yehudai <zyehudai@habana.ai>
Signed-off-by: Zvika Yehudai <zyehudai@habana.ai>
---
 .../ethernet/intel/hbl_cn/common/hbl_cn_qp.c  | 480 +++++++++++++++++-
 1 file changed, 479 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_qp.c b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_qp.c
index 9ddc23bf8194..26ebdf448193 100644
--- a/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_qp.c
+++ b/drivers/net/ethernet/intel/hbl_cn/common/hbl_cn_qp.c
@@ -6,8 +6,486 @@
 
 #include "hbl_cn.h"
 
+#define OP_RETRY_COUNT		4
+#define OPC_SETTLE_RETRY_COUNT	20
+
+/* The following table represents the (valid) operations that can be performed on
+ * a QP in order to move it from one state to another
+ * For example: a QP in RTR state can be moved to RTS state using the CN_QP_OP_RTR_2RTS
+ * operation.
+ */
+static const enum hbl_cn_qp_state_op qp_valid_state_op[CN_QP_NUM_STATE][CN_QP_NUM_STATE] = {
+	[CN_QP_STATE_RESET] = {
+		[CN_QP_STATE_RESET]	= CN_QP_OP_2RESET,
+		[CN_QP_STATE_INIT]	= CN_QP_OP_RST_2INIT,
+		[CN_QP_STATE_SQD]	= CN_QP_OP_NOP,
+		[CN_QP_STATE_QPD]	= CN_QP_OP_NOP,
+	},
+	[CN_QP_STATE_INIT] = {
+		[CN_QP_STATE_RESET]	= CN_QP_OP_2RESET,
+		[CN_QP_STATE_ERR]	= CN_QP_OP_2ERR,
+		[CN_QP_STATE_INIT]	= CN_QP_OP_NOP,
+		[CN_QP_STATE_RTR]	= CN_QP_OP_INIT_2RTR,
+		[CN_QP_STATE_SQD]	= CN_QP_OP_NOP,
+		[CN_QP_STATE_QPD]	= CN_QP_OP_NOP,
+	},
+	[CN_QP_STATE_RTR] = {
+		[CN_QP_STATE_RESET]	= CN_QP_OP_2RESET,
+		[CN_QP_STATE_ERR]	= CN_QP_OP_2ERR,
+		[CN_QP_STATE_RTR]	= CN_QP_OP_RTR_2RTR,
+		[CN_QP_STATE_RTS]	= CN_QP_OP_RTR_2RTS,
+		[CN_QP_STATE_SQD]	= CN_QP_OP_NOP,
+		[CN_QP_STATE_QPD]	= CN_QP_OP_RTR_2QPD,
+	},
+	[CN_QP_STATE_RTS] = {
+		[CN_QP_STATE_RESET]	= CN_QP_OP_2RESET,
+		[CN_QP_STATE_ERR]	= CN_QP_OP_2ERR,
+		[CN_QP_STATE_RTS]	= CN_QP_OP_RTS_2RTS,
+		[CN_QP_STATE_SQD]	= CN_QP_OP_RTS_2SQD,
+		[CN_QP_STATE_QPD]	= CN_QP_OP_RTS_2QPD,
+		[CN_QP_STATE_SQERR]	= CN_QP_OP_RTS_2SQERR,
+	},
+	[CN_QP_STATE_SQD] = {
+		[CN_QP_STATE_RESET]	= CN_QP_OP_2RESET,
+		[CN_QP_STATE_ERR]	= CN_QP_OP_2ERR,
+		[CN_QP_STATE_SQD]	= CN_QP_OP_SQD_2SQD,
+		[CN_QP_STATE_RTS]	= CN_QP_OP_SQD_2RTS,
+		[CN_QP_STATE_QPD]	= CN_QP_OP_SQD_2QPD,
+		[CN_QP_STATE_SQERR]	= CN_QP_OP_SQD_2SQ_ERR,
+	},
+	[CN_QP_STATE_QPD] = {
+		[CN_QP_STATE_RESET]	= CN_QP_OP_2RESET,
+		[CN_QP_STATE_ERR]	= CN_QP_OP_2ERR,
+		[CN_QP_STATE_SQD]	= CN_QP_OP_NOP,
+		[CN_QP_STATE_QPD]	= CN_QP_OP_NOP,
+		[CN_QP_STATE_RTR]	= CN_QP_OP_QPD_2RTR,
+	},
+	[CN_QP_STATE_SQERR] = {
+		[CN_QP_STATE_RESET]	= CN_QP_OP_2RESET,
+		[CN_QP_STATE_ERR]	= CN_QP_OP_2ERR,
+		[CN_QP_STATE_SQD]	= CN_QP_OP_SQ_ERR_2SQD,
+		[CN_QP_STATE_SQERR]	= CN_QP_OP_NOP,
+	},
+	[CN_QP_STATE_ERR] = {
+		[CN_QP_STATE_RESET]	= CN_QP_OP_2RESET,
+		[CN_QP_STATE_ERR]	= CN_QP_OP_2ERR,
+	}
+};
+
+static char *cn_qp_state_2name(enum hbl_cn_qp_state state)
+{
+	static char *arr[CN_QP_NUM_STATE] = {
+						"Reset",
+						"Init",
+						"RTR",
+						"RTS",
+						"SQD",
+						"QPD",
+						"SQERR",
+						"ERR",
+	};
+
+	return arr[state];
+}
+
+static inline int wait_for_qpc_idle(struct hbl_cn_port *cn_port, struct hbl_cn_qp *qp, bool is_req)
+{
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	struct hbl_cn_qpc_attr qpc_attr;
+	int i, rc;
+
+	if (!hdev->qp_wait_for_idle)
+		return 0;
+
+	port_funcs = hdev->asic_funcs->port_funcs;
+
+	for (i = 0; i < OPC_SETTLE_RETRY_COUNT; i++) {
+		rc = port_funcs->qpc_query(cn_port, qp->qp_id, is_req, &qpc_attr);
+
+		if (rc && (rc != -EBUSY && rc != -ETIMEDOUT))
+			return rc;
+
+		if (!(rc || qpc_attr.in_work))
+			return 0;
+
+		/* Release lock while we wait before retry.
+		 * Note, we can assert that we are already locked.
+		 */
+		port_funcs->cfg_unlock(cn_port);
+
+		msleep(20);
+
+		port_funcs->cfg_lock(cn_port);
+	}
+
+	rc = port_funcs->qpc_query(cn_port, qp->qp_id, is_req, &qpc_attr);
+
+	if (rc && (rc != -EBUSY && rc != -ETIMEDOUT))
+		return rc;
+
+	if (rc || qpc_attr.in_work)
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+static int cn_qp_op_reset(struct hbl_cn_port *cn_port, struct hbl_cn_qp *qp)
+{
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_cn_asic_funcs *asic_funcs;
+	int rc, rc1;
+
+	asic_funcs = hdev->asic_funcs;
+
+	/* clear the QPCs */
+	rc = asic_funcs->port_funcs->qpc_clear(cn_port, qp, false);
+	if (rc && hbl_cn_comp_device_operational(hdev))
+		/* Device might not respond during reset if the reset was due to error */
+		dev_err(hdev->dev, "Port %d QP %d: Failed to clear responder QPC\n",
+			qp->port, qp->qp_id);
+	else
+		qp->is_res = false;
+
+	rc1 = asic_funcs->port_funcs->qpc_clear(cn_port, qp, true);
+	if (rc1) {
+		rc = rc1;
+		if (hbl_cn_comp_device_operational(hdev))
+			/* Device might not respond during reset if the reset was due to error */
+			dev_err(hdev->dev, "Port %d QP %d: Failed to clear requestor QPC\n",
+				qp->port, qp->qp_id);
+	} else {
+		qp->is_req = false;
+	}
+
+	/* wait for REQ idle, RES idle is already done in cn_qp_op_2qpd */
+	rc = wait_for_qpc_idle(cn_port, qp, true);
+	if (rc) {
+		dev_err(hdev->dev, "Port %d QP %d, Requestor QPC is not idle (rc %d)\n",
+			cn_port->port, qp->qp_id, rc);
+		return rc;
+	}
+
+	qp->curr_state = CN_QP_STATE_RESET;
+
+	return rc;
+}
+
+static int cn_qp_op_reset_2init(struct hbl_cn_port *cn_port, struct hbl_cn_qp *qp)
+{
+	if (ZERO_OR_NULL_PTR(qp))
+		return -EINVAL;
+
+	qp->curr_state = CN_QP_STATE_INIT;
+
+	return 0;
+}
+
+static int cn_qp_op_2rts(struct hbl_cn_port *cn_port, struct hbl_cn_qp *qp,
+			 struct hbl_cni_req_conn_ctx_in *in)
+{
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_cn_asic_funcs *asic_funcs;
+	int rc;
+
+	asic_funcs = hdev->asic_funcs;
+
+	rc = asic_funcs->set_req_qp_ctx(hdev, in, qp);
+	if (rc)
+		return rc;
+
+	qp->curr_state = CN_QP_STATE_RTS;
+	qp->is_req = true;
+
+	return 0;
+}
+
+static int cn_qp_op_2rtr(struct hbl_cn_port *cn_port, struct hbl_cn_qp *qp,
+			 struct hbl_cni_res_conn_ctx_in *in)
+{
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_cn_asic_funcs *asic_funcs;
+	int rc;
+
+	asic_funcs = hdev->asic_funcs;
+
+	rc = asic_funcs->set_res_qp_ctx(hdev, in, qp);
+	if (rc)
+		return rc;
+
+	qp->curr_state = CN_QP_STATE_RTR;
+	qp->is_res = true;
+
+	return 0;
+}
+
+static inline int cn_qp_invalidate_qpc(struct hbl_cn_port *cn_port, struct hbl_cn_qp *qp,
+				       bool is_req)
+{
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_cn_asic_funcs *asic_funcs;
+	int i, rc;
+
+	asic_funcs = hdev->asic_funcs;
+
+	for (i = 0; i < OP_RETRY_COUNT; i++) {
+		rc = asic_funcs->port_funcs->qpc_invalidate(cn_port, qp, is_req);
+		if (!rc)
+			break;
+
+		usleep_range(100, 200);
+	}
+
+	return rc;
+}
+
+static int cn_qp_invalidate(struct hbl_cn_port *cn_port, struct hbl_cn_qp *qp, bool is_req,
+			    bool wait_for_idle)
+{
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	int rc;
+
+	rc = cn_qp_invalidate_qpc(cn_port, qp, is_req);
+	if (rc) {
+		if (hbl_cn_comp_device_operational(hdev))
+			dev_err(hdev->dev, "Port %d QP %d, failed to invalidate %s QPC (rc %d)\n",
+				cn_port->port, qp->qp_id, is_req ? "Requester" : "Responder", rc);
+		return rc;
+	}
+
+	if (!wait_for_idle || is_req)
+		return 0;
+
+	/* check for QP idle in case of responder only */
+	rc = wait_for_qpc_idle(cn_port, qp, false);
+	if (rc) {
+		dev_err(hdev->dev, "Port %d QP %d, Responder QPC is not idle (rc %d)\n",
+			cn_port->port, qp->qp_id, rc);
+		return rc;
+	}
+
+	return rc;
+}
+
+/* Drain the Requester */
+static int cn_qp_op_rts_2sqd(struct hbl_cn_port *cn_port, struct hbl_cn_qp *qp, void *attr)
+{
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_cn_qpc_drain_attr *drain = attr;
+	int rc = 0;
+
+	switch (qp->curr_state) {
+	case CN_QP_STATE_RTS:
+		cn_qp_invalidate(cn_port, qp, true, drain->wait_for_idle);
+		if (drain->wait_for_idle)
+			ssleep(hdev->qp_drain_time);
+
+		break;
+	default:
+		rc = -EOPNOTSUPP;
+		break;
+	}
+
+	if (!rc)
+		qp->curr_state = CN_QP_STATE_SQD;
+
+	return rc;
+}
+
+/* Re-drain the Requester. This function is called without holding the cfg lock so it must not
+ * access the HW or do anything other than just sleeping.
+ */
+static int cn_qp_op_sqd_2sqd(struct hbl_cn_port *cn_port, struct hbl_cn_qp *qp, void *attr)
+{
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_cn_qpc_drain_attr *drain = attr;
+
+	/* no need to invalidate the QP as it was already invalidated just extend the wait time */
+	if (drain->wait_for_idle)
+		ssleep(hdev->qp_drain_time);
+
+	return 0;
+}
+
+/* Drain the QP (Requester and Responder) */
+static int cn_qp_op_2qpd(struct hbl_cn_port *cn_port, struct hbl_cn_qp *qp, void *attr)
+{
+	struct hbl_cn_qpc_drain_attr *drain = attr;
+	int rc = 0;
+
+	switch (qp->curr_state) {
+	case CN_QP_STATE_RTR:
+		/* In RTR only the Resp is working */
+		cn_qp_invalidate(cn_port, qp, false, drain->wait_for_idle);
+		break;
+	case CN_QP_STATE_RTS:
+		/* In RTS both the Resp and Req are working */
+		cn_qp_op_rts_2sqd(cn_port, qp, attr);
+		cn_qp_invalidate(cn_port, qp, false, drain->wait_for_idle);
+		break;
+	case CN_QP_STATE_SQD:
+		/* In SQD only the Resp is working */
+		cn_qp_invalidate(cn_port, qp, false, drain->wait_for_idle);
+		break;
+	case CN_QP_STATE_QPD:
+		break;
+	default:
+		rc = -EOPNOTSUPP;
+		break;
+	}
+
+	if (!rc)
+		qp->curr_state = CN_QP_STATE_QPD;
+
+	return rc;
+}
+
+static int cn_qp_op_2reset(struct hbl_cn_port *cn_port, struct hbl_cn_qp *qp,
+			   const struct hbl_cn_qpc_reset_attr *attr)
+{
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_cn_asic_funcs *asic_funcs;
+	struct hbl_cn_qpc_drain_attr drain;
+
+	asic_funcs = hdev->asic_funcs;
+
+	/* brute-force reset when reset mode is Hard */
+	if (attr->reset_mode == CN_QP_RESET_MODE_HARD && qp->curr_state != CN_QP_STATE_RESET) {
+		/* invalidate */
+		asic_funcs->port_funcs->qpc_invalidate(cn_port, qp, true);
+		asic_funcs->port_funcs->qpc_invalidate(cn_port, qp, false);
+
+		/* wait for HW digest the invalidation */
+		usleep_range(100, 150);
+
+		cn_qp_op_reset(cn_port, qp);
+		return 0;
+	}
+
+	if (attr->reset_mode == CN_QP_RESET_MODE_GRACEFUL)
+		drain.wait_for_idle = true;
+	else
+		drain.wait_for_idle = false;
+
+	switch (qp->curr_state) {
+	case CN_QP_STATE_RESET:
+		break;
+	case CN_QP_STATE_INIT:
+		cn_qp_op_reset(cn_port, qp);
+		break;
+	case CN_QP_STATE_RTR:
+	case CN_QP_STATE_RTS:
+	case CN_QP_STATE_SQD:
+		cn_qp_op_2qpd(cn_port, qp, &drain);
+		cn_qp_op_reset(cn_port, qp);
+		break;
+	case CN_QP_STATE_QPD:
+		cn_qp_op_reset(cn_port, qp);
+		break;
+	case CN_QP_STATE_SQERR:
+	case CN_QP_STATE_ERR:
+		cn_qp_op_reset(cn_port, qp);
+		break;
+	default:
+		dev_err(hdev->dev, "Port %d QP %d: Unknown state %d, moving to RESET state\n",
+			qp->port, qp->qp_id, qp->curr_state);
+		cn_qp_op_reset(cn_port, qp);
+		break;
+	}
+
+	return 0;
+}
+
+/* QP state handling routines  */
 int hbl_cn_qp_modify(struct hbl_cn_port *cn_port, struct hbl_cn_qp *qp,
 		     enum hbl_cn_qp_state new_state, void *params)
 {
-	return 0;
+	enum hbl_cn_qp_state prev_state = qp->curr_state;
+	struct hbl_cn_device *hdev = cn_port->hdev;
+	struct hbl_cn_asic_port_funcs *port_funcs;
+	enum hbl_cn_qp_state_op op;
+	int rc;
+
+	port_funcs = hdev->asic_funcs->port_funcs;
+
+	/* only SQD->SQD transition can be executed without holding the configuration lock */
+	if (prev_state != CN_QP_STATE_SQD || new_state != CN_QP_STATE_SQD) {
+		if (!port_funcs->cfg_is_locked(cn_port)) {
+			dev_err(hdev->dev,
+				"Configuration lock must be held while moving Port %u QP %u from state %s to %s\n",
+				qp->port, qp->qp_id, cn_qp_state_2name(prev_state),
+				cn_qp_state_2name(new_state));
+			return -EACCES;
+		}
+	}
+
+	if (qp->curr_state >= CN_QP_NUM_STATE || new_state >= CN_QP_NUM_STATE ||
+	    qp_valid_state_op[qp->curr_state][new_state] == CN_QP_OP_INVAL) {
+		dev_err(hdev->dev,
+			"Invalid QP state transition, Port %u QP %u from state %s to %s\n",
+			qp->port, qp->qp_id, cn_qp_state_2name(prev_state),
+			cn_qp_state_2name(new_state));
+		return -EINVAL;
+	}
+
+	if (new_state >= CN_QP_NUM_STATE) {
+		dev_err(hdev->dev, "Invalid QP state %d\n", new_state);
+		return -EINVAL;
+	}
+
+	/* get the operation needed for this state transition */
+	op = qp_valid_state_op[qp->curr_state][new_state];
+
+	switch (op) {
+	case CN_QP_OP_2RESET:
+		rc = cn_qp_op_2reset(cn_port, qp, params);
+		break;
+	case CN_QP_OP_RST_2INIT:
+		rc = cn_qp_op_reset_2init(cn_port, qp);
+		break;
+	case CN_QP_OP_INIT_2RTR:
+		rc = cn_qp_op_2rtr(cn_port, qp, params);
+		break;
+	case CN_QP_OP_RTR_2RTR:
+		rc = cn_qp_op_2rtr(cn_port, qp, params);
+		break;
+	case CN_QP_OP_RTR_2QPD:
+		rc = cn_qp_op_2qpd(cn_port, qp, params);
+		break;
+	case CN_QP_OP_RTR_2RTS:
+		rc = cn_qp_op_2rts(cn_port, qp, params);
+		break;
+	case CN_QP_OP_RTS_2RTS:
+		rc = cn_qp_op_2rts(cn_port, qp, params);
+		break;
+	case CN_QP_OP_RTS_2SQD:
+		rc = cn_qp_op_rts_2sqd(cn_port, qp, params);
+		break;
+	case CN_QP_OP_SQD_2SQD:
+		rc = cn_qp_op_sqd_2sqd(cn_port, qp, params);
+		break;
+	case CN_QP_OP_RTS_2QPD:
+		rc = cn_qp_op_2qpd(cn_port, qp, params);
+		break;
+	case CN_QP_OP_SQD_2QPD:
+		rc = cn_qp_op_2qpd(cn_port, qp, params);
+		break;
+	case CN_QP_OP_INVAL:
+		rc = -EINVAL;
+		break;
+	case CN_QP_OP_NOP:
+		rc = 0;
+		break;
+	default:
+		rc = -EOPNOTSUPP;
+		break;
+	}
+
+	if (rc)
+		dev_err(hdev->dev,
+			"Errors detected while moving Port %u QP %u from state %s to %s, (rc %d)\n",
+			qp->port, qp->qp_id, cn_qp_state_2name(prev_state),
+			cn_qp_state_2name(new_state), rc);
+
+	return rc;
 }
-- 
2.34.1

