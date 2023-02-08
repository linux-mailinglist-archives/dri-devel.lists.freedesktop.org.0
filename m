Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 581D868EA67
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 10:02:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF42D10E70E;
	Wed,  8 Feb 2023 09:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC8310E711;
 Wed,  8 Feb 2023 09:02:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fI3EmaA4H4PJ8mzPDCqDFEUvQf21pZUFYuwWr2xIaVtfmZ5iCi7xjH7tOM6px9JWfodKHoEMWqERllfRfx5UlcgSqS4i81NuRBVS1wRS5zeZynFH1Gd65ZNaU0GmhQZ3sBV7cJwhXMuSCu0UfoB117e3UXdYTk7sSutZRRjGU7k18HSP6gk9YbLqVN+HYAvdt8/BLvjEzBwXUmH1bp/KRU90gMKIJka/PQQOXOmJ6QM2D+scXDIoWVl2zKLV6W8bu+CNV2jB1FSsaLjHa7d0YE42g0c1JUn8P72RpvfJMsK42iVwlcyMRo1HROpk4AxfpJsfmkBmmdysaOHM1Q6GPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6vy3UM/G1Pz877Ac/yGDWZgIb6SA+6KU0M6goCLy9Q=;
 b=YfSEFOHrHqwDLTsAW6DpFm4Jq+v/P9KXv9i1W66GJzyY+Ulwd2ZkDDNufcHFqapkqZ57sMbgdejoF+OJWQYK0unzRLZG2GbjphoDBl7o6L9+wxYJjuM8w7OVZdVLXB4H0NhYP9tmTC3ZmJmq3KG/LHN3+HnA2a9R19G2xB9VbiOmLxr/LPTZqmkODJORN/EwDGzPIGR2uRPS3Y1p5Kkii3A6BxSOUcN81v43FGdtWKm20LYE1alqkmoVOuD9Rp46t3XaCUA+/0Ba9dusybOsNsD6tvrgJ/FfSH11aeNuH6FglGuwVhRMl/QIOHu6vzHHcRZn1lDg4V///nCfMnos5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6vy3UM/G1Pz877Ac/yGDWZgIb6SA+6KU0M6goCLy9Q=;
 b=DD15fSL5rrUL8MjA6TN7xVEOETIpegNFF0NAk+SSjwHYdNHiyGrO51c/ILJl5SudAm2Yv+mT6kwIHsY7IKpRjDFENfXS30q3knOd6/QJAyvMVPTFPlDlNyML0qVILK94Ut35HT3Mrh07hyyt+d5kETfkH/GbJ+67BR+C0q98DD4=
Received: from BN0PR10CA0004.namprd10.prod.outlook.com (2603:10b6:408:143::18)
 by PH7PR12MB7281.namprd12.prod.outlook.com (2603:10b6:510:208::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.32; Wed, 8 Feb
 2023 09:02:14 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:143:cafe::36) by BN0PR10CA0004.outlook.office365.com
 (2603:10b6:408:143::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36 via Frontend
 Transport; Wed, 8 Feb 2023 09:02:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.17 via Frontend Transport; Wed, 8 Feb 2023 09:02:13 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 8 Feb 2023 03:02:10 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-graphics-maintainer@vmware.com>
Subject: [PATCH 5/6] drm/ttm: Change the meaning of the fields in the
 drm_mm_nodes structure from pfn to bytes
Date: Wed, 8 Feb 2023 14:31:05 +0530
Message-ID: <20230208090106.9659-5-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230208090106.9659-1-Amaranath.Somalapuram@amd.com>
References: <20230208090106.9659-1-Amaranath.Somalapuram@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT058:EE_|PH7PR12MB7281:EE_
X-MS-Office365-Filtering-Correlation-Id: 736b6719-97b8-4209-e45b-08db09b32b78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2V5cWEZ6dFS2lgGJPVjJDMpLVmymCkxviX1t/trJOb0zQV7gPm0PGHSwiMr8tdM4dJqNEIv9cY8kJl5nBcwhA3wLGORBncvr83n98LPzbwiN6tm7y2mJbNq/YKE4Kyx3khTGkeOJwbRrZX0JfO7phudFRm5Y/2xbRSyHmi8GKkCQEzJk9cQcwsBPFSaOPmGv59JZFZyrdxakilEOPwgM9EtBwD7Zh24MwwLynMVtvrtritRIMGvDGvCRdOC7usAb4fr70wNvSUl/d7iog9rPfrgAh8oG62iLyPxT1SyzBCU41GWef2f53CDfSlcbzhx1QWbIcHbUFeio73itq/0Xx9J+O2sc5kGqHISHck1rC+bLjokNWJB71RbnX9kHfuC/HYsAsIRUnggf6DueXXAhOCeqxkfGHzSr4IzrcpnpBbu5qjuA8xAqJhw5RWZiLKzqsdNQMob5PK6PgP+QKwxQpsvXzT1FuYSG6cNJLCEGgMe1pN6xXB7RGaTC0dFWQHT/Kst7Ojw/s7NZpN3QlLDvHjAkbEmntDa6//hMbIJiDl42dQC1Y3Zzsyn8TZdSI8MnqfTZSHmljCgZ9CxXGKEaUqwx8t1wmwwPIouz81QB4yPuKPA3QDUU3VGVBy8V1SmNA4j4faYOTy9I6SzpIje1be/wVK/qQ0ipAwurRXbFW9u1qeanBd0X/WaGj+5fZrbE25SVA+0vV+S/Hg6Gzq6r5ywFaM/5y1Mp9CmmMnq6wuo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199018)(40470700004)(46966006)(36840700001)(36860700001)(82740400003)(2616005)(40480700001)(478600001)(356005)(186003)(2906002)(26005)(1076003)(81166007)(16526019)(6666004)(8936002)(40460700003)(426003)(47076005)(83380400001)(70206006)(70586007)(8676002)(4326008)(5660300002)(336012)(82310400005)(316002)(86362001)(54906003)(110136005)(7696005)(36756003)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 09:02:13.5727 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 736b6719-97b8-4209-e45b-08db09b32b78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7281
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
Cc: shashank.sharma@amd.com, arunpravin.paneerselvam@amd.com,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, arvind.yadav@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change the ttm_range_man_alloc() allocation from pages to size in bytes.
Fix the dependent drm_mm_nodes start and size from pages to bytes.

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/i915/i915_scatterlist.c |  6 +++---
 drivers/gpu/drm/ttm/ttm_range_manager.c | 15 +++++++--------
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
index 756289e43dff..7defda1219d0 100644
--- a/drivers/gpu/drm/i915/i915_scatterlist.c
+++ b/drivers/gpu/drm/i915/i915_scatterlist.c
@@ -94,7 +94,7 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
 	if (!rsgt)
 		return ERR_PTR(-ENOMEM);
 
-	i915_refct_sgt_init(rsgt, node->size << PAGE_SHIFT);
+	i915_refct_sgt_init(rsgt, node->size);
 	st = &rsgt->table;
 	/* restricted by sg_alloc_table */
 	if (WARN_ON(overflows_type(DIV_ROUND_UP_ULL(node->size, segment_pages),
@@ -110,8 +110,8 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const struct drm_mm_node *node,
 	sg = st->sgl;
 	st->nents = 0;
 	prev_end = (resource_size_t)-1;
-	block_size = node->size << PAGE_SHIFT;
-	offset = node->start << PAGE_SHIFT;
+	block_size = node->size;
+	offset = node->start;
 
 	while (block_size) {
 		u64 len;
diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index 62fddcc59f02..ff9962f7f81d 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -83,9 +83,10 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
 
 	spin_lock(&rman->lock);
 	ret = drm_mm_insert_node_in_range(mm, &node->mm_nodes[0],
-					  PFN_UP(node->base.size),
-					  bo->page_alignment, 0,
-					  place->fpfn, lpfn, mode);
+					  node->base.size,
+					  bo->page_alignment << PAGE_SHIFT, 0,
+					  place->fpfn << PAGE_SHIFT,
+					  lpfn << PAGE_SHIFT, mode);
 	spin_unlock(&rman->lock);
 
 	if (unlikely(ret)) {
@@ -119,11 +120,10 @@ static bool ttm_range_man_intersects(struct ttm_resource_manager *man,
 				     size_t size)
 {
 	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
-	u32 num_pages = PFN_UP(size);
 
 	/* Don't evict BOs outside of the requested placement range */
-	if (place->fpfn >= (node->start + num_pages) ||
-	    (place->lpfn && place->lpfn <= node->start))
+	if ((place->fpfn << PAGE_SHIFT) >= (node->start + size) ||
+	    (place->lpfn && (place->lpfn << PAGE_SHIFT) <= node->start))
 		return false;
 
 	return true;
@@ -135,10 +135,9 @@ static bool ttm_range_man_compatible(struct ttm_resource_manager *man,
 				     size_t size)
 {
 	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
-	u32 num_pages = PFN_UP(size);
 
 	if (node->start < place->fpfn ||
-	    (place->lpfn && (node->start + num_pages) > place->lpfn))
+	    (place->lpfn && (node->start + size) > place->lpfn << PAGE_SHIFT))
 		return false;
 
 	return true;
-- 
2.32.0

