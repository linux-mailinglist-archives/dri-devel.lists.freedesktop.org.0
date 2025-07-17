Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAA3B08F97
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 16:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8AC10E833;
	Thu, 17 Jul 2025 14:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OVXl83od";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A15D10E838
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 14:36:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ceUMzwszWkboYSk3b9RI/nmdFkNE6tOG9j9DRQfXFTlQhJaB8VNe9Z9X4eUqeDczT8t05pgnniMtYQzBTy+TIAI0YLlhlmcE6LY2XsBZvORJo2OKE4mT6xo8psNksjiFlhknMGUKh0szCuDQASksBs7n/xmCwKA9OorbKVYFQ/TOXBzxrKvjvTQvhEzzhKxIvY84ms3yOtMUYq4fmSy6qzz13bCWg9DYsfr7z43l//fzF6fzf4GuahlFpcB7JtNGxsTJ2oCBFlLKDn7lYWBmwJGetcVBiNs1+56HOk2EvyLaDXMswBwlX84ThR2+MU6cJrJm/SRk8LxyjUFc4v/nhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/DIoltceq69qxtNngFmxpGnVwVlQJ9kh9GwgZXrGsE=;
 b=chEJSPstXkcREfcjvGet8ZBg92iKe+38yCs/MNgtJS9EDugrj+PXP38hHSlv9q5M7rB4ijGXtnYINssVcpweBfRnes+uDOzW8JWTGU/GaByHG08Yb8d/l8zZ5uszvF/eje+FQw8kyFWjPe0+h2b0ghlPG6VjvghtrWnU2oRcntBAMi8CtbFDcrY0Gt7sepo/BaHVPcmSi8tKrJEYfSKxJ4L19mYy16LiRratp8DSL8CZBK5rHyfLcnMsLJ8HFI6tTJQ9VIDcRtugC0BbTl766DGPPi+VGXVg5KFaTN0KO4XlPH1j0w5prlrYUPQjqdg8N7WfPRxQPwneQetX3tmE/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/DIoltceq69qxtNngFmxpGnVwVlQJ9kh9GwgZXrGsE=;
 b=OVXl83odPPtn01dgkACW8LMGWyytTfz4BeOBXDjK8JYTon5lXInkSTsr3W2N2Mz8XYuJ9+rLxQcyEd17o8iYXJRPswftR0xjgVfDdo+Zz9+mQ92aXUH/gWwiVVXeh2/iifmLsqTqSAknw9Yqe3XPLZYgLJGEFiNbB4DImhx9QgY=
Received: from MW4PR04CA0174.namprd04.prod.outlook.com (2603:10b6:303:85::29)
 by IA1PR12MB6626.namprd12.prod.outlook.com (2603:10b6:208:3a2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 14:36:18 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:303:85:cafe::81) by MW4PR04CA0174.outlook.office365.com
 (2603:10b6:303:85::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Thu,
 17 Jul 2025 14:36:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 14:36:17 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 09:36:14 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <tvrtko.ursulin@igalia.com>, <Felix.Kuehling@amd.com>,
 <David.YatSin@amd.com>, <Chris.Freehill@amd.com>, <Christian.Koenig@amd.com>, 
 <dcostantino@meta.com>, <sruffell@meta.com>, <simona@ffwll.ch>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, David Francis
 <David.Francis@amd.com>
Subject: [PATCH v3 2/2] drm: Move drm_gem ioctl kerneldoc to uapi file
Date: Thu, 17 Jul 2025 10:35:56 -0400
Message-ID: <20250717143556.857893-3-David.Francis@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|IA1PR12MB6626:EE_
X-MS-Office365-Filtering-Correlation-Id: 50c64b5e-7e60-4b55-f274-08ddc53f4a8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1sQIWV/dztzc8S9Il1qlW80SkVNqbMAYw0D0YyRZfXcPyf0vnXHS+MeZI2zH?=
 =?us-ascii?Q?Eq9Pnz1NvksCsqbNZERboN4YinafKt+21uTVC5KukL7t5MUwTIwuCFEZeHh6?=
 =?us-ascii?Q?VxsT0tJ416eh0CVlzhoWDzmI25yz26691kUd3k6CHw7EFjMzht1xdLOoqccn?=
 =?us-ascii?Q?y9OUqRQbDGwOea9vHxuBsq+F2UTS9iwcNXFRiSu9699sig81hStoQTdL7vtJ?=
 =?us-ascii?Q?sCsuvRgJixKiP9PNsbCNaRr/CPJ//6VoflNo8fdLrHV/GIGF1YmBZcEgFE6s?=
 =?us-ascii?Q?xxnwL+Zj7kb4oXtCDK+Ndm4zyRVfQKiKjmGzt9fU9PjTtDizL/p5O7opeGu3?=
 =?us-ascii?Q?Go02VS6HCq1M/Na+lHDPEgIxqJgB7cWGW2nyQYYCIUV1Ya4ySORqGdOe0v1Y?=
 =?us-ascii?Q?24GR4DagSE2b7uaHg7sZyU/4+lfSJWfaIrUl+flrD9FDTmaxffLZXVLYGeLS?=
 =?us-ascii?Q?NOudmEAhbtrsA6eoKJk/dn6qLXr4pKyCztJGpoEER1fPAd7a6jQXFJEBvfNa?=
 =?us-ascii?Q?O8+Zf3bUg02uy5+uDIB8oayOlzAc8DstHfrT6QmUwRmg09nY20QkgkJomJKH?=
 =?us-ascii?Q?m+5yWnh33cK8l93jrlQjwSXF/Kf+Hcx3XQo9NflHjOPMuKTeF/iiq/kBt+XN?=
 =?us-ascii?Q?JcNZWM0QM4qu1ocv/iyVxku9aeesS5WEQDJoh1DbC3BlbmZZhtxmrqQxtDfi?=
 =?us-ascii?Q?qhGQtINmRmJiCpDkVonOOQOs0Lh1CfpfhoY0RaKsFEedze+62oZ9C5zsCXXk?=
 =?us-ascii?Q?WQ23R3GJsrB6nkC35SYIAA5afuzEl65X5vSwAmkQaTZpJgZkNNEzCJRnl+ND?=
 =?us-ascii?Q?CdL3XM/jRSdbfXz23sXVxI8UhAIoWcoRnenAMTa9hobMaWRpeH36osds9tEQ?=
 =?us-ascii?Q?mxqSauJoAHbpZSLmcI06M4LPG7paOFk1yx1dtl7Bg0UURaBH/ntNf8ehSglf?=
 =?us-ascii?Q?EqaJalKUPtg8udBvxgs6C1LQJbamsRNC1h46o8L9xAIvxD9+tEGxlum6nRmo?=
 =?us-ascii?Q?XYWXggAAq+jn9s205G5rSN2H1MdwIjrcGlDl4dsSUxzM48qSqMtJ2xVkP8Q6?=
 =?us-ascii?Q?KO2j/rut3l4I4/ajufPkNX94HwaRuygaSKVoXw8Q7N5FTd7Ig9WHXRPS2X/m?=
 =?us-ascii?Q?eisSl7zKp4MSPG3hMJquLHBtoxmHNshVvLeueyk8amQIsstQNLCXLMxUpM9Q?=
 =?us-ascii?Q?gvj9HY51MZ8Zm9z/KTup8u33RGX90fzdU3c3ZW4mX9xmKn6kFQSZRVWCE6C1?=
 =?us-ascii?Q?5/SGtZbCn7MYPaAhFSL6pPR4/4nAb+8QzFCrXneXRyJernU+GXCaq+jvgbJA?=
 =?us-ascii?Q?GNNC+M2bUtbln0t/e1lUOQcyWOdYRLo81FuiM9diS3CAmoT3CdzjscjwMh1B?=
 =?us-ascii?Q?Omz8dvg7EAC0BgjrUFq+sdm4Z7BpYBxGQ4PIHIm5/qwR5mdIrpIPqyWqZ4us?=
 =?us-ascii?Q?N9jkNgaWGhCgHpI0yibKtvXSN5bzSxUM67rc8YXZQtq9unD2pd2US8PXSZE1?=
 =?us-ascii?Q?TJTe6ZtGzcLKBGkfeHSVFHbMJZtG2r8X0a68?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 14:36:17.9546 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c64b5e-7e60-4b55-f274-08ddc53f4a8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6626
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

The drm_gem ioctls were documented in internal file drm_gem.c
instead of uapi header drm.h. Move them there and change to
appropriate kerneldoc formatting.

Signed-off-by: David Francis <David.Francis@amd.com>
---
 drivers/gpu/drm/drm_gem.c | 30 -----------------------------
 include/uapi/drm/drm.h    | 40 +++++++++++++++++++++++++++------------
 2 files changed, 28 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index b1d7b0655cbb..2610812af95e 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -820,14 +820,6 @@ long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
 }
 EXPORT_SYMBOL(drm_gem_dma_resv_wait);
 
-/**
- * drm_gem_close_ioctl - implementation of the GEM_CLOSE ioctl
- * @dev: drm_device
- * @data: ioctl data
- * @file_priv: drm file-private structure
- *
- * Releases the handle to an mm object.
- */
 int
 drm_gem_close_ioctl(struct drm_device *dev, void *data,
 		    struct drm_file *file_priv)
@@ -843,17 +835,6 @@ drm_gem_close_ioctl(struct drm_device *dev, void *data,
 	return ret;
 }
 
-/**
- * drm_gem_flink_ioctl - implementation of the GEM_FLINK ioctl
- * @dev: drm_device
- * @data: ioctl data
- * @file_priv: drm file-private structure
- *
- * Create a global name for an object, returning the name.
- *
- * Note that the name does not hold a reference; when the object
- * is freed, the name goes away.
- */
 int
 drm_gem_flink_ioctl(struct drm_device *dev, void *data,
 		    struct drm_file *file_priv)
@@ -893,17 +874,6 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
 	return ret;
 }
 
-/**
- * drm_gem_open_ioctl - implementation of the GEM_OPEN ioctl
- * @dev: drm_device
- * @data: ioctl data
- * @file_priv: drm file-private structure
- *
- * Open an object using the global name, returning a handle and the size.
- *
- * This handle (of course) holds a reference to the object, so the object
- * will not go away until the handle is deleted.
- */
 int
 drm_gem_open_ioctl(struct drm_device *dev, void *data,
 		   struct drm_file *file_priv)
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index e3940b657e16..e512da8f3baf 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -597,31 +597,47 @@ struct drm_set_version {
 	int drm_dd_minor;
 };
 
-/* DRM_IOCTL_GEM_CLOSE ioctl argument type */
+/**
+ * struct drm_gem_close - Argument for &DRM_IOCTL_GEM_CLOSE ioctl.
+ * @handle: Handle of the object to be closed.
+ * @pad: Padding.
+ *
+ * Releases the handle to an mm object.
+ */
 struct drm_gem_close {
-	/** Handle of the object to be closed. */
 	__u32 handle;
 	__u32 pad;
 };
 
-/* DRM_IOCTL_GEM_FLINK ioctl argument type */
+/**
+ * struct drm_gem_flink - Argument for &DRM_IOCTL_GEM_FLINK ioctl.
+ * @handle: Handle for the object being named.
+ * @name: Returned global name.
+ *
+ * Create a global name for an object, returning the name.
+ *
+ * Note that the name does not hold a reference; when the object
+ * is freed, the name goes away.
+ */
 struct drm_gem_flink {
-	/** Handle for the object being named */
 	__u32 handle;
-
-	/** Returned global name */
 	__u32 name;
 };
 
-/* DRM_IOCTL_GEM_OPEN ioctl argument type */
+/**
+ * struct drm_gem_open - Argument for &DRM_IOCTL_GEM_OPEN ioctl.
+ * @name: Name of object being opened.
+ * @handle: Returned handle for the object.
+ * @size: Returned size of the object
+ *
+ * Open an object using the global name, returning a handle and the size.
+ *
+ * This handle (of course) holds a reference to the object, so the object
+ * will not go away until the handle is deleted.
+ */
 struct drm_gem_open {
-	/** Name of object being opened */
 	__u32 name;
-
-	/** Returned handle for the object */
 	__u32 handle;
-
-	/** Returned size of the object */
 	__u64 size;
 };
 
-- 
2.34.1

