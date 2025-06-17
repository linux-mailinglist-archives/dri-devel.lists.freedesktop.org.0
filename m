Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B257ADDC9D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 21:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB6110E10D;
	Tue, 17 Jun 2025 19:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pU7/GKy9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6E910E10D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 19:45:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJ+/G0gr06BIlx5cJSmWyoxL7pixw3v3Z8cIby1gdMgz2pEf9khS0L3GcdaHpA0FsFxEH/BSMHQ5M/KjeyAMLPsCdTuF+kMjbe18orbuSQihlOS8Mp6c/bJUi8FhyT9VEVwLXUzsZHV5yjboGDwb1+4AegR50qyhtXIrQhpMUpm/RJdiBefnhCBi78n2R24DoP6S7Nma+yoTHVTcdqTUZMuqKUYmQMifxXCxwNa9KGPOb9SBLE/7h6D9e2+0+LiYuWfX6ZqB/3MI4gXHJlzkKvCPdFWryTrCDNlwmTDuGnwer4wa98+3nQbnO2FzHDLiMqIcmEX6Se7hjscqvvvfTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcfaOygMwj0q+I/HAwNQSs3K6jtRHl6ec/4Hu1wKWBg=;
 b=mdSmzVFB7bF0LglKERSEFjN3UwpPOc+aHFuEWhQwOZvukBwHMKwNaXpXMVjU7rGNU8e9qmhRU/eS/EE2vDVUfNq5593l2osRBjfaLU6fUzY1ynz1fLrqGHzq7UV3hfEOvQfa7stGE9nZzDu1I8saxSQN+BKKMmb4tmMOmYdFSTv41yxjH0ZjIRZRLy8Vdw8DeQO9E9H7Gm0935sfmsks4g9TG4iWOt8nfogb3Z5fT7GnOCg/xmMVurmjqh0dS9dzajF5AC4wpqZk+Y6kFxHU5Rookv/r2Ov3ZCqSwGDddb6bNhN54PaGoF2QPId6NhaEsDYu2LhncCprPD6inF7vaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcfaOygMwj0q+I/HAwNQSs3K6jtRHl6ec/4Hu1wKWBg=;
 b=pU7/GKy9cvEcgNjNAHYJBktLdmFA1Sx0Ql7bBpTGiWWYUi8sCVg7gp2QkLuwwEig4EVQt9kwuLth/tdv215rVw1ci3W6/scMiP091XwjFIet2pNg4K13Ntz+om/1K7/Vt8cRPRr2F2HHuZ/m/REBUg4ywSt4TrhXA2TWGVTaoXU=
Received: from CH0PR07CA0024.namprd07.prod.outlook.com (2603:10b6:610:32::29)
 by SA1PR12MB6970.namprd12.prod.outlook.com (2603:10b6:806:24d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Tue, 17 Jun
 2025 19:45:55 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:32:cafe::66) by CH0PR07CA0024.outlook.office365.com
 (2603:10b6:610:32::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Tue,
 17 Jun 2025 19:45:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 19:45:55 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 14:45:54 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <tvrtko.ursulin@igalia.com>, <Felix.Kuehling@amd.com>,
 <David.YatSin@amd.com>, <Chris.Freehill@amd.com>, <Christian.Koenig@amd.com>, 
 <dcostantino@meta.com>, <sruffell@meta.com>, <simona@ffwll.ch>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, David Francis
 <David.Francis@amd.com>
Subject: [PATCH 1/4] drm: Add DRM prime interfaces to reassign GEM handle
Date: Tue, 17 Jun 2025 15:45:33 -0400
Message-ID: <20250617194536.538681-2-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617194536.538681-1-David.Francis@amd.com>
References: <20250617194536.538681-1-David.Francis@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|SA1PR12MB6970:EE_
X-MS-Office365-Filtering-Correlation-Id: ffb18c5f-c9af-4f25-c1c1-08ddadd79317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8UZoec7wLEK8bZwKroaWrKgGXOipI3j2S6CO0cPCd0ygu3l1qJVIe9/L+6NG?=
 =?us-ascii?Q?vs+W8Bl1NSTwKT1EOumexWtAWClFzHtEur52Ot/Oe/XtTZgd6jovROz4cYnB?=
 =?us-ascii?Q?Y6Woiq3yo5RLgsOC33J6vwQkhzEMRhYDkzeEl8xHPkKUxU7B23fqzdq4+zDT?=
 =?us-ascii?Q?jgaCxYc+ZBRdaIyyTMpEJ5MdClKgWY8G20VRitp8Kk9iljM2DcklpBAEo5X/?=
 =?us-ascii?Q?XHndrtwdx7XabEqkNTNI+e0Ra5blwXhLq8leUuSTrLbjfOmliXnj5R9b3YEg?=
 =?us-ascii?Q?VLJL9wOWT0BzUw1rqRpzQ9s7OIvsZwr5dLJRUCItHM7wPkcn/xsK0qbYFVSm?=
 =?us-ascii?Q?+X9UMiyoxe9kWQfILTmlSG9v4B5fz+ZAuqZ1t+ZuWJs1m/04FTwp9UrSbIMR?=
 =?us-ascii?Q?gPfvhjfkWzjhhpPpFiw2agGEzxaYC2+m9sjx4ypJA0Prv3lk7cfNaXD1n6dR?=
 =?us-ascii?Q?YsschgIxDxMZpA5SPL9EIy/i2cBYaqbioc9bS8+h5sdgt+KsZjN9nqhKOIn6?=
 =?us-ascii?Q?8DWKGBUp+GgTENC8FyeuhiBkZZwgPiHOTf24k7tRFiBCKz1Mri53ibpLpjlz?=
 =?us-ascii?Q?whnt8EizQpDHu6+LLkadNQVP9L8hTi+TpWUrcQHSmCnKS/B4l8IxWHYZ7sCX?=
 =?us-ascii?Q?3PH9vlUX/n3ww1EVquUxaeKeAT3boCQVw8hCwyUif8BJpLCn8omONlf/O2Nv?=
 =?us-ascii?Q?eN4ezy52n2jT/g0A1c3KqNmfT+nLrqxSNYIXQYUhJm6NzGB7T5TYi5rc/7Bg?=
 =?us-ascii?Q?j+KC7ytv9SkW0Tif5AYNzlF4/w+/TzKKga9cot79xjzQgEdAjDQrorG6f6fa?=
 =?us-ascii?Q?hmZb7uKSWd5oep/BrBsbJRh631t1A/LVonARQQLDOMvgljHPm+127LESZ0Sb?=
 =?us-ascii?Q?Z5MK4TE/q7wR0vMZV8BDIUqV6CYP54GpdSyuO1cF5qLV8pTuqUkvovydK2w8?=
 =?us-ascii?Q?ts8pBKH252bba21lpIwbT1nJKAL3nlz0Lyqqve1tLV4vGYV6paYCAdxxApSq?=
 =?us-ascii?Q?XN9WUy3IQntlpPVtddncgkt28eBj8Qmv5W7QMqtO7E/esmMClNmwGiJJDXbg?=
 =?us-ascii?Q?LvcBylsPPYUl0wjOhlT+8qvN084E6uwEzZOCeobLOGiDaNIk39jQKutWcUEk?=
 =?us-ascii?Q?wSryu1Lxwa0ASZAJntHs5ddIPlxRaZOy93w/Iw62uaJ1cqqJOqGjTjVVvsMu?=
 =?us-ascii?Q?I47ENc7cI8pt6Dsk5rwVERx4EuNp274MSOQkD2AHEcxYgO66zppw0TKukSA3?=
 =?us-ascii?Q?Kjssi2OfpxYZMloYuW+/Wp+Yli3VswiEyd+uMeiGKUx48b+JrdvItgUQma8l?=
 =?us-ascii?Q?U9ktWHiFdMZUz8J2qOTuRuebcjVjlDi0N1ND89k0FHjvhXEgvtoZJLrRpyyI?=
 =?us-ascii?Q?WlRxXbGHQSeuosqLyzxQkMyJFeYKQLm8jmTxAqOEQKyt6HgNpy310dT3ZOuj?=
 =?us-ascii?Q?p7NclO7s7xF3IKAl6dveCSahwH2+eNvs28SS8jcpmdW9n8ScePdYr5d7LX/F?=
 =?us-ascii?Q?OoEo08dYUKpXnz8vo/ugO66RjR6OcZ8r91Zb?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 19:45:55.3312 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb18c5f-c9af-4f25-c1c1-08ddadd79317
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6970
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

CRIU restore of drm buffer objects requires the ability to create
or import a buffer object with a specific gem handle.

Add new drm ioctl DRM_IOCTL_GEM_CHANGE_HANDLE, which takes
the gem handle of an object and moves that object to a
specified new gem handle.

This ioctl needs to call drm_prime_remove_buf_handle,
but that function acquires the prime lock, which the ioctl
needs to hold for other purposes.

Make drm_prime_remove_buf_handle not acquire the prime lock,
and change its other caller to reflect this.

Signed-off-by: David Francis <David.Francis@amd.com>
---
 drivers/gpu/drm/drm_gem.c      | 58 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_internal.h |  4 +++
 drivers/gpu/drm/drm_ioctl.c    |  1 +
 drivers/gpu/drm/drm_prime.c    |  6 +---
 include/uapi/drm/drm.h         | 17 ++++++++++
 5 files changed, 81 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index c6240bab3fa5..631cbf9e1e2b 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -282,7 +282,12 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
 	if (obj->funcs->close)
 		obj->funcs->close(obj, file_priv);
 
+	mutex_lock(&file_priv->prime.lock);
+
 	drm_prime_remove_buf_handle(&file_priv->prime, id);
+
+	mutex_unlock(&file_priv->prime.lock);
+
 	drm_vma_node_revoke(&obj->vma_node, file_priv);
 
 	drm_gem_object_handle_put_unlocked(obj);
@@ -888,6 +893,59 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
 	return ret;
 }
 
+/**
+ * drm_gem_open_ioctl - implementation of the GEM_CHANGE_HANDLE ioctl
+ * @dev: drm_device
+ * @data: ioctl data
+ * @file_priv: drm file-private structure
+ *
+ * Change the handle of a GEM object to the specified one.
+ * The new handle must be unused. On success the old handle is closed
+ * and all further IOCTL should refer to the new handle only.
+ * Calls to DRM_IOCTL_PRIME_FD_TO_HANDLE will return the new handle.
+ */
+int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
+				struct drm_file *file_priv)
+{
+	struct drm_gem_change_handle *args = data;
+	struct drm_gem_object *obj;
+	int ret;
+
+	obj = drm_gem_object_lookup(file_priv, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	if (args->handle == args->new_handle)
+		return 0;
+
+	mutex_lock(&file_priv->prime.lock);
+	spin_lock(&file_priv->table_lock);
+
+	ret = idr_alloc(&file_priv->object_idr, obj, args->new_handle, args->new_handle + 1, GFP_NOWAIT);
+	if (ret < 0)
+		goto out_unlock_table;
+
+	spin_unlock(&file_priv->table_lock);
+
+	if (obj->dma_buf) {
+		ret = drm_prime_add_buf_handle(&file_priv->prime, obj->dma_buf, args->new_handle);
+		if (ret < 0)
+			goto out_unlock_prime;
+
+		drm_prime_remove_buf_handle(&file_priv->prime, args->handle);
+	}
+
+	spin_lock(&file_priv->table_lock);
+	idr_remove(&file_priv->object_idr, args->handle);
+
+out_unlock_table:
+	spin_unlock(&file_priv->table_lock);
+out_unlock_prime:
+	mutex_unlock(&file_priv->prime.lock);
+
+	return ret;
+}
+
 /**
  * drm_gem_open_ioctl - implementation of the GEM_OPEN ioctl
  * @dev: drm_device
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index b2b6a8e49dda..e9d5cdf7e033 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -85,6 +85,8 @@ int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 
 void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv);
 void drm_prime_destroy_file_private(struct drm_prime_file_private *prime_fpriv);
+int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
+			     struct dma_buf *dma_buf, uint32_t handle);
 void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
 				 uint32_t handle);
 
@@ -168,6 +170,8 @@ int drm_gem_close_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file_priv);
 int drm_gem_flink_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file_priv);
+int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
+				struct drm_file *file_priv);
 int drm_gem_open_ioctl(struct drm_device *dev, void *data,
 		       struct drm_file *file_priv);
 void drm_gem_open(struct drm_device *dev, struct drm_file *file_private);
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index f593dc569d31..d8a24875a7ba 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -653,6 +653,7 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
 	DRM_IOCTL_DEF(DRM_IOCTL_GEM_CLOSE, drm_gem_close_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF(DRM_IOCTL_GEM_FLINK, drm_gem_flink_ioctl, DRM_AUTH),
 	DRM_IOCTL_DEF(DRM_IOCTL_GEM_OPEN, drm_gem_open_ioctl, DRM_AUTH),
+	DRM_IOCTL_DEF(DRM_IOCTL_GEM_CHANGE_HANDLE, drm_gem_change_handle_ioctl, DRM_RENDER_ALLOW),
 
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETRESOURCES, drm_mode_getresources, 0),
 
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index bdb51c8f262e..1f2e858e5000 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -93,7 +93,7 @@ struct drm_prime_member {
 	struct rb_node handle_rb;
 };
 
-static int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
+int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
 				    struct dma_buf *dma_buf, uint32_t handle)
 {
 	struct drm_prime_member *member;
@@ -190,8 +190,6 @@ void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
 {
 	struct rb_node *rb;
 
-	mutex_lock(&prime_fpriv->lock);
-
 	rb = prime_fpriv->handles.rb_node;
 	while (rb) {
 		struct drm_prime_member *member;
@@ -210,8 +208,6 @@ void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
 			rb = rb->rb_left;
 		}
 	}
-
-	mutex_unlock(&prime_fpriv->lock);
 }
 
 void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv)
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 7fba37b94401..84c819c171d2 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -625,6 +625,15 @@ struct drm_gem_open {
 	__u64 size;
 };
 
+/* DRM_IOCTL_GEM_CHANGE_HANDLE ioctl argument type */
+struct drm_gem_change_handle {
+	/** Current handle of object */
+	__u32 handle;
+
+	/** Handle to change that object to */
+	__u32 new_handle;
+};
+
 /**
  * DRM_CAP_DUMB_BUFFER
  *
@@ -1305,6 +1314,14 @@ extern "C" {
  */
 #define DRM_IOCTL_SET_CLIENT_NAME	DRM_IOWR(0xD1, struct drm_set_client_name)
 
+/**
+ * DRM_IOCTL_GEM_CHANGE_HANDLE - Move an object to a different handle
+ *
+ * Some applications (notably CRIU) need objects to have specific gem handles.
+ * This ioctl changes the object at one gem handle to use a new gem handle.
+ */
+#define DRM_IOCTL_GEM_CHANGE_HANDLE    DRM_IOWR(0xD2, struct drm_gem_change_handle)
+
 /*
  * Device specific ioctls should only be in their respective headers
  * The device specific ioctl range is from 0x40 to 0x9f.
-- 
2.34.1

