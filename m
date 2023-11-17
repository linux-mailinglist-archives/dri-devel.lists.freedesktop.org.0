Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEB67EFB1A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 22:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F339810E79D;
	Fri, 17 Nov 2023 21:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017E710E799;
 Fri, 17 Nov 2023 21:57:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQ3SAT0tESYKnfPfvwC5zGg1CEmeKw3vksF8ouURDq3+yFOPPVHU3pajTbQJ0zgCNv8RFYwnKVAQOuMFZPs5nRYymQhEV/FSdAvTiaHJ6a4HKegnFCDGp07448mAJ6heQ2I5HCEZjwhjwVoQZHyA8VFz6Fh9mBXU2ZBcJKwrp3I5WT2lTJdmJ9qy7JdjW1ihupZEptdZpSYSq6BX8XZcpB+92N0pK7BikFTiSt4/4vlCqJ4mKY170T8rKxLfpPTGxbHSskUvOoNEQpNFdtQlkBzTTza0RyJlZLXPunmQwK8WbOxRXkgVHszoUeI3q8EqTV1Mdfb8HclrZBFMZMB4nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H03MrNYHtSL2bxChKF6OTueRnfCP1kiVfslk2TnP7MY=;
 b=oK7XWhbo3RjaMsz0CPlaTzI55Z5OJb65wAxaqBiSdzW0f58j1LOmzZrhvZmmOrMHw3QFYOWh2mVe9mi3gs4vAx+RS9cqVGolQK2U5kASzj7MxUV/ujkKFAiYpJbbBx//Mv84Nn7dfqaTDlXzof9zQmr5h8u538TTbkP6BaYMTFPStfnD8JvratSViVdAIFb6DkU+xB2K6Z+xNd46N348OZt/OPXfLnlAFWCUCDuE4RtgZKaSAbYr3RB0S1z5mUmEGzuEdOpjWaxeQYOulicPSAxuJqbbZHToVAlB2TciTLhuOTJRKsI1TJtyiJcHJVb4nfVVxS87Lr668XHXwcZmaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H03MrNYHtSL2bxChKF6OTueRnfCP1kiVfslk2TnP7MY=;
 b=voS1adBOVS2OkvPjPNg3LeAjuip+fbDag8jZgQz6RtjtbVUf+mvME2G2cqCzh/Czn03NKrF3iFtN12KBna9qzx1bflOVM17lx/HrWukFVEvHLYqeyolNzPd0Av1x1sPtBO1BA30FoqR30ig19IuEZmVFtKWy7lQM7EyyX35KZEo=
Received: from BN9PR03CA0421.namprd03.prod.outlook.com (2603:10b6:408:113::6)
 by PH8PR12MB7111.namprd12.prod.outlook.com (2603:10b6:510:22d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Fri, 17 Nov
 2023 21:57:03 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:408:113:cafe::86) by BN9PR03CA0421.outlook.office365.com
 (2603:10b6:408:113::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23 via Frontend
 Transport; Fri, 17 Nov 2023 21:57:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Fri, 17 Nov 2023 21:57:03 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 17 Nov
 2023 15:57:01 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amdkfd: Import DMABufs for interop through DRM
Date: Fri, 17 Nov 2023 16:44:19 -0500
Message-ID: <20231117214419.418556-3-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231117214419.418556-1-Felix.Kuehling@amd.com>
References: <20231117214419.418556-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|PH8PR12MB7111:EE_
X-MS-Office365-Filtering-Correlation-Id: a7e2aa71-295b-4198-96d8-08dbe7b821db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vzo1lz3AbudNuS4nHH1DO2DF85d2wmUzxPTQbO2BWo56fUCwSEaRlbZgxXTic30RvBFogHU4HneKbDEMEfEG5v8sW+ivrnkza0RVAR0NlUeix4sW/NGtQBMOLWFOkZ1lc9SIfNPtugoyVk7q9Wjkrg6pEKDM9TbDF0uBXKRqU1mv9Il8SSNKOFQ41qARgsALeJvAdw2YpIxEXZcTkrAY8ITRFwoZTKoPAoahSF0z6CHvG8uXSWuZdiSXgeTOZCHwQRIWMAGDmQBpIyHCqYr+w25gXvlfnGT78JB5PssYXhLEQRHOkCq9txKEyOBYmpQ2N6AYs2zqFrA055x0ggZaVlHY9m3lsBn18qoPOVJCIPQSzdk57ajWafTW+zTd4EXNdHfCKsxGsUboRMKaMIvtdDMMLD5bmgVkvMYl+qiMRZ3CQ7As1+RGL7EH/QC+0mLRWachDzxTRWEVeRLOm+DN3Ji5PGX+dLFA6uMx2OQ4qh4kM92quGubRbqB5TBdHY0EKmYJNLsVdlkR954SY1/CHur4jEoDtpUpD3NXZwURuQPeXsVyOtjpHy99qixpTGOAosaik4yHhetSWfsy5XxLxqJgg/+WJgV1FOMBJJrMb5nTY3uLxiWaJXJ5+oAwK4GrpFH8eVEgCZt6wKZ9n6WC96rODA3jUs0zXNRhJov+HckrHPUFaln0w/Sdkizyc0y3AypV4MsHBcvB048AtWU+2KSLM1OUum/agFm/np2/ukO6UBvINfihf0BSqKupv6sXe4+qa1uzn/KLuV34DYSh8Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(39860400002)(376002)(396003)(136003)(230922051799003)(82310400011)(1800799009)(451199024)(64100799003)(186009)(46966006)(40470700004)(36840700001)(4326008)(2906002)(5660300002)(81166007)(356005)(86362001)(36860700001)(82740400003)(47076005)(40480700001)(8936002)(450100002)(41300700001)(8676002)(83380400001)(66574015)(336012)(426003)(2616005)(36756003)(316002)(54906003)(16526019)(26005)(1076003)(70586007)(70206006)(110136005)(7696005)(40460700003)(6666004)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 21:57:03.0626 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e2aa71-295b-4198-96d8-08dbe7b821db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7111
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
Cc: "Xiaogang . Chen" <Xiaogang.Chen@amd.com>,
 Ramesh Errabolu <Ramesh.Errabolu@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drm_gem_prime_fd_to_handle to import DMABufs for interop. This
ensures that a GEM handle is created on import and that obj->dma_buf
will be set and remain set as long as the object is imported into KFD.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
Reviewed-by: Xiaogang.Chen <Xiaogang.Chen@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  9 ++-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 64 +++++++++++++------
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 15 ++---
 3 files changed, 52 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index c1195eb67057..8da42e0dddcb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -319,11 +319,10 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *process_info,
 					    struct dma_fence **ef);
 int amdgpu_amdkfd_gpuvm_get_vm_fault_info(struct amdgpu_device *adev,
 					      struct kfd_vm_fault_info *info);
-int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
-				      struct dma_buf *dmabuf,
-				      uint64_t va, void *drm_priv,
-				      struct kgd_mem **mem, uint64_t *size,
-				      uint64_t *mmap_offset);
+int amdgpu_amdkfd_gpuvm_import_dmabuf_fd(struct amdgpu_device *adev, int fd,
+					 uint64_t va, void *drm_priv,
+					 struct kgd_mem **mem, uint64_t *size,
+					 uint64_t *mmap_offset);
 int amdgpu_amdkfd_gpuvm_export_dmabuf(struct kgd_mem *mem,
 				      struct dma_buf **dmabuf);
 void amdgpu_amdkfd_debug_mem_fence(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index b13d68b7bb28..966272e067b2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1957,8 +1957,7 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 
 	/* Free the BO*/
 	drm_vma_node_revoke(&mem->bo->tbo.base.vma_node, drm_priv);
-	if (!mem->is_imported)
-		drm_gem_handle_delete(adev->kfd.client.file, mem->gem_handle);
+	drm_gem_handle_delete(adev->kfd.client.file, mem->gem_handle);
 	if (mem->dmabuf) {
 		dma_buf_put(mem->dmabuf);
 		mem->dmabuf = NULL;
@@ -2314,34 +2313,26 @@ int amdgpu_amdkfd_gpuvm_get_vm_fault_info(struct amdgpu_device *adev,
 	return 0;
 }
 
-int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
-				      struct dma_buf *dma_buf,
-				      uint64_t va, void *drm_priv,
-				      struct kgd_mem **mem, uint64_t *size,
-				      uint64_t *mmap_offset)
+static int import_obj_create(struct amdgpu_device *adev,
+			     struct dma_buf *dma_buf,
+			     struct drm_gem_object *obj,
+			     uint64_t va, void *drm_priv,
+			     struct kgd_mem **mem, uint64_t *size,
+			     uint64_t *mmap_offset)
 {
 	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
-	struct drm_gem_object *obj;
 	struct amdgpu_bo *bo;
 	int ret;
 
-	obj = amdgpu_gem_prime_import(adev_to_drm(adev), dma_buf);
-	if (IS_ERR(obj))
-		return PTR_ERR(obj);
-
 	bo = gem_to_amdgpu_bo(obj);
 	if (!(bo->preferred_domains & (AMDGPU_GEM_DOMAIN_VRAM |
-				    AMDGPU_GEM_DOMAIN_GTT))) {
+				    AMDGPU_GEM_DOMAIN_GTT)))
 		/* Only VRAM and GTT BOs are supported */
-		ret = -EINVAL;
-		goto err_put_obj;
-	}
+		return -EINVAL;
 
 	*mem = kzalloc(sizeof(struct kgd_mem), GFP_KERNEL);
-	if (!*mem) {
-		ret = -ENOMEM;
-		goto err_put_obj;
-	}
+	if (!*mem)
+		return -ENOMEM;
 
 	ret = drm_vma_node_allow(&obj->vma_node, drm_priv);
 	if (ret)
@@ -2391,8 +2382,41 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
 	drm_vma_node_revoke(&obj->vma_node, drm_priv);
 err_free_mem:
 	kfree(*mem);
+	return ret;
+}
+
+int amdgpu_amdkfd_gpuvm_import_dmabuf_fd(struct amdgpu_device *adev, int fd,
+					 uint64_t va, void *drm_priv,
+					 struct kgd_mem **mem, uint64_t *size,
+					 uint64_t *mmap_offset)
+{
+	struct drm_gem_object *obj;
+	uint32_t handle;
+	int ret;
+
+	ret = drm_gem_prime_fd_to_handle(&adev->ddev, adev->kfd.client.file, fd,
+					 &handle);
+	if (ret)
+		return ret;
+	obj = drm_gem_object_lookup(adev->kfd.client.file, handle);
+	if (!obj) {
+		ret = -EINVAL;
+		goto err_release_handle;
+	}
+
+	ret = import_obj_create(adev, obj->dma_buf, obj, va, drm_priv, mem, size,
+				mmap_offset);
+	if (ret)
+		goto err_put_obj;
+
+	(*mem)->gem_handle = handle;
+
+	return 0;
+
 err_put_obj:
 	drm_gem_object_put(obj);
+err_release_handle:
+	drm_gem_handle_delete(adev->kfd.client.file, handle);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index f6d4748c1980..247281b1c9d4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1564,16 +1564,11 @@ static int kfd_ioctl_import_dmabuf(struct file *filep,
 {
 	struct kfd_ioctl_import_dmabuf_args *args = data;
 	struct kfd_process_device *pdd;
-	struct dma_buf *dmabuf;
 	int idr_handle;
 	uint64_t size;
 	void *mem;
 	int r;
 
-	dmabuf = dma_buf_get(args->dmabuf_fd);
-	if (IS_ERR(dmabuf))
-		return PTR_ERR(dmabuf);
-
 	mutex_lock(&p->mutex);
 	pdd = kfd_process_device_data_by_id(p, args->gpu_id);
 	if (!pdd) {
@@ -1587,10 +1582,10 @@ static int kfd_ioctl_import_dmabuf(struct file *filep,
 		goto err_unlock;
 	}
 
-	r = amdgpu_amdkfd_gpuvm_import_dmabuf(pdd->dev->adev, dmabuf,
-					      args->va_addr, pdd->drm_priv,
-					      (struct kgd_mem **)&mem, &size,
-					      NULL);
+	r = amdgpu_amdkfd_gpuvm_import_dmabuf_fd(pdd->dev->adev, args->dmabuf_fd,
+						 args->va_addr, pdd->drm_priv,
+						 (struct kgd_mem **)&mem, &size,
+						 NULL);
 	if (r)
 		goto err_unlock;
 
@@ -1601,7 +1596,6 @@ static int kfd_ioctl_import_dmabuf(struct file *filep,
 	}
 
 	mutex_unlock(&p->mutex);
-	dma_buf_put(dmabuf);
 
 	args->handle = MAKE_HANDLE(args->gpu_id, idr_handle);
 
@@ -1612,7 +1606,6 @@ static int kfd_ioctl_import_dmabuf(struct file *filep,
 					       pdd->drm_priv, NULL);
 err_unlock:
 	mutex_unlock(&p->mutex);
-	dma_buf_put(dmabuf);
 	return r;
 }
 
-- 
2.34.1

