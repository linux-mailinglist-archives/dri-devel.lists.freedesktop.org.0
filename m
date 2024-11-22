Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 732689D6180
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 16:45:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F11410EBD4;
	Fri, 22 Nov 2024 15:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pOIlIB50";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2068.outbound.protection.outlook.com [40.107.212.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6594410EBDA;
 Fri, 22 Nov 2024 15:45:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CAlIQwcZKDQMdJjoMU60phQsF0tl6JWJlGLfIS83JsvSI2ZSuJjwiiQn9IGKxLcyqDLsViwbmA2r+GCbkN1HE2tshvaSkx0moi0P8hltKkOOC7VDV3Y8dfly0HCI7YkvKNLpy37fkpRiBvuYWOHKPNPXMODHPYl8d6QdjW7skWovkU9YypJYKlIL5pxcjldwjuXEu6d+GEAxtU4WYHbveDjDjg50KE1dxvFCf4QYO83brqq5V6/rKOQShkb/KtPXyRMp5fBVIPpmGB925d1NsO9b2FWM/CBzJn0hT/NobiuAJZ99d/RHcX4W3uPIQg9KLpGxk8es4GAi76z/DJy5aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svh5bHnu787GZwi0bKuj7fY6H/RMAY+N0fA5cKNX75w=;
 b=hmIXCK6B3tRRCsDhdQIfkMSj52HJwk/Xhm9Mn8p/b6c0Y2lHimDCTxmFkDWsH8dZAXauaHstnkHMPIcKtQa8SS2pkvdVlWrDmra79OOoQXTFyBRBUP2pxNpvSGFK1iA0WTmWpPXyjnbg44jC4rIIi0bKAHbHWlTqF6tIefQYSTR09X5EyUcA91IaFO7OVJqeSyvN7Zq82n4RkRVkgDu07BGh0/OYPptQnONWa4iPB2wb79msbz43OBrZE4s1uP1FWlDjwqAT4MMm5MdeunK/9GLzNpb9bZWe05/YkpRHiOom/j6WwYYZgZf5ako/vfyJtx4FxbcQjZI2ks/wWylA0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svh5bHnu787GZwi0bKuj7fY6H/RMAY+N0fA5cKNX75w=;
 b=pOIlIB50wSZzEo6GaFw78m+DbtGpW5k0zD7GsXNgLu9n3LifJjIj6Igyk/eZH661Ux8kXTOScsWJ77cYjm5dkN4ox5BLOo8gxUxGkEFNRfZf0my3fs3q63AlxzLUaZE1I5bDoCYDIYLEHm0OYczA4iUE+2yaeHBq7DNT09yrGSM=
Received: from BN9PR03CA0913.namprd03.prod.outlook.com (2603:10b6:408:107::18)
 by SN7PR12MB8169.namprd12.prod.outlook.com (2603:10b6:806:32f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Fri, 22 Nov
 2024 15:44:56 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:408:107:cafe::55) by BN9PR03CA0913.outlook.office365.com
 (2603:10b6:408:107::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17 via Frontend
 Transport; Fri, 22 Nov 2024 15:44:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.16 via Frontend Transport; Fri, 22 Nov 2024 15:44:55 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Nov
 2024 09:44:54 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-fixes-6.13
Date: Fri, 22 Nov 2024 10:44:41 -0500
Message-ID: <20241122154441.636075-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|SN7PR12MB8169:EE_
X-MS-Office365-Filtering-Correlation-Id: a9bacc8c-be21-4bd3-1819-08dd0b0c9d1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ph3GOIz9nSqmmPQSoVIGhESdtdbmWx4I04fAj6pGiNXiZtQrIULFOO3qbS0C?=
 =?us-ascii?Q?yxLDp7jmrYvNSP074m9MvUVfdNPRqdRGQMrkgfY2AvF4YsEVu+0Cp+Rl6+ws?=
 =?us-ascii?Q?H1Jkm/2hFGJkluXqTIA6HBxmsp3N78vEmN5DaqJVlDwE1EEdR+7KvKYtJErx?=
 =?us-ascii?Q?AkiSsnkID1Pif/Rx8eW9xfEVWmZlFF5bAfA1mf+YvGWZEHTra9GeXTmGM+gv?=
 =?us-ascii?Q?03aoge8wTSPU67I8DKuHcCWK6q2IhJyudvn6zM0KMKnOl7fTZRg+v7O+/SE4?=
 =?us-ascii?Q?sbZUiOcJcq7bl+GhaqTET3aA4CZZGAy2x0TyXffDbsqnGJJ3Rk1FkcLySdWM?=
 =?us-ascii?Q?dOf19EWNjsYhyKDpyyCQkONQqldC9HVVtbwXJ68PCH2SQamt0F5+cBkD50ZS?=
 =?us-ascii?Q?XHnJRl7GuCNM7Z7Og0MR5Q0PeSAExxKkq8VwgeZt+WQ+TOa2o3fJIloGuD3U?=
 =?us-ascii?Q?NjrgLBfbWqOzZMgYwfBIVmmGe8c1jKEVsyEAyXs7Vplw/Z674HE7cw60Benf?=
 =?us-ascii?Q?hp8niEBF7IGZFkMOEb+FJFRyuh7dgaJjnizjuAYikK8wwkT36rrGLxaFJdkr?=
 =?us-ascii?Q?puPeWgemH5rNQASRtp87UV8q/yWMAKomaKTCp01qyDnr82dt8RWL4MV7cn65?=
 =?us-ascii?Q?AUU9/obXFHSabsT15C2/OQBM9zb1c8MXxnmgT5782BJCrB+E+BzNfHpS4MsK?=
 =?us-ascii?Q?vRqfGxJTC/nc7lndCTTbbyqm/ljsEZx/QnBFgtR8zgUdCkTgD/LKFhW3UsmT?=
 =?us-ascii?Q?76aGpKw66KYQ8AqNrNbu7St7hGKcG8OD96BxZTLV6tWVbA2zQH91dkcxj3Mg?=
 =?us-ascii?Q?uupUffbAkT5KJL0nABfH9XVxFq9HJGkC1S7pUVpZA/8FP6K+mSwNUop3+znR?=
 =?us-ascii?Q?juEC8LcUNceAszINFCg+JCnFGrd8Uc1RyQywEcYZLa5hBor/onWyRxP/j+wf?=
 =?us-ascii?Q?DC6dIsqeji38J5+Kzlo4N4Z81W4VMw9XUIyaFsiJysBgTo1JlCixrFwfCgv8?=
 =?us-ascii?Q?3iPrhQSbk5f3Ed9zbfnwfxXb2RCrWlLiUAjcUr3waBNcH4I7avrlhIc/z0Wu?=
 =?us-ascii?Q?+OtELW1Y/n1qForEjFlkFlYE+VP1rJ8sqJj42SgJisfRlrwdluIogSfiA0lT?=
 =?us-ascii?Q?Sakxn2qQietqlZSoIRK8NFjw07fm7Jg1E1MO9TBZtdtf1BisB/duLP9pxIfZ?=
 =?us-ascii?Q?q0Lp2ewg6aZRa5f5KGWRy70CAehuVbtlyTOpqrRekp7OOYp5/MW0B3Kif/07?=
 =?us-ascii?Q?HC8OGIUHX1DXEXegsaX0QhoybbbeXtEwM7pjiA0furFjOeJwhbsccEqPc+vC?=
 =?us-ascii?Q?UfZlNdLIoJJNI3TgTs60NLl6MAB0qJOWPC6teNC191IKPne7L1CBnFwV+UZp?=
 =?us-ascii?Q?UcQjV70=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.12; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:atlvpn-bp.amd.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 15:44:55.9165 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9bacc8c-be21-4bd3-1819-08dd0b0c9d1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.12];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8169
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

Fixes for 6.13.

The following changes since commit a163b895077861598be48c1cf7f4a88413c28b22:

  Merge tag 'drm-xe-next-fixes-2024-11-15' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2024-11-18 13:38:46 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.13-2024-11-22

for you to fetch changes up to 979bfe291b5b30a9132c2fd433247e677b24c6aa:

  Revert "drm/radeon: Delay Connector detecting when HPD singals is unstable" (2024-11-21 15:56:23 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.13-2024-11-22:

amdgpu:
- SMU 13.0.6 fixes
- XGMI fixes
- SMU 13.0.7 fixes
- Misc code cleanups
- Plane refcount fixes
- DCN 4.0.1 fixes
- DC power fixes
- DTO fixes
- NBIO 7.11 fixes
- SMU 14.0.x fixes
- Reset fixes
- Enable DC on LoongArch
- Sysfs hotplug warning fix
- Misc small fixes
- VCN 4.0.3 fix
- Slab usage fix
- Jpeg delayed work fix

amdkfd:
- wptr handling fixes

radeon:
- Use ttm_bo_move_null()
- Constify struct pci_device_id
- Fix spurious hotplug
- HPD fix

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu/gmc7: fix wait_for_idle callers
      drm/amdgpu/jpeg: cancel the jpeg worker
      Revert "drm/radeon: Delay Connector detecting when HPD singals is unstable"

Aric Cyr (1):
      drm/amd/display: 3.2.310

Asad Kamal (3):
      drm/amd/pm: Update data types used for uapi i/f
      drm/amd/pm: Add gpu_metrics_v1_7
      drm/amd/pm: Get xgmi link status for XGMI_v_6_4_0

Austin Zheng (1):
      drm/amd/display: Populate Power Profile In Case of Early Return

Bhavin Sharma (2):
      drm/amd/pm: remove redundant tools_size check
      drm/amd/display: remove redundant is_dsc_possible check

Chris Park (1):
      drm/amd/display: Ignore scalar validation failure if pipe is phantom

Christophe JAILLET (1):
      drm/radeon: Constify struct pci_device_id

Dillon Varone (1):
      drm/amd/display: Enable Request rate limiter during C-State on dcn401

Huacai Chen (2):
      drm/radeon: Use ttm_bo_move_null() in radeon_bo_move()
      drm/amd/display: Allow building DC with clang on LoongArch

Jesse.zhang@amd.com (2):
      drm/amdgpu: Add sysfs interface for vcn reset mask
      drm/amdgpu: Fix sysfs warning when hotplugging

Joshua Aberback (1):
      drm/amd/display: Fix handling of plane refcount

Kenneth Feng (3):
      drm/amdgpu/pm: add gen5 display to the user on smu v14.0.2/3
      drm/amd/pm: disable pcie speed switching on Intel platform for smu v14.0.2/3
      drm/amd/pm: skip setting the power source on smu v14.0.2/3

Lijo Lazar (4):
      drm/amdgpu: Add init level for post reset reinit
      drm/amdgpu: Use reset recovery state checks
      drm/amdkfd: Use the correct wptr size
      drm/amd/pm: Remove arcturus min power limit

Mario Limonciello (2):
      drm/amd: Add some missing straps from NBIO 7.11.0
      drm/amd: Fix initialization mistake for NBIO 7.11 devices

Ovidiu Bunea (1):
      drm/amd/display: Remove PIPE_DTO_SRC_SEL programming from set_dtbclk_dto

Samson Tam (2):
      drm/amd/display: add public taps API in SPL
      drm/amd/display: allow chroma 1:1 scaling when sharpness is off

Steven 'Steve' Kendall (1):
      drm/radeon: Fix spurious unplug event on radeon HDMI

Umio Yasuno (1):
      drm/amd/pm: update current_socclk and current_uclk in gpu_metrics on smu v13.0.7

Victor Zhao (1):
      drm/amdkfd: make sure ring buffer is flushed before update wptr

Vitaly Prosyak (1):
      drm/amdgpu: fix usage slab after free

Xiang Liu (1):
      drm/amdgpu/vcn: reset fw_shared when VCPU buffers corrupted on vcn v4.0.3

Yihan Zhu (1):
      drm/amd/display: update pipe selection policy to check head pipe

Zicheng Qu (2):
      drm/amd/display: Fix null check for pipe_ctx->plane_state in dcn20_program_pipe
      drm/amd/display: Fix null check for pipe_ctx->plane_state in hwss_setup_dpp

 drivers/gpu/drm/amd/amdgpu/aldebaran.c             |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  29 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c    |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            |  37 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  41 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |   2 +
 drivers/gpu/drm/amd/amdgpu/df_v3_6.c               |   4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |  18 +++-
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c            |   9 ++
 drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c        |   2 +
 drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c          |   2 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   9 ++
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |  39 +++++--
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |  10 ++
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c      |   7 +-
 drivers/gpu/drm/amd/display/Kconfig                |  15 +--
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   7 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |   3 +
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   8 ++
 drivers/gpu/drm/amd/display/dc/dc.h                |   2 +-
 .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c |  15 +--
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |   6 ++
 .../amd/display/dc/dml2/dml2_dc_resource_mgmt.c    |  23 +++-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |  13 +--
 .../drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.h |   8 +-
 .../drm/amd/display/dc/hubbub/dcn20/dcn20_hubbub.h |   1 +
 .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.c   |  24 ++++-
 .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.h   |   7 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |   6 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |  13 ++-
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |   2 +-
 .../display/dc/resource/dcn401/dcn401_resource.h   |   3 +-
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c        |  97 +++++++++++------
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.h        |   2 +
 .../amd/include/asic_reg/nbio/nbio_7_11_0_offset.h |   2 +
 .../include/asic_reg/nbio/nbio_7_11_0_sh_mask.h    |  13 +++
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     | 118 ++++++++++++++++++++-
 .../drm/amd/pm/powerplay/smumgr/vega12_smumgr.c    |  24 ++---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   8 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v14_0.h       |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |   6 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |  12 ++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |   2 +
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |   2 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  33 ++++--
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   3 +
 drivers/gpu/drm/radeon/radeon_audio.c              |  12 ++-
 drivers/gpu/drm/radeon/radeon_connectors.c         |  10 --
 drivers/gpu/drm/radeon/radeon_drv.c                |   3 +-
 drivers/gpu/drm/radeon/radeon_ttm.c                |   3 +-
 67 files changed, 626 insertions(+), 166 deletions(-)
