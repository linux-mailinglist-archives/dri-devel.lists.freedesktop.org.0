Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DA5666871
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 02:33:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDF010E84A;
	Thu, 12 Jan 2023 01:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B5710E2D9;
 Thu, 12 Jan 2023 01:32:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OyzFT4BrbrIfUVa//9SRlkQG3sHeolHk9BywBtV88IDH4++jPfqDS0RyFiW3oxOK2GkKzJUSoDKS925cNX0/grkdqGKHsltblzwaqHtBIC74q2XPoq6IxSXkL4NW+/NS9xWlkYg/CKt7TdjMGMhFY9lcyeIdSSvz8pseEHimSmxER2Glc7YTHVEvVHhSC/ylNDOux1uUWwcgTk8AssHWAYRu6ugmViB4X4Hc/6O0nsnAU76jq/sdTBcduAsr2lL8CmqNU5YZMgDXK5t+pf+YjU4cbVyYRom0nyy0gglLEcSXqizc5A4/BiH6Zmv/a5JiWvuvFJHsH6iuZENP+3Cmlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dhs0ceRYNkUpFglPWLJH03bvZ9c2a+1Q0JCmLkqt17g=;
 b=XDoGZO0P1fMx/yztIuq9xgHnq9VN8RXYRV3eKGoRIwO/7P8cLZxqlRwP+F/Ipy72Or9iXf8m1hpv4+FGHepw2eWV51RUoP4L2OPs0ntv5dZ7V0MQ9O6UsLpryiDUTfwevRoITShONMYNWJZlyneRAlyCOf6WMfs+ncOydzH8K4G14V8Aj7twmkX62P0Yl2/3lfKbaULofo3LGmS6ON6xoOnCbiL5qe5NH+UDF2rTMMnZDEdQ7KhbjSz01LjgMBHZWsHzpP3tTK4VxqY2R/lNQ2a0Xq7/JrflW6DyOaN28bgaX796pq2OGSltch9bF2aEeDsi04bqiv+QlQ60Il2gmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dhs0ceRYNkUpFglPWLJH03bvZ9c2a+1Q0JCmLkqt17g=;
 b=rWEmK/Y/YPPp8mNEd44b+b984jk8o0cTk/SFOIZBM1l2fgLNXy8fy71k2E9FGghFd2jcdAPIr/c3Ld+5uPR9hVYbw4ZuRBeIyOV6fk4lODRfsezp3bCHEhwQurCa3amJnTyAw2xpHpND1/NA8eN4O5Vg3LjE21Qib1A0JIBbpCs=
Received: from MW4PR04CA0176.namprd04.prod.outlook.com (2603:10b6:303:85::31)
 by IA0PR12MB8254.namprd12.prod.outlook.com (2603:10b6:208:408::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 01:32:31 +0000
Received: from CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::6d) by MW4PR04CA0176.outlook.office365.com
 (2603:10b6:303:85::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Thu, 12 Jan 2023 01:32:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT063.mail.protection.outlook.com (10.13.175.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Thu, 12 Jan 2023 01:32:30 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 11 Jan
 2023 19:32:27 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 6/6] drm/amdgpu: Do bo_va ref counting for KFD BOs
Date: Wed, 11 Jan 2023 20:31:57 -0500
Message-ID: <20230112013157.750568-7-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112013157.750568-1-Felix.Kuehling@amd.com>
References: <20230112013157.750568-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT063:EE_|IA0PR12MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: 973803bd-f1c6-4efb-4d88-08daf43cdf25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RuZfugg9vLqARrLegzMFxUI1SSpBVhcIjKaNxrC8Vptaap3iofigHSNdgTKAV1geXFk8MUrYOeiECu0DOVB+xI9tOAP2brfRMKOp1PE6S8qVy9ABfBCjLzEO4NacFiArNrRmt+1X/5TWZSi9DwDrqjsPel4pRiTQjZcGzwRdljJUScIio09Ni2186OT4/oaUZevcyBMLpbnixNzbkdR/Gh4/nJnbDT9CBldY8Xirle8Hee4gFRL1jmzyyFywoNLYOWuo+yXA5QEPTIzx4HV4S2kDxermswrbU4MtEDcdIaq8/qcUE069pxC2885QohC3KE+HQ3Ym27o5YUttt090FCFNxW34jEQp22BSuehXLV2Y69XLSO5ljXq+puHA8dNfT5aX60vrw3taOQjG98HELhm5dbnjfs19y5QjFWf5NPXzcF/j6bCgS/Gh5oUqs5By78yK7Xm9RvAIPQzXl4+jpQug8ULBIbUHJQW9QHCB5FoM4/mKsq3GnN03sczrALIcWOxf2QpF+gfjrdPG8C8+Wv7i8IUwi4iQjPBXnQBU0nAXR8Q+HAqmO/otEzGYQT5micMCw1DesTKPj19Dc7c3Yf6GLH3BQ6W1OXHhLCR7VJzkek2a0peRPE0GM6JdtrWImpFDPUOPq7SNHu3t62zP3fKxHQYjIQlyOuo11V6Bu88Tgwb9YLqj5Ez/CSp8N8P9MVtHwhI4xubUJw/3PWTEiXD6lGJ9JHaVlitQI1Rui+Y=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199015)(40470700004)(46966006)(36840700001)(26005)(16526019)(478600001)(40480700001)(186003)(1076003)(336012)(70586007)(2616005)(7696005)(6666004)(8676002)(41300700001)(450100002)(110136005)(316002)(54906003)(4326008)(47076005)(83380400001)(36860700001)(86362001)(81166007)(82740400003)(40460700003)(356005)(426003)(70206006)(82310400005)(8936002)(36756003)(5660300002)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 01:32:30.3763 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 973803bd-f1c6-4efb-4d88-08daf43cdf25
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8254
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
Cc: xiaogang.chen@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is needed to correctly handle BOs imported into the GEM API, which
would otherwise get added twice to the same VM.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 28 +++++++++++++++----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index df08e84f01d7..8b5ba2e04a79 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -370,9 +370,17 @@ static int amdgpu_amdkfd_bo_validate_and_fence(struct amdgpu_bo *bo,
 		return ret;
 
 	ret = amdgpu_amdkfd_bo_validate(bo, domain, true);
-	if (!ret)
-		dma_resv_add_fence(bo->tbo.base.resv, fence,
-				   DMA_RESV_USAGE_BOOKKEEP);
+	if (ret)
+		goto unreserve_out;
+
+	ret = dma_resv_reserve_fences(bo->tbo.base.resv, 1);
+	if (ret)
+		goto unreserve_out;
+
+	dma_resv_add_fence(bo->tbo.base.resv, fence,
+			   DMA_RESV_USAGE_BOOKKEEP);
+
+unreserve_out:
 	amdgpu_bo_unreserve(bo);
 
 	return ret;
@@ -785,6 +793,7 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 	uint64_t va = mem->va;
 	struct kfd_mem_attachment *attachment[2] = {NULL, NULL};
 	struct amdgpu_bo *bo[2] = {NULL, NULL};
+	struct amdgpu_bo_va *bo_va;
 	bool same_hive = false;
 	int i, ret;
 
@@ -871,7 +880,12 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 			pr_debug("Unable to reserve BO during memory attach");
 			goto unwind;
 		}
-		attachment[i]->bo_va = amdgpu_vm_bo_add(adev, vm, bo[i]);
+		bo_va = amdgpu_vm_bo_find(vm, bo[i]);
+		if (!bo_va)
+			bo_va = amdgpu_vm_bo_add(adev, vm, bo[i]);
+		else
+			++bo_va->ref_count;
+		attachment[i]->bo_va = bo_va;
 		amdgpu_bo_unreserve(bo[i]);
 		if (unlikely(!attachment[i]->bo_va)) {
 			ret = -ENOMEM;
@@ -895,7 +909,8 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 			continue;
 		if (attachment[i]->bo_va) {
 			amdgpu_bo_reserve(bo[i], true);
-			amdgpu_vm_bo_del(adev, attachment[i]->bo_va);
+			if (--attachment[i]->bo_va->ref_count == 0)
+				amdgpu_vm_bo_del(adev, attachment[i]->bo_va);
 			amdgpu_bo_unreserve(bo[i]);
 			list_del(&attachment[i]->list);
 		}
@@ -912,7 +927,8 @@ static void kfd_mem_detach(struct kfd_mem_attachment *attachment)
 
 	pr_debug("\t remove VA 0x%llx in entry %p\n",
 			attachment->va, attachment);
-	amdgpu_vm_bo_del(attachment->adev, attachment->bo_va);
+	if (--attachment->bo_va->ref_count == 0)
+		amdgpu_vm_bo_del(attachment->adev, attachment->bo_va);
 	drm_gem_object_put(&bo->tbo.base);
 	list_del(&attachment->list);
 	kfree(attachment);
-- 
2.34.1

