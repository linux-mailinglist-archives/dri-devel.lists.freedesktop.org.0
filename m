Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 851227F3A1D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 00:11:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4691210E2D5;
	Tue, 21 Nov 2023 23:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2066.outbound.protection.outlook.com [40.107.212.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79F810E2D5;
 Tue, 21 Nov 2023 23:11:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0cXdnru1lS/0ufslZ9bp4Ob3M9+qD+VE4NwA09YsD+OshieSF72SPaXdpapxMDHPw3NawirzW84GcGH6JAvnjSd6Xm5LFJs7nwgEuDI3eNJVB4L1qjsC5P0xPOt6bbXzGggoUBlYMr1l3ln0eNrpZn/QRr7/dQ1KhgFMQWQxsLNYcJLBZF/uGC1IXpWj8Ed1SJgzfUO+Fhqy/6YpmTvLL8dGGlbZfG5CMT5Ctps4/46Q7rWw1sDztHOKwGv1m6Thd0JoDEKt7fg07RZ9bAJC+8CBrSfcVTn6EBXpflBRBeAZ85VvOlMV/lXHq3bvJKZTaWVdmbgW1ks/FWuudNGCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4nwJNQiqUZFUoG2eDAhTR+NFBy5yQXwNMyZVUVIqvM=;
 b=i4CKBoMAvp2IY6fpVhhfShX2VPhQiUjdbAq95LpCpUVjRrvLKub8aF3sHvfSrrl12AtvnR8K6pXxJl1LHod2DJphEotwFQfCNBPEuIugyoeFIQYajWGiXJ7gvjrCRPVM2mbUlS7xu7D3iD0OLmCYV/kPj1SsjD44q+JJn3n4JdYXILy+8+8elGcWzXh8WTzzRZ7gpuzegFTX2QXgfYNbwaEEm1Y3bKu0G7TUuvyJc83P1LoY7x27863OEn/W/DRw0Tza8d7ouXDxhevF+ARCcNjXansQ1ICENgkA0bCN86knW2KxhRLn8yk0xsgSuVKNxoraIU9fNdJkKje8hO0kNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4nwJNQiqUZFUoG2eDAhTR+NFBy5yQXwNMyZVUVIqvM=;
 b=rFRKioNKKO9KNTk96b2XqIuvbl1q6fiRDFZQ3L0rW+2vzeqt0/iDQU+k7YGgCRFMHHzUVCLKtJ4rk83WmV3zxJQV5IDy3DjiLJEtnFqHd+Tm0buLNYpN5849Y/I0cRJMjXy5zfh26uAh+6UKCMklQxEYhWpY3FVFrX9vuSpABC0=
Received: from CH0PR03CA0269.namprd03.prod.outlook.com (2603:10b6:610:e5::34)
 by BL1PR12MB5189.namprd12.prod.outlook.com (2603:10b6:208:308::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 23:11:40 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::f4) by CH0PR03CA0269.outlook.office365.com
 (2603:10b6:610:e5::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18 via Frontend
 Transport; Tue, 21 Nov 2023 23:11:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Tue, 21 Nov 2023 23:11:40 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 21 Nov
 2023 17:11:38 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 3/4] drm/amdkfd: Export DMABufs from KFD using GEM handles
Date: Tue, 21 Nov 2023 18:11:13 -0500
Message-ID: <20231121231114.703478-3-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231121231114.703478-1-Felix.Kuehling@amd.com>
References: <20231121231114.703478-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|BL1PR12MB5189:EE_
X-MS-Office365-Filtering-Correlation-Id: 0267ccfe-3dc6-43bf-94eb-08dbeae7381d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TpVs6nDJrKgRyJA97I4OWJx8ielJQEKnvqGFKRkFFg0dz/k8zOwvkGWOg0GggdNa8LJlOtJU6gOrkgj/bg9+fIybIpQz/76/blNNHFgzrIHAxFPzcGDGpj7GBVJPCBZ81Tt5LQxDKe5Hu19folCS3/CQkjzJcxkesHqNTntWfeYe6uEW1B0Rkxx3MTNXCeB5xorLthGXtwVii+ZPyuuDTe9qmBB5r3bnOBCNYaSTEA+KjvL1YgXGCLm8tXjikuvWdtMI8dINnlNLuT/Wr5+vUaAEEBbsRvzodxeoYL5TqqbxoeISdYiyB9u9rUuQu5Qrty0k4YEpPz3zrHonAOSqxIphpiMgmv91w7QUH+Vk98ElxC6K1seGRsmfopRarjg79BLEt2bndNcoHTvYM0k4SHV4j52XDtZ0bbulcXhtoL87BssPlLPt1xZPy1AP4xj4/B5t3XnAeYVwo9vjOqYWBHNdDgPsKDi8PfHNEznNszvnTDSVxhLSl4RKjG6gsOWN76Fvacy1iqdCHfPgA9pZt+2lrIcN9YE9GqDmJJV0pCJUkjNvy6oZ9eXGNTKjXcAgPD57U3rOLro5uDfNyTMo5HTO43Y8iymcNJiE2n+VTiVuV7QVk08Gmcl69YFtXPfUE1To4IJNL7lqrPvd4navNOZA7ulUbO3AUPmOCZINDwABJCGN9FEG7lmDT4HSer7LrJVFOoIdHTg8Z7Jmw03nTMIUu7kUhJEdHoA3a/kx2yUaDX4lrkd8RKdQtN7AF0zj7AE2YBf3pWSJHEQ/68sebA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(64100799003)(82310400011)(186009)(1800799012)(451199024)(46966006)(36840700001)(40470700004)(2616005)(356005)(86362001)(82740400003)(40480700001)(40460700003)(36756003)(54906003)(110136005)(70206006)(70586007)(6666004)(7696005)(316002)(81166007)(1076003)(26005)(16526019)(47076005)(83380400001)(336012)(426003)(2906002)(450100002)(478600001)(5660300002)(36860700001)(41300700001)(8936002)(4326008)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 23:11:40.2083 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0267ccfe-3dc6-43bf-94eb-08dbeae7381d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5189
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
Cc: Ramesh Errabolu <Ramesh.Errabolu@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create GEM handles for exporting DMABufs using GEM-Prime APIs. The GEM
handles are created in a drm_client_dev context to avoid exposing them
in user mode contexts through a DMABuf import.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    | 11 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  5 ++++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 29 ++++++++++++++-----
 3 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index b8412202a1b0..aa8b24079070 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -142,6 +142,7 @@ void amdgpu_amdkfd_device_init(struct amdgpu_device *adev)
 {
 	int i;
 	int last_valid_bit;
+	int ret;
 
 	amdgpu_amdkfd_gpuvm_init_mem_limits();
 
@@ -160,6 +161,12 @@ void amdgpu_amdkfd_device_init(struct amdgpu_device *adev)
 			.enable_mes = adev->enable_mes,
 		};
 
+		ret = drm_client_init(&adev->ddev, &adev->kfd.client, "kfd", NULL);
+		if (ret) {
+			dev_err(adev->dev, "Failed to init DRM client: %d\n", ret);
+			return;
+		}
+
 		/* this is going to have a few of the MSBs set that we need to
 		 * clear
 		 */
@@ -198,6 +205,10 @@ void amdgpu_amdkfd_device_init(struct amdgpu_device *adev)
 
 		adev->kfd.init_complete = kgd2kfd_device_init(adev->kfd.dev,
 							&gpu_resources);
+		if (adev->kfd.init_complete)
+			drm_client_register(&adev->kfd.client);
+		else
+			drm_client_release(&adev->kfd.client);
 
 		amdgpu_amdkfd_total_mem_size += adev->gmc.real_vram_size;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index dac983da961d..c1195eb67057 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -33,6 +33,7 @@
 #include <linux/mmu_notifier.h>
 #include <linux/memremap.h>
 #include <kgd_kfd_interface.h>
+#include <drm/drm_client.h>
 #include "amdgpu_sync.h"
 #include "amdgpu_vm.h"
 #include "amdgpu_xcp.h"
@@ -83,6 +84,7 @@ struct kgd_mem {
 
 	struct amdgpu_sync sync;
 
+	uint32_t gem_handle;
 	bool aql_queue;
 	bool is_imported;
 };
@@ -105,6 +107,9 @@ struct amdgpu_kfd_dev {
 
 	/* HMM page migration MEMORY_DEVICE_PRIVATE mapping */
 	struct dev_pagemap pgmap;
+
+	/* Client for KFD BO GEM handle allocations */
+	struct drm_client_dev client;
 };
 
 enum kgd_engine_type {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 41fbc4fd0fac..e96e1595791f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -25,6 +25,7 @@
 #include <linux/pagemap.h>
 #include <linux/sched/mm.h>
 #include <linux/sched/task.h>
+#include <linux/fdtable.h>
 #include <drm/ttm/ttm_tt.h>
 
 #include <drm/drm_exec.h>
@@ -806,13 +807,18 @@ kfd_mem_dmaunmap_attachment(struct kgd_mem *mem,
 static int kfd_mem_export_dmabuf(struct kgd_mem *mem)
 {
 	if (!mem->dmabuf) {
-		struct dma_buf *ret = amdgpu_gem_prime_export(
-			&mem->bo->tbo.base,
+		struct amdgpu_device *bo_adev;
+		struct dma_buf *dmabuf;
+
+		bo_adev = amdgpu_ttm_adev(mem->bo->tbo.bdev);
+		dmabuf = drm_gem_prime_handle_to_dmabuf(&bo_adev->ddev,
+							bo_adev->kfd.client.file,
+							mem->gem_handle,
 			mem->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE ?
-				DRM_RDWR : 0);
-		if (IS_ERR(ret))
-			return PTR_ERR(ret);
-		mem->dmabuf = ret;
+							DRM_RDWR : 0);
+		if (IS_ERR(dmabuf))
+			return PTR_ERR(dmabuf);
+		mem->dmabuf = dmabuf;
 	}
 
 	return 0;
@@ -1779,6 +1785,9 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		pr_debug("Failed to allow vma node access. ret %d\n", ret);
 		goto err_node_allow;
 	}
+	ret = drm_gem_handle_create(adev->kfd.client.file, gobj, &(*mem)->gem_handle);
+	if (ret)
+		goto err_gem_handle_create;
 	bo = gem_to_amdgpu_bo(gobj);
 	if (bo_type == ttm_bo_type_sg) {
 		bo->tbo.sg = sg;
@@ -1830,6 +1839,8 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 err_pin_bo:
 err_validate_bo:
 	remove_kgd_mem_from_kfd_bo_list(*mem, avm->process_info);
+	drm_gem_handle_delete(adev->kfd.client.file, (*mem)->gem_handle);
+err_gem_handle_create:
 	drm_vma_node_revoke(&gobj->vma_node, drm_priv);
 err_node_allow:
 	/* Don't unreserve system mem limit twice */
@@ -1942,8 +1953,12 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 
 	/* Free the BO*/
 	drm_vma_node_revoke(&mem->bo->tbo.base.vma_node, drm_priv);
-	if (mem->dmabuf)
+	if (!mem->is_imported)
+		drm_gem_handle_delete(adev->kfd.client.file, mem->gem_handle);
+	if (mem->dmabuf) {
 		dma_buf_put(mem->dmabuf);
+		mem->dmabuf = NULL;
+	}
 	mutex_destroy(&mem->lock);
 
 	/* If this releases the last reference, it will end up calling
-- 
2.34.1

