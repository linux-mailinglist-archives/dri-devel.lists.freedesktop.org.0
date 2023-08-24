Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C312078668D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 06:15:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD4910E4E5;
	Thu, 24 Aug 2023 04:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E84810E4E5;
 Thu, 24 Aug 2023 04:15:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qui5tvDDEhCvZLwfWfjb59Rz51kvKaU2+DTfmRbS1iOwhdmH1GyjzNkCytVuWn7DY8TI8UoHRbYBaX4SGiJJ9pC2RaW0/DcfKKnmuybkb4cNzcH7g2iyhI47qjReRTc38nwkz9DWanNK6BtP9CQPyPVmOM7wTjQioP6Hz3jgl4N1fuKYuKQnoe+M1MF/uMUO3JjbGGH80wInZf0naYMkV/HRUGRbad7qlARBJJ+otBZUMQAvwjt93K8MYoREf+Obe82MChYCrDei9R+0QHRWgayzKDXfk8xP6fgrHe6BhvcD3Wq68EvAtEv0+slstZrcqf644Z/pWDPpxALxg39BIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=patSvyuqiFdWg+vADjHTIfDndmHm2XeNSa4iDMr2tL8=;
 b=WmhBngijwUygXGa8ZdO1WeBzJHNbrwK2BBA0CdW/KI1raB2AA9EFInkLJGBtbxdut8gRvM+2yXuaBQWYKg6Y1jX8ZbNbXsWD8L8pucvXr7NCkUl2BB7y5J0Hm5XkeV5W8f844sQ3/uyLhxc1AhOfXRElp1V9ufNCmPHAlozRL+LvyUFHM/4qC8xJtAIuBB2y6gVTC0qi//MUIjMxXXnO78Jd/e+LT5gmbxzBODrw8crY+g8wBzdAMpNAcVzK4/GYMNDsHl/DgJN8lQ2ONvLGBY/IqF2CBsWro14rXlPE62f0nJpFN/i+hTvLWPgFTLsvwxcE0bBYag8COaQnjFaRgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=patSvyuqiFdWg+vADjHTIfDndmHm2XeNSa4iDMr2tL8=;
 b=AS/JAodx9QlBFO7NkCxKnW0hfjn+e4xGbGHtxgVdFuLTXaP2nYHYdihvIiqohnAraGs1dubeVmr7wellqBw3nMABTEUq2lpyRBO3WY0IMs6w7gRt3xe3EDpAqNE7DprP1SONiXMx+/qMiiR25tKbKmLtAYpQNcKsrWY4rIAxs/0=
Received: from SJ0PR03CA0124.namprd03.prod.outlook.com (2603:10b6:a03:33c::9)
 by DS0PR12MB7996.namprd12.prod.outlook.com (2603:10b6:8:14f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 04:14:59 +0000
Received: from MWH0EPF000989EA.namprd02.prod.outlook.com
 (2603:10b6:a03:33c:cafe::32) by SJ0PR03CA0124.outlook.office365.com
 (2603:10b6:a03:33c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Thu, 24 Aug 2023 04:14:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EA.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Thu, 24 Aug 2023 04:14:58 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 23 Aug
 2023 23:14:58 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 23 Aug
 2023 23:14:28 -0500
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 23 Aug 2023 23:14:25 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 3/3] drm/mst: adjust the function
 drm_dp_remove_payload_part2()
Date: Thu, 24 Aug 2023 12:13:58 +0800
Message-ID: <20230824041358.4164010-4-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230824041358.4164010-1-Wayne.Lin@amd.com>
References: <20230824041358.4164010-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EA:EE_|DS0PR12MB7996:EE_
X-MS-Office365-Filtering-Correlation-Id: 888b65b4-d08d-4961-5fd4-08dba458ae41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GjYVKuxkGi7rF29GuR96R3xmZyhxN7CWiEHqmwzaiE6QZJzTKDDled8FsM6s6jTgO4Ha7Y76JrEfHV5ztyer9rDj/j3flaJXt8MSKXaeILa/og6qP0/dJO3yNga1QKMvsAttm6IDkUpLR2KRqeHFC/yKyUvKet9p33ib/6EHgO0CtynbUfq+omX6H23QbeoY4mGaqm2TKzOa1UEKs+MAiKT66Z7WEN/+h/gaaQivKbhtLrI64qH2BME5YLZbjHkuGv1wSW+7hWCGMDZCGxbG0cMAA/EHtvylKJS6DiD3PWy2WD8FS3fCyVXCNCGHcSOGhpDEMtSKexYWRrzUlOXugHDuGCD4mBnCj/mr7v3eqHYXqr9JWwuvwmQS6un2rS+CTqBZs1N9EmkxS5sAP5nFNBX8aoZLgS9CUZ3ldinEaqp5dIRl2w6j7hPnGsbIwGIhAsWnBP7Rp2HdpcfT/Zi5kzJRmttlrd0OrksfsrsRR3YnGBrON0/TqxknT1LNsSjWxnuRm9kTdsRUOMLtUiwkpCbMkd2lM6Gwq9IPwwQdl4Z5Hz+zYegJdz8XWAqOh3qWkjXvHsA3C49VyGqMjX/tFITWU2F/FdMMk5ZlYoKfCnrj0LnLx8IAaG1J4PUtj5BshQ7pGR5ZoqaoJih9spPfePmT9c30SV3BqNLo89xwFNIGWcEm1rcu1X7npmyWn72PsXMXfnt458425TTNsj9UI7cLScJIjQqnd0P3orjuz3wA9j6RB+DENONnmKjmZJ3nlsrOvZS1XVyS0y8h+NlGYw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(396003)(39860400002)(346002)(136003)(186009)(1800799009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(1076003)(40460700003)(2616005)(5660300002)(4326008)(8676002)(8936002)(336012)(47076005)(426003)(36756003)(30864003)(83380400001)(36860700001)(26005)(40480700001)(82740400003)(356005)(6666004)(81166007)(70206006)(70586007)(54906003)(316002)(110136005)(478600001)(41300700001)(2906002)(7696005)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 04:14:58.9091 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 888b65b4-d08d-4961-5fd4-08dba458ae41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7996
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
Now in drm_dp_remove_payload_part2(), it utilizes the time slot number
of the payload in old state to represent the one in the payload table
at the moment.

It would be better to clarify the idea by using the latest allocated
time slot number for the port at the moment instead and which info is
already included in new mst_state. By this, we can also remove redundant
workaround for amdgpu driver.

[How]
Remove "old_payload" input of drm_dp_remove_payload_part2() and get the
latest number of allocated time slot for the port from new mst_state
instead.

Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 70 ++++---------------
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 32 ++++++---
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  7 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  6 +-
 include/drm/display/drm_dp_mst_helper.h       |  9 ++-
 5 files changed, 40 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index cbef4ff28cd8..02cb372260f3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -203,40 +203,6 @@ void dm_helpers_dp_update_branch_info(
 	const struct dc_link *link)
 {}
 
-static void dm_helpers_construct_old_payload(
-			struct dc_link *link,
-			int pbn_per_slot,
-			struct drm_dp_mst_atomic_payload *new_payload,
-			struct drm_dp_mst_atomic_payload *old_payload)
-{
-	struct link_mst_stream_allocation_table current_link_table =
-									link->mst_stream_alloc_table;
-	struct link_mst_stream_allocation *dc_alloc;
-	int i;
-
-	*old_payload = *new_payload;
-
-	/* Set correct time_slots/PBN of old payload.
-	 * other fields (delete & dsc_enabled) in
-	 * struct drm_dp_mst_atomic_payload are don't care fields
-	 * while calling drm_dp_remove_payload_part2()
-	 */
-	for (i = 0; i < current_link_table.stream_count; i++) {
-		dc_alloc =
-			&current_link_table.stream_allocations[i];
-
-		if (dc_alloc->vcp_id == new_payload->vcpi) {
-			old_payload->time_slots = dc_alloc->slot_count;
-			old_payload->pbn = dc_alloc->slot_count * pbn_per_slot;
-			break;
-		}
-	}
-
-	/* make sure there is an old payload*/
-	ASSERT(i != current_link_table.stream_count);
-
-}
-
 /*
  * Writes payload allocation table in immediate downstream device.
  */
@@ -248,7 +214,7 @@ bool dm_helpers_dp_mst_write_payload_allocation_table(
 {
 	struct amdgpu_dm_connector *aconnector;
 	struct drm_dp_mst_topology_state *mst_state;
-	struct drm_dp_mst_atomic_payload *target_payload, *new_payload, old_payload;
+	struct drm_dp_mst_atomic_payload *payload;
 	struct drm_dp_mst_topology_mgr *mst_mgr;
 
 	aconnector = (struct amdgpu_dm_connector *)stream->dm_stream_context;
@@ -263,28 +229,21 @@ bool dm_helpers_dp_mst_write_payload_allocation_table(
 
 	mst_mgr = &aconnector->mst_root->mst_mgr;
 	mst_state = to_drm_dp_mst_topology_state(mst_mgr->base.state);
-	new_payload = drm_atomic_get_mst_payload_state(mst_state, aconnector->mst_output_port);
-
-	if (enable) {
-		target_payload = new_payload;
+	payload = drm_atomic_get_mst_payload_state(mst_state, aconnector->mst_output_port);
 
+	if (enable)
 		/* It's OK for this to fail */
-		drm_dp_add_payload_part1(mst_mgr, mst_state, new_payload);
-	} else {
-		/* construct old payload by VCPI*/
-		dm_helpers_construct_old_payload(stream->link, mst_state->pbn_div,
-						new_payload, &old_payload);
-		target_payload = &old_payload;
+		drm_dp_add_payload_part1(mst_mgr, mst_state, payload);
+	else
 
-		drm_dp_remove_payload_part1(mst_mgr, mst_state, new_payload);
-	}
+		drm_dp_remove_payload_part1(mst_mgr, mst_state, payload);
 
 	/* mst_mgr->->payloads are VC payload notify MST branch using DPCD or
 	 * AUX message. The sequence is slot 1-63 allocated sequence for each
 	 * stream. AMD ASIC stream slot allocation should follow the same
 	 * sequence. copy DRM MST allocation to dc
 	 */
-	fill_dc_mst_payload_table_from_drm(stream->link, enable, target_payload, proposed_table);
+	fill_dc_mst_payload_table_from_drm(stream->link, enable, payload, proposed_table);
 
 	return true;
 }
@@ -343,7 +302,7 @@ bool dm_helpers_dp_mst_send_payload_allocation(
 	struct amdgpu_dm_connector *aconnector;
 	struct drm_dp_mst_topology_state *mst_state;
 	struct drm_dp_mst_topology_mgr *mst_mgr;
-	struct drm_dp_mst_atomic_payload *new_payload, *old_payload;
+	struct drm_dp_mst_atomic_payload *payload;
 	enum mst_progress_status set_flag = MST_ALLOCATE_NEW_PAYLOAD;
 	enum mst_progress_status clr_flag = MST_CLEAR_ALLOCATED_PAYLOAD;
 	int ret = 0;
@@ -356,20 +315,17 @@ bool dm_helpers_dp_mst_send_payload_allocation(
 	mst_mgr = &aconnector->mst_root->mst_mgr;
 	mst_state = to_drm_dp_mst_topology_state(mst_mgr->base.state);
 
-	new_payload = drm_atomic_get_mst_payload_state(mst_state, aconnector->mst_output_port);
+	payload = drm_atomic_get_mst_payload_state(mst_state, aconnector->mst_output_port);
 
 	if (!enable) {
 		set_flag = MST_CLEAR_ALLOCATED_PAYLOAD;
 		clr_flag = MST_ALLOCATE_NEW_PAYLOAD;
 	}
 
-	if (enable) {
-		ret = drm_dp_add_payload_part2(mst_mgr, mst_state->base.state, new_payload);
-	} else {
-		dm_helpers_construct_old_payload(stream->link, mst_state->pbn_div,
-						 new_payload, old_payload);
-		drm_dp_remove_payload_part2(mst_mgr, mst_state, old_payload, new_payload);
-	}
+	if (enable)
+		ret = drm_dp_add_payload_part2(mst_mgr, mst_state->base.state, payload);
+	else
+		drm_dp_remove_payload_part2(mst_mgr, mst_state, payload);
 
 	if (ret) {
 		amdgpu_dm_set_mst_status(&aconnector->mst_status,
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 8f4034d556c4..0a29306059af 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3382,8 +3382,7 @@ EXPORT_SYMBOL(drm_dp_remove_payload_part1);
  * drm_dp_remove_payload_part2() - Remove an MST payload locally
  * @mgr: Manager to use.
  * @mst_state: The MST atomic state
- * @old_payload: The payload with its old state
- * @new_payload: The payload with its latest state
+ * @payload: The payload with its latest state
  *
  * Updates the starting time slots of all other payloads which would have been shifted towards
  * the start of the payload ID table as a result of removing a payload. Driver should call this
@@ -3392,25 +3391,36 @@ EXPORT_SYMBOL(drm_dp_remove_payload_part1);
  */
 void drm_dp_remove_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
 				 struct drm_dp_mst_topology_state *mst_state,
-				 const struct drm_dp_mst_atomic_payload *old_payload,
-				 struct drm_dp_mst_atomic_payload *new_payload)
+				 struct drm_dp_mst_atomic_payload *payload)
 {
 	struct drm_dp_mst_atomic_payload *pos;
+	u8 time_slots_to_remove;
+	u8 next_payload_vc_start = mgr->next_start_slot;
+
+	/* Find the current allocated time slot number of the payload */
+	list_for_each_entry(pos, &mst_state->payloads, next) {
+		if (pos != payload &&
+		    pos->vc_start_slot > payload->vc_start_slot &&
+		    pos->vc_start_slot < next_payload_vc_start)
+			next_payload_vc_start = pos->vc_start_slot;
+	}
+
+	time_slots_to_remove = next_payload_vc_start - payload->vc_start_slot;
 
 	/* Remove local payload allocation */
 	list_for_each_entry(pos, &mst_state->payloads, next) {
-		if (pos != new_payload && pos->vc_start_slot > new_payload->vc_start_slot)
-			pos->vc_start_slot -= old_payload->time_slots;
+		if (pos != payload && pos->vc_start_slot > payload->vc_start_slot)
+			pos->vc_start_slot -= time_slots_to_remove;
 	}
-	new_payload->vc_start_slot = -1;
+	payload->vc_start_slot = -1;
 
 	mgr->payload_count--;
-	mgr->next_start_slot -= old_payload->time_slots;
+	mgr->next_start_slot -= time_slots_to_remove;
 
-	if (new_payload->delete)
-		drm_dp_mst_put_port_malloc(new_payload->port);
+	if (payload->delete)
+		drm_dp_mst_put_port_malloc(payload->port);
 
-	new_payload->payload_allocation_status = DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
+	payload->payload_allocation_status = DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
 }
 EXPORT_SYMBOL(drm_dp_remove_payload_part2);
 /**
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index b30d9d597420..aca0d9e5a54f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -591,12 +591,8 @@ static void intel_mst_post_disable_dp(struct intel_atomic_state *state,
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
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
@@ -619,8 +615,7 @@ static void intel_mst_post_disable_dp(struct intel_atomic_state *state,
 
 	wait_for_act_sent(encoder, old_crtc_state);
 
-	drm_dp_remove_payload_part2(&intel_dp->mst_mgr, new_mst_state,
-				    old_payload, new_payload);
+	drm_dp_remove_payload_part2(&intel_dp->mst_mgr, new_mst_state, new_payload);
 
 	intel_ddi_disable_transcoder_func(old_crtc_state);
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index bba01fa0780c..0d4286d0d872 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -889,17 +889,13 @@ nv50_msto_cleanup(struct drm_atomic_state *state,
 	struct nouveau_drm *drm = nouveau_drm(msto->encoder.dev);
 	struct drm_dp_mst_atomic_payload *new_payload =
 		drm_atomic_get_mst_payload_state(new_mst_state, msto->mstc->port);
-	struct drm_dp_mst_topology_state *old_mst_state =
-		drm_atomic_get_old_mst_topology_state(state, mgr);
-	const struct drm_dp_mst_atomic_payload *old_payload =
-		drm_atomic_get_mst_payload_state(old_mst_state, msto->mstc->port);
 
 	NV_ATOMIC(drm, "%s: msto cleanup\n", msto->encoder.name);
 
 	if (msto->disabled) {
 		msto->mstc = NULL;
 		msto->disabled = false;
-		drm_dp_remove_payload_part2(mgr, new_mst_state, old_payload, new_payload);
+		drm_dp_remove_payload_part2(mgr, new_mst_state, new_payload);
 	} else if (msto->enabled) {
 		drm_dp_add_payload_part2(mgr, state, new_payload);
 		msto->enabled = false;
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index 4429d3b1745b..3f8ad28c77b1 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -853,12 +853,11 @@ int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
 			     struct drm_atomic_state *state,
 			     struct drm_dp_mst_atomic_payload *payload);
 void drm_dp_remove_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
-				 struct drm_dp_mst_topology_state *mst_state,
-				 struct drm_dp_mst_atomic_payload *payload);
+				  struct drm_dp_mst_topology_state *mst_state,
+				  struct drm_dp_mst_atomic_payload *payload);
 void drm_dp_remove_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
-				 struct drm_dp_mst_topology_state *mst_state,
-				 const struct drm_dp_mst_atomic_payload *old_payload,
-				 struct drm_dp_mst_atomic_payload *new_payload);
+				  struct drm_dp_mst_topology_state *mst_state,
+				  struct drm_dp_mst_atomic_payload *payload);
 
 int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr);
 
-- 
2.37.3

