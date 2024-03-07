Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C08AC874833
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 07:30:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD8D10FB8B;
	Thu,  7 Mar 2024 06:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IYhvMHvv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414CB10F067;
 Thu,  7 Mar 2024 06:30:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2cXJ+m0syPutltptQdDI0fkaJTTFZawwp4hRSUCj35eQ6js4THeV1yb7G/+kmqhUurRVLpitSfzIvhEndl8/e/kbAVyD1GWXktSfyr4cfioviMPzuEpiO+5rMI/+TWUt5/2yfkCbVQWUzizhi8BXbrgDwI7ex6gvZwGhWXMo610hrm9KQODvJmJASky4D5+FbI4SE+0/QtH3yxOqrswwN1h8Ky2Nnab2ec0MwoeOxc6i5K1SkGTQ8/1+vNXh383OjvARKvp3PCzryu2gnV0NKxfFmaHxpsVceNw6M3j79UCraONZNk6bMR1BLHw/wBEB47RzwQwVFCVJdy4bbB/pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtLSn2+SuLBTcsOr9G7Up5ReL8JqH1qpiX1afZ+NghA=;
 b=F5WGA+11TfYJi0ppAQ7F8URzic+H64v/8NHifOUWui0j26k2XoXt2mOUENWM2afniZA36CtekAaRorh9v+VuKxUFe6AUbR6vfgZs3nps9ftutsHntQiPUA9Tbwexor/DLXspfS1qp9kClod9mMql08mD7cisUyq/yzSWy3mjbbtWzqzbSekx4qJ7EsvaXIl1RJmT3QHPmqq5g1DE2cvN3/DK0Y88H1mPmPcLNMUVM/fGa6F6NHbgSfYGtewZpIVexHu4E4h1hRwngOchhTNtkjhAdxsPGUc8pb/Ie83UuOJYs5FcsXodvQbgO5Y9rsFtyLDW0cvkRRWu+pwrKSb0hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtLSn2+SuLBTcsOr9G7Up5ReL8JqH1qpiX1afZ+NghA=;
 b=IYhvMHvvv6S4JZZf0Z2KqOAh4DZNHLRbUxMpXwr52WIMzDiDX8rDNMPvb1DisX13wd7jOYtmKNJPkOX4R3NQC9NcZNcxP+qrn/sOQ0YiIkLFIJU4fxxFv4jcHexc5LbwkiNOxuPcxkrmd+5bV5WNp6csXxj2X6u/lqu6uusyqOU=
Received: from SA0PR11CA0201.namprd11.prod.outlook.com (2603:10b6:806:1bc::26)
 by SJ2PR12MB7893.namprd12.prod.outlook.com (2603:10b6:a03:4cc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Thu, 7 Mar
 2024 06:30:24 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:806:1bc:cafe::6a) by SA0PR11CA0201.outlook.office365.com
 (2603:10b6:806:1bc::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26 via Frontend
 Transport; Thu, 7 Mar 2024 06:30:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Thu, 7 Mar 2024 06:30:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 00:30:23 -0600
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Mar 2024 00:30:20 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
CC: <lyude@redhat.com>, <harry.wentland@amd.com>, <imre.deak@intel.com>,
 "Wayne Lin" <Wayne.Lin@amd.com>, =?UTF-8?q?Leon=20Wei=C3=9F?=
 <leon.weiss@ruhr-uni-bochum.de>, <stable@vger.kernel.org>,
 <regressions@lists.linux.dev>
Subject: [PATCH] drm/mst: Fix NULL pointer dereference at
 drm_dp_add_payload_part2
Date: Thu, 7 Mar 2024 14:29:57 +0800
Message-ID: <20240307062957.2323620-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: Wayne.Lin@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|SJ2PR12MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: afd8a756-f805-4b79-5db6-08dc3e701240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rVPnLV3MKWxW3IDagIoKoWIKstipolT4k1q7eD7Fga7gOMBNuJi/OGjbVpjCgBDZpBVR8SCMqoAki4acashjrpp0LpLuVcE/gY1HVyZrERwWimVeRPLmi5Vfau1iMvbRisKudgyJMfe0a2iXPa7bXq8JthKi3EsaUka/jCBXgi4dpbzTTeXJ3HKo+/mSmuf3qcP+SnXK1Meyom1Ymm8EmWLAr7ilABNzCBR2T+WJeKV23mwy15ulZnI56GHOm79GsnYTYO4wPRmES+VRhXLhQE1DBsAESxNXvdug/W1rsGxpM1adCD7uNFTZB7PcpQxGZQRLYdbHgVjJ2NJ1s/NBAIeJYc+dnH7zjQqExeyFlYdn6afzas5zG14WaPjbecXTsEXa5Nd+QG3BEAgmG8UNZdyeDzYI9Su6f49ozT8Ul5Qi/T4iAzn6ILb6jfy4jzO5ZlSnrCtepcUwHcxXlcYnhQGDbEVTiQcgIGoES4st5vweNseK5JjKE1Vc6oVm+1CKJjYZvhUEeWGWfRBiF64vHb0CIYFMJd/L8V5DXR0eo2guB3bjmM3WLVO18IZ51EmHIM9j52B4RH8S7DPXXNm+o9N3FTKojYBnlBKFojBa10QZlnlNDuIEpeNEGp0oRG0voEAi6ayljUGuPNTo3hANZP8ZfrLDRjtAPIIlKYGxVUC49mB7nf681gLVpDdGxz9yBySNhSSn9FpKIfysXZsEww==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(376005)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 06:30:24.2610 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afd8a756-f805-4b79-5db6-08dc3e701240
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7893
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

[Why]
Commit:
- commit 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload allocation/removement")
accidently overwrite the commit
- commit 54d217406afe ("drm: use mgr->dev in drm_dbg_kms in drm_dp_add_payload_part2")
which cause regression.

[How]
Recover the original NULL fix and remove the unnecessary input parameter 'state' for
drm_dp_add_payload_part2().

Fixes: 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload allocation/removement")
Reported-by: Leon Weiß <leon.weiss@ruhr-uni-bochum.de>
Link: https://lore.kernel.org/r/38c253ea42072cc825dc969ac4e6b9b600371cc8.camel@ruhr-uni-bochum.de/
Cc: lyude@redhat.com
Cc: imre.deak@intel.com
Cc: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c             | 4 +---
 drivers/gpu/drm/i915/display/intel_dp_mst.c               | 2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c                   | 2 +-
 include/drm/display/drm_dp_mst_helper.h                   | 1 -
 5 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index c27063305a13..2c36f3d00ca2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -363,7 +363,7 @@ void dm_helpers_dp_mst_send_payload_allocation(
 	mst_state = to_drm_dp_mst_topology_state(mst_mgr->base.state);
 	new_payload = drm_atomic_get_mst_payload_state(mst_state, aconnector->mst_output_port);
 
-	ret = drm_dp_add_payload_part2(mst_mgr, mst_state->base.state, new_payload);
+	ret = drm_dp_add_payload_part2(mst_mgr, new_payload);
 
 	if (ret) {
 		amdgpu_dm_set_mst_status(&aconnector->mst_status,
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 03d528209426..95fd18f24e94 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3421,7 +3421,6 @@ EXPORT_SYMBOL(drm_dp_remove_payload_part2);
 /**
  * drm_dp_add_payload_part2() - Execute payload update part 2
  * @mgr: Manager to use.
- * @state: The global atomic state
  * @payload: The payload to update
  *
  * If @payload was successfully assigned a starting time slot by drm_dp_add_payload_part1(), this
@@ -3430,14 +3429,13 @@ EXPORT_SYMBOL(drm_dp_remove_payload_part2);
  * Returns: 0 on success, negative error code on failure.
  */
 int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
-			     struct drm_atomic_state *state,
 			     struct drm_dp_mst_atomic_payload *payload)
 {
 	int ret = 0;
 
 	/* Skip failed payloads */
 	if (payload->payload_allocation_status != DRM_DP_MST_PAYLOAD_ALLOCATION_DFP) {
-		drm_dbg_kms(state->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
+		drm_dbg_kms(mgr->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
 			    payload->port->connector->name);
 		return -EIO;
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 53aec023ce92..2fba66aec038 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1160,7 +1160,7 @@ static void intel_mst_enable_dp(struct intel_atomic_state *state,
 	if (first_mst_stream)
 		intel_ddi_wait_for_fec_status(encoder, pipe_config, true);
 
-	drm_dp_add_payload_part2(&intel_dp->mst_mgr, &state->base,
+	drm_dp_add_payload_part2(&intel_dp->mst_mgr,
 				 drm_atomic_get_mst_payload_state(mst_state, connector->port));
 
 	if (DISPLAY_VER(dev_priv) >= 12)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 0c3d88ad0b0e..88728a0b2c25 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -915,7 +915,7 @@ nv50_msto_cleanup(struct drm_atomic_state *state,
 		msto->disabled = false;
 		drm_dp_remove_payload_part2(mgr, new_mst_state, old_payload, new_payload);
 	} else if (msto->enabled) {
-		drm_dp_add_payload_part2(mgr, state, new_payload);
+		drm_dp_add_payload_part2(mgr, new_payload);
 		msto->enabled = false;
 	}
 }
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index 9b19d8bd520a..6c9145abc7e2 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -851,7 +851,6 @@ int drm_dp_add_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
 			     struct drm_dp_mst_topology_state *mst_state,
 			     struct drm_dp_mst_atomic_payload *payload);
 int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
-			     struct drm_atomic_state *state,
 			     struct drm_dp_mst_atomic_payload *payload);
 void drm_dp_remove_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
 				 struct drm_dp_mst_topology_state *mst_state,
-- 
2.37.3

