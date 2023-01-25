Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D9C67B450
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 15:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDBA810E7D9;
	Wed, 25 Jan 2023 14:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6117310E7CE;
 Wed, 25 Jan 2023 14:24:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gD7IGRzhH61uKojg7L50cw9ATJrV4EXgoQ3hU8o6nsAOW1F253Lxna++o7/tAekA+dfJwtYhJxw05sGgEH8rhFzd157cZJBCXgC6oYSb9OiW7enjLU+J9OFuW3HmzboqEbCqKlKeNvjlCSdLsap/5qesic5rPcB7X0jtumroOx5+Btxoxd8/eQt6oL08jwCm/SFYjs9e68SWdiVFiZAQ9gHgxgbacOvw5EYT2Lb4VJV8MO7uDkCJVJTXoEV6sFdKVNuj8Si9uYCRIYDpCRytUDZqHzC33GfeLxtmZWyluX3yai+8KupNGmtohxDZO2xF4FUc2kPcu0NSn7aIJXUerw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhNIRmgg+YV3yzFMC9ZjKNgE5z3SDFeekevQRWKMkuk=;
 b=ZJAxgFevbw4MJpgmYjrmOAXI75TjLrPfT+NsgrLlabu2RMRVGRcCIiodOFBO1uhTZVW4ZqgpES6GzMWorYRWd9dIaHeolCsSGdwasDJTjm7PE9a1xawpDamD1TgnokQzUcl7gEzE0f1mqc6x/6WBcx7MuQtn+VmZOEhrsKQvOQbwlnyudcY0EioLpnkvP4lvHPeastGH51rPfA57KeLqUrIFflyLkuG6js3CerwQHdYEUQ7Oow8nTWdo6SonSNdpQVMud6pNC25TDgcK28Yjjh2FLfLhE9GQxye4LBuPrcFoLkJnnGVE25j6OP9i63n1OwOPee8v0osgyinJYfRzqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhNIRmgg+YV3yzFMC9ZjKNgE5z3SDFeekevQRWKMkuk=;
 b=WVZfs0sjuUUCYTDLTB3C5f5oVFkaUAbHv/OsKbzTe2WlNgp2yWdRtlF07QmPGQN+uzsQ0Q0bAVT5OTGkN2Bjrgxqeh+szMuCAgoI6NyobSeW+zU2dYK2oLkANeGpsevKJPp6jTaTkJ0MczyhUFmML8VfhZPj3Yn9KdltXDmYP4g=
Received: from DM6PR03CA0009.namprd03.prod.outlook.com (2603:10b6:5:40::22) by
 DM4PR12MB5794.namprd12.prod.outlook.com (2603:10b6:8:61::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.33; Wed, 25 Jan 2023 14:24:58 +0000
Received: from DS1PEPF0000E633.namprd02.prod.outlook.com
 (2603:10b6:5:40:cafe::6b) by DM6PR03CA0009.outlook.office365.com
 (2603:10b6:5:40::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 14:24:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E633.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.10 via Frontend Transport; Wed, 25 Jan 2023 14:24:57 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 25 Jan 2023 08:24:54 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 4/4] drm/amdgpu: Support allocate of amdgpu_gtt_mgr from
 pages to bytes
Date: Wed, 25 Jan 2023 19:54:15 +0530
Message-ID: <20230125142415.18546-4-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230125142415.18546-1-Amaranath.Somalapuram@amd.com>
References: <20230125142415.18546-1-Amaranath.Somalapuram@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E633:EE_|DM4PR12MB5794:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bdf945c-28f9-4e46-faed-08dafedfefc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nbvTcUdd8hVamAw3+kWUb9yJ35A4Ap6nKNzYs2NToIfSQzz8+E/xEuvXdjkQojqGULLt21teGiq8N7RezJj764IoCjuhUqbjSToFtR6z01sS47kI/xoi05TgokhYvFWhfRtlKM9k6FC8BKlhsyUINm19W3z+CDEeB1268OOa1C8WdVsXu2nhNcas/OpjPJV3oW5pCuIS8j+byoWzl5/c6rdTLn14rZvHOPnb+64jrgjT6btLs5RxxIKxLV4vAYx7nJ4TNWCfiBVLl2B9l4LxE7hufosuL2SwxgFNbAdOR6FHR0RSdziNmK5sZ3slBsXXXWBph56cWdVHtc4OFX3Qxl49MaCXMn4thf6T+9OyHNm3WwNO2db1jJ7N+hmncFeVK6JTBBBtrF/axL9e8nu0WeI9Pyf45pHsTSxSvKspp7ZC5/sR+gUX//efPddtAJjZIgVbi3+sYLRQuesuqhrOe0Fq2Bk+qTGwa5YiWL96m/xz+zD+o+womsLHP5f4cy9lTdx8MoYXyqjaKJQJoOooTmNKM4BK0QKEJZ1WsFSj1GvJZ8eNGQn1eHmbit5pJAR0vS9xSbLHn2BIuCVROTU7aMOweh+SM75janiR42cjXWebKQ6awpE5aXa3P5M3daAhjAo45+ahMh65819sDtgyIVsy6FzVKRTtMSFzdUD5sg6luJ7yJPHXidNh93FJF3lnj/1fCW1gqfisDDzwhrtP4xMor4xrPYRatlcgvyO5GGc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199018)(36840700001)(46966006)(40470700004)(16526019)(36756003)(36860700001)(8676002)(70586007)(70206006)(316002)(86362001)(450100002)(81166007)(26005)(40480700001)(186003)(6666004)(7696005)(83380400001)(356005)(110136005)(2616005)(1076003)(478600001)(336012)(47076005)(54906003)(5660300002)(8936002)(4326008)(41300700001)(82740400003)(426003)(82310400005)(2906002)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 14:24:57.9391 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bdf945c-28f9-4e46-faed-08dafedfefc4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E633.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5794
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
v1 -> v2: reorder patch sequence

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

