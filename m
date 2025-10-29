Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6320C1D2D6
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 21:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 436CB10E831;
	Wed, 29 Oct 2025 20:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FlpylV1y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010053.outbound.protection.outlook.com [52.101.56.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD5A10E82F;
 Wed, 29 Oct 2025 20:14:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OoHDO/fPW04WB7MAQ5iAVmRPbOb7v8XlABBmhtIRSsugRQgrNb3i7sssypXFwY6xPrSx8X+RIiXaplvY7bajbhYcI/wdHR/g4TkS7EJjb3od2M0uqOKPsh7cQTMzLuHuCiZ7rXcDrqZdkRT801HzL5Bogo18stsSehmQKeIXktzJquvdq1BrSmAUPRuJCj1dqEAeSUh38F2bmIPz9uM+LsPiB3EOrjWpz/hdLlh2Nh5haDYcPKK3jb7xCL3nTZCoHOmOFbJ2PRzOY/FRjyKQJAqpZb3qsiEIkfGRgiT85qSXjS4kqUvf/ERUnIYmLSbtaDWXrLyAsLezlqIZAn20xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPZQZADxcPw8QQs+OdLr4XMKywyzU2aoofqGiM8JLCE=;
 b=AN/OcIMOa7a9ga4PgM8ix3JOne/lLuTqbKt2F3TDt4GRwNB+GPDpfT1xHMl0x00j/nFzIj7aSIvArKaJd03wdZKK4GhOsjC1QLsEjSn4Y3JX/xWYu9GB6pv9zBMS/9zSOvnYTr9Ch3wE5aKGwIXnhoySyNomIe653QGIR1y0qr3T9SOJzcWx5gN6C5pTuksR+HSepD8l7C4yX3SnBrIs0nw4DXzpdykpQ5liC76o0S1+QWXpS0FQj8Z6i4v9fCEHpIQl20dWPcRpeesK1w4/s7c1RlEQO49L1c3C+z5kz9TzRYYguqrylQBtAUYW1UCw9SgyZRMw/+Nf5zOMFucd6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPZQZADxcPw8QQs+OdLr4XMKywyzU2aoofqGiM8JLCE=;
 b=FlpylV1yeMb4bEMjJ0ubpgZPCFF6RqnLPPhaUK2hs1PIXHhvY+CtfDwROCeRu8XS9vhinLqKZlECVasw2MUJrY1JNbynLGXEGwDzRQ7MH/095FUwsx0kxbVK5hpwBP93lHgRwAg4xvw2qWUN8HUTe7OaIRdTj51cdQvTHSJd3Fo=
Received: from DM6PR18CA0024.namprd18.prod.outlook.com (2603:10b6:5:15b::37)
 by CH3PR12MB8234.namprd12.prod.outlook.com (2603:10b6:610:125::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 20:13:56 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:15b:cafe::35) by DM6PR18CA0024.outlook.office365.com
 (2603:10b6:5:15b::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Wed,
 29 Oct 2025 20:13:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 20:13:55 +0000
Received: from tr4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 13:13:55 -0700
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, radeon drm-fixes-6.18
Date: Wed, 29 Oct 2025 16:13:42 -0400
Message-ID: <20251029201342.8813-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|CH3PR12MB8234:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d3264b6-2b46-4ed3-90cf-08de1727b034
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uaVl1AwBP4wuckdGRoJ+SYYa55Ve7a3GdvuJzQRciyR5c0Tz7a0ifBUnFMPL?=
 =?us-ascii?Q?6AWKAVxUvhlQi2XrHxdEHKe3+AJbtH6E6MRhQAoR0CPWFUg1S/SKWE/D1lYQ?=
 =?us-ascii?Q?cy+rwxwFo/PlMKyvHFlVpgmHU/OaShcJ3NKeIjNnzeTMX2788dQHubkX8v7M?=
 =?us-ascii?Q?qPOwh/7bNkYAmDP3VmaoACFBIVfx6h2/X4ZhxbPJS054VU/c+IlTbH27itqn?=
 =?us-ascii?Q?1Lva4VvLDVUzUqq/tJ5+5bS2kuTiWKRlaEut1DehAB4WYAhNphJIm9Upitjo?=
 =?us-ascii?Q?BmoTF8NXWC/PUlZ23+MUd2t+xJyJEVYwHwCtXczJ6FsoSrIL+DEWz+/Plxe2?=
 =?us-ascii?Q?TU9A0iABd3APYfFv9be8PEWQTcYi6oCRxL6w2leMCNHG5ohEUbitK4Hf+qZc?=
 =?us-ascii?Q?5NOerNovD+bovdZTV4JrOGVK0cg1EAYn22bPXugBCHS99HcSaTxSOgkCpm3K?=
 =?us-ascii?Q?7Qr9JrcyAe0y5FKagUDBf973szYCiNYzJmplBbwMeOihkOWzwPii+m3j/Fko?=
 =?us-ascii?Q?omCo5gB3NQ2JcKDhd5bKieHsdCCS43uZH+fqjjAZxSHWWfi3qGs9WwOKB0ki?=
 =?us-ascii?Q?IZdRWOrGu+YHGrKCSahq6aKEAan170sBubpU7l39KO+OjgytKhTmas3pA934?=
 =?us-ascii?Q?jwNbE5pmr9rKKhZPMwGkcDheSqzEmeP2ai+BhSl9qaR3jzrOLcSRkHUNAJuh?=
 =?us-ascii?Q?BNYLZozLZMhQKGRPe5gTHB8IKeJg7APM5VFfPYR9KO+0iacalizlxH4TW2XR?=
 =?us-ascii?Q?NhriqT8fbuu2H6gpP+o5vA6C85wsq31Tr2hhYUkJuYFaXMRJh7ow2H/t8xU3?=
 =?us-ascii?Q?N3Kgkk07g4AYgAx1r0MdjhTf4nOfntuOm4o1UsV3victP2484TFikth6PgEB?=
 =?us-ascii?Q?d2ZjkOGKzyJj91dbBVhH2yHmpJTxRy4LAd4zTzDfybkI3NS4FoUf6Gq889vY?=
 =?us-ascii?Q?3mLafaYYCLzIBG5cTagtuOw8nnPlhxurrF9+r2eUBfzhltzQBxMiwzgjPQbZ?=
 =?us-ascii?Q?ClFV+tB0VeI0DUVvG2jkE8M4VV7UikRRr709rr2aVwD1nYo79WjpnBPSbsFb?=
 =?us-ascii?Q?D0ClXLvKlg4tVXBmShOvgHffdA/C2eXNLZmIWUgEaJ2clgYisXry4JEiqSzU?=
 =?us-ascii?Q?e4e7H9lMKnnAvWA9nu49/6NRC/pTq9N+nom4/ghNEBk2MQfuEUmX5I/ttsmw?=
 =?us-ascii?Q?vmOQDf5wf78xb02cCuCRXXneCu6QvO91kcarcRZg01S0eAkuP9zo6yXaHNAv?=
 =?us-ascii?Q?Qd4lKWZf7itoGeNkwvMQBi8ngQgACaKShVRER3NYzg9jCkAwF3GEt2HgFcKU?=
 =?us-ascii?Q?kM0bVlDReZV9CX6BWNxgbJIOtohGq6z1n5z7Nzou2w25gOOScO+nN5EPeDhN?=
 =?us-ascii?Q?MV9i57bdx8eLsVQRSiBY1ZlU8xiiGUi52UFlx+5NxcLEUUOscFhJ4VU3TB7u?=
 =?us-ascii?Q?jFx6wz0T3ncGJC+lOu4pGSwAvXD17J2KL5Ugi+UwIeQSpL2ZSA9pTAU37i9o?=
 =?us-ascii?Q?nFGnfzMfi0d9yF8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 20:13:55.9867 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3264b6-2b46-4ed3-90cf-08de1727b034
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8234
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

Fixes for 6.18.

The following changes since commit dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa:

  Linux 6.18-rc3 (2025-10-26 15:59:49 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.18-2025-10-29

for you to fetch changes up to b3656b355b5522cef1b52a7469010009c98156db:

  drm/amd/display: Fix incorrect return of vblank enable on unconfigured crtc (2025-10-28 11:05:47 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.18-2025-10-29:

amdgpu:
- VPE idle handler fix
- Re-enable DM idle optimizations
- DCN3.0 fix
- SMU fix
- Powerplay fixes for fiji/iceland
- License fixes
- HDP eDP panel fix
- Vblank fix

radeon:
- devm migration fixes

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu: fix SPDX headers on amdgpu_cper.c/h
      drm/amdgpu: fix SPDX header on amd_cper.h
      drm/amdgpu: fix SPDX header on irqsrcs_vcn_5_0.h
      drm/amdgpu: fix SPDX header on cyan_skillfish_reg_init.c

Alex Hung (1):
      drm/amd/display: Add HDR workaround for a specific eDP

Daniel Palmer (2):
      drm/radeon: Do not kfree() devres managed rdev
      drm/radeon: Remove calls to drm_put_dev()

Ivan Lipski (1):
      drm/amd/display: Fix incorrect return of vblank enable on unconfigured crtc

John Smith (2):
      drm/amd/pm/powerplay/smumgr: Fix PCIeBootLinkLevel value on Fiji
      drm/amd/pm/powerplay/smumgr: Fix PCIeBootLinkLevel value on Iceland

Kenneth Feng (1):
      drm/amd/display: pause the workload setting in dm

Mario Limonciello (1):
      drm/amd: Check that VPE has reached DPM0 in idle handler

Matthew Schwartz (1):
      drm/amd/display: Don't program BLNDGAM_MEM_PWR_FORCE when CM low-power is disabled on DCN30

Yang Wang (1):
      drm/amd/pm: fix smu table id bound check issue in smu_cmn_update_table()

 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.h           |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            | 34 +++++++++++++++++++---
 .../gpu/drm/amd/amdgpu/cyan_skillfish_reg_init.c   |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c | 21 +++++++++++--
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  1 +
 .../gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c   |  3 --
 drivers/gpu/drm/amd/include/amd_cper.h             |  2 +-
 .../drm/amd/include/ivsrcid/vcn/irqsrcs_vcn_5_0.h  |  2 +-
 .../gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c  |  2 +-
 .../drm/amd/pm/powerplay/smumgr/iceland_smumgr.c   |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  2 +-
 drivers/gpu/drm/radeon/radeon_drv.c                | 25 +++-------------
 drivers/gpu/drm/radeon/radeon_kms.c                |  1 -
 14 files changed, 61 insertions(+), 40 deletions(-)
