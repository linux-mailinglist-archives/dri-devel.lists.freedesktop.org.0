Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6783BA6B5A4
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 09:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B529A10E675;
	Fri, 21 Mar 2025 08:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="L9UNfCQm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2043.outbound.protection.outlook.com [40.107.95.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA54410E6F8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 08:01:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C786/xDapWiSRts68D3kttMq1v0Ma1b1GtjHtNAvQH3T+5NHsEgB4wKJBUqty3m/vXi7APCD6iKGqY9TbJYIvxUSRg/8KImLaXGxKGoXSs7Qa/wHBx1LH6vAWaP7B0B9zQjq9lGx5yTO2fc8yLuhzDGy1msn5UT0LvCTmFgO/SSub/co6S4Q7c6XQBrgIcKSXDiHurqATcgjaSTUxQuMxHsFlznkG9hvfQoTGiqvEiQaffBY0w5HGLdtDqX1YxHBhhFs1Et0/TudfjxWCzD2U8vlZ0akGhvyylta9eNXliszF0XiUvjYQQ2sKBvNgLhwv0dj/hGdE5NCh9//bP7icQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=In7fGXr2Og8bAq9giyHtVU28JQS78bosyKHcwiffr6o=;
 b=R6Rm9uZr077y8ojMsjmHDHG2O+isZMgC9rU5Elbxqtog6OicuS3sWtr7WphvvzaiscaBv+5ItxYKNOpUyWFwrbZOiXwxHuPcdNzqgm7LgKhbOixnEnYwVieuppnCzdW6zEV7XrModnfdTRxA/NmA7QtCIVg2olPayYZoOXWYB9tML4m2Q7n6w8bu0FhopPsOp9FaNOejP2ErBleBtL8hzCV64nrIOZOl3IS3nbflC8vpgH5kHWPY9/bzzf+ZG+DZCbRLtu6DxCTgRE4NyBZQqsSDDkV5twwA21u2DQ6T7f/a23RfeFfkJm2nVzV4hA41cH4IcKB+uBZxyW/iouE8nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=In7fGXr2Og8bAq9giyHtVU28JQS78bosyKHcwiffr6o=;
 b=L9UNfCQmPeeNTJk2PwhzJVD+vHtWHyjQ1XMbuJ12SMr88XmveKsqmfdj6p4m984nrL5vtFpSwHDk9f5Ny1nXwhSyL1+O5YTQxYjQZ0F6/svDpWq+3L8My/00+IkXZIoIO1EOw4rNnXWT7ES0YXqAigoU1OpFyiBAKUlt2pTL+Z0=
Received: from CH0PR03CA0292.namprd03.prod.outlook.com (2603:10b6:610:e6::27)
 by PH0PR12MB7488.namprd12.prod.outlook.com (2603:10b6:510:1e9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Fri, 21 Mar
 2025 08:01:05 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::af) by CH0PR03CA0292.outlook.office365.com
 (2603:10b6:610:e6::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.35 via Frontend Transport; Fri,
 21 Mar 2025 08:01:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Fri, 21 Mar 2025 08:01:05 +0000
Received: from jenkins-honglei.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 21 Mar
 2025 03:01:01 -0500
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
Subject: [PATCH v2 2/7] virtio-gpu api: add blob userptr resource
Date: Fri, 21 Mar 2025 16:00:24 +0800
Message-ID: <20250321080029.1715078-3-honglei1.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|PH0PR12MB7488:EE_
X-MS-Office365-Filtering-Correlation-Id: 26be5597-1176-48dc-f635-08dd684e87ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|7416014|82310400026|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d0c5q0Oa6yXvHwRieQBvjna9Fk18yo2iEt3YKcdg8sJ/FcCFq3NDGTyAZNbQ?=
 =?us-ascii?Q?sKMxRDu2sa22uUdoh7rs0sPKKGrxdcYZYOp0ncxXQwHR2Z8f9fQODLdF0x+U?=
 =?us-ascii?Q?6NlQK4oozy8vgjKZa4TnPE+J4K7xG2HJAnX3nXVGJkftsnfB472W6EO8F/tN?=
 =?us-ascii?Q?eEq4PsIreqmg8VpMJiblctEAAljPLqGYNDasyxduKIx1Oylxxpz0Fwuk728m?=
 =?us-ascii?Q?rKMqzgctLbg6H7cjrlS3BbKez+858Ahd+AEKlekZgis7Dc9zRFBCyHgMXpfg?=
 =?us-ascii?Q?gnLcJ+uLPCzUxkJ00sCSM9HO8NLEmnXwe0hmO3dsVzkT6KVAg7mjF4JikWcE?=
 =?us-ascii?Q?k2INLz24l6SiKcr0pr4oRdaTTTgqeRbWlLT+HDGyrSmXUeJ9helTh58WBBH0?=
 =?us-ascii?Q?ec6X1FTeh8aRWyY0sODCmKGKjaEXLpRoOaQEvMx6zIkYc7YWV5b4+wyL8pgq?=
 =?us-ascii?Q?p6gZapGJN47NrtcQ1BQbcNbL9C4z6YZDI3r3nGaO5t3x5twFyNmOeA/SRxIo?=
 =?us-ascii?Q?tU08HEMjkSqRLb4FcvIfwOhivqiOsBGrkvLtrr58Nt1yciwM2VL6pQyNP2eV?=
 =?us-ascii?Q?gXK21t67NOmcTLSZyxX1+IW/S4o4zSGT1vVe2VyIa0sgqJYLbEEwz35fj1ee?=
 =?us-ascii?Q?Sn4dsljbiZlQr6FRrptoh93wm2DxSQ41nGVUpF0vBlXxz5Qxobfg2HdFZpvp?=
 =?us-ascii?Q?pklgeBsz2HkfRivzWaiiQYsmAAI547vMBn6zQ/l+Lzos/EispVewhOIJ2Yx4?=
 =?us-ascii?Q?go7NjBVc8QieTo0MiFfW4q9nifLkuNy6Q1nKJ7Y5vfE8c/LH0sD7dhjr1OQl?=
 =?us-ascii?Q?033arTIv1dPOkEL/ja9hmCxRQXSr70uUSZm351AtjQtU6iuEdz8odqJohSQS?=
 =?us-ascii?Q?q8a9g8EEofOAKyPPn1iL54Us5ZMYXNAvROTXwzCU8Xf6tymyc476QSTCKLmN?=
 =?us-ascii?Q?xfk2DjLv76xTx0aN9xCrUab7+qcvw7+a2SUBigbmZqpNwF5d1gLlTqt6IjR6?=
 =?us-ascii?Q?Uw0HqUcG0nCvwMcpwrE5NJh9fWkba7wnEGbmqIB9iiF87VmUDXC9i3Vm2KO3?=
 =?us-ascii?Q?hoIa8PHIchnVqD2OghSLnvm3lQqLErl7NmnmrShsV4gE88qnbkWGxmrfRuMH?=
 =?us-ascii?Q?gtKg9TU3EXZz8QJXNKskDKH/b+sGJ1srTMTJUEfy+x/NoOIi7NENAnCGdGNo?=
 =?us-ascii?Q?UUCRhCmujN6/A1eUpTyI2X40va5EW8ksgrLkeiF8pQbiUzzOHmeJarjtq29f?=
 =?us-ascii?Q?fWsua1WfY5j1p/wnl+ETcoOfhRc8LxCJHDlG64Otm+lN/QjzMzZDSiH0sazd?=
 =?us-ascii?Q?G096v13juqO/Stnn7BW6lB1Ck04ndIxGPjRoz3TvlddBy8GubwnLgoYX38nh?=
 =?us-ascii?Q?uaLX0dvTvGeQcA5hQqutb6GSsXZB5534+M/Mn9UTj68PonSSukDzKHWhyKv4?=
 =?us-ascii?Q?EIqxX6vFbT4VwkvsRp3n2xWU/1/JLCtfn6qBX4jZ+se9oawYAtHwMSzVD9k7?=
 =?us-ascii?Q?Zv3E9iN45r6qNWapK/fL87BZSUZoC9eG6a2h?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(7416014)(82310400026)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 08:01:05.2132 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26be5597-1176-48dc-f635-08dd684e87ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7488
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
index 331fae983193..4da36a1e62c4 100644
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
 
@@ -405,6 +410,7 @@ struct virtio_gpu_resource_create_blob {
 #define VIRTIO_GPU_BLOB_FLAG_USE_MAPPABLE     0x0001
 #define VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE    0x0002
 #define VIRTIO_GPU_BLOB_FLAG_USE_CROSS_DEVICE 0x0004
+#define VIRTIO_GPU_BLOB_FLAG_USE_USERPTR      0x0008
 	/* zero is invalid blob mem */
 	__le32 blob_mem;
 	__le32 blob_flags;
-- 
2.34.1

