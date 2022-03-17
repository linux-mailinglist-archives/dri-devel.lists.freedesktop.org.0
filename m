Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6EF4DBB93
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 01:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9901B10EAB5;
	Thu, 17 Mar 2022 00:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C9E10EAB2;
 Thu, 17 Mar 2022 00:19:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgGA4Mb3TYlGqxD8SvihcvwPH1TBXEsGQUjrL/0HfSTZw7TStstmZkCQ2QvE7bhA9QDvbeGH7b4VE3TspMiQ56c8l9H+WdgR/PzCP5LGSYeePWrLKRvsjl7eAQJxo5lMs/XKw7IgA0BUduVPzhsNZhpmu3oGsqvuaZUiuHdg57wkkzyxnKAnyF8EP8nqTtB1LTYAaMOdABISW6khVJq9bt2kDV8hHIN9lxfSkqarmO5TS5MYI4nzZ8PB/3aiFyl18A2bOxpnMupRZ2KZvzmvlr4TgHQ6+1pJ4oBj08TAiDHTQfL0ekLW+/QYFtv1XAHsAL4gHgZOX3pURE0mvJPdsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNwYnN3osSCPq7IU5oZFAQ/VRl0bcnWQKwmTehjUP1I=;
 b=CvcwLlVhrYMsLyHfcWkrpuOVDaufvjTHEB6Jqy972jgPgZCOHYWkXuIpsKHH3YeqMMGc5Xjj81Df6NeTY3B9tCrKiwT7ro3XzY6CfufuH2ieqggIxFcCsC88cqMzJRsMqsw2c0N0rxBa0xfOTWL7xU9MHqAqU9gFynBB+AanCVk6QVBwRNiADfN5W+IUWHaUh9/Sa8zIiSFku2zY94lTVvLCFKGMF3o3eC3dh0bV7jTTXSQTaLVF91TpZy3VpNcuFtXHU3qlF/88aPhGNKWqk4LB+do3OuLrqCL6aYxfK4DY1hYbVNsFU3MFcs4a9WDcyKKLduK1Pvm3akOE1xPacw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNwYnN3osSCPq7IU5oZFAQ/VRl0bcnWQKwmTehjUP1I=;
 b=EGLMm1pokRy+GiVGx4kVhjhiFQwf80Dl2CSGPeZcI3fV5AaYGRiUs7OHoYbMCVEOcASbhxxTdOPox9riWsWvPme4kHEBfUtjku+yXOHYvG8VLox1LPLU/K2DVAcgK+M/gCs5bGSo2YPunYN32UuNlsGeo+7vOZBZsUs8wjNB91c=
Received: from BN9PR03CA0562.namprd03.prod.outlook.com (2603:10b6:408:138::27)
 by BN8PR12MB3185.namprd12.prod.outlook.com (2603:10b6:408:9a::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Thu, 17 Mar
 2022 00:19:38 +0000
Received: from BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:138:cafe::82) by BN9PR03CA0562.outlook.office365.com
 (2603:10b6:408:138::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25 via Frontend
 Transport; Thu, 17 Mar 2022 00:19:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT057.mail.protection.outlook.com (10.13.177.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5081.14 via Frontend Transport; Thu, 17 Mar 2022 00:19:38 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 16 Mar
 2022 19:19:36 -0500
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 2/2] drm/amdkfd: Implement DMA buf fd export for RDMA
Date: Wed, 16 Mar 2022 20:19:12 -0400
Message-ID: <20220317001912.342369-2-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317001912.342369-1-Felix.Kuehling@amd.com>
References: <20220317001912.342369-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eaf4775e-4bf9-4031-579b-08da07abd2a4
X-MS-TrafficTypeDiagnostic: BN8PR12MB3185:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB3185BBD360AD4EA981AB17F992129@BN8PR12MB3185.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ywJ8gMee0KqTCugTcTCR8KxP6HCTETUTB/qHtu8wRjbLlhgHd/yQ03V6d++IkSzForJ3gjGKGgQovFIyF2DGULcSkIgxrmIkGeJXurxqFEN4oOXPMQJMgo0uFlcOOJvbkSJilBo+RuA6u2VlP21EqgkbYOlQue6kiaspzZB4wdQh+wNZSoom33gpwXIRxB4X7KMb/LuyQxKtCvbgIfeOD/nsiHhCLuR3gR6rc/zRGpRyXu5+eOdZX/Pk7SDdKJMiVHkIHdTfUhIezu9+tRzb3jbZAvBF96jeOlJN+STh5RsCallzrSamTImO6yhRFcYZys1q2JAdsZjMAXkyZH2wf0+TJ5bB1AuWZI18uKH084QcEdPE+h3GSJxP6YBinVsTGAmnieqB97fVcNINDeYSW9+VXPS9RaNPZ/2+pj71Q/t/sDP9LwovRQv2Ko4SgnOrHauYpDJgw1ZwPAb0eH2+tsDdXm13as7W5OfGzAvtIb9HsbLY2b8TNdwraP+ojyO7mzbL1gwR/bL8+O2HMwLjfPUXQvvZPpiWHdongY7gf6rBA7F6I4KW0vf5x5M0kSlh7aUpRobS8/wi5Q1SK92wgSuOJ0HssTZ0P64JbgXC/64rADjbLrDaTwD/odl+awCOenKx3QDxZ6z0pSDBB3ogB3h1o34rGNAD0qYz8Vg858/TVwIFIIT229yXk5CI1xLEfyMYbPkD/k8v6QA/ajz2ziNCe6cFVsdNrO2zNbFva2E3/5w2iuek5weSfm+c31cZ+yUlYybxLs+IqZyTQtPiS8selke6F1aPzJATIiFjZY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(2906002)(83380400001)(966005)(508600001)(36756003)(6666004)(7696005)(86362001)(2616005)(47076005)(426003)(336012)(82310400004)(1076003)(26005)(186003)(16526019)(8936002)(356005)(8676002)(4326008)(40460700003)(450100002)(70586007)(70206006)(6916009)(81166007)(316002)(5660300002)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 00:19:38.0509 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf4775e-4bf9-4031-579b-08da07abd2a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3185
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Exports a DMA buf fd of a given KFD buffer handle. This is intended for
the new upstreamable RDMA solution coming to UCX and libfabric.

The corresponding user mode change (Thunk API and kfdtest) is here:
https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface/commits/fxkamd/dmabuf

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  2 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 45 ++++++++++++----
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 54 +++++++++++++++++++
 include/uapi/linux/kfd_ioctl.h                | 14 ++++-
 4 files changed, 103 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 4cb14c2fe53f..0b8cfe8c72ea 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -294,6 +294,8 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
 				      uint64_t va, void *drm_priv,
 				      struct kgd_mem **mem, uint64_t *size,
 				      uint64_t *mmap_offset);
+int amdgpu_amdkfd_gpuvm_export_dmabuf(struct kgd_mem *mem,
+				      struct dma_buf **dmabuf);
 int amdgpu_amdkfd_get_tile_config(struct amdgpu_device *adev,
 				struct tile_config *config);
 void amdgpu_amdkfd_ras_poison_consumption_handler(struct amdgpu_device *adev,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 2ac61a1e665e..d23fdebd2552 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -641,6 +641,21 @@ kfd_mem_attach_userptr(struct amdgpu_device *adev, struct kgd_mem *mem,
 	return 0;
 }
 
+static int kfd_mem_export_dmabuf(struct kgd_mem *mem)
+{
+	if (!mem->dmabuf) {
+		struct dma_buf *ret = amdgpu_gem_prime_export(
+			&mem->bo->tbo.base,
+			mem->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE ?
+				DRM_RDWR : 0);
+		if (IS_ERR(ret))
+			return PTR_ERR(ret);
+		mem->dmabuf = ret;
+	}
+
+	return 0;
+}
+
 static int
 kfd_mem_attach_dmabuf(struct amdgpu_device *adev, struct kgd_mem *mem,
 		      struct amdgpu_bo **bo)
@@ -648,16 +663,9 @@ kfd_mem_attach_dmabuf(struct amdgpu_device *adev, struct kgd_mem *mem,
 	struct drm_gem_object *gobj;
 	int ret;
 
-	if (!mem->dmabuf) {
-		mem->dmabuf = amdgpu_gem_prime_export(&mem->bo->tbo.base,
-			mem->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE ?
-				DRM_RDWR : 0);
-		if (IS_ERR(mem->dmabuf)) {
-			ret = PTR_ERR(mem->dmabuf);
-			mem->dmabuf = NULL;
-			return ret;
-		}
-	}
+	ret = kfd_mem_export_dmabuf(mem);
+	if (ret)
+		return ret;
 
 	gobj = amdgpu_gem_prime_import(adev_to_drm(adev), mem->dmabuf);
 	if (IS_ERR(gobj))
@@ -2091,6 +2099,23 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
 	return ret;
 }
 
+int amdgpu_amdkfd_gpuvm_export_dmabuf(struct kgd_mem *mem,
+				      struct dma_buf **dma_buf)
+{
+	int ret;
+
+	mutex_lock(&mem->lock);
+	ret = kfd_mem_export_dmabuf(mem);
+	if (ret)
+		goto out;
+
+	get_dma_buf(mem->dmabuf);
+	*dma_buf = mem->dmabuf;
+out:
+	mutex_unlock(&mem->lock);
+	return ret;
+}
+
 /* Evict a userptr BO by stopping the queues if necessary
  *
  * Runs in MMU notifier, may be in RECLAIM_FS context. This means it
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index e1e2362841f8..6f5c5b533862 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1500,6 +1500,58 @@ static int kfd_ioctl_import_dmabuf(struct file *filep,
 	return r;
 }
 
+static int kfd_ioctl_export_dmabuf(struct file *filep,
+				   struct kfd_process *p, void *data)
+{
+	struct kfd_ioctl_export_dmabuf_args *args = data;
+	struct kfd_process_device *pdd;
+	struct dma_buf *dmabuf;
+	struct kfd_dev *dev;
+	void *mem;
+	int ret = 0;
+
+	dev = kfd_device_by_id(GET_GPU_ID(args->handle));
+	if (!dev)
+		return -EINVAL;
+
+	mutex_lock(&p->mutex);
+
+	pdd = kfd_get_process_device_data(dev, p);
+	if (!pdd) {
+		ret = -EINVAL;
+		goto err_unlock;
+	}
+
+	mem = kfd_process_device_translate_handle(pdd,
+						GET_IDR_HANDLE(args->handle));
+	if (!mem) {
+		ret = -EINVAL;
+		goto err_unlock;
+	}
+
+	ret = amdgpu_amdkfd_gpuvm_export_dmabuf(mem, &dmabuf);
+	mutex_unlock(&p->mutex);
+	if (ret)
+		goto err_out;
+
+	ret = dma_buf_fd(dmabuf, args->flags);
+	if (ret < 0) {
+		dma_buf_put(dmabuf);
+		goto err_out;
+	}
+	/* dma_buf_fd assigns the reference count to the fd, no need to
+	 * put the reference here.
+	 */
+	args->dmabuf_fd = ret;
+
+	return 0;
+
+err_unlock:
+	mutex_unlock(&p->mutex);
+err_out:
+	return ret;
+}
+
 /* Handle requests for watching SMI events */
 static int kfd_ioctl_smi_events(struct file *filep,
 				struct kfd_process *p, void *data)
@@ -2656,6 +2708,8 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[] = {
 	AMDKFD_IOCTL_DEF(AMDKFD_IOC_CRIU_OP,
 			kfd_ioctl_criu, KFD_IOC_FLAG_CHECKPOINT_RESTORE),
 
+	AMDKFD_IOCTL_DEF(AMDKFD_IOC_EXPORT_DMABUF,
+				kfd_ioctl_export_dmabuf, 0),
 };
 
 #define AMDKFD_CORE_IOCTL_COUNT	ARRAY_SIZE(amdkfd_ioctls)
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index eb9ff85f8556..edf7b1648335 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -34,9 +34,10 @@
  * - 1.6 - Query clear flags in SVM get_attr API
  * - 1.7 - Checkpoint Restore (CRIU) API
  * - 1.8 - CRIU - Support for SDMA transfers with GTT BOs
+ * - 1.9 - Add DMA buf export ioctl
  */
 #define KFD_IOCTL_MAJOR_VERSION 1
-#define KFD_IOCTL_MINOR_VERSION 8
+#define KFD_IOCTL_MINOR_VERSION 9
 
 struct kfd_ioctl_get_version_args {
 	__u32 major_version;	/* from KFD */
@@ -452,6 +453,12 @@ struct kfd_ioctl_import_dmabuf_args {
 	__u32 dmabuf_fd;	/* to KFD */
 };
 
+struct kfd_ioctl_export_dmabuf_args {
+	__u64 handle;		/* to KFD */
+	__u32 flags;		/* to KFD */
+	__u32 dmabuf_fd;	/* from KFD */
+};
+
 /*
  * KFD SMI(System Management Interface) events
  */
@@ -824,7 +831,10 @@ struct kfd_ioctl_set_xnack_mode_args {
 #define AMDKFD_IOC_CRIU_OP			\
 		AMDKFD_IOWR(0x22, struct kfd_ioctl_criu_args)
 
+#define AMDKFD_IOC_EXPORT_DMABUF		\
+		AMDKFD_IOWR(0x23, struct kfd_ioctl_export_dmabuf_args)
+
 #define AMDKFD_COMMAND_START		0x01
-#define AMDKFD_COMMAND_END		0x23
+#define AMDKFD_COMMAND_END		0x24
 
 #endif
-- 
2.32.0

