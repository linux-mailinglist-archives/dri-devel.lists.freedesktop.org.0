Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A067CCEF2
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 23:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B72B10E33E;
	Tue, 17 Oct 2023 21:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D3F10E332;
 Tue, 17 Oct 2023 21:14:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lS6sFe3DZPDmb0s0LO9KmdVyMUlki8uGfkDrKbt5TTnmRNKjLaejRyZCAS4jDjX1dLBdfcfH56lPPOMnYv7TgL23ed6fzv28o1Dr4SKhLNib+Nec5UJOUEgnAUlGM37SAPWqaUE+n01W4LoqjtUzJujZ+wKr7R7beJ2aMoUhgrU5FOAVUSHdiD8enhMozzF0I5FALL5KsmkyarpOKghOXqpQibgBrJXDeMI+R5NmV8PfcIn5RT0JrL+iWlSKDJziDVCyFEv4vntcGgak/WDZnMUHnM68YfF5N2146xdecsjAIr2oc8Mqb0d9xhytlO1JmpkCp57IcsB/gbg/gmOLXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3lDHuqCY7ieEjAggHysdKnqNvMxZgEGftYuBviYuIM=;
 b=NP2I/TNrKnxKPtmv2Rlnlhhac/pGSLXhAGZgMafgO0tdNBXo2eJfZ6stMAe/wcBQwABesL4REdg3OOGfju+7AzhY0m/uBAml0yRjRx+KJHsNVxrZHuGgPGw1yGobP4/Ljz97tLP9ySgYuHO3VcYlChj36EZpWh7pNhkeUomIaOi54uuvFHhAahO+9mjtipZv4yhSvHpUDdZHwpFm9O7GZGIGDUnTOumnNa00LVzbOVGhMMH+sujRW0W1p4vPR4Wm/13YbzGxWOeL3/LSTipaZgCNFX+yBVHykck2x5ND8YlTjBm55qkrAFvkCYuSRNFRh4WCD3xn5DuKlZT1yOXWMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3lDHuqCY7ieEjAggHysdKnqNvMxZgEGftYuBviYuIM=;
 b=HYlfNUke8o9Dc5MjZXDYHO1Be0CfshqGluwjNoqb0kSerG+1DXtB0UDNwTlnGgaCTlFct6bapPQ0f+Cn9zMefbWf3ncBZ1GVXyH9tTqPxvtjpXsEzorOLgyuvNaFLkgmCw3DXE15M6D9tb71DDFJjqleoqRThxcP+Qlp2yaeNqs=
Received: from BL0PR02CA0025.namprd02.prod.outlook.com (2603:10b6:207:3c::38)
 by CO6PR12MB5492.namprd12.prod.outlook.com (2603:10b6:5:35d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 21:14:24 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:207:3c:cafe::b1) by BL0PR02CA0025.outlook.office365.com
 (2603:10b6:207:3c::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21 via Frontend
 Transport; Tue, 17 Oct 2023 21:14:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 17 Oct 2023 21:14:23 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 17 Oct
 2023 16:14:22 -0500
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 04/11] drm/amdgpu: Attach eviction fence on alloc
Date: Tue, 17 Oct 2023 17:13:30 -0400
Message-ID: <20231017211337.1593869-5-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017211337.1593869-1-Felix.Kuehling@amd.com>
References: <20231017211337.1593869-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|CO6PR12MB5492:EE_
X-MS-Office365-Filtering-Correlation-Id: 55d558d7-3a33-4204-c893-08dbcf560997
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5VmCZexjBaJznfKWDRIhFEc6Ea2thRPhVj8j73RYYXyUkaHmGpwhs3+tlrJ1GXwDzIYnelT2r2D+Vi/9v/U8gwOKPIEz0I3RDI4eKvSTc5fZB89TwTd5U8vkRnfdX5NHwGknQkvJIMukvDtey5Dws5+i2oLxCzZFQWpgYVCs6Vrc94J1HrjtpY8pJaSKWsLcYu1Ia3muEDt9rlmJ0k2E6oD+iA/jQFsWLq3gAobGxhcu8c6cLfZRJLE+KHnuDD4TGTyj3/AAIdljO3shVicMMFqyY4LfuayTIx3xlceB2EQFnKO3K9hGX6OOnjF5pg9rDoFyhaLDQN0NZbUvmANvLMfiljc+gW3Ct8eNB5qjBCybEnkTgiLWKrjGqyMw0Z4oQi3dgcB+YYg8DEkxW2uoSwuMeMiPc/J3jSfwYTeJLb1cu4WSF4cBvRnJo59oj6i+FqSNylSaXMjIkReyT2bT5cwTm/KFMxz7YbwYyEjtQOyoajoDeJ3KR5kH/fKn90qSYX6I3Bh6V7H1Q+jGblWzIelTzwcgihnnG26/dweowPukBOXS/vs9bEpCW9ymDC3O2MTmNJ2vlm9zd08Nxik+ZFgRAt1Uz5s18Mn1phYoU1EgYtb2yNR1QloEvoLcaf7ggAVZ8hWfJKp3G6NS7n3BZ3eMdqmmrW0uhvrSMeayUWzI5nTHRp0g/VWcxncWBNMk6qDUJB4ryHf6WXovi1A6CnJ28XgZj0rVlUDwO/T0N6abaF0vz/D5uoD8KTf3vcoDCdQKQdseD6pcEZtYm/vTrA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(39860400002)(396003)(346002)(230922051799003)(186009)(64100799003)(1800799009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(70206006)(1076003)(70586007)(478600001)(2616005)(426003)(316002)(110136005)(66574015)(16526019)(7696005)(2906002)(54906003)(8676002)(4326008)(5660300002)(450100002)(41300700001)(8936002)(26005)(86362001)(82740400003)(47076005)(6666004)(36756003)(83380400001)(36860700001)(81166007)(356005)(336012)(40460700003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 21:14:23.7823 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55d558d7-3a33-4204-c893-08dbcf560997
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5492
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
Cc: Xiaogang.Chen@amd.com, Ramesh.Errabolu@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of attaching the eviction fence when a KFD BO is first mapped,
attach it when it is allocated or imported. This in preparation to allow
KFD BOs to be mapped using the render node API.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 79 +++++++++++--------
 1 file changed, 48 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 54f31a420229..7c29f6c377a8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -423,6 +423,32 @@ static int amdgpu_amdkfd_bo_validate(struct amdgpu_bo *bo, uint32_t domain,
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
+	amdgpu_bo_unreserve(bo);
+
+	return ret;
+}
+
 static int amdgpu_amdkfd_validate_vm_bo(void *_unused, struct amdgpu_bo *bo)
 {
 	return amdgpu_amdkfd_bo_validate(bo, bo->allowed_domains, false);
@@ -1831,6 +1857,15 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		}
 		bo->allowed_domains = AMDGPU_GEM_DOMAIN_GTT;
 		bo->preferred_domains = AMDGPU_GEM_DOMAIN_GTT;
+	} else {
+		mutex_lock(&avm->process_info->lock);
+		if (avm->process_info->eviction_fence &&
+		    !dma_fence_is_signaled(&avm->process_info->eviction_fence->base))
+			ret = amdgpu_amdkfd_bo_validate_and_fence(bo, domain,
+				&avm->process_info->eviction_fence->base);
+		mutex_unlock(&avm->process_info->lock);
+		if (ret)
+			goto err_validate_bo;
 	}
 
 	if (offset)
@@ -1840,6 +1875,7 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 
 allocate_init_user_pages_failed:
 err_pin_bo:
+err_validate_bo:
 	remove_kgd_mem_from_kfd_bo_list(*mem, avm->process_info);
 	drm_vma_node_revoke(&gobj->vma_node, drm_priv);
 err_node_allow:
@@ -1915,10 +1951,6 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 	if (unlikely(ret))
 		return ret;
 
-	/* The eviction fence should be removed by the last unmap.
-	 * TODO: Log an error condition if the bo still has the eviction fence
-	 * attached
-	 */
 	amdgpu_amdkfd_remove_eviction_fence(mem->bo,
 					process_info->eviction_fence);
 	pr_debug("Release VA 0x%llx - 0x%llx\n", mem->va,
@@ -2047,19 +2079,6 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
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
@@ -2086,10 +2105,6 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 			 mem->mapped_to_gpu_memory);
 	}
 
-	if (!amdgpu_ttm_tt_get_usermm(bo->tbo.ttm) && !bo->tbo.pin_count)
-		dma_resv_add_fence(bo->tbo.base.resv,
-				   &avm->process_info->eviction_fence->base,
-				   DMA_RESV_USAGE_BOOKKEEP);
 	ret = unreserve_bo_and_vms(&ctx, false, false);
 
 	goto out;
@@ -2123,7 +2138,6 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
 		struct amdgpu_device *adev, struct kgd_mem *mem, void *drm_priv)
 {
 	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
-	struct amdkfd_process_info *process_info = avm->process_info;
 	unsigned long bo_size = mem->bo->tbo.base.size;
 	struct kfd_mem_attachment *entry;
 	struct bo_vm_reservation_context ctx;
@@ -2164,15 +2178,6 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
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
@@ -2400,8 +2405,20 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
 	amdgpu_sync_create(&(*mem)->sync);
 	(*mem)->is_imported = true;
 
+	mutex_lock(&avm->process_info->lock);
+	if (avm->process_info->eviction_fence &&
+	    !dma_fence_is_signaled(&avm->process_info->eviction_fence->base))
+		ret = amdgpu_amdkfd_bo_validate_and_fence(bo, (*mem)->domain,
+				&avm->process_info->eviction_fence->base);
+	mutex_unlock(&avm->process_info->lock);
+	if (ret)
+		goto err_remove_mem;
+
 	return 0;
 
+err_remove_mem:
+	remove_kgd_mem_from_kfd_bo_list(*mem, avm->process_info);
+	drm_vma_node_revoke(&obj->vma_node, drm_priv);
 err_free_mem:
 	kfree(*mem);
 err_put_obj:
-- 
2.34.1

