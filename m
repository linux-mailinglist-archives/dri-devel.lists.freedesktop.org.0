Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC7A7B9BB7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 10:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED6D10E3D7;
	Thu,  5 Oct 2023 08:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B63710E1BB;
 Thu,  5 Oct 2023 08:04:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RE6abqETxOd35oWgX1LX9mlzY/ICtWcad8lcVWAiYcudFvK2j/09/i365U41X9J0U50jZQldUCyofY8Kfycxv+kE7XLJHQt83ykvYAjBAkvfEGul9M6WfjCRZmPLw9x0JGiizq2E8+DVEGDh9PV/Qk5/VJmfqF2jU9jHzTLqI+PkW4sb5lpWeOw4hc2o10arubQDk03PeTA4Y6u/mSi8yue0vbs65Q3s+zbpyc44s1DfozBlfWZnISHiiCFNL7vNGaYQRFQp9TPUwDjul0z6PKcfou9cp2k3ADFLW3QtMsrkE2FItq5JWZ3GZ64OJaBSmmj+WnXMgcgnjPztcB5+Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7maLj3l09Zg46TkyBmTd4Ys1709Q7bkIOu+gaTi18E=;
 b=HV/vgj5jsUGYuLT35D4TSjjWdieavIq2PaaajQsk1ObTpESAh90Uqv2tbpGHBJOOnaay2VH7tF0Ljq6fetBsz93kylt+1ekUWelHWW4Yl1HcBlpAu6/Ockcp3hcL7suwahholijIfp8PE7dcZ6fpYaBTRX28TAs+U0Rn9w2hbRNDGmfeUAk+X/HuHMr4VuNdNTwD8ZJzBAdZiH0es2dSKa++SG6SytNC/uRBYy6uM/ctvd+yLz3I6H/6fcjQflDAxGEkJTe8HRp4uq2qouNGf5q5Sw2NJ9ifmF88AnrZYw5Qz62I180ezqVu6os9WsagGk0fnYJAlxKwOQmmOdWFLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7maLj3l09Zg46TkyBmTd4Ys1709Q7bkIOu+gaTi18E=;
 b=FOM9ZjaZnrKPH3U4ZO4NCoYSYODkmkWxIlc0sfZ49+wScTbCPHNWhhsSwshXmHXAy7VBmziSQ0SeYpVJ00/J5qA2lKhQ1mFMrkjIarDl4cwfKznh9tH+vDWq0ie9q2ANbZwkUxzzfrocam/zFN923mSWvPeeQOGmB9L4KvG3OiI=
Received: from MW4PR04CA0249.namprd04.prod.outlook.com (2603:10b6:303:88::14)
 by MW5PR12MB5682.namprd12.prod.outlook.com (2603:10b6:303:19f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Thu, 5 Oct
 2023 08:04:17 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:303:88:cafe::59) by MW4PR04CA0249.outlook.office365.com
 (2603:10b6:303:88::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.26 via Frontend
 Transport; Thu, 5 Oct 2023 08:04:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6863.20 via Frontend Transport; Thu, 5 Oct 2023 08:04:17 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 5 Oct
 2023 03:04:15 -0500
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 5 Oct 2023 03:04:13 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: Fix mst hub unplug warning
Date: Thu, 5 Oct 2023 16:04:05 +0800
Message-ID: <20231005080405.169841-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|MW5PR12MB5682:EE_
X-MS-Office365-Filtering-Correlation-Id: 672d20d1-4fc6-4fd7-ada0-08dbc579ac26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iouy4sJiajrubAYK/UvXcva9rTPGdkq4JkM/MkG8p9UV09RQjg1ZvoliIRsgmoFsY+0dl9iWKG/P53j4B2n2S5mBifrD36wukNvnBRp03eBefeHOARBdEafjDknaOREnS0LrPK+cvLqn3E+QMagyR+/9aecNwCGtZ6k1lNeQomwyq8qcIVGo9bjOOSH2Za7SgthNBasgMsu2Z5Pt8neq8R+jVRnQcV9PN0rpxWh3XI9sgqrt1daTy+AaK0X+9azEiN2giQlwOc5t3LJP9FzmMFN31u+v971ygG40sYbAotFPA4o2e6wOZg9K5tJ2ZWCw99M588Nw6UHgMMbRn0Jv/tSyefiK+VM7vPdaJwSdTcStXHlOR5SuQmAfiF10mwFhHVoMD3GFg1wALfmv8iC3o02QP6P5wdC1Ab4tTOoVUqdh9sdHoM+iYkhNgMYwXa8yWIXVXG/c0HfiAsCzL3QN0kpSZDz6pPKpyGO6PGEo7Ai471JkO5WGOUpsSYOPOJbt/EKThbnFnJaMfujWbclrkJhQRPjINp8DL8qhdaNRkeSxIfkTPOy55+114fcUIC8TXOXqx2XhWerEV8oqoAM0XtORc/y0Sy2oQYBMg4W+2s5I3EFmCrqWsLmpcqwrtHcRZ6ymD3kw9l7VGTe/+qFWPWaIThdHgESpPmA4Kgry768qdY8MGW5Ugs4xrSx+yBHXhkM/i9Nu2+l8E8Bml+H5wuWLjPprBIwjUS6GJN/rXirrNG6wCUUqrIqQA3+56vzmWw1w5Z/aWLmooEn+PaWEsA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(136003)(39860400002)(396003)(376002)(230922051799003)(186009)(451199024)(82310400011)(1800799009)(64100799003)(46966006)(36840700001)(40470700004)(2906002)(70586007)(36756003)(316002)(70206006)(47076005)(54906003)(86362001)(41300700001)(8676002)(5660300002)(8936002)(6666004)(4326008)(36860700001)(450100002)(83380400001)(110136005)(336012)(426003)(40460700003)(478600001)(26005)(1076003)(2616005)(81166007)(82740400003)(356005)(7696005)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 08:04:17.1425 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 672d20d1-4fc6-4fd7-ada0-08dbc579ac26
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5682
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
Cc: jerry.zuo@amd.com, Wayne Lin <Wayne.Lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
Unplug mst hub will cause warning. That's because
dm_helpers_construct_old_payload() is changed to be called after
payload removement from dc link.

In dm_helpers_construct_old_payload(), We refer to the vcpi in
payload allocation table of dc link to construct the old payload
and payload is no longer in the table when we call the function
now.

[How]
Refer to the mst_state to construct the number of time slot for old
payload now. Note that dm_helpers_construct_old_payload() is just
a quick workaround before and we are going to abandon it soon.

Fixes: 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload allocation/removement")
Reviewed-by: Jerry Zuo <jerry.zuo@amd.com>
Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 38 +++++++++----------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index baf7e5254fb3..2f94bcf128c0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -204,15 +204,16 @@ void dm_helpers_dp_update_branch_info(
 {}
 
 static void dm_helpers_construct_old_payload(
-			struct dc_link *link,
-			int pbn_per_slot,
+			struct drm_dp_mst_topology_mgr *mgr,
+			struct drm_dp_mst_topology_state *mst_state,
 			struct drm_dp_mst_atomic_payload *new_payload,
 			struct drm_dp_mst_atomic_payload *old_payload)
 {
-	struct link_mst_stream_allocation_table current_link_table =
-									link->mst_stream_alloc_table;
-	struct link_mst_stream_allocation *dc_alloc;
-	int i;
+	struct drm_dp_mst_atomic_payload *pos;
+	int pbn_per_slot = mst_state->pbn_div;
+	u8 next_payload_vc_start = mgr->next_start_slot;
+	u8 payload_vc_start = new_payload->vc_start_slot;
+	u8 allocated_time_slots;
 
 	*old_payload = *new_payload;
 
@@ -221,20 +222,17 @@ static void dm_helpers_construct_old_payload(
 	 * struct drm_dp_mst_atomic_payload are don't care fields
 	 * while calling drm_dp_remove_payload_part2()
 	 */
-	for (i = 0; i < current_link_table.stream_count; i++) {
-		dc_alloc =
-			&current_link_table.stream_allocations[i];
-
-		if (dc_alloc->vcp_id == new_payload->vcpi) {
-			old_payload->time_slots = dc_alloc->slot_count;
-			old_payload->pbn = dc_alloc->slot_count * pbn_per_slot;
-			break;
-		}
+	list_for_each_entry(pos, &mst_state->payloads, next) {
+		if (pos != new_payload &&
+		    pos->vc_start_slot > payload_vc_start &&
+		    pos->vc_start_slot < next_payload_vc_start)
+			next_payload_vc_start = pos->vc_start_slot;
 	}
 
-	/* make sure there is an old payload*/
-	ASSERT(i != current_link_table.stream_count);
+	allocated_time_slots = next_payload_vc_start - payload_vc_start;
 
+	old_payload->time_slots = allocated_time_slots;
+	old_payload->pbn = allocated_time_slots * pbn_per_slot;
 }
 
 /*
@@ -272,8 +270,8 @@ bool dm_helpers_dp_mst_write_payload_allocation_table(
 		drm_dp_add_payload_part1(mst_mgr, mst_state, new_payload);
 	} else {
 		/* construct old payload by VCPI*/
-		dm_helpers_construct_old_payload(stream->link, mst_state->pbn_div,
-						new_payload, &old_payload);
+		dm_helpers_construct_old_payload(mst_mgr, mst_state,
+						 new_payload, &old_payload);
 		target_payload = &old_payload;
 
 		drm_dp_remove_payload_part1(mst_mgr, mst_state, new_payload);
@@ -366,7 +364,7 @@ bool dm_helpers_dp_mst_send_payload_allocation(
 	if (enable) {
 		ret = drm_dp_add_payload_part2(mst_mgr, mst_state->base.state, new_payload);
 	} else {
-		dm_helpers_construct_old_payload(stream->link, mst_state->pbn_div,
+		dm_helpers_construct_old_payload(mst_mgr, mst_state,
 						 new_payload, &old_payload);
 		drm_dp_remove_payload_part2(mst_mgr, mst_state, &old_payload, new_payload);
 	}
-- 
2.37.3

