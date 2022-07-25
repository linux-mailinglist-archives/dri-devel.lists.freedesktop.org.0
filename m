Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB5757FE95
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 13:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3C999F90;
	Mon, 25 Jul 2022 11:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56EB9A0EF;
 Mon, 25 Jul 2022 11:43:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMN5ZpW29gQ+rt6J/7EbgezqU86WLno5GIC2P2sQeHD2iKepxfZe0v4yoSLz7Rsbsk39Idak6KjCdsYcvgf2ijLkiBDc0H/OsVS/E2epw+W/ci54P/7w3rbqzPMwQWNM5XRlAlpvLPBMyo8lubjwFqY6d2Rm//wRhEtsA5rZUtGYIpOmTp00NDKrGE0cDn2h6MBR7AasGYd7gpI5kFOZBlsffHWTvrQ4fn6P1xIQppWPD8OBHqUTVRpw5dxTlk5ZkX/3btT7cBTcI4rUtn4z44wbBegYglTSCNHffWw83KO/2kCLdgcq9ysp40WOnfPsmx4Nsloz1kltc7dBNMP09A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FePSpMgBi9CXeN/BwcWyhiS0kyWrCsGcy44aOngy7HE=;
 b=W1/2jsk4N9byx8gVLKEgZxL1dy64zClHNWAeZt+sE+9WfN8DYaCJGANz7KwX4ky2Md+dnMNox9svmWjL75Q57Jo1YgsjXSbBEcmVjkMQD2LobYEbv3tlhHkeWproGdbTFOeRNLhfx9j758E5omvWNlO2DsoF4L5tBkVc/S5sY1RHGVmzqg8WwGq0R3+Uj11CbOzXhQ5maL/M2djc2hHGhssukCyaX+GSyxURQhOsIw350KNlFTHJ+tEXtC43DnE31sDWTuN+Wr24fLoXpCf+F7YUj1JkLipsIEVJPCrBuYpGN+uRRE/uplTMcIV2NyabFzGwPWE+gng8UqvgE3WFdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FePSpMgBi9CXeN/BwcWyhiS0kyWrCsGcy44aOngy7HE=;
 b=NkVaIySzzwiwtPNywIegkjdDBlBsRbw/YspcChZVxDMQv+DktS0BaDziDLg8JIuqagzKcm/gXwaxxo2RN0iaNuaqCThcyGdLGMzQavGA5IkOYReOyt0SiiHcaDh5ywz+FgEMleQxL8owUmlJNNtxt7suq9lmVqPqRaGW8CBRFFc=
Received: from BN9PR03CA0304.namprd03.prod.outlook.com (2603:10b6:408:112::9)
 by SN7PR12MB6863.namprd12.prod.outlook.com (2603:10b6:806:264::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Mon, 25 Jul
 2022 11:43:41 +0000
Received: from BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:112:cafe::ab) by BN9PR03CA0304.outlook.office365.com
 (2603:10b6:408:112::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.19 via Frontend
 Transport; Mon, 25 Jul 2022 11:43:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT064.mail.protection.outlook.com (10.13.176.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Mon, 25 Jul 2022 11:43:41 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 25 Jul 2022 06:43:37 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v2 6/6] drm/ttm: Switch to using the new res callback
Date: Mon, 25 Jul 2022 04:42:40 -0700
Message-ID: <20220725114240.4844-6-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220725114240.4844-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220725114240.4844-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88d5d355-acba-402a-cf1a-08da6e32ebee
X-MS-TrafficTypeDiagnostic: SN7PR12MB6863:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yJkApc1zNIwgzgW8TfY7bl+i283Ckw/aeH4o+qxry24WdG3N2tr+uBzIIH+30vqGWApNrxdlNQgLeJkdFSKC6nj0pGW9qJ/1ArDKLh7gV4P69dWyOGtVFjBuRqnViwSeFNusDLxJmbF/+P2IW76L9E9rmtS616IF2yV1PRPGtTWUz85ZOBThCWE2Q3FL208p9wbCnv7pvpEgA3y3qb2L2yxswBJ9pYZspH79B5Jrrd34Csrj0CaHTgU/blFc1NoNeAR/j29QDATzgovatps/7S2NfxWJEow6wb58tccXr6zftUHCeUvlhBF+JqUUPxhffjGKmsENU33kHMvzawM7p3ZGqvajTJOvBta4RHjeegaKN6dTUpEE22PCgrW13Yo2myILtnGBut657uzEP/psclNwILup3uw049iM8jriBFCZ67NEZhKx1WTkpK7vElODjSN8y+q2xvgxqKgi5IkEH4i33MKr+cI7r3GHkPQF/AGyzGQXcPxCWzLgTLquRAeC8uoEP3RyQiaNlPN+Y33/Az+p2jCaN9s/4RRrGuP5AO9Q2V9LbZ1iY177wFXzMRMVESO9gfwizFxdv+Su8Fezjq5lS3n7gIwySw0JyNOWk6/95sAkaawksYknqsZLtXygdtQU+XrrEy9cmQqzAdMhXvXV6Hp8MfnTDMSz1JvIwwwoVx80nRcZofoifIa4z2ROcz7gr1U6VZNPc/2hUzKyaw05LtNaCvMmUqralVRs9w1PU8/D8zgCMOTL7piTb7MY2aKZtvpWw2+yRcXULhkJu7BJFOUCxuVPl+npJOjDgPr0Uy/CzKMU9Z4EkhN2oxDXZNHUkh9GbM6VU76s3C2lPw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(396003)(346002)(376002)(46966006)(40470700004)(36840700001)(70586007)(36756003)(4326008)(478600001)(82310400005)(36860700001)(70206006)(8676002)(8936002)(316002)(5660300002)(110136005)(26005)(1076003)(186003)(7696005)(16526019)(47076005)(54906003)(336012)(66574015)(426003)(2906002)(6666004)(41300700001)(40460700003)(82740400003)(2616005)(83380400001)(40480700001)(356005)(81166007)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 11:43:41.1438 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d5d355-acba-402a-cf1a-08da6e32ebee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6863
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
Cc: alexander.deucher@amd.com,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 luben.tuikov@amd.com, christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Apply new intersect and compatible callback instead
of having a generic placement range verfications.

v2: Added a separate callback for compatiblilty
    checks (Christian)

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 45 +++++++------------------
 drivers/gpu/drm/ttm/ttm_bo.c            |  9 +++--
 drivers/gpu/drm/ttm/ttm_resource.c      |  5 +--
 3 files changed, 20 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 170935c294f5..7d25a10395c0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1328,11 +1328,12 @@ uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_device *adev, struct ttm_tt *ttm,
 static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 					    const struct ttm_place *place)
 {
-	unsigned long num_pages = bo->resource->num_pages;
 	struct dma_resv_iter resv_cursor;
-	struct amdgpu_res_cursor cursor;
 	struct dma_fence *f;
 
+	if (!amdgpu_bo_is_amdgpu_bo(bo))
+		return ttm_bo_eviction_valuable(bo, place);
+
 	/* Swapout? */
 	if (bo->resource->mem_type == TTM_PL_SYSTEM)
 		return true;
@@ -1351,40 +1352,20 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 			return false;
 	}
 
-	switch (bo->resource->mem_type) {
-	case AMDGPU_PL_PREEMPT:
-		/* Preemptible BOs don't own system resources managed by the
-		 * driver (pages, VRAM, GART space). They point to resources
-		 * owned by someone else (e.g. pageable memory in user mode
-		 * or a DMABuf). They are used in a preemptible context so we
-		 * can guarantee no deadlocks and good QoS in case of MMU
-		 * notifiers or DMABuf move notifiers from the resource owner.
-		 */
+	/* Preemptible BOs don't own system resources managed by the
+	 * driver (pages, VRAM, GART space). They point to resources
+	 * owned by someone else (e.g. pageable memory in user mode
+	 * or a DMABuf). They are used in a preemptible context so we
+	 * can guarantee no deadlocks and good QoS in case of MMU
+	 * notifiers or DMABuf move notifiers from the resource owner.
+	 */
+	if (bo->resource->mem_type == AMDGPU_PL_PREEMPT)
 		return false;
-	case TTM_PL_TT:
-		if (amdgpu_bo_is_amdgpu_bo(bo) &&
-		    amdgpu_bo_encrypted(ttm_to_amdgpu_bo(bo)))
-			return false;
-		return true;
 
-	case TTM_PL_VRAM:
-		/* Check each drm MM node individually */
-		amdgpu_res_first(bo->resource, 0, (u64)num_pages << PAGE_SHIFT,
-				 &cursor);
-		while (cursor.remaining) {
-			if (place->fpfn < PFN_DOWN(cursor.start + cursor.size)
-			    && !(place->lpfn &&
-				 place->lpfn <= PFN_DOWN(cursor.start)))
-				return true;
-
-			amdgpu_res_next(&cursor, cursor.size);
-		}
+	if (bo->resource->mem_type == TTM_PL_TT &&
+	    amdgpu_bo_encrypted(ttm_to_amdgpu_bo(bo)))
 		return false;
 
-	default:
-		break;
-	}
-
 	return ttm_bo_eviction_valuable(bo, place);
 }
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index c1bd006a5525..03409409e43e 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -518,6 +518,9 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
 bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 			      const struct ttm_place *place)
 {
+	struct ttm_resource *res = bo->resource;
+	struct ttm_device *bdev = bo->bdev;
+
 	dma_resv_assert_held(bo->base.resv);
 	if (bo->resource->mem_type == TTM_PL_SYSTEM)
 		return true;
@@ -525,11 +528,7 @@ bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 	/* Don't evict this BO if it's outside of the
 	 * requested placement range
 	 */
-	if (place->fpfn >= (bo->resource->start + bo->resource->num_pages) ||
-	    (place->lpfn && place->lpfn <= bo->resource->start))
-		return false;
-
-	return true;
+	return ttm_resource_intersect(bdev, res, place, bo->base.size);
 }
 EXPORT_SYMBOL(ttm_bo_eviction_valuable);
 
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 4cd31d24c3e7..60e8a0ed269c 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -316,6 +316,8 @@ static bool ttm_resource_places_compat(struct ttm_resource *res,
 				       const struct ttm_place *places,
 				       unsigned num_placement)
 {
+	struct ttm_buffer_object *bo = res->bo;
+	struct ttm_device *bdev = bo->bdev;
 	unsigned i;
 
 	if (res->placement & TTM_PL_FLAG_TEMPORARY)
@@ -324,8 +326,7 @@ static bool ttm_resource_places_compat(struct ttm_resource *res,
 	for (i = 0; i < num_placement; i++) {
 		const struct ttm_place *heap = &places[i];
 
-		if (res->start < heap->fpfn || (heap->lpfn &&
-		    (res->start + res->num_pages) > heap->lpfn))
+		if (!ttm_resource_compatible(bdev, res, heap, bo->base.size))
 			continue;
 
 		if ((res->mem_type == heap->mem_type) &&
-- 
2.25.1

