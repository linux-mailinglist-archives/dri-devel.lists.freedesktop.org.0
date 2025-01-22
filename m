Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC51EA19690
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 17:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCDA10E724;
	Wed, 22 Jan 2025 16:33:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oGVloV6g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07EE210E724;
 Wed, 22 Jan 2025 16:33:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EIwcj5E3KfcIxxW5ynandhz1vd8vlqFwR2RW/XEoHR6UznVOfjBH++E5belLk8Xg1DzAhLZShKX8H6pPbpMFg0GnNPz9v00F5IYCaLJNcDKUbzvhR+EvR0l9n3kXut4ceGCUoKwmd7gK2CbLaKyU4lOIcv4E+QlBSsUBurETyWz+7AxIBAws4p42LTEG7hVP39M6ODTKBiBbHWmcPhoEuyVT1teDsUVK1uJ5NX4V9+Nh4EjoRKgSIW58KynS77sc+YGlbVjqcDJlHZcTbmXeTakmGjmMPjSKy7grSAWvqNxsxMW7ziNrjMuE9oqctHbduDwIjdOmTH7nRJoVPIkYMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1lqCC5ipr6ZSTU8tQNTOYNq47jNhvRAxplPUH5m518=;
 b=qCkCWwQ4Iy8TMBdAQc7NT+9eo0s8t7BfqLcOk7XNS5akuaDavhzuFy0nVjI4zF4gsnX/MfQ8bb4qxejzf2LNFc4gord9ePTL6SwYPS9IYWMXtmN6VgKYDuSwA/cS+aG5Yt9US4nWgZ1oroDTb/Ud6m+uwZricWkzZbv0HGFhoPWXIRnSXb7GHvQ7xqSX6g9mb4MqAS7rJ6aRC6z9PHjSuVRnBJ9yajIiXrwkGWZ55RkseAtLLaGDzMnKEQsl8d3tkB1t9xQ8hu6QYPazQ1pU6Z7AAJGlIqIqwzwcpjWDpWpgmdFb0fd1qWEE2VmvdDNdY2bx5QQUI6o0+jFMYCF9Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1lqCC5ipr6ZSTU8tQNTOYNq47jNhvRAxplPUH5m518=;
 b=oGVloV6gXau2DOKZWlf9+rjtlSJUrCAfG5uD/pPgtumW8imaIIaCKmiFxjzkKKpQnW96th7wPU5pmAddFB2zDmthz3TIuDoYs8j4Ig/e68K7acQ4cqmDlAEuBrs8wldFvdnEFhJIpdsEyYRXEpwi5LSpxAQcKnmj1r8SYOWpYdU=
Received: from CH0PR04CA0046.namprd04.prod.outlook.com (2603:10b6:610:77::21)
 by SJ0PR12MB5662.namprd12.prod.outlook.com (2603:10b6:a03:429::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 16:33:09 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:610:77:cafe::7f) by CH0PR04CA0046.outlook.office365.com
 (2603:10b6:610:77::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.14 via Frontend Transport; Wed,
 22 Jan 2025 16:33:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 16:33:08 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 10:33:06 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-next-6.14
Date: Wed, 22 Jan 2025 11:32:52 -0500
Message-ID: <20250122163252.1788713-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|SJ0PR12MB5662:EE_
X-MS-Office365-Filtering-Correlation-Id: d420e03c-d3df-40e0-5c2e-08dd3b02746f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mFzIkSsE1i4DmOWqfcPBIlZ6Cgg2esPyMTFaNa8EWnqnWXgFcHSg8p2s6xgV?=
 =?us-ascii?Q?CMMl/schXjZEZNXrCy4RltUs8wa/vyft1GmPfIpvFnE1E7KcI7amudFpmAev?=
 =?us-ascii?Q?h6PiKfQcPeQNCnoHMFtZG73YKPvIDhGfcPzSl5LxoS6EEkrNHpwvGu0b56qj?=
 =?us-ascii?Q?S756Wda237KB9DLmW7KQ4pT28bTCQKR7YwQ989wid4Hlm30oCay+fmtDxmRj?=
 =?us-ascii?Q?gdhEJRVUNOWlqBryUthfHUP/BPtx2yTkIVBvno66Ro1XCnb7FhlR03LBW8da?=
 =?us-ascii?Q?icAIhZI7XcSIYq9dxZPQZ1Nfc3bDVz1ygiLWzkV1G7DRr4KOGJQ/ic9k0j9g?=
 =?us-ascii?Q?JjZyhvP7V80IzTM8JPvDIp53aAAlJTSKwD2zdOhs8PKov3M4BWfA+MurwKsm?=
 =?us-ascii?Q?+GsSTa1/jyycDUXzzTSspMPXw0lWT7O89bT7YIDh6lY4fj1e54cUp/HmCYAI?=
 =?us-ascii?Q?JSyCW0c8IuCIQCBbvcHgOGVJBYqJ5FfNM0MYh5Oj4uZTFDDyCS74/LQuG/Kl?=
 =?us-ascii?Q?tK0ROwfOJJcEKGzhZm9g2RzetvWnXQNVt5cY111OXli/8GrptlBRcK21DTQg?=
 =?us-ascii?Q?BCZWhhpnJ4r1ljgGsZFAlyjgQAp0w7Hu4AEtZAVsV4VtDHiwCUdjK/aCC3Qc?=
 =?us-ascii?Q?ygbDx9csN+MTdi0FuBtx/LEOwXu/0c/WH6k5l+R7hUUD3pewObG81gamTKV+?=
 =?us-ascii?Q?9UbT6zPenAr82/FJpVXSLo83MfjAjw5DErMpTKySGlXrRDNkjbNWR7+Jo2c+?=
 =?us-ascii?Q?Q9A0VJITkYux7SukYBjobruBwofaCWRnt9Cub+xqu+7utifSR2i7hbZbp+Ue?=
 =?us-ascii?Q?LFEHu7tm2cXDyjyF/E2gnMWOpfexJPQhgTPlz+I2EoMS6bUx2tYHGXy1f55/?=
 =?us-ascii?Q?8BAAGnplRz32LH5Qp2OZmbg/setiV3cVn3rusYAJQXRpy6DSb/wCEUWNmAUB?=
 =?us-ascii?Q?NvaYdS4wp/uJlN0RJtpBPOr6af/gzf24zkoVH8LLB+Gvz10zElb7eWtFy3f0?=
 =?us-ascii?Q?Nb9Qi5yV1cac2SG3kqHAmpjbo2d2476TRXQuAHYtxbEnQs2RcFufTH6CnoSC?=
 =?us-ascii?Q?RnYYjJNoklos3DCUpumdfGt8QlSc7B8TYZfdfAiJ91agxY8UE/4LEWLhS/Cr?=
 =?us-ascii?Q?FTxczVOBq6q4hgEXMd1Vb8l02an4U6TCWkB0d0BHHjCpdsfFFOEI5GUuOjBn?=
 =?us-ascii?Q?JfmH273IXzJe76+mdR0HdSYVERd6vpw3euTS/V4g03gxKwvFfxwy2hh/aL7N?=
 =?us-ascii?Q?pu4R28dFjUHzVLp+uD/D7OqH0UEHuWe9Vtx0HoQLuJCae353skjNCuJsJV/D?=
 =?us-ascii?Q?Kcf4aLt5XJk/Dc7t6u7RS5LP3Nt8fPXqGJc9KuNLLX2Tt97/qy2YKZ2SQD7S?=
 =?us-ascii?Q?1f6u3DBRrJqMl6B7TVFp21t7dnR7+fALYGYvCI4dy7W/rb+Knbw0t6K0AMOb?=
 =?us-ascii?Q?6+PHd56fBJA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 16:33:08.4813 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d420e03c-d3df-40e0-5c2e-08dd3b02746f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5662
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

The following changes since commit 97e5c9e4139087a67c2469488360a6d6afdd4b69:

  drm/amd/display: fix CEC DC_DEBUG_MASK documentation (2025-01-16 16:23:22 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.14-2025-01-22

for you to fetch changes up to 74d099cbc632a76ea80cdf31126c8b110ff34865:

  drm/amd/display: Optimize cursor position updates (2025-01-21 10:38:59 -0500)

----------------------------------------------------------------
amd-drm-next-6.14-2025-01-22:

amdgpu:
- Documentation fixes
- SMU 13.x fixes
- SR-IOV fix
- Display fix
- PCIe calculation fix
- MES 12 fix
- HUBP fix
- Cursor fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amd/display: fix SUBVP DC_DEBUG_MASK documentation

Aric Cyr (2):
      drm/amd/display: Add hubp cache reset when powergating
      drm/amd/display: Optimize cursor position updates

Jesse.zhang@amd.com (3):
      revert "drm/amdgpu/pm: Implement SDMA queue reset for different asic"
      revert "drm/amdgpu/pm: add definition PPSMC_MSG_ResetSDMA2"
      drm/amd/pm: Refactor SMU 13.0.6 SDMA reset firmware version checks

Lijo Lazar (2):
      drm/amd/pm: Add capability flags for SMU v13.0.6
      drm/amd/pm: Fix smu v13.0.6 caps initialization

Lin.Cao (1):
      drm/amdgpu: fix ring timeout issue in gfx10 sr-iov environment

Mario Limonciello (1):
      drm/amd: Clarify kdoc for amdgpu.gttsize

Shaoyun Liu (1):
      drm/amd/amdgpu: Enable scratch data dump for mes 12

Srinivasan Shanmugam (2):
      drm/amd/display: Fix error pointers in amdgpu_dm_crtc_mem_type_changed
      drm/amd/amdgpu: Prevent null pointer dereference in GPU bandwidth calculation

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   2 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |  49 +++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   5 +
 .../gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp.c   |  10 +-
 .../drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c  |   6 +-
 .../gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c |  10 +-
 .../gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.h |   2 +
 .../gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.c |   9 +-
 .../drm/amd/display/dc/hubp/dcn201/dcn201_hubp.c   |   1 +
 .../gpu/drm/amd/display/dc/hubp/dcn21/dcn21_hubp.c |   3 +
 .../gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.c |   3 +
 .../gpu/drm/amd/display/dc/hubp/dcn31/dcn31_hubp.c |   1 +
 .../gpu/drm/amd/display/dc/hubp/dcn32/dcn32_hubp.c |   1 +
 .../gpu/drm/amd/display/dc/hubp/dcn35/dcn35_hubp.c |   1 +
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c   |  13 +-
 .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |   2 +
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |   2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |   2 +
 drivers/gpu/drm/amd/include/amd_shared.h           |   2 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_ppsmc.h   |   1 -
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |   1 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   | 286 ++++++++++++++-------
 26 files changed, 300 insertions(+), 123 deletions(-)
