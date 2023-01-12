Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DAA66686F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 02:33:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A1910E843;
	Thu, 12 Jan 2023 01:32:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9A610E2D7;
 Thu, 12 Jan 2023 01:32:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=alnb8rqMteRWFEzKX0CUkbZSknzeoe3NQJASFWpZxUz0EE3tv8XWcRnXmS01424P1melD3V8ybbEezg7vbCCLq+3LGNE/S4KWTK1JFP7cHLMe0L1NVmhQWcHJXKY43oLKdvVgUJ5woR4TE1yqsBrtjvLBLRK7W9377bxjqd+8G/OohCEljhPNFhJg9H/mvQhwJykWF7c3Z+ghHKz/uQNF4XHoeQEYdfyOYsRGroidrTZlSVXeybLt8Rjf0nsfS8/rqBT8rLhHONAbl/Sz9N0r0SQs15/uz3cLLFZPFagTLS2jCi0/TmKG0mDxTAYt3e+RSDF5GpqQAO1R/DFpgzJZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=icDFtsNla1bvJvLm4Xl9B6zT6sQ5fmOgma++TCdkCWc=;
 b=fJphbyAoO11sUXff1H1DcmZW91Y/biKwbWzNqFyrwQegfCrzNO4VfP5hzsErgWvug+AGsK6fvF9RBTdMK+NDv5+2o++W9AFXPBb/MW0coViJzV7jo2IzcH8uvt0p6hWeGscI2DP43yfY0o6PXDlZVGB8w4bTvOTpJtNg+9rq1H68rMJpsOW6scHOOcIUViIEby8PFVrpxzZSNFW11CFR6U5pbFNx19+W57JrpaggyqpaCPOaXIL7R1NZh1P/QWizXYmgaedvNW0F/yPlFLJPs0Yznkaj2Cw3JqhTG51dhx/AbZLS1nUzOXK4RDbUog9YqFbntaAdQKQYdD0Mxpco1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icDFtsNla1bvJvLm4Xl9B6zT6sQ5fmOgma++TCdkCWc=;
 b=IMINOZ+xH0ooI89bd1duQ3gaazuot/XNQDw4F9VUx6/hhL/94spXuOFjVRJimRElUYUAE83HRhyrlgGFwl6rf92/T4cgSvhyEQxD7cns4zFX+5m4lEdGt4WQuPtJuHozrTXFwfdHfd3nshOlfx2P76vl88vVHPO6vEapomcJC4E=
Received: from MW4PR04CA0170.namprd04.prod.outlook.com (2603:10b6:303:85::25)
 by CH2PR12MB5017.namprd12.prod.outlook.com (2603:10b6:610:36::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 01:32:29 +0000
Received: from CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::c6) by MW4PR04CA0170.outlook.office365.com
 (2603:10b6:303:85::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Thu, 12 Jan 2023 01:32:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT063.mail.protection.outlook.com (10.13.175.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Thu, 12 Jan 2023 01:32:28 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 11 Jan
 2023 19:32:26 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/6] drm/amdgpu: Attach eviction fence on alloc
Date: Wed, 11 Jan 2023 20:31:55 -0500
Message-ID: <20230112013157.750568-5-Felix.Kuehling@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT063:EE_|CH2PR12MB5017:EE_
X-MS-Office365-Filtering-Correlation-Id: 0709f1d8-a35e-49c2-eaf1-08daf43cddf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 10reDo2Mk8R4levigCROejmEirBPNfk1er5rpphOuTRqNuH8A32l80GQRP6PdvFlEjVj/HaKzPc7d0leJiYvHPHMOwGRk3Gc5k9kJXeoI7kwc4hj2cfCbu5ciFCQHuEhsioumjxo+af9EA3OMG72+c/WWX4SzhsGLuxMHVJeqLqwuNB78r1PROiT8PVDrb+lvL05ncohEQgIXMsyRw8seRltedogtBmyOMFCmG6COjFz3rAP1XJHzaPbA6oiZsEWozQKfXVTPuFyUzgy1VjE4e74Mw/2jFS91lr7IpGiQ6N287pOQut+fFeTeeMrb4kT32PiOqWY6sC9q5dDAPGCSAEu10phlMZ7++AFp7kILhAkwi+Gz+zYRzsIt39puHAnIHk7Wen+ywOupYwgrFhBeq6KeS4/XP8g1OAsJiDEDBFtIznog8EoYwGK41A3FFVoV3849eUS75SmOTMqFZXWscNVjsiwaM7cLxN376k+rAX1xzayPi+0MjvpyEymZBZ8Uf5LLsFRfIaz/56Qt/bf0ib+Dba9nxveSRjFoO8EbvflIFTPwitp47+YCte/tgA6MXb+XxWJJGrkhIJ7IryY9xRDiIzI1mXa7fTzn9VncnWkKSMHwCDYJgtx0ZlOLqQxYBJdYGJ+/BzQcGHULGbYpcglnM8xAfd8YqBSa+XrfUzhyOh2rBllMshd5QGEEvXfOHLydURe8wiHdwokTUa6C9kTJi3OtzuhiVe9d+AU3f8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199015)(46966006)(36840700001)(40470700004)(36860700001)(82740400003)(6666004)(81166007)(356005)(2906002)(86362001)(478600001)(2616005)(16526019)(8676002)(1076003)(186003)(40480700001)(7696005)(316002)(5660300002)(26005)(82310400005)(8936002)(36756003)(83380400001)(40460700003)(47076005)(41300700001)(426003)(70206006)(110136005)(450100002)(54906003)(70586007)(4326008)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 01:32:28.4077 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0709f1d8-a35e-49c2-eaf1-08daf43cddf8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5017
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

Instead of attaching the eviction fence when a KFD BO is first mapped,
attach it when it is allocated or imported. This in preparation to allow
KFD BOs to be mapped using the render node API.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 63 ++++++++++---------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 5645103beed0..79213f476493 100644
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
@@ -1720,6 +1738,11 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
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
@@ -1729,6 +1752,7 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 
 allocate_init_user_pages_failed:
 err_pin_bo:
+err_validate_bo:
 	remove_kgd_mem_from_kfd_bo_list(*mem, avm->process_info);
 	drm_vma_node_revoke(&gobj->vma_node, drm_priv);
 err_node_allow:
@@ -1804,10 +1828,6 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 	if (unlikely(ret))
 		return ret;
 
-	/* The eviction fence should be removed by the last unmap.
-	 * TODO: Log an error condition if the bo still has the eviction fence
-	 * attached
-	 */
 	amdgpu_amdkfd_remove_eviction_fence(mem->bo,
 					process_info->eviction_fence);
 	pr_debug("Release VA 0x%llx - 0x%llx\n", mem->va,
@@ -1931,19 +1951,6 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
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
@@ -1970,10 +1977,6 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 			 mem->mapped_to_gpu_memory);
 	}
 
-	if (!amdgpu_ttm_tt_get_usermm(bo->tbo.ttm) && !bo->tbo.pin_count)
-		dma_resv_add_fence(bo->tbo.base.resv,
-				   &avm->process_info->eviction_fence->base,
-				   DMA_RESV_USAGE_BOOKKEEP);
 	ret = unreserve_bo_and_vms(&ctx, false, false);
 
 	goto out;
@@ -1990,7 +1993,6 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
 		struct amdgpu_device *adev, struct kgd_mem *mem, void *drm_priv)
 {
 	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
-	struct amdkfd_process_info *process_info = avm->process_info;
 	unsigned long bo_size = mem->bo->tbo.base.size;
 	struct kfd_mem_attachment *entry;
 	struct bo_vm_reservation_context ctx;
@@ -2031,15 +2033,6 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
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
@@ -2266,8 +2259,16 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
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
 	kfree(*mem);
 err_put_obj:
-- 
2.34.1

