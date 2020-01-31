Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA296150242
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 09:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297486E22B;
	Mon,  3 Feb 2020 08:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393736E201
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 09:33:01 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00V9Rcql006139; Fri, 31 Jan 2020 10:31:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=OzgrrMO1I6BRP/JXETWqlbak+2ksZ9Y3YSNkEudaJVw=;
 b=PcMvBaz1zNTtlKsb5XdMmGAZKYSqnLpalr0sd+JTKV5iT5arOEYVWv3CmU4C9Uuub1rX
 xAD3VmUFBqRRzkV/yhsMnbJfzHeeghxrustUh4kwyogGo60UpcE7zaUgInEYv4ZMzvDe
 7SOLaCZLVsjN5a/il+/Rs5wXQ3rqBj1xS3CzATIrYCCw/ukgu5JC8sVawIX4kaXzzd5z
 al+jTu2bh7YigxtqfqIN3QfG+VJaFTShDw21iJbXPQAynMNISKL5RJJqUrfz0eX3Dsol
 +4ScN8xTeB6EEhjMPw0iQdzRKZEuWfYYekLpzldCw5E1Acb22/RKBELgBBe3lIK3/ncX Ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrbpbd70b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2020 10:31:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4BDA2100038;
 Fri, 31 Jan 2020 10:31:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3B4F42A4D89;
 Fri, 31 Jan 2020 10:31:47 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 31 Jan 2020 10:31:46
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <jani.nikula@linux.intel.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v4] drm/dp_mst: Fix W=1 warnings
Date: Fri, 31 Jan 2020 10:31:42 +0100
Message-ID: <20200131093142.2074-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-31_02:2020-01-30,
 2020-01-31 signatures=0
X-Mailman-Approved-At: Mon, 03 Feb 2020 08:10:41 +0000
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
---
version 4:
- do not touch crc4 unused variable in this patch
CC: lyude@redhat.com
CC: airlied@linux.ie
 drivers/gpu/drm/drm_dp_mst_topology.c | 78 ++++++++++++++---------------------
 1 file changed, 31 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 4104f15f4594..44a8731665e4 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -1034,7 +1034,7 @@ static bool drm_dp_sideband_parse_req(struct drm_dp_sideband_msg_rx *raw,
 	}
 }
 
-static int build_dpcd_write(struct drm_dp_sideband_msg_tx *msg, u8 port_num, u32 offset, u8 num_bytes, u8 *bytes)
+static void build_dpcd_write(struct drm_dp_sideband_msg_tx *msg, u8 port_num, u32 offset, u8 num_bytes, u8 *bytes)
 {
 	struct drm_dp_sideband_msg_req_body req;
 
@@ -1044,17 +1044,14 @@ static int build_dpcd_write(struct drm_dp_sideband_msg_tx *msg, u8 port_num, u32
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
@@ -1077,7 +1074,7 @@ static int build_enum_path_resources(struct drm_dp_sideband_msg_tx *msg, int por
 	return 0;
 }
 
-static int build_allocate_payload(struct drm_dp_sideband_msg_tx *msg, int port_num,
+static void build_allocate_payload(struct drm_dp_sideband_msg_tx *msg, int port_num,
 				  u8 vcpi, uint16_t pbn,
 				  u8 number_sdp_streams,
 				  u8 *sdp_stream_sink)
@@ -1093,10 +1090,9 @@ static int build_allocate_payload(struct drm_dp_sideband_msg_tx *msg, int port_n
 		   number_sdp_streams);
 	drm_dp_encode_sideband_req(&req, msg);
 	msg->path_msg = true;
-	return 0;
 }
 
-static int build_power_updown_phy(struct drm_dp_sideband_msg_tx *msg,
+static void build_power_updown_phy(struct drm_dp_sideband_msg_tx *msg,
 				  int port_num, bool power_up)
 {
 	struct drm_dp_sideband_msg_req_body req;
@@ -1109,7 +1105,6 @@ static int build_power_updown_phy(struct drm_dp_sideband_msg_tx *msg,
 	req.u.port_num.port_number = port_num;
 	drm_dp_encode_sideband_req(&req, msg);
 	msg->path_msg = true;
-	return 0;
 }
 
 static int drm_dp_mst_assign_payload_id(struct drm_dp_mst_topology_mgr *mgr,
@@ -2054,25 +2049,20 @@ ssize_t drm_dp_mst_dpcd_write(struct drm_dp_aux *aux,
 
 static void drm_dp_check_mstb_guid(struct drm_dp_mst_branch *mstb, u8 *guid)
 {
-	int ret;
-
 	memcpy(mstb->guid, guid, 16);
 
 	if (!drm_dp_validate_guid(mstb->mgr, mstb->guid)) {
 		if (mstb->port_parent) {
-			ret = drm_dp_send_dpcd_write(
-					mstb->mgr,
-					mstb->port_parent,
-					DP_GUID,
-					16,
-					mstb->guid);
+			drm_dp_send_dpcd_write(mstb->mgr,
+					       mstb->port_parent,
+					       DP_GUID,
+					       16,
+					       mstb->guid);
 		} else {
-
-			ret = drm_dp_dpcd_write(
-					mstb->mgr->aux,
-					DP_GUID,
-					mstb->guid,
-					16);
+			drm_dp_dpcd_write(mstb->mgr->aux,
+					  DP_GUID,
+					  mstb->guid,
+					  16);
 		}
 	}
 }
@@ -2595,7 +2585,7 @@ static bool drm_dp_validate_guid(struct drm_dp_mst_topology_mgr *mgr,
 	return false;
 }
 
-static int build_dpcd_read(struct drm_dp_sideband_msg_tx *msg, u8 port_num, u32 offset, u8 num_bytes)
+static void build_dpcd_read(struct drm_dp_sideband_msg_tx *msg, u8 port_num, u32 offset, u8 num_bytes)
 {
 	struct drm_dp_sideband_msg_req_body req;
 
@@ -2604,8 +2594,6 @@ static int build_dpcd_read(struct drm_dp_sideband_msg_tx *msg, u8 port_num, u32
 	req.u.dpcd_read.dpcd_address = offset;
 	req.u.dpcd_read.num_bytes = num_bytes;
 	drm_dp_encode_sideband_req(&req, msg);
-
-	return 0;
 }
 
 static int drm_dp_send_sideband_msg(struct drm_dp_mst_topology_mgr *mgr,
@@ -2828,7 +2816,7 @@ static int drm_dp_send_link_address(struct drm_dp_mst_topology_mgr *mgr,
 	struct drm_dp_sideband_msg_tx *txmsg;
 	struct drm_dp_link_address_ack_reply *reply;
 	struct drm_dp_mst_port *port, *tmp;
-	int i, len, ret, port_mask = 0;
+	int i, ret, port_mask = 0;
 	bool changed = false;
 
 	txmsg = kzalloc(sizeof(*txmsg), GFP_KERNEL);
@@ -2836,7 +2824,7 @@ static int drm_dp_send_link_address(struct drm_dp_mst_topology_mgr *mgr,
 		return -ENOMEM;
 
 	txmsg->dst = mstb;
-	len = build_link_address(txmsg);
+	build_link_address(txmsg);
 
 	mstb->link_address_sent = true;
 	drm_dp_queue_down_tx(mgr, txmsg);
@@ -2898,14 +2886,14 @@ void drm_dp_send_clear_payload_id_table(struct drm_dp_mst_topology_mgr *mgr,
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
 
@@ -2923,7 +2911,6 @@ drm_dp_send_enum_path_resources(struct drm_dp_mst_topology_mgr *mgr,
 {
 	struct drm_dp_enum_path_resources_ack_reply *path_res;
 	struct drm_dp_sideband_msg_tx *txmsg;
-	int len;
 	int ret;
 
 	txmsg = kzalloc(sizeof(*txmsg), GFP_KERNEL);
@@ -2931,7 +2918,7 @@ drm_dp_send_enum_path_resources(struct drm_dp_mst_topology_mgr *mgr,
 		return -ENOMEM;
 
 	txmsg->dst = mstb;
-	len = build_enum_path_resources(txmsg, port->port_num);
+	build_enum_path_resources(txmsg, port->port_num);
 
 	drm_dp_queue_down_tx(mgr, txmsg);
 
@@ -3014,7 +3001,7 @@ static int drm_dp_payload_send_msg(struct drm_dp_mst_topology_mgr *mgr,
 {
 	struct drm_dp_sideband_msg_tx *txmsg;
 	struct drm_dp_mst_branch *mstb;
-	int len, ret, port_num;
+	int ret, port_num;
 	u8 sinks[DRM_DP_MAX_SDP_STREAMS];
 	int i;
 
@@ -3039,9 +3026,9 @@ static int drm_dp_payload_send_msg(struct drm_dp_mst_topology_mgr *mgr,
 		sinks[i] = i;
 
 	txmsg->dst = mstb;
-	len = build_allocate_payload(txmsg, port_num,
-				     id,
-				     pbn, port->num_sdp_streams, sinks);
+	build_allocate_payload(txmsg, port_num,
+			       id,
+			       pbn, port->num_sdp_streams, sinks);
 
 	drm_dp_queue_down_tx(mgr, txmsg);
 
@@ -3070,7 +3057,7 @@ int drm_dp_send_power_updown_phy(struct drm_dp_mst_topology_mgr *mgr,
 				 struct drm_dp_mst_port *port, bool power_up)
 {
 	struct drm_dp_sideband_msg_tx *txmsg;
-	int len, ret;
+	int ret;
 
 	port = drm_dp_mst_topology_get_port_validated(mgr, port);
 	if (!port)
@@ -3083,7 +3070,7 @@ int drm_dp_send_power_updown_phy(struct drm_dp_mst_topology_mgr *mgr,
 	}
 
 	txmsg->dst = port->parent;
-	len = build_power_updown_phy(txmsg, port->port_num, power_up);
+	build_power_updown_phy(txmsg, port->port_num, power_up);
 	drm_dp_queue_down_tx(mgr, txmsg);
 
 	ret = drm_dp_mst_wait_tx_reply(port->parent, txmsg);
@@ -3305,7 +3292,6 @@ static int drm_dp_send_dpcd_read(struct drm_dp_mst_topology_mgr *mgr,
 				 struct drm_dp_mst_port *port,
 				 int offset, int size, u8 *bytes)
 {
-	int len;
 	int ret = 0;
 	struct drm_dp_sideband_msg_tx *txmsg;
 	struct drm_dp_mst_branch *mstb;
@@ -3320,7 +3306,7 @@ static int drm_dp_send_dpcd_read(struct drm_dp_mst_topology_mgr *mgr,
 		goto fail_put;
 	}
 
-	len = build_dpcd_read(txmsg, port->port_num, offset, size);
+	build_dpcd_read(txmsg, port->port_num, offset, size);
 	txmsg->dst = port->parent;
 
 	drm_dp_queue_down_tx(mgr, txmsg);
@@ -3358,7 +3344,6 @@ static int drm_dp_send_dpcd_write(struct drm_dp_mst_topology_mgr *mgr,
 				  struct drm_dp_mst_port *port,
 				  int offset, int size, u8 *bytes)
 {
-	int len;
 	int ret;
 	struct drm_dp_sideband_msg_tx *txmsg;
 	struct drm_dp_mst_branch *mstb;
@@ -3373,7 +3358,7 @@ static int drm_dp_send_dpcd_write(struct drm_dp_mst_topology_mgr *mgr,
 		goto fail_put;
 	}
 
-	len = build_dpcd_write(txmsg, port->port_num, offset, size, bytes);
+	build_dpcd_write(txmsg, port->port_num, offset, size, bytes);
 	txmsg->dst = mstb;
 
 	drm_dp_queue_down_tx(mgr, txmsg);
@@ -4529,17 +4514,16 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
 	mutex_lock(&mgr->lock);
 	if (mgr->mst_primary) {
 		u8 buf[DP_PAYLOAD_TABLE_SIZE];
-		int ret;
 
-		ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, buf, DP_RECEIVER_CAP_SIZE);
+		drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, buf, DP_RECEIVER_CAP_SIZE);
 		seq_printf(m, "dpcd: %*ph\n", DP_RECEIVER_CAP_SIZE, buf);
-		ret = drm_dp_dpcd_read(mgr->aux, DP_FAUX_CAP, buf, 2);
+		drm_dp_dpcd_read(mgr->aux, DP_FAUX_CAP, buf, 2);
 		seq_printf(m, "faux/mst: %*ph\n", 2, buf);
-		ret = drm_dp_dpcd_read(mgr->aux, DP_MSTM_CTRL, buf, 1);
+		drm_dp_dpcd_read(mgr->aux, DP_MSTM_CTRL, buf, 1);
 		seq_printf(m, "mst ctrl: %*ph\n", 1, buf);
 
 		/* dump the standard OUI branch header */
-		ret = drm_dp_dpcd_read(mgr->aux, DP_BRANCH_OUI, buf, DP_BRANCH_OUI_HEADER_SIZE);
+		drm_dp_dpcd_read(mgr->aux, DP_BRANCH_OUI, buf, DP_BRANCH_OUI_HEADER_SIZE);
 		seq_printf(m, "branch oui: %*phN devid: ", 3, buf);
 		for (i = 0x3; i < 0x8 && buf[i]; i++)
 			seq_printf(m, "%c", buf[i]);
-- 
2.15.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
