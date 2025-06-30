Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD4CAEDA16
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 12:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F1910E401;
	Mon, 30 Jun 2025 10:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mM6bjPaG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478E110E3FD;
 Mon, 30 Jun 2025 10:41:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5A5nbn5v8bTRbnxjl1xUP6qeHZqrGJbq0VUBgnO4BmyvOM4QV8LIoVaXvQbt9l88eYFE9F4JMcxNYz9tE1CQcrK3KXuhIGe7HtQ+8YXZ1k+EMeWIN1NGqQf0dZNd8VR4xl28Cl11xvRsTxdpocvEvVHWL0NjdojocWxDs/tQPbAWsN7mNDYj06ZIRMouhM0lR71KDAkOKdgrecRPYs5bSf2+dE9Ge/wcBHUDfm+Anjn1RFVGuOtAHikgbFG+QhAJw7rfRQTs+VPv5PpD82JuXWi4G1H98OrT45o1+3bq8del1iijzAOXuxt1APvbC6UVx2qPGTnSdyHHowFU4meGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGSEIg0BOU50F6F9OELM40PS9YexQ2QnL0zoqHcG50A=;
 b=XnZTo3LtgWHX4MJePf8jiNQXNFdyYGN68+dz+6p5M+l0GvrfH24Yqt9eAXj+MdUajGLsK7Qs7tT1ogcZ7RKUnEXU5mpboDcGoNI073UG336ZzBvhBpbiz87X+KMc8RVw3dhe8iz+irv7SjOfJtazFF/Gq1XXBoZzBoYu8bgyZmLqmi7ezybzWeP0qg+v6CPBBVuxpN2yts7aM58rDjIbOgQJVHj91YOuax14XrhWq80uoVqiuUFuf1BOH5DRNFRTeg4NYIJK0iGne7/SEtAKNzVsRw9HDP7Jk+OcMz1/vHjX+sLxXoClYsK/bP9WZKq74fjzuXjzWoPzDi1sU9YUog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGSEIg0BOU50F6F9OELM40PS9YexQ2QnL0zoqHcG50A=;
 b=mM6bjPaGvzFp7NzcuLrwW0dMTot68aDYscyC0nu+Ky9feZ0egYgpkzQdv38/NGYRFDqRy2fj/PglAJPr8VLrZVhN5u52ZYCu11P0nR+B+6DZCXgrDvDQU7VXZSZaiyCfSKm/ZVXrynt+Vkpk0dM4QMNUlX5eWYbTRyvMtEpE73k=
Received: from MW4PR03CA0013.namprd03.prod.outlook.com (2603:10b6:303:8f::18)
 by DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Mon, 30 Jun
 2025 10:41:28 +0000
Received: from CO1PEPF000042AA.namprd03.prod.outlook.com
 (2603:10b6:303:8f:cafe::a6) by MW4PR03CA0013.outlook.office365.com
 (2603:10b6:303:8f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.32 via Frontend Transport; Mon,
 30 Jun 2025 10:41:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AA.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Mon, 30 Jun 2025 10:41:27 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 05:41:26 -0500
Received: from hjbog-srdc-41.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 30 Jun 2025 05:41:23 -0500
From: Samuel Zhang <guoqing.zhang@amd.com>
To: <rafael@kernel.org>, <len.brown@intel.com>, <pavel@kernel.org>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <mario.limonciello@amd.com>, <lijo.lazar@amd.com>
CC: <victor.zhao@amd.com>, <haijun.chang@amd.com>, <Qing.Ma@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Samuel Zhang
 <guoqing.zhang@amd.com>
Subject: [PATCH 0/3] reduce system memory requirement for hibernation
Date: Mon, 30 Jun 2025 18:41:13 +0800
Message-ID: <20250630104116.3050306-1-guoqing.zhang@amd.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: guoqing.zhang@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AA:EE_|DM6PR12MB4401:EE_
X-MS-Office365-Filtering-Correlation-Id: cbcb2210-4963-4d8d-e3f1-08ddb7c2ab16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wbIw1qgS/0Z0w6713Kb3gzPb+t/KpoZccQCYLruA3QmTECJZvAAPVmbxs1Q4?=
 =?us-ascii?Q?4OhQPWCyqCdKGil8JNfejjLPz47b3mhxQL93GEVQb2kkZ4SzF3JIEM9FJEN0?=
 =?us-ascii?Q?FvacEH5R/T44HuS24MbYG6DXB+ensVZSvByO8xjVdLZf+jf5uzblQckuf0gZ?=
 =?us-ascii?Q?q5YLEbW0gNI10Cc4TK+SjLixJuH8ZeLIhHbrGnWLUxEI+SNvgucQOG9rgYL8?=
 =?us-ascii?Q?HlCif8+TcxLuSJp5flKx2MclNBWa5fGLtPKGWHagHA0k48iJD2X31Tjvi7Zv?=
 =?us-ascii?Q?i/wcs/M9Lg0GBsSH0ul6yE5XJWvkyFc9/+L0O6dMZZnf0aF0WNkUiqofi7Tg?=
 =?us-ascii?Q?KCq8vCrlCzuG8wrl4E1TJ1qkJ3OZ7yl9DIl9QHS/CmTv6G/Ih5/KOsVWavIq?=
 =?us-ascii?Q?aEmcBh16TAB9UzLImv3atmjEN+c0tWjboRvxY3pcPx3gJSqTDVutCFIBIko6?=
 =?us-ascii?Q?LMwRJSrl2v4LEspKeiU0UhUaF87o8Q7HPF0r3Av14Nxhxcx413ORDb52Va+G?=
 =?us-ascii?Q?EaFDKp4PkB/0BYBMi3RtyHt4L1Td0cIcrHBudVRtHgnP6hykI0rLQzGl5ifD?=
 =?us-ascii?Q?M/Wz+BrNtXtHGhgHMxisKHglGRuHZGg9EZ/rauD552r9VFtv0SPdAA0tAGt4?=
 =?us-ascii?Q?U4+VkcLsg3+0t57eLA6yE9VK9qfQIjKoZsReLJDJne8PM3L6PXw9LO0VgMEy?=
 =?us-ascii?Q?b8dI3M97V3dkSan85xE5fOBSp6SK7XMHMpoQys98VK8uJJ2D0X44xmewHnYI?=
 =?us-ascii?Q?rEJeMpaceDM23VMkHEyjBZENRwHBDlmSbTMNe5GWLyRY7CMltUjRFWyxNi8M?=
 =?us-ascii?Q?ZWpiqQmrvvRILivlkwQSnX4tg1adjaAiOtPj8JoFEtay1vsTy/7Xr9dl7+Z/?=
 =?us-ascii?Q?Il1l3gB//I49gMCiiHgRhKN4LqnhsNlneVGyBn3r+nzVoIlHHSLqJhSHX4oW?=
 =?us-ascii?Q?9ugJgPsduuYlNjbPeQNsVYTjOGKmD8B3yW3qZYsALAEbGhmrSjQ4VDhvSp5O?=
 =?us-ascii?Q?r2/CUXkB6hXQTfvEX+F43QddSOj0eEh3SWpxcO8F63+bfDYz7IJrdV1VNIn+?=
 =?us-ascii?Q?/M0M1woGbBPoDCN025XW380Us8U55Hf15BqQMo0NXIxuapFY11fewla0UtxT?=
 =?us-ascii?Q?2ClxVPntebwk9CnpJF9BnEIOhvHI4H3l/XydfBzkH8XbG2xaP6IfE9Pp0S/u?=
 =?us-ascii?Q?xiJojuxWfwVTESQozyhJD8qOIFuBJQRdD5WUcprefHplgjtGe8umWn9yZNhO?=
 =?us-ascii?Q?juVlAvAXjQfW+R0FWg11iVcRVMrbkcgcrkrwVxS8RSU9nP+YES7p/DLC5jCy?=
 =?us-ascii?Q?PFgLtf3Imj7AcuyCZEHtOY+xMTsDT/o4oA67DeKd72k+pW49F4geYi+IyhZf?=
 =?us-ascii?Q?baziVgLpMyA9FebCaOAInzLXw1B6kCZVNpO6cCwqNy4Sm0n5CT+wL0awGSGi?=
 =?us-ascii?Q?/4PHCI0RZAQnlh247jFiIaiI+okwLR8EdWZCFGDhFSeKKFn4rcWRuRvjLXLI?=
 =?us-ascii?Q?yLQIhEmHhDOAV+f0e7a9/Z+E6aGBsmF2pLlL?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 10:41:27.7075 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbcb2210-4963-4d8d-e3f1-08ddb7c2ab16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4401
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

Modern data center dGPUs are usually equipped with very large VRAM. On
server with such dGPUs(192GB VRAM * 8) and 2TB system memory, hibernate
will fail due to no enough free memory.

The root cause is that during hibernation all VRAM memory get evicted to
GTT or shmem. In both case, it is in system memory and kernel will try to 
copy the pages to hibernation image. In the worst case, this causes 2 
copies of VRAM memory in system memory, 2TB is not enough for the 
hibernation image. 192GB * 8 * 2 = 3TB > 2TB.

The fix includes following 2 changes. With 2 changes, there's much less 
pages needed to be copied to hibernate image and hibernation can succeed.
1. move GTT to shmem after evicting VRAM. then the GTT pages can be freed.
2. force write shmem pages to swap disk and free shmem pages.

After swapout GTT to shmem in hibernation prepare stage, swapin and 
restore BOs in thaw stage takes lots of time(50 mintues observed for 
8 dGPUs). And it's not necessary since the follow-up hibernate stages do 
not use GPU for hibernation successful case. The third patch is just skip 
the BOs restore in thaw stage to reduce the hibernation time.

Samuel Zhang (3):
  drm/amdgpu: move GTT to SHM after eviction for hibernation
  PM: hibernate: shrink shmem pages after dev_pm_ops.prepare()
  drm/amdgpu: skip kfd resume_process for dev_pm_ops.thaw()

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 13 ++++++++++++-
 drivers/gpu/drm/ttm/ttm_resource.c         | 18 ++++++++++++++++++
 include/drm/ttm/ttm_resource.h             |  1 +
 kernel/power/hibernate.c                   | 13 +++++++++++++
 6 files changed, 47 insertions(+), 2 deletions(-)

-- 
2.43.5

