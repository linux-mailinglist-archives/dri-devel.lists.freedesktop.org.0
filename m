Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F00CF6304B1
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 00:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213E610E828;
	Fri, 18 Nov 2022 23:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9DC110E81A;
 Fri, 18 Nov 2022 23:44:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldAM371+jgjcQWbyVr4wExCbM/7yaIy7+t0gaLFdq8JoyMgW3/SJsGxYp66SFbuJy0/yCnXNgeu3Yz5QGJQaX33QNBPB3P3YA7GnOFiooz3l7dsNBPl9XtoPe721aDfuX628DX+HSqj0FnigKr6Z5UUheRjDy1jYu9XrwoGquQouWsbM2xKdxdnYgJciXjFVLyCYajYHt9znSMXf+f9b7ZizRX6t+ocaP24E86dGj2vfCfXrMae0cLoJ5GTmn/S1BduhfGI3vGBuySyLCLBwPjF378kzAVJDxkWad1B1mC8tfRy6+aSozSodhpFMP5deFFqItEZt1Ry1ba8n35sVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNa+0jXg3zotebl8DF+7mkWyGFevVD+e6cAVXyH7dmE=;
 b=VaO/lB4jGBmkRJuJmJXLuXLs5Rkp0xxBgI7Qgq9gylmsu85/DpAx2o5k5g0BtKWd5+2MokWVZu/KHW8Oms3/SQUGyITJXyYNiPL6NOqjKQ8b64ff8sZb7z5uSlOQMQbvmfuT4C715Qt8MnJYIwjG4CMqp+wiPqm+icXOzMI1zxHa7PZr3nso4CCutAaCpyLYpdzq1OaoSnhS6r+I0DuUy18EEXFxE2h+KLYTaE00qjEkYM1NGWx0AxZL/48qPRNUzY/yOBLTYQYIy228OK7kWSDntWhKWXLubH6eUZ9TfPCee5zqfJs8WY/c/UGHJ6Q78cGOzdsqG7nJQFmUEieiQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNa+0jXg3zotebl8DF+7mkWyGFevVD+e6cAVXyH7dmE=;
 b=WASA9L3y7ZXareBTUrWeYvgeuXId4k2N3G6YCFP+fpdIzerm+lgn7RsQqtij5Dkf/5HazhZXWIJ9tSK8kjdaMNYF3GIxEuzlEfhe86iiavJcQ+HlAZulXzEqmR5k6ChqA6Khpu+Upd/SxSfuxsmP4RmZetXJwjgxdwIy6D6emeo=
Received: from DM6PR03CA0050.namprd03.prod.outlook.com (2603:10b6:5:100::27)
 by MW4PR12MB6900.namprd12.prod.outlook.com (2603:10b6:303:207::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Fri, 18 Nov
 2022 23:44:38 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::1b) by DM6PR03CA0050.outlook.office365.com
 (2603:10b6:5:100::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Fri, 18 Nov 2022 23:44:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 23:44:37 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 17:44:36 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/6] drm/amdgpu: Attach eviction fence on alloc
Date: Fri, 18 Nov 2022 18:44:20 -0500
Message-ID: <20221118234422.1468806-5-Felix.Kuehling@amd.com>
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
X-MS-TrafficTypeDiagnostic: DM6NAM11FT014:EE_|MW4PR12MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: 7054f08b-b194-4271-9a09-08dac9bedae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: meXNt2k9T1v7+aEpZAVGPC9BZmxbR1FAyiMQPUSmKo/CNMoS0DNohPnG2q7ECrTlngq5k5RPxhE9aMFWrI0x/li9yJ7TsSCaV+Uk6/UDFn9uD9HZNxmXpww4mlsxcROz1T6yD0/1hW2u4Kgjw7xrvDvLjgUgHXqesQmjlCFLroihWiiHCxIogAta9hCmexxP80ovkN+nR7hHTFNuvHAIeEIcmAu55mh7yzKNtO2dTyRQcR+6aW2UeYx5ar4sLK4nbkOE6XfUj2U3hYWRmFUqnYtv8vQ41CIxWfGDj1AIKhJD3Rue0Z3wRsUZ2eEiwxJGHLkibreQOjnnfnTFVEKXVhjPPG32lrsVhxcrg4g7CfZf44fYum7N6/nFew+E1DP+yh4clqyNqh9qYoXeRnUhKjCqM6Lu1Ci6n3yymNOKV1+Mtcd284Eljuj2aP+tugwIpRCA9xKQtnaH7ib8hHd1ZrNx29HKN1F1mjArurdAztM+afRDJusibW0FqVu5t/xF4AnojCytsUhgCP1pao2bOvZhF2jWD7BdpQyjotBiSQJf+2V8uZCYHm5XuXsxfSItuWCEuz/GNItKrD5YE1wuNv1k2eJEVr9GzHz+U3PRXqOZCePtxIbeeiv3mDK1CQ90H9m5WfK0gjIn0csTcbNR5GkDKX26bc8pld1cdbe6AJaiFaoh029bKGbiAU/UOyI4yhlQa9nbiovSOioToE74v6VwS9CpdR/tt52H/CCNu6U=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(396003)(376002)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(70206006)(450100002)(2906002)(8936002)(81166007)(36860700001)(70586007)(82740400003)(36756003)(356005)(8676002)(40460700003)(5660300002)(83380400001)(41300700001)(40480700001)(478600001)(110136005)(7696005)(6666004)(26005)(316002)(426003)(86362001)(2616005)(16526019)(47076005)(1076003)(336012)(186003)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 23:44:37.8883 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7054f08b-b194-4271-9a09-08dac9bedae3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6900
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

Instead of attaching the eviction fence when a KFD BO is first mapped,
attach it when it is allocated or imported. This in preparation to allow
KFD BOs to be mapped using the render node API.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 63 ++++++++++---------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index bd36636a9596..e13dff75ca5c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -360,6 +360,24 @@ static int amdgpu_amdkfd_bo_validate(struct amdgpu_bo *bo, uint32_t domain,
 	return ret;
 }
 
+static int amdgpu_amdkfd_bo_validate_and_fence(struct amdgpu_bo *bo,
+					       uint32_t domain,
+					       struct dma_fence *fence)
+{
+	int ret = amdgpu_bo_reserve(bo, false);
+
+	if (ret)
+		return ret;
+
+	ret = amdgpu_amdkfd_bo_validate(bo, domain, true);
+	if (!ret)
+		dma_resv_add_fence(bo->tbo.base.resv, fence,
+				   DMA_RESV_USAGE_BOOKKEEP);
+	amdgpu_bo_unreserve(bo);
+
+	return ret;
+}
+
 static int amdgpu_amdkfd_validate_vm_bo(void *_unused, struct amdgpu_bo *bo)
 {
 	return amdgpu_amdkfd_bo_validate(bo, bo->allowed_domains, false);
@@ -1709,6 +1727,11 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		}
 		bo->allowed_domains = AMDGPU_GEM_DOMAIN_GTT;
 		bo->preferred_domains = AMDGPU_GEM_DOMAIN_GTT;
+	} else {
+		ret = amdgpu_amdkfd_bo_validate_and_fence(bo, domain,
+				&avm->process_info->eviction_fence->base);
+		if (ret)
+			goto err_validate_bo;
 	}
 
 	if (offset)
@@ -1718,6 +1741,7 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 
 allocate_init_user_pages_failed:
 err_pin_bo:
+err_validate_bo:
 	remove_kgd_mem_from_kfd_bo_list(*mem, avm->process_info);
 	drm_vma_node_revoke(&gobj->vma_node, drm_priv);
 err_node_allow:
@@ -1788,10 +1812,6 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 	if (unlikely(ret))
 		return ret;
 
-	/* The eviction fence should be removed by the last unmap.
-	 * TODO: Log an error condition if the bo still has the eviction fence
-	 * attached
-	 */
 	amdgpu_amdkfd_remove_eviction_fence(mem->bo,
 					process_info->eviction_fence);
 	pr_debug("Release VA 0x%llx - 0x%llx\n", mem->va,
@@ -1905,19 +1925,6 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 	if (unlikely(ret))
 		goto out_unreserve;
 
-	if (mem->mapped_to_gpu_memory == 0 &&
-	    !amdgpu_ttm_tt_get_usermm(bo->tbo.ttm)) {
-		/* Validate BO only once. The eviction fence gets added to BO
-		 * the first time it is mapped. Validate will wait for all
-		 * background evictions to complete.
-		 */
-		ret = amdgpu_amdkfd_bo_validate(bo, domain, true);
-		if (ret) {
-			pr_debug("Validate failed\n");
-			goto out_unreserve;
-		}
-	}
-
 	list_for_each_entry(entry, &mem->attachments, list) {
 		if (entry->bo_va->base.vm != avm || entry->is_mapped)
 			continue;
@@ -1944,10 +1951,6 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 			 mem->mapped_to_gpu_memory);
 	}
 
-	if (!amdgpu_ttm_tt_get_usermm(bo->tbo.ttm) && !bo->tbo.pin_count)
-		dma_resv_add_fence(bo->tbo.base.resv,
-				   &avm->process_info->eviction_fence->base,
-				   DMA_RESV_USAGE_BOOKKEEP);
 	ret = unreserve_bo_and_vms(&ctx, false, false);
 
 	goto out;
@@ -1964,7 +1967,6 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
 		struct amdgpu_device *adev, struct kgd_mem *mem, void *drm_priv)
 {
 	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
-	struct amdkfd_process_info *process_info = avm->process_info;
 	unsigned long bo_size = mem->bo->tbo.base.size;
 	struct kfd_mem_attachment *entry;
 	struct bo_vm_reservation_context ctx;
@@ -2005,15 +2007,6 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
 			 mem->mapped_to_gpu_memory);
 	}
 
-	/* If BO is unmapped from all VMs, unfence it. It can be evicted if
-	 * required.
-	 */
-	if (mem->mapped_to_gpu_memory == 0 &&
-	    !amdgpu_ttm_tt_get_usermm(mem->bo->tbo.ttm) &&
-	    !mem->bo->tbo.pin_count)
-		amdgpu_amdkfd_remove_eviction_fence(mem->bo,
-						process_info->eviction_fence);
-
 unreserve_out:
 	unreserve_bo_and_vms(&ctx, false, false);
 out:
@@ -2240,8 +2233,16 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
 	amdgpu_sync_create(&(*mem)->sync);
 	(*mem)->is_imported = true;
 
+	ret = amdgpu_amdkfd_bo_validate_and_fence(bo, (*mem)->domain,
+				&avm->process_info->eviction_fence->base);
+	if (ret)
+		goto err_remove_mem;
+
 	return 0;
 
+err_remove_mem:
+	remove_kgd_mem_from_kfd_bo_list(*mem, avm->process_info);
+	drm_vma_node_revoke(&obj->vma_node, drm_priv);
 err_free_mem:
 	kfree(mem);
 err_put_obj:
-- 
2.32.0

