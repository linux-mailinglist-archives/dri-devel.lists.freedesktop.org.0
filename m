Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8F66E2B45
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 22:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286E010EE71;
	Fri, 14 Apr 2023 20:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835F210E243;
 Fri, 14 Apr 2023 20:46:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hcDHCkLw/9COBJ2NHuJsOAQM8atXTOeMnnEJOeCHkMIi41nIFAMfse4nk3RiZLpZGJJcmJztYqffM+fxGFgcHTe0uppIdhzoqbmRcYvslw8T4NyHZ95GF+B7GDlLmgyPoyuVW/E+zYaipLfvztovdej7ZX/zhSZ2N9e+Pe8uhlpaO9KUV4GDAIZshPTw0taraqF1WgDnWVUiZS3Be0sUGXFQDY9zwR+UmfmxxcDGF8S6YMIV9FOsOv0oDoAhQsEC3wW1QrDe2PxeUoxA5XPBARlU8FHMteiFD/cPGE+4NfAWJwh6Ov+JhTOwp90oBpCO7xNlyZHe3HJuKmyDaNQTZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z83cFDPpI8chy3CXP7prM9WKQwlq9NZahI0qQ/FZ6xg=;
 b=nqfFBGIydcpKKCETIZShDOZtT9VSNIUWTVJuPcjVfaMb/JIlSU+pEgtD0Fvt6q2QZJ5c0nQA9/G8brqINWcKSTFKyODVkknIzKlXJkffyN732wMpZPLwmGHPpY35EzZYBBoYssCwlkyvRsUQXX1K9OMZoGTWa+ThZ3WVPwV8qPRiCVAmbODJhDFpOOTg1IvZ/fbXO/S5gRCRz9JxWCf003uQPadvaG/inZy6J+Cbx4XkzWV3mYEm7a4ukHvymcQyuFe52GAb14JfNfJRnATEPkXxYCcurTrpnjEMBDgFkUjSODuynPnZt8m1/FcURHiKmk0Z26PpTr6xO2qOcj71Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z83cFDPpI8chy3CXP7prM9WKQwlq9NZahI0qQ/FZ6xg=;
 b=gPLCtkpVl3+IAjyg8x7v3aUnU+fYJsIECl6ox4FlW+jPQaFWvDRPiSjyu4LYyhTDjB2crLUAq3lhG8vs9/rEocvu2JM/We/7GoZj8rjTdXN0/MG1duiscpHUet6jEDQXQ/qmvX0wy9Tbok9PrXC92tAYkLojKcwc/oYohHsLRaI=
Received: from SJ0PR03CA0154.namprd03.prod.outlook.com (2603:10b6:a03:338::9)
 by IA1PR12MB8222.namprd12.prod.outlook.com (2603:10b6:208:3f2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Fri, 14 Apr
 2023 20:46:31 +0000
Received: from CO1PEPF00001A5D.namprd05.prod.outlook.com
 (2603:10b6:a03:338:cafe::22) by SJ0PR03CA0154.outlook.office365.com
 (2603:10b6:a03:338::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.36 via Frontend
 Transport; Fri, 14 Apr 2023 20:46:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF00001A5D.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.27 via Frontend Transport; Fri, 14 Apr 2023 20:46:30 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 14 Apr
 2023 15:46:29 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-next-6.4
Date: Fri, 14 Apr 2023 16:46:09 -0400
Message-ID: <20230414204609.7942-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00001A5D:EE_|IA1PR12MB8222:EE_
X-MS-Office365-Filtering-Correlation-Id: 85bfe623-2af0-4d5d-fe0d-08db3d29535a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j4FWyMaWIs/h4D/pQGVgBA+vGlIMUWe8DTrh7erEUCbfo5dliatOoJ0u3JR/Pql0e8NY+4wuic1sCqgmJGImB87wVQvVlruxSK2eYpf8ChfUmK4tPJlKsC74lsNt+qPLw/RkzdtvxXh1XQeI/y47+fWgJQb5exLIY0FF2xkwdmuKRRTRslqPEdJZ75ZI9lzX7fa+dZWJhAuDP1Cm/6T4H9sb3a1Cooiz5jZemcWofTUveKzE2rE2W0qYFOjrrFb8wY3ahSNjOTqbDhu6d0J+XU5vs8U1+X06ijlsZqXknRb8J+2Cehcky98MCItFxFboi8YKCfmLFI1QrhzPV/aknKMjiODGPBmQITh1X8cqBgjbu29PK2DnFS3QyLaxOM76Dj70iRX2c4EhtcNhF5R0JKkS81Dqcm7D6NaJxacZJPdQVF4o0NuP7bbt4nRNgcxjSqn+ZdJXmjXbojqtoTK9l5zGoe7wcgUw5/OHVuYmSgoVeCiFGdAlpyTFvzEuLGhu79mqeBglH51PCK8oxE2RG4fUv7pkV8/gN+1qxnrgsitaKQc67Tk8G17BOrRg44/DrdSQBMp8S48L62tBgwDUOcsNnrORM1FoCcHbXtMdTLFJpvhAYpoWVriegVMr3RGkAXY0HdAt6xJxl7uWM3Axejf67EnkrPPngeMk9OQvkYBxsl+Y+qwYEove0NZHHIjZYNxN64wO1LWkknD5FR0kngD9oRQk/skcUTcuaTGuFQ4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(2616005)(478600001)(47076005)(6666004)(110136005)(966005)(26005)(83380400001)(1076003)(7696005)(356005)(316002)(41300700001)(4326008)(82740400003)(186003)(426003)(336012)(16526019)(70206006)(70586007)(81166007)(36860700001)(5660300002)(30864003)(36756003)(2906002)(82310400005)(40460700003)(40480700001)(86362001)(8936002)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 20:46:30.2919 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85bfe623-2af0-4d5d-fe0d-08db3d29535a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00001A5D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8222
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

Last few changes for 6.4.

The following changes since commit 55bf14961db9da61220e6f04bc9919c94b1a6585:

  Merge tag 'mediatek-drm-next-6.4' of https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux into drm-next (2023-04-11 12:28:10 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.4-2023-04-14

for you to fetch changes up to 541372bb62f289f4402cf55be51fb9cec7373627:

  drm/amdgpu: add some basic elements for multiple XCD case (2023-04-14 13:47:49 -0400)

----------------------------------------------------------------
amd-drm-next-6.4-2023-04-14:

amdgpu:
- S4 fixes for APUs
- GFX11 fixes
- Misc code cleanups
- DCN 3.2 fixes
- DCN 3.1.4 fixes
- FPO/FAMS work to improve display power savings
- DP fixes
- UMC 8.10 code cleanup
- SDMA v4 fix
- GPU clock counter fixes
- SMU 13 fixes
- Sdma v6 invalidation fix for preemption
- RAS fixes
- S0ix fix
- GC 9.4.3 updates

amdkfd:
- Fix user pointers with IOMMU
- Fix coherency flag handling

----------------------------------------------------------------
Aaron Liu (1):
      drm/amdgpu: skip kfd-iommu suspend/resume for S0ix

Alex Deucher (1):
      drm/amdgpu: simplify amdgpu_ras_eeprom.c

Alvin Lee (3):
      drm/amd/display: Clear FAMS flag if FAMS doesn't reduce vlevel
      drm/amd/display: Add FPO + VActive support
      drm/amd/display: On clock init, maintain DISPCLK freq

Amber Lin (1):
      drm/amdkfd: Enable HW_UPDATE_RPTR on GC 9.4.3

Anthony Koo (1):
      drm/amd/display: [FW Promotion] Release 0.0.161.0

Aric Cyr (1):
      drm/amd/display: 3.2.230

Arvind Yadav (1):
      drm/amdgpu: add new parameters in v11_struct

Charlene Liu (1):
      drm/amd/display: add dscclk instance offset check

Evan Quan (1):
      drm/amd/pm: correct the pcie link state check for SMU13

Graham Sider (2):
      drm/amdgpu: Enable GFX11 SDMA context empty interrupt
      drm/amdkfd: Add gfx_target_version for GC 9.4.3

Guilherme G. Piccoli (1):
      drm/amd/pm: Fix incorrect comment about Vangogh power cap support

Hamza Mahfooz (1):
      drm/amd/display: prep work for root clock optimization enablement for DCN314

Hawking Zhang (5):
      drm/amdgpu: drop temp programming for pagefault handling
      drm/amdgpu: add gc v9_4_3 rlc_funcs implementation
      drm/amdgpu: switch to v9_4_3 gfx_funcs callbacks for GC 9.4.3
      drm/amdgpu: add common early init support for GC 9.4.3
      drm/amdgpu: add common ip block for GC 9.4.3

Horatio Zhang (2):
      drm/amd/pm: correct SMU13.0.7 pstate profiling clock settings
      drm/amd/pm: correct SMU13.0.7 max shader clock reporting

Igor Artemiev (1):
      drm/amd/display: Fix potential null dereference

Jack Xiao (1):
      drm/amd/amdgpu: introduce gc_*_mes_2.bin v2

Jane Jian (1):
      Revert "drm/amdgpu: enable ras for mp0 v13_0_10 on SRIOV"

Jesse Zhang (2):
      drm/amdgpu: switch to golden tsc registers for raven/raven2
      drm/amdgpu: change the reference clock for raven/raven2

Le Ma (2):
      drm/amdgpu: move vmhub out of amdgpu_ring_funcs (v4)
      drm/amdgpu: add some basic elements for multiple XCD case

Li Ma (1):
      drm/amdgpu: reserve the old gc_11_0_*_mes.bin

Lijo Lazar (1):
      drm/amdgpu: Fix warnings

Mario Limonciello (1):
      drm/amd: Fix an out of bounds error in BIOS parser

Michael Strauss (1):
      drm/amd/display: Improve robustness of FIXED_VS link training at DP1 rates

Mukul Joshi (2):
      drm/amdgpu: Enable IH retry CAM on GFX9
      drm/amdgpu: Rework retry fault removal

Paul Hsieh (1):
      drm/amd/display: Correct DML calculation to follow HW SPEC

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu: use sdma_v6 single packet invalidation

Shane Xiao (3):
      drm/amdgpu: Add userptr bo support for mGPUs when iommu is on
      amd/amdgpu: Inherit coherence flags base on original BO flags
      drm/amdgpu: DROP redundant drm_prime_sg_to_dma_addr_array

Shashank Sharma (2):
      drm/amdgpu: rename num_doorbells
      drm/amdgpu: include protection for doorbell.h

Sreekant Somasekharan (1):
      drm/amdkfd: Check PCIe atomics support on GFX11 to set CP_HQD_HQ_STATUS0[29]

Srinivasan Shanmugam (5):
      drm/amd/amdgpu: Drop the hang limit parameter
      drm/amd/display : Log DP link training downspread info
      drm/amd/display: Add logging for DP link traning Test Pattern Seqeunces
      drm/amd/display: Add logging when setting DP sink power state fails
      drm/amd/display: Add logging when DP link training Clock recovery is Successful

Stanley.Yang (2):
      drm/amdgpu: fix unexpected block id
      drm/amdgpu: correct ras enabled flag

Tim Huang (1):
      drm/amdgpu: allow more APUs to do mode2 reset when go to S4

Tom Rix (6):
      drm/amd/display: remove unused average_render_time_in_us and i variables
      drm/amd/display: set variable dcn3_14_soc storage-class-specifier to static
      drm/amd/display: set variables aperture_default_system and context0_default_system storage-class-specifier to static
      drm/amd/display: set variables dml*_funcs storage-class-specifier to static
      drm/amd/display: remove unused matching_stream_ptrs variable
      drm/amd/pm: remove unused num_of_active_display variable

Tong Liu01 (1):
      drm/amdgpu: refine get gpu clock counter method

YiPeng Chai (3):
      drm/amdgpu: optimize redundant code in umc_v8_10
      drm/amdgpu: optimize redundant code in umc_v6_7
      drm/amdgpu: add gfx v11_0_3 fed irq handling for sriov

Yifan Zha (2):
      drm/amdgpu: Add MES KIQ dequeue in MES hw fini
      drm/amdgpu: Add MES KIQ clear to tell RLC that KIQ is dequeued

Zhikai Zhai (1):
      drm/amd/display: add scaler control for dcn32

lyndonli (1):
      drm/amdgpu: Fix sdma v4 sw fini error

 drivers/gpu/drm/amd/amdgpu/Makefile                |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  42 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  34 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h       |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   8 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |  17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  40 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |  72 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h          |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |  31 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |   7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   5 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  22 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0_3.c           |  14 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  47 ++-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            | 430 +++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.h            |  30 ++
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0.c           |  22 --
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  59 ++-
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |   4 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  36 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             | 101 +----
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |   4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |   2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |  53 ++-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  12 +-
 drivers/gpu/drm/amd/amdgpu/ta_ras_if.h             |   2 +
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              | 161 ++++----
 drivers/gpu/drm/amd/amdgpu/umc_v8_10.c             | 197 ++++------
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |   8 +-
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c              |   4 +-
 drivers/gpu/drm/amd/amdgpu/vcn_sw_ring.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |   8 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |   8 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |  84 +---
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |   5 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   3 +-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c             |  55 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  13 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |  11 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  10 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   3 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |   7 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |  18 +
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |   5 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |   6 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  20 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h  |   8 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c  |  18 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   2 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c    |  28 +-
 .../gpu/drm/amd/display/dc/dcn314/dcn314_dccg.h    |  10 +
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |  26 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   3 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |   4 +
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  | 156 ++++++++
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   3 +
 .../amd/display/dc/dml/dcn30/display_mode_vba_30.c |   2 +-
 .../amd/display/dc/dml/dcn31/display_mode_vba_31.c |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |   2 +-
 .../display/dc/dml/dcn314/display_mode_vba_314.c   |   2 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |  85 +++-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.h   |   4 +
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |   2 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.c  |  24 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |   3 +
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   8 +-
 .../display/dc/link/protocols/link_dp_capability.c |   3 +
 .../display/dc/link/protocols/link_dp_training.c   |  28 +-
 .../dc/link/protocols/link_dp_training_8b_10b.c    |   4 +-
 .../dc/link/protocols/link_dp_training_dpia.c      |   2 +
 .../link_dp_training_fixed_vs_pe_retimer.c         | 378 +++++++++++++++++-
 .../link_dp_training_fixed_vs_pe_retimer.h         |   5 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  28 +-
 .../drm/amd/display/modules/freesync/freesync.c    |  14 -
 .../amd/include/asic_reg/oss/osssys_4_2_0_offset.h |   6 +
 .../include/asic_reg/oss/osssys_4_2_0_sh_mask.h    |  11 +
 drivers/gpu/drm/amd/include/v11_structs.h          |  16 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   4 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   7 -
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h       |   6 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |   4 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  87 ++++-
 107 files changed, 2118 insertions(+), 730 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.h
