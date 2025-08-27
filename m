Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 868FBB37D41
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 10:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E6710E03D;
	Wed, 27 Aug 2025 08:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jv+o738Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2073.outbound.protection.outlook.com [40.107.96.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBD510E03D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 08:12:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NGydAPWdDINV6y+f2obM6jFJiC3xCmHY0mypLSJ1bdLCWBdxvEz0sbYAH7JjPyArejCTsIV2vwq1UmiZJ7cE4vUtvaSGISdU5DwIbOX6Nb/ZxXp/PRT4or6Qab2Ss2oV3/oRFsSYqZSI4l5o2q6MqQ9sYI4cDzivQr87qSJBJq1/9kY9V17Y3sDt1buPMeJNNyLEfst/CEhRSR0/bY4+M3j6rJ0mVUmAHWTrnEvBT6zKQurJASAHCItTpePeFWWn+BaohYgr6zQHHpxIZ7zrk3SCc5OfGdjICJ11OVL6XSY0/EXN4Gc0j0UF5eXVkbOGGkmt3t5J9VFpjZLJ0cXuBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmJmNTRTLf61g9UKxpZYzMctCgwwSBH0ddEl/pzaw4E=;
 b=SJZtMRdG4qm2IY8SzxWsIm3jQeXC7CWa/yVZlChjRCQTOd0Nk6sXr1I2aWJdRDrVynVwFZn4AJRV3HRgQNR81ixDye1dPooWUTQD7/OBEqJ+edAsVL97xsXrV9ylZKMY0FJnaa33fgxBwc23uYYyjeF16BrtI7uTkB5b3mOxf2vsiJPEYsZu3nNbbf4wQ3OYwZ9u43Xg29h3ZdR3OhkAswOgAc5b4m38O+GV5/xH/9CQgXM7vN2vbxqPGE1TcRCMIAOv+SC6kKc/rUziBJulrDFd2ZztI4+9ye0PkIuYbNrWpg51syDN1BG2c9maqwQsJSrRHpTdn+w4fDKG5nIAOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmJmNTRTLf61g9UKxpZYzMctCgwwSBH0ddEl/pzaw4E=;
 b=jv+o738ZHFWQqaFXLMKpMIvpP/iwgF80DiDcTj3f/Uqd41hmLTbwXa4/bvd6cDqt+G0F6Q0LEwk+HSbyXYht5O7RiPPx6lKY71CJVzLVxPqaNfpGRG06F1VXwMXOai4OTo/0YE1E2IQzCAmebY5cberc7MXXrdL3jbyAgLxwODE=
Received: from CH0PR04CA0120.namprd04.prod.outlook.com (2603:10b6:610:75::35)
 by PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 08:12:52 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::9f) by CH0PR04CA0120.outlook.office365.com
 (2603:10b6:610:75::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.13 via Frontend Transport; Wed,
 27 Aug 2025 08:12:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Wed, 27 Aug 2025 08:12:51 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 03:12:48 -0500
From: Honglei Huang <honglei1.huang@amd.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>
CC: Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <virtualization@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Honglei
 Huang" <Honglei1.Huang@amd.com>
Subject: [PATCH] drm/virtio: fix host visible memory detection in virtio-gpu
Date: Wed, 27 Aug 2025 16:12:31 +0800
Message-ID: <20250827081231.1878248-1-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|PH7PR12MB5757:EE_
X-MS-Office365-Filtering-Correlation-Id: c3986943-1677-491f-92bf-08dde54184aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uS8H3uINxkLcKmJx0Er25lTJDDPaPfv/PXENNqndYPzW2vSHoepsiCQLXpHs?=
 =?us-ascii?Q?Xa1xC30+o+571LqKH4NvH/Xa8I136TPRAJWswf6nEX9B4EjMEh86WCIclSPQ?=
 =?us-ascii?Q?QYRMZg8uSymsl2EbpsXuuOxKA9+KofBWqd+fMPSeSpFI5Y1XLowQIVQsEQ1Q?=
 =?us-ascii?Q?1WqtpFtboY46vJME/LfPjjHoEmoDVvoRJC6pGsB+cJ3hn88vSDUP7nPC9spg?=
 =?us-ascii?Q?KfWcDtM2MQXb5ikOtnbrscpiEVd3sIkDTjNqxJXxTAMatfCIRKnfRvJyfiJV?=
 =?us-ascii?Q?eE1eq+c7gHwJg2uMnKdDmQ94INCZIMzinwclGgLLvLrFoQhjKMiUFaJhoh1Y?=
 =?us-ascii?Q?oeQO/jy9Y60Bk3MfuL188r6JraJxSy15ivsXZFt2xtfPJcuSJpwfHumBPI97?=
 =?us-ascii?Q?q7Gv+xTXu1gqW791GW1l5mlQeOq86ygTqDWLA23QTe7CD93dm30jUUDDdvJ3?=
 =?us-ascii?Q?YgQZYEmM+3DsQs5ix6lXVXheWDzzaqekNIwpURO+AE0DI2kw8vpo6EmlKA/A?=
 =?us-ascii?Q?Zv/Mbjiz9gi8QJtbD7VUncC1O6nqzDEd34sq4YAz26Hi+JJfZf1bfeGs0n2E?=
 =?us-ascii?Q?Rq/nJ+1pMlf+Cubb3sU9sXJZgucdVt7WCdAbGR5gRpelyZTNGAiuSqa+sdoy?=
 =?us-ascii?Q?bPIxjNh4WdXTjGdObYhZN/wdJMUpLPSgvIPEIRGh/qu4blpVHPGlP4+dzrN9?=
 =?us-ascii?Q?TypuvIcYtqsjjZId4tch0z9DpM/VNCtcpnV/O7y5LQccEhauxboSrfsD+6xh?=
 =?us-ascii?Q?XTlkI0+GFRByShzEjwOnostv0dhoNLU9jGzbephBEyoAAsvB6vUvUrKgRfj3?=
 =?us-ascii?Q?dcc+FrMl7JkV1H/aFhGXueipGEphSb+NiNnjM0ttQMeLq6wz2lo4ucubRvf0?=
 =?us-ascii?Q?27rjCwm5Yqd0shGa7CqkJ/ao9rqmkfwbYbpzhjNpPqjoQOB5CwgbTjyz6sJ9?=
 =?us-ascii?Q?qxS3JZLR1Cq9eMs62B5nAZ1iGeI6L51RKeTUI4782b8aE/1gkvaTDw3WfVKw?=
 =?us-ascii?Q?ATF3JEkGcWeFBainvr8uREpJEg9GtQ4yiZ+FMC3F/Mln/XmzXz7QIUN59plC?=
 =?us-ascii?Q?k0AWvQ+e9CyHSF5R5mTv357fGtWXvf7qZ/d13E9cW7YLLOw1zhbfN9BGmDKT?=
 =?us-ascii?Q?qFKRq5G/3uIxAd3cc2Dz69UsNXcWy+mOY5Lv1yXy+nSa4LXTUNfBySnZOF2U?=
 =?us-ascii?Q?xZer5yPFwGVb4D5FBUUWsyarUrHlmDIOiClvcwGTcATXRGz3rljWMvNQEeSw?=
 =?us-ascii?Q?96+if3lbmS0oEW3dBR8moKeW7W6DCteo7BXaeJJGtk3JzmKrq7bXjfIa9unC?=
 =?us-ascii?Q?uGRbp4alMNvbRWZ6SIvAoYdzLhscRNIrHf1KFB2z8OF8cCiTCry35fOiF0qK?=
 =?us-ascii?Q?aMvcjQruM0s2aIgfXX/ABwwFBt/QPQ3fOlE3QqwW0j8EfHpJC3VGlQjsHzKz?=
 =?us-ascii?Q?d5mk8plHSJ/tABsbHAd9XsIOeVb035eYhTd8S+J0ES9D7yFDoIQdwxuSO4NS?=
 =?us-ascii?Q?SxmSemLrXPXxXJCOdaDpjpptGB/7RRwbIVjB?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 08:12:51.7344 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3986943-1677-491f-92bf-08dde54184aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5757
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

Commit 206cc44588f7 ("virtio: reject shm region if length is zero")
enhanced the validation in virtio_get_shm_region() by adding a check
for a zero-length shared memory region.

It is performed before the underlying transport's .get_shm_region()
implementation is called. This creates an issue in the virtio-gpu
driver, where the `region` struct is part of a larger structure
that is zero-initialized by drmm_kzalloc().

Consequently, the `len` field is 0 at the time of the check, causing
virtio_get_shm_region() to return false prematurely. This prevents the
host visible memory feature from being enabled, even when the device
supports it.

To resolve this, this patch bypasses the inline helper and calls the
underlying vdev->config->get_shm_region() function pointer directly.
This ensures that the region's parameters are checked only after they
have been populated by the transport, aligning with the intended logic.

Signed-off-by: Honglei Huang <Honglei1.Huang@amd.com>
---
 drivers/gpu/drm/virtio/virtgpu_kms.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 7dfb2006c561..ed5981248302 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -174,8 +174,10 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_BLOB)) {
 		vgdev->has_resource_blob = true;
 	}
-	if (virtio_get_shm_region(vgdev->vdev, &vgdev->host_visible_region,
-				  VIRTIO_GPU_SHM_ID_HOST_VISIBLE)) {
+	if (vgdev->vdev->config->get_shm_region &&
+	    vgdev->vdev->config->get_shm_region(
+		    vgdev->vdev, &vgdev->host_visible_region,
+		    VIRTIO_GPU_SHM_ID_HOST_VISIBLE)) {
 		if (!devm_request_mem_region(&vgdev->vdev->dev,
 					     vgdev->host_visible_region.addr,
 					     vgdev->host_visible_region.len,
-- 
2.34.1

