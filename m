Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 492C37826DC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 12:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC5510E231;
	Mon, 21 Aug 2023 10:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF5210E223;
 Mon, 21 Aug 2023 10:15:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MlUhmQVlYKTkbI6/rDu9m38nQKTnGE7/Et5vI5yam552gt//oLQI9VNvH7CIxE9//nOsC+d+8zaF06MBiD97Oa/OKTSDmxQtaQZ17YDxcHIITny71dwo+/6XxknppUa5ZRwTE/doZ1g7hCVRL9dk/A61KltdB/kOjDFu2hhuHN/k/DhlvqtYoQHVjUeIa6TEBGKOc5c0KdtYC1GGv2vILV2/k5uLEPwdFbJhv/ktudf21SP4aI5JvBRNT/6/5AVZ4r/CRwm3vUaIf9zURAfTtCtuiCjW/Bb3B7w5jq5B5h9CW/Ao+SEjBFKrAjXXjw5vP9akaTpnFCp71SY99CxxeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGglwQQBk7gVkgAs9R5UYZ5f1PzPmFg3ValH8b7WV3Y=;
 b=FEQ2S6xLcJoPDFRHHUImxzj8H6uv9v4TSrABnjPfBVpK5kYGN1EaGf85vawlWMFLCrsJLefuoZNvtjBrVu4xMf68Xt8mg5lKeciKSozTNAWD0tM8Du8g41pbyVBv8Ctb0e4gbLs6Tvs2w22/ft5+DoZHZ4VnYgHD/nf1OCH4KANSUEzoovqXdCULeqv795ruBESonbYcS0/UoKgvC7Xw8jYBq4mFDFKrtko8TW7sAlsPvaTibsmYhKaZ1/IY3Oaw7Hn4kr2o60VbOGXDOcpOJ1OEjKRI4aIFb5aJFFVekfNB9xgdqzGS5f/3dB1GGQVeAXDCXxrOQZSaJCSJeMBIaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGglwQQBk7gVkgAs9R5UYZ5f1PzPmFg3ValH8b7WV3Y=;
 b=FCnkzvvXqySiSW5RIYnjpn0/ejf4aJ647VzAl68xkrVTsgaJmGkhnWu1SwVuFrkqDJZ1oQYcEL8WokXBrcsrpYjWgOERnVJ5rGLwuY7uF/Sjf98dh2XRiCWW4onmOqWSSXcq04O+kR8ZQlkcFfXbY4et51XMG4GjPqgfK5RGj1A=
Received: from DS0PR17CA0004.namprd17.prod.outlook.com (2603:10b6:8:191::12)
 by BN9PR12MB5226.namprd12.prod.outlook.com (2603:10b6:408:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 10:15:09 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:8:191:cafe::3f) by DS0PR17CA0004.outlook.office365.com
 (2603:10b6:8:191::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Mon, 21 Aug 2023 10:15:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.77) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Mon, 21 Aug 2023 10:15:09 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 05:15:06 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/amdgpu: Remove the contiguous computation and trim
Date: Mon, 21 Aug 2023 03:14:43 -0700
Message-ID: <20230821101444.119601-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230821101444.119601-1-Arunpravin.PaneerSelvam@amd.com>
References: <20230821101444.119601-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|BN9PR12MB5226:EE_
X-MS-Office365-Filtering-Correlation-Id: b2e9e9ed-aae1-4d03-643e-08dba22f7fd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MBsTQ6I+TuRrOXfHxUCDyB58zZKlvEBWqB5slajlWB98U0PVYtiOKnJ47JfNCegNsFO2TFQVN2zxv37PKueLPhRVwXp1mceMmcP26g2r9wXonEzHyFytku+tgX52YrA2Pl6r0cSpKIFf6S9N5o9RqFaz6JjwzA/agr/Wq2T3pGUbkutHgvCHtWoIgX1RGMal5wKV8zA3YK+KkEmEvnm815PM7P6cWYpAybxFHcY45TAI7VT2WnUefBSZzv+cVSOMikHGzVqKQXNRq8R/xVXnwCVhUuiZw2iaMxkI0bYz2JaAAIySrAyODTYks5eaM1xcPZW/cKbQiSMK6P7m1R/qlaBaOjUztdbLS/Fu4fggsZHxtnJnS4smgUdPzWZiBZqzdUflSkjWHIZ4a4Xbte0Z0Hm0bGrNnLEfEtuC8IUCwJkCyatib6I6R06thTI4khMOa+DpWrWAMesVM/uzTpiSR5TDUIiHxUiIupPVP0vLtJ32HKpr1NtaL0VuPjz3EIYkpbRE0EDatMaUXT6OxF4TX7TpG4xg6Mdax+/Bw/XKDvBTTm0klr9118TN0V8ePQU+iUjrL6pTjoy+8hsCFVjCV6PaYhdySphZpdDMMOqXKFBaR3rG1M/gbwM8d47kehnUzbw+2sJuRoJKHxFw1vjnww==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(82310400011)(451199024)(186009)(1800799009)(36840700001)(40470700004)(46966006)(2906002)(83380400001)(7696005)(40480700001)(5660300002)(336012)(426003)(16526019)(26005)(86362001)(36860700001)(47076005)(8676002)(2616005)(8936002)(4326008)(70206006)(316002)(54906003)(70586007)(110136005)(478600001)(82740400003)(356005)(81166007)(6666004)(40460700003)(41300700001)(36756003)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 10:15:09.3948 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e9e9ed-aae1-4d03-643e-08dba22f7fd7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5226
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
 christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As we have implemented a new method for contiguous allocation
which requires actual size and actual min_block_size, hence we
have moved the roundup and alignment size computation to buddy
allocator. This way gpu drivers pass the required size and
alignment to buddy allocator and rest of the operations taken
care by drm_buddy_alloc_blocks() function.

We have moved the trim function call to the drm_buddy_alloc_blocks()
function as we dont have the roundup or aligned size in our driver.

Now we have all in one place and it will be easy to manage in
buddy allocator.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 58 ++------------------
 1 file changed, 4 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index c7085a747b03..18f58efc9dc7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -424,9 +424,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 			       const struct ttm_place *place,
 			       struct ttm_resource **res)
 {
-	u64 vis_usage = 0, max_bytes, cur_size, min_block_size;
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
+	u64 vis_usage = 0, max_bytes, min_block_size;
 	struct amdgpu_vram_mgr_resource *vres;
 	u64 size, remaining_size, lpfn, fpfn;
 	struct drm_buddy *mm = &mgr->mm;
@@ -474,6 +474,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 	if (place->flags & TTM_PL_FLAG_TOPDOWN)
 		vres->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
 
+	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
+		vres->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
+
 	if (fpfn || lpfn != mgr->mm.size)
 		/* Allocate blocks in desired range */
 		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
@@ -496,25 +499,6 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 				!(size & (((u64)pages_per_block << PAGE_SHIFT) - 1)))
 			min_block_size = (u64)pages_per_block << PAGE_SHIFT;
 
-		cur_size = size;
-
-		if (fpfn + size != (u64)place->lpfn << PAGE_SHIFT) {
-			/*
-			 * Except for actual range allocation, modify the size and
-			 * min_block_size conforming to continuous flag enablement
-			 */
-			if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
-				size = roundup_pow_of_two(size);
-				min_block_size = size;
-			/*
-			 * Modify the size value if size is not
-			 * aligned with min_block_size
-			 */
-			} else if (!IS_ALIGNED(size, min_block_size)) {
-				size = round_up(size, min_block_size);
-			}
-		}
-
 		r = drm_buddy_alloc_blocks(mm, fpfn,
 					   lpfn,
 					   size,
@@ -531,40 +515,6 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 	}
 	mutex_unlock(&mgr->lock);
 
-	if (cur_size != size) {
-		struct drm_buddy_block *block;
-		struct list_head *trim_list;
-		u64 original_size;
-		LIST_HEAD(temp);
-
-		trim_list = &vres->blocks;
-		original_size = (u64)vres->base.size;
-
-		/*
-		 * If size value is rounded up to min_block_size, trim the last
-		 * block to the required size
-		 */
-		if (!list_is_singular(&vres->blocks)) {
-			block = list_last_entry(&vres->blocks, typeof(*block), link);
-			list_move_tail(&block->link, &temp);
-			trim_list = &temp;
-			/*
-			 * Compute the original_size value by subtracting the
-			 * last block size with (aligned size - original size)
-			 */
-			original_size = amdgpu_vram_mgr_block_size(block) - (size - cur_size);
-		}
-
-		mutex_lock(&mgr->lock);
-		drm_buddy_block_trim(mm,
-				     original_size,
-				     trim_list);
-		mutex_unlock(&mgr->lock);
-
-		if (!list_empty(&temp))
-			list_splice_tail(trim_list, &vres->blocks);
-	}
-
 	vres->base.start = 0;
 	list_for_each_entry(block, &vres->blocks, link) {
 		unsigned long start;
-- 
2.25.1

