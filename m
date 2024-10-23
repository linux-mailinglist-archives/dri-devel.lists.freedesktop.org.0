Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB2D9AD379
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 20:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C3F10E852;
	Wed, 23 Oct 2024 18:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0CVrsVp3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7438F10E850;
 Wed, 23 Oct 2024 18:02:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fU2V4PI4TISBLZl78wiuc7EmvE6QMqF8YTkVvFUQ5nIwKTpN4c03uEwhIRT2XDRX+iqjlZzubSdqCeXgIUnGutrxx74W821H2Pm8um5YgSE9kjvQUplYEH7wBcoKwafi6wETfR6Ed5V+i6Y5wTbuxK1+reRCq7l85Dh1nG3bM9r8xEcdC4eOZPlXSXyuuxy0M4UorlniGe+nIkcbap3vvOlvqa7zXpsLZgc4eh2L7Wu9mRMPKqtHMbV5QRFbr6AsYNbmZR1rA6INmenjrqqUn/FOibbxTMkbJjZHT/EqrYvt+3/yaYCw3x8z5b9P4dIjaLtZ4v2AcFV5ZTKfEN1tTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9C9icd8EKBnaMjBLzWAvqsykVby+tbLNUyMM/uPOLEE=;
 b=R7Iqga3ekNFImJRHtZZkX9TvdWQDcvsbmg5ov7z13r9IfAJcQ0iTEMY5ea9slBhmT+PNvo1baNp4+fBnFJxZhY+RMRgJnjXKjL3X+Fvx/C5lHBwFtFItHTZxuYd2BjpPg4SzcwNQhsyRwQopD+KZpFMCQ1XhGQV9qjxeNN1bgcwSTy0fKpZuvFHhzRn0SoQjRY1p4LJlRTQ3duBBHVbnu04Hw6IdbyOeBvh1feZXUOPQyvMLaHFAtRnUiGl83bk/HegHMzPETRkrP0Pj/DNuyHFbbw8nFfrAIHy1RpmRKQF3BYD993rsl5TDsY315VFs8tiMSMrOTkzxdJzlxs/jjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9C9icd8EKBnaMjBLzWAvqsykVby+tbLNUyMM/uPOLEE=;
 b=0CVrsVp30RSvSv1Bim20u6LbY7lZiTZmFddWk5ASvgnSRMird7UjS4Jr92Mme/yhLoavD1+3Q8TjNpF7ppAmDoTlgPCQWziVYviqYrb5e4kvCI9gYYOicCGz2VEPufJtZxAMTemPgXJrjy72HcWk2i6kdQb2vT06D9cx31cbGjk=
Received: from SJ0PR03CA0191.namprd03.prod.outlook.com (2603:10b6:a03:2ef::16)
 by CH3PR12MB8877.namprd12.prod.outlook.com (2603:10b6:610:170::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Wed, 23 Oct
 2024 18:02:22 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::dd) by SJ0PR03CA0191.outlook.office365.com
 (2603:10b6:a03:2ef::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29 via Frontend
 Transport; Wed, 23 Oct 2024 18:02:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Wed, 23 Oct 2024 18:02:22 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Oct
 2024 13:02:20 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.12
Date: Wed, 23 Oct 2024 14:02:08 -0400
Message-ID: <20241023180208.452636-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|CH3PR12MB8877:EE_
X-MS-Office365-Filtering-Correlation-Id: c3a5b97f-6155-48d9-d6c4-08dcf38cd7f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cP5U0r17Yx36Ir8G5KMBwoIDJQ1uYrSVzGc6FXMkUsIAGoXBa0DQpIJlelDm?=
 =?us-ascii?Q?B1xhMi5dDJUve9d16wr6ujdUyAAzMOvp8xTDihE2o8sQGNDwMLm65MoG+ZXM?=
 =?us-ascii?Q?GAPAs0oj1u1EwarUaDcSTGmGuorCapJ88ArKX5/HZ9NwTOxLmsysY58SfBtY?=
 =?us-ascii?Q?ckKQF5F1j0m11Y5m8nZrsqkNzsruZx18s56THO5vDfsIXdt/2Eb71wEyn752?=
 =?us-ascii?Q?gWqvVEoiOyCOz+G3kuM1Gdbv1QSTq9mWc4cZ3d+okGArLWQ+o0nN8m+oky+5?=
 =?us-ascii?Q?lkxhN5hXcgcBVrb4E7VFbZWE2GNzKmvQU7RLQHEOdvHCcJ+3vS/zBbq0LaLu?=
 =?us-ascii?Q?jaiJjoMGApbhR+/AX7B5LF1Uz+bjYt2RKpo9nqHxqjUNNxO1uFqG7AD/fv8l?=
 =?us-ascii?Q?l+oxBkmzbB1mLmIO499NmgdWbXWDEQCEwR3mDWMxYYEplaRirqgZUlyo1w4Y?=
 =?us-ascii?Q?NvKwQR/k0oOYsry7XqICU0QCbIOJZRN4upFd2O535jdFvqRJeYcu9ebi+mRH?=
 =?us-ascii?Q?QNadsPOyyG6D9NHl35DvaEHS+9AmFqmD98aB47n3XbdoqzBnKoAaWTmXvUF2?=
 =?us-ascii?Q?lp/gkEW410VDuVvGvcyWKMHy7oUOzvpqnirqpSN4cT6syuT0+1ArXoOgPInT?=
 =?us-ascii?Q?q7rBtWUZayigxLCzHQRy5sv5xoWdV0zxTjY71VESp4YCq+Ul6W9vlRigqd/2?=
 =?us-ascii?Q?SDn6WH8nIV58H0vgpdI6eeNORuLke3jLu8a2g/Fs56NfGbRaV5l8mrawkujO?=
 =?us-ascii?Q?sDIRSCusb0u2/Mzgcxi0XNRE7BuutT/dQNJI89KXSeJoqyxw21gnhK2V5eY+?=
 =?us-ascii?Q?M/ETi3xG5LnWsD0X6FB5rh6cB3v2qAoeWg541j85RCvay6Nz5yRni+f6E0/5?=
 =?us-ascii?Q?GhKxrDF30I5RG+LBMpAWeLhS+dMPdgDzbksw3I9FhIuooG1thFSAKyqAabmx?=
 =?us-ascii?Q?fM7udsTOuEfD02qlfYwt75Gr/Lp/9QnxCSDvBab/zcDYsM3muIWckbiAuXHB?=
 =?us-ascii?Q?WJDbSISoFO8PAD4+2eoaQz7pUldkStj+DNpFv1VSf+0FypJ2Vmne0Tfawtqq?=
 =?us-ascii?Q?BTVBbEWy2J9Sehhf0P4ncZhEGJEAn6tVVr0PFJdYbzXYiwMIiHXuCxIAJhqo?=
 =?us-ascii?Q?L5w5HK3m4xjyv+yul0i5iYFg/J5BJD5CQBwrIbYqoIchHEKTm/KfE4Mueg2s?=
 =?us-ascii?Q?jbQpTBgjHroPIKki6Y+ozoWZf7yLaYgNMG0fasFXApVNnScyZ9LV3V6602Mn?=
 =?us-ascii?Q?heyJCssQY9UJp9ibcD9Q+YnWeXha48wMnHrjdPdif6BZtPNqOM/rJoLVcHCj?=
 =?us-ascii?Q?5znMJKw1q/eflCgenu5DWsWUGJ2MgykhxRVp71IAvGv+fqW3JAd3NG+aBz7k?=
 =?us-ascii?Q?2A3mf5Q=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 18:02:22.2414 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a5b97f-6155-48d9-d6c4-08dcf38cd7f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8877
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

Hi Dave, Simona,

Fixes for 6.12.

The following changes since commit 42f7652d3eb527d03665b09edac47f85fb600924:

  Linux 6.12-rc4 (2024-10-20 15:19:38 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.12-2024-10-23

for you to fetch changes up to 7c210ca5a2d72868e5a052fc533d5dcb7e070f89:

  drm/amdgpu: handle default profile on on devices without fullscreen 3D (2024-10-22 18:21:51 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.12-2024-10-23:

amdgpu:
- ACPI method handling fixes
- SMU 14.x fixes
- Display idle optimization fix
- DP link layer compliance fix
- SDMA 7.x fix
- PSR-SU fix
- SWSMU fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: handle default profile on on devices without fullscreen 3D

Aurabindo Pillai (2):
      drm/amd/display: temp w/a for dGPU to enter idle optimizations
      drm/amd/display: temp w/a for DP Link Layer compliance

Frank Min (1):
      drm/amdgpu: fix random data corruption for sdma 7

Kenneth Feng (3):
      drm/amd/pm: update the driver-fw interface file for smu v14.0.2/3
      drm/amd/pm: update overdrive function on smu v14.0.2/3
      drm/amd/pm: update deep sleep status on smu v14.0.2/3

Mario Limonciello (2):
      drm/amd: Guard against bad data for ATIF ACPI method
      drm/amd/display: Disable PSR-SU on Parade 08-01 TCON too

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |  15 ++-
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |   9 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   3 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  13 ++
 .../drm/amd/display/modules/power/power_helpers.c  |   2 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  11 +-
 .../pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0.h   | 132 +++++++++++++--------
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h       |   2 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  66 ++++-------
 9 files changed, 156 insertions(+), 97 deletions(-)
