Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9406304AC
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 00:45:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0384110E822;
	Fri, 18 Nov 2022 23:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::616])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2108A10E82C;
 Fri, 18 Nov 2022 23:44:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BA3Ns644VBI41Mh5i3uJp3hhcDvlOZ6B+6zmwy//F1/v3tFXdeBx+NOeuOXRsTgMYMaCwNXSiOKvZ9Uau/Hm3EH/6vjSPgpYMINkZIQf7S2ATWg4OKTU4jo+B7DQ1sdQJ2PPtRAoKQEvaft27aBpOiC9VGaxDI2o0Sb3Ls4gyPazk/DzGswhqRjN0ZoCkKi5ACb8L6n93qNMQBN/vx5ibMaysBq3RY+1DbkF403V5QWu7ZBdznzPuru+l9QWwmCysPTjIMCnf6zuQOCxU/nOnwDXzCqGVDjVbv42H5lQNnqC/8SR8SyzsopygWjccsdwF21sWbsHTVW668pTSU7xbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWWHIQilUDJDQ+EKrfhQprbPRtRpjN4wkSwUYlBM6OY=;
 b=dWZb9pdjUnJllow92zdYA53sEDPYBs/27n3sW5BOVFSNDoGyJO6mGkZWcT+VL0+xEjI7VByxoMcrqYWQpEmMTf0pWa7X5OneyKjLiltzRMFnprprVTobCpl9eibPl8v8kUizCVJcWDZE1YjVAqz7+ug1AqAB0Q6I9tze0yed+u4PMo+LmOeLhJwn27ZWvom6CHsc4wrXLheYQgkDVAtv3ZVgjozDti1Cqya3dqzyU9XR3Jczcd0CAnlOxqZ6s+A4GOsxwwi2aEtMEKhO7MAVdsmR7R58dmYxgWksq146qyLnsq1yIJbPRF3LF65e7tnIHcgJZndTaC71qKC3b5Jsvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWWHIQilUDJDQ+EKrfhQprbPRtRpjN4wkSwUYlBM6OY=;
 b=e9zD8NTIoe81zYQuDbofKLrmBVuGesi/WiRTeF+ET1G2jUryMsYjkGwl/wS8JgSXnF2G8bK+V35JpEqHe0XYuAJGda5R+HlrvYt7ZfJlwfWBrzWO3sC3gbQ5HAKOqZ5oBK41eNIJHU3EuqXif0aimrSEyebHHBFKrYhemPVUQnM=
Received: from DM6PR03CA0045.namprd03.prod.outlook.com (2603:10b6:5:100::22)
 by CY5PR12MB6034.namprd12.prod.outlook.com (2603:10b6:930:2e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Fri, 18 Nov
 2022 23:44:36 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::6d) by DM6PR03CA0045.outlook.office365.com
 (2603:10b6:5:100::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Fri, 18 Nov 2022 23:44:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 23:44:36 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 17:44:35 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/6] drm/amdkfd: Implement DMA buf fd export from KFD
Date: Fri, 18 Nov 2022 18:44:18 -0500
Message-ID: <20221118234422.1468806-3-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20221118234422.1468806-1-Felix.Kuehling@amd.com>
References: <20221118234422.1468806-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT014:EE_|CY5PR12MB6034:EE_
X-MS-Office365-Filtering-Correlation-Id: 751a17fa-8448-4ff6-806d-08dac9beda03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QeGPWyDMLkHBazVRZzggzVAwc1hBkGttTD1GLIaI338q3t4rbayO08JOfrXi+qDpSUzHhBRwMnMuo2CaagwMQaCAZ4uVzrM1nIlYOfa9E2JUs7T/zv1czg7xmzwig+EBbQby3LhjOiJogF/jRNu7jKKbJuV4XTPt4mPmY6e9TEjmDs0QK3gZ6UoUIYuqsQ0FO/zJhwmysZJyYaNcKcfsphfbIlS0RfejSDorKc4Ut25cMdiMQJyApBn4Trw9ejfuPV8UQ4vGMmjIlI7cDlHGzipKZavjNq7GxplTArvkjfbJi2puwyP1r13ZdI9qGujutSJm8t3Gko0eLTlL3ZZmpxvr6rMnbJLXIkCrS/MQfOEENA3VvRTC6AayFCm847X3p1oC6czGR46+Y5coTlaYj/d8xFqNcc9+nnphT1LNe2ANYQRw979LlxytWx4K4LIqeG6f1hl8MXKOpFZU3gcoagPwsHSD4lgR5YwzmlvfKE214Cb1ttYMRzu1dkI9+pFrGTWeqJCjbUzLKLvTjKB6A4GP3Orl5/HgO56VNdpaDldKmqKpqPi0+jzQpwGCfbrQd9BLSKN2IHVMw7rWRU7Nl07GYbmzTJ6cvIkM0PqPUbnPfejbrKbSIcJsrYsLtaJw4oYHcdM476gZe6RubtNRqabEEddxYnMO/CQvmj0gYhmJ8iYDPfgyM4loYUScqxE+IDz7SVez1iPY0e8grD2yGSBrKVKsP1a2bRTSSgY2G5X6EI7Ah/E2yxTM7VEOxA+xWhBZgpdAGEOZ9EpilSlqqg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199015)(40470700004)(36840700001)(46966006)(316002)(26005)(7696005)(450100002)(82740400003)(426003)(2616005)(16526019)(47076005)(2906002)(186003)(110136005)(41300700001)(70586007)(8676002)(8936002)(336012)(82310400005)(5660300002)(86362001)(356005)(81166007)(70206006)(1076003)(40460700003)(83380400001)(36756003)(966005)(6666004)(36860700001)(478600001)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 23:44:36.4197 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 751a17fa-8448-4ff6-806d-08dac9beda03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6034
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Exports a DMA buf fd of a given KFD buffer handle. This is intended for
being able to import KFD BOs into GEM contexts to leverage the
amdgpu_bo_va API for more flexible virtual address mappings. It will
also be used for the new upstreamable RDMA solution coming to UCX and
RCCL.

The corresponding user mode change (Thunk API and kfdtest) is here:
https://github.com/fxkamd/ROCT-Thunk-Interface/commits/fxkamd/dmabuf

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  2 +
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 45 +++++++++++----
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 55 +++++++++++++++++++
 include/uapi/linux/kfd_ioctl.h                | 14 ++++-
 4 files changed, 104 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index f50e3ba4d7a5..f72d25d5dd4f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -301,6 +301,8 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
 				      uint64_t va, void *drm_priv,
 				      struct kgd_mem **mem, uint64_t *size,
 				      uint64_t *mmap_offset);
+int amdgpu_amdkfd_gpuvm_export_dmabuf(struct kgd_mem *mem,
+				      struct dma_buf **dmabuf);
 int amdgpu_amdkfd_get_tile_config(struct amdgpu_device *adev,
 				struct tile_config *config);
 void amdgpu_amdkfd_ras_poison_consumption_handler(struct amdgpu_device *adev,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 67c832ae498b..bd36636a9596 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -710,6 +710,21 @@ kfd_mem_dmaunmap_attachment(struct kgd_mem *mem,
 	}
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
@@ -717,16 +732,9 @@ kfd_mem_attach_dmabuf(struct amdgpu_device *adev, struct kgd_mem *mem,
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
@@ -2241,6 +2249,23 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
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
index 6d291aa6386b..b9a9c4c9ec16 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1567,6 +1567,58 @@ static int kfd_ioctl_import_dmabuf(struct file *filep,
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
@@ -2749,6 +2801,9 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[] = {
 
 	AMDKFD_IOCTL_DEF(AMDKFD_IOC_AVAILABLE_MEMORY,
 			kfd_ioctl_get_available_memory, 0),
+
+	AMDKFD_IOCTL_DEF(AMDKFD_IOC_EXPORT_DMABUF,
+				kfd_ioctl_export_dmabuf, 0),
 };
 
 #define AMDKFD_CORE_IOCTL_COUNT	ARRAY_SIZE(amdkfd_ioctls)
diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index 42b60198b6c5..2da5c3ad71bd 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -37,9 +37,10 @@
  * - 1.9 - Add available memory ioctl
  * - 1.10 - Add SMI profiler event log
  * - 1.11 - Add unified memory for ctx save/restore area
+ * - 1.12 - Add DMA buf export ioctl
  */
 #define KFD_IOCTL_MAJOR_VERSION 1
-#define KFD_IOCTL_MINOR_VERSION 11
+#define KFD_IOCTL_MINOR_VERSION 12
 
 struct kfd_ioctl_get_version_args {
 	__u32 major_version;	/* from KFD */
@@ -463,6 +464,12 @@ struct kfd_ioctl_import_dmabuf_args {
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
@@ -877,7 +884,10 @@ struct kfd_ioctl_set_xnack_mode_args {
 #define AMDKFD_IOC_AVAILABLE_MEMORY		\
 		AMDKFD_IOWR(0x23, struct kfd_ioctl_get_available_memory_args)
 
+#define AMDKFD_IOC_EXPORT_DMABUF		\
+		AMDKFD_IOWR(0x24, struct kfd_ioctl_export_dmabuf_args)
+
 #define AMDKFD_COMMAND_START		0x01
-#define AMDKFD_COMMAND_END		0x24
+#define AMDKFD_COMMAND_END		0x25
 
 #endif
-- 
2.32.0

