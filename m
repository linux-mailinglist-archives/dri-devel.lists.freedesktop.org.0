Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 818BBC50FE9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 08:46:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9226610E6C4;
	Wed, 12 Nov 2025 07:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NneI6CsY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012056.outbound.protection.outlook.com
 [40.107.200.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A313B10E6C7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 07:46:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cihgaHrN3D2XRIlWGDnsHcCYyoVTiov1piN9c/K6i2t+2Vxj3GSibFdWbI6ISUlLBTx4Ro9gXz1qF9gx8z0HRcEAKO2aslUUNWJvcsO+byoSUsspmmL3S4tLMYIG8UKJJLtq7FRgILi/0+5AF2N+5JlMkudfSF7T5lNF6N7qkdWpNk9eBAuhhTM1/n93ndLHunYnm9bUYuqMNlRyqY3WrpjNaZKCLP7MejLP1BtEw5uhxJ3sY7eJ/TTCZmdzLIDqWshMtUABda8+fJxYY2oEUIAAp775ryzWZcppckR8TF2GmEJV8qJcPtii4p8i8uoUX2Na6rKXQ39h0udQSX5Eog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssebf5n45KBqvYpa/YlE5DeEaRWD0wa69MGPNX9pw34=;
 b=fad5heaHWEjpIVRRxWFrFksviKuChgYSp6FGtJLcXBxh0k5bBm1HacDVnLnvx0hzwBD6Kt+nF58v0hmyw1lWSQNDq96cwJ5GCOoEzU1A92yggAhjcbbQDRHTP64zsNe6DlKUwzeKXDJFSb80yHfZ59meUsbWIvlw3cqHbDbGxDxUlZK/O0NNo0udj1aexS4f7PRztMlZX/wwbIfMwiTBj7aTs7iOG0hOpbDwvTfc4CbE2TSbX/yGq1ZSEurB2bVi6zcEXvDBZVYjfPJ8akt4N+ATiOfGT+oGGAEwN0U13kIhOoWAl7C1RT5F7S92U6zbvsAE0x+dZCO+TTenf8x6JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssebf5n45KBqvYpa/YlE5DeEaRWD0wa69MGPNX9pw34=;
 b=NneI6CsYrMvTqKUjkgeRNlgJzLizvFls0nOrgfF5F9EjG0XC1R7OJMes6KsobaqPyWUOcbDhVy1Ig9oFognGVjujfRd6XP4p6nW7q1L9FneXzGVV1/h/88Y66JcCba89nvEVqNDvYyw46+YJRmjKZ8+2zRaknwJbcHzcPuceyqM=
Received: from CY5PR15CA0059.namprd15.prod.outlook.com (2603:10b6:930:1b::28)
 by MW4PR12MB5625.namprd12.prod.outlook.com (2603:10b6:303:168::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 07:46:24 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:930:1b:cafe::27) by CY5PR15CA0059.outlook.office365.com
 (2603:10b6:930:1b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Wed,
 12 Nov 2025 07:46:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 07:46:24 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 11 Nov
 2025 23:46:20 -0800
From: Honglei Huang <honglei1.huang@amd.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 <Ray.Huang@amd.com>
CC: Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <virtualization@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Honglei
 Huang" <Honglei1.Huang@amd.com>
Subject: [PATCH 5/6] drm/virtio: implement userptr support for zero-copy
 memory access
Date: Wed, 12 Nov 2025 15:45:47 +0800
Message-ID: <20251112074548.3718563-6-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112074548.3718563-1-honglei1.huang@amd.com>
References: <20251112074548.3718563-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|MW4PR12MB5625:EE_
X-MS-Office365-Filtering-Correlation-Id: a1b9ad29-05ce-4089-e87f-08de21bf945f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5F2j+02EpSVPG9OCNHQ2lgGP1qCfKEkXoMFkBsGAdpfZpbgf6KQNXL8Uop6o?=
 =?us-ascii?Q?GbxofsaOerGtfPQb9piMfVAkUXR33SER1QGHqrbBuxXnVd/q2M8WzajdSVCH?=
 =?us-ascii?Q?KLRTr+xR4X5Q7UF4Eumg1P/yQh1rbBCSIstWK8pjgSKi47kp87FmZnxOf5nM?=
 =?us-ascii?Q?LlKt68pOYUWSoJq8t3nArJIorrANuRN4dG7bSRLhh88qki6+8MiWfDSuMyqv?=
 =?us-ascii?Q?m6BEY1Kprk5SHNH9SiiiVRIW6O7R3Qn3RvpdCl27la9r/mJioJ7q3Sl8Axae?=
 =?us-ascii?Q?QSHLGVBf+vGpdMA/P+lDDrxDjeRzX1aZDA37AsnDzozUlhsnY995TRwaoIlC?=
 =?us-ascii?Q?MFMSl4Y2frMyk4O+azmie77Y9Bdk/rP0LTLJdG5dpqYn7Iun7tr4tDRw4Ry0?=
 =?us-ascii?Q?Tv+1DeVAtgDlNTh7m+sUlgbtBmR23F1IXqMEXB2ExjcT74laaUy8MPOnORI4?=
 =?us-ascii?Q?Xq/c1PCTtDmJjIMPYYdaum7DqtaNH3cV/cdDfvjLrfxBnx8UjMOx961V7dse?=
 =?us-ascii?Q?d8SEG52qrVa6Gg8W5mdltRA9QsXw9j5DCNwW7KW0xvnS7TSDIT8jHw1D/ikO?=
 =?us-ascii?Q?JyqqpWQk0bR+NCxwL1FOkC6O5NOTWVkpfFvgh05lMswl5b8woDgdOi4yOYGl?=
 =?us-ascii?Q?lhPggiRXE3MNEcUQrn/wiaF/abNURlVQPnp7FustP3xrAkqCgI/AbSDVBKId?=
 =?us-ascii?Q?408XO0oTCi1665NCk8Y9xi5HmeNwvHfKxfcbx/C3CLcqwJP5PmBx3noMLQ1q?=
 =?us-ascii?Q?y0VCfLQeOZLJ0BnMilneSrjgBIs1nEQFfaXxKcz9aqbG8XRz750ByZduA2C6?=
 =?us-ascii?Q?olaB71uVZO0EKCloVovMzoP7ce0sFryToexVctuy0KnSl3cO00oWctNNd+UH?=
 =?us-ascii?Q?hQ2yX7TP4br2ftLoTUBmkCy8rkFzL0s0rtGl7SPzvVbZBT0Q1yf+Uip9HuHk?=
 =?us-ascii?Q?nc/slM5nNJhf28tWgH8n8D8+zB9gaIJ6dQA9zJhEKYmVlGp7VC7QFKpkkj1I?=
 =?us-ascii?Q?96+MTOFKc1mLjTMPWMhMmgwJCDW/7S0qEr6lbyecKZs8BjXtXGMdWzGdJufr?=
 =?us-ascii?Q?4k05ekwIQE31fZa6VeNOc5ZhLzY19XqPlnUwvzy2D5UxOtdST2GEhQsIvPAh?=
 =?us-ascii?Q?v6aydp/iPEP1Bl8w1cvRJYmjY0lD0k0mv9EL5FUR++7KOqzU0zhpCEj2SxaC?=
 =?us-ascii?Q?wIAtBnrS9Khn+2ZLsjX01xOrZuAo1VISAirfMkGAeDuZzum2pXbggHG6vIQp?=
 =?us-ascii?Q?4ByAh+W8sLxdPslXx7yzBOuhc+ADriWacwukln6ip4KEB2yxT58KjHv/cdC8?=
 =?us-ascii?Q?u2nXDpV7JNtA51jsoOCnW88WoKFc1NJp6NNr2vCZIiP8iYiChdRMfeeYgWC/?=
 =?us-ascii?Q?ObK+8+svi2XI3y54Gfy7/Q+Bn+vmg/DKlrjmRYMWGzk2z1OaF+v+QzbOdY+8?=
 =?us-ascii?Q?omRfTQy2/6SLHzUILRniSs5r85PQldjs4t4LNkT0ErAsJn4ctfgHUqQfSVhc?=
 =?us-ascii?Q?C/6BBWDWY/W9MgHiaMgQYdpN8gu9nwFBkWgrMzcBR/68qJX0BpI/MrM7LAcE?=
 =?us-ascii?Q?BjrTPPoU+m32dRlCDdI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 07:46:24.4105 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b9ad29-05ce-4089-e87f-08de21bf945f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5625
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
 drivers/gpu/drm/virtio/virtgpu_object.c  |   7 +-
 drivers/gpu/drm/virtio/virtgpu_userptr.c | 231 +++++++++++++++++++++++
 4 files changed, 272 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/virtio/virtgpu_userptr.c

diff --git a/drivers/gpu/drm/virtio/Makefile b/drivers/gpu/drm/virtio/Makefile
index d2e1788a8227..fe7332a621aa 100644
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
index ab19106af105..0f9d0fbacca0 100644
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
@@ -513,4 +540,10 @@ void virtio_gpu_vram_unmap_dma_buf(struct device *dev,
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
index 5517cff8715c..d2b5bb022667 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -80,10 +80,15 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
 		drm_gem_free_mmap_offset(&vram->base.base.base);
 		drm_gem_object_release(&vram->base.base.base);
 		kfree(vram);
+	} else if (virtio_gpu_is_userptr(bo)) {
+		struct virtio_gpu_object_userptr *userptr = to_virtio_gpu_userptr(bo);
+
+		drm_gem_object_release(&userptr->base.base.base);
+		kfree(userptr);
 	} else {
 		drm_gem_object_release(&bo->base.base);
 		kfree(bo);
-	}
+	} 
 }
 
 static void virtio_gpu_free_object(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/virtio/virtgpu_userptr.c b/drivers/gpu/drm/virtio/virtgpu_userptr.c
new file mode 100644
index 000000000000..f6c211e9dd0d
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

