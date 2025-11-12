Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B77C50FE3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 08:46:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3D710E6C6;
	Wed, 12 Nov 2025 07:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mykwpvMx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010051.outbound.protection.outlook.com
 [52.101.193.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895B310E6C4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 07:46:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKcWEqbZ5TI8y7tuNx/ZE1PH3k1Zh+Qx7nAz3oun/Bl5nKofbkIwUqpjKvSC5idZlFy3n2takKZpKSwhOLWc4KWIEQvSerTd8UUqcpGQluYwZUqojLjTRiNvLBu24B58az9/bHs7YHGSdwX5W0gFeBGUYlipdrlbY4EIkMl+oDfD2CWAw2K38IJD1Lv75qIXNPDmAz4HZkMiLviLpUgagLfFIJ6AtdCyk8Qjv08MzRmx+4E+pnX1hnEzfI3PQeapg1rfhsNxh8AXb+FAGOcs1Wboxo8edfe8Dt8Cxqtx9SuG3R/QpFLW5qJBt+XDoHj1rnOqZnxdTFN1WdxgC1+peA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8RWnL863nSWQAANdAfxGML6QnxVa3K9zxrw+e4Ph+U=;
 b=vH2+33yJQeSzQvR2kFc1SaJN8p0UKjvov+UAtLQ2J0YtXYQOr522IduXlLZcSwnHaVnEX0MwblqxhGA7JDwfLqCd0mpxiAjIGUp/LzK2z+j7QshtaQDJ5v0tl6Q8vV6s/6ROqB6L/j8sTA0Beosy7oR0CWgcFtBlvvwbTwssLwEofeuHISstYZi2h5iQbTjQE/sfggT+AJXdv+HChano7kE2YAU2DQ/UOWzf38wg/S3tt6gD4Gn0Rc9Q4GW7GsAIdNfNQwenQkac8UmaJcLDJSC6M0aObuzXbIWlJdgHfvVfw+igqmzlCiBp7uGsDnT5SX/6sARh67JjTHsrUzMiLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8RWnL863nSWQAANdAfxGML6QnxVa3K9zxrw+e4Ph+U=;
 b=mykwpvMxE+QoVccPfFJ1Rs5S4/orZ2bKCLzGaVUDo+Qw/EqgqE+DK7+RWGqTh7xWOowbvDqCYpcedhiQKl1shTLf6+mO1abCLrUC/WIDAwpGUkQBohL1vtpRUOUI5zgIqi8jYqmVxH3zzhy3sGXJ/KHhDV5wELSmQbNvR7c6mtc=
Received: from PH8PR20CA0022.namprd20.prod.outlook.com (2603:10b6:510:23c::22)
 by SN7PR12MB6768.namprd12.prod.outlook.com (2603:10b6:806:268::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 07:46:28 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:510:23c:cafe::a4) by PH8PR20CA0022.outlook.office365.com
 (2603:10b6:510:23c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Wed,
 12 Nov 2025 07:46:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 07:46:28 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 11 Nov
 2025 23:46:23 -0800
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
Subject: [PATCH 6/6] drm/virtio: advertise base userptr feature to userspace
Date: Wed, 12 Nov 2025 15:45:48 +0800
Message-ID: <20251112074548.3718563-7-honglei1.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|SN7PR12MB6768:EE_
X-MS-Office365-Filtering-Correlation-Id: 86091940-9f3d-4faf-7813-08de21bf96cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tYvc4tmjUu6jeQK+ZA6hM0xiFaHQMb3TAejPoFoML1XDM6gUZX/S7g8JDDNj?=
 =?us-ascii?Q?P6S16wr3E71LMgK76yp5Ao0eBHPULHKb1ap7hT8i8diw4RxtqK+d/XG8itD4?=
 =?us-ascii?Q?pIlNfjVsImIcullhKUv5b9COtZQwNMiorbsd4ON0yV22UJFRHXYO0WmyRQb+?=
 =?us-ascii?Q?/bJO/rGi6HPvxseNzIBwgIYlzEuuvzUyRo3kFN1aV4ibjk88gB+heAx4s30x?=
 =?us-ascii?Q?5t8A7/OZlGPF9/Q3/V27beLvnR6QZkOYfIHH1mntw73uRhtaJUjdcXy3MqIv?=
 =?us-ascii?Q?MJHrCfVj1vxByZezfgOlA3WqLFJ//HUzosgESjcQx/rdtShpWGOZ+d3eSa8F?=
 =?us-ascii?Q?qdnJeiNI0tj5+fe4liOnAogSZpPn+JiMfT2v2ApxCfdyin9XRb5dr1elMfoG?=
 =?us-ascii?Q?jg88w/Xi5GroOmEg8GUek5pHyMD5mVUhvIxJ6ToSkHMwQtGQF3bIT8KK4coR?=
 =?us-ascii?Q?9+2ZiGFWRutdNXFHCIoXXIpD23Fk533DmR0T1reMsDnVen7c7FLrSKqV7trB?=
 =?us-ascii?Q?+S31e+WvGyUGQiVSf8H+bHC0ep5m1sJn4wlCK+ZrmuxZXuXBJPA/hkH/CRFm?=
 =?us-ascii?Q?wMu1Bzk5fgPJ4iJKIrfIwvTYtWKfqJ9Scjxj3u8cyhycWutOalRnolWu33Sh?=
 =?us-ascii?Q?OLZ0JD3pcD4DsJqcT4yjnUx5L7HHSBJlGI4VWJ3Lwzx3zWKQ3welAdrsAdDK?=
 =?us-ascii?Q?5flOvFuNfRRx5wS0KRo2/aqN8lNd5l2nbMjWHLd0z7j13tFTvv42Rx44DDhP?=
 =?us-ascii?Q?m1om5ZafJiu8TZ4jFzwogkfYAXqDloN3Hk8WGlp2tdC6TtYEY41HI+mK59ct?=
 =?us-ascii?Q?xKzQ5BsJ2SbV3+XQAVNVwLD0z73A2EJYpa65QwuVHee1/zFkE5BfzF/ZJKWi?=
 =?us-ascii?Q?pV+qREtk6Q1BBm8UU5dZ76ykntEYYcJkwHML7HwIliT0hbMIS+StwRyHSh/9?=
 =?us-ascii?Q?4HjBluNRcBI0jcef7Ox7eYaJHMAonvCmwC2eEPoAkuOPufPxtortgo4ToCHu?=
 =?us-ascii?Q?xnNsy9CtfMjYpOEi8BhSUYQcLwcQ7E4mY9EttFqRzwH5xiLQvcaeBBoJ6iH6?=
 =?us-ascii?Q?S+RBarhY9iCELzC3ouKZ1gxqXvqJsBJlD+PL5UqHs5TYYk+YoG5hdv2MwfzM?=
 =?us-ascii?Q?CQoHr3vbfI31Z049u7yax4NazmL2TPg5uDxaDejpi6pTiJE1Z6DuLf5MgZEW?=
 =?us-ascii?Q?EEY7RpwIOfSH1sbwclNPpY2RZwqqp6tg5V2yugbz7LmuFI/fBDU9zSobI4A0?=
 =?us-ascii?Q?VJQGgz33iTP8gGyDXchLrizWHBxkRI1FNANm9Kv7Ggbw8KvQ8PKQpKGLGNzR?=
 =?us-ascii?Q?kMEb20tZ+jrYVEmm6c+dPFxEiQ80U14LZACuy4Q7TxbaUlUzaqbhMwogcPkp?=
 =?us-ascii?Q?HGvUm4uXh9UY2A2M2ouyH0Z8+Q/6SBJJREzDTRBtmYgGkpWOnetfWm8V/OFH?=
 =?us-ascii?Q?qJqHMji1XRY5hX/qaUU+fgGI/ce5WJn4lKFqUo/kVmJMOtcTGk3fe8vO4u1p?=
 =?us-ascii?Q?YU0qC8YiXA1ci5uK+5g732H1auvSRrdqMQZiaEBzvk6CS0IvFZgZuOamF6Gz?=
 =?us-ascii?Q?glOsTRTAIcy3D53niRY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 07:46:28.4964 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86091940-9f3d-4faf-7813-08de21bf96cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6768
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

Integrate userptr functionality into the blob resource creation path:

- Add userptr flags to VIRTGPU_BLOB_FLAG_USE_MASK for validation
- Check userptr feature support in verify_blob()
- Route userptr requests to virtio_gpu_userptr_create()
- Pass userptr address from ioctl to params structure

With this change, userspace can create userptr blob resources by setting
VIRTGPU_BLOB_FLAG_USE_USERPTR flag and providing a valid userptr address.

Signed-off-by: Honglei Huang <Honglei1.Huang@amd.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 9081dbeaa362..6744c3f2867d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -36,7 +36,9 @@
 
 #define VIRTGPU_BLOB_FLAG_USE_MASK (VIRTGPU_BLOB_FLAG_USE_MAPPABLE | \
 				    VIRTGPU_BLOB_FLAG_USE_SHAREABLE | \
-				    VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE)
+				    VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE | \
+				    VIRTGPU_BLOB_FLAG_USE_USERPTR | \
+				    VIRTGPU_BLOB_FLAG_USERPTR_RDONLY)
 
 /* Must be called with &virtio_gpu_fpriv.struct_mutex held. */
 static void virtio_gpu_create_context_locked(struct virtio_gpu_device *vgdev,
@@ -447,6 +449,8 @@ static int verify_blob(struct virtio_gpu_device *vgdev,
 {
 	if (!vgdev->has_resource_blob)
 		return -EINVAL;
+	if (!vgdev->has_resource_userptr && rc_blob->userptr)
+		return -EINVAL;
 
 	if (rc_blob->blob_flags & ~VIRTGPU_BLOB_FLAG_USE_MASK)
 		return -EINVAL;
@@ -492,6 +496,7 @@ static int verify_blob(struct virtio_gpu_device *vgdev,
 	params->size = rc_blob->size;
 	params->blob = true;
 	params->blob_flags = rc_blob->blob_flags;
+	params->userptr = rc_blob->userptr;
 	return 0;
 }
 
@@ -530,8 +535,10 @@ static int virtio_gpu_resource_create_blob_ioctl(struct drm_device *dev,
 				      vfpriv->ctx_id, NULL, NULL);
 	}
 
-	if (guest_blob)
+	if (guest_blob && !params.userptr)
 		ret = virtio_gpu_object_create(vgdev, &params, &bo, NULL);
+	else if (guest_blob && params.userptr)
+		ret = virtio_gpu_userptr_create(vgdev, file, &params, &bo);
 	else if (!guest_blob && host3d_blob)
 		ret = virtio_gpu_vram_create(vgdev, &params, &bo);
 	else
-- 
2.34.1

