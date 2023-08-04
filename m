Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 797AF76F9FD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 08:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52C110E25B;
	Fri,  4 Aug 2023 06:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BECD10E249;
 Fri,  4 Aug 2023 06:22:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xo2ZnTICBynuafwcEF7MVeirY3T0uHgZSpI9mgAEWXA9/lUEt3jUywDUXziyVLD13JH4L8qMM8GsdRdw2sx9Wj+zgp2+l93jjuoAifnNILaI7Qmr27/hOUo4Af8nlN1dJEgdeN2Q7TNEHtMO4m4we065b9ZTv3hkk1CXniKk7kaz1oAedHhumNtQDc/chcYnV1+17KZMr5MZxwncs/7VBFH6LO4FC7QdM7z0WTeWXvDkcTkW7ev7SaZKOSYBsRj9nAmQB9K2jAcZ0HAa1H5D8DVB6mxZ8WuFh2K+RunHKVvXkMPysd2DQ9QYVgptBV80RxqCs7wEFcLGksxdT0KFkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cg98hOyAvU4RkhcN5LARaYbAVj0AzIp/Lf/+Z5zSM2M=;
 b=PMHX57R+pP4CXLssyQZqAH8qaV6IK1nKLEeqsYqu3mX9Q3+lcszswPWi7aOunvngtoPoxnx/Fh0E+FvM6tQ4mWfEmInAOnUeOXsA6myl+lH7/C2wHFrFyaqNX9ze6gTOF62Jov1sAxJWCjaoefcalBBFCnjAkPdX85LPU+U7lITRIfC6tjr6eBtt+kf93PklPrm2Hs6W/sumZrC69xYS7nr4PGc2pW+VKCGAvsA/zscM+lkNmcWo4Bv9DFWxvOHU1hKN7ZcL5nWC6pJHKcF2pBs3JbKqKIl0x2/1cVvGPhllXfKzLr33G0BQWrylqk3B+cXtspUlv0KjhJ4mtHK16w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cg98hOyAvU4RkhcN5LARaYbAVj0AzIp/Lf/+Z5zSM2M=;
 b=QPFB3VIB5SZQ3VaWZprmUYeUdp8J1b4biDW1ebe3pwNEXhZ2GayyyocPOx9omBI4xsY0rmiN8BtlypKMZ0z+IkqEHn43GdRwqu+vsOAKxsms4HbdfEBAqjGLKHZoLZtFHUUILYlqyclELMl2/jLMMsoJjS2qS9Powe/2SnZlnwc=
Received: from PH7PR10CA0024.namprd10.prod.outlook.com (2603:10b6:510:23d::13)
 by PH7PR12MB5831.namprd12.prod.outlook.com (2603:10b6:510:1d6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 06:21:19 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:510:23d:cafe::a7) by PH7PR10CA0024.outlook.office365.com
 (2603:10b6:510:23d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21 via Frontend
 Transport; Fri, 4 Aug 2023 06:21:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.20 via Frontend Transport; Fri, 4 Aug 2023 06:21:19 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 01:21:16 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 01:21:15 -0500
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 4 Aug 2023 01:21:11 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/mst: adjust the function drm_dp_remove_payload_part2()
Date: Fri, 4 Aug 2023 14:20:29 +0800
Message-ID: <20230804062029.5686-4-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230804062029.5686-1-Wayne.Lin@amd.com>
References: <20230804062029.5686-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|PH7PR12MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: 106afb4b-04e7-46ad-e1c9-08db94b30451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: diSCp1Qx19BlHeRxxk0uA8tTfCs1izzUpj97Vw1Hmwk2XnH94p1Vpjl75s0AmRvYkFVCeRiaNxdpUjG3Xv1hjO7pffEqSkSgD0LMCNQ4QAnp0Z2366tiPhdHtNyBBjReeymcljRbrjNa9o/A17D6K02zAbz87hYoRSNqUm6Y8VZGBWIdM+0GVhwUzU0VljtAW2E/5Foaiho+/K9v4UKPvvwpxbCi7UBVFDhsen/gsvTu5c5Q/ZSpLoFcvSLn5yKPATEvpmY5nKTiWl8LHsjUDMj8FJaQ3FUQSNsrcMgNdGG9QcvCxMvfv/5E4dAb2B5bqUTIUh7ddkI6bLP3jE6Yak6x+wca+iEt+SzciHOBPOCvsErsje7k2eJLY7je4FOMjmBcy6ojR+Xjivt1+u5fYCl5sak1vDCIyMJKTQ7jzCApIkatSqEkTQmQS/1uhWUTnx2rxFzFuX0rxlBq3a+Yb75CwBSLwz5O1T5+/CMHCjoDZReq+Aa2H+HUf4bXzgllRH/YeEoKpczHJ+rHzVBa/4deBD/eIzUAZdZj3Hy855A71PEJclt4Uq7n3//JKbA/IyDD9MfpKr+foIPqAgZzjhihTIKzH9JU8i265UmXF7Lq0IPQjSCiB34k8dYmp7JUcoiSO1tf1fGH3VkxYbMnA2Jt7YQSMmsDrbiEbozVXV3HRKaJWtTu0WYt/8XIG98ArK7J/wn7yUYgsFBfMMKzog==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(186006)(451199021)(1800799003)(82310400008)(36840700001)(46966006)(7696005)(6666004)(86362001)(1076003)(26005)(36860700001)(336012)(426003)(2616005)(36756003)(83380400001)(47076005)(356005)(81166007)(70586007)(70206006)(4326008)(2906002)(30864003)(316002)(5660300002)(8936002)(8676002)(508600001)(54906003)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 06:21:19.4651 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 106afb4b-04e7-46ad-e1c9-08db94b30451
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5831
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
index 9ad509279b0a..e852da686c26 100644
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
@@ -262,27 +228,20 @@ bool dm_helpers_dp_mst_write_payload_allocation_table(
 
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
 	 * sequence. copy DRM MST allocation to dc */
-	fill_dc_mst_payload_table_from_drm(stream->link, enable, target_payload, proposed_table);
+	fill_dc_mst_payload_table_from_drm(stream->link, enable, payload, proposed_table);
 
 	return true;
 }
@@ -341,7 +300,7 @@ bool dm_helpers_dp_mst_send_payload_allocation(
 	struct amdgpu_dm_connector *aconnector;
 	struct drm_dp_mst_topology_state *mst_state;
 	struct drm_dp_mst_topology_mgr *mst_mgr;
-	struct drm_dp_mst_atomic_payload *new_payload, *old_payload;
+	struct drm_dp_mst_atomic_payload *payload;
 	enum mst_progress_status set_flag = MST_ALLOCATE_NEW_PAYLOAD;
 	enum mst_progress_status clr_flag = MST_CLEAR_ALLOCATED_PAYLOAD;
 	int ret = 0;
@@ -354,20 +313,17 @@ bool dm_helpers_dp_mst_send_payload_allocation(
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
index e04f87ff755a..4270178f95f6 100644
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
index 5f73cdabe7a1..91750c1dfc48 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -583,12 +583,8 @@ static void intel_mst_post_disable_dp(struct intel_atomic_state *state,
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
@@ -611,8 +607,7 @@ static void intel_mst_post_disable_dp(struct intel_atomic_state *state,
 
 	wait_for_act_sent(encoder, old_crtc_state);
 
-	drm_dp_remove_payload_part2(&intel_dp->mst_mgr, new_mst_state,
-				    old_payload, new_payload);
+	drm_dp_remove_payload_part2(&intel_dp->mst_mgr, new_mst_state, new_payload);
 
 	intel_ddi_disable_transcoder_func(old_crtc_state);
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 6f1b7fcb98e6..63e2a286fffc 100644
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

