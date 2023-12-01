Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 497868017DB
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 00:36:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC0D10E99D;
	Fri,  1 Dec 2023 23:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E70510E992;
 Fri,  1 Dec 2023 23:36:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYqyQvJ5llhnMgc5+pN/pcwVpY6o898PZ6nL+ncRFMrVY0sm8sgJOpGjBfo3I8Nf2PU9hjstv952L+lgc/ApgUVILGgDx3YekTlAZF0pf6teuuwbi+5mFi53SaL7lhghBknELR+K9xOi45HTQyBIvncD0nMQICxSeGTTsEGYDdzTfcclhXLwQCcJ/lwyb2CDA7FOPRHZDtnOGtJTCKMaf0INJPYpYmM4qbbQxwnrIo2UTeH5RvY/glzmbZFwo8280sawqyA/SMT8MbXMyErR1sS2f8GEfyqiDi366176/rQZNf9e9scXRXZanpmS5w8vvBt8uxjH74XFWFNEoDmv2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z508SUl6xfK1SOuacFeVcUT7xIaThZXv4GiJA/LkZAM=;
 b=fN5si1RM8ToW4rwwmZ/vGylRC6lwmvLlDyksgNPaVyaoUcRrKU3tCk7JIO6n540BMV6SzxUAbns9qDT7Ci/fwM0zQpb2Y8YxhYhahXYKvyFMgIKZsOQ22OLw3yk6KhnGeY+CDIaxCGvBlayhEG8O9BEawIF8/nhhvkF7AX0nYckeOvFMDoPP2tC8fN9eUbJ0iwqVzJP+OKKYjevZ9OwzNLrMB68GRTaumCvKaAgbG2YtopsC1Q1k3apaFCxa/ODYyvhDhRcePBnUqD7g79UVcZCm+02xFElFxCV+oLmeBzDz+ZDcgb5WcAren2yNuA0ryfutJRaAdN1BXerL6EMj5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z508SUl6xfK1SOuacFeVcUT7xIaThZXv4GiJA/LkZAM=;
 b=Y/jLrUPOZXekGQjvr2i+o0fdB2dPRrvivU8HjPkQJObCjcmKGB5Jbz/Xj/CE0dKZS6QZLBqqniClQf9qYKaLU6ecDFWYHbaPg6F8I34SWVgDaAYWJS+4RcBwDdnsBduaGm2H0B0jk1Cp8ZZkMsS+4KgCMtaSB+rPUepS8HWP3KM=
Received: from BL1PR13CA0024.namprd13.prod.outlook.com (2603:10b6:208:256::29)
 by MN0PR12MB6056.namprd12.prod.outlook.com (2603:10b6:208:3cc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Fri, 1 Dec
 2023 23:36:05 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:256:cafe::5a) by BL1PR13CA0024.outlook.office365.com
 (2603:10b6:208:256::29) with Microsoft SMTP Server (version=TLS1_2,
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
 2023 17:36:05 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/6] drm/amdkfd: Import DMABufs for interop through DRM
Date: Fri, 1 Dec 2023 18:34:35 -0500
Message-ID: <20231201233438.1709981-3-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201233438.1709981-1-Felix.Kuehling@amd.com>
References: <20231201233438.1709981-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|MN0PR12MB6056:EE_
X-MS-Office365-Filtering-Correlation-Id: 09590712-9bfd-4628-d7c1-08dbf2c649c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hFIHzVanEFV0B7GIHw0z4wRIfmHTi/o36fWgIJdEP6x8Fl48S3doaJsG+Ef4VLP3dw+qiNZE0TsEjRDrR7mQR05n5AAJv3fAOsP9ZUBCOROeMe/UzHTtnXolJ2kwav1qLQN7AfJWd/fpZZeZ1ruFfFwJ/O96Ir24U0IP2d82+KLxk8x2WxI6LmomphZgB6o61e77PwFzc+ZThFIHhNTO/ZyQjh8nuJr/eJ7asfQB3B42uEysnk8w0H5zh3zDpNNDAWoeUU9tvh/R/yWxEVXZE+PvvU4mZFc/5CREQ0BDunAyk0fJaMUGgCXL2o81NlByn8g6xpnZwFcOABDrqZcspoPKw8lE+WdaEoMjhtkgUZXovS1bDbb+LgQWBlaMMeB3oetPz2fIlkP93bT0Coib6sVCejUbK7Jp+Kgw1azpdcaNwP/Ou4K/v3wJ0cmiiCJAxR4SuEsAVl2rmpgutp+paOYobOvO3VmXakOTJqcNGJZnE95z2LGVAuTKPT3l4wCYkcJRq7SGDkUudhvQ+vuVpQH7z7iMHkirkJa++MUUt40fYKKvtw01r333C7J9fYcQwamhSS0ChjEt54JoAO4IAMAsXcV9kr7QYv8RnTRr8JQYhIrEGTDOEPqHzAzGzHZQZUREe0M1WEC3oGmiU8z+gtvF4f++CQ0iUs56aSwSxPywF9YseZMnRnpEKQV/4oakQOtsZOv4Ea6Iw7qCrQ6b76a5yPyKOF5xxVMGXW5aprtimqHnWem8lRc8etRTK2HJ8orS1JwpRzAeZVVJhViciA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(82310400011)(186009)(451199024)(1800799012)(64100799003)(46966006)(40470700004)(36840700001)(5660300002)(2906002)(54906003)(8936002)(4326008)(450100002)(316002)(8676002)(70206006)(110136005)(70586007)(40480700001)(16526019)(7696005)(26005)(41300700001)(6666004)(478600001)(2616005)(1076003)(83380400001)(426003)(336012)(66574015)(40460700003)(47076005)(36860700001)(82740400003)(81166007)(356005)(86362001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 23:36:05.7671 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09590712-9bfd-4628-d7c1-08dbf2c649c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6056
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
 Ramesh Errabolu <Ramesh.Errabolu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
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
index 02973f5c8caf..cf6ed5fce291 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -314,11 +314,10 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *process_info,
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
index ae7dfaf59159..48697b789342 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1956,8 +1956,7 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 
 	/* Free the BO*/
 	drm_vma_node_revoke(&mem->bo->tbo.base.vma_node, drm_priv);
-	if (!mem->is_imported)
-		drm_gem_handle_delete(adev->kfd.client.file, mem->gem_handle);
+	drm_gem_handle_delete(adev->kfd.client.file, mem->gem_handle);
 	if (mem->dmabuf) {
 		dma_buf_put(mem->dmabuf);
 		mem->dmabuf = NULL;
@@ -2313,34 +2312,26 @@ int amdgpu_amdkfd_gpuvm_get_vm_fault_info(struct amdgpu_device *adev,
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
@@ -2390,8 +2381,41 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
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
index b4cb907f80c6..ce4c52ec34d8 100644
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

