Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2346D2E233
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 09:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD6210E830;
	Fri, 16 Jan 2026 08:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="euEdhhRS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011013.outbound.protection.outlook.com [40.107.208.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D75B10E830
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 08:39:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWEXGCl9dhyfE/TSxJAXXjOTwZA+rVrAhE85JjelkewUa7K8tzVVMUsreiLBh9CRK19dV4rXSRh2flRPolzA0kzUSX+vGaAzv0ug0+b6HVdDoGU5XVvR7Bg7GVX8yhNj1lK2QNVfM/JsymM8pAbHrzbs37iaA6eZ7avLQNkKo1YfhTjrDrZXRizBIlinad/qkmCJpmnL4k0nHDHC1UQE491c/UWrSE5Ard9xDEJaM4+p7UUYVgFxO1MHG1Blro9SD5cFBCzLngBdqaqHocD4mYwpNdnthaRcPPr6loU7cyAjRsf3FYULyRJg3UjlZ2d4cN3cY8AOn/Ny8xkGqlwYuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frirTa/ES7xf6ayzcn1JhI7J3x75TTJygVkGyGfvZ4E=;
 b=Y9xU9IxftekWZ0TLhPoJLE4o7dLfmqp/gsrEpvSpxM+ncJPRbKHfuS7KDS8UVRGs4Zdy6vW8+MQUAJUdJUi4WjsEUQmzCe3n3g44RhWe5hl+ubNzIdIyfdRb9oi+l5sJyHRMDN2WoZiGdVhiUoKnjRyobzdXLkekenvQs/W3jpOl3Aq+ib7KVworlub1kfRniXI0C6VnHRPd6hphdfH1+Ftkmy2lvwdvTkhKBbxQWioEcHfaVEzASESpYEMFFQzvCGzaXlBNfbju4wJMKPfWaQsVdf1M9UiagA0rozSoX54L77jowBvkeIZRHaV+yccYXiAfrhqTRl27H+rBs2mVwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frirTa/ES7xf6ayzcn1JhI7J3x75TTJygVkGyGfvZ4E=;
 b=euEdhhRSkJEvyMlUlgdbbgzy13vVUHxF6f6TzIZzN4pimZIiK0vxy0FIIkuYrJ1+C1XLWM6vcpjd7WNosCTiZSDQzTy9Ne6Ksz0VzHHODAZpNVGQBPFgGEFYKiXAQeMxMw3AnZAZiHv/5M6HhFhusDZpjgxDEfMAH9YNJjB64P0=
Received: from BN9P222CA0021.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::26)
 by BY5PR12MB4228.namprd12.prod.outlook.com (2603:10b6:a03:20b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 08:39:08 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:10c:cafe::3e) by BN9P222CA0021.outlook.office365.com
 (2603:10b6:408:10c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Fri,
 16 Jan 2026 08:39:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 08:39:08 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 16 Jan
 2026 02:39:03 -0600
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
Subject: [PATCH v5 2/5] virtio-gpu api: add blob userptr resource
Date: Fri, 16 Jan 2026 16:38:05 +0800
Message-ID: <20260116083808.325180-3-honglei1.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|BY5PR12MB4228:EE_
X-MS-Office365-Filtering-Correlation-Id: b95aed3f-a266-4b91-bf45-08de54dab6e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JyZ9DdT6jizpxpPx/zbjRWi80Y/tZIV25Hc4CArrIEV+hx3BXy/jiutSOKSl?=
 =?us-ascii?Q?NnWmkAsOTN4N4vQ36NEF/+Lj5ribcumMEgHlccoymvN1jmrTrWWgNuDqkaLR?=
 =?us-ascii?Q?qxhGiSMnDiWAG3avOqkT0QHj5Gha2gX09+BiftwiWhYS9mpOu1B7NACV6lIJ?=
 =?us-ascii?Q?z++D8+NRB4SiyHkxTpRHwUjg6h+w/SNTkxNYxKqKJXnvvwcaeBBds0bESKko?=
 =?us-ascii?Q?1AnXSQ7GAaxEtsQLRm5xgPPuDqGA9sMAU+Gu5K1m0JCxKe9OecxP1wq0yPTy?=
 =?us-ascii?Q?s2qnBceTjMM8a2KOzQSfJlJliPJD/xbEYzROl15B1BdhNU8vkPLdEMvLvWKG?=
 =?us-ascii?Q?UJV6vePA/jMNjAjIZJMpFhrRvuD3RhMGp/J+wxSKMDE5Z1Y+4JJ1HOfkXkMc?=
 =?us-ascii?Q?FdUYwhf3qtcY+PUxwzev4nMRjwVV1yRJzx0BCJwzglSIDqcxkYNWCZGwPLM/?=
 =?us-ascii?Q?4yaijoAA+mJMDUZiq4MvlrhiLjLa5eWs2lVvFBV3xvvJg5Jgbxdkn9nYvt++?=
 =?us-ascii?Q?KhOxdUcqqHf8f0qHd1erWW2hQIMNUPyZvJZeogVvi/iXC7ImHRBGwZwZBFns?=
 =?us-ascii?Q?wxyit+PE24W3cnqV+Z7JF8IPnOcUMxHYt418JiQUJCVUI4JHAFgGGfFXnivI?=
 =?us-ascii?Q?QqUpjsc5qMLfSQEGS4Ryym0CkSAp/5MDg8/cPXCevTMMvT3WCrOnajT5lByS?=
 =?us-ascii?Q?Uoao/z2hZTMudC41F0v1+NZaeFXfuj7PmgLheXr4jxjoBa0Xh6igDFW1J9i4?=
 =?us-ascii?Q?+HXkmcR8hIwEapdzODJGFubcWjeLA5gOful5ahyJtRxpGeXCeTGC2wcT/JN4?=
 =?us-ascii?Q?BqAxapGjgps6eIwEsllccRafKt4S4oKm5LakIh8he2e7pxdYeKU49mjl+izN?=
 =?us-ascii?Q?s+vpQlbGo4o2dI29gqtgjHaW/Hb390+/iK4rRCHjTMq7oxIwJ0bw3L7lNx5J?=
 =?us-ascii?Q?bQrknvgitvdGC7BX/yT4R/DfzGgIy7i4J+hYn+HJpuOQp/Rdyz3Kk3+T37pl?=
 =?us-ascii?Q?t+a0x7MfxOf1KlAvQV6M+tuLQ/YSnx3sdDwaHKVwxToNcoLMZCm6/pazc8tw?=
 =?us-ascii?Q?TiBZdbEgohGW6dm5plePjLrc9NRcDHwbvXRXCvWLR7jT8lCZFwn6XLh4uQd6?=
 =?us-ascii?Q?54knrQVzq/iXHeSEuh6Z+3ze9VZmhG5+lczujz+sp6MJr8I2RJ6+sTTKLLYw?=
 =?us-ascii?Q?pNuICO/VVVT7Y1RyWFi+BK+LFt3cdwPe1j5L3Hqk9AiY6/0m4QMUxWD8s5if?=
 =?us-ascii?Q?g5KsHDtU43x4jKFTiRh+kKqzVkwF0JDwCnL/lxXxfODFelasFYPcZeAJ4kwT?=
 =?us-ascii?Q?Rtnc57zNJJrSTaDmNhMJ8JMn9cWHC/PYMyXOzVKmIve0jSeVHWbPZHJM4CVw?=
 =?us-ascii?Q?zg89YNkuyocC1MqhAZqrVfpJ/cobBOKxIwUKzvcEB4GcJInWrgjudZ3uhYK6?=
 =?us-ascii?Q?COKLB2t2d0pajDmI9fM2NfvM4j7NDWIz3PbyyZJy9KxehJwtnDhAbFso2irw?=
 =?us-ascii?Q?FoBSxzRmY2l7733b4o9ecyLEjsBjm2Ez+GqmtJ56LGdraIkQ17Ty7ctmzNEx?=
 =?us-ascii?Q?aPnL9vIs46yBvbvbASfQvwGDz5XMnIcWddV/ysgT7GTYqK42CFNjODy3Di6f?=
 =?us-ascii?Q?qx6Owa/hOVSRftWFram7xTcUVRm9sq7uLMTxoC0u+54sZnxTwrrfgD3kpcPY?=
 =?us-ascii?Q?G7hdJw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 08:39:08.0998 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b95aed3f-a266-4b91-bf45-08de54dab6e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4228
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
- VIRTIO_GPU_BLOB_FLAG_USERPTR_RDONLY: Indicates that the user pointer
  resource is read-only.

Signed-off-by: Honglei Huang <Honglei1.Huang@amd.com>
---
 include/uapi/linux/virtio_gpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index fbd1838d6..436c8aa25 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -406,6 +406,8 @@ struct virtio_gpu_resource_create_blob {
 #define VIRTIO_GPU_BLOB_FLAG_USE_MAPPABLE     0x0001
 #define VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE    0x0002
 #define VIRTIO_GPU_BLOB_FLAG_USE_CROSS_DEVICE 0x0004
+#define VIRTIO_GPU_BLOB_FLAG_USE_USERPTR      0x0008
+#define VIRTIO_GPU_BLOB_FLAG_USERPTR_RDONLY   0x0010
 	/* zero is invalid blob mem */
 	__le32 blob_mem;
 	__le32 blob_flags;
-- 
2.34.1

