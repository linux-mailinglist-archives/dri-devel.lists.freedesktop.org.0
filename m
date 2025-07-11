Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8B9B01FB0
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 16:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B259710E295;
	Fri, 11 Jul 2025 14:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WEYQx5ko";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9549F10E286
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 14:54:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8MYUhNw6axIM/o0gm1KtkUwnTHUp1CveQzgRfah2h5Bxyg3NMlbudhIw1mMEHa61Gd301qlERCB2MlcEteS5rMzTgrDAh8X3xxjq8TryXg/kTr+YDMcKKDWieC+NU4EiAF2kzUTMSl7TkxRrbGsRsO0+no5t6WwzQihzzMaHbXwVEAXY3OpFHGgUqPE0t3+ePSUu0fqvL0ioQIopB6u6jEq3vWfN6ggBNKiaPyR0QSg5e4HBQhy8FBihqhd+eYSqfOR22iotrc5etktRbGOdonjOT+M7zZZbwhDVr7cKE3NUIWYpbX7HL1KZpoX6/bILh05emV7maJUMggXtNdfZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1CWYtnSMKhGWxZ1xJA3GRGs293hS+cG2MWYihj0tNo=;
 b=r2vU8e9B+HtkzxXjmBeuYoch/FVs9k8C6KWHw0t4/NUjG2qoMbPTftxMb+zV3b5vIz0kXQs631mBASfZZCoQqmXf2gDEjvSRebeTaKxl72xG35yCChfadcWvLxHGBixvIzre4wmh2GzOBVEEdznm5QzSceobJXuBWjG1m0dpIAn2nzMhFc9/dnqjCNGvjQjtgf66RwIbmuXQKY5XFCi0JEzE7H/mL7dXT+u3lU3er+26eqS8J+pkTqkxGa4Snv4g46cOZwtQU04Y4UzhexnPuPQROHJRTEnGVKp2p1l9R7h4dbOWrDQvXp7HCkcwYvvbBZ/5sSnM6imNNJWPPv5wCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1CWYtnSMKhGWxZ1xJA3GRGs293hS+cG2MWYihj0tNo=;
 b=WEYQx5ko8U3rq54IixCmhsl9hWptPuSy1UMv8T5RuiEN8BZHZbk4irsyBm/vshp7L3ryOS/Ec122Pb/IOTHau3gTqMFwRgDlPfV/YHJCtzDvwpMNgzUUIvrUtzwR67LLHe9zcrWYGvXzKlT/lUMVJ4bC2DMre42prAL3v0nYZRw=
Received: from SJ0PR03CA0332.namprd03.prod.outlook.com (2603:10b6:a03:39c::7)
 by DS7PR12MB5912.namprd12.prod.outlook.com (2603:10b6:8:7d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Fri, 11 Jul
 2025 14:54:02 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::b6) by SJ0PR03CA0332.outlook.office365.com
 (2603:10b6:a03:39c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.25 via Frontend Transport; Fri,
 11 Jul 2025 14:54:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 14:54:02 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 09:54:00 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <tvrtko.ursulin@igalia.com>, <Felix.Kuehling@amd.com>,
 <David.YatSin@amd.com>, <Chris.Freehill@amd.com>, <Christian.Koenig@amd.com>, 
 <dcostantino@meta.com>, <sruffell@meta.com>, <simona@ffwll.ch>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, David Francis
 <David.Francis@amd.com>
Subject: [PATCH 2/2] drm: Move drm_gem ioctl kerneldoc to uapi file
Date: Fri, 11 Jul 2025 10:53:42 -0400
Message-ID: <20250711145342.89720-3-David.Francis@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|DS7PR12MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: b7f75f65-3dac-4632-01a3-08ddc08ac64f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WnjnXGHYjksfdLZZWK+fXAs2eYAM9qu0ma5HIZUYK7NfpchZ2c9qLYTnf9fZ?=
 =?us-ascii?Q?s8YjRPT4ax1hhLttuzGkkIk09iLHUHsr3+jPAm1e+gfhbE9rJE6g8DTExoXR?=
 =?us-ascii?Q?5mMLOCjhkU4ZVcHBrhqZNH2yHawZ+8E8lumXjipApIY9+D+l4F9aBPrtvUmr?=
 =?us-ascii?Q?t/fd+vSquiOUSIZ8Zeoofh9ale838fnj3AVu38BOQ0mvPy87+x9gD62eS0N2?=
 =?us-ascii?Q?r9zImEhBEjsQjbHpzjourS7mwDxCjWVczp9zLc49m6IvJm2JKavjdSqs3CPp?=
 =?us-ascii?Q?jJ8c/t6fI+G7C3Cw+NPqKwxYAJzppRGaNrJJdjsKXIxu1U+ZtpoECCCmf0bJ?=
 =?us-ascii?Q?pJYlPur3VRqFNkP6k91Oa608mP0md1QML+TkYKzToOtIQvR9JrSDKqOHvu/l?=
 =?us-ascii?Q?W6APH4O5HGdZchCmqB8NabAx2ddfRPSVS37dtK520CU+G7xQkjzE64oXSwrq?=
 =?us-ascii?Q?UO8izr19sYYtGmPbSksuouyjpCc+236O/tbJThTeRgrIH2QmFi4O8Dj9yscG?=
 =?us-ascii?Q?oTnXL9bWVtGavej+7+4/OovYMxtzKReL/oAYQovKxE3+Q2esl6Rpuai0Dn+J?=
 =?us-ascii?Q?bZt+v21RmHLY6ydSTASuoMDCT8r6EnOf4mDbUM2IHBF+jI/ncAs1bK9qS5yG?=
 =?us-ascii?Q?yQzUsuncMUUjT2jQG2ajxQK1QatT1LaPa6vqUwIr7lmp0S1fcjoWltPBFqZa?=
 =?us-ascii?Q?u9ZpAcYT352PXZCR5T5m8V+DvO7L1M0LN9jAK3BF8IGBvQMIijRog5VegrTo?=
 =?us-ascii?Q?EZx5xne/+uTNZjVkSjPpEpQBihvaqOKd1tE7VofwBxSUpKN9PlgPHjw1Kewl?=
 =?us-ascii?Q?R5pnOT1R/dEFJSyVIixZY8VVsra9xp9YQ1hXBhtuIZmUCIjkehy3jYMoOKZM?=
 =?us-ascii?Q?yNc0GcD8n4TscgatgulcHPBTq7EA9beqrvw5WQwTzF1rViMkz7NeOver/bxu?=
 =?us-ascii?Q?q69vtJEpeY6IUZFEbErCyu6L8UXhoB2aD8DMo5putQY9Aj4Hy0mBsYJAEwvm?=
 =?us-ascii?Q?QtyF7twi9Jk75JVN86K2Rd4S1w8jbBVd+jEAnOCpPe9I2oNcgy5TOsQRyj7G?=
 =?us-ascii?Q?naYyYivdrqHhIzXNANtFAg9HFzjHr+NpLbz87bGk5vNdvKyuTIJTA6TpKVAg?=
 =?us-ascii?Q?MbsdSD8Lh8NdQVAEpY2ERgCa/qnar0ab+3HzxWXKGqXdJBDjiPFd8+o+eF6b?=
 =?us-ascii?Q?cimwISrlOnF1TsRJ+8O5yXf+u8LlQD8Y0RYhbuoEuIiZ4A4YFStofcgiDTBf?=
 =?us-ascii?Q?DI5XTylTWcyubFCIZW/bHcdmN31rl7U3qC56f/RXvDKkfVL0cvNv23c6HMCp?=
 =?us-ascii?Q?oKPLIkSbD3mJC6mAA9jjGwy/78l9WkfbAXzxtsKY/As+2rd39U2o/d+Zxb6U?=
 =?us-ascii?Q?FGM3iG9rQEf4nPLx2KQbt0RuAQR08GIXEHovk+3KBI3fsVSHmrhjvevjrUFW?=
 =?us-ascii?Q?p1/pa4KYLwGwXyS9/NwJ1h/CQyF6hLjkhSmSx90LPif8ZSauCwlD/QPlysGy?=
 =?us-ascii?Q?lvGOIzWZPqZkZaD7KZ35LaWrdkwCwF6vgUrb?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 14:54:02.0218 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f75f65-3dac-4632-01a3-08ddc08ac64f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5912
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
index 3166230d0119..08778a15eefb 100644
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

