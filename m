Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F711ABF72B
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 16:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F4E10E87F;
	Wed, 21 May 2025 14:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1OhycE3D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A5910E855
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 14:07:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oosh8yqXEy1j1iMqkBsXOQiYHJq6iZGJP7/vk4EzAAZxt9bN6ahSJkKtuIYLhYeyhW1QDVh4BLiFWiseRpnd+cVoqezaFRWlirXWwoirR5zfWzm9hlsaUKzDf2qZpoGahj66WJUD8y3bGDmDAV/g2aIB/6i+36BCs0yAnEn8Ezhas3NWRc1KGZ0f2RWcT/hg5Tj3aYiXS72hYKHs90ArOFVHJbrCUL0MP0S9VGkYsZhBEwfH+fFkrjHzyCL6Y7y6OPCRv6WgorLqGSTUaEUaHpBXxFsvjm5Rx/lKgLA/NQ4NRF+7FGKJkEWcUpSHq/wVC2DqLkUSW8z1nQcNp7GGBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4MLy0owCKykUGkysprHuva/fjSQaujKZdcuzsfPgYs=;
 b=Yvm6RI48wXLGOj5Gx3lmS7MJJrwcc/QRr6Y/qWvSP8DUvxR+o1GWPBgX2b8LcPmFGV0cIOOIib3xZ0avDrRIGpksTmVxNpNmT/vgP6QHwSFScTwzqFk+MR0BOp1zM4z1kBGqB4g949ka3JeNeUX3DIs6e888xbzWVBWIik/9SZImzjstIzOsoO4C8rKFfvnoXFs1W8S5KPP1YtD7RCDCYZiugyGm+/B9EBrL//HnFCVWj1eI+2tM4DzCtB83IGyu2/PDQt72i521WxfYvXf/pUsMp+6ur1NIWjxFNsXmdNHsJm1ZBHajKeoVpPYJft30NoEvRdGSPQYAzL6zNvjTSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4MLy0owCKykUGkysprHuva/fjSQaujKZdcuzsfPgYs=;
 b=1OhycE3DNYIjIiPmv9ep6Aw0yDJhhvH5cKpu6s7Q5onARflrARUQQkWqAflr3E2hzyf5LagoPUb89vp9m79D48/5wZXc69SBAaieWewRSCOxqsmRq5MTFkKVzozdWSIPPchsY1zSe9ZATQuHQIy39YaEUAj4mdhzdiEHEq9epnM=
Received: from BL1PR13CA0242.namprd13.prod.outlook.com (2603:10b6:208:2ba::7)
 by IA1PR12MB8496.namprd12.prod.outlook.com (2603:10b6:208:446::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.35; Wed, 21 May
 2025 14:07:10 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:208:2ba:cafe::94) by BL1PR13CA0242.outlook.office365.com
 (2603:10b6:208:2ba::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.16 via Frontend Transport; Wed,
 21 May 2025 14:07:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025 14:07:09 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 09:07:08 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <tvrtko.ursulin@igalia.com>, <Felix.Kuehling@amd.com>,
 <David.YatSin@amd.com>, <Chris.Freehill@amd.com>, <Christian.Koenig@amd.com>, 
 <dcostantino@meta.com>, <sruffell@meta.com>, <simona@ffwll.ch>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, David Francis
 <David.Francis@amd.com>
Subject: [PATCH 1/3] drm: Add DRM prime interfaces to reassign GEM handle
Date: Wed, 21 May 2025 10:06:47 -0400
Message-ID: <20250521140649.4058526-2-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521140649.4058526-1-David.Francis@amd.com>
References: <20250521140649.4058526-1-David.Francis@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|IA1PR12MB8496:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fa5939b-b71c-4cc8-edaf-08dd9870c6cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JaYciOa07cAmm9UCEFPpu5ZuBHk3RuFhtTXtNv601olXAn1kIWpP5JGGcu/A?=
 =?us-ascii?Q?LGvsmIMAZlYSCFDlh77uMxhmlKcSsTVKJ5YNrUQxHRXa/IC/Q1XW3lemjZFO?=
 =?us-ascii?Q?awILxYm9sKMizvdhnvqU3WXuJg9y0lDbU347HDQ+w3q94642p8rtjyovzDAg?=
 =?us-ascii?Q?oFvwRwQPyBb2IHzaimBAOFTvQMojR4Q5/sL4nhDjeXp/OhHwi9YYcGZWtwb2?=
 =?us-ascii?Q?//yu03IZCyKvlgXSWt6Bnqy2RAVnqxvXmxjLXOyPIylPG9bW6mx1NGX6ePgq?=
 =?us-ascii?Q?gSf+78zfKZXshlmPDCLO/pSfBH9vnQFjD4jBW8yCfZn7f9w8hieRGAQ13EqP?=
 =?us-ascii?Q?53P6hIE9K9kxNKockcu4gubzTkZ8r69AHGfPj3hbwZ06SOkvqOgSPtdXoZLa?=
 =?us-ascii?Q?mAt+ukHZkmcn1woPeJvV4/qm4RWdUZxtaRY/67PeHAF2Mql+APHetk3CMU5e?=
 =?us-ascii?Q?aP74Xfg568FXNd4edV4zhela4WFBWE2UGxzW+Vsn9ccNs624Uru48/4rEQvP?=
 =?us-ascii?Q?g82GjO/e72MRAm94PxwvaCddwZLQ8eg4PNFo9SwXrzASLWzb8kxq/QX+Icxv?=
 =?us-ascii?Q?kVdYz1oO2r0uNPREXzJ4MWWLQ6elX0+sAF/mpQB2PdwCX3sH53nE0Ibh9uV9?=
 =?us-ascii?Q?UD4Ba31VciWY8sxMv180q9nTHVqKrvYRxmgr9YwhYABH0WQ5Mu4vFn176Ppu?=
 =?us-ascii?Q?J7CSBORHY9EahH1fE2arSaGnhMrPXiX/6wPSopChqnH9tyCRWy27S08MiVDL?=
 =?us-ascii?Q?zN5f0tFpNjbtkRfnQwuLeiqOt9R6mXw+92hJYEFpI5YnuE9/xiuB4vJw1icO?=
 =?us-ascii?Q?nLyr08mMMxIj9gB4QamkxxmCAJt87+S1e4acaA0EOIwD0GJ5pt6mseSL6T4+?=
 =?us-ascii?Q?Uerv3Awbmix0X6pi20hEUQjuKwlFssDq7gOhsjc6e1OfFGHFTCTIazQ5bxrc?=
 =?us-ascii?Q?mtT2cRj9nC8ZdZHntAerTMKPFetXDNUKLCo61ru0Eeff5OjE89xYUiiHwRYF?=
 =?us-ascii?Q?fP9yfcmuyr060gggJM8WFlBPzPU6PJ6AS/mqZmaQEruRjpwuWFP72rjOfzUU?=
 =?us-ascii?Q?qrEcGdmgSXETBfWjqg7tPPCrSIf3wwRXpUmr1GddKAd5tD7M6ADXzeNTvuCu?=
 =?us-ascii?Q?PImWnLBHStBmdM4eCLajC9OYflexeDOhVyreVLZaHdtzXWACY/5oA7GdLc/d?=
 =?us-ascii?Q?UNvAgTCByysyyAQKuMe88Gu9+zRl1xavp2wCXyIWV8dHxnwC8DODXsdkO0aw?=
 =?us-ascii?Q?I1MKLjkfZCYaDNK4Izelsw1jYKcn1eedPdWxZKLZrT1V82oDy1JCHPJz71Zm?=
 =?us-ascii?Q?7djuv9S7kBHFV94Ttdcaw+xBB9XOfQyr2aGWkaZwDe6NbsXBh/0jcebmtE3A?=
 =?us-ascii?Q?SqIRF32AFAUFxowZE2KjbOJLSeRHdY4IJAiPaHU5ANlOWu+ECyUhdEtBEo3g?=
 =?us-ascii?Q?4y6Xx6n+y8/Rk5xWqp7SmVJmTQbDNtq6K8ZQh/+12xrvr7iQlhD1HXfo1U1V?=
 =?us-ascii?Q?gAkVN5evolMw7KDafvTRqDAmAr2jbx22FNpK?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 14:07:09.5058 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa5939b-b71c-4cc8-edaf-08dd9870c6cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8496
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
 drivers/gpu/drm/drm_gem.c      | 52 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_internal.h |  4 +++
 drivers/gpu/drm/drm_ioctl.c    |  1 +
 drivers/gpu/drm/drm_prime.c    |  6 +---
 include/uapi/drm/drm.h         | 17 +++++++++++
 5 files changed, 75 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index c6240bab3fa5..d388bbb7a9de 100644
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
@@ -888,6 +893,53 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
 	return ret;
 }
 
+/**
+ * drm_gem_open_ioctl - implementation of the GEM_CHANGE_HANDLE ioctl
+ * @dev: drm_device
+ * @data: ioctl data
+ * @file_priv: drm file-private structure
+ *
+ * find the object at the specified gem handle. Remove it from that handle, and assign it
+ * the specified new handle.
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
+	get_dma_buf(obj->dma_buf);
+	mutex_lock(&file_priv->prime.lock);
+	spin_lock(&file_priv->table_lock);
+
+	ret = idr_alloc(&file_priv->object_idr, obj, args->new_handle, args->new_handle + 1, GFP_NOWAIT);
+	if (ret < 0)
+		goto out_unlock;
+
+	ret = drm_prime_add_buf_handle(&file_priv->prime, obj->dma_buf, args->new_handle);
+	if (ret < 0)
+		goto out_unlock;
+
+	drm_prime_remove_buf_handle(&file_priv->prime, args->handle);
+
+	idr_remove(&file_priv->object_idr, args->handle);
+
+out_unlock:
+	spin_unlock(&file_priv->table_lock);
+	mutex_unlock(&file_priv->prime.lock);
+	dma_buf_put(obj->dma_buf);
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

