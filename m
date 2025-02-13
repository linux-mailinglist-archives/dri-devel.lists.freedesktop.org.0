Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC87A347D7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 16:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0205710E3EB;
	Thu, 13 Feb 2025 15:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QVqIZ3wr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BAF710E0B5;
 Thu, 13 Feb 2025 15:39:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQmhI+diQynciMnir0dEJXcRdm8hwFc6NYd736S4n0Z0HrGKzOhkzWxRoZJnL8FB8CHmBGPT7htlZ7b1lcsJILHSZvMxEBnr3Ogl5SCXS+WIEuv6NXodHzoHqoacxxZ85dgd4/zwsKpG1YMGBcmvW32cFXswI4cO3e9P/E6JIZfAdv4wK8A0d3+qW6zodR6llPPiJuHkno5p//kedmAEL0QcLyVVxC9iEi2um8wzvV7ejQMKPk45+HYzxj1miriGeHXGJ8DEzs2R+yi0ENVmJy6HPvAcZcrd3uVXqSmnxtQB8INWDfh5OJ181R5JsfHKXjWr9NraiqsLXmTUkAtR7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LPldZedxeHsCt+kRuH5iDpKPWO5V2mx3eIMIh8SDpk=;
 b=PVrCU2gqaPNnycl6QxihDg9h6pAIbVyY0UT646HVTBXnwXBO4DJuZbNhCloO3Tv/ZoyHGoaZsHgGClzjlTb2aG17rxqk+o9Xjnsg2KLolBIoEcgvL7UQnlApYwoBgR0vMHMAWnhTaGjSFr+jQ1sVzliHYcc+vXXZwYL3rgEcTms92ABh7JrMyhh9nQvEA6A8VzLqlTsLqauDMaFFIXBo/DeG5rO9EDTTInAjBuSEWunsf3nIIpaaHXGnvswBFP1O/rpdSGzOnIQr+96jNiGa3PTNG2y//eVP9CEC3qbGSR6PHz17HxcH+UAIx2hYpHNnYikN6qrOtLu6TOVsQLV8+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LPldZedxeHsCt+kRuH5iDpKPWO5V2mx3eIMIh8SDpk=;
 b=QVqIZ3wr33otiec8IiMq8wGQ5KBuRSKrC3Q+5YRAvYGSi1GlyDMqVjNClbxGV6xJlQaCq+d+OiK8ZQw26/UEW3gtlqFB8H6pLvMwihJU7MYK3eN4fs0N/pGD0tlMVpTbwtSq+/1Jx0RGS7PVOjoqh3L9stS/ccZCb6UJUX6D5GY=
Received: from SJ0PR03CA0226.namprd03.prod.outlook.com (2603:10b6:a03:39f::21)
 by CH3PR12MB8482.namprd12.prod.outlook.com (2603:10b6:610:15b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 15:39:00 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::3) by SJ0PR03CA0226.outlook.office365.com
 (2603:10b6:a03:39f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.16 via Frontend Transport; Thu,
 13 Feb 2025 15:39:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.10 via Frontend Transport; Thu, 13 Feb 2025 15:38:59 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Feb
 2025 09:38:57 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.14
Date: Thu, 13 Feb 2025 10:38:43 -0500
Message-ID: <20250213153843.242640-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|CH3PR12MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: 94bdd256-118f-4bc2-58e3-08dd4c4488f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OpubJSMeQD9J/BhIFQd8kaqHDV74w9nmDn7/L6I79oBXc/3AUx2DLoHI6FDV?=
 =?us-ascii?Q?yCjum++QjCeOcrs78njmcx6isMjQXzfyEBghkkZWo6gGuNOrUvuxU8GVs9FY?=
 =?us-ascii?Q?63co4tvaCnIu7T8DO67AVGp/L3xQ2zFIbx5Ci7mVUSUkqIHbSMwNpvTLiO9J?=
 =?us-ascii?Q?yNSYAwhekzlHz6KMdIvm/lqsdHdcewvHRUI1zuY3sd3XS1ER0pxbdqCxjroM?=
 =?us-ascii?Q?zOj1ni618wQsYlHNl7+YREp7pDEXAPRmTuo9+tozcTsiZXxM6iBFBm2WuxKb?=
 =?us-ascii?Q?TQIjoLRSbgu/ueepXdnI73Fe/bivnEHG2x05jCsmEAscnTD3gdy9am2ta4z/?=
 =?us-ascii?Q?EfCKed6zMcDAxRjh+hJwE2FEwDzVrWSicxEQ1HjcI6oXj+OI16HrGjacIhpF?=
 =?us-ascii?Q?M+6LV7QXIHsZbQ6ox5ORoeAafwjbGex2pJn0FPOEQ5++Ino980E4aHehvA40?=
 =?us-ascii?Q?dlC8KFL4oT7A9V6F/w4gucqgz8mgp6nOQAdnO+54kQKDNv891si5TVpI4UX3?=
 =?us-ascii?Q?RycX0L7jeNrnL+yquzCyt5N/jPYoBWbFSBkZQWzbk17BwcFoCrysfny+cN9i?=
 =?us-ascii?Q?2ai8f8bPE7pr6B6kL1Nw1LGpR1ePZ4krZpzMcYmfBKUGpUk6S+2YoVnwjrwD?=
 =?us-ascii?Q?ItMEWlPmRNAW3qwlMliK+ri8LTtQ/8W3VMUfiZiLUkDTRtbtuu+MPJpQzJx1?=
 =?us-ascii?Q?mWCnX7TPC3dOn9/RPIpCKRoa3KeCCYDW6kgDIqjMrHbjMm6AGWMdn51/EzEU?=
 =?us-ascii?Q?ulSGg9bXTh9XhSQQr2Y0JNLaaD4Gz4atFENAUei0EmhNiI2SFngbEX01Ltv3?=
 =?us-ascii?Q?GxT5Oy2sRNd+p1+oEtJah2gGN/1QhvLqUVlO00h6Jf8yy+UkwWkvsXUlHQVQ?=
 =?us-ascii?Q?yW853xqYiQ6iwF9+wp7kuV6FbfWcATLcdx6sRMy4uOmmlctZqa3QYUp0cCif?=
 =?us-ascii?Q?fxE6lf0Wyc1aYJp3eGmMMiMoJtBInzFVRnDA/Ka34eHo4NI3Qx1pUCYGLwem?=
 =?us-ascii?Q?ORB8qx2AvbPLoc9wvPbPnF3JB43PZ5pH/mzQjseLkgb4RVxxx+0ixjTqEPyh?=
 =?us-ascii?Q?JAh1rxrt36YM2BX/ByV6Gr03o+R1hJ0KXnPAI+dzlJ7XkVo5vhxPGaFtLDSa?=
 =?us-ascii?Q?BEDHCWBxTHCUugZT21QxIJouG9gWDobaq8j+R2mLLaJ5BWAEIJwHpiy+2Crs?=
 =?us-ascii?Q?mWe8ZNbf0GuKsH3X/gyhvgY6cOQCM1CZiNBImtqGIu6W94X+9pXB2YOeS4+M?=
 =?us-ascii?Q?ZSY1y3bVS4Nd02A1dxb2p4+fGnXJAg9muOAf77nLJNMpmJ38lFDOiGz0SfiW?=
 =?us-ascii?Q?sCeYWFQ2V6Va8DkJBvyp9EquIQ34rajnQZidAV+OtdR1Nr87lwZBvtHEapPp?=
 =?us-ascii?Q?Ga354N5Q+7cGogqDC8IkHazMrjTzgU3z2saatEuekNTNl2H0jVRhuifbQWOK?=
 =?us-ascii?Q?AiY8CMmms30=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 15:38:59.3765 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94bdd256-118f-4bc2-58e3-08dd4c4488f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8482
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

Fixes for 6.14.

The following changes since commit f245b400a223a71d6d5f4c72a2cb9b573a7fc2b6:

  Revert "drm/amd/display: Use HW lock mgr for PSR1" (2025-02-04 17:47:34 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.14-2025-02-13

for you to fetch changes up to 1abb2648698bf10783d2236a6b4a7ca5e8021699:

  drm/amdgpu: avoid buffer overflow attach in smu_sys_set_pp_table() (2025-02-12 19:47:15 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.14-2025-02-13:

amdgpu:
- Fix shutdown regression on old APUs
- Fix compute queue hang on gfx9 APUs
- Fix possible invalid access in PSP failure path
- Avoid possible buffer overflow in pptable override

amdkfd:
- Properly free gang bo in failure path
- GFX12 trap handler fix

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu/pm: fix UVD handing in amdgpu_dpm_set_powergating_by_smu()
      drm/amdgpu/gfx9: manually control gfxoff for CS on RV
      drm/amdgpu: bump version for RV/PCO compute fix

Jiang Liu (2):
      drm/amdgpu: bail out when failed to load fw in psp_init_cap_microcode()
      drm/amdgpu: avoid buffer overflow attach in smu_sys_set_pp_table()

Lancelot SIX (1):
      drm/amdkfd: Ensure consistent barrier state saved in gfx12 trap handler

Zhu Lingshan (1):
      amdkfd: properly free gang_ctx_bo when failed to init user queue

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  5 +--
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              | 36 ++++++++++++++++++++--
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     |  3 +-
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx12.asm |  4 +++
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  2 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  3 +-
 8 files changed, 49 insertions(+), 9 deletions(-)
