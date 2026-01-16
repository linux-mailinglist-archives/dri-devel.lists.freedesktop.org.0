Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF72D2E244
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 09:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA51710E833;
	Fri, 16 Jan 2026 08:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Opqzd08K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012037.outbound.protection.outlook.com
 [40.93.195.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C12510E82E
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 08:39:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKJ2RvQfxkV8jLW9K9VGodJdSZvlYak7TsvMQfHfCCAnOM7xpf8JXfts5hhUbuIn+bTOnrDCtw8mkMzzfBE2j19jbpv1h6bY1muEc/WMdTCvv87WC5WTd4/VfkmYeT1sfib329mhmuhD3xy9fO8U33GpOF6AUPndAe54IQ9yyAVeRvZWmBmjdQq7HI/5moJwhAwDi2o9Ct54Aofjw2uKYeyURQgDPjaXY2dW//06AL89LfvTQ08yyTV+V4Ynm+reJLjf1AcY/zMTuD7ttLgabO6jwhzL0XLzo7a1Z7iYQMNpepEnRdWSnsVIdtmSArF2hazS6y7Gob8gcwzXetF4cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CrwIZeu2Ihd1KK2ix6wj5vBjQbiuLtY3VbPtWQ+r2E=;
 b=qk61XWzbz9CPl9Dmt+A6O/IJjlUi89yjxpA/+xYut+AW2vynxZlEtISFsU1+cj4BPx4TmlWRkfsLhK2/HDKtlmdYGS9s62/TxFM0/i1MGWVdZka9qvK46OOIscUd9rMAIX9Xmxcy+KucJsRczan7Wm6elpc2qss3pliWU80VKYBWaE09UwLxRjsVja8287XBZZGZTZNinra3b6yJkxP0l/+VfexDf3cPbesElkgqINGkSRqhyFV/jaOPQLRnKRhTEje/M9ETL4CiWMDUm2LL5F157Nr3VkA9AY+gpTeVtyT116V2byhh0JG1bqvNd7eTxdaaLSK8ThaRz9fCeS4VgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CrwIZeu2Ihd1KK2ix6wj5vBjQbiuLtY3VbPtWQ+r2E=;
 b=Opqzd08Kwi84fuaSE6byj/S6qV/8Lg40JBb8EBXdaFB5aOSYu4n5m5cvSukY5RxuH1Jpq4zfTzxt2x/0ADy0xj5/6TI9pkjizZqgu9DWcRryY4Tp+O+8iCt/zoKodPlEhA9haYx1Hb9PFSVjhCHmwD3sCvrFaiHsB8Qj+1C0rkY=
Received: from BN9PR03CA0713.namprd03.prod.outlook.com (2603:10b6:408:ef::28)
 by MN2PR12MB4288.namprd12.prod.outlook.com (2603:10b6:208:1d2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 08:39:15 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:ef:cafe::54) by BN9PR03CA0713.outlook.office365.com
 (2603:10b6:408:ef::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Fri,
 16 Jan 2026 08:39:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 08:39:15 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 16 Jan
 2026 02:39:11 -0600
From: Honglei Huang <honglei1.huang@amd.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 <Ray.Huang@amd.com>
CC: Gurchetan Singh <gurchetansingh@chromium.org>,
 <odaki@rsg.ci.i.u-tokyo.ac.jp>, Chia-I Wu <olvaffe@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <virtualization@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, Honglei Huang <Honglei1.Huang@amd.com>
Subject: [PATCH v5 4/5] drm/virtio: implement userptr support for zero-copy
 memory access
Date: Fri, 16 Jan 2026 16:38:07 +0800
Message-ID: <20260116083808.325180-5-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116083808.325180-1-honglei1.huang@amd.com>
References: <20260116083808.325180-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|MN2PR12MB4288:EE_
X-MS-Office365-Filtering-Correlation-Id: 93b262f2-4257-4b7e-7d69-08de54dabb18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|7416014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hhFWDPrs9C85OAswBJ1qW+R9f8174K1WKxbcqkG1TQaqhK/MGsl+XBy1Xn73?=
 =?us-ascii?Q?PcotFPkAlHyRu+JGciVv359EFWxBQb9nkaPTg+hAedz2YsTC/tPILKu+u4yk?=
 =?us-ascii?Q?DwytdP0Hl7dZ23e+61tTa+T5Bg/CmcebwE7WNKkPpsNLNnpzBh/LQRbsrZOD?=
 =?us-ascii?Q?4CsMxU55fbofUCqbiHjpeXVxo9CFkLXPZoz6LAcSWybBmIAapzWzTVyYs01Y?=
 =?us-ascii?Q?HtN1PP2EJvBnsw21lZCGkn1SO0vB2sj/VRGeIL84+Qs0hxg+V/AFCQkNW1pj?=
 =?us-ascii?Q?fhyMKMSnayPnDW02LoIfeKZaSrROOJ7hCYTf37ul/Pj/CqXx6XuVWoo5WK12?=
 =?us-ascii?Q?TLShx0Xr7YTqomaw03597Hzdyfo6WWZqFW5OlrWfa+X6M7zeS2wTuNBfxfdu?=
 =?us-ascii?Q?Yzpk8HPtoPo/PwjyRaMHhwSm6hA6MePYTOBJxofZt1vXYF7Lg4Wy+2gphPm7?=
 =?us-ascii?Q?ORzZhzC4rJEpxs1FjGdYof2TO0MRjh1PKHl8pSqkNmI8dkdOTX4W8LznQR8D?=
 =?us-ascii?Q?jgcyps0AagvEuOPZWPTczBudpY0Y94vHv6VrPLVVf+zwLuyq5CKzvGT9T2s+?=
 =?us-ascii?Q?lj9O3/WHSGY7LwoO0d/UtawzEDTNJ6hi6U/0dxt+Mz5whxlLicpgoGIwyRjl?=
 =?us-ascii?Q?KHWjh+vLzB6mxOMKSm0uW7lb0mcM6Zl+PDUbItVXV9HVi1ZZelqIiMfwGWxa?=
 =?us-ascii?Q?o78owI0NGhthllXYOUaPO1wx63TAkcQpq7YFRF8kd+aJ9NO270rQz7ROjz2/?=
 =?us-ascii?Q?aocq3NNPzoF9wGpLuYkRjTmAX9ALxO6i4lB0KVViI6fNTGvMdUK2X3HeT5TY?=
 =?us-ascii?Q?LPNlmuh0Tg/j4URlunNz9vnOvGoLx3rAB+8/AwoVZtIGlJodLQRYZ6rUIDvC?=
 =?us-ascii?Q?aKKWGWh517pcdl1bGnPLTT9PWnFJXH/XdMVZnYY4ZJpMGmUiM6IuQx5paM2Y?=
 =?us-ascii?Q?eVHkPo3ifAHKnXugOZmatuzp2B5S/hJZejIMg4m5xtXH/C5o2252JOtDD40O?=
 =?us-ascii?Q?nFS75qbssEHX0KvqyhBLGTf5fUPjZ8epqrdwhW14jAoiQGVoHWSWYgk8MAO0?=
 =?us-ascii?Q?jilEWJShlUxm6GwBYfWVAu1+w7yzOd6Mek+y4pDFmnXkEQ3gyba6H/TGeVhX?=
 =?us-ascii?Q?mZRuJNRc4d8N0lXQNcnpyVvIu7qcSyMw9Ts3Io+xQq6I8+TDpFeCPuroJK/i?=
 =?us-ascii?Q?r0RNDTczuV4kBDwW9cDAzwswkNayMLpc4XpsOIngmDkC7P1j2zI6EOeIwS/Y?=
 =?us-ascii?Q?vYkIVKS35o+QisW6U88KfhvvNsIGA+XyOKeRgmLdMqFrqk3ivroBGoNv1yCJ?=
 =?us-ascii?Q?FJJHbqZzdkSs4ONmmc6pgEe9qUM/gaeB7o411eTYRKJ6MOdcYOX9d+Xs/9NK?=
 =?us-ascii?Q?76XZBcZhqB+9pez1b91EZGoepq8VzIsQr0nNc2p/Jjd7DX3b2ckvsxE/OHsk?=
 =?us-ascii?Q?waUucOH/eP1lMjTZlysgLypPJVh/0VduGQ2kukFrQF34m+En6n5CziXAuyNQ?=
 =?us-ascii?Q?cs8eZja/XUtiY2HUjkoCqE1hJVfATnZ/JcMN5QtV4YeFuxr4cHfGSWwyLVIQ?=
 =?us-ascii?Q?IMiIr5FaHIiljtFSvqEyIIyRzWJB/V7BIR2UtMl80diBIXiHEIqK6fDraGWJ?=
 =?us-ascii?Q?1apn8rzKBdf81ZktgB9jLC22g9dWJDdZMjbSqMlps7TUF6S/jEXB8z+lI7BS?=
 =?us-ascii?Q?HhWeRQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(7416014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 08:39:15.1299 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b262f2-4257-4b7e-7d69-08de54dabb18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4288
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

From: Honglei Huang <Honglei1.Huang@amd.com>

Add userptr support to enable host direct access to guest userspace
memory, eliminating copy overhead for compute workloads.

Implementation:
- New virtio_gpu_object_userptr type for userptr resources
- Pin pages with pin_user_pages_fast() and FOLL_LONGTERM
- Build scatter-gather table for host access via blob resource
- Support read-only mode (VIRTGPU_BLOB_FLAG_USERPTR_RDONLY)

The pages are pinned at resource creation and unpinned at destruction.
Follow-up patches will add ioctl integration and feature detection.

Signed-off-by: Honglei Huang <Honglei1.Huang@amd.com>
---
 drivers/gpu/drm/virtio/Makefile          |   3 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  33 ++++
 drivers/gpu/drm/virtio/virtgpu_object.c  |   6 +
 drivers/gpu/drm/virtio/virtgpu_userptr.c | 231 +++++++++++++++++++++++
 4 files changed, 272 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/virtio/virtgpu_userptr.c

diff --git a/drivers/gpu/drm/virtio/Makefile b/drivers/gpu/drm/virtio/Makefile
index d2e1788a8..fe7332a62 100644
--- a/drivers/gpu/drm/virtio/Makefile
+++ b/drivers/gpu/drm/virtio/Makefile
@@ -6,6 +6,7 @@
 virtio-gpu-y := virtgpu_drv.o virtgpu_kms.o virtgpu_gem.o virtgpu_vram.o \
 	virtgpu_display.o virtgpu_vq.o \
 	virtgpu_fence.o virtgpu_object.o virtgpu_debugfs.o virtgpu_plane.o \
-	virtgpu_ioctl.o virtgpu_prime.o virtgpu_trace_points.o virtgpu_submit.o
+	virtgpu_ioctl.o virtgpu_prime.o virtgpu_trace_points.o virtgpu_submit.o \
+	virtgpu_userptr.o
 
 obj-$(CONFIG_DRM_VIRTIO_GPU) += virtio-gpu.o
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index f17660a71..808a6e65b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -84,6 +84,7 @@ struct virtio_gpu_object_params {
 	uint32_t blob_mem;
 	uint32_t blob_flags;
 	uint64_t blob_id;
+	uint64_t userptr;
 };
 
 struct virtio_gpu_object {
@@ -113,12 +114,38 @@ struct virtio_gpu_object_vram {
 	struct drm_mm_node vram_node;
 };
 
+struct virtio_gpu_object_userptr;
+
+struct virtio_gpu_object_userptr_ops {
+	int (*get_pages)(struct virtio_gpu_object_userptr *userptr);
+	void (*put_pages)(struct virtio_gpu_object_userptr *userptr);
+	void (*release)(struct virtio_gpu_object_userptr *userptr);
+};
+struct virtio_gpu_object_userptr {
+	struct virtio_gpu_object base;
+	const struct virtio_gpu_object_userptr_ops *ops;
+	struct mutex lock;
+
+	uint64_t start;
+	uint32_t npages;
+	uint32_t bo_handle;
+	uint32_t flags;
+
+	struct virtio_gpu_device *vgdev;
+	struct drm_file *file;
+	struct page **pages;
+	struct sg_table *sgt;
+};
+
 #define to_virtio_gpu_shmem(virtio_gpu_object) \
 	container_of((virtio_gpu_object), struct virtio_gpu_object_shmem, base)
 
 #define to_virtio_gpu_vram(virtio_gpu_object) \
 	container_of((virtio_gpu_object), struct virtio_gpu_object_vram, base)
 
+#define to_virtio_gpu_userptr(virtio_gpu_object) \
+	container_of((virtio_gpu_object), struct virtio_gpu_object_userptr, base)
+
 struct virtio_gpu_object_array {
 	struct ww_acquire_ctx ticket;
 	struct list_head next;
@@ -512,4 +539,10 @@ void virtio_gpu_vram_unmap_dma_buf(struct device *dev,
 int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *file);
 
+/* virtgpu_userptr.c */
+int virtio_gpu_userptr_create(struct virtio_gpu_device *vgdev,
+			      struct drm_file *file,
+			      struct virtio_gpu_object_params *params,
+			      struct virtio_gpu_object **bo_ptr);
+bool virtio_gpu_is_userptr(struct virtio_gpu_object *bo);
 #endif
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index e6363c887..da702301b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -80,6 +80,12 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
 		drm_gem_free_mmap_offset(&vram->base.base.base);
 		drm_gem_object_release(&vram->base.base.base);
 		kfree(vram);
+	} else if (virtio_gpu_is_userptr(bo)) {
+		struct virtio_gpu_object_userptr *userptr =
+			to_virtio_gpu_userptr(bo);
+
+		drm_gem_object_release(&userptr->base.base.base);
+		kfree(userptr);
 	} else {
 		drm_gem_object_release(&bo->base.base);
 		kfree(bo);
diff --git a/drivers/gpu/drm/virtio/virtgpu_userptr.c b/drivers/gpu/drm/virtio/virtgpu_userptr.c
new file mode 100644
index 000000000..f6c211e9d
--- /dev/null
+++ b/drivers/gpu/drm/virtio/virtgpu_userptr.c
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/dma-mapping.h>
+#include <linux/mm.h>
+#include <linux/pid.h>
+#include <linux/vmalloc.h>
+
+#include "virtgpu_drv.h"
+#include "drm/drm_gem.h"
+
+static struct sg_table *
+virtio_gpu_userptr_get_sg_table(struct drm_gem_object *obj);
+
+static void virtio_gpu_userptr_free(struct drm_gem_object *obj)
+{
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
+	struct virtio_gpu_object_userptr *userptr = to_virtio_gpu_userptr(bo);
+
+	if (bo->created) {
+		userptr->ops->release(userptr);
+
+		virtio_gpu_cmd_unref_resource(vgdev, bo);
+		virtio_gpu_notify(vgdev);
+	}
+
+	mutex_destroy(&userptr->lock);
+}
+
+static void virtio_gpu_userptr_object_close(struct drm_gem_object *obj,
+					    struct drm_file *file)
+{
+	virtio_gpu_gem_object_close(obj, file);
+}
+
+static const struct drm_gem_object_funcs virtio_gpu_userptr_funcs = {
+	.open = virtio_gpu_gem_object_open,
+	.close = virtio_gpu_userptr_object_close,
+	.free = virtio_gpu_userptr_free,
+	.get_sg_table = virtio_gpu_userptr_get_sg_table,
+};
+
+bool virtio_gpu_is_userptr(struct virtio_gpu_object *bo)
+{
+	return bo->base.base.funcs == &virtio_gpu_userptr_funcs;
+}
+
+static int
+virtio_gpu_userptr_get_pages(struct virtio_gpu_object_userptr *userptr)
+{
+	unsigned int flag = FOLL_LONGTERM;
+	unsigned int num_pages, pinned = 0;
+	int ret = 0;
+
+	if (userptr->pages)
+		return 0;
+
+	userptr->pages = kvmalloc_array(userptr->npages, sizeof(struct page *),
+					GFP_KERNEL);
+	if (!userptr->pages)
+		return -ENOMEM;
+
+	if (!(userptr->flags & VIRTGPU_BLOB_FLAG_USERPTR_RDONLY))
+		flag |= FOLL_WRITE;
+
+	do {
+		num_pages = userptr->npages - pinned;
+
+		ret = pin_user_pages_fast(userptr->start + pinned * PAGE_SIZE,
+					  num_pages, flag,
+					  userptr->pages + pinned);
+
+		if (ret < 0) {
+			if (pinned)
+				unpin_user_pages(userptr->pages, pinned);
+			kvfree(userptr->pages);
+			return ret;
+		}
+
+		pinned += ret;
+
+	} while (pinned < userptr->npages);
+
+	return 0;
+}
+
+static void
+virtio_gpu_userptr_put_pages(struct virtio_gpu_object_userptr *userptr)
+{
+	if (userptr->pages) {
+		unpin_user_pages(userptr->pages, userptr->npages);
+		kvfree(userptr->pages);
+		userptr->pages = NULL;
+	}
+
+	if (userptr->sgt) {
+		sg_free_table(userptr->sgt);
+		kfree(userptr->sgt);
+		userptr->sgt = NULL;
+	}
+}
+
+static void
+virtio_gpu_userptr_release(struct virtio_gpu_object_userptr *userptr)
+{
+	mutex_lock(&userptr->lock);
+	userptr->ops->put_pages(userptr);
+	mutex_unlock(&userptr->lock);
+}
+
+static struct sg_table *
+virtio_gpu_userptr_get_sg_table(struct drm_gem_object *obj)
+{
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+	struct virtio_gpu_object_userptr *userptr = to_virtio_gpu_userptr(bo);
+	int ret;
+
+	mutex_lock(&userptr->lock);
+	if (!userptr->pages) {
+		ret = userptr->ops->get_pages(userptr);
+		if (ret) {
+			mutex_unlock(&userptr->lock);
+			return ERR_PTR(ret);
+		}
+	}
+
+	if (!userptr->sgt)
+		userptr->sgt = drm_prime_pages_to_sg(NULL, userptr->pages,
+						     userptr->npages);
+	mutex_unlock(&userptr->lock);
+
+	return userptr->sgt;
+}
+
+static int
+virtio_gpu_userptr_init(struct drm_device *dev, struct drm_file *file,
+			struct virtio_gpu_object_userptr *userptr,
+			struct virtio_gpu_object_params *params,
+			const struct virtio_gpu_object_userptr_ops *ops)
+{
+	uint32_t page_offset;
+	uint64_t aligned_size;
+	uint64_t aligned_addr;
+	int ret;
+	struct drm_gem_object *obj;
+
+	page_offset = params->userptr & (PAGE_SIZE - 1UL);
+	aligned_addr = params->userptr - page_offset;
+	aligned_size = roundup(page_offset + params->size, PAGE_SIZE);
+
+	userptr->start = aligned_addr;
+	userptr->npages = aligned_size >> PAGE_SHIFT;
+	userptr->flags = params->blob_flags;
+
+	mutex_init(&userptr->lock);
+	userptr->vgdev = dev->dev_private;
+	userptr->file = file;
+	userptr->ops = ops;
+
+	obj = &userptr->base.base.base;
+	obj->funcs = &virtio_gpu_userptr_funcs;
+
+	drm_gem_private_object_init(dev, obj, aligned_size);
+
+	ret = virtio_gpu_resource_id_get(userptr->vgdev,
+					 &userptr->base.hw_res_handle);
+
+	return ret;
+}
+
+static const struct virtio_gpu_object_userptr_ops virtio_gpu_userptr_ops = {
+	.get_pages = virtio_gpu_userptr_get_pages,
+	.put_pages = virtio_gpu_userptr_put_pages,
+	.release = virtio_gpu_userptr_release,
+};
+
+int virtio_gpu_userptr_create(struct virtio_gpu_device *vgdev,
+			      struct drm_file *file,
+			      struct virtio_gpu_object_params *params,
+			      struct virtio_gpu_object **bo_ptr)
+{
+	struct virtio_gpu_object_userptr *userptr;
+	int ret, si;
+	struct sg_table *sgt;
+	struct scatterlist *sg;
+	struct virtio_gpu_mem_entry *ents;
+
+	if (!params->size)
+		return -EINVAL;
+
+	if (!access_ok((char __user *)(unsigned long)params->userptr,
+		       params->size))
+		return -EFAULT;
+
+	userptr = kzalloc(sizeof(*userptr), GFP_KERNEL);
+	if (!userptr)
+		return -ENOMEM;
+
+	ret = virtio_gpu_userptr_init(vgdev->ddev, file, userptr, params,
+				      &virtio_gpu_userptr_ops);
+	if (ret)
+		goto failed_free;
+
+	sgt = virtio_gpu_userptr_get_sg_table(&userptr->base.base.base);
+	if (IS_ERR(sgt)) {
+		ret = PTR_ERR(sgt);
+		goto failed_free;
+	}
+
+	ents = kvmalloc_array(sgt->nents, sizeof(struct virtio_gpu_mem_entry),
+			      GFP_KERNEL);
+	if (!ents) {
+		ret = -ENOMEM;
+		goto failed_free;
+	}
+
+	for_each_sgtable_sg(sgt, sg, si) {
+		(ents)[si].addr = cpu_to_le64(sg_phys(sg));
+		(ents)[si].length = cpu_to_le32(sg->length);
+		(ents)[si].padding = 0;
+	}
+
+	virtio_gpu_cmd_resource_create_blob(vgdev, &userptr->base, params, ents,
+					    sgt->nents);
+
+	*bo_ptr = &userptr->base;
+	return 0;
+
+failed_free:
+	kfree(userptr);
+	return ret;
+}
-- 
2.34.1

