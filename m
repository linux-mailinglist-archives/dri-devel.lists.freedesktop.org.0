Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3F26304B2
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 00:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FE910E82A;
	Fri, 18 Nov 2022 23:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAEF810E81A;
 Fri, 18 Nov 2022 23:44:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+ooGHSd4RzNv6ABCpqot2xp3nSyDNoL2nfIlIUpHslSdRJP0XaxcwfGysvHePexhzSZJTcSXEdYOtwsTbm3AkSTESk9EC+iMJJxrIAAY6UuzWH/yRNsfC9JJun/U+6s15K1603x7nOJGkEkb6yKWAIlJNNOIh1d5q3glIzGpHoDRZXCgqWaUCysCufpPCAVzUdTIn9SetxjcXNhlhHrgURanb8tSr7q80UEhNM/Sb65xqxqxdCk9hqgrrCHvadK4NuIxFkF+Lz4MqlEmKlwdS1Tv3I5oH9mTwptTBk4iJ38q4Kq+eN60npbbajNqUEDWw3sZP0hV+X2A5JhyMzTfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4yzmwS1Qh4YoaxEWo8BJZa5KmJMGPv/L2JuTUnDtbo=;
 b=Vtst5ed64TbIADFZV2Kdpse4aun6VrMDsqPd70vOTeJFwsFeHcqqbrZdVhKlYvATry/JSj1cyaW8/Y+M3G7gPWq9P0PB47DG0iD6ZHmZsB1p6+cQaPJwOya0S1BFqC/M3jq9Z5DcF1ZTGjjl8Hqfm/m07oIRt1HbV9mHiUfc7ZBRzkBlYjBrOjcNz9HLZBnfWSCRMWT7DOpqwCNqWtMdtycV3/nfcK2ffic3MjFXr8ffwmVDVHsirpvkvN93CbwPe9Q6QOqJr6ZZwcI0UZ9bWTsoMhVXrFuAOuPChriJ2qXloElq8xo2yAbZLcsV7k/eWBa8FLZZAnR056bw9npE3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4yzmwS1Qh4YoaxEWo8BJZa5KmJMGPv/L2JuTUnDtbo=;
 b=5rYdmtypV21CA1XD6pMXbCxceRx6ZhVYy0ALMMtC7VdPxaMocc8Ja11+KMt8Z4vHu686UMWgserde2SxcWFBT4EgCKPugEgBbO9ze+pcnZ75TpihNBtC/h9Aop1tnwnLZ8HopNUG6MNefNQRfu1RcjL+qioptWaImUsTiCUyRC8=
Received: from DM6PR03CA0057.namprd03.prod.outlook.com (2603:10b6:5:100::34)
 by MN2PR12MB4173.namprd12.prod.outlook.com (2603:10b6:208:1d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 23:44:39 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::3) by DM6PR03CA0057.outlook.office365.com
 (2603:10b6:5:100::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Fri, 18 Nov 2022 23:44:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 23:44:39 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 17:44:37 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 6/6] drm/amdgpu: Do bo_va ref counting for KFD BOs
Date: Fri, 18 Nov 2022 18:44:22 -0500
Message-ID: <20221118234422.1468806-7-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20221118234422.1468806-1-Felix.Kuehling@amd.com>
References: <20221118234422.1468806-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT014:EE_|MN2PR12MB4173:EE_
X-MS-Office365-Filtering-Correlation-Id: dbf9a182-dbd3-4d9e-ef02-08dac9bedbbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RJJopOItqbTPsk2xtRYWEZ2zOgPgLKkpDm+5hEoHqfcpFEgKHGqcnVa/7t8dwgTNKWSZnZrTzO4al9uLuZAYdQre60XIihOE6illxrtw2nc7c0ea9qMUkqbzBeCcO7srTNKo9HoXouoOBo4SJ9R1tuYG6CME5DlFmxSRvq2M5UhSDWNCMno6y2b8ynthKVu708H/A9crJs/1C2d/J7jXsVlv80oyJ7sf21dm75I/oZhtFB5x0NbZZcg3cNomEXoAnwdphz77MITNCMMOrInkhy86HdVfWonT/XNyaFIkxfsZBJGse1tmLEyrN9mJ1uM68dbNdaZYFXIyTPzEJO/+GjN5tZEhjf99TWEOcae5TF3Bxd5nl78RhaslE1zaOr+D94z8IXNjqpwa+r1Ru5rNbl8dQMazDNiHVcbz5czsYUjBgZxXU7xqdweDGnYcX5bcBo5fUqweSmGVXt+ZeAoacsHvFIKMSLomMF1iE5Lsms3Upfz/pYpp+NiLSlptJ6yMKZoPNWNdhHc84zS5A4omxzzN4tdhjsCVKIKuLg5BPin7drwKlIWuPCoGSjUA7IQwgPEgQZg0oCsDttvxDWhRS4swFkf2dYtZRb4fOEzn8wAr31vQnEI1n9AUeUS5LvPTogeL06WcFYctS/ZiTmJ7i49sI1gwXc19zisiLrS3Z6SGf9ffl9TxAXJ+gTheYQiwRwrSrUW1TXLhUIARfXgTMc5aPaPDryhMoDM/vJ1gSlw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199015)(40470700004)(46966006)(36840700001)(82310400005)(356005)(82740400003)(316002)(26005)(8676002)(70586007)(86362001)(70206006)(81166007)(36860700001)(83380400001)(336012)(2906002)(1076003)(40480700001)(36756003)(47076005)(2616005)(426003)(450100002)(41300700001)(5660300002)(40460700003)(186003)(16526019)(8936002)(478600001)(7696005)(6666004)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 23:44:39.3257 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf9a182-dbd3-4d9e-ef02-08dac9bedbbe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4173
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is needed to correctly handle BOs imported into the GEM API, which
would otherwise get added twice to the same VM.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 28 +++++++++++++++----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index ecf81f27cb4b..68e794cad647 100644
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
2.32.0

