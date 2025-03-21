Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B24F5A6B5AD
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 09:01:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058E810E703;
	Fri, 21 Mar 2025 08:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vGB9Ngwf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DAF10E700
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 08:01:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gorgJ24nvLUWv3ZhEZpZW7B4vpKHtpviReFIeGJwRFjCUolM/XK4AtpCcDMQTyl4snKfj5YsolsztY6T6aQrq6oY8iIygU4Ic907QIgIuUT7FO4b4e5T9OrcE/62PrTykr6s+3dkFxeIae1YDDZN3Kt8UAcdsT6WbACUI5z9BsG7RvcSrtpLUELjxMTqX2pZsPPU4B8xQEuhlxvFwD6rQUY6UxCuzITQu309VcSuV4rrkXL1EH4ALRUKxGJvzhnm3FuFxJPi+0JpKbrmsl0Uk+UsOJxtfWus91eNLjJZZcD3Sn+faH/oM8kVr+i63DkCKPZQJa/kgmG89hhgMmEXew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlAlxGgbeuA/hmEu175+CGpGWnVfKX8NfUK4Vv9jEGo=;
 b=reqarzv939FGI2MDvcsCA1Ie/B9RL5oEWxXZDXl3fELlHBLPtOKPkcghfXWxtZegLZ38MWU1EHzUXpFp8RK3fUjpSggUG3wG2rvluujemRtmzqfYmy/nxIkPoywFadFpB4gVjWuRvmfy8kpQYp4QSXMYdVXBLN4KdSbu1ZGExLFfw/LrKdGcbelNAGBL2dAJaX3MD2QdDjFqQEiVo+UQcnQruQfluh1c8FcIkhPe6ib8VDr5thEi2uIZFrmRgjurN8xYLDV68asadI5mvbrmM+bzBetpQMczzd/OUC/Rpq23fe4GsOohps+Cl3w64tJUNezC5X5xl0pqwt898PZA6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlAlxGgbeuA/hmEu175+CGpGWnVfKX8NfUK4Vv9jEGo=;
 b=vGB9Ngwflr2kDjsul45HsjvcCNJh1joL2UsL1cBAM3ufdJtEIAaQF6gE+hy4Sz+WwYGTJL5qzdo36BDwD5QIb1IQCaXKppGaywX79fujbskfX3ZtjZ917w8SLT+H1TGps961UQry8vQhwFKPYrJS+ovOUJc7ENR+Gg+uJbdLzBA=
Received: from CH0PR04CA0005.namprd04.prod.outlook.com (2603:10b6:610:76::10)
 by CY8PR12MB7682.namprd12.prod.outlook.com (2603:10b6:930:85::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 08:01:26 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::53) by CH0PR04CA0005.outlook.office365.com
 (2603:10b6:610:76::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.36 via Frontend Transport; Fri,
 21 Mar 2025 08:01:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Fri, 21 Mar 2025 08:01:26 +0000
Received: from jenkins-honglei.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 21 Mar
 2025 03:01:22 -0500
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
Subject: [PATCH v2 7/7] drm/virtio: implement userptr: add interval tree
Date: Fri, 21 Mar 2025 16:00:29 +0800
Message-ID: <20250321080029.1715078-8-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250321080029.1715078-1-honglei1.huang@amd.com>
References: <20250321080029.1715078-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|CY8PR12MB7682:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d6e5eb8-9d47-4d6e-33fb-08dd684e94a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|1800799024|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D12R6FWvF7HkCXjpzf1V5gr4Uo4Y+0LXsW3lluGZ8dIbrHCnSeutWW+pnnKG?=
 =?us-ascii?Q?/tfayfSa/joDOR9L2IX9FBRUJzYKTJ8pFq/TqshwCspPPdQDdz8Hn0bzd2EG?=
 =?us-ascii?Q?xTOBs3vKKFdRhR2FtMzB+OP7txOoQL7/jsysImkPniptA1BiA14U2kVBw3Xz?=
 =?us-ascii?Q?3U/7Vug31w8+rjQr6bmAai2IDEroxUSgIdquxeGRL1uizEW97q4+HDDm3MIX?=
 =?us-ascii?Q?We267N6ScE32081MapNrP81MYYYxIoLrYHAxE+WfxpfIqA+BGM45ATQTFKmv?=
 =?us-ascii?Q?J/WbE2xiJQ/miiVaYyXbUYcx/CoZozl/aatTcOk0uApnj2gu43c3oGKU/DSZ?=
 =?us-ascii?Q?m61EDE6hloMwVapeaHGF6l2gRf7SAwyXQzkwG1xuVYug28lEzQY1WMAofuOd?=
 =?us-ascii?Q?A38hMP0/yr3HyraLKL3CDPZfJ62Etp6BppB4vqvqeVeTcRTFuvpkow8ZEeD2?=
 =?us-ascii?Q?IVGl1EzE4YpRYr5BNukfMa+8CDy7Jz3yfSJ+Af/qqTEVqJbz0e7Zy36NdWzk?=
 =?us-ascii?Q?uArft0c4BJTWCBVBK3dDVRvZq6aRNGlwLtgbXnRwxT0j2EzZ9k0y9gXTltRg?=
 =?us-ascii?Q?DuQ1Sh1GvAiZgM/GD1WcgefSP1k+/S3Otyo80gid/b0Nq9HquTsmtJNVdvVC?=
 =?us-ascii?Q?7ILll7geYlQKjRIymQRZW1z/KYpnY2NwkYG9HA2tibaNtJ5e6anMPXIhkcQF?=
 =?us-ascii?Q?3lIc82jOuv+sipeRgYr0XtM7FR35F3tGiDn3VslSFozFeuPVKTU788Qify5l?=
 =?us-ascii?Q?PUKByaBr2/EZsxov6ESQOtj0STbmUqyph0nYv3rMHN2A6LMbhOWEwsF8qWYv?=
 =?us-ascii?Q?clW7iTPkgQuZ0PTA/ZjeLB27hYcXMBufmX0BEKS39Hc7QwxX3Hepo9Ezozt2?=
 =?us-ascii?Q?TxYPCvJH/ktGvjxPVgzOLi1/r27dwSqgw3MqyCIu9HIgUI6VuMx4QK6KzBMQ?=
 =?us-ascii?Q?DIUpI4RteksnOqtokwhDCeKE2CsGXE+NT2dulhZyLKN98GiW1jKHXgyM9EM0?=
 =?us-ascii?Q?kWx2hjyYhLYwzYb4MpFeuDsX4pcTI5Ym+VqOX9zXOiyZA6/WNheBXkEp4sde?=
 =?us-ascii?Q?incTISO0vICj0aZHFsOn1qtW5/xG+6BzMRAXOR+nkOsJQ1q0mZlQkEFDTM0L?=
 =?us-ascii?Q?OXgAgRAuR7ikQv+2lceRM5vJBhdTKekljpP+THZrDyloEkPDDLn6qjJwHSVe?=
 =?us-ascii?Q?Tev2SeatGIfddWRltqPHa+wFWe+8jHXnhNtA1kxY9Y+W26U47EINk1fx+73h?=
 =?us-ascii?Q?fuwfi0I4DmN7oxE7iroPUVsXPKJzSWY7SY6nfzgmIAv7rf9JNwiB2rf+8FwR?=
 =?us-ascii?Q?o4p83r/FQFw/scAFieJv/v3LFDGD5uCvFIjxd96X1gDoZKITrxI1DHjz39yA?=
 =?us-ascii?Q?OOIxVmvj2axhX1YtMMVChSSREAMLojqWhcRsEffaxVyefJBlRtGdRzvBCkb9?=
 =?us-ascii?Q?/u5Ygw7dYuIq3N2lptWTmjP8d2OqQJjCax9zubs1aWHVxdIInlIdbvL7y0HL?=
 =?us-ascii?Q?f6NbAJagfo/suMW1I5gjn/z02OcBnnv60JId?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 08:01:26.6158 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d6e5eb8-9d47-4d6e-33fb-08dd684e94a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7682
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

Add interval tree to manage the userptrs to prevent repeat creation.
If the userptr exists, the ioctl will return the existing BO, and it's
offset with the create ioctl address.

Signed-off-by: Honglei Huang <Honglei1.Huang@amd.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  16 ++-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c   |  13 ++-
 drivers/gpu/drm/virtio/virtgpu_userptr.c | 129 ++++++++++++++++++++++-
 include/uapi/drm/virtgpu_drm.h           |   1 +
 4 files changed, 152 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index f3dcbd241f5a..fa5dd46e3732 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -54,6 +54,7 @@
 #define STATE_INITIALIZING 0
 #define STATE_OK 1
 #define STATE_ERR 2
+#define STATE_RES_EXISTS 3
 
 #define MAX_CAPSET_ID 63
 #define MAX_RINGS 64
@@ -114,18 +115,23 @@ struct virtio_gpu_object_vram {
 };
 
 struct virtio_gpu_object_userptr;
+struct virtio_gpu_fpriv;
 
 struct virtio_gpu_object_userptr_ops {
 	int (*get_pages)(struct virtio_gpu_object_userptr *userptr);
 	void (*put_pages)(struct virtio_gpu_object_userptr *userptr);
 	void (*release)(struct virtio_gpu_object_userptr *userptr);
+	int (*insert)(struct virtio_gpu_object_userptr *userptr, struct virtio_gpu_fpriv *fpriv);
+	int (*remove)(struct virtio_gpu_object_userptr *userptr, struct virtio_gpu_fpriv *fpriv);
 };
 struct virtio_gpu_object_userptr {
 	struct virtio_gpu_object base;
 	const struct virtio_gpu_object_userptr_ops *ops;
 	struct mutex lock;
 
+	uint64_t ptr;
 	uint64_t start;
+	uint64_t last;
 	uint32_t npages;
 	uint32_t bo_handle;
 	uint32_t flags;
@@ -134,6 +140,8 @@ struct virtio_gpu_object_userptr {
 	struct drm_file *file;
 	struct page **pages;
 	struct sg_table *sgt;
+
+	struct interval_tree_node it_node;
 };
 
 #define to_virtio_gpu_shmem(virtio_gpu_object) \
@@ -307,6 +315,8 @@ struct virtio_gpu_fpriv {
 	struct mutex context_lock;
 	char debug_name[DEBUG_NAME_MAX_LEN];
 	bool explicit_debug_name;
+	struct rb_root_cached userptrs_tree;
+	struct mutex userptrs_tree_lock;
 };
 
 /* virtgpu_ioctl.c */
@@ -520,6 +530,10 @@ int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 int virtio_gpu_userptr_create(struct virtio_gpu_device *vgdev,
 			      struct drm_file *file,
 			      struct virtio_gpu_object_params *params,
-			      struct virtio_gpu_object **bo_ptr);
+			      struct virtio_gpu_object **bo_ptr,
+			      struct drm_virtgpu_resource_create_blob *rc_blob);
 bool virtio_gpu_is_userptr(struct virtio_gpu_object *bo);
+void virtio_gpu_userptr_interval_tree_init(struct virtio_gpu_fpriv *vfpriv);
+void virtio_gpu_userptr_set_handle(struct virtio_gpu_object *qobj,
+				   uint32_t handle);
 #endif
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 8a89774d0737..b512d4b37981 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -534,8 +534,11 @@ static int virtio_gpu_resource_create_blob_ioctl(struct drm_device *dev,
 
 	if (guest_blob && !params.userptr)
 		ret = virtio_gpu_object_create(vgdev, &params, &bo, NULL);
-	else if (guest_blob && params.userptr)
-		ret = virtio_gpu_userptr_create(vgdev, file, &params, &bo);
+	else if (guest_blob && params.userptr) {
+		ret = virtio_gpu_userptr_create(vgdev, file, &params, &bo, rc_blob);
+		if (ret > 0)
+			return ret;
+	}
 	else if (!guest_blob && host3d_blob)
 		ret = virtio_gpu_vram_create(vgdev, &params, &bo);
 	else
@@ -567,6 +570,9 @@ static int virtio_gpu_resource_create_blob_ioctl(struct drm_device *dev,
 	rc_blob->res_handle = bo->hw_res_handle;
 	rc_blob->bo_handle = handle;
 
+	if (guest_blob && params.userptr)
+		virtio_gpu_userptr_set_handle(bo, handle);
+
 	/*
 	 * The handle owns the reference now.  But we must drop our
 	 * remaining reference *after* we no longer need to dereference
@@ -691,6 +697,9 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 		}
 	}
 
+	if (vgdev->has_resource_userptr)
+		virtio_gpu_userptr_interval_tree_init(vfpriv);
+
 	virtio_gpu_create_context_locked(vgdev, vfpriv);
 	virtio_gpu_notify(vgdev);
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_userptr.c b/drivers/gpu/drm/virtio/virtgpu_userptr.c
index b4a08811d345..03398c3b9f30 100644
--- a/drivers/gpu/drm/virtio/virtgpu_userptr.c
+++ b/drivers/gpu/drm/virtio/virtgpu_userptr.c
@@ -10,6 +10,92 @@
 static struct sg_table *
 virtio_gpu_userptr_get_sg_table(struct drm_gem_object *obj);
 
+static int virtio_gpu_userptr_insert(struct virtio_gpu_object_userptr *userptr,
+				     struct virtio_gpu_fpriv *vfpriv)
+{
+	if (!userptr->ops->insert)
+		return -EINVAL;
+
+	return userptr->ops->insert(userptr, vfpriv);
+}
+
+static int virtio_gpu_userptr_remove(struct virtio_gpu_object_userptr *userptr,
+				     struct virtio_gpu_fpriv *vfpriv)
+{
+	if (!userptr->ops->remove)
+		return -EINVAL;
+
+	return userptr->ops->remove(userptr, vfpriv);
+}
+
+static uint64_t virtio_gpu_userptr_get_offset(struct virtio_gpu_object *qobj,
+					      uint64_t addr)
+{
+	struct virtio_gpu_object_userptr *userptr = to_virtio_gpu_userptr(qobj);
+
+	return PAGE_ALIGN_DOWN(addr) - PAGE_ALIGN_DOWN(userptr->ptr);
+}
+
+static struct virtio_gpu_object_userptr *
+virtio_gpu_userptr_from_addr_range(struct virtio_gpu_fpriv *vfpriv,
+				   u_int64_t start, u_int64_t last)
+{
+	struct interval_tree_node *node;
+	struct virtio_gpu_object_userptr *userptr = NULL;
+	struct virtio_gpu_object_userptr *ret = NULL;
+
+	node = interval_tree_iter_first(&vfpriv->userptrs_tree, start, last);
+
+	while (node) {
+		struct interval_tree_node *next;
+
+		userptr = container_of(node, struct virtio_gpu_object_userptr,
+				       it_node);
+
+		if (start >= userptr->start && last <= userptr->last) {
+			ret = userptr;
+			return ret;
+		}
+
+		next = interval_tree_iter_next(node, start, last);
+		node = next;
+	}
+
+	return ret;
+}
+
+static int virtio_gpu_userptr_insert_interval_tree(
+	struct virtio_gpu_object_userptr *userptr,
+	struct virtio_gpu_fpriv *vfpriv)
+{
+	if (userptr->it_node.start != 0 && userptr->it_node.last != 0) {
+		userptr->it_node.start = userptr->start;
+		userptr->it_node.last = userptr->last;
+		interval_tree_insert(&userptr->it_node, &vfpriv->userptrs_tree);
+		return 0;
+	} else
+		return -EINVAL;
+}
+
+static int virtio_gpu_userptr_remove_interval_tree(
+	struct virtio_gpu_object_userptr *userptr,
+	struct virtio_gpu_fpriv *vfpriv)
+{
+	if (userptr->it_node.start != 0 && userptr->it_node.last != 0) {
+		interval_tree_remove(&userptr->it_node, &vfpriv->userptrs_tree);
+		return 0;
+	} else
+		return -EINVAL;
+}
+
+void virtio_gpu_userptr_set_handle(struct virtio_gpu_object *qobj,
+				   uint32_t handle)
+{
+	struct virtio_gpu_object_userptr *userptr = to_virtio_gpu_userptr(qobj);
+
+	userptr->bo_handle = handle;
+}
+
 static void virtio_gpu_userptr_free(struct drm_gem_object *obj)
 {
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
@@ -27,6 +113,11 @@ static void virtio_gpu_userptr_free(struct drm_gem_object *obj)
 static void virtio_gpu_userptr_object_close(struct drm_gem_object *obj,
 					    struct drm_file *file)
 {
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+	struct virtio_gpu_object_userptr *userptr = to_virtio_gpu_userptr(bo);
+
+	virtio_gpu_userptr_remove(userptr, file->driver_priv);
+
 	virtio_gpu_gem_object_close(obj, file);
 }
 
@@ -63,9 +154,9 @@ virtio_gpu_userptr_get_pages(struct virtio_gpu_object_userptr *userptr)
 	do {
 		num_pages = userptr->npages - pinned;
 
-		ret = pin_user_pages_fast(userptr->start + pinned * PAGE_SIZE,
-					  num_pages, flag,
-					  userptr->pages + pinned);
+		ret = pin_user_pages_fast(
+			PAGE_ALIGN_DOWN(userptr->start) + pinned * PAGE_SIZE,
+			num_pages, flag, userptr->pages + pinned);
 
 		if (ret < 0) {
 			if (pinned)
@@ -127,6 +218,12 @@ virtio_gpu_userptr_get_sg_table(struct drm_gem_object *obj)
 	return userptr->sgt;
 }
 
+void virtio_gpu_userptr_interval_tree_init(struct virtio_gpu_fpriv *vfpriv)
+{
+	vfpriv->userptrs_tree = RB_ROOT_CACHED;
+	mutex_init(&vfpriv->userptrs_tree_lock);
+}
+
 static int
 virtio_gpu_userptr_init(struct drm_device *dev, struct drm_file *file,
 			struct virtio_gpu_object_userptr *userptr,
@@ -144,6 +241,8 @@ virtio_gpu_userptr_init(struct drm_device *dev, struct drm_file *file,
 	aligned_size = roundup(page_offset + params->size, PAGE_SIZE);
 
 	userptr->start = aligned_addr;
+	userptr->last = aligned_addr + aligned_size - 1UL;
+	userptr->ptr = params->userptr;
 	userptr->npages = aligned_size >> PAGE_SHIFT;
 	userptr->flags = params->blob_flags;
 
@@ -167,13 +266,17 @@ static const struct virtio_gpu_object_userptr_ops virtio_gpu_userptr_ops = {
 	.get_pages = virtio_gpu_userptr_get_pages,
 	.put_pages = virtio_gpu_userptr_put_pages,
 	.release = virtio_gpu_userptr_release,
+	.insert = virtio_gpu_userptr_insert_interval_tree,
+	.remove = virtio_gpu_userptr_remove_interval_tree,
 };
 
 int virtio_gpu_userptr_create(struct virtio_gpu_device *vgdev,
 			      struct drm_file *file,
 			      struct virtio_gpu_object_params *params,
-			      struct virtio_gpu_object **bo_ptr)
+			      struct virtio_gpu_object **bo_ptr,
+			      struct drm_virtgpu_resource_create_blob *rc_blob)
 {
+	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
 	struct virtio_gpu_object_userptr *userptr;
 	int ret, si;
 	struct sg_table *sgt;
@@ -187,6 +290,20 @@ int virtio_gpu_userptr_create(struct virtio_gpu_device *vgdev,
 		       params->size))
 		return -EFAULT;
 
+	mutex_lock(&vfpriv->userptrs_tree_lock);
+
+	userptr = virtio_gpu_userptr_from_addr_range(
+		vfpriv, params->userptr, params->userptr + params->size - 1UL);
+	if (userptr) {
+		*bo_ptr = &userptr->base;
+		rc_blob->res_handle = userptr->base.hw_res_handle;
+		rc_blob->bo_handle = userptr->bo_handle;
+		rc_blob->offset = virtio_gpu_userptr_get_offset(
+			&userptr->base, rc_blob->userptr);
+		mutex_unlock(&vfpriv->userptrs_tree_lock);
+		return STATE_RES_EXISTS;
+	}
+
 	userptr = kzalloc(sizeof(*userptr), GFP_KERNEL);
 	if (!userptr)
 		return -ENOMEM;
@@ -218,6 +335,9 @@ int virtio_gpu_userptr_create(struct virtio_gpu_device *vgdev,
 		(ents)[si].padding = 0;
 	}
 
+	virtio_gpu_userptr_insert(userptr, vfpriv);
+	mutex_unlock(&vfpriv->userptrs_tree_lock);
+
 	virtio_gpu_cmd_resource_create_blob(vgdev, &userptr->base, params, ents,
 					    sgt->nents);
 
@@ -225,6 +345,7 @@ int virtio_gpu_userptr_create(struct virtio_gpu_device *vgdev,
 	return 0;
 
 failed_free:
+	mutex_unlock(&vfpriv->userptrs_tree_lock);
 	kfree(userptr);
 	return ret;
 }
diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index 071f31752721..07c22cf1a9e0 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -196,6 +196,7 @@ struct drm_virtgpu_resource_create_blob {
 	__u64 cmd;
 	__u64 blob_id;
 	__u64 userptr;
+	__u64 offset;
 };
 
 #define VIRTGPU_CONTEXT_PARAM_CAPSET_ID       0x0001
-- 
2.34.1

