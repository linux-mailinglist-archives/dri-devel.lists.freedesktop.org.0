Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7470C50FE0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 08:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B80510E6C5;
	Wed, 12 Nov 2025 07:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="akp0UnFK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012044.outbound.protection.outlook.com [52.101.53.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A6910E6C6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 07:46:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E5K5xgTCkz51U6As/T9luhA/keYLN3AnDcYW0UdKcYwxjDajOVukV08MoTv96xbKTOHg7bPQvFZLpo50fRelqVKL4022RWIbF4unluQjO2UOL7ZMHY0XsEGImcOjTTdHQaXTliPPBFQEhvv1u5fA5sxOIE1zwMX6Rf0rjvZQcf5u5FXKnJqfCSeqKZS7W0GNTWSKpHIT9Dk1NodIQrtYb63gQCV2MXTDsmZ5xrKGByfT74h+MlqzeFL8+JUamlVLWkGG73AhsjVTu6zhUGDA5r9OQV/65wyX5jJ1TedBTvWksWwhoKm14J0smkxrxTsDYbt1GetNhiZRZvBCQrFzcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plm8iN096WmQkBgqr7You9f9FK4VtanaYNJcQyyemgQ=;
 b=QZc24sNdBAv/Pb2p31ie4OLLHE7cy6WtTVPsRHpqZ42NPvcNcIaxTNFVoHmEq3rp8kXIskQKheXORuXd7IWyXTM2UZG6C6BE9vjz1OesDXjywX9swLNDxwEaGcSJy2U+wUoc6KfdH5LymhMTuhb2M4brFguxJij7i7WDavWTm3NQ526dft0d7nbeZTM9wcV0NEqKH3a3aXOSPnSS+Pw/ioeyURm/IUN5NsTxYS5GUPvQ7y4moJQhlcp7yjYWWXWFvOr+EfYQfThXWy3md0hJbf9+gT8nsyJz2lSDiLrwARHHdaLeCBLtG4bLfMZ8qwcJJ/+VUELzb5AjfEeNHmmW8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plm8iN096WmQkBgqr7You9f9FK4VtanaYNJcQyyemgQ=;
 b=akp0UnFKGgO6UWiDrTwRENPiSJWGnuA2d+xgjAVI3MG26tuDKS5aPiJfqUYy+pVKB+WJcJUY3bhh0EhH/dqc78m8+HZ6kGsPAmGQZnPjyAVbFWdWjKa1BC3vND6Vct+q7lsSHetHMw5a7Th+IoIN2UM02TnQhnNmb0wRaNoAB5s=
Received: from PH7PR13CA0018.namprd13.prod.outlook.com (2603:10b6:510:174::22)
 by IA4PR12MB9787.namprd12.prod.outlook.com (2603:10b6:208:54d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 07:46:20 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:510:174:cafe::d1) by PH7PR13CA0018.outlook.office365.com
 (2603:10b6:510:174::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.5 via Frontend Transport; Wed,
 12 Nov 2025 07:46:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 07:46:20 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 11 Nov
 2025 23:46:16 -0800
From: Honglei Huang <honglei1.huang@amd.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 <Ray.Huang@amd.com>
CC: Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <virtualization@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Honglei
 Huang" <Honglei1.Huang@amd.com>
Subject: [PATCH 4/6] drm/virtio: implement userptr: probe for the feature
Date: Wed, 12 Nov 2025 15:45:46 +0800
Message-ID: <20251112074548.3718563-5-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112074548.3718563-1-honglei1.huang@amd.com>
References: <20251112074548.3718563-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|IA4PR12MB9787:EE_
X-MS-Office365-Filtering-Correlation-Id: 047505bb-b9fb-4585-85ed-08de21bf9212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2jF4chIdKtNFh/1q+0lJ0vvbxQlLCyGJK1rHSxpKIqo755dWd1iTRJjEUIIE?=
 =?us-ascii?Q?3C9KVIHW/pSHNRTa6S1R5bqtt0zBGtpIi2GyD2WXN7f9FYpBO80NquNVXh03?=
 =?us-ascii?Q?MfvRTvXKHajol4lm/7IAaRdCE8Pgq9pcbfPFtQ1cVg8QGSVupenttWfZ8Ny/?=
 =?us-ascii?Q?rICshqJ98dU2jXr6b+jsOHpDgzkrvS+bqH67RycUs/bQyHE184nACl20QMP7?=
 =?us-ascii?Q?WPbC+dIxUEk9Pv9ikaEDD0jMCFl6wa6pd8DJFTdgimiN447BsyP4NkT6/Rt7?=
 =?us-ascii?Q?h2JDB7dfgjQSbsDUMddTUpAayUfDyCDyXPES9D8JXgKi318yFHe90UTxDw5K?=
 =?us-ascii?Q?Wgv1yOvdKnuBwrrDTvLqdaTeWz/BuqA/SCrH4CnnFngG44xaff8MI/goF33y?=
 =?us-ascii?Q?iTo76gWlHtj3a8ECy6Cw9SykhjDICn8TkVo8cg+kNVT6ZoUomMTBvqZ3yoGG?=
 =?us-ascii?Q?LYpgeObkfcjUqYc3gxNk2PnK1Wb7+8eJTcNTJpUo+ulBZ4z6FMrwgjabAipt?=
 =?us-ascii?Q?FCw90ZRpmB8WHms7Vc6KN0RazsLLYTuntwZ0k8ZGozK4F3tpCcTfX8NjZgkk?=
 =?us-ascii?Q?M8mjRdBIXvbVxfbxsWt89I6zw4MVscxLwOq20Xf/E8omovLc2UwOWCWY6Z2t?=
 =?us-ascii?Q?hNVTjH1WL6L/AK7iMSTHrGAwgo0qe8iZt+TSAS7xzMJQ2WkKjs3O6RFHthy1?=
 =?us-ascii?Q?it10Ak0eUo4p62m2TzfUHeGR4fiNcjVSyubBUKGcVn1IRyIO+Zyt8Ug1P0Vs?=
 =?us-ascii?Q?vNwtchG8mFI4mfxCnuxEHYprtj6XdmH+qs0VAdzmFhBAsSTHh3u9qHtLLW96?=
 =?us-ascii?Q?221bCzkZvYdnO1tK8hRPIpOKMzbgXS9l6iKe3qkIKD8jkSYKuAxIWtj5BbTA?=
 =?us-ascii?Q?Obvcg9G4/oPwzLucK7HYnL4BBp3puOLekfjLQ4vV6Cao1xcZkA98B7jP01Ns?=
 =?us-ascii?Q?em0+cVbi70W90dNTG6u31aDhT+OpjhKGXkK5SigjApcyL+riuKRn4o+qbTqF?=
 =?us-ascii?Q?ETgZetEPWB4w4/RieV7ADRDJLnDJvhv9PVbRYVYT8fhTYXbOoTPSzbpWL3/f?=
 =?us-ascii?Q?qYcwKVJfxBoLTSqJY94eYDj5NKlGyuS2SSF34R9GO3Db5qy10WNnSffI2q1A?=
 =?us-ascii?Q?jCdeDgiQ333LoTgmbFEdnGmSi1RRsnM4dqJbtK9Egc+5Tpuhu5NKd1zvQr8K?=
 =?us-ascii?Q?G5lhuiph14eUOvqUpNqcDz6HPNgGmCOQ7jARiQLzSezCBkPUUZs4dBhoviRP?=
 =?us-ascii?Q?Sby8Bns8e2HGJTWUboyVhuXRvWPVRRRJkldPcevkuqWYvPSSAk4hbhj2A1pQ?=
 =?us-ascii?Q?ZQ03cGp9v6ZtV6c3YnmjTVFTTZ74bua3DeTRsGeVAdwdGZYQKY1NTDExhswj?=
 =?us-ascii?Q?FDx8+rAMrnlC5l48DT91XZn55sobzw+5lgJQDcY8HlEydrvhF0uro47yrRFS?=
 =?us-ascii?Q?550aCgCzeawCIrsrESd6X8Yefp1npqZqTNFKcwW39Xy8zPv/7yF6EBrzgJzp?=
 =?us-ascii?Q?rE0mL09PuVyDwHVq2+Y3V241oibdf5lLgLotV7BOUnm+hPCofBrXfkAcJalI?=
 =?us-ascii?Q?K1w8jilJ3s6195M9UR8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 07:46:20.5470 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 047505bb-b9fb-4585-85ed-08de21bf9212
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9787
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

Probe and advertise VIRTIO_GPU_F_RESOURCE_USERPTR feature:

- Add VIRTIO_GPU_F_RESOURCE_USERPTR to feature table
- Store capability in vgdev->has_resource_userptr flag
- Expose via VIRTGPU_PARAM_RESOURCE_USERPTR getparam
- Display in debugfs features file for debugging

This allows userspace to detect if the host supports userptr before
attempting to create userptr resources.

Signed-off-by: Honglei Huang <Honglei1.Huang@amd.com>
---
 drivers/gpu/drm/virtio/virtgpu_debugfs.c | 1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c     | 1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h     | 1 +
 drivers/gpu/drm/virtio/virtgpu_ioctl.c   | 3 +++
 drivers/gpu/drm/virtio/virtgpu_kms.c     | 8 ++++++--
 5 files changed, 12 insertions(+), 2 deletions(-)

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
index 71c6ccad4b99..902a4fb38ee4 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -162,6 +162,7 @@ static unsigned int features[] = {
 	VIRTIO_GPU_F_RESOURCE_UUID,
 	VIRTIO_GPU_F_RESOURCE_BLOB,
 	VIRTIO_GPU_F_CONTEXT_INIT,
+	VIRTIO_GPU_F_RESOURCE_USERPTR,
 };
 static struct virtio_driver virtio_gpu_driver = {
 	.feature_table = features,
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index f17660a71a3e..ab19106af105 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -257,6 +257,7 @@ struct virtio_gpu_device {
 	bool has_resource_blob;
 	bool has_host_visible;
 	bool has_context_init;
+	bool has_resource_userptr;
 	struct virtio_shm_region host_visible_region;
 	struct drm_mm host_visible_mm;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index c33c057365f8..9081dbeaa362 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -117,6 +117,9 @@ static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
 	case VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME:
 		value = vgdev->has_context_init ? 1 : 0;
 		break;
+	case VIRTGPU_PARAM_RESOURCE_USERPTR:
+		value = vgdev->has_resource_userptr ? 1 : 0;
+		break;
 	default:
 		return -EINVAL;
 	}
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

