Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AFFD22F93
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 08:59:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C5910E6F0;
	Thu, 15 Jan 2026 07:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SvmY4m8V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012011.outbound.protection.outlook.com
 [40.93.195.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011A510E6F0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:59:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ulserG/Dj+g4OjSpblf1Gwgojk/DnTyB5wYdH1RqJpCS4JgQ98L6XaRr3D3/p+W+QThokANr4yngqXuZFM2REA/bD4FteuYFfZG9t+f7aRa5mMEMEUAQQRxTyNi0I9jW6bVcJXmN8C1mZ/Zbnf2qb3IsEpg4wzFv0CZRnMRQpVJhJ4JgRIrA4z8Dtk2rQC/+zsX8FMEufRfz47Zz6RuFFiYuIVZb9nhdRzq9swEUbM5YeoxW9S0OlBHwWXUBEy/lsnApVv9stxe6kge3jaoAJqV2xDtdTJoyiHJeKRR1RHG0ZeW/58UxfKK+RPHLvTCXuM7CzvTcifbEVmPFQQ7d+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dwV2w9sFE0emkS7L6VUev6yvDCBIAm6qFnKR9wh+kI=;
 b=K3VogNOCSx0WtCO/6o2FBmNoUjYgxFNd+3vZwOPjtfUuCS7megZodlzFWIdRhnikePfxjC53a7Tv4XmF2riUsG1gz9lJr4JPJ66gOz1NvluReXb77qsmrEu3Y8YlMfzI5baLVm0z1FqBSnWD3K2EC0nmnh0zvjDls6+V24eBNkf01xT/ReG5yHy3gTvD8xbV6xyafr7zTosYECdmFKI+dXnL8x+TW+qECOboLsV0QuyxiwymZ1Maxs/8gQjYvuq3t/t/5Y89FzVWn4xt+pNLUbEOS0g2c1qeRy2+7DPg6JVh1CQ+FTA4+jmG2xBpV1I3EWVnlm+wIil8U5CNGp+1pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dwV2w9sFE0emkS7L6VUev6yvDCBIAm6qFnKR9wh+kI=;
 b=SvmY4m8VYUEA7McD3mhGmeIhgIfSRlpOT4na9Nft+jC2JPsqaS1QsH8o4jTXVDrENFU767G4RyVFfaaSud6f29iFMJD5eKVddbyxNzfV7iBrKFG3GVtM0TPjaMR0szcMyVmuhmR8Mc/S5BhfO+MjxMEBUSVYU+PdAfjgWZocNcE=
Received: from IA4P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:559::14)
 by SA1PR12MB8644.namprd12.prod.outlook.com (2603:10b6:806:384::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 07:59:22 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:559:cafe::df) by IA4P221CA0011.outlook.office365.com
 (2603:10b6:208:559::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Thu,
 15 Jan 2026 07:59:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 15 Jan 2026 07:59:21 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 15 Jan
 2026 01:59:18 -0600
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
Subject: [PATCH v4 2/5] virtio-gpu api: add blob userptr resource
Date: Thu, 15 Jan 2026 15:58:48 +0800
Message-ID: <20260115075851.173318-3-honglei1.huang@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|SA1PR12MB8644:EE_
X-MS-Office365-Filtering-Correlation-Id: a85baf6d-b245-4378-4791-08de540bfe42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y/BtdjgUWk9aAysrhKbT5c8mPxB2p5HzokzRsiiJZxQGcEyzSnn5ZlxhH3kQ?=
 =?us-ascii?Q?c3vonKg+QQmnpw+5XVjD6kLYsyQcUpT1Ku8IaJ5qNH3Xu4pxoT+5s+vI2KSQ?=
 =?us-ascii?Q?0GQWlOJECcQti9tLIWj6XBqECiaABG8IHGM9mLrFgSkGDd2fG4NS+IGSXaGX?=
 =?us-ascii?Q?FEHd73KfUbjxQdhvVtmBmRiDaDjTAsrBb/XRVhIlQSCkoM3mWExxhdQwr0OJ?=
 =?us-ascii?Q?MBK5hgIq6pNvpXqDK/3K9PF/CgObCYwqfZVU4BTZABkd+tFKDjQKOTQHcVeJ?=
 =?us-ascii?Q?IcHr09gQfUson4TgLhMG1gEs1Kc3kyWmErO2PyIVT3eCp4wILpgoPdryKuUB?=
 =?us-ascii?Q?MAletBEeZY/lCe5FnApo01Zr8259kH0oPKeFKxUiU7nxwdcAhdbUPnzFfhwQ?=
 =?us-ascii?Q?LizgF+TnOtd1ZoQDgFMwFC6g15HonFGs/FhEy20q17iQJt7V2bcziXe73Aja?=
 =?us-ascii?Q?pmiVI0vBwNXYp7pJyHOSCXvglBxao6U4pDzZggTmSH6BIxr7cTUH40XatQQK?=
 =?us-ascii?Q?6nmLr1HliFGM94mrBE5+xL6OWC+sLZ9rtbMSScLOPBCuY9Z22QhkIOKXgFYm?=
 =?us-ascii?Q?qK8TFGLkB8/BUYW6W+b1COC37u4L6hgSp5cTqKSKC2zJ5J+qf28gJQUMCJ1g?=
 =?us-ascii?Q?u/eG6ahjlQanxcmeELUay0bZ8x4Ir+3trN1ynYNwExzT4JuXP6qdzEXyxdth?=
 =?us-ascii?Q?3Gf7rM1ktjYMiUrLIy/D4NhV60aw0+gttUkMAHqC6gxtvZ59KA7YuUcRjVm2?=
 =?us-ascii?Q?UZln3VtwxznPq3OkZv42tqACBWoADgRIstzJxNYPpvWARbCmiJ84YuDRjJ35?=
 =?us-ascii?Q?mE+/iIP3QSE1C9gPM0IR+DKNFMD3aCLD+6OG+sFep4NT3Cj4UMuIfh0frRc2?=
 =?us-ascii?Q?LfIx4ImZpGShLuYfb3Q1sxqtJ5IUUi/vaXvvXI0YCkhH7PXHkzjxjfjoG5R7?=
 =?us-ascii?Q?YlCaIUIq9eo5N1DlMBDXEI144Xwd3KVGP1niI2TsDlntDzIP5NkmRaSQbGmD?=
 =?us-ascii?Q?BEWE18fgy2npqQobv56b/23yrGilwSjsPC4A+5Jdnym/Qhzn5VXY/41TKorr?=
 =?us-ascii?Q?A3VJJ3zL6k9Y9jr/ud/Esvm1JA+yO47kSdIahCQovINojlvdaxIXsCpmhVCM?=
 =?us-ascii?Q?hLp8xG4D/o5KXi88Nz2eKBxIW/CEgCzZQRmnakgybJh0V3bySAFrjoW/3pBg?=
 =?us-ascii?Q?oWRHrcRLpW1Z4Q5md6lKPkcFzO3F9UH1kRSG0PJV7hjensl1lBign/7JtjIW?=
 =?us-ascii?Q?HTZIebwGZSm9Ho8tD2P9U6Hy/8GD5LO3/DDPuEF8DSgvvfS999SIj2AoKSax?=
 =?us-ascii?Q?HSWsq8+ooIXx1sQOWBSrUSUCi4tOeOcU5V8rWVMEdvcBDyb+hMyi/lcphcBa?=
 =?us-ascii?Q?fQLg7Nlgm0Xw3qUSotOVTAirgc8P66r3uik0idjSEVUBSbC2P4R1xzKfxGnc?=
 =?us-ascii?Q?pUksOjQxBSU0TsA403Mh+Ow2ZDJXYqQI3IgIybVStj2rmarE/bSgjFmNJDh+?=
 =?us-ascii?Q?ii4ebDm95AApLzpW+le1tcUVOksmd1qr+9Xma6Y4/y6B663TPsMewDSVabED?=
 =?us-ascii?Q?+44Zmia18K/Q2baRaUNOQ2fqSlBVpCZ7jhww/ZiDiF3GWXtyRP8sAwRn0adH?=
 =?us-ascii?Q?9mN90d1ZhS4elSVXCJmfwXTnweKqJ1pcDe8wyauGPpnuJw0BMPWf0gnbLhkP?=
 =?us-ascii?Q?BmEOcw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:59:21.9889 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a85baf6d-b245-4378-4791-08de540bfe42
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8644
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
index fbd1838d6..bf2d5f137 100644
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

