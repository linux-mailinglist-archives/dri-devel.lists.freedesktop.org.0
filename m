Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8BE78668C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 06:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9109310E4E8;
	Thu, 24 Aug 2023 04:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E0F10E4E5;
 Thu, 24 Aug 2023 04:14:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AeI3aW0a+cA2uIhDaft7YgfJXU/9LxMqJlkAYeFBJtBqsbfE28YmLV2/EBXvPh39igZUhYpSM6jkC9AApjHu1HJzF4zcdtDrEaOYYlNuhAzARljSIGvResX/DzhknjbQtHQ0YIFqAzLvWnh5DRO+rjAd2NVhYJuUFXJzfhXoFzjshaq2J/mOcs0W3Vqb6yLJVPjjlPjdI8PuULl4x4a/xwjA/YYoEiebzyhTf8v8E8RyWGv1AVXdiFAx8mFxhXJTsSGxyYMpSvT4bYdK4VylabaECcjuFQKBckD1zWP9B7GYzGrfC3Q+pFixEDfMvt0BFnV+zknizukveG5zl+9RvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGP7+6nVW+n/8JLp5ZrjZfdjPsaKsfph+f7wEd9mEjw=;
 b=N6ensgdbrVUwRMZxxi9x/BXPKk9fD3nO0AGZcWrPVAFR7xkhGx3tBtWm7ycO9DcBPeNqgQT5LmdMSN0XYkKKYM1mZinMKApK/brYoK82oo2/FqY8VV27tIMvAhpkohnWAJY72Jl0u9fce2tHT92gpQ3OsG0AVfw7frr/ToasgC97OL6fFp7e30c6kT35HK2Pl9hwKruMKZoiKrk8AGdPJzNzQ6ncY4WlegAZRCkH/OQ7J7SFpxRt0I+r2QZ7dzcHV0YvN77NJjN0fdE8JUMmSEf8UXzYuvHBylc/uB372qmJ/LPReMQAIedWNWBpRUCDuY4K2Pij8t/O2ZrO5ZErTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGP7+6nVW+n/8JLp5ZrjZfdjPsaKsfph+f7wEd9mEjw=;
 b=e5Cx7LZXctvF0qmB8/SM7w0yLhEKy1Hqr+QZoAjDQ2dQmKu+ZlcHl1IDcKackx4Gf5+zXRULjkHvOK0Ni8axYhg4kSDJdlEF384hIBEr54DFYzuEEm1L8mtgJ9i9S7y29x70XlEUFAlNw4yRvlABPIEoefCP1jFDZZTF6WWllsc=
Received: from BY3PR04CA0029.namprd04.prod.outlook.com (2603:10b6:a03:217::34)
 by MW6PR12MB8760.namprd12.prod.outlook.com (2603:10b6:303:23a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Thu, 24 Aug
 2023 04:14:25 +0000
Received: from MWH0EPF000989EA.namprd02.prod.outlook.com
 (2603:10b6:a03:217:cafe::b4) by BY3PR04CA0029.outlook.office365.com
 (2603:10b6:a03:217::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26 via Frontend
 Transport; Thu, 24 Aug 2023 04:14:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EA.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Thu, 24 Aug 2023 04:14:25 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 23 Aug
 2023 23:14:24 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 23 Aug
 2023 21:14:23 -0700
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 23 Aug 2023 23:14:20 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 2/3] drm/mst: Refactor the flow for payload
 allocation/removement
Date: Thu, 24 Aug 2023 12:13:57 +0800
Message-ID: <20230824041358.4164010-3-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230824041358.4164010-1-Wayne.Lin@amd.com>
References: <20230824041358.4164010-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EA:EE_|MW6PR12MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c9c25b0-6d3d-4b1a-0e8d-08dba4589a0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wYjUTr020zDOcapasgk784Fy9ZDYUjJz6NWDf/4Nzo+unu3Rgk97gMLD3lv1WHjNp7w4fOJtdu9zJgRiYjTFjQ6Xt975dZKW7pCijboJxsRuwDDiHtFPYQGAFRA2XuVM74b9NwOaRoqmLjVYS0JqLoQp6ySGm6fV4QRo/cQrSxAuQRG2CtlDsRVCGOw3xikRivGxxXCiay196QkKcJrNfAH6bpOVLpRpof4ruGjX1Y50MDEQq2k778b/VSMWsOsPjeZ0ck8reIWbEM+AmNsV4d0RU8F3uXLeixiVwtELI655Ublg+znEB4QVplnC425keLHICtdsnnf25stCqyEfkmLWkA3hqWkqriIQ/yx7gvPN8mudntFwWaExHPoFQKlUfKt60DhW0j1CU9B+Lo2wqwuNgh7AwEV+G0yU5nfVix+ookaLsN/N+UlRPRmJlR/oFFPnxa7DFC7btTzND352uIutV3s0aIKIm9eeXBFXVgHUowjxVrgJWw+vPgvVmtyQ5EjcRzHEhkDSavNu64Vr47tp12Rl128EuWvBuVvdrc4f8dQrzlW6EzNbhBviSki1IXpjLobSt4GH7YYIbvuYvk/YsMxSkQSsNCTBpwMNHNnXXqvyay6V00Oge3d6Xm4x+TW65TpADPJg2wZZr49iWDAPpK/SHi6yjE+IhQpJR1/rXYJIqNapQlJogV1AGDpag8bRRP11qMSvYhyFQ+vs4i0FBQLIzMpoDPnejHhfC1oJaZe4FMrImJ3cfkfHNfGnyg5cx68iOeLDBHNGB3lPKA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(39860400002)(136003)(346002)(376002)(1800799009)(186009)(451199024)(82310400011)(36840700001)(40470700004)(46966006)(54906003)(70586007)(316002)(70206006)(66899024)(110136005)(8676002)(8936002)(2616005)(4326008)(41300700001)(36756003)(40460700003)(1076003)(356005)(82740400003)(81166007)(478600001)(6666004)(40480700001)(83380400001)(30864003)(2906002)(47076005)(7696005)(36860700001)(86362001)(426003)(336012)(5660300002)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 04:14:25.0340 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9c25b0-6d3d-4b1a-0e8d-08dba4589a0e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8760
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
Cc: jani.nikula@intel.com, jerry.zuo@amd.com, Wayne Lin <Wayne.Lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
Today, the allocation/deallocation steps and status is a bit unclear.

For instance, payload->vc_start_slot = -1 stands for "the failure of
updating DPCD payload ID table" and can also represent as "payload is not
allocated yet". These two cases should be handled differently and hence
better to distinguish them for better understanding.

[How]
Define enumeration - ALLOCATION_LOCAL, ALLOCATION_DFP and ALLOCATION_REMOTE
to distinguish different allocation status. Adjust the code to handle
different status accordingly for better understanding the sequence of
payload allocation and payload removement.

For payload creation, the procedure should look like this:
DRM part 1:
* step 1 - update sw mst mgr variables to add a new payload
* step 2 - add payload at immediate DFP DPCD payload table

Driver:
* Add new payload in HW and sync up with DFP by sending ACT

DRM Part 2:
* Send ALLOCATE_PAYLOAD sideband message to allocate bandwidth along the
  virtual channel.

And as for payload removement, the procedure should look like this:
DRM part 1:
* step 1 - Send ALLOCATE_PAYLOAD sideband message to release bandwidth
           along the virtual channel
* step 2 - Clear payload allocation at immediate DFP DPCD payload table

Driver:
* Remove the payload in HW and sync up with DFP by sending ACT

DRM part 2:
* update sw mst mgr variables to remove the payload

Note that it's fine to fail when communicate with the branch device
connected at immediate downstrean-facing port, but updating variables of
SW mst mgr and HW configuration should be conducted anyway. That's because
it's under commit_tail and we need to complete the HW programming.

Changes since v1:
* Remove the set but not use variable 'old_payload' in function
  'nv50_msto_prepare'. Catched by kernel test robot <lkp@intel.com>

Changes since v2:
* Fix indention

Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  20 ++-
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 159 +++++++++++-------
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  18 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  21 +--
 include/drm/display/drm_dp_mst_helper.h       |  23 ++-
 5 files changed, 153 insertions(+), 88 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 4b230933b28e..cbef4ff28cd8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -219,7 +219,7 @@ static void dm_helpers_construct_old_payload(
 	/* Set correct time_slots/PBN of old payload.
 	 * other fields (delete & dsc_enabled) in
 	 * struct drm_dp_mst_atomic_payload are don't care fields
-	 * while calling drm_dp_remove_payload()
+	 * while calling drm_dp_remove_payload_part2()
 	 */
 	for (i = 0; i < current_link_table.stream_count; i++) {
 		dc_alloc =
@@ -263,13 +263,12 @@ bool dm_helpers_dp_mst_write_payload_allocation_table(
 
 	mst_mgr = &aconnector->mst_root->mst_mgr;
 	mst_state = to_drm_dp_mst_topology_state(mst_mgr->base.state);
-
-	/* It's OK for this to fail */
 	new_payload = drm_atomic_get_mst_payload_state(mst_state, aconnector->mst_output_port);
 
 	if (enable) {
 		target_payload = new_payload;
 
+		/* It's OK for this to fail */
 		drm_dp_add_payload_part1(mst_mgr, mst_state, new_payload);
 	} else {
 		/* construct old payload by VCPI*/
@@ -277,7 +276,7 @@ bool dm_helpers_dp_mst_write_payload_allocation_table(
 						new_payload, &old_payload);
 		target_payload = &old_payload;
 
-		drm_dp_remove_payload(mst_mgr, mst_state, &old_payload, new_payload);
+		drm_dp_remove_payload_part1(mst_mgr, mst_state, new_payload);
 	}
 
 	/* mst_mgr->->payloads are VC payload notify MST branch using DPCD or
@@ -344,7 +343,7 @@ bool dm_helpers_dp_mst_send_payload_allocation(
 	struct amdgpu_dm_connector *aconnector;
 	struct drm_dp_mst_topology_state *mst_state;
 	struct drm_dp_mst_topology_mgr *mst_mgr;
-	struct drm_dp_mst_atomic_payload *payload;
+	struct drm_dp_mst_atomic_payload *new_payload, *old_payload;
 	enum mst_progress_status set_flag = MST_ALLOCATE_NEW_PAYLOAD;
 	enum mst_progress_status clr_flag = MST_CLEAR_ALLOCATED_PAYLOAD;
 	int ret = 0;
@@ -357,15 +356,20 @@ bool dm_helpers_dp_mst_send_payload_allocation(
 	mst_mgr = &aconnector->mst_root->mst_mgr;
 	mst_state = to_drm_dp_mst_topology_state(mst_mgr->base.state);
 
-	payload = drm_atomic_get_mst_payload_state(mst_state, aconnector->mst_output_port);
+	new_payload = drm_atomic_get_mst_payload_state(mst_state, aconnector->mst_output_port);
 
 	if (!enable) {
 		set_flag = MST_CLEAR_ALLOCATED_PAYLOAD;
 		clr_flag = MST_ALLOCATE_NEW_PAYLOAD;
 	}
 
-	if (enable)
-		ret = drm_dp_add_payload_part2(mst_mgr, mst_state->base.state, payload);
+	if (enable) {
+		ret = drm_dp_add_payload_part2(mst_mgr, mst_state->base.state, new_payload);
+	} else {
+		dm_helpers_construct_old_payload(stream->link, mst_state->pbn_div,
+						 new_payload, old_payload);
+		drm_dp_remove_payload_part2(mst_mgr, mst_state, old_payload, new_payload);
+	}
 
 	if (ret) {
 		amdgpu_dm_set_mst_status(&aconnector->mst_status,
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 4d80426757ab..8f4034d556c4 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3255,15 +3255,15 @@ int drm_dp_send_query_stream_enc_status(struct drm_dp_mst_topology_mgr *mgr,
 }
 EXPORT_SYMBOL(drm_dp_send_query_stream_enc_status);
 
-static int drm_dp_create_payload_step1(struct drm_dp_mst_topology_mgr *mgr,
-				       struct drm_dp_mst_atomic_payload *payload)
+static int drm_dp_create_payload_at_dfp(struct drm_dp_mst_topology_mgr *mgr,
+					struct drm_dp_mst_atomic_payload *payload)
 {
 	return drm_dp_dpcd_write_payload(mgr, payload->vcpi, payload->vc_start_slot,
 					 payload->time_slots);
 }
 
-static int drm_dp_create_payload_step2(struct drm_dp_mst_topology_mgr *mgr,
-				       struct drm_dp_mst_atomic_payload *payload)
+static int drm_dp_create_payload_to_remote(struct drm_dp_mst_topology_mgr *mgr,
+					   struct drm_dp_mst_atomic_payload *payload)
 {
 	int ret;
 	struct drm_dp_mst_port *port = drm_dp_mst_topology_get_port_validated(mgr, payload->port);
@@ -3276,17 +3276,20 @@ static int drm_dp_create_payload_step2(struct drm_dp_mst_topology_mgr *mgr,
 	return ret;
 }
 
-static int drm_dp_destroy_payload_step1(struct drm_dp_mst_topology_mgr *mgr,
-					struct drm_dp_mst_topology_state *mst_state,
-					struct drm_dp_mst_atomic_payload *payload)
+static void drm_dp_destroy_payload_at_remote_and_dfp(struct drm_dp_mst_topology_mgr *mgr,
+						     struct drm_dp_mst_topology_state *mst_state,
+						     struct drm_dp_mst_atomic_payload *payload)
 {
 	drm_dbg_kms(mgr->dev, "\n");
 
 	/* it's okay for these to fail */
-	drm_dp_payload_send_msg(mgr, payload->port, payload->vcpi, 0);
-	drm_dp_dpcd_write_payload(mgr, payload->vcpi, payload->vc_start_slot, 0);
+	if (payload->payload_allocation_status == DRM_DP_MST_PAYLOAD_ALLOCATION_REMOTE) {
+		drm_dp_payload_send_msg(mgr, payload->port, payload->vcpi, 0);
+		payload->payload_allocation_status = DRM_DP_MST_PAYLOAD_ALLOCATION_DFP;
+	}
 
-	return 0;
+	if (payload->payload_allocation_status == DRM_DP_MST_PAYLOAD_ALLOCATION_DFP)
+		drm_dp_dpcd_write_payload(mgr, payload->vcpi, payload->vc_start_slot, 0);
 }
 
 /**
@@ -3296,81 +3299,105 @@ static int drm_dp_destroy_payload_step1(struct drm_dp_mst_topology_mgr *mgr,
  * @payload: The payload to write
  *
  * Determines the starting time slot for the given payload, and programs the VCPI for this payload
- * into hardware. After calling this, the driver should generate ACT and payload packets.
+ * into the DPCD of DPRX. After calling this, the driver should generate ACT and payload packets.
  *
- * Returns: 0 on success, error code on failure. In the event that this fails,
- * @payload.vc_start_slot will also be set to -1.
+ * Returns: 0 on success, error code on failure.
  */
 int drm_dp_add_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
 			     struct drm_dp_mst_topology_state *mst_state,
 			     struct drm_dp_mst_atomic_payload *payload)
 {
 	struct drm_dp_mst_port *port;
-	int ret;
+	int ret = 0;
+	bool allocate = true;
+
+	/* Update mst mgr info */
+	if (mgr->payload_count == 0)
+		mgr->next_start_slot = mst_state->start_slot;
+
+	payload->vc_start_slot = mgr->next_start_slot;
+
+	mgr->payload_count++;
+	mgr->next_start_slot += payload->time_slots;
 
+	/* Allocate payload to immediate downstream facing port */
 	port = drm_dp_mst_topology_get_port_validated(mgr, payload->port);
 	if (!port) {
 		drm_dbg_kms(mgr->dev,
-			    "VCPI %d for port %p not in topology, not creating a payload\n",
+			    "VCPI %d for port %p not in topology, not creating a payload to remote\n",
 			    payload->vcpi, payload->port);
-		payload->vc_start_slot = -1;
-		return 0;
+		allocate = false;
 	}
 
-	if (mgr->payload_count == 0)
-		mgr->next_start_slot = mst_state->start_slot;
-
-	payload->vc_start_slot = mgr->next_start_slot;
+	if (allocate) {
+		ret = drm_dp_create_payload_at_dfp(mgr, payload);
+		if (ret < 0)
+			drm_warn(mgr->dev, "Failed to create MST payload for port %p: %d\n",
+				 payload->port, ret);
 
-	ret = drm_dp_create_payload_step1(mgr, payload);
-	drm_dp_mst_topology_put_port(port);
-	if (ret < 0) {
-		drm_warn(mgr->dev, "Failed to create MST payload for port %p: %d\n",
-			 payload->port, ret);
-		payload->vc_start_slot = -1;
-		return ret;
 	}
 
-	mgr->payload_count++;
-	mgr->next_start_slot += payload->time_slots;
+	payload->payload_allocation_status =
+		(!allocate || ret < 0) ? DRM_DP_MST_PAYLOAD_ALLOCATION_LOCAL :
+					 DRM_DP_MST_PAYLOAD_ALLOCATION_DFP;
 
-	return 0;
+	drm_dp_mst_topology_put_port(port);
+
+	return ret;
 }
 EXPORT_SYMBOL(drm_dp_add_payload_part1);
 
 /**
- * drm_dp_remove_payload() - Remove an MST payload
+ * drm_dp_remove_payload_part1() - Remove an MST payload along the virtual channel
  * @mgr: Manager to use.
  * @mst_state: The MST atomic state
- * @old_payload: The payload with its old state
- * @new_payload: The payload to write
+ * @payload: The payload to remove
  *
- * Removes a payload from an MST topology if it was successfully assigned a start slot. Also updates
- * the starting time slots of all other payloads which would have been shifted towards the start of
- * the VC table as a result. After calling this, the driver should generate ACT and payload packets.
+ * Removes a payload along the virtual channel if it was successfully allocated.
+ * After calling this, the driver should set HW to generate ACT and then switch to new
+ * payload allocation state.
  */
-void drm_dp_remove_payload(struct drm_dp_mst_topology_mgr *mgr,
-			   struct drm_dp_mst_topology_state *mst_state,
-			   const struct drm_dp_mst_atomic_payload *old_payload,
-			   struct drm_dp_mst_atomic_payload *new_payload)
+void drm_dp_remove_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
+				 struct drm_dp_mst_topology_state *mst_state,
+				 struct drm_dp_mst_atomic_payload *payload)
 {
-	struct drm_dp_mst_atomic_payload *pos;
+	/* Remove remote payload allocation */
 	bool send_remove = false;
 
-	/* We failed to make the payload, so nothing to do */
-	if (new_payload->vc_start_slot == -1)
-		return;
-
 	mutex_lock(&mgr->lock);
-	send_remove = drm_dp_mst_port_downstream_of_branch(new_payload->port, mgr->mst_primary);
+	send_remove = drm_dp_mst_port_downstream_of_branch(payload->port, mgr->mst_primary);
 	mutex_unlock(&mgr->lock);
 
 	if (send_remove)
-		drm_dp_destroy_payload_step1(mgr, mst_state, new_payload);
+		drm_dp_destroy_payload_at_remote_and_dfp(mgr, mst_state, payload);
 	else
 		drm_dbg_kms(mgr->dev, "Payload for VCPI %d not in topology, not sending remove\n",
-			    new_payload->vcpi);
+			    payload->vcpi);
+
+	payload->payload_allocation_status = DRM_DP_MST_PAYLOAD_ALLOCATION_LOCAL;
+}
+EXPORT_SYMBOL(drm_dp_remove_payload_part1);
 
+/**
+ * drm_dp_remove_payload_part2() - Remove an MST payload locally
+ * @mgr: Manager to use.
+ * @mst_state: The MST atomic state
+ * @old_payload: The payload with its old state
+ * @new_payload: The payload with its latest state
+ *
+ * Updates the starting time slots of all other payloads which would have been shifted towards
+ * the start of the payload ID table as a result of removing a payload. Driver should call this
+ * function whenever it removes a payload in its HW. It's independent to the result of payload
+ * allocation/deallocation at branch devices along the virtual channel.
+ */
+void drm_dp_remove_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
+				 struct drm_dp_mst_topology_state *mst_state,
+				 const struct drm_dp_mst_atomic_payload *old_payload,
+				 struct drm_dp_mst_atomic_payload *new_payload)
+{
+	struct drm_dp_mst_atomic_payload *pos;
+
+	/* Remove local payload allocation */
 	list_for_each_entry(pos, &mst_state->payloads, next) {
 		if (pos != new_payload && pos->vc_start_slot > new_payload->vc_start_slot)
 			pos->vc_start_slot -= old_payload->time_slots;
@@ -3382,9 +3409,10 @@ void drm_dp_remove_payload(struct drm_dp_mst_topology_mgr *mgr,
 
 	if (new_payload->delete)
 		drm_dp_mst_put_port_malloc(new_payload->port);
-}
-EXPORT_SYMBOL(drm_dp_remove_payload);
 
+	new_payload->payload_allocation_status = DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
+}
+EXPORT_SYMBOL(drm_dp_remove_payload_part2);
 /**
  * drm_dp_add_payload_part2() - Execute payload update part 2
  * @mgr: Manager to use.
@@ -3403,17 +3431,19 @@ int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
 	int ret = 0;
 
 	/* Skip failed payloads */
-	if (payload->vc_start_slot == -1) {
-		drm_dbg_kms(mgr->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
+	if (payload->payload_allocation_status != DRM_DP_MST_PAYLOAD_ALLOCATION_DFP) {
+		drm_dbg_kms(state->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
 			    payload->port->connector->name);
 		return -EIO;
 	}
 
-	ret = drm_dp_create_payload_step2(mgr, payload);
-	if (ret < 0) {
+	/* Allocate payload to remote end */
+	ret = drm_dp_create_payload_to_remote(mgr, payload);
+	if (ret < 0)
 		drm_err(mgr->dev, "Step 2 of creating MST payload for %p failed: %d\n",
 			payload->port, ret);
-	}
+	else
+		payload->payload_allocation_status = DRM_DP_MST_PAYLOAD_ALLOCATION_REMOTE;
 
 	return ret;
 }
@@ -4324,6 +4354,7 @@ int drm_dp_atomic_find_time_slots(struct drm_atomic_state *state,
 		drm_dp_mst_get_port_malloc(port);
 		payload->port = port;
 		payload->vc_start_slot = -1;
+		payload->payload_allocation_status = DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
 		list_add(&payload->next, &topology_state->payloads);
 	}
 	payload->time_slots = req_slots;
@@ -4493,7 +4524,7 @@ void drm_dp_mst_atomic_wait_for_dependencies(struct drm_atomic_state *state)
 		}
 
 		/* Now that previous state is committed, it's safe to copy over the start slot
-		 * assignments
+		 * and allocation status assignments
 		 */
 		list_for_each_entry(old_payload, &old_mst_state->payloads, next) {
 			if (old_payload->delete)
@@ -4502,6 +4533,8 @@ void drm_dp_mst_atomic_wait_for_dependencies(struct drm_atomic_state *state)
 			new_payload = drm_atomic_get_mst_payload_state(new_mst_state,
 								       old_payload->port);
 			new_payload->vc_start_slot = old_payload->vc_start_slot;
+			new_payload->payload_allocation_status =
+				     old_payload->payload_allocation_status;
 		}
 	}
 }
@@ -4818,6 +4851,13 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
 	struct drm_dp_mst_atomic_payload *payload;
 	int i, ret;
 
+	static const char *const status[] = {
+		"None",
+		"Local",
+		"DFP",
+		"Remote",
+	};
+
 	mutex_lock(&mgr->lock);
 	if (mgr->mst_primary)
 		drm_dp_mst_dump_mstb(m, mgr->mst_primary);
@@ -4834,7 +4874,7 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
 	seq_printf(m, "payload_mask: %x, max_payloads: %d, start_slot: %u, pbn_div: %d\n",
 		   state->payload_mask, mgr->max_payloads, state->start_slot, state->pbn_div);
 
-	seq_printf(m, "\n| idx | port | vcpi | slots | pbn | dsc |     sink name     |\n");
+	seq_printf(m, "\n| idx | port | vcpi | slots | pbn | dsc | status |     sink name     |\n");
 	for (i = 0; i < mgr->max_payloads; i++) {
 		list_for_each_entry(payload, &state->payloads, next) {
 			char name[14];
@@ -4843,7 +4883,7 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
 				continue;
 
 			fetch_monitor_name(mgr, payload->port, name, sizeof(name));
-			seq_printf(m, " %5d %6d %6d %02d - %02d %5d %5s %19s\n",
+			seq_printf(m, " %5d %6d %6d %02d - %02d %5d %5s %8s %19s\n",
 				   i,
 				   payload->port->port_num,
 				   payload->vcpi,
@@ -4851,6 +4891,7 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
 				   payload->vc_start_slot + payload->time_slots - 1,
 				   payload->pbn,
 				   payload->dsc_enabled ? "Y" : "N",
+				   status[payload->payload_allocation_status],
 				   (*name != 0) ? name : "Unknown");
 		}
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 3eb085fbc7c8..b30d9d597420 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -565,12 +565,8 @@ static void intel_mst_disable_dp(struct intel_atomic_state *state,
 	struct intel_dp *intel_dp = &dig_port->dp;
 	struct intel_connector *connector =
 		to_intel_connector(old_conn_state->connector);
-	struct drm_dp_mst_topology_state *old_mst_state =
-		drm_atomic_get_old_mst_topology_state(&state->base, &intel_dp->mst_mgr);
 	struct drm_dp_mst_topology_state *new_mst_state =
 		drm_atomic_get_new_mst_topology_state(&state->base, &intel_dp->mst_mgr);
-	const struct drm_dp_mst_atomic_payload *old_payload =
-		drm_atomic_get_mst_payload_state(old_mst_state, connector->port);
 	struct drm_dp_mst_atomic_payload *new_payload =
 		drm_atomic_get_mst_payload_state(new_mst_state, connector->port);
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
@@ -580,8 +576,7 @@ static void intel_mst_disable_dp(struct intel_atomic_state *state,
 
 	intel_hdcp_disable(intel_mst->connector);
 
-	drm_dp_remove_payload(&intel_dp->mst_mgr, new_mst_state,
-			      old_payload, new_payload);
+	drm_dp_remove_payload_part1(&intel_dp->mst_mgr, new_mst_state, new_payload);
 
 	intel_audio_codec_disable(encoder, old_crtc_state, old_conn_state);
 }
@@ -596,6 +591,14 @@ static void intel_mst_post_disable_dp(struct intel_atomic_state *state,
 	struct intel_dp *intel_dp = &dig_port->dp;
 	struct intel_connector *connector =
 		to_intel_connector(old_conn_state->connector);
+	struct drm_dp_mst_topology_state *old_mst_state =
+		drm_atomic_get_old_mst_topology_state(&state->base, &intel_dp->mst_mgr);
+	struct drm_dp_mst_topology_state *new_mst_state =
+		drm_atomic_get_new_mst_topology_state(&state->base, &intel_dp->mst_mgr);
+	const struct drm_dp_mst_atomic_payload *old_payload =
+		drm_atomic_get_mst_payload_state(old_mst_state, connector->port);
+	struct drm_dp_mst_atomic_payload *new_payload =
+		drm_atomic_get_mst_payload_state(new_mst_state, connector->port);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	bool last_mst_stream;
 
@@ -616,6 +619,9 @@ static void intel_mst_post_disable_dp(struct intel_atomic_state *state,
 
 	wait_for_act_sent(encoder, old_crtc_state);
 
+	drm_dp_remove_payload_part2(&intel_dp->mst_mgr, new_mst_state,
+				    old_payload, new_payload);
+
 	intel_ddi_disable_transcoder_func(old_crtc_state);
 
 	if (DISPLAY_VER(dev_priv) >= 9)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 4e7c9c353c51..bba01fa0780c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -882,21 +882,26 @@ struct nouveau_encoder *nv50_real_outp(struct drm_encoder *encoder)
 
 static void
 nv50_msto_cleanup(struct drm_atomic_state *state,
-		  struct drm_dp_mst_topology_state *mst_state,
+		  struct drm_dp_mst_topology_state *new_mst_state,
 		  struct drm_dp_mst_topology_mgr *mgr,
 		  struct nv50_msto *msto)
 {
 	struct nouveau_drm *drm = nouveau_drm(msto->encoder.dev);
-	struct drm_dp_mst_atomic_payload *payload =
-		drm_atomic_get_mst_payload_state(mst_state, msto->mstc->port);
+	struct drm_dp_mst_atomic_payload *new_payload =
+		drm_atomic_get_mst_payload_state(new_mst_state, msto->mstc->port);
+	struct drm_dp_mst_topology_state *old_mst_state =
+		drm_atomic_get_old_mst_topology_state(state, mgr);
+	const struct drm_dp_mst_atomic_payload *old_payload =
+		drm_atomic_get_mst_payload_state(old_mst_state, msto->mstc->port);
 
 	NV_ATOMIC(drm, "%s: msto cleanup\n", msto->encoder.name);
 
 	if (msto->disabled) {
 		msto->mstc = NULL;
 		msto->disabled = false;
+		drm_dp_remove_payload_part2(mgr, new_mst_state, old_payload, new_payload);
 	} else if (msto->enabled) {
-		drm_dp_add_payload_part2(mgr, state, payload);
+		drm_dp_add_payload_part2(mgr, state, new_payload);
 		msto->enabled = false;
 	}
 }
@@ -910,19 +915,15 @@ nv50_msto_prepare(struct drm_atomic_state *state,
 	struct nouveau_drm *drm = nouveau_drm(msto->encoder.dev);
 	struct nv50_mstc *mstc = msto->mstc;
 	struct nv50_mstm *mstm = mstc->mstm;
-	struct drm_dp_mst_topology_state *old_mst_state;
-	struct drm_dp_mst_atomic_payload *payload, *old_payload;
+	struct drm_dp_mst_atomic_payload *payload;
 
 	NV_ATOMIC(drm, "%s: msto prepare\n", msto->encoder.name);
 
-	old_mst_state = drm_atomic_get_old_mst_topology_state(state, mgr);
-
 	payload = drm_atomic_get_mst_payload_state(mst_state, mstc->port);
-	old_payload = drm_atomic_get_mst_payload_state(old_mst_state, mstc->port);
 
 	// TODO: Figure out if we want to do a better job of handling VCPI allocation failures here?
 	if (msto->disabled) {
-		drm_dp_remove_payload(mgr, mst_state, old_payload, payload);
+		drm_dp_remove_payload_part1(mgr, mst_state, payload);
 
 		nvif_outp_dp_mst_vcpi(&mstm->outp->outp, msto->head->base.index, 0, 0, 0, 0);
 	} else {
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index ed5c9660563c..4429d3b1745b 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -46,6 +46,13 @@ struct drm_dp_mst_topology_ref_history {
 };
 #endif /* IS_ENABLED(CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS) */
 
+enum drm_dp_mst_payload_allocation {
+	DRM_DP_MST_PAYLOAD_ALLOCATION_NONE,
+	DRM_DP_MST_PAYLOAD_ALLOCATION_LOCAL,
+	DRM_DP_MST_PAYLOAD_ALLOCATION_DFP,
+	DRM_DP_MST_PAYLOAD_ALLOCATION_REMOTE,
+};
+
 struct drm_dp_mst_branch;
 
 /**
@@ -537,7 +544,7 @@ struct drm_dp_mst_atomic_payload {
 	 *   drm_dp_mst_atomic_wait_for_dependencies() has been called, which will ensure the
 	 *   previous MST states payload start slots have been copied over to the new state. Note
 	 *   that a new start slot won't be assigned/removed from this payload until
-	 *   drm_dp_add_payload_part1()/drm_dp_remove_payload() have been called.
+	 *   drm_dp_add_payload_part1()/drm_dp_remove_payload_part2() have been called.
 	 * * Acquire the MST modesetting lock, and then wait for any pending MST-related commits to
 	 *   get committed to hardware by calling drm_crtc_commit_wait() on each of the
 	 *   &drm_crtc_commit structs in &drm_dp_mst_topology_state.commit_deps.
@@ -564,6 +571,9 @@ struct drm_dp_mst_atomic_payload {
 	/** @dsc_enabled: Whether or not this payload has DSC enabled */
 	bool dsc_enabled : 1;
 
+	/** @payload_allocation_status: The allocation status of this payload */
+	enum drm_dp_mst_payload_allocation payload_allocation_status;
+
 	/** @next: The list node for this payload */
 	struct list_head next;
 };
@@ -842,10 +852,13 @@ int drm_dp_add_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
 int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
 			     struct drm_atomic_state *state,
 			     struct drm_dp_mst_atomic_payload *payload);
-void drm_dp_remove_payload(struct drm_dp_mst_topology_mgr *mgr,
-			   struct drm_dp_mst_topology_state *mst_state,
-			   const struct drm_dp_mst_atomic_payload *old_payload,
-			   struct drm_dp_mst_atomic_payload *new_payload);
+void drm_dp_remove_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
+				 struct drm_dp_mst_topology_state *mst_state,
+				 struct drm_dp_mst_atomic_payload *payload);
+void drm_dp_remove_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
+				 struct drm_dp_mst_topology_state *mst_state,
+				 const struct drm_dp_mst_atomic_payload *old_payload,
+				 struct drm_dp_mst_atomic_payload *new_payload);
 
 int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr);
 
-- 
2.37.3

