Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C0BAD945A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 20:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C39A10E549;
	Fri, 13 Jun 2025 18:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vTrmVLYt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2052.outbound.protection.outlook.com [40.107.212.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A26F10E549
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 18:24:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XIAJr1scJKh4C8v/N+2yoIYRy8kA3bWhxcdR8BFa6iMpdGTfejxGr/Uaj5ZgQEv4mYBdc1tQ+xtbEeAhnn9Hm9Rnwstm++88YAudDDzRB7ePT5T/xciu/DJwfKvBGaUoeLsx22+CtCbFKN+Q6eY6wsIZfoRqJdlmPcFk6wItYM9YOAUwTrKC848g5igCcWxUM+YU9sRiUf3hLWXoFCzS3YMpR/89l4D9Ydwjpsxk68GnAO5A+60ciIbuc7vUlR3nOc2Mil/RyJnjKiJ1X7GKaSZEi8nQ3IqixVQiEwidT2jCnh6g2W092jZrmMuKWKcgf9uwOkf7Fk+/BIHBJZoC9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QjQtoPHDMYKj5KRK60oIsK5GkF8oBgneEOuwHSqKvI=;
 b=TkuC9YMqSrM7uelkPw8b8rpjJk5XmenHEpDAwA6ixJ5YOjDVg+Tbz7OxxFWqBokyrFo3LUsgTYjdobEwgV+SIZ/Fr30fOI0iYj1CLMpcV7QkLOyaik1KyC04xRC222xDt0ruj9WsvG+dLMIBH0DBkd++8o1Hs5zcd0BRsmno3VFQjUdLeg1sEjgKryYFwVopYe2FaVRm46XckePd8ov9gJ1FZIiqnw8vB36xZqXn26NsrHKWUjy4GePV2IC73NT7rGLKeaSnU4YBZ0K/QQ3uis4hWhdOZkpSWma0dVBb5X9EKyqcxMkGnkIxPaICMjNga+W0Z/txtUyw/FuEf2gMiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QjQtoPHDMYKj5KRK60oIsK5GkF8oBgneEOuwHSqKvI=;
 b=vTrmVLYtp46ewnTSgLvAbXprLlUcp4tly7O0mvRSOszvPIYMN5P4i2aZ54dh/Wd3Vf8J7SI2C3emnne+PYX9pAzioJcLMmZnXqktz2lwWEZ/wNwjAuEidZnnH5JfAvw0qgqqV7a4cVvFoDTODS/RoiF4/vL4yyqBFWbQr6FXGzQ=
Received: from DS7PR03CA0174.namprd03.prod.outlook.com (2603:10b6:5:3b2::29)
 by MW3PR12MB4345.namprd12.prod.outlook.com (2603:10b6:303:59::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 18:24:00 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:5:3b2:cafe::65) by DS7PR03CA0174.outlook.office365.com
 (2603:10b6:5:3b2::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Fri,
 13 Jun 2025 18:24:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 18:24:00 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 13:23:51 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <tvrtko.ursulin@igalia.com>, <Felix.Kuehling@amd.com>,
 <David.YatSin@amd.com>, <Chris.Freehill@amd.com>, <Christian.Koenig@amd.com>, 
 <dcostantino@meta.com>, <sruffell@meta.com>, <simona@ffwll.ch>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, David Francis
 <David.Francis@amd.com>
Subject: [PATCH 1/3] drm: Add DRM prime interfaces to reassign GEM handle
Date: Fri, 13 Jun 2025 14:23:35 -0400
Message-ID: <20250613182337.3767389-2-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613182337.3767389-1-David.Francis@amd.com>
References: <20250613182337.3767389-1-David.Francis@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|MW3PR12MB4345:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb5c689-46d1-4a86-a988-08ddaaa777f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Eusf7jMdXA+8RdN4+1VFPjIgfzvZYdgGLwl8lq2N7aFHF2ta4iTi3ID1fX1X?=
 =?us-ascii?Q?225SzozxSWsmN0Z0OGCOyZ9BafvXasYsWpZ6LJcvB5rTSr8mSVW5gLKS/m0s?=
 =?us-ascii?Q?zNRzNvom3rb7pV8ntM+4w2w1AkZM4IiFykhJFwoGMa8hhVss+xoj51wwYLYl?=
 =?us-ascii?Q?BQTdkJg8nYLG9cIf5IcEJWSvoi2XfEqdw5BeBWK90nB1kWbi+bTrV/wBksv4?=
 =?us-ascii?Q?JuAo+4W5qdwjOAvVR/C9qrAnE4eF3wz0bMp4K9SzUvaczQsY4Tp9P24x/kLK?=
 =?us-ascii?Q?KXaC9WgGKyBzszaWIF3TW490OFLBF59BERHwk2MbZVR7WA/dpt9NG6Y2yYlI?=
 =?us-ascii?Q?6J82IaIH53VbM7U60zWMrctRKYwMNkXIiXXuLLwZgwuJEE1iq3nblKsnSFyE?=
 =?us-ascii?Q?ZRQL/RZq8HZCjv7znJQuVt54tppPnWteQrRvh0D10wRFr4S2MhQmwqk4NUMP?=
 =?us-ascii?Q?PBNvLPB3mzFumb54lj9pxMWNxsIrQr5nbdSfNs+NqQ2hS/SfXr24GoiRQ/Re?=
 =?us-ascii?Q?SEEfwMqgaM47+MeJG2xhvllIlaqkxugEMdH7TwXmV0m2FRVMfy2Gi/hRUO2Q?=
 =?us-ascii?Q?WTRaXPT3rbP1c8+C86K40+HWBDWChKZkS1/Vg+d6jfyO7RqTOJ9eQUpKmLQB?=
 =?us-ascii?Q?pwatQ2MVYkWh6Bl63tjl3HUDszmKjDA9sDLAjZmIQAhyVhzUc4R69kvEE42V?=
 =?us-ascii?Q?YxejpLSy81fcRk9TExeaCjygrtyE9joVUyeD5YStJGaIehvXloa3dQ0i6/Ba?=
 =?us-ascii?Q?1JtmZ8LZ2RMD0qnbIkmCYs6Vyt+2HtXsXY7cCE0H/mtOo6GAbP3srraBcteN?=
 =?us-ascii?Q?tXT8KatLJc6h+xiMyyS3Bq9jp5y8ShfR7KkrYDkSJ20X+VnplQhFvRTGlV6z?=
 =?us-ascii?Q?9ezs6hSFv7lAcaALK+2+tBzV3K3DXmoXccUv2h01KGe8VFN4OczTtPI3GbtA?=
 =?us-ascii?Q?z/j9mWFlmHsT1vCeqVbl/9E5C1fX63A32lzWvYRO+5XNzBSLhllxeZ4NQmOU?=
 =?us-ascii?Q?O4shPfgbi957j/tnwHomLJEf0hD02nYo62qixOhUMaB0ZfmDe9CuUHia3crz?=
 =?us-ascii?Q?HS9OdD21bFiJZ10vEmyNRft9CCz+OSIVfL+aqb2CBwqqnH1Nj3zDEB0Ozb2s?=
 =?us-ascii?Q?gITgM3S0m9Cm7BIZGaHgFIDgi1U5AERCCXi6sVHtrqI6HZYCT69dbJ2jSNYT?=
 =?us-ascii?Q?4AQfZjiZUlAVPcJAjNsakmy/17+EEnEm6I1xJFeuPbJZI6BvZMEq8JNNMw7B?=
 =?us-ascii?Q?Halw/MPdFzBpKsB3FavHT/K8QleyWc8jnW5DUpqZpCKlil0qjO61Jujhw4zq?=
 =?us-ascii?Q?7kxIudlJrLxBgoioVgZrebA9Uv0Utd611tUaArePYS5uoVAnyWEyvqX43soc?=
 =?us-ascii?Q?linqo+S3DcvTZ8fmEQhDaJiwlJMPNbVehfHW3NeLYLytefyAm0Gslp6nBYx8?=
 =?us-ascii?Q?d/XRox8E62hqIxAG8+3htoRwHqzuZrKxWLJLSur7RG9MWLOqCqmtoetILvVv?=
 =?us-ascii?Q?ip29meOXo29Q2X/1O6cBmmZuAtr8whLTzQP0?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 18:24:00.4264 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb5c689-46d1-4a86-a988-08ddaaa777f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4345
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
 drivers/gpu/drm/drm_gem.c      | 56 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_internal.h |  4 +++
 drivers/gpu/drm/drm_ioctl.c    |  1 +
 drivers/gpu/drm/drm_prime.c    |  6 +---
 include/uapi/drm/drm.h         | 17 +++++++++++
 5 files changed, 79 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index c6240bab3fa5..31fe2f1d1137 100644
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
@@ -888,6 +893,57 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
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
+	ret = drm_prime_add_buf_handle(&file_priv->prime, obj->dma_buf, args->new_handle);
+	if (ret < 0)
+		goto out_unlock_prime;
+
+	drm_prime_remove_buf_handle(&file_priv->prime, args->handle);
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

