Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1D6A490EF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 06:37:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331E510EC02;
	Fri, 28 Feb 2025 05:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="I1TStnwo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8695210EC02
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 05:37:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZJRGW/QUGo57Obf+alD7HdnNmu+hIUzYAtoAoGhJR9JroxpK4Y0PkqjSMlOIu/d9Buf7ac7PpMrgMLk9Esv4e8/uGjKnaxlUvbGZv778NKjiTEo/GGs2gfLBoed9TUwTEoj6GdwKmbnJkhvGLMNCRHIhkWroAdjlXkSz3XkcrdSvGSYeOr4Y+zx7qd0/cCT8hM1OYBJJ1X3a3+Jn2mims40D26ZqEaPkH+Nft4q6aEzbDBaesZpe1Qirw5CCOUmTn83YUat1OLrsRDu4E/plRnYMi7B6fp8BpbfhudeebS+zhAnRvEqisisFKXZrfqvzApaE7JlwRF/N61Ew/ElMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lv2XWT8YR/I2XLOivXhJ1qMBg0Jz36mtXY3sWiTxH1I=;
 b=Ig8qTY3Y6FfJBHx9SwUpq59Y6TkGcUBZ54AtoGr+dU6PHuUx/AU/jfIDK1bTj4SmSKSt41MhixWjFIVB3oYlKKD7doiibl2zN4SPgti6jgZE137nd3fnw7316Df/0Y8kTOjKcbIei8fXwwUaQ5w4Gb0Kx/CSmW3/x+1CQ6ngGxDFL+0iTgoaPJvGNvzNeF4+O0UcYRvkl4phEXKKgJnCHCvZi3HcN4RokSB3TspY29z80ZBYUTEufrx8Og6OAq5yab6HvF2k0ErZFn3IKsOdt6S+fWc38jSuyeVFRzzX1vhYaX8LcgptcZUpfn9cw7bi9jB4hXnZAHajXThxnsJq8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lv2XWT8YR/I2XLOivXhJ1qMBg0Jz36mtXY3sWiTxH1I=;
 b=I1TStnwoXGQ6rSqXgkkZ9IwRCkAPlrd2VZd/rdns69PFX0bsrwLcS2NddyCHeNTH5ooVRg0RKtagFGeGRHOh4+L0r2HTyh+imsOEIOjI+yGnCcysKCKtpuTMI8ol8KuspJlnFdBGlJ16RF3SBv76kgs09l/q/yBa9OJJ3QrE3Ro=
Received: from BN9PR03CA0113.namprd03.prod.outlook.com (2603:10b6:408:fd::28)
 by SJ0PR12MB7065.namprd12.prod.outlook.com (2603:10b6:a03:4ae::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Fri, 28 Feb
 2025 05:37:36 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:408:fd:cafe::9) by BN9PR03CA0113.outlook.office365.com
 (2603:10b6:408:fd::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.21 via Frontend Transport; Fri,
 28 Feb 2025 05:37:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Fri, 28 Feb 2025 05:37:36 +0000
Received: from jenkins-honglei.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Feb
 2025 23:37:25 -0600
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
Subject: [PATCH v1 3/7] drm/virtio: implement userptr: probe for the feature
Date: Fri, 28 Feb 2025 13:36:46 +0800
Message-ID: <20250228053650.393646-4-honglei1.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|SJ0PR12MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: b70acd4c-47b8-4d42-03d0-08dd57ba01c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|7416014|36860700013|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BcGpf6EYvAGFHwr6r26Y1CoW5nrhVJImtPo9ht6QAXnRJLmRkkwQ6Gw0rNm8?=
 =?us-ascii?Q?vTf8gdl8Tyz4sOiuYnDFboRUtbWrXrCUQ8bLjt/UTOhfppPRFF+RsDKa1xgv?=
 =?us-ascii?Q?2Z/aShbRWppnw+0fhpdG3QEXVu7ZXYbPzYTwukfDLrrt7k4/+khuFZXnBIZr?=
 =?us-ascii?Q?iaERGkvaij2pM/yWW9aNAHGrjURyUv+OIjbPVD8CmywrPmAVwV0db64Qh+6L?=
 =?us-ascii?Q?1xsvjvrsSIFKd7i98QXvJYAnOV+j0IxbMwX/ScmceZFMwMDDA3tUrp3/0CMg?=
 =?us-ascii?Q?rc6LZOQLf/PvrghrHo6HlTfU3DyS2M6wJQxhmHmuH2oNyg7TGIkF/yEdVYxY?=
 =?us-ascii?Q?qPrjL/pXeLotMFAU+14JNPrZtkkeeinULNq9AT4/S2dnJBRMlbTiqgt5FtCQ?=
 =?us-ascii?Q?l1l6x5i3VT3VCM0Ik+Mk6jJBYes0DmOa/52Cmkvf0n3fbVjTan3BP/jCUR/U?=
 =?us-ascii?Q?NjYily3f7nFoJiVww19ykhGMddnmZ26AHL3ej/qhsqPAs+ad0wGhV+VNHrPg?=
 =?us-ascii?Q?GWS+NHqkBZ64I30kGiDUNfD/rWmqxSVX4Cha1jKqjFowSmcLTmHOZb/NLOYv?=
 =?us-ascii?Q?VWZH9xOJEENZlDuWp0MSJ6a2hzHl25bflJND79oo3rigr1x49TCcMlNE4h0A?=
 =?us-ascii?Q?d/AbTsl8RSKy8zdYE7enDgIAZyN4pnrZnr4fFhIG7xj9ZuGIlZmf5jqmEsAK?=
 =?us-ascii?Q?S49WlelLfYBrIZ79socX/z97lr4RTfKQttCBsA7doJO3lslpO0l1gs0HBL1q?=
 =?us-ascii?Q?vuulVSbjc3mzBJbW8fKFDvk3Sy6SVsX+/DloAT8XbYYEIc+U7NywZLpkLYAa?=
 =?us-ascii?Q?ae9QBmJUT6dP7xjeUBFyp0RdEW72Ukp7gtTYUR7JIyRgmF6ir7btOZ1Aia/a?=
 =?us-ascii?Q?5dbpY+9N4cjI8GbiCALwu1VwtXOWsJO88+Ynh0YEd0Bhu3cKOFEWZM9Aqtxs?=
 =?us-ascii?Q?z0zyFBDvBCzFXwYycHjtKn6iYkqqTi5lZFCzIo/EyeujjvUNTlyo4lS7o39H?=
 =?us-ascii?Q?3MUil8MXnf3bZB4bUr6+wkdnkpPhFgCmeMmtxsFS4kSE+vbZKk2HRbHSSGGz?=
 =?us-ascii?Q?RE4kxpdUjJEOwuNo5zqLMUTrEvWavkwnZimAxz/3Rj+Mce68v8Pm+t72zV9A?=
 =?us-ascii?Q?/GEh6T0WPIUSh0LMzkpgNhlb9l1PuF4F4OZorCQyzPRqxHVIVxG5Q00dw/BB?=
 =?us-ascii?Q?Liq2RS8fyn2hS4/cG8lFroOWRLaAF5KJ8pIvUB0Zvt9kGvSkDw0gJHHGWGsG?=
 =?us-ascii?Q?glYF9f+6owx5CNdz0u/OU+DYKPOr6pa0REmau/AO8TS0fZWP9yplfrAzKGnN?=
 =?us-ascii?Q?EdIeBONJ7fh6IT6RNj5Cwm4nGZs36HYvWcx0QxNvGw1MbLkQoFXER3AiecmJ?=
 =?us-ascii?Q?C9vG4OcQ9WU+/YcPsrXUMy/SFGzD7qbzWTwYBsq6G40Qkpu01dWwYzmdB3kf?=
 =?us-ascii?Q?EIGLEyo1bfM0izdEaBAFguXzr0lUOkK152HBFIMBzeanz+qcmZ+je9hen4IR?=
 =?us-ascii?Q?pc0EDrOCTAqDQtewgg0xx9QKpGnvki1h0VfJ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(7416014)(36860700013)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 05:37:36.1035 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b70acd4c-47b8-4d42-03d0-08dd57ba01c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7065
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

Add probe code path for virtio gpu userptr.

Signed-off-by: Honglei Huang <Honglei1.Huang@amd.com>
---
 drivers/gpu/drm/virtio/virtgpu_debugfs.c | 1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c     | 1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h     | 1 +
 drivers/gpu/drm/virtio/virtgpu_kms.c     | 8 ++++++--
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
index 853dd9aa397e..da9fa034db0e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -57,6 +57,7 @@ static int virtio_gpu_features(struct seq_file *m, void *data)
 	virtio_gpu_add_bool(m, "context init", vgdev->has_context_init);
 	virtio_gpu_add_int(m, "cap sets", vgdev->num_capsets);
 	virtio_gpu_add_int(m, "scanouts", vgdev->num_scanouts);
+	virtio_gpu_add_int(m, "blob userptr", vgdev->has_resource_userptr);
 	if (vgdev->host_visible_region.len) {
 		seq_printf(m, "%-16s : 0x%lx +0x%lx\n", "host visible region",
 			   (unsigned long)vgdev->host_visible_region.addr,
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index ffca6e2e1c9a..d79558139084 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -151,6 +151,7 @@ static unsigned int features[] = {
 	VIRTIO_GPU_F_RESOURCE_UUID,
 	VIRTIO_GPU_F_RESOURCE_BLOB,
 	VIRTIO_GPU_F_CONTEXT_INIT,
+	VIRTIO_GPU_F_RESOURCE_USERPTR,
 };
 static struct virtio_driver virtio_gpu_driver = {
 	.feature_table = features,
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 64c236169db8..7bdcbaa20ef1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -249,6 +249,7 @@ struct virtio_gpu_device {
 	bool has_resource_blob;
 	bool has_host_visible;
 	bool has_context_init;
+	bool has_resource_userptr;
 	struct virtio_shm_region host_visible_region;
 	struct drm_mm host_visible_mm;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 7dfb2006c561..3d5158caef46 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -174,6 +174,9 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_BLOB)) {
 		vgdev->has_resource_blob = true;
 	}
+	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_USERPTR)) {
+		vgdev->has_resource_userptr = true;
+	}
 	if (virtio_get_shm_region(vgdev->vdev, &vgdev->host_visible_region,
 				  VIRTIO_GPU_SHM_ID_HOST_VISIBLE)) {
 		if (!devm_request_mem_region(&vgdev->vdev->dev,
@@ -197,11 +200,12 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 		vgdev->has_context_init = true;
 	}
 
-	DRM_INFO("features: %cvirgl %cedid %cresource_blob %chost_visible",
+	DRM_INFO("features: %cvirgl %cedid %cresource_blob %chost_visible %cresource_userptr",
 		 vgdev->has_virgl_3d    ? '+' : '-',
 		 vgdev->has_edid        ? '+' : '-',
 		 vgdev->has_resource_blob ? '+' : '-',
-		 vgdev->has_host_visible ? '+' : '-');
+		 vgdev->has_host_visible ? '+' : '-',
+		 vgdev->has_resource_userptr ? '+' : '-');
 
 	DRM_INFO("features: %ccontext_init\n",
 		 vgdev->has_context_init ? '+' : '-');
-- 
2.34.1

