Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C824D2E248
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 09:39:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEDB910E834;
	Fri, 16 Jan 2026 08:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hCXR19Gx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010005.outbound.protection.outlook.com [52.101.201.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6BE10E834
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 08:39:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmCh+yjH/TRxPWl/WtWfKRZ+IaVijGqt9qv55ZdPhJNF5hxPzJmin0aQVQFcYbk+a2tfC61e5xqRUGonvWvxIOILtrpCJal8ZGC+PIrW3o/ZKwuAVB2R0sUyEQVEUzFtLe4bCZraoD/jT3EXUiiJGFCGJIJ0BfCVwVcy8TASbWPxwKWWoUTzdGvQXhA3rHGjoh0L/X454mxK8J7NSkos5bCLmn0hTZN9fKJwMASAKYoKPCjuYpDprhtwuZJuZidwlJ7oAIhngO2GrL3SaS67w7vc5GmDodJYW1mmyAOeyFkVfhaKCpe5E5ru/uWDX4w/C/7Zag0p2EBsclre1aVh1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7Avm8Vfyp+ZrTO3ASaUwcvhrk+9VGOxgDdyqZzFJ4Y=;
 b=hWzcMWs6XNR2FiPlHfcC/XSLip6Q2pKk0jbskmpGniSwVA0d1asEdmTQ5tqLPSKBVSUGf4Y6O6K3RtKVOG8t6zV91ZLfhHLzFotV8Dp8pFmBIAndswJOp3DcjxEk6rUF8vioBcADtKPX1gqby54GC7jbXN9aAVAS8Sla3PXK+faVmev4BTfXqvI2iNl3r6sYh/nWkYgcGXdYJP/IU8+akk7x6uf1xDsD7Qidf7LokIsup8sUI9W0Fx1AXQQiA8fDIk4qvX1wC+n88TLRVtFUnOiewRBM6WrQxmMgaN/R0nJZzh6BUgt+Eie0Dos7RhLOWbs+mpktJJZeXgnffvF5xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7Avm8Vfyp+ZrTO3ASaUwcvhrk+9VGOxgDdyqZzFJ4Y=;
 b=hCXR19Gxsall/9E+4ZqrM05glCP+aVv1inbzFF760HShCaEvpmaYj/yImdXksE8lieGvf/fjUtD1HT+WIaJy9LOx9fZLFHLur+etPI6I+9XbnaGpoKcAujKf0M7Wz0AtTYPBaYK7ioKGRCzAa2JtmxRpQ4O7hzOJ7nphvnQHii4=
Received: from BN0PR04CA0122.namprd04.prod.outlook.com (2603:10b6:408:ed::7)
 by MN2PR12MB4453.namprd12.prod.outlook.com (2603:10b6:208:260::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 08:39:19 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:ed:cafe::f8) by BN0PR04CA0122.outlook.office365.com
 (2603:10b6:408:ed::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.8 via Frontend Transport; Fri,
 16 Jan 2026 08:39:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 08:39:18 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 16 Jan
 2026 02:39:15 -0600
From: Honglei Huang <honglei1.huang@amd.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 <Ray.Huang@amd.com>
CC: Gurchetan Singh <gurchetansingh@chromium.org>,
 <odaki@rsg.ci.i.u-tokyo.ac.jp>, Chia-I Wu <olvaffe@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <virtualization@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, Honglei Huang <Honglei1.Huang@amd.com>
Subject: [PATCH v5 5/5] drm/virtio: advertise base userptr feature to userspace
Date: Fri, 16 Jan 2026 16:38:08 +0800
Message-ID: <20260116083808.325180-6-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116083808.325180-1-honglei1.huang@amd.com>
References: <20260116083808.325180-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|MN2PR12MB4453:EE_
X-MS-Office365-Filtering-Correlation-Id: acbaa2c1-ce2b-425a-a367-08de54dabd57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|7416014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cKktRCZs1if+8cpOQFUXovZ+WHg2psCXj7TbDzScUMQzAwDez48GT9uZdxIc?=
 =?us-ascii?Q?n+EK1NjMIcbsKQ/PiM7AfzYaAg7gzN3x4iQZkSxOHWWDJPjnY6CNf4rlGYq9?=
 =?us-ascii?Q?nilvz1Mc3jdSLRZj+1qmD3n4JZfqOlFd7m280387lNpKtoV1/K8MNFFU0S1W?=
 =?us-ascii?Q?otuPIMKrfOuwCqzK+iPaV1AMsgB0XSRrBDrV7VfHypsq1nhpB/1O+GoQBn5d?=
 =?us-ascii?Q?nnPnY+VjErsQsE74IXUEMjwOkw6mHqiqiLfVoc+BccSoZLv3BbJDfUKXUjW1?=
 =?us-ascii?Q?6Oau+dk3y27HJGSOw58A03Z0GS0LmSSRqPwZDFOZlSXDTxezAjjJwO6ppDvC?=
 =?us-ascii?Q?g23yi+LX2NNEAYFeintI5axI+w7FbLjbIdKWCBjm/2NFy9yK2wVIJXhBtEsT?=
 =?us-ascii?Q?ToPocQqWEy8QuAbzKfhlw0b+b3N42goQ82EtK1nB+9gMYO6QGlaaX7cL5KSI?=
 =?us-ascii?Q?utgwhR47rhoKV07KsATz+KrDXguVfMxSNrn3EM8VXUAlpXnOa9ytmO4xms+5?=
 =?us-ascii?Q?pSEJN7zaXWQn8YftUqTVS/fsY58rvHPQ+gn/V2GRVV0dcyx3HFJ9UImSMb92?=
 =?us-ascii?Q?zaJnqW+LEy/Ej2Vp5erR0S8PWmAuB3s8KUDTjKSzjtcfL/KaSPGAs3wE7sKh?=
 =?us-ascii?Q?sS6d4qyuLwlenBBzhR0ewdWUbZIoQ8QeUcNJiS77+btGkbyZJ1ybqMapZ7yx?=
 =?us-ascii?Q?BH7h562r7hNy38RDiveZv3C6EIPVVj5YQ49OixNsvoFfQXTb6vk2xCcfCTQp?=
 =?us-ascii?Q?D0dvoRd3DTL4SpEv5697h0weMm1XGIuRrwS+pY/Ve/wtFpHYEd2PtLGvvb61?=
 =?us-ascii?Q?o6ca+Oz2Hx1Xcyo8YUICIpQItbtPtXIpOMB+J7bHDF0A7dmbZuT2aORZQSfQ?=
 =?us-ascii?Q?HxCwiPChbJ7FKeG8vWRD6nnbs19yiUdB9lY8ePhvwM4SUubxniE/L3p6h8dw?=
 =?us-ascii?Q?uRwKiMe04XKrX44OJZ9RzWTwOx4IE0ZdyYwvU+lCN3P94s0G1Vjkh8hTgSyM?=
 =?us-ascii?Q?1lGnsJDrVGvjhCV2kp8lYu1+E/v8KtAa5HwcUIyET7SfD+VLBQ7KT2xlrQd2?=
 =?us-ascii?Q?YdKMlwiCrUSWB45pcfMDOkl1vCnMd+rMadbiZ28TLqlA1Ew1/6WdV/kWbFwj?=
 =?us-ascii?Q?mJIZawp3RT6nlLqI5rmBLPEIiHR0ND8b+61ryIwtd7PRPJTnNr7/BEAfLz61?=
 =?us-ascii?Q?VZtJRmqeHK4eYiDQSnEX5fZ+A8lcu4h1RN/noB80fhmDm3iiDZTCybQaa9Qv?=
 =?us-ascii?Q?Q4hhx1bgrdlLqSjzLcNQzjLGmyL5rimqbea34BG0zcywYdSwLplrLH0neGPZ?=
 =?us-ascii?Q?sf5lrRU93SezZXNbfmMkCWQAiFly+mDC+ru2dMmOKrRGFMWEn4Q6bHp4mF/Z?=
 =?us-ascii?Q?metaP6RIBAGgGp1LyV7xrIro/mcPaA3r5d7LtPlhKdC6Jv995DI0vP7tjpRL?=
 =?us-ascii?Q?/CMY7M/zCUKLyUAwxuSe9AV2ri7kGrHyTCI40s2lH2YH4Df3x1RLVMM6kDOh?=
 =?us-ascii?Q?KTyL5VDJVr+Kwuwi8Qzy000SuVAdXJIQKoTGLmKXh8SrzDGnyZ/Q2x6/S123?=
 =?us-ascii?Q?S5F7etbWiI1QX1avPfHEcvNawgFPyGFgso5DSp/6MiSBjls+e+uTh+4Fy8w0?=
 =?us-ascii?Q?GZrSVSBekFo9bYGyl6QE58EJn2FbSq36nMcAnI0+Q3YnROZ/lY/tbowPmIFe?=
 =?us-ascii?Q?GVMx1g=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(7416014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 08:39:18.9018 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acbaa2c1-ce2b-425a-a367-08de54dabd57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4453
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

Integrate userptr functionality into the blob resource creation path.

This patch adds validation for the userptr blob creation:
- Include VIRTGPU_BLOB_FLAG_USE_USERPTR and VIRTGPU_BLOB_FLAG_USERPTR_RDONLY
  in VIRTGPU_BLOB_FLAG_USE_MASK.
- Verify that a userptr is provided if and only if the
  VIRTGPU_BLOB_FLAG_USE_USERPTR flag is set.
- Pass the userptr address from the ioctl params to the internal structure.
- Invoke virtio_gpu_userptr_create() when a userptr blob is requested.

With this change, userspace can create userptr blob resources by setting
the VIRTGPU_BLOB_FLAG_USE_USERPTR flag and providing a valid userptr address.

Signed-off-by: Honglei Huang <Honglei1.Huang@amd.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index c33c05736..adaaf80b2 100644
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
@@ -453,6 +455,17 @@ static int verify_blob(struct virtio_gpu_device *vgdev,
 			return -EINVAL;
 	}
 
+	if (rc_blob->blob_flags & VIRTGPU_BLOB_FLAG_USE_USERPTR) {
+		if (!rc_blob->userptr)
+			return -EINVAL;
+	} else {
+		if (rc_blob->userptr)
+			return -EINVAL;
+
+		if (rc_blob->blob_flags & VIRTGPU_BLOB_FLAG_USERPTR_RDONLY)
+			return -EINVAL;
+	}
+
 	switch (rc_blob->blob_mem) {
 	case VIRTGPU_BLOB_MEM_GUEST:
 		*guest_blob = true;
@@ -489,6 +502,7 @@ static int verify_blob(struct virtio_gpu_device *vgdev,
 	params->size = rc_blob->size;
 	params->blob = true;
 	params->blob_flags = rc_blob->blob_flags;
+	params->userptr = rc_blob->userptr;
 	return 0;
 }
 
@@ -527,8 +541,10 @@ static int virtio_gpu_resource_create_blob_ioctl(struct drm_device *dev,
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

