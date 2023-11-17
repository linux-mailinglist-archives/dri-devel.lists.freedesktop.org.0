Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F7E7EFB18
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 22:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E1310E79C;
	Fri, 17 Nov 2023 21:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2602F10E78D;
 Fri, 17 Nov 2023 21:57:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYVBUua9tg6o4vF+HXIB+bRa0dbx06/zndGUcK7iP3+4Xd9PKlacQftunk7P4tgC3QR9XCsYj7kEk0gAlUt958HHJvOpD0G88WOx+BRZ3VBdwki6r9d1nE1Pp6Mh1ysfwo8T6hq52aSPP9NIdHrswvOgXCgYSpnRaIvs8gdJhfmh5Q8BoAHiKXzfeaqITt/q3zewfwNF7Qj1L3HGRd+Q0R6OIi/g9uEJHpqckKBIYL87W2MO814BPcjl5dscOJS6w2L3u8ti5D2iiOQTKhkWrHzKohXNY8JZBiXRxw+belzQ6M7EsnQj4Nhc/3D5rzVsiUK8iwuQPCZy4oiJ8ZWE6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6lx0X0lm1TzXGB/2ULYLTvXkUMb3R9DRLfkMhvUM3A=;
 b=PfoX1jzWRTPKMpPhWtPpz9ifhz6GLNsoBCezZ1B3y9dd/rDt+Tpfp/B3mqUD+zz+oacCUGGyPcSwSywAv8aGfZDOn4gDNrXsEvYGfMkw4JC9USOLWb7hDN0lCMsOGR0Mxca34ZSf4vfyuVUhghHs083avqBzjZVELgf2YpPjlWCpyGl2m+Gu4b1Jg8StHHkxfMIfT32UwjM3JHHIJD6rgdMGdoF4KxQIzbmLk1wBDrcZzKYghkoSN50K6qgVijsVSswrCpbWpiXzq9CyGQd9yFyL1EyiWEs/yvictJtICx2J0ozxen80j4fyNcFOKzkU0KL1I55MquyeqRCdMHpeiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6lx0X0lm1TzXGB/2ULYLTvXkUMb3R9DRLfkMhvUM3A=;
 b=sPK82ov3Htg6qKKuZViAQNciS8UAW/tv6KqtyYBXNUUhXFtnVHvkfSRLNSkwGpOIFwKW8Xz+enta8mDVFIYnKEhqmj3GEMbhGJ1RlyJbgDjtIJhMtx+r2atGcF1KRdGfDAalCKhgZLQ3vPw5slauKNeisn3vCslR8ah/NKzEM6M=
Received: from BN9PR03CA0439.namprd03.prod.outlook.com (2603:10b6:408:113::24)
 by PH7PR12MB9203.namprd12.prod.outlook.com (2603:10b6:510:2f2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 21:57:02 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:408:113:cafe::4d) by BN9PR03CA0439.outlook.office365.com
 (2603:10b6:408:113::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23 via Frontend
 Transport; Fri, 17 Nov 2023 21:57:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Fri, 17 Nov 2023 21:57:02 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 17 Nov
 2023 15:57:01 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/amdkfd: Export DMABufs from KFD using GEM handles
Date: Fri, 17 Nov 2023 16:44:18 -0500
Message-ID: <20231117214419.418556-2-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231117214419.418556-1-Felix.Kuehling@amd.com>
References: <20231117214419.418556-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|PH7PR12MB9203:EE_
X-MS-Office365-Filtering-Correlation-Id: e8864346-1876-4e1a-8965-08dbe7b8214c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OrDI0Dhx5v24TKubLenCTYiEEaSpfg43DECYLaq9f41SUhJN+7XMlpwOmrBjTD4ReIQcGE+gvKC0DygyTvRTWzpvQn82KAJklU7FPmJahCfcYXeA4hpnP1BMq14C+ZeOLjtzH3LoK84e2bC2rlV3m7cXptYugoAKxoaS5SfT3HmTX40FOCNW0pu+n3Uou5sePdyOtSDMub36tva8x+SthObFja9yKWundsE3Xrz73bMzrwwKmf5nWtCWz+RlrQcZnVBOr+fTOCLMTlDeZhbAeZP5/4Egl/NcRPUDGHxvlz2cXK2ULV9ymxOhWPLv1fnJYll8uDPAyWOY13K5X7Ky6ciwMgoJCJB7HZXZVmhKdS1nkpzhvgZmQMMmJUr1MJcbwNnn2tNHlBy0nEpYJMwb/Z3xr1CAUqF7Na8Fh+g+bzu2uINSYadu5lf3c7ziBtpH1gbMxwAxPLXGIgT58XFVAjxkwUao7sDyCjj6qHiqHVx6zn35fsL91KlY7jzUA+ZOJvvT1awnTd0AnY1BwF8q4Y85pdWkSPbxjPBoHKlXGdby8vjGFcQbPuGw2doRKOZpsKMSKSE0M52yiLrA2jNUB7Pf4vXaitO61M0RJjij/VjyprmTjdun8HSjMVX0Tjkpb4NBov8bcgQjf1YW77fVVDcIC0pKzp4idPoKFdAYFG6VnmFrq4lb2Q0Wmgc7njHcgw74wDm72RNrLEC1xrDXlqPC1Ujrwc+nZk5vHEIeT4EAgq6qUl4TaOpmXn+Utu8ixP5TPLTt3rXX7e2DIGfuoQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(451199024)(82310400011)(64100799003)(186009)(1800799009)(36840700001)(40470700004)(46966006)(40460700003)(83380400001)(5660300002)(7696005)(36756003)(1076003)(2616005)(6666004)(16526019)(26005)(478600001)(41300700001)(336012)(426003)(2906002)(86362001)(47076005)(54906003)(70206006)(36860700001)(70586007)(110136005)(316002)(356005)(81166007)(40480700001)(450100002)(8936002)(82740400003)(8676002)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 21:57:02.0938 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8864346-1876-4e1a-8965-08dbe7b8214c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9203
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  5 +++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 33 +++++++++++++++----
 3 files changed, 42 insertions(+), 7 deletions(-)

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
index 41fbc4fd0fac..b13d68b7bb28 100644
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
@@ -1779,6 +1789,9 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		pr_debug("Failed to allow vma node access. ret %d\n", ret);
 		goto err_node_allow;
 	}
+	ret = drm_gem_handle_create(adev->kfd.client.file, gobj, &(*mem)->gem_handle);
+	if (ret)
+		goto err_gem_handle_create;
 	bo = gem_to_amdgpu_bo(gobj);
 	if (bo_type == ttm_bo_type_sg) {
 		bo->tbo.sg = sg;
@@ -1830,6 +1843,8 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 err_pin_bo:
 err_validate_bo:
 	remove_kgd_mem_from_kfd_bo_list(*mem, avm->process_info);
+	drm_gem_handle_delete(adev->kfd.client.file, (*mem)->gem_handle);
+err_gem_handle_create:
 	drm_vma_node_revoke(&gobj->vma_node, drm_priv);
 err_node_allow:
 	/* Don't unreserve system mem limit twice */
@@ -1942,8 +1957,12 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 
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

