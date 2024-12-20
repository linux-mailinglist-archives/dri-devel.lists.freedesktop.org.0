Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE759F8FB0
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 11:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9317510EF5E;
	Fri, 20 Dec 2024 10:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1sHCj/ZV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6F010EF5E
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 10:04:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDFlqeoVn9as9SICI371ANO7s3H+tiUIfDE/Ggg4JZNAK00/llAYxfiTcQgBZxSHIos7XTM0pwufZuQrLsT+QWpZ8e8Yn3e1bAzMZbS2GVnxxu/Qxd5hEy6zwX4IIQrv5b83/yCZKbNTBV/Ui532JcL7IIj3vDU4o7p2tkGnNRL4TOFs9GvIqBCtIVV6H+Kv/W4SSTbjMAHZNKkL9DAKI8C52CT8Xr7wt/02idSUuWjy+ci8fxH7UME0/537Fs/4qphibvkGmaq2bejOysp0TFtz+PXCvmwl+SzWNBx9Pqb8qNhzCRxPRxoCxdhMDRC+/CNP9wwc0aaEmSaI+HE3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBH9Yo9uMkdoYwQaSF1iiAQitS74rwVFqomdfW5w3l0=;
 b=xBv8dFA0JAmuQeQVNapU08HcMZiXIU7+1LK/Fr/mtVFGxmMqIkVGlOBDaD+I0Wm5RMCk1JxDm8qa3Cx9+xXtqk9kcTr2WVZOLBHkp0tWh6lWyN+EUp3U+Pb6jLvztx0Q5GJ0yFv3mUbB8HfgdTbNgfiyV9Gtj5bXof5ABn+X+m2lUQ/D4cD62v6pNBKVdlEBglcDL80/3uCWTBCsn9NM+nEiFCGTUQIKREBf2Lrv6UQ2Iu0EqnzS7JHUMHrLfHmex+mhCdN7VcWQCbtSX1qBejX9slUw1nT+d6qWFMJ5/KN1XPxKvLexWJMd8fX5wOsrJtZL6pvZdx5vvIAgHKLn7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.linux-foundation.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBH9Yo9uMkdoYwQaSF1iiAQitS74rwVFqomdfW5w3l0=;
 b=1sHCj/ZVLVavjOk3u8+qGxsX0N2DB0vVZaJnDX6uH+yH4Zw5l9FNR5W4Il70C5KRBpYpKZg40Vr46+WbBv4m/bH+qZtZ3gNuk8ckIvr1ZUZDtCyhLGjy5i25opyQq/aeDObOgK0ONe2DXOBQDj/lFFA0OGGRhRYw+m4vVz4Mawo=
Received: from BN0PR04CA0175.namprd04.prod.outlook.com (2603:10b6:408:eb::30)
 by BY5PR12MB4307.namprd12.prod.outlook.com (2603:10b6:a03:20c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 10:04:27 +0000
Received: from BL02EPF0001A0F9.namprd03.prod.outlook.com
 (2603:10b6:408:eb:cafe::51) by BN0PR04CA0175.outlook.office365.com
 (2603:10b6:408:eb::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.16 via Frontend Transport; Fri,
 20 Dec 2024 10:04:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0F9.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 10:04:26 +0000
Received: from jenkins-honglei.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Dec
 2024 04:04:22 -0600
From: Honglei Huang <honglei1.huang@amd.com>
To: Huang Rui <ray.huang@amd.com>,
 <virtualization@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 <dri-devel@lists.freedesktop.org>, David Airlie <airlied@redhat.com>, "Gerd
 Hoffmann" <kraxel@redhat.com>, Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
CC: Lingshan Zhu <Lingshan.Zhu@amd.com>, Demi Marie Obenour
 <demiobenour@gmail.com>, Honglei Huang <Honglei1.Huang@amd.com>
Subject: [RFC PATCH 1/3] virtio-gpu api: add blob userptr resource
Date: Fri, 20 Dec 2024 18:04:07 +0800
Message-ID: <20241220100409.4007346-1-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0F9:EE_|BY5PR12MB4307:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d9f759d-acd5-4652-9bb4-08dd20ddaf9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|82310400026|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hKKsQVnmJdY5dFpHyW2MVgA8rNlHwpgVwnibD/0v50gJoCCT0ATAOi3pvUUw?=
 =?us-ascii?Q?PSmb0CDL82hy6Mwpkt/qsBJuFe2P7lh4VJ6TC5jHQ9DmgDB78YfonQqp0ac0?=
 =?us-ascii?Q?/wzJoHXFzpsrf0mbTBcDpO2CQ3OELsJyDmpA5jStA55iHst3/Oeo2MdD6KOK?=
 =?us-ascii?Q?JSHDyvWhN0FbmSJWU0/GZCVa6JVbd1bqnUKc/j/sa6AFtlrSoTAhSsSQ710V?=
 =?us-ascii?Q?hEJsA98yOgDSYD3xOBEeTo31lKqbK9qdAjzUME+IjpEAUmVDfQnWFMvGvu/y?=
 =?us-ascii?Q?fchb27zmiQRH4jtz2VPoLAhKC1X3oJiRk0zmzT1v+WkrUzHEm3Mx21zNU5C6?=
 =?us-ascii?Q?CIHOh/pgGUKSY68A/vOxCgdT2+Tj62Q0thhDtImz93PUEqVp5W7+ANToesbP?=
 =?us-ascii?Q?wrO5j/UixG+AY2iIolVXzRuvtEnjcPyQKoIBgig+naQHSiK7DiDqEhcBi1ju?=
 =?us-ascii?Q?T5k8OVPMyW5M/KE2OEcxGHrkuQPiaFGws6XFQpZnHOUYSttHZMU5r4DkPlHl?=
 =?us-ascii?Q?7qHwb3z6qYclwpC0qBr6DH5NjJlJkC0/fDH5Wmlr6sFQNr/QemRoK7KEqf6S?=
 =?us-ascii?Q?PVgt7DSj815xftjRi/zFhATbK7PPy8LFKIqxCtMxlsCht2HZMJ8lZ2YuvX/I?=
 =?us-ascii?Q?mDK2EaP/LPgtQBB8/5uC/rkQdZ9o4aOkF71gEU/5T13VfWBn7Oxgqt2g2nEv?=
 =?us-ascii?Q?9a+PvIHf8npu0S3SbJRmmxp8WqSO9BxXbWSaVUMIHs9mZTsk7nJTE1ZFkvf2?=
 =?us-ascii?Q?B+nIrZb5YTOQ8OlCzMGv8/bV3M+ddW01rYm1e25Bj7Pt5Se5nDcGTw2VaqHP?=
 =?us-ascii?Q?sXNT2Zka2hN1PF35VG7TYGIryuRg5+WvgWFbN8qKoHIr7sEYaJB9e8zrkTJ1?=
 =?us-ascii?Q?nopNt4P/xeEHmzC1mCwZmB+yGIy+eghhlknKqRaOVzf9Ve7J00zmkgbxB9hd?=
 =?us-ascii?Q?qg4flMVSpaDZOdh8gKI1iAA0U0pJNrY4vDaF/IuUvrQmF+/B3AZd27lITJoz?=
 =?us-ascii?Q?KOvEDFPuzGag0tjVxgygQkMLfVbho3WADRzxX8Rh6I8m/lWJ0VIw6cwjUaYY?=
 =?us-ascii?Q?5/QZCsOiICiQ6G4yjb1c7jxN9znyEDw4vM6IgSMFvQnUJYUY9C7o9LUbt+Xj?=
 =?us-ascii?Q?5wCEwI7pafCOWV0SIuaWRP4KVqwRd9AJoxt4kGuSmvp8l5hjUAgKL/QAyDoh?=
 =?us-ascii?Q?Y8l3X7O+2/trAnTfdMhPRhN+RiCKkzWkbIpvm5TPPnaHch2scnI/obGTKcpO?=
 =?us-ascii?Q?oDf80VDMfqjEWnicXsmp7dsd2Dm+zHH4AacnxS/djWvZ4DhNFTMpDoQgI+qa?=
 =?us-ascii?Q?wCfkrlZzg8p5noIEWN9Az9mBywpKOBgqDnugeMALGsVRIYX9AhPiEr5uUOA/?=
 =?us-ascii?Q?tp+0NZshMY8asUwmDQc4oZI48SH1irZxEMwT2sYHv5J2P6ObwmcS8c7dfJEn?=
 =?us-ascii?Q?SgkMYrSthdtGP+KR+X2vkCx3cmiTB1ZM5zCPzByQMfIYJICfWK8YNsERJvmJ?=
 =?us-ascii?Q?koPqYyR5yDUb5oM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 10:04:26.1859 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d9f759d-acd5-4652-9bb4-08dd20ddaf9a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0F9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4307
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
host access guest user space memory, to acquire a simple SVM features
in virtio GPU.

- The capset VIRTIO_GPU_CAPSET_HSAKMT used for context init,
in this series patches only HSAKMT context can use the userptr
feature. HSAKMT is a GPU compute library in HSA stack, like
the role libdrm in mesa stack.
- New flag VIRTIO_GPU_BLOB_FLAG_USE_USERPTR used in blob create
to indicate the blob create ioctl is used for create a userptr
blob resource.

Signed-off-by: Honglei Huang <Honglei1.Huang@amd.com>
---
 include/uapi/linux/virtio_gpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index b9a9783f0b14..0a6b56acbc13 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -323,6 +323,7 @@ struct virtio_gpu_cmd_submit {
 
 #define VIRTIO_GPU_CAPSET_VIRGL 1
 #define VIRTIO_GPU_CAPSET_VIRGL2 2
+#define VIRTIO_GPU_CAPSET_HSAKMT 7
 
 /* VIRTIO_GPU_CMD_GET_CAPSET_INFO */
 struct virtio_gpu_get_capset_info {
@@ -415,6 +416,7 @@ struct virtio_gpu_resource_create_blob {
 #define VIRTIO_GPU_BLOB_FLAG_USE_MAPPABLE     0x0001
 #define VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE    0x0002
 #define VIRTIO_GPU_BLOB_FLAG_USE_CROSS_DEVICE 0x0004
+#define VIRTIO_GPU_BLOB_FLAG_USE_USERPTR      0x0008
 	/* zero is invalid blob mem */
 	__le32 blob_mem;
 	__le32 blob_flags;
-- 
2.34.1

