Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7C059AC49
	for <lists+dri-devel@lfdr.de>; Sat, 20 Aug 2022 09:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6622F10E2D8;
	Sat, 20 Aug 2022 07:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126DD10E2B6;
 Sat, 20 Aug 2022 07:33:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMOJHQag2wYNMchyYqTINIBEQvnksx8yQbGlw9/bn4FSrHfwgQT6se27V3PlbXeX62WRn8jIXQ88KVUjAQ/UoptiJOBs4B6wvcK4TtH/GJlbP756mWzzy27nDkWVXg8rafSglamyXgjsbMTEetcAv34FuvHvNwjIQnI19hZmZiKpII3FNjFPOf9YfYyRrIP1Bg/qTrNfD6+9SpmDm+roWoVRtLzz/RFdw6teqQCmOBIeMC9IHjhRF/2bbLYXJYuE0Ak6YVAYTyqwRQ003ZoNd3RH/VB+iCT+6XJtMoYSXX+oM3G+R0snDfBr2kk+zB1UBqoncLVjtf1Yc1wlrF81cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMbzmMojJwmFlIFDaYBSX2aRp3v1hRy83FK+XwLVJiQ=;
 b=BD8o5JA0Vhy0UZUad+Ud4p2h3rSE3yROusklQv/vfaW7rFesoaweqfMbSjm44b2deExYGWyhewgjnnOrGWQdD4vyLn1ydT2l11Hhq1zwOc5TKaeX7gJAVLRwuYM9SL62xfVHLmByMarUUbuunE+lOt2Rn2cbsj/+186DEplLWD+yd/oKSKqi+aqdGFtOi3I56fF50c6WkfzSeb5OIjXMbyozAXKm2h6hz/wi8MfvSz6CHMIG4VOByOoWWO/F6c3bqXn0GygjpLFHbrxT/bT/hZV/zaJxbUyI6h7KHeOEaUK7sQp9RhwRuWmMgDHbzoVPkoDq26INrkUmljtD+HxFMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMbzmMojJwmFlIFDaYBSX2aRp3v1hRy83FK+XwLVJiQ=;
 b=4JyGfpZ2DPy2uQ/FF9UrngFf9QE7JJk7BLLpnqpx1B3DEgz4rbSygctJp1H/QbOAvbmwqbwdSDPvJ5BpP2CaNF1g/KWt6R6CnG7FiXks4gbcWDksiSM73glcbzYY0GfjT/MV0tjESrlv2R6KQRbciSpv9p8GVLhXJH2qwMkdPAs=
Received: from MW4PR03CA0153.namprd03.prod.outlook.com (2603:10b6:303:8d::8)
 by MW4PR12MB5602.namprd12.prod.outlook.com (2603:10b6:303:169::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Sat, 20 Aug
 2022 07:33:45 +0000
Received: from CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8d:cafe::83) by MW4PR03CA0153.outlook.office365.com
 (2603:10b6:303:8d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.16 via Frontend
 Transport; Sat, 20 Aug 2022 07:33:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT013.mail.protection.outlook.com (10.13.174.227) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Sat, 20 Aug 2022 07:33:45 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Sat, 20 Aug 2022 02:33:41 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v6 6/6] drm/ttm: Switch to using the new res callback
Date: Sat, 20 Aug 2022 00:33:04 -0700
Message-ID: <20220820073304.178444-6-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220820073304.178444-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220820073304.178444-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2c1dacc-8067-4e45-fe3a-08da827e50b9
X-MS-TrafficTypeDiagnostic: MW4PR12MB5602:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DQNwVR14eSajHb/X8rA2hJgW1mgIQeSz8mf6IM55Mqh0Q/65BWx7YVmmkrkdGG7T0SU8Jg1YJmPPiY1ABKaatr9wZkBw/vlqrk0rF3uwRWsM8yQn01dybtpnL50HlDootel2MxVtmyLbrRmVqh/LatPeA095kBYnOJT/BEK497PYdIVm3UpfCD5hLyThppGpqP9skw3magewZqjEdR7Cut9hWCqUYxwwKwFJIveuzEdbqY9EM1QwuZZgX9vhFkUwQUgR4TyQ5A9JbwmAi7Yp3GWYm7WKS+bgZ29PkxZlzQceuwrF6BjgB7yMbrprdwqRHRfew4TIZd5GSgj0rU8cuKFDp1qKyVdmnw+R10WMjZixUB4QY2jV7CmbsKWrIvEeGrkoFy/K5t0IfVItBmA6wlRBlTamp98H6sHvwvn5PBw7+FU71A6lmmBmQNPF76rSpTckznKf5GU2u5DyT77VJKfTUA1ob4VETaeXh3iE+Aap2UQHE2C1WyIOJ9zBu8RPd4BW0pCCTYFtH7x0Y05J3TtnfpUHlVghcwo9SAL1Ie1oAq1ANgijCkPrVV9Wg6Y03mzqEBMpOz2iyy7PfCbHabnXUTNUM9I1MC8Kh6EO6X72Wtxu5xQxEubCZ+uZFESq/Xj1TRcjtVOUUnJ/TwpnAtlkF+kMdWdmUudfwPTGJFcZF7DjX7xFB2Qr6vyefYwp7Me24HvX0xRc2s0fez3uQfvk9DAAxYBH/ubvHne8q+TsWJdL3KmWV1NeJCLt2AHqZKt1hAtTL96v6qfHPLb57SFy/+KZqfCyBfvvWcaoEcU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(396003)(346002)(376002)(36840700001)(46966006)(40470700004)(40460700003)(81166007)(83380400001)(356005)(36860700001)(82740400003)(70586007)(70206006)(8676002)(4326008)(110136005)(82310400005)(54906003)(316002)(2906002)(40480700001)(8936002)(5660300002)(7696005)(26005)(47076005)(426003)(1076003)(16526019)(336012)(186003)(2616005)(41300700001)(6666004)(478600001)(86362001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2022 07:33:45.6328 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c1dacc-8067-4e45-fe3a-08da827e50b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5602
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
v3: Cleanups and removal of workarounds

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 45 +++++++------------------
 drivers/gpu/drm/ttm/ttm_resource.c      | 17 ++--------
 2 files changed, 15 insertions(+), 47 deletions(-)

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
 
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 0d1f862a582b..a729c32a1e48 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -276,17 +276,9 @@ bool ttm_resource_intersects(struct ttm_device *bdev,
 	if (!res)
 		return false;
 
-	if (!place)
-		return true;
-
 	man = ttm_manager_type(bdev, res->mem_type);
-	if (!man->func->intersects) {
-		if (place->fpfn >= (res->start + res->num_pages) ||
-		    (place->lpfn && place->lpfn <= res->start))
-			return false;
-
+	if (!place || !man->func->intersects)
 		return true;
-	}
 
 	return man->func->intersects(man, res, place, size);
 }
@@ -314,13 +306,8 @@ bool ttm_resource_compatible(struct ttm_device *bdev,
 		return false;
 
 	man = ttm_manager_type(bdev, res->mem_type);
-	if (!man->func->compatible) {
-		if (res->start < place->fpfn ||
-		    (place->lpfn && (res->start + res->num_pages) > place->lpfn))
-			return false;
-
+	if (!man->func->compatible)
 		return true;
-	}
 
 	return man->func->compatible(man, res, place, size);
 }
-- 
2.25.1

