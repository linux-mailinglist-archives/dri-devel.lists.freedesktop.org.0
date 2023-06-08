Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 113CA727F3C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 13:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3047C10E22E;
	Thu,  8 Jun 2023 11:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45BC10E10C;
 Thu,  8 Jun 2023 11:44:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V0TAii6Id+ctLePOIczldidljz50StRmGGhNs01m7ZNECW6hLNG37LosMtIOuYYivcwc3adUsGr/wVF6AwiTCBUHi3dOFCiKRCy3lX1Sa+Fb3bDSU8yZ7i++PxnuMZQYY/fMP4R2OHnBR7GqQQzVpi96sgzhTD8A5kL9gd8Wh8QILxFeQ0OLEvn7fLuxkM9NKfRvji/Ox+dSvvX7FCRFvX75BsLPQx6aBw99uy6rI7kfiiWk74SgHKEICg9o5qKH+Flh+XBefPzNJxXLMjKR86HOxKDWl6f4P4xRYapPqwObf32IhXO43dg2g9w0HsQmBdmbrByHo5b8PEHqMBztQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRVA9N82YioLFQnI9NNmMbkLtyFqRgc/8V1j0bPjTFE=;
 b=fs2E/uej0K14FoKwGtL/boXEz861oG3rVA8oBrViWcq/aYVlMEIazwLWk1/OLUypL4uoESU790HXdG3CMpPwC7QEitzHXxXDw0PY65YXYRlKpNBCU4Xz+6Ka09tE42rV9uE7ImWwu3RqUUhvPoMZWf/fBIMsiKYPZUX/mpysPGiM+ILyKUBWUBsnixJVOf+U/C/B0/UkUAx6wJ2BCpflxzpTiohKwaKFXP+Xi7/bAOS7/9EVOceWaP24CrJlrJZHQBcRZoNknKIFkMrCYNdb5LZcFkeICScgz9ecntSKPKof6D7/sj2s6h9YAFevZAzmZ7FG7Rwly1Vq39NhmWMVMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRVA9N82YioLFQnI9NNmMbkLtyFqRgc/8V1j0bPjTFE=;
 b=IXt9kFa65pLhq+3DHQ9g/hYKZADIkU3k+VDVFEkODV0M1BE2ul/FBoNUl0w/4l+R5BZ5AvBufcoXGhqceZFyYbiItb9ANDPnCfluzIVHTh+buE480eGp1LvE00mO3GdYIfPn/Wkv9V7yt1kKzVJQxWxnTxeGs+KouCK3wi+z4nU=
Received: from CYZPR10CA0022.namprd10.prod.outlook.com (2603:10b6:930:8a::26)
 by IA0PR12MB8206.namprd12.prod.outlook.com (2603:10b6:208:403::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Thu, 8 Jun
 2023 11:44:28 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:930:8a:cafe::2) by CYZPR10CA0022.outlook.office365.com
 (2603:10b6:930:8a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.25 via Frontend
 Transport; Thu, 8 Jun 2023 11:44:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.13 via Frontend Transport; Thu, 8 Jun 2023 11:44:27 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 8 Jun
 2023 06:43:35 -0500
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 8 Jun 2023 06:43:32 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4] drm/dp_mst: Clear MSG_RDY flag before sending new message
Date: Thu, 8 Jun 2023 19:43:16 +0800
Message-ID: <20230608114316.3078024-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|IA0PR12MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 91f622e1-d512-493b-9a4b-08db6815b705
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JjGtHabB7hERQUCrMckJqeilSMgW6xGJlps7cMj6vobJRY1CkYXevNwY3N0MhT7hVXpfPDygYc4tIO4PbJqDVPgKFv7p1SDUrSNQyD76MTrR9CwixIzPj3g5HQcwPcGvdUFWJOf+SrpHDl4bJBkBPcaUwWsk4wLSo8mWyzBVxXhZ/Vy9teKOxBwi4o3GtkCrIX+8EKW/6ps+hCch0/hwDmmcXyQ27oDXuggE0n/+QpGY30cg2vWwuklFLVk3hZUbRvLM7yQV4LGnsdP2/bXmmNxd5jHqqMEFM//t0jOxM5+7iRhtVfeyCQu3iQ77Eo5veaz1SO/ElFCdWScGFj4pT9XGPIZPvERouViGqzhCGymSpseH9QSMe27FvQusR3l1D4c6S+EnL/dzmOntEjYip+Lkx2J+MYX4vqsZxOAya1q5II7GnHfEq+lW737AgYH2PF3ZeEf/DDrWvLVoKTpkkkaVrHlBlGE8R8YPY7lxKdTDnAU9sTUAC3f72hNMT0/7t8o8Ey0wRaQaQlNMtGbeZLaRjZjJgvyCRCrzkjrcYlKKIc+aMtWYPd5z72/73BK8cQ7rVb8fHvDwL+vROOppu8MmDVMKxAAENhVJJ3OcAp2ptaftRPKPIAeRBEKoQnCHbxStcxZfWn8K8D2Ao4IkP6Dxdnixm7plPfHN030PkeakEg5KwGFw1Ru2vbwkrxcsihtA4TooBZlpzxkOCmfs81DMkceEiCrOmCYo6mnIticZYP7OyRRzr4H+KJhzSJ62RU8+44a7UetZxgnZfvpKXA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(54906003)(110136005)(40460700003)(478600001)(40480700001)(5660300002)(8936002)(8676002)(4326008)(2906002)(36756003)(86362001)(15650500001)(81166007)(70206006)(82740400003)(316002)(82310400005)(70586007)(41300700001)(36860700001)(2616005)(356005)(1076003)(26005)(186003)(47076005)(83380400001)(6666004)(426003)(7696005)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 11:44:27.6319 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f622e1-d512-493b-9a4b-08db6815b705
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8206
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

Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
Cc: stable@vger.kernel.org
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 33 ++++++------
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 54 ++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_dp.c       |  7 +--
 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 12 +++--
 include/drm/display/drm_dp_mst_helper.h       |  7 ++-
 5 files changed, 82 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d5cec03eaa8d..597c3368bcfb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3236,6 +3236,7 @@ static void dm_handle_mst_sideband_msg(struct amdgpu_dm_connector *aconnector)
 {
 	u8 esi[DP_PSR_ERROR_STATUS - DP_SINK_COUNT_ESI] = { 0 };
 	u8 dret;
+	u8 ack;
 	bool new_irq_handled = false;
 	int dpcd_addr;
 	int dpcd_bytes_to_read;
@@ -3265,34 +3266,36 @@ static void dm_handle_mst_sideband_msg(struct amdgpu_dm_connector *aconnector)
 		process_count < max_process_count) {
 		u8 retry;
 		dret = 0;
+		ack = 0;
 
 		process_count++;
 
 		DRM_DEBUG_DRIVER("ESI %02x %02x %02x\n", esi[0], esi[1], esi[2]);
 		/* handle HPD short pulse irq */
 		if (aconnector->mst_mgr.mst_state)
-			drm_dp_mst_hpd_irq(
-				&aconnector->mst_mgr,
-				esi,
-				&new_irq_handled);
+			drm_dp_mst_hpd_irq_handle_event(&aconnector->mst_mgr,
+							esi,
+							&ack,
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
+							  ack);
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
index 38dab76ae69e..3a018f5b604c 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4053,17 +4053,28 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 }
 
 /**
- * drm_dp_mst_hpd_irq() - MST hotplug IRQ notify
+ * drm_dp_mst_hpd_irq_handle_event() - MST hotplug IRQ handle MST event
  * @mgr: manager to notify irq for.
  * @esi: 4 bytes from SINK_COUNT_ESI
+ * @ack: flags of events to ack
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
+		*ack |= DP_DOWN_REP_MSG_RDY;
 	}
 
 	if (esi[1] & DP_UP_REQ_MSG_RDY) {
 		ret |= drm_dp_mst_handle_up_req(mgr);
 		*handled = true;
+		*ack |= DP_UP_REQ_MSG_RDY;
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
index 4bec8cd7979f..f24602887015 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4062,9 +4062,7 @@ intel_dp_mst_hpd_irq(struct intel_dp *intel_dp, u8 *esi, u8 *ack)
 {
 	bool handled = false;
 
-	drm_dp_mst_hpd_irq(&intel_dp->mst_mgr, esi, &handled);
-	if (handled)
-		ack[1] |= esi[1] & (DP_DOWN_REP_MSG_RDY | DP_UP_REQ_MSG_RDY);
+	drm_dp_mst_hpd_irq_handle_event(&intel_dp->mst_mgr, esi, &ack[1], &handled);
 
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
index 9b6824f6b9e4..b2d9978e88a8 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1357,6 +1357,7 @@ nv50_mstm_service(struct nouveau_drm *drm,
 	bool handled = true, ret = true;
 	int rc;
 	u8 esi[8] = {};
+	u8 ack;
 
 	while (handled) {
 		rc = drm_dp_dpcd_read(aux, DP_SINK_COUNT_ESI, esi, 8);
@@ -1365,16 +1366,19 @@ nv50_mstm_service(struct nouveau_drm *drm,
 			break;
 		}
 
-		drm_dp_mst_hpd_irq(&mstm->mgr, esi, &handled);
+		ack = 0;
+		drm_dp_mst_hpd_irq_handle_event(&mstm->mgr, esi, &ack, &handled);
 		if (!handled)
 			break;
 
-		rc = drm_dp_dpcd_write(aux, DP_SINK_COUNT_ESI + 1, &esi[1],
-				       3);
-		if (rc != 3) {
+		rc = drm_dp_dpcd_writeb(aux, DP_SINK_COUNT_ESI + 1, ack);
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

