Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88130A490F4
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 06:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0705110EC09;
	Fri, 28 Feb 2025 05:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="U6qxqz4v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD7F10EC0C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 05:37:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqqLbdKsWoIIYt0ZpMebq9l740CABzrEUtrXcAyrpelfbA4cLuA+bmyytfX16iQxUSgcG0EWywpf/Hxl2VYs6Xij4Ty4saCDFL8h6Rp9xaKiqlWDK1uUwsuFP0wkuhSEJi/K16hPHXvSWiAlJZ6elX+DlNJ4wUbfwyOimWWhuZcNQbvnT+yBPBn483cNBqbXF1VqSu/F4bRtbl7rDPOA7C2bs2hLRFAOhAZwHipdL01Fm/5n84doqd45lwmafXRjIrzc8Rhu1puMq0lR8cZD30UUR7IVT9dgREGqMhzjEsYdYjuHUSjCvyufs2k72nOktmECrcsygB46GMWt2NSu6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IENX2icIAE/2alZm2gjaUEnCoOPizoTbRyZf94wWu4w=;
 b=cZbTMDNqCBCa16bN6KgMFFbWGEVxzgSWzYr35FvoWoZ9JAe3c0FSqM00451u5DPOj3vnVGAcCy2Kb62B1nQEECBtSxUn0gYYAh0HNchFcMx3Nw+6wQ8mZKKmvj8kxs7vqxb2fNZCNNAkntvpKkWUogazi5CgimIx9bpswHFSh+Z1qRIjELSzgI6KtF4XRp66sqoXlH+HAaLzU07UHzoPfhEKn1Z5VQW1D3jk5uMYLvRdnqmzVZZQT2A/axxrqXcVSBLO9t8bAtVpyR5KF6qLUwYAwktYO39qjXZcmX8SPJrWavpNJRwbvTeNKNVmSME/HIFy307Mp2+ko5CGYijAwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IENX2icIAE/2alZm2gjaUEnCoOPizoTbRyZf94wWu4w=;
 b=U6qxqz4v+f2f9bU0Ar0PK1Ap2xsslSCXr3JuF6dzvPAqa3naJB/HP14c+VDFf2fBQM9mVb+6bIsHp1BcOMlPBjq2Anj6QLtrVmGYD38cGkIr6xtxMqCOGMEXY1yIor5Kks0gqa/1z4H65YSKgZlrfKRnvor1pPvqmujvpN/cono=
Received: from BN9PR03CA0181.namprd03.prod.outlook.com (2603:10b6:408:f9::6)
 by DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Fri, 28 Feb
 2025 05:37:52 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:f9:cafe::23) by BN9PR03CA0181.outlook.office365.com
 (2603:10b6:408:f9::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.23 via Frontend Transport; Fri,
 28 Feb 2025 05:37:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Fri, 28 Feb 2025 05:37:51 +0000
Received: from jenkins-honglei.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Feb
 2025 23:37:47 -0600
From: Honglei Huang <honglei1.huang@amd.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter
 <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, Huang Rui
 <ray.huang@amd.com>
CC: <dri-devel@lists.freedesktop.org>, <virtualization@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, Honglei Huang
 <Honglei1.Huang@amd.com>
Subject: [PATCH v1 7/7] drm/virtio: implement userptr: add mmu notifier
Date: Fri, 28 Feb 2025 13:36:50 +0800
Message-ID: <20250228053650.393646-8-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250228053650.393646-1-honglei1.huang@amd.com>
References: <20250228053650.393646-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: b945154c-cc7e-4018-6603-08dd57ba0b16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DApX7MH1Wn0I5WArArp4V6jKBe5V/M3594Gp81ojVS0cNoIM+gmruHhBKb47?=
 =?us-ascii?Q?H5/YyBfHWVC1m/eGoakuWMKQRIxC6CWAOTjP1F16z1pWxgidS9ctG3Ulya9V?=
 =?us-ascii?Q?ih8jEQDR64y8BBkEEahCdmiI9gHWgrBgsBWGkag08DzDhMJu157DdS5PAuJo?=
 =?us-ascii?Q?KWueVU3uh6CiXI59OFppV31ixDstT7OBODfY8qV+cdXw0DrWzh4urECJ00nA?=
 =?us-ascii?Q?9XwXgpY0oPzEm1u443dPtuuMCD5jyPHcvK1EjKGC6GRDW85Z4btmHJaYur1f?=
 =?us-ascii?Q?s3uIWG3yt/jmv5c8VWuCdIF4aKm/Not+kV1VWMwDK6hQ76OMCL/zlcjf5diX?=
 =?us-ascii?Q?FRixK7dXBJkLJWeMVt5vJinidqD6epib74Zjsjr7uvittjg0YxpLUzghK57K?=
 =?us-ascii?Q?2LzFA5SVZj3pISTujoM3oJkSV4kG0DdU0VmK/aXl5Ig8NI5vpg+VlVvCxs8u?=
 =?us-ascii?Q?+zf9Yv/aTh+loTuscMFdB7GAPwE0WqgAtronCWHn5T8BYRXoIQsUEbF2RLmp?=
 =?us-ascii?Q?eVKqGu7+D9JOYHWK9F9k635xzF/GtbdccSy1gwEiVnH+thLW2VZ2mVvqKeeb?=
 =?us-ascii?Q?gSUlBW/f2oWVMFxJV46+CD1KEij9MF9oqQShhxWVG6wa8vGj2X/kOym6KCbg?=
 =?us-ascii?Q?jOJ5fq7gRhSRANy4BRFdONj6qZCSxTJf++28qT0m417TCP6uC7eOVEsSSBrT?=
 =?us-ascii?Q?eBho+Igwjh1A5hXgzxRHEERm+pVqTCIUsWmRGTtW8Xsj4XdCxdGXHJoclVYu?=
 =?us-ascii?Q?KqElri+665AaPd0nxAw+bAQnSkT2vT+XWIwUCP8pqHLyEqT7/86Is3Xlsf1w?=
 =?us-ascii?Q?qfwH7UX9gFzfTvxvoRJ9y0cHXd65yBNV+2E/w6DF8ZsMBnpHk46pcF8S24Ym?=
 =?us-ascii?Q?lK7jaT4QRIr4xJGdMcPhURGM324r+XoCH5kUTWji2CHxPK89IeBZ8jjjg3VU?=
 =?us-ascii?Q?8GbLvKE1/T2QJRth1CCubIohiTRtxkWspclAAueEdUY/0Ep2legsEs+WFYiD?=
 =?us-ascii?Q?I6oElJP0K/f8Ux++MO5wfg5pd8+uN0eP+wsOjwErTtcUF6FDinGt1e50o/Un?=
 =?us-ascii?Q?XBMy7MRK272Zz+RNog0YW/OyFRY7TQ0Fu4gW/1qOB8QTYaCL7pbH6mTmeTT8?=
 =?us-ascii?Q?ubywRIGS/qU0aWSHhHUkWTtjr13+8T+4AEngJm1j5BrYiozXGrfVMdlvFiav?=
 =?us-ascii?Q?N4+lnwP/9A6Y5+E3Yyd+XmCrbBGBjizoB8BU8I0vLd16WClSBDeKGx9tHDWg?=
 =?us-ascii?Q?9kqd4bBfFlsyQ82K7mDasvcVu2/jhXdXPeurShRLkwIOpvfuCEzTV6mm7O9M?=
 =?us-ascii?Q?MMPfkwdeZhD4393Mk9g8134/jYKmbqXMOQu1HRTnODcCBRa/PxejWgonFJQh?=
 =?us-ascii?Q?b/0+1O76kONM6aL/61464UYsuV9KGiNZ/AE/ISGCgxh/1kol6pmrq9F9nqEw?=
 =?us-ascii?Q?Pn63kgQ1KqymfMlNMrV1PxEuENN+nDCvz5XcVxi43xXRliYTP/Ev7RctkkZs?=
 =?us-ascii?Q?PdI1GB8xooxhtJjWWUww1pUAEgP3wpUdzDho?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 05:37:51.7560 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b945154c-cc7e-4018-6603-08dd57ba0b16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204
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

Add mmu notifier, there are some benefits:
- UMD do not need manage the userptrs, just alloc and free user space
memory, with the MMU notifier userpters can be managed by kernel.
- Can achieve a performance improvement of 20%~30%. With the MMU notifier
UMD like OpenCL can achieve 98% performance compared to bare metal in
some bench marks like Geekbench and CLpeak.

Signed-off-by: Honglei Huang <Honglei1.Huang@amd.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  47 ++-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c   |   4 +-
 drivers/gpu/drm/virtio/virtgpu_kms.c     |   2 +
 drivers/gpu/drm/virtio/virtgpu_userptr.c | 423 ++++++++++++++++++++++-
 4 files changed, 469 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index fa5dd46e3732..6fa6dd9d1738 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -42,6 +42,7 @@
 #include <drm/drm_ioctl.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/virtgpu_drm.h>
+#include <linux/mmu_notifier.h>
 
 #define DRIVER_NAME "virtio_gpu"
 #define DRIVER_DESC "virtio GPU"
@@ -121,9 +122,33 @@ struct virtio_gpu_object_userptr_ops {
 	int (*get_pages)(struct virtio_gpu_object_userptr *userptr);
 	void (*put_pages)(struct virtio_gpu_object_userptr *userptr);
 	void (*release)(struct virtio_gpu_object_userptr *userptr);
-	int (*insert)(struct virtio_gpu_object_userptr *userptr, struct virtio_gpu_fpriv *fpriv);
-	int (*remove)(struct virtio_gpu_object_userptr *userptr, struct virtio_gpu_fpriv *fpriv);
+	int (*insert)(struct virtio_gpu_object_userptr *userptr,
+		      struct virtio_gpu_fpriv *fpriv);
+	int (*remove)(struct virtio_gpu_object_userptr *userptr,
+		      struct virtio_gpu_fpriv *fpriv);
+	bool (*valid)(struct virtio_gpu_object_userptr *userptr);
+	void (*notifier_init)(struct virtio_gpu_object_userptr *userptr,
+			      struct mm_struct *mm);
+	int (*notifier_add)(struct virtio_gpu_object_userptr *userptr,
+			    unsigned long start, unsigned long length);
+	void (*notifier_remove)(struct virtio_gpu_object_userptr *userptr);
+	int (*split)(struct virtio_gpu_object_userptr *userptr,
+		     unsigned long start, unsigned long last,
+		     struct virtio_gpu_object_userptr **pnew);
+	void (*evict)(struct virtio_gpu_object_userptr *userptr);
+	void (*update)(struct virtio_gpu_object_userptr *userptr);
+	struct virtio_gpu_object_userptr *(*split_new)(
+		struct virtio_gpu_object_userptr *userptr, unsigned long start,
+		unsigned long last);
 };
+
+enum userptr_work_list_ops {
+	USERPTR_OP_NULL,
+	USERPTR_OP_UNMAP,
+	USERPTR_OP_UPDATE,
+	USERPTR_OP_EVICT,
+};
+
 struct virtio_gpu_object_userptr {
 	struct virtio_gpu_object base;
 	const struct virtio_gpu_object_userptr_ops *ops;
@@ -142,6 +167,16 @@ struct virtio_gpu_object_userptr {
 	struct sg_table *sgt;
 
 	struct interval_tree_node it_node;
+
+#ifdef CONFIG_MMU_NOTIFIER
+	struct list_head work_list;
+	enum userptr_work_list_ops op;
+	atomic_t in_release;
+	struct mm_struct *mm;
+	uint64_t notifier_start;
+	uint64_t notifier_last;
+	struct mmu_interval_notifier notifier;
+#endif
 };
 
 #define to_virtio_gpu_shmem(virtio_gpu_object) \
@@ -317,6 +352,12 @@ struct virtio_gpu_fpriv {
 	bool explicit_debug_name;
 	struct rb_root_cached userptrs_tree;
 	struct mutex userptrs_tree_lock;
+
+#ifdef CONFIG_MMU_NOTIFIER
+	struct work_struct userptr_work;
+	struct list_head userptr_work_list;
+	spinlock_t userptr_work_list_lock;
+#endif
 };
 
 /* virtgpu_ioctl.c */
@@ -536,4 +577,6 @@ bool virtio_gpu_is_userptr(struct virtio_gpu_object *bo);
 void virtio_gpu_userptr_interval_tree_init(struct virtio_gpu_fpriv *vfpriv);
 void virtio_gpu_userptr_set_handle(struct virtio_gpu_object *qobj,
 				   uint32_t handle);
+uint32_t virtio_gpu_userptr_get_handle(struct virtio_gpu_object *qobj);
+void virtio_gpu_userptr_list_work_init(struct virtio_gpu_fpriv *vfpriv);
 #endif
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index ad1ac8d0eadf..14326fd8fee9 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -697,8 +697,10 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 		}
 	}
 
-	if (vfpriv->context_init & VIRTIO_GPU_CAPSET_HSAKMT)
+	if (vfpriv->context_init & VIRTIO_GPU_CAPSET_HSAKMT) {
+		virtio_gpu_userptr_list_work_init(vfpriv);
 		virtio_gpu_userptr_interval_tree_init(vfpriv);
+	}
 
 	virtio_gpu_create_context_locked(vgdev, vfpriv);
 	virtio_gpu_notify(vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 3d5158caef46..3dc44eb16fb8 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -345,6 +345,8 @@ void virtio_gpu_driver_postclose(struct drm_device *dev, struct drm_file *file)
 		return;
 
 	if (vfpriv->context_created) {
+		if (vfpriv->context_init & VIRTIO_GPU_CAPSET_HSAKMT)
+			flush_work(&vfpriv->userptr_work);
 		virtio_gpu_cmd_context_destroy(vgdev, vfpriv->ctx_id);
 		virtio_gpu_notify(vgdev);
 	}
diff --git a/drivers/gpu/drm/virtio/virtgpu_userptr.c b/drivers/gpu/drm/virtio/virtgpu_userptr.c
index 03398c3b9f30..10264227f3e7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_userptr.c
+++ b/drivers/gpu/drm/virtio/virtgpu_userptr.c
@@ -3,6 +3,7 @@
 #include <linux/mm.h>
 #include <linux/pid.h>
 #include <linux/vmalloc.h>
+#include <linux/mmu_notifier.h>
 
 #include "virtgpu_drv.h"
 #include "drm/drm_gem.h"
@@ -13,21 +14,422 @@ virtio_gpu_userptr_get_sg_table(struct drm_gem_object *obj);
 static int virtio_gpu_userptr_insert(struct virtio_gpu_object_userptr *userptr,
 				     struct virtio_gpu_fpriv *vfpriv)
 {
+	int ret;
+
 	if (!userptr->ops->insert)
 		return -EINVAL;
 
-	return userptr->ops->insert(userptr, vfpriv);
+	ret = userptr->ops->insert(userptr, vfpriv);
+	if (ret)
+		return ret;
+
+	if (userptr->ops->notifier_add)
+		ret = userptr->ops->notifier_add(userptr, userptr->start,
+						 userptr->last -
+							 userptr->start + 1UL);
+
+	return ret;
 }
 
 static int virtio_gpu_userptr_remove(struct virtio_gpu_object_userptr *userptr,
 				     struct virtio_gpu_fpriv *vfpriv)
 {
+	int ret;
+
 	if (!userptr->ops->remove)
 		return -EINVAL;
 
-	return userptr->ops->remove(userptr, vfpriv);
+	ret = userptr->ops->remove(userptr, vfpriv);
+	if (ret)
+		return ret;
+
+	if (userptr->ops->notifier_remove)
+		userptr->ops->notifier_remove(userptr);
+
+	return ret;
+}
+
+static bool virtio_gpu_userptr_valid(struct virtio_gpu_object_userptr *userptr)
+{
+	if (userptr->ops->valid)
+		return userptr->ops->valid(userptr);
+
+	return true;
+}
+
+#ifdef CONFIG_MMU_NOTIFIER
+
+static bool
+virtio_gpu_userptr_invalidate(struct mmu_interval_notifier *mn,
+			      const struct mmu_notifier_range *range,
+			      unsigned long cur_seq);
+
+static const struct mmu_interval_notifier_ops virtio_gpu_userptr_mn_ops = {
+	.invalidate = virtio_gpu_userptr_invalidate,
+};
+
+static int
+virtio_gpu_userptr_add_notifier(struct virtio_gpu_object_userptr *userptr,
+				unsigned long start, unsigned long length)
+{
+	if (!start || !length)
+		return -EINVAL;
+
+	return mmu_interval_notifier_insert(&userptr->notifier, userptr->mm,
+					    start, length,
+					    &virtio_gpu_userptr_mn_ops);
+}
+
+static void
+virtio_gpu_userptr_remove_notifier(struct virtio_gpu_object_userptr *userptr)
+{
+	mmu_interval_notifier_remove(&userptr->notifier);
+}
+
+static void virtio_gpu_userptr_unmap(struct virtio_gpu_object_userptr *userptr)
+{
+	drm_gem_handle_delete(userptr->file, userptr->bo_handle);
+}
+
+static void virtio_gpu_userptr_update_notifier_and_interval_tree(
+	struct virtio_gpu_object_userptr *userptr)
+{
+	unsigned long start = userptr->notifier.interval_tree.start;
+	unsigned long last = userptr->notifier.interval_tree.last;
+
+	if (userptr->start == start && userptr->last == last)
+		return;
+
+	if (start != 0 && last != 0)
+		virtio_gpu_userptr_remove(userptr, userptr->file->driver_priv);
+
+	virtio_gpu_userptr_insert(userptr, userptr->file->driver_priv);
+	userptr->op = 0;
 }
 
+static int virtio_gpu_userptr_split(struct virtio_gpu_object_userptr *userptr,
+				    unsigned long valid_start,
+				    unsigned long valid_last,
+				    struct virtio_gpu_object_userptr **new)
+{
+	uint64_t old_start = userptr->start;
+	uint64_t old_last = userptr->last;
+
+	if (old_start != valid_start && old_last != valid_last)
+		return -EINVAL;
+	if (valid_start < old_start || valid_last > old_last)
+		return -EINVAL;
+
+	if (userptr->ops->split_new)
+		*new = userptr->ops->split_new(userptr, valid_start,
+					       valid_last);
+
+	userptr->start = valid_start;
+	userptr->last = valid_last;
+
+	return 0;
+}
+
+static void
+virtio_gpu_userptr_update_split(struct virtio_gpu_object_userptr *userptr,
+				unsigned long mn_start, unsigned long mn_last)
+{
+	struct virtio_gpu_object_userptr *head;
+	struct virtio_gpu_object_userptr *tail;
+
+	if (!userptr->ops->split)
+		return;
+	if (userptr->op == USERPTR_OP_UNMAP)
+		return;
+
+	if (mn_start > userptr->last || mn_last < userptr->start)
+		return;
+
+	head = tail = userptr;
+	if (mn_start > userptr->start)
+		userptr->ops->split(userptr, userptr->start, mn_start - 1UL,
+				    &tail);
+	else if (mn_last < userptr->last)
+		userptr->ops->split(userptr, mn_last + 1UL, userptr->last,
+				    &head);
+}
+
+static void
+virtio_gpu_userptr_add_list_work(struct virtio_gpu_object_userptr *userptr,
+				 int op)
+{
+	struct virtio_gpu_fpriv *vfpriv = userptr->file->driver_priv;
+
+	spin_lock(&vfpriv->userptr_work_list_lock);
+
+	if (!list_empty(&userptr->work_list)) {
+		if (op != USERPTR_OP_NULL && userptr->op != USERPTR_OP_UNMAP)
+			userptr->op = op;
+	} else {
+		userptr->op = op;
+		list_add_tail(&userptr->work_list, &vfpriv->userptr_work_list);
+	}
+
+	spin_unlock(&vfpriv->userptr_work_list_lock);
+}
+
+static int virtio_gpu_follow_pfn(struct vm_area_struct *vma, uint64_t addr,
+				 unsigned long *pfn)
+{
+	struct follow_pfnmap_args args = { .vma = vma, .address = addr };
+
+	if (follow_pfnmap_start(&args))
+		return -EINVAL;
+
+	*pfn = args.pfn;
+	follow_pfnmap_end(&args);
+
+	return 0;
+}
+
+static int virtio_gpu_userptr_check(struct virtio_gpu_object_userptr *userptr,
+				    struct vm_area_struct *vma, uint64_t start,
+				    uint64_t end)
+{
+	uint64_t addr;
+	int ret;
+	unsigned long pfn;
+
+	for (addr = start; addr < end; addr += PAGE_SIZE) {
+		ret = virtio_gpu_follow_pfn(vma, addr, &pfn);
+		if (ret)
+			return -EINVAL;
+
+		if (page_to_pfn(userptr->pages[(addr - userptr->start) >>
+					       PAGE_SHIFT]) != pfn)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int
+virtio_gpu_userptr_check_range(struct virtio_gpu_object_userptr *userptr,
+			       uint64_t notifier_start, uint64_t notifier_last)
+{
+	uint64_t start, end, addr;
+	int r = 0;
+
+	start = notifier_start;
+	end = notifier_last + (1UL << PAGE_SHIFT);
+
+	for (addr = start; !r && addr < end;) {
+		struct vm_area_struct *vma;
+		uint64_t next = 0;
+
+		vma = vma_lookup(userptr->mm, addr);
+
+		if (vma) {
+			next = min(vma->vm_end, end);
+			r = virtio_gpu_userptr_check(userptr, vma, start, next);
+			if (r)
+				break;
+		} else {
+			r = -EFAULT;
+			break;
+		}
+
+		addr = next;
+	}
+
+	return r;
+}
+
+static void
+virtio_gpu_update_or_remove_userptr(struct virtio_gpu_object_userptr *userptr,
+				    unsigned long start, unsigned long last)
+{
+	if ((userptr->start) >= start && (userptr->last) <= last) {
+		if (atomic_xchg(&userptr->in_release, 1) == 0) {
+			virtio_gpu_userptr_add_list_work(userptr,
+							 USERPTR_OP_UNMAP);
+		}
+	} else {
+		virtio_gpu_userptr_update_split(userptr, start, last);
+		virtio_gpu_userptr_add_list_work(userptr, USERPTR_OP_UPDATE);
+	}
+}
+
+static void virtio_gpu_userptr_evict(struct virtio_gpu_object_userptr *userptr)
+{
+	if (!userptr->notifier_start || !userptr->notifier_last)
+		return;
+
+	if (userptr->notifier_start < userptr->start ||
+	    userptr->notifier_last > userptr->last)
+		return;
+
+	if (virtio_gpu_userptr_check_range(userptr, userptr->notifier_start,
+					   userptr->notifier_last)) {
+		virtio_gpu_update_or_remove_userptr(
+			userptr, userptr->notifier_start,
+			userptr->notifier_last + (1UL << PAGE_SHIFT) - 1UL);
+	}
+
+	userptr->notifier_start = 0;
+	userptr->notifier_last = 0;
+}
+
+static void
+virtio_gpu_userptr_handle_list_work(struct virtio_gpu_object_userptr *userptr)
+{
+	switch (userptr->op) {
+	case USERPTR_OP_NULL:
+		break;
+	case USERPTR_OP_UNMAP:
+		virtio_gpu_userptr_unmap(userptr);
+		break;
+	case USERPTR_OP_UPDATE:
+		if (userptr->ops->update)
+			userptr->ops->update(userptr);
+		break;
+	case USERPTR_OP_EVICT:
+		if (userptr->ops->evict)
+			userptr->ops->evict(userptr);
+		break;
+	default:
+		break;
+	}
+}
+
+static void virtio_gpu_userptr_invalidate_work(struct work_struct *work)
+{
+	struct virtio_gpu_fpriv *vfpriv;
+	struct virtio_gpu_object_userptr *userptr;
+
+	vfpriv = container_of(work, struct virtio_gpu_fpriv, userptr_work);
+
+	spin_lock(&vfpriv->userptr_work_list_lock);
+	while (!list_empty(&vfpriv->userptr_work_list)) {
+		userptr = list_first_entry(&vfpriv->userptr_work_list,
+					   struct virtio_gpu_object_userptr,
+					   work_list);
+		spin_unlock(&vfpriv->userptr_work_list_lock);
+
+		mmap_write_lock(userptr->mm);
+
+		spin_lock(&vfpriv->userptr_work_list_lock);
+		list_del_init(&userptr->work_list);
+		spin_unlock(&vfpriv->userptr_work_list_lock);
+
+		mutex_lock(&vfpriv->userptrs_tree_lock);
+
+		virtio_gpu_userptr_handle_list_work(userptr);
+
+		mutex_unlock(&vfpriv->userptrs_tree_lock);
+		mmap_write_unlock(userptr->mm);
+
+		spin_lock(&vfpriv->userptr_work_list_lock);
+	}
+	spin_unlock(&vfpriv->userptr_work_list_lock);
+}
+
+void virtio_gpu_userptr_list_work_init(struct virtio_gpu_fpriv *vfpriv)
+{
+	INIT_WORK(&vfpriv->userptr_work, virtio_gpu_userptr_invalidate_work);
+	INIT_LIST_HEAD(&vfpriv->userptr_work_list);
+	spin_lock_init(&vfpriv->userptr_work_list_lock);
+}
+
+static void
+virtio_gpu_userptr_schedule_list_work(struct virtio_gpu_fpriv *vfpriv)
+{
+	spin_lock(&vfpriv->userptr_work_list_lock);
+	if (!list_empty(&vfpriv->userptr_work_list))
+		schedule_work(&vfpriv->userptr_work);
+	spin_unlock(&vfpriv->userptr_work_list_lock);
+}
+
+static bool
+virtio_gpu_userptr_invalidate(struct mmu_interval_notifier *mn,
+			      const struct mmu_notifier_range *range,
+			      unsigned long cur_seq)
+{
+	struct virtio_gpu_object_userptr *userptr;
+	unsigned long start;
+	unsigned long last;
+
+	if (range->event == MMU_NOTIFY_RELEASE)
+		return true;
+	if (!mmget_not_zero(mn->mm))
+		return true;
+
+	start = mn->interval_tree.start;
+	last = mn->interval_tree.last;
+	start = (max(start, range->start) >> PAGE_SHIFT) << PAGE_SHIFT;
+	last = (min(last, range->end - 1UL) >> PAGE_SHIFT) << PAGE_SHIFT;
+
+	userptr = container_of(mn, struct virtio_gpu_object_userptr, notifier);
+	userptr->mm = mn->mm;
+
+	mutex_lock(&userptr->lock);
+	mmu_interval_set_seq(mn, cur_seq);
+
+	if (userptr->op != USERPTR_OP_UNMAP) {
+		switch (range->event) {
+		case MMU_NOTIFY_UNMAP:
+			virtio_gpu_update_or_remove_userptr(
+				userptr, start,
+				last + (1UL << PAGE_SHIFT) - 1UL);
+			break;
+		default:
+			userptr->notifier_start = start;
+			userptr->notifier_last = last;
+			virtio_gpu_userptr_add_list_work(userptr,
+							 USERPTR_OP_EVICT);
+			break;
+		}
+	}
+
+	virtio_gpu_userptr_schedule_list_work(userptr->file->driver_priv);
+
+	mutex_unlock(&userptr->lock);
+	mmput(mn->mm);
+	return true;
+}
+
+static void
+virtio_gpu_userptr_lock_and_flush_work(struct virtio_gpu_fpriv *vfpriv)
+{
+retry_flush_work:
+	flush_work(&vfpriv->userptr_work);
+
+	if (list_empty(&vfpriv->userptr_work_list))
+		return;
+
+	goto retry_flush_work;
+}
+
+static bool virtio_gpu_userptr_valid_with_notifier(
+	struct virtio_gpu_object_userptr *userptr)
+{
+	return (!atomic_read(&userptr->in_release)) && (!userptr->op);
+}
+
+static void
+virtio_gpu_userptr_notifier_init(struct virtio_gpu_object_userptr *userptr,
+				 struct mm_struct *mm)
+{
+	userptr->notifier_start = 0;
+	userptr->notifier_last = 0;
+	atomic_set(&userptr->in_release, 0);
+	INIT_LIST_HEAD(&userptr->work_list);
+	mutex_init(&userptr->lock);
+	userptr->mm = mm;
+}
+
+#else
+static void
+virtio_gpu_userptr_lock_and_flush_work(struct virtio_gpu_fpriv *vfpriv)
+{
+}
+#endif /* CONFIG_MMU_NOTIFIER */
+
 static uint64_t virtio_gpu_userptr_get_offset(struct virtio_gpu_object *qobj,
 					      uint64_t addr)
 {
@@ -52,7 +454,8 @@ virtio_gpu_userptr_from_addr_range(struct virtio_gpu_fpriv *vfpriv,
 		userptr = container_of(node, struct virtio_gpu_object_userptr,
 				       it_node);
 
-		if (start >= userptr->start && last <= userptr->last) {
+		if (start >= userptr->start && last <= userptr->last &&
+		    virtio_gpu_userptr_valid(userptr)) {
 			ret = userptr;
 			return ret;
 		}
@@ -92,7 +495,6 @@ void virtio_gpu_userptr_set_handle(struct virtio_gpu_object *qobj,
 				   uint32_t handle)
 {
 	struct virtio_gpu_object_userptr *userptr = to_virtio_gpu_userptr(qobj);
-
 	userptr->bo_handle = handle;
 }
 
@@ -254,6 +656,9 @@ virtio_gpu_userptr_init(struct drm_device *dev, struct drm_file *file,
 	obj = &userptr->base.base.base;
 	obj->funcs = &virtio_gpu_userptr_funcs;
 
+	if (userptr->ops->notifier_init)
+		userptr->ops->notifier_init(userptr, current->mm);
+
 	drm_gem_private_object_init(dev, obj, aligned_size);
 
 	ret = virtio_gpu_resource_id_get(userptr->vgdev,
@@ -268,6 +673,15 @@ static const struct virtio_gpu_object_userptr_ops virtio_gpu_userptr_ops = {
 	.release = virtio_gpu_userptr_release,
 	.insert = virtio_gpu_userptr_insert_interval_tree,
 	.remove = virtio_gpu_userptr_remove_interval_tree,
+#ifdef CONFIG_MMU_NOTIFIER
+	.valid = virtio_gpu_userptr_valid_with_notifier,
+	.notifier_init = virtio_gpu_userptr_notifier_init,
+	.notifier_add = virtio_gpu_userptr_add_notifier,
+	.notifier_remove = virtio_gpu_userptr_remove_notifier,
+	.split = virtio_gpu_userptr_split,
+	.update = virtio_gpu_userptr_update_notifier_and_interval_tree,
+	.evict = virtio_gpu_userptr_evict,
+#endif
 };
 
 int virtio_gpu_userptr_create(struct virtio_gpu_device *vgdev,
@@ -290,6 +704,7 @@ int virtio_gpu_userptr_create(struct virtio_gpu_device *vgdev,
 		       params->size))
 		return -EFAULT;
 
+	virtio_gpu_userptr_lock_and_flush_work(vfpriv);
 	mutex_lock(&vfpriv->userptrs_tree_lock);
 
 	userptr = virtio_gpu_userptr_from_addr_range(
-- 
2.34.1

