Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F01C7CCF00
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 23:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43EAF10E340;
	Tue, 17 Oct 2023 21:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2071.outbound.protection.outlook.com [40.107.95.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFE610E356;
 Tue, 17 Oct 2023 21:14:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhxnQab07CPLx0MWd1IeUxJHHeBMf/6uCMfQaaW66pbd2/atB8cfI67QdqnvMPkaNtzrwvMr5VtjX3s64lnBulMLXkQEvD8/E0Px6QamUV7OSwxIB21HgL+aGFFbxPCzh2wSQhfDiIpMfM6imvQOVn/uJovOY8kXc+pFZZ+LWaHJBpcsoLAkF/aw4U72VJd88DnmisGg0RZDq/3DZgBftR7KvuuuyLowHO8E1IRaAhDjFzN7bcITdtKk0Z8ZOqCJJHJnR6mwixhm05emUxRTg1EehhqFOYO+TFKyLfe36tQ9YW1OOxOqmILpRSYswk174BZjdlXiLlw/TuP32ryGeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dom0y6XUtYM7kJpD3mXnBYOs7Zy+QpGkNG6z8LLSnQQ=;
 b=IF2NDcmL2nEZYHQobIgso2kCZ9uw3qgzl/JL1EDlT+n4nTYQgVUgJQlHpwEwUhgMNhYTqqO453FqbTw3PHhBfxVbs0w2mNhz4X4FEZcNx+1OMNCjWkBo5RaOVGJJdwfPyoAveqJT3rsfh9JsaUUSJiuIUuiNq3/NdFh3pfr3h9LsyyCJD+5OTvytVdgzH5GgUUEt75cp4faaJlcDkztxOFqFFICCGn+vK3VoduhRTTQWGvuuHjX8/URqM6u8lbAfYOg4T3qaDDKR4jOov9Uce9EGd85U+HGc3lggqI6jyZcMEilPilvI7D28OxHk98MRSUd9LSqQL/ceJyYx+QKVHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dom0y6XUtYM7kJpD3mXnBYOs7Zy+QpGkNG6z8LLSnQQ=;
 b=SkivtWvG/fTxakxYTG93pjwlEksTmowOOQkAEEIzF8ekb7mOm9TDdExnC7bV5ktjo+RoYxVcX4agRHjjjFS0fAN3mSf7x9Hfy7TrnQ3Wp1N0easQ7/gWV5+l88o9uxwFp9NrL5/oBvjobEZRNRSHV2z6pphD95EACBiMpeNTW+Y=
Received: from BL0PR02CA0030.namprd02.prod.outlook.com (2603:10b6:207:3c::43)
 by PH7PR12MB8425.namprd12.prod.outlook.com (2603:10b6:510:240::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 21:14:28 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:207:3c:cafe::65) by BL0PR02CA0030.outlook.office365.com
 (2603:10b6:207:3c::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35 via Frontend
 Transport; Tue, 17 Oct 2023 21:14:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 17 Oct 2023 21:14:27 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 17 Oct
 2023 16:14:25 -0500
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 09/11] drm/amdkfd: Export DMABufs from KFD using GEM handles
Date: Tue, 17 Oct 2023 17:13:35 -0400
Message-ID: <20231017211337.1593869-10-Felix.Kuehling@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|PH7PR12MB8425:EE_
X-MS-Office365-Filtering-Correlation-Id: d38e1a10-cdde-4744-c031-08dbcf560c16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3H1/pQUVeG8BCmPCYrSZ3/P3aNL84c461TOIwJT47TTkWbRD8vmm2th3alfw21QwpuESgnOnZMawt9vKj5JMKG2i4tO4bUrEkpn4hEvyfyaxf13PJJTEI9c2QGKODSKprUDHNFamO0FO+eyWzIzHTHMn3Zjt/gVHgvka30DhTD0q7Ty9Kar+FdgnIoKzbz8TynJiSPhPapZQj1up1DV586sBqZXXshkPptIaToAUZiNgl/dMi0AsJDHUKIVUzcBacAVx+MzjGVYqMC2kTQrQc2krdiMcucO6M7hDJB4KH+ZYIzBLTL/1YYurB1q+p2LSZWpFlZi6zvN+66QdxObLBW7bMrfKdpoXOG/gYqTuhpoS2FyKPX2GmxrZnlvXKEjCOL9TsYqE1OOwEo+RzKZFnzhRz4i4gLOZ0dEOmREqrNfyNk9UbP5r7Ic98wCKA0084YETibjEK8+LV2hqVYIhxDebAlnPHGlfPIjibad1j+fe4WrSHJjKQzVu83iL2WfNP8ZS7IZjZ1/EfcENbaspeul+a9LWLxQvki4yZ62OY5Sa+xDcgLFwQ4zKYcxgYNqjNE0ho2j2Di3gJD6AdsuUz4+zI+fVn2X9gZLWHGcoFOw7GNO/amTu5caoxuy7aCPfXr2+anELEEOfAN4qxV7ZU4hrRnvVoPS6klbiNKFB3sQd5c8euxOZUm3f2D1YeKBbqj7VWI7DBhMIhN2MPXGFokwb7LEPlkxsCEh+grO6C0X6EVNwa7njBwCXaSejCdxcamoTQXJQdzTLs3DzKjEBIQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(64100799003)(1800799009)(186009)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(54906003)(478600001)(110136005)(47076005)(70586007)(70206006)(6666004)(26005)(16526019)(41300700001)(1076003)(336012)(316002)(426003)(7696005)(8936002)(4326008)(2906002)(8676002)(450100002)(5660300002)(36756003)(81166007)(86362001)(83380400001)(36860700001)(356005)(82740400003)(2616005)(40480700001)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 21:14:27.9543 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d38e1a10-cdde-4744-c031-08dbcf560c16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8425
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

Create GEM handles for exporting DMABufs using GEM-Prime APIs. The GEM
handles are created in a drm_client_dev context to avoid exposing them
in user mode contexts through a DMABuf import.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    | 11 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  5 +++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 33 +++++++++++++++----
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  4 +--
 4 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index 6ab17330a6ed..b0a67f16540a 100644
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
index 68d534a89942..4caf8cece028 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -32,6 +32,7 @@
 #include <linux/mmu_notifier.h>
 #include <linux/memremap.h>
 #include <kgd_kfd_interface.h>
+#include <drm/drm_client.h>
 #include <drm/ttm/ttm_execbuf_util.h>
 #include "amdgpu_sync.h"
 #include "amdgpu_vm.h"
@@ -84,6 +85,7 @@ struct kgd_mem {
 
 	struct amdgpu_sync sync;
 
+	uint32_t gem_handle;
 	bool aql_queue;
 	bool is_imported;
 };
@@ -106,6 +108,9 @@ struct amdgpu_kfd_dev {
 
 	/* HMM page migration MEMORY_DEVICE_PRIVATE mapping */
 	struct dev_pagemap pgmap;
+
+	/* Client for KFD BO GEM handle allocations */
+	struct drm_client_dev client;
 };
 
 enum kgd_engine_type {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 0c1cb6048259..4bb8b5fd7598 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -25,6 +25,7 @@
 #include <linux/pagemap.h>
 #include <linux/sched/mm.h>
 #include <linux/sched/task.h>
+#include <linux/fdtable.h>
 #include <drm/ttm/ttm_tt.h>
 
 #include "amdgpu_object.h"
@@ -804,13 +805,22 @@ kfd_mem_dmaunmap_attachment(struct kgd_mem *mem,
 static int kfd_mem_export_dmabuf(struct kgd_mem *mem)
 {
 	if (!mem->dmabuf) {
-		struct dma_buf *ret = amdgpu_gem_prime_export(
-			&mem->bo->tbo.base,
+		struct amdgpu_device *bo_adev;
+		struct dma_buf *dmabuf;
+		int r, fd;
+
+		bo_adev = amdgpu_ttm_adev(mem->bo->tbo.bdev);
+		r = drm_gem_prime_handle_to_fd(&bo_adev->ddev, bo_adev->kfd.client.file,
+					       mem->gem_handle,
 			mem->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE ?
-				DRM_RDWR : 0);
-		if (IS_ERR(ret))
-			return PTR_ERR(ret);
-		mem->dmabuf = ret;
+					       DRM_RDWR : 0, &fd);
+		if (r)
+			return r;
+		dmabuf = dma_buf_get(fd);
+		close_fd(fd);
+		if (WARN_ON_ONCE(IS_ERR(dmabuf)))
+			return PTR_ERR(dmabuf);
+		mem->dmabuf = dmabuf;
 	}
 
 	return 0;
@@ -1826,6 +1836,9 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		pr_debug("Failed to allow vma node access. ret %d\n", ret);
 		goto err_node_allow;
 	}
+	ret = drm_gem_handle_create(adev->kfd.client.file, gobj, &(*mem)->gem_handle);
+	if (ret)
+		goto err_gem_handle_create;
 	bo = gem_to_amdgpu_bo(gobj);
 	if (bo_type == ttm_bo_type_sg) {
 		bo->tbo.sg = sg;
@@ -1877,6 +1890,8 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 err_pin_bo:
 err_validate_bo:
 	remove_kgd_mem_from_kfd_bo_list(*mem, avm->process_info);
+	drm_gem_handle_delete(adev->kfd.client.file, (*mem)->gem_handle);
+err_gem_handle_create:
 	drm_vma_node_revoke(&gobj->vma_node, drm_priv);
 err_node_allow:
 	/* Don't unreserve system mem limit twice */
@@ -1991,8 +2006,12 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 
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
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 06988cf1db51..4417a9863cd0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1855,8 +1855,8 @@ static uint32_t get_process_num_bos(struct kfd_process *p)
 	return num_of_bos;
 }
 
-static int criu_get_prime_handle(struct kgd_mem *mem, int flags,
-				      u32 *shared_fd)
+static int criu_get_prime_handle(struct kgd_mem *mem,
+				 int flags, u32 *shared_fd)
 {
 	struct dma_buf *dmabuf;
 	int ret;
-- 
2.34.1

