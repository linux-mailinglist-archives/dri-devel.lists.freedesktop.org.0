Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3146F01C1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 09:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FEA10E158;
	Thu, 27 Apr 2023 07:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0705310E158;
 Thu, 27 Apr 2023 07:29:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYvogOM3F/nPX1brYQKL0kInLUJY+ark40jSrQLI7hT9YHeZ3z2dl9mPodG8wOZGlK5Nys+7uMBIfhBDONAp9/tx1WyQWKVQyUF2AoKTHcHL98NBwIs86ThS4kyDNNyrca+6cDTosHjD2qyNYYdPvW9Dq7s5/noFkSDH0UyNbGtMc0O3k7pZiKPZPI4IQDxFW9aTdD/S/5m1Vs6ZFoRwWZmomEqKSXIk+GaBq4n3zmoCW/FBqKDWGloe8HON0zBlEnkb3VQZ6JtHDGSa2a1hB9EWPgQczEbJ3Uj4mJnqMKt6HUEBVIa19ejiilpYe4mRRn47dtYJmTFdkeCGlzW3/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5V/olgv/hmxMfuWrQT3iG/l3AEpYx+fYvEjIrr6s0VI=;
 b=aukUdzXf7TyC+WQl84MqBpeYDpNcR17GAEZQyL4KQwphZa7QXWAcXyvH4iCOqVzr1Ss6VsFC4VyOq9iS7VpvHxA3IAsBpxw2EyG6p1ilJfOnmcYBauu7b8DYiHS8WilC61parMrg684/0aTY9znpXvnO8kBxL9Ib3cKZ9kV9PbE9fb9vo809o51MJy954YWAdLWmVUiLrcW8ElsEeEknQ6sBgba2CPlPS6eonXojg/n3XTUPsusJwRmIh/EqHLiuxPU2uKFO/zPWBtpUVHQRGZi9ohfZ3i95b2piK5KWnFAei/f799c3evFdSHfNUncYq84t/jvPro9z/wQrkiMCTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5V/olgv/hmxMfuWrQT3iG/l3AEpYx+fYvEjIrr6s0VI=;
 b=uERQTdnnUMct47L4WDth2ZkT3kdyV5Xr9+/hugs0I+QOxyL4slR9ko8NzJz+63AulupeyKWhJclmUZcsm9sSfwX2lb0OJ6DH98c1XxQ/N2MxEmqbB4Z12hLwvD/Uektf7r+raFYhmtuI8r6BACqSiwHv8CWO8mf4yj5gUFATgtw=
Received: from MW2PR16CA0034.namprd16.prod.outlook.com (2603:10b6:907::47) by
 PH8PR12MB7207.namprd12.prod.outlook.com (2603:10b6:510:225::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Thu, 27 Apr
 2023 07:29:21 +0000
Received: from CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::23) by MW2PR16CA0034.outlook.office365.com
 (2603:10b6:907::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22 via Frontend
 Transport; Thu, 27 Apr 2023 07:29:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT039.mail.protection.outlook.com (10.13.174.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.22 via Frontend Transport; Thu, 27 Apr 2023 07:29:20 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 27 Apr
 2023 02:29:17 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 27 Apr
 2023 02:28:56 -0500
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 27 Apr 2023 02:28:52 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/dp_mst: Clear MSG_RDY flag before sending new message
Date: Thu, 27 Apr 2023 15:28:49 +0800
Message-ID: <20230427072850.100887-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT039:EE_|PH8PR12MB7207:EE_
X-MS-Office365-Filtering-Correlation-Id: 31b6d338-d75e-477f-c743-08db46f11e27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: arQoq996i7IXiujqgD3T3duUmsPdGlNyfW8vevAxUoYjyPP0RqoUEuFcRNBjjMaPNrwpCQedhcvWVsojFOcpC9OKXBrSASBQeZJCcGcOrcOGgKMTKQ45fXaMaBSkPFozCa5yPb3QZaCb4EK6UJdhp9x6zxb3jd5cTBHnoMK7WzZdYcFSBpVISCAHs5Ov4eTYnTSXNwlshRT6OYLAHZVLDF+SqT1P9zu05AcjD6VHrMtpaklv3pmRxLeKuo5JOl4UvmGkK2dbkbcwotGFZZyI20jw+u2mHMt3pq8QNTxN3CMHlpMxOe7jFP41xnjeLRV2oXirjfFyZ82oorgt3xwYLiyiiaD0FAobSpsiYxyjRsF4LEEne3BDHzkdANDNdNFqEIzR7ZFwIR4X4NhQ3xUZPfgUKVWPD+rMn1tbu3LUzTex5U5TGz02esQMW0huI43/eOWSEwbKGU4c9y4uPK50ShJf2zzInOJyV95p3ejdKrfxsvYERm+sAoZftOfSTQfBz1YQh1qX6iI3pjPV5vdjkeIIVCVfq7O1HAdYjKjtxzbwI8qFKs+5lDBFmjvztHAV+MYWJ771TjEZihJmh3ytPLNzTz5m4XDtrqIgyPxWpEUiUN7kTZEfh9kLCc6FsjcbGm6WdHzQhwSexlFmsJheon4PMBvwN9UAub+RrtbmyMeminExIJtsq1CqGaQgQyeYQgP4KaT7aqxg/qozpu9KW3SPmcYr1K+b1rVDT7PEH5o=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199021)(40470700004)(46966006)(36840700001)(83380400001)(70586007)(82740400003)(4326008)(70206006)(2906002)(36860700001)(40480700001)(26005)(1076003)(82310400005)(316002)(6666004)(47076005)(2616005)(8936002)(426003)(356005)(336012)(81166007)(8676002)(41300700001)(15650500001)(5660300002)(7696005)(110136005)(54906003)(86362001)(478600001)(40460700003)(36756003)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 07:29:20.8167 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b6d338-d75e-477f-c743-08db46f11e27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7207
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
event, driver calls drm_dp_mst_hpd_irq_step2() and might trigger
drm_dp_mst_kick_tx() only when there is no on going message transaction.

Changes since v1:
* Reworked on review comments received
-> Adjust the fix to let driver explicitly kick off new down request
when mst irq event is handled and acked
-> Adjust the commit message

Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
Cc: stable@vger.kernel.org
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  8 ++---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 35 ++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_dp.c       |  5 ++-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  5 ++-
 include/drm/display/drm_dp_mst_helper.h       |  4 +--
 5 files changed, 45 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 1ad67c2a697e..48bdcb2ee9b1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3259,10 +3259,9 @@ static void dm_handle_mst_sideband_msg(struct amdgpu_dm_connector *aconnector)
 		DRM_DEBUG_DRIVER("ESI %02x %02x %02x\n", esi[0], esi[1], esi[2]);
 		/* handle HPD short pulse irq */
 		if (aconnector->mst_mgr.mst_state)
-			drm_dp_mst_hpd_irq(
-				&aconnector->mst_mgr,
-				esi,
-				&new_irq_handled);
+			drm_dp_mst_hpd_irq_step1(&aconnector->mst_mgr,
+						 esi,
+						 &new_irq_handled);
 
 		if (new_irq_handled) {
 			/* ACK at DPCD to notify down stream */
@@ -3281,6 +3280,7 @@ static void dm_handle_mst_sideband_msg(struct amdgpu_dm_connector *aconnector)
 					break;
 			}
 
+			drm_dp_mst_hpd_irq_step2(&aconnector->mst_mgr);
 			/* check if there is new irq to be handled */
 			dret = drm_dp_dpcd_read(
 				&aconnector->dm_dp_aux.aux,
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 70df29fe92db..2e0a38a6509c 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4045,7 +4045,7 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 }
 
 /**
- * drm_dp_mst_hpd_irq() - MST hotplug IRQ notify
+ * drm_dp_mst_hpd_irq_step1() - MST hotplug IRQ notify
  * @mgr: manager to notify irq for.
  * @esi: 4 bytes from SINK_COUNT_ESI
  * @handled: whether the hpd interrupt was consumed or not
@@ -4055,7 +4055,7 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
  * topology manager will process the sideband messages received as a result
  * of this.
  */
-int drm_dp_mst_hpd_irq(struct drm_dp_mst_topology_mgr *mgr, u8 *esi, bool *handled)
+int drm_dp_mst_hpd_irq_step1(struct drm_dp_mst_topology_mgr *mgr, u8 *esi, bool *handled)
 {
 	int ret = 0;
 	int sc;
@@ -4077,11 +4077,38 @@ int drm_dp_mst_hpd_irq(struct drm_dp_mst_topology_mgr *mgr, u8 *esi, bool *handl
 		*handled = true;
 	}
 
-	drm_dp_mst_kick_tx(mgr);
 	return ret;
 }
-EXPORT_SYMBOL(drm_dp_mst_hpd_irq);
+EXPORT_SYMBOL(drm_dp_mst_hpd_irq_step1);
+
+/**
+ * drm_dp_mst_hpd_irq_step2() - MST hotplug IRQ 2nd part handling
+ * @mgr: manager to notify irq for.
+ *
+ * This should be called from the driver when mst irq event is handled
+ * and acked. Note that new down request should only be sent when
+ * previous message transaction is done. Source is not supposed to generate
+ * interleaved message transactions.
+ */
+void drm_dp_mst_hpd_irq_step2(struct drm_dp_mst_topology_mgr *mgr)
+{
+	struct drm_dp_sideband_msg_tx *txmsg;
+	bool skip = false;
 
+	mutex_lock(&mgr->qlock);
+	txmsg = list_first_entry_or_null(&mgr->tx_msg_downq,
+					 struct drm_dp_sideband_msg_tx, next);
+	/* If last transaction is not completed yet*/
+	if (!txmsg ||
+	    txmsg->state == DRM_DP_SIDEBAND_TX_START_SEND ||
+	    txmsg->state == DRM_DP_SIDEBAND_TX_SENT)
+		skip = true;
+	mutex_unlock(&mgr->qlock);
+
+	if (!skip)
+		drm_dp_mst_kick_tx(mgr);
+}
+EXPORT_SYMBOL(drm_dp_mst_hpd_irq_step2);
 /**
  * drm_dp_mst_detect_port() - get connection status for an MST port
  * @connector: DRM connector for this port
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 75070eb07d4b..9a9a5aec9534 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3803,7 +3803,7 @@ intel_dp_mst_hpd_irq(struct intel_dp *intel_dp, u8 *esi, u8 *ack)
 {
 	bool handled = false;
 
-	drm_dp_mst_hpd_irq(&intel_dp->mst_mgr, esi, &handled);
+	drm_dp_mst_hpd_irq_step1(&intel_dp->mst_mgr, esi, &handled);
 	if (handled)
 		ack[1] |= esi[1] & (DP_DOWN_REP_MSG_RDY | DP_UP_REQ_MSG_RDY);
 
@@ -3880,6 +3880,9 @@ intel_dp_check_mst_status(struct intel_dp *intel_dp)
 
 		if (!intel_dp_ack_sink_irq_esi(intel_dp, ack))
 			drm_dbg_kms(&i915->drm, "Failed to ack ESI\n");
+
+		if (ack[1] & (DP_DOWN_REP_MSG_RDY | DP_UP_REQ_MSG_RDY))
+			drm_dp_mst_hpd_irq_step2(&intel_dp->mst_mgr);
 	}
 
 	return link_ok;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index ed9d374147b8..00c36fcc8afd 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1332,12 +1332,15 @@ nv50_mstm_service(struct nouveau_drm *drm,
 			break;
 		}
 
-		drm_dp_mst_hpd_irq(&mstm->mgr, esi, &handled);
+		drm_dp_mst_hpd_irq_step1(&mstm->mgr, esi, &handled);
 		if (!handled)
 			break;
 
 		rc = drm_dp_dpcd_write(aux, DP_SINK_COUNT_ESI + 1, &esi[1],
 				       3);
+
+		drm_dp_mst_hpd_irq_step2(&mstm->mgr);
+
 		if (rc != 3) {
 			ret = false;
 			break;
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index 32c764fb9cb5..6c08ba765d5a 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -815,8 +815,8 @@ void drm_dp_mst_topology_mgr_destroy(struct drm_dp_mst_topology_mgr *mgr);
 bool drm_dp_read_mst_cap(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
 int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool mst_state);
 
-int drm_dp_mst_hpd_irq(struct drm_dp_mst_topology_mgr *mgr, u8 *esi, bool *handled);
-
+int drm_dp_mst_hpd_irq_step1(struct drm_dp_mst_topology_mgr *mgr, u8 *esi, bool *handled);
+void drm_dp_mst_hpd_irq_step2(struct drm_dp_mst_topology_mgr *mgr);
 
 int
 drm_dp_mst_detect_port(struct drm_connector *connector,
-- 
2.37.3

