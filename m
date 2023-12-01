Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C0A8017D5
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 00:36:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB71710E997;
	Fri,  1 Dec 2023 23:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D001910E991;
 Fri,  1 Dec 2023 23:36:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUEwnIiXyBQnz8OFB5fkxHFnLPCK/HMVMXreqqb6K4DiO8kVwOwQV2pQJh62Xmw6LG1yUu6OC/blgfS3wHy8+tg8xvXlVAMPGDj8YULDs0VIvBPtBikZqYX644wuKx/J5Cx2h8oGfGeNWELMbveFt9YiCFutAPIe1MQX2EzqBHZjBxJI61j/Ult2VsNB8mPETFbW9D/CQZNfFEwCM6Ew9z6tF3/ivfXE0V1CRGeGSJy2QtrOiCTq5PUqBHj78LHnD35TEyoLdqOCnSXj9YQ8c8mgak+4J220B/UOJiKpwU8FhqFEb++p3YHnUGBCb+QYX7jAISq6RCe8UOcsV8rDtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EuQcIXAD77PqqGXWeSxVtuRuqX1xgjVLkWJjITP79HM=;
 b=lrn8JTjxP3EW7mFBAZgWvlLnYiRbfYlE7z1L7BcBi5L3ubOPJ2hiFZniP/XSTSDFVdUYXbvhbT0Cyc3QtiC98b/0B15it+UDgIrsFTsg+WmvubvYnBNtExvPwmJlcFLKuwyaHvRWBaSLgB/wWHFH+A+WDFheObVkag/RNa9P0Jgy7GTkJbKaSlKtKtwT9st/b3C/Sco0hIgoLWzU4tvEpsCBRIIea5r/zXeD3dJgU402KABeD86NbUWSmHT/ly8qwbWJS9hUR5nJMbJZQAM4lQGeuImRaoBELqBEFsVFiC+sTZDw12jFeyukz9ZtttsovAqXhj9f923GefPxTNj12w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EuQcIXAD77PqqGXWeSxVtuRuqX1xgjVLkWJjITP79HM=;
 b=RFZfOLC5uWmk1I73nlL42MvT9HG+xyLP2l3x+jqKDA18u3EyQQvq/0GoEmYOdT9dO5Q3ka41KR1jY17nuRAGhmPnIKy3nB7Iylusz9CLmSyfa6Fg/fkUyGqVi9f7k9P9YMgGVp8QuAJMU9u8Wm7IBMVDZSzBYohkfI1Ei7UHvGA=
Received: from BL1PR13CA0005.namprd13.prod.outlook.com (2603:10b6:208:256::10)
 by IA0PR12MB8694.namprd12.prod.outlook.com (2603:10b6:208:488::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Fri, 1 Dec
 2023 23:36:05 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:256:cafe::2) by BL1PR13CA0005.outlook.office365.com
 (2603:10b6:208:256::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.8 via Frontend
 Transport; Fri, 1 Dec 2023 23:36:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Fri, 1 Dec 2023 23:36:05 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 1 Dec
 2023 17:36:04 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/6] drm/amdkfd: Export DMABufs from KFD using GEM handles
Date: Fri, 1 Dec 2023 18:34:34 -0500
Message-ID: <20231201233438.1709981-2-Felix.Kuehling@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|IA0PR12MB8694:EE_
X-MS-Office365-Filtering-Correlation-Id: 6909402d-3193-4868-b1c2-08dbf2c6499e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G5SSVyyqKSUKP989H3zoUZ+CdyuG5mjuwpPA/rV+bxEUxryfhmnbvjUvFIKDR+YjIN2OGKOCPXQnwOBze0AWO887jgLIJkml9W23+S/WRPeyVL14DrKHcbW5ftZOAI/cyOnKwfFt07S6JCP2C139JyOky8vDF+LyC9Y9rThkcPCVs0k1HT6N/r+9ers41OWeVgV+zf75QOEI+jZ0J6JadwxFFZyZ4+CZa8NU2juI7p+qbMpjJtStN+68nexnIzv4Izj3NYLnjzCoS0G+GMFltYRUZ2468L/7nYNE59RngaqarTRBfozke3CwEw+odNfaeKIQDxb4wgpTjewkpzgfAYyNK/FZAJLhBEEgc3Fm7vYGhbA/Hy+6x2nIzDLpakUlAIsch1efGLGgljDw/pdI3+UU5g3VXwGA5ta/JbD8zl+jGqCbGi5+04t6TdO9ufF/Ci5k2HGw7uQAD9o+WylT4FRRXmPY32G+iOZRel0AKQlE/OTXFhsHH3Lx9H1uiT2C2pzdowBh67WSqoozPph2U7nIkb/i4bUQMTQoFWNX6gE3EOugCsnKNGpQmZLbSzyTUvQOcAq0ghShtOruO3IUPBkpOa2hoC5SEV9I90ZwRL9PY+JOs9L28Zf9sDJKl387PBeUaiIwZFbYhfhPoYUJ6DlBGKFFTNhYJHz8pp7OFdLkvIesRoKYGi25FYnBIGqw128A4C4+01STST0v6INPwLtyqu3G53I31/mYXtDVQQ3pX9fq2BCU96GpMDfkeWhTenTjw/8SmCuKYRpp6UNxsg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(396003)(39860400002)(346002)(136003)(230922051799003)(1800799012)(186009)(82310400011)(64100799003)(451199024)(36840700001)(40470700004)(46966006)(450100002)(8936002)(4326008)(110136005)(26005)(1076003)(2616005)(86362001)(478600001)(8676002)(6666004)(70206006)(70586007)(16526019)(7696005)(426003)(83380400001)(316002)(40480700001)(336012)(47076005)(5660300002)(36860700001)(81166007)(2906002)(40460700003)(82740400003)(356005)(41300700001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 23:36:05.5171 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6909402d-3193-4868-b1c2-08dbf2c6499e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8694
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
Cc: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create GEM handles for exporting DMABufs using GEM-Prime APIs. The GEM
handles are created in a drm_client_dev context to avoid exposing them
in user mode contexts through a DMABuf import.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    | 11 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  5 +++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 33 +++++++++++++++----
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  4 +--
 4 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index 2d22f7d45512..067690ba7bff 100644
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
index 16794c2eea35..02973f5c8caf 100644
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
index 73288f9ccaf8..ae7dfaf59159 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -25,6 +25,7 @@
 #include <linux/pagemap.h>
 #include <linux/sched/mm.h>
 #include <linux/sched/task.h>
+#include <linux/fdtable.h>
 #include <drm/ttm/ttm_tt.h>
 
 #include <drm/drm_exec.h>
@@ -806,13 +807,22 @@ kfd_mem_dmaunmap_attachment(struct kgd_mem *mem,
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
@@ -1778,6 +1788,9 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		pr_debug("Failed to allow vma node access. ret %d\n", ret);
 		goto err_node_allow;
 	}
+	ret = drm_gem_handle_create(adev->kfd.client.file, gobj, &(*mem)->gem_handle);
+	if (ret)
+		goto err_gem_handle_create;
 	bo = gem_to_amdgpu_bo(gobj);
 	if (bo_type == ttm_bo_type_sg) {
 		bo->tbo.sg = sg;
@@ -1829,6 +1842,8 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 err_pin_bo:
 err_validate_bo:
 	remove_kgd_mem_from_kfd_bo_list(*mem, avm->process_info);
+	drm_gem_handle_delete(adev->kfd.client.file, (*mem)->gem_handle);
+err_gem_handle_create:
 	drm_vma_node_revoke(&gobj->vma_node, drm_priv);
 err_node_allow:
 	/* Don't unreserve system mem limit twice */
@@ -1941,8 +1956,12 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 
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
index f6d4748c1980..b4cb907f80c6 100644
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

