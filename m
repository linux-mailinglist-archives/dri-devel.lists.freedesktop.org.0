Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3852BD22F99
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 08:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9426C10E6F2;
	Thu, 15 Jan 2026 07:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="35Xti4CW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012016.outbound.protection.outlook.com [40.107.209.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E7310E6F2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:59:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ypag3VfJ48D9DQXo6U3UvJ27BL9/daB9yeOKkSVYnuHLfi0Kj4utJoA9TzfVR5BCzPgzfetKAYPI0AEh+GzacdvI492uYUsa8eZ8vh9SiKg95l51cliszCRzVBc7q1sc1GTqMzPXuEKdlciP9d3XklSfCGRcMX0Go8idaK2xs0yWGcGu/xRtyHP5eRRne69qKBSFwL1kxd7B3jwZ+S6amwucSihqIzULQV2u9ChwmlNdbtetmfhwsp/KzPIzmy22uXuuHG7ZGmG7Mz8o75R+/QY9lMwZ7VXXFmexUCBsr/QTM0aQgIzFv3t4TY5F/oEvwF4gJpVD2j0g2uALWS/X4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AsXdTSgqNmnPyGco6olO0bpQqz/wL/En26ePVSjE01w=;
 b=lYvKmwBE9OMynaNfsyk7zEjzaAb3t4g9cf8m4uLICdmKq3XQs4QFV7GD925AOnzXs0vB6q1Q9NlWDHu6WtFmkiijas+fk17px1YguycxlTxo8XJ7ukEVZebFOqdFQfDl1sat1953VloD+IbP7JgyUvNq/fZkH2r5Ke4W8D/7C5aXVIj6EITn6weXSGRk22V7n4SJUHmQrdXDRBfnLYKTwP+z9W+M6ZcrgBtf6mpB9dqqNl6EW1kIcZ7kQa4oONGSTKlV7nP+xEKkWCTQ69tUmgXgONVQLaWFksWXnKA1x9nl7mLu77844Cr1yAJBxUoYsKza6V72lH7JHuAUqf0ONQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AsXdTSgqNmnPyGco6olO0bpQqz/wL/En26ePVSjE01w=;
 b=35Xti4CWo5EJW2T4IEOOZhgJqBuCpp6gawFhGrz3ljhRWlLbgadM4xNSp0TNqXSxBYbxfbCZmC8L3FLZMGewOJCYIq/n4yODjKWhCwi+tKjAmx0nQdpI5a7o1l9jKu4mQL80Oh41tAaagFi9GMeIlJtjUdYH0JjQluziT4GAzFc=
Received: from BL1PR13CA0164.namprd13.prod.outlook.com (2603:10b6:208:2bd::19)
 by CY5PR12MB6648.namprd12.prod.outlook.com (2603:10b6:930:3e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 15 Jan
 2026 07:59:33 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:208:2bd:cafe::7b) by BL1PR13CA0164.outlook.office365.com
 (2603:10b6:208:2bd::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.2 via Frontend Transport; Thu,
 15 Jan 2026 07:59:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 15 Jan 2026 07:59:33 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 15 Jan
 2026 01:59:29 -0600
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
Subject: [PATCH v4 5/5] drm/virtio: advertise base userptr feature to userspace
Date: Thu, 15 Jan 2026 15:58:51 +0800
Message-ID: <20260115075851.173318-6-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115075851.173318-1-honglei1.huang@amd.com>
References: <20260115075851.173318-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|CY5PR12MB6648:EE_
X-MS-Office365-Filtering-Correlation-Id: 0986f37c-2bf7-426c-6a46-08de540c04d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|7416014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JQtIH1JsFbSr25ewKZJTP/lyRv21FMqcSWYo4JShkw8wEQ74d6bIVdyIIWVj?=
 =?us-ascii?Q?T8Ft9+jqNCN+Yb+hjiCt2f3OvwzsOovWbHADWjbQ/PBf0XitW11eDpDtp3vb?=
 =?us-ascii?Q?Uf0uzQ9VT5eGviAtKw79A3ux1CfguoQ75gl2ykHJSsP+AqIRTe2qpVrex0ds?=
 =?us-ascii?Q?1UHD6UpNBhdI83Nahvab9vVUrkeOpVDHGyOG0vS2Mm0Ib/TOaFbUIhPEA45r?=
 =?us-ascii?Q?qY2WqrxLTiDUERnLob31kZy4IcXqvmEYGeirznKiiDy9sH4mqJ2tBx1eWy9D?=
 =?us-ascii?Q?8uc98XGkWGuVKwHanr/uYQFTXykPN203nuCoG1J19YqDrCeGyqCOOe9Wc3oz?=
 =?us-ascii?Q?C7/B84+wODs66RX96p8TE4zlQtpDK/qg/2hoq81NlkqkEy9Yis7GvB1AcjiK?=
 =?us-ascii?Q?ZscGOE4HAOS+qFlVzxDM0YeVwRFZXaOGUrnMQsog/OaZBUeeemlf2HGRQbyu?=
 =?us-ascii?Q?zjfZjnJqg7nX0CDladHfIKZDj2HGN7TXG6HcI1Pfzx99X07Coc9A9GCCudpR?=
 =?us-ascii?Q?lHYNV1ItRkgVbkh9aM1GKEJvRwHxdWDoLxVTbfllGUEjfWuei7L4ITtYkjPM?=
 =?us-ascii?Q?7RO6OA8gq2FHLKPyFqU7TYXJBdLMknVp4GRXQksS75nWsfFwDic0/x8wGyKJ?=
 =?us-ascii?Q?VcDIkk/XSwIEetDFzDSBuqS8mq9C3UKeAEnBCXoXULd6bTSeUMOOdMB0wkKj?=
 =?us-ascii?Q?02ez9ikowBqyq8FkKmIuQQ9/dsiBKN7c8Fto3SoexLoJL9Na4tV30OArx9jH?=
 =?us-ascii?Q?+j2B7T9SxwfsQJmAitp+8GP6N+IO/Wr8BrIeyhjfEj/zbmJCivjwXbcIdYc0?=
 =?us-ascii?Q?RavXRimIugRpeA5dbNM032dVvk0q4QUrECWhQ3bi8NLkTgMELr2ZjOG7F8o+?=
 =?us-ascii?Q?qJzLXkHYdI/06vDd3WUZVfJtwb0Nb4jVOshLtFDGLCG8lM7PRU3pf1GaH/31?=
 =?us-ascii?Q?ADzlhUQYjm3t8KNzl+6bQT8Kq6CfEbFsEEEneorB9EzLv5q+3ydYGSgLUxz+?=
 =?us-ascii?Q?PW9EQe2AjigwJFMIBdR6NiYwjmQAjG9JZMsDmzU/ODLEYdDmIGehyWKfjpXH?=
 =?us-ascii?Q?+jd9cxthh2I7upk8PCg0JnMMIO6yBDq+XdmaU0T5lCzKZhWDX4AeS3VTRUvv?=
 =?us-ascii?Q?WzMsm0habK+eTspgbj+xga9OZsq0r/DNzFtDLdxxmjLp02eYVlueErpK7ONC?=
 =?us-ascii?Q?KGS9lX14hnFL8Pir0LEm9tu7jUgAXAIUZr3FOp6I6F0MuP90AFCOk8ihAdRg?=
 =?us-ascii?Q?Y6+2B3b8OI2ftWTFpNasuQ3m9e90DtJ4+t4+IP7MDl4iEOES5XdCyk3Uz/fs?=
 =?us-ascii?Q?TZYY9hDN6f84J0c8yuaTDboSpnHa9frV/kjiWbT0Md5pHxVeBO2fvadw8VTH?=
 =?us-ascii?Q?qZ9HVkrKMVZ9twyQzPBiPKPXIvVm8ZlmvAkf/bDuGD7+BZuGf8XGBG71Jj9V?=
 =?us-ascii?Q?8xkmS2+JzeUIuEnCQ3Lci1SwDfq6YMRJytwjXBXLP297DlGRgOUezlkyCito?=
 =?us-ascii?Q?2E0Fw6ePJDf/mdWMqd+huEjUgSu9tWFs3D/i1u0iwAMO1ydUuhlhdz6Ab2Ld?=
 =?us-ascii?Q?xTZIsgxB4pmT9cxfI+4A97Ui4lH/EyfotrVE7pW9mDnbvc8boRFpTZJQcuYx?=
 =?us-ascii?Q?8F80jaRDOIpBs7R3cBiKWwo0oi/EBJ1mK7zFqIGtqIJF/7fBYwup4811Smhu?=
 =?us-ascii?Q?/p17VA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:59:33.0250 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0986f37c-2bf7-426c-6a46-08de540c04d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6648
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
- Route userptr requests to virtio_gpu_userptr_create()
- Pass userptr address from ioctl to params structure

With this change, userspace can create userptr blob resources by setting
VIRTGPU_BLOB_FLAG_USE_USERPTR flag and providing a valid userptr address.

Signed-off-by: Honglei Huang <Honglei1.Huang@amd.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index c33c05736..e49f5c89b 100644
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
@@ -489,6 +491,7 @@ static int verify_blob(struct virtio_gpu_device *vgdev,
 	params->size = rc_blob->size;
 	params->blob = true;
 	params->blob_flags = rc_blob->blob_flags;
+	params->userptr = rc_blob->userptr;
 	return 0;
 }
 
@@ -527,8 +530,10 @@ static int virtio_gpu_resource_create_blob_ioctl(struct drm_device *dev,
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

