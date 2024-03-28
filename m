Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC9788F59C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 03:54:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0361F10E0AC;
	Thu, 28 Mar 2024 02:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="R7Ujjz84";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D446610E0A0;
 Thu, 28 Mar 2024 02:54:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYoe0kWc5a+33yYGmwzuB09L4D9u/VSREB1N033dTa2P81ULyH6E+ZJdeNzt07b1uz+CCLpc+2IgurodfAGfmd75dnlPQ1cklbD4znmX+fgVy3Tk8gKvspQFOYtlu6cxc8a2tp4kRhdAB9QHAzW6nJO0rv6QM6Zei4XEabcbpRG+QTwlil856ExQcna5aBeRBwzmRTybphGqyJZSMu8ug5CrdqfQJoFp3WnULCoQb6ZN6r68m0XHxTv1214m9LghwD0ZTjX3RNKdhWpp865VGDE6TEm2Nv5NYxcvV23KyOywLHmvZlLs3/cnSFpg8GpNJTD9mhfAhRI21Du4yoXvig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqGFfouhALRwI3qkPwpQI6GtmrmwiDCdTjOfwuyZBWI=;
 b=DxdbFaMPrPQRtPkXeLQ236daEKxkOxZgqRxthwyLo5nUF8BWWaUnkF2E7if8jQ76YkVgmfVdhvwMIEogHLRFJpgpfFWk2uyvYBRfVfFQoN9x4ygjZpEDnrXysKxPqBWYKJamBDIXDXzfy5dvpSTP3Pa/bsSLKSzvZPiGiPRWWGTxisJ7iuwTP1s6lTawsOgUSPk11O3i8Z77cloXPIWyn9QCrUAKmawbCo8sghtynjRoM9WlLuqswax/w5S2nGWRnhpzdrvNP3eMUYdCYyWI7BONapit0nC/km+6SQml8cE6CU1he8kVCxCm7CNEjfgi+0y1yp0eucE3VVDF3UyKnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqGFfouhALRwI3qkPwpQI6GtmrmwiDCdTjOfwuyZBWI=;
 b=R7Ujjz84EjlebLhlh2L+Lnw4YOLaRrmTMTe7V7YO4mtDNbM2C4lxZl+zqCyYcG8qT0ShldUHekC424LDfmH+GXIu3z3UAczA5aqZ1K1j9Txd51H+t1z9GYgz20JVgafZmgh+dLGE4O+6W4fJ7kcA0cJem13Tgf3OS3F7r8hZozY=
Received: from DM6PR06CA0100.namprd06.prod.outlook.com (2603:10b6:5:336::33)
 by MN6PR12MB8515.namprd12.prod.outlook.com (2603:10b6:208:470::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Thu, 28 Mar
 2024 02:54:50 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:5:336:cafe::8f) by DM6PR06CA0100.outlook.office365.com
 (2603:10b6:5:336::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Thu, 28 Mar 2024 02:54:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Thu, 28 Mar 2024 02:54:49 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 21:54:44 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.9
Date: Wed, 27 Mar 2024 22:53:42 -0400
Message-ID: <20240328025342.8700-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|MN6PR12MB8515:EE_
X-MS-Office365-Filtering-Correlation-Id: 27f4a5bf-fa30-463d-494c-08dc4ed26f5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qg63ngmXPz9AGzcLLwnQ/OLX+vsEG5MSgmK+uvVnvmdtLAdllWFdZ9lMhK33SE03LHV+dEkHKWLLA2WfihoMgmouGADddXaaj5cqKjibJA6Tx0HNX5CxxMZxqKB4/mTq+68PP+M2h9B+xummfSszzscGJHN5b+5/PJj8TWI0yakn6iZPIeW20BfoV+zrElEs13TxRyuAvmvouR7qJK5abB5eDKQwl774MA82SCCgjl7eJ97TtffVGThQw1xN9wcKRDZuK+oWIbo8e8gY9/wNV57B+4toE4NkQhDEu7Zv7ZjtBpYowRfmZ+jnlzZn8N0Fe1fIrtuwLv2gK/592jrT1N/kYP6eNpOMj35t8cP4IvM7hU4q6DclvNKHaJwVJ4vbAJbA8YaIn8dr90AK2AfUfqMnFgvxj4vrCqT8GY7IsMSEINFWFT5Z1/l9JwUBPQZbCp2shwHi/1uQiDScxW6QqNR3nRdasBSc936xRQ3jRhO40uNT70PVvD+5iYTnEKcwqkiyWA3DOHGi9se3JLYu7dXBkGPWHMA0+NYZUcTOYJtKvm4Ju0+L5GvRUth/17RfQTtIb2rcxDrtiXT7nbbzvehSX1VMZtnLmb1fnzOxCyY8gViadFSy1QUYScJllexlY/e36LYrXdEipK7PUgfb+o+nbq9/gpehy8LpU7Jpka4lSOOd71zOZFnY/RwTpEOf+Ic5jLuH2kTQH6dVaypUlg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(82310400014)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 02:54:49.7182 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27f4a5bf-fa30-463d-494c-08dc4ed26f5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8515
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

Hi Dave, Sima,

Fixes for 6.9.  Mostly fixes for new IPs added in 6.9.

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.9-2024-03-27

for you to fetch changes up to 8678b1060ae2b75feb60b87e5b75e17374e3c1c5:

  drm/amdgpu: fix deadlock while reading mqd from debugfs (2024-03-27 09:30:34 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.9-2024-03-27:

amdgpu:
- SMU 14.0.1 updates
- DCN 3.5.x updates
- VPE fix
- eDP panel flickering fix
- Suspend fix
- PSR fix
- DCN 3.0+ fix
- VCN 4.0.6 updates
- debugfs fix

amdkfd:
- DMA-Buf fix
- GFX 9.4.2 TLB flush fix
- CP interrupt fix

----------------------------------------------------------------
Chris Park (1):
      drm/amd/display: Prevent crash when disable stream

Eric Huang (1):
      drm/amdkfd: fix TLB flush after unmap for GFX9.4.2

George Shen (1):
      drm/amd/display: Remove MPC rate control logic from DCN30 and above

Hamza Mahfooz (1):
      drm/amd/display: fix IPX enablement

Harry Wentland (1):
      Revert "drm/amd/display: Fix sending VSC (+ colorimetry) packets for DP/eDP displays without PSR"

Johannes Weiner (1):
      drm/amdgpu: fix deadlock while reading mqd from debugfs

Jonathan Kim (1):
      drm/amdkfd: range check cp bad op exception interrupts

Lang Yu (2):
      drm/amdgpu/umsch: update UMSCH 4.0 FW interface
      drm/amdgpu: enable UMSCH 4.0.6

Mario Limonciello (1):
      drm/amd: Flush GFXOFF requests in prepare stage

Mukul Joshi (1):
      drm/amdkfd: Check cgroup when returning DMABuf info

Natanel Roizenman (1):
      drm/amd/display: Increase Z8 watermark times.

Peyton Lee (1):
      drm/amdgpu/vpe: power on vpe when hw_init

Roman Li (1):
      drm/amd/display: Fix bounds check for dcn35 DcfClocks

Sung Joon Kim (1):
      drm/amd/display: Update dcn351 to latest dcn35 config

Taimur Hassan (1):
      drm/amd/display: Send DTBCLK disable message on first commit

Wenjing Liu (1):
      drm/amd/display: fix a dereference of a NULL pointer

Xi Liu (2):
      drm/amd/display: increase bb clock for DCN351
      drm/amd/display: Set DCN351 BB and IP the same as DCN35

lima1002 (1):
      drm/amd/swsmu: add smu 14.0.1 vcn and jpeg msg

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  46 +++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c       |  12 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.h       |  20 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |   6 ++
 drivers/gpu/drm/amd/amdgpu/umsch_mm_v4_0.c         |   7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c   |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c   |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   8 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |   8 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.h  |   2 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |   7 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   6 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c   |  54 ++++++-----
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h   |  14 +--
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c   |   5 +-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |   4 +-
 .../gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c | 103 +++++++++++++++++----
 .../amd/display/dc/dml2/dml2_translation_helper.c  |   6 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |   3 +-
 .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  |  41 --------
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |  41 --------
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |  41 --------
 .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |   2 +-
 .../display/dc/resource/dcn351/dcn351_resource.c   |  11 ++-
 .../amd/display/modules/info_packet/info_packet.c  |  13 +--
 drivers/gpu/drm/amd/include/umsch_mm_4_0_api_def.h |  13 ++-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v14_0_0_ppsmc.h   |  28 +++---
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |  10 ++
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |  50 ++++++++--
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |  21 +++--
 include/uapi/linux/kfd_ioctl.h                     |  17 +++-
 36 files changed, 342 insertions(+), 275 deletions(-)
