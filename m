Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C949D66686C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 02:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C06810E2DA;
	Thu, 12 Jan 2023 01:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7145D10E0D8;
 Thu, 12 Jan 2023 01:32:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQgIC2D+cbV3OQadcJ9tHa/bLcoCZ1jgGtbnJpDpJLTSXEMAMUkj0xd/Ua6gOefIPigoy0a9fO/ApebhNt4Ci06BD0y+YnO7L0i+kZXin+XzCs5ZtrqFcRNB7Wpbrc9xZACJGcKHaqa5PwlgSK1Nm8ML5tpc0U6S7BaprdEEt9/9r9x45PJ1Yeg7eQ+3sRq1MBQMSCEADP2F+et9UFj/ZnEvjx5jw81sCn1Q/wilYmKXddW6wOlzadw8T9rm8uSc+UjR0pnIMd8PcznVJNFRahaQ2GpUQly/6PwBSfU3gW8239/RyTsqQcdlwPOwFzfKMVS0FqYav7smmBhgOmrRvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LiuM8NB21nZW5nRL1fO3J2XjALAABxjUycVH5Y7rbcA=;
 b=gi2BJh7/xbaWXtuJseeM7vxmvf3YHGBUxUhntaP+QFPxDfmkiO6omQI2+CeP6Y+Pk6G/Vc+J0Ll2LzYh4cEgTTDdDP0G4di+hN9qcfFDPJVMyKG4kni8fOk6fJGDeE8LvD0m+MejbOMcc9JsRqh4T1TULU5mKyb/sE5HeZQDHR7FJLVHc8xwaJ39pm1O/LQxtXt5Z7Xg3V+9oPgxIROEO3ZoGxa6l2TqFwREVFy/7Sh1jEuHiZjVWHNXlfyhthpj6pxFLBw7/PXo0C0GQMSb5lPPsYpe8Ff7+cS38O6CwJG1XQATqFB9Gw8OT31CmZyDjttRaJvVCf7kEMDnFn4WYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LiuM8NB21nZW5nRL1fO3J2XjALAABxjUycVH5Y7rbcA=;
 b=uq0koXUbJvbJ8UAH3ghh53gtehGERFyVt2n9iMbCEGzbOQbWM/FaONNveFtq8Pd9HClk082QJCGRmrdGvtIOBpyRSI+DWxZLVqkPXBJdDzEVOadP9tnsw3y5z146fUWBn/v7v3TuJDcleS3hsVI6cjLhPPVMeggYxTE2ZCc9eNE=
Received: from MW4PR04CA0171.namprd04.prod.outlook.com (2603:10b6:303:85::26)
 by MW3PR12MB4571.namprd12.prod.outlook.com (2603:10b6:303:5c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 01:32:27 +0000
Received: from CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::80) by MW4PR04CA0171.outlook.office365.com
 (2603:10b6:303:85::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Thu, 12 Jan 2023 01:32:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT063.mail.protection.outlook.com (10.13.175.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Thu, 12 Jan 2023 01:32:27 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 11 Jan
 2023 19:32:25 -0600
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/6] drm/amdkfd: Implement DMA buf fd export from KFD
Date: Wed, 11 Jan 2023 20:31:53 -0500
Message-ID: <20230112013157.750568-3-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112013157.750568-1-Felix.Kuehling@amd.com>
References: <20230112013157.750568-1-Felix.Kuehling@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT063:EE_|MW3PR12MB4571:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e842f3-c426-4451-bbb7-08daf43cdd43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qWBMZm7MBYTA0uK00QWN+izt7UJ4z3R8Y8yzwXoCZlr5MrnqwCg+k9C53lMU0KqNXFIiYTZFvFOdlCfCz0ED/BvAnHEDWtpKTiWmhfaE+ZbP38I0xIyTXHz/PUDMKPfNiPMa67rLlWD94krwrCVUzgg/IBQmjuQO3rvGT6Q08ceCv1ZSV8MkL98k5VgKgIk197UTQQ8vUsxDLCKmAzsEokmZ5PdvSRpSCQHexe3m7xDbCwYWYoA12vNAFcoac0cZXVS43Z7SfXenxEHzc6IaVmZZtvQhko8ciR00u+szAsGzN6GzuhxHMTxOjPjHOo2plfuF3pikDhKKH5BeukcOG8IkyYpqwpQTIKFBvAHwc4Ym/rRDVxDbTmr7wrIczT7p2lg7Nnr5gJHm8V3M1o8GeiHT9fdYnVDpd3vONP8KWE7YXjWCkNGHP/oLpuhOZzR36WnWPpt2asI2bXVLS29GFqrCu9GDrIlAr9nt8N/Snr8zJlPqQt70BsM9EYFQ91i8jdUk+6Ve2Tru8c7OmlKf/0x55CjYmrbZ8Q3gMsSEqot/rFQ+oAw9p2ioMfaplrB5PohF69DbYySwq+25zcc64bwg3cRpL5f86oymkCHgjj/5ywnctuMAaT0iJVih/RVZzN1L6VM23+AJAKnxMNT68H3rMNXtsE5vlpQQaHF1lnciK6abQh8YgHRtEx5kgjHa9M66+sHsWTR0we4RnPznUIblD8B7qeNM6t+Yhm2Ssp6J+0yn/8VRrBuYNarVTJdEv3EXWLcB2MBWLSaXQ4+ADQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199015)(46966006)(36840700001)(40470700004)(36860700001)(82740400003)(6666004)(81166007)(356005)(2906002)(478600001)(966005)(2616005)(1076003)(16526019)(316002)(26005)(186003)(5660300002)(40480700001)(7696005)(86362001)(8936002)(83380400001)(40460700003)(82310400005)(36756003)(47076005)(426003)(41300700001)(110136005)(336012)(70586007)(8676002)(450100002)(70206006)(54906003)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 01:32:27.1577 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e842f3-c426-4451-bbb7-08daf43cdd43
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4571
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
Cc: xiaogang.chen@amd.com, christian.koenig@amd.com
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
index 333780491867..01ba3589b60a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -308,6 +308,8 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
 				      uint64_t va, void *drm_priv,
 				      struct kgd_mem **mem, uint64_t *size,
 				      uint64_t *mmap_offset);
+int amdgpu_amdkfd_gpuvm_export_dmabuf(struct kgd_mem *mem,
+				      struct dma_buf **dmabuf);
 int amdgpu_amdkfd_get_tile_config(struct amdgpu_device *adev,
 				struct tile_config *config);
 void amdgpu_amdkfd_ras_poison_consumption_handler(struct amdgpu_device *adev,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index e13c3493b786..5645103beed0 100644
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
@@ -2267,6 +2275,23 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
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
index f79b8e964140..bcf2263927d6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1572,6 +1572,58 @@ static int kfd_ioctl_import_dmabuf(struct file *filep,
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
@@ -2754,6 +2806,9 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[] = {
 
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
2.34.1

