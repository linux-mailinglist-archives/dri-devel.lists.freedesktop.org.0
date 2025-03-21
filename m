Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 875D0A6B5A7
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 09:01:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D994C10E6F9;
	Fri, 21 Mar 2025 08:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3N1dOdZx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2068.outbound.protection.outlook.com [40.107.102.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD7D10E6F9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 08:01:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ud7iaS/HW1ghFhd2j64PUXY/v/MYbJu0Gi7akZBwPpgwAK1vu4PqgifapJz90hPmqcSt8aDK5vXEM6iGYj8+5329RALpKwA64ILVCC8rfu4GKb5mIf9kT7UkYIcari6xkEXFQWPIpsYGuawb2TSYnw5l4Yvxay8hY7rCTpkpZPRKdTQfwRV1iScZsLD0XxtGaAoj+d/EtJWQygvEh0q7xfe9qvIkoKab0U4zxrQTU57ff1a4JU+bGm4kRuw9twLFJAuSGtIFxjTon1+rJH/Nib1mscnGYCg28V4fpyfxr+2IhhC1141Sh6pBFsi8m5ejgHRshIbSZnuIHvO2FsQTdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lv2XWT8YR/I2XLOivXhJ1qMBg0Jz36mtXY3sWiTxH1I=;
 b=agPBYlf5FCkS4LAxHoqXQt8FAY9yMgnNEv3+I6yJW0eD7F16Rflx3R8dl6kcalwWvLZ6qKq0mPeLKcxG4F1s/MeZ5HqTUnbFPtkeMKqEMYv222DCIo9s6X14pa+mn4zWHX73xf4gXK0PH1JOzsm7Mue1z8CNG1TAP/PsQLp26+8uReEZHkuSwI+9WZL6wrNNvxOrD1WkmOW7vHNRKl0msD1bNe/lTjgeRb/8tNuRUUI6tKM3DbWkN2tcp3oLf5b7tiCMFHGY2xhChZS3PDe+O5bYzeCI1Xw3sFYSuU+8C7zK8Ia004oAR0JzOLn4TZv34efzaSR1zx5Vc2Fn7sSeXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lv2XWT8YR/I2XLOivXhJ1qMBg0Jz36mtXY3sWiTxH1I=;
 b=3N1dOdZxSzCq5gkWNZ8il7MYq9Jo8ABBGcFNs3kf596I2DjYsV0g0iRn515duEwszYV58QttzpZc0U7Vig0dd+lEQCjLPwtGvvoK0+0MZ0f558mcgc/DX89eSXbyRvCPBZDFaqzD5XlKDLKsETcJNz9ojT5yiwpmMG6rW7x/1SU=
Received: from CH0PR04CA0026.namprd04.prod.outlook.com (2603:10b6:610:76::31)
 by DM4PR12MB6566.namprd12.prod.outlook.com (2603:10b6:8:8d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 08:01:14 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::a3) by CH0PR04CA0026.outlook.office365.com
 (2603:10b6:610:76::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.36 via Frontend Transport; Fri,
 21 Mar 2025 08:01:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Fri, 21 Mar 2025 08:01:13 +0000
Received: from jenkins-honglei.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 21 Mar
 2025 03:01:09 -0500
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
Subject: [PATCH v2 4/7] drm/virtio: implement userptr: probe for the feature
Date: Fri, 21 Mar 2025 16:00:26 +0800
Message-ID: <20250321080029.1715078-5-honglei1.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|DM4PR12MB6566:EE_
X-MS-Office365-Filtering-Correlation-Id: cf39b665-6d6a-40a1-1ca4-08dd684e8cd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mPODQHsjsYVAPwFS44sycek0/ozMyXHFUNkjGRdNvwPE72Xpq7kiVQAORKYi?=
 =?us-ascii?Q?la7Tk2tjlBxbxG7ATjc+SZVwrdwyytA5U2tr4VBj6wAbzUHIN7x3tM7aJ8HW?=
 =?us-ascii?Q?pDh0KBNUkIO9nZgBgb3zytdASZ58obZTv1M5UR/rmsaywBpJfifaStDL+gs+?=
 =?us-ascii?Q?4xFGC/cSApjloG2NcCXomqCrFsAXrvMQtMt8VPmkt2Yy+vKZwsLe1oG+Q4vS?=
 =?us-ascii?Q?5ztmU2B3cJow+XTMtmizj3IAclPsH23p9RFnruKiKwqfZcC0QrquMRVbH6pW?=
 =?us-ascii?Q?r5alvJ14jYdgIReGSCkZRy+gCPQEKhZAwKufxNG2vDsjomERs+Oi1TJm6PoJ?=
 =?us-ascii?Q?fQLdVq9Nf87aywb1VuR9l66DBWQi84LCTXYhm6d638TChxU8ey69g/MFCa9+?=
 =?us-ascii?Q?RW1eYr8smOVVKLQIS9/MzA2hq5OkGW3HhcNi1hjZHBwqlwg3mLB9b+PCGZGC?=
 =?us-ascii?Q?keejC1OLSOSlAt1lN2qi5F/THbFkuxq0IpdLP/I/BmL3HruuX56+iWRx8cEE?=
 =?us-ascii?Q?TsWKguTC+XZ3e7/7B33DhEX3Mtt+1RaJhO0NBAz/noeWN9HtGcTw3wk51UrR?=
 =?us-ascii?Q?3ZId37OxJ8u7Gs3FQETGpoqTnr6WZYCPkXFq6honzZUpbr+AxhresJaQyNae?=
 =?us-ascii?Q?lx7NvrumaiN+BT88t32vu/FkQPdbQQ8LJWukFvl4tIvK2202fyAp/lzwQ89i?=
 =?us-ascii?Q?rrXZMD+ReSswASZ5uWlStLacLZIEGBOEPk6cEcwlOARLnLmLaqEmjPMgd3UD?=
 =?us-ascii?Q?AIL3RmP/QYQho3bjouhJgSQpMHwN3BrzemFYLaxEjA2KscAJBQ6BqFtK3STo?=
 =?us-ascii?Q?oyRd5aFXdr7m1BTq+9ts2IUdGldwwyW7zTaqlAKm2vSYT+qzKeXeoX/pgR0D?=
 =?us-ascii?Q?ud6tFwy7WzhYedli8meiPu2pxPsHUzFV7pFRjtabEEcYlBiTvBQJOYCEIyDx?=
 =?us-ascii?Q?wvyo6huLmIT+lIMJLSi2mclyMrLp+u3+zwcKz2NYOq3g6eYAiix+gCDNQmEL?=
 =?us-ascii?Q?rc8p7IMBUv3BhRJyCVZS+Exz/zqiKW+BZuRbpDX1AmwSa3KN35S3IcKAJC5Z?=
 =?us-ascii?Q?0ZoGgDfO0q1Tzkl5iMp7bauJf+0kOFh6ZyIHsngHO7dw+IA4NW9qzwdFXyTE?=
 =?us-ascii?Q?fVM/rwtGHlOtTPykv0hhPxV/njHEWpx83MgMSZ7gaWvTrJMADQDLjgpteBD8?=
 =?us-ascii?Q?fbaCoQSrZbZqQeLwBlREzVFh27nZpvMki/6/ToTvzNF6XORwOqT1UdrrkisH?=
 =?us-ascii?Q?PvwCym1czwxqzPoaBmNYpTZQBrKMriXMtx9hANCabIDzNK2HXbQYb91tpDgv?=
 =?us-ascii?Q?HP1IQXwKju6Sa2bVL9QFu71MoXNNfai//empj9oU/WOz1jR+i636G/lJw/IG?=
 =?us-ascii?Q?svBFPOIzWlvWPpzCr22Xiq8AL+lMxpdCbXHKVV61ot893Nv55G3F7XzBPRw9?=
 =?us-ascii?Q?Qe12sVYCcxf9X0JLGoV1yjbZWDIITPj2vT4wbeTDBXlNRPVxsQxXz/Q1atkA?=
 =?us-ascii?Q?JuYzmAj2hKjU7gc0potK7QCUo3mTBgSso2y1?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 08:01:13.4989 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf39b665-6d6a-40a1-1ca4-08dd684e8cd4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6566
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

