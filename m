Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3E87CCF04
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 23:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F3C10E344;
	Tue, 17 Oct 2023 21:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7ADB10E347;
 Tue, 17 Oct 2023 21:14:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyvRIm5FVLaNyzwddL+qvC/P845GmgCFvhCXlMh9MNlayuisgOVohjl47GlcqLa0a/aZmX4WDnr2kIc8cjKlmxThy/YmQ/C2L5fvkDKqlU3PX32/+2o9y4S8DGC39x9++wCRZwTUTmoHyStmtahgctHb3nyB9s8Uxnjb3NblG73USCQpCNJZKSfv79ZgbtggHK+0oAc33wOiJ0AatN5nHa5RCymp1+mJb7Ens2K7n9QWg/XzCa8Iu0xlEHIhg4y8vTEQTUbaiCVxEUo/rZ3mp/DdVI3fpl+G33pC9l4DbuiyAPJoNXEaSkAD24VdSx8rtFd939riXTN8Of/uh4L9dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGff5szKP5NsgfocFUyE1/1xaP+2wL+SBHpXMqfioRM=;
 b=VFn1fzWvQ4hAtnCgkceEQXRJDSiKMKRchb8ljSICZBCl/DeZa00lCP5+xoqMFIupV/cTZjDyQk1NopRdtSxotmoNMSugIwQW9EPqaFfZ15mqLnEtdF7bwmixXq0Atxt88y0+bD/VGIY6W8nkuPMUClTOJKcOLYeVnZq9W7GeczDSKcmCfKt3vnN9YIWhbmBeAJ//McDEuvqVcLXaTiKQ7cqYrVPxxz9NNmvvzrCo62+6Mml6cdyDJ+LoQZqG3XWuU/X813Y0EUNabGN17F/SFY6ZwGQ0k0O/FK0JN6dLNAKOIRgHteH8gv9gljl56GehSNusGmCEKHGpvJ94pshBVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGff5szKP5NsgfocFUyE1/1xaP+2wL+SBHpXMqfioRM=;
 b=StXvVaM7a88umK0BLTBBXhyQYv2MkWpkgy3ArLFxcGtkTHy5jHzdMGNBZGqxZZyaoyinB8O44P/nRRAsha8xOzdo+yjZoPIjiS4WxeIUVViUIckEPmWDXtAJNsLhWDc2LRwJFAVLRxOKfAcY0Fz0LlBmYNqfTw+X2JU5NCEb87A=
Received: from BL0PR02CA0003.namprd02.prod.outlook.com (2603:10b6:207:3c::16)
 by DM4PR12MB5961.namprd12.prod.outlook.com (2603:10b6:8:68::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Tue, 17 Oct
 2023 21:14:26 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:207:3c:cafe::9e) by BL0PR02CA0003.outlook.office365.com
 (2603:10b6:207:3c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21 via Frontend
 Transport; Tue, 17 Oct 2023 21:14:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 17 Oct 2023 21:14:26 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 17 Oct
 2023 16:14:24 -0500
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 08/11] drm/amdgpu: Auto-validate DMABuf imports in compute VMs
Date: Tue, 17 Oct 2023 17:13:34 -0400
Message-ID: <20231017211337.1593869-9-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017211337.1593869-1-Felix.Kuehling@amd.com>
References: <20231017211337.1593869-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|DM4PR12MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: f74480a0-30f4-4ba4-6755-08dbcf560b3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SqrqERqLRNdxNdoyIqZVp6A7m35yNJYvnMhvJT2gUMZBs20XaWWWDghNX59jqCinWnq9tUiy4FKqokGBt+T9bCRdbK3doWaqoKpO6+l6gKAZCSG5WTN5RURca5q3nMHdwvvbR/pHEn2uWYl1xaylXoUP7kpY4iD7pl99Ktk5RATCPO7Ne3Bqto38qtkd6xTrp5+zywc2zrlyLSx4z9ayshhpCpnzwauKTW4/HKjuMB6VgKQa0Cyg+zkNDdgfISs9SYXocWAz6H29mA904id4tDxiJYFMpwxSH6TdFOzJkrFD55XI9lIp/nbMhO2FliyQo6dpoLE74s+wbZFR4wKTi0qm/qj844jy/l7I39vBfZTsUGJmWJG+KZIva2UjsqYPkZeO3cc71Gndxub+LcG5j9l22t6DeFDCWE8SlM5x7sv3BTVoR6RfsMCVJZf5ovhfmzipyWCQVSvcRbT56pm+j86293Uxh50rf+mI0ZZQWvR5lHmefHiGcntUhH/fuaBtpQUmGoIBmLqwD7TpVaYxx7p51hKFsGO9MaVUlxoL6pQG7zpmw0s87p3mHgqWre1DZ9yHFPl/5NEMwlzuU2oZovzy6kWvRvzgrHI3tJKYK9EwXwuhh7g0OGRhUJHwb3Hiz9otYhrxgDVF+6r9ZRHtBAr2W4Ygvvzij1E8VlPEcJKaj3k5aITsKGo2ktdHajjyELWU8ebSJJ+75mcTx+xV//hruoNSUv9viPawZkvM+OZxq3ANUWJmp349b/jId7MIfgMbvR1xH3tpcKcds9brGg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(39860400002)(396003)(346002)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(82310400011)(36840700001)(40470700004)(46966006)(6666004)(16526019)(336012)(426003)(7696005)(478600001)(47076005)(36860700001)(110136005)(70586007)(70206006)(316002)(36756003)(2616005)(1076003)(83380400001)(26005)(54906003)(450100002)(41300700001)(5660300002)(82740400003)(356005)(81166007)(30864003)(40460700003)(8676002)(8936002)(4326008)(15650500001)(2906002)(40480700001)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 21:14:26.5167 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f74480a0-30f4-4ba4-6755-08dbcf560b3b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5961
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
Cc: Xiaogang.Chen@amd.com, Ramesh.Errabolu@amd.com, Christian.Koenig@amd.com
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
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  15 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  26 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 117 +++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   6 +-
 7 files changed, 164 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index fcf8a98ad15e..68d534a89942 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -178,6 +178,9 @@ int amdgpu_queue_mask_bit_to_set_resource_bit(struct amdgpu_device *adev,
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
index 2e302956a279..0c1cb6048259 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -423,9 +423,9 @@ static int amdgpu_amdkfd_bo_validate(struct amdgpu_bo *bo, uint32_t domain,
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
 
@@ -2948,7 +2948,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 		struct amdgpu_device *adev = amdgpu_ttm_adev(
 			peer_vm->root.bo->tbo.bdev);
 
-		ret = amdgpu_vm_handle_moved(adev, peer_vm, &ctx.ticket);
+		ret = amdgpu_vm_handle_moved(adev, peer_vm, &ctx.ticket, true);
 		if (ret) {
 			pr_debug("Memory eviction: handle moved failed. Try again\n");
 			goto validate_map_fail;
@@ -3001,7 +3001,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 				   &process_info->eviction_fence->base,
 				   DMA_RESV_USAGE_BOOKKEEP);
 	}
-	/* Attach eviction fence to PD / PT BOs */
+	/* Attach eviction fence to PD / PT BOs and DMABuf imports */
 	list_for_each_entry(peer_vm, &process_info->vm_list_head,
 			    vm_list_node) {
 		struct amdgpu_bo *bo = peer_vm->root.bo;
@@ -3009,6 +3009,11 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 		dma_resv_add_fence(bo->tbo.base.resv,
 				   &process_info->eviction_fence->base,
 				   DMA_RESV_USAGE_BOOKKEEP);
+
+		ret = amdgpu_vm_fence_imports(peer_vm, &ctx.ticket,
+					      &process_info->eviction_fence->base);
+		if (ret)
+			break;
 	}
 
 validate_map_fail:
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index c8f2907ebd6f..e6dcd17c3c8e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1140,7 +1140,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 			return r;
 	}
 
-	r = amdgpu_vm_handle_moved(adev, vm, &p->ticket);
+	r = amdgpu_vm_handle_moved(adev, vm, &p->ticket, false);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index e7e87a3b2601..234244704f27 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -373,6 +373,10 @@ amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
 	struct amdgpu_vm_bo_base *bo_base;
 	int r;
 
+	/* FIXME: This should be after the "if", but needs a fix to make sure
+	 * DMABuf imports are initialized in the right VM list.
+	 */
+	amdgpu_vm_bo_invalidate(adev, bo, false);
 	if (!bo->tbo.resource || bo->tbo.resource->mem_type == TTM_PL_SYSTEM)
 		return;
 
@@ -409,7 +413,7 @@ amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
 		if (!r)
 			r = amdgpu_vm_clear_freed(adev, vm, NULL);
 		if (!r)
-			r = amdgpu_vm_handle_moved(adev, vm, ticket);
+			r = amdgpu_vm_handle_moved(adev, vm, ticket, false);
 
 		if (r && r != -EBUSY)
 			DRM_ERROR("Failed to invalidate VM page tables (%d))\n",
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 849fffbb367d..755cc3c559f5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -186,6 +186,32 @@ static int amdgpu_gem_object_open(struct drm_gem_object *obj,
 	else
 		++bo_va->ref_count;
 	amdgpu_bo_unreserve(abo);
+
+	/* Validate and add eviction fence to DMABuf imports with dymanic
+	 * attachment in compute VMs. Re-validation will be done by
+	 * amdgpu_vm_handle_moved and the fence will be updated by
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
index 76a8a7fd3fde..872fa62aea23 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1302,6 +1302,7 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
  * @adev: amdgpu_device pointer
  * @vm: requested vm
  * @ticket: optional reservation ticket used to reserve the VM
+ * @valitate: whether to auto-validate invalid DMABuf imports
  *
  * Make sure all BOs which are moved are updated in the PTs.
  *
@@ -1312,7 +1313,8 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
  */
 int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
 			   struct amdgpu_vm *vm,
-			   struct ww_acquire_ctx *ticket)
+			   struct ww_acquire_ctx *ticket,
+			   bool validate)
 {
 	struct amdgpu_bo_va *bo_va;
 	struct dma_resv *resv;
@@ -1332,6 +1334,12 @@ int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
 		spin_lock(&vm->status_lock);
 	}
 
+	/* If we're validating user BOs, splice all evicted user BOs into
+	 * the list of invalid BOs for revalidation
+	 */
+	if (validate)
+		list_splice_init(&vm->evicted_user, &vm->invalidated);
+
 	while (!list_empty(&vm->invalidated)) {
 		bo_va = list_first_entry(&vm->invalidated, struct amdgpu_bo_va,
 					 base.vm_status);
@@ -1352,17 +1360,120 @@ int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
 			unlock = false;
 		}
 
+		/* Automatically validate DMABuf imports in compute VMs, if we
+		 * have a reservation, or remember them for later validation.
+		 */
+		if (vm->is_compute_context && bo_va->base.bo &&
+		    bo_va->base.bo->tbo.base.import_attach &&
+		    (!bo_va->base.bo->tbo.resource ||
+		     bo_va->base.bo->tbo.resource->mem_type == TTM_PL_SYSTEM)) {
+			struct ttm_operation_ctx ctx = { true, false };
+			struct amdgpu_bo *bo = bo_va->base.bo;
+
+			if (!validate) {
+				r = amdgpu_vm_bo_update(adev, bo_va, clear);
+				if (!r)
+					amdgpu_vm_bo_evicted_user(&bo_va->base);
+				goto unlock;
+			}
+
+			if (clear) {
+				pr_warn_ratelimited("Invalid DMABuf import is busy in pid %d\n", vm->task_info.pid);
+				r = -EBUSY;
+				goto unlock;
+			}
+
+			amdgpu_bo_placement_from_domain(bo,
+							bo->preferred_domains);
+			r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
+			if (r)
+				goto unlock;
+			r = amdgpu_bo_sync_wait(bo, AMDGPU_FENCE_OWNER_KFD,
+						true);
+			if (r)
+				goto unlock;
+		}
+
 		r = amdgpu_vm_bo_update(adev, bo_va, clear);
+unlock:
+		if (unlock)
+			dma_resv_unlock(resv);
 		if (r)
 			return r;
+		spin_lock(&vm->status_lock);
+	}
+	spin_unlock(&vm->status_lock);
+
+	return 0;
+}
+
+/**
+ * amdgpu_vm_fence_imports - add fence to valid DMABuf imports
+ *
+ * @vm: requested vm
+ * @ticket: optional reservation ticket used to reserve the VM
+ * @fence: fence to add
+ *
+ * Add the specified fence to all dymanic DMABuf imports that are valid.
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
 
 		if (unlock)
 			dma_resv_unlock(resv);
-		spin_lock(&vm->status_lock);
+		if (ret)
+			break;
 	}
+
+	spin_lock(&vm->status_lock);
+	list_splice(&imports, &vm->idle);
 	spin_unlock(&vm->status_lock);
 
-	return 0;
+	return ret;
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 914e6753a6d0..522c89eccac5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -437,7 +437,11 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
 			  struct dma_fence **fence);
 int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
 			   struct amdgpu_vm *vm,
-			   struct ww_acquire_ctx *ticket);
+			   struct ww_acquire_ctx *ticket,
+			   bool validate);
+int amdgpu_vm_fence_imports(struct amdgpu_vm *vm,
+			    struct ww_acquire_ctx *ticket,
+			    struct dma_fence *fence);
 int amdgpu_vm_flush_compute_tlb(struct amdgpu_device *adev,
 				struct amdgpu_vm *vm,
 				uint32_t flush_type,
-- 
2.34.1

