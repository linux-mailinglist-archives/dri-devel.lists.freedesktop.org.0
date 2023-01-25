Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D800D67AF21
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 11:01:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD0C10E76B;
	Wed, 25 Jan 2023 10:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1AC10E769;
 Wed, 25 Jan 2023 10:01:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UtN4iyVxB7fZnUn4rqxt5626qGnmNRAvZUSH9a3j2mlIFC2j1qnDz9KBrE/skz0rbLNcp8+iLqePZ1b13UP5cslZYcZmXHu4POTWxwIO8n25pgSTzgF8XjJ5aQBGh4z7PzgEI8W7ytianqaulLaTCjuH2RtTRRB1D3VbAyO/4lnSGkSk5Q8xtgz+GwqTEz1napK0zpXmqJkW+b//60JFyspjblyrR5j6zWgkXcNBttsCWtIcGFxkTuTwTl8cQnSrLD1bMqkV4gv+7FttYhuTGx7YTSIpANvpkQTHLfEFfpjIFVIG0ldk9W5Vn8VrFxP+ZfcOhYEtZfJwIY4eE3z4oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Va4oJxiWg+aGznI+xnp6oyhn1ENus++6iRMzOb/5XNU=;
 b=EAexxN8Ml1vGEOZzV6Dq6mJWloT5g3KfHPr8Kfj68qypc0MouSb3Oge03+03pKhaK38QQfJo8aJ9NOxjpVJ53KBzbJnfJzlzcaACd82LNh2NT6E+wC7sJxR9f4aFaT6WDSCaFebcX41DNfXAHw1fpllPubCOyszg8nU/FQhGftVRGNSg0WQf5IbO2ALclHF4Mpadz3U21Zy/zo0CcDcXB7RLlmnCiVAWJoTCcCcuLD9D0NYjgKZACa8BB/cf278ZtqSYGabb9JcwSoy3nlc33CMSyoF8GNwRiuudipkkY5aNtiet1LGHEVIM8fqn2c4iJpj3+FGmbC3mE1azHYVnBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Va4oJxiWg+aGznI+xnp6oyhn1ENus++6iRMzOb/5XNU=;
 b=z0OqSg4uzJLtxmnDKEoEeQmuVq5jVGsqn7opTxIjx2DbLdxDai2uEYLMSZQJSKzxl9MNF7u+zahwMvaiaWEy2Xh+fcvNghL6dNh19H44uiqatK7BrjvYL4CM1IXoA0IxOoQ6JF6uMrEBM+BjE/jTCQw6VG3yWz4xSkvrkylz1yU=
Received: from MW4PR04CA0146.namprd04.prod.outlook.com (2603:10b6:303:84::31)
 by CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 10:01:17 +0000
Received: from CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::48) by MW4PR04CA0146.outlook.office365.com
 (2603:10b6:303:84::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 10:01:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT055.mail.protection.outlook.com (10.13.175.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 10:01:17 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 25 Jan 2023 04:01:13 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/amdgpu: Support allocate of amdgpu_gtt_mgr from pages
 to bytes
Date: Wed, 25 Jan 2023 15:30:24 +0530
Message-ID: <20230125100026.5086-2-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230125100026.5086-1-Amaranath.Somalapuram@amd.com>
References: <20230125100026.5086-1-Amaranath.Somalapuram@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT055:EE_|CY5PR12MB6405:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f388bf2-f846-4310-0412-08dafebb19d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: myYD/tR8Kk8wn7PpHrhwnVvlqUBUbJC2h7UhEAAQofWNwQWVYTz3yptKw9Yxmp6klrzgtuQQDYqN+lQFE6vyGuOrXBkLVILyJOUc4E4nDYG2UKoif1OSzRVu1kK8+F0dVqbraspJKXDoAiTamPDZXmQ0pAjU46z7vLUARmTdyBL+bPMxrv3MIy1dV8AmIq5s79r1a9R9Fgi+wMUJPy9d1UsM3jQ2XfOJMkJ5i0QdKREEXmONa3qV0mipdNo73lKMFlIy+nQH9dvFFhh57w8GirMYG9EUVLoI9nrGW51CeMJFTFdEyJRBqtatpKvXECOnBOjaXXKN7dG4CjopIicWKV3MukRBKRE3jTbvGas9ihsto8LLeRB72BPF07mWiG8lGoVgxGspyzYMHKIsMhZhXQ8dzZKvxgFQKv4Evq7VKDnp3dnYNhARQU91e29z2wyKBDqB8J372Gfh//EEfP4iao2fsH//YGyd+dJmQZCDCJ2W1z5C+cAmAZsQJBHzf2HneUaM4a2L1Ma+V/q2hT8vNG2+upBBxTrrbnqKXfvMrpuRhjEPupDLGO3Aczmw7uzbQ9mGTpjTMngs1Wjcl+wwtuwAksYRF2FHA06vYoziy+CLphd5Mbu+rWz3oYrRF0TYGY6R0SkVaheKrgJILzLQbwU/IbQqcOdsBUmABLKCODh0wt/JoT7h4XINlmm2M+FfgiOc8t7UIi3kYIsv+LH+jJnuNZBx6575hd+PwoLhAwA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199018)(40470700004)(36840700001)(46966006)(316002)(54906003)(86362001)(426003)(40460700003)(478600001)(47076005)(110136005)(1076003)(41300700001)(2906002)(5660300002)(8676002)(70206006)(4326008)(450100002)(70586007)(356005)(8936002)(82740400003)(36860700001)(81166007)(7696005)(2616005)(36756003)(40480700001)(82310400005)(83380400001)(336012)(26005)(16526019)(186003)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 10:01:17.0539 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f388bf2-f846-4310-0412-08dafebb19d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6405
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

Change the GTT manager init and allocate from pages to bytes

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 44367f03316f..a1fbfc5984d8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -116,7 +116,6 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 			      struct ttm_resource **res)
 {
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
-	uint32_t num_pages = PFN_UP(tbo->base.size);
 	struct ttm_range_mgr_node *node;
 	int r;
 
@@ -134,8 +133,10 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 	if (place->lpfn) {
 		spin_lock(&mgr->lock);
 		r = drm_mm_insert_node_in_range(&mgr->mm, &node->mm_nodes[0],
-						num_pages, tbo->page_alignment,
-						0, place->fpfn, place->lpfn,
+						tbo->base.size,
+						tbo->page_alignment << PAGE_SHIFT, 0,
+						place->fpfn << PAGE_SHIFT,
+						place->lpfn << PAGE_SHIFT,
 						DRM_MM_INSERT_BEST);
 		spin_unlock(&mgr->lock);
 		if (unlikely(r))
@@ -144,7 +145,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 		node->base.start = node->mm_nodes[0].start;
 	} else {
 		node->mm_nodes[0].start = 0;
-		node->mm_nodes[0].size = PFN_UP(node->base.size);
+		node->mm_nodes[0].size = node->base.size;
 		node->base.start = AMDGPU_BO_INVALID_OFFSET;
 	}
 
@@ -285,8 +286,8 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 
 	ttm_resource_manager_init(man, &adev->mman.bdev, gtt_size);
 
-	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
-	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
+	start = (AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS) << PAGE_SHIFT;
+	size = adev->gmc.gart_size - start;
 	drm_mm_init(&mgr->mm, start, size);
 	spin_lock_init(&mgr->lock);
 
-- 
2.32.0

