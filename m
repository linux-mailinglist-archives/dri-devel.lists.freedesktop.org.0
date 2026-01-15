Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 995A5D22F9F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 08:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D9710E6F4;
	Thu, 15 Jan 2026 07:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AD6FQn+F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010001.outbound.protection.outlook.com
 [52.101.193.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A28010E6F1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:59:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBVLJnxTDQmTKzssiWBPK+DPoxWzqumfvRB+IWNDVINIYPmnKiVobfHSgJRiNFlrY4UpN5AP2obUQ7i8f2tyjoXZCoX43zT6rJlLAw8T+e5MHknOq6EfC2jIXYTvGqv3GcWHgcj5Lpt048BABjWb6RrX4uAlsJJx+kSmO1qSd6N1O9Tu16kQLNAR5IKck0WUIDZOQ5hd5+PjWZ6HCsaunZePL3z/HMHP72rpTEuX4yJ5S+SpUPRqBka9cQtA3ban5QDR+dLLzKI9FGAhRQbF7q68CpmVEtCGKeR2InS8EUCvlXUrOqBrwbfTO4BUynVyGdJqiYr2odFe8BRUv7ELog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CrwIZeu2Ihd1KK2ix6wj5vBjQbiuLtY3VbPtWQ+r2E=;
 b=UgKryJuunpzvUISfyA5JVOtkII74Qtqs0lYlqG6PYXXp6A6yYHhMRcfQCaG05Fz4RdczpR9FUiFpd90GjVUX4HIumnBxmWfkgtOD2QTajfJXizJq1W9zCnPau90L+bPQUDEgdqOHXDj4guRRXfRfWYZrKvzNg56ttub9c4HDBFTB0un8ZlakhCGBPCRYKyRlnQwUrZoNEOkO2URVoc56fkccbHVu8lgaASlqmYODFB/V/WWNhB+Ysdjh+fGfvpk1vWsM3Oi0fNAymxEo43CA9ZC6Bi8TuXiwh1NSf0LLlShc7g4x0VpF2KkIDTit5ryEUQ0waALD/qTokTxleLo2+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CrwIZeu2Ihd1KK2ix6wj5vBjQbiuLtY3VbPtWQ+r2E=;
 b=AD6FQn+FjUG/t1h9TtmEYyVI1boASb+GhnnCjwWzIixm0mwiy/bSdahkoUcU02rL185m7xCTDdPgzlTHg4Yrps6gozARJTBbKA8BD1Qj/S+jT+heWYRpNAuHwmJe0xwkQRtO1uHVsF28mUIIVPpYflOyLlK6dl9SA0eQ5jHTrOQ=
Received: from BL1PR13CA0091.namprd13.prod.outlook.com (2603:10b6:208:2b9::6)
 by DS5PPFD22966BE3.namprd12.prod.outlook.com (2603:10b6:f:fc00::662)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 07:59:29 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::59) by BL1PR13CA0091.outlook.office365.com
 (2603:10b6:208:2b9::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Thu,
 15 Jan 2026 07:59:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 15 Jan 2026 07:59:29 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 15 Jan
 2026 01:59:25 -0600
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
Subject: [PATCH v4 4/5] drm/virtio: implement userptr support for zero-copy
 memory access
Date: Thu, 15 Jan 2026 15:58:50 +0800
Message-ID: <20260115075851.173318-5-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115075851.173318-1-honglei1.huang@amd.com>
References: <20260115075851.173318-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|DS5PPFD22966BE3:EE_
X-MS-Office365-Filtering-Correlation-Id: 072b402e-0a61-4027-3c59-08de540c02a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|7416014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vprD8Xua35L3gaHLj0vqtRTsrsAYyhqxS7PqanyAlcrOCqW4PMFTRKKmFC7F?=
 =?us-ascii?Q?UDFXXJMORYYBhwA/0dEIORzOS+X0ONPu+DVvBddewp78tisCKgNnV+Xh45OQ?=
 =?us-ascii?Q?nsI6q6H8oZT/QNDbmikws+GloicZylLM+Sj7w85MuJSGX2NpY53Cmmy67oh0?=
 =?us-ascii?Q?5Ma+ywgrCj6fEPCZ7HAt4PT4j/880+1frE7KshnekXF9eQx/2DOipY2cfF+M?=
 =?us-ascii?Q?OBAyb3Z+wkEA0Prx/+xg43fLXC9kJ1Ylq0j1viOdw2Wjr4fsHcDpNi3bSL3X?=
 =?us-ascii?Q?Ix2/8l4vlzlqhYEN0gyvOz6T/Pc009o9lAjYIoiG5Yb+arND0tcjR31Svrjp?=
 =?us-ascii?Q?Bq1ktC7kN0f8KTo6cOX+DgVOJZy87M1oY4CE0adIMArhfxCEOJXIyvA/I4Xq?=
 =?us-ascii?Q?FzA2ObcYQNZw+C018kTVOeQmGH02FD84LpMYQsr/Q7RYvoFFN7dZpkC40wQr?=
 =?us-ascii?Q?U5wA4JrpDCUoWpoWJuVMANhTQVz9nM+9PNOhC5SrOlhyGmP5jBgsh4ch8Fi/?=
 =?us-ascii?Q?DLeYSXHJuGf6Z4CDR7gdJgyVECa/ul6zEb5MovG4u00BC+0JxkyryBZcJomG?=
 =?us-ascii?Q?/77ttlDe1jiplf7hz9cyGJC9vB0ulGDobmthv2AyL3iXh+NAuDDNPhDV7U5n?=
 =?us-ascii?Q?o0gRWRtbNMwzt68SEa/sQwux7IBNvoA3I1BG46ep/CmgRwTw06b+NTc6g5/K?=
 =?us-ascii?Q?hScZ7c4XbxhgrkTD/6Q1WPTBpggUH8W2RZ5oaHoYvS0tOAVzxNsztNJWjOzM?=
 =?us-ascii?Q?TdT4YHVZf/mtNvyKMTdIz3AdBU8Xwrod65rs3X2tBzLlXPBOYT/nJTAB1e7N?=
 =?us-ascii?Q?nZ7KbrCy+wXr7nIwsESE0qnl24iUG8CBbxXF2wVtRIIFp62y5g7lvaal8HOx?=
 =?us-ascii?Q?Nv9WXXtMqdBU9mtj4vM0kCAoKAXlof2EdOe7AB7hG5B5t8RvTG94HQTjl7Xz?=
 =?us-ascii?Q?m9CS3+xt7APXL9pTUqZk91fjcQMffnPr3auguQ6sKMaqHPgH9DoJUMB6kHIS?=
 =?us-ascii?Q?gTS2nAFwwHjjGrWbMcBuTNi6cGs9SDZ4LIK/9Bo3Ww2/AVdLujnjfofA7nIW?=
 =?us-ascii?Q?Mfkt7sRxokWJ79EMD7KwDk+P07Zu8q9m7lDYGcdF6IWWazT0IPhlvaT1FMmF?=
 =?us-ascii?Q?m5ajUAkYy7tKe2kDQ4CfpvceA4e9Mj/KdpmuropKxnTnOSLnvRhUbGcDhGPe?=
 =?us-ascii?Q?gpx+z209nv98T0M2s+lEmd9qaq+6Q+yLrbREZrXUUHG3dZDYBP0Rkul2uaBM?=
 =?us-ascii?Q?6uEEJAsWpy+yvat0y2h9XWQ+YLV6Ie6HtoKxSZmoBbYeU8/nHkNTM+myDMN+?=
 =?us-ascii?Q?vYIwG7nDcgTEDxk80HoUTKWPCVXp0BROPlk5xP6xzsbACSPONIeCW7c2WdUz?=
 =?us-ascii?Q?VrI3hwd6awgY4+0eujpd1agTKHCT7MwSOvj/o2ojCGrXtvuOuw+e234g+gfS?=
 =?us-ascii?Q?W27aUL7F2lg3IdpQ+4pDmouiBoEy53kn/RBqgKMD2xT1c9nDklKP59x2gWsW?=
 =?us-ascii?Q?Z8weSHn9czVPOqKVQ6R1ePmN7yhbw+3JCMsHJimwGDccL5ZOitHas8oOMH/r?=
 =?us-ascii?Q?k8aOM5ntiBXican+QwMgu/oBFrgnNpjXH6/y5mklyzFesPDEnRaXo0226zkU?=
 =?us-ascii?Q?BG5MJtauLAovADiHgZleM26+QMCaTvBMD5YIQlAl8b6qgcKSesQNIutzfwh8?=
 =?us-ascii?Q?VgVVYw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(7416014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:59:29.3422 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 072b402e-0a61-4027-3c59-08de540c02a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFD22966BE3
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

