Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3121D8017D4
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 00:36:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6721010E996;
	Fri,  1 Dec 2023 23:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A85610E091;
 Fri,  1 Dec 2023 23:36:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRBXuAkHL2wuowt5+YgFiwVO8TmamyeSSYbDZxjKHhzdTfDRzVRUzSoxm5cLHCUiBPSbPmAk1eDxVf+kJG5jqLsv8+AdkdNM0fANLR6gsA8WwEK54UVLBckCH+/kSD1Kl1dV45DY8l4mIYnHkHSSBGjE31xEUW5yh73tXBTyr/kgbQ3WT3ftat7JTHG8pL9gK22mB6sTXN1l2Aes7zjseXv/IUsFk6BAGlx0k0ildeOVdzdya4spVQqdDdRVKzClPJTqJhUcLQ/e9gj2I71oX8tfJ57m1LSj7h402PGUn9PSkRYKyzfwyyGFm6VqjYQ5DaU1Nxf6r+Y4mLzqb92U0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/xifRR7RGDhixuRhO+IyWYQzdIbRg1Rtcp1JQK82g4=;
 b=duf6lZNWQwlQv2FYXqZMJ+3RAx9qqhytYuuj5MjqVVqPNJGceW6I5lZGsdLG5XELvAvBOKY2w5qhqq3WM2PXqkSgOZknpXB1UP8kIziSP4NeHTNY/zNC+vwc3/USJfjZMYFf6UK/AvJ9/GAzXDS03GzBEeeiHqnENo/37K5AldWkf0aMRiKhPymPA8JgnGl50uvy/33ICbIBMTg5M3VVpj+UIeO16z6oXE093Rf3LiRx0GcCqkvR17s4VJ8Tysw+5YJiIjWy8/QJ0KUkr3czEy16xxo4kBDSUkSFiRWDCricyigA53d1Nl99TVQVBfiN7ATMicjNCak6TuHLxHEoCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/xifRR7RGDhixuRhO+IyWYQzdIbRg1Rtcp1JQK82g4=;
 b=aYl7R4M7Mb/pPO4voyVEHzelpB/ekqQimO6gJ1fYCtrSXsI7fFqtR7jWfcNTJGeq9JuoPuq0fwss7sl7ex106qW90H2842mv+d9nSfhXNrRXIerTTanZOEzwZqQhQ40L+1Gmo8Up1W/YNTffOdFw+h4umEPHvPYmXBKL0/NjkbU=
Received: from BLAPR03CA0099.namprd03.prod.outlook.com (2603:10b6:208:32a::14)
 by DM8PR12MB5431.namprd12.prod.outlook.com (2603:10b6:8:34::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.27; Fri, 1 Dec 2023 23:36:06 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:32a:cafe::e7) by BLAPR03CA0099.outlook.office365.com
 (2603:10b6:208:32a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27 via Frontend
 Transport; Fri, 1 Dec 2023 23:36:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Fri, 1 Dec 2023 23:36:06 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 1 Dec
 2023 17:36:05 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/6] drm/amdgpu: Auto-validate DMABuf imports in compute VMs
Date: Fri, 1 Dec 2023 18:34:37 -0500
Message-ID: <20231201233438.1709981-5-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201233438.1709981-1-Felix.Kuehling@amd.com>
References: <20231201233438.1709981-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|DM8PR12MB5431:EE_
X-MS-Office365-Filtering-Correlation-Id: 54b88950-6bcb-48e3-35b1-08dbf2c64a37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ruffgY/9S4ADENEGzwvd62EHyK6Umh2jXIJWKtecNLl0ruBChXaEUQL5Ba0rkxs0XoEKUpKABw2xgtlOtzLappWmIyIF1h2u7JTU5b2WSu1+MMpiL2TjpuyNg0kcbx67FuEoq152gago4AJQs6q36V/Yw6Xp3+0LTogKxguzGIP/Wj3b+o+cWFGvJ5hWY/R3/SniExpvsxOykpEeKNhzVzUOov0GtwkBe9NHY3WL0vBvb0XhtuIKZjHBXghWw4YYV/iDpWcjnY1MOr+SrNJhOp77ElJIy9k9WiqJEdAfI0y157weR3tgHmxDp3DleIJGoJObrvPIKcW9ws86ouzWpNBYvq7yKfzr9xR4fw8bCb/VGNRAwSTO21rDqeJ3Mm9CloH2a656Y46GyaBqXFSbdsOOjXrIdizX+3dqoKbMmuU9Icjg9s8I+CDoWmcfgHaW9yk6PSP4r1pqXhLFzoTZrZWMB+TdWyHp0kMH5l9OksYeOCznod9sHfNTG/DtKHLBRrk+JkPOe8F+BeP6WehvH7A2yWGJ/6E/hulDdwgTXv1doAGArqNG47YvBRox0znKi4X626mU6KMLoJUTYq2ZbtKx5Fsh7BXtckqhT5BUlf41o1dUr9VEi4cA1gyCFguUB/lygLNFVfE+w7lEj9N2UUXHn0ZDVfYIL3HfY3SF24SYy5DosnOPHxfDArzFDdhEsvKWZKixlfsKcc58dtDaMJP/d4lT24b0PlABSilBqgYcyovg2KcLDKkozKpyKqrA+j+m6NlhqVW7t5OV3kxrCQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(396003)(39860400002)(376002)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(82310400011)(186009)(36840700001)(46966006)(40470700004)(40460700003)(336012)(83380400001)(426003)(82740400003)(356005)(36756003)(86362001)(81166007)(47076005)(36860700001)(8676002)(110136005)(70586007)(70206006)(8936002)(450100002)(316002)(40480700001)(15650500001)(5660300002)(1076003)(30864003)(2906002)(2616005)(16526019)(478600001)(7696005)(26005)(6666004)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 23:36:06.5166 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b88950-6bcb-48e3-35b1-08dbf2c64a37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5431
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

DMABuf imports in compute VMs are not wrapped in a kgd_mem object on the
process_info->kfd_bo_list. There is no explicit KFD API call to validate
them or add eviction fences to them.

This patch automatically validates and fences dymanic DMABuf imports when
they are added to a compute VM. Revalidation after evictions is handled
in the VM code.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   3 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  45 ++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  26 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 122 +++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  12 +-
 8 files changed, 196 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index cf6ed5fce291..f2e920734c98 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -182,6 +182,9 @@ int amdgpu_queue_mask_bit_to_set_resource_bit(struct amdgpu_device *adev,
 struct amdgpu_amdkfd_fence *amdgpu_amdkfd_fence_create(u64 context,
 				struct mm_struct *mm,
 				struct svm_range_bo *svm_bo);
+int amdgpu_amdkfd_bo_validate_and_fence(struct amdgpu_bo *bo,
+					uint32_t domain,
+					struct dma_fence *fence);
 #if defined(CONFIG_DEBUG_FS)
 int kfd_debugfs_kfd_mem_limits(struct seq_file *m, void *data);
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 48697b789342..7d91f99acb59 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -426,9 +426,9 @@ static int amdgpu_amdkfd_bo_validate(struct amdgpu_bo *bo, uint32_t domain,
 	return ret;
 }
 
-static int amdgpu_amdkfd_bo_validate_and_fence(struct amdgpu_bo *bo,
-					       uint32_t domain,
-					       struct dma_fence *fence)
+int amdgpu_amdkfd_bo_validate_and_fence(struct amdgpu_bo *bo,
+					uint32_t domain,
+					struct dma_fence *fence)
 {
 	int ret = amdgpu_bo_reserve(bo, false);
 
@@ -464,13 +464,16 @@ static int amdgpu_amdkfd_validate_vm_bo(void *_unused, struct amdgpu_bo *bo)
  * again. Page directories are only updated after updating page
  * tables.
  */
-static int vm_validate_pt_pd_bos(struct amdgpu_vm *vm)
+static int vm_validate_pt_pd_bos(struct amdgpu_vm *vm,
+				 struct ww_acquire_ctx *ticket)
 {
 	struct amdgpu_bo *pd = vm->root.bo;
 	struct amdgpu_device *adev = amdgpu_ttm_adev(pd->tbo.bdev);
 	int ret;
 
-	ret = amdgpu_vm_validate_pt_bos(adev, vm, amdgpu_amdkfd_validate_vm_bo, NULL);
+	ret = amdgpu_vm_validate_evicted_bos(adev, vm, ticket,
+					     amdgpu_amdkfd_validate_vm_bo,
+					     NULL);
 	if (ret) {
 		pr_err("failed to validate PT BOs\n");
 		return ret;
@@ -1310,14 +1313,15 @@ static int map_bo_to_gpuvm(struct kgd_mem *mem,
 	return ret;
 }
 
-static int process_validate_vms(struct amdkfd_process_info *process_info)
+static int process_validate_vms(struct amdkfd_process_info *process_info,
+				struct ww_acquire_ctx *ticket)
 {
 	struct amdgpu_vm *peer_vm;
 	int ret;
 
 	list_for_each_entry(peer_vm, &process_info->vm_list_head,
 			    vm_list_node) {
-		ret = vm_validate_pt_pd_bos(peer_vm);
+		ret = vm_validate_pt_pd_bos(peer_vm, ticket);
 		if (ret)
 			return ret;
 	}
@@ -1402,7 +1406,7 @@ static int init_kfd_vm(struct amdgpu_vm *vm, void **process_info,
 	ret = amdgpu_bo_reserve(vm->root.bo, true);
 	if (ret)
 		goto reserve_pd_fail;
-	ret = vm_validate_pt_pd_bos(vm);
+	ret = vm_validate_pt_pd_bos(vm, NULL);
 	if (ret) {
 		pr_err("validate_pt_pd_bos() failed\n");
 		goto validate_pd_fail;
@@ -2043,7 +2047,7 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 	    bo->tbo.resource->mem_type == TTM_PL_SYSTEM)
 		is_invalid_userptr = true;
 
-	ret = vm_validate_pt_pd_bos(avm);
+	ret = vm_validate_pt_pd_bos(avm, NULL);
 	if (unlikely(ret))
 		goto out_unreserve;
 
@@ -2122,7 +2126,7 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
 		goto unreserve_out;
 	}
 
-	ret = vm_validate_pt_pd_bos(avm);
+	ret = vm_validate_pt_pd_bos(avm, NULL);
 	if (unlikely(ret))
 		goto unreserve_out;
 
@@ -2620,7 +2624,7 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
 		}
 	}
 
-	ret = process_validate_vms(process_info);
+	ret = process_validate_vms(process_info, NULL);
 	if (ret)
 		goto unreserve_out;
 
@@ -2880,11 +2884,6 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 
 	amdgpu_sync_create(&sync_obj);
 
-	/* Validate PDs and PTs */
-	ret = process_validate_vms(process_info);
-	if (ret)
-		goto validate_map_fail;
-
 	/* Validate BOs and map them to GPUVM (update VM page tables). */
 	list_for_each_entry(mem, &process_info->kfd_bo_list,
 			    validate_list) {
@@ -2935,6 +2934,13 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 	if (failed_size)
 		pr_debug("0x%lx/0x%lx in system\n", failed_size, total_size);
 
+	/* Validate PDs, PTs and evicted DMABuf imports last. Otherwise BO
+	 * validations above would invalidate DMABuf imports again.
+	 */
+	ret = process_validate_vms(process_info, &exec.ticket);
+	if (ret)
+		goto validate_map_fail;
+
 	/* Update mappings not managed by KFD */
 	list_for_each_entry(peer_vm, &process_info->vm_list_head,
 			vm_list_node) {
@@ -3006,7 +3012,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 				   &process_info->eviction_fence->base,
 				   DMA_RESV_USAGE_BOOKKEEP);
 	}
-	/* Attach eviction fence to PD / PT BOs */
+	/* Attach eviction fence to PD / PT BOs and DMABuf imports */
 	list_for_each_entry(peer_vm, &process_info->vm_list_head,
 			    vm_list_node) {
 		struct amdgpu_bo *bo = peer_vm->root.bo;
@@ -3014,6 +3020,11 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 		dma_resv_add_fence(bo->tbo.base.resv,
 				   &process_info->eviction_fence->base,
 				   DMA_RESV_USAGE_BOOKKEEP);
+
+		ret = amdgpu_vm_fence_imports(peer_vm, &exec.ticket,
+					      &process_info->eviction_fence->base);
+		if (ret)
+			break;
 	}
 
 validate_map_fail:
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index e50be6500030..d7ba1fd1e3d4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -952,10 +952,10 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 	p->bytes_moved = 0;
 	p->bytes_moved_vis = 0;
 
-	r = amdgpu_vm_validate_pt_bos(p->adev, &fpriv->vm,
-				      amdgpu_cs_bo_validate, p);
+	r = amdgpu_vm_validate_evicted_bos(p->adev, &fpriv->vm, NULL,
+					   amdgpu_cs_bo_validate, p);
 	if (r) {
-		DRM_ERROR("amdgpu_vm_validate_pt_bos() failed.\n");
+		DRM_ERROR("amdgpu_vm_validate_evicted_bos() failed.\n");
 		goto out_free_user_pages;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index decbbe3d4f06..055ba2ea4c12 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -377,6 +377,10 @@ amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
 	struct amdgpu_vm_bo_base *bo_base;
 	int r;
 
+	/* FIXME: This should be after the "if", but needs a fix to make sure
+	 * DMABuf imports are initialized in the right VM list.
+	 */
+	amdgpu_vm_bo_invalidate(adev, bo, false);
 	if (!bo->tbo.resource || bo->tbo.resource->mem_type == TTM_PL_SYSTEM)
 		return;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index b1ce22a9b186..c29653cbde26 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -187,6 +187,32 @@ static int amdgpu_gem_object_open(struct drm_gem_object *obj,
 	else
 		++bo_va->ref_count;
 	amdgpu_bo_unreserve(abo);
+
+	/* Validate and add eviction fence to DMABuf imports with dynamic
+	 * attachment in compute VMs. Re-validation will be done by
+	 * amdgpu_vm_validate_evicted_bos and the fence will be updated by
+	 * amdgpu_vm_fence_imports in amdgpu_amdkfd_gpuvm_restore_process_bos.
+	 *
+	 * Nested locking below for the case that a GEM object is opened in
+	 * kfd_mem_export_dmabuf. Since the lock below is only taken for imports,
+	 * but not for export, this is a different lock class that cannot lead to
+	 * circular lock dependencies.
+	 */
+	if (!vm->is_compute_context || !vm->process_info)
+		return 0;
+	if (!obj->import_attach ||
+	    !dma_buf_is_dynamic(obj->import_attach->dmabuf))
+		return 0;
+	mutex_lock_nested(&vm->process_info->lock, 1);
+	if (!WARN_ON(!vm->process_info->eviction_fence)) {
+		r = amdgpu_amdkfd_bo_validate_and_fence(abo, AMDGPU_GEM_DOMAIN_GTT,
+							&vm->process_info->eviction_fence->base);
+		if (r)
+			dev_warn(adev->dev, "%d: validate_and_fence failed: %d\n",
+				 vm->task_info.pid, r);
+	}
+	mutex_unlock(&vm->process_info->lock);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index a748e17ff031..2b57281e899f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -442,24 +442,31 @@ uint64_t amdgpu_vm_generation(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 }
 
 /**
- * amdgpu_vm_validate_pt_bos - validate the page table BOs
+ * amdgpu_vm_validate_evicted_bos - validate evicted BOs tracked in the VM
  *
  * @adev: amdgpu device pointer
  * @vm: vm providing the BOs
+ * @ticket: optional reservation ticket used to reserve the VM
  * @validate: callback to do the validation
  * @param: parameter for the validation callback
  *
- * Validate the page table BOs on command submission if neccessary.
+ * Validate the page table BOs and per-VM BOs on command submission if
+ * necessary. If a ticket is given, also try to validate evicted user queue
+ * BOs. They must already be reserved with the given ticket.
  *
  * Returns:
  * Validation result.
  */
-int amdgpu_vm_validate_pt_bos(struct amdgpu_device *adev, struct amdgpu_vm *vm,
-			      int (*validate)(void *p, struct amdgpu_bo *bo),
-			      void *param)
+int amdgpu_vm_validate_evicted_bos(struct amdgpu_device *adev,
+				   struct amdgpu_vm *vm,
+				   struct ww_acquire_ctx *ticket,
+				   int (*validate)(void *p,
+						   struct amdgpu_bo *bo),
+				   void *param)
 {
 	struct amdgpu_vm_bo_base *bo_base;
 	struct amdgpu_bo *shadow;
+	struct dma_resv *resv;
 	struct amdgpu_bo *bo;
 	int r;
 
@@ -499,6 +506,28 @@ int amdgpu_vm_validate_pt_bos(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		}
 		spin_lock(&vm->status_lock);
 	}
+	while (ticket && !list_empty(&vm->evicted_user)) {
+		bo_base = list_first_entry(&vm->evicted_user,
+					   struct amdgpu_vm_bo_base,
+					   vm_status);
+		spin_unlock(&vm->status_lock);
+
+		bo = bo_base->bo;
+		resv = bo->tbo.base.resv;
+
+		if (dma_resv_locking_ctx(resv) != ticket) {
+			pr_warn_ratelimited("Evicted user BO is not reserved in pid %d\n",
+					    vm->task_info.pid);
+			return -EINVAL;
+		}
+
+		r = validate(param, bo);
+		if (r)
+			return r;
+
+		amdgpu_vm_bo_invalidated(bo_base);
+		spin_lock(&vm->status_lock);
+	}
 	spin_unlock(&vm->status_lock);
 
 	amdgpu_vm_eviction_lock(vm);
@@ -1441,11 +1470,21 @@ int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
 		}
 
 		r = amdgpu_vm_bo_update(adev, bo_va, clear);
-		if (r)
-			return r;
 
 		if (unlock)
 			dma_resv_unlock(resv);
+		if (r)
+			return r;
+
+		/* Remember evicted DMABuf imports in compute VMs for later
+		 * validation
+		 */
+		if (vm->is_compute_context && bo_va->base.bo &&
+		    bo_va->base.bo->tbo.base.import_attach &&
+		    (!bo_va->base.bo->tbo.resource ||
+		     bo_va->base.bo->tbo.resource->mem_type == TTM_PL_SYSTEM))
+			amdgpu_vm_bo_evicted_user(&bo_va->base);
+
 		spin_lock(&vm->status_lock);
 	}
 	spin_unlock(&vm->status_lock);
@@ -1453,6 +1492,75 @@ int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
 	return 0;
 }
 
+/**
+ * amdgpu_vm_fence_imports - add fence to valid DMABuf imports
+ *
+ * @vm: requested vm
+ * @ticket: optional reservation ticket used to reserve the VM
+ * @fence: fence to add
+ *
+ * Add the specified fence to all dynamic DMABuf imports that are valid.
+ *
+ * Returns:
+ * 0 for success.
+ */
+int amdgpu_vm_fence_imports(struct amdgpu_vm *vm,
+			    struct ww_acquire_ctx *ticket,
+			    struct dma_fence *fence)
+{
+	struct amdgpu_bo_va *bo_va, *tmp;
+	struct dma_resv *resv;
+	LIST_HEAD(imports);
+	bool unlock;
+	int ret = 0;
+
+	if (!vm->is_compute_context)
+		return 0;
+
+	/* Move all the DMABuf imports to a private list so I can reserve
+	 * them while not holding te status_lock.
+	 */
+	spin_lock(&vm->status_lock);
+	list_for_each_entry_safe(bo_va, tmp, &vm->idle, base.vm_status) {
+		if (bo_va->base.bo && bo_va->base.bo->tbo.base.import_attach &&
+		    dma_buf_is_dynamic(bo_va->base.bo->tbo.base.import_attach->dmabuf))
+			list_move(&bo_va->base.vm_status, &imports);
+	}
+	spin_unlock(&vm->status_lock);
+
+	list_for_each_entry(bo_va, &imports, base.vm_status) {
+		resv = bo_va->base.bo->tbo.base.resv;
+
+		/* Try to reserve the BO */
+		if (dma_resv_trylock(resv)) {
+			unlock = true;
+		/* The caller is already holding the reservation lock */
+		} else if (ticket && dma_resv_locking_ctx(resv) == ticket) {
+			unlock = false;
+		} else {
+			WARN_ONCE(1, "Failed to reserve DMABuf import");
+			ret = -EBUSY;
+			break;
+		}
+
+		ret = dma_resv_reserve_fences(resv, 1);
+		if (!ret)
+			dma_resv_add_fence(resv, fence,
+					   DMA_RESV_USAGE_BOOKKEEP);
+
+		if (unlock)
+			dma_resv_unlock(resv);
+		if (ret)
+			break;
+	}
+
+	spin_lock(&vm->status_lock);
+	list_splice(&imports, &vm->idle);
+	spin_unlock(&vm->status_lock);
+
+	return ret;
+}
+
 /**
  * amdgpu_vm_flush_compute_tlb - Flush TLB on compute VM
  *
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 9156ed22abe7..5de67c57197c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -437,9 +437,12 @@ int amdgpu_vm_lock_pd(struct amdgpu_vm *vm, struct drm_exec *exec,
 		      unsigned int num_fences);
 bool amdgpu_vm_ready(struct amdgpu_vm *vm);
 uint64_t amdgpu_vm_generation(struct amdgpu_device *adev, struct amdgpu_vm *vm);
-int amdgpu_vm_validate_pt_bos(struct amdgpu_device *adev, struct amdgpu_vm *vm,
-			      int (*callback)(void *p, struct amdgpu_bo *bo),
-			      void *param);
+int amdgpu_vm_validate_evicted_bos(struct amdgpu_device *adev,
+				   struct amdgpu_vm *vm,
+				   struct ww_acquire_ctx *ticket,
+				   int (*callback)(void *p,
+						   struct amdgpu_bo *bo),
+				   void *param);
 int amdgpu_vm_flush(struct amdgpu_ring *ring, struct amdgpu_job *job, bool need_pipe_sync);
 int amdgpu_vm_update_pdes(struct amdgpu_device *adev,
 			  struct amdgpu_vm *vm, bool immediate);
@@ -449,6 +452,9 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
 int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
 			   struct amdgpu_vm *vm,
 			   struct ww_acquire_ctx *ticket);
+int amdgpu_vm_fence_imports(struct amdgpu_vm *vm,
+			    struct ww_acquire_ctx *ticket,
+			    struct dma_fence *fence);
 int amdgpu_vm_flush_compute_tlb(struct amdgpu_device *adev,
 				struct amdgpu_vm *vm,
 				uint32_t flush_type,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index b8f0c0763c7f..17a2fff50227 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1557,9 +1557,11 @@ static int svm_range_reserve_bos(struct svm_validate_context *ctx, bool intr)
 			goto unreserve_out;
 		}
 
-		r = amdgpu_vm_validate_pt_bos(pdd->dev->adev,
-					      drm_priv_to_vm(pdd->drm_priv),
-					      svm_range_bo_validate, NULL);
+		r = amdgpu_vm_validate_evicted_bos(pdd->dev->adev,
+						   drm_priv_to_vm(pdd->drm_priv),
+						   NULL,
+						   svm_range_bo_validate,
+						   NULL);
 		if (r) {
 			pr_debug("failed %d validate pt bos\n", r);
 			goto unreserve_out;
@@ -1676,7 +1678,9 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 		goto free_ctx;
 	}
 
-	svm_range_reserve_bos(ctx, intr);
+	r = svm_range_reserve_bos(ctx, intr);
+	if (r)
+		goto free_ctx;
 
 	p = container_of(prange->svms, struct kfd_process, svms);
 	owner = kfd_svm_page_owner(p, find_first_bit(ctx->bitmap,
-- 
2.34.1

