Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 639B3A490F2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 06:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D047010EC08;
	Fri, 28 Feb 2025 05:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NfEDkCL7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2519110EC0A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 05:37:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MdoQ0NycHpIKYL2hbjKuzl1vaPzXp6HPXSrfiZiE3XPBl4vr6m4Ryb1RBWfmeeq+qH3OvcYi03rp7veTRJrd7QPU/Nz2ZkX0wNtDTqvqwmlx7GzfPUrohOh7LTq4Z+0A52eUKJzSsOr9AdgMfh2sFPY9E9FZgU/pwAFeUbJ3uBwKl9vbD+kkmpvzjLAkOUyRB1pTPKKA22eksv/NKhFnUvjFZMi/q1aOsk/SelZM8X1me44vlD+Ag0qima2UWn3z9zxyphtL+bboQpWiJIU9/PqJqFYWqOztnQFaP3D9JZTd36YoeAK3Zl1nwi6wKFaRequGnZMceor4LL7dHeJ+tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41SxBUQVactU7Qkboa1/S7Jl6jsGp+PgAK2H92oUWPA=;
 b=VocXCgKCO50feSOes6Pplgb7tS/tqpzo0mXbVQlwLHhQyTdrby8/m1RKlNPmRk6ySO5L55Vgj20YC86zH6kUPdnm9kOLD3kbVcu5Frwyi0n5o0Tf6bqcxvEK25qf+TjQ14xPHBVj6gvZ06xWqNo3kMBJS3iuM6H8o6sMKrx3kS2puYvch2ys7LiORh8aonvP653IAyp0rQ70DIKpI4w86NFIwBufZQWeCfCDz0sGBxQziVhn9GWHjP7ovFh1mxx73qkq8cwqQ2S7CIKR8PIvsbOkYZ28Y4/nJpVraHMT2skY+mBNAIr7yBvMmnowydytWPfSgMqJ6F4P4C9TMc5F/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41SxBUQVactU7Qkboa1/S7Jl6jsGp+PgAK2H92oUWPA=;
 b=NfEDkCL7Nj8r0KXYP/6/QOP2GhcFI6hiBp0joeS9jXRaoWLk2vGmMevVAXeFMppTEqBAnB81RP3i1LvIZOu0gAx1bG0Nj5L++IlMVYb7mCtWX0Wh/umTuGoYDbNlCoAT6Q9mzNKfU+ArleI8L4RfhipCnhAjNGerdbHbY0H2jqk=
Received: from BN9PR03CA0906.namprd03.prod.outlook.com (2603:10b6:408:107::11)
 by DS0PR12MB7897.namprd12.prod.outlook.com (2603:10b6:8:146::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Fri, 28 Feb
 2025 05:37:48 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:107:cafe::7e) by BN9PR03CA0906.outlook.office365.com
 (2603:10b6:408:107::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.23 via Frontend Transport; Fri,
 28 Feb 2025 05:37:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Fri, 28 Feb 2025 05:37:47 +0000
Received: from jenkins-honglei.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Feb
 2025 23:37:43 -0600
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
Subject: [PATCH v1 6/7] drm/virtio: implement userptr: add interval tree
Date: Fri, 28 Feb 2025 13:36:49 +0800
Message-ID: <20250228053650.393646-7-honglei1.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|DS0PR12MB7897:EE_
X-MS-Office365-Filtering-Correlation-Id: 4615ff10-94a8-4978-dbf5-08dd57ba08c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|82310400026|1800799024|376014|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PWiOIU9E05JdTa9IpmZpObfF3J3XltBkJ8MWSbubsJxr3jrqG4qqcvl2BgDY?=
 =?us-ascii?Q?OVjPTIZxlHex18Hf7I0BxnSkCjstMpMNoqeguEtY81tHouKC9NPvvFBLldGs?=
 =?us-ascii?Q?8d4bRV2/9HOJHeDXUtiKNmfFOYkw2c8ZeRnTDEdCOxB8qGhvczFokq7cu5ON?=
 =?us-ascii?Q?31GZ8lyfa4luyNNcbwlLmlKjW9f2Ge9Q7ySlZMBHCj6yfkxUhEXKxtFtoAju?=
 =?us-ascii?Q?Q2v5ZMYGO6tVpbV6r/GoagbrJWLfuz5lfcw6xvKK+XMPMqHymMuk3QMuE1Vg?=
 =?us-ascii?Q?lXac0OhLMTEou+2pHKfEtpyM3PCEG//Z8FvN0jOhBsSC/7egBXVgpdhilitT?=
 =?us-ascii?Q?Bbv1mazW+qRUsStY0hydSp49aHfcLbUrkw9/0A5Lq6TYqpXeV7TEQ+TsMqT2?=
 =?us-ascii?Q?KIi0XnTYMHSkqUHyr4chgdRAg8u4jJkQS4HSA2rHaQJA1HLVJxumGX04yc1W?=
 =?us-ascii?Q?OnVeA2YcXUR6IqTAEdAfLeFdnQtvKSB1/3LDQUogwZW/6sv/1Rwf+ace7qgq?=
 =?us-ascii?Q?IyuMt4BF4SkxEKTPTTbhBGMk21wnNrFmlnAK72nkICjWh2xNmvu1wPNL6Pmc?=
 =?us-ascii?Q?nyJPoqxivtgeC6zP3ppSlr7mOQWIQliml9W3LUGUTkvVtnhA2krM4FCnq2KT?=
 =?us-ascii?Q?Dtikah7ibMfPnu3V3F4HNQNRr3ovpECkqlzpJfG5fkXctkGo8ReXmywIKhUt?=
 =?us-ascii?Q?MIBTys9hS/E2wySjCmYd+We/X1VTpOMwChr15UuWk8hQZwyvSdqlilM5TLfX?=
 =?us-ascii?Q?OPTwyTOsyy0aUF0U91TghtRx2eoHnzcfRwR2WavVr2oqSdL2j4yS6CUp2wTN?=
 =?us-ascii?Q?aGEtU/NlK8MGfP1+BQB9kQyfgXWEybSygpyLQaXhJhnDu3IyUs55ABnCyIfv?=
 =?us-ascii?Q?G9p6h+wrfqR7j5bkUJWebTtMB6rk7H35lGMuu6YvdkaVc1lSrCaUAW9q5Bz6?=
 =?us-ascii?Q?tgBjaKoelFAYKA0cehTIIspd2Z+GnKQkq/sKLvW/YvvnY6rDRUiqrdao/qtv?=
 =?us-ascii?Q?0+nM+xe8s9x8gZTi5B6L25VGZyGtN5KT3ZlXmQS1Qu9MtXOWAzeMov8llcxb?=
 =?us-ascii?Q?qe8iSdjIQ2xzORUxX+kio9koK1COd4/2OjmaJtGn4VfLcpYyEV36BJJTwMNH?=
 =?us-ascii?Q?XYaQZMktU99KBmZrl8bWar15rcBFish1+NVWkHS3hYcW9F+mj4j2YuwMVUrP?=
 =?us-ascii?Q?QzAaEXCIHWB6+DdQHwvA1afPB32J+pq3iGEst/YFeyuLENiP1W8/nleXpUxN?=
 =?us-ascii?Q?ozLYNeYJbIwzeKJVMHtNmbFm2zoBvAzo/FjDkpgHtdt1g7kcN+Iqy3A0kQ+C?=
 =?us-ascii?Q?PINmnyG3IXTWA+403SfWOkjUioZzVbhYwDfAOdIGye1OwUp00rW8xufgLhGv?=
 =?us-ascii?Q?uYqpCPB4Q4D7/2j4ynEgGiNBaPDp6iZWTST9GvN/nKlJ0uoD7N9MU9fCvJUB?=
 =?us-ascii?Q?fB1M+G8a6BJqpm9kBDGVvtOD3a0/qQX7QO7VDG4w9KLuZXxqCsrcajGibKwh?=
 =?us-ascii?Q?V8h+72PzHyp/OnJS7FuleJbcp992kR3E+MhR?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(82310400026)(1800799024)(376014)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 05:37:47.8924 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4615ff10-94a8-4978-dbf5-08dd57ba08c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7897
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
index 8a89774d0737..ad1ac8d0eadf 100644
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
 
+	if (vfpriv->context_init & VIRTIO_GPU_CAPSET_HSAKMT)
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

