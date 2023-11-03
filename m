Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F567E0772
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 18:32:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D387A10E185;
	Fri,  3 Nov 2023 17:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818C610E185;
 Fri,  3 Nov 2023 17:32:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlMkzcF5wVDrmg2fFRFxLeW06BOVpZmpOHU4iwOovlV8fTbNcTjVnnK9N/6LI0FzaCpJOJ+GHfuvxWfcJYq2Bpdciwg2LpcvPZ2N8abdH1bDf5BsxlHUWGib2Y4+IcfRFHadgoJ8mHViwiTQYcCGa8i4w2NJ2gw69EeVCnLGkBIjy910/WM/waU2xU27h4pvvc04rqxsCjlV1u7pjs97c/bRLCl6KJ+Fs3SJUzvkvdB/Iqp+X4pd+9KSiRcek3ssMZXKT2qaf8oKHm5mnauVgReVbaWU/vzfUSzPOUkm0ucwJf5UUzCjVkLTSnJhFfHJQld+8w4OsIBHAoCvMvsaHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmtEwz6IWGf0JoWTJhMscW5B+/TK77ADudWlMv4LcL8=;
 b=JxHesz7W+0K5Rn5EbPpYLq9ADoatdi0w4VLUaISJFmt/m2y2i4uXIIg5J7KD29RTFLtPbWzYqtusDkENMLpOt+Xt2qfOoQ56caWerW5xK6Egi1nNM4cue1tzBxQvZyMtfQ/2nCfiijYeRbBz80eooPj7VUQvXmL55An9np60XE3r7caRkCICGQBKQMAdXZ2yVBJMf41iM06cxXPmXN0WxcRTNuYxy5NTPQ71DkUqTVqR4Ek3ePKVHSY/nvHIh48W5dJlQIWl74YD65XRLD+Ak2J/DryEUK1IgusV33HvcqUWd7sEF0ouIOc8kJuQarg7pZf0CTWXtrESQZr0OIubmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmtEwz6IWGf0JoWTJhMscW5B+/TK77ADudWlMv4LcL8=;
 b=3uyby+yUWE22Plu3jE6jLNsm/nCLChPYSJ8WRykjETnGIzD4cklzU/Cl1ZVeCzwiyCfdEbJtiN8BDoq9Y1uUHW4Lmw7PlM+ENELnOWVCFKvLMqEvaeERTOgeYaahFMCBRlAZAf2H8xzQIhIUVpvVdoXZYLOJCXp8L2dYMpU3aTA=
Received: from BLAPR03CA0004.namprd03.prod.outlook.com (2603:10b6:208:32b::9)
 by BY5PR12MB4177.namprd12.prod.outlook.com (2603:10b6:a03:201::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 17:32:41 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:208:32b:cafe::d5) by BLAPR03CA0004.outlook.office365.com
 (2603:10b6:208:32b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.22 via Frontend
 Transport; Fri, 3 Nov 2023 17:32:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Fri, 3 Nov 2023 17:32:40 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 3 Nov
 2023 12:32:39 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-6.7
Date: Fri, 3 Nov 2023 13:32:02 -0400
Message-ID: <20231103173203.4912-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|BY5PR12MB4177:EE_
X-MS-Office365-Filtering-Correlation-Id: a871c666-9f3c-4aaa-8953-08dbdc92e142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HjO/yB2l75fp2RuoIcxq4VDRM66oTQix+WHysnHDjUOR74dV/2j6vwXUT3MNYUydXjHLVMaQOdrVGpjQNfWvCw9uB4u4i+DUMuDL8dQe2AoUz9GP2JsDknutmh94rhHn+QoXLfifeJuFIzNVjqnBOwin3lyLH6QdxPoOvek7eFkvHecIDglDhEB1Hyu49xIVA5kXERZ7K0PbbBoWqquhkTz/Ycm2eYv7Kwdj1H3Ry8yITlC8Sc/iOz5WNyciJmm8uYIUB58yLGlGU2q9avA1PqH1LpWZe1vIbG5Sea2z+YCY73f9CcvVh3qycR093jBeXegmgFPeHTqlUXntWVNhkR5jPbxvJZXmR2mvfpdJDkM3WTxyVBMhBkngtoJCr2mdjx/761sM5/izFvVHl+roY/FjrzL85Blxjr/kOO1GstbHARoIDQ6zK1+Z4SI6NqlXXRXLki8p8lCYX8aF2FQc4jBtCfJZdvk7kPS27bkcuBCK25H07VlGjK7lLEkG6xIpr2YXrf0wOTJiD9J55Kk/Huq97sZKhO8fP6F+Vz7oF4KhcviWdXfuPGZ+NXPox1Cl91i0bZFc1WvqX+vMaSKosIgXoZ61335m7+Ln+3PX6kaA9IcLsz3k1VrzU5s/UA0K//weWDYhBYOcqq9yauz19vVu2+tLYFaOglcraDX/MZwqBdUMuO/ONgqm/Tb1vswlpisEPY/AEwN8CTHPWqklnWRdf7772TmmZrbREAqq1MUyvfwtn5ev1DhS8RNrNvfD3Xu26QMolaLrSb98S7OKSI5Z+pPnFk43uwB1Veu2RAHyhXzhCUQihZMgkWryN5PFmFAiTEVu+G3aR9Kxty/z4w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(396003)(136003)(346002)(230922051799003)(230173577357003)(230273577357003)(64100799003)(186009)(451199024)(82310400011)(1800799009)(46966006)(40470700004)(36840700001)(86362001)(40460700003)(41300700001)(8676002)(8936002)(4326008)(40480700001)(5660300002)(36756003)(2906002)(7696005)(316002)(336012)(426003)(1076003)(2616005)(16526019)(4001150100001)(36860700001)(47076005)(83380400001)(6666004)(26005)(81166007)(356005)(82740400003)(70586007)(110136005)(70206006)(478600001)(966005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 17:32:40.4689 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a871c666-9f3c-4aaa-8953-08dbdc92e142
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4177
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

Hi Dave, Sima,

Fixes for 6.7.

The following changes since commit 631808095a82e6b6f8410a95f8b12b8d0d38b161:

  Merge tag 'amd-drm-next-6.7-2023-10-27' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2023-10-31 12:37:19 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.7-2023-11-03

for you to fetch changes up to 6d5e0032a92df3a030cd47d91905310591466687:

  drm/amd/display: Enable fast update on blendTF change (2023-11-03 12:18:33 -0400)

----------------------------------------------------------------
amd-drm-next-6.7-2023-11-03:

amdgpu:
- Fix RAS support check
- RAS fixes
- MES fixes
- SMU13 fixes
- Contiguous memory allocation fix
- BACO fixes
- GPU reset fixes
- Min power limit fixes
- GFX11 fixes
- USB4/TB hotplug fixes
- ARM regression fix
- GFX9.4.3 fixes
- KASAN/KCSAN stack size check fixes
- SR-IOV fixes
- SMU14 fixes
- PSP13 fixes
- Display blend fixes
- Flexible array size fixes

amdkfd:
- GPUVM fix

radeon:
- Flexible array size fixes

----------------------------------------------------------------
Alex Deucher (7):
      drm/amdgpu/gfx10,11: use memcpy_to/fromio for MQDs
      drm/amdgpu: don't use ATRM for external devices
      drm/amdgpu: don't use pci_is_thunderbolt_attached()
      drm/amd: Fix UBSAN array-index-out-of-bounds for Powerplay headers
      drm/amdgpu: add a retry for IP discovery init
      drm/amdgpu/smu13: drop compute workload workaround
      drm/amdgpu: don't put MQDs in VRAM on ARM | ARM64

Arunpravin Paneer Selvam (1):
      drm/amdgpu: Fix the vram base start address

Candice Li (1):
      drm/amdgpu: Drop deferred error in uncorrectable error check

Felix Kuehling (2):
      drm/amdkfd: Improve amdgpu_vm_handle_moved
      drm/amdgpu: Attach eviction fence on alloc

Hawking Zhang (3):
      drm/amdgpu: Add C2PMSG_109/126 reg field shift/masks
      drm/amdgpu: Add psp v13 function to query boot status
      drm/amdgpu: Query and report boot status

Ilya Bakoulin (2):
      drm/amd/display: Fix blend LUT programming
      drm/amd/display: Enable fast update on blendTF change

José Pekkarinen (1):
      drm/radeon: replace 1-element arrays with flexible-array members

Kenneth Feng (1):
      drm/amd/pm: fix the high voltage and temperature issue

Li Ma (2):
      drm/amd/swsmu: update smu v14_0_0 driver if and metrics table
      drm/amd/swsmu: remove fw version check in sw_init.

Lijo Lazar (1):
      drm/amd/pm: Fix warnings

Lin.Cao (1):
      drm/amdgpu doorbell range should be set when gpu recovery

Ma Jun (4):
      drm/amd/pm: Fix error of MACO flag setting code
      drm/amd/pm: Return 0 as default min power limit for legacy asics
      drm/amd/pm: only check sriov vf flag once when creating hwmon sysfs
      drm/amdgpu: Optimize the asic type fix code

Mukul Joshi (2):
      drm/amdkfd: Populate cache info for GFX 9.4.3
      drm/amdkfd: Update cache info for GFX 9.4.3

Nathan Chancellor (1):
      drm/amd/display: Increase frame warning limit with KASAN or KCSAN in dml2

Perry Yuan (1):
      drm/amdgpu: ungate power gating when system suspend

Sung Joon Kim (1):
      drm/amd/display: Program plane color setting correctly

Tao Zhou (4):
      drm/amdgpu: check RAS supported first in ras_reset_error_count
      drm/amdgpu: set XGMI IP version manually for v6_4
      drm/amdgpu: use mode-2 reset for RAS poison consumption
      drm/amdgpu: check recovery status of xgmi hive in ras_reset_error_count

Tim Huang (1):
      drm/amdgpu: fix GRBM read timeout when do mes_self_test

Tong Liu01 (1):
      drm/amdgpu: add unmap latency when gfx11 set kiq resources

Wayne Lin (1):
      drm/amd/display: Avoid NULL dereference of timing generator

Yang Wang (1):
      drm/amdgpu: remove unused macro HW_REV

Yifan Zhang (1):
      drm/amdgpu: remove amdgpu_mes_self_test in gpu recover

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  79 ++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  38 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  26 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  35 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  16 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  15 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h            |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  15 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  28 ++-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  13 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |   5 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |  78 +++++++
 drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |   3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |  66 +++++-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  18 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   1 -
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c   |   3 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.h  |   5 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c   |   3 +
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hubp.c  | 137 ++++++++++-
 drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hubp.h  |  14 ++
 drivers/gpu/drm/amd/display/dc/dml2/Makefile       |   4 +
 .../amd/include/asic_reg/mp/mp_13_0_2_sh_mask.h    |  28 +++
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |  30 +--
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |  27 +--
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |   3 +
 .../gpu/drm/amd/pm/powerplay/hwmgr/pptable_v1_0.h  |   4 +-
 .../drm/amd/pm/powerplay/hwmgr/vega10_pptable.h    |  24 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  33 ++-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   1 +
 .../pm/swsmu/inc/pmfw_if/smu14_driver_if_v14_0_0.h | 120 +++-------
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |   2 +
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  17 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |  13 ++
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  58 ++---
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   2 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  27 ++-
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |   4 +-
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   | 260 ++++-----------------
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   3 +
 drivers/gpu/drm/radeon/atombios.h                  |  42 ++--
 include/drm/amd_asic_type.h                        |   5 +
 53 files changed, 853 insertions(+), 527 deletions(-)
