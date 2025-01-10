Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF048A09880
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 18:27:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698DA10E13F;
	Fri, 10 Jan 2025 17:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="O+2BWBzj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::61b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870E710E509;
 Fri, 10 Jan 2025 17:27:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wXSOhtcL1rZSstRx6M481QvkC+JiEBlmiNaREuR35aPqLnfCPpK2KEqSLvbVvyr1w20rKFDpaCtT1agX0kUQ6G/Y2jXxREi+9w98JvpvMWCy2im5R2nlyJZUINa9BsKW3tTtfnYQilpT/XqUqveB6dJiMktMaR10KSTwSrbTFgZpm9BpfSr0qmglAFMAjn9a1bXmSvAoF+qBAvTTpVDCfhW2eiR38t68i4sfMU9+uqFd6Gc4rP2x2SQ/giISTUISunNfaIe0K+huHohpo/m5SozZPOAh/Uxc9/3C+7jliWL4rXFaN4iieDx0H2a5rzbxjl582JBfrwbNCMuMkOWsNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJnYBDpuAwRJDhRIqw7DMZ65fYjUZb7qu6FHPgtd5HM=;
 b=LrWxvPr4d3A9JR0/7szSgAwz+PE1DYIozN2EPpGxd380DQHcQxnBL7oPFOPSaTioTYNOZPzSJjVF7ZbETZmms9Poc1nopGe5w1MJWwxl79vdsA+73AlyERPkAXaYCcdcqbFqXuzFuCotyCAdTDDtVS073HYmPycajLqjGvqVzfHQXBQg3hCtdRbTjpzb1PLB7TAtc0usnqWa0hDN50Oxca6gukFyV223Ng5duriD854XUUqwWULmJrYX4JfB7nL4mtarhvYeBxD6yMxQfW8Py0OZiBSqPKBnirycDIC9Eo0krspcFDgpklr3ilKGHl5C0NVFHtQ2y7gGpkld2Z5MDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJnYBDpuAwRJDhRIqw7DMZ65fYjUZb7qu6FHPgtd5HM=;
 b=O+2BWBzj6pApYPGd89kRp/g7EVXCKD3N90bBVIzUR0IzXNj8rISpuSvtOwnYgoBcpefoJVGlpel8LHFvhQY4XTf2X8hDx1RRoiYYCmJyvcAcBoEz7mavpnDYyk6U8mnMaNaTfHoYjf77GnB1wZX102JYEuoVFuRn8vuXe3D3xzU=
Received: from BY5PR03CA0014.namprd03.prod.outlook.com (2603:10b6:a03:1e0::24)
 by DM4PR12MB5938.namprd12.prod.outlook.com (2603:10b6:8:69::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.10; Fri, 10 Jan 2025 17:27:47 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::52) by BY5PR03CA0014.outlook.office365.com
 (2603:10b6:a03:1e0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.12 via Frontend Transport; Fri,
 10 Jan 2025 17:27:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 17:27:46 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 10 Jan
 2025 11:27:45 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-next-6.14
Date: Fri, 10 Jan 2025 12:27:31 -0500
Message-ID: <20250110172731.2960668-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|DM4PR12MB5938:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f60470b-b1b8-4627-d903-08dd319c1986
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EK3UxtscaQ28kfybmrQK1GKvQ081JN833oq0sHxK3mLj4BvA+SLrrljY6whm?=
 =?us-ascii?Q?tlPI6rWAuNcqoXiB26L2OwfpH5xuvWiKkdQ/dqisz4AUltWiUQxu35XrTxDV?=
 =?us-ascii?Q?6litnJyYtg7QaFiWOzfc1xcBzDqirNE1mJYZgzHAOF6eu0ATGjPKEqFiBusz?=
 =?us-ascii?Q?prIkGvrIils9QzVD7ZHmQLFuF9KQepuapX+P29yTRISuiR2KfdmUJP/fpCh1?=
 =?us-ascii?Q?nKf80phGQkrYSpK2h7/Tuhni6lTf0OoUFMO5weaOhyP0uctwk4RLVmauyoUH?=
 =?us-ascii?Q?aNlBctGCZ23wcf8t1UAKgupNHUcZLdLllZ7eqnGVZbt54aO0hyh51hj+T/AA?=
 =?us-ascii?Q?IHS0+XHSnnTaKgwQf3inrf600UZmPW0IOdkgA68JxW+9smxUCcnmKZtOKAHR?=
 =?us-ascii?Q?b5BrLi0jItTqfJZgJpv+HBb09EU0lIRzHG3L4r21n8yR5QbPirieKSHUx5Pq?=
 =?us-ascii?Q?H/FEXQNW7Q43D9LvEWXpEnbN/tW+Vc3igsO0ctKwyWMUx4ZyrH+cTqYGdzhN?=
 =?us-ascii?Q?7J75I7e2f8zwCRyR7s4lvgtnSfwEO6jeg9XlPiLSOfANpqE78cRksWcZpV7G?=
 =?us-ascii?Q?iO2Ryhn4LXq7KVolKPISdJ7aCeCMHpz/KeKGkT7e2UadnRO02BehJ3Dm2Z3g?=
 =?us-ascii?Q?39Mx9hE1tpAE2TBWBK0JD8h1+x2mRXP88UGSbmjzQu2INISh7YLArqe9FlIt?=
 =?us-ascii?Q?DB5nBN8jXybhSLVLOsfNKgJcIqDjWrBg9+MG1/HMJ5K064s7xhsBNGDa5dey?=
 =?us-ascii?Q?WEdjvJDM7RhbYQWGd9s5vR3jMDoV8egPUMWoGsMG9dyPWDJW/S1SZ0KL9Ebb?=
 =?us-ascii?Q?fh6C9sI3cFqxM225WEOoUDX1QpwZnGUL3iA9alOSKiN0NDVcQAEMZB3s55NP?=
 =?us-ascii?Q?p+yqzlr9IMk1nwed7+dyxaetisIgQFeeCkDhgK6BJzDEHc8KeRBko7hKNlq/?=
 =?us-ascii?Q?SsVwhxn7HIsY/5ZVVW6qfQydKt+WQJbVG/PxQLYZnhWmND3BymeuO8F9SVbr?=
 =?us-ascii?Q?a4gEImPZTNsHI5emE1DIOpiLudmuvo4tp20q0fvr/cYytWtJyseujrbcDrG+?=
 =?us-ascii?Q?OvzNjeCexslN/pQG2xTIzamDtB/9FmGNqFIYbbIBzTENslAR8VDnBiDQck19?=
 =?us-ascii?Q?BdOgBuIAyM0lNSID8EKVOtWeGWqDXM+7c98ZsM1LQK8mSXyV9uwiGsJ9BLUN?=
 =?us-ascii?Q?H6XAQe85Y7mRJIw9Ieh0TEDOywDYN7x6MvYfh0PV2JDgL+Ymc3KnQndRQj/A?=
 =?us-ascii?Q?14Adqlwk2AC6drdKYaqgNW0l+P7/tTjNGFZD1lGrYr2M3MilUw/74dy7OElG?=
 =?us-ascii?Q?ZNDmgh0GcChEKQfLtDTTP0csps+HA4+2gb83M7qwmi//qvnQsNL5oVBrpeZO?=
 =?us-ascii?Q?oD7+wn19jCJepc6R/7P6Q18N6+8Mh0O27Bt/CTGEz+9ewexFM/BPEorDz3Q0?=
 =?us-ascii?Q?3qcm1s1zXtc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 17:27:46.7686 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f60470b-b1b8-4627-d903-08dd319c1986
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5938
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

Updates for 6.14.

The following changes since commit 695c2c745e5dff201b75da8a1d237ce403600d04:

  drm/amdgpu: Handle NULL bo->tbo.resource (again) in amdgpu_vm_bo_update (2024-12-18 12:39:08 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.14-2025-01-10

for you to fetch changes up to 812a33a65d00e3d813f5ed2c9923569acd0b445c:

  drm/amd/display: 3.2.316 (2025-01-10 12:12:47 -0500)

----------------------------------------------------------------
amd-drm-next-6.14-2025-01-10:

amdgpu:
- Fix max surface handling in DC
- clang fixes
- DCN 3.5 fixes
- DCN 4.0.1 fixes
- DC CRC fixes
- DML updates
- DSC fixes
- PSR fixes
- DC add some divide by 0 checks
- SMU13 updates
- SR-IOV fixes
- RAS fixes
- Cleaner shader support for gfx10.3 dGPUs
- fix drm buddy trim handling
- SDMA engine reset updates
_ Fix RB bitmap setup
- Fix doorbell ttm cleanup
- Add CEC notifier support
- DPIA updates
- MST fixes

amdkfd:
- Shader debugger fixes
- Trap handler cleanup
- Cleanup includes
- Eviction fence wq fix

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/smu13: update powersave optimizations

Alex Hung (2):
      drm/amd/display: Remove unnecessary amdgpu_irq_get/put
      drm/amd/display: Initialize denominator defaults to 1

Aric Cyr (1):
      drm/amd/display: Optimize cursor position updates

Arunpravin Paneer Selvam (1):
      drm/amdgpu: Add a lock when accessing the buddy trim function

Asad Kamal (2):
      drm/amd/pm: Update SMUv13.0.6 PMFW headers
      drm/amd/pm: Fill max mem bw & total app clk counter

Aurabindo Pillai (2):
      drm/amd/display: Add guards around MAX/MIN
      Revert "drm/amd/display: Optimize cursor position updates"

Austin Zheng (1):
      drm/amd/display: Apply DML21 Patches

Brandon Syu (1):
      drm/amd/display: modify init dc_power_state

Charlene Liu (1):
      drm/amd/display: avoid reset DTBCLK at clock init

Dan Carpenter (1):
      drm/amdgpu: Fix shift type in amdgpu_debugfs_sdma_sched_mask_set()

Dennis Chan (1):
      drm/amd/display: Revised for Replay Pseudo vblank control

Dennis.Chan (1):
      drm/amd/display: Implement Replay Low Hz Visual Confirm

Dillon Varone (2):
      drm/amd/display: Cleanup outdated interfaces in dcn401_clk_mgr
      drm/amd/display: Add SMU interface to get UMC count for dcn401

Fangzhi Zuo (1):
      drm/amd/display: Add Interface to Dump DSC Caps from dm

Gabe Teeger (1):
      drm/amd/display: Limit Scaling Ratio on DCN3.01

George Shen (5):
      drm/amd/display: Parse RECEIVE_PORT0_CAP capabilities from DPCD
      drm/amd/display: Add DP required HBlank size calc to link interface
      drm/amd/display: Add expanded HBlank field to dc_crtc_timing
      drm/amd/display: Add HBlank reduction DPCD write to DPMS sequence
      drm/amd/display: Add 6bpc RGB case for dcn32 output bpp calculations

Iswara Nagulendran (1):
      drm/amd/display: Add VC for VESA Aux Backlight Control

Jack Chang (1):
      drm/amd/display: Add replay desync error count tracking and reset functionality

Jay Cornwall (1):
      drm/amdkfd: Move gfx12 trap handler to separate file

Jesse Zhang (4):
      drm/amdgpu/sdma4.4.2: add apu support in sdma queue reset
      drm/amdgpu/pm: add definition PPSMC_MSG_ResetSDMA2
      drm/amdgpu/pm: Implement SDMA queue reset for different asic
      drm/amdgpu: enable gfx12 queue reset flag

Jesse.zhang@amd.com (1):
      drm/amdkfd: fixed page fault when enable MES shader debugger

Jiang Liu (2):
      drm/amdgpu: tear down ttm range manager for doorbell in amdgpu_ttm_fini()
      drm/amdgpu: wrong array index to get ip block for PSP

Jonathan Kim (1):
      drm/amdgpu: fix gpu recovery disable with per queue reset

Karthi Kandasamy (3):
      drm/amd/display: Update dc_tiling_info union to structure
      drm/amd/display: Ensure correct GFX tiling info passed to DML
      drm/amd/display: Remove unused read_ono_state function from Hwss module

Kent Russell (1):
      drm/amdgpu: Remove unnecessary NULL check

Kun Liu (2):
      drm/amd/pm:  fix BUG: scheduling while atomic
      drm/amd/display: add CEC notifier to amdgpu driver

Leo Li (2):
      drm/amd/display: Do not wait for PSR disable on vbl enable
      drm/amd/display: Do not elevate mem_type change to full update

Martin Leung (1):
      drm/amd/display: Promote DC to 3.2.315

Melissa Wen (3):
      drm/amd/display: fix page fault due to max surface definition mismatch
      drm/amd/display: increase MAX_SURFACES to the value supported by hw
      drm/amd/display: fix divide error in DM plane scale calcs

Michael Strauss (1):
      drm/amd/display: Update chip_cap defines and usage

Natanel Roizenman (1):
      drm/amd/display: correct type mismatches in comparisons in DML2

Nathan Chancellor (2):
      drm/amd/display: Reapply fdedd77b0eb3
      drm/amd/display: Increase sanitizer frame larger than limit when compile testing with clang

Nicholas Susanto (1):
      Revert "drm/amd/display: Enable urgent latency adjustments for DCN35"

Peichen Huang (2):
      drm/amd/display: have pretrain for dpia
      drm/amd/display: improve dpia pre-train

Prike Liang (1):
      drm/amdgpu: reduce RLC safe mode request for gfx clock gating

Rafal Ostrowski (1):
      drm/amd/display: DML2.1 Post-Si Cleanup

Robin Chen (1):
      drm/amd/display: Add a new flag for replay low hz

Roman Li (1):
      drm/amd/display: Add check for granularity in dml ceil/floor helpers

Ryan Seto (1):
      drm/amd/display: 3.2.316

Samson Tam (2):
      drm/amd/display: fix init_adj offset for cositing in SPL
      drm/amd/display: Clean up SPL code

Srinivasan Shanmugam (3):
      drm/amdgpu: Fix error handling in amdgpu_ras_add_bad_pages
      drm/amdgpu/gfx10: Add cleaner shader for GFX10.3.0
      drm/amdgpu/gfx10: Enable cleaner shader for GFX10.3.2/10.3.4/10.3.5 GPUs

Sung Lee (1):
      drm/amd/display: Log Hard Min Clocks and Phantom Pipe Status

Taimur Hassan (1):
      drm/amd/display: [FW Promotion] Release 0.0.248.0

Tim Huang (2):
      drm/amdgpu: fix incorrect active RB bitmap in setup RBs
      drm/amdgpu: fix incorrect number of active RBs for gfx12

Tom Chung (3):
      drm/amd/display: Fix PSR-SU not support but still call the amdgpu_dm_psr_enable
      drm/amd/display: Disable replay and psr while VRR is enabled
      drm/amd/display: Use HW lock mgr for PSR1

Victor Zhao (1):
      drm/amdgpu: fill the ucode bo during psp resume for SRIOV

Wayne Lin (8):
      drm/amd/display: Add support for setting multiple CRC windows in dc
      drm/amd/display: Extend dc_stream_get_crc to support 2nd crc engine
      drm/amd/display: Adjust dm to use supported interfaces for setting multiple crc windows
      drm/amd/display: Extend capability to get multiple ROI CRCs
      drm/amd/display: Validate mdoe under MST LCT=1 case as well
      drm/amd/display: Reduce accessing remote DPCD overhead
      drm/amd/display: Add support to configure CRC window on specific CRC instance
      drm/amd/display: Extend secure display to support DisplayCRC mode

Yihan Zhu (2):
      drm/amd/display: update sequential pg logic DCN35
      drm/amd/display: power up all gating blocks when releasing hw DCN35

Yiling Chen (1):
      drm/amd/display: Remove unnecessary eDP power down

Zhu Lingshan (2):
      drm/amdkfd: wq_release signals dma_fence only when available
      drm/amdkfd: always include uapi header in priv.h

yfeng1 (1):
      drm/amdgpu: Fix for MEC SJT FW Load Fail on VF

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |    6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |    2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   18 +
 .../gpu/drm/amd/amdgpu/gfx_v10_0_cleaner_shader.h  |   56 +
 .../drm/amd/amdgpu/gfx_v10_3_0_cleaner_shader.asm  |  124 +++
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |    5 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |   17 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   12 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   14 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |    9 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |    2 +-
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm |  202 +---
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx12.asm | 1126 ++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c             |   17 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |    3 +-
 drivers/gpu/drm/amd/display/Kconfig                |    2 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  175 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    8 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |  271 +++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h  |   32 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |    4 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.h |    2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   99 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |    6 +
 .../amd/display/amdgpu_dm/amdgpu_dm_irq_params.h   |    4 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   48 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   17 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h    |    2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |   35 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.h  |    3 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |    9 +-
 .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |   18 +-
 .../gpu/drm/amd/display/dc/clk_mgr/dcn401/dalsmc.h |    4 +-
 .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c |  265 +----
 .../dc/clk_mgr/dcn401/dcn401_clk_mgr_smu_msg.c     |   14 +
 .../dc/clk_mgr/dcn401/dcn401_clk_mgr_smu_msg.h     |    1 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  110 +-
 .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |   38 +
 .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |    8 +
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   16 +-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |    8 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |    2 +
 drivers/gpu/drm/amd/display/dc/dc.h                |   42 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |   16 +
 drivers/gpu/drm/amd/display/dc/dc_dsc.h            |    5 +
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |  179 ++--
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |   12 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   35 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c |   10 +-
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |    3 +-
 .../drm/amd/display/dc/dce110/dce110_mem_input_v.c |    8 +-
 .../display/dc/dce110/dce110_timing_generator.c    |  201 ++--
 .../display/dc/dce110/dce110_timing_generator.h    |    2 +-
 .../display/dc/dce120/dce120_timing_generator.c    |  124 ++-
 .../display/dc/dio/dcn31/dcn31_dio_link_encoder.c  |    5 +-
 .../display/dc/dio/dcn35/dcn35_dio_link_encoder.c  |   80 ++
 .../display/dc/dio/dcn35/dcn35_dio_link_encoder.h  |   18 +
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |    5 +
 .../dc/dml/dcn32/display_mode_vba_util_32.c        |    4 +
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |    4 +-
 .../gpu/drm/amd/display/dc/dml/dml_inline_defs.h   |    8 +
 drivers/gpu/drm/amd/display/dc/dml2/Makefile       |    4 +
 .../dc/dml2/dml21/dml21_translation_helper.c       |  102 +-
 .../dc/dml2/dml21/dml21_translation_helper.h       |    2 -
 .../drm/amd/display/dc/dml2/dml21/dml21_utils.c    |  129 +--
 .../drm/amd/display/dc/dml2/dml21/dml21_utils.h    |    8 +-
 .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |    8 -
 .../dc/dml2/dml21/inc/bounding_boxes/dcn3_soc_bb.h |  401 -------
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |  111 +-
 .../dml21/src/dml2_core/dml2_core_shared_types.h   |    6 +-
 .../dc/dml2/dml21/src/dml2_core/dml2_core_utils.c  |    2 +-
 .../dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c   |   14 +-
 .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c     |   12 +-
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |   40 +-
 .../dml2/dml21/src/dml2_top/dml2_top_interfaces.c  |    1 -
 .../dc/dml2/dml21/src/dml2_top/dml2_top_legacy.c   |    6 +
 .../dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c    |    1 +
 .../dc/dml2/dml21/src/dml2_top/dml2_top_soc15.h    |    1 +
 .../dml21/src/inc/dml2_internal_shared_types.h     |    2 -
 .../drm/amd/display/dc/dml2/dml2_mall_phantom.c    |    2 +-
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |   14 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |   45 +
 .../gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c |    4 +-
 .../gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.h |    4 +-
 .../gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.c |    4 +-
 .../gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.h |    2 +-
 .../drm/amd/display/dc/hubp/dcn201/dcn201_hubp.c   |    2 +-
 .../gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.c |    4 +-
 .../gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.h |    4 +-
 .../gpu/drm/amd/display/dc/hubp/dcn35/dcn35_hubp.c |    2 +-
 .../gpu/drm/amd/display/dc/hubp/dcn35/dcn35_hubp.h |    2 +-
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c   |   96 +-
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.h   |   39 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |  257 +++--
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.h    |   17 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |   12 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |   41 +-
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.h    |    2 +
 .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |    5 +
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |  831 +++++++++++++--
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h  |   11 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_init.c   |   10 +-
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |   18 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |    2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |    3 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |   15 +-
 .../gpu/drm/amd/display/dc/inc/hw/link_encoder.h   |    8 +
 drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h  |    4 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/optc.h       |    2 +-
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |    5 +-
 drivers/gpu/drm/amd/display/dc/inc/link.h          |    4 +
 .../amd/display/dc/link/accessories/link_dp_cts.c  |    4 +-
 .../drm/amd/display/dc/link/hwss/link_hwss_dio.c   |    4 +-
 .../link/hwss/link_hwss_dio_fixed_vs_pe_retimer.c  |    2 +-
 .../drm/amd/display/dc/link/hwss/link_hwss_dpia.c  |   61 +-
 .../drm/amd/display/dc/link/hwss/link_hwss_dpia.h  |    3 +
 .../gpu/drm/amd/display/dc/link/link_detection.c   |    3 +-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   43 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |    3 +-
 .../gpu/drm/amd/display/dc/link/link_validation.c  |  179 ++++
 .../gpu/drm/amd/display/dc/link/link_validation.h  |    5 +
 .../drm/amd/display/dc/link/protocols/link_ddc.c   |    2 +-
 .../display/dc/link/protocols/link_dp_capability.c |   15 +-
 .../dc/link/protocols/link_dp_irq_handler.c        |    8 +-
 .../amd/display/dc/link/protocols/link_dp_phy.c    |    2 +-
 .../display/dc/link/protocols/link_dp_training.c   |    4 +-
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c |  120 ++-
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h |   19 +
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c |  101 +-
 .../amd/display/dc/resource/dcn10/dcn10_resource.c |    8 +-
 .../amd/display/dc/resource/dcn10/dcn10_resource.h |    1 +
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |    3 +-
 .../display/dc/resource/dcn201/dcn201_resource.c   |    3 +-
 .../amd/display/dc/resource/dcn21/dcn21_resource.c |    1 +
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |    1 +
 .../display/dc/resource/dcn301/dcn301_resource.c   |   11 +-
 .../display/dc/resource/dcn302/dcn302_resource.c   |    1 +
 .../display/dc/resource/dcn303/dcn303_resource.c   |    1 +
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |    1 +
 .../display/dc/resource/dcn314/dcn314_resource.c   |    1 +
 .../display/dc/resource/dcn315/dcn315_resource.c   |    1 +
 .../display/dc/resource/dcn316/dcn316_resource.c   |    1 +
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |    1 +
 .../display/dc/resource/dcn321/dcn321_resource.c   |    1 +
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |   10 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.h |    1 +
 .../display/dc/resource/dcn351/dcn351_resource.c   |    3 +-
 .../display/dc/resource/dcn401/dcn401_resource.c   |   57 +-
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c        |   99 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   65 +-
 .../drm/amd/display/modules/power/power_helpers.c  |    9 +-
 .../drm/amd/display/modules/power/power_helpers.h  |    3 +-
 drivers/gpu/drm/amd/include/amd_shared.h           |    5 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |   14 +-
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_ppsmc.h   |    1 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |    3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |    2 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   12 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   12 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   54 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |    1 +
 167 files changed, 4869 insertions(+), 2043 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v10_0_cleaner_shader.h
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v10_3_0_cleaner_shader.asm
 create mode 100644 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx12.asm
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn3_soc_bb.h
