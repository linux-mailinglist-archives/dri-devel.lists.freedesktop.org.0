Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDD779F25E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 21:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05A810E0F5;
	Wed, 13 Sep 2023 19:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1098710E4E1;
 Wed, 13 Sep 2023 19:50:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Svx2Tlf8mNIScEcIHMiZCBzzlJQEFby8+voD2IyO2SokpCnoeFQlBFKiBPjiCaxfWxzWIwYLLfEy1Q5XTiL5bxJj4JDnBs8B3U6Yg063DNd8BLh1Ny7eMBfAywRZsyIX1LjEe3FSJkpdP2ut/0nQeImCL/ZfnCXc75Bi/1He87BK5tXgxjyXHEI/IQgP7/+NUkWDAFwja6dk+VvrbBVp1qqI5Wa0xxAg2ciCx1/hl5zx9h+uCwoWW3W7qWh2bTFQfxe5NV5R2WPaQCf6weostXHxVahWedcRNDrUy0z53ycI7VfZe3zazlCkuvsoWxVN/XiQQptayKaZl5ODSDVVOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+DGRII6YVBbv2mpNKBdV9l8NFhXGO+7Edb7H2akio4=;
 b=TkqEqJjfN1IO5yAgOTq0jrM1s+YiI2bgUGIrHw9FAQoutITAmv4WHBPFvkOFgo/vN07BwXSHGevRuFPs1n28t6hOVVqeffmZV+6xX9f44pZvZbghb1gdJX19VYZ01Zu6osGF0TEBwOXBaTwP3/tk7j+dU9jMCo3NVpNAz64HD1utoAbRoiknUs2TBkoptiUQBtSJ4e6GHui0zhEe+TCFmSWIrw3coyCQ7RrDNLlISQsZh1sHFYywk9N+e4JwOCKJmr3Td/eKGP4FqiQ5tHT/ebTikxTPyODtC44rF2thLrT7tmbalToPQWoaC8PIvWy3FmktzGSYB1ikAF2Y3QPexA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+DGRII6YVBbv2mpNKBdV9l8NFhXGO+7Edb7H2akio4=;
 b=Id3kvQMY4iZTLQS+ZLfsnyUTRREEiaJ7a1+nQKWf+rXe+nQQs5Ur9+Qcm2BRUqAk9VDGiT+DX/xfRTMzuFb6yBQpab8xPSUN65JHe35GgucKTf8gv6bisqMxDBX94Jmls4ei16WYn4l0IpBuk03MF1mYKcLSk+d+r1Fdl8G5LHw=
Received: from MW4P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::28)
 by BL0PR12MB4850.namprd12.prod.outlook.com (2603:10b6:208:1c5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Wed, 13 Sep
 2023 19:50:52 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:303:115:cafe::f9) by MW4P220CA0023.outlook.office365.com
 (2603:10b6:303:115::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19 via Frontend
 Transport; Wed, 13 Sep 2023 19:50:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Wed, 13 Sep 2023 19:50:52 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 13 Sep
 2023 14:50:50 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.6
Date: Wed, 13 Sep 2023 15:50:09 -0400
Message-ID: <20230913195009.7714-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|BL0PR12MB4850:EE_
X-MS-Office365-Filtering-Correlation-Id: c3bd65bd-1776-4f8e-a1bc-08dbb492bca4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b40Yq48+wFEyeBXFavnVZRLq8HVFJzA2MY0OOTKk3HZL7sV8XP2MGE7rz3n/SwrMKuDnrRI4NEWjAh0oYRK1N97A8PRcCWzwcOzKc4m/cJxiKGX0isUi7iLN4L9rYBbrEnijvesRm8DTSkmzdxX75hshfpSEKqrml1Kl/MEDlDz94qoUdmfQXhv+NbYMHrTD6sg3PEDDvYsJnF/gw0L29K0+xTOiDa0QowkIv4QhOorItK4sH5Zq6UHBVXjWGyedbsaTXcVjDUw6SWyvs4tZtbxnh02jGVNB/BXHIe0TuQF3pBzpNefmlcdmZc/vXZwwF8n3B9lovus5JI98TCgBClh3g57IdQbFEz593vtpi+F8Ht1eta2SpCR00rvqL4+jGlARA+hmZStOkIXAFAncgORr4a8ICD/8SoVZ9WXRSTv3wp8RFG7ebBIBurPCrFdg0EVNzUMD0/nk7j6PmH8a4Q1F88mrH0Ial+dkfDAjo/WaJpfGMkl2JwXpPU/5itLDhCWwjK8lWIZckXx6Z+MIX5WJtw7mx+rDTJehQFeG0iqERykoCqVeQPaHk9KxENX7YRFn8VjzCPOtnxNVQwBG1fbOyy7CAVj88fCFVh0xy4wOkpV+iJkEQ0LeTJBosYO0hxfu553H6GOCTzpy6pP3kUf4zhR+SdufYdq+69XNGJVgi4opEY96xoDwLHa5o5qyq7kI4Tf1aP7msog4gPT854/rHA+epbnI+lJyKp+gjDuGrBpNuCD4Cyuwoo4r6V/i
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(396003)(136003)(376002)(82310400011)(186009)(1800799009)(451199024)(36840700001)(46966006)(40470700004)(40460700003)(47076005)(36860700001)(2906002)(36756003)(82740400003)(86362001)(40480700001)(356005)(70586007)(70206006)(110136005)(81166007)(316002)(41300700001)(16526019)(336012)(26005)(2616005)(1076003)(426003)(966005)(7696005)(6666004)(478600001)(4326008)(8936002)(8676002)(83380400001)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 19:50:52.4469 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3bd65bd-1776-4f8e-a1bc-08dbb492bca4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4850
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Fixes for 6.6.

The following changes since commit afaf2b38025ab327c85e218f36d1819e777d4d45:

  Merge tag 'drm-misc-next-fixes-2023-09-11' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2023-09-11 16:23:42 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.6-2023-09-13

for you to fetch changes up to edcfe22985d09ee8e2346c9217f5a52ab150099f:

  drm/amdkfd: Insert missing TLB flush on GFX10 and later (2023-09-12 17:45:40 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.6-2023-09-13:

amdgpu:
- GC 9.4.3 fixes
- Fix white screen issues with S/G display on system with >= 64G of ram
- Replay fixes
- SMU 13.0.6 fixes
- AUX backlight fix
- NBIO 4.3 SR-IOV fixes for HDP
- RAS fixes
- DP MST resume fix
- Fix segfault on systems with no vbios
- DPIA fixes

amdkfd:
- CWSR grace period fix
- Unaligned doorbell fix
- CRIU fix for GFX11
- Add missing TLB flush on gfx10 and newer

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu/soc21: don't remap HDP registers for SR-IOV
      drm/amdgpu/nbio4.3: set proper rmmio_remap.reg_offset for SR-IOV

Bhawanpreet Lakha (1):
      drm/amd/display: Add dirty rect support for Replay

Dan Carpenter (1):
      drm/amdgpu: fix retry loop test

David Francis (2):
      drm/amdkfd: Checkpoint and restore queues on GFX11
      drm/amdgpu: Handle null atom context in VBIOS info ioctl

Hamza Mahfooz (1):
      Revert "drm/amd: Disable S/G for APUs when 64GB or more host memory"

Harish Kasiviswanathan (1):
      drm/amdkfd: Insert missing TLB flush on GFX10 and later

Hawking Zhang (1):
      drm/amdgpu: fallback to old RAS error message for aqua_vanjaram

Mukul Joshi (5):
      drm/amdkfd: Fix reg offset for setting CWSR grace period
      drm/amdkfd: Fix unaligned 64-bit doorbell warning
      drm/amdgpu: Store CU info from all XCCs for GFX v9.4.3
      drm/amdkfd: Update cache info reporting for GFX v9.4.3
      drm/amdkfd: Update CU masking for GFX 9.4.3

Mustapha Ghaddar (2):
      drm/amd/display: Add DPIA Link Encoder Assignment Fix
      drm/amd/display: Fix 2nd DPIA encoder Assignment

Randy Dunlap (1):
      drm/amd/display: fix replay_mode kernel-doc warning

Swapnil Patel (1):
      drm/amd/display: Don't check registers, if using AUX BL control

Wayne Lin (1):
      drm/amd/display: Adjust the MST resume flow

Yifan Zhang (1):
      drm/amd/display: fix the white screen issue when >= 64GB DRAM

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h  |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  26 -----
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  19 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  76 ++++++--------
 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c             |   3 +
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.h              |   4 +
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c          |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |  34 ++++--
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h       |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c   |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |  43 +++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |  46 ++++++---
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c    |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  77 ++++++++------
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |   2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 115 +++++++++++++++++----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   2 +-
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |  35 +++++--
 drivers/gpu/drm/amd/display/dc/dc.h                |   1 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   4 +-
 .../drm/amd/display/dc/dcn314/dcn314_resource.c    |  23 +++++
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   1 +
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |   4 +
 drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |   9 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   2 +-
 44 files changed, 385 insertions(+), 206 deletions(-)
