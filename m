Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E58D553543B
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 22:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AECC10E3C4;
	Thu, 26 May 2022 20:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2057.outbound.protection.outlook.com [40.107.101.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A142B10E210;
 Thu, 26 May 2022 20:06:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fw519HDbK8LfqOetQuWefmjMjJcui5uCAt8bFFVnCHWgjsc2oO5K5swNzInTcjLXt1PeJrwRLnPuVYrPoXUWcFrzwHKY40+levuz61oBy6YtWfrmLABt4ZnjtM+nkXZXrA7sB0MNRx4dswUxmQmr4NxiQpFlOrDLt/1L83C4AJ2g2QJVjtsOOqz7P+lpRfLHJ+dtXWITnkwE/R7NR4rqnPxiAbqpnb73PD+fyZK/khPvP/xSpxqXa5GJkqJ4DimG61+yHfGNxmthm/BrKKDMCLbIm1BJI02ESSY7TlTTX/UoXaOBO+K4Gf9lbpk+gx5pEJGNN8zdKCn49OfbGcx/wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDynp6KrkOuirR7B2gpif4/Y+8VG3aoiKa2LHv7Mgq4=;
 b=aJzcNGYray2TtMODRYTeZg/Mlx54Q8oVQXC2ZKOjNy4csxayWyHqsX/hA35tHNNaBcen2GqUPs66g4qrqHo55kTJ50C4+Mhr7oPLqJIEazE7E9FjCxyQ8M5DDnoZOodzSlbApQ07Iegl0IHaFkHWjIIiJoPeQbCDl2pBk0xHDOOlCWWXu/cWBcmaiCGc6aGCJaalGbQJdED7VuHCwQuhuzpYUQU1vuUiWeg+eglK9rQ4Krq6vBXvnOuTrlW+Rcf+Jr3Lee+EM6RM4GZHW0hcaTjXQR/Y5A3tDEhQt2WDanZ7C4Cbb1m2M2o9KfveiriY0K6v76M9r7ZAUlqCcCYQGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDynp6KrkOuirR7B2gpif4/Y+8VG3aoiKa2LHv7Mgq4=;
 b=R+BtRbsbETwIPkFfOp/q0XxvLFEvplDCs5kQtNTJyzel0frpfmjjAikAfw0XUwC2nHkC1zIrwqINVh2X6T6Ib05ilsYwBFpTkc7T0bFta03Aq9c/gU3Bo+JjSFxca9EWDlicvu8ipCNIqOB7kMfGHlEz3dkF3lXHGCmzXvujQIk=
Received: from DM5PR10CA0024.namprd10.prod.outlook.com (2603:10b6:4:2::34) by
 MW2PR12MB2490.namprd12.prod.outlook.com (2603:10b6:907:9::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.17; Thu, 26 May 2022 20:06:57 +0000
Received: from DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:2:cafe::e7) by DM5PR10CA0024.outlook.office365.com
 (2603:10b6:4:2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Thu, 26 May 2022 20:06:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT019.mail.protection.outlook.com (10.13.172.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Thu, 26 May 2022 20:06:57 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 26 May
 2022 15:06:56 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-5.19
Date: Thu, 26 May 2022 16:06:41 -0400
Message-ID: <20220526200641.64097-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 278db165-3db9-433e-eaff-08da3f534958
X-MS-TrafficTypeDiagnostic: MW2PR12MB2490:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB24904061E625BBEF10FD2DB7F7D99@MW2PR12MB2490.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nrfbSYyy5RmVUb16f8NN0wGAfTKCptfGVeqOAGVz4W4HtmGXgISBMNoOcZ8/Suu3VWCsaOP76J0t9hVJmFt8DR0tt0k1/FrH7wCaaGNuGChfQuNZexXHo7Tu1Uih5JkoMDgvl1LxBrLdvZDY5QZ5kRcyRmmYbW2p8zUXsOmhL5AzjfKQNLEXcGeX5EhA/hPv324cZbU33OxuZNHDBjCU/fMbwYs+mV1t86xguSVTor3a2l5dfbWOZAiVbgYK4j0f/UyoNxm8vGPrRZtpug6lK2YKes8Dwyq9chc7UkXThkzA52O9xmNlhzonOfM5pnB8/0Pli2UCpWrf8YwSW+AVCDqqW9qAna4cZzNnL57+t9+779E6WzdH4gGPFZ5z15AtW9u4AMsatCFe6bffqGetqMnn2p/Gfh+L62vEUMfyrITyv5yUK5zy7ydaQYiSyuQ1SkMItN4fUlb8m+MpGsdfZ0Y7NgoNfG4+/nf0pNTgzjcR1onwD0aemu0q0P4WIb0N01GPebpJvM7N4FMgJWOl+wTshWwPClIYHQvLm8u4v5pnbASddMtPeR5zRx7lu+z4+1PhmSVR1QvMChRB/F34tPjLvT/6p3BdfvcCT+66SqumCp4TZ04/NmM/OP5Y9Hb1euTS5tlZREX0BJ2iIjBdY06AeIhJDuSvAG7a/KsYoMzoBGD6xInflPawhP3d+6snZxTwiOfYeZvXt/9nyvVnwQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(70206006)(8676002)(36756003)(4326008)(70586007)(81166007)(36860700001)(356005)(40460700003)(86362001)(83380400001)(2906002)(7696005)(26005)(5660300002)(8936002)(110136005)(82310400005)(966005)(66574015)(6666004)(16526019)(508600001)(47076005)(426003)(336012)(1076003)(316002)(186003)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 20:06:57.0808 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 278db165-3db9-433e-eaff-08da3f534958
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2490
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

Fixes for 5.19. The size is largely due to updates to new IPs which
were added in this cycle.

The following changes since commit c4955d9cd2fc56c43e78c908dad4e2cac7cc9073:

  Merge tag 'drm-intel-next-fixes-2022-05-24' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2022-05-25 12:03:41 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.19-2022-05-26

for you to fetch changes up to 62e9bd20035b53ff6c679499c08546d96c6c60a7:

  drm/amdgpu: add beige goby PCI ID (2022-05-26 14:56:33 -0400)

----------------------------------------------------------------
amd-drm-next-5.19-2022-05-26:

amdgpu:
- Link training fixes
- DPIA fixes
- Misc code cleanups
- Aux fixes
- Hotplug fixes
- More FP clean up
- Misc GFX9/10 fixes
- Fix a possible memory leak in SMU shutdown
- SMU 13 updates
- RAS fixes
- TMZ fixes
- GC 11 updates
- SMU 11 metrics fixes
- Fix coverage blend mode for overlay plane
- Note DDR vs LPDDR memory
- Fuzz fix for CS IOCTL
- Add new PCI DID

amdkfd:
- Clean up hive setup
- Misc fixes

radeon:
- Fix a possible NULL pointer dereference

----------------------------------------------------------------
Alan Liu (1):
      drm/amd/display: Add HDMI_ACP_SEND register

Alex Deucher (3):
      drm/amdgpu/discovery: validate VCN and SDMA instances
      drm/amdgpu: differentiate between LP and non-LP DDR memory
      drm/amdgpu: add beige goby PCI ID

Alvin Lee (1):
      drm/amd/display: Clean up code in dc

Aric Cyr (1):
      drm/amd/display: 3.2.186

Bhawanpreet Lakha (1):
      drm/amd/display: Fic incorrect pipe being used for clk update

Candice Li (1):
      drm/amdgpu: Resolve pcie_bif RAS recovery bug

Christian König (1):
      drm/amdgpu: cleanup ctx implementation

Dan Carpenter (2):
      drm/amdgpu/pm: smu_v13_0_4: delete duplicate condition
      drm/amdgpu: Off by one in dm_dmub_outbox1_low_irq()

Dave Airlie (1):
      drm/amdgpu/cs: make commands with 0 chunks illegal behaviour.

David Galiffi (1):
      drm/amd/display: Check if modulo is 0 before dividing.

Derek Lai (1):
      drm/amd/display: Allow individual control of eDP hotplug support

Eric Huang (1):
      drm/amdkfd: port cwsr trap handler from dkms branch

Evan Quan (8):
      drm/amd/pm: enable more dpm features for SMU 13.0.0
      drm/amd/pm: skip dpm disablement on suspend for SMU 13.0.0
      drm/amd/pm: update SMU 13.0.0 driver_if header
      drm/amd/pm: correct the softpptable ids used for SMU 13.0.0
      drm/amd/pm: enable more dpm features for SMU 13.0.0
      drm/amd/pm: enable memory temp reading for SMU 13.0.0
      drm/amd/pm: correct the metrics version for SMU 11.0.11/12/13
      drm/amdgpu: suppress some compile warnings

Gong Yuanjun (2):
      drm/radeon: fix a possible null pointer dereference
      drm/amd/pm: fix a potential gpu_metrics_table memory leak

Haohui Mai (3):
      drm/amdgpu: Clean up of initializing doorbells for gfx_v9 and gfx_v10
      drm/amdgpu: Set CP_HQD_PQ_CONTROL.RPTR_BLOCK_SIZE correctly
      drm/amdgpu/gfx10: rework KIQ programming

Jasdeep Dhillon (1):
      drm/amd/display: Move FPU associated DCN30 code to DML folder

Jay Cornwall (1):
      drm/amdkfd: Add gfx11 trap handler

Jimmy Kizito (2):
      drm/amd/display: Update link training fallback behaviour.
      drm/amd/display: Query DPIA HPD status.

Jonathan Kim (1):
      drm/amdkfd: simplify cpu hive assignment

Julia Lawall (2):
      drm/amdgpu/gfx: fix typos in comments
      drm/amdkfd: fix typo in comment

Lijo Lazar (2):
      drm/amd/pm: Fix missing thermal throttler status
      drm/amd/pm: Return auto perf level, if unsupported

Michael Strauss (1):
      Revert "drm/amd/display: Refactor LTTPR cap retrieval"

Nicholas Kazlauskas (1):
      drm/amd/display: Check zero planes for OTG disable W/A on clock change

Paul Hsieh (1):
      drm/amd/display: clear request when release aux engine

Prike Liang (1):
      drm/amdgpu: clean up asd on the ta_firmware_header_v2_0

Stanley.Yang (1):
      drm/amdgpu: support ras on SRIOV

Sung Joon Kim (1):
      drm/amd/display: add Coverage blend mode for overlay plane

Sunil Khatri (3):
      drm/amdgpu: move amdgpu_gmc_tmz_set after ip_version populated
      drm/amdgpu: change code name to ip version for tmz set
      drm/amdgpu: add support of tmz for GC 10.3.7

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |    8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |   46 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h            |   11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   29 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   42 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |    4 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   48 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |    2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |    6 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   21 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   15 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |    1 +
 drivers/gpu/drm/amd/amdkfd/cwsr_trap_handler.h     | 2974 +++++++++++---------
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx10.asm |  394 ++-
 .../gpu/drm/amd/amdkfd/cwsr_trap_handler_gfx9.asm  |  244 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |    6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   22 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   19 +-
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c  |    2 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |    3 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |    3 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   15 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   24 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  248 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c |   19 +
 drivers/gpu/drm/amd/display/dc/core/dc_surface.c   |    2 +
 drivers/gpu/drm/amd/display/dc/dc.h                |    6 +-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |    2 -
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |    3 +-
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |    9 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   27 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   17 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |   10 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |  516 +---
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.h  |    5 +
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |    2 +
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |    2 +
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |    2 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |    2 +
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |    3 +-
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c   |  617 ++++
 .../gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h   |   67 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |    7 +
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |    3 +-
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dpia.h  |    5 +
 .../drm/amd/display/include/link_service_types.h   |    6 -
 .../amd/include/asic_reg/dce/dce_10_0_sh_mask.h    |    2 +
 .../amd/include/asic_reg/dce/dce_11_0_sh_mask.h    |    2 +
 .../amd/include/asic_reg/dce/dce_11_2_sh_mask.h    |    2 +
 .../amd/include/asic_reg/dce/dce_12_0_sh_mask.h    |    2 +
 .../drm/amd/include/asic_reg/dce/dce_8_0_sh_mask.h |    2 +
 .../drm/amd/include/asic_reg/dcn/dcn_1_0_sh_mask.h |    2 +
 .../amd/include/asic_reg/dcn/dcn_2_0_0_sh_mask.h   |    2 +
 .../amd/include/asic_reg/dcn/dcn_2_0_3_sh_mask.h   |    4 +-
 .../amd/include/asic_reg/dcn/dcn_2_1_0_sh_mask.h   |    2 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |    3 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |    1 +
 .../pm/swsmu/inc/pmfw_if/smu13_driver_if_v13_0_0.h |   22 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |    2 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   57 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |    1 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   47 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |    8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |   62 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |    3 +
 drivers/gpu/drm/radeon/radeon_connectors.c         |    4 +
 include/uapi/drm/amdgpu_drm.h                      |    2 +
 75 files changed, 3394 insertions(+), 2401 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h
