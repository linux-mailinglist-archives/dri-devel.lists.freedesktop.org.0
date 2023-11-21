Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A077F3A21
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 00:11:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BB210E5A4;
	Tue, 21 Nov 2023 23:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED9D10E2D5;
 Tue, 21 Nov 2023 23:11:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROkJ6WpcE0/2ambTtcb02Sre/3rAMTgEqToldbXn0h32aHYQhCUQecehH7CXMkmQoDvEcbfSu+VWTPErV3lZd0k9AIl8eFW8s+JBQvZw7eTRnysFpH7vlwL6zxOcD2FH8NowLBcBlBQ1IgsHU0t48M27J4knpwSFbpDrFXzQqNZKFgy7gTTX24UJh7fVLG53r3vAagYC9Yzreq89zeaSV3ycBPuelooiPPqgKUNxVmx/3R0ySh91n3vFb5T0NLTSVZNrjGsJYvClFIo0WJjp9pKaHHWAkE+06wXIdzNT0hy1MDTNiCSFF3Fu6BH2q1A5NBGBOsxnMo0KBR3pU2nJug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGPQBnepvvu5DK0aDqGUqFm65MI6AqgahnSN+Pqklj0=;
 b=Zs1Pwta32aaqYCTCoJk7sgGZIdULaDTxbGHFfBZFIkKKfNnFxZ3jynH45O2SO6b1Idod72+fZtb3bXECfeqaIqCmnRnuWIy0/izXBd1SChQez8LlrReK6NWDDn2oFilywf1M3bbX9YTLENK+hjMEWgWKgIdUYDN3wF1HvMB7AAsdlHAnUKLJI6aPZkZagvM6AMf04ouqYtButNAJuvCHi5T/yPM+Iykj7Yqc0BfkEhenwek2QLlT8OQ5HbFcFpWsiw9u36JgyJB/nYy94FX3CuM3CZimyCsXJv/OETqE6jrVGb3CO1IYM6TVUInNLHDblIwDLHTTauJOLKoMyFin1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGPQBnepvvu5DK0aDqGUqFm65MI6AqgahnSN+Pqklj0=;
 b=GZ0eGjx+nu587raUR0xgoI+/vSedtuPOyXKWJypL8ZFoto3bAQTGZDQj9CXRWwNhsnb75FlCsSlPanBkhUAJHqDhM3UGtsHyrv2l4XyH1agRRYLUmtst5JjSV8pR8s35DRJdOuiON8SW47mVnlLL4gWod1Fy0BIFMcAbd6DXid4=
Received: from CH0PR03CA0252.namprd03.prod.outlook.com (2603:10b6:610:e5::17)
 by SJ2PR12MB8135.namprd12.prod.outlook.com (2603:10b6:a03:4f3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Tue, 21 Nov
 2023 23:11:41 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::3) by CH0PR03CA0252.outlook.office365.com
 (2603:10b6:610:e5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28 via Frontend
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
Subject: [PATCH v2 4/4] drm/amdkfd: Import DMABufs for interop through DRM
Date: Tue, 21 Nov 2023 18:11:14 -0500
Message-ID: <20231121231114.703478-4-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231121231114.703478-1-Felix.Kuehling@amd.com>
References: <20231121231114.703478-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|SJ2PR12MB8135:EE_
X-MS-Office365-Filtering-Correlation-Id: af3391e6-cf6a-4ba8-7dd6-08dbeae73867
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vRCkd4sZyeEYEhrcVjkTVzeR0xvjBX5arYPgbDxnjkY8lZzS4SUzN8Mcpi8MfwlncAfTy+M4FH4RDZB8bpAMSz1UT+VG/NQfTxCb/jC8yAzU5srWVV0fL0J948Oy2vomYa8GM+c59Ie9KJ4AX/PfKVhTrHkWAR+p8h32qmN9kiLZA3/LTNJ+leSYAHMOU9YGWtlyBFQ3siCMSiRUQ/47WhCCDlqyRNoLjvRhwTGFrjq8pfP3A/xTUMOffVNNOBa7iakHmmSXYiKfoJ+YL8V0QeZidoV46kuvBxIBP7am9RCLUscIjYPc1QuGjK2gfbin8X2DylLRsthiiJZHfv+6xEXT1GcacpETyWHKy2sf+2o9fSexqpQIqtD+slkdOlc/KEmu16BA8wAlN8gi951SucIOqzqQau30gZMw5/0zETNYnZnjMIcXx/VDLjEpb5pCG78RPpbRJ1YK+aFeVoBOkL/bbS0hCI6W4pA4D2A9l8gdhN/bp12OYeDWzF3FCn25Hm2V/lg8cKbsbc/vGGIVH7foPtGSDondfKF34qo8GDYOK8mNDUAOcwQDffD985M8yyH0hNgkgbtlWFc8VvUT/pKbArarxcLOPzcirpzFEHUSO0EtpGURnbHDfehFAqCzuP9ZvuViUnves3v/16nisS1DrnLq7ac9WfhJG81UI5raTU7baE/UBkhTY4Tpkoe03jymeqZPkUeABnKsa4FIFRVWis52Nz6SMc16YzjhP1zYne8AnQKMEIxTtUYKhcJlAjkeMs8o98U7vPiU1gxbNw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(346002)(376002)(39860400002)(136003)(230922051799003)(186009)(451199024)(82310400011)(1800799012)(64100799003)(40470700004)(46966006)(36840700001)(40480700001)(356005)(41300700001)(81166007)(36860700001)(5660300002)(86362001)(83380400001)(47076005)(66574015)(336012)(1076003)(8936002)(8676002)(4326008)(426003)(450100002)(26005)(54906003)(16526019)(316002)(2906002)(2616005)(70206006)(110136005)(70586007)(6666004)(7696005)(40460700003)(478600001)(82740400003)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 23:11:40.6771 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af3391e6-cf6a-4ba8-7dd6-08dbeae73867
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8135
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
index e96e1595791f..652657c863ff 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1953,8 +1953,7 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 
 	/* Free the BO*/
 	drm_vma_node_revoke(&mem->bo->tbo.base.vma_node, drm_priv);
-	if (!mem->is_imported)
-		drm_gem_handle_delete(adev->kfd.client.file, mem->gem_handle);
+	drm_gem_handle_delete(adev->kfd.client.file, mem->gem_handle);
 	if (mem->dmabuf) {
 		dma_buf_put(mem->dmabuf);
 		mem->dmabuf = NULL;
@@ -2310,34 +2309,26 @@ int amdgpu_amdkfd_gpuvm_get_vm_fault_info(struct amdgpu_device *adev,
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
@@ -2387,8 +2378,41 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
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

