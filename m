Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66320A6B59F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 09:01:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596F610E6F1;
	Fri, 21 Mar 2025 08:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TQt5jcGi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C14E10E6F1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 08:01:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMrhfIRXwM8k4V/tEHN0jwxqghy7O00YSu0soNUXszkIdy8MDvrwWa87b/eNS0zlvOf54v4PozMWt0/NI25VJrNhjQBaIBwEiVq4DtfGoBCCPc3PGSXfdG3QtMPLDkScKH2IrYuu3e/Mo0/jxSA8yc9Hcl0zAEFBiw4uEK9AN0F6BoDTC8fXoUDgBR9efA8yf2LaibHBn2FtC3cWUMbsxNCzSG3pNNwMzaxlkM1/B846cP1bnjzn7UDjyY3FnKxiLqcokR9gs7Cg5Ye0Vi4rfNKxYK3BrD5nI7JZNxD451yjXG7J8SUNcWz/LuRf1puJIzp6ZmF8WlCbXdbsRUVgNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7KU4m1vzDsrak9K7Kb5zJidiDTzfM0WnlwapG1RB7E=;
 b=Z16i6pHdfkIemDVMvSoSL5J1lg33zNqzF6uGllPPgAVcNDl3H7GU5LEhauXcwbYXy18wbqOoDpwpZaP44ML+RNabObYdk0OTqTi9sfk7YlaE6RnDWQwhsXfVAXNJCmqfVHBXrPnkgHRPbbRhKmFufh0yp52KILIwzWB2dtlTmDn/oxuQqQ0Qvy6fj5w9mNeatt62ZX8SogIP0UQt8nkabe2AVL4YBAH9qM+XvJkoUrkPMRqID7XLyMhbH3hj6VLDW4uxENxNOU5fSgrYRHHUOxoZQOTucEqTraNofdoqNdVYYxZrHJdIST4g4LIBn6PFdKoJqWdkCSNvOM0HKXYfEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7KU4m1vzDsrak9K7Kb5zJidiDTzfM0WnlwapG1RB7E=;
 b=TQt5jcGicm8LiSt5nUnWVFdFT2goBY+MPZuE2uZODEHe+pyg7CMS+AXLx7vfRaczLTgCtG3aR+eDJP7zZy9hGroKk13j3oy0MPknQgMkescMKEyZPEoINzTXMUc0DziXOkT9siKqotDGoXsL12b0MD4rS//hCC84+c+LmbCileM=
Received: from CH0PR04CA0024.namprd04.prod.outlook.com (2603:10b6:610:76::29)
 by CY1PR12MB9626.namprd12.prod.outlook.com (2603:10b6:930:106::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Fri, 21 Mar
 2025 08:00:57 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::8d) by CH0PR04CA0024.outlook.office365.com
 (2603:10b6:610:76::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.36 via Frontend Transport; Fri,
 21 Mar 2025 08:00:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Fri, 21 Mar 2025 08:00:57 +0000
Received: from jenkins-honglei.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 21 Mar
 2025 03:00:52 -0500
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
Subject: [PATCH v2 0/7] *** Add virtio gpu userptr support ***
Date: Fri, 21 Mar 2025 16:00:22 +0800
Message-ID: <20250321080029.1715078-1-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|CY1PR12MB9626:EE_
X-MS-Office365-Filtering-Correlation-Id: bd1e08d8-c749-4314-96d5-08dd684e8312
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fn91e4is5a6Pc6ez6g4EL3U1G9qEPr1UDTf4HlMGsQq7AvaVUKgQcKAd65jL?=
 =?us-ascii?Q?cXf7R55qNjSUFohgzMKB7PGu9npP1Y+dFw50oOFUK97qNyx730L89HE1Uw0B?=
 =?us-ascii?Q?K6TZ73zqnx3cPu+9s9iHyHmSj/hM8CKyED5TXXoDCMIQct6N89mcB2nQuUj6?=
 =?us-ascii?Q?ByRHD8IoUsPPQWRqDpm3VAWn/8gItU0LXDO5hrvVP0QhbOmFMA5p57abiLVl?=
 =?us-ascii?Q?D5oDO5LDzIizxP7FuK8ce63a7+EMqEm8HgJYRKtIf/pWnAFfcPtrNoWOdEg2?=
 =?us-ascii?Q?IrJeQDiP+ZZcfgguOb1hDp6CKFwvi0qjwv7znQg4lOw5pwKILSsWRnmVVZMQ?=
 =?us-ascii?Q?+IUo5gc/1UaUaBfh+CDaBq7g7g8qJII4mbqidKSc5HsOKok3OoI8KaxJhu6V?=
 =?us-ascii?Q?wXyoKDBRcWbxUQDGbWN8zT/MTxqaXLbGwIP6ukkhCLNd1To/Dezcps2WR7Xq?=
 =?us-ascii?Q?ifCNttxADGWvklQjkU83RzP4xtctncqaJdn+RyWGwrBukCgyGFg99mM4DeaW?=
 =?us-ascii?Q?oiklQkqwf4x3h3REQEWCaKd0mk5u4FRTKPKBzzT3wiW+SxQMV4zhCyNwFCt2?=
 =?us-ascii?Q?8qL7zWUr3mZLhLnRpDvzfuHPef7qoz+V8SRJTKPUH8UxnLG3YUFDOwgrd8mb?=
 =?us-ascii?Q?x9zWUdJjwVxgdZ6NYt8aMIvRZkTiJOfR6TF1ZnkCqPcQY8QQoQnrYZTbKDuO?=
 =?us-ascii?Q?IH1siPsT7qNUo5cLl9uK0Ernr5SFeCMNjynUek3EGhZIhtHYEcor8fIsZbwx?=
 =?us-ascii?Q?siGuZ4YVhM3yYAuyoftpUG2SQv2GVyCLUpFzkA7Du9ZKr94Uh5ppm4pLgACA?=
 =?us-ascii?Q?5tsDDz5zJOi0xObrsYR6MdBRYNC2itZkTM3Z1ZYoBmDFKi3BFEzBg7v97Gib?=
 =?us-ascii?Q?6AhKZRHVbprAyrM5sbCmYynIndjZmzti3FbsXQ5aAwTFhdHfs2eCDMQjW2/P?=
 =?us-ascii?Q?4U2/RydN1tK3kGqtKYJbGCULv1yM3Vni4CMvEPWkptsgNR3s3e9otDBWZrfi?=
 =?us-ascii?Q?kWfwrA/lYt60mk+cqjKGRudk2UeQtXogl98HAEIKXM6NlUQ9liCUXt8dnYmK?=
 =?us-ascii?Q?wJGOAd3YV6ztjXIuBQtZU8QYatR98D0qV/GGHWNJGJxRvMSJYnmz4TkyviUW?=
 =?us-ascii?Q?/mlsmjGivGSRC0lxJ+Dsc4im0oXUf1Kkb7pFm+AwI2XG2vgM4/PCqj0oy1Lp?=
 =?us-ascii?Q?6RVjm8iVV/xKLz0xQFmFTGkvOj0b88+CJ9xD9wxCijSRPjHZpfZo79Kpn2M6?=
 =?us-ascii?Q?U9HpWN0METLeyhTitl/QfMj8nyla3S3bqige5QPZBuKxICx98X8WzVuj7enb?=
 =?us-ascii?Q?nKiy/Zr7O0ipXwgZKUSDMLFSfvPAl9ZYOd6s/ptn2VUtK84xDunQarbl4kEb?=
 =?us-ascii?Q?PYAazgG+YIig1WS+p1+IYYKc/UxZIvkmU83Ld0K9+vnvHbSaVBY3Op3/qubX?=
 =?us-ascii?Q?JqUCzmrGi69b1qQgirf/dRLX1dkdlEJDDXbGF7VAUbGkve7I03HHthwMIi+n?=
 =?us-ascii?Q?MUxjFY5DAFJi5iK50elWmncvyP6baRnJWf93?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 08:00:57.1468 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd1e08d8-c749-4314-96d5-08dd684e8312
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9626
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

Hello,

This series add virtio gpu userptr support and add libhsakmt capset.
The userptr feature is used for let host access guest user space memory,
this feature is used for GPU compute use case, to enable ROCm/OpenCL native
context. It should be pointed out that we are not to implement SVM here, 
this is just a buffer based userptr implementation.
The libhsakmt capset is used for ROCm context, libhsakmt is like the role 
of libdrm in Mesa.

Patches 1-2 add libhsakmt capset and userptr blob resource flag.
Patches 3-5 implement basic userptr feature, in some popular bench marks,
it has an efficiency of about 70% compared to bare metal in OpenCL API.
Patch 6 adds interval tree to manage userptrs and prevent duplicate creation.

V2: - Split add HSAKMT context and blob userptr resource to two patches.
    - Remove MMU notifier related patches, cause use not moveable user space
      memory with MMU notifier is not a good idea.
    - Remove HSAKMT context check when create context, let all the context
      support the userptr feature.
    - Remove MMU notifier related content in cover letter.
    - Add more comments  for patch 6 in cover letter.

Honglei Huang (7):
  virtio-gpu api: add HSAKMT context
  virtio-gpu api: add blob userptr resource
  drm/virtgpu api: add blob userptr resource
  drm/virtio: implement userptr: probe for the feature
  drm/virtio: implement userptr: add userptr obj
  drm/virtio: advertise base userptr feature to userspace
  drm/virtio: implement userptr: add interval tree

 drivers/gpu/drm/virtio/Makefile          |   3 +-
 drivers/gpu/drm/virtio/virtgpu_debugfs.c |   1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c     |   1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  48 ++++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c   |  20 +-
 drivers/gpu/drm/virtio/virtgpu_kms.c     |   8 +-
 drivers/gpu/drm/virtio/virtgpu_object.c  |   5 +
 drivers/gpu/drm/virtio/virtgpu_userptr.c | 351 +++++++++++++++++++++++
 include/uapi/drm/virtgpu_drm.h           |   5 +-
 include/uapi/linux/virtio_gpu.h          |   7 +
 10 files changed, 443 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/virtio/virtgpu_userptr.c

-- 
2.34.1

