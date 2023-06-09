Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F4572976A
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 12:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C17710E07A;
	Fri,  9 Jun 2023 10:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::622])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE3310E07A;
 Fri,  9 Jun 2023 10:49:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7p5To6ur2M5KPZkHNzjHBCRKvTizba8LXAXlyWpq3UnO+KfeGLBDnSxB3Iy4WgHoX66uV/nMQTmHFopy+8oNf8FsmcDlNvsReyLc292WflvaZIVax/lsTofPq/gy8x+ADSgvDMOdwo0YXDkOA6awlTOx+dK2CZGN4xFZ1SEbubGseaXEj1NZDlkO1oMBaUxjMwuj9SziDVx+dwlZAmNwN+vDD12QHvk7RvqweAmBnr8FRK8CkuIh306igslymTcel73g5hTcTAn8vDUhiTWX3PYaDQeKAunlJ5IvqrPenOfwF+mV0bR2s9hDuxDcGxche/CJL7L2rmWxxiJ0eoaHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPAVxdFuyYmLDYvAPAWPR6eXt7egIPEovMxeS4xyoyo=;
 b=cyz1/dkgP+4sGUIWVP0HOTgCyR/MXrjfo8Z4g6/yvvqPqIEyZEEj90v2Xfnrf0oYFcXKBllWDMl6NjDi4ihCSE5T7YI73too+Rzea3jsvZS3aCDDLaifWIP0gcUMy00nbSvXh2RROr4wyOGjcCA0b6yixBvNh/rPjwBTf+JjaEg6FaDWxLMfz/6xoOtd2P7buaoyxizh1q9y70lErRUaC82rShHb+oKlc+8QwzVDQgdemQaKpOKso4SmpnUo5f6eKEKi7IW5WrnwW6E7Y66gJhPw9+hNNRm5MWvQEETKZl7zDugfP0LKfsmv+74G1C7qMDHlOHZidiSl2d7xn6g2tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPAVxdFuyYmLDYvAPAWPR6eXt7egIPEovMxeS4xyoyo=;
 b=UEawdc+p8IGXyLmvzDAiwphVRRRy9udVqwZguxTRzQSwOurir4aUklhAoZLkzXYTShogZkCCIkFNSO1ltSLE3FHZo7gk+OT3LcR9ZARC5y9O0j4yddZrq98FC3L+/PF+pT4+qZMVxMeKWw1E6v8aogmvKVPtgvpsQa87mwmGMCY=
Received: from BYAPR02CA0046.namprd02.prod.outlook.com (2603:10b6:a03:54::23)
 by CY5PR12MB6621.namprd12.prod.outlook.com (2603:10b6:930:43::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 10:49:34 +0000
Received: from CO1NAM11FT106.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:54:cafe::88) by BYAPR02CA0046.outlook.office365.com
 (2603:10b6:a03:54::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29 via Frontend
 Transport; Fri, 9 Jun 2023 10:49:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT106.mail.protection.outlook.com (10.13.175.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.27 via Frontend Transport; Fri, 9 Jun 2023 10:49:33 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 9 Jun
 2023 05:49:31 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 9 Jun
 2023 03:49:31 -0700
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 9 Jun 2023 05:49:27 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5] drm/dp_mst: Clear MSG_RDY flag before sending new message
Date: Fri, 9 Jun 2023 18:49:25 +0800
Message-ID: <20230609104925.3736756-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT106:EE_|CY5PR12MB6621:EE_
X-MS-Office365-Filtering-Correlation-Id: 258cd5a7-3494-4206-911c-08db68d735d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6507Be6Ft3ddTReCB+luKpga3nAbGCTRKsaL21PnT+yPwhZOl543qXWVUErlipI5EvQXgwALhNIKwsdfwEcFg5d2QLgalrvePAu5kzb1XOnmyrOQrIRHP+sHfw37ld2mQJPCb0XytqoLQNqkAv+XbLvAyvefPDUAv71qv9WmNcKKaJzMUwnfNuq+B7xVkEYUIDew5JgyoY8FSAoAK2Dr7SWbx0F8MrexI3XN/LQ5xaVlOcn/u2Tcz8ZtcdO6Vaf6/1nLV922cgISHKyG6/heLdLFRJ79nY7B8H7nyWA3fAqBjjsByud2JndNRkdgH2vrw7Z4pq9ljMGC/VfbzFIGu7zJADxeGh8XSMfO68bdjO0CB6Vp4ki7aApyqu4iIcnfqgyN4zmkRwf7yzJ28uPi0wYRzFfPofWQgee7qLVyC9m/P8SpMtwfUZSBxUTXUvCkKH67U6YaOInmmGtOOESnErS+P2KkQ3MXxmtc5oEG7CMddVud556XNarpoW0erjyMnW+Nbe9Zogh5WKW4Yo3M5OuraL4eMdzh/FZK9Q5R3lcR93h/pWO298wPqksL8H5vUVNh4GvoNo5zoq+A1/+CqSDrMpPTVFTDazMQd3SwnxvTGMH+aSrxxE/eC+UxIYsF3Ld+PRwwvzaho+h6pCJrwdeZKOj/phQI39rIonQH8ZswRtNZxiBHRdR8BdZxn6eDkWhqxBWDBCyfAGRVIsMGOp5WLMBTQulkmT9mUyue+RhAwAdulIZYUJ/96C/CEyFSF8F8DpkDhRan6NW7BT92Kg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199021)(46966006)(36840700001)(40470700004)(47076005)(40460700003)(7696005)(36860700001)(83380400001)(186003)(336012)(36756003)(426003)(82310400005)(86362001)(81166007)(356005)(2616005)(82740400003)(1076003)(26005)(40480700001)(316002)(54906003)(110136005)(70586007)(70206006)(8676002)(8936002)(4326008)(5660300002)(41300700001)(2906002)(15650500001)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 10:49:33.2088 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 258cd5a7-3494-4206-911c-08db68d735d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT106.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6621
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
Cc: jani.nikula@intel.com, stable@vger.kernel.org, jerry.zuo@amd.com,
 Wayne Lin <Wayne.Lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
The sequence for collecting down_reply from source perspective should
be:

Request_n->repeat (get partial reply of Request_n->clear message ready
flag to ack DPRX that the message is received) till all partial
replies for Request_n are received->new Request_n+1.

Now there is chance that drm_dp_mst_hpd_irq() will fire new down
request in the tx queue when the down reply is incomplete. Source is
restricted to generate interveleaved message transactions so we should
avoid it.

Also, while assembling partial reply packets, reading out DPCD DOWN_REP
Sideband MSG buffer + clearing DOWN_REP_MSG_RDY flag should be
wrapped up as a complete operation for reading out a reply packet.
Kicking off a new request before clearing DOWN_REP_MSG_RDY flag might
be risky. e.g. If the reply of the new request has overwritten the
DPRX DOWN_REP Sideband MSG buffer before source writing one to clear
DOWN_REP_MSG_RDY flag, source then unintentionally flushes the reply
for the new request. Should handle the up request in the same way.

[How]
Separete drm_dp_mst_hpd_irq() into 2 steps. After acking the MST IRQ
event, driver calls drm_dp_mst_hpd_irq_send_new_request() and might
trigger drm_dp_mst_kick_tx() only when there is no on going message
transaction.

Changes since v1:
* Reworked on review comments received
-> Adjust the fix to let driver explicitly kick off new down request
when mst irq event is handled and acked
-> Adjust the commit message

Changes since v2:
* Adjust the commit message
* Adjust the naming of the divided 2 functions and add a new input
  parameter "ack".
* Adjust code flow as per review comments.

Changes since v3:
* Update the function description of drm_dp_mst_hpd_irq_handle_event

Changes since v4:
* Change ack of drm_dp_mst_hpd_irq_handle_event() to be an array align
  the size of esi[]

Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
Cc: stable@vger.kernel.org
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 32 +++++------
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 54 ++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_dp.c       |  7 +--
 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 12 +++--
 include/drm/display/drm_dp_mst_helper.h       |  7 ++-
 5 files changed, 81 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d5cec03eaa8d..ec629b4037e4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3263,6 +3263,7 @@ static void dm_handle_mst_sideband_msg(struct amdgpu_dm_connector *aconnector)
 
 	while (dret == dpcd_bytes_to_read &&
 		process_count < max_process_count) {
+		u8 ack[DP_PSR_ERROR_STATUS - DP_SINK_COUNT_ESI] = {};
 		u8 retry;
 		dret = 0;
 
@@ -3271,28 +3272,29 @@ static void dm_handle_mst_sideband_msg(struct amdgpu_dm_connector *aconnector)
 		DRM_DEBUG_DRIVER("ESI %02x %02x %02x\n", esi[0], esi[1], esi[2]);
 		/* handle HPD short pulse irq */
 		if (aconnector->mst_mgr.mst_state)
-			drm_dp_mst_hpd_irq(
-				&aconnector->mst_mgr,
-				esi,
-				&new_irq_handled);
+			drm_dp_mst_hpd_irq_handle_event(&aconnector->mst_mgr,
+							esi,
+							ack,
+							&new_irq_handled);
 
 		if (new_irq_handled) {
 			/* ACK at DPCD to notify down stream */
-			const int ack_dpcd_bytes_to_write =
-				dpcd_bytes_to_read - 1;
-
 			for (retry = 0; retry < 3; retry++) {
-				u8 wret;
-
-				wret = drm_dp_dpcd_write(
-					&aconnector->dm_dp_aux.aux,
-					dpcd_addr + 1,
-					&esi[1],
-					ack_dpcd_bytes_to_write);
-				if (wret == ack_dpcd_bytes_to_write)
+				ssize_t wret;
+
+				wret = drm_dp_dpcd_writeb(&aconnector->dm_dp_aux.aux,
+							  dpcd_addr + 1,
+							  ack[1]);
+				if (wret == 1)
 					break;
 			}
 
+			if (retry == 3) {
+				DRM_ERROR("Failed to ack MST event.\n");
+				return;
+			}
+
+			drm_dp_mst_hpd_irq_send_new_request(&aconnector->mst_mgr);
 			/* check if there is new irq to be handled */
 			dret = drm_dp_dpcd_read(
 				&aconnector->dm_dp_aux.aux,
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 38dab76ae69e..487d057a9582 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4053,17 +4053,28 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 }
 
 /**
- * drm_dp_mst_hpd_irq() - MST hotplug IRQ notify
+ * drm_dp_mst_hpd_irq_handle_event() - MST hotplug IRQ handle MST event
  * @mgr: manager to notify irq for.
  * @esi: 4 bytes from SINK_COUNT_ESI
+ * @ack: 4 bytes used to ack events starting from SINK_COUNT_ESI
  * @handled: whether the hpd interrupt was consumed or not
  *
- * This should be called from the driver when it detects a short IRQ,
+ * This should be called from the driver when it detects a HPD IRQ,
  * along with the value of the DEVICE_SERVICE_IRQ_VECTOR_ESI0. The
- * topology manager will process the sideband messages received as a result
- * of this.
+ * topology manager will process the sideband messages received
+ * as indicated in the DEVICE_SERVICE_IRQ_VECTOR_ESI0 and set the
+ * corresponding flags that Driver has to ack the DP receiver later.
+ *
+ * Note that driver shall also call
+ * drm_dp_mst_hpd_irq_send_new_request() if the 'handled' is set
+ * after calling this function, to try to kick off a new request in
+ * the queue if the previous message transaction is completed.
+ *
+ * See also:
+ * drm_dp_mst_hpd_irq_send_new_request()
  */
-int drm_dp_mst_hpd_irq(struct drm_dp_mst_topology_mgr *mgr, u8 *esi, bool *handled)
+int drm_dp_mst_hpd_irq_handle_event(struct drm_dp_mst_topology_mgr *mgr, const u8 *esi,
+				    u8 *ack, bool *handled)
 {
 	int ret = 0;
 	int sc;
@@ -4078,18 +4089,47 @@ int drm_dp_mst_hpd_irq(struct drm_dp_mst_topology_mgr *mgr, u8 *esi, bool *handl
 	if (esi[1] & DP_DOWN_REP_MSG_RDY) {
 		ret = drm_dp_mst_handle_down_rep(mgr);
 		*handled = true;
+		ack[1] |= DP_DOWN_REP_MSG_RDY;
 	}
 
 	if (esi[1] & DP_UP_REQ_MSG_RDY) {
 		ret |= drm_dp_mst_handle_up_req(mgr);
 		*handled = true;
+		ack[1] |= DP_UP_REQ_MSG_RDY;
 	}
 
-	drm_dp_mst_kick_tx(mgr);
 	return ret;
 }
-EXPORT_SYMBOL(drm_dp_mst_hpd_irq);
+EXPORT_SYMBOL(drm_dp_mst_hpd_irq_handle_event);
 
+/**
+ * drm_dp_mst_hpd_irq_send_new_request() - MST hotplug IRQ kick off new request
+ * @mgr: manager to notify irq for.
+ *
+ * This should be called from the driver when mst irq event is handled
+ * and acked. Note that new down request should only be sent when
+ * previous message transaction is completed. Source is not supposed to generate
+ * interleaved message transactions.
+ */
+void drm_dp_mst_hpd_irq_send_new_request(struct drm_dp_mst_topology_mgr *mgr)
+{
+	struct drm_dp_sideband_msg_tx *txmsg;
+	bool kick = true;
+
+	mutex_lock(&mgr->qlock);
+	txmsg = list_first_entry_or_null(&mgr->tx_msg_downq,
+					 struct drm_dp_sideband_msg_tx, next);
+	/* If last transaction is not completed yet*/
+	if (!txmsg ||
+	    txmsg->state == DRM_DP_SIDEBAND_TX_START_SEND ||
+	    txmsg->state == DRM_DP_SIDEBAND_TX_SENT)
+		kick = false;
+	mutex_unlock(&mgr->qlock);
+
+	if (kick)
+		drm_dp_mst_kick_tx(mgr);
+}
+EXPORT_SYMBOL(drm_dp_mst_hpd_irq_send_new_request);
 /**
  * drm_dp_mst_detect_port() - get connection status for an MST port
  * @connector: DRM connector for this port
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 4bec8cd7979f..f4a2e72a5c20 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4062,9 +4062,7 @@ intel_dp_mst_hpd_irq(struct intel_dp *intel_dp, u8 *esi, u8 *ack)
 {
 	bool handled = false;
 
-	drm_dp_mst_hpd_irq(&intel_dp->mst_mgr, esi, &handled);
-	if (handled)
-		ack[1] |= esi[1] & (DP_DOWN_REP_MSG_RDY | DP_UP_REQ_MSG_RDY);
+	drm_dp_mst_hpd_irq_handle_event(&intel_dp->mst_mgr, esi, ack, &handled);
 
 	if (esi[1] & DP_CP_IRQ) {
 		intel_hdcp_handle_cp_irq(intel_dp->attached_connector);
@@ -4139,6 +4137,9 @@ intel_dp_check_mst_status(struct intel_dp *intel_dp)
 
 		if (!intel_dp_ack_sink_irq_esi(intel_dp, ack))
 			drm_dbg_kms(&i915->drm, "Failed to ack ESI\n");
+
+		if (ack[1] & (DP_DOWN_REP_MSG_RDY | DP_UP_REQ_MSG_RDY))
+			drm_dp_mst_hpd_irq_send_new_request(&intel_dp->mst_mgr);
 	}
 
 	return link_ok;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 9b6824f6b9e4..42e1665ba11a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1359,22 +1359,26 @@ nv50_mstm_service(struct nouveau_drm *drm,
 	u8 esi[8] = {};
 
 	while (handled) {
+		u8 ack[8] = {};
+
 		rc = drm_dp_dpcd_read(aux, DP_SINK_COUNT_ESI, esi, 8);
 		if (rc != 8) {
 			ret = false;
 			break;
 		}
 
-		drm_dp_mst_hpd_irq(&mstm->mgr, esi, &handled);
+		drm_dp_mst_hpd_irq_handle_event(&mstm->mgr, esi, ack, &handled);
 		if (!handled)
 			break;
 
-		rc = drm_dp_dpcd_write(aux, DP_SINK_COUNT_ESI + 1, &esi[1],
-				       3);
-		if (rc != 3) {
+		rc = drm_dp_dpcd_writeb(aux, DP_SINK_COUNT_ESI + 1, ack[1]);
+
+		if (rc != 1) {
 			ret = false;
 			break;
 		}
+
+		drm_dp_mst_hpd_irq_send_new_request(&mstm->mgr);
 	}
 
 	if (!ret)
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index 32c764fb9cb5..40e855c8407c 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -815,8 +815,11 @@ void drm_dp_mst_topology_mgr_destroy(struct drm_dp_mst_topology_mgr *mgr);
 bool drm_dp_read_mst_cap(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
 int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool mst_state);
 
-int drm_dp_mst_hpd_irq(struct drm_dp_mst_topology_mgr *mgr, u8 *esi, bool *handled);
-
+int drm_dp_mst_hpd_irq_handle_event(struct drm_dp_mst_topology_mgr *mgr,
+				    const u8 *esi,
+				    u8 *ack,
+				    bool *handled);
+void drm_dp_mst_hpd_irq_send_new_request(struct drm_dp_mst_topology_mgr *mgr);
 
 int
 drm_dp_mst_detect_port(struct drm_connector *connector,
-- 
2.37.3

