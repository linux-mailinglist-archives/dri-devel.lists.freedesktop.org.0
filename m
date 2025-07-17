Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B29B08F96
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 16:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E39710E836;
	Thu, 17 Jul 2025 14:36:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="erlikSql";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140DE10E832
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 14:36:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqzHoXp3RcsyxX1FFQmew334EaOGx11S1gO4WZDF3zcioAbqO7AQ8MjLegXnEZlWMFePPK/L6VvxEK4f3n8GavnhYLLdNg2gUwP0wbJpqDtEGuPZTMfSCk/c34BmR/YbxARFHWWcnyTWC+GZcJX+WENFKZJazQBFuJn5W028jC99+5BiCzB6LGH1teiFlUwDom+dU28bbEACz4blKByCmGCHUl8bF/y3yxXGKvFYgxN+cNO26Vh+DHnJnVh/+c2H0Arhv0+thVhhsDYXZPxsl0cOy1efTZfVR/ZYXKewNKU4Y5WJH4vy/HhYrfdM1B7pOICR7QqEPWzldWk4VY6qQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBhtViD27VFOfZ4hCynEwksIRqoA3TyjEGKLcSEVuVI=;
 b=Zui2BDCobws+UWHqy20ylK7qZHIJm/FR89gc3ewbsl5TaqWcs015WS/R0YDiuJE7TQ+NlIOK6WKSTXNOh3yJzcsfqWbnFEaRN/bKDB/C2nGKLPZPKzkYJ6hJzFDUOfteCh/vlWgRImy5ja6MgQ7jSV8E1uFNm4vddBvG1SLAt9cBeo2Q+2OxkTQqJo1LoKeb24NdOKxxYBxwdPbhYuCkfhHxq9GdmN4//Py+SaLieDQQ5IasVjmLmChhFOh6IQPVjTFdZTmndjg4+bLEKKMXde5ZQ2GqKy50CU3nprJBXzdqsDFgomXeXA9+Yj91eu9qqB4QIbW19i+kmPYLkIX+uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBhtViD27VFOfZ4hCynEwksIRqoA3TyjEGKLcSEVuVI=;
 b=erlikSqlEZ++4M/9QGiRdrxf7vZd3FcXFWMhBkYGy6yPJPfnUm8F8L3GX7UFRsgdmktBj3Tz731IPQR4T3YWipJfqePzOn098kxlGCUbSBhFjfwsT1v/Jaln/bplygPRvM+Jo+fhAmPEbdEfc0m6xJDNn6AKWUKqfQOQVOLSc6M=
Received: from MW4PR04CA0174.namprd04.prod.outlook.com (2603:10b6:303:85::29)
 by MN6PR12MB8565.namprd12.prod.outlook.com (2603:10b6:208:47d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 14:36:16 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:303:85:cafe::22) by MW4PR04CA0174.outlook.office365.com
 (2603:10b6:303:85::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Thu,
 17 Jul 2025 14:36:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 14:36:15 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 09:36:12 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <tvrtko.ursulin@igalia.com>, <Felix.Kuehling@amd.com>,
 <David.YatSin@amd.com>, <Chris.Freehill@amd.com>, <Christian.Koenig@amd.com>, 
 <dcostantino@meta.com>, <sruffell@meta.com>, <simona@ffwll.ch>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, David Francis
 <David.Francis@amd.com>
Subject: [PATCH v3 1/2] drm: Add DRM prime interface to reassign GEM handle
Date: Thu, 17 Jul 2025 10:35:55 -0400
Message-ID: <20250717143556.857893-2-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250717143556.857893-1-David.Francis@amd.com>
References: <20250717143556.857893-1-David.Francis@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|MN6PR12MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cc99af8-39f6-4e51-0e52-08ddc53f48ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7Hl2CyJ1wGyKwpiYMn8YiB3RKKhgFcAI6cDHz5wrEaGx8KJRTvB71AC0Hfn7?=
 =?us-ascii?Q?r0oAm74Hz6RLJKs41C0tSTQoidMGyKwbGHc7aIxbsfsDiPMk+3fmce4EcXry?=
 =?us-ascii?Q?syoSD0MiSy5q7pE4RM4euPGK0bFevcWFUp8h9IkVViUR/Ik0A/84jLutqWOX?=
 =?us-ascii?Q?ip0fp2Ibwrj5LRuuGKW0Z85jwMqm87ZMhGJS1r7fx7c86TUj/8PH+VXSOXyj?=
 =?us-ascii?Q?TUm/xarDZNOyjgMRgEXkbbyKXWbVmaZTWY+74M062kD28Kwq9Ce/RGzx1201?=
 =?us-ascii?Q?3A17R4XRc4QGWwrXjeeu7CpqYix1DtNUHTeCg3+GB99sM/PNsu+biscdGoa4?=
 =?us-ascii?Q?AcHpoUk9QJtDRruD1Uu10kALap4aCHxv6gYk/VxZKXUhBrh5XoVPDG5V5P50?=
 =?us-ascii?Q?/YDIqg7q9sD7EYDhRzNK5Dyt8L6d24wyKhOy5mPWbR1SQ2o/icXVVfdzvWLo?=
 =?us-ascii?Q?p1Sci2nOeFV/4oFzFbgH5y9WOLtmU0eimmArJfPjuXFtt55AH7+sR1Se7fqn?=
 =?us-ascii?Q?PyCzhGw44f2nojnwEA15enWu+f6KWst4rSsjs3K9+TAWVOmxa2ssrLsG85xJ?=
 =?us-ascii?Q?F+v3I3YcOT+N1GGSOukyQV7GSdZ807tbq0BGBOh9jrJKZlVUCnWhzVm8MubR?=
 =?us-ascii?Q?cUJ5FupRGOc26uVdUyA+ybT90UjnBlAvbKlu0+oA16EQJwvz++1H+NQd6bFj?=
 =?us-ascii?Q?GYYuAc7XgJlWoTqdyAGQDpuie9sP493LTnINLLN2APbGny+yPDtx06snCbKu?=
 =?us-ascii?Q?n4xgMvdQX/Tdp5sQyOgYySCAr3fx2dfHTRdvfJW02x8jXXdBd2lccahK7e9Q?=
 =?us-ascii?Q?AfZTzgnSH2HmB/ugMlWUr9TJkfNIqYto07TjktgXEfq51egXdDjnCFFvDwEs?=
 =?us-ascii?Q?8EOmPu3nqE4iR7RwBmcHP3vpOi07F2DOgRNi5PflNoL8DDgplyA+0cnyxbEr?=
 =?us-ascii?Q?H/X7lO4TF0OztLde2TeJGC2Lo44Fc/KB2aJ15zVft7kDk0FHTUYc96dWNcMs?=
 =?us-ascii?Q?igvOQlH8Mg2iAPwbSIUyQqbMq76OJo7VuwFiBxWOnhOnw/klRdyvRtxQ5dd0?=
 =?us-ascii?Q?XtTFwU2JJ2qAoVFCzit8gZFU2es73ahQayuVhU2U6oeGUSfddsy8atq8acPz?=
 =?us-ascii?Q?Eq9tCySsF7hV5d3a3j5zoNfFRg0XH4gCoLbLStnfc21Zjq5YpwXClwypTqFf?=
 =?us-ascii?Q?dv7Dl1Q5AVZBMWjYdiYI3hSQU/aX+X7SckzuQyNiYEbz4wsbrYEK9DEm1zJY?=
 =?us-ascii?Q?6bn9hikXM1HVTN72iK4kPZmzbkh49XIBOxGhZn904XqyLc8lU0e/qbP23vQb?=
 =?us-ascii?Q?/NjrbEbtBq8rYGagJ/0PtFcIQKEoM2XcDO2wctDCQjt3DCDFv/DDBczz5LS9?=
 =?us-ascii?Q?gPRsPiU/Ui2AmmZTiMkt6o/26GDrmWpWtLJkTDhDRNBS+RHSccS4Xxvw0EGw?=
 =?us-ascii?Q?euWVnFbqMqBhsutO2iTrqpVmrsNsXoxNINB32ciqS5n7mthLSXMipF7ISZ/T?=
 =?us-ascii?Q?rhJdgwUPerVUjSjswYe5+QgYt7BBQincvz4X?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 14:36:15.2359 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc99af8-39f6-4e51-0e52-08ddc53f48ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8565
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

The rest of the kernel patches required to enable CRIU can be
found at
https://lore.kernel.org/dri-devel/20250617194536.538681-1-David.Francis@amd.com/

v2 - Move documentation to UAPI headers
v3 - Always return 0 on success

Signed-off-by: David Francis <David.Francis@amd.com>
---
 drivers/gpu/drm/drm_gem.c      | 56 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_internal.h |  4 +++
 drivers/gpu/drm/drm_ioctl.c    |  1 +
 drivers/gpu/drm/drm_prime.c    |  6 +---
 include/uapi/drm/drm.h         | 23 ++++++++++++++
 5 files changed, 85 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index c6240bab3fa5..b1d7b0655cbb 100644
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
@@ -933,6 +938,57 @@ drm_gem_open_ioctl(struct drm_device *dev, void *data,
 	return ret;
 }
 
+int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
+				struct drm_file *file_priv)
+{
+	struct drm_gem_change_handle *args = data;
+	struct drm_gem_object *obj;
+	int ret;
+
+	if (!drm_core_check_feature(dev, DRIVER_GEM))
+		return -EOPNOTSUPP;
+
+	obj = drm_gem_object_lookup(file_priv, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	if (args->handle == args->new_handle)
+		return 0;
+
+	mutex_lock(&file_priv->prime.lock);
+
+	spin_lock(&file_priv->table_lock);
+	ret = idr_alloc(&file_priv->object_idr, obj,
+		args->new_handle, args->new_handle + 1, GFP_NOWAIT);
+	spin_unlock(&file_priv->table_lock);
+
+	if (ret < 0)
+		goto out_unlock;
+
+	if (obj->dma_buf) {
+		ret = drm_prime_add_buf_handle(&file_priv->prime, obj->dma_buf, args->new_handle);
+		if (ret < 0) {
+			spin_lock(&file_priv->table_lock);
+			idr_remove(&file_priv->object_idr, args->new_handle);
+			spin_unlock(&file_priv->table_lock);
+			goto out_unlock;
+		}
+
+		drm_prime_remove_buf_handle(&file_priv->prime, args->handle);
+	}
+
+	ret = 0;
+
+	spin_lock(&file_priv->table_lock);
+	idr_remove(&file_priv->object_idr, args->handle);
+	spin_unlock(&file_priv->table_lock);
+
+out_unlock:
+	mutex_unlock(&file_priv->prime.lock);
+
+	return ret;
+}
+
 /**
  * drm_gem_open - initializes GEM file-private structures at devnode open time
  * @dev: drm_device which is being opened by userspace
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
index 7fba37b94401..e3940b657e16 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -625,6 +625,21 @@ struct drm_gem_open {
 	__u64 size;
 };
 
+/**
+ * struct drm_gem_change_handle - Argument for &DRM_IOCTL_GEM_CHANGE_HANDLE ioctl.
+ * @handle: The handle of a gem object.
+ * @new_handle: An available gem handle.
+ *
+ * This ioctl changes the handle of a GEM object to the specified one.
+ * The new handle must be unused. On success the old handle is closed
+ * and all further IOCTL should refer to the new handle only.
+ * Calls to DRM_IOCTL_PRIME_FD_TO_HANDLE will return the new handle.
+ */
+struct drm_gem_change_handle {
+	__u32 handle;
+	__u32 new_handle;
+};
+
 /**
  * DRM_CAP_DUMB_BUFFER
  *
@@ -1305,6 +1320,14 @@ extern "C" {
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

