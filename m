Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5591527AE
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 09:53:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC546F4D0;
	Wed,  5 Feb 2020 08:52:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876FF6F4C8
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 08:48:58 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0158m048005810; Wed, 5 Feb 2020 09:48:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=q8t0vACUgEjyjKjc6VGBoW2Te5qkKOMN9QnREJ0z+4g=;
 b=kr87CKLWfGOyZ404ZjtIpYOMsWBlL5iwaJYSBhZ+Mu89yg+kgZxtUG/tKnhiCLKL4xGT
 GqvZvGRJNWPY1HSK1n1bNiqoGBLpWJ4XdDOPpjzvDfWV+xvFLAF8ecNf968sP6T9agRP
 Ae1QWCOfZFM3mFLXzXha8VgG3lReOlnqrEp9m3hIeEx2H6g711KxhzXDaXdGZ7gytqvn
 dVgh1dootAy/91PqcczBJkg3OEXzley0odsKuAIBcUS9rXPkZ2JFFaaiyFkQu1uj7Kzi
 T8Il/rb+p1sLT9KaoCFZbc7+f+M9Y1+YWx/NVnevjLJoOWP/U7wbTfbyhf2EOws6Ye43 cQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xyhkb3u30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Feb 2020 09:48:50 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 29F2810002A;
 Wed,  5 Feb 2020 09:48:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EAB372A4838;
 Wed,  5 Feb 2020 09:48:44 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 5 Feb 2020 09:48:44
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <jani.nikula@linux.intel.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v6] drm/dp_mst: Fix W=1 warnings
Date: Wed, 5 Feb 2020 09:48:42 +0100
Message-ID: <20200205084842.5642-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-05_02:2020-02-04,
 2020-02-05 signatures=0
X-Mailman-Approved-At: Wed, 05 Feb 2020 08:52:53 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the warnings that show up with W=1.
They are all about unused but set variables.
If functions returns are not used anymore make them void.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
version 6:
- change drm_dp_check_mstb_guid() prototype to be able to return an error
- add check for drm_dp_check_mstb_guid() return value
- check drm_dp_dpcd_read() return value in drm_dp_mst_dump_topology()

version 5:
- fix indentation
  
version 4:
- do not touch crc4 unused variable in this patch
CC: lyude@redhat.com
CC: airlied@linux.ie
CC: jani.nikula@linux.intel.com

 drivers/gpu/drm/drm_dp_mst_topology.c | 114 +++++++++++++++++++---------------
 1 file changed, 65 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 4104f15f4594..0ced7a204985 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -1034,7 +1034,8 @@ static bool drm_dp_sideband_parse_req(struct drm_dp_sideband_msg_rx *raw,
 	}
 }
 
-static int build_dpcd_write(struct drm_dp_sideband_msg_tx *msg, u8 port_num, u32 offset, u8 num_bytes, u8 *bytes)
+static void build_dpcd_write(struct drm_dp_sideband_msg_tx *msg,
+			     u8 port_num, u32 offset, u8 num_bytes, u8 *bytes)
 {
 	struct drm_dp_sideband_msg_req_body req;
 
@@ -1044,17 +1045,14 @@ static int build_dpcd_write(struct drm_dp_sideband_msg_tx *msg, u8 port_num, u32
 	req.u.dpcd_write.num_bytes = num_bytes;
 	req.u.dpcd_write.bytes = bytes;
 	drm_dp_encode_sideband_req(&req, msg);
-
-	return 0;
 }
 
-static int build_link_address(struct drm_dp_sideband_msg_tx *msg)
+static void build_link_address(struct drm_dp_sideband_msg_tx *msg)
 {
 	struct drm_dp_sideband_msg_req_body req;
 
 	req.req_type = DP_LINK_ADDRESS;
 	drm_dp_encode_sideband_req(&req, msg);
-	return 0;
 }
 
 static int build_clear_payload_id_table(struct drm_dp_sideband_msg_tx *msg)
@@ -1066,7 +1064,8 @@ static int build_clear_payload_id_table(struct drm_dp_sideband_msg_tx *msg)
 	return 0;
 }
 
-static int build_enum_path_resources(struct drm_dp_sideband_msg_tx *msg, int port_num)
+static int build_enum_path_resources(struct drm_dp_sideband_msg_tx *msg,
+				     int port_num)
 {
 	struct drm_dp_sideband_msg_req_body req;
 
@@ -1077,10 +1076,11 @@ static int build_enum_path_resources(struct drm_dp_sideband_msg_tx *msg, int por
 	return 0;
 }
 
-static int build_allocate_payload(struct drm_dp_sideband_msg_tx *msg, int port_num,
-				  u8 vcpi, uint16_t pbn,
-				  u8 number_sdp_streams,
-				  u8 *sdp_stream_sink)
+static void build_allocate_payload(struct drm_dp_sideband_msg_tx *msg,
+				   int port_num,
+				   u8 vcpi, uint16_t pbn,
+				   u8 number_sdp_streams,
+				   u8 *sdp_stream_sink)
 {
 	struct drm_dp_sideband_msg_req_body req;
 	memset(&req, 0, sizeof(req));
@@ -1093,11 +1093,10 @@ static int build_allocate_payload(struct drm_dp_sideband_msg_tx *msg, int port_n
 		   number_sdp_streams);
 	drm_dp_encode_sideband_req(&req, msg);
 	msg->path_msg = true;
-	return 0;
 }
 
-static int build_power_updown_phy(struct drm_dp_sideband_msg_tx *msg,
-				  int port_num, bool power_up)
+static void build_power_updown_phy(struct drm_dp_sideband_msg_tx *msg,
+				   int port_num, bool power_up)
 {
 	struct drm_dp_sideband_msg_req_body req;
 
@@ -1109,7 +1108,6 @@ static int build_power_updown_phy(struct drm_dp_sideband_msg_tx *msg,
 	req.u.port_num.port_number = port_num;
 	drm_dp_encode_sideband_req(&req, msg);
 	msg->path_msg = true;
-	return 0;
 }
 
 static int drm_dp_mst_assign_payload_id(struct drm_dp_mst_topology_mgr *mgr,
@@ -2052,29 +2050,24 @@ ssize_t drm_dp_mst_dpcd_write(struct drm_dp_aux *aux,
 				      offset, size, buffer);
 }
 
-static void drm_dp_check_mstb_guid(struct drm_dp_mst_branch *mstb, u8 *guid)
+static int drm_dp_check_mstb_guid(struct drm_dp_mst_branch *mstb, u8 *guid)
 {
-	int ret;
+	int ret = 0;
 
 	memcpy(mstb->guid, guid, 16);
 
 	if (!drm_dp_validate_guid(mstb->mgr, mstb->guid)) {
 		if (mstb->port_parent) {
-			ret = drm_dp_send_dpcd_write(
-					mstb->mgr,
-					mstb->port_parent,
-					DP_GUID,
-					16,
-					mstb->guid);
+			ret = drm_dp_send_dpcd_write(mstb->mgr,
+						     mstb->port_parent,
+						     DP_GUID, 16, mstb->guid);
 		} else {
-
-			ret = drm_dp_dpcd_write(
-					mstb->mgr->aux,
-					DP_GUID,
-					mstb->guid,
-					16);
+			ret = drm_dp_dpcd_write(mstb->mgr->aux,
+						DP_GUID, mstb->guid, 16);
 		}
 	}
+
+	return ret;
 }
 
 static void build_mst_prop_path(const struct drm_dp_mst_branch *mstb,
@@ -2595,7 +2588,8 @@ static bool drm_dp_validate_guid(struct drm_dp_mst_topology_mgr *mgr,
 	return false;
 }
 
-static int build_dpcd_read(struct drm_dp_sideband_msg_tx *msg, u8 port_num, u32 offset, u8 num_bytes)
+static void build_dpcd_read(struct drm_dp_sideband_msg_tx *msg,
+			    u8 port_num, u32 offset, u8 num_bytes)
 {
 	struct drm_dp_sideband_msg_req_body req;
 
@@ -2604,8 +2598,6 @@ static int build_dpcd_read(struct drm_dp_sideband_msg_tx *msg, u8 port_num, u32
 	req.u.dpcd_read.dpcd_address = offset;
 	req.u.dpcd_read.num_bytes = num_bytes;
 	drm_dp_encode_sideband_req(&req, msg);
-
-	return 0;
 }
 
 static int drm_dp_send_sideband_msg(struct drm_dp_mst_topology_mgr *mgr,
@@ -2828,7 +2820,7 @@ static int drm_dp_send_link_address(struct drm_dp_mst_topology_mgr *mgr,
 	struct drm_dp_sideband_msg_tx *txmsg;
 	struct drm_dp_link_address_ack_reply *reply;
 	struct drm_dp_mst_port *port, *tmp;
-	int i, len, ret, port_mask = 0;
+	int i, ret, port_mask = 0;
 	bool changed = false;
 
 	txmsg = kzalloc(sizeof(*txmsg), GFP_KERNEL);
@@ -2836,7 +2828,7 @@ static int drm_dp_send_link_address(struct drm_dp_mst_topology_mgr *mgr,
 		return -ENOMEM;
 
 	txmsg->dst = mstb;
-	len = build_link_address(txmsg);
+	build_link_address(txmsg);
 
 	mstb->link_address_sent = true;
 	drm_dp_queue_down_tx(mgr, txmsg);
@@ -2857,7 +2849,9 @@ static int drm_dp_send_link_address(struct drm_dp_mst_topology_mgr *mgr,
 	DRM_DEBUG_KMS("link address reply: %d\n", reply->nports);
 	drm_dp_dump_link_address(reply);
 
-	drm_dp_check_mstb_guid(mstb, reply->guid);
+	ret = drm_dp_check_mstb_guid(mstb, reply->guid);
+	if (ret)
+		goto out;
 
 	for (i = 0; i < reply->nports; i++) {
 		port_mask |= BIT(reply->ports[i].port_number);
@@ -2898,14 +2892,14 @@ void drm_dp_send_clear_payload_id_table(struct drm_dp_mst_topology_mgr *mgr,
 					struct drm_dp_mst_branch *mstb)
 {
 	struct drm_dp_sideband_msg_tx *txmsg;
-	int len, ret;
+	int ret;
 
 	txmsg = kzalloc(sizeof(*txmsg), GFP_KERNEL);
 	if (!txmsg)
 		return;
 
 	txmsg->dst = mstb;
-	len = build_clear_payload_id_table(txmsg);
+	build_clear_payload_id_table(txmsg);
 
 	drm_dp_queue_down_tx(mgr, txmsg);
 
@@ -2923,7 +2917,6 @@ drm_dp_send_enum_path_resources(struct drm_dp_mst_topology_mgr *mgr,
 {
 	struct drm_dp_enum_path_resources_ack_reply *path_res;
 	struct drm_dp_sideband_msg_tx *txmsg;
-	int len;
 	int ret;
 
 	txmsg = kzalloc(sizeof(*txmsg), GFP_KERNEL);
@@ -2931,7 +2924,7 @@ drm_dp_send_enum_path_resources(struct drm_dp_mst_topology_mgr *mgr,
 		return -ENOMEM;
 
 	txmsg->dst = mstb;
-	len = build_enum_path_resources(txmsg, port->port_num);
+	build_enum_path_resources(txmsg, port->port_num);
 
 	drm_dp_queue_down_tx(mgr, txmsg);
 
@@ -3014,7 +3007,7 @@ static int drm_dp_payload_send_msg(struct drm_dp_mst_topology_mgr *mgr,
 {
 	struct drm_dp_sideband_msg_tx *txmsg;
 	struct drm_dp_mst_branch *mstb;
-	int len, ret, port_num;
+	int ret, port_num;
 	u8 sinks[DRM_DP_MAX_SDP_STREAMS];
 	int i;
 
@@ -3039,9 +3032,9 @@ static int drm_dp_payload_send_msg(struct drm_dp_mst_topology_mgr *mgr,
 		sinks[i] = i;
 
 	txmsg->dst = mstb;
-	len = build_allocate_payload(txmsg, port_num,
-				     id,
-				     pbn, port->num_sdp_streams, sinks);
+	build_allocate_payload(txmsg, port_num,
+			       id,
+			       pbn, port->num_sdp_streams, sinks);
 
 	drm_dp_queue_down_tx(mgr, txmsg);
 
@@ -3070,7 +3063,7 @@ int drm_dp_send_power_updown_phy(struct drm_dp_mst_topology_mgr *mgr,
 				 struct drm_dp_mst_port *port, bool power_up)
 {
 	struct drm_dp_sideband_msg_tx *txmsg;
-	int len, ret;
+	int ret;
 
 	port = drm_dp_mst_topology_get_port_validated(mgr, port);
 	if (!port)
@@ -3083,7 +3076,7 @@ int drm_dp_send_power_updown_phy(struct drm_dp_mst_topology_mgr *mgr,
 	}
 
 	txmsg->dst = port->parent;
-	len = build_power_updown_phy(txmsg, port->port_num, power_up);
+	build_power_updown_phy(txmsg, port->port_num, power_up);
 	drm_dp_queue_down_tx(mgr, txmsg);
 
 	ret = drm_dp_mst_wait_tx_reply(port->parent, txmsg);
@@ -3305,7 +3298,6 @@ static int drm_dp_send_dpcd_read(struct drm_dp_mst_topology_mgr *mgr,
 				 struct drm_dp_mst_port *port,
 				 int offset, int size, u8 *bytes)
 {
-	int len;
 	int ret = 0;
 	struct drm_dp_sideband_msg_tx *txmsg;
 	struct drm_dp_mst_branch *mstb;
@@ -3320,7 +3312,7 @@ static int drm_dp_send_dpcd_read(struct drm_dp_mst_topology_mgr *mgr,
 		goto fail_put;
 	}
 
-	len = build_dpcd_read(txmsg, port->port_num, offset, size);
+	build_dpcd_read(txmsg, port->port_num, offset, size);
 	txmsg->dst = port->parent;
 
 	drm_dp_queue_down_tx(mgr, txmsg);
@@ -3358,7 +3350,6 @@ static int drm_dp_send_dpcd_write(struct drm_dp_mst_topology_mgr *mgr,
 				  struct drm_dp_mst_port *port,
 				  int offset, int size, u8 *bytes)
 {
-	int len;
 	int ret;
 	struct drm_dp_sideband_msg_tx *txmsg;
 	struct drm_dp_mst_branch *mstb;
@@ -3373,7 +3364,7 @@ static int drm_dp_send_dpcd_write(struct drm_dp_mst_topology_mgr *mgr,
 		goto fail_put;
 	}
 
-	len = build_dpcd_write(txmsg, port->port_num, offset, size, bytes);
+	build_dpcd_write(txmsg, port->port_num, offset, size, bytes);
 	txmsg->dst = mstb;
 
 	drm_dp_queue_down_tx(mgr, txmsg);
@@ -3619,7 +3610,12 @@ int drm_dp_mst_topology_mgr_resume(struct drm_dp_mst_topology_mgr *mgr,
 		DRM_DEBUG_KMS("dpcd read failed - undocked during suspend?\n");
 		goto out_fail;
 	}
-	drm_dp_check_mstb_guid(mgr->mst_primary, guid);
+
+	ret = drm_dp_check_mstb_guid(mgr->mst_primary, guid);
+	if (ret) {
+		DRM_DEBUG_KMS("check mstb failed - undocked during suspend?\n");
+		goto out_fail;
+	}
 
 	/*
 	 * For the final step of resuming the topology, we need to bring the
@@ -4532,15 +4528,34 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
 		int ret;
 
 		ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, buf, DP_RECEIVER_CAP_SIZE);
+		if (ret) {
+			seq_printf(m, "dpcd read failed\n");
+			goto out;
+		}
 		seq_printf(m, "dpcd: %*ph\n", DP_RECEIVER_CAP_SIZE, buf);
+
 		ret = drm_dp_dpcd_read(mgr->aux, DP_FAUX_CAP, buf, 2);
+		if (ret) {
+			seq_printf(m, "faux/mst read failed\n");
+			goto out;
+		}
 		seq_printf(m, "faux/mst: %*ph\n", 2, buf);
+
 		ret = drm_dp_dpcd_read(mgr->aux, DP_MSTM_CTRL, buf, 1);
+		if (ret) {
+			seq_printf(m, "mst ctrl read failed\n");
+			goto out;
+		}
 		seq_printf(m, "mst ctrl: %*ph\n", 1, buf);
 
 		/* dump the standard OUI branch header */
 		ret = drm_dp_dpcd_read(mgr->aux, DP_BRANCH_OUI, buf, DP_BRANCH_OUI_HEADER_SIZE);
+		if (ret) {
+			seq_printf(m, "branch oui read failed\n");
+			goto out;
+		}
 		seq_printf(m, "branch oui: %*phN devid: ", 3, buf);
+
 		for (i = 0x3; i < 0x8 && buf[i]; i++)
 			seq_printf(m, "%c", buf[i]);
 		seq_printf(m, " revision: hw: %x.%x sw: %x.%x\n",
@@ -4549,6 +4564,7 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
 			seq_printf(m, "payload table: %*ph\n", DP_PAYLOAD_TABLE_SIZE, buf);
 	}
 
+out:
 	mutex_unlock(&mgr->lock);
 
 }
-- 
2.15.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
