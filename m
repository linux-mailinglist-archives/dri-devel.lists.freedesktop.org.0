Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A46A490E8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 06:37:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4981410E1A6;
	Fri, 28 Feb 2025 05:37:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AOf9GvU4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381CF10E1A6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 05:37:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCFwa+Os7usxJgnGFBW1TYtTS8dNTi4u1JE6TvxX5HD9azH0U9is76DkrbeCmyIp9Qz3q5NXZutNH0YyG4X8nWoS1ELoc54HH1Mbt0x9KYRZzhBxPf2sKH6lRhokKQwc/ab3OmSeRMDSZMXskppHQUtRNliXIdwNCKKxgpB+kpknC8qD8gDWGZOGAR02zyzc+c+kIyitGhkPcHl7uM8sUxDMPpk/+OrdRuRZGOYSVkzl0/C8514n5Y3bDgeVL47Awer6v5FDhlPuiugMnLTKoV41ZNuKZ8Vegxzqgb+RzitDGpwUxaBIrGhnELqr4ikeKLAcmSbuI+qmFgdcmgTeJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmQMzHaPT+AFChfqh2hnU/4wHB+4l2KksWgLwDTZ9lA=;
 b=y2H9szEvn3mnUnvw5kF79siFSnC0K4TuK2q9TG7gcO2oo4IIsfeSfNK29jFSUv6YjftcEzlzksue2SFEgZzJSz7wn4r93Ximu4g5oxyPRHaIu+zsARiT0nIoJlnPD6fYnX2mCLT4WwDJiRJnx4VeNOHApdpjMQDak+901pgVBWYtfrnwFfMP1HKq7TmUiRjfEIxSW3X7LZCz3c0t4GgJJuk0q78J/nLf/kHANOl7NFPJZEI0ktoojts0hy/Wz9lMIdrB+AW60un6B9ooYrtOqKmPM/t2f1tmqzhfa48ifjnxpt2jFKXH7Wo/nMYtr7KOxdXIKV0dJHEnVmJhyM0Sug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmQMzHaPT+AFChfqh2hnU/4wHB+4l2KksWgLwDTZ9lA=;
 b=AOf9GvU4a6lAF41PLeb20tPm4bQhfU4h604WmAdwJhvbKobr0pjm6NqfJCG2kQtPegKNftueZXJgoO3W4e+C/iVACwVJee/WMf2gaZ81IB4QuhTxiln1yypL1Ob8z5mKkhd7889H9cCJ5x54gS4PzJpt2Yr4drQKr5PazRv/dFM=
Received: from BLAPR03CA0116.namprd03.prod.outlook.com (2603:10b6:208:32a::31)
 by PH7PR12MB9067.namprd12.prod.outlook.com (2603:10b6:510:1f5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 05:37:18 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:32a:cafe::2) by BLAPR03CA0116.outlook.office365.com
 (2603:10b6:208:32a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.21 via Frontend Transport; Fri,
 28 Feb 2025 05:37:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Fri, 28 Feb 2025 05:37:17 +0000
Received: from jenkins-honglei.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Feb
 2025 23:37:13 -0600
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
Subject: [PATCH v1 0/7] Add virtio gpu userptr support
Date: Fri, 28 Feb 2025 13:36:43 +0800
Message-ID: <20250228053650.393646-1-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|PH7PR12MB9067:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d2b5522-d074-4bd3-ebc9-08dd57b9f6df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PlTOfL5wtzlEG3SbJOhWZPI0P7ISiB87WVuYWF/BEjJcKJtgVNp5SqXL4EtT?=
 =?us-ascii?Q?AIG6bElffIu+2ywoLPQWKvzLclUp8PeZDvumpNmbys3vr7t3IeEiww9uhWqE?=
 =?us-ascii?Q?0co7S6URI+zO2uFSeYQLN74LpM/5/Co0ag0Ipf8G0tBGqJ/sxFygXazoAAcr?=
 =?us-ascii?Q?7tfVoQTNnKy3iT8F9vO8bVGXY4DUP1vAViAVKL1aKq+r3mp+lm0/EVIXZ0m0?=
 =?us-ascii?Q?OHJsunnbXS60K5J2IKlEyAKeGYAWo4cBg7eN0KRV8rFRc0+majkIzfryapsA?=
 =?us-ascii?Q?weZV9TntHqRXb0qUX8tJvpnUoQLojVpao+eO7WVeU+Niagna8+YSzVhZDZdC?=
 =?us-ascii?Q?kjOyYGOSd5O2ceAA9XWbESL+2WMz2UIWzsC91LJQAImcHg8UAPmKcMRYOInV?=
 =?us-ascii?Q?ynFKwlgveRIaf3yHtgLctPo7qHKpftSi7Dc+teTEzRqPtmsvL+XPUk7YLasM?=
 =?us-ascii?Q?p2EEzt8tJ6P8dtrividgoRU497Nrnm9UavpU2gwQyGqOJwpPMPQjZMJiZvGg?=
 =?us-ascii?Q?5tXn5cdIjZAUtOYx/L6324pgsPBVrOVP6cy3V2fv1JhsHVkQmS9xK+MBEzpP?=
 =?us-ascii?Q?ye9MWyU4q0WWsaaq7WEjpJmU2pm7DLO7waF5MqOh2Kd9BvXJnpLYZeZ2Z5CK?=
 =?us-ascii?Q?fI0Tr3vlXyg1IthduTQWVJszmj0DHLypY8MFALMAt1elRXTf8lA9cycbwh3b?=
 =?us-ascii?Q?rhcE/DIv+NVKrtn8YOdDTr5XGYHjvWjw4xasGg0QtJ938+g6YFADs6Go2016?=
 =?us-ascii?Q?Qq70OFPCZ/S/z5AVk6rrG+0lJZJmZLh03u0O/e4x+Erw3JXBAZgo8d7b3uGb?=
 =?us-ascii?Q?RXCcHzJgxAgML+1qwERB8IrXUfY9GMCVltDpGDrDBhz0B6OMg4A7On/SdZ0H?=
 =?us-ascii?Q?nfgR12VkmPlEqJLiv7t67ylRb2MyUYef2ZCD0TKilkeIUYYRIMQgZoB27f3y?=
 =?us-ascii?Q?7ISGUgvNB0yJiFaT8DNRUmeqM010zCPs+kADsD8Da8M7jIOlHnV02JPlTj5V?=
 =?us-ascii?Q?1Elme8SW1OCwdNwNjEmAJxyPn/XxvDmR9DaKJ/ThvXL8p+hq/6U3NEA+L0HG?=
 =?us-ascii?Q?8m8jPzCfN18W7cK8kNfhgugxjk8XCqxPLxdOusNyEl2SlH/qVvFDkxHo+jJO?=
 =?us-ascii?Q?Pw0oS4aQRi0UItWQYD6qDiJvSuNclKS0ct+hIOukhoPrGH4xkhbfq+bU2L4V?=
 =?us-ascii?Q?0oqkqtElZ5CkXCIZYEkjQfOgsz6wiEIq9hGFZll18MoS3CZuG2+VlUYZNyDG?=
 =?us-ascii?Q?6mHef2SRlVVcYDclNe7GbzUMNjLmeu3abHnYQKZOGr5xqGthivP53H5tZ80C?=
 =?us-ascii?Q?o/IXtXbSuKfl+tyVXzzKdvtkinxvP7OQTbKvgLlsJ6K4kGt63tKEm45eEJNk?=
 =?us-ascii?Q?PIRmV/6cRBQ1T/v5TF0sQsWoBoBu02rHdpY/NgcmeYl5YCjNi7G7ggOnaYIr?=
 =?us-ascii?Q?SNkehYxsBFQDs1o/qmMLAhPoLTlqrwt6ZXCpwpxeAq/OBNmNnvcKTLq3uOKk?=
 =?us-ascii?Q?qu/Tu6LQmvEAbvLTgk40Zs2Mzsqp7xC25hre?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 05:37:17.8446 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d2b5522-d074-4bd3-ebc9-08dd57b9f6df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9067
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
Patche 6 adds interval tree.
Patche 7 adds MMU notifier, let UMD do not need to manage userptr and
increase efficiency by 20% to 30%. With this patch, OpenCL in ROCm can
achieve 95%+ efficiency compared to bare metal in some popular bench marks.

Honglei Huang (7):
  virtio-gpu api: add blob userptr resource
  drm/virtgpu api: add blob userptr resource
  drm/virtio: implement userptr: probe for the feature
  drm/virtio: implement userptr: add userptr obj
  drm/virtio: advertise base userptr feature to userspace
  drm/virtio: implement userptr: add interval tree
  drm/virtio: implement userptr: add mmu notifier

 drivers/gpu/drm/virtio/Makefile          |   3 +-
 drivers/gpu/drm/virtio/virtgpu_debugfs.c |   1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c     |   1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  91 +++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c   |  22 +-
 drivers/gpu/drm/virtio/virtgpu_kms.c     |  10 +-
 drivers/gpu/drm/virtio/virtgpu_object.c  |   5 +
 drivers/gpu/drm/virtio/virtgpu_userptr.c | 766 +++++++++++++++++++++++
 include/uapi/drm/virtgpu_drm.h           |   5 +-
 include/uapi/linux/virtio_gpu.h          |   7 +
 10 files changed, 905 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/virtio/virtgpu_userptr.c

-- 
2.34.1

