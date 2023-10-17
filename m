Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D55D7CCF02
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 23:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB42910E33B;
	Tue, 17 Oct 2023 21:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8BE10E33F;
 Tue, 17 Oct 2023 21:14:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hiqw2mt89bKBp8tz7qBgT19dm0DGMrZdy8eUMnQK6zvmLrfNyPMxXUW9A4XUDbGM+0QkiTzbuME1PU6pLOpHukMQGVwmCNdaRmS6N7KH0q035pqb4Eaqzxlhwbdc4t/7F8ImEOyzZerTIGAO1NgHJfITO6EpNrPTNnTAbn6UBpBgLxnDggjp8gPMIq1vfFxaPbHUoqvGaCbNOKced/FnqzOTpr/nasV0sw77DDsleIU/ukPzoIKYRhqUpRGMlsU3iITOPuvapQL5yMNAcEGHfMctFKCDUtWf0vCEmWf0DkEgn/o4mezlsi9au9DvqPNdyAR1TArQkEWXuJ91/RVhGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+2oznMHIhZfSt00MUMFTkxyobaIGeG/XJ9ZqRMEJPA=;
 b=lxjFkGLhmLJHBhK/klHV22LKoItlvDmcN5yKjT2ncBQqPo4c6Xn/PWqp2HYtAE60hgK3fnl9UVpLY2xgiYpFfHV105WRKh9J1WDoBLW7dqbYMoViuBmNrwR2Z5aEJ3e8Wfg4XUsJpuTxjSak1txCQgVIL4XsOWGjBscen93ciCUblzv9Dx8tmP/qi/P7OUvIkPBOAaY0vlTkGR0J5MKSXqj2MSU37frSzxi4uWKpHHLBmL0wRCB2urApMBDCtgsRKjIc2XxYaUOitsm3kSj2yyS8rRQMLXxcaBDx/+hCusLkThCZXjh04/kj3WuoY4sjIMPpFE76rxnvl2kOV3DZJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+2oznMHIhZfSt00MUMFTkxyobaIGeG/XJ9ZqRMEJPA=;
 b=fF+Uno89JTI38RUth0hfmhwjVkOp5MSmSblUdkHGYGT7q7qbb252a4lCt7Z9qDjYIOm0H64357oOSpqBH1iaA8LPgmLWLIA6dzi1VJrs1PkSG8+NFSDTGXPmOva6GhIK3z1od6dq0nnODkuAZJmSWEhXGdrP2K98X2O9Qytd1Zo=
Received: from BL0PR02CA0002.namprd02.prod.outlook.com (2603:10b6:207:3c::15)
 by SA1PR12MB6798.namprd12.prod.outlook.com (2603:10b6:806:25a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 21:14:28 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:207:3c:cafe::ad) by BL0PR02CA0002.outlook.office365.com
 (2603:10b6:207:3c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36 via Frontend
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
Subject: [PATCH 10/11] drm/amdkfd: Import DMABufs for interop through DRM
Date: Tue, 17 Oct 2023 17:13:36 -0400
Message-ID: <20231017211337.1593869-11-Felix.Kuehling@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|SA1PR12MB6798:EE_
X-MS-Office365-Filtering-Correlation-Id: 691ea4a5-b107-4617-c1b3-08dbcf560bf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QIiDDYGGBCIPQe/cE0y7Pl+vHpPQbdL5+QS78dpmScLvvMR94401vTQnFoY2xlalrS9qcRWB8Vd1lr0rND2UfSOG1Z2i2fshwQ6b/NlfcytLXyZTbp9HIKUz4vDXIkXHK7HsKR7gvevzZGzRrH4AvS6yMo7J2gG4Bb2IbzNaTozX1ETJvjlQjW6QaDI15sTuU5fTbhmYDTsTPPueMXSVQErnHE/JuNNLOkSdSnw32c/KPQ3yjUDpYS06ROQLsYd4/7IBODXSFOenwMsVLjO8fio2MMS+uzsMuyRjJYXhJbMtzuN0xd7NCwCWa/uaXbHIlAb5kCXhNGWeSmSbmWaHe/M2jUHlhKtmAgnU3a+OXDnXA7ttQMGtdvzKCjPvB/r0OfvPHenB5LHISDXDknksVJ7wPUlkkq0olCPVAlIwFFSvDqOj1EUITEey/NR5fBkIZ0Nfqr0QLXQIDYBJ92zWtk6PH247wcbZDw4Tgfmk6JM6MRo3IgIq/V3HEewYJZngtCznDahg+6fNjXt5GHcd4AVZTAM7IywT8QPkYXYtl8vTixzZvn9qzpXctpZDDpIhg93DNtGOb3X4CxUUHpJ+9+u7JDwe+3lSsQyYcmk3Nt7EfcikFNHLwT5k4LQeyRnDkr0+cK/BuhoydgNp4NhiB/3bf2gDViHEBTqJCt3DS+Mt4Wyx/z/4saGhXV0ifd84kuQ/juPoy0a0viSRWt+aYRJkZ97H9OejRooAX8EmR85JxemNpULtEMD9tn+hyzlO
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(230922051799003)(1800799009)(186009)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(54906003)(110136005)(47076005)(70586007)(70206006)(508600001)(6666004)(26005)(16526019)(1076003)(336012)(316002)(426003)(7696005)(8936002)(4326008)(2906002)(8676002)(450100002)(5660300002)(36756003)(81166007)(86362001)(83380400001)(36860700001)(356005)(2616005)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 21:14:27.7511 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 691ea4a5-b107-4617-c1b3-08dbcf560bf7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6798
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

Use drm_gem_prime_fd_to_handle to import DMABufs for interop. This
ensures that a GEM handle is created on import and that obj->dma_buf
will be set and remain set as long as the object is imported into KFD.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  9 ++-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 64 +++++++++++++------
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 15 ++---
 3 files changed, 52 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 4caf8cece028..88a0e0734270 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -318,11 +318,10 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *process_info,
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
index 4bb8b5fd7598..1077de8bced2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -2006,8 +2006,7 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 
 	/* Free the BO*/
 	drm_vma_node_revoke(&mem->bo->tbo.base.vma_node, drm_priv);
-	if (!mem->is_imported)
-		drm_gem_handle_delete(adev->kfd.client.file, mem->gem_handle);
+	drm_gem_handle_delete(adev->kfd.client.file, mem->gem_handle);
 	if (mem->dmabuf) {
 		dma_buf_put(mem->dmabuf);
 		mem->dmabuf = NULL;
@@ -2363,34 +2362,26 @@ int amdgpu_amdkfd_gpuvm_get_vm_fault_info(struct amdgpu_device *adev,
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
@@ -2440,8 +2431,41 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
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
index 4417a9863cd0..1a2e9f564b7f 100644
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

