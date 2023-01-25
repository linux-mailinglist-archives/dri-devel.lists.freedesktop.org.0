Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C950B67B051
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 11:49:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D457510E781;
	Wed, 25 Jan 2023 10:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF6C10E782;
 Wed, 25 Jan 2023 10:49:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1kQTX0O8NQMSCQPc9lWuChhQ85p1tJXds/rK72wbxTLJzoaRezx4onCKhWiI0MhHmyrPXCAr4FwRF9VtnVU0SddF8tmAVuCpwULYGYuDELhrHY7HQb3Ys+DkLN16SoJ4i4dZvsm3SZfDQWylhyCrh9OxKs2TBPIdm0To/uqTjTlU5VGgsroMr8XyEhJKYn9kh+5SCpyGdL3gGMcAI6UQA7WroyhfCJLfPoF8s6KAmAms2WITD/txlSPniN7Oix+VbOZuVWV7fVEEGYLHBz8jPqxSHKcL0M2uac7YPq3CeVtPbPd8XTyDv/b4fh3eF+DDTviKboTptvBckCeQ30xmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhNIRmgg+YV3yzFMC9ZjKNgE5z3SDFeekevQRWKMkuk=;
 b=nqixvz1r6oSLwj72+B4BzTdVO7keu9f526i++5A7TYv8jAyjIk6jIF8ir2F8WgnNSdNgHEuY+znkZHNTnCv9eqoaCuvarAW39IpAuytmE5vBfK5hYbAnlY2AWEWER35PVPa6nXtJuA9X0OZ3gL5jjZQ5+mR6NzTS47yU25E3IuaQ62wSY8uvWQN8p8f+CtmbItnKO4Pv3zxLvvMsQByF9Qm633zHw1jPmyKQjYcPcX0XfoVd0s4yABur1q8fD7KmZm5Get/JaPASBuI1Baf9/TGrgglRSFHibgAAjQ2qGZvuV351UVHQJWD5GeBu3N+OBr80j310MJe3hNlrMucCzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhNIRmgg+YV3yzFMC9ZjKNgE5z3SDFeekevQRWKMkuk=;
 b=13a0swD9DxnQwqbIWsTPwunVWuj1ZdR3q7L1MV9EM/nYcZXb74B8oiIleoGmMc8uEdTICqKionUB6v3wk1iEx6fV3KhKVJRVHoZAZGeWcJOoCdYD3Ay6AbKpDg3Xz6DeTpqw5AZeGmZ+V4QrphFOgjaWlEHC4CbVMzXTxqe8Iic=
Received: from BL1PR13CA0316.namprd13.prod.outlook.com (2603:10b6:208:2c1::21)
 by PH0PR12MB8173.namprd12.prod.outlook.com (2603:10b6:510:296::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 10:49:23 +0000
Received: from BL02EPF000108E8.namprd05.prod.outlook.com
 (2603:10b6:208:2c1:cafe::7c) by BL1PR13CA0316.outlook.office365.com
 (2603:10b6:208:2c1::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.16 via Frontend
 Transport; Wed, 25 Jan 2023 10:49:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000108E8.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.10 via Frontend Transport; Wed, 25 Jan 2023 10:49:22 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 25 Jan 2023 04:49:19 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v2 4/4] drm/amdgpu: Support allocate of amdgpu_gtt_mgr from
 pages to bytes
Date: Wed, 25 Jan 2023 16:18:38 +0530
Message-ID: <20230125104838.23596-4-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230125104838.23596-1-Amaranath.Somalapuram@amd.com>
References: <20230125104838.23596-1-Amaranath.Somalapuram@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108E8:EE_|PH0PR12MB8173:EE_
X-MS-Office365-Filtering-Correlation-Id: f2b58ff3-1c8c-4354-4838-08dafec1d1c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mXZuYTzq3BiGvvvjCymFp/pTNfLIAENCZ8MrGiWB3FvUGwZWtAkUN6JZ65ENZEpZwGLxlvZ+UEm+5KzbVhDT4LDQCyviMCHvig/wahTo9fQ+jEeSE0w1j1IccPMe0sM9HiF6m5Y4E+wMGYshZZIFhn3JYkMT18hUbiffuXRe5Pda6lMjwxX3lSIKgRJx/ZDilRr/INwrbiUMqtPG9IZal+9XsRPxE+39d0fXRTBLMJtGfaUcqSabd6fEXxtNOsKw8A3PzUBmTdEooLXZPgIWIOsbho66ib838heWD4h11UcIiODkPCYoyFw7U75RXWsk5CDvCOHeBVU8Hqwx9La0Md1zV2RCWQJZwXM4FZJ5wy7VKOuHC0z+PJxzLySPJpYSUy+BQeVBkffQyCnuFFX7PKakpVmfhvFIvjlxgsqnJezyOCVgw4Bzw85d74uLDbD6zPS0xV9TnPdSxj0Jnh2hJ2UHhaQjfC7q1HaviTxnBPAPEDEDjjORMI8+vqVrcHMUm2FU63Hm/+GwSKCe6E4Cg3w+CeUBPm1kQUU1AaaF5eGyfEX0mcD3xoLWAWmfCMSneJ+8RRyew0oZjYXGlKAUQGK0d+TxnAhFoOx8K+hsiv7ByTq2f5698Baxf2HPMeN1USIeAHRQmdYuLaTFUjZVVvzzbUBanbRoRrBB4SAoMjAN9i0vth8zS+Uhr1YRrYYidguKZcuzn20n2+IKyH7CHA2gyZRhfbwpjaAVxUYT+uI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199018)(46966006)(40470700004)(36840700001)(7696005)(186003)(82310400005)(86362001)(6666004)(26005)(478600001)(316002)(16526019)(54906003)(36860700001)(40460700003)(110136005)(40480700001)(450100002)(70206006)(70586007)(8676002)(4326008)(81166007)(356005)(426003)(41300700001)(2616005)(36756003)(336012)(8936002)(47076005)(1076003)(83380400001)(82740400003)(5660300002)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 10:49:22.7675 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b58ff3-1c8c-4354-4838-08dafec1d1c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000108E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8173
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

