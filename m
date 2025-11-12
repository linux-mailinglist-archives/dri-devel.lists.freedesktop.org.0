Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA29C50FD7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 08:46:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7076310E6BF;
	Wed, 12 Nov 2025 07:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gyMOgp6V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010024.outbound.protection.outlook.com [52.101.201.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E043810E6C6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 07:46:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qAao+xjdtZiMkn710yngoV3swMlxT+mFPZe7+owg3GNcXMZoa+KLjOC0VP+vuIlYg0qnuOp9SKCUg28AlszKMa8EHkuMjzdolAovkity8NdBRnqHvAlle/FfuRHbfBOi8+/rhCtWRhDWLh+3pRC6cwMtQTOAv7Bx3ZZUZWf8UTz6jVggAzZlrjqmEirFJ/tlP40MF1Te4zKeG3dbj9VjLcNUxsKbdnM/g9HUqKkv6qZxt1m+o4/VLJ4HGGOEnreXUIr/5IOZ+SZFVUKjGi+cKAFO1x3tpyLZOxLiY10XQPLvi+XXjSxtYC5uqGgK0iUbcgzgbAiUOpJ0hGjXsOTBrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqZinFR5Dz9CxF86yk2EXWnK+mlWZguZPNH50QERVfY=;
 b=FEsFNAoiP6xDwuNfSdsmx0gliNUmrhtRs+pu1QdxWLqoC76mK5uDwrSDpeELCf31eezx0ovIcrh+/zIqZl0uYR5z3rEqhhtDJnuhesioWYD9hQ1uYB6CrNJ2DXRR8h/8OF5FBnbvVrrhLjKrnmFUACs5V9I1Pvzj+f4AttE9Gdwln5pM9c0E1fswVZgT9qsDVMG5sVzjvR2b+JaooBaJV9HS0JkWodlNbPe+pQG7qrX3+XeBeSFda8H/M+4PKnlIrE27Hi1Jk4xw7ra0cSVm8tobvbFaZwoXRdLI6NRQyWQDy3RwJiVM2BpOxb765vBlMLkwbasMYy6oyYHfrdMI6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqZinFR5Dz9CxF86yk2EXWnK+mlWZguZPNH50QERVfY=;
 b=gyMOgp6Vs6kid97yZHuMRPdUH4ZmfxH05b3piQg8cZgOMtMz6vIrUjGIlbHdeQCYy6neh/q/AV4N3RVacTFs1vzY2J3HkwqoDaaslJ4jcGcM9LzKCBT67l6Hwk9jyWyoGrHxXVHpzTN1s9cvBFfJdyMWBwdBpdCjc+6xBedH4DM=
Received: from CY5PR15CA0031.namprd15.prod.outlook.com (2603:10b6:930:1b::33)
 by CH3PR12MB8329.namprd12.prod.outlook.com (2603:10b6:610:12e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 07:46:14 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:930:1b:cafe::a2) by CY5PR15CA0031.outlook.office365.com
 (2603:10b6:930:1b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Wed,
 12 Nov 2025 07:46:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 07:46:13 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 11 Nov
 2025 23:46:09 -0800
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
Subject: [PATCH 2/6] virtio-gpu api: add blob userptr resource
Date: Wed, 12 Nov 2025 15:45:44 +0800
Message-ID: <20251112074548.3718563-3-honglei1.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|CH3PR12MB8329:EE_
X-MS-Office365-Filtering-Correlation-Id: 78ce8591-d1c9-44f4-850f-08de21bf8e22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GTKgue3/zNO5jPoe121MTbUhV3uG9PqtmXVMlIaL6F/oCQgQocHeBtOSNcdb?=
 =?us-ascii?Q?Sd6SXvZcVlLYedKOcrfMA3wLh00owB8CZankfhc2ONSi33tKu/azWYYR7aJU?=
 =?us-ascii?Q?g+fXQl64WftM7q0bOg1Jteq56dQW/IIlxoTvPOZms2IiuHU+LT/XT5Vwbdzr?=
 =?us-ascii?Q?B3EmBNqymTyYW8uv0qQPpqUF1DKEm2w4r3fQUHouet8Vws73z7wE/sevvZoa?=
 =?us-ascii?Q?UXl2fOoXunrB/NHa7jYdkMQzYUmaORv65UQGfF890NZ2qtNZ2ZBFdugUnMfv?=
 =?us-ascii?Q?96iCKg6xHbTcKw8XUfRXBn3JLNi/ZeZOI2m4OX5+Ai1GnpKDkX628Zh+GkRO?=
 =?us-ascii?Q?wWjnUGaEl5YN/03fsa4tUI9NrYTMmmuM2aDoGYv/apf82/73y076UxeWAL4B?=
 =?us-ascii?Q?wFIKAX1CjSyrGlvD3qCN6pxH+gRYLKBk5FWgIHqvVeRMwhiKs0JHuuduNJ0M?=
 =?us-ascii?Q?Ixx4OKy2ImCchVCRYoDdt2+oanGwlGXgkt4wcWgUrWQdusK2nNdHHRnTymlC?=
 =?us-ascii?Q?rqTA7oQ/4FESuyo8Nyyk2S0n+av2r7L1H+Q8Fh7TWcv/DL3RDC3bQLnzEULF?=
 =?us-ascii?Q?zW1+/dSgfGcQWE+qmfKZwITJV98mak0lFQERjJVm8tJjzIZYZtfIJQLw8Eif?=
 =?us-ascii?Q?rQlIrX2n0cbS4Op8qH8Wl06WCAdDBdipv/QMDFXW6Ko7fd8XFCpHfFdwdMGM?=
 =?us-ascii?Q?Dqf8x0bvDdZdsa46PTTOF4a2NM99Grshwh4laE3Vk4neh3kvKfjYYtVivWFz?=
 =?us-ascii?Q?iopY0Iq4YBiBTevsCcvD0escl4Dqv8npWFrOsQCObgVdi2dJdiiy1XfwkuFy?=
 =?us-ascii?Q?bWaUGjTZ+ATIBW+Bvp+sp2w9OV/vTRgulnN2cz8H6LvuGjW0XHGLcxufmCyr?=
 =?us-ascii?Q?kBeHl9EP71EkriI318peGId8syqQlubgrcwirZzUfRInwSGzvILG35QMicgH?=
 =?us-ascii?Q?PqBGjMXPe81Gno0sgF0redtyh10pxyWulYJG84p1Wqi01q2Nv2AZnb0wqfD0?=
 =?us-ascii?Q?iFRxq+8RsJ2ppZ5z4hIgvRibL2JzoLuNq6VoV3lbCdn70ZpBwtDcXjdyzvSC?=
 =?us-ascii?Q?NledKto8gxRWkG3+FvvKtN6wZVpTBnjeK6rqAN1SWikNDUxq6oppWHkFNvND?=
 =?us-ascii?Q?hbUGud5MzwmQOcAtYY1tFVwC3MsM74wHC/6fhoQNtkzxMjFXJEgEqQqO/MpR?=
 =?us-ascii?Q?VVU1rU72VtAkTGy4u5bh53Io+h7k+5U5dzPwqrFebnNHZuec0LvDgxTshtBj?=
 =?us-ascii?Q?Mc/YCa+s2TmGq60oQYQmrk1GWvJ4KEwIZpVppOyMWiFdmqc3gRWeEPw2TC1N?=
 =?us-ascii?Q?VTAfJt1GQ5DgxAvS8LLHYsxc35J3FCXHErq425qRNONl8V1w2AxdhsbNlPQn?=
 =?us-ascii?Q?nH3k3OxWrT9ZDRYbNZA4cD/CKJCExZZblOn1NJ3Nk9moQ4YQDc4YcwJk6cHk?=
 =?us-ascii?Q?6BKrOtC/uzdQvSx0CGYez2J4wacDLE/M77RAbjcG+gfSCAucpAYr74/06WQl?=
 =?us-ascii?Q?hx/W/Y+Z3Uh57W0CltoQF3ZlYKJWZL7MLHUyaN/SCuu1gDhlH5syLVIH6N/n?=
 =?us-ascii?Q?1MJrQ9lr/RrImtl+s8w=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 07:46:13.9407 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ce8591-d1c9-44f4-850f-08de21bf8e22
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8329
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

Add a new resource for blob resource, called userptr, used for let
host access guest user space memory, to acquire buffer based userptr
feature in virtio GPU.

- New flag VIRTIO_GPU_BLOB_FLAG_USE_USERPTR used in blob create
to indicate the blob create ioctl is used for create a userptr
blob resource.
- New resource type VIRTIO_GPU_F_RESOURCE_USERPTR is for feature
check and probe.

Signed-off-by: Honglei Huang <Honglei1.Huang@amd.com>
---
 include/uapi/linux/virtio_gpu.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index 30f5e1a9f03d..6138d35c7c99 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -65,6 +65,11 @@
  */
 #define VIRTIO_GPU_F_CONTEXT_INIT        4
 
+/*
+ * VIRTGPU_BLOB_FLAG_USE_USERPTR
+ */
+#define VIRTIO_GPU_F_RESOURCE_USERPTR    5
+
 enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_UNDEFINED = 0,
 
@@ -406,6 +411,7 @@ struct virtio_gpu_resource_create_blob {
 #define VIRTIO_GPU_BLOB_FLAG_USE_MAPPABLE     0x0001
 #define VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE    0x0002
 #define VIRTIO_GPU_BLOB_FLAG_USE_CROSS_DEVICE 0x0004
+#define VIRTIO_GPU_BLOB_FLAG_USE_USERPTR      0x0008
 	/* zero is invalid blob mem */
 	__le32 blob_mem;
 	__le32 blob_flags;
-- 
2.34.1

