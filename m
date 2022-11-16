Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 682DC62B58F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 09:51:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D70610E43E;
	Wed, 16 Nov 2022 08:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF4B10E43E;
 Wed, 16 Nov 2022 08:51:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFqnj8m4S24gdMoxyXhsH+JAWtm0HnO64vYMfvgzIj/VmyKqC/wvEEj3ZxfnLbO1HsswhipWN9nietGDRk0SKOOXvw5YO7BAkxoFgjd25wouXLqIpgZwGrJMsW1HGmEm66GuAuDFMnA5RqQos0+8TjNmVjEkUazIXjVj+yxfTOr3KjCVkh6C0ZET49/QdsslQY/u1efqUDz0EAyzpvYHr4374YFilFIJiNO1u6kX7FIXav5hR7rUUuOCWO64oz7gnUatrtUPQxC8X3HVFSiqFwK4F3sf2N6q1f0hcijC7iAVTLZlDLMCz5fg5Zy+l/FOLXKf14gkTEFHFpeE5jJlzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSXtOr5BnN+I/Tmax0Xm7iuieOr4Ao/zxehZNY+5Izg=;
 b=IwxzWYmi8Izab+xGeUxqxAUbnGczfLkrUbMrnaiuaxS3xlRxzqCM1LRn/CVZhxC8im2wS3/2Z9rc1y+xzkTP5y8TJzs6av9gez4BKvQVWQAFYjtAOfZeq9TP092TpnMsuDz+KegG9pCy/S+Jqj/beeal7xLCGa7VR/XkMBh1qW2MJ4ljHk2MHhfMYN46NHkisyGGybWKFvYy5vdimcHRrBtnSk9pcVHtbnmD/y4gT25uZ9VQ35aLfU6zCRM0xqtmPYhxR/iD6bCbySwqYrqOYy+RDU4awvARkah3sJk5UsEtXaZjclQc3DTFYcMfk6iQKYkLJUQzQ/8E5D+KcCbm7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSXtOr5BnN+I/Tmax0Xm7iuieOr4Ao/zxehZNY+5Izg=;
 b=Uh+Coc/n5r1dden/8NUqshNPqla9k9U7HvQP3ff6kR022anYGTzHX14W9/1t1K93vkMIsqsU90oBQUlZ6SGILoFEqbbBRTXXE2plbGB97YziwPNHePNmZFWRHNmdeqa5RPNP3o+y6aIL1NJN7Jk+VLDLR1prBv0CH/vv2n3G8Cg=
Received: from BN9PR03CA0851.namprd03.prod.outlook.com (2603:10b6:408:13d::16)
 by BL0PR12MB4961.namprd12.prod.outlook.com (2603:10b6:208:1c9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Wed, 16 Nov
 2022 08:51:08 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13d:cafe::a1) by BN9PR03CA0851.outlook.office365.com
 (2603:10b6:408:13d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Wed, 16 Nov 2022 08:51:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Wed, 16 Nov 2022 08:51:07 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 16 Nov 2022 02:51:05 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/ttm: Clean up page shift operation
Date: Wed, 16 Nov 2022 14:20:11 +0530
Message-ID: <20221116085012.187756-1-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT003:EE_|BL0PR12MB4961:EE_
X-MS-Office365-Filtering-Correlation-Id: ccd34a7c-7199-4fd8-ffd6-08dac7afb40a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sG+0S70NxXdRNCx2u1M14159ob1HDwBs9ZDYyPU/zN+DWRi3Zw+Llw2p81AS2lu7Fw8/aB1pYO8OGTa1d3cq/smDDidKxHF8FjMpPKgH91cK3dreOKVkUH8UzZTmgq1rQNNdhv1luZ0H7qv59BgV43DTDNNdCHslyzhaeMMJQKaIIEGkxv8ZDMhl9w4pZ+CAlK+Bg9ByI6spD+I8HqGEsAD32b+B7pcQ329MvoaOKlxd2+Ev3lhK8cbHYm6o5zY8DXvN2jUy5KSv4q+qGv8c1qWvxz+fyHOl5DexHO/tBF6TE6kJ90m91uGNvDIwU21aORM13ZsLBDPVA6ahmVbsbXetEEjmQtvXskxmlddX8U9JYBVTkPi7+Dd3Mg1JDk9+oHi3xJduxTQ7xuYRPag9duckUXSRmy1A+MW2L/qFzRzKOVBy9cinF6cS6glljzbJBGBexS3lZW2nLW0gJ+LA4mXrjTxHuQGlOUAZfaO5gRsbY6ourq4otEy7Q0sQbcWu5ToJkbbEf/F+iwVSWLQatgsg/6gZRjQU+SbOiY5ypS5qkxet5uf5nnH9rgTzMLGSoMmdoN9SK5QLuZCUeoEsKm/CqNbdbBH47f0stmvCWeRfOfrYcuhyT9ePDnHOFc7qZdnXaKP+px3popxJi4YxHGW7SXghu8jUNsNBe7ZGDKV2KeV6oWyp8AjVqGNYcvLJ3tR6l0Gvm6nthD87RdAYPdQGCrsGdOi2Rh+D/ZDxhPYPo0ySds1AtJFShGa962QAjJ7WhcTejShy3YpSPV76md3bRHnQA5UgqZAggYdsxCTYQls8T8dtKvvRyrU2F3hm
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199015)(40470700004)(36840700001)(46966006)(450100002)(2906002)(70206006)(70586007)(8936002)(5660300002)(8676002)(4326008)(41300700001)(6666004)(54906003)(7696005)(26005)(110136005)(356005)(316002)(81166007)(47076005)(83380400001)(16526019)(186003)(1076003)(2616005)(426003)(478600001)(336012)(36860700001)(82740400003)(36756003)(40460700003)(86362001)(40480700001)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 08:51:07.9701 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd34a7c-7199-4fd8-ffd6-08dac7afb40a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4961
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
Cc: alexander.deucher@amd.com, Somalapuram
 Amaranath <Amaranath.Somalapuram@amd.com>, arunpravin.paneerselvam@amd.com,
 christian.koenig@amd.com, shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

remove page shift operations as ttm_resource moved
from num_pages to size_t size in bytes.

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 4 +---
 drivers/gpu/drm/ttm/ttm_range_manager.c    | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 974e85d8b6cc..19ad365dc159 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -541,12 +541,10 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA)) {
 		/* GWS and OA don't need any alignment. */
 		page_align = bp->byte_align;
-		size <<= PAGE_SHIFT;
-
 	} else if (bp->domain & AMDGPU_GEM_DOMAIN_GDS) {
 		/* Both size and alignment must be a multiple of 4. */
 		page_align = ALIGN(bp->byte_align, 4);
-		size = ALIGN(size, 4) << PAGE_SHIFT;
+		size = ALIGN(size, 4);
 	} else {
 		/* Memory should be aligned at least to a page size. */
 		page_align = ALIGN(bp->byte_align, PAGE_SIZE) >> PAGE_SHIFT;
diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index 0a8bc0b7f380..4c7cba4ffdbf 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -83,7 +83,7 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
 
 	spin_lock(&rman->lock);
 	ret = drm_mm_insert_node_in_range(mm, &node->mm_nodes[0],
-					  PFN_UP(node->base.size),
+					  node->base.size,
 					  bo->page_alignment, 0,
 					  place->fpfn, lpfn, mode);
 	spin_unlock(&rman->lock);
-- 
2.32.0

