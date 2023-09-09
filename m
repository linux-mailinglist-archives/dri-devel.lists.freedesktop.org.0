Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB81799968
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 18:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B93610E2A5;
	Sat,  9 Sep 2023 16:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E013310E2A5;
 Sat,  9 Sep 2023 16:09:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HaRklPKili6Po5Eoi2LbToRoSplu9shWkwXEZ7dTDwxUb9crw8aPK30Q3w1jsya6x4TriVmLjXhvavvqYLk9LzvIN1fT2fJ6lwvGAV5jKNLHHukQufQrFn4Lcyx3f+siJPgDUr282e4+8//m91YalnSB4iG/3HwoxcXlNyNcRhlxN3GjAy6CmXaeUWYprsTAjDQmsOH8Ns7pTFDAuCKFBP7Djy33yDJVz0nRDbZqdva8f3V1RECvBxRUdKjaawOEhjBDyZqoOdMdEU8eIzOX88HI4aVUteQ16v68gLNqytl9wsbJIEi2Rqv+XUyOj7tZ85uaSK71pqX4zNcH9pB1lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+nHhxe67mwuS++feDWGkHXlGkWnl5Q1X63pQB7JGAk=;
 b=dyuGAQrti4Do59jQfxpWNl/eUVSHIht2o6UqwGrzanxln9+ESPXj2gHoJeA8grugApxZdfeuWTceeMa8Go+CJZy4xuKg4Wy6FfYNiMIBhNg8MO3CdHlX8wQGcazE7wPbeSioHvmMWhfOf4I2Y4NVOnnGVaHVMzEeSsAQ+MDmQv6GveskhDzuGK0drxSvRfGNEVDzr5rojQFRpIlRaAGJm6taGtAkp8wx31ieqDhHjfoWWfLG5Y5C9E71zMwbZvprYjzsJUX4I6S50xKPFDjqqg8i6Z376q27s2cEmcmHhf0FsesySZMjxcaDUOPMEyb0NUVz1Zx3R90i9aQeBl8vUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+nHhxe67mwuS++feDWGkHXlGkWnl5Q1X63pQB7JGAk=;
 b=2U8t+Tdi7+KeIZ7pM09ImIF4EJZM0WZYGDzOCrVhbSJykKGhAoZYUXFavVTzVdL17tC4oAVmInDM6u4cohkDE5UAgJRHYXnO1Gz5OoELBAHUYvjK6skW4YQyG8Q/RChsWuKSY3FFMbsaSaE/KhjLGjojrgVyTwA+auTagdGwKE8=
Received: from MW3PR06CA0022.namprd06.prod.outlook.com (2603:10b6:303:2a::27)
 by DM6PR12MB4864.namprd12.prod.outlook.com (2603:10b6:5:209::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Sat, 9 Sep
 2023 16:09:35 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:303:2a:cafe::fa) by MW3PR06CA0022.outlook.office365.com
 (2603:10b6:303:2a::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31 via Frontend
 Transport; Sat, 9 Sep 2023 16:09:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Sat, 9 Sep 2023 16:09:35 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 9 Sep 2023 11:09:32 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v2 2/3] drm/amdgpu: Move the size computations to drm buddy
Date: Sat, 9 Sep 2023 09:09:01 -0700
Message-ID: <20230909160902.15644-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230909160902.15644-1-Arunpravin.PaneerSelvam@amd.com>
References: <20230909160902.15644-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|DM6PR12MB4864:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cb18129-7595-4c20-d603-08dbb14f2936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TGfpTQ04yf/ba80096F0DpTgvcNZx82Wq9Q01cAEpPbrU56IK72rx+4lCq/B+SEd7Yo8qiYTJMnEzYnMa2Xy9XUj912AiA/F37eb1xKj22btaRKlB66AIUnI3n9a6t+CgPT683ebVBmIrqPMfQzv9ioTmoSv3kRRVDoKc85uqA4n9HVdU5gzTxsVN4m4pYJPLDCNyG8gQVXJ60WxFn9p/dSfKR1Kok6DEpGXYctgFmMQ3FUiihbOZ4TezQj3OKPBPVOdJiM/OnK2+ahPGI0DQRvx2His05fYrJlcezZzej/iBUVtgg5bQu98zYzjhqZyazUz09DBloJXSLR55PES1ksf4gsUv2Qp2RVJwg1vnq0W8xWTr6iQOAEn467oGH3aw8E696eoL1q/RG6n6OqX1PRDSIiDxogfva4z6EDJre6q3qKO50VnhPexnnQnBO//wVr5Zif4vosMIoRbiuD/saHCQfJ3rhUXTNLG6rSovZLYJSrLtZjx/KA1qsNMoXLaqGbWGzD40VlvX5tvFZ3vTXFGf1ki9TU5LTQsqgsDgqSKWm7UhsR7OgFH7QuBzBLL+paM3d9jGSPHCsd4SAmMjRKGHgl3R+CxOn32EIJj1jVCsp5ASC3fI5CP84mYJyYe7ypYkVHGfT1F4gLKC/rotaOyJoS8ZklSVwyLFZADMFiPfd+4U5C1+QA9NPiooX6XLYHvS4gVWJ4qpfkXroZm4bJBkItduiFi6jVntL1mxxep1dTe0RfI6vqNrugiIqYExu1NidcWSKnHB638j8MryQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199024)(186009)(1800799009)(82310400011)(46966006)(36840700001)(40470700004)(356005)(6666004)(7696005)(40460700003)(1076003)(36756003)(86362001)(36860700001)(82740400003)(81166007)(47076005)(40480700001)(2616005)(478600001)(26005)(16526019)(426003)(110136005)(2906002)(336012)(83380400001)(70206006)(4326008)(8676002)(70586007)(5660300002)(41300700001)(316002)(8936002)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2023 16:09:35.3486 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb18129-7595-4c20-d603-08dbb14f2936
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4864
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

- Move roundup_power_of_two() and IS_ALIGNED() computations to
  drm buddy file to support the new try harder mechanism for
  contiguous allocation.

- Move trim function call to drm_buddy_alloc_blocks() function.

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

