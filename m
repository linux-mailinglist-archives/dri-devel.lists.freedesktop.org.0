Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D24AB01FAF
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 16:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F410B10E286;
	Fri, 11 Jul 2025 14:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="s1NlO1tW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFE110E295
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 14:54:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I57NwmnjV4fNv5d9OkNlG03OBnryu8xDwMHhhzUOquwsHd02EPjVpDZsrJwEi+mtVRnATJ7f5jciUHKTcUd0aeYIVup/l5yGXllJI4x0C0QW6i27VNKQ4YZoQGRf01DUdKEus4XEwMs2aKrSN8gaq2r1uMmea2AGb+IrATqEv8ovwT7WKa8XjR4jJaqOihRW3IXNBAT2hfdLUwhKgE2NYztp5Z36oUo8tvwb3ZH2na4S+sr8QuKCbTZbxWqx60Ie+m8PtZzJLbAxGf4EFpMkjSpbDatXfSAEjQnjoJ1KnFYMFk8byxwpMOcvWIvDy1JVHTYUmxQOBETD+X80UAmiDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQMRMJZLjwnvRz0mRD4cxe+hhaMVSsB5EtmrqkNK/Ow=;
 b=PakQjcXRVLBuU6/WhwjX31wjIfaqtm14Y6eS+nqdOEFTXqhkuOograyct4pA4B+OrIYY2kU1gtIQSCgG8Wws9U3RtgVOUt+NgScuXe97qvJeNdh0dz+K7tKeQOYmhDH0Bgi2aCM7lR1STG/bwx9dpWdjUnkLANsx2fReaYSHEyDOILaEIN0l5lHaGARwnnEUZOO5xnDFFaPyNUds+ljy2QjvmlhWNW+MrwbMnfDhyAsWmbzg3q5r5ubxNFMgRsnB1x4H0bstmkpMQpdEXeglKJQSnM7JisZsskJKW0DuxZzOI5Dx23GAB03LBnlryZf9ol6s40RPIGMhEYFc2ppI/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQMRMJZLjwnvRz0mRD4cxe+hhaMVSsB5EtmrqkNK/Ow=;
 b=s1NlO1tWeOmcme6gn8Y5EC2DlaPyWaAZMd9n0BG5NAExRgALlwL+qe6u1Px1mN5aVvRXgFFDDwikQFQtLrTMkPs7cxaKbkdzEkoDDVD4ZfwqBbdGkBEDV60EKMKqYiM6D/Nrl+71jTX9m1QKyCBcpZ5bGeGteUmEdvEAv9VshHo=
Received: from SJ0PR03CA0334.namprd03.prod.outlook.com (2603:10b6:a03:39c::9)
 by BN7PPFD91879A44.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6e5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 11 Jul
 2025 14:54:01 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::be) by SJ0PR03CA0334.outlook.office365.com
 (2603:10b6:a03:39c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.26 via Frontend Transport; Fri,
 11 Jul 2025 14:54:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 14:53:59 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 09:53:58 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <tvrtko.ursulin@igalia.com>, <Felix.Kuehling@amd.com>,
 <David.YatSin@amd.com>, <Chris.Freehill@amd.com>, <Christian.Koenig@amd.com>, 
 <dcostantino@meta.com>, <sruffell@meta.com>, <simona@ffwll.ch>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, David Francis
 <David.Francis@amd.com>
Subject: [PATCH 1/2] drm: Add DRM prime interface to reassign GEM handle
Date: Fri, 11 Jul 2025 10:53:41 -0400
Message-ID: <20250711145342.89720-2-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711145342.89720-1-David.Francis@amd.com>
References: <20250711145342.89720-1-David.Francis@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|BN7PPFD91879A44:EE_
X-MS-Office365-Filtering-Correlation-Id: b178deb2-1679-4918-f86e-08ddc08ac4f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1fk3LVk2rZVb5O38yHCe8CCKahJ9vOaIRQCIRv3FhcdpAbLQvivICqnE46T5?=
 =?us-ascii?Q?VKRjLlDISB/Yr6TrIsC1CZK9M31/luuuQ5LvTYgH+m0cTVo1nzW5D5FVnVnt?=
 =?us-ascii?Q?7cf/ie3QOTCQgaC+ONAU9tb/zXOzd/ckgHsnOUXm1rC1CWBjfYxSGzFHo8tm?=
 =?us-ascii?Q?ZBA5MF4hBilwf30acvY3bzpjdk+pLh62VQ7MD6iELuidCSSXlrlUaHt9MeBX?=
 =?us-ascii?Q?kERO1UGHdxFWR2hB6XF+ugXzsY8eJgjOPVy31V1TAExR4A7RWm5qOOeklPnI?=
 =?us-ascii?Q?ElgSZCg3UURYiQJWn4RDM2jtrl39ngOjZpBNmkEpMewFlgCz6AP6FHv3Tm+f?=
 =?us-ascii?Q?AF05cRpQJkExY/bLuNZx1TKfr1REDjMZWsumXXQ3MmWI7tu20yx426HZIvrH?=
 =?us-ascii?Q?5bLDEOhmts26UCFDij1uj4uxtTokA62pOVnX9nF/AtTWcW/t7JIpTo/md+7X?=
 =?us-ascii?Q?U/Wl5vgmLtg90RbS8O9ytpdbnpb1Lwd6msmc11DDHOrcoKIUWOG2jU0eCy2x?=
 =?us-ascii?Q?FPwE9mm64wj+DEGeNqDeLBAwkxhkgz1VYJNwdcbqVv3GJh40d60eggXY4RtL?=
 =?us-ascii?Q?thb/kC793PSMDzFh6UlU50QtOh35V0Xa5y6kaimJRqh7/EuxemE13XMcLgWQ?=
 =?us-ascii?Q?hq9AiYxBVqSjINMRyU38avCgWClIgGdpI6mnm69OdJbhuS+DKvq20lvCtuoe?=
 =?us-ascii?Q?Y88u49DOgK4+jZt6EHDBzKX+W+AU2uOPt1csBAJt6q9kQIkgkEOihzkWG2K2?=
 =?us-ascii?Q?DrhlhC9kWmANR3uXBoAYVhJPw+D2kXP/wvDs7gdPnMqdhW+4jiTOVGeyqqHO?=
 =?us-ascii?Q?WYvdg4jKADVelVePYVpMQY8ktCbyBWipfCkXjIrGxDFkPkQj63LGrDx4978N?=
 =?us-ascii?Q?qhOUZhbuk/XmG6KuoFnQgsuYLJg/WBl04bbfa2XNQ4uiBKM8ru7x9IudAqI2?=
 =?us-ascii?Q?Nqv97kbbJvUx6S7UJLoGT4VgPZru0w06FsHJv6PTcKNxKwYRBOzfi8M6AlVK?=
 =?us-ascii?Q?Lh+ARRhPhrLw+k3+Rug12YWDVvytsxtfpH0rLb2sWco64LvPEYDcpewR8SAU?=
 =?us-ascii?Q?YHcRJB4B2PMUFNv4SeVKVynEHUfOeP47y4Z0sR9s8C+lXyPzB9ALZKtw2iCz?=
 =?us-ascii?Q?Vusx4PvhxW1jFwutMHaa5QhB7vnPtKp7SoVy/7KZEMBt+U+SQ9R0CVTLtpi7?=
 =?us-ascii?Q?0q7F9Un43Dj0Dq3JE9TJq4G2RnXrr53Au0l9IicMF4B/AjLjyxh4jM8Ym0cf?=
 =?us-ascii?Q?FxO+f1oyaCH9B1N9wTzFvaylvHnD6YotoGRuMCeH+DY1r5CC1nTcA7LBKxmQ?=
 =?us-ascii?Q?sJhdNHjVzaD+WWAJUj+j0m2DGxbhqZau1KaE0w6gD1na9t5OojeDyW4oq+oK?=
 =?us-ascii?Q?4g6h4PC+MaTXDi9FJLMmivqOWG/TqDuXqJdSyoP5mbgtAvc8+3OSO6rHmJVP?=
 =?us-ascii?Q?nghNb0y1lbLgK/Z2iHAdwhOiXO2rzJjIEPI9vRbh4UDg5hnNBf46eIe1lQwJ?=
 =?us-ascii?Q?aGdyPVRerk82WDHGPpk0inMnu7KFrA78StY/?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 14:53:59.7336 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b178deb2-1679-4918-f86e-08ddc08ac4f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFD91879A44
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

Signed-off-by: David Francis <David.Francis@amd.com>
---
 drivers/gpu/drm/drm_gem.c      | 54 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_internal.h |  4 +++
 drivers/gpu/drm/drm_ioctl.c    |  1 +
 drivers/gpu/drm/drm_prime.c    |  6 +---
 include/uapi/drm/drm.h         | 23 +++++++++++++++
 5 files changed, 83 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index c6240bab3fa5..3166230d0119 100644
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
@@ -933,6 +938,55 @@ drm_gem_open_ioctl(struct drm_device *dev, void *data,
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

